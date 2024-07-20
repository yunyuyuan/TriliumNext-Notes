# !!! Don't try to build this Dockerfile directly, run it through bin/build-docker.sh script !!!
FROM node:20.15.1-alpine

# Configure system dependencies
RUN apk add --no-cache --virtual .build-dependencies \
    autoconf \
    automake \
    g++ \
    gcc \
    libtool \
    make \
    nasm \
    libpng-dev \
    python3 

# Create app directory
WORKDIR /usr/src/app

# Bundle app source
COPY . .

COPY server-package.json package.json

# Copy TypeScript build artifacts into the original directory structure.
RUN ls
RUN cp -R build/src/* src/.
RUN rm -r build

# Install app dependencies
RUN set -x \
    && npm install \
    && apk del .build-dependencies \
    && npm run webpack \
    && npm prune --omit=dev \
    && cp src/public/app/share.js src/public/app-dist/. \
    && cp -r src/public/app/doc_notes src/public/app-dist/. \
    && rm -rf src/public/app \
    && rm src/services/asset_path.ts

# Some setup tools need to be kept
RUN apk add --no-cache su-exec shadow

# Add application user and setup proper volume permissions
RUN adduser -s /bin/false node; exit 0

# Start the application
EXPOSE 8080
CMD [ "./start-docker.sh" ]

HEALTHCHECK --start-period=10s CMD exec su-exec node node docker_healthcheck.js
