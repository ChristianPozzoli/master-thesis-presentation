FROM node:lts-slim

# Installiamo le dipendenze minime per far girare i binari
RUN apt-get update && apt-get install -y git

WORKDIR /app

# Copiamo i file dei pacchetti e installiamo
COPY package*.json ./
RUN npm install
RUN npx playwright install-deps chromium
RUN npx playwright install chromium

# Copiamo il resto dei file
COPY . .

EXPOSE 3030
EXPOSE 3000

CMD ["npx", "slidev", "--remote", "--force"]