
open Prims
open FStar_Pervasives
type 'a withinfo_t =
{v : 'a; p : FStar_Range.range}


let __proj__Mkwithinfo_t__item__v : 'a . 'a withinfo_t  ->  'a = (fun projectee -> (match (projectee) with
| {v = __fname__v; p = __fname__p} -> begin
__fname__v
end))


let __proj__Mkwithinfo_t__item__p : 'a . 'a withinfo_t  ->  FStar_Range.range = (fun projectee -> (match (projectee) with
| {v = __fname__v; p = __fname__p} -> begin
__fname__p
end))


type var =
FStar_Ident.lident withinfo_t


type sconst =
FStar_Const.sconst

type pragma =
| SetOptions of Prims.string
| ResetOptions of Prims.string FStar_Pervasives_Native.option
| LightOff


let uu___is_SetOptions : pragma  ->  Prims.bool = (fun projectee -> (match (projectee) with
| SetOptions (_0) -> begin
true
end
| uu____67 -> begin
false
end))


let __proj__SetOptions__item___0 : pragma  ->  Prims.string = (fun projectee -> (match (projectee) with
| SetOptions (_0) -> begin
_0
end))


let uu___is_ResetOptions : pragma  ->  Prims.bool = (fun projectee -> (match (projectee) with
| ResetOptions (_0) -> begin
true
end
| uu____83 -> begin
false
end))


let __proj__ResetOptions__item___0 : pragma  ->  Prims.string FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| ResetOptions (_0) -> begin
_0
end))


let uu___is_LightOff : pragma  ->  Prims.bool = (fun projectee -> (match (projectee) with
| LightOff -> begin
true
end
| uu____102 -> begin
false
end))


type 'a memo =
'a FStar_Pervasives_Native.option FStar_ST.ref

type version =
{major : Prims.int; minor : Prims.int}


let __proj__Mkversion__item__major : version  ->  Prims.int = (fun projectee -> (match (projectee) with
| {major = __fname__major; minor = __fname__minor} -> begin
__fname__major
end))


let __proj__Mkversion__item__minor : version  ->  Prims.int = (fun projectee -> (match (projectee) with
| {major = __fname__major; minor = __fname__minor} -> begin
__fname__minor
end))

type arg_qualifier =
| Implicit of Prims.bool
| Equality


let uu___is_Implicit : arg_qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Implicit (_0) -> begin
true
end
| uu____146 -> begin
false
end))


let __proj__Implicit__item___0 : arg_qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Implicit (_0) -> begin
_0
end))


let uu___is_Equality : arg_qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Equality -> begin
true
end
| uu____159 -> begin
false
end))


type aqual =
arg_qualifier FStar_Pervasives_Native.option

type universe =
| U_zero
| U_succ of universe
| U_max of universe Prims.list
| U_bvar of Prims.int
| U_name of FStar_Ident.ident
| U_unif of (universe FStar_Pervasives_Native.option FStar_Unionfind.p_uvar * version)
| U_unknown


let uu___is_U_zero : universe  ->  Prims.bool = (fun projectee -> (match (projectee) with
| U_zero -> begin
true
end
| uu____202 -> begin
false
end))


let uu___is_U_succ : universe  ->  Prims.bool = (fun projectee -> (match (projectee) with
| U_succ (_0) -> begin
true
end
| uu____209 -> begin
false
end))


let __proj__U_succ__item___0 : universe  ->  universe = (fun projectee -> (match (projectee) with
| U_succ (_0) -> begin
_0
end))


let uu___is_U_max : universe  ->  Prims.bool = (fun projectee -> (match (projectee) with
| U_max (_0) -> begin
true
end
| uu____225 -> begin
false
end))


let __proj__U_max__item___0 : universe  ->  universe Prims.list = (fun projectee -> (match (projectee) with
| U_max (_0) -> begin
_0
end))


let uu___is_U_bvar : universe  ->  Prims.bool = (fun projectee -> (match (projectee) with
| U_bvar (_0) -> begin
true
end
| uu____245 -> begin
false
end))


let __proj__U_bvar__item___0 : universe  ->  Prims.int = (fun projectee -> (match (projectee) with
| U_bvar (_0) -> begin
_0
end))


let uu___is_U_name : universe  ->  Prims.bool = (fun projectee -> (match (projectee) with
| U_name (_0) -> begin
true
end
| uu____259 -> begin
false
end))


let __proj__U_name__item___0 : universe  ->  FStar_Ident.ident = (fun projectee -> (match (projectee) with
| U_name (_0) -> begin
_0
end))


let uu___is_U_unif : universe  ->  Prims.bool = (fun projectee -> (match (projectee) with
| U_unif (_0) -> begin
true
end
| uu____281 -> begin
false
end))


let __proj__U_unif__item___0 : universe  ->  (universe FStar_Pervasives_Native.option FStar_Unionfind.p_uvar * version) = (fun projectee -> (match (projectee) with
| U_unif (_0) -> begin
_0
end))


let uu___is_U_unknown : universe  ->  Prims.bool = (fun projectee -> (match (projectee) with
| U_unknown -> begin
true
end
| uu____318 -> begin
false
end))


type univ_name =
FStar_Ident.ident


type universe_uvar =
(universe FStar_Pervasives_Native.option FStar_Unionfind.p_uvar * version)


type univ_names =
univ_name Prims.list


type universes =
universe Prims.list


type monad_name =
FStar_Ident.lident

type quote_kind =
| Quote_static
| Quote_dynamic


let uu___is_Quote_static : quote_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Quote_static -> begin
true
end
| uu____336 -> begin
false
end))


let uu___is_Quote_dynamic : quote_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Quote_dynamic -> begin
true
end
| uu____342 -> begin
false
end))

type delta_depth =
| Delta_constant_at_level of Prims.int
| Delta_equational_at_level of Prims.int
| Delta_abstract of delta_depth


let uu___is_Delta_constant_at_level : delta_depth  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Delta_constant_at_level (_0) -> begin
true
end
| uu____364 -> begin
false
end))


let __proj__Delta_constant_at_level__item___0 : delta_depth  ->  Prims.int = (fun projectee -> (match (projectee) with
| Delta_constant_at_level (_0) -> begin
_0
end))


let uu___is_Delta_equational_at_level : delta_depth  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Delta_equational_at_level (_0) -> begin
true
end
| uu____378 -> begin
false
end))


let __proj__Delta_equational_at_level__item___0 : delta_depth  ->  Prims.int = (fun projectee -> (match (projectee) with
| Delta_equational_at_level (_0) -> begin
_0
end))


let uu___is_Delta_abstract : delta_depth  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Delta_abstract (_0) -> begin
true
end
| uu____392 -> begin
false
end))


let __proj__Delta_abstract__item___0 : delta_depth  ->  delta_depth = (fun projectee -> (match (projectee) with
| Delta_abstract (_0) -> begin
_0
end))

type lazy_kind =
| BadLazy
| Lazy_bv
| Lazy_binder
| Lazy_fvar
| Lazy_comp
| Lazy_env
| Lazy_proofstate
| Lazy_sigelt


let uu___is_BadLazy : lazy_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| BadLazy -> begin
true
end
| uu____405 -> begin
false
end))


let uu___is_Lazy_bv : lazy_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Lazy_bv -> begin
true
end
| uu____411 -> begin
false
end))


let uu___is_Lazy_binder : lazy_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Lazy_binder -> begin
true
end
| uu____417 -> begin
false
end))


let uu___is_Lazy_fvar : lazy_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Lazy_fvar -> begin
true
end
| uu____423 -> begin
false
end))


let uu___is_Lazy_comp : lazy_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Lazy_comp -> begin
true
end
| uu____429 -> begin
false
end))


let uu___is_Lazy_env : lazy_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Lazy_env -> begin
true
end
| uu____435 -> begin
false
end))


let uu___is_Lazy_proofstate : lazy_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Lazy_proofstate -> begin
true
end
| uu____441 -> begin
false
end))


let uu___is_Lazy_sigelt : lazy_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Lazy_sigelt -> begin
true
end
| uu____447 -> begin
false
end))

type term' =
| Tm_bvar of bv
| Tm_name of bv
| Tm_fvar of fv
| Tm_uinst of (term' syntax * universes)
| Tm_constant of sconst
| Tm_type of universe
| Tm_abs of ((bv * aqual) Prims.list * term' syntax * residual_comp FStar_Pervasives_Native.option)
| Tm_arrow of ((bv * aqual) Prims.list * comp' syntax)
| Tm_refine of (bv * term' syntax)
| Tm_app of (term' syntax * (term' syntax * aqual) Prims.list)
| Tm_match of (term' syntax * (pat' withinfo_t * term' syntax FStar_Pervasives_Native.option * term' syntax) Prims.list)
| Tm_ascribed of (term' syntax * ((term' syntax, comp' syntax) FStar_Util.either * term' syntax FStar_Pervasives_Native.option) * FStar_Ident.lident FStar_Pervasives_Native.option)
| Tm_let of ((Prims.bool * letbinding Prims.list) * term' syntax)
| Tm_uvar of ((term' syntax FStar_Pervasives_Native.option FStar_Unionfind.p_uvar * version) * term' syntax)
| Tm_delayed of ((term' syntax * (subst_elt Prims.list Prims.list * FStar_Range.range FStar_Pervasives_Native.option)) * term' syntax memo)
| Tm_meta of (term' syntax * metadata)
| Tm_lazy of lazyinfo
| Tm_quoted of (term' syntax * quoteinfo)
| Tm_unknown 
 and pat' =
| Pat_constant of sconst
| Pat_cons of (fv * (pat' withinfo_t * Prims.bool) Prims.list)
| Pat_var of bv
| Pat_wild of bv
| Pat_dot_term of (bv * term' syntax) 
 and letbinding =
{lbname : (bv, fv) FStar_Util.either; lbunivs : univ_name Prims.list; lbtyp : term' syntax; lbeff : FStar_Ident.lident; lbdef : term' syntax; lbattrs : term' syntax Prims.list; lbpos : FStar_Range.range} 
 and quoteinfo =
{qkind : quote_kind; antiquotes : (bv * Prims.bool * term' syntax) Prims.list} 
 and comp_typ =
{comp_univs : universes; effect_name : FStar_Ident.lident; result_typ : term' syntax; effect_args : (term' syntax * aqual) Prims.list; flags : cflags Prims.list} 
 and comp' =
| Total of (term' syntax * universe FStar_Pervasives_Native.option)
| GTotal of (term' syntax * universe FStar_Pervasives_Native.option)
| Comp of comp_typ 
 and cflags =
| TOTAL
| MLEFFECT
| RETURN
| PARTIAL_RETURN
| SOMETRIVIAL
| TRIVIAL_POSTCONDITION
| SHOULD_NOT_INLINE
| LEMMA
| CPS
| DECREASES of term' syntax 
 and metadata =
| Meta_pattern of (term' syntax * aqual) Prims.list Prims.list
| Meta_named of FStar_Ident.lident
| Meta_labeled of (Prims.string * FStar_Range.range * Prims.bool)
| Meta_desugared of meta_source_info
| Meta_monadic of (monad_name * term' syntax)
| Meta_monadic_lift of (monad_name * monad_name * term' syntax) 
 and meta_source_info =
| Sequence
| Primop
| Masked_effect
| Meta_smt_pat
| Mutable_alloc
| Mutable_rval 
 and fv_qual =
| Data_ctor
| Record_projector of (FStar_Ident.lident * FStar_Ident.ident)
| Record_ctor of (FStar_Ident.lident * FStar_Ident.ident Prims.list) 
 and subst_elt =
| DB of (Prims.int * bv)
| NM of (bv * Prims.int)
| NT of (bv * term' syntax)
| UN of (Prims.int * universe)
| UD of (univ_name * Prims.int) 
 and 'a syntax =
{n : 'a; pos : FStar_Range.range; vars : free_vars memo} 
 and bv =
{ppname : FStar_Ident.ident; index : Prims.int; sort : term' syntax} 
 and fv =
{fv_name : var; fv_delta : delta_depth; fv_qual : fv_qual FStar_Pervasives_Native.option} 
 and free_vars =
{free_names : bv Prims.list; free_uvars : ((term' syntax FStar_Pervasives_Native.option FStar_Unionfind.p_uvar * version) * term' syntax) Prims.list; free_univs : universe_uvar Prims.list; free_univ_names : univ_name Prims.list} 
 and lcomp =
{eff_name : FStar_Ident.lident; res_typ : term' syntax; cflags : cflags Prims.list; comp_thunk : (unit  ->  comp' syntax, comp' syntax) FStar_Util.either FStar_ST.ref} 
 and residual_comp =
{residual_effect : FStar_Ident.lident; residual_typ : term' syntax FStar_Pervasives_Native.option; residual_flags : cflags Prims.list} 
 and lazyinfo =
{blob : FStar_Dyn.dyn; lkind : lazy_kind; typ : term' syntax; rng : FStar_Range.range}


let uu___is_Tm_bvar : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_bvar (_0) -> begin
true
end
| uu____1384 -> begin
false
end))


let __proj__Tm_bvar__item___0 : term'  ->  bv = (fun projectee -> (match (projectee) with
| Tm_bvar (_0) -> begin
_0
end))


let uu___is_Tm_name : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_name (_0) -> begin
true
end
| uu____1398 -> begin
false
end))


let __proj__Tm_name__item___0 : term'  ->  bv = (fun projectee -> (match (projectee) with
| Tm_name (_0) -> begin
_0
end))


let uu___is_Tm_fvar : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_fvar (_0) -> begin
true
end
| uu____1412 -> begin
false
end))


let __proj__Tm_fvar__item___0 : term'  ->  fv = (fun projectee -> (match (projectee) with
| Tm_fvar (_0) -> begin
_0
end))


let uu___is_Tm_uinst : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_uinst (_0) -> begin
true
end
| uu____1432 -> begin
false
end))


let __proj__Tm_uinst__item___0 : term'  ->  (term' syntax * universes) = (fun projectee -> (match (projectee) with
| Tm_uinst (_0) -> begin
_0
end))


let uu___is_Tm_constant : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_constant (_0) -> begin
true
end
| uu____1464 -> begin
false
end))


let __proj__Tm_constant__item___0 : term'  ->  sconst = (fun projectee -> (match (projectee) with
| Tm_constant (_0) -> begin
_0
end))


let uu___is_Tm_type : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_type (_0) -> begin
true
end
| uu____1478 -> begin
false
end))


let __proj__Tm_type__item___0 : term'  ->  universe = (fun projectee -> (match (projectee) with
| Tm_type (_0) -> begin
_0
end))


