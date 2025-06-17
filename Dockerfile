FROM debian:bullseye-slim

# Installa curl e certificati
RUN apt-get update && apt-get install -y curl ca-certificates && rm -rf /var/lib/apt/lists/*

# Scarica il binario toolbox
RUN curl -L https://storage.googleapis.com/genai-toolbox/v0.7.0/linux/amd64/toolbox -o /usr/local/bin/toolbox \
    && chmod +x /usr/local/bin/toolbox

# Crea directory di lavoro
WORKDIR /app

# Copia il file tool.yaml (assicurati che sia nella root del repo)
COPY tool.yaml /app/tool.yaml

# Scrive le credenziali nel file, usando la variabile d’ambiente
# Railway passa GOOGLE_APPLICATION_CREDENTIALS_JSON
ENV GOOGLE_APPLICATION_CREDENTIALS=/app/gcp-creds.json
RUN echo "$GOOGLE_APPLICATION_CREDENTIALS_JSON" > /app/gcp-creds.json

# Espone la porta per MCP
EXPOSE 5000

# Avvia toolbox
CMD ["toolbox", "--tools-file", "tool.yaml", "--port", "5000"]
