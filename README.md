# ocaml-project

## Création du fichier de données

Dans le fichier `graphe_routes` situé dans le dossier `routes`, écrire les villes sous la forme :

    Ville nom_de_la_ville
  
Ensuite, écrire les routes existantes avec la capacité maximum transportable sur chacune, sous la forme :

    ville_de_départ > ville_de_destination capacité

## Compilation

Compiler le programme :

> ocamlbuild ftest.byte

## Utilisation

Lancer le programme :

> ./ftest.byte "ville\_de\_départ" "ville\_de\_destination"

Le programme retourne la quantité maximale de marchandise (il peut s'agir d'un nombre d'éléments, d'un poids, etc.) transportable entre 2 villes, en l'utilisant l'algorithme de Ford-Fulkerson.

Ci-dessous, quelques exemples / tests unitaires :

> ./ftest.byte "Toulouse" "Fenouillet"
> Flux maximum : 100
>
> ./ftest.byte "Toulouse" "Paris"
> Flux maximum : 60
>
> ./ftest.byte "Paris" "Rouffiac"
> Flux maximum : 0
>
> ./ftest.byte "Paris" "Lyon"
> Flux maximum : 30