let uu___is_Tm_abs : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_abs (_0) -> begin
true
end
| uu____1508 -> begin
false
end))


let __proj__Tm_abs__item___0 : term'  ->  ((bv * aqual) Prims.list * term' syntax * residual_comp FStar_Pervasives_Native.option) = (fun projectee -> (match (projectee) with
| Tm_abs (_0) -> begin
_0
end))


let uu___is_Tm_arrow : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_arrow (_0) -> begin
true
end
| uu____1582 -> begin
false
end))


let __proj__Tm_arrow__item___0 : term'  ->  ((bv * aqual) Prims.list * comp' syntax) = (fun projectee -> (match (projectee) with
| Tm_arrow (_0) -> begin
_0
end))


let uu___is_Tm_refine : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_refine (_0) -> begin
true
end
| uu____1638 -> begin
false
end))


let __proj__Tm_refine__item___0 : term'  ->  (bv * term' syntax) = (fun projectee -> (match (projectee) with
| Tm_refine (_0) -> begin
_0
end))


let uu___is_Tm_app : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_app (_0) -> begin
true
end
| uu____1684 -> begin
false
end))


let __proj__Tm_app__item___0 : term'  ->  (term' syntax * (term' syntax * aqual) Prims.list) = (fun projectee -> (match (projectee) with
| Tm_app (_0) -> begin
_0
end))


let uu___is_Tm_match : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_match (_0) -> begin
true
end
| uu____1762 -> begin
false
end))


let __proj__Tm_match__item___0 : term'  ->  (term' syntax * (pat' withinfo_t * term' syntax FStar_Pervasives_Native.option * term' syntax) Prims.list) = (fun projectee -> (match (projectee) with
| Tm_match (_0) -> begin
_0
end))


let uu___is_Tm_ascribed : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_ascribed (_0) -> begin
true
end
| uu____1868 -> begin
false
end))


let __proj__Tm_ascribed__item___0 : term'  ->  (term' syntax * ((term' syntax, comp' syntax) FStar_Util.either * term' syntax FStar_Pervasives_Native.option) * FStar_Ident.lident FStar_Pervasives_Native.option) = (fun projectee -> (match (projectee) with
| Tm_ascribed (_0) -> begin
_0
end))


let uu___is_Tm_let : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_let (_0) -> begin
true
end
| uu____1972 -> begin
false
end))


let __proj__Tm_let__item___0 : term'  ->  ((Prims.bool * letbinding Prims.list) * term' syntax) = (fun projectee -> (match (projectee) with
| Tm_let (_0) -> begin
_0
end))


let uu___is_Tm_uvar : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_uvar (_0) -> begin
true
end
| uu____2038 -> begin
false
end))


let __proj__Tm_uvar__item___0 : term'  ->  ((term' syntax FStar_Pervasives_Native.option FStar_Unionfind.p_uvar * version) * term' syntax) = (fun projectee -> (match (projectee) with
| Tm_uvar (_0) -> begin
_0
end))


let uu___is_Tm_delayed : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_delayed (_0) -> begin
true
end
| uu____2124 -> begin
false
end))


let __proj__Tm_delayed__item___0 : term'  ->  ((term' syntax * (subst_elt Prims.list Prims.list * FStar_Range.range FStar_Pervasives_Native.option)) * term' syntax memo) = (fun projectee -> (match (projectee) with
| Tm_delayed (_0) -> begin
_0
end))


let uu___is_Tm_meta : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_meta (_0) -> begin
true
end
| uu____2216 -> begin
false
end))


let __proj__Tm_meta__item___0 : term'  ->  (term' syntax * metadata) = (fun projectee -> (match (projectee) with
| Tm_meta (_0) -> begin
_0
end))


let uu___is_Tm_lazy : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_lazy (_0) -> begin
true
end
| uu____2248 -> begin
false
end))


let __proj__Tm_lazy__item___0 : term'  ->  lazyinfo = (fun projectee -> (match (projectee) with
| Tm_lazy (_0) -> begin
_0
end))


let uu___is_Tm_quoted : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_quoted (_0) -> begin
true
end
| uu____2268 -> begin
false
end))


let __proj__Tm_quoted__item___0 : term'  ->  (term' syntax * quoteinfo) = (fun projectee -> (match (projectee) with
| Tm_quoted (_0) -> begin
_0
end))


let uu___is_Tm_unknown : term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Tm_unknown -> begin
true
end
| uu____2299 -> begin
false
end))


let uu___is_Pat_constant : pat'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Pat_constant (_0) -> begin
true
end
| uu____2306 -> begin
false
end))


let __proj__Pat_constant__item___0 : pat'  ->  sconst = (fun projectee -> (match (projectee) with
| Pat_constant (_0) -> begin
_0
end))


let uu___is_Pat_cons : pat'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Pat_cons (_0) -> begin
true
end
| uu____2332 -> begin
false
end))


let __proj__Pat_cons__item___0 : pat'  ->  (fv * (pat' withinfo_t * Prims.bool) Prims.list) = (fun projectee -> (match (projectee) with
| Pat_cons (_0) -> begin
_0
end))


let uu___is_Pat_var : pat'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Pat_var (_0) -> begin
true
end
| uu____2382 -> begin
false
end))


let __proj__Pat_var__item___0 : pat'  ->  bv = (fun projectee -> (match (projectee) with
| Pat_var (_0) -> begin
_0
end))


let uu___is_Pat_wild : pat'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Pat_wild (_0) -> begin
true
end
| uu____2396 -> begin
false
end))


let __proj__Pat_wild__item___0 : pat'  ->  bv = (fun projectee -> (match (projectee) with
| Pat_wild (_0) -> begin
_0
end))


let uu___is_Pat_dot_term : pat'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Pat_dot_term (_0) -> begin
true
end
| uu____2416 -> begin
false
end))


let __proj__Pat_dot_term__item___0 : pat'  ->  (bv * term' syntax) = (fun projectee -> (match (projectee) with
| Pat_dot_term (_0) -> begin
_0
end))


let __proj__Mkletbinding__item__lbname : letbinding  ->  (bv, fv) FStar_Util.either = (fun projectee -> (match (projectee) with
| {lbname = __fname__lbname; lbunivs = __fname__lbunivs; lbtyp = __fname__lbtyp; lbeff = __fname__lbeff; lbdef = __fname__lbdef; lbattrs = __fname__lbattrs; lbpos = __fname__lbpos} -> begin
__fname__lbname
end))


let __proj__Mkletbinding__item__lbunivs : letbinding  ->  univ_name Prims.list = (fun projectee -> (match (projectee) with
| {lbname = __fname__lbname; lbunivs = __fname__lbunivs; lbtyp = __fname__lbtyp; lbeff = __fname__lbeff; lbdef = __fname__lbdef; lbattrs = __fname__lbattrs; lbpos = __fname__lbpos} -> begin
__fname__lbunivs
end))


let __proj__Mkletbinding__item__lbtyp : letbinding  ->  term' syntax = (fun projectee -> (match (projectee) with
| {lbname = __fname__lbname; lbunivs = __fname__lbunivs; lbtyp = __fname__lbtyp; lbeff = __fname__lbeff; lbdef = __fname__lbdef; lbattrs = __fname__lbattrs; lbpos = __fname__lbpos} -> begin
__fname__lbtyp
end))


let __proj__Mkletbinding__item__lbeff : letbinding  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| {lbname = __fname__lbname; lbunivs = __fname__lbunivs; lbtyp = __fname__lbtyp; lbeff = __fname__lbeff; lbdef = __fname__lbdef; lbattrs = __fname__lbattrs; lbpos = __fname__lbpos} -> begin
__fname__lbeff
end))


let __proj__Mkletbinding__item__lbdef : letbinding  ->  term' syntax = (fun projectee -> (match (projectee) with
| {lbname = __fname__lbname; lbunivs = __fname__lbunivs; lbtyp = __fname__lbtyp; lbeff = __fname__lbeff; lbdef = __fname__lbdef; lbattrs = __fname__lbattrs; lbpos = __fname__lbpos} -> begin
__fname__lbdef
end))


