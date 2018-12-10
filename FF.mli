(*
	Fonctions utilisées dans l'algo Ford-Fulkerson
*)

open Graph

(* Trouve un chemin dans le graphe
	et retourne la liste des sommets parcourus
	(ou None si aucun chemin trouvé)*)
val find_path: int graph -> id -> id -> id list option

(* Affiche un chemin *)
val affiche_chemin: id list option -> unit

(* Retourne le plus petit label sur un chemin
	ou -1 s'il n'y a pas de chemin *)
val min_label: int graph -> id list option -> int

(* Met à jour le graphe en retirant le flux voulu de tous les arcs *)
val update_graph: int graph -> id list option -> int -> int graph

(* Réalise l'algorithme de Ford Fulkerson *)
val ford_fulkerson: int graph -> id -> id -> int