FROM --platform=linux/amd64 node:16.20-alpine

RUN apk add vim

WORKDIR /opt/wynd-backend
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000

CMD [ "node", "server.js" ]