let __proj__Mkletbinding__item__lbattrs : letbinding  ->  term' syntax Prims.list = (fun projectee -> (match (projectee) with
| {lbname = __fname__lbname; lbunivs = __fname__lbunivs; lbtyp = __fname__lbtyp; lbeff = __fname__lbeff; lbdef = __fname__lbdef; lbattrs = __fname__lbattrs; lbpos = __fname__lbpos} -> begin
__fname__lbattrs
end))


let __proj__Mkletbinding__item__lbpos : letbinding  ->  FStar_Range.range = (fun projectee -> (match (projectee) with
| {lbname = __fname__lbname; lbunivs = __fname__lbunivs; lbtyp = __fname__lbtyp; lbeff = __fname__lbeff; lbdef = __fname__lbdef; lbattrs = __fname__lbattrs; lbpos = __fname__lbpos} -> begin
__fname__lbpos
end))


let __proj__Mkquoteinfo__item__qkind : quoteinfo  ->  quote_kind = (fun projectee -> (match (projectee) with
| {qkind = __fname__qkind; antiquotes = __fname__antiquotes} -> begin
__fname__qkind
end))


let __proj__Mkquoteinfo__item__antiquotes : quoteinfo  ->  (bv * Prims.bool * term' syntax) Prims.list = (fun projectee -> (match (projectee) with
| {qkind = __fname__qkind; antiquotes = __fname__antiquotes} -> begin
__fname__antiquotes
end))


let __proj__Mkcomp_typ__item__comp_univs : comp_typ  ->  universes = (fun projectee -> (match (projectee) with
| {comp_univs = __fname__comp_univs; effect_name = __fname__effect_name; result_typ = __fname__result_typ; effect_args = __fname__effect_args; flags = __fname__flags} -> begin
__fname__comp_univs
end))


let __proj__Mkcomp_typ__item__effect_name : comp_typ  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| {comp_univs = __fname__comp_univs; effect_name = __fname__effect_name; result_typ = __fname__result_typ; effect_args = __fname__effect_args; flags = __fname__flags} -> begin
__fname__effect_name
end))


let __proj__Mkcomp_typ__item__result_typ : comp_typ  ->  term' syntax = (fun projectee -> (match (projectee) with
| {comp_univs = __fname__comp_univs; effect_name = __fname__effect_name; result_typ = __fname__result_typ; effect_args = __fname__effect_args; flags = __fname__flags} -> begin
__fname__result_typ
end))


let __proj__Mkcomp_typ__item__effect_args : comp_typ  ->  (term' syntax * aqual) Prims.list = (fun projectee -> (match (projectee) with
| {comp_univs = __fname__comp_univs; effect_name = __fname__effect_name; result_typ = __fname__result_typ; effect_args = __fname__effect_args; flags = __fname__flags} -> begin
__fname__effect_args
end))


let __proj__Mkcomp_typ__item__flags : comp_typ  ->  cflags Prims.list = (fun projectee -> (match (projectee) with
| {comp_univs = __fname__comp_univs; effect_name = __fname__effect_name; result_typ = __fname__result_typ; effect_args = __fname__effect_args; flags = __fname__flags} -> begin
__fname__flags
end))


let uu___is_Total : comp'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Total (_0) -> begin
true
end
| uu____2854 -> begin
false
end))


let __proj__Total__item___0 : comp'  ->  (term' syntax * universe FStar_Pervasives_Native.option) = (fun projectee -> (match (projectee) with
| Total (_0) -> begin
_0
end))


let uu___is_GTotal : comp'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| GTotal (_0) -> begin
true
end
| uu____2900 -> begin
false
end))


let __proj__GTotal__item___0 : comp'  ->  (term' syntax * universe FStar_Pervasives_Native.option) = (fun projectee -> (match (projectee) with
| GTotal (_0) -> begin
_0
end))


let uu___is_Comp : comp'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Comp (_0) -> begin
true
end
| uu____2938 -> begin
false
end))


let __proj__Comp__item___0 : comp'  ->  comp_typ = (fun projectee -> (match (projectee) with
| Comp (_0) -> begin
_0
end))


let uu___is_TOTAL : cflags  ->  Prims.bool = (fun projectee -> (match (projectee) with
| TOTAL -> begin
true
end
| uu____2951 -> begin
false
end))


let uu___is_MLEFFECT : cflags  ->  Prims.bool = (fun projectee -> (match (projectee) with
| MLEFFECT -> begin
true
end
| uu____2957 -> begin
false
end))


let uu___is_RETURN : cflags  ->  Prims.bool = (fun projectee -> (match (projectee) with
| RETURN -> begin
true
end
| uu____2963 -> begin
false
end))


let uu___is_PARTIAL_RETURN : cflags  ->  Prims.bool = (fun projectee -> (match (projectee) with
| PARTIAL_RETURN -> begin
true
end
| uu____2969 -> begin
false
end))


let uu___is_SOMETRIVIAL : cflags  ->  Prims.bool = (fun projectee -> (match (projectee) with
| SOMETRIVIAL -> begin
true
end
| uu____2975 -> begin
false
end))


let uu___is_TRIVIAL_POSTCONDITION : cflags  ->  Prims.bool = (fun projectee -> (match (projectee) with
| TRIVIAL_POSTCONDITION -> begin
true
end
| uu____2981 -> begin
false
end))


let uu___is_SHOULD_NOT_INLINE : cflags  ->  Prims.bool = (fun projectee -> (match (projectee) with
| SHOULD_NOT_INLINE -> begin
true
end
| uu____2987 -> begin
false
end))


let uu___is_LEMMA : cflags  ->  Prims.bool = (fun projectee -> (match (projectee) with
| LEMMA -> begin
true
end
| uu____2993 -> begin
false
end))


let uu___is_CPS : cflags  ->  Prims.bool = (fun projectee -> (match (projectee) with
| CPS -> begin
true
end
| uu____2999 -> begin
false
end))


let uu___is_DECREASES : cflags  ->  Prims.bool = (fun projectee -> (match (projectee) with
| DECREASES (_0) -> begin
true
end
| uu____3008 -> begin
false
end))


let __proj__DECREASES__item___0 : cflags  ->  term' syntax = (fun projectee -> (match (projectee) with
| DECREASES (_0) -> begin
_0
end))


let uu___is_Meta_pattern : metadata  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Meta_pattern (_0) -> begin
true
end
| uu____3038 -> begin
false
end))


let __proj__Meta_pattern__item___0 : metadata  ->  (term' syntax * aqual) Prims.list Prims.list = (fun projectee -> (match (projectee) with
| Meta_pattern (_0) -> begin
_0
end))


let uu___is_Meta_named : metadata  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Meta_named (_0) -> begin
true
end
| uu____3082 -> begin
false
end))


let __proj__Meta_named__item___0 : metadata  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| Meta_named (_0) -> begin
_0
end))


let uu___is_Meta_labeled : metadata  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Meta_labeled (_0) -> begin
true
end
| uu____3102 -> begin
false
end))


let __proj__Meta_labeled__item___0 : metadata  ->  (Prims.string * FStar_Range.range * Prims.bool) = (fun projectee -> (match (projectee) with
| Meta_labeled (_0) -> begin
_0
end))


let uu___is_Meta_desugared : metadata  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Meta_desugared (_0) -> begin
true
end
| uu____3134 -> begin
false
end))


let __proj__Meta_desugared__item___0 : metadata  ->  meta_source_info = (fun projectee -> (match (projectee) with
| Meta_desugared (_0) -> begin
_0
end))


let uu___is_Meta_monadic : metadata  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Meta_monadic (_0) -> begin
true
end
| uu____3154 -> begin
false
end))


let __proj__Meta_monadic__item___0 : metadata  ->  (monad_name * term' syntax) = (fun projectee -> (match (projectee) with
| Meta_monadic (_0) -> begin
_0
end))


let uu___is_Meta_monadic_lift : metadata  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Meta_monadic_lift (_0) -> begin
true
end
| uu____3194 -> begin
false
end))


let __proj__Meta_monadic_lift__item___0 : metadata  ->  (monad_name * monad_name * term' syntax) = (fun projectee -> (match (projectee) with
| Meta_monadic_lift (_0) -> begin
_0
end))


let uu___is_Sequence : meta_source_info  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Sequence -> begin
true
end
| uu____3231 -> begin
false
end))


let uu___is_Primop : meta_source_info  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Primop -> begin
true
end
| uu____3237 -> begin
false
end))


let uu___is_Masked_effect : meta_source_info  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Masked_effect -> begin
true
end
| uu____3243 -> begin
false
end))


let uu___is_Meta_smt_pat : meta_source_info  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Meta_smt_pat -> begin
true
end
| uu____3249 -> begin
false
end))


let uu___is_Mutable_alloc : meta_source_info  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Mutable_alloc -> begin
true
end
| uu____3255 -> begin
false
end))


let uu___is_Mutable_rval : meta_source_info  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Mutable_rval -> begin
true
end
| uu____3261 -> begin
false
end))


let uu___is_Data_ctor : fv_qual  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Data_ctor -> begin
true
end
| uu____3267 -> begin
false
end))


let uu___is_Record_projector : fv_qual  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Record_projector (_0) -> begin
true
end
| uu____3278 -> begin
false
end))


let __proj__Record_projector__item___0 : fv_qual  ->  (FStar_Ident.lident * FStar_Ident.ident) = (fun projectee -> (match (projectee) with
| Record_projector (_0) -> begin
_0
end))


let uu___is_Record_ctor : fv_qual  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Record_ctor (_0) -> begin
true
end
| uu____3310 -> begin
false
end))


let __proj__Record_ctor__item___0 : fv_qual  ->  (FStar_Ident.lident * FStar_Ident.ident Prims.list) = (fun projectee -> (match (projectee) with
| Record_ctor (_0) -> begin
_0
end))


let uu___is_DB : subst_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| DB (_0) -> begin
true
end
| uu____3346 -> begin
false
end))


let __proj__DB__item___0 : subst_elt  ->  (Prims.int * bv) = (fun projectee -> (match (projectee) with
| DB (_0) -> begin
_0
end))


let uu___is_NM : subst_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NM (_0) -> begin
true
end
| uu____3376 -> begin
false
end))


let __proj__NM__item___0 : subst_elt  ->  (bv * Prims.int) = (fun projectee -> (match (projectee) with
| NM (_0) -> begin
_0
end))


let uu___is_NT : subst_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NT (_0) -> begin
true
end
| uu____3408 -> begin
false
end))


let __proj__NT__item___0 : subst_elt  ->  (bv * term' syntax) = (fun projectee -> (match (projectee) with
| NT (_0) -> begin
_0
end))


let uu___is_UN : subst_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| UN (_0) -> begin
true
end
| uu____3444 -> begin
false
end))


let __proj__UN__item___0 : subst_elt  ->  (Prims.int * universe) = (fun projectee -> (match (projectee) with
| UN (_0) -> begin
_0
end))


let uu___is_UD : subst_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| UD (_0) -> begin
true
end
| uu____3474 -> begin
false
end))


let __proj__UD__item___0 : subst_elt  ->  (univ_name * Prims.int) = (fun projectee -> (match (projectee) with
| UD (_0) -> begin
_0
end))


let __proj__Mksyntax__item__n : 'a . 'a syntax  ->  'a = (fun projectee -> (match (projectee) with
| {n = __fname__n; pos = __fname__pos; vars = __fname__vars} -> begin
__fname__n
end))


