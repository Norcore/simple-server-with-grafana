FROM node:current-alpine3.19
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 5000
CMD [ "node", "server.js" ]