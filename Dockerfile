FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

RUN chmod +x ./node_modules/.bin/react-scripts

USER node

RUN npm run build

CMD ["npm", "start"]