Ce script permet de sauvegarder un node Quilibrium, il suffit de fournir les valeurs au variables. Ensuite il va zip le backup et le transferé vers un drive google. 

Pré requis : 

Node Quilibrium
Compte Google (Plan gratuit pour particulier suffit) Suivre la doc afin de recupérer son token et autoriser la gestion du drive par API.

API Gdrive source : https://github.com/prasmussen/gdrive & https://github.com/glotlabs/gdrive

Amélioration : Possibilité de schedule avec crontab, definir en tant que service, automatisation de la gestion des backup dans le drive afin de gerer l'espace disponible du plan gratuit limité à 15Go, imuabilité
