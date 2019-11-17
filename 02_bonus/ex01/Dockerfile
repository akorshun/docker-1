FROM debian

LABEL maintainer="bsatou@student.21-school.ru"

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget default-jre

COPY server.properties /home/minecraft/server.properties

WORKDIR /home/minecraft

RUN wget https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar && \
    echo 'eula=true' > eula.txt

EXPOSE 25565

CMD java -Xmx1024M -Xms1024M -jar server.jar nogui