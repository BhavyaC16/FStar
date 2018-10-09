
open Prims
open FStar_Pervasives
type step =
| Beta
| Iota
| Zeta
| Exclude of step
| Weak
| HNF
| Primops
| Eager_unfolding
| Inlining
| DoNotUnfoldPureLets
| UnfoldUntil of FStar_Syntax_Syntax.delta_depth
| UnfoldOnly of FStar_Ident.lid Prims.list
| UnfoldFully of FStar_Ident.lid Prims.list
| UnfoldAttr of FStar_Ident.lid Prims.list
| UnfoldTac
| PureSubtermsWithinComputations
| Simplify
| EraseUniverses
| AllowUnboundUniverses
| Reify
| CompressUvars
| NoFullNorm
| CheckNoUvars
| Unmeta
| Unascribe
| NBE
| ForExtraction


let uu___is_Beta : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Beta -> begin
true
end
| uu____37 -> begin
false
end))


let uu___is_Iota : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Iota -> begin
true
end
| uu____43 -> begin
false
end))


let uu___is_Zeta : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Zeta -> begin
true
end
| uu____49 -> begin
false
end))


let uu___is_Exclude : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Exclude (_0) -> begin
true
end
| uu____56 -> begin
false
end))


let __proj__Exclude__item___0 : step  ->  step = (fun projectee -> (match (projectee) with
| Exclude (_0) -> begin
_0
end))


let uu___is_Weak : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Weak -> begin
true
end
| uu____69 -> begin
false
end))


let uu___is_HNF : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| HNF -> begin
true
end
| uu____75 -> begin
false
end))


let uu___is_Primops : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Primops -> begin
true
end
| uu____81 -> begin
false
end))


let uu___is_Eager_unfolding : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Eager_unfolding -> begin
true
end
| uu____87 -> begin
false
end))


let uu___is_Inlining : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Inlining -> begin
true
end
| uu____93 -> begin
false
end))


let uu___is_DoNotUnfoldPureLets : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| DoNotUnfoldPureLets -> begin
true
end
| uu____99 -> begin
false
end))


let uu___is_UnfoldUntil : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| UnfoldUntil (_0) -> begin
true
end
| uu____106 -> begin
false
end))


let __proj__UnfoldUntil__item___0 : step  ->  FStar_Syntax_Syntax.delta_depth = (fun projectee -> (match (projectee) with
| UnfoldUntil (_0) -> begin
_0
end))


let uu___is_UnfoldOnly : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| UnfoldOnly (_0) -> begin
true
end
| uu____122 -> begin
false
end))


let __proj__UnfoldOnly__item___0 : step  ->  FStar_Ident.lid Prims.list = (fun projectee -> (match (projectee) with
| UnfoldOnly (_0) -> begin
_0
end))


let uu___is_UnfoldFully : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| UnfoldFully (_0) -> begin
true
end
| uu____144 -> begin
false
end))


let __proj__UnfoldFully__item___0 : step  ->  FStar_Ident.lid Prims.list = (fun projectee -> (match (projectee) with
| UnfoldFully (_0) -> begin
_0
end))


let uu___is_UnfoldAttr : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| UnfoldAttr (_0) -> begin
true
end
| uu____166 -> begin
false
end))


let __proj__UnfoldAttr__item___0 : step  ->  FStar_Ident.lid Prims.list = (fun projectee -> (match (projectee) with
| UnfoldAttr (_0) -> begin
_0
end))


let uu___is_UnfoldTac : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| UnfoldTac -> begin
true
end
| uu____185 -> begin
false
end))


let uu___is_PureSubtermsWithinComputations : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| PureSubtermsWithinComputations -> begin
true
end
| uu____191 -> begin
false
end))


let uu___is_Simplify : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Simplify -> begin
true
end
| uu____197 -> begin
false
end))


let uu___is_EraseUniverses : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| EraseUniverses -> begin
true
end
| uu____203 -> begin
false
end))


let uu___is_AllowUnboundUniverses : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| AllowUnboundUniverses -> begin
true
end
| uu____209 -> begin
false
end))


let uu___is_Reify : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Reify -> begin
true
end
| uu____215 -> begin
false
end))


let uu___is_CompressUvars : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| CompressUvars -> begin
true
end
| uu____221 -> begin
false
end))


let uu___is_NoFullNorm : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NoFullNorm -> begin
true
end
| uu____227 -> begin
false
end))


let uu___is_CheckNoUvars : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| CheckNoUvars -> begin
true
end
| uu____233 -> begin
false
end))


let uu___is_Unmeta : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Unmeta -> begin
true
end
| uu____239 -> begin
false
end))


let uu___is_Unascribe : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Unascribe -> begin
true
end
| uu____245 -> begin
false
end))


let uu___is_NBE : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NBE -> begin
true
end
| uu____251 -> begin
false
end))


let uu___is_ForExtraction : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| ForExtraction -> begin
true
end
| uu____257 -> begin
false
end))


type steps =
step Prims.list


let rec eq_step : step  ->  step  ->  Prims.bool = (fun s1 s2 -> (match (((s1), (s2))) with
| (Beta, Beta) -> begin
true
end
| (Iota, Iota) -> begin
true
end
| (Zeta, Zeta) -> begin
true
end
| (Weak, Weak) -> begin
true
end
| (HNF, HNF) -> begin
true
end
| (Primops, Primops) -> begin
true
end
| (Eager_unfolding, Eager_unfolding) -> begin
true
end
| (Inlining, Inlining) -> begin
true
end
| (DoNotUnfoldPureLets, DoNotUnfoldPureLets) -> begin
true
end
| (UnfoldTac, UnfoldTac) -> begin
true
end
| (PureSubtermsWithinComputations, PureSubtermsWithinComputations) -> begin
true
end
| (Simplify, Simplify) -> begin
true
end
| (EraseUniverses, EraseUniverses) -> begin
true
end
| (AllowUnboundUniverses, AllowUnboundUniverses) -> begin
true
end
| (Reify, Reify) -> begin
true
end
| (CompressUvars, CompressUvars) -> begin
true
end
| (NoFullNorm, NoFullNorm) -> begin
true
end
| (CheckNoUvars, CheckNoUvars) -> begin
true
end
| (Unmeta, Unmeta) -> begin
true
end
| (Unascribe, Unascribe) -> begin
true
end
| (NBE, NBE) -> begin
true
end
| (Exclude (s11), Exclude (s21)) -> begin
(eq_step s11 s21)
end
| (UnfoldUntil (s11), UnfoldUntil (s21)) -> begin
(Prims.op_Equality s11 s21)
end
| (UnfoldOnly (lids1), UnfoldOnly (lids2)) -> begin
((Prims.op_Equality (FStar_List.length lids1) (FStar_List.length lids2)) && (FStar_List.forall2 FStar_Ident.lid_equals lids1 lids2))
end
| (UnfoldFully (lids1), UnfoldFully (lids2)) -> begin
((Prims.op_Equality (FStar_List.length lids1) (FStar_List.length lids2)) && (FStar_List.forall2 FStar_Ident.lid_equals lids1 lids2))
end
| (UnfoldAttr (lids1), UnfoldAttr (lids2)) -> begin
((Prims.op_Equality (FStar_List.length lids1) (FStar_List.length lids2)) && (FStar_List.forall2 FStar_Ident.lid_equals lids1 lids2))
end
| uu____292 -> begin
false
end))


type sig_binding =
(FStar_Ident.lident Prims.list * FStar_Syntax_Syntax.sigelt)

type delta_level =
| NoDelta
| InliningDelta
| Eager_unfolding_only
| Unfold of FStar_Syntax_Syntax.delta_depth


let uu___is_NoDelta : delta_level  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NoDelta -> begin
true
end
| uu____313 -> begin
false
end))


let uu___is_InliningDelta : delta_level  ->  Prims.bool = (fun projectee -> (match (projectee) with
| InliningDelta -> begin
true
end
| uu____319 -> begin
false
end))


let uu___is_Eager_unfolding_only : delta_level  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Eager_unfolding_only -> begin
true
end
| uu____325 -> begin
false
end))


let uu___is_Unfold : delta_level  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Unfold (_0) -> begin
true
end
| uu____332 -> begin
false
end))


let __proj__Unfold__item___0 : delta_level  ->  FStar_Syntax_Syntax.delta_depth = (fun projectee -> (match (projectee) with
| Unfold (_0) -> begin
_0
end))

type mlift =
{mlift_wp : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ; mlift_term : (FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term) FStar_Pervasives_Native.option}


let __proj__Mkmlift__item__mlift_wp : mlift  ->  FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ = (fun projectee -> (match (projectee) with
| {mlift_wp = mlift_wp; mlift_term = mlift_term} -> begin
mlift_wp
end))


let __proj__Mkmlift__item__mlift_term : mlift  ->  (FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term) FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {mlift_wp = mlift_wp; mlift_term = mlift_term} -> begin
mlift_term
end))

type edge =
{msource : FStar_Ident.lident; mtarget : FStar_Ident.lident; mlift : mlift}


let __proj__Mkedge__item__msource : edge  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| {msource = msource; mtarget = mtarget; mlift = mlift} -> begin
msource
end))


let __proj__Mkedge__item__mtarget : edge  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| {msource = msource; mtarget = mtarget; mlift = mlift} -> begin
mtarget
end))


let __proj__Mkedge__item__mlift : edge  ->  mlift = (fun projectee -> (match (projectee) with
| {msource = msource; mtarget = mtarget; mlift = mlift} -> begin
mlift
end))

type effects =
{decls : (FStar_Syntax_Syntax.eff_decl * FStar_Syntax_Syntax.qualifier Prims.list) Prims.list; order : edge Prims.list; joins : (FStar_Ident.lident * FStar_Ident.lident * FStar_Ident.lident * mlift * mlift) Prims.list}


let __proj__Mkeffects__item__decls : effects  ->  (FStar_Syntax_Syntax.eff_decl * FStar_Syntax_Syntax.qualifier Prims.list) Prims.list = (fun projectee -> (match (projectee) with
| {decls = decls; order = order; joins = joins} -> begin
decls
end))


let __proj__Mkeffects__item__order : effects  ->  edge Prims.list = (fun projectee -> (match (projectee) with
| {decls = decls; order = order; joins = joins} -> begin
order
end))


let __proj__Mkeffects__item__joins : effects  ->  (FStar_Ident.lident * FStar_Ident.lident * FStar_Ident.lident * mlift * mlift) Prims.list = (fun projectee -> (match (projectee) with
| {decls = decls; order = order; joins = joins} -> begin
joins
end))


type name_prefix =
Prims.string Prims.list


type proof_namespace =
(name_prefix * Prims.bool) Prims.list


type cached_elt =
(((FStar_Syntax_Syntax.universes * FStar_Syntax_Syntax.typ), (FStar_Syntax_Syntax.sigelt * FStar_Syntax_Syntax.universes FStar_Pervasives_Native.option)) FStar_Util.either * FStar_Range.range)


type goal =
FStar_Syntax_Syntax.term

type env =
{solver : solver_t; range : FStar_Range.range; curmodule : FStar_Ident.lident; gamma : FStar_Syntax_Syntax.binding Prims.list; gamma_sig : sig_binding Prims.list; gamma_cache : cached_elt FStar_Util.smap; modules : FStar_Syntax_Syntax.modul Prims.list; expected_typ : FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option; sigtab : FStar_Syntax_Syntax.sigelt FStar_Util.smap; attrtab : FStar_Syntax_Syntax.sigelt Prims.list FStar_Util.smap; is_pattern : Prims.bool; instantiate_imp : Prims.bool; effects : effects; generalize : Prims.bool; letrecs : (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.typ * FStar_Syntax_Syntax.univ_names) Prims.list; top_level : Prims.bool; check_uvars : Prims.bool; use_eq : Prims.bool; is_iface : Prims.bool; admit : Prims.bool; lax : Prims.bool; lax_universes : Prims.bool; phase1 : Prims.bool; failhard : Prims.bool; nosynth : Prims.bool; uvar_subtyping : Prims.bool; tc_term : env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * guard_t); type_of : env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.typ * guard_t); universe_of : env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.universe; check_type_of : Prims.bool  ->  env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  guard_t; use_bv_sorts : Prims.bool; qtbl_name_and_index : (Prims.int FStar_Util.smap * (FStar_Ident.lident * Prims.int) FStar_Pervasives_Native.option); normalized_eff_names : FStar_Ident.lident FStar_Util.smap; fv_delta_depths : FStar_Syntax_Syntax.delta_depth FStar_Util.smap; proof_ns : proof_namespace; synth_hook : env  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term; splice : env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.sigelt Prims.list; postprocess : env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term; is_native_tactic : FStar_Ident.lid  ->  Prims.bool; identifier_info : FStar_TypeChecker_Common.id_info_table FStar_ST.ref; tc_hooks : tcenv_hooks; dsenv : FStar_Syntax_DsEnv.env; nbe : step Prims.list  ->  env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term} 
 and solver_t =
{init : env  ->  unit; push : Prims.string  ->  unit; pop : Prims.string  ->  unit; snapshot : Prims.string  ->  ((Prims.int * Prims.int * Prims.int) * unit); rollback : Prims.string  ->  (Prims.int * Prims.int * Prims.int) FStar_Pervasives_Native.option  ->  unit; encode_modul : env  ->  FStar_Syntax_Syntax.modul  ->  unit; encode_sig : env  ->  FStar_Syntax_Syntax.sigelt  ->  unit; preprocess : env  ->  goal  ->  (env * goal * FStar_Options.optionstate) Prims.list; solve : (unit  ->  Prims.string) FStar_Pervasives_Native.option  ->  env  ->  FStar_Syntax_Syntax.typ  ->  unit; finish : unit  ->  unit; refresh : unit  ->  unit} 
 and guard_t =
{guard_f : FStar_TypeChecker_Common.guard_formula; deferred : FStar_TypeChecker_Common.deferred; univ_ineqs : (FStar_Syntax_Syntax.universe Prims.list * FStar_TypeChecker_Common.univ_ineq Prims.list); implicits : implicit Prims.list} 
 and implicit =
{imp_reason : Prims.string; imp_uvar : FStar_Syntax_Syntax.ctx_uvar; imp_tm : FStar_Syntax_Syntax.term; imp_range : FStar_Range.range; imp_meta : (env * FStar_Syntax_Syntax.term) FStar_Pervasives_Native.option} 
 and tcenv_hooks =
{tc_push_in_gamma_hook : env  ->  (FStar_Syntax_Syntax.binding, sig_binding) FStar_Util.either  ->  unit}


let __proj__Mkenv__item__solver : env  ->  solver_t = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
solver
end))


let __proj__Mkenv__item__range : env  ->  FStar_Range.range = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
range
end))


let __proj__Mkenv__item__curmodule : env  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
curmodule
end))


let __proj__Mkenv__item__gamma : env  ->  FStar_Syntax_Syntax.binding Prims.list = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
gamma
end))


let __proj__Mkenv__item__gamma_sig : env  ->  sig_binding Prims.list = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
gamma_sig
end))


let __proj__Mkenv__item__gamma_cache : env  ->  cached_elt FStar_Util.smap = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
gamma_cache
end))


let __proj__Mkenv__item__modules : env  ->  FStar_Syntax_Syntax.modul Prims.list = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
modules
end))


let __proj__Mkenv__item__expected_typ : env  ->  FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
expected_typ
end))


let __proj__Mkenv__item__sigtab : env  ->  FStar_Syntax_Syntax.sigelt FStar_Util.smap = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
sigtab
end))


let __proj__Mkenv__item__attrtab : env  ->  FStar_Syntax_Syntax.sigelt Prims.list FStar_Util.smap = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
attrtab
end))


let __proj__Mkenv__item__is_pattern : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
is_pattern
end))


let __proj__Mkenv__item__instantiate_imp : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
instantiate_imp
end))


let __proj__Mkenv__item__effects : env  ->  effects = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
effects
end))


let __proj__Mkenv__item__generalize : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
generalize
end))


let __proj__Mkenv__item__letrecs : env  ->  (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.typ * FStar_Syntax_Syntax.univ_names) Prims.list = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
letrecs
end))


let __proj__Mkenv__item__top_level : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
top_level
end))


let __proj__Mkenv__item__check_uvars : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
check_uvars
end))


let __proj__Mkenv__item__use_eq : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
use_eq
end))


let __proj__Mkenv__item__is_iface : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
is_iface
end))


let __proj__Mkenv__item__admit : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
admit1
end))


let __proj__Mkenv__item__lax : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
lax1
end))


let __proj__Mkenv__item__lax_universes : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
lax_universes
end))


let __proj__Mkenv__item__phase1 : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
phase1
end))


let __proj__Mkenv__item__failhard : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
failhard
end))


let __proj__Mkenv__item__nosynth : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
nosynth
end))


let __proj__Mkenv__item__uvar_subtyping : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
uvar_subtyping
end))


let __proj__Mkenv__item__tc_term : env  ->  env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * guard_t) = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
tc_term
end))


let __proj__Mkenv__item__type_of : env  ->  env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.typ * guard_t) = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
type_of
end))


let __proj__Mkenv__item__universe_of : env  ->  env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.universe = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
universe_of
end))


let __proj__Mkenv__item__check_type_of : env  ->  Prims.bool  ->  env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  guard_t = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
check_type_of
end))


let __proj__Mkenv__item__use_bv_sorts : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
use_bv_sorts
end))


let __proj__Mkenv__item__qtbl_name_and_index : env  ->  (Prims.int FStar_Util.smap * (FStar_Ident.lident * Prims.int) FStar_Pervasives_Native.option) = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
qtbl_name_and_index
end))


let __proj__Mkenv__item__normalized_eff_names : env  ->  FStar_Ident.lident FStar_Util.smap = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
normalized_eff_names
end))


let __proj__Mkenv__item__fv_delta_depths : env  ->  FStar_Syntax_Syntax.delta_depth FStar_Util.smap = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
fv_delta_depths
end))


let __proj__Mkenv__item__proof_ns : env  ->  proof_namespace = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
proof_ns
end))


let __proj__Mkenv__item__synth_hook : env  ->  env  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
synth_hook
end))


let __proj__Mkenv__item__splice : env  ->  env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.sigelt Prims.list = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
splice1
end))


let __proj__Mkenv__item__postprocess : env  ->  env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
postprocess
end))


let __proj__Mkenv__item__is_native_tactic : env  ->  FStar_Ident.lid  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
is_native_tactic
end))


let __proj__Mkenv__item__identifier_info : env  ->  FStar_TypeChecker_Common.id_info_table FStar_ST.ref = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
identifier_info
end))


let __proj__Mkenv__item__tc_hooks : env  ->  tcenv_hooks = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
tc_hooks
end))


let __proj__Mkenv__item__dsenv : env  ->  FStar_Syntax_DsEnv.env = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
dsenv
end))


let __proj__Mkenv__item__nbe : env  ->  step Prims.list  ->  env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun projectee -> (match (projectee) with
| {solver = solver; range = range; curmodule = curmodule; gamma = gamma; gamma_sig = gamma_sig; gamma_cache = gamma_cache; modules = modules; expected_typ = expected_typ; sigtab = sigtab; attrtab = attrtab; is_pattern = is_pattern; instantiate_imp = instantiate_imp; effects = effects; generalize = generalize; letrecs = letrecs; top_level = top_level; check_uvars = check_uvars; use_eq = use_eq; is_iface = is_iface; admit = admit1; lax = lax1; lax_universes = lax_universes; phase1 = phase1; failhard = failhard; nosynth = nosynth; uvar_subtyping = uvar_subtyping; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = use_bv_sorts; qtbl_name_and_index = qtbl_name_and_index; normalized_eff_names = normalized_eff_names; fv_delta_depths = fv_delta_depths; proof_ns = proof_ns; synth_hook = synth_hook; splice = splice1; postprocess = postprocess; is_native_tactic = is_native_tactic; identifier_info = identifier_info; tc_hooks = tc_hooks; dsenv = dsenv; nbe = nbe1} -> begin
nbe1
end))


let __proj__Mksolver_t__item__init : solver_t  ->  env  ->  unit = (fun projectee -> (match (projectee) with
| {init = init1; push = push1; pop = pop1; snapshot = snapshot1; rollback = rollback1; encode_modul = encode_modul; encode_sig = encode_sig; preprocess = preprocess; solve = solve; finish = finish1; refresh = refresh} -> begin
init1
end))


let __proj__Mksolver_t__item__push : solver_t  ->  Prims.string  ->  unit = (fun projectee -> (match (projectee) with
| {init = init1; push = push1; pop = pop1; snapshot = snapshot1; rollback = rollback1; encode_modul = encode_modul; encode_sig = encode_sig; preprocess = preprocess; solve = solve; finish = finish1; refresh = refresh} -> begin
push1
end))


let __proj__Mksolver_t__item__pop : solver_t  ->  Prims.string  ->  unit = (fun projectee -> (match (projectee) with
| {init = init1; push = push1; pop = pop1; snapshot = snapshot1; rollback = rollback1; encode_modul = encode_modul; encode_sig = encode_sig; preprocess = preprocess; solve = solve; finish = finish1; refresh = refresh} -> begin
pop1
end))


let __proj__Mksolver_t__item__snapshot : solver_t  ->  Prims.string  ->  ((Prims.int * Prims.int * Prims.int) * unit) = (fun projectee -> (match (projectee) with
| {init = init1; push = push1; pop = pop1; snapshot = snapshot1; rollback = rollback1; encode_modul = encode_modul; encode_sig = encode_sig; preprocess = preprocess; solve = solve; finish = finish1; refresh = refresh} -> begin
snapshot1
end))


let __proj__Mksolver_t__item__rollback : solver_t  ->  Prims.string  ->  (Prims.int * Prims.int * Prims.int) FStar_Pervasives_Native.option  ->  unit = (fun projectee -> (match (projectee) with
| {init = init1; push = push1; pop = pop1; snapshot = snapshot1; rollback = rollback1; encode_modul = encode_modul; encode_sig = encode_sig; preprocess = preprocess; solve = solve; finish = finish1; refresh = refresh} -> begin
rollback1
end))


let __proj__Mksolver_t__item__encode_modul : solver_t  ->  env  ->  FStar_Syntax_Syntax.modul  ->  unit = (fun projectee -> (match (projectee) with
| {init = init1; push = push1; pop = pop1; snapshot = snapshot1; rollback = rollback1; encode_modul = encode_modul; encode_sig = encode_sig; preprocess = preprocess; solve = solve; finish = finish1; refresh = refresh} -> begin
encode_modul
end))


let __proj__Mksolver_t__item__encode_sig : solver_t  ->  env  ->  FStar_Syntax_Syntax.sigelt  ->  unit = (fun projectee -> (match (projectee) with
| {init = init1; push = push1; pop = pop1; snapshot = snapshot1; rollback = rollback1; encode_modul = encode_modul; encode_sig = encode_sig; preprocess = preprocess; solve = solve; finish = finish1; refresh = refresh} -> begin
encode_sig
end))


let __proj__Mksolver_t__item__preprocess : solver_t  ->  env  ->  goal  ->  (env * goal * FStar_Options.optionstate) Prims.list = (fun projectee -> (match (projectee) with
| {init = init1; push = push1; pop = pop1; snapshot = snapshot1; rollback = rollback1; encode_modul = encode_modul; encode_sig = encode_sig; preprocess = preprocess; solve = solve; finish = finish1; refresh = refresh} -> begin
preprocess
end))


let __proj__Mksolver_t__item__solve : solver_t  ->  (unit  ->  Prims.string) FStar_Pervasives_Native.option  ->  env  ->  FStar_Syntax_Syntax.typ  ->  unit = (fun projectee -> (match (projectee) with
| {init = init1; push = push1; pop = pop1; snapshot = snapshot1; rollback = rollback1; encode_modul = encode_modul; encode_sig = encode_sig; preprocess = preprocess; solve = solve; finish = finish1; refresh = refresh} -> begin
solve
end))


let __proj__Mksolver_t__item__finish : solver_t  ->  unit  ->  unit = (fun projectee -> (match (projectee) with
| {init = init1; push = push1; pop = pop1; snapshot = snapshot1; rollback = rollback1; encode_modul = encode_modul; encode_sig = encode_sig; preprocess = preprocess; solve = solve; finish = finish1; refresh = refresh} -> begin
finish1
end))


let __proj__Mksolver_t__item__refresh : solver_t  ->  unit  ->  unit = (fun projectee -> (match (projectee) with
| {init = init1; push = push1; pop = pop1; snapshot = snapshot1; rollback = rollback1; encode_modul = encode_modul; encode_sig = encode_sig; preprocess = preprocess; solve = solve; finish = finish1; refresh = refresh} -> begin
refresh
end))


let __proj__Mkguard_t__item__guard_f : guard_t  ->  FStar_TypeChecker_Common.guard_formula = (fun projectee -> (match (projectee) with
| {guard_f = guard_f; deferred = deferred; univ_ineqs = univ_ineqs; implicits = implicits} -> begin
guard_f
end))


