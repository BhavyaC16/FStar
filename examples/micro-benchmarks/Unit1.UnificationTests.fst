module Unit1.UnificationTests
assume type t : int -> Type
assume val f: int -> Tot int
assume val g: #x:int -> t (f x) -> Tot unit
let h1 (x: t (f 0)) = g x
let h2 (x: t ((fun x -> f (x - 1)) 1)) = g x

(****** test for unfolding of delta equational symbols begin ******)

type some_enum =
  | X
  | Y

let t_indexed (x:some_enum) =
  match x with
  | X -> nat
  | Y -> int

let t_inst_index = t_indexed X

assume val f_with_implicit (#x:some_enum) (u:t_indexed x) (v:t_indexed x) :t_indexed x

let g_calls_f (u v:t_inst_index) = f_with_implicit u v  //the implicit here is inferred by unfolding t_inst_index, which is delta_equational with some depth (2, i think)

(****** test for unfolding of delta equational symbols end ******)

