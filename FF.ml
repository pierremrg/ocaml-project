open Graph
open Printf

let rec is_in_forbidden s = function
  | [] -> false
  | x::rest ->
	  if x = s then true
	  else is_in_forbidden s rest




let find_path g current dest =

	let rec prochain_atteint arc_s forbidden=
	  match arc_s with
	    | [] -> None
	    | (id_dest, 0)::rest -> prochain_atteint rest forbidden
	    | (id_dest, _)::rest -> if is_in_forbidden id_dest forbidden
	    			then prochain_atteint rest forbidden
	    			else Some (id_dest, rest)
	in

	let rec chemin l_arcs acu current =
	  match prochain_atteint l_arcs acu with
	    | None -> None
	    | Some (a, rest) -> if a = dest 
	                        then Some (List.rev (dest::current::acu))
	                        else match chemin (Graph.out_arcs g a) (current::acu) a with
	                              | None -> chemin rest acu current
	                              | Some a -> Some a

  in chemin (Graph.out_arcs g current) [] current




let min_label graph chemin =
  let rec loop_chemin acu = function
    | [] | _::[] -> acu
    | x::y::rest -> let label = Graph.find_arc graph x y in
                      match label with
                        | None -> failwith "Erreur (Chemin inexistant)"
                        | Some l -> loop_chemin (if l<acu || acu = -1 then l else acu) (y::rest)
  in
    match chemin with
      | None -> -1
      | Some c -> loop_chemin (-1) c




let rec affiche_chemin = function
    | None -> Printf.printf "Pas de chemin\n%!"
    | Some [] -> Printf.printf "end\n%!"
    | Some (x::rest) -> Printf.printf "%s\n%!" x; affiche_chemin (Some rest)




let update_graph graph chemin value =

	let rec loop g c =
		match c with
			| [] | _::[] -> g
			| x::y::rest -> let label = Graph.find_arc graph x y in
                      match label with
                        | None -> failwith "Erreur (Chemin inexistant)"
                        | Some l -> let label_inv = Graph.find_arc graph y x in
                                      match label_inv with 
                                        | None -> loop (Graph.add_arc (Graph.add_arc g x y (l-value)) y x value) (y::rest)
                                        | Some l_inv -> loop (Graph.add_arc (Graph.add_arc g x y (l-value)) y x (l_inv+value)) (y::rest)

  in match chemin with
      | None -> graph
      | Some c -> loop graph c





let ford_fulkerson graph x y =
  let rec loop acu g =
    let chemin = find_path g x y in
    match chemin with
      | None -> acu
      | Some c -> let flux_ajoute = min_label g (Some c) in
                    loop (acu + flux_ajoute) (update_graph g (Some c) flux_ajoute)


  in loop 0 graph