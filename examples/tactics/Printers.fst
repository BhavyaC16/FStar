module Printers

open FStar.Tactics
module TD = FStar.Tactics.Derived

#set-options "--use_two_phase_tc false"

let print_Prims_string : string -> Tot string = fun s -> "\"" ^ s ^ "\""
let print_Prims_int : int -> Tot string = string_of_int

let rec mk_concat (sep : term) (ts : list term) : term =
    mk_e_app (pack (Tv_FVar (pack_fv ["FStar"; "String"; "concat"]))) [sep; mk_list ts]

let mk_flatten = mk_concat (pack (Tv_Const (C_String "")))

let paren (e : term) : term =
    mk_flatten [mk_stringlit "("; e; mk_stringlit ")"]

let mk_print_bv (self : name) (f : term) (bv : bv) : Tac term =
    (* print ("self = " ^ String.concat "." self ^ "\n>>>>>> f = : " ^ term_to_string f); *)
    let mk n = pack (Tv_FVar (pack_fv n)) in
    match inspect (type_of_bv bv) with
    | Tv_FVar fv ->
        if inspect_fv fv = self
        then mk_e_app f [pack (Tv_Var bv)]
        else let f = mk ["Printers"; "print_" ^ (String.concat "_" (inspect_fv fv))] in
             mk_e_app f [pack (Tv_Var bv)]
    | _ ->
        mk_stringlit "?"

(* This tactics generates the entire let rec at once and
 * then uses exact. We could do something better. *)
let printer_fun () : Tac unit =
    admit ();
    set_guard_policy SMT;
    let ty = cur_goal () in
    let e = cur_env () in
    let dom =
        match inspect ty with
        | Tv_Arrow b c -> type_of_binder b
        | _ -> fail "printer_fun called on bad goal"
    in
    (* Recursive binding *)
    let ff = fresh_bv_named "ff_rec" ty in
    let fftm = pack (Tv_Var ff) in

    let x = fresh_binder_named "v" dom in
    let xt_ns = match inspect dom with
                | Tv_FVar fv -> (inspect_fv fv)
                | _ -> fail "not a qname type?"
    in
    let se = match lookup_typ e xt_ns with
             | None -> fail "Type not found..?"
             | Some se -> se
    in

    match inspect_sigelt se with
    | Sg_Let _ _ _ _ -> fail "cannot create printer for let"
    | Sg_Inductive _ bs t ctors ->
        let br1 ctor : Tac branch =
            let se = match lookup_typ e ctor with
                     | None -> fail "Constructor not found..?"
                     | Some se -> se
            in
            begin match inspect_sigelt se with
            | Sg_Constructor name t ->
            let pn = String.concat "." name in
            let t_args, _ = collect_arr t in
            let bv_pats = TD.map (fun ti -> let bv = fresh_bv_named "a" ti in (bv, Pat_Var bv)) t_args in
            let bvs, pats = List.Tot.split bv_pats in
            let head = pack (Tv_Const (C_String pn)) in
            let bod = mk_concat (mk_stringlit " ") (head :: TD.map (mk_print_bv xt_ns fftm) bvs) in
            let bod = match t_args with | [] -> bod | _ -> paren bod in
            (Pat_Cons (pack_fv name) pats, bod)
            | _ ->
                fail "Not a constructor..?"
            end
        in
        let branches = TD.map br1 ctors in
        let xi = fresh_binder_named "v_inner" dom in

        // Generate the match on the internal argument
        let m = pack (Tv_Match (pack (Tv_Var (bv_of_binder xi))) branches) in
        (* print ("m = " ^ term_to_string m); *)

        // Wrap it into an internal function
        let f = pack (Tv_Abs xi m) in
        (* print ("f = " ^ term_to_string f); *)

        // Wrap it in a let rec; basically:
        // let rec ff = fun t -> match t with { .... } in ff x
        let xtm = pack (Tv_Var (bv_of_binder x)) in
        let b = pack (Tv_Let true ff f (mk_e_app fftm [xtm])) in
        (* print ("b = " ^ term_to_string b); *)

        // Wrap it in a lambda taking the initial argument
        let tm = pack (Tv_Abs x b) in
        (* print ("tm = " ^ term_to_string tm); *)

        exact tm
    | _ -> fail "type not found?"

noeq
type t1 =
    | A : int -> string -> t1
    | B : t1 -> int -> t1
    | C : t1
    | D : string -> t1
    | E : t1 -> t1
    | F : (unit -> t1) -> t1

let t1_print : t1 -> string = synth_by_tactic printer_fun

let _ = assert_norm (t1_print (A 5 "hey") = "(Printers.A 5 \"hey\")")
let _ = assert_norm (t1_print (B (D "thing") 42) = "(Printers.B (Printers.D \"thing\") 42)")
let _ = assert_norm (t1_print C = "Printers.C")
let _ = assert_norm (t1_print (D "test") = "(Printers.D \"test\")")
let _ = assert_norm (t1_print (E (B (D "thing") 42)) = "(Printers.E (Printers.B (Printers.D \"thing\") 42))")
let _ = assert_norm (t1_print (F (fun _ -> C)) = "(Printers.F ?)")
