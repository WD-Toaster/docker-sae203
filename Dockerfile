FROM debian:latest

RUN cd home && mkdir video && mkdir image && mkdir musique
COPY ./video/ /home/video/
COPY ./images/ /home/image/
COPY ./musique/ /home/musique/

RUN apt update && apt upgrade -y

RUN apt install apt-transport-https ca-certificates gnupg2 curl git -y

RUN apt install wget -y
RUN wget -O- https://repo.jellyfin.org/jellyfin_team.gpg.key | gpg --dearmor | tee /usr/share/keyrings/jellyfin.gpg

RUN echo "deb [arch=$( dpkg --print-architecture ) signed-by=/usr/share/keyrings/jellyfin.gpg] https://repo.jellyfin.org/debian bullseye main" | tee /etc/apt/sources.list.d/jellyfin.list

RUN apt update -y && apt install jellyfin -y 

RUN apt install systemctl -y
CMD [ "systemctl", "start", "jellyfin" ]

EXPOSE 8096
