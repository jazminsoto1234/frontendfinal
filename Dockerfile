FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN chmod +x ./node_modules/.bin/react-scripts
RUN npm run build

FROM node:18-alpine
WORKDIR /app

COPY --from=builder /app/build ./build
COPY package*.json ./

CMD ["npm", "start"]