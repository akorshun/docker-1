FROM debian

LABEL maintainer="bsatou@student.21-school.ru"

ENV TS3SERVER_LICENSE=accept

WORKDIR /home/teamspeak

EXPOSE 9987/udp 10011 30033

RUN apt update && \
    apt upgrade -y && \
    apt install -y wget bzip2 && \
    wget https://files.teamspeak-services.com/releases/server/3.10.0/teamspeak3-server_linux_amd64-3.10.0.tar.bz2 && \
    tar -xvf teamspeak3-server_linux_amd64-3.10.0.tar.bz2
WORKDIR /home/teamspeak/teamspeak3-server_linux_amd64
CMD sh ts3server_minimal_runscript.sh