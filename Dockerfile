# Usa l'immagine ufficiale del toolbox
FROM us-central1-docker.pkg.dev/database-toolbox/toolbox/toolbox:0.4.0

# Crea directory di lavoro
WORKDIR /app

# Copia il file di configurazione
COPY tools.yaml .

# Railway imposta automaticamente PORT
# Le variabili BQ_PROJECT_ID e BQ_SERVICE_ACCOUNT_KEY 
# vengono impostate tramite Railway Dashboard
EXPOSE 5000

# Comando per avviare il toolbox
CMD ["./toolbox", "--tools_file", "tools.yaml"]
