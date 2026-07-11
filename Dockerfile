FROM node:20-alpine

WORKDIR /usr/src/app

# Copiamos solo los archivos de dependencias
COPY package.json ./

# Forzamos el uso de yarn clásico (v1) para evitar el bug de bloqueo
RUN yarn set version classic && yarn install

# Copiamos el resto de los archivos
COPY . .

EXPOSE 3000

CMD ["node", "server.js"]