let __proj__Mkguard_t__item__deferred : guard_t  ->  FStar_TypeChecker_Common.deferred = (fun projectee -> (match (projectee) with
| {guard_f = guard_f; deferred = deferred; univ_ineqs = univ_ineqs; implicits = implicits} -> begin
deferred
end))


let __proj__Mkguard_t__item__univ_ineqs : guard_t  ->  (FStar_Syntax_Syntax.universe Prims.list * FStar_TypeChecker_Common.univ_ineq Prims.list) = (fun projectee -> (match (projectee) with
| {guard_f = guard_f; deferred = deferred; univ_ineqs = univ_ineqs; implicits = implicits} -> begin
univ_ineqs
end))


let __proj__Mkguard_t__item__implicits : guard_t  ->  implicit Prims.list = (fun projectee -> (match (projectee) with
| {guard_f = guard_f; deferred = deferred; univ_ineqs = univ_ineqs; implicits = implicits} -> begin
implicits
end))


let __proj__Mkimplicit__item__imp_reason : implicit  ->  Prims.string = (fun projectee -> (match (projectee) with
| {imp_reason = imp_reason; imp_uvar = imp_uvar; imp_tm = imp_tm; imp_range = imp_range; imp_meta = imp_meta} -> begin
imp_reason
end))


let __proj__Mkimplicit__item__imp_uvar : implicit  ->  FStar_Syntax_Syntax.ctx_uvar = (fun projectee -> (match (projectee) with
| {imp_reason = imp_reason; imp_uvar = imp_uvar; imp_tm = imp_tm; imp_range = imp_range; imp_meta = imp_meta} -> begin
imp_uvar
end))


let __proj__Mkimplicit__item__imp_tm : implicit  ->  FStar_Syntax_Syntax.term = (fun projectee -> (match (projectee) with
| {imp_reason = imp_reason; imp_uvar = imp_uvar; imp_tm = imp_tm; imp_range = imp_range; imp_meta = imp_meta} -> begin
imp_tm
end))


let __proj__Mkimplicit__item__imp_range : implicit  ->  FStar_Range.range = (fun projectee -> (match (projectee) with
| {imp_reason = imp_reason; imp_uvar = imp_uvar; imp_tm = imp_tm; imp_range = imp_range; imp_meta = imp_meta} -> begin
imp_range
end))


let __proj__Mkimplicit__item__imp_meta : implicit  ->  (env * FStar_Syntax_Syntax.term) FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {imp_reason = imp_reason; imp_uvar = imp_uvar; imp_tm = imp_tm; imp_range = imp_range; imp_meta = imp_meta} -> begin
imp_meta
end))


let __proj__Mktcenv_hooks__item__tc_push_in_gamma_hook : tcenv_hooks  ->  env  ->  (FStar_Syntax_Syntax.binding, sig_binding) FStar_Util.either  ->  unit = (fun projectee -> (match (projectee) with
| {tc_push_in_gamma_hook = tc_push_in_gamma_hook} -> begin
tc_push_in_gamma_hook
end))


type solver_depth_t =
(Prims.int * Prims.int * Prims.int)


type implicits =
implicit Prims.list


let postprocess : env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun env tau ty tm -> (env.postprocess env tau ty tm))


let rename_gamma : FStar_Syntax_Syntax.subst_t  ->  FStar_Syntax_Syntax.gamma  ->  FStar_Syntax_Syntax.gamma = (fun subst1 gamma -> (FStar_All.pipe_right gamma (FStar_List.map (fun uu___232_10755 -> (match (uu___232_10755) with
| FStar_Syntax_Syntax.Binding_var (x) -> begin
(

let y = (

let uu____10758 = (FStar_Syntax_Syntax.bv_to_name x)
in (FStar_Syntax_Subst.subst subst1 uu____10758))
in (

let uu____10759 = (

let uu____10760 = (FStar_Syntax_Subst.compress y)
in uu____10760.FStar_Syntax_Syntax.n)
in (match (uu____10759) with
| FStar_Syntax_Syntax.Tm_name (y1) -> begin
(

let uu____10764 = (

let uu___246_10765 = y1
in (

let uu____10766 = (FStar_Syntax_Subst.subst subst1 x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = uu___246_10765.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___246_10765.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu____10766}))
in FStar_Syntax_Syntax.Binding_var (uu____10764))
end
| uu____10769 -> begin
(failwith "Not a renaming")
end)))
end
| b -> begin
b
end)))))


let rename_env : FStar_Syntax_Syntax.subst_t  ->  env  ->  env = (fun subst1 env -> (

let uu___247_10781 = env
in (

let uu____10782 = (rename_gamma subst1 env.gamma)
in {solver = uu___247_10781.solver; range = uu___247_10781.range; curmodule = uu___247_10781.curmodule; gamma = uu____10782; gamma_sig = uu___247_10781.gamma_sig; gamma_cache = uu___247_10781.gamma_cache; modules = uu___247_10781.modules; expected_typ = uu___247_10781.expected_typ; sigtab = uu___247_10781.sigtab; attrtab = uu___247_10781.attrtab; is_pattern = uu___247_10781.is_pattern; instantiate_imp = uu___247_10781.instantiate_imp; effects = uu___247_10781.effects; generalize = uu___247_10781.generalize; letrecs = uu___247_10781.letrecs; top_level = uu___247_10781.top_level; check_uvars = uu___247_10781.check_uvars; use_eq = uu___247_10781.use_eq; is_iface = uu___247_10781.is_iface; admit = uu___247_10781.admit; lax = uu___247_10781.lax; lax_universes = uu___247_10781.lax_universes; phase1 = uu___247_10781.phase1; failhard = uu___247_10781.failhard; nosynth = uu___247_10781.nosynth; uvar_subtyping = uu___247_10781.uvar_subtyping; tc_term = uu___247_10781.tc_term; type_of = uu___247_10781.type_of; universe_of = uu___247_10781.universe_of; check_type_of = uu___247_10781.check_type_of; use_bv_sorts = uu___247_10781.use_bv_sorts; qtbl_name_and_index = uu___247_10781.qtbl_name_and_index; normalized_eff_names = uu___247_10781.normalized_eff_names; fv_delta_depths = uu___247_10781.fv_delta_depths; proof_ns = uu___247_10781.proof_ns; synth_hook = uu___247_10781.synth_hook; splice = uu___247_10781.splice; postprocess = uu___247_10781.postprocess; is_native_tactic = uu___247_10781.is_native_tactic; identifier_info = uu___247_10781.identifier_info; tc_hooks = uu___247_10781.tc_hooks; dsenv = uu___247_10781.dsenv; nbe = uu___247_10781.nbe})))


let default_tc_hooks : tcenv_hooks = {tc_push_in_gamma_hook = (fun uu____10789 uu____10790 -> ())}


let tc_hooks : env  ->  tcenv_hooks = (fun env -> env.tc_hooks)


let set_tc_hooks : env  ->  tcenv_hooks  ->  env = (fun env hooks -> (

let uu___248_10810 = env
in {solver = uu___248_10810.solver; range = uu___248_10810.range; curmodule = uu___248_10810.curmodule; gamma = uu___248_10810.gamma; gamma_sig = uu___248_10810.gamma_sig; gamma_cache = uu___248_10810.gamma_cache; modules = uu___248_10810.modules; expected_typ = uu___248_10810.expected_typ; sigtab = uu___248_10810.sigtab; attrtab = uu___248_10810.attrtab; is_pattern = uu___248_10810.is_pattern; instantiate_imp = uu___248_10810.instantiate_imp; effects = uu___248_10810.effects; generalize = uu___248_10810.generalize; letrecs = uu___248_10810.letrecs; top_level = uu___248_10810.top_level; check_uvars = uu___248_10810.check_uvars; use_eq = uu___248_10810.use_eq; is_iface = uu___248_10810.is_iface; admit = uu___248_10810.admit; lax = uu___248_10810.lax; lax_universes = uu___248_10810.lax_universes; phase1 = uu___248_10810.phase1; failhard = uu___248_10810.failhard; nosynth = uu___248_10810.nosynth; uvar_subtyping = uu___248_10810.uvar_subtyping; tc_term = uu___248_10810.tc_term; type_of = uu___248_10810.type_of; universe_of = uu___248_10810.universe_of; check_type_of = uu___248_10810.check_type_of; use_bv_sorts = uu___248_10810.use_bv_sorts; qtbl_name_and_index = uu___248_10810.qtbl_name_and_index; normalized_eff_names = uu___248_10810.normalized_eff_names; fv_delta_depths = uu___248_10810.fv_delta_depths; proof_ns = uu___248_10810.proof_ns; synth_hook = uu___248_10810.synth_hook; splice = uu___248_10810.splice; postprocess = uu___248_10810.postprocess; is_native_tactic = uu___248_10810.is_native_tactic; identifier_info = uu___248_10810.identifier_info; tc_hooks = hooks; dsenv = uu___248_10810.dsenv; nbe = uu___248_10810.nbe}))


let set_dep_graph : env  ->  FStar_Parser_Dep.deps  ->  env = (fun e g -> (

let uu___249_10821 = e
in (

let uu____10822 = (FStar_Syntax_DsEnv.set_dep_graph e.dsenv g)
in {solver = uu___249_10821.solver; range = uu___249_10821.range; curmodule = uu___249_10821.curmodule; gamma = uu___249_10821.gamma; gamma_sig = uu___249_10821.gamma_sig; gamma_cache = uu___249_10821.gamma_cache; modules = uu___249_10821.modules; expected_typ = uu___249_10821.expected_typ; sigtab = uu___249_10821.sigtab; attrtab = uu___249_10821.attrtab; is_pattern = uu___249_10821.is_pattern; instantiate_imp = uu___249_10821.instantiate_imp; effects = uu___249_10821.effects; generalize = uu___249_10821.generalize; letrecs = uu___249_10821.letrecs; top_level = uu___249_10821.top_level; check_uvars = uu___249_10821.check_uvars; use_eq = uu___249_10821.use_eq; is_iface = uu___249_10821.is_iface; admit = uu___249_10821.admit; lax = uu___249_10821.lax; lax_universes = uu___249_10821.lax_universes; phase1 = uu___249_10821.phase1; failhard = uu___249_10821.failhard; nosynth = uu___249_10821.nosynth; uvar_subtyping = uu___249_10821.uvar_subtyping; tc_term = uu___249_10821.tc_term; type_of = uu___249_10821.type_of; universe_of = uu___249_10821.universe_of; check_type_of = uu___249_10821.check_type_of; use_bv_sorts = uu___249_10821.use_bv_sorts; qtbl_name_and_index = uu___249_10821.qtbl_name_and_index; normalized_eff_names = uu___249_10821.normalized_eff_names; fv_delta_depths = uu___249_10821.fv_delta_depths; proof_ns = uu___249_10821.proof_ns; synth_hook = uu___249_10821.synth_hook; splice = uu___249_10821.splice; postprocess = uu___249_10821.postprocess; is_native_tactic = uu___249_10821.is_native_tactic; identifier_info = uu___249_10821.identifier_info; tc_hooks = uu___249_10821.tc_hooks; dsenv = uu____10822; nbe = uu___249_10821.nbe})))


let dep_graph : env  ->  FStar_Parser_Dep.deps = (fun e -> (FStar_Syntax_DsEnv.dep_graph e.dsenv))


type env_t =
env


type sigtable =
FStar_Syntax_Syntax.sigelt FStar_Util.smap


let should_verify : env  ->  Prims.bool = (fun env -> (((not (env.lax)) && (not (env.admit))) && (FStar_Options.should_verify env.curmodule.FStar_Ident.str)))


let visible_at : delta_level  ->  FStar_Syntax_Syntax.qualifier  ->  Prims.bool = (fun d q -> (match (((d), (q))) with
| (NoDelta, uu____10845) -> begin
true
end
| (Eager_unfolding_only, FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen) -> begin
true
end
| (Unfold (uu____10846), FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen) -> begin
true
end
| (Unfold (uu____10847), FStar_Syntax_Syntax.Visible_default) -> begin
true
end
| (InliningDelta, FStar_Syntax_Syntax.Inline_for_extraction) -> begin
true
end
| uu____10848 -> begin
false
end))


let default_table_size : Prims.int = (Prims.parse_int "200")


let new_sigtab : 'Auu____10857 . unit  ->  'Auu____10857 FStar_Util.smap = (fun uu____10864 -> (FStar_Util.smap_create default_table_size))


let new_gamma_cache : 'Auu____10869 . unit  ->  'Auu____10869 FStar_Util.smap = (fun uu____10876 -> (FStar_Util.smap_create (Prims.parse_int "100")))


let initial_env : FStar_Parser_Dep.deps  ->  (env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * guard_t))  ->  (env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.typ * guard_t))  ->  (env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.universe)  ->  (Prims.bool  ->  env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  guard_t)  ->  solver_t  ->  FStar_Ident.lident  ->  (step Prims.list  ->  env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term)  ->  env = (fun deps tc_term type_of universe_of check_type_of solver module_lid nbe1 -> (

let uu____11010 = (new_gamma_cache ())
in (

let uu____11013 = (new_sigtab ())
in (

let uu____11016 = (new_sigtab ())
in (

let uu____11023 = (

let uu____11036 = (FStar_Util.smap_create (Prims.parse_int "10"))
in ((uu____11036), (FStar_Pervasives_Native.None)))
in (

let uu____11051 = (FStar_Util.smap_create (Prims.parse_int "20"))
in (

let uu____11054 = (FStar_Util.smap_create (Prims.parse_int "50"))
in (

let uu____11057 = (FStar_Options.using_facts_from ())
in (

let uu____11058 = (FStar_Util.mk_ref FStar_TypeChecker_Common.id_info_table_empty)
in (

let uu____11061 = (FStar_Syntax_DsEnv.empty_env deps)
in {solver = solver; range = FStar_Range.dummyRange; curmodule = module_lid; gamma = []; gamma_sig = []; gamma_cache = uu____11010; modules = []; expected_typ = FStar_Pervasives_Native.None; sigtab = uu____11013; attrtab = uu____11016; is_pattern = false; instantiate_imp = true; effects = {decls = []; order = []; joins = []}; generalize = true; letrecs = []; top_level = false; check_uvars = false; use_eq = false; is_iface = false; admit = false; lax = false; lax_universes = false; phase1 = false; failhard = false; nosynth = false; uvar_subtyping = true; tc_term = tc_term; type_of = type_of; universe_of = universe_of; check_type_of = check_type_of; use_bv_sorts = false; qtbl_name_and_index = uu____11023; normalized_eff_names = uu____11051; fv_delta_depths = uu____11054; proof_ns = uu____11057; synth_hook = (fun e g tau -> (failwith "no synthesizer available")); splice = (fun e tau -> (failwith "no splicer available")); postprocess = (fun e tau typ tm -> (failwith "no postprocessor available")); is_native_tactic = (fun uu____11105 -> false); identifier_info = uu____11058; tc_hooks = default_tc_hooks; dsenv = uu____11061; nbe = nbe1}))))))))))


let dsenv : env  ->  FStar_Syntax_DsEnv.env = (fun env -> env.dsenv)


let sigtab : env  ->  FStar_Syntax_Syntax.sigelt FStar_Util.smap = (fun env -> env.sigtab)


let attrtab : env  ->  FStar_Syntax_Syntax.sigelt Prims.list FStar_Util.smap = (fun env -> env.attrtab)


let gamma_cache : env  ->  cached_elt FStar_Util.smap = (fun env -> env.gamma_cache)


let query_indices : (FStar_Ident.lident * Prims.int) Prims.list Prims.list FStar_ST.ref = (FStar_Util.mk_ref (([])::[]))


let push_query_indices : unit  ->  unit = (fun uu____11205 -> (

let uu____11206 = (FStar_ST.op_Bang query_indices)
in (match (uu____11206) with
| [] -> begin
(failwith "Empty query indices!")
end
| uu____11256 -> begin
(

let uu____11265 = (

let uu____11274 = (

let uu____11281 = (FStar_ST.op_Bang query_indices)
in (FStar_List.hd uu____11281))
in (

let uu____11331 = (FStar_ST.op_Bang query_indices)
in (uu____11274)::uu____11331))
in (FStar_ST.op_Colon_Equals query_indices uu____11265))
end)))


let pop_query_indices : unit  ->  unit = (fun uu____11420 -> (

let uu____11421 = (FStar_ST.op_Bang query_indices)
in (match (uu____11421) with
| [] -> begin
(failwith "Empty query indices!")
end
| (hd1)::tl1 -> begin
(FStar_ST.op_Colon_Equals query_indices tl1)
end)))


let snapshot_query_indices : unit  ->  (Prims.int * unit) = (fun uu____11536 -> (FStar_Common.snapshot push_query_indices query_indices ()))


let rollback_query_indices : Prims.int FStar_Pervasives_Native.option  ->  unit = (fun depth -> (FStar_Common.rollback pop_query_indices query_indices depth))


let add_query_index : (FStar_Ident.lident * Prims.int)  ->  unit = (fun uu____11566 -> (match (uu____11566) with
| (l, n1) -> begin
(

let uu____11573 = (FStar_ST.op_Bang query_indices)
in (match (uu____11573) with
| (hd1)::tl1 -> begin
(FStar_ST.op_Colon_Equals query_indices (((((l), (n1)))::hd1)::tl1))
end
| uu____11684 -> begin
(failwith "Empty query indices")
end))
end))


let peek_query_indices : unit  ->  (FStar_Ident.lident * Prims.int) Prims.list = (fun uu____11703 -> (

let uu____11704 = (FStar_ST.op_Bang query_indices)
in (FStar_List.hd uu____11704)))


let stack : env Prims.list FStar_ST.ref = (FStar_Util.mk_ref [])


let push_stack : env  ->  env = (fun env -> ((

let uu____11777 = (

let uu____11780 = (FStar_ST.op_Bang stack)
in (env)::uu____11780)
in (FStar_ST.op_Colon_Equals stack uu____11777));
(

let uu___250_11829 = env
in (

let uu____11830 = (FStar_Util.smap_copy (gamma_cache env))
in (

let uu____11833 = (FStar_Util.smap_copy (sigtab env))
in (

let uu____11836 = (FStar_Util.smap_copy (attrtab env))
in (

let uu____11843 = (

let uu____11856 = (

let uu____11859 = (FStar_All.pipe_right env.qtbl_name_and_index FStar_Pervasives_Native.fst)
in (FStar_Util.smap_copy uu____11859))
in (

let uu____11884 = (FStar_All.pipe_right env.qtbl_name_and_index FStar_Pervasives_Native.snd)
in ((uu____11856), (uu____11884))))
in (

let uu____11925 = (FStar_Util.smap_copy env.normalized_eff_names)
in (

let uu____11928 = (FStar_Util.smap_copy env.fv_delta_depths)
in (

let uu____11931 = (

let uu____11934 = (FStar_ST.op_Bang env.identifier_info)
in (FStar_Util.mk_ref uu____11934))
in {solver = uu___250_11829.solver; range = uu___250_11829.range; curmodule = uu___250_11829.curmodule; gamma = uu___250_11829.gamma; gamma_sig = uu___250_11829.gamma_sig; gamma_cache = uu____11830; modules = uu___250_11829.modules; expected_typ = uu___250_11829.expected_typ; sigtab = uu____11833; attrtab = uu____11836; is_pattern = uu___250_11829.is_pattern; instantiate_imp = uu___250_11829.instantiate_imp; effects = uu___250_11829.effects; generalize = uu___250_11829.generalize; letrecs = uu___250_11829.letrecs; top_level = uu___250_11829.top_level; check_uvars = uu___250_11829.check_uvars; use_eq = uu___250_11829.use_eq; is_iface = uu___250_11829.is_iface; admit = uu___250_11829.admit; lax = uu___250_11829.lax; lax_universes = uu___250_11829.lax_universes; phase1 = uu___250_11829.phase1; failhard = uu___250_11829.failhard; nosynth = uu___250_11829.nosynth; uvar_subtyping = uu___250_11829.uvar_subtyping; tc_term = uu___250_11829.tc_term; type_of = uu___250_11829.type_of; universe_of = uu___250_11829.universe_of; check_type_of = uu___250_11829.check_type_of; use_bv_sorts = uu___250_11829.use_bv_sorts; qtbl_name_and_index = uu____11843; normalized_eff_names = uu____11925; fv_delta_depths = uu____11928; proof_ns = uu___250_11829.proof_ns; synth_hook = uu___250_11829.synth_hook; splice = uu___250_11829.splice; postprocess = uu___250_11829.postprocess; is_native_tactic = uu___250_11829.is_native_tactic; identifier_info = uu____11931; tc_hooks = uu___250_11829.tc_hooks; dsenv = uu___250_11829.dsenv; nbe = uu___250_11829.nbe}))))))));
))


let pop_stack : unit  ->  env = (fun uu____11980 -> (

let uu____11981 = (FStar_ST.op_Bang stack)
in (match (uu____11981) with
| (env)::tl1 -> begin
((FStar_ST.op_Colon_Equals stack tl1);
env;
)
end
| uu____12035 -> begin
(failwith "Impossible: Too many pops")
end)))


let snapshot_stack : env  ->  (Prims.int * env) = (fun env -> (FStar_Common.snapshot push_stack stack env))


let rollback_stack : Prims.int FStar_Pervasives_Native.option  ->  env = (fun depth -> (FStar_Common.rollback pop_stack stack depth))


type tcenv_depth_t =
(Prims.int * Prims.int * solver_depth_t * Prims.int)


let snapshot : env  ->  Prims.string  ->  (tcenv_depth_t * env) = (fun env msg -> (FStar_Util.atomically (fun uu____12107 -> (

let uu____12108 = (snapshot_stack env)
in (match (uu____12108) with
| (stack_depth, env1) -> begin
(

let uu____12133 = (snapshot_query_indices ())
in (match (uu____12133) with
| (query_indices_depth, ()) -> begin
(

let uu____12157 = (env1.solver.snapshot msg)
in (match (uu____12157) with
| (solver_depth, ()) -> begin
(

let uu____12199 = (FStar_Syntax_DsEnv.snapshot env1.dsenv)
in (match (uu____12199) with
| (dsenv_depth, dsenv1) -> begin
((((stack_depth), (query_indices_depth), (solver_depth), (dsenv_depth))), ((

let uu___251_12245 = env1
in {solver = uu___251_12245.solver; range = uu___251_12245.range; curmodule = uu___251_12245.curmodule; gamma = uu___251_12245.gamma; gamma_sig = uu___251_12245.gamma_sig; gamma_cache = uu___251_12245.gamma_cache; modules = uu___251_12245.modules; expected_typ = uu___251_12245.expected_typ; sigtab = uu___251_12245.sigtab; attrtab = uu___251_12245.attrtab; is_pattern = uu___251_12245.is_pattern; instantiate_imp = uu___251_12245.instantiate_imp; effects = uu___251_12245.effects; generalize = uu___251_12245.generalize; letrecs = uu___251_12245.letrecs; top_level = uu___251_12245.top_level; check_uvars = uu___251_12245.check_uvars; use_eq = uu___251_12245.use_eq; is_iface = uu___251_12245.is_iface; admit = uu___251_12245.admit; lax = uu___251_12245.lax; lax_universes = uu___251_12245.lax_universes; phase1 = uu___251_12245.phase1; failhard = uu___251_12245.failhard; nosynth = uu___251_12245.nosynth; uvar_subtyping = uu___251_12245.uvar_subtyping; tc_term = uu___251_12245.tc_term; type_of = uu___251_12245.type_of; universe_of = uu___251_12245.universe_of; check_type_of = uu___251_12245.check_type_of; use_bv_sorts = uu___251_12245.use_bv_sorts; qtbl_name_and_index = uu___251_12245.qtbl_name_and_index; normalized_eff_names = uu___251_12245.normalized_eff_names; fv_delta_depths = uu___251_12245.fv_delta_depths; proof_ns = uu___251_12245.proof_ns; synth_hook = uu___251_12245.synth_hook; splice = uu___251_12245.splice; postprocess = uu___251_12245.postprocess; is_native_tactic = uu___251_12245.is_native_tactic; identifier_info = uu___251_12245.identifier_info; tc_hooks = uu___251_12245.tc_hooks; dsenv = dsenv1; nbe = uu___251_12245.nbe})))
end))
end))
end))
end)))))


let rollback : solver_t  ->  Prims.string  ->  tcenv_depth_t FStar_Pervasives_Native.option  ->  env = (fun solver msg depth -> (FStar_Util.atomically (fun uu____12276 -> (

let uu____12277 = (match (depth) with
| FStar_Pervasives_Native.Some (s1, s2, s3, s4) -> begin
((FStar_Pervasives_Native.Some (s1)), (FStar_Pervasives_Native.Some (s2)), (FStar_Pervasives_Native.Some (s3)), (FStar_Pervasives_Native.Some (s4)))
end
| FStar_Pervasives_Native.None -> begin
((FStar_Pervasives_Native.None), (FStar_Pervasives_Native.None), (FStar_Pervasives_Native.None), (FStar_Pervasives_Native.None))
end)
in (match (uu____12277) with
| (stack_depth, query_indices_depth, solver_depth, dsenv_depth) -> begin
((solver.rollback msg solver_depth);
(match (()) with
| () -> begin
((rollback_query_indices query_indices_depth);
(match (()) with
| () -> begin
(

let tcenv = (rollback_stack stack_depth)
in (

let dsenv1 = (FStar_Syntax_DsEnv.rollback dsenv_depth)
in ((

let uu____12403 = (FStar_Util.physical_equality tcenv.dsenv dsenv1)
in (FStar_Common.runtime_assert uu____12403 "Inconsistent stack state"));
tcenv;
)))
end);
)
end);
)
end)))))


