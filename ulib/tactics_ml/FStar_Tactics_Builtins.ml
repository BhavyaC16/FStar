open Prims
open FStar_Tactics_Result
open FStar_Tactics_Types
open FStar_Tactics_Effect
module N = FStar_TypeChecker_Normalize
module E = FStar_Tactics_Effect
module B = FStar_Tactics_Basic
module RT = FStar_Reflection_Types
module EMB = FStar_Syntax_Embeddings

(* GM: most indirections here are super annoying, and seem to
 * be unneeded. Can we take them out? *)

let interpret_tac (t: 'a B.tac) (ps: proofstate): 'a __result =
  B.run t ps

let uninterpret_tac (t: 'a __tac) (ps: proofstate): 'a __result =
  t ps

let tr_repr_steps =
    let tr1 = function
              | Simpl         -> EMB.Simpl
              | Weak          -> EMB.Weak
              | HNF           -> EMB.HNF
              | Primops       -> EMB.Primops
              | Delta         -> EMB.Delta
              | Zeta          -> EMB.Zeta
              | Iota          -> EMB.Iota
              | UnfoldOnly ss -> EMB.UnfoldOnly ss
    in List.map tr1

let to_tac_0 (t: 'a __tac): 'a B.tac =
  (fun (ps: proofstate) ->
    uninterpret_tac t ps) |> B.mk_tac

let from_tac_0 (t: 'a B.tac): 'a __tac =
  fun (ps: proofstate) ->
    interpret_tac t ps

let from_tac_1 (t: 'a -> 'b B.tac): 'a  -> 'b __tac =
  fun (x: 'a) ->
    fun (ps: proofstate) ->
      let m = t x in
      interpret_tac m ps

let from_tac_2 (t: 'a -> 'b -> 'c B.tac): 'a  -> 'b -> 'c __tac =
  fun (x: 'a) ->
    fun (y: 'b) ->
      fun (ps: proofstate) ->
        let m = t x y in
        interpret_tac m ps

let from_tac_3 (t: 'a -> 'b -> 'c -> 'd B.tac): 'a  -> 'b -> 'c -> 'd __tac =
  fun (x: 'a) ->
    fun (y: 'b) ->
      fun (z: 'c) ->
        fun (ps: proofstate) ->
          let m = t x y z in
          interpret_tac m ps

let __fail (msg : string) : 'a __tac = from_tac_1 B.fail msg
let fail: string -> 'a __tac = fun msg -> __fail msg

let __top_env: RT.env __tac = from_tac_0 B.top_env
let top_env: unit -> RT.env __tac = fun () -> __top_env

let __cur_env: RT.env __tac = from_tac_0 B.cur_env
let cur_env: unit -> RT.env __tac = fun () -> __cur_env

let __cur_goal: RT.term __tac = from_tac_0 B.cur_goal'
let cur_goal: unit -> RT.term __tac = fun () -> __cur_goal

let __cur_witness: RT.term __tac = from_tac_0 B.cur_witness
let cur_witness: unit -> RT.term __tac = fun () -> __cur_witness

let __is_guard: bool __tac = from_tac_0 B.is_guard
let is_guard: unit -> bool __tac = fun () -> __is_guard

let __refine_intro : unit __tac = from_tac_0 B.refine_intro
let refine_intro: unit -> unit __tac = fun () -> __refine_intro

let __tc (t: RT.term) : RT.term __tac = from_tac_1 B.tc t
let tc: RT.term -> RT.term __tac = fun t -> __tc t

let __unshelve (t:RT.term) : unit __tac = from_tac_1 B.unshelve t
let unshelve : RT.term -> unit __tac = fun t -> __unshelve t

let unquote : RT.term -> 'a __tac = fun tm ->
        failwith "Sorry, unquote does not work in compiled tactics"

let __trytac (t: 'a __tac): ('a option) __tac = from_tac_1 B.trytac (to_tac_0 t)
let trytac: (unit -> 'a __tac) -> ('a option) __tac = fun t -> __trytac (E.reify_tactic t)

let __trivial: unit __tac = from_tac_0 B.trivial
let trivial: unit -> unit __tac = fun () -> __trivial

let __norm (s: norm_step list): unit __tac = from_tac_1 B.norm (tr_repr_steps s)
let norm: norm_step list -> unit __tac = fun s -> __norm s

let __norm_term_env (e:RT.env) (s: norm_step list) (t: RT.term) : RT.term __tac = from_tac_3 B.norm_term_env e (tr_repr_steps s) t
let norm_term_env: RT.env -> norm_step list -> RT.term -> RT.term __tac = fun e s t -> __norm_term_env e s t

let __norm_binder_type (s: norm_step list) (b: RT.binder) : unit __tac = from_tac_2 B.norm_binder_type (tr_repr_steps s) b
let norm_binder_type : norm_step list -> RT.binder -> unit __tac = fun s b -> __norm_binder_type s b

let __intro: RT.binder __tac = from_tac_0 B.intro
let intro: unit -> RT.binder __tac = fun () -> __intro

let __intro_rec: (RT.binder * RT.binder) __tac = from_tac_0 B.intro_rec
let intro_rec: unit -> (RT.binder * RT.binder) __tac = fun () -> __intro_rec

let __rename_to (b: RT.binder) (nm : string) : unit __tac = from_tac_2 B.rename_to b nm
let rename_to: RT.binder -> string -> unit __tac = fun b s -> __rename_to b s

let __revert: unit __tac = from_tac_0 B.revert
let revert: unit -> unit __tac = fun () -> __revert

let __binder_retype (b: RT.binder) : unit __tac = from_tac_1 B.binder_retype b
let binder_retype: RT.binder -> unit __tac = fun b -> __binder_retype b

let __clear_top: unit __tac = from_tac_0 B.clear_top
let clear_top: unit -> unit __tac = fun () -> __clear_top

let __clear (h: RT.binder) : unit __tac = from_tac_1 B.clear h
let clear: RT.binder -> unit __tac = fun b -> __clear b

let __rewrite (h: RT.binder): unit __tac = from_tac_1 B.rewrite h
let rewrite: RT.binder -> unit __tac = fun b  -> __rewrite b

let __smt: unit __tac = from_tac_0 B.smt
let smt: unit -> unit __tac = fun () -> __smt

let __divide (n:int) (f: 'a __tac) (g: 'b __tac): ('a * 'b) __tac = from_tac_3 B.divide n (to_tac_0 f) (to_tac_0 g)
let divide: int -> (unit -> 'a __tac) -> (unit -> 'b __tac) -> ('a * 'b) __tac =
    fun n f g -> __divide n (f ()) (g ())

let __seq (t1: unit __tac) (t2: unit __tac): unit __tac = from_tac_2 B.seq (to_tac_0 t1) (to_tac_0 t2)
let seq: (unit -> unit __tac) -> (unit -> unit __tac) -> unit __tac =
    fun f -> fun g -> __seq (f ()) (g ())

let __t_exact b1 (t: RT.term): unit __tac = from_tac_2 B.t_exact b1 t
let t_exact: bool -> RT.term -> unit __tac = __t_exact

let __apply (t: RT.term): unit __tac = from_tac_1 (B.apply true) t
let apply: RT.term -> unit __tac = __apply

let __apply_raw (t: RT.term): unit __tac = from_tac_1 (B.apply false) t
let apply_raw: RT.term -> unit __tac = __apply_raw

let __apply_lemma (t: RT.term): unit __tac = from_tac_1 B.apply_lemma t
let apply_lemma: RT.term -> unit __tac = __apply_lemma

let __print (s: string): unit __tac = from_tac_1 (fun x -> B.ret (B.tacprint x)) s
let print: string -> unit __tac = fun s -> __print s

let __dump (s: string): unit __tac = from_tac_1 (B.print_proof_state) s
let dump: string -> unit __tac = fun s -> __dump s

let __dump1 (s: string): unit __tac = from_tac_1 (B.print_proof_state1) s
let dump1: string -> unit __tac = fun s -> __dump1 s

let __trefl: unit __tac = from_tac_0 B.trefl
let trefl: unit -> unit __tac = fun () -> __trefl

let __pointwise (d : direction) (t: unit __tac): unit __tac = from_tac_2 B.pointwise d (to_tac_0 t)
let pointwise:  (unit -> unit __tac) -> unit __tac = fun tau -> __pointwise BottomUp (E.reify_tactic tau)
let pointwise': (unit -> unit __tac) -> unit __tac = fun tau -> __pointwise TopDown  (E.reify_tactic tau)

let __later: unit __tac = from_tac_0 B.later
let later: unit -> unit __tac = fun () -> __later

let __dup: unit __tac = from_tac_0 B.dup
let dup: unit -> unit __tac = fun () -> __dup

let __flip: unit __tac = from_tac_0 B.flip
let flip: unit -> unit __tac = fun () -> __flip

let __qed: unit __tac = from_tac_0 B.qed
let qed: unit -> unit __tac = fun () ->__qed

let __prune (s: string): unit __tac = from_tac_1 B.prune s
let prune: string -> unit __tac = fun ns  -> __prune ns

let __addns (s: string): unit __tac = from_tac_1 B.addns s
let addns: string -> unit __tac = fun ns  -> __addns ns

let __cases (t: RT.term): (RT.term * RT.term) __tac = from_tac_1 B.cases t
let cases: RT.term -> (RT.term * RT.term) __tac = fun t  -> __cases t

let __set_options (s: string) : unit __tac = from_tac_1 B.set_options s
let set_options : string -> unit __tac = fun s -> __set_options s

let __uvar_env (e : RT.env) (o : RT.term option) : RT.term __tac = from_tac_2 B.uvar_env e o
let uvar_env : RT.env -> RT.term option -> RT.term __tac = fun e o -> __uvar_env e o

let __unify (t1 : RT.term) (t2 : RT.term) : bool __tac = from_tac_2 B.unify t1 t2
let unify : RT.term -> RT.term -> bool __tac = fun t1 t2 -> __unify t1 t2

let __launch_process (prog : string) (args : string) (input : string) : string __tac = from_tac_3 B.launch_process prog args input
let launch_process : string -> string -> string -> string __tac = fun prog args input -> __launch_process prog args input

let __fresh_bv_named (nm : string) (ty : RT.term) : RT.bv __tac = from_tac_2 B.fresh_bv_named nm ty
let fresh_bv_named : string -> RT.term -> RT.bv __tac = fun nm ty -> __fresh_bv_named nm ty

let __change (ty : RT.typ) : unit __tac = from_tac_1 B.change ty
let change : RT.typ -> unit __tac = fun ty -> __change ty

let __get_guard_policy : guard_policy __tac = from_tac_0 B.get_guard_policy
let get_guard_policy : unit -> guard_policy __tac = fun () -> __get_guard_policy

let __set_guard_policy : guard_policy -> unit __tac = from_tac_1 B.set_guard_policy
let set_guard_policy : guard_policy -> unit __tac = __set_guard_policy
