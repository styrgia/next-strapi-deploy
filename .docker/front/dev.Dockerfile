FROM node:18-alpine

ENV LOCALTIME Europe/Moscow

RUN ln -snf /usr/share/zoneinfo/$LOCALTIME /etc/localtime && echo $LOCALTIME > /etc/timezone

WORKDIR /app

COPY package.json package-lock.json* ./

RUN npm ci

COPY src ./src
COPY public ./public
COPY next.config.js .
COPY tsconfig.json .

ENV NEXT_TELEMETRY_DISABLED 1

CMD npm run dev