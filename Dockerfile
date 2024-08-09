# !!! Don't try to build this Dockerfile directly, run it through bin/build-docker.sh script !!!
FROM node:20.15.1-bullseye-slim

# Configure system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    g++ \
    gcc \
    libtool \
    make \
    nasm \
    libpng-dev \
    python3 \
    gosu \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /usr/src/app

# Bundle app source
COPY . .

COPY server-package.json package.json

# Copy TypeScript build artifacts into the original directory structure.
RUN ls
RUN cp -R build/src/* src/.

# Copy the healthcheck
RUN cp build/docker_healthcheck.js .
RUN rm docker_healthcheck.ts

RUN rm -r build

# Install app dependencies
RUN set -x
RUN npm install
RUN apt-get purge -y --auto-remove \
    autoconf \
    automake \
    g++ \
    gcc \
    libtool \
    make \
    nasm \
    libpng-dev \
    python3 \
    && rm -rf /var/lib/apt/lists/*
RUN npm run webpack
RUN npm prune --omit=dev
RUN cp src/public/app/share.js src/public/app-dist/.
RUN cp -r src/public/app/doc_notes src/public/app-dist/.
RUN rm -rf src/public/app
RUN rm src/services/asset_path.ts

# Some setup tools need to be kept
RUN apt-get update && apt-get install -y --no-install-recommends \
    gosu \
    && rm -rf /var/lib/apt/lists/*

# Start the application
EXPOSE 8080
CMD [ "./start-docker.sh" ]

HEALTHCHECK --start-period=10s CMD exec gosu node node docker_healthcheck.js