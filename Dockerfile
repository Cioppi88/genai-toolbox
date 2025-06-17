FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y curl ca-certificates jq && rm -rf /var/lib/apt/lists/*

RUN curl -L https://storage.googleapis.com/genai-toolbox/v0.7.0/linux/amd64/toolbox -o /usr/local/bin/toolbox \
    && chmod +x /usr/local/bin/toolbox

WORKDIR /app

COPY tool.yaml /app/tool.yaml

# Salva le credenziali da variabile JSON
# ATTENZIONE: questa parte deve essere CMD (non RUN) per leggere la variabile al runtime su Railway
CMD echo "$GOOGLE_APPLICATION_CREDENTIALS_JSON" > /app/gcp-creds.json && \
    export GOOGLE_APPLICATION_CREDENTIALS=/app/gcp-creds.json && \
    toolbox --tools-file /app/tool.yaml --port 5000
