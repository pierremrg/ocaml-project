open Graph

let () =

  

  let rec is_in_forbidden s = function
  | [] -> false
  | x::rest ->
  if x = s then true
  else is_in_forbidden s rest in



  let find_path g current dest =

  let rec prochain_atteint arc_s forbidden=
    let rec affiche_arcs = function
      | [] -> ()
      | (id_dest, _)::rest-> Printf.printf "%s/%!" id_dest; affiche_arcs rest in

    affiche_arcs arc_s;
  match arc_s with
  | [] -> None
  | (id_dest, _)::rest -> if is_in_forbidden id_dest forbidden then prochain_atteint rest forbidden else Some id_dest
  in


  let rec chemin acu current =
    Printf.printf "current : %s\n%!" current;
  match prochain_atteint (out_arcs g current) acu with
  | None -> None
  | Some a -> 
  if a = dest 
  then Some (List.rev (dest::current::acu))
  else chemin (current::acu) a

  in chemin [] current in

  (*let g = Gfile.from_file "graph1" in*)
  (*Gfile.export "graph1_dot.txt" g;*)

  

  (*if Array.length Sys.argv <> 5 then
    begin
      Printf.printf "\nUsage: %s infile source sink outfile\n\n%!" Sys.argv.(0) ;
      exit 0
    end ;

  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)
  
  (* These command-line arguments are not used for the moment. *)
  and _source = Sys.argv.(2)
  and _sink = Sys.argv.(3)
  in*)

  (* Open file *)
  let infile = "graph1" in
  let graph = Gfile.from_file infile in

  let chemin = find_path graph "3" "1" in

  let rec affiche_chemin = function
    | None -> Printf.printf "Pas de chemin\n%!"
    | Some [] -> Printf.printf "end\n%!"
    | Some (x::rest) -> Printf.printf "%s\n%!" x; affiche_chemin (Some rest) in

  affiche_chemin chemin;

  (* Rewrite the graph that has been read. *)
  (*let () = Gfile.write_file outfile graph in*)

  ()


