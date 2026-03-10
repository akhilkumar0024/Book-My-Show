FROM node:18

WORKDIR /app

# 1. Critical: Tell the environment we are in production
# This often prevents 'react-scripts' from even looking for watchers
ENV NODE_ENV=production
ENV NODE_OPTIONS=--openssl-legacy-provider
ENV PORT=3000
ENV BROWSER=none

COPY package.json package-lock.json ./

# 2. We skip the manual chokidar install entirely. 
# 3. We use --force and --loglevel=error to push through warnings.
RUN npm install postcss@8.4.21 postcss-safe-parser@6.0.0 --legacy-peer-deps --force

# 4. Final install. If it fails on fsevents, the --force helps ignore it.
RUN npm install --legacy-peer-deps --force --loglevel=error

COPY . .

EXPOSE 3000

# 5. Use 'serve' or just build the project. 
# Since this is a React app, we want the BUILD, not the dev server.
RUN npm run build

# Install a lightweight server to serve the build
RUN npm install -g serve

CMD ["serve", "-s", "build", "-l", "3000"]