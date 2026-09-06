# Partiamo sempre dall'ultima versione ufficiale di OpenClaw
FROM ghcr.io/openclaw/openclaw:latest

# Diventiamo root per installare i pacchetti
USER root

# Aggiorniamo la lista dei pacchetti (qui in futuro OpenClaw aggiungerà le sue cose!)
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-sandbox \
    && rm -rf /var/lib/apt/lists/*

# Codex app-server: richiesto dal plugin "codex", che e' la strada
# obbligata quando l'auth OpenAI e' OAuth (account ChatGPT) invece di API key.
RUN npm install -g @openai/codex && codex --version

# Torniamo all'utente sicuro
USER node

