# Etapa de construcción
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Etapa de ejecución
FROM nginx:alpine

# Copia los archivos construidos desde la etapa de construcción
COPY --from=builder /app/build /usr/share/nginx/html

# Copia el archivo de configuración de nginx personalizado
COPY nginx.conf ./

# Expone el puerto 80 para que la aplicación sea accesible
EXPOSE 80

# Inicia nginx en modo foreground
CMD ["nginx", "-g", "daemon off;"]