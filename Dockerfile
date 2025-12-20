FROM node:22

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN apt-get update && apt-get install -y \
  ffmpeg \
  libsodium-dev \
  && rm -rf /var/lib/apt/lists/*

CMD ["sh", "-c", "npx prisma generate && npm run start"]
