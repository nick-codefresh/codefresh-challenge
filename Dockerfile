FROM node:latest

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN npm install -g bower
RUN npm install -g grunt-cli

RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u73-b02/jre-8u73-linux-x64.tar.gz
RUN mkdir /opt/jre
RUN tar zxvf jre-8u73-linux-x64.tar.gz -C /opt/jre/
RUN update-alternatives --install "/usr/bin/java" "java" "/opt/jre/jre1.8.0_73/bin/java" 1
RUN update-alternatives --set java /opt/jre/jre1.8.0_73/bin/java

COPY package.json /usr/src/app/
RUN npm install
COPY . /usr/src/app

EXPOSE 8082

CMD ["sh", "-c", "bower install --allow-root && grunt dev"]
