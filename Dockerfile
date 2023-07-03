FROM node:alpine

WORKDIR /app

RUN apk add git && \
    git clone https://github.com/felipemfp/stremio-web --depth 1 /app && \
    cd /app && \
    npm install && \
    npm run build && \
    npm install -g http-server

EXPOSE 8080

CMD http-server /app/build/ -p 8080 -d false
