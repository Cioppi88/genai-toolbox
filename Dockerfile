FROM ubuntu:20.04

RUN apt-get update && apt-get install -y curl ca-certificates && rm -rf /var/lib/apt/lists/*

RUN curl -L https://storage.googleapis.com/genai-toolbox/v0.7.0/linux/amd64/toolbox -o /usr/local/bin/toolbox \
    && chmod +x /usr/local/bin/toolbox

COPY tool.yaml /app/tool.yaml

WORKDIR /app
EXPOSE 5000

ENV GOOGLE_APPLICATION_CREDENTIALS=/app/gcp-creds.json

RUN echo "$GOOGLE_APPLICATION_CREDENTIALS_JSON" > /app/gcp-creds.json


CMD ["toolbox", "--tools-file", "tool.yaml", "--port", "5000"]
