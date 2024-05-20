# Usar la imagen oficial de Node.js como base
FROM node:14-alpine

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el package.json y package-lock.json al directorio de trabajo
COPY package*.json ./

# Instalar las dependencias del proyecto
RUN npm ci

# Copiar el código fuente del proyecto al directorio de trabajo
COPY . .

# Construir la aplicación React
RUN npm run build

# Definir el comando para iniciar la aplicación
CMD ["npm", "start"]