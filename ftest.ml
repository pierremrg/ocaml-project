open Graph
open FF
open Routes

let () =


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
  let infile = "graphe_routes" in
  let graph = Graph.map (Routes.read_carte_routiere infile) int_of_string in

  Gfile.export "test_routes.txt" (Graph.map graph string_of_int);

  let flux_max = FF.ford_fulkerson graph Sys.argv.(1) Sys.argv.(2) in

  let () = (Printf.printf "Flux maximum : %d\n%!" flux_max) in

  (*let chemin = FF.find_path graph Sys.argv.(1) Sys.argv.(2) in

  FF.affiche_chemin chemin;

  let min = FF.min_label graph chemin in
  let () = (Printf.printf "Minimum : %d\n%!" min) in

  let g = FF.update_graph graph chemin min in

  Gfile.export "result.txt" (Graph.map g string_of_int);*)

  (* Rewrite the graph that has been read. *)
  (*let () = Gfile.write_file outfile graph in*)

  ()


