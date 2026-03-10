FROM node:18

WORKDIR /app

COPY package.json package-lock.json ./

# 1. Force install the missing watchers that are causing the crash
RUN npm install chokidar@3.5.3 watchpack-chokidar2@2.0.1 --legacy-peer-deps

# 2. Your existing PostCSS fix
RUN npm install postcss@8.4.21 postcss-safe-parser@6.0.0 --legacy-peer-deps

RUN npm install --legacy-peer-deps

COPY . .

EXPOSE 3000

ENV NODE_OPTIONS=--openssl-legacy-provider
ENV PORT=3000

# 3. Add this: Tells React not to try and open a browser (which crashes in Docker)
ENV BROWSER=none

CMD ["npm", "start"]