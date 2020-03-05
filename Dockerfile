FROM ubuntu:latest
USER root
WORKDIR /home/app
COPY ./package.json /home/app/package.json
RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get -y install nodejs
RUN npm install
RUN npm install -g mockserver
COPY . .
EXPOSE 3000
RUN chmod +x bootstart.sh
ENTRYPOINT ["/bin/bash", "bootstart.sh"]

