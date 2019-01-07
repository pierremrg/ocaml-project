open Graph

type path = string

(* Reads a line with a node. *)
let read_ville graph line =
  try Scanf.sscanf line "Ville %s" (fun id -> add_node graph id)
  with e ->
    Printf.printf "Cannot read node in line - %s:\n%s\n" (Printexc.to_string e) line ;
    failwith "from_file"

(* Reads a line with an arc. *)
let read_route graph line pos =
  try Scanf.sscanf line "%s > %s %s" (fun id1 id2 label -> add_arc graph id1 id2 label)
  with e ->
    Printf.printf "Cannot read arc in line - %s:\n%s\n" (Printexc.to_string e) line ;
    failwith "from_file"

let read_carte_routiere path =

  let infile = open_in path in

  (* Read all lines until end of file. *)
  let rec loop graph =
    try
      let line = input_line infile in
      let graph2 =
        (* Ignore empty lines *)
        if (String.length line) <= 3 then graph
        else
          try
          	let pos = (String.index line '>') in
          		read_route graph line pos
          with
          	| Not_found ->  match (String.sub line 0 5) with
          										| "Ville" -> read_ville graph line
            									| _ -> graph
      in                 	
      loop graph2        
    with End_of_file -> graph
  in

  let final_graph = loop empty_graph in
  
  close_in infile ;
  final_graph