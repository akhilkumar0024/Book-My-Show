FROM node:18

WORKDIR /app

# Prevent OpenSSL issues and browser-spawn crashes
ENV NODE_OPTIONS=--openssl-legacy-provider
ENV PORT=3000
ENV BROWSER=none
ENV CHOKIDAR_USEPOLLING=true

COPY package.json package-lock.json ./

# 1. Using --omit=optional is the modern way to force NPM to ignore the Mac-only fsevents
RUN npm install chokidar@3.5.3 watchpack-chokidar2@2.0.1 --legacy-peer-deps --omit=optional

# 2. PostCSS fix
RUN npm install postcss@8.4.21 postcss-safe-parser@6.0.0 --legacy-peer-deps --omit=optional

# 3. Final install
RUN npm install --legacy-peer-deps --omit=optional

COPY . .

EXPOSE 3000

CMD ["npm", "start"]