let __proj__Mksyntax__item__pos : 'a . 'a syntax  ->  FStar_Range.range = (fun projectee -> (match (projectee) with
| {n = __fname__n; pos = __fname__pos; vars = __fname__vars} -> begin
__fname__pos
end))


let __proj__Mksyntax__item__vars : 'a . 'a syntax  ->  free_vars memo = (fun projectee -> (match (projectee) with
| {n = __fname__n; pos = __fname__pos; vars = __fname__vars} -> begin
__fname__vars
end))


let __proj__Mkbv__item__ppname : bv  ->  FStar_Ident.ident = (fun projectee -> (match (projectee) with
| {ppname = __fname__ppname; index = __fname__index; sort = __fname__sort} -> begin
__fname__ppname
end))


let __proj__Mkbv__item__index : bv  ->  Prims.int = (fun projectee -> (match (projectee) with
| {ppname = __fname__ppname; index = __fname__index; sort = __fname__sort} -> begin
__fname__index
end))


let __proj__Mkbv__item__sort : bv  ->  term' syntax = (fun projectee -> (match (projectee) with
| {ppname = __fname__ppname; index = __fname__index; sort = __fname__sort} -> begin
__fname__sort
end))


let __proj__Mkfv__item__fv_name : fv  ->  var = (fun projectee -> (match (projectee) with
| {fv_name = __fname__fv_name; fv_delta = __fname__fv_delta; fv_qual = __fname__fv_qual} -> begin
__fname__fv_name
end))


let __proj__Mkfv__item__fv_delta : fv  ->  delta_depth = (fun projectee -> (match (projectee) with
| {fv_name = __fname__fv_name; fv_delta = __fname__fv_delta; fv_qual = __fname__fv_qual} -> begin
__fname__fv_delta
end))


let __proj__Mkfv__item__fv_qual : fv  ->  fv_qual FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {fv_name = __fname__fv_name; fv_delta = __fname__fv_delta; fv_qual = __fname__fv_qual} -> begin
__fname__fv_qual
end))


let __proj__Mkfree_vars__item__free_names : free_vars  ->  bv Prims.list = (fun projectee -> (match (projectee) with
| {free_names = __fname__free_names; free_uvars = __fname__free_uvars; free_univs = __fname__free_univs; free_univ_names = __fname__free_univ_names} -> begin
__fname__free_names
end))


let __proj__Mkfree_vars__item__free_uvars : free_vars  ->  ((term' syntax FStar_Pervasives_Native.option FStar_Unionfind.p_uvar * version) * term' syntax) Prims.list = (fun projectee -> (match (projectee) with
| {free_names = __fname__free_names; free_uvars = __fname__free_uvars; free_univs = __fname__free_univs; free_univ_names = __fname__free_univ_names} -> begin
__fname__free_uvars
end))


let __proj__Mkfree_vars__item__free_univs : free_vars  ->  universe_uvar Prims.list = (fun projectee -> (match (projectee) with
| {free_names = __fname__free_names; free_uvars = __fname__free_uvars; free_univs = __fname__free_univs; free_univ_names = __fname__free_univ_names} -> begin
__fname__free_univs
end))


let __proj__Mkfree_vars__item__free_univ_names : free_vars  ->  univ_name Prims.list = (fun projectee -> (match (projectee) with
| {free_names = __fname__free_names; free_uvars = __fname__free_uvars; free_univs = __fname__free_univs; free_univ_names = __fname__free_univ_names} -> begin
__fname__free_univ_names
end))


let __proj__Mklcomp__item__eff_name : lcomp  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| {eff_name = __fname__eff_name; res_typ = __fname__res_typ; cflags = __fname__cflags; comp_thunk = __fname__comp_thunk} -> begin
__fname__eff_name
end))


let __proj__Mklcomp__item__res_typ : lcomp  ->  term' syntax = (fun projectee -> (match (projectee) with
| {eff_name = __fname__eff_name; res_typ = __fname__res_typ; cflags = __fname__cflags; comp_thunk = __fname__comp_thunk} -> begin
__fname__res_typ
end))


let __proj__Mklcomp__item__cflags : lcomp  ->  cflags Prims.list = (fun projectee -> (match (projectee) with
| {eff_name = __fname__eff_name; res_typ = __fname__res_typ; cflags = __fname__cflags; comp_thunk = __fname__comp_thunk} -> begin
__fname__cflags
end))


let __proj__Mklcomp__item__comp_thunk : lcomp  ->  (unit  ->  comp' syntax, comp' syntax) FStar_Util.either FStar_ST.ref = (fun projectee -> (match (projectee) with
| {eff_name = __fname__eff_name; res_typ = __fname__res_typ; cflags = __fname__cflags; comp_thunk = __fname__comp_thunk} -> begin
__fname__comp_thunk
end))


let __proj__Mkresidual_comp__item__residual_effect : residual_comp  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| {residual_effect = __fname__residual_effect; residual_typ = __fname__residual_typ; residual_flags = __fname__residual_flags} -> begin
__fname__residual_effect
end))


let __proj__Mkresidual_comp__item__residual_typ : residual_comp  ->  term' syntax FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {residual_effect = __fname__residual_effect; residual_typ = __fname__residual_typ; residual_flags = __fname__residual_flags} -> begin
__fname__residual_typ
end))


let __proj__Mkresidual_comp__item__residual_flags : residual_comp  ->  cflags Prims.list = (fun projectee -> (match (projectee) with
| {residual_effect = __fname__residual_effect; residual_typ = __fname__residual_typ; residual_flags = __fname__residual_flags} -> begin
__fname__residual_flags
end))


let __proj__Mklazyinfo__item__blob : lazyinfo  ->  FStar_Dyn.dyn = (fun projectee -> (match (projectee) with
| {blob = __fname__blob; lkind = __fname__lkind; typ = __fname__typ; rng = __fname__rng} -> begin
__fname__blob
end))


let __proj__Mklazyinfo__item__lkind : lazyinfo  ->  lazy_kind = (fun projectee -> (match (projectee) with
| {blob = __fname__blob; lkind = __fname__lkind; typ = __fname__typ; rng = __fname__rng} -> begin
__fname__lkind
end))


let __proj__Mklazyinfo__item__typ : lazyinfo  ->  term' syntax = (fun projectee -> (match (projectee) with
| {blob = __fname__blob; lkind = __fname__lkind; typ = __fname__typ; rng = __fname__rng} -> begin
__fname__typ
end))


let __proj__Mklazyinfo__item__rng : lazyinfo  ->  FStar_Range.range = (fun projectee -> (match (projectee) with
| {blob = __fname__blob; lkind = __fname__lkind; typ = __fname__typ; rng = __fname__rng} -> begin
__fname__rng
end))


type pat =
pat' withinfo_t


type term =
term' syntax


type branch =
(pat' withinfo_t * term' syntax FStar_Pervasives_Native.option * term' syntax)


type comp =
comp' syntax


type ascription =
((term' syntax, comp' syntax) FStar_Util.either * term' syntax FStar_Pervasives_Native.option)


type antiquotations =
(bv * Prims.bool * term' syntax) Prims.list


type typ =
term' syntax


type arg =
(term' syntax * aqual)


type args =
(term' syntax * aqual) Prims.list


type binder =
(bv * aqual)


type binders =
(bv * aqual) Prims.list


type uvar =
(term' syntax FStar_Pervasives_Native.option FStar_Unionfind.p_uvar * version)


type lbname =
(bv, fv) FStar_Util.either


type letbindings =
(Prims.bool * letbinding Prims.list)


type subst_ts =
(subst_elt Prims.list Prims.list * FStar_Range.range FStar_Pervasives_Native.option)


type freenames =
bv FStar_Util.set


type uvars =
((term' syntax FStar_Pervasives_Native.option FStar_Unionfind.p_uvar * version) * term' syntax) FStar_Util.set


type attribute =
term' syntax


let lazy_chooser : (lazy_kind  ->  lazyinfo  ->  term) FStar_Pervasives_Native.option FStar_ST.ref = (FStar_Util.mk_ref FStar_Pervasives_Native.None)


let mk_lcomp : FStar_Ident.lident  ->  typ  ->  cflags Prims.list  ->  (unit  ->  comp)  ->  lcomp = (fun eff_name res_typ cflags comp_thunk -> (

let uu____4508 = (FStar_Util.mk_ref (FStar_Util.Inl (comp_thunk)))
in {eff_name = eff_name; res_typ = res_typ; cflags = cflags; comp_thunk = uu____4508}))


let lcomp_comp : lcomp  ->  comp = (fun lc -> (

let uu____4611 = (FStar_ST.op_Bang lc.comp_thunk)
in (match (uu____4611) with
| FStar_Util.Inl (thunk) -> begin
(

let c = (thunk ())
in ((FStar_ST.op_Colon_Equals lc.comp_thunk (FStar_Util.Inr (c)));
c;
))
end
| FStar_Util.Inr (c) -> begin
c
end)))


type tscheme =
(univ_name Prims.list * typ)


type freenames_l =
bv Prims.list


type formula =
typ


type formulae =
typ Prims.list

type qualifier =
| Assumption
| New
| Private
| Unfold_for_unification_and_vcgen
| Visible_default
| Irreducible
| Abstract
| Inline_for_extraction
| NoExtract
| Noeq
| Unopteq
| TotalEffect
| Reifiable
| Reflectable of FStar_Ident.lident
| Discriminator of FStar_Ident.lident
| Projector of (FStar_Ident.lident * FStar_Ident.ident)
| RecordType of (FStar_Ident.ident Prims.list * FStar_Ident.ident Prims.list)
| RecordConstructor of (FStar_Ident.ident Prims.list * FStar_Ident.ident Prims.list)
| Action of FStar_Ident.lident
| ExceptionConstructor
| HasMaskedEffect
| Effect
| OnlyName


let uu___is_Assumption : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Assumption -> begin
true
end
| uu____4824 -> begin
false
end))


let uu___is_New : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| New -> begin
true
end
| uu____4830 -> begin
false
end))


let uu___is_Private : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Private -> begin
true
end
| uu____4836 -> begin
false
end))


let uu___is_Unfold_for_unification_and_vcgen : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Unfold_for_unification_and_vcgen -> begin
true
end
| uu____4842 -> begin
false
end))


let uu___is_Visible_default : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Visible_default -> begin
true
end
| uu____4848 -> begin
false
end))


let uu___is_Irreducible : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Irreducible -> begin
true
end
| uu____4854 -> begin
false
end))


let uu___is_Abstract : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Abstract -> begin
true
end
| uu____4860 -> begin
false
end))


let uu___is_Inline_for_extraction : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Inline_for_extraction -> begin
true
end
| uu____4866 -> begin
false
end))


let uu___is_NoExtract : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NoExtract -> begin
true
end
| uu____4872 -> begin
false
end))


let uu___is_Noeq : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Noeq -> begin
true
end
| uu____4878 -> begin
false
end))


let uu___is_Unopteq : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Unopteq -> begin
true
end
| uu____4884 -> begin
false
end))


let uu___is_TotalEffect : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| TotalEffect -> begin
true
end
| uu____4890 -> begin
false
end))


let uu___is_Reifiable : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Reifiable -> begin
true
end
| uu____4896 -> begin
false
end))


let uu___is_Reflectable : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Reflectable (_0) -> begin
true
end
| uu____4903 -> begin
false
end))


