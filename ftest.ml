open Graph
open FF
open Routes

let () =

  (* Open file *)
  let infile = "routes/graphe_routes" in

  let graph = Graph.map (Routes.read_carte_routiere infile) int_of_string in

  (* Génère un fichier txt au format DOT *)
  Gfile.export "routes/test_routes.txt" (Graph.map graph string_of_int);

  (* Obtient le flux maximum avec l'algorithme de Ford Fulkerson *)
  let flux_max = FF.ford_fulkerson graph Sys.argv.(1) Sys.argv.(2) in

  let () = (Printf.printf "Flux maximum : %d\n%!" flux_max) in

  ()
