#!/bin/bash

# Scarica toolbox se non esiste già
if [ ! -f toolbox ]; then
  echo "⬇️ Scarico genai-toolbox..."
  curl -L https://storage.googleapis.com/genai-toolbox/v0.7.0/linux/amd64/toolbox -o toolbox
  chmod +x toolbox
fi

# Avvia il server MCP
echo "🚀 Avvio MCP sulla porta $PORT..."
./toolbox --tools-file tools.yaml --port $PORT
