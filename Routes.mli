(*
	Le fichier contient les villes desservies
	ainsi que les trajets effectués par les camions
	(et ce qu'ils peuvent transporter)

	Exemple :
		Toulouse > Paris 50
		Toulouse > Lyon 20
		Paris > Lyon 30
	Ici : 
		- Un camion va de Toulouse à Paris et peut contenir 50 marchandises
		- Un autre va de Toulouse à Lyon et peut contenir 30 marchandises
		- Un dernier va de Paris à Lyon et peut contenir 20 marchandises

	Fonctions utiles pour calculer le total de marchandises pouvant être transporté
	
 *)
open Graph

type path = string

val read_carte_routiere: path -> string graph