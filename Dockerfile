FROM ubuntu:latest

LABEL maintainer="umit.haciyusufoglu@gmail.com"

RUN apt-get update && apt-get upgrade -y
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install zip bash tar unzip lib32z1 libncursesw5 screen htop wget -y

RUN apt-get install inotify-tools -y
RUN apt-get install zlib1g:i386 -y
RUN apt-get install lib32stdc++6 -y

COPY compile.sh /app
COPY luac_mta /app
RUN chmod -R +x /app

ENTRYPOINT [ "/app/compile.sh" ]