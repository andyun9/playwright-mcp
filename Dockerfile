FROM mcr.microsoft.com/playwright:v1.52.0-noble

WORKDIR /app

RUN npm install -g @playwright/mcp@latest && npx @playwright/mcp install-browser chrome-for-testing

EXPOSE 8080

CMD npx @playwright/mcp --port $PORT --host 0.0.0.0 --no-sandbox --allowed-hosts "playwright-mcp-production-4814.up.railway.app"
