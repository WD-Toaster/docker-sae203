# SAE 2.03 - Instalation de service réseau

Nous allons faire un compte rendu de cette SAE sur cette page gitgub, cela permettra d'expliqué le déroulement des étapes que l'on as fait. Bonjour
## Participants:
- Codrin Potdevin
- Quentin Spilmont
- Hugo Tassery 

## Mardi 10 Mai
Nous avons fait le TP4 et TP5 de l'introduction a GIT. C'était les derniers à ce propos.
Le TP4 consiste à résoudre un conflit dans la modification d'un fichier et le TP5 présente la création de page internet à partir d'un référentiel Github.

## Lundi 16 Mai
### TP1
Nous avons installé et configurer Docker sur nos machines.
Pour vérifier si le engine fonctionner correctement on a utilisé la commande `docker --version` pour vérifier la version installé (Version 20.10.14). Puis la commande `docker run hello-world` pour lancer notre premier conteneur Docker, un message ses affichée pour montrer les différentes étapes que Docker fait à partir de l'éxécution de la commande, si l'on traduit cela donne approximativement:

1. Le client Docker contacte le daemon Docker.
2. Le deamon Docker récupere l'image "hello-world" du *Docker Hub*.
3. Le daemon Docker créer un nouveau conteneur de cette image qui démarre l'executable produisant la sortie que vous êtes en train de lire actuellement.
4. Le deamon Docker stream cette sortie au client Docker qui l'envoie au terminal.

Ensuite on à vu les commande suivantes:
- `docker ps` affiche la liste des conteneurs actifs en cours d'éxécution sur notre machine.
- `docker ps -a` affiche tout les conteneurs actifs ou arrêtés sur notre machine.
- `docker images` affiche toutes les images que l'on as téléchargés sur notre machine.

La prochaine étape du TP1 est l'instalation des images Alpine et httpd via les commandes suivantes:
- `docker pull alpine` C'est une version de linux très légère
- `docker pull httpd` C'est une image linux avec un serveur apache déjà configuré et prêt à être utilisé

#### L'interactivité sur les conteneurs
Pour intéragir avec les conteneurs il suffit d'utiliser la commande d'ajouter `-it` a la commande, cela donne avec l'image *alpine* `docker run -it alpine`. On est maintenant dans l'image alpine dorénavant. La preuve, en utilisant dans l'image la commande `cat /etc/os-release` ce qui nous donne:

```NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.15.4
PRETTY_NAME="Alpine Linux v3.15"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://bugs.alpinelinux.org/"
```

En utilisant la commande `docker ps` dans un autre terminal on peut voir que l'image alpine est active depuis X minutes et sur quelle commande. On peut intéragir avec lui malgré qu'il est ouvert avec `docker exec -it <Nom du conteneur> /bin/sh`
![Image](/images/dockerPS.png)

### TP2

## Mardi 17 Mai


## Mercredi 18 Mai

### Markdown


```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```