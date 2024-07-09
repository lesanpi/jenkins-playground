FROM node:12.22.1-alpine3.11

WORKDIR /app
COPY . .
RUN apk --no-cache --virtual build-dependencies add \
    python \
    make \
    g++ \
    && yarn install --production \
    && apk del build-dependencies

CMD ["node", "/app/src/index.js"]
