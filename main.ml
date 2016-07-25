(* Depends on: Parser *)

let main () =
  match Parser.parse_file "<stdin>" stdin with
  | None -> exit 1
  | Some _f -> ()

let () = main ()
