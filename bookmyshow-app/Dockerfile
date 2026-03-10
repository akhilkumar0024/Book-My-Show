FROM node:18

WORKDIR /app

# Set environment variables to handle the legacy React issues
ENV NODE_OPTIONS=--openssl-legacy-provider
ENV PORT=3000
ENV BROWSER=none
# This tells the watcher not to look for Mac-specific features
ENV CHOKIDAR_USEPOLLING=true

COPY package.json package-lock.json ./

# 1. We install with --no-optional to skip the Mac-only 'fsevents'
RUN npm install chokidar@3.5.3 watchpack-chokidar2@2.0.1 --legacy-peer-deps --no-optional

# 2. Your existing PostCSS fix
RUN npm install postcss@8.4.21 postcss-safe-parser@6.0.0 --legacy-peer-deps

# 3. Final install for the rest of the app
RUN npm install --legacy-peer-deps --no-optional

COPY . .

EXPOSE 3000

CMD ["npm", "start"]