#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="codex-cli"
WORKDIR_HOST="/path/to/your/workdir"
CODEX_HOME_HOST="${HOME}/.codex"
HIDE_SUBDIR="/workspace/app/settings"

if [[ ! -d "${WORKDIR_HOST}" ]]; then
  echo "WORKDIR_HOST does not exist: ${WORKDIR_HOST}" >&2
  exit 1
fi

if [[ ! -d "${CODEX_HOME_HOST}" ]]; then
  echo "CODEX_HOME_HOST does not exist: ${CODEX_HOME_HOST}" >&2
  exit 1
fi

docker build -t "${IMAGE_NAME}" .

docker run --rm -it \
  -v "${CODEX_HOME_HOST}:/root/.codex" \
  -v "${WORKDIR_HOST}:/workspace" \
  -v "codex_settings_hide:${HIDE_SUBDIR}" \
  "${IMAGE_NAME}"
