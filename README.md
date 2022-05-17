# docker-sae203

**Bold**Comment installer Docker ?

*Italic*Sur les machines de l'IUT

1. Saisissez la commande pour générer une clé                 : ssh-keygen -t ecdsa
2. Saisissez la commande pour copier la clé                   : cat .ssh/id_ecdsa.pub
3. Saisissez la commande pour aller sur le serveur di-docker  : ssh di-docker
4. Saisissez la commande                                      : mkdir -m 700 .ssh
5. Saisissez la commande pour éditer le fichier               : nano .ssh/authorized_keys
6. Éditez le fichier et collez la clé dans ce fichier
   **Bold**ATTENTION : Ne laissez pas de ligne vide dans le fichier
7. Dans un nouveau terminal, saisissez la commande            : ssh di-docker ls -la
8. Retournez sur le premier terminal et saisissez la commande : .ssh/known_hosts
9. Saisissez                                                  : yes
10. Saisissez la commande pour vérifier la version du serveur : docker --version

*Italic*Sur sa machine personnelle

1. Téléchargez Docker à partir de https://www.docker.com/get-started/
2. Lancez Docker et connectez-vous quand cela vous sera demandé
3. 
