# Usa l'immagine ufficiale del toolbox
FROM us-central1-docker.pkg.dev/database-toolbox/toolbox/toolbox:0.4.0

# Crea directory di lavoro
WORKDIR /app

# Copia il file di configurazione
COPY tools.yaml .

# Esponi la porta (Railway usa PORT env var)
ENV PORT=5000
EXPOSE $PORT

# Comando per avviare il toolbox
CMD ["./toolbox", "--tools_file", "tools.yaml", "--port", "$PORT"]