let __proj__Reflectable__item___0 : qualifier  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| Reflectable (_0) -> begin
_0
end))


let uu___is_Discriminator : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Discriminator (_0) -> begin
true
end
| uu____4917 -> begin
false
end))


let __proj__Discriminator__item___0 : qualifier  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| Discriminator (_0) -> begin
_0
end))


let uu___is_Projector : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Projector (_0) -> begin
true
end
| uu____4935 -> begin
false
end))


let __proj__Projector__item___0 : qualifier  ->  (FStar_Ident.lident * FStar_Ident.ident) = (fun projectee -> (match (projectee) with
| Projector (_0) -> begin
_0
end))


let uu___is_RecordType : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| RecordType (_0) -> begin
true
end
| uu____4969 -> begin
false
end))


let __proj__RecordType__item___0 : qualifier  ->  (FStar_Ident.ident Prims.list * FStar_Ident.ident Prims.list) = (fun projectee -> (match (projectee) with
| RecordType (_0) -> begin
_0
end))


let uu___is_RecordConstructor : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| RecordConstructor (_0) -> begin
true
end
| uu____5015 -> begin
false
end))


let __proj__RecordConstructor__item___0 : qualifier  ->  (FStar_Ident.ident Prims.list * FStar_Ident.ident Prims.list) = (fun projectee -> (match (projectee) with
| RecordConstructor (_0) -> begin
_0
end))


let uu___is_Action : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Action (_0) -> begin
true
end
| uu____5053 -> begin
false
end))


let __proj__Action__item___0 : qualifier  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| Action (_0) -> begin
_0
end))


let uu___is_ExceptionConstructor : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| ExceptionConstructor -> begin
true
end
| uu____5066 -> begin
false
end))


let uu___is_HasMaskedEffect : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| HasMaskedEffect -> begin
true
end
| uu____5072 -> begin
false
end))


let uu___is_Effect : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Effect -> begin
true
end
| uu____5078 -> begin
false
end))


let uu___is_OnlyName : qualifier  ->  Prims.bool = (fun projectee -> (match (projectee) with
| OnlyName -> begin
true
end
| uu____5084 -> begin
false
end))


type tycon =
(FStar_Ident.lident * binders * typ)

type monad_abbrev =
{mabbrev : FStar_Ident.lident; parms : binders; def : typ}


let __proj__Mkmonad_abbrev__item__mabbrev : monad_abbrev  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| {mabbrev = __fname__mabbrev; parms = __fname__parms; def = __fname__def} -> begin
__fname__mabbrev
end))


let __proj__Mkmonad_abbrev__item__parms : monad_abbrev  ->  binders = (fun projectee -> (match (projectee) with
| {mabbrev = __fname__mabbrev; parms = __fname__parms; def = __fname__def} -> begin
__fname__parms
end))


let __proj__Mkmonad_abbrev__item__def : monad_abbrev  ->  typ = (fun projectee -> (match (projectee) with
| {mabbrev = __fname__mabbrev; parms = __fname__parms; def = __fname__def} -> begin
__fname__def
end))

type sub_eff =
{source : FStar_Ident.lident; target : FStar_Ident.lident; lift_wp : tscheme FStar_Pervasives_Native.option; lift : tscheme FStar_Pervasives_Native.option}


let __proj__Mksub_eff__item__source : sub_eff  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| {source = __fname__source; target = __fname__target; lift_wp = __fname__lift_wp; lift = __fname__lift} -> begin
__fname__source
end))


let __proj__Mksub_eff__item__target : sub_eff  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| {source = __fname__source; target = __fname__target; lift_wp = __fname__lift_wp; lift = __fname__lift} -> begin
__fname__target
end))


let __proj__Mksub_eff__item__lift_wp : sub_eff  ->  tscheme FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {source = __fname__source; target = __fname__target; lift_wp = __fname__lift_wp; lift = __fname__lift} -> begin
__fname__lift_wp
end))


let __proj__Mksub_eff__item__lift : sub_eff  ->  tscheme FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {source = __fname__source; target = __fname__target; lift_wp = __fname__lift_wp; lift = __fname__lift} -> begin
__fname__lift
end))

type action =
{action_name : FStar_Ident.lident; action_unqualified_name : FStar_Ident.ident; action_univs : univ_names; action_params : binders; action_defn : term; action_typ : typ}


let __proj__Mkaction__item__action_name : action  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| {action_name = __fname__action_name; action_unqualified_name = __fname__action_unqualified_name; action_univs = __fname__action_univs; action_params = __fname__action_params; action_defn = __fname__action_defn; action_typ = __fname__action_typ} -> begin
__fname__action_name
end))


let __proj__Mkaction__item__action_unqualified_name : action  ->  FStar_Ident.ident = (fun projectee -> (match (projectee) with
| {action_name = __fname__action_name; action_unqualified_name = __fname__action_unqualified_name; action_univs = __fname__action_univs; action_params = __fname__action_params; action_defn = __fname__action_defn; action_typ = __fname__action_typ} -> begin
__fname__action_unqualified_name
end))


let __proj__Mkaction__item__action_univs : action  ->  univ_names = (fun projectee -> (match (projectee) with
| {action_name = __fname__action_name; action_unqualified_name = __fname__action_unqualified_name; action_univs = __fname__action_univs; action_params = __fname__action_params; action_defn = __fname__action_defn; action_typ = __fname__action_typ} -> begin
__fname__action_univs
end))


let __proj__Mkaction__item__action_params : action  ->  binders = (fun projectee -> (match (projectee) with
| {action_name = __fname__action_name; action_unqualified_name = __fname__action_unqualified_name; action_univs = __fname__action_univs; action_params = __fname__action_params; action_defn = __fname__action_defn; action_typ = __fname__action_typ} -> begin
__fname__action_params
end))


let __proj__Mkaction__item__action_defn : action  ->  term = (fun projectee -> (match (projectee) with
| {action_name = __fname__action_name; action_unqualified_name = __fname__action_unqualified_name; action_univs = __fname__action_univs; action_params = __fname__action_params; action_defn = __fname__action_defn; action_typ = __fname__action_typ} -> begin
__fname__action_defn
end))


let __proj__Mkaction__item__action_typ : action  ->  typ = (fun projectee -> (match (projectee) with
| {action_name = __fname__action_name; action_unqualified_name = __fname__action_unqualified_name; action_univs = __fname__action_univs; action_params = __fname__action_params; action_defn = __fname__action_defn; action_typ = __fname__action_typ} -> begin
__fname__action_typ
end))

type eff_decl =
{cattributes : cflags Prims.list; mname : FStar_Ident.lident; univs : univ_names; binders : binders; signature : term; ret_wp : tscheme; bind_wp : tscheme; if_then_else : tscheme; ite_wp : tscheme; stronger : tscheme; close_wp : tscheme; assert_p : tscheme; assume_p : tscheme; null_wp : tscheme; trivial : tscheme; repr : term; return_repr : tscheme; bind_repr : tscheme; actions : action Prims.list; eff_attrs : attribute Prims.list}


let __proj__Mkeff_decl__item__cattributes : eff_decl  ->  cflags Prims.list = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__cattributes
end))


let __proj__Mkeff_decl__item__mname : eff_decl  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__mname
end))


let __proj__Mkeff_decl__item__univs : eff_decl  ->  univ_names = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__univs
end))


let __proj__Mkeff_decl__item__binders : eff_decl  ->  binders = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__binders
end))


let __proj__Mkeff_decl__item__signature : eff_decl  ->  term = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__signature
end))


let __proj__Mkeff_decl__item__ret_wp : eff_decl  ->  tscheme = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__ret_wp
end))


let __proj__Mkeff_decl__item__bind_wp : eff_decl  ->  tscheme = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__bind_wp
end))


let __proj__Mkeff_decl__item__if_then_else : eff_decl  ->  tscheme = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__if_then_else
end))


let __proj__Mkeff_decl__item__ite_wp : eff_decl  ->  tscheme = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__ite_wp
end))


let __proj__Mkeff_decl__item__stronger : eff_decl  ->  tscheme = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__stronger
end))


let __proj__Mkeff_decl__item__close_wp : eff_decl  ->  tscheme = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__close_wp
end))


let __proj__Mkeff_decl__item__assert_p : eff_decl  ->  tscheme = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__assert_p
end))


let __proj__Mkeff_decl__item__assume_p : eff_decl  ->  tscheme = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__assume_p
end))


let __proj__Mkeff_decl__item__null_wp : eff_decl  ->  tscheme = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__null_wp
end))


let __proj__Mkeff_decl__item__trivial : eff_decl  ->  tscheme = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__trivial
end))


let __proj__Mkeff_decl__item__repr : eff_decl  ->  term = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__repr
end))


let __proj__Mkeff_decl__item__return_repr : eff_decl  ->  tscheme = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__return_repr
end))


let __proj__Mkeff_decl__item__bind_repr : eff_decl  ->  tscheme = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__bind_repr
end))


let __proj__Mkeff_decl__item__actions : eff_decl  ->  action Prims.list = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__actions
end))


let __proj__Mkeff_decl__item__eff_attrs : eff_decl  ->  attribute Prims.list = (fun projectee -> (match (projectee) with
| {cattributes = __fname__cattributes; mname = __fname__mname; univs = __fname__univs; binders = __fname__binders; signature = __fname__signature; ret_wp = __fname__ret_wp; bind_wp = __fname__bind_wp; if_then_else = __fname__if_then_else; ite_wp = __fname__ite_wp; stronger = __fname__stronger; close_wp = __fname__close_wp; assert_p = __fname__assert_p; assume_p = __fname__assume_p; null_wp = __fname__null_wp; trivial = __fname__trivial; repr = __fname__repr; return_repr = __fname__return_repr; bind_repr = __fname__bind_repr; actions = __fname__actions; eff_attrs = __fname__eff_attrs} -> begin
__fname__eff_attrs
end))

type sig_metadata =
{sigmeta_active : Prims.bool; sigmeta_fact_db_ids : Prims.string Prims.list}


let __proj__Mksig_metadata__item__sigmeta_active : sig_metadata  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {sigmeta_active = __fname__sigmeta_active; sigmeta_fact_db_ids = __fname__sigmeta_fact_db_ids} -> begin
__fname__sigmeta_active
end))


let __proj__Mksig_metadata__item__sigmeta_fact_db_ids : sig_metadata  ->  Prims.string Prims.list = (fun projectee -> (match (projectee) with
| {sigmeta_active = __fname__sigmeta_active; sigmeta_fact_db_ids = __fname__sigmeta_fact_db_ids} -> begin
__fname__sigmeta_fact_db_ids
end))

type sigelt' =
| Sig_inductive_typ of (FStar_Ident.lident * univ_names * binders * typ * FStar_Ident.lident Prims.list * FStar_Ident.lident Prims.list)
| Sig_bundle of (sigelt Prims.list * FStar_Ident.lident Prims.list)
| Sig_datacon of (FStar_Ident.lident * univ_names * typ * FStar_Ident.lident * Prims.int * FStar_Ident.lident Prims.list)
| Sig_declare_typ of (FStar_Ident.lident * univ_names * typ)
| Sig_let of (letbindings * FStar_Ident.lident Prims.list)
| Sig_main of term
| Sig_assume of (FStar_Ident.lident * univ_names * formula)
| Sig_new_effect of eff_decl
| Sig_new_effect_for_free of eff_decl
| Sig_sub_effect of sub_eff
| Sig_effect_abbrev of (FStar_Ident.lident * univ_names * binders * comp * cflags Prims.list)
| Sig_pragma of pragma
| Sig_splice of (FStar_Ident.lident Prims.list * term) 
 and sigelt =
{sigel : sigelt'; sigrng : FStar_Range.range; sigquals : qualifier Prims.list; sigmeta : sig_metadata; sigattrs : attribute Prims.list}


let uu___is_Sig_inductive_typ : sigelt'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Sig_inductive_typ (_0) -> begin
true
end
| uu____6272 -> begin
false
end))