let push : env  ->  Prims.string  ->  env = (fun env msg -> (

let uu____12414 = (snapshot env msg)
in (FStar_Pervasives_Native.snd uu____12414)))


let pop : env  ->  Prims.string  ->  env = (fun env msg -> (rollback env.solver msg FStar_Pervasives_Native.None))


let incr_query_index : env  ->  env = (fun env -> (

let qix = (peek_query_indices ())
in (match (env.qtbl_name_and_index) with
| (uu____12441, FStar_Pervasives_Native.None) -> begin
env
end
| (tbl, FStar_Pervasives_Native.Some (l, n1)) -> begin
(

let uu____12473 = (FStar_All.pipe_right qix (FStar_List.tryFind (fun uu____12499 -> (match (uu____12499) with
| (m, uu____12505) -> begin
(FStar_Ident.lid_equals l m)
end))))
in (match (uu____12473) with
| FStar_Pervasives_Native.None -> begin
(

let next = (n1 + (Prims.parse_int "1"))
in ((add_query_index ((l), (next)));
(FStar_Util.smap_add tbl l.FStar_Ident.str next);
(

let uu___252_12513 = env
in {solver = uu___252_12513.solver; range = uu___252_12513.range; curmodule = uu___252_12513.curmodule; gamma = uu___252_12513.gamma; gamma_sig = uu___252_12513.gamma_sig; gamma_cache = uu___252_12513.gamma_cache; modules = uu___252_12513.modules; expected_typ = uu___252_12513.expected_typ; sigtab = uu___252_12513.sigtab; attrtab = uu___252_12513.attrtab; is_pattern = uu___252_12513.is_pattern; instantiate_imp = uu___252_12513.instantiate_imp; effects = uu___252_12513.effects; generalize = uu___252_12513.generalize; letrecs = uu___252_12513.letrecs; top_level = uu___252_12513.top_level; check_uvars = uu___252_12513.check_uvars; use_eq = uu___252_12513.use_eq; is_iface = uu___252_12513.is_iface; admit = uu___252_12513.admit; lax = uu___252_12513.lax; lax_universes = uu___252_12513.lax_universes; phase1 = uu___252_12513.phase1; failhard = uu___252_12513.failhard; nosynth = uu___252_12513.nosynth; uvar_subtyping = uu___252_12513.uvar_subtyping; tc_term = uu___252_12513.tc_term; type_of = uu___252_12513.type_of; universe_of = uu___252_12513.universe_of; check_type_of = uu___252_12513.check_type_of; use_bv_sorts = uu___252_12513.use_bv_sorts; qtbl_name_and_index = ((tbl), (FStar_Pervasives_Native.Some (((l), (next))))); normalized_eff_names = uu___252_12513.normalized_eff_names; fv_delta_depths = uu___252_12513.fv_delta_depths; proof_ns = uu___252_12513.proof_ns; synth_hook = uu___252_12513.synth_hook; splice = uu___252_12513.splice; postprocess = uu___252_12513.postprocess; is_native_tactic = uu___252_12513.is_native_tactic; identifier_info = uu___252_12513.identifier_info; tc_hooks = uu___252_12513.tc_hooks; dsenv = uu___252_12513.dsenv; nbe = uu___252_12513.nbe});
))
end
| FStar_Pervasives_Native.Some (uu____12526, m) -> begin
(

let next = (m + (Prims.parse_int "1"))
in ((add_query_index ((l), (next)));
(FStar_Util.smap_add tbl l.FStar_Ident.str next);
(

let uu___253_12535 = env
in {solver = uu___253_12535.solver; range = uu___253_12535.range; curmodule = uu___253_12535.curmodule; gamma = uu___253_12535.gamma; gamma_sig = uu___253_12535.gamma_sig; gamma_cache = uu___253_12535.gamma_cache; modules = uu___253_12535.modules; expected_typ = uu___253_12535.expected_typ; sigtab = uu___253_12535.sigtab; attrtab = uu___253_12535.attrtab; is_pattern = uu___253_12535.is_pattern; instantiate_imp = uu___253_12535.instantiate_imp; effects = uu___253_12535.effects; generalize = uu___253_12535.generalize; letrecs = uu___253_12535.letrecs; top_level = uu___253_12535.top_level; check_uvars = uu___253_12535.check_uvars; use_eq = uu___253_12535.use_eq; is_iface = uu___253_12535.is_iface; admit = uu___253_12535.admit; lax = uu___253_12535.lax; lax_universes = uu___253_12535.lax_universes; phase1 = uu___253_12535.phase1; failhard = uu___253_12535.failhard; nosynth = uu___253_12535.nosynth; uvar_subtyping = uu___253_12535.uvar_subtyping; tc_term = uu___253_12535.tc_term; type_of = uu___253_12535.type_of; universe_of = uu___253_12535.universe_of; check_type_of = uu___253_12535.check_type_of; use_bv_sorts = uu___253_12535.use_bv_sorts; qtbl_name_and_index = ((tbl), (FStar_Pervasives_Native.Some (((l), (next))))); normalized_eff_names = uu___253_12535.normalized_eff_names; fv_delta_depths = uu___253_12535.fv_delta_depths; proof_ns = uu___253_12535.proof_ns; synth_hook = uu___253_12535.synth_hook; splice = uu___253_12535.splice; postprocess = uu___253_12535.postprocess; is_native_tactic = uu___253_12535.is_native_tactic; identifier_info = uu___253_12535.identifier_info; tc_hooks = uu___253_12535.tc_hooks; dsenv = uu___253_12535.dsenv; nbe = uu___253_12535.nbe});
))
end))
end)))


let debug : env  ->  FStar_Options.debug_level_t  ->  Prims.bool = (fun env l -> (FStar_Options.debug_at_level env.curmodule.FStar_Ident.str l))


let set_range : env  ->  FStar_Range.range  ->  env = (fun e r -> (match ((Prims.op_Equality r FStar_Range.dummyRange)) with
| true -> begin
e
end
| uu____12568 -> begin
(

let uu___254_12569 = e
in {solver = uu___254_12569.solver; range = r; curmodule = uu___254_12569.curmodule; gamma = uu___254_12569.gamma; gamma_sig = uu___254_12569.gamma_sig; gamma_cache = uu___254_12569.gamma_cache; modules = uu___254_12569.modules; expected_typ = uu___254_12569.expected_typ; sigtab = uu___254_12569.sigtab; attrtab = uu___254_12569.attrtab; is_pattern = uu___254_12569.is_pattern; instantiate_imp = uu___254_12569.instantiate_imp; effects = uu___254_12569.effects; generalize = uu___254_12569.generalize; letrecs = uu___254_12569.letrecs; top_level = uu___254_12569.top_level; check_uvars = uu___254_12569.check_uvars; use_eq = uu___254_12569.use_eq; is_iface = uu___254_12569.is_iface; admit = uu___254_12569.admit; lax = uu___254_12569.lax; lax_universes = uu___254_12569.lax_universes; phase1 = uu___254_12569.phase1; failhard = uu___254_12569.failhard; nosynth = uu___254_12569.nosynth; uvar_subtyping = uu___254_12569.uvar_subtyping; tc_term = uu___254_12569.tc_term; type_of = uu___254_12569.type_of; universe_of = uu___254_12569.universe_of; check_type_of = uu___254_12569.check_type_of; use_bv_sorts = uu___254_12569.use_bv_sorts; qtbl_name_and_index = uu___254_12569.qtbl_name_and_index; normalized_eff_names = uu___254_12569.normalized_eff_names; fv_delta_depths = uu___254_12569.fv_delta_depths; proof_ns = uu___254_12569.proof_ns; synth_hook = uu___254_12569.synth_hook; splice = uu___254_12569.splice; postprocess = uu___254_12569.postprocess; is_native_tactic = uu___254_12569.is_native_tactic; identifier_info = uu___254_12569.identifier_info; tc_hooks = uu___254_12569.tc_hooks; dsenv = uu___254_12569.dsenv; nbe = uu___254_12569.nbe})
end))


let get_range : env  ->  FStar_Range.range = (fun e -> e.range)


let toggle_id_info : env  ->  Prims.bool  ->  unit = (fun env enabled -> (

let uu____12585 = (

let uu____12586 = (FStar_ST.op_Bang env.identifier_info)
in (FStar_TypeChecker_Common.id_info_toggle uu____12586 enabled))
in (FStar_ST.op_Colon_Equals env.identifier_info uu____12585)))


let insert_bv_info : env  ->  FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.typ  ->  unit = (fun env bv ty -> (

let uu____12640 = (

let uu____12641 = (FStar_ST.op_Bang env.identifier_info)
in (FStar_TypeChecker_Common.id_info_insert_bv uu____12641 bv ty))
in (FStar_ST.op_Colon_Equals env.identifier_info uu____12640)))


let insert_fv_info : env  ->  FStar_Syntax_Syntax.fv  ->  FStar_Syntax_Syntax.typ  ->  unit = (fun env fv ty -> (

let uu____12695 = (

let uu____12696 = (FStar_ST.op_Bang env.identifier_info)
in (FStar_TypeChecker_Common.id_info_insert_fv uu____12696 fv ty))
in (FStar_ST.op_Colon_Equals env.identifier_info uu____12695)))


let promote_id_info : env  ->  (FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ)  ->  unit = (fun env ty_map -> (

let uu____12750 = (

let uu____12751 = (FStar_ST.op_Bang env.identifier_info)
in (FStar_TypeChecker_Common.id_info_promote uu____12751 ty_map))
in (FStar_ST.op_Colon_Equals env.identifier_info uu____12750)))


let modules : env  ->  FStar_Syntax_Syntax.modul Prims.list = (fun env -> env.modules)


let current_module : env  ->  FStar_Ident.lident = (fun env -> env.curmodule)


let set_current_module : env  ->  FStar_Ident.lident  ->  env = (fun env lid -> (

let uu___255_12812 = env
in {solver = uu___255_12812.solver; range = uu___255_12812.range; curmodule = lid; gamma = uu___255_12812.gamma; gamma_sig = uu___255_12812.gamma_sig; gamma_cache = uu___255_12812.gamma_cache; modules = uu___255_12812.modules; expected_typ = uu___255_12812.expected_typ; sigtab = uu___255_12812.sigtab; attrtab = uu___255_12812.attrtab; is_pattern = uu___255_12812.is_pattern; instantiate_imp = uu___255_12812.instantiate_imp; effects = uu___255_12812.effects; generalize = uu___255_12812.generalize; letrecs = uu___255_12812.letrecs; top_level = uu___255_12812.top_level; check_uvars = uu___255_12812.check_uvars; use_eq = uu___255_12812.use_eq; is_iface = uu___255_12812.is_iface; admit = uu___255_12812.admit; lax = uu___255_12812.lax; lax_universes = uu___255_12812.lax_universes; phase1 = uu___255_12812.phase1; failhard = uu___255_12812.failhard; nosynth = uu___255_12812.nosynth; uvar_subtyping = uu___255_12812.uvar_subtyping; tc_term = uu___255_12812.tc_term; type_of = uu___255_12812.type_of; universe_of = uu___255_12812.universe_of; check_type_of = uu___255_12812.check_type_of; use_bv_sorts = uu___255_12812.use_bv_sorts; qtbl_name_and_index = uu___255_12812.qtbl_name_and_index; normalized_eff_names = uu___255_12812.normalized_eff_names; fv_delta_depths = uu___255_12812.fv_delta_depths; proof_ns = uu___255_12812.proof_ns; synth_hook = uu___255_12812.synth_hook; splice = uu___255_12812.splice; postprocess = uu___255_12812.postprocess; is_native_tactic = uu___255_12812.is_native_tactic; identifier_info = uu___255_12812.identifier_info; tc_hooks = uu___255_12812.tc_hooks; dsenv = uu___255_12812.dsenv; nbe = uu___255_12812.nbe}))


let has_interface : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env l -> (FStar_All.pipe_right env.modules (FStar_Util.for_some (fun m -> (m.FStar_Syntax_Syntax.is_interface && (FStar_Ident.lid_equals m.FStar_Syntax_Syntax.name l))))))


let find_in_sigtab : env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.sigelt FStar_Pervasives_Native.option = (fun env lid -> (

let uu____12839 = (FStar_Ident.text_of_lid lid)
in (FStar_Util.smap_try_find (sigtab env) uu____12839)))


let name_not_found : FStar_Ident.lid  ->  (FStar_Errors.raw_error * Prims.string) = (fun l -> (

let uu____12849 = (FStar_Util.format1 "Name \"%s\" not found" l.FStar_Ident.str)
in ((FStar_Errors.Fatal_NameNotFound), (uu____12849))))


let variable_not_found : FStar_Syntax_Syntax.bv  ->  (FStar_Errors.raw_error * Prims.string) = (fun v1 -> (

let uu____12859 = (

let uu____12860 = (FStar_Syntax_Print.bv_to_string v1)
in (FStar_Util.format1 "Variable \"%s\" not found" uu____12860))
in ((FStar_Errors.Fatal_VariableNotFound), (uu____12859))))


let new_u_univ : unit  ->  FStar_Syntax_Syntax.universe = (fun uu____12865 -> (

let uu____12866 = (FStar_Syntax_Unionfind.univ_fresh ())
in FStar_Syntax_Syntax.U_unif (uu____12866)))


let mk_univ_subst : FStar_Syntax_Syntax.univ_name Prims.list  ->  FStar_Syntax_Syntax.universes  ->  FStar_Syntax_Syntax.subst_elt Prims.list = (fun formals us -> (

let n1 = ((FStar_List.length formals) - (Prims.parse_int "1"))
in (FStar_All.pipe_right us (FStar_List.mapi (fun i u -> FStar_Syntax_Syntax.UN ((((n1 - i)), (u))))))))


let inst_tscheme_with : FStar_Syntax_Syntax.tscheme  ->  FStar_Syntax_Syntax.universes  ->  (FStar_Syntax_Syntax.universes * FStar_Syntax_Syntax.term) = (fun ts us -> (match (((ts), (us))) with
| (([], t), []) -> begin
(([]), (t))
end
| ((formals, t), uu____12960) -> begin
(

let vs = (mk_univ_subst formals us)
in (

let uu____12984 = (FStar_Syntax_Subst.subst vs t)
in ((us), (uu____12984))))
end))


let inst_tscheme : FStar_Syntax_Syntax.tscheme  ->  (FStar_Syntax_Syntax.universes * FStar_Syntax_Syntax.term) = (fun uu___233_13000 -> (match (uu___233_13000) with
| ([], t) -> begin
(([]), (t))
end
| (us, t) -> begin
(

let us' = (FStar_All.pipe_right us (FStar_List.map (fun uu____13026 -> (new_u_univ ()))))
in (inst_tscheme_with ((us), (t)) us'))
end))


let inst_tscheme_with_range : FStar_Range.range  ->  FStar_Syntax_Syntax.tscheme  ->  (FStar_Syntax_Syntax.universes * FStar_Syntax_Syntax.term) = (fun r t -> (

let uu____13045 = (inst_tscheme t)
in (match (uu____13045) with
| (us, t1) -> begin
(

let uu____13056 = (FStar_Syntax_Subst.set_use_range r t1)
in ((us), (uu____13056)))
end)))


let inst_effect_fun_with : FStar_Syntax_Syntax.universes  ->  env  ->  FStar_Syntax_Syntax.eff_decl  ->  FStar_Syntax_Syntax.tscheme  ->  FStar_Syntax_Syntax.term = (fun insts env ed uu____13076 -> (match (uu____13076) with
| (us, t) -> begin
(match (ed.FStar_Syntax_Syntax.binders) with
| [] -> begin
(

let univs1 = (FStar_List.append ed.FStar_Syntax_Syntax.univs us)
in ((match ((Prims.op_disEquality (FStar_List.length insts) (FStar_List.length univs1))) with
| true -> begin
(

let uu____13097 = (

let uu____13098 = (FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length univs1))
in (

let uu____13099 = (FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length insts))
in (

let uu____13100 = (FStar_Syntax_Print.lid_to_string ed.FStar_Syntax_Syntax.mname)
in (

let uu____13101 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.format4 "Expected %s instantiations; got %s; failed universe instantiation in effect %s\n\t%s\n" uu____13098 uu____13099 uu____13100 uu____13101)))))
in (failwith uu____13097))
end
| uu____13102 -> begin
()
end);
(

let uu____13103 = (inst_tscheme_with (((FStar_List.append ed.FStar_Syntax_Syntax.univs us)), (t)) insts)
in (FStar_Pervasives_Native.snd uu____13103));
))
end
| uu____13112 -> begin
(

let uu____13113 = (

let uu____13114 = (FStar_Syntax_Print.lid_to_string ed.FStar_Syntax_Syntax.mname)
in (FStar_Util.format1 "Unexpected use of an uninstantiated effect: %s\n" uu____13114))
in (failwith uu____13113))
end)
end))

type tri =
| Yes
| No
| Maybe


let uu___is_Yes : tri  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Yes -> begin
true
end
| uu____13120 -> begin
false
end))


let uu___is_No : tri  ->  Prims.bool = (fun projectee -> (match (projectee) with
| No -> begin
true
end
| uu____13126 -> begin
false
end))


let uu___is_Maybe : tri  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Maybe -> begin
true
end
| uu____13132 -> begin
false
end))


