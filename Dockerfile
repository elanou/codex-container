# Dockerfile
FROM node:20-slim

# Basic OS deps for TLS trust and connectivity debugging
RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates curl \
  && rm -rf /var/lib/apt/lists/* \
  && update-ca-certificates

# Set a working directory inside the container
WORKDIR /workspace

# Install codex CLI (npm is the quickest path)
RUN npm install -g @openai/codex

# Ensure Node uses system CA bundle
ENV NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt

# Default command: open an interactive shell
CMD ["bash"]