let __proj__Sig_inductive_typ__item___0 : sigelt'  ->  (FStar_Ident.lident * univ_names * binders * typ * FStar_Ident.lident Prims.list * FStar_Ident.lident Prims.list) = (fun projectee -> (match (projectee) with
| Sig_inductive_typ (_0) -> begin
_0
end))


let uu___is_Sig_bundle : sigelt'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Sig_bundle (_0) -> begin
true
end
| uu____6342 -> begin
false
end))


let __proj__Sig_bundle__item___0 : sigelt'  ->  (sigelt Prims.list * FStar_Ident.lident Prims.list) = (fun projectee -> (match (projectee) with
| Sig_bundle (_0) -> begin
_0
end))


let uu___is_Sig_datacon : sigelt'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Sig_datacon (_0) -> begin
true
end
| uu____6394 -> begin
false
end))


let __proj__Sig_datacon__item___0 : sigelt'  ->  (FStar_Ident.lident * univ_names * typ * FStar_Ident.lident * Prims.int * FStar_Ident.lident Prims.list) = (fun projectee -> (match (projectee) with
| Sig_datacon (_0) -> begin
_0
end))


let uu___is_Sig_declare_typ : sigelt'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Sig_declare_typ (_0) -> begin
true
end
| uu____6456 -> begin
false
end))


let __proj__Sig_declare_typ__item___0 : sigelt'  ->  (FStar_Ident.lident * univ_names * typ) = (fun projectee -> (match (projectee) with
| Sig_declare_typ (_0) -> begin
_0
end))


let uu___is_Sig_let : sigelt'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Sig_let (_0) -> begin
true
end
| uu____6494 -> begin
false
end))


let __proj__Sig_let__item___0 : sigelt'  ->  (letbindings * FStar_Ident.lident Prims.list) = (fun projectee -> (match (projectee) with
| Sig_let (_0) -> begin
_0
end))


let uu___is_Sig_main : sigelt'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Sig_main (_0) -> begin
true
end
| uu____6526 -> begin
false
end))


let __proj__Sig_main__item___0 : sigelt'  ->  term = (fun projectee -> (match (projectee) with
| Sig_main (_0) -> begin
_0
end))


let uu___is_Sig_assume : sigelt'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Sig_assume (_0) -> begin
true
end
| uu____6546 -> begin
false
end))


let __proj__Sig_assume__item___0 : sigelt'  ->  (FStar_Ident.lident * univ_names * formula) = (fun projectee -> (match (projectee) with
| Sig_assume (_0) -> begin
_0
end))


let uu___is_Sig_new_effect : sigelt'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Sig_new_effect (_0) -> begin
true
end
| uu____6578 -> begin
false
end))


let __proj__Sig_new_effect__item___0 : sigelt'  ->  eff_decl = (fun projectee -> (match (projectee) with
| Sig_new_effect (_0) -> begin
_0
end))


let uu___is_Sig_new_effect_for_free : sigelt'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Sig_new_effect_for_free (_0) -> begin
true
end
| uu____6592 -> begin
false
end))


let __proj__Sig_new_effect_for_free__item___0 : sigelt'  ->  eff_decl = (fun projectee -> (match (projectee) with
| Sig_new_effect_for_free (_0) -> begin
_0
end))


let uu___is_Sig_sub_effect : sigelt'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Sig_sub_effect (_0) -> begin
true
end
| uu____6606 -> begin
false
end))


let __proj__Sig_sub_effect__item___0 : sigelt'  ->  sub_eff = (fun projectee -> (match (projectee) with
| Sig_sub_effect (_0) -> begin
_0
end))


let uu___is_Sig_effect_abbrev : sigelt'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Sig_effect_abbrev (_0) -> begin
true
end
| uu____6632 -> begin
false
end))


let __proj__Sig_effect_abbrev__item___0 : sigelt'  ->  (FStar_Ident.lident * univ_names * binders * comp * cflags Prims.list) = (fun projectee -> (match (projectee) with
| Sig_effect_abbrev (_0) -> begin
_0
end))


let uu___is_Sig_pragma : sigelt'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Sig_pragma (_0) -> begin
true
end
| uu____6682 -> begin
false
end))


let __proj__Sig_pragma__item___0 : sigelt'  ->  pragma = (fun projectee -> (match (projectee) with
| Sig_pragma (_0) -> begin
_0
end))


let uu___is_Sig_splice : sigelt'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Sig_splice (_0) -> begin
true
end
| uu____6702 -> begin
false
end))


let __proj__Sig_splice__item___0 : sigelt'  ->  (FStar_Ident.lident Prims.list * term) = (fun projectee -> (match (projectee) with
| Sig_splice (_0) -> begin
_0
end))


let __proj__Mksigelt__item__sigel : sigelt  ->  sigelt' = (fun projectee -> (match (projectee) with
| {sigel = __fname__sigel; sigrng = __fname__sigrng; sigquals = __fname__sigquals; sigmeta = __fname__sigmeta; sigattrs = __fname__sigattrs} -> begin
__fname__sigel
end))


let __proj__Mksigelt__item__sigrng : sigelt  ->  FStar_Range.range = (fun projectee -> (match (projectee) with
| {sigel = __fname__sigel; sigrng = __fname__sigrng; sigquals = __fname__sigquals; sigmeta = __fname__sigmeta; sigattrs = __fname__sigattrs} -> begin
__fname__sigrng
end))


let __proj__Mksigelt__item__sigquals : sigelt  ->  qualifier Prims.list = (fun projectee -> (match (projectee) with
| {sigel = __fname__sigel; sigrng = __fname__sigrng; sigquals = __fname__sigquals; sigmeta = __fname__sigmeta; sigattrs = __fname__sigattrs} -> begin
__fname__sigquals
end))


let __proj__Mksigelt__item__sigmeta : sigelt  ->  sig_metadata = (fun projectee -> (match (projectee) with
| {sigel = __fname__sigel; sigrng = __fname__sigrng; sigquals = __fname__sigquals; sigmeta = __fname__sigmeta; sigattrs = __fname__sigattrs} -> begin
__fname__sigmeta
end))


let __proj__Mksigelt__item__sigattrs : sigelt  ->  attribute Prims.list = (fun projectee -> (match (projectee) with
| {sigel = __fname__sigel; sigrng = __fname__sigrng; sigquals = __fname__sigquals; sigmeta = __fname__sigmeta; sigattrs = __fname__sigattrs} -> begin
__fname__sigattrs
end))


type sigelts =
sigelt Prims.list

type modul =
{name : FStar_Ident.lident; declarations : sigelts; exports : sigelts; is_interface : Prims.bool}


let __proj__Mkmodul__item__name : modul  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| {name = __fname__name; declarations = __fname__declarations; exports = __fname__exports; is_interface = __fname__is_interface} -> begin
__fname__name
end))


let __proj__Mkmodul__item__declarations : modul  ->  sigelts = (fun projectee -> (match (projectee) with
| {name = __fname__name; declarations = __fname__declarations; exports = __fname__exports; is_interface = __fname__is_interface} -> begin
__fname__declarations
end))


let __proj__Mkmodul__item__exports : modul  ->  sigelts = (fun projectee -> (match (projectee) with
| {name = __fname__name; declarations = __fname__declarations; exports = __fname__exports; is_interface = __fname__is_interface} -> begin
__fname__exports
end))


let __proj__Mkmodul__item__is_interface : modul  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {name = __fname__name; declarations = __fname__declarations; exports = __fname__exports; is_interface = __fname__is_interface} -> begin
__fname__is_interface
end))


let mod_name : modul  ->  FStar_Ident.lident = (fun m -> m.name)


type path =
Prims.string Prims.list


type subst_t =
subst_elt Prims.list


type 'a mk_t_a =
unit FStar_Pervasives_Native.option  ->  FStar_Range.range  ->  'a syntax


type mk_t =
term' mk_t_a


let contains_reflectable : qualifier Prims.list  ->  Prims.bool = (fun l -> (FStar_Util.for_some (fun uu___35_6902 -> (match (uu___35_6902) with
| Reflectable (uu____6903) -> begin
true
end
| uu____6904 -> begin
false
end)) l))


let withinfo : 'a . 'a  ->  FStar_Range.range  ->  'a withinfo_t = (fun v1 r -> {v = v1; p = r})


let withsort : 'a . 'a  ->  'a withinfo_t = (fun v1 -> (withinfo v1 FStar_Range.dummyRange))


let bv_eq : bv  ->  bv  ->  Prims.bool = (fun bv1 bv2 -> ((Prims.op_Equality bv1.ppname.FStar_Ident.idText bv2.ppname.FStar_Ident.idText) && (Prims.op_Equality bv1.index bv2.index)))


let order_bv : bv  ->  bv  ->  Prims.int = (fun x y -> (

let i = (FStar_String.compare x.ppname.FStar_Ident.idText y.ppname.FStar_Ident.idText)
in (match ((Prims.op_Equality i (Prims.parse_int "0"))) with
| true -> begin
(x.index - y.index)
end
| uu____6957 -> begin
i
end)))


let order_fv : FStar_Ident.lident  ->  FStar_Ident.lident  ->  Prims.int = (fun x y -> (FStar_String.compare x.FStar_Ident.str y.FStar_Ident.str))


let range_of_lbname : lbname  ->  FStar_Range.range = (fun l -> (match (l) with
| FStar_Util.Inl (x) -> begin
x.ppname.FStar_Ident.idRange
end
| FStar_Util.Inr (fv) -> begin
(FStar_Ident.range_of_lid fv.fv_name.v)
end))


let range_of_bv : bv  ->  FStar_Range.range = (fun x -> x.ppname.FStar_Ident.idRange)


let set_range_of_bv : bv  ->  FStar_Range.range  ->  bv = (fun x r -> (

let uu___42_6990 = x
in (

let uu____6991 = (FStar_Ident.mk_ident ((x.ppname.FStar_Ident.idText), (r)))
in {ppname = uu____6991; index = uu___42_6990.index; sort = uu___42_6990.sort})))


let on_antiquoted : (term  ->  term)  ->  quoteinfo  ->  quoteinfo = (fun f qi -> (

let aq = (FStar_List.map (fun uu____7033 -> (match (uu____7033) with
| (bv, b, t) -> begin
(

let uu____7049 = (f t)
in ((bv), (b), (uu____7049)))
end)) qi.antiquotes)
in (

let uu___43_7050 = qi
in {qkind = uu___43_7050.qkind; antiquotes = aq})))


