#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
SRC_DIR="${SCRIPT_DIR}/CAIN-src"
BUILD_DIR="${SCRIPT_DIR}/CAIN-build"
REPO_URL="https://github.com/cfruhling2/CAIN.git"

COMMON_FLAGS=(
  -O2
  -std=legacy
  -ffixed-line-length-none
  -fallow-argument-mismatch
)

MODULE_FILES=(
  src/module/flchtyp.f
  src/module/arraymod.f
  src/module/bbcom.f
  src/module/bbpkcm.f
  src/module/beamcm.f
  src/module/lasrdata.f
  src/module/lumcom.f
  src/module/nlcplptab.f
  src/module/beamln.f
  src/module/evlmod.f
  src/module/matchmod.f
  src/module/readmod.f
)

usage() {
  cat <<'USAGE'
Usage:
  build-cain.sh --download
  build-cain.sh --compile

Options:
  --download  Remove any local CAIN source/build trees, clone a fresh copy,
              apply the OPALX portability patch set, and compile CAIN.
  --compile   Compile CAIN from an existing local source tree after applying
              the same portability patch set.

Artifacts:
  Source tree: gamma-gamma/cain/CAIN-src
  Build tree : gamma-gamma/cain/CAIN-build
  Binary     : gamma-gamma/cain/CAIN-build/cain
USAGE
}

require_tool() {
  local tool="$1"
  if ! command -v "${tool}" >/dev/null 2>&1; then
    echo "error: required tool '${tool}' was not found in PATH" >&2
    exit 1
  fi
}

patch_source_tree() {
  local src_dir="$1"

  python3 - "${src_dir}" <<'PY'
from pathlib import Path
import re
import sys

src = Path(sys.argv[1])

def replace_exact(path_str: str, old: str, new: str) -> None:
    path = src / path_str
    text = path.read_text()
    if new in text:
        return
    if old not in text:
        raise SystemExit(f"error: expected pattern not found in {path}")
    path.write_text(text.replace(old, new))

replace_exact("src/evufnchar.f", "WRITE(TEXT,'(I)')", "WRITE(TEXT,'(I0)')")
replace_exact("src/transport.f", "WRITE(MAGNAM,'(I)')", "WRITE(MAGNAM,'(I0)')")

lsr_path = src / "src/lsrrdfl.f"
text = lsr_path.read_text()
if "PARAMETER (EOR=CHAR(10), EOF=CHAR(0))" not in text:
    text, count = re.subn(
        r"(?m)^\s*PARAMETER\s*\(EOR=.*EOF=.*\)\s*$",
        "      PARAMETER (EOR=CHAR(10), EOF=CHAR(0))",
        text,
        count=1,
    )
    if count == 0:
        text, count = re.subn(
            r"(?m)^\s*CHARACTER\*1\s+EOR/Z'0A'/,EOF/Z'00'/\s*$",
            "      CHARACTER*1 EOR,EOF\n      PARAMETER (EOR=CHAR(10), EOF=CHAR(0))",
            text,
            count=1,
        )
    if count != 1:
        raise SystemExit(f"error: could not update EOR/EOF definition in {lsr_path}")
    lsr_path.write_text(text)
PY
}

fresh_download() {
  rm -rf "${SRC_DIR}" "${BUILD_DIR}"
  git clone --depth 1 "${REPO_URL}" "${SRC_DIR}"
}

compile_cain() {
  mkdir -p "${BUILD_DIR}"
  rm -f "${BUILD_DIR}"/*.o "${BUILD_DIR}"/*.mod "${BUILD_DIR}/cain"

  local module_args=()
  local module_file
  for module_file in "${MODULE_FILES[@]}"; do
    module_args+=("${SRC_DIR}/${module_file}")
  done

  (
    cd "${BUILD_DIR}"
    gfortran -c "${COMMON_FLAGS[@]}" \
      -I"${SRC_DIR}/src/include" \
      -J"${BUILD_DIR}" \
      "${module_args[@]}"

    gfortran -c "${COMMON_FLAGS[@]}" \
      -I"${SRC_DIR}/src/include" \
      -I"${BUILD_DIR}" \
      -J"${BUILD_DIR}" \
      "${SRC_DIR}"/src/*.f \
      "${SRC_DIR}"/src/unix/*.f

    gfortran "${COMMON_FLAGS[@]}" \
      -I"${SRC_DIR}/src/include" \
      -I"${BUILD_DIR}" \
      -J"${BUILD_DIR}" \
      ./*.o \
      -o cain
  )
}

main() {
  if [[ $# -ne 1 ]]; then
    usage
    exit 1
  fi

  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
  esac

  require_tool git
  require_tool gfortran
  require_tool python3

  case "$1" in
    --download)
      fresh_download
      ;;
    --compile)
      if [[ ! -d "${SRC_DIR}" ]]; then
        echo "error: ${SRC_DIR} does not exist; run --download first" >&2
        exit 1
      fi
      ;;
    *)
      usage
      exit 1
      ;;
  esac

  patch_source_tree "${SRC_DIR}"
  compile_cain

  cat <<EOF2
CAIN build complete.
  source: ${SRC_DIR}
  build : ${BUILD_DIR}
  binary: ${BUILD_DIR}/cain
EOF2
}

main "$@"
