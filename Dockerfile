# Partiamo sempre dall'ultima versione ufficiale di OpenClaw
FROM ghcr.io/openclaw/openclaw:latest

# Diventiamo root per installare i pacchetti
USER root

# Aggiorniamo la lista dei pacchetti (qui in futuro OpenClaw aggiungerà le sue cose!)
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-sandbox \
    && rm -rf /var/lib/apt/lists/*

# Torniamo all'utente sicuro
USER node
