#light "off"
module FStar.Reflection.Interpreter

module N = FStar.TypeChecker.Normalize
open FStar.Reflection.Data
open FStar.Reflection.Basic
open FStar.Ident
open FStar.TypeChecker.Env
module Range = FStar.Range
open FStar.List
open FStar.Syntax.Syntax
open FStar.Syntax.Embeddings
module Print = FStar.Syntax.Print
module BU = FStar.Util
module E = FStar.Reflection.Embeddings

let int1 (m:lid) (f:'a -> 'b) (ua:unembedder<'a>) (em:embedder<'b>)
                 (r:Range.range) (args : args) : option<term> =
    match args with
    | [(a, _)] ->
        BU.bind_opt (ua a) (fun a ->
        Some (em r (f a)))
    | _ -> None

let int2 (m:lid) (f:'a -> 'b -> 'c) (ua:unembedder<'a>) (ub:unembedder<'b>) (em:embedder<'c>)
                 (r:Range.range) (args : args) : option<term> =
    match args with
    | [(a, _); (b, _)] ->
        BU.bind_opt (ua a) (fun a ->
        BU.bind_opt (ub b) (fun b ->
        Some (em r (f a b))))
    | _ -> None

let reflection_primops : list<N.primitive_step> =
    let mklid (nm : string) : lid = fstar_refl_basic_lid nm in
    let mk (l : lid) (arity : int) (fn : Range.range -> args -> option<term>) : N.primitive_step =
        {
            N.name = l;
            N.arity = arity;
            N.auto_reflect = None;
            N.strong_reduction_ok = false;
            N.requires_binder_substitution = false;
            N.interpretation = (fun ctxt args -> fn (N.psc_range ctxt) args)
        } in
    // GM: we need the annotation, otherwise F* will try to unify the types
    // for all mk1 calls. I guess a consequence that we don't generalize inner lets
    let mk1 nm (f : 'a -> 'b)       u1 em    : N.primitive_step = let l = mklid nm in mk l 1 (int1 l f u1 em) in
    let mk2 nm (f : 'a -> 'b -> 'c) u1 u2 em : N.primitive_step = let l = mklid nm in mk l 2 (int2 l f u1 u2 em) in
    [
        mk1 "inspect_ln" inspect_ln E.unembed_term E.embed_term_view;
        mk1 "pack_ln"    pack_ln    E.unembed_term_view E.embed_term;

        mk1 "inspect_fv" inspect_fv E.unembed_fv embed_string_list;
        mk1 "pack_fv" pack_fv (unembed_list unembed_string) E.embed_fv;

        mk1 "inspect_comp" inspect_comp E.unembed_comp E.embed_comp_view;
        mk1 "pack_comp"    pack_comp E.unembed_comp_view E.embed_comp;

        mk1 "inspect_sigelt" inspect_sigelt E.unembed_sigelt E.embed_sigelt_view;
        mk1 "pack_sigelt"    pack_sigelt E.unembed_sigelt_view E.embed_sigelt;

        mk1 "inspect_bv" inspect_bv E.unembed_bv   E.embed_bv_view;
        mk1 "pack_bv"    pack_bv E.unembed_bv_view E.embed_bv;

        mk1 "inspect_binder" inspect_binder E.unembed_binder E.embed_binder_view;

        mk2 "pack_binder"    pack_binder E.unembed_bv E.unembed_aqualv E.embed_binder;

        mk2 "compare_bv" compare_bv E.unembed_bv E.unembed_bv E.embed_order;

        mk2 "is_free" is_free E.unembed_bv E.unembed_term embed_bool;

        mk2 "term_eq" term_eq E.unembed_term E.unembed_term embed_bool;

        mk1 "moduleof" moduleof E.unembed_env (embed_list embed_string t_string);
        mk1 "term_to_string" term_to_string E.unembed_term embed_string;
        mk1 "binders_of_env" binders_of_env E.unembed_env E.embed_binders;
        mk2 "lookup_typ" lookup_typ E.unembed_env unembed_string_list (embed_option E.embed_sigelt fstar_refl_sigelt);
    ]
