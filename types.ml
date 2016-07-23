module Lang = struct

  type binop =
    | BOadd | BOsub | BOmul | BOdiv | BOrem
    | BOand | BOor | BOxor

  type expr =
    | Etrue | Efalse
    | Evar of string
    | Enum of int
    | Ebinop of (expr * binop * expr)

  type typ =
    | Tvoid
    | Tbool
    | Tint of bool  (* signed or not *)
    | Tlong of bool (* signed or not *)
    | Tapp of string * string option * typ list

  type lval = string

  type scope = stmt list
  and stmt =
    | Sempty
    | Sassign of lval * expr

  type func_decl =
    { f_name: string; f_type_args: string list
    ; f_value_args: (string * typ) list ; f_ret_type: typ
    ; f_body: scope }

  type type_decl =
    { t_name: string; t_type_args: string list
    ; t_states: string list; t_state_top: string
    ; t_state_bot: string }

  type decl =
    | Dfunction of func_decl
    | Dtype of type_decl

end
