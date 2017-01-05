FROM node:latest

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN npm install -g bower
RUN npm install -g grunt-cli

COPY package.json /usr/src/app/
COPY . /usr/src/app

EXPOSE 8082

CMD ["sh", "-c", "bower install --allow-root && grunt dev"]
