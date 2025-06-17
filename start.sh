#!/bin/bash
wget https://storage.googleapis.com/genai-toolbox/v0.7.0/linux/amd64/toolbox -O toolbox
chmod +x toolbox
./toolbox --tools-file tools.yaml --port $PORT