let lookup_aq : bv  ->  antiquotations  ->  (Prims.bool * term) FStar_Pervasives_Native.option = (fun bv aq -> (

let uu____7073 = (FStar_List.tryFind (fun uu____7096 -> (match (uu____7096) with
| (bv', uu____7106, uu____7107) -> begin
(bv_eq bv bv')
end)) aq)
in (match (uu____7073) with
| FStar_Pervasives_Native.Some (uu____7118, b, e) -> begin
FStar_Pervasives_Native.Some (((b), (e)))
end
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end)))


let syn : 'Auu____7165 'Auu____7166 'Auu____7167 . 'Auu____7165  ->  'Auu____7166  ->  ('Auu____7166  ->  'Auu____7165  ->  'Auu____7167)  ->  'Auu____7167 = (fun p k f -> (f k p))


let mk_fvs : 'Auu____7232 . unit  ->  'Auu____7232 FStar_Pervasives_Native.option FStar_ST.ref = (fun uu____7241 -> (FStar_Util.mk_ref FStar_Pervasives_Native.None))


let mk_uvs : 'Auu____7283 . unit  ->  'Auu____7283 FStar_Pervasives_Native.option FStar_ST.ref = (fun uu____7292 -> (FStar_Util.mk_ref FStar_Pervasives_Native.None))


let new_bv_set : unit  ->  bv FStar_Util.set = (fun uu____7301 -> (FStar_Util.new_set order_bv))


let new_fv_set : unit  ->  FStar_Ident.lident FStar_Util.set = (fun uu____7310 -> (FStar_Util.new_set order_fv))


let order_univ_name : univ_name  ->  univ_name  ->  Prims.int = (fun x y -> (

let uu____7323 = (FStar_Ident.text_of_id x)
in (

let uu____7324 = (FStar_Ident.text_of_id y)
in (FStar_String.compare uu____7323 uu____7324))))


let new_universe_names_set : unit  ->  univ_name FStar_Util.set = (fun uu____7331 -> (FStar_Util.new_set order_univ_name))


let no_names : bv FStar_Util.set = (new_bv_set ())


let no_fvars : FStar_Ident.lident FStar_Util.set = (new_fv_set ())


let no_universe_names : univ_name FStar_Util.set = (new_universe_names_set ())


let freenames_of_list : bv Prims.list  ->  freenames = (fun l -> (FStar_List.fold_right FStar_Util.set_add l no_names))


let list_of_freenames : freenames  ->  bv Prims.list = (fun fvs -> (FStar_Util.set_elements fvs))


let mk : 'a . 'a  ->  'a mk_t_a = (fun t uu____7384 r -> (

let uu____7388 = (FStar_Util.mk_ref FStar_Pervasives_Native.None)
in {n = t; pos = r; vars = uu____7388}))


let bv_to_tm : bv  ->  term = (fun bv -> (

let uu____7468 = (range_of_bv bv)
in (mk (Tm_bvar (bv)) FStar_Pervasives_Native.None uu____7468)))


let bv_to_name : bv  ->  term = (fun bv -> (

let uu____7474 = (range_of_bv bv)
in (mk (Tm_name (bv)) FStar_Pervasives_Native.None uu____7474)))


let mk_Tm_app : term  ->  args  ->  mk_t = (fun t1 args k p -> (match (args) with
| [] -> begin
t1
end
| uu____7503 -> begin
(mk (Tm_app (((t1), (args)))) FStar_Pervasives_Native.None p)
end))


let mk_Tm_uinst : term  ->  universes  ->  term = (fun t uu___36_7517 -> (match (uu___36_7517) with
| [] -> begin
t
end
| us -> begin
(match (t.n) with
| Tm_fvar (uu____7519) -> begin
(mk (Tm_uinst (((t), (us)))) FStar_Pervasives_Native.None t.pos)
end
| uu____7520 -> begin
(failwith "Unexpected universe instantiation")
end)
end))


