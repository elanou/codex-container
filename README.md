# Codex CLI Docker Runner

This directory contains a Dockerfile plus a helper script to run Codex CLI
in a container while mounting your local workspace and Codex settings.

## What it does

- Builds a local image named `codex-cli`.
- Mounts your local `~/.codex` into the container at `/root/.codex`.
- Mounts a local workspace into `/workspace`.
- Masks a sensitive subdirectory inside the workspace by mounting an empty
  named volume over `/workspace/app/settings`.
- Installs `ca-certificates` and passes host proxy env vars through to the
  container (if present) to reduce TLS/proxy connectivity issues.

## Usage

1. Edit `run.sh` and set `WORKDIR_HOST` to the directory you want to mount.
2. Run:

```bash
./run.sh
```

## Connectivity check (inside container)

If Codex streaming fails with errors like:
`stream disconnected before completion: error sending request for url (...)`
run this inside the container:

```bash
curl -I https://chatgpt.com/backend-api/codex/responses
```

You should at least get an HTTP response (often `401/403` is fine for this
check). DNS/TLS/proxy failures here indicate a container network/trust issue.

## Optional: mask a different subdirectory

Edit `HIDE_SUBDIR` in `run.sh` to a different container path you want hidden.

## Notes

- This is intended for macOS with Docker Desktop.
- The container starts in `bash` and leaves you in `/workspace`.
