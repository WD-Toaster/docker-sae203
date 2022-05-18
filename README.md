# Comment installer Docker ?

## Machines de l'IUT

1. Saisissez la commande pour générer une clé : `ssh-keygen -t ecdsa`.
2. Saisissez la commande pour copier la clé : `cat .ssh/id_ecdsa.pub`.
3. Saisissez la commande pour aller sur le serveur di-docker : `ssh di-docker`.
4. Saisissez la commande : `mkdir -m 700 .ssh`.
5. Saisissez la commande pour éditer le fichier : `nano .ssh authorized_keys`.
6. Éditez le fichier et collez la clé dans ce fichier.
   **ATTENTION : Ne laissez pas de ligne vide dans le fichier**
7. Dans un nouveau terminal, saisissez la commande : `ssh di-docker ls -la`.
8. Retournez sur le premier terminal et saisissez la commande : `.ssh/known_hosts`.
9. Saisissez : *yes*.

## Machine personnelle

1. Téléchargez Docker en cliquant sur [ce lien](https://www.docker.com/get-started/).

### Windows

1. Installer le paquet WSL2 en téléchargeant [ce fichier](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi).

2. Mettre le paquet WSL2 par défaut (au lieu de WSL1) avec la commande `wsl --set-default-version 2`.

### Linux (Ubuntu)

1. Faire la commande `sudo apt-get update` pour mettre à jour les paquets actuelles

2. Faire `sudo apt-get install \ ca-certificates \ curl \ gnupg \ lsb-release` pour installer le *lsb-release*

3. Pour ajouter la clé CPG du Docker officiel: `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg`

4. Pour configurer le référentiel *stable* faire la commande suivante `echo \ "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \ $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`

5. Installer l'engine Docker avec la commande `sudo apt-get update` (Pour mettre à jour une derniere fois les paquets sur notre machine) puis `sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin` pour installer l'engine Docker.

## Pour vérifier si l'instalation est un succès

1. Premièrement vous pouvez faire la commande `docker --version`, vous devriez voir `Docker version 20.10.14, build a224086` (version actuelle), c'est la premier signe qui montre la bonne instalation de la machine Docker.

2. faire `docker run hello-world` et un message *Hello from Docker!* et les 4 étapes que Docker effectue a l'entrée de votre commande, si l'on traduit cela donne:
   1. Le client Docker contact le daemon Docker.
   2. Le daemon tire l'image "hello-world" du Hub Docker.
   3. Le daemon créer un nouveau conteneur de cette image qui démarre l'éxécutable qui produit une sortie que l'on lit actuellement.
   4. Le daemon stream cette sortie du client Docker, qui l'envoie au terminal.