let in_cur_mod : env  ->  FStar_Ident.lident  ->  tri = (fun env l -> (

let cur = (current_module env)
in (match ((Prims.op_Equality l.FStar_Ident.nsstr cur.FStar_Ident.str)) with
| true -> begin
Yes
end
| uu____13144 -> begin
(match ((FStar_Util.starts_with l.FStar_Ident.nsstr cur.FStar_Ident.str)) with
| true -> begin
(

let lns = (FStar_List.append l.FStar_Ident.ns ((l.FStar_Ident.ident)::[]))
in (

let cur1 = (FStar_List.append cur.FStar_Ident.ns ((cur.FStar_Ident.ident)::[]))
in (

let rec aux = (fun c l1 -> (match (((c), (l1))) with
| ([], uu____13174) -> begin
Maybe
end
| (uu____13181, []) -> begin
No
end
| ((hd1)::tl1, (hd')::tl') when (Prims.op_Equality hd1.FStar_Ident.idText hd'.FStar_Ident.idText) -> begin
(aux tl1 tl')
end
| uu____13200 -> begin
No
end))
in (aux cur1 lns))))
end
| uu____13209 -> begin
No
end)
end)))


type qninfo =
(((FStar_Syntax_Syntax.universes * FStar_Syntax_Syntax.typ), (FStar_Syntax_Syntax.sigelt * FStar_Syntax_Syntax.universes FStar_Pervasives_Native.option)) FStar_Util.either * FStar_Range.range) FStar_Pervasives_Native.option


let lookup_qname : env  ->  FStar_Ident.lident  ->  qninfo = (fun env lid -> (

let cur_mod = (in_cur_mod env lid)
in (

let cache = (fun t -> ((FStar_Util.smap_add (gamma_cache env) lid.FStar_Ident.str t);
FStar_Pervasives_Native.Some (t);
))
in (

let found = (match ((Prims.op_disEquality cur_mod No)) with
| true -> begin
(

let uu____13291 = (FStar_Util.smap_try_find (gamma_cache env) lid.FStar_Ident.str)
in (match (uu____13291) with
| FStar_Pervasives_Native.None -> begin
(

let uu____13314 = (FStar_Util.find_map env.gamma (fun uu___234_13358 -> (match (uu___234_13358) with
| FStar_Syntax_Syntax.Binding_lid (l, t) -> begin
(

let uu____13397 = (FStar_Ident.lid_equals lid l)
in (match (uu____13397) with
| true -> begin
(

let uu____13418 = (

let uu____13437 = (

let uu____13452 = (inst_tscheme t)
in FStar_Util.Inl (uu____13452))
in (

let uu____13467 = (FStar_Ident.range_of_lid l)
in ((uu____13437), (uu____13467))))
in FStar_Pervasives_Native.Some (uu____13418))
end
| uu____13500 -> begin
FStar_Pervasives_Native.None
end))
end
| uu____13519 -> begin
FStar_Pervasives_Native.None
end)))
in (FStar_Util.catch_opt uu____13314 (fun uu____13557 -> (FStar_Util.find_map env.gamma_sig (fun uu___235_13566 -> (match (uu___235_13566) with
| (uu____13569, {FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_bundle (ses, uu____13571); FStar_Syntax_Syntax.sigrng = uu____13572; FStar_Syntax_Syntax.sigquals = uu____13573; FStar_Syntax_Syntax.sigmeta = uu____13574; FStar_Syntax_Syntax.sigattrs = uu____13575}) -> begin
(FStar_Util.find_map ses (fun se -> (

let uu____13595 = (FStar_All.pipe_right (FStar_Syntax_Util.lids_of_sigelt se) (FStar_Util.for_some (FStar_Ident.lid_equals lid)))
in (match (uu____13595) with
| true -> begin
(cache ((FStar_Util.Inr (((se), (FStar_Pervasives_Native.None)))), ((FStar_Syntax_Util.range_of_sigelt se))))
end
| uu____13626 -> begin
FStar_Pervasives_Native.None
end))))
end
| (lids, s) -> begin
(

let maybe_cache = (fun t -> (match (s.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_declare_typ (uu____13643) -> begin
FStar_Pervasives_Native.Some (t)
end
| uu____13650 -> begin
(cache t)
end))
in (

let uu____13651 = (FStar_List.tryFind (FStar_Ident.lid_equals lid) lids)
in (match (uu____13651) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (l) -> begin
(

let uu____13657 = (

let uu____13658 = (FStar_Ident.range_of_lid l)
in ((FStar_Util.Inr (((s), (FStar_Pervasives_Native.None)))), (uu____13658)))
in (maybe_cache uu____13657))
end)))
end))))))
end
| se -> begin
se
end))
end
| uu____13688 -> begin
FStar_Pervasives_Native.None
end)
in (match ((FStar_Util.is_some found)) with
| true -> begin
found
end
| uu____13725 -> begin
(

let uu____13726 = (find_in_sigtab env lid)
in (match (uu____13726) with
| FStar_Pervasives_Native.Some (se) -> begin
FStar_Pervasives_Native.Some (((FStar_Util.Inr (((se), (FStar_Pervasives_Native.None)))), ((FStar_Syntax_Util.range_of_sigelt se))))
end
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end))
end)))))


let lookup_sigelt : env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.sigelt FStar_Pervasives_Native.option = (fun env lid -> (

let uu____13806 = (lookup_qname env lid)
in (match (uu____13806) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (FStar_Util.Inl (uu____13827), rng) -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (FStar_Util.Inr (se, us), rng) -> begin
FStar_Pervasives_Native.Some (se)
end)))


let lookup_attr : env  ->  Prims.string  ->  FStar_Syntax_Syntax.sigelt Prims.list = (fun env attr -> (

let uu____13938 = (FStar_Util.smap_try_find (attrtab env) attr)
in (match (uu____13938) with
| FStar_Pervasives_Native.Some (ses) -> begin
ses
end
| FStar_Pervasives_Native.None -> begin
[]
end)))


let add_se_to_attrtab : env  ->  FStar_Syntax_Syntax.sigelt  ->  unit = (fun env se -> (

let add_one1 = (fun env1 se1 attr -> (

let uu____13980 = (

let uu____13983 = (lookup_attr env1 attr)
in (se1)::uu____13983)
in (FStar_Util.smap_add (attrtab env1) attr uu____13980)))
in (FStar_List.iter (fun attr -> (

let uu____13993 = (

let uu____13994 = (FStar_Syntax_Subst.compress attr)
in uu____13994.FStar_Syntax_Syntax.n)
in (match (uu____13993) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(

let uu____13998 = (

let uu____13999 = (FStar_Syntax_Syntax.lid_of_fv fv)
in uu____13999.FStar_Ident.str)
in (add_one1 env se uu____13998))
end
| uu____14000 -> begin
()
end))) se.FStar_Syntax_Syntax.sigattrs)))


let rec add_sigelt : env  ->  FStar_Syntax_Syntax.sigelt  ->  unit = (fun env se -> (match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_bundle (ses, uu____14022) -> begin
(add_sigelts env ses)
end
| uu____14031 -> begin
(

let lids = (FStar_Syntax_Util.lids_of_sigelt se)
in ((FStar_List.iter (fun l -> (FStar_Util.smap_add (sigtab env) l.FStar_Ident.str se)) lids);
(add_se_to_attrtab env se);
(match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_new_effect (ne) -> begin
(FStar_All.pipe_right ne.FStar_Syntax_Syntax.actions (FStar_List.iter (fun a -> (

let se_let = (FStar_Syntax_Util.action_as_lb ne.FStar_Syntax_Syntax.mname a a.FStar_Syntax_Syntax.action_defn.FStar_Syntax_Syntax.pos)
in (FStar_Util.smap_add (sigtab env) a.FStar_Syntax_Syntax.action_name.FStar_Ident.str se_let)))))
end
| uu____14046 -> begin
()
end);
))
end))
and add_sigelts : env  ->  FStar_Syntax_Syntax.sigelt Prims.list  ->  unit = (fun env ses -> (FStar_All.pipe_right ses (FStar_List.iter (add_sigelt env))))


let try_lookup_bv : env  ->  FStar_Syntax_Syntax.bv  ->  (FStar_Syntax_Syntax.typ * FStar_Range.range) FStar_Pervasives_Native.option = (fun env bv -> (FStar_Util.find_map env.gamma (fun uu___236_14077 -> (match (uu___236_14077) with
| FStar_Syntax_Syntax.Binding_var (id1) when (FStar_Syntax_Syntax.bv_eq id1 bv) -> begin
FStar_Pervasives_Native.Some (((id1.FStar_Syntax_Syntax.sort), (id1.FStar_Syntax_Syntax.ppname.FStar_Ident.idRange)))
end
| uu____14095 -> begin
FStar_Pervasives_Native.None
end))))


let lookup_type_of_let : FStar_Syntax_Syntax.universes FStar_Pervasives_Native.option  ->  FStar_Syntax_Syntax.sigelt  ->  FStar_Ident.lident  ->  ((FStar_Syntax_Syntax.universes * FStar_Syntax_Syntax.term) * FStar_Range.range) FStar_Pervasives_Native.option = (fun us_opt se lid -> (

let inst_tscheme1 = (fun ts -> (match (us_opt) with
| FStar_Pervasives_Native.None -> begin
(inst_tscheme ts)
end
| FStar_Pervasives_Native.Some (us) -> begin
(inst_tscheme_with ts us)
end))
in (match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_let ((uu____14156, (lb)::[]), uu____14158) -> begin
(

let uu____14165 = (

let uu____14174 = (inst_tscheme1 ((lb.FStar_Syntax_Syntax.lbunivs), (lb.FStar_Syntax_Syntax.lbtyp)))
in (

let uu____14183 = (FStar_Syntax_Syntax.range_of_lbname lb.FStar_Syntax_Syntax.lbname)
in ((uu____14174), (uu____14183))))
in FStar_Pervasives_Native.Some (uu____14165))
end
| FStar_Syntax_Syntax.Sig_let ((uu____14196, lbs), uu____14198) -> begin
(FStar_Util.find_map lbs (fun lb -> (match (lb.FStar_Syntax_Syntax.lbname) with
| FStar_Util.Inl (uu____14228) -> begin
(failwith "impossible")
end
| FStar_Util.Inr (fv) -> begin
(

let uu____14240 = (FStar_Syntax_Syntax.fv_eq_lid fv lid)
in (match (uu____14240) with
| true -> begin
(

let uu____14251 = (

let uu____14260 = (inst_tscheme1 ((lb.FStar_Syntax_Syntax.lbunivs), (lb.FStar_Syntax_Syntax.lbtyp)))
in (

let uu____14269 = (FStar_Syntax_Syntax.range_of_fv fv)
in ((uu____14260), (uu____14269))))
in FStar_Pervasives_Native.Some (uu____14251))
end
| uu____14282 -> begin
FStar_Pervasives_Native.None
end))
end)))
end
| uu____14291 -> begin
FStar_Pervasives_Native.None
end)))


let effect_signature : FStar_Syntax_Syntax.universes FStar_Pervasives_Native.option  ->  FStar_Syntax_Syntax.sigelt  ->  ((FStar_Syntax_Syntax.universes * FStar_Syntax_Syntax.term) * FStar_Range.range) FStar_Pervasives_Native.option = (fun us_opt se -> (

let inst_tscheme1 = (fun ts -> (match (us_opt) with
| FStar_Pervasives_Native.None -> begin
(inst_tscheme ts)
end
| FStar_Pervasives_Native.Some (us) -> begin
(inst_tscheme_with ts us)
end))
in (match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_new_effect (ne) -> begin
(

let uu____14350 = (

let uu____14359 = (

let uu____14364 = (

let uu____14365 = (

let uu____14368 = (FStar_Syntax_Syntax.mk_Total ne.FStar_Syntax_Syntax.signature)
in (FStar_Syntax_Util.arrow ne.FStar_Syntax_Syntax.binders uu____14368))
in ((ne.FStar_Syntax_Syntax.univs), (uu____14365)))
in (inst_tscheme1 uu____14364))
in ((uu____14359), (se.FStar_Syntax_Syntax.sigrng)))
in FStar_Pervasives_Native.Some (uu____14350))
end
| FStar_Syntax_Syntax.Sig_effect_abbrev (lid, us, binders, uu____14390, uu____14391) -> begin
(

let uu____14396 = (

let uu____14405 = (

let uu____14410 = (

let uu____14411 = (

let uu____14414 = (FStar_Syntax_Syntax.mk_Total FStar_Syntax_Syntax.teff)
in (FStar_Syntax_Util.arrow binders uu____14414))
in ((us), (uu____14411)))
in (inst_tscheme1 uu____14410))
in ((uu____14405), (se.FStar_Syntax_Syntax.sigrng)))
in FStar_Pervasives_Native.Some (uu____14396))
end
| uu____14433 -> begin
FStar_Pervasives_Native.None
end)))


let try_lookup_lid_aux : FStar_Syntax_Syntax.universes FStar_Pervasives_Native.option  ->  env  ->  FStar_Ident.lident  ->  ((FStar_Syntax_Syntax.universes * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax) * FStar_Range.range) FStar_Pervasives_Native.option = (fun us_opt env lid -> (

let inst_tscheme1 = (fun ts -> (match (us_opt) with
| FStar_Pervasives_Native.None -> begin
(inst_tscheme ts)
end
| FStar_Pervasives_Native.Some (us) -> begin
(inst_tscheme_with ts us)
end))
in (

let mapper = (fun uu____14521 -> (match (uu____14521) with
| (lr, rng) -> begin
(match (lr) with
| FStar_Util.Inl (t) -> begin
FStar_Pervasives_Native.Some (((t), (rng)))
end
| FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_datacon (uu____14617, uvs, t, uu____14620, uu____14621, uu____14622); FStar_Syntax_Syntax.sigrng = uu____14623; FStar_Syntax_Syntax.sigquals = uu____14624; FStar_Syntax_Syntax.sigmeta = uu____14625; FStar_Syntax_Syntax.sigattrs = uu____14626}, FStar_Pervasives_Native.None) -> begin
(

let uu____14647 = (

let uu____14656 = (inst_tscheme1 ((uvs), (t)))
in ((uu____14656), (rng)))
in FStar_Pervasives_Native.Some (uu____14647))
end
| FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_declare_typ (l, uvs, t); FStar_Syntax_Syntax.sigrng = uu____14680; FStar_Syntax_Syntax.sigquals = qs; FStar_Syntax_Syntax.sigmeta = uu____14682; FStar_Syntax_Syntax.sigattrs = uu____14683}, FStar_Pervasives_Native.None) -> begin
(

let uu____14700 = (

let uu____14701 = (in_cur_mod env l)
in (Prims.op_Equality uu____14701 Yes))
in (match (uu____14700) with
| true -> begin
(

let uu____14712 = ((FStar_All.pipe_right qs (FStar_List.contains FStar_Syntax_Syntax.Assumption)) || env.is_iface)
in (match (uu____14712) with
| true -> begin
(

let uu____14725 = (

let uu____14734 = (inst_tscheme1 ((uvs), (t)))
in ((uu____14734), (rng)))
in FStar_Pervasives_Native.Some (uu____14725))
end
| uu____14755 -> begin
FStar_Pervasives_Native.None
end))
end
| uu____14764 -> begin
(

let uu____14765 = (

let uu____14774 = (inst_tscheme1 ((uvs), (t)))
in ((uu____14774), (rng)))
in FStar_Pervasives_Native.Some (uu____14765))
end))
end
| FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_inductive_typ (lid1, uvs, tps, k, uu____14799, uu____14800); FStar_Syntax_Syntax.sigrng = uu____14801; FStar_Syntax_Syntax.sigquals = uu____14802; FStar_Syntax_Syntax.sigmeta = uu____14803; FStar_Syntax_Syntax.sigattrs = uu____14804}, FStar_Pervasives_Native.None) -> begin
(match (tps) with
| [] -> begin
(

let uu____14845 = (

let uu____14854 = (inst_tscheme1 ((uvs), (k)))
in ((uu____14854), (rng)))
in FStar_Pervasives_Native.Some (uu____14845))
end
| uu____14875 -> begin
(

let uu____14876 = (

let uu____14885 = (

let uu____14890 = (

let uu____14891 = (

let uu____14894 = (FStar_Syntax_Syntax.mk_Total k)
in (FStar_Syntax_Util.flat_arrow tps uu____14894))
in ((uvs), (uu____14891)))
in (inst_tscheme1 uu____14890))
in ((uu____14885), (rng)))
in FStar_Pervasives_Native.Some (uu____14876))
end)
end
| FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_inductive_typ (lid1, uvs, tps, k, uu____14917, uu____14918); FStar_Syntax_Syntax.sigrng = uu____14919; FStar_Syntax_Syntax.sigquals = uu____14920; FStar_Syntax_Syntax.sigmeta = uu____14921; FStar_Syntax_Syntax.sigattrs = uu____14922}, FStar_Pervasives_Native.Some (us)) -> begin
(match (tps) with
| [] -> begin
(

let uu____14964 = (

let uu____14973 = (inst_tscheme_with ((uvs), (k)) us)
in ((uu____14973), (rng)))
in FStar_Pervasives_Native.Some (uu____14964))
end
| uu____14994 -> begin
(

let uu____14995 = (

let uu____15004 = (

let uu____15009 = (

let uu____15010 = (

let uu____15013 = (FStar_Syntax_Syntax.mk_Total k)
in (FStar_Syntax_Util.flat_arrow tps uu____15013))
in ((uvs), (uu____15010)))
in (inst_tscheme_with uu____15009 us))
in ((uu____15004), (rng)))
in FStar_Pervasives_Native.Some (uu____14995))
end)
end
| FStar_Util.Inr (se) -> begin
(

let uu____15049 = (match (se) with
| ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let (uu____15070); FStar_Syntax_Syntax.sigrng = uu____15071; FStar_Syntax_Syntax.sigquals = uu____15072; FStar_Syntax_Syntax.sigmeta = uu____15073; FStar_Syntax_Syntax.sigattrs = uu____15074}, FStar_Pervasives_Native.None) -> begin
(lookup_type_of_let us_opt (FStar_Pervasives_Native.fst se) lid)
end
| uu____15089 -> begin
(effect_signature us_opt (FStar_Pervasives_Native.fst se))
end)
in (FStar_All.pipe_right uu____15049 (FStar_Util.map_option (fun uu____15137 -> (match (uu____15137) with
| (us_t, rng1) -> begin
((us_t), (rng1))
end)))))
end)
end))
in (

let uu____15168 = (

let uu____15179 = (lookup_qname env lid)
in (FStar_Util.bind_opt uu____15179 mapper))
in (match (uu____15168) with
| FStar_Pervasives_Native.Some ((us, t), r) -> begin
(

let uu____15253 = (

let uu____15264 = (

let uu____15271 = (

let uu___256_15274 = t
in (

let uu____15275 = (FStar_Ident.range_of_lid lid)
in {FStar_Syntax_Syntax.n = uu___256_15274.FStar_Syntax_Syntax.n; FStar_Syntax_Syntax.pos = uu____15275; FStar_Syntax_Syntax.vars = uu___256_15274.FStar_Syntax_Syntax.vars}))
in ((us), (uu____15271)))
in ((uu____15264), (r)))
in FStar_Pervasives_Native.Some (uu____15253))
end
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end)))))


let lid_exists : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env l -> (

let uu____15322 = (lookup_qname env l)
in (match (uu____15322) with
| FStar_Pervasives_Native.None -> begin
false
end
| FStar_Pervasives_Native.Some (uu____15341) -> begin
true
end)))


let lookup_bv : env  ->  FStar_Syntax_Syntax.bv  ->  (FStar_Syntax_Syntax.typ * FStar_Range.range) = (fun env bv -> (

let bvr = (FStar_Syntax_Syntax.range_of_bv bv)
in (

let uu____15393 = (try_lookup_bv env bv)
in (match (uu____15393) with
| FStar_Pervasives_Native.None -> begin
(

let uu____15408 = (variable_not_found bv)
in (FStar_Errors.raise_error uu____15408 bvr))
end
| FStar_Pervasives_Native.Some (t, r) -> begin
(

let uu____15423 = (FStar_Syntax_Subst.set_use_range bvr t)
in (

let uu____15424 = (

let uu____15425 = (FStar_Range.use_range bvr)
in (FStar_Range.set_use_range r uu____15425))
in ((uu____15423), (uu____15424))))
end))))


let try_lookup_lid : env  ->  FStar_Ident.lident  ->  ((FStar_Syntax_Syntax.universes * FStar_Syntax_Syntax.typ) * FStar_Range.range) FStar_Pervasives_Native.option = (fun env l -> (

let uu____15446 = (try_lookup_lid_aux FStar_Pervasives_Native.None env l)
in (match (uu____15446) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some ((us, t), r) -> begin
(

let use_range1 = (FStar_Ident.range_of_lid l)
in (

let r1 = (

let uu____15512 = (FStar_Range.use_range use_range1)
in (FStar_Range.set_use_range r uu____15512))
in (

let uu____15513 = (

let uu____15522 = (

let uu____15527 = (FStar_Syntax_Subst.set_use_range use_range1 t)
in ((us), (uu____15527)))
in ((uu____15522), (r1)))
in FStar_Pervasives_Native.Some (uu____15513))))
end)))


let try_lookup_and_inst_lid : env  ->  FStar_Syntax_Syntax.universes  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.typ * FStar_Range.range) FStar_Pervasives_Native.option = (fun env us l -> (

let uu____15561 = (try_lookup_lid_aux (FStar_Pervasives_Native.Some (us)) env l)
in (match (uu____15561) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some ((uu____15594, t), r) -> begin
(

let use_range1 = (FStar_Ident.range_of_lid l)
in (

let r1 = (

let uu____15619 = (FStar_Range.use_range use_range1)
in (FStar_Range.set_use_range r uu____15619))
in (

let uu____15620 = (

let uu____15625 = (FStar_Syntax_Subst.set_use_range use_range1 t)
in ((uu____15625), (r1)))
in FStar_Pervasives_Native.Some (uu____15620))))
end)))


let lookup_lid : env  ->  FStar_Ident.lident  ->  ((FStar_Syntax_Syntax.universes * FStar_Syntax_Syntax.typ) * FStar_Range.range) = (fun env l -> (

let uu____15648 = (try_lookup_lid env l)
in (match (uu____15648) with
| FStar_Pervasives_Native.None -> begin
(

let uu____15675 = (name_not_found l)
in (

let uu____15680 = (FStar_Ident.range_of_lid l)
in (FStar_Errors.raise_error uu____15675 uu____15680)))
end
| FStar_Pervasives_Native.Some (v1) -> begin
v1
end)))


let lookup_univ : env  ->  FStar_Syntax_Syntax.univ_name  ->  Prims.bool = (fun env x -> (FStar_All.pipe_right (FStar_List.find (fun uu___237_15720 -> (match (uu___237_15720) with
| FStar_Syntax_Syntax.Binding_univ (y) -> begin
(Prims.op_Equality x.FStar_Ident.idText y.FStar_Ident.idText)
end
| uu____15722 -> begin
false
end)) env.gamma) FStar_Option.isSome))


let try_lookup_val_decl : env  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.tscheme * FStar_Syntax_Syntax.qualifier Prims.list) FStar_Pervasives_Native.option = (fun env lid -> (

let uu____15741 = (lookup_qname env lid)
in (match (uu____15741) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_declare_typ (uu____15750, uvs, t); FStar_Syntax_Syntax.sigrng = uu____15753; FStar_Syntax_Syntax.sigquals = q; FStar_Syntax_Syntax.sigmeta = uu____15755; FStar_Syntax_Syntax.sigattrs = uu____15756}, FStar_Pervasives_Native.None), uu____15757) -> begin
(

let uu____15806 = (

let uu____15813 = (

let uu____15814 = (

let uu____15817 = (FStar_Ident.range_of_lid lid)
in (FStar_Syntax_Subst.set_use_range uu____15817 t))
in ((uvs), (uu____15814)))
in ((uu____15813), (q)))
in FStar_Pervasives_Native.Some (uu____15806))
end
| uu____15830 -> begin
FStar_Pervasives_Native.None
end)))


let lookup_val_decl : env  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.universes * FStar_Syntax_Syntax.typ) = (fun env lid -> (

let uu____15851 = (lookup_qname env lid)
in (match (uu____15851) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_declare_typ (uu____15856, uvs, t); FStar_Syntax_Syntax.sigrng = uu____15859; FStar_Syntax_Syntax.sigquals = uu____15860; FStar_Syntax_Syntax.sigmeta = uu____15861; FStar_Syntax_Syntax.sigattrs = uu____15862}, FStar_Pervasives_Native.None), uu____15863) -> begin
(

let uu____15912 = (FStar_Ident.range_of_lid lid)
in (inst_tscheme_with_range uu____15912 ((uvs), (t))))
end
| uu____15917 -> begin
(

let uu____15918 = (name_not_found lid)
in (

let uu____15923 = (FStar_Ident.range_of_lid lid)
in (FStar_Errors.raise_error uu____15918 uu____15923)))
end)))


let lookup_datacon : env  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.universes * FStar_Syntax_Syntax.typ) = (fun env lid -> (

let uu____15942 = (lookup_qname env lid)
in (match (uu____15942) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_datacon (uu____15947, uvs, t, uu____15950, uu____15951, uu____15952); FStar_Syntax_Syntax.sigrng = uu____15953; FStar_Syntax_Syntax.sigquals = uu____15954; FStar_Syntax_Syntax.sigmeta = uu____15955; FStar_Syntax_Syntax.sigattrs = uu____15956}, FStar_Pervasives_Native.None), uu____15957) -> begin
(

let uu____16010 = (FStar_Ident.range_of_lid lid)
in (inst_tscheme_with_range uu____16010 ((uvs), (t))))
end
| uu____16015 -> begin
(

let uu____16016 = (name_not_found lid)
in (

let uu____16021 = (FStar_Ident.range_of_lid lid)
in (FStar_Errors.raise_error uu____16016 uu____16021)))
end)))


let datacons_of_typ : env  ->  FStar_Ident.lident  ->  (Prims.bool * FStar_Ident.lident Prims.list) = (fun env lid -> (

let uu____16042 = (lookup_qname env lid)
in (match (uu____16042) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_inductive_typ (uu____16049, uu____16050, uu____16051, uu____16052, uu____16053, dcs); FStar_Syntax_Syntax.sigrng = uu____16055; FStar_Syntax_Syntax.sigquals = uu____16056; FStar_Syntax_Syntax.sigmeta = uu____16057; FStar_Syntax_Syntax.sigattrs = uu____16058}, uu____16059), uu____16060) -> begin
((true), (dcs))
end
| uu____16121 -> begin
((false), ([]))
end)))


let typ_of_datacon : env  ->  FStar_Ident.lident  ->  FStar_Ident.lident = (fun env lid -> (

let uu____16134 = (lookup_qname env lid)
in (match (uu____16134) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_datacon (uu____16135, uu____16136, uu____16137, l, uu____16139, uu____16140); FStar_Syntax_Syntax.sigrng = uu____16141; FStar_Syntax_Syntax.sigquals = uu____16142; FStar_Syntax_Syntax.sigmeta = uu____16143; FStar_Syntax_Syntax.sigattrs = uu____16144}, uu____16145), uu____16146) -> begin
l
end
| uu____16201 -> begin
(

let uu____16202 = (

let uu____16203 = (FStar_Syntax_Print.lid_to_string lid)
in (FStar_Util.format1 "Not a datacon: %s" uu____16203))
in (failwith uu____16202))
end)))


let lookup_definition_qninfo_aux : Prims.bool  ->  delta_level Prims.list  ->  FStar_Ident.lident  ->  qninfo  ->  (FStar_Syntax_Syntax.univ_name Prims.list * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax) FStar_Pervasives_Native.option = (fun rec_ok delta_levels lid qninfo -> (

let visible = (fun quals -> (FStar_All.pipe_right delta_levels (FStar_Util.for_some (fun dl -> (FStar_All.pipe_right quals (FStar_Util.for_some (visible_at dl)))))))
in (match (qninfo) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr (se, FStar_Pervasives_Native.None), uu____16265) -> begin
(match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_let ((is_rec, lbs), uu____16322) when ((visible se.FStar_Syntax_Syntax.sigquals) && ((not (is_rec)) || rec_ok)) -> begin
(FStar_Util.find_map lbs (fun lb -> (

let fv = (FStar_Util.right lb.FStar_Syntax_Syntax.lbname)
in (

let uu____16344 = (FStar_Syntax_Syntax.fv_eq_lid fv lid)
in (match (uu____16344) with
| true -> begin
FStar_Pervasives_Native.Some (((lb.FStar_Syntax_Syntax.lbunivs), (lb.FStar_Syntax_Syntax.lbdef)))
end
| uu____16367 -> begin
FStar_Pervasives_Native.None
end)))))
end
| uu____16376 -> begin
FStar_Pervasives_Native.None
end)
end
| uu____16385 -> begin
FStar_Pervasives_Native.None
end)))


let lookup_definition_qninfo : delta_level Prims.list  ->  FStar_Ident.lident  ->  qninfo  ->  (FStar_Syntax_Syntax.univ_names * FStar_Syntax_Syntax.term) FStar_Pervasives_Native.option = (fun delta_levels lid qninfo -> (lookup_definition_qninfo_aux true delta_levels lid qninfo))


let lookup_definition : delta_level Prims.list  ->  env  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.univ_names * FStar_Syntax_Syntax.term) FStar_Pervasives_Native.option = (fun delta_levels env lid -> (

let uu____16444 = (lookup_qname env lid)
in (FStar_All.pipe_left (lookup_definition_qninfo delta_levels lid) uu____16444)))


let lookup_nonrec_definition : delta_level Prims.list  ->  env  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.univ_names * FStar_Syntax_Syntax.term) FStar_Pervasives_Native.option = (fun delta_levels env lid -> (

let uu____16476 = (lookup_qname env lid)
in (FStar_All.pipe_left (lookup_definition_qninfo_aux false delta_levels lid) uu____16476)))


let delta_depth_of_qninfo : FStar_Syntax_Syntax.fv  ->  qninfo  ->  FStar_Syntax_Syntax.delta_depth FStar_Pervasives_Native.option = (fun fv qn -> (

let lid = fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v
in (match ((Prims.op_Equality lid.FStar_Ident.nsstr "Prims")) with
| true -> begin
FStar_Pervasives_Native.Some (fv.FStar_Syntax_Syntax.fv_delta)
end
| uu____16500 -> begin
(match (qn) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Delta_constant_at_level ((Prims.parse_int "0")))
end
| FStar_Pervasives_Native.Some (FStar_Util.Inl (uu____16521), uu____16522) -> begin
FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Delta_constant_at_level ((Prims.parse_int "0")))
end
| FStar_Pervasives_Native.Some (FStar_Util.Inr (se, uu____16570), uu____16571) -> begin
(match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_inductive_typ (uu____16620) -> begin
FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Delta_constant_at_level ((Prims.parse_int "0")))
end
| FStar_Syntax_Syntax.Sig_bundle (uu____16637) -> begin
FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Delta_constant_at_level ((Prims.parse_int "0")))
end
| FStar_Syntax_Syntax.Sig_datacon (uu____16646) -> begin
FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Delta_constant_at_level ((Prims.parse_int "0")))
end
| FStar_Syntax_Syntax.Sig_declare_typ (uu____16661) -> begin
(

let uu____16668 = (FStar_Syntax_DsEnv.delta_depth_of_declaration lid se.FStar_Syntax_Syntax.sigquals)
in FStar_Pervasives_Native.Some (uu____16668))
end
| FStar_Syntax_Syntax.Sig_let ((uu____16669, lbs), uu____16671) -> begin
(FStar_Util.find_map lbs (fun lb -> (

let fv1 = (FStar_Util.right lb.FStar_Syntax_Syntax.lbname)
in (

let uu____16685 = (FStar_Syntax_Syntax.fv_eq_lid fv1 lid)
in (match (uu____16685) with
| true -> begin
FStar_Pervasives_Native.Some (fv1.FStar_Syntax_Syntax.fv_delta)
end
| uu____16688 -> begin
FStar_Pervasives_Native.None
end)))))
end
| FStar_Syntax_Syntax.Sig_splice (uu____16689) -> begin
FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Delta_constant_at_level ((Prims.parse_int "1")))
end
| FStar_Syntax_Syntax.Sig_main (uu____16696) -> begin
FStar_Pervasives_Native.None
end
| FStar_Syntax_Syntax.Sig_assume (uu____16697) -> begin
FStar_Pervasives_Native.None
end
| FStar_Syntax_Syntax.Sig_new_effect (uu____16704) -> begin
FStar_Pervasives_Native.None
end
| FStar_Syntax_Syntax.Sig_new_effect_for_free (uu____16705) -> begin
FStar_Pervasives_Native.None
end
| FStar_Syntax_Syntax.Sig_sub_effect (uu____16706) -> begin
FStar_Pervasives_Native.None
end
| FStar_Syntax_Syntax.Sig_effect_abbrev (uu____16707) -> begin
FStar_Pervasives_Native.None
end
| FStar_Syntax_Syntax.Sig_pragma (uu____16720) -> begin
FStar_Pervasives_Native.None
end)
end)
end)))


