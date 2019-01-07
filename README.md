# ocaml-project

## Création du fichier de données

Dans le fichier graphe_routes situé dans le dossier routes, écrire les villes sous la forme :

    Ville nom_de_la_ville
  
Ensuite, écrire les routes existantes avec la capacité maximum transportable sur chacune, sous la forme :

    ville_de_départ > ville_de_destination capacité

## Compilation

Compiler le programme :

> ocamlbuild ftest.byte

## Utilisation

Lancer le programme :

> ./ftest.bytes "ville\_de\_départ" "ville\_de\_destination"

Le programme retourne la capacité maximale de marchandise transportable entre 2 villes.
