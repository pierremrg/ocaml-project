[1;2;3];;
1::2::3::[];;

(*



On suppose origine = 1
*)
let find_path g forbidden current dest =

  let rec is_in_forbidden s = function
    | [] -> false
    | x::rest ->
        if x = s then true
        else is_in_forbidden s rest
  in

  let add_in_forbidden f c -> c::f
  in

  (* arcs partant du noeud courant*)

  let rec loop_arcs dest_arcs =
    match dest_arcs with
      | [] -> add_in_forbidden forbidden current
      | (id_dest, _)::rest ->
          if id_dest = dest then dest
          else current::(loop_arcs rest)

  in
    loop_arcs (out_arcs g current)


;;

type path = id list;;

let rec is_in_forbidden s = function
  | [] -> false
  | x::rest ->
      if x = s then true
      else is_in_forbidden s rest;;



let find_path g current dest =

  let rec prochain_atteint arc_s forbidden=
    match arc_s with
      | [] -> None
      | (id_dest, _)::rest -> if is_in_forbidden id_dest forbidden then prochain_atteint rest forbidden else Some id_dest
  in


  let rec chemin acu current =
    match prochain_atteint (out_arcs g current) acu with
      | None -> None
      | Some a -> 
          if a = dest 
          then Some acu
          else chemin (current::acu) a



  in chemin [] current;;


