FROM node:20

RUN corepack enable && corepack prepare yarn@stable --activate

WORKDIR /usr/src/app

# Desactivamos el modo estricto de Yarn mediante variables de entorno
ENV YARN_ENABLE_IMMUTABLE_INSTALLS=false

COPY package.json yarn.lock .yarnrc.yml ./

RUN yarn install

COPY . .

EXPOSE 3000

CMD ["yarn", "start"]
