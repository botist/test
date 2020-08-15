FROM node:12-buster

RUN npm install -g pm2

# apt
RUN apt update && \
    env DEBIAN_FRONTEND=noninteractive apt install -y wget git build-essential libevent-dev libsqlite3-dev mono-complete p7zip-full redis-server python3 liblua5.3-dev && \
    rm -rf /var/lib/apt/lists/*

# srvpro
WORKDIR /srvpro
RUN mkdir decks replays logs /redis

RUN npm install -g pm2 coffeescript

COPY package*.json ./
RUN npm i

COPY . .

EXPOSE 7911 7922 7933