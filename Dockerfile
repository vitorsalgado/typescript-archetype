FROM node:8.10.0

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install --production

COPY . .

CMD npm start:docker
