module LowStar.ModifiesPat
include LowStar.Modifies

module HS = FStar.HyperStack
module HST = FStar.HyperStack.ST
module B = LowStar.Buffer


let loc_disjoint_union_r'
  (s s1 s2: loc)
: Lemma
  (ensures (loc_disjoint s (loc_union s1 s2) <==> (loc_disjoint s s1 /\ loc_disjoint s s2)))
  [SMTPat (loc_disjoint s (loc_union s1 s2))]
= Classical.move_requires (loc_disjoint_union_r s s1) s2;
  loc_includes_union_l s1 s2 s1;
  loc_includes_union_l s1 s2 s2;
  Classical.move_requires (loc_disjoint_includes s (loc_union s1 s2) s) s1;
  Classical.move_requires (loc_disjoint_includes s (loc_union s1 s2) s) s2


(* Patterns on modifies clauses *)

abstract
let modifies_left (l: loc) (h1 h2: HS.mem) : GTot Type0 =
  modifies l h1 h2

inline_for_extraction
let modifies_left_intro () : HST.Stack unit
  (requires (fun h -> True))
  (ensures (fun h _ h' -> h' == h /\ modifies_left loc_none h h))
= let h = HST.get () in
  modifies_refl loc_none h

let modifies_trans'
  (s12: loc)
  (h1 h2: HS.mem)
  (s23: loc)
  (h3: HS.mem)
: Lemma
  (requires (modifies_left s12 h1 h2 /\ modifies s23 h2 h3))
  (ensures (modifies_left (loc_union s12 s23) h1 h3))
  [SMTPat (modifies_left s12 h1 h2); SMTPat (modifies s23 h2 h3)]
= modifies_trans s12 h1 h2 s23 h3

