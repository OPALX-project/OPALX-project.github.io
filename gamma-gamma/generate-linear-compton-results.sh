#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
REFERENCE_DIR="${SCRIPT_DIR}/reference-data"
CAIN_BIN_DEFAULT="${HOME}/git/cain/CAIN-build/cain"
CAIN_DECK_DIR_DEFAULT="${HOME}/git/cain"
CAIN_DECK_DIR="${CAIN_DECK_DIR_DEFAULT}"
PLOT_CAIN="${SCRIPT_DIR}/plot_cain_beam.py"
PLOT_COMPARE="${SCRIPT_DIR}/plot_linear_compton_comparison.py"
SAMPLES=250000
SEED=13579
XI=0.2955
KEEP_DAT=0
TMP_WORKDIR=""
OPALX_BUILD_DIR=""
OPALX_BENCH=""
OPALX_SHA=""
CAIN_SHA=""

usage() {
  cat <<'EOF'
Usage:
  ./generate-linear-compton-results.sh --opalx-build /path/to/opalx-build

Options:
  --opalx-build DIR   OPALX build directory containing unit_tests/Physics/LinearComptonSpectrumBenchmark
  --opalx-bench PATH  Full path to LinearComptonSpectrumBenchmark executable
  --opalx-sha SHA     Override OPALX git SHA annotation used in plots
  --cain-bin PATH     Override CAIN executable path
  --cain-deck-dir DIR  Override CAIN deck directory; defaults to ~/git/cain
  --cain-sha SHA      Override CAIN git SHA annotation used in plots
  --keep-dat          Keep intermediate CAIN WRITE BEAM .dat files
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

infer_opalx_sha() {
  if [[ -n "${OPALX_SHA}" ]]; then
    return
  fi
  local cache="${OPALX_BUILD_DIR}/CMakeCache.txt"
  if [[ -f "${cache}" ]]; then
    local source_dir
    source_dir=$(awk -F= '/^CMAKE_HOME_DIRECTORY:INTERNAL=/{print $2}' "${cache}")
    if [[ -n "${source_dir}" ]] && git -C "${source_dir}" rev-parse --short HEAD >/dev/null 2>&1; then
      OPALX_SHA=$(git -C "${source_dir}" rev-parse --short HEAD)
      return
    fi
  fi
  OPALX_SHA="unknown"
}

infer_cain_sha() {
  if [[ -n "${CAIN_SHA}" ]]; then
    return
  fi
  if git -C "${HOME}/git/cain/CAIN-src" rev-parse --short HEAD >/dev/null 2>&1; then
    CAIN_SHA=$(git -C "${HOME}/git/cain/CAIN-src" rev-parse --short HEAD)
  else
    CAIN_SHA="unknown"
  fi
}

run_cain_deck() {
  local deck=$1
  (cd "${SCRIPT_DIR}" && "${CAIN_BIN}" < "${CAIN_DECK_DIR}/${deck}")
}

main() {
  local cain_bin="${CAIN_BIN_DEFAULT}"

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --opalx-build)
        OPALX_BUILD_DIR=$2
        shift 2
        ;;
      --opalx-bench)
        OPALX_BENCH=$2
        shift 2
        ;;
      --opalx-sha)
        OPALX_SHA=$2
        shift 2
        ;;
      --cain-bin)
        cain_bin=$2
        shift 2
        ;;
      --cain-deck-dir)
        CAIN_DECK_DIR=$2
        shift 2
        ;;
      --cain-sha)
        CAIN_SHA=$2
        shift 2
        ;;
      --keep-dat)
        KEEP_DAT=1
        shift
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        echo "error: unknown option: $1" >&2
        usage >&2
        exit 1
        ;;
    esac
  done

  if [[ -z "${OPALX_BENCH}" ]]; then
    if [[ -z "${OPALX_BUILD_DIR}" ]]; then
      echo "error: pass --opalx-build or --opalx-bench" >&2
      usage >&2
      exit 1
    fi
    OPALX_BENCH="${OPALX_BUILD_DIR}/unit_tests/Physics/LinearComptonSpectrumBenchmark"
  fi

  CAIN_BIN="${cain_bin}"
  require_file "${CAIN_BIN}" "CAIN executable"
  require_file "${CAIN_DECK_DIR}/cain-linear-compton-90deg.i" "CAIN single-electron deck"
  require_file "${CAIN_DECK_DIR}/cain-linear-compton-90deg-finite-beam.i" "CAIN finite-beam deck"
  require_file "${CAIN_DECK_DIR}/cain-linear-compton-90deg-finite-beam-energy-spread.i" "CAIN finite-beam energy-spread deck"
  require_file "${OPALX_BENCH}" "OPALX benchmark executable"
  require_file "${PLOT_CAIN}" "CAIN plotting helper"
  require_file "${PLOT_COMPARE}" "comparison plotting helper"

  mkdir -p "${REFERENCE_DIR}"
  TMP_WORKDIR=$(mktemp -d)
  trap 'rm -rf "${TMP_WORKDIR}"' EXIT

  infer_opalx_sha
  infer_cain_sha

  echo "[1/6] Running CAIN decks"
  run_cain_deck cain-linear-compton-90deg.i
  run_cain_deck cain-linear-compton-90deg-finite-beam.i
  run_cain_deck cain-linear-compton-90deg-finite-beam-energy-spread.i

  echo "[2/6] Extracting CAIN histograms"
  python3 "${PLOT_CAIN}" "${SCRIPT_DIR}/cain-linear-compton-90deg-xi029.dat" \
    --observable energy --bins 80 --emin 0.0 --emax 0.01 \
    --csv-output "${REFERENCE_DIR}/cain-linear-compton-90deg-xi029-histogram.csv" \
    --output "${TMP_WORKDIR}/cain-linear-compton-90deg-xi029.png"
  python3 "${PLOT_CAIN}" "${SCRIPT_DIR}/cain-linear-compton-90deg-xi029.dat" \
    --observable theta --bins 80 --tmin 0.0 --tmax 0.02 \
    --csv-output "${REFERENCE_DIR}/cain-linear-compton-90deg-xi029-theta-histogram.csv" \
    --output "${TMP_WORKDIR}/cain-linear-compton-90deg-xi029-theta.png"
  python3 "${PLOT_CAIN}" "${SCRIPT_DIR}/cain-linear-compton-90deg-xi029.dat" \
    --observable joint --bins 60 --emin 0.0 --emax 0.01 --tmin 0.0 --tmax 0.02 \
    --csv-output "${REFERENCE_DIR}/cain-linear-compton-90deg-xi029-joint-histogram.csv" \
    --output "${TMP_WORKDIR}/cain-linear-compton-90deg-xi029-joint.png"
  python3 "${PLOT_CAIN}" "${SCRIPT_DIR}/cain-linear-compton-90deg-xi029-finite-beam-wide-laser.dat" \
    --observable energy --bins 80 --emin 0.0 --emax 0.01 \
    --csv-output "${REFERENCE_DIR}/cain-linear-compton-90deg-xi029-finite-beam-histogram.csv" \
    --output "${TMP_WORKDIR}/cain-linear-compton-90deg-xi029-finite-beam.png"
  python3 "${PLOT_CAIN}" "${SCRIPT_DIR}/cain-linear-compton-90deg-xi029-finite-beam-wide-laser.dat" \
    --observable theta --bins 80 --tmin 0.0 --tmax 0.02 \
    --csv-output "${REFERENCE_DIR}/cain-linear-compton-90deg-xi029-finite-beam-theta-histogram.csv" \
    --output "${TMP_WORKDIR}/cain-linear-compton-90deg-xi029-finite-beam-theta.png"
  python3 "${PLOT_CAIN}" "${SCRIPT_DIR}/cain-linear-compton-90deg-xi029-finite-beam-energy-spread.dat" \
    --observable energy --bins 80 --emin 0.0 --emax 0.01 \
    --csv-output "${REFERENCE_DIR}/cain-linear-compton-90deg-xi029-finite-beam-energy-spread-histogram.csv" \
    --output "${TMP_WORKDIR}/cain-linear-compton-90deg-xi029-finite-beam-energy-spread.png"
  python3 "${PLOT_CAIN}" "${SCRIPT_DIR}/cain-linear-compton-90deg-xi029-finite-beam-energy-spread.dat" \
    --observable theta --bins 80 --tmin 0.0 --tmax 0.02 \
    --csv-output "${REFERENCE_DIR}/cain-linear-compton-90deg-xi029-finite-beam-energy-spread-theta-histogram.csv" \
    --output "${TMP_WORKDIR}/cain-linear-compton-90deg-xi029-finite-beam-energy-spread-theta.png"

  echo "[3/6] Generating OPALX benchmark histograms"
  "${OPALX_BENCH}" "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-histogram.csv"
  "${OPALX_BENCH}" "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-sampled-histogram.csv" \
    --sampled --samples "${SAMPLES}" --seed "${SEED}"
  "${OPALX_BENCH}" "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-theta-histogram.csv" \
    --angular
  "${OPALX_BENCH}" "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-sampled-theta-histogram.csv" \
    --angular --sampled --samples "${SAMPLES}" --seed "${SEED}"
  "${OPALX_BENCH}" "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-joint-histogram.csv" \
    --joint
  "${OPALX_BENCH}" "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-sampled-joint-histogram.csv" \
    --joint --sampled --samples "${SAMPLES}" --seed "${SEED}"
  "${OPALX_BENCH}" "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-finite-beam-histogram.csv" \
    --finite-beam --beam-particles 100000 --seed "${SEED}"
  "${OPALX_BENCH}" "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-finite-beam-theta-histogram.csv" \
    --finite-beam --angular --beam-particles 100000 --seed "${SEED}"
  "${OPALX_BENCH}" "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-finite-beam-energy-spread-histogram.csv" \
    --finite-beam --beam-particles 100000 --beam-relative-energy-spread 0.001 --seed "${SEED}"
  "${OPALX_BENCH}" "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-finite-beam-energy-spread-theta-histogram.csv" \
    --finite-beam --angular --beam-particles 100000 --beam-relative-energy-spread 0.001 --seed "${SEED}"

  echo "[4/6] Generating comparison plots"
  python3 "${PLOT_COMPARE}" \
    "${REFERENCE_DIR}/cain-linear-compton-90deg-xi029-histogram.csv" \
    "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-histogram.csv" \
    --opalx-mc-csv "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-sampled-histogram.csv" \
    --xi "${XI}" --cain-sha "${CAIN_SHA}" --opalx-sha "${OPALX_SHA}" \
    --mc-samples "${SAMPLES}" --mc-seed "${SEED}" \
    --output "${REFERENCE_DIR}/linear-compton-90deg-xi029-comparison.png"
  python3 "${PLOT_COMPARE}" \
    "${REFERENCE_DIR}/cain-linear-compton-90deg-xi029-theta-histogram.csv" \
    "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-theta-histogram.csv" \
    --opalx-mc-csv "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-sampled-theta-histogram.csv" \
    --observable theta --xi "${XI}" --cain-sha "${CAIN_SHA}" --opalx-sha "${OPALX_SHA}" \
    --mc-samples "${SAMPLES}" --mc-seed "${SEED}" \
    --output "${REFERENCE_DIR}/linear-compton-90deg-xi029-theta-comparison.png"
  python3 "${PLOT_COMPARE}" \
    "${REFERENCE_DIR}/cain-linear-compton-90deg-xi029-joint-histogram.csv" \
    "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-joint-histogram.csv" \
    --opalx-mc-csv "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-sampled-joint-histogram.csv" \
    --observable joint --xi "${XI}" --cain-sha "${CAIN_SHA}" --opalx-sha "${OPALX_SHA}" \
    --mc-samples "${SAMPLES}" --mc-seed "${SEED}" \
    --output "${REFERENCE_DIR}/linear-compton-90deg-xi029-joint-comparison.png"
  python3 "${PLOT_COMPARE}" \
    "${REFERENCE_DIR}/cain-linear-compton-90deg-xi029-finite-beam-histogram.csv" \
    "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-finite-beam-histogram.csv" \
    --observable energy --xi "${XI}" --cain-sha "${CAIN_SHA}" --opalx-sha "${OPALX_SHA}" \
    --output "${REFERENCE_DIR}/linear-compton-90deg-xi029-finite-beam-comparison.png"
  python3 "${PLOT_COMPARE}" \
    "${REFERENCE_DIR}/cain-linear-compton-90deg-xi029-finite-beam-theta-histogram.csv" \
    "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-finite-beam-theta-histogram.csv" \
    --observable theta --xi "${XI}" --cain-sha "${CAIN_SHA}" --opalx-sha "${OPALX_SHA}" \
    --output "${REFERENCE_DIR}/linear-compton-90deg-xi029-finite-beam-theta-comparison.png"
  python3 "${PLOT_COMPARE}" \
    "${REFERENCE_DIR}/cain-linear-compton-90deg-xi029-finite-beam-energy-spread-histogram.csv" \
    "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-finite-beam-energy-spread-histogram.csv" \
    --observable energy --xi "${XI}" --cain-sha "${CAIN_SHA}" --opalx-sha "${OPALX_SHA}" \
    --output "${REFERENCE_DIR}/linear-compton-90deg-xi029-finite-beam-energy-spread-comparison.png"
  python3 "${PLOT_COMPARE}" \
    "${REFERENCE_DIR}/cain-linear-compton-90deg-xi029-finite-beam-energy-spread-theta-histogram.csv" \
    "${REFERENCE_DIR}/opalx-linear-compton-90deg-xi029-finite-beam-energy-spread-theta-histogram.csv" \
    --observable theta --xi "${XI}" --cain-sha "${CAIN_SHA}" --opalx-sha "${OPALX_SHA}" \
    --output "${REFERENCE_DIR}/linear-compton-90deg-xi029-finite-beam-energy-spread-theta-comparison.png"

  echo "[5/6] Cleaning intermediate CAIN output"
  if [[ "${KEEP_DAT}" -eq 0 ]]; then
    rm -f \
      "${SCRIPT_DIR}/cain-linear-compton-90deg-xi029.dat" \
      "${SCRIPT_DIR}/cain-linear-compton-90deg-xi029-finite-beam-wide-laser.dat" \
      "${SCRIPT_DIR}/cain-linear-compton-90deg-xi029-finite-beam-energy-spread.dat"
  fi

  echo "[6/6] Done"
  echo "Reference data and plots regenerated in ${REFERENCE_DIR}"
}

main "$@"