let delta_depth_of_fv : env  ->  FStar_Syntax_Syntax.fv  ->  FStar_Syntax_Syntax.delta_depth = (fun env fv -> (

let lid = fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v
in (match ((Prims.op_Equality lid.FStar_Ident.nsstr "Prims")) with
| true -> begin
fv.FStar_Syntax_Syntax.fv_delta
end
| uu____16732 -> begin
(

let uu____16733 = (FStar_All.pipe_right lid.FStar_Ident.str (FStar_Util.smap_try_find env.fv_delta_depths))
in (FStar_All.pipe_right uu____16733 (fun d_opt -> (

let uu____16745 = (FStar_All.pipe_right d_opt FStar_Util.is_some)
in (match (uu____16745) with
| true -> begin
(FStar_All.pipe_right d_opt FStar_Util.must)
end
| uu____16750 -> begin
(

let uu____16751 = (

let uu____16754 = (lookup_qname env fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
in (delta_depth_of_qninfo fv uu____16754))
in (match (uu____16751) with
| FStar_Pervasives_Native.None -> begin
(

let uu____16755 = (

let uu____16756 = (FStar_Syntax_Print.fv_to_string fv)
in (FStar_Util.format1 "Delta depth not found for %s" uu____16756))
in (failwith uu____16755))
end
| FStar_Pervasives_Native.Some (d) -> begin
((

let uu____16759 = ((Prims.op_disEquality d fv.FStar_Syntax_Syntax.fv_delta) && (FStar_Options.debug_any ()))
in (match (uu____16759) with
| true -> begin
(

let uu____16760 = (FStar_Syntax_Print.fv_to_string fv)
in (

let uu____16761 = (FStar_Syntax_Print.delta_depth_to_string fv.FStar_Syntax_Syntax.fv_delta)
in (

let uu____16762 = (FStar_Syntax_Print.delta_depth_to_string d)
in (FStar_Util.print3 "WARNING WARNING WARNING fv=%s, delta_depth=%s, env.delta_depth=%s\n" uu____16760 uu____16761 uu____16762))))
end
| uu____16763 -> begin
()
end));
(FStar_Util.smap_add env.fv_delta_depths lid.FStar_Ident.str d);
d;
)
end))
end)))))
end)))


let quals_of_qninfo : qninfo  ->  FStar_Syntax_Syntax.qualifier Prims.list FStar_Pervasives_Native.option = (fun qninfo -> (match (qninfo) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr (se, uu____16783), uu____16784) -> begin
FStar_Pervasives_Native.Some (se.FStar_Syntax_Syntax.sigquals)
end
| uu____16833 -> begin
FStar_Pervasives_Native.None
end))


let attrs_of_qninfo : qninfo  ->  FStar_Syntax_Syntax.attribute Prims.list FStar_Pervasives_Native.option = (fun qninfo -> (match (qninfo) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr (se, uu____16854), uu____16855) -> begin
FStar_Pervasives_Native.Some (se.FStar_Syntax_Syntax.sigattrs)
end
| uu____16904 -> begin
FStar_Pervasives_Native.None
end))


let lookup_attrs_of_lid : env  ->  FStar_Ident.lid  ->  FStar_Syntax_Syntax.attribute Prims.list FStar_Pervasives_Native.option = (fun env lid -> (

let uu____16925 = (lookup_qname env lid)
in (FStar_All.pipe_left attrs_of_qninfo uu____16925)))


let fv_has_attr : env  ->  FStar_Syntax_Syntax.fv  ->  FStar_Ident.lid  ->  Prims.bool = (fun env fv attr_lid -> (

let uu____16945 = (lookup_attrs_of_lid env fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
in (match (uu____16945) with
| FStar_Pervasives_Native.None -> begin
false
end
| FStar_Pervasives_Native.Some ([]) -> begin
false
end
| FStar_Pervasives_Native.Some (attrs) -> begin
(FStar_All.pipe_right attrs (FStar_Util.for_some (fun tm -> (

let uu____16965 = (

let uu____16966 = (FStar_Syntax_Util.un_uinst tm)
in uu____16966.FStar_Syntax_Syntax.n)
in (match (uu____16965) with
| FStar_Syntax_Syntax.Tm_fvar (fv1) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv1 attr_lid)
end
| uu____16970 -> begin
false
end)))))
end)))


let try_lookup_effect_lid : env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.term FStar_Pervasives_Native.option = (fun env ftv -> (

let uu____16985 = (lookup_qname env ftv)
in (match (uu____16985) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr (se, FStar_Pervasives_Native.None), uu____16989) -> begin
(

let uu____17034 = (effect_signature FStar_Pervasives_Native.None se)
in (match (uu____17034) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some ((uu____17055, t), r) -> begin
(

let uu____17070 = (

let uu____17071 = (FStar_Ident.range_of_lid ftv)
in (FStar_Syntax_Subst.set_use_range uu____17071 t))
in FStar_Pervasives_Native.Some (uu____17070))
end))
end
| uu____17072 -> begin
FStar_Pervasives_Native.None
end)))


let lookup_effect_lid : env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.term = (fun env ftv -> (

let uu____17083 = (try_lookup_effect_lid env ftv)
in (match (uu____17083) with
| FStar_Pervasives_Native.None -> begin
(

let uu____17086 = (name_not_found ftv)
in (

let uu____17091 = (FStar_Ident.range_of_lid ftv)
in (FStar_Errors.raise_error uu____17086 uu____17091)))
end
| FStar_Pervasives_Native.Some (k) -> begin
k
end)))


let lookup_effect_abbrev : env  ->  FStar_Syntax_Syntax.universes  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.binders * FStar_Syntax_Syntax.comp) FStar_Pervasives_Native.option = (fun env univ_insts lid0 -> (

let uu____17114 = (lookup_qname env lid0)
in (match (uu____17114) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_effect_abbrev (lid, univs1, binders, c, uu____17125); FStar_Syntax_Syntax.sigrng = uu____17126; FStar_Syntax_Syntax.sigquals = quals; FStar_Syntax_Syntax.sigmeta = uu____17128; FStar_Syntax_Syntax.sigattrs = uu____17129}, FStar_Pervasives_Native.None), uu____17130) -> begin
(

let lid1 = (

let uu____17184 = (

let uu____17185 = (FStar_Ident.range_of_lid lid)
in (

let uu____17186 = (

let uu____17187 = (FStar_Ident.range_of_lid lid0)
in (FStar_Range.use_range uu____17187))
in (FStar_Range.set_use_range uu____17185 uu____17186)))
in (FStar_Ident.set_lid_range lid uu____17184))
in (

let uu____17188 = (FStar_All.pipe_right quals (FStar_Util.for_some (fun uu___238_17192 -> (match (uu___238_17192) with
| FStar_Syntax_Syntax.Irreducible -> begin
true
end
| uu____17193 -> begin
false
end))))
in (match (uu____17188) with
| true -> begin
FStar_Pervasives_Native.None
end
| uu____17204 -> begin
(

let insts = (match ((Prims.op_Equality (FStar_List.length univ_insts) (FStar_List.length univs1))) with
| true -> begin
univ_insts
end
| uu____17206 -> begin
(

let uu____17207 = (

let uu____17208 = (

let uu____17209 = (get_range env)
in (FStar_Range.string_of_range uu____17209))
in (

let uu____17210 = (FStar_Syntax_Print.lid_to_string lid1)
in (

let uu____17211 = (FStar_All.pipe_right (FStar_List.length univ_insts) FStar_Util.string_of_int)
in (FStar_Util.format3 "(%s) Unexpected instantiation of effect %s with %s universes" uu____17208 uu____17210 uu____17211))))
in (failwith uu____17207))
end)
in (match (((binders), (univs1))) with
| ([], uu____17228) -> begin
(failwith "Unexpected effect abbreviation with no arguments")
end
| (uu____17253, (uu____17254)::(uu____17255)::uu____17256) -> begin
(

let uu____17277 = (

let uu____17278 = (FStar_Syntax_Print.lid_to_string lid1)
in (

let uu____17279 = (FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length univs1))
in (FStar_Util.format2 "Unexpected effect abbreviation %s; polymorphic in %s universes" uu____17278 uu____17279)))
in (failwith uu____17277))
end
| uu____17286 -> begin
(

let uu____17301 = (

let uu____17306 = (

let uu____17307 = (FStar_Syntax_Util.arrow binders c)
in ((univs1), (uu____17307)))
in (inst_tscheme_with uu____17306 insts))
in (match (uu____17301) with
| (uu____17320, t) -> begin
(

let t1 = (

let uu____17323 = (FStar_Ident.range_of_lid lid1)
in (FStar_Syntax_Subst.set_use_range uu____17323 t))
in (

let uu____17324 = (

let uu____17325 = (FStar_Syntax_Subst.compress t1)
in uu____17325.FStar_Syntax_Syntax.n)
in (match (uu____17324) with
| FStar_Syntax_Syntax.Tm_arrow (binders1, c1) -> begin
FStar_Pervasives_Native.Some (((binders1), (c1)))
end
| uu____17360 -> begin
(failwith "Impossible")
end)))
end))
end))
end)))
end
| uu____17367 -> begin
FStar_Pervasives_Native.None
end)))


let norm_eff_name : env  ->  FStar_Ident.lident  ->  FStar_Ident.lident = (fun env l -> (

let rec find1 = (fun l1 -> (

let uu____17390 = (lookup_effect_abbrev env ((FStar_Syntax_Syntax.U_unknown)::[]) l1)
in (match (uu____17390) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (uu____17403, c) -> begin
(

let l2 = (FStar_Syntax_Util.comp_effect_name c)
in (

let uu____17410 = (find1 l2)
in (match (uu____17410) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.Some (l2)
end
| FStar_Pervasives_Native.Some (l') -> begin
FStar_Pervasives_Native.Some (l')
end)))
end)))
in (

let res = (

let uu____17417 = (FStar_Util.smap_try_find env.normalized_eff_names l.FStar_Ident.str)
in (match (uu____17417) with
| FStar_Pervasives_Native.Some (l1) -> begin
l1
end
| FStar_Pervasives_Native.None -> begin
(

let uu____17421 = (find1 l)
in (match (uu____17421) with
| FStar_Pervasives_Native.None -> begin
l
end
| FStar_Pervasives_Native.Some (m) -> begin
((FStar_Util.smap_add env.normalized_eff_names l.FStar_Ident.str m);
m;
)
end))
end))
in (

let uu____17426 = (FStar_Ident.range_of_lid l)
in (FStar_Ident.set_lid_range res uu____17426)))))


let lookup_effect_quals : env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.qualifier Prims.list = (fun env l -> (

let l1 = (norm_eff_name env l)
in (

let uu____17440 = (lookup_qname env l1)
in (match (uu____17440) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_new_effect (uu____17443); FStar_Syntax_Syntax.sigrng = uu____17444; FStar_Syntax_Syntax.sigquals = q; FStar_Syntax_Syntax.sigmeta = uu____17446; FStar_Syntax_Syntax.sigattrs = uu____17447}, uu____17448), uu____17449) -> begin
q
end
| uu____17500 -> begin
[]
end))))


let lookup_projector : env  ->  FStar_Ident.lident  ->  Prims.int  ->  FStar_Ident.lident = (fun env lid i -> (

let fail1 = (fun uu____17521 -> (

let uu____17522 = (

let uu____17523 = (FStar_Util.string_of_int i)
in (

let uu____17524 = (FStar_Syntax_Print.lid_to_string lid)
in (FStar_Util.format2 "Impossible: projecting field #%s from constructor %s is undefined" uu____17523 uu____17524)))
in (failwith uu____17522)))
in (

let uu____17525 = (lookup_datacon env lid)
in (match (uu____17525) with
| (uu____17530, t) -> begin
(

let uu____17532 = (

let uu____17533 = (FStar_Syntax_Subst.compress t)
in uu____17533.FStar_Syntax_Syntax.n)
in (match (uu____17532) with
| FStar_Syntax_Syntax.Tm_arrow (binders, uu____17537) -> begin
(match (((i < (Prims.parse_int "0")) || (i >= (FStar_List.length binders)))) with
| true -> begin
(fail1 ())
end
| uu____17564 -> begin
(

let b = (FStar_List.nth binders i)
in (

let uu____17578 = (FStar_Syntax_Util.mk_field_projector_name lid (FStar_Pervasives_Native.fst b) i)
in (FStar_All.pipe_right uu____17578 FStar_Pervasives_Native.fst)))
end)
end
| uu____17589 -> begin
(fail1 ())
end))
end))))


let is_projector : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env l -> (

let uu____17600 = (lookup_qname env l)
in (match (uu____17600) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_declare_typ (uu____17601, uu____17602, uu____17603); FStar_Syntax_Syntax.sigrng = uu____17604; FStar_Syntax_Syntax.sigquals = quals; FStar_Syntax_Syntax.sigmeta = uu____17606; FStar_Syntax_Syntax.sigattrs = uu____17607}, uu____17608), uu____17609) -> begin
(FStar_Util.for_some (fun uu___239_17662 -> (match (uu___239_17662) with
| FStar_Syntax_Syntax.Projector (uu____17663) -> begin
true
end
| uu____17668 -> begin
false
end)) quals)
end
| uu____17669 -> begin
false
end)))


let is_datacon : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env lid -> (

let uu____17680 = (lookup_qname env lid)
in (match (uu____17680) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_datacon (uu____17681, uu____17682, uu____17683, uu____17684, uu____17685, uu____17686); FStar_Syntax_Syntax.sigrng = uu____17687; FStar_Syntax_Syntax.sigquals = uu____17688; FStar_Syntax_Syntax.sigmeta = uu____17689; FStar_Syntax_Syntax.sigattrs = uu____17690}, uu____17691), uu____17692) -> begin
true
end
| uu____17747 -> begin
false
end)))


let is_record : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env lid -> (

let uu____17758 = (lookup_qname env lid)
in (match (uu____17758) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_inductive_typ (uu____17759, uu____17760, uu____17761, uu____17762, uu____17763, uu____17764); FStar_Syntax_Syntax.sigrng = uu____17765; FStar_Syntax_Syntax.sigquals = quals; FStar_Syntax_Syntax.sigmeta = uu____17767; FStar_Syntax_Syntax.sigattrs = uu____17768}, uu____17769), uu____17770) -> begin
(FStar_Util.for_some (fun uu___240_17831 -> (match (uu___240_17831) with
| FStar_Syntax_Syntax.RecordType (uu____17832) -> begin
true
end
| FStar_Syntax_Syntax.RecordConstructor (uu____17841) -> begin
true
end
| uu____17850 -> begin
false
end)) quals)
end
| uu____17851 -> begin
false
end)))


let qninfo_is_action : qninfo  ->  Prims.bool = (fun qninfo -> (match (qninfo) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let (uu____17857, uu____17858); FStar_Syntax_Syntax.sigrng = uu____17859; FStar_Syntax_Syntax.sigquals = quals; FStar_Syntax_Syntax.sigmeta = uu____17861; FStar_Syntax_Syntax.sigattrs = uu____17862}, uu____17863), uu____17864) -> begin
(FStar_Util.for_some (fun uu___241_17921 -> (match (uu___241_17921) with
| FStar_Syntax_Syntax.Action (uu____17922) -> begin
true
end
| uu____17923 -> begin
false
end)) quals)
end
| uu____17924 -> begin
false
end))


let is_action : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env lid -> (

let uu____17935 = (lookup_qname env lid)
in (FStar_All.pipe_left qninfo_is_action uu____17935)))


let is_interpreted : env  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (

let interpreted_symbols = (FStar_Parser_Const.op_Eq)::(FStar_Parser_Const.op_notEq)::(FStar_Parser_Const.op_LT)::(FStar_Parser_Const.op_LTE)::(FStar_Parser_Const.op_GT)::(FStar_Parser_Const.op_GTE)::(FStar_Parser_Const.op_Subtraction)::(FStar_Parser_Const.op_Minus)::(FStar_Parser_Const.op_Addition)::(FStar_Parser_Const.op_Multiply)::(FStar_Parser_Const.op_Division)::(FStar_Parser_Const.op_Modulus)::(FStar_Parser_Const.op_And)::(FStar_Parser_Const.op_Or)::(FStar_Parser_Const.op_Negation)::[]
in (fun env head1 -> (

let uu____17949 = (

let uu____17950 = (FStar_Syntax_Util.un_uinst head1)
in uu____17950.FStar_Syntax_Syntax.n)
in (match (uu____17949) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(match (fv.FStar_Syntax_Syntax.fv_delta) with
| FStar_Syntax_Syntax.Delta_equational_at_level (uu____17954) -> begin
true
end
| uu____17955 -> begin
false
end)
end
| uu____17956 -> begin
false
end))))


let is_irreducible : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env l -> (

let uu____17967 = (lookup_qname env l)
in (match (uu____17967) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr (se, uu____17969), uu____17970) -> begin
(FStar_Util.for_some (fun uu___242_18018 -> (match (uu___242_18018) with
| FStar_Syntax_Syntax.Irreducible -> begin
true
end
| uu____18019 -> begin
false
end)) se.FStar_Syntax_Syntax.sigquals)
end
| uu____18020 -> begin
false
end)))


let is_type_constructor : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env lid -> (

let mapper = (fun x -> (match ((FStar_Pervasives_Native.fst x)) with
| FStar_Util.Inl (uu____18091) -> begin
FStar_Pervasives_Native.Some (false)
end
| FStar_Util.Inr (se, uu____18107) -> begin
(match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_declare_typ (uu____18124) -> begin
FStar_Pervasives_Native.Some ((FStar_List.contains FStar_Syntax_Syntax.New se.FStar_Syntax_Syntax.sigquals))
end
| FStar_Syntax_Syntax.Sig_inductive_typ (uu____18131) -> begin
FStar_Pervasives_Native.Some (true)
end
| uu____18148 -> begin
FStar_Pervasives_Native.Some (false)
end)
end))
in (

let uu____18149 = (

let uu____18152 = (lookup_qname env lid)
in (FStar_Util.bind_opt uu____18152 mapper))
in (match (uu____18149) with
| FStar_Pervasives_Native.Some (b) -> begin
b
end
| FStar_Pervasives_Native.None -> begin
false
end))))


let num_inductive_ty_params : env  ->  FStar_Ident.lident  ->  Prims.int FStar_Pervasives_Native.option = (fun env lid -> (

let uu____18204 = (lookup_qname env lid)
in (match (uu____18204) with
| FStar_Pervasives_Native.Some (FStar_Util.Inr ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_inductive_typ (uu____18207, uu____18208, tps, uu____18210, uu____18211, uu____18212); FStar_Syntax_Syntax.sigrng = uu____18213; FStar_Syntax_Syntax.sigquals = uu____18214; FStar_Syntax_Syntax.sigmeta = uu____18215; FStar_Syntax_Syntax.sigattrs = uu____18216}, uu____18217), uu____18218) -> begin
FStar_Pervasives_Native.Some ((FStar_List.length tps))
end
| uu____18283 -> begin
FStar_Pervasives_Native.None
end)))


let effect_decl_opt : env  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.eff_decl * FStar_Syntax_Syntax.qualifier Prims.list) FStar_Pervasives_Native.option = (fun env l -> (FStar_All.pipe_right env.effects.decls (FStar_Util.find_opt (fun uu____18327 -> (match (uu____18327) with
| (d, uu____18335) -> begin
(FStar_Ident.lid_equals d.FStar_Syntax_Syntax.mname l)
end)))))


let get_effect_decl : env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.eff_decl = (fun env l -> (

let uu____18350 = (effect_decl_opt env l)
in (match (uu____18350) with
| FStar_Pervasives_Native.None -> begin
(

let uu____18365 = (name_not_found l)
in (

let uu____18370 = (FStar_Ident.range_of_lid l)
in (FStar_Errors.raise_error uu____18365 uu____18370)))
end
| FStar_Pervasives_Native.Some (md) -> begin
(FStar_Pervasives_Native.fst md)
end)))


let identity_mlift : mlift = {mlift_wp = (fun uu____18392 t wp -> wp); mlift_term = FStar_Pervasives_Native.Some ((fun uu____18411 t wp e -> (FStar_Util.return_all e)))}


let join : env  ->  FStar_Ident.lident  ->  FStar_Ident.lident  ->  (FStar_Ident.lident * mlift * mlift) = (fun env l1 l2 -> (

let uu____18442 = (FStar_Ident.lid_equals l1 l2)
in (match (uu____18442) with
| true -> begin
((l1), (identity_mlift), (identity_mlift))
end
| uu____18449 -> begin
(

let uu____18450 = (((FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_GTot_lid) && (FStar_Ident.lid_equals l2 FStar_Parser_Const.effect_Tot_lid)) || ((FStar_Ident.lid_equals l2 FStar_Parser_Const.effect_GTot_lid) && (FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_Tot_lid)))
in (match (uu____18450) with
| true -> begin
((FStar_Parser_Const.effect_GTot_lid), (identity_mlift), (identity_mlift))
end
| uu____18457 -> begin
(

let uu____18458 = (FStar_All.pipe_right env.effects.joins (FStar_Util.find_opt (fun uu____18511 -> (match (uu____18511) with
| (m1, m2, uu____18524, uu____18525, uu____18526) -> begin
((FStar_Ident.lid_equals l1 m1) && (FStar_Ident.lid_equals l2 m2))
end))))
in (match (uu____18458) with
| FStar_Pervasives_Native.None -> begin
(

let uu____18543 = (

let uu____18548 = (

let uu____18549 = (FStar_Syntax_Print.lid_to_string l1)
in (

let uu____18550 = (FStar_Syntax_Print.lid_to_string l2)
in (FStar_Util.format2 "Effects %s and %s cannot be composed" uu____18549 uu____18550)))
in ((FStar_Errors.Fatal_EffectsCannotBeComposed), (uu____18548)))
in (FStar_Errors.raise_error uu____18543 env.range))
end
| FStar_Pervasives_Native.Some (uu____18557, uu____18558, m3, j1, j2) -> begin
((m3), (j1), (j2))
end))
end))
end)))


let monad_leq : env  ->  FStar_Ident.lident  ->  FStar_Ident.lident  ->  edge FStar_Pervasives_Native.option = (fun env l1 l2 -> (

let uu____18591 = ((FStar_Ident.lid_equals l1 l2) || ((FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_Tot_lid) && (FStar_Ident.lid_equals l2 FStar_Parser_Const.effect_GTot_lid)))
in (match (uu____18591) with
| true -> begin
FStar_Pervasives_Native.Some ({msource = l1; mtarget = l2; mlift = identity_mlift})
end
| uu____18594 -> begin
(FStar_All.pipe_right env.effects.order (FStar_Util.find_opt (fun e -> ((FStar_Ident.lid_equals l1 e.msource) && (FStar_Ident.lid_equals l2 e.mtarget)))))
end)))


let wp_sig_aux : 'Auu____18607 . (FStar_Syntax_Syntax.eff_decl * 'Auu____18607) Prims.list  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax) = (fun decls m -> (

let uu____18636 = (FStar_All.pipe_right decls (FStar_Util.find_opt (fun uu____18662 -> (match (uu____18662) with
| (d, uu____18668) -> begin
(FStar_Ident.lid_equals d.FStar_Syntax_Syntax.mname m)
end))))
in (match (uu____18636) with
| FStar_Pervasives_Native.None -> begin
(

let uu____18679 = (FStar_Util.format1 "Impossible: declaration for monad %s not found" m.FStar_Ident.str)
in (failwith uu____18679))
end
| FStar_Pervasives_Native.Some (md, _q) -> begin
(

let uu____18692 = (inst_tscheme ((md.FStar_Syntax_Syntax.univs), (md.FStar_Syntax_Syntax.signature)))
in (match (uu____18692) with
| (uu____18707, s) -> begin
(

let s1 = (FStar_Syntax_Subst.compress s)
in (match (((md.FStar_Syntax_Syntax.binders), (s1.FStar_Syntax_Syntax.n))) with
| ([], FStar_Syntax_Syntax.Tm_arrow (((a, uu____18725))::((wp, uu____18727))::[], c)) when (FStar_Syntax_Syntax.is_teff (FStar_Syntax_Util.comp_result c)) -> begin
((a), (wp.FStar_Syntax_Syntax.sort))
end
| uu____18783 -> begin
(failwith "Impossible")
end))
end))
end)))


