FROM node:20-bookworm-slim

# Install Google Chrome
RUN apt-get update && apt-get install -y wget gnupg ca-certificates \
    && wget -q -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install -y /tmp/chrome.deb \
    && rm /tmp/chrome.deb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN npm install -g @playwright/mcp@latest

EXPOSE 8080

CMD npx @playwright/mcp --port $PORT --host 0.0.0.0 --no-sandbox --allowed-hosts "playwright-mcp-production-4814.up.railway.app"
