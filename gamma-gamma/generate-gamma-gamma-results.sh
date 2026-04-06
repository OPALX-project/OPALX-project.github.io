#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
CAIN_DIR_DEFAULT="${HOME}/git/cain"
CAIN_DIR="${CAIN_DIR_DEFAULT}"
OPALX_BUILD_DIR=""
OPALX_SOURCE_DIR=""
CAIN_BIN=""
SKIP_BUILD=0
SKIP_TESTS=0

usage() {
  cat <<'EOF'
Usage:
  ./generate-gamma-gamma-results.sh --opalx-build /path/to/opalx-laser/build_openmp

Options:
  --opalx-build DIR   OPALX build directory
  --opalx-source DIR  OPALX source checkout; inferred from CMakeCache if omitted
  --cain-dir DIR      Shared CAIN workspace; defaults to ~/git/cain
  --cain-bin PATH     CAIN executable; defaults to ~/git/cain/CAIN-build/cain
  --skip-build        Reuse existing OPALX targets without rebuilding
  --skip-tests        Regenerate benchmark data without rerunning OPALX test executables
  -h, --help          Show this help message
EOF
}

require_file() {
  local path=$1
  local label=$2
  if [[ ! -f "${path}" ]]; then
    echo "error: ${label} not found at ${path}" >&2
    exit 1
  fi
}

infer_opalx_source_dir() {
  if [[ -n "${OPALX_SOURCE_DIR}" ]]; then
    return
  fi
  local cache="${OPALX_BUILD_DIR}/CMakeCache.txt"
  if [[ -f "${cache}" ]]; then
    OPALX_SOURCE_DIR=$(awk -F= '/^CMAKE_HOME_DIRECTORY:INTERNAL=/{print $2}' "${cache}")
  fi
  if [[ -z "${OPALX_SOURCE_DIR}" ]]; then
    echo "error: unable to infer OPALX source directory from ${OPALX_BUILD_DIR}" >&2
    exit 1
  fi
}

main() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --opalx-build) OPALX_BUILD_DIR=$2; shift 2 ;;
      --opalx-source) OPALX_SOURCE_DIR=$2; shift 2 ;;
      --cain-dir) CAIN_DIR=$2; shift 2 ;;
      --cain-bin) CAIN_BIN=$2; shift 2 ;;
      --skip-build) SKIP_BUILD=1; shift ;;
      --skip-tests) SKIP_TESTS=1; shift ;;
      -h|--help) usage; exit 0 ;;
      *) echo "error: unknown option: $1" >&2; usage >&2; exit 1 ;;
    esac
  done

  if [[ -z "${OPALX_BUILD_DIR}" ]]; then
    echo "error: pass --opalx-build" >&2
    usage >&2
    exit 1
  fi

  infer_opalx_source_dir

  if [[ -z "${CAIN_BIN}" ]]; then
    CAIN_BIN="${CAIN_DIR}/CAIN-build/cain"
  fi

  require_file "${CAIN_BIN}" "CAIN executable"
  require_file "${CAIN_DIR}/generate-linear-compton-results.sh" "linear-Compton workflow"
  require_file "${CAIN_DIR}/generate-linear-breit-wheeler-results.sh" "Breit-Wheeler workflow"

  if [[ "${SKIP_BUILD}" -eq 0 ]]; then
    echo "[1/6] Building OPALX gamma-gamma benchmark targets"
    cmake --build "${OPALX_BUILD_DIR}"       --target TestLinearCompton TestLinearComptonSpectrum LinearComptonSpectrumBenchmark                TestLinearBreitWheeler TestLinearBreitWheelerSpectrum LinearBreitWheelerBenchmark       -j4
  fi

  if [[ "${SKIP_TESTS}" -eq 0 ]]; then
    echo "[2/6] Running OPALX inverse-Compton tests"
    "${OPALX_BUILD_DIR}/unit_tests/Physics/TestLinearCompton"
    "${OPALX_BUILD_DIR}/unit_tests/Physics/TestLinearComptonSpectrum"

    echo "[3/6] Running OPALX Breit-Wheeler tests"
    "${OPALX_BUILD_DIR}/unit_tests/Physics/TestLinearBreitWheeler"
    "${OPALX_BUILD_DIR}/unit_tests/Physics/TestLinearBreitWheelerSpectrum"
  fi

  echo "[4/6] Regenerating linear-Compton benchmark data and figures"
  "${CAIN_DIR}/generate-linear-compton-results.sh"     --opalx-build "${OPALX_BUILD_DIR}"     --cain-bin "${CAIN_BIN}"     --cain-deck-dir "${CAIN_DIR}"

  echo "[5/6] Regenerating Breit-Wheeler benchmark data and figures"
  "${CAIN_DIR}/generate-linear-breit-wheeler-results.sh"     --opalx-root "${OPALX_SOURCE_DIR}"     --opalx-build "${OPALX_BUILD_DIR}"     --cain-bin "${CAIN_BIN}"

  echo "[6/6] Rendering gamma-gamma note pages"
  asciidoctor -o /tmp/gamma-gamma-index.html "${SCRIPT_DIR}/index.adoc"
  asciidoctor -o /tmp/linear-compton-benchmark.html "${SCRIPT_DIR}/linear-compton-benchmark.adoc"
  asciidoctor -o /tmp/breit-wheeler.html "${SCRIPT_DIR}/BreitWheeler.adoc"
}

main "$@"
