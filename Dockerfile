# Etapa de construcción
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN chmod +x ./node_modules/.bin/react-scripts
RUN npm run build

# Etapa de ejecución
FROM nginx:alpine

# Copia los archivos construidos desde la etapa de construcción
COPY --from=builder /app/build /usr/share/nginx/html

# Expone el puerto 80 para que la aplicación sea accesible
EXPOSE 80

# Inicia nginx en modo foreground
CMD ["nginx", "-g", "daemon off;"]