let extend_app_n : term  ->  args  ->  mk_t = (fun t args' kopt r -> (match (t.n) with
| Tm_app (head1, args) -> begin
(mk_Tm_app head1 (FStar_List.append args args') kopt r)
end
| uu____7575 -> begin
(mk_Tm_app t args' kopt r)
end))


let extend_app : term  ->  arg  ->  mk_t = (fun t arg kopt r -> (extend_app_n t ((arg)::[]) kopt r))


let mk_Tm_delayed : (term * subst_ts)  ->  FStar_Range.range  ->  term = (fun lr pos -> (

let uu____7618 = (

let uu____7625 = (

let uu____7626 = (

let uu____7651 = (FStar_Util.mk_ref FStar_Pervasives_Native.None)
in ((lr), (uu____7651)))
in Tm_delayed (uu____7626))
in (mk uu____7625))
in (uu____7618 FStar_Pervasives_Native.None pos)))


let mk_Total' : typ  ->  universe FStar_Pervasives_Native.option  ->  comp = (fun t u -> (mk (Total (((t), (u)))) FStar_Pervasives_Native.None t.pos))


let mk_GTotal' : typ  ->  universe FStar_Pervasives_Native.option  ->  comp = (fun t u -> (mk (GTotal (((t), (u)))) FStar_Pervasives_Native.None t.pos))


let mk_Total : typ  ->  comp = (fun t -> (mk_Total' t FStar_Pervasives_Native.None))


let mk_GTotal : typ  ->  comp = (fun t -> (mk_GTotal' t FStar_Pervasives_Native.None))


let mk_Comp : comp_typ  ->  comp = (fun ct -> (mk (Comp (ct)) FStar_Pervasives_Native.None ct.result_typ.pos))


let mk_lb : (lbname * univ_name Prims.list * FStar_Ident.lident * typ * term * FStar_Range.range)  ->  letbinding = (fun uu____7812 -> (match (uu____7812) with
| (x, univs, eff, t, e, pos) -> begin
{lbname = x; lbunivs = univs; lbtyp = t; lbeff = eff; lbdef = e; lbattrs = []; lbpos = pos}
end))


let default_sigmeta : sig_metadata = {sigmeta_active = true; sigmeta_fact_db_ids = []}


let mk_sigelt : sigelt'  ->  sigelt = (fun e -> {sigel = e; sigrng = FStar_Range.dummyRange; sigquals = []; sigmeta = default_sigmeta; sigattrs = []})


let mk_subst : subst_t  ->  subst_t = (fun s -> s)


let extend_subst : subst_elt  ->  subst_elt Prims.list  ->  subst_t = (fun x s -> (x)::s)


let argpos : arg  ->  FStar_Range.range = (fun x -> (FStar_Pervasives_Native.fst x).pos)


let tun : term' syntax = (mk Tm_unknown FStar_Pervasives_Native.None FStar_Range.dummyRange)


let teff : term' syntax = (mk (Tm_constant (FStar_Const.Const_effect)) FStar_Pervasives_Native.None FStar_Range.dummyRange)


let is_teff : term  ->  Prims.bool = (fun t -> (match (t.n) with
| Tm_constant (FStar_Const.Const_effect) -> begin
true
end
| uu____7879 -> begin
false
end))


let is_type : term  ->  Prims.bool = (fun t -> (match (t.n) with
| Tm_type (uu____7885) -> begin
true
end
| uu____7886 -> begin
false
end))


let null_id : FStar_Ident.ident = (FStar_Ident.mk_ident (("_"), (FStar_Range.dummyRange)))


let null_bv : term  ->  bv = (fun k -> {ppname = null_id; index = (Prims.parse_int "0"); sort = k})


let mk_binder : bv  ->  binder = (fun a -> ((a), (FStar_Pervasives_Native.None)))


let null_binder : term  ->  binder = (fun t -> (

let uu____7904 = (null_bv t)
in ((uu____7904), (FStar_Pervasives_Native.None))))


let imp_tag : arg_qualifier = Implicit (false)


let iarg : term  ->  arg = (fun t -> ((t), (FStar_Pervasives_Native.Some (imp_tag))))


let as_arg : term  ->  arg = (fun t -> ((t), (FStar_Pervasives_Native.None)))


let is_null_bv : bv  ->  Prims.bool = (fun b -> (Prims.op_Equality b.ppname.FStar_Ident.idText null_id.FStar_Ident.idText))


let is_null_binder : binder  ->  Prims.bool = (fun b -> (is_null_bv (FStar_Pervasives_Native.fst b)))


let is_top_level : letbinding Prims.list  ->  Prims.bool = (fun uu___37_7937 -> (match (uu___37_7937) with
| ({lbname = FStar_Util.Inr (uu____7940); lbunivs = uu____7941; lbtyp = uu____7942; lbeff = uu____7943; lbdef = uu____7944; lbattrs = uu____7945; lbpos = uu____7946})::uu____7947 -> begin
true
end
| uu____7960 -> begin
false
end))


let freenames_of_binders : binders  ->  freenames = (fun bs -> (FStar_List.fold_right (fun uu____7978 out -> (match (uu____7978) with
| (x, uu____7989) -> begin
(FStar_Util.set_add x out)
end)) bs no_names))


let binders_of_list : bv Prims.list  ->  binders = (fun fvs -> (FStar_All.pipe_right fvs (FStar_List.map (fun t -> ((t), (FStar_Pervasives_Native.None))))))


let binders_of_freenames : freenames  ->  binders = (fun fvs -> (

let uu____8024 = (FStar_Util.set_elements fvs)
in (FStar_All.pipe_right uu____8024 binders_of_list)))


let is_implicit : aqual  ->  Prims.bool = (fun uu___38_8033 -> (match (uu___38_8033) with
| FStar_Pervasives_Native.Some (Implicit (uu____8034)) -> begin
true
end
| uu____8035 -> begin
false
end))


let as_implicit : Prims.bool  ->  aqual = (fun uu___39_8040 -> (match (uu___39_8040) with
| true -> begin
FStar_Pervasives_Native.Some (imp_tag)
end
| uu____8041 -> begin
FStar_Pervasives_Native.None
end))


let pat_bvs : pat  ->  bv Prims.list = (fun p -> (

let rec aux = (fun b p1 -> (match (p1.v) with
| Pat_dot_term (uu____8074) -> begin
b
end
| Pat_constant (uu____8081) -> begin
b
end
| Pat_wild (x) -> begin
(x)::b
end
| Pat_var (x) -> begin
(x)::b
end
| Pat_cons (uu____8084, pats) -> begin
(FStar_List.fold_left (fun b1 uu____8115 -> (match (uu____8115) with
| (p2, uu____8127) -> begin
(aux b1 p2)
end)) b pats)
end))
in (

let uu____8132 = (aux [] p)
in (FStar_All.pipe_left FStar_List.rev uu____8132))))


let gen_reset : ((unit  ->  Prims.int) * (unit  ->  unit)) = (

let x = (FStar_Util.mk_ref (Prims.parse_int "0"))
in (

let gen1 = (fun uu____8157 -> ((FStar_Util.incr x);
(FStar_ST.op_Bang x);
))
in (

let reset = (fun uu____8368 -> (FStar_ST.op_Colon_Equals x (Prims.parse_int "0")))
in ((gen1), (reset)))))


let next_id : unit  ->  Prims.int = (FStar_Pervasives_Native.fst gen_reset)


let reset_gensym : unit  ->  unit = (FStar_Pervasives_Native.snd gen_reset)


let range_of_ropt : FStar_Range.range FStar_Pervasives_Native.option  ->  FStar_Range.range = (fun uu___40_8500 -> (match (uu___40_8500) with
| FStar_Pervasives_Native.None -> begin
FStar_Range.dummyRange
end
| FStar_Pervasives_Native.Some (r) -> begin
r
end))


let gen_bv : Prims.string  ->  FStar_Range.range FStar_Pervasives_Native.option  ->  typ  ->  bv = (fun s r t -> (

let id1 = (FStar_Ident.mk_ident ((s), ((range_of_ropt r))))
in (

let uu____8535 = (next_id ())
in {ppname = id1; index = uu____8535; sort = t})))


let new_bv : FStar_Range.range FStar_Pervasives_Native.option  ->  typ  ->  bv = (fun ropt t -> (gen_bv FStar_Ident.reserved_prefix ropt t))


let freshen_bv : bv  ->  bv = (fun bv -> (

let uu____8555 = (is_null_bv bv)
in (match (uu____8555) with
| true -> begin
(

let uu____8556 = (

let uu____8559 = (range_of_bv bv)
in FStar_Pervasives_Native.Some (uu____8559))
in (new_bv uu____8556 bv.sort))
end
| uu____8560 -> begin
(

let uu___44_8561 = bv
in (

let uu____8562 = (next_id ())
in {ppname = uu___44_8561.ppname; index = uu____8562; sort = uu___44_8561.sort}))
end)))


let new_univ_name : FStar_Range.range FStar_Pervasives_Native.option  ->  univ_name = (fun ropt -> (

let id1 = (next_id ())
in (

let uu____8573 = (

let uu____8578 = (

let uu____8579 = (FStar_Util.string_of_int id1)
in (Prims.strcat FStar_Ident.reserved_prefix uu____8579))
in ((uu____8578), ((range_of_ropt ropt))))
in (FStar_Ident.mk_ident uu____8573))))


let mkbv : FStar_Ident.ident  ->  Prims.int  ->  term' syntax  ->  bv = (fun x y t -> {ppname = x; index = y; sort = t})


let lbname_eq : (bv, FStar_Ident.lident) FStar_Util.either  ->  (bv, FStar_Ident.lident) FStar_Util.either  ->  Prims.bool = (fun l1 l2 -> (match (((l1), (l2))) with
| (FStar_Util.Inl (x), FStar_Util.Inl (y)) -> begin
(bv_eq x y)
end
| (FStar_Util.Inr (l), FStar_Util.Inr (m)) -> begin
(FStar_Ident.lid_equals l m)
end
| uu____8653 -> begin
false
end))


let fv_eq : fv  ->  fv  ->  Prims.bool = (fun fv1 fv2 -> (FStar_Ident.lid_equals fv1.fv_name.v fv2.fv_name.v))


let fv_eq_lid : fv  ->  FStar_Ident.lident  ->  Prims.bool = (fun fv lid -> (FStar_Ident.lid_equals fv.fv_name.v lid))


let set_bv_range : bv  ->  FStar_Range.range  ->  bv = (fun bv r -> (

let uu___45_8696 = bv
in (

let uu____8697 = (FStar_Ident.mk_ident ((bv.ppname.FStar_Ident.idText), (r)))
in {ppname = uu____8697; index = uu___45_8696.index; sort = uu___45_8696.sort})))


let lid_as_fv : FStar_Ident.lident  ->  delta_depth  ->  fv_qual FStar_Pervasives_Native.option  ->  fv = (fun l dd dq -> (

let uu____8717 = (

let uu____8718 = (FStar_Ident.range_of_lid l)
in (withinfo l uu____8718))
in {fv_name = uu____8717; fv_delta = dd; fv_qual = dq}))


let fv_to_tm : fv  ->  term = (fun fv -> (

let uu____8724 = (FStar_Ident.range_of_lid fv.fv_name.v)
in (mk (Tm_fvar (fv)) FStar_Pervasives_Native.None uu____8724)))


let fvar : FStar_Ident.lident  ->  delta_depth  ->  fv_qual FStar_Pervasives_Native.option  ->  term = (fun l dd dq -> (

let uu____8744 = (lid_as_fv l dd dq)
in (fv_to_tm uu____8744)))


let lid_of_fv : fv  ->  FStar_Ident.lid = (fun fv -> fv.fv_name.v)


let range_of_fv : fv  ->  FStar_Range.range = (fun fv -> (

let uu____8755 = (lid_of_fv fv)
in (FStar_Ident.range_of_lid uu____8755)))


let set_range_of_fv : fv  ->  FStar_Range.range  ->  fv = (fun fv r -> (

let uu___46_8766 = fv
in (

let uu____8767 = (

let uu___47_8768 = fv.fv_name
in (

let uu____8769 = (

let uu____8770 = (lid_of_fv fv)
in (FStar_Ident.set_lid_range uu____8770 r))
in {v = uu____8769; p = uu___47_8768.p}))
in {fv_name = uu____8767; fv_delta = uu___46_8766.fv_delta; fv_qual = uu___46_8766.fv_qual})))


let has_simple_attribute : term Prims.list  ->  Prims.string  ->  Prims.bool = (fun l s -> (FStar_List.existsb (fun uu___41_8792 -> (match (uu___41_8792) with
| {n = Tm_constant (FStar_Const.Const_string (data, uu____8796)); pos = uu____8797; vars = uu____8798} when (Prims.op_Equality data s) -> begin
true
end
| uu____8801 -> begin
false
end)) l))


let rec eq_pat : pat  ->  pat  ->  Prims.bool = (fun p1 p2 -> (match (((p1.v), (p2.v))) with
| (Pat_constant (c1), Pat_constant (c2)) -> begin
(FStar_Const.eq_const c1 c2)
end
| (Pat_cons (fv1, as1), Pat_cons (fv2, as2)) -> begin
(

let uu____8852 = (fv_eq fv1 fv2)
in (match (uu____8852) with
| true -> begin
(

let uu____8854 = (FStar_List.zip as1 as2)
in (FStar_All.pipe_right uu____8854 (FStar_List.for_all (fun uu____8920 -> (match (uu____8920) with
| ((p11, b1), (p21, b2)) -> begin
((Prims.op_Equality b1 b2) && (eq_pat p11 p21))
end)))))
end
| uu____8945 -> begin
false
end))
end
| (Pat_var (uu____8946), Pat_var (uu____8947)) -> begin
true
end
| (Pat_wild (uu____8948), Pat_wild (uu____8949)) -> begin
true
end
| (Pat_dot_term (bv1, t1), Pat_dot_term (bv2, t2)) -> begin
true
end
| (uu____8962, uu____8963) -> begin
false
end))


let delta_constant : delta_depth = Delta_constant_at_level ((Prims.parse_int "0"))


let delta_equational : delta_depth = Delta_equational_at_level ((Prims.parse_int "0"))


let tconst : FStar_Ident.lident  ->  term = (fun l -> (

let uu____8969 = (

let uu____8976 = (

let uu____8977 = (lid_as_fv l delta_constant FStar_Pervasives_Native.None)
in Tm_fvar (uu____8977))
in (mk uu____8976))
in (uu____8969 FStar_Pervasives_Native.None FStar_Range.dummyRange)))


let tabbrev : FStar_Ident.lident  ->  term = (fun l -> (

let uu____8986 = (

let uu____8993 = (

let uu____8994 = (lid_as_fv l (Delta_constant_at_level ((Prims.parse_int "1"))) FStar_Pervasives_Native.None)
in Tm_fvar (uu____8994))
in (mk uu____8993))
in (uu____8986 FStar_Pervasives_Native.None FStar_Range.dummyRange)))


let tdataconstr : FStar_Ident.lident  ->  term = (fun l -> (

let uu____9003 = (lid_as_fv l delta_constant (FStar_Pervasives_Native.Some (Data_ctor)))
in (fv_to_tm uu____9003)))


let t_unit : term = (tconst FStar_Parser_Const.unit_lid)


let t_bool : term = (tconst FStar_Parser_Const.bool_lid)


let t_int : term = (tconst FStar_Parser_Const.int_lid)


let t_string : term = (tconst FStar_Parser_Const.string_lid)


let t_float : term = (tconst FStar_Parser_Const.float_lid)


let t_char : term = (tabbrev FStar_Parser_Const.char_lid)


let t_range : term = (tconst FStar_Parser_Const.range_lid)


let t_term : term = (tconst FStar_Parser_Const.term_lid)


let t_order : term = (tconst FStar_Parser_Const.order_lid)


let t_decls : term = (tabbrev FStar_Parser_Const.decls_lid)


let t_binder : term = (tconst FStar_Parser_Const.binder_lid)


let t_binders : term = (tconst FStar_Parser_Const.binders_lid)


let t_bv : term = (tconst FStar_Parser_Const.bv_lid)


let t_fv : term = (tconst FStar_Parser_Const.fv_lid)


let t_norm_step : term = (tconst FStar_Parser_Const.norm_step_lid)


let t_tactic_unit : term' syntax = (

let uu____9006 = (

let uu____9011 = (

let uu____9012 = (tabbrev FStar_Parser_Const.tactic_lid)
in (mk_Tm_uinst uu____9012 ((U_zero)::[])))
in (

let uu____9013 = (

let uu____9014 = (as_arg t_unit)
in (uu____9014)::[])
in (mk_Tm_app uu____9011 uu____9013)))
in (uu____9006 FStar_Pervasives_Native.None FStar_Range.dummyRange))


let t_tac_unit : term' syntax = (

let uu____9019 = (

let uu____9024 = (

let uu____9025 = (tabbrev FStar_Parser_Const.u_tac_lid)
in (mk_Tm_uinst uu____9025 ((U_zero)::[])))
in (

let uu____9026 = (

let uu____9027 = (as_arg t_unit)
in (uu____9027)::[])
in (mk_Tm_app uu____9024 uu____9026)))
in (uu____9019 FStar_Pervasives_Native.None FStar_Range.dummyRange))


let t_list_of : term  ->  term = (fun t -> (

let uu____9035 = (

let uu____9040 = (

let uu____9041 = (tabbrev FStar_Parser_Const.list_lid)
in (mk_Tm_uinst uu____9041 ((U_zero)::[])))
in (

let uu____9042 = (

let uu____9043 = (as_arg t)
in (uu____9043)::[])
in (mk_Tm_app uu____9040 uu____9042)))
in (uu____9035 FStar_Pervasives_Native.None FStar_Range.dummyRange)))


let t_option_of : term  ->  term = (fun t -> (

let uu____9051 = (

let uu____9056 = (

let uu____9057 = (tabbrev FStar_Parser_Const.option_lid)
in (mk_Tm_uinst uu____9057 ((U_zero)::[])))
in (

let uu____9058 = (

let uu____9059 = (as_arg t)
in (uu____9059)::[])
in (mk_Tm_app uu____9056 uu____9058)))
in (uu____9051 FStar_Pervasives_Native.None FStar_Range.dummyRange)))


let t_tuple2_of : term  ->  term  ->  term = (fun t1 t2 -> (

let uu____9072 = (

let uu____9077 = (

let uu____9078 = (tabbrev FStar_Parser_Const.lid_tuple2)
in (mk_Tm_uinst uu____9078 ((U_zero)::[])))
in (

let uu____9079 = (

let uu____9080 = (as_arg t1)
in (

let uu____9081 = (

let uu____9084 = (as_arg t2)
in (uu____9084)::[])
in (uu____9080)::uu____9081))
in (mk_Tm_app uu____9077 uu____9079)))
in (uu____9072 FStar_Pervasives_Native.None FStar_Range.dummyRange)))


let unit_const : term' syntax = (mk (Tm_constant (FStar_Const.Const_unit)) FStar_Pervasives_Native.None FStar_Range.dummyRange)




