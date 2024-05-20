# Etapa de construcción
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN chmod +x ./node_modules/.bin/react-scripts
RUN npm run build

# Etapa de ejecución
FROM node:18-alpine

WORKDIR /app

# Copia los archivos construidos desde la etapa de construcción
COPY --from=builder /app/build ./build
COPY package*.json ./

# Instala las dependencias de producción
RUN npm install --production

# Expone el puerto 80 para que la aplicación sea accesible
EXPOSE 3000

# Inicia la aplicación
CMD ["npm", "start"]