let wp_signature : env  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.term) = (fun env m -> (wp_sig_aux env.effects.decls m))


let null_wp_for_eff : env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.comp = (fun env eff_name res_u res_t -> (

let uu____18838 = (FStar_Ident.lid_equals eff_name FStar_Parser_Const.effect_Tot_lid)
in (match (uu____18838) with
| true -> begin
(FStar_Syntax_Syntax.mk_Total' res_t (FStar_Pervasives_Native.Some (res_u)))
end
| uu____18839 -> begin
(

let uu____18840 = (FStar_Ident.lid_equals eff_name FStar_Parser_Const.effect_GTot_lid)
in (match (uu____18840) with
| true -> begin
(FStar_Syntax_Syntax.mk_GTotal' res_t (FStar_Pervasives_Native.Some (res_u)))
end
| uu____18841 -> begin
(

let eff_name1 = (norm_eff_name env eff_name)
in (

let ed = (get_effect_decl env eff_name1)
in (

let null_wp = (inst_effect_fun_with ((res_u)::[]) env ed ed.FStar_Syntax_Syntax.null_wp)
in (

let null_wp_res = (

let uu____18848 = (get_range env)
in (

let uu____18849 = (

let uu____18856 = (

let uu____18857 = (

let uu____18874 = (

let uu____18885 = (FStar_Syntax_Syntax.as_arg res_t)
in (uu____18885)::[])
in ((null_wp), (uu____18874)))
in FStar_Syntax_Syntax.Tm_app (uu____18857))
in (FStar_Syntax_Syntax.mk uu____18856))
in (uu____18849 FStar_Pervasives_Native.None uu____18848)))
in (

let uu____18925 = (

let uu____18926 = (

let uu____18937 = (FStar_Syntax_Syntax.as_arg null_wp_res)
in (uu____18937)::[])
in {FStar_Syntax_Syntax.comp_univs = (res_u)::[]; FStar_Syntax_Syntax.effect_name = eff_name1; FStar_Syntax_Syntax.result_typ = res_t; FStar_Syntax_Syntax.effect_args = uu____18926; FStar_Syntax_Syntax.flags = []})
in (FStar_Syntax_Syntax.mk_Comp uu____18925))))))
end))
end)))


let build_lattice : env  ->  FStar_Syntax_Syntax.sigelt  ->  env = (fun env se -> (match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_new_effect (ne) -> begin
(

let effects = (

let uu___257_18974 = env.effects
in {decls = (((ne), (se.FStar_Syntax_Syntax.sigquals)))::env.effects.decls; order = uu___257_18974.order; joins = uu___257_18974.joins})
in (

let uu___258_18983 = env
in {solver = uu___258_18983.solver; range = uu___258_18983.range; curmodule = uu___258_18983.curmodule; gamma = uu___258_18983.gamma; gamma_sig = uu___258_18983.gamma_sig; gamma_cache = uu___258_18983.gamma_cache; modules = uu___258_18983.modules; expected_typ = uu___258_18983.expected_typ; sigtab = uu___258_18983.sigtab; attrtab = uu___258_18983.attrtab; is_pattern = uu___258_18983.is_pattern; instantiate_imp = uu___258_18983.instantiate_imp; effects = effects; generalize = uu___258_18983.generalize; letrecs = uu___258_18983.letrecs; top_level = uu___258_18983.top_level; check_uvars = uu___258_18983.check_uvars; use_eq = uu___258_18983.use_eq; is_iface = uu___258_18983.is_iface; admit = uu___258_18983.admit; lax = uu___258_18983.lax; lax_universes = uu___258_18983.lax_universes; phase1 = uu___258_18983.phase1; failhard = uu___258_18983.failhard; nosynth = uu___258_18983.nosynth; uvar_subtyping = uu___258_18983.uvar_subtyping; tc_term = uu___258_18983.tc_term; type_of = uu___258_18983.type_of; universe_of = uu___258_18983.universe_of; check_type_of = uu___258_18983.check_type_of; use_bv_sorts = uu___258_18983.use_bv_sorts; qtbl_name_and_index = uu___258_18983.qtbl_name_and_index; normalized_eff_names = uu___258_18983.normalized_eff_names; fv_delta_depths = uu___258_18983.fv_delta_depths; proof_ns = uu___258_18983.proof_ns; synth_hook = uu___258_18983.synth_hook; splice = uu___258_18983.splice; postprocess = uu___258_18983.postprocess; is_native_tactic = uu___258_18983.is_native_tactic; identifier_info = uu___258_18983.identifier_info; tc_hooks = uu___258_18983.tc_hooks; dsenv = uu___258_18983.dsenv; nbe = uu___258_18983.nbe}))
end
| FStar_Syntax_Syntax.Sig_sub_effect (sub1) -> begin
(

let compose_edges = (fun e1 e2 -> (

let composed_lift = (

let mlift_wp = (fun u r wp1 -> (

let uu____19013 = (e1.mlift.mlift_wp u r wp1)
in (e2.mlift.mlift_wp u r uu____19013)))
in (

let mlift_term = (match (((e1.mlift.mlift_term), (e2.mlift.mlift_term))) with
| (FStar_Pervasives_Native.Some (l1), FStar_Pervasives_Native.Some (l2)) -> begin
FStar_Pervasives_Native.Some ((fun u t wp e -> (

let uu____19171 = (e1.mlift.mlift_wp u t wp)
in (

let uu____19172 = (l1 u t wp e)
in (l2 u t uu____19171 uu____19172)))))
end
| uu____19173 -> begin
FStar_Pervasives_Native.None
end)
in {mlift_wp = mlift_wp; mlift_term = mlift_term}))
in {msource = e1.msource; mtarget = e2.mtarget; mlift = composed_lift}))
in (

let mk_mlift_wp = (fun lift_t u r wp1 -> (

let uu____19245 = (inst_tscheme_with lift_t ((u)::[]))
in (match (uu____19245) with
| (uu____19252, lift_t1) -> begin
(

let uu____19254 = (

let uu____19261 = (

let uu____19262 = (

let uu____19279 = (

let uu____19290 = (FStar_Syntax_Syntax.as_arg r)
in (

let uu____19299 = (

let uu____19310 = (FStar_Syntax_Syntax.as_arg wp1)
in (uu____19310)::[])
in (uu____19290)::uu____19299))
in ((lift_t1), (uu____19279)))
in FStar_Syntax_Syntax.Tm_app (uu____19262))
in (FStar_Syntax_Syntax.mk uu____19261))
in (uu____19254 FStar_Pervasives_Native.None wp1.FStar_Syntax_Syntax.pos))
end)))
in (

let sub_mlift_wp = (match (sub1.FStar_Syntax_Syntax.lift_wp) with
| FStar_Pervasives_Native.Some (sub_lift_wp) -> begin
(mk_mlift_wp sub_lift_wp)
end
| FStar_Pervasives_Native.None -> begin
(failwith "sub effect should\'ve been elaborated at this stage")
end)
in (

let mk_mlift_term = (fun lift_t u r wp1 e -> (

let uu____19422 = (inst_tscheme_with lift_t ((u)::[]))
in (match (uu____19422) with
| (uu____19429, lift_t1) -> begin
(

let uu____19431 = (

let uu____19438 = (

let uu____19439 = (

let uu____19456 = (

let uu____19467 = (FStar_Syntax_Syntax.as_arg r)
in (

let uu____19476 = (

let uu____19487 = (FStar_Syntax_Syntax.as_arg wp1)
in (

let uu____19496 = (

let uu____19507 = (FStar_Syntax_Syntax.as_arg e)
in (uu____19507)::[])
in (uu____19487)::uu____19496))
in (uu____19467)::uu____19476))
in ((lift_t1), (uu____19456)))
in FStar_Syntax_Syntax.Tm_app (uu____19439))
in (FStar_Syntax_Syntax.mk uu____19438))
in (uu____19431 FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos))
end)))
in (

let sub_mlift_term = (FStar_Util.map_opt sub1.FStar_Syntax_Syntax.lift mk_mlift_term)
in (

let edge = {msource = sub1.FStar_Syntax_Syntax.source; mtarget = sub1.FStar_Syntax_Syntax.target; mlift = {mlift_wp = sub_mlift_wp; mlift_term = sub_mlift_term}}
in (

let id_edge = (fun l -> {msource = sub1.FStar_Syntax_Syntax.source; mtarget = sub1.FStar_Syntax_Syntax.target; mlift = identity_mlift})
in (

let print_mlift = (fun l -> (

let bogus_term = (fun s -> (

let uu____19609 = (

let uu____19610 = (FStar_Ident.lid_of_path ((s)::[]) FStar_Range.dummyRange)
in (FStar_Syntax_Syntax.lid_as_fv uu____19610 FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None))
in (FStar_Syntax_Syntax.fv_to_tm uu____19609)))
in (

let arg = (bogus_term "ARG")
in (

let wp = (bogus_term "WP")
in (

let e = (bogus_term "COMP")
in (

let uu____19614 = (

let uu____19615 = (l.mlift_wp FStar_Syntax_Syntax.U_zero arg wp)
in (FStar_Syntax_Print.term_to_string uu____19615))
in (

let uu____19616 = (

let uu____19617 = (FStar_Util.map_opt l.mlift_term (fun l1 -> (

let uu____19643 = (l1 FStar_Syntax_Syntax.U_zero arg wp e)
in (FStar_Syntax_Print.term_to_string uu____19643))))
in (FStar_Util.dflt "none" uu____19617))
in (FStar_Util.format2 "{ wp : %s ; term : %s }" uu____19614 uu____19616))))))))
in (

let order = (edge)::env.effects.order
in (

let ms = (FStar_All.pipe_right env.effects.decls (FStar_List.map (fun uu____19669 -> (match (uu____19669) with
| (e, uu____19677) -> begin
e.FStar_Syntax_Syntax.mname
end))))
in (

let find_edge = (fun order1 uu____19700 -> (match (uu____19700) with
| (i, j) -> begin
(

let uu____19711 = (FStar_Ident.lid_equals i j)
in (match (uu____19711) with
| true -> begin
(FStar_All.pipe_right (id_edge i) (fun _0_1 -> FStar_Pervasives_Native.Some (_0_1)))
end
| uu____19716 -> begin
(FStar_All.pipe_right order1 (FStar_Util.find_opt (fun e -> ((FStar_Ident.lid_equals e.msource i) && (FStar_Ident.lid_equals e.mtarget j)))))
end))
end))
in (

let order1 = (

let fold_fun = (fun order1 k -> (

let uu____19743 = (FStar_All.pipe_right ms (FStar_List.collect (fun i -> (

let uu____19753 = (FStar_Ident.lid_equals i k)
in (match (uu____19753) with
| true -> begin
[]
end
| uu____19756 -> begin
(FStar_All.pipe_right ms (FStar_List.collect (fun j -> (

let uu____19764 = (FStar_Ident.lid_equals j k)
in (match (uu____19764) with
| true -> begin
[]
end
| uu____19767 -> begin
(

let uu____19768 = (

let uu____19777 = (find_edge order1 ((i), (k)))
in (

let uu____19780 = (find_edge order1 ((k), (j)))
in ((uu____19777), (uu____19780))))
in (match (uu____19768) with
| (FStar_Pervasives_Native.Some (e1), FStar_Pervasives_Native.Some (e2)) -> begin
(

let uu____19795 = (compose_edges e1 e2)
in (uu____19795)::[])
end
| uu____19796 -> begin
[]
end))
end)))))
end)))))
in (FStar_List.append order1 uu____19743)))
in (FStar_All.pipe_right ms (FStar_List.fold_left fold_fun order)))
in (

let order2 = (FStar_Util.remove_dups (fun e1 e2 -> ((FStar_Ident.lid_equals e1.msource e2.msource) && (FStar_Ident.lid_equals e1.mtarget e2.mtarget))) order1)
in ((FStar_All.pipe_right order2 (FStar_List.iter (fun edge1 -> (

let uu____19826 = ((FStar_Ident.lid_equals edge1.msource FStar_Parser_Const.effect_DIV_lid) && (

let uu____19828 = (lookup_effect_quals env edge1.mtarget)
in (FStar_All.pipe_right uu____19828 (FStar_List.contains FStar_Syntax_Syntax.TotalEffect))))
in (match (uu____19826) with
| true -> begin
(

let uu____19833 = (

let uu____19838 = (FStar_Util.format1 "Divergent computations cannot be included in an effect %s marked \'total\'" edge1.mtarget.FStar_Ident.str)
in ((FStar_Errors.Fatal_DivergentComputationCannotBeIncludedInTotal), (uu____19838)))
in (

let uu____19839 = (get_range env)
in (FStar_Errors.raise_error uu____19833 uu____19839)))
end
| uu____19840 -> begin
()
end)))));
(

let joins = (FStar_All.pipe_right ms (FStar_List.collect (fun i -> (FStar_All.pipe_right ms (FStar_List.collect (fun j -> (

let join_opt = (

let uu____19916 = (FStar_Ident.lid_equals i j)
in (match (uu____19916) with
| true -> begin
FStar_Pervasives_Native.Some (((i), ((id_edge i)), ((id_edge i))))
end
| uu____19931 -> begin
(FStar_All.pipe_right ms (FStar_List.fold_left (fun bopt k -> (

let uu____19965 = (

let uu____19974 = (find_edge order2 ((i), (k)))
in (

let uu____19977 = (find_edge order2 ((j), (k)))
in ((uu____19974), (uu____19977))))
in (match (uu____19965) with
| (FStar_Pervasives_Native.Some (ik), FStar_Pervasives_Native.Some (jk)) -> begin
(match (bopt) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.Some (((k), (ik), (jk)))
end
| FStar_Pervasives_Native.Some (ub, uu____20019, uu____20020) -> begin
(

let uu____20027 = (

let uu____20032 = (

let uu____20033 = (find_edge order2 ((k), (ub)))
in (FStar_Util.is_some uu____20033))
in (

let uu____20036 = (

let uu____20037 = (find_edge order2 ((ub), (k)))
in (FStar_Util.is_some uu____20037))
in ((uu____20032), (uu____20036))))
in (match (uu____20027) with
| (true, true) -> begin
(

let uu____20048 = (FStar_Ident.lid_equals k ub)
in (match (uu____20048) with
| true -> begin
((FStar_Errors.log_issue FStar_Range.dummyRange ((FStar_Errors.Warning_UpperBoundCandidateAlreadyVisited), ("Looking multiple times at the same upper bound candidate")));
bopt;
)
end
| uu____20058 -> begin
(failwith "Found a cycle in the lattice")
end))
end
| (false, false) -> begin
bopt
end
| (true, false) -> begin
FStar_Pervasives_Native.Some (((k), (ik), (jk)))
end
| (false, true) -> begin
bopt
end))
end)
end
| uu____20073 -> begin
bopt
end))) FStar_Pervasives_Native.None))
end))
in (match (join_opt) with
| FStar_Pervasives_Native.None -> begin
[]
end
| FStar_Pervasives_Native.Some (k, e1, e2) -> begin
(((i), (j), (k), (e1.mlift), (e2.mlift)))::[]
end))))))))
in (

let effects = (

let uu___259_20146 = env.effects
in {decls = uu___259_20146.decls; order = order2; joins = joins})
in (

let uu___260_20147 = env
in {solver = uu___260_20147.solver; range = uu___260_20147.range; curmodule = uu___260_20147.curmodule; gamma = uu___260_20147.gamma; gamma_sig = uu___260_20147.gamma_sig; gamma_cache = uu___260_20147.gamma_cache; modules = uu___260_20147.modules; expected_typ = uu___260_20147.expected_typ; sigtab = uu___260_20147.sigtab; attrtab = uu___260_20147.attrtab; is_pattern = uu___260_20147.is_pattern; instantiate_imp = uu___260_20147.instantiate_imp; effects = effects; generalize = uu___260_20147.generalize; letrecs = uu___260_20147.letrecs; top_level = uu___260_20147.top_level; check_uvars = uu___260_20147.check_uvars; use_eq = uu___260_20147.use_eq; is_iface = uu___260_20147.is_iface; admit = uu___260_20147.admit; lax = uu___260_20147.lax; lax_universes = uu___260_20147.lax_universes; phase1 = uu___260_20147.phase1; failhard = uu___260_20147.failhard; nosynth = uu___260_20147.nosynth; uvar_subtyping = uu___260_20147.uvar_subtyping; tc_term = uu___260_20147.tc_term; type_of = uu___260_20147.type_of; universe_of = uu___260_20147.universe_of; check_type_of = uu___260_20147.check_type_of; use_bv_sorts = uu___260_20147.use_bv_sorts; qtbl_name_and_index = uu___260_20147.qtbl_name_and_index; normalized_eff_names = uu___260_20147.normalized_eff_names; fv_delta_depths = uu___260_20147.fv_delta_depths; proof_ns = uu___260_20147.proof_ns; synth_hook = uu___260_20147.synth_hook; splice = uu___260_20147.splice; postprocess = uu___260_20147.postprocess; is_native_tactic = uu___260_20147.is_native_tactic; identifier_info = uu___260_20147.identifier_info; tc_hooks = uu___260_20147.tc_hooks; dsenv = uu___260_20147.dsenv; nbe = uu___260_20147.nbe})));
))))))))))))))
end
| uu____20148 -> begin
env
end))


let comp_to_comp_typ : env  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp_typ = (fun env c -> (

let c1 = (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (t, FStar_Pervasives_Native.None) -> begin
(

let u = (env.universe_of env t)
in (FStar_Syntax_Syntax.mk_Total' t (FStar_Pervasives_Native.Some (u))))
end
| FStar_Syntax_Syntax.GTotal (t, FStar_Pervasives_Native.None) -> begin
(

let u = (env.universe_of env t)
in (FStar_Syntax_Syntax.mk_GTotal' t (FStar_Pervasives_Native.Some (u))))
end
| uu____20176 -> begin
c
end)
in (FStar_Syntax_Util.comp_to_comp_typ c1)))


let rec unfold_effect_abbrev : env  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp_typ = (fun env comp -> (

let c = (comp_to_comp_typ env comp)
in (

let uu____20188 = (lookup_effect_abbrev env c.FStar_Syntax_Syntax.comp_univs c.FStar_Syntax_Syntax.effect_name)
in (match (uu____20188) with
| FStar_Pervasives_Native.None -> begin
c
end
| FStar_Pervasives_Native.Some (binders, cdef) -> begin
(

let uu____20205 = (FStar_Syntax_Subst.open_comp binders cdef)
in (match (uu____20205) with
| (binders1, cdef1) -> begin
((match ((Prims.op_disEquality (FStar_List.length binders1) ((FStar_List.length c.FStar_Syntax_Syntax.effect_args) + (Prims.parse_int "1")))) with
| true -> begin
(

let uu____20227 = (

let uu____20232 = (

let uu____20233 = (FStar_Util.string_of_int (FStar_List.length binders1))
in (

let uu____20240 = (FStar_Util.string_of_int ((FStar_List.length c.FStar_Syntax_Syntax.effect_args) + (Prims.parse_int "1")))
in (

let uu____20249 = (

let uu____20250 = (FStar_Syntax_Syntax.mk_Comp c)
in (FStar_Syntax_Print.comp_to_string uu____20250))
in (FStar_Util.format3 "Effect constructor is not fully applied; expected %s args, got %s args, i.e., %s" uu____20233 uu____20240 uu____20249))))
in ((FStar_Errors.Fatal_ConstructorArgLengthMismatch), (uu____20232)))
in (FStar_Errors.raise_error uu____20227 comp.FStar_Syntax_Syntax.pos))
end
| uu____20251 -> begin
()
end);
(

let inst1 = (

let uu____20255 = (

let uu____20266 = (FStar_Syntax_Syntax.as_arg c.FStar_Syntax_Syntax.result_typ)
in (uu____20266)::c.FStar_Syntax_Syntax.effect_args)
in (FStar_List.map2 (fun uu____20303 uu____20304 -> (match (((uu____20303), (uu____20304))) with
| ((x, uu____20334), (t, uu____20336)) -> begin
FStar_Syntax_Syntax.NT (((x), (t)))
end)) binders1 uu____20255))
in (

let c1 = (FStar_Syntax_Subst.subst_comp inst1 cdef1)
in (

let c2 = (

let uu____20367 = (

let uu___261_20368 = (comp_to_comp_typ env c1)
in {FStar_Syntax_Syntax.comp_univs = uu___261_20368.FStar_Syntax_Syntax.comp_univs; FStar_Syntax_Syntax.effect_name = uu___261_20368.FStar_Syntax_Syntax.effect_name; FStar_Syntax_Syntax.result_typ = uu___261_20368.FStar_Syntax_Syntax.result_typ; FStar_Syntax_Syntax.effect_args = uu___261_20368.FStar_Syntax_Syntax.effect_args; FStar_Syntax_Syntax.flags = c.FStar_Syntax_Syntax.flags})
in (FStar_All.pipe_right uu____20367 FStar_Syntax_Syntax.mk_Comp))
in (unfold_effect_abbrev env c2))));
)
end))
end))))


let effect_repr_aux : 'Auu____20379 . 'Auu____20379  ->  env  ->  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option = (fun only_reifiable env c u_c -> (

let effect_name = (norm_eff_name env (FStar_Syntax_Util.comp_effect_name c))
in (

let uu____20409 = (effect_decl_opt env effect_name)
in (match (uu____20409) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (ed, qualifiers) -> begin
(match (ed.FStar_Syntax_Syntax.repr.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_unknown -> begin
FStar_Pervasives_Native.None
end
| uu____20448 -> begin
(

let c1 = (unfold_effect_abbrev env c)
in (

let res_typ = c1.FStar_Syntax_Syntax.result_typ
in (

let wp = (match (c1.FStar_Syntax_Syntax.effect_args) with
| (hd1)::uu____20471 -> begin
hd1
end
| [] -> begin
(

let name = (FStar_Ident.string_of_lid effect_name)
in (

let message = (

let uu____20508 = (FStar_Util.format1 "Not enough arguments for effect %s. " name)
in (Prims.strcat uu____20508 (Prims.strcat "This usually happens when you use a partially applied DM4F effect, " "like [TAC int] instead of [Tac int].")))
in (

let uu____20509 = (get_range env)
in (FStar_Errors.raise_error ((FStar_Errors.Fatal_NotEnoughArgumentsForEffect), (message)) uu____20509))))
end)
in (

let repr = (inst_effect_fun_with ((u_c)::[]) env ed (([]), (ed.FStar_Syntax_Syntax.repr)))
in (

let uu____20523 = (

let uu____20526 = (get_range env)
in (

let uu____20527 = (

let uu____20534 = (

let uu____20535 = (

let uu____20552 = (

let uu____20563 = (FStar_Syntax_Syntax.as_arg res_typ)
in (uu____20563)::(wp)::[])
in ((repr), (uu____20552)))
in FStar_Syntax_Syntax.Tm_app (uu____20535))
in (FStar_Syntax_Syntax.mk uu____20534))
in (uu____20527 FStar_Pervasives_Native.None uu____20526)))
in FStar_Pervasives_Native.Some (uu____20523))))))
end)
end))))


let effect_repr : env  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.term FStar_Pervasives_Native.option = (fun env c u_c -> (effect_repr_aux false env c u_c))


let is_user_reifiable_effect : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env effect_lid -> (

let effect_lid1 = (norm_eff_name env effect_lid)
in (

let quals = (lookup_effect_quals env effect_lid1)
in (FStar_List.contains FStar_Syntax_Syntax.Reifiable quals))))


let is_reifiable_effect : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env effect_lid -> (

let effect_lid1 = (norm_eff_name env effect_lid)
in ((is_user_reifiable_effect env effect_lid1) || (FStar_Ident.lid_equals effect_lid1 FStar_Parser_Const.effect_TAC_lid))))


let is_reifiable_rc : env  ->  FStar_Syntax_Syntax.residual_comp  ->  Prims.bool = (fun env c -> (is_reifiable_effect env c.FStar_Syntax_Syntax.residual_effect))


let is_reifiable_comp : env  ->  FStar_Syntax_Syntax.comp  ->  Prims.bool = (fun env c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (ct) -> begin
(is_reifiable_effect env ct.FStar_Syntax_Syntax.effect_name)
end
| uu____20678 -> begin
false
end))


let is_reifiable_function : env  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun env t -> (

let uu____20689 = (

let uu____20690 = (FStar_Syntax_Subst.compress t)
in uu____20690.FStar_Syntax_Syntax.n)
in (match (uu____20689) with
| FStar_Syntax_Syntax.Tm_arrow (uu____20693, c) -> begin
(is_reifiable_comp env c)
end
| uu____20715 -> begin
false
end)))


let reify_comp : env  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.term = (fun env c u_c -> (

let l = (FStar_Syntax_Util.comp_effect_name c)
in ((

let uu____20733 = (

let uu____20734 = (is_reifiable_effect env l)
in (not (uu____20734)))
in (match (uu____20733) with
| true -> begin
(

let uu____20735 = (

let uu____20740 = (

let uu____20741 = (FStar_Ident.string_of_lid l)
in (FStar_Util.format1 "Effect %s cannot be reified" uu____20741))
in ((FStar_Errors.Fatal_EffectCannotBeReified), (uu____20740)))
in (

let uu____20742 = (get_range env)
in (FStar_Errors.raise_error uu____20735 uu____20742)))
end
| uu____20743 -> begin
()
end));
(

let uu____20744 = (effect_repr_aux true env c u_c)
in (match (uu____20744) with
| FStar_Pervasives_Native.None -> begin
(failwith "internal error: reifiable effect has no repr?")
end
| FStar_Pervasives_Native.Some (tm) -> begin
tm
end));
)))


let push_sigelt : env  ->  FStar_Syntax_Syntax.sigelt  ->  env = (fun env s -> (

let sb = (((FStar_Syntax_Util.lids_of_sigelt s)), (s))
in (

let env1 = (

let uu___262_20776 = env
in {solver = uu___262_20776.solver; range = uu___262_20776.range; curmodule = uu___262_20776.curmodule; gamma = uu___262_20776.gamma; gamma_sig = (sb)::env.gamma_sig; gamma_cache = uu___262_20776.gamma_cache; modules = uu___262_20776.modules; expected_typ = uu___262_20776.expected_typ; sigtab = uu___262_20776.sigtab; attrtab = uu___262_20776.attrtab; is_pattern = uu___262_20776.is_pattern; instantiate_imp = uu___262_20776.instantiate_imp; effects = uu___262_20776.effects; generalize = uu___262_20776.generalize; letrecs = uu___262_20776.letrecs; top_level = uu___262_20776.top_level; check_uvars = uu___262_20776.check_uvars; use_eq = uu___262_20776.use_eq; is_iface = uu___262_20776.is_iface; admit = uu___262_20776.admit; lax = uu___262_20776.lax; lax_universes = uu___262_20776.lax_universes; phase1 = uu___262_20776.phase1; failhard = uu___262_20776.failhard; nosynth = uu___262_20776.nosynth; uvar_subtyping = uu___262_20776.uvar_subtyping; tc_term = uu___262_20776.tc_term; type_of = uu___262_20776.type_of; universe_of = uu___262_20776.universe_of; check_type_of = uu___262_20776.check_type_of; use_bv_sorts = uu___262_20776.use_bv_sorts; qtbl_name_and_index = uu___262_20776.qtbl_name_and_index; normalized_eff_names = uu___262_20776.normalized_eff_names; fv_delta_depths = uu___262_20776.fv_delta_depths; proof_ns = uu___262_20776.proof_ns; synth_hook = uu___262_20776.synth_hook; splice = uu___262_20776.splice; postprocess = uu___262_20776.postprocess; is_native_tactic = uu___262_20776.is_native_tactic; identifier_info = uu___262_20776.identifier_info; tc_hooks = uu___262_20776.tc_hooks; dsenv = uu___262_20776.dsenv; nbe = uu___262_20776.nbe})
in ((add_sigelt env1 s);
(env1.tc_hooks.tc_push_in_gamma_hook env1 (FStar_Util.Inr (sb)));
(build_lattice env1 s);
))))


let push_local_binding : env  ->  FStar_Syntax_Syntax.binding  ->  env = (fun env b -> (

let uu___263_20789 = env
in {solver = uu___263_20789.solver; range = uu___263_20789.range; curmodule = uu___263_20789.curmodule; gamma = (b)::env.gamma; gamma_sig = uu___263_20789.gamma_sig; gamma_cache = uu___263_20789.gamma_cache; modules = uu___263_20789.modules; expected_typ = uu___263_20789.expected_typ; sigtab = uu___263_20789.sigtab; attrtab = uu___263_20789.attrtab; is_pattern = uu___263_20789.is_pattern; instantiate_imp = uu___263_20789.instantiate_imp; effects = uu___263_20789.effects; generalize = uu___263_20789.generalize; letrecs = uu___263_20789.letrecs; top_level = uu___263_20789.top_level; check_uvars = uu___263_20789.check_uvars; use_eq = uu___263_20789.use_eq; is_iface = uu___263_20789.is_iface; admit = uu___263_20789.admit; lax = uu___263_20789.lax; lax_universes = uu___263_20789.lax_universes; phase1 = uu___263_20789.phase1; failhard = uu___263_20789.failhard; nosynth = uu___263_20789.nosynth; uvar_subtyping = uu___263_20789.uvar_subtyping; tc_term = uu___263_20789.tc_term; type_of = uu___263_20789.type_of; universe_of = uu___263_20789.universe_of; check_type_of = uu___263_20789.check_type_of; use_bv_sorts = uu___263_20789.use_bv_sorts; qtbl_name_and_index = uu___263_20789.qtbl_name_and_index; normalized_eff_names = uu___263_20789.normalized_eff_names; fv_delta_depths = uu___263_20789.fv_delta_depths; proof_ns = uu___263_20789.proof_ns; synth_hook = uu___263_20789.synth_hook; splice = uu___263_20789.splice; postprocess = uu___263_20789.postprocess; is_native_tactic = uu___263_20789.is_native_tactic; identifier_info = uu___263_20789.identifier_info; tc_hooks = uu___263_20789.tc_hooks; dsenv = uu___263_20789.dsenv; nbe = uu___263_20789.nbe}))


let push_bv : env  ->  FStar_Syntax_Syntax.bv  ->  env = (fun env x -> (push_local_binding env (FStar_Syntax_Syntax.Binding_var (x))))


let push_bvs : env  ->  FStar_Syntax_Syntax.bv Prims.list  ->  env = (fun env bvs -> (FStar_List.fold_left (fun env1 bv -> (push_bv env1 bv)) env bvs))


let pop_bv : env  ->  (FStar_Syntax_Syntax.bv * env) FStar_Pervasives_Native.option = (fun env -> (match (env.gamma) with
| (FStar_Syntax_Syntax.Binding_var (x))::rest -> begin
FStar_Pervasives_Native.Some (((x), ((

let uu___264_20844 = env
in {solver = uu___264_20844.solver; range = uu___264_20844.range; curmodule = uu___264_20844.curmodule; gamma = rest; gamma_sig = uu___264_20844.gamma_sig; gamma_cache = uu___264_20844.gamma_cache; modules = uu___264_20844.modules; expected_typ = uu___264_20844.expected_typ; sigtab = uu___264_20844.sigtab; attrtab = uu___264_20844.attrtab; is_pattern = uu___264_20844.is_pattern; instantiate_imp = uu___264_20844.instantiate_imp; effects = uu___264_20844.effects; generalize = uu___264_20844.generalize; letrecs = uu___264_20844.letrecs; top_level = uu___264_20844.top_level; check_uvars = uu___264_20844.check_uvars; use_eq = uu___264_20844.use_eq; is_iface = uu___264_20844.is_iface; admit = uu___264_20844.admit; lax = uu___264_20844.lax; lax_universes = uu___264_20844.lax_universes; phase1 = uu___264_20844.phase1; failhard = uu___264_20844.failhard; nosynth = uu___264_20844.nosynth; uvar_subtyping = uu___264_20844.uvar_subtyping; tc_term = uu___264_20844.tc_term; type_of = uu___264_20844.type_of; universe_of = uu___264_20844.universe_of; check_type_of = uu___264_20844.check_type_of; use_bv_sorts = uu___264_20844.use_bv_sorts; qtbl_name_and_index = uu___264_20844.qtbl_name_and_index; normalized_eff_names = uu___264_20844.normalized_eff_names; fv_delta_depths = uu___264_20844.fv_delta_depths; proof_ns = uu___264_20844.proof_ns; synth_hook = uu___264_20844.synth_hook; splice = uu___264_20844.splice; postprocess = uu___264_20844.postprocess; is_native_tactic = uu___264_20844.is_native_tactic; identifier_info = uu___264_20844.identifier_info; tc_hooks = uu___264_20844.tc_hooks; dsenv = uu___264_20844.dsenv; nbe = uu___264_20844.nbe}))))
end
| uu____20845 -> begin
FStar_Pervasives_Native.None
end))


let push_binders : env  ->  FStar_Syntax_Syntax.binders  ->  env = (fun env bs -> (FStar_List.fold_left (fun env1 uu____20873 -> (match (uu____20873) with
| (x, uu____20881) -> begin
(push_bv env1 x)
end)) env bs))


let binding_of_lb : FStar_Syntax_Syntax.lbname  ->  (FStar_Syntax_Syntax.univ_name Prims.list * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)  ->  FStar_Syntax_Syntax.binding = (fun x t -> (match (x) with
| FStar_Util.Inl (x1) -> begin
(

let x2 = (

let uu___265_20915 = x1
in {FStar_Syntax_Syntax.ppname = uu___265_20915.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___265_20915.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = (FStar_Pervasives_Native.snd t)})
in FStar_Syntax_Syntax.Binding_var (x2))
end
| FStar_Util.Inr (fv) -> begin
FStar_Syntax_Syntax.Binding_lid (((fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v), (t)))
end))


let push_let_binding : env  ->  FStar_Syntax_Syntax.lbname  ->  FStar_Syntax_Syntax.tscheme  ->  env = (fun env lb ts -> (push_local_binding env (binding_of_lb lb ts)))


let push_module : env  ->  FStar_Syntax_Syntax.modul  ->  env = (fun env m -> ((add_sigelts env m.FStar_Syntax_Syntax.exports);
(

let uu___266_20955 = env
in {solver = uu___266_20955.solver; range = uu___266_20955.range; curmodule = uu___266_20955.curmodule; gamma = []; gamma_sig = []; gamma_cache = uu___266_20955.gamma_cache; modules = (m)::env.modules; expected_typ = FStar_Pervasives_Native.None; sigtab = uu___266_20955.sigtab; attrtab = uu___266_20955.attrtab; is_pattern = uu___266_20955.is_pattern; instantiate_imp = uu___266_20955.instantiate_imp; effects = uu___266_20955.effects; generalize = uu___266_20955.generalize; letrecs = uu___266_20955.letrecs; top_level = uu___266_20955.top_level; check_uvars = uu___266_20955.check_uvars; use_eq = uu___266_20955.use_eq; is_iface = uu___266_20955.is_iface; admit = uu___266_20955.admit; lax = uu___266_20955.lax; lax_universes = uu___266_20955.lax_universes; phase1 = uu___266_20955.phase1; failhard = uu___266_20955.failhard; nosynth = uu___266_20955.nosynth; uvar_subtyping = uu___266_20955.uvar_subtyping; tc_term = uu___266_20955.tc_term; type_of = uu___266_20955.type_of; universe_of = uu___266_20955.universe_of; check_type_of = uu___266_20955.check_type_of; use_bv_sorts = uu___266_20955.use_bv_sorts; qtbl_name_and_index = uu___266_20955.qtbl_name_and_index; normalized_eff_names = uu___266_20955.normalized_eff_names; fv_delta_depths = uu___266_20955.fv_delta_depths; proof_ns = uu___266_20955.proof_ns; synth_hook = uu___266_20955.synth_hook; splice = uu___266_20955.splice; postprocess = uu___266_20955.postprocess; is_native_tactic = uu___266_20955.is_native_tactic; identifier_info = uu___266_20955.identifier_info; tc_hooks = uu___266_20955.tc_hooks; dsenv = uu___266_20955.dsenv; nbe = uu___266_20955.nbe});
))


let push_univ_vars : env  ->  FStar_Syntax_Syntax.univ_names  ->  env = (fun env xs -> (FStar_List.fold_left (fun env1 x -> (push_local_binding env1 (FStar_Syntax_Syntax.Binding_univ (x)))) env xs))


let open_universes_in : env  ->  FStar_Syntax_Syntax.univ_names  ->  FStar_Syntax_Syntax.term Prims.list  ->  (env * FStar_Syntax_Syntax.univ_names * FStar_Syntax_Syntax.term Prims.list) = (fun env uvs terms -> (

let uu____20997 = (FStar_Syntax_Subst.univ_var_opening uvs)
in (match (uu____20997) with
| (univ_subst, univ_vars) -> begin
(

let env' = (push_univ_vars env univ_vars)
in (

let uu____21025 = (FStar_List.map (FStar_Syntax_Subst.subst univ_subst) terms)
in ((env'), (univ_vars), (uu____21025))))
end)))


let set_expected_typ : env  ->  FStar_Syntax_Syntax.typ  ->  env = (fun env t -> (

let uu___267_21040 = env
in {solver = uu___267_21040.solver; range = uu___267_21040.range; curmodule = uu___267_21040.curmodule; gamma = uu___267_21040.gamma; gamma_sig = uu___267_21040.gamma_sig; gamma_cache = uu___267_21040.gamma_cache; modules = uu___267_21040.modules; expected_typ = FStar_Pervasives_Native.Some (t); sigtab = uu___267_21040.sigtab; attrtab = uu___267_21040.attrtab; is_pattern = uu___267_21040.is_pattern; instantiate_imp = uu___267_21040.instantiate_imp; effects = uu___267_21040.effects; generalize = uu___267_21040.generalize; letrecs = uu___267_21040.letrecs; top_level = uu___267_21040.top_level; check_uvars = uu___267_21040.check_uvars; use_eq = false; is_iface = uu___267_21040.is_iface; admit = uu___267_21040.admit; lax = uu___267_21040.lax; lax_universes = uu___267_21040.lax_universes; phase1 = uu___267_21040.phase1; failhard = uu___267_21040.failhard; nosynth = uu___267_21040.nosynth; uvar_subtyping = uu___267_21040.uvar_subtyping; tc_term = uu___267_21040.tc_term; type_of = uu___267_21040.type_of; universe_of = uu___267_21040.universe_of; check_type_of = uu___267_21040.check_type_of; use_bv_sorts = uu___267_21040.use_bv_sorts; qtbl_name_and_index = uu___267_21040.qtbl_name_and_index; normalized_eff_names = uu___267_21040.normalized_eff_names; fv_delta_depths = uu___267_21040.fv_delta_depths; proof_ns = uu___267_21040.proof_ns; synth_hook = uu___267_21040.synth_hook; splice = uu___267_21040.splice; postprocess = uu___267_21040.postprocess; is_native_tactic = uu___267_21040.is_native_tactic; identifier_info = uu___267_21040.identifier_info; tc_hooks = uu___267_21040.tc_hooks; dsenv = uu___267_21040.dsenv; nbe = uu___267_21040.nbe}))


let expected_typ : env  ->  FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option = (fun env -> (match (env.expected_typ) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (t) -> begin
FStar_Pervasives_Native.Some (t)
end))


let clear_expected_typ : env  ->  (env * FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option) = (fun env_ -> (

let uu____21068 = (expected_typ env_)
in (((

let uu___268_21074 = env_
in {solver = uu___268_21074.solver; range = uu___268_21074.range; curmodule = uu___268_21074.curmodule; gamma = uu___268_21074.gamma; gamma_sig = uu___268_21074.gamma_sig; gamma_cache = uu___268_21074.gamma_cache; modules = uu___268_21074.modules; expected_typ = FStar_Pervasives_Native.None; sigtab = uu___268_21074.sigtab; attrtab = uu___268_21074.attrtab; is_pattern = uu___268_21074.is_pattern; instantiate_imp = uu___268_21074.instantiate_imp; effects = uu___268_21074.effects; generalize = uu___268_21074.generalize; letrecs = uu___268_21074.letrecs; top_level = uu___268_21074.top_level; check_uvars = uu___268_21074.check_uvars; use_eq = false; is_iface = uu___268_21074.is_iface; admit = uu___268_21074.admit; lax = uu___268_21074.lax; lax_universes = uu___268_21074.lax_universes; phase1 = uu___268_21074.phase1; failhard = uu___268_21074.failhard; nosynth = uu___268_21074.nosynth; uvar_subtyping = uu___268_21074.uvar_subtyping; tc_term = uu___268_21074.tc_term; type_of = uu___268_21074.type_of; universe_of = uu___268_21074.universe_of; check_type_of = uu___268_21074.check_type_of; use_bv_sorts = uu___268_21074.use_bv_sorts; qtbl_name_and_index = uu___268_21074.qtbl_name_and_index; normalized_eff_names = uu___268_21074.normalized_eff_names; fv_delta_depths = uu___268_21074.fv_delta_depths; proof_ns = uu___268_21074.proof_ns; synth_hook = uu___268_21074.synth_hook; splice = uu___268_21074.splice; postprocess = uu___268_21074.postprocess; is_native_tactic = uu___268_21074.is_native_tactic; identifier_info = uu___268_21074.identifier_info; tc_hooks = uu___268_21074.tc_hooks; dsenv = uu___268_21074.dsenv; nbe = uu___268_21074.nbe})), (uu____21068))))


let finish_module : env  ->  FStar_Syntax_Syntax.modul  ->  env = (

let empty_lid = (

let uu____21084 = (

let uu____21087 = (FStar_Ident.id_of_text "")
in (uu____21087)::[])
in (FStar_Ident.lid_of_ids uu____21084))
in (fun env m -> (

let sigs = (

let uu____21093 = (FStar_Ident.lid_equals m.FStar_Syntax_Syntax.name FStar_Parser_Const.prims_lid)
in (match (uu____21093) with
| true -> begin
(

let uu____21096 = (FStar_All.pipe_right env.gamma_sig (FStar_List.map FStar_Pervasives_Native.snd))
in (FStar_All.pipe_right uu____21096 FStar_List.rev))
end
| uu____21121 -> begin
m.FStar_Syntax_Syntax.exports
end))
in ((add_sigelts env sigs);
(

let uu___269_21123 = env
in {solver = uu___269_21123.solver; range = uu___269_21123.range; curmodule = empty_lid; gamma = []; gamma_sig = []; gamma_cache = uu___269_21123.gamma_cache; modules = (m)::env.modules; expected_typ = uu___269_21123.expected_typ; sigtab = uu___269_21123.sigtab; attrtab = uu___269_21123.attrtab; is_pattern = uu___269_21123.is_pattern; instantiate_imp = uu___269_21123.instantiate_imp; effects = uu___269_21123.effects; generalize = uu___269_21123.generalize; letrecs = uu___269_21123.letrecs; top_level = uu___269_21123.top_level; check_uvars = uu___269_21123.check_uvars; use_eq = uu___269_21123.use_eq; is_iface = uu___269_21123.is_iface; admit = uu___269_21123.admit; lax = uu___269_21123.lax; lax_universes = uu___269_21123.lax_universes; phase1 = uu___269_21123.phase1; failhard = uu___269_21123.failhard; nosynth = uu___269_21123.nosynth; uvar_subtyping = uu___269_21123.uvar_subtyping; tc_term = uu___269_21123.tc_term; type_of = uu___269_21123.type_of; universe_of = uu___269_21123.universe_of; check_type_of = uu___269_21123.check_type_of; use_bv_sorts = uu___269_21123.use_bv_sorts; qtbl_name_and_index = uu___269_21123.qtbl_name_and_index; normalized_eff_names = uu___269_21123.normalized_eff_names; fv_delta_depths = uu___269_21123.fv_delta_depths; proof_ns = uu___269_21123.proof_ns; synth_hook = uu___269_21123.synth_hook; splice = uu___269_21123.splice; postprocess = uu___269_21123.postprocess; is_native_tactic = uu___269_21123.is_native_tactic; identifier_info = uu___269_21123.identifier_info; tc_hooks = uu___269_21123.tc_hooks; dsenv = uu___269_21123.dsenv; nbe = uu___269_21123.nbe});
))))


let uvars_in_env : env  ->  FStar_Syntax_Syntax.uvars = (fun env -> (

let no_uvs = (FStar_Syntax_Free.new_uv_set ())
in (

let ext = (fun out uvs -> (FStar_Util.set_union out uvs))
in (

let rec aux = (fun out g -> (match (g) with
| [] -> begin
out
end
| (FStar_Syntax_Syntax.Binding_univ (uu____21174))::tl1 -> begin
(aux out tl1)
end
| (FStar_Syntax_Syntax.Binding_lid (uu____21178, (uu____21179, t)))::tl1 -> begin
(

let uu____21200 = (

let uu____21203 = (FStar_Syntax_Free.uvars t)
in (ext out uu____21203))
in (aux uu____21200 tl1))
end
| (FStar_Syntax_Syntax.Binding_var ({FStar_Syntax_Syntax.ppname = uu____21206; FStar_Syntax_Syntax.index = uu____21207; FStar_Syntax_Syntax.sort = t}))::tl1 -> begin
(

let uu____21214 = (

let uu____21217 = (FStar_Syntax_Free.uvars t)
in (ext out uu____21217))
in (aux uu____21214 tl1))
end))
in (aux no_uvs env.gamma)))))


let univ_vars : env  ->  FStar_Syntax_Syntax.universe_uvar FStar_Util.set = (fun env -> (

let no_univs = (FStar_Syntax_Free.new_universe_uvar_set ())
in (

let ext = (fun out uvs -> (FStar_Util.set_union out uvs))
in (

let rec aux = (fun out g -> (match (g) with
| [] -> begin
out
end
| (FStar_Syntax_Syntax.Binding_univ (uu____21274))::tl1 -> begin
(aux out tl1)
end
| (FStar_Syntax_Syntax.Binding_lid (uu____21278, (uu____21279, t)))::tl1 -> begin
(

let uu____21300 = (

let uu____21303 = (FStar_Syntax_Free.univs t)
in (ext out uu____21303))
in (aux uu____21300 tl1))
end
| (FStar_Syntax_Syntax.Binding_var ({FStar_Syntax_Syntax.ppname = uu____21306; FStar_Syntax_Syntax.index = uu____21307; FStar_Syntax_Syntax.sort = t}))::tl1 -> begin
(

let uu____21314 = (

let uu____21317 = (FStar_Syntax_Free.univs t)
in (ext out uu____21317))
in (aux uu____21314 tl1))
end))
in (aux no_univs env.gamma)))))


let univnames : env  ->  FStar_Syntax_Syntax.univ_name FStar_Util.set = (fun env -> (

let no_univ_names = FStar_Syntax_Syntax.no_universe_names
in (

let ext = (fun out uvs -> (FStar_Util.set_union out uvs))
in (

let rec aux = (fun out g -> (match (g) with
| [] -> begin
out
end
| (FStar_Syntax_Syntax.Binding_univ (uname))::tl1 -> begin
(

let uu____21378 = (FStar_Util.set_add uname out)
in (aux uu____21378 tl1))
end
| (FStar_Syntax_Syntax.Binding_lid (uu____21381, (uu____21382, t)))::tl1 -> begin
(

let uu____21403 = (

let uu____21406 = (FStar_Syntax_Free.univnames t)
in (ext out uu____21406))
in (aux uu____21403 tl1))
end
| (FStar_Syntax_Syntax.Binding_var ({FStar_Syntax_Syntax.ppname = uu____21409; FStar_Syntax_Syntax.index = uu____21410; FStar_Syntax_Syntax.sort = t}))::tl1 -> begin
(

let uu____21417 = (

let uu____21420 = (FStar_Syntax_Free.univnames t)
in (ext out uu____21420))
in (aux uu____21417 tl1))
end))
in (aux no_univ_names env.gamma)))))


let bound_vars_of_bindings : FStar_Syntax_Syntax.binding Prims.list  ->  FStar_Syntax_Syntax.bv Prims.list = (fun bs -> (FStar_All.pipe_right bs (FStar_List.collect (fun uu___243_21440 -> (match (uu___243_21440) with
| FStar_Syntax_Syntax.Binding_var (x) -> begin
(x)::[]
end
| FStar_Syntax_Syntax.Binding_lid (uu____21444) -> begin
[]
end
| FStar_Syntax_Syntax.Binding_univ (uu____21457) -> begin
[]
end)))))


let binders_of_bindings : FStar_Syntax_Syntax.binding Prims.list  ->  FStar_Syntax_Syntax.binders = (fun bs -> (

let uu____21467 = (

let uu____21476 = (bound_vars_of_bindings bs)
in (FStar_All.pipe_right uu____21476 (FStar_List.map FStar_Syntax_Syntax.mk_binder)))
in (FStar_All.pipe_right uu____21467 FStar_List.rev)))


let bound_vars : env  ->  FStar_Syntax_Syntax.bv Prims.list = (fun env -> (bound_vars_of_bindings env.gamma))


let all_binders : env  ->  FStar_Syntax_Syntax.binders = (fun env -> (binders_of_bindings env.gamma))


let print_gamma : FStar_Syntax_Syntax.gamma  ->  Prims.string = (fun gamma -> (

let uu____21520 = (FStar_All.pipe_right gamma (FStar_List.map (fun uu___244_21530 -> (match (uu___244_21530) with
| FStar_Syntax_Syntax.Binding_var (x) -> begin
(

let uu____21532 = (FStar_Syntax_Print.bv_to_string x)
in (Prims.strcat "Binding_var " uu____21532))
end
| FStar_Syntax_Syntax.Binding_univ (u) -> begin
(Prims.strcat "Binding_univ " u.FStar_Ident.idText)
end
| FStar_Syntax_Syntax.Binding_lid (l, uu____21535) -> begin
(

let uu____21552 = (FStar_Ident.string_of_lid l)
in (Prims.strcat "Binding_lid " uu____21552))
end))))
in (FStar_All.pipe_right uu____21520 (FStar_String.concat "::\n"))))


let string_of_delta_level : delta_level  ->  Prims.string = (fun uu___245_21559 -> (match (uu___245_21559) with
| NoDelta -> begin
"NoDelta"
end
| InliningDelta -> begin
"Inlining"
end
| Eager_unfolding_only -> begin
"Eager_unfolding_only"
end
| Unfold (d) -> begin
(

let uu____21561 = (FStar_Syntax_Print.delta_depth_to_string d)
in (Prims.strcat "Unfold " uu____21561))
end))


let lidents : env  ->  FStar_Ident.lident Prims.list = (fun env -> (

let keys = (FStar_List.collect FStar_Pervasives_Native.fst env.gamma_sig)
in (FStar_Util.smap_fold (sigtab env) (fun uu____21581 v1 keys1 -> (FStar_List.append (FStar_Syntax_Util.lids_of_sigelt v1) keys1)) keys)))


let should_enc_path : env  ->  Prims.string Prims.list  ->  Prims.bool = (fun env path -> (

let rec list_prefix = (fun xs ys -> (match (((xs), (ys))) with
| ([], uu____21623) -> begin
true
end
| ((x)::xs1, (y)::ys1) -> begin
((Prims.op_Equality x y) && (list_prefix xs1 ys1))
end
| (uu____21642, uu____21643) -> begin
false
end))
in (

let uu____21652 = (FStar_List.tryFind (fun uu____21670 -> (match (uu____21670) with
| (p, uu____21678) -> begin
(list_prefix p path)
end)) env.proof_ns)
in (match (uu____21652) with
| FStar_Pervasives_Native.None -> begin
false
end
| FStar_Pervasives_Native.Some (uu____21689, b) -> begin
b
end))))


let should_enc_lid : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env lid -> (

let uu____21711 = (FStar_Ident.path_of_lid lid)
in (should_enc_path env uu____21711)))


let cons_proof_ns : Prims.bool  ->  env  ->  name_prefix  ->  env = (fun b e path -> (

let uu___270_21729 = e
in {solver = uu___270_21729.solver; range = uu___270_21729.range; curmodule = uu___270_21729.curmodule; gamma = uu___270_21729.gamma; gamma_sig = uu___270_21729.gamma_sig; gamma_cache = uu___270_21729.gamma_cache; modules = uu___270_21729.modules; expected_typ = uu___270_21729.expected_typ; sigtab = uu___270_21729.sigtab; attrtab = uu___270_21729.attrtab; is_pattern = uu___270_21729.is_pattern; instantiate_imp = uu___270_21729.instantiate_imp; effects = uu___270_21729.effects; generalize = uu___270_21729.generalize; letrecs = uu___270_21729.letrecs; top_level = uu___270_21729.top_level; check_uvars = uu___270_21729.check_uvars; use_eq = uu___270_21729.use_eq; is_iface = uu___270_21729.is_iface; admit = uu___270_21729.admit; lax = uu___270_21729.lax; lax_universes = uu___270_21729.lax_universes; phase1 = uu___270_21729.phase1; failhard = uu___270_21729.failhard; nosynth = uu___270_21729.nosynth; uvar_subtyping = uu___270_21729.uvar_subtyping; tc_term = uu___270_21729.tc_term; type_of = uu___270_21729.type_of; universe_of = uu___270_21729.universe_of; check_type_of = uu___270_21729.check_type_of; use_bv_sorts = uu___270_21729.use_bv_sorts; qtbl_name_and_index = uu___270_21729.qtbl_name_and_index; normalized_eff_names = uu___270_21729.normalized_eff_names; fv_delta_depths = uu___270_21729.fv_delta_depths; proof_ns = (((path), (b)))::e.proof_ns; synth_hook = uu___270_21729.synth_hook; splice = uu___270_21729.splice; postprocess = uu___270_21729.postprocess; is_native_tactic = uu___270_21729.is_native_tactic; identifier_info = uu___270_21729.identifier_info; tc_hooks = uu___270_21729.tc_hooks; dsenv = uu___270_21729.dsenv; nbe = uu___270_21729.nbe}))


let add_proof_ns : env  ->  name_prefix  ->  env = (fun e path -> (cons_proof_ns true e path))


let rem_proof_ns : env  ->  name_prefix  ->  env = (fun e path -> (cons_proof_ns false e path))


let get_proof_ns : env  ->  proof_namespace = (fun e -> e.proof_ns)


let set_proof_ns : proof_namespace  ->  env  ->  env = (fun ns e -> (

let uu___271_21769 = e
in {solver = uu___271_21769.solver; range = uu___271_21769.range; curmodule = uu___271_21769.curmodule; gamma = uu___271_21769.gamma; gamma_sig = uu___271_21769.gamma_sig; gamma_cache = uu___271_21769.gamma_cache; modules = uu___271_21769.modules; expected_typ = uu___271_21769.expected_typ; sigtab = uu___271_21769.sigtab; attrtab = uu___271_21769.attrtab; is_pattern = uu___271_21769.is_pattern; instantiate_imp = uu___271_21769.instantiate_imp; effects = uu___271_21769.effects; generalize = uu___271_21769.generalize; letrecs = uu___271_21769.letrecs; top_level = uu___271_21769.top_level; check_uvars = uu___271_21769.check_uvars; use_eq = uu___271_21769.use_eq; is_iface = uu___271_21769.is_iface; admit = uu___271_21769.admit; lax = uu___271_21769.lax; lax_universes = uu___271_21769.lax_universes; phase1 = uu___271_21769.phase1; failhard = uu___271_21769.failhard; nosynth = uu___271_21769.nosynth; uvar_subtyping = uu___271_21769.uvar_subtyping; tc_term = uu___271_21769.tc_term; type_of = uu___271_21769.type_of; universe_of = uu___271_21769.universe_of; check_type_of = uu___271_21769.check_type_of; use_bv_sorts = uu___271_21769.use_bv_sorts; qtbl_name_and_index = uu___271_21769.qtbl_name_and_index; normalized_eff_names = uu___271_21769.normalized_eff_names; fv_delta_depths = uu___271_21769.fv_delta_depths; proof_ns = ns; synth_hook = uu___271_21769.synth_hook; splice = uu___271_21769.splice; postprocess = uu___271_21769.postprocess; is_native_tactic = uu___271_21769.is_native_tactic; identifier_info = uu___271_21769.identifier_info; tc_hooks = uu___271_21769.tc_hooks; dsenv = uu___271_21769.dsenv; nbe = uu___271_21769.nbe}))


let unbound_vars : env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.bv FStar_Util.set = (fun e t -> (

let uu____21784 = (FStar_Syntax_Free.names t)
in (

let uu____21787 = (bound_vars e)
in (FStar_List.fold_left (fun s bv -> (FStar_Util.set_remove bv s)) uu____21784 uu____21787))))


let closed : env  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun e t -> (

let uu____21808 = (unbound_vars e t)
in (FStar_Util.set_is_empty uu____21808)))


let closed' : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____21816 = (FStar_Syntax_Free.names t)
in (FStar_Util.set_is_empty uu____21816)))


let string_of_proof_ns : env  ->  Prims.string = (fun env -> (

let aux = (fun uu____21833 -> (match (uu____21833) with
| (p, b) -> begin
(match (((Prims.op_Equality p []) && b)) with
| true -> begin
"*"
end
| uu____21842 -> begin
(

let uu____21843 = (FStar_Ident.text_of_path p)
in (Prims.strcat (match (b) with
| true -> begin
"+"
end
| uu____21844 -> begin
"-"
end) uu____21843))
end)
end))
in (

let uu____21845 = (

let uu____21848 = (FStar_List.map aux env.proof_ns)
in (FStar_All.pipe_right uu____21848 FStar_List.rev))
in (FStar_All.pipe_right uu____21845 (FStar_String.concat " ")))))


let guard_of_guard_formula : FStar_TypeChecker_Common.guard_formula  ->  guard_t = (fun g -> {guard_f = g; deferred = []; univ_ineqs = (([]), ([])); implicits = []})


let guard_form : guard_t  ->  FStar_TypeChecker_Common.guard_formula = (fun g -> g.guard_f)


let is_trivial : guard_t  ->  Prims.bool = (fun g -> (match (g) with
| {guard_f = FStar_TypeChecker_Common.Trivial; deferred = []; univ_ineqs = ([], []); implicits = i} -> begin
(FStar_All.pipe_right i (FStar_Util.for_all (fun imp -> ((Prims.op_Equality imp.imp_uvar.FStar_Syntax_Syntax.ctx_uvar_should_check FStar_Syntax_Syntax.Allow_unresolved) || (

let uu____21901 = (FStar_Syntax_Unionfind.find imp.imp_uvar.FStar_Syntax_Syntax.ctx_uvar_head)
in (match (uu____21901) with
| FStar_Pervasives_Native.Some (uu____21904) -> begin
true
end
| FStar_Pervasives_Native.None -> begin
false
end))))))
end
| uu____21905 -> begin
false
end))


let is_trivial_guard_formula : guard_t  ->  Prims.bool = (fun g -> (match (g) with
| {guard_f = FStar_TypeChecker_Common.Trivial; deferred = uu____21911; univ_ineqs = uu____21912; implicits = uu____21913} -> begin
true
end
| uu____21924 -> begin
false
end))


let trivial_guard : guard_t = {guard_f = FStar_TypeChecker_Common.Trivial; deferred = []; univ_ineqs = (([]), ([])); implicits = []}


let abstract_guard_n : FStar_Syntax_Syntax.binder Prims.list  ->  guard_t  ->  guard_t = (fun bs g -> (match (g.guard_f) with
| FStar_TypeChecker_Common.Trivial -> begin
g
end
| FStar_TypeChecker_Common.NonTrivial (f) -> begin
(

let f' = (FStar_Syntax_Util.abs bs f (FStar_Pervasives_Native.Some ((FStar_Syntax_Util.residual_tot FStar_Syntax_Util.ktype0))))
in (

let uu___272_21951 = g
in {guard_f = FStar_TypeChecker_Common.NonTrivial (f'); deferred = uu___272_21951.deferred; univ_ineqs = uu___272_21951.univ_ineqs; implicits = uu___272_21951.implicits}))
end))


let abstract_guard : FStar_Syntax_Syntax.binder  ->  guard_t  ->  guard_t = (fun b g -> (abstract_guard_n ((b)::[]) g))


let def_check_vars_in_set : FStar_Range.range  ->  Prims.string  ->  FStar_Syntax_Syntax.bv FStar_Util.set  ->  FStar_Syntax_Syntax.term  ->  unit = (fun rng msg vset t -> (

let uu____21986 = (FStar_Options.defensive ())
in (match (uu____21986) with
| true -> begin
(

let s = (FStar_Syntax_Free.names t)
in (

let uu____21990 = (

let uu____21991 = (

let uu____21992 = (FStar_Util.set_difference s vset)
in (FStar_All.pipe_left FStar_Util.set_is_empty uu____21992))
in (not (uu____21991)))
in (match (uu____21990) with
| true -> begin
(

let uu____21997 = (

let uu____22002 = (

let uu____22003 = (FStar_Syntax_Print.term_to_string t)
in (

let uu____22004 = (

let uu____22005 = (FStar_Util.set_elements s)
in (FStar_All.pipe_right uu____22005 (FStar_Syntax_Print.bvs_to_string ",\n\t")))
in (FStar_Util.format3 "Internal: term is not closed (%s).\nt = (%s)\nFVs = (%s)\n" msg uu____22003 uu____22004)))
in ((FStar_Errors.Warning_Defensive), (uu____22002)))
in (FStar_Errors.log_issue rng uu____21997))
end
| uu____22010 -> begin
()
end)))
end
| uu____22011 -> begin
()
end)))


let def_check_closed_in : FStar_Range.range  ->  Prims.string  ->  FStar_Syntax_Syntax.bv Prims.list  ->  FStar_Syntax_Syntax.term  ->  unit = (fun rng msg l t -> (

let uu____22036 = (

let uu____22037 = (FStar_Options.defensive ())
in (not (uu____22037)))
in (match (uu____22036) with
| true -> begin
()
end
| uu____22038 -> begin
(

let uu____22039 = (FStar_Util.as_set l FStar_Syntax_Syntax.order_bv)
in (def_check_vars_in_set rng msg uu____22039 t))
end)))


let def_check_closed_in_env : FStar_Range.range  ->  Prims.string  ->  env  ->  FStar_Syntax_Syntax.term  ->  unit = (fun rng msg e t -> (

let uu____22062 = (

let uu____22063 = (FStar_Options.defensive ())
in (not (uu____22063)))
in (match (uu____22062) with
| true -> begin
()
end
| uu____22064 -> begin
(

let uu____22065 = (bound_vars e)
in (def_check_closed_in rng msg uu____22065 t))
end)))


let def_check_guard_wf : FStar_Range.range  ->  Prims.string  ->  env  ->  guard_t  ->  unit = (fun rng msg env g -> (match (g.guard_f) with
| FStar_TypeChecker_Common.Trivial -> begin
()
end
| FStar_TypeChecker_Common.NonTrivial (f) -> begin
(def_check_closed_in_env rng msg env f)
end))


let apply_guard : guard_t  ->  FStar_Syntax_Syntax.term  ->  guard_t = (fun g e -> (match (g.guard_f) with
| FStar_TypeChecker_Common.Trivial -> begin
g
end
| FStar_TypeChecker_Common.NonTrivial (f) -> begin
(

let uu___273_22100 = g
in (

let uu____22101 = (

let uu____22102 = (

let uu____22103 = (

let uu____22110 = (

let uu____22111 = (

let uu____22128 = (

let uu____22139 = (FStar_Syntax_Syntax.as_arg e)
in (uu____22139)::[])
in ((f), (uu____22128)))
in FStar_Syntax_Syntax.Tm_app (uu____22111))
in (FStar_Syntax_Syntax.mk uu____22110))
in (uu____22103 FStar_Pervasives_Native.None f.FStar_Syntax_Syntax.pos))
in (FStar_All.pipe_left (fun _0_2 -> FStar_TypeChecker_Common.NonTrivial (_0_2)) uu____22102))
in {guard_f = uu____22101; deferred = uu___273_22100.deferred; univ_ineqs = uu___273_22100.univ_ineqs; implicits = uu___273_22100.implicits}))
end))


let map_guard : guard_t  ->  (FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term)  ->  guard_t = (fun g map1 -> (match (g.guard_f) with
| FStar_TypeChecker_Common.Trivial -> begin
g
end
| FStar_TypeChecker_Common.NonTrivial (f) -> begin
(

let uu___274_22195 = g
in (

let uu____22196 = (

let uu____22197 = (map1 f)
in FStar_TypeChecker_Common.NonTrivial (uu____22197))
in {guard_f = uu____22196; deferred = uu___274_22195.deferred; univ_ineqs = uu___274_22195.univ_ineqs; implicits = uu___274_22195.implicits}))
end))


let always_map_guard : guard_t  ->  (FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term)  ->  guard_t = (fun g map1 -> (match (g.guard_f) with
| FStar_TypeChecker_Common.Trivial -> begin
(

let uu___275_22213 = g
in (

let uu____22214 = (

let uu____22215 = (map1 FStar_Syntax_Util.t_true)
in FStar_TypeChecker_Common.NonTrivial (uu____22215))
in {guard_f = uu____22214; deferred = uu___275_22213.deferred; univ_ineqs = uu___275_22213.univ_ineqs; implicits = uu___275_22213.implicits}))
end
| FStar_TypeChecker_Common.NonTrivial (f) -> begin
(

let uu___276_22217 = g
in (

let uu____22218 = (

let uu____22219 = (map1 f)
in FStar_TypeChecker_Common.NonTrivial (uu____22219))
in {guard_f = uu____22218; deferred = uu___276_22217.deferred; univ_ineqs = uu___276_22217.univ_ineqs; implicits = uu___276_22217.implicits}))
end))


let trivial : FStar_TypeChecker_Common.guard_formula  ->  unit = (fun t -> (match (t) with
| FStar_TypeChecker_Common.Trivial -> begin
()
end
| FStar_TypeChecker_Common.NonTrivial (uu____22225) -> begin
(failwith "impossible")
end))


let conj_guard_f : FStar_TypeChecker_Common.guard_formula  ->  FStar_TypeChecker_Common.guard_formula  ->  FStar_TypeChecker_Common.guard_formula = (fun g1 g2 -> (match (((g1), (g2))) with
| (FStar_TypeChecker_Common.Trivial, g) -> begin
g
end
| (g, FStar_TypeChecker_Common.Trivial) -> begin
g
end
| (FStar_TypeChecker_Common.NonTrivial (f1), FStar_TypeChecker_Common.NonTrivial (f2)) -> begin
(

let uu____22240 = (FStar_Syntax_Util.mk_conj f1 f2)
in FStar_TypeChecker_Common.NonTrivial (uu____22240))
end))


let check_trivial : FStar_Syntax_Syntax.term  ->  FStar_TypeChecker_Common.guard_formula = (fun t -> (

let uu____22246 = (

let uu____22247 = (FStar_Syntax_Util.unmeta t)
in uu____22247.FStar_Syntax_Syntax.n)
in (match (uu____22246) with
| FStar_Syntax_Syntax.Tm_fvar (tc) when (FStar_Syntax_Syntax.fv_eq_lid tc FStar_Parser_Const.true_lid) -> begin
FStar_TypeChecker_Common.Trivial
end
| uu____22251 -> begin
FStar_TypeChecker_Common.NonTrivial (t)
end)))


let imp_guard_f : FStar_TypeChecker_Common.guard_formula  ->  FStar_TypeChecker_Common.guard_formula  ->  FStar_TypeChecker_Common.guard_formula = (fun g1 g2 -> (match (((g1), (g2))) with
| (FStar_TypeChecker_Common.Trivial, g) -> begin
g
end
| (g, FStar_TypeChecker_Common.Trivial) -> begin
FStar_TypeChecker_Common.Trivial
end
| (FStar_TypeChecker_Common.NonTrivial (f1), FStar_TypeChecker_Common.NonTrivial (f2)) -> begin
(

let imp = (FStar_Syntax_Util.mk_imp f1 f2)
in (check_trivial imp))
end))


let binop_guard : (FStar_TypeChecker_Common.guard_formula  ->  FStar_TypeChecker_Common.guard_formula  ->  FStar_TypeChecker_Common.guard_formula)  ->  guard_t  ->  guard_t  ->  guard_t = (fun f g1 g2 -> (

let uu____22292 = (f g1.guard_f g2.guard_f)
in {guard_f = uu____22292; deferred = (FStar_List.append g1.deferred g2.deferred); univ_ineqs = (((FStar_List.append (FStar_Pervasives_Native.fst g1.univ_ineqs) (FStar_Pervasives_Native.fst g2.univ_ineqs))), ((FStar_List.append (FStar_Pervasives_Native.snd g1.univ_ineqs) (FStar_Pervasives_Native.snd g2.univ_ineqs)))); implicits = (FStar_List.append g1.implicits g2.implicits)}))


let conj_guard : guard_t  ->  guard_t  ->  guard_t = (fun g1 g2 -> (binop_guard conj_guard_f g1 g2))


let imp_guard : guard_t  ->  guard_t  ->  guard_t = (fun g1 g2 -> (binop_guard imp_guard_f g1 g2))


let conj_guards : guard_t Prims.list  ->  guard_t = (fun gs -> (FStar_List.fold_left conj_guard trivial_guard gs))


let close_guard_univs : FStar_Syntax_Syntax.universes  ->  FStar_Syntax_Syntax.binders  ->  guard_t  ->  guard_t = (fun us bs g -> (match (g.guard_f) with
| FStar_TypeChecker_Common.Trivial -> begin
g
end
| FStar_TypeChecker_Common.NonTrivial (f) -> begin
(

let f1 = (FStar_List.fold_right2 (fun u b f1 -> (

let uu____22382 = (FStar_Syntax_Syntax.is_null_binder b)
in (match (uu____22382) with
| true -> begin
f1
end
| uu____22383 -> begin
(FStar_Syntax_Util.mk_forall u (FStar_Pervasives_Native.fst b) f1)
end))) us bs f)
in (

let uu___277_22386 = g
in {guard_f = FStar_TypeChecker_Common.NonTrivial (f1); deferred = uu___277_22386.deferred; univ_ineqs = uu___277_22386.univ_ineqs; implicits = uu___277_22386.implicits}))
end))


let close_forall : env  ->  FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun env bs f -> (FStar_List.fold_right (fun b f1 -> (

let uu____22419 = (FStar_Syntax_Syntax.is_null_binder b)
in (match (uu____22419) with
| true -> begin
f1
end
| uu____22420 -> begin
(

let u = (env.universe_of env (FStar_Pervasives_Native.fst b).FStar_Syntax_Syntax.sort)
in (FStar_Syntax_Util.mk_forall u (FStar_Pervasives_Native.fst b) f1))
end))) bs f))


let close_guard : env  ->  FStar_Syntax_Syntax.binders  ->  guard_t  ->  guard_t = (fun env binders g -> (match (g.guard_f) with
| FStar_TypeChecker_Common.Trivial -> begin
g
end
| FStar_TypeChecker_Common.NonTrivial (f) -> begin
(

let uu___278_22442 = g
in (

let uu____22443 = (

let uu____22444 = (close_forall env binders f)
in FStar_TypeChecker_Common.NonTrivial (uu____22444))
in {guard_f = uu____22443; deferred = uu___278_22442.deferred; univ_ineqs = uu___278_22442.univ_ineqs; implicits = uu___278_22442.implicits}))
end))


let new_implicit_var_aux : Prims.string  ->  FStar_Range.range  ->  env  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.should_check_uvar  ->  (FStar_Syntax_Syntax.term * (FStar_Syntax_Syntax.ctx_uvar * FStar_Range.range) Prims.list * guard_t) = (fun reason r env k should_check -> (

let uu____22482 = (FStar_Syntax_Util.destruct k FStar_Parser_Const.range_of_lid)
in (match (uu____22482) with
| FStar_Pervasives_Native.Some ((uu____22507)::((tm, uu____22509))::[]) -> begin
(

let t = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_range (tm.FStar_Syntax_Syntax.pos))) FStar_Pervasives_Native.None tm.FStar_Syntax_Syntax.pos)
in ((t), ([]), (trivial_guard)))
end
| uu____22573 -> begin
(

let binders = (all_binders env)
in (

let gamma = env.gamma
in (

let ctx_uvar = (

let uu____22591 = (FStar_Syntax_Unionfind.fresh ())
in {FStar_Syntax_Syntax.ctx_uvar_head = uu____22591; FStar_Syntax_Syntax.ctx_uvar_gamma = gamma; FStar_Syntax_Syntax.ctx_uvar_binders = binders; FStar_Syntax_Syntax.ctx_uvar_typ = k; FStar_Syntax_Syntax.ctx_uvar_reason = reason; FStar_Syntax_Syntax.ctx_uvar_should_check = should_check; FStar_Syntax_Syntax.ctx_uvar_range = r})
in ((FStar_TypeChecker_Common.check_uvar_ctx_invariant reason r true gamma binders);
(

let t = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_uvar (((ctx_uvar), ((([]), (FStar_Syntax_Syntax.NoUseRange)))))) FStar_Pervasives_Native.None r)
in (

let imp = {imp_reason = reason; imp_uvar = ctx_uvar; imp_tm = t; imp_range = r; imp_meta = FStar_Pervasives_Native.None}
in (

let g = (

let uu___279_22626 = trivial_guard
in {guard_f = uu___279_22626.guard_f; deferred = uu___279_22626.deferred; univ_ineqs = uu___279_22626.univ_ineqs; implicits = (imp)::[]})
in ((t), ((((ctx_uvar), (r)))::[]), (g)))));
))))
end)))


let dummy_solver : solver_t = {init = (fun uu____22643 -> ()); push = (fun uu____22645 -> ()); pop = (fun uu____22647 -> ()); snapshot = (fun uu____22649 -> (((((Prims.parse_int "0")), ((Prims.parse_int "0")), ((Prims.parse_int "0")))), (()))); rollback = (fun uu____22658 uu____22659 -> ()); encode_modul = (fun uu____22670 uu____22671 -> ()); encode_sig = (fun uu____22674 uu____22675 -> ()); preprocess = (fun e g -> (

let uu____22681 = (

let uu____22688 = (FStar_Options.peek ())
in ((e), (g), (uu____22688)))
in (uu____22681)::[])); solve = (fun uu____22704 uu____22705 uu____22706 -> ()); finish = (fun uu____22712 -> ()); refresh = (fun uu____22714 -> ())}




