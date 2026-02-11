# Codex CLI Docker Runner

This directory contains a Dockerfile plus a helper script to run Codex CLI
in a container while mounting your local workspace and Codex settings.

## What it does

- Builds a local image named `codex-cli`.
- Mounts your local `~/.codex` into the container at `/root/.codex`.
- Mounts a local workspace into `/workspace`.
- Masks a sensitive subdirectory inside the workspace by mounting an empty
  named volume over `/workspace/app/settings`.

## Usage

1. Edit `run.sh` and set `WORKDIR_HOST` to the directory you want to mount.
2. Run:

```bash
./run.sh
```

## Optional: mask a different subdirectory

Edit `HIDE_SUBDIR` in `run.sh` to a different container path you want hidden.

## Notes

- This is intended for macOS with Docker Desktop.
- The container starts in `bash` and leaves you in `/workspace`.
