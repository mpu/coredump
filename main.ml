(* Depends on: Parser *)

let main () =
  let _f = Parser.parse_file "<stdin>" stdin in
  ()

let () = main ()