let modifies_loc_includes'
  (s1: loc)
  (h h': HS.mem)
  (s2: loc)
: Lemma
  (requires (modifies_left s2 h h' /\ loc_includes s1 s2))
  (ensures (modifies s1 h h'))
  [SMTPat (modifies s1 h h'); SMTPat (modifies_left s2 h h')]
= modifies_loc_includes s1 h h' s2

let no_upd_fresh_region'
  (r:HS.rid)
  (l:loc)
  (h0:HS.mem)
  (h1:HS.mem)
: Lemma
  (requires (HS.fresh_region r h0 h1 /\ modifies (loc_union (loc_all_regions_from false r) l) h0 h1))
  (ensures  (modifies l h0 h1))
  [SMTPat (HS.fresh_region r h0 h1); SMTPat (modifies l h0 h1)]
= no_upd_fresh_region r l h0 h1

let modifies_fresh_frame_popped'
  (h0 h1: HS.mem)
  (s: loc)
  (h2 h3: HS.mem)
: Lemma
  (requires (
    HS.fresh_frame h0 h1 /\
    modifies (loc_union (loc_all_regions_from false (HS.get_tip h1)) s) h1 h2 /\
    (HS.get_tip h2) == (HS.get_tip h1) /\
    HS.popped h2 h3
  ))
  (ensures (
    modifies s h0 h3 /\
    (HS.get_tip h3) == HS.get_tip h0
  ))
  [SMTPat (HS.fresh_frame h0 h1); SMTPat (HS.popped h2 h3); SMTPat (modifies s h0 h3)]
= modifies_fresh_frame_popped h0 h1 s h2 h3

(* Duplicate the modifies clause to cope with cases that must not be used with transitivity *)

abstract
let modifies_inert
  (s: loc)
  (h1 h2: HS.mem)
: GTot Type0
= modifies s h1 h2

abstract
let modifies_inert_intro
  (s: loc)
  (h1 h2: HS.mem)
: Lemma
  (requires (modifies s h1 h2))
  (ensures (modifies_inert s h1 h2))
  [SMTPat (modifies s h1 h2)]
= ()

abstract
let modifies_left_inert
  (s: loc)
  (h1 h2: HS.mem)
: Lemma
  (requires (modifies_left s h1 h2))
  (ensures (modifies_inert s h1 h2))
  [SMTPat (modifies_left s h1 h2)]
= ()

let modifies_inert_live_region
  (s: loc)
  (h1 h2: HS.mem)
  (r: HS.rid)
: Lemma
  (requires (modifies_inert s h1 h2 /\ loc_disjoint s (loc_region_only false r) /\ HS.live_region h1 r))
  (ensures (HS.live_region h2 r))
  [SMTPatOr [
    [SMTPat (modifies_inert s h1 h2); SMTPat (HS.live_region h1 r)];
    [SMTPat (modifies_inert s h1 h2); SMTPat (HS.live_region h2 r)];
  ]]
= modifies_live_region s h1 h2 r

let modifies_inert_mreference_elim
  (#t: Type)
  (#pre: Preorder.preorder t)
  (b: HS.mreference t pre)
  (p: loc)
  (h h': HS.mem)
: Lemma
  (requires (
    loc_disjoint (loc_mreference b) p /\
    HS.contains h b /\
    modifies_inert p h h'
  ))
  (ensures (
    HS.contains h' b /\
    HS.sel h b == HS.sel h' b
  ))
  [SMTPatOr [
    [ SMTPat (modifies_inert p h h'); SMTPat (HS.sel h b) ] ;
    [ SMTPat (modifies_inert p h h'); SMTPat (HS.contains h b) ];
    [ SMTPat (modifies_inert p h h'); SMTPat (HS.sel h' b) ] ;
    [ SMTPat (modifies_inert p h h'); SMTPat (HS.contains h' b) ]
  ] ]
= modifies_mreference_elim b p h h'

let modifies_inert_buffer_elim
  (#t1: Type)
  (b: B.buffer t1)
  (p: loc)
  (h h': HS.mem)
: Lemma
  (requires (
    loc_disjoint (loc_buffer b) p /\
    B.live h b /\
    modifies_inert p h h'
  ))
  (ensures (
    B.live h' b /\ (
    B.as_seq h b == B.as_seq h' b
  )))
  [SMTPatOr [
    [ SMTPat (modifies_inert p h h'); SMTPat (B.as_seq h b) ] ;
    [ SMTPat (modifies_inert p h h'); SMTPat (B.live h b) ];
    [ SMTPat (modifies_inert p h h'); SMTPat (B.as_seq h' b) ] ;
    [ SMTPat (modifies_inert p h h'); SMTPat (B.live h' b) ]
  ] ]
= modifies_buffer_elim b p h h'

let modifies_inert_liveness_insensitive_mreference_weak
  (l : loc)
  (h h' : HS.mem)
  (#t: Type)
  (#pre: Preorder.preorder t)
  (x: HS.mreference t pre)
: Lemma
  (requires (modifies_inert l h h' /\ address_liveness_insensitive_locs `loc_includes` l /\ h `HS.contains` x))
  (ensures (h' `HS.contains` x))
  [SMTPatOr [
    [SMTPat (h `HS.contains` x); SMTPat (modifies_inert l h h');];
    [SMTPat (h' `HS.contains` x); SMTPat (modifies_inert l h h');];
  ]]
= modifies_liveness_insensitive_mreference_weak l h h' x

let modifies_inert_liveness_insensitive_buffer_weak
  (l : loc)
  (h h' : HS.mem)
  (#t: Type)
  (x: B.buffer t)
: Lemma
  (requires (modifies_inert l h h' /\ address_liveness_insensitive_locs `loc_includes` l /\ B.live h x))
  (ensures (B.live h' x))
  [SMTPatOr [
    [SMTPat (B.live h x); SMTPat (modifies_inert l h h');];
    [SMTPat (B.live h' x); SMTPat (modifies_inert l h h');];
  ]]
= modifies_liveness_insensitive_buffer_weak l h h' x

let modifies_inert_liveness_insensitive_region_weak
  (l2 : loc)
  (h h' : HS.mem)
  (x: HS.rid)
: Lemma
  (requires (modifies_inert l2 h h' /\ region_liveness_insensitive_locs `loc_includes` l2 /\ HS.live_region h x))
  (ensures (HS.live_region h' x))
  [SMTPatOr [
    [SMTPat (modifies_inert l2 h h'); SMTPat (HS.live_region h x)];
    [SMTPat (modifies_inert l2 h h'); SMTPat (HS.live_region h' x)];
  ]]
= modifies_liveness_insensitive_region_weak l2 h h' x

let modifies_inert_liveness_insensitive_region_mreference_weak
  (l2 : loc)
  (h h' : HS.mem)
  (#t: Type)
  (#pre: Preorder.preorder t)
  (x: HS.mreference t pre)
: Lemma
  (requires (modifies_inert l2 h h' /\ region_liveness_insensitive_locs `loc_includes` l2 /\ HS.live_region h (HS.frameOf x)))
  (ensures (HS.live_region h' (HS.frameOf x)))
  [SMTPatOr [
    [SMTPat (modifies_inert l2 h h'); SMTPat (HS.live_region h (HS.frameOf x))];
    [SMTPat (modifies_inert l2 h h'); SMTPat (HS.live_region h' (HS.frameOf x))];
  ]]
= modifies_liveness_insensitive_region_mreference_weak l2 h h' x

let modifies_inert_liveness_insensitive_region_buffer_weak
  (l2 : loc)
  (h h' : HS.mem)
  (#t: Type)
  (x: B.buffer t)
: Lemma
  (requires (modifies_inert l2 h h' /\ region_liveness_insensitive_locs `loc_includes` l2 /\ HS.live_region h (B.frameOf x)))
  (ensures (HS.live_region h' (B.frameOf x)))
  [SMTPatOr [
    [SMTPat (modifies_inert l2 h h'); SMTPat (HS.live_region h (B.frameOf x))];
    [SMTPat (modifies_inert l2 h h'); SMTPat (HS.live_region h' (B.frameOf x))];
  ]]
= modifies_liveness_insensitive_region_buffer_weak l2 h h' x

let fresh_frame_modifies_inert
  (h0 h1: HS.mem)
: Lemma
  (requires (HS.fresh_frame h0 h1))
  (ensures (modifies_inert loc_none h0 h1))
  [SMTPat (HS.fresh_frame h0 h1)]
= fresh_frame_modifies h0 h1

let popped_modifies_inert
  (h0 h1: HS.mem)
: Lemma
  (requires (HS.popped h0 h1))
  (ensures (modifies_inert (loc_region_only false (HS.get_tip h0)) h0 h1))
  [SMTPat (HS.popped h0 h1)]
= popped_modifies h0 h1
