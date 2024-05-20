# Usar la imagen oficial de Node.js como base
FROM node:14-alpine

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el package.json y package-lock.json al directorio de trabajo
COPY package*.json ./

# Instalar las dependencias del proyecto
RUN npm install

# Dar permisos de ejecución al script react-scripts
RUN chmod +x ./node_modules/.bin/react-scripts

# Cambiar al usuario "node" (no root)
USER node

# Construir la aplicación React
RUN npm run build

# Exponer el puerto por el que se servirá la aplicación
EXPOSE 3000

# Definir el comando para iniciar la aplicación
CMD ["npm", "start"]