FROM debian:bullseye-slim

# Install curl e certificati
RUN apt-get update && apt-get install -y curl ca-certificates && rm -rf /var/lib/apt/lists/*

# Scarica il binario
RUN curl -L https://storage.googleapis.com/genai-toolbox/v0.7.0/linux/amd64/toolbox -o /usr/local/bin/toolbox \
    && chmod +x /usr/local/bin/toolbox

# Copia il file tools.yaml
COPY tools.yaml /app/tools.yaml

WORKDIR /app

# Espone la porta usata da toolbox
EXPOSE 5000

# Comando di avvio
CMD ["toolbox", "--tools-file", "tools.yaml", "--port", "5000"]
