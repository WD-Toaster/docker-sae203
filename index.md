# SAE 2.03 - Instalation de service réseau

Nous avons décidé de faire le projet de vidéo à la demande. Cela consiste à installer dans un conteneur sous débian un serveur média permettant de lire du média (Film, vidéo, musique, photo, etc).

## Participants

- Codrin Potdevin
- Quentin Spilmont
- Hugo Tassery

## Le serveur média

Pour ce sujet de VOD on a utilisé la suggestion du professeur Juan qui à proposé [Jellyfin](https://jellyfin.org/) dans l'un de ses e-mails. Ainsi, on a suivi ce [tutoriel d'instalation](https://www.linuxcapable.com/how-to-install-jellyfin-media-server-on-debian-11/) dans un conteneur debian localement (en utilisant la commande `docker run -it debian`).
Une fois cela fait nous l'avons retransmis dans un Dockerfile qui ressemble à cela:

```DOCKERFILE
FROM debian:latest

RUN cd home && mkdir video && mkdir image && mkdir musique
COPY ./video/ /home/video/
COPY ./image/ /home/image/
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
```

Les premières lignes ne sont que pour Copier des fichiers localement sur le conteneur débian. Les autres lignes ne sont que l'installation de Jellyfin sur Debian et le `EXPOSE` est pour exposer le port qu'utilise Jellyfin.

## Test

Une fois le docker file rempli on l'a construit avec `docker build -t jellyfin .` (Cela ne s'est pas fait du premier coup, voir partie *troubleshooting*), et on l'a démarré avec un `docker run --name jellyfin-test -p 8096:8096 jellyfin`.
`--name` pour renommer le fichier avec le nom que l'on souhaite, `-p 8096:8096` car jellyfin fonctionne sur le port 8096, et on précise que c'est l'image *jellyfin* que l'on veut lancer.

## Procédure de lancement

1. Faire un `docker run --name jellyfin-test -p 8096:8096 jellyfin` pour démarrer un conteneur avec l'image de jellyfin.
2. Se rendre sur son navigateur et aller soit sur `localhost:8096` ou soit sur `http://127.0.0.1:8096`.
3. Logiquement suffit juste de créer des bibliothèque de média et *"la base"* est la.

## Troubleshooting

- Au tout début, le dockerfile ressemblait à cela:

```DOCKERFILE
FROM debian:latest

RUN cd home && mkdir video && mkdir image && mkdir musique
COPY ./video/ /home/video/
COPY ./image/ /home/image/
COPY ./musique/ /home/musique/

RUN apt update && apt upgrade -y

RUN apt install apt-transport-https ca-certificates gnupg2 curl git -y

RUN apt install wget -y
RUN wget -O- https://repo.jellyfin.org/jellyfin_team.gpg.key | gpg --dearmor | tee /usr/share/keyrings/jellyfin.gpg

RUN echo "deb [arch=$( dpkg --print-architecture ) signed-by=/usr/share/keyrings/jellyfin.gpg] https://repo.jellyfin.org/debian bullseye main" | tee /etc/apt/sources.list.d/jellyfin.list

RUN apt update -y && apt install jellyfin -y 

RUN apt install systemctl -y
RUN systemctl start jellyfin

EXPOSE 8096
```

Cependant le fichier se lançait uniquement via l'interface graphique de Docker (autrement avec un `docker run` il se lançait puis se fermait directement avec un *exit(0)*, Nous pouvions lui donner la commande manquante `systemctl start jellyfin` via le *CLI* (Command-Line Interface). 
Il a fallut que je remplace le `RUN systemctl start jellyfin` par `CMD [ "systemctl", "start", "jellyfin" ]` pour que le programme se lance en premier plan (et pas arrière plan) et le conteneur tournait en continue sans soucis.
