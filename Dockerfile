# Dockerfile
FROM node:20-slim

# Set a working directory inside the container
WORKDIR /workspace

# Install codex CLI (npm is the quickest path)
RUN npm install -g @openai/codex

# Default command: open an interactive shell
CMD ["bash"]
