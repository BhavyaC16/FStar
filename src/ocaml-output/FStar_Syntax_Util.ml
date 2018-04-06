
open Prims
open FStar_Pervasives

let tts_f : (FStar_Syntax_Syntax.term  ->  Prims.string) FStar_Pervasives_Native.option FStar_ST.ref = (FStar_Util.mk_ref FStar_Pervasives_Native.None)


let tts : FStar_Syntax_Syntax.term  ->  Prims.string = (fun t -> (

let uu____51 = (FStar_ST.op_Bang tts_f)
in (match (uu____51) with
| FStar_Pervasives_Native.None -> begin
"<<hook unset>>"
end
| FStar_Pervasives_Native.Some (f) -> begin
(f t)
end)))


let qual_id : FStar_Ident.lident  ->  FStar_Ident.ident  ->  FStar_Ident.lident = (fun lid id1 -> (

let uu____102 = (FStar_Ident.lid_of_ids (FStar_List.append lid.FStar_Ident.ns ((lid.FStar_Ident.ident)::(id1)::[])))
in (FStar_Ident.set_lid_range uu____102 id1.FStar_Ident.idRange)))


let mk_discriminator : FStar_Ident.lident  ->  FStar_Ident.lident = (fun lid -> (FStar_Ident.lid_of_ids (FStar_List.append lid.FStar_Ident.ns (((FStar_Ident.mk_ident (((Prims.strcat FStar_Ident.reserved_prefix (Prims.strcat "is_" lid.FStar_Ident.ident.FStar_Ident.idText))), (lid.FStar_Ident.ident.FStar_Ident.idRange))))::[]))))


let is_name : FStar_Ident.lident  ->  Prims.bool = (fun lid -> (

let c = (FStar_Util.char_at lid.FStar_Ident.ident.FStar_Ident.idText (Prims.parse_int "0"))
in (FStar_Util.is_upper c)))


let arg_of_non_null_binder : 'Auu____112 . (FStar_Syntax_Syntax.bv * 'Auu____112)  ->  (FStar_Syntax_Syntax.term * 'Auu____112) = (fun uu____124 -> (match (uu____124) with
| (b, imp) -> begin
(

let uu____131 = (FStar_Syntax_Syntax.bv_to_name b)
in ((uu____131), (imp)))
end))


let args_of_non_null_binders : FStar_Syntax_Syntax.binders  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.aqual) Prims.list = (fun binders -> (FStar_All.pipe_right binders (FStar_List.collect (fun b -> (

let uu____154 = (FStar_Syntax_Syntax.is_null_binder b)
in (match (uu____154) with
| true -> begin
[]
end
| uu____165 -> begin
(

let uu____166 = (arg_of_non_null_binder b)
in (uu____166)::[])
end))))))


let args_of_binders : FStar_Syntax_Syntax.binders  ->  (FStar_Syntax_Syntax.binders * FStar_Syntax_Syntax.args) = (fun binders -> (

let uu____190 = (FStar_All.pipe_right binders (FStar_List.map (fun b -> (

let uu____236 = (FStar_Syntax_Syntax.is_null_binder b)
in (match (uu____236) with
| true -> begin
(

let b1 = (

let uu____254 = (FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None (FStar_Pervasives_Native.fst b).FStar_Syntax_Syntax.sort)
in ((uu____254), ((FStar_Pervasives_Native.snd b))))
in (

let uu____255 = (arg_of_non_null_binder b1)
in ((b1), (uu____255))))
end
| uu____268 -> begin
(

let uu____269 = (arg_of_non_null_binder b)
in ((b), (uu____269)))
end)))))
in (FStar_All.pipe_right uu____190 FStar_List.unzip)))


let name_binders : FStar_Syntax_Syntax.binder Prims.list  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.aqual) Prims.list = (fun binders -> (FStar_All.pipe_right binders (FStar_List.mapi (fun i b -> (

let uu____351 = (FStar_Syntax_Syntax.is_null_binder b)
in (match (uu____351) with
| true -> begin
(

let uu____356 = b
in (match (uu____356) with
| (a, imp) -> begin
(

let b1 = (

let uu____364 = (

let uu____365 = (FStar_Util.string_of_int i)
in (Prims.strcat "_" uu____365))
in (FStar_Ident.id_of_text uu____364))
in (

let b2 = {FStar_Syntax_Syntax.ppname = b1; FStar_Syntax_Syntax.index = (Prims.parse_int "0"); FStar_Syntax_Syntax.sort = a.FStar_Syntax_Syntax.sort}
in ((b2), (imp))))
end))
end
| uu____367 -> begin
b
end))))))


let name_function_binders : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t -> (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (binders, comp) -> begin
(

let uu____397 = (

let uu____400 = (

let uu____401 = (

let uu____414 = (name_binders binders)
in ((uu____414), (comp)))
in FStar_Syntax_Syntax.Tm_arrow (uu____401))
in (FStar_Syntax_Syntax.mk uu____400))
in (uu____397 FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos))
end
| uu____432 -> begin
t
end))


let null_binders_of_tks : (FStar_Syntax_Syntax.typ * FStar_Syntax_Syntax.aqual) Prims.list  ->  FStar_Syntax_Syntax.binders = (fun tks -> (FStar_All.pipe_right tks (FStar_List.map (fun uu____472 -> (match (uu____472) with
| (t, imp) -> begin
(

let uu____483 = (

let uu____484 = (FStar_Syntax_Syntax.null_binder t)
in (FStar_All.pipe_left FStar_Pervasives_Native.fst uu____484))
in ((uu____483), (imp)))
end)))))


let binders_of_tks : (FStar_Syntax_Syntax.typ * FStar_Syntax_Syntax.aqual) Prims.list  ->  FStar_Syntax_Syntax.binders = (fun tks -> (FStar_All.pipe_right tks (FStar_List.map (fun uu____534 -> (match (uu____534) with
| (t, imp) -> begin
(

let uu____551 = (FStar_Syntax_Syntax.new_bv (FStar_Pervasives_Native.Some (t.FStar_Syntax_Syntax.pos)) t)
in ((uu____551), (imp)))
end)))))


let binders_of_freevars : FStar_Syntax_Syntax.bv FStar_Util.set  ->  FStar_Syntax_Syntax.binder Prims.list = (fun fvs -> (

let uu____561 = (FStar_Util.set_elements fvs)
in (FStar_All.pipe_right uu____561 (FStar_List.map FStar_Syntax_Syntax.mk_binder))))


let mk_subst : 'Auu____570 . 'Auu____570  ->  'Auu____570 Prims.list = (fun s -> (s)::[])


let subst_of_list : FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.args  ->  FStar_Syntax_Syntax.subst_t = (fun formals actuals -> (match ((Prims.op_Equality (FStar_List.length formals) (FStar_List.length actuals))) with
| true -> begin
(FStar_List.fold_right2 (fun f a out -> (FStar_Syntax_Syntax.NT ((((FStar_Pervasives_Native.fst f)), ((FStar_Pervasives_Native.fst a)))))::out) formals actuals [])
end
| uu____627 -> begin
(failwith "Ill-formed substitution")
end))


let rename_binders : FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.subst_t = (fun replace_xs with_ys -> (match ((Prims.op_Equality (FStar_List.length replace_xs) (FStar_List.length with_ys))) with
| true -> begin
(FStar_List.map2 (fun uu____657 uu____658 -> (match (((uu____657), (uu____658))) with
| ((x, uu____676), (y, uu____678)) -> begin
(

let uu____687 = (

let uu____694 = (FStar_Syntax_Syntax.bv_to_name y)
in ((x), (uu____694)))
in FStar_Syntax_Syntax.NT (uu____687))
end)) replace_xs with_ys)
end
| uu____695 -> begin
(failwith "Ill-formed substitution")
end))


let rec unmeta : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun e -> (

let e1 = (FStar_Syntax_Subst.compress e)
in (match (e1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_meta (e2, uu____701) -> begin
(unmeta e2)
end
| FStar_Syntax_Syntax.Tm_ascribed (e2, uu____707, uu____708) -> begin
(unmeta e2)
end
| uu____749 -> begin
e1
end)))


let rec unmeta_safe : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun e -> (

let e1 = (FStar_Syntax_Subst.compress e)
in (match (e1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_meta (e', m) -> begin
(match (m) with
| FStar_Syntax_Syntax.Meta_monadic (uu____760) -> begin
e1
end
| FStar_Syntax_Syntax.Meta_monadic_lift (uu____767) -> begin
e1
end
| uu____776 -> begin
(unmeta_safe e')
end)
end
| FStar_Syntax_Syntax.Tm_ascribed (e2, uu____778, uu____779) -> begin
(unmeta_safe e2)
end
| uu____820 -> begin
e1
end)))


let rec univ_kernel : FStar_Syntax_Syntax.universe  ->  (FStar_Syntax_Syntax.universe * Prims.int) = (fun u -> (match (u) with
| FStar_Syntax_Syntax.U_unknown -> begin
((u), ((Prims.parse_int "0")))
end
| FStar_Syntax_Syntax.U_name (uu____832) -> begin
((u), ((Prims.parse_int "0")))
end
| FStar_Syntax_Syntax.U_unif (uu____833) -> begin
((u), ((Prims.parse_int "0")))
end
| FStar_Syntax_Syntax.U_zero -> begin
((u), ((Prims.parse_int "0")))
end
| FStar_Syntax_Syntax.U_succ (u1) -> begin
(

let uu____843 = (univ_kernel u1)
in (match (uu____843) with
| (k, n1) -> begin
((k), ((n1 + (Prims.parse_int "1"))))
end))
end
| FStar_Syntax_Syntax.U_max (uu____854) -> begin
(failwith "Imposible: univ_kernel (U_max _)")
end
| FStar_Syntax_Syntax.U_bvar (uu____861) -> begin
(failwith "Imposible: univ_kernel (U_bvar _)")
end))


let constant_univ_as_nat : FStar_Syntax_Syntax.universe  ->  Prims.int = (fun u -> (

let uu____869 = (univ_kernel u)
in (FStar_Pervasives_Native.snd uu____869)))


let rec compare_univs : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.universe  ->  Prims.int = (fun u1 u2 -> (match (((u1), (u2))) with
| (FStar_Syntax_Syntax.U_bvar (uu____880), uu____881) -> begin
(failwith "Impossible: compare_univs")
end
| (uu____882, FStar_Syntax_Syntax.U_bvar (uu____883)) -> begin
(failwith "Impossible: compare_univs")
end
| (FStar_Syntax_Syntax.U_unknown, FStar_Syntax_Syntax.U_unknown) -> begin
(Prims.parse_int "0")
end
| (FStar_Syntax_Syntax.U_unknown, uu____884) -> begin
(~- ((Prims.parse_int "1")))
end
| (uu____885, FStar_Syntax_Syntax.U_unknown) -> begin
(Prims.parse_int "1")
end
| (FStar_Syntax_Syntax.U_zero, FStar_Syntax_Syntax.U_zero) -> begin
(Prims.parse_int "0")
end
| (FStar_Syntax_Syntax.U_zero, uu____886) -> begin
(~- ((Prims.parse_int "1")))
end
| (uu____887, FStar_Syntax_Syntax.U_zero) -> begin
(Prims.parse_int "1")
end
| (FStar_Syntax_Syntax.U_name (u11), FStar_Syntax_Syntax.U_name (u21)) -> begin
(FStar_String.compare u11.FStar_Ident.idText u21.FStar_Ident.idText)
end
| (FStar_Syntax_Syntax.U_name (uu____890), FStar_Syntax_Syntax.U_unif (uu____891)) -> begin
(~- ((Prims.parse_int "1")))
end
| (FStar_Syntax_Syntax.U_unif (uu____900), FStar_Syntax_Syntax.U_name (uu____901)) -> begin
(Prims.parse_int "1")
end
| (FStar_Syntax_Syntax.U_unif (u11), FStar_Syntax_Syntax.U_unif (u21)) -> begin
(

let uu____928 = (FStar_Syntax_Unionfind.univ_uvar_id u11)
in (

let uu____929 = (FStar_Syntax_Unionfind.univ_uvar_id u21)
in (uu____928 - uu____929)))
end
| (FStar_Syntax_Syntax.U_max (us1), FStar_Syntax_Syntax.U_max (us2)) -> begin
(

let n1 = (FStar_List.length us1)
in (

let n2 = (FStar_List.length us2)
in (match ((Prims.op_disEquality n1 n2)) with
| true -> begin
(n1 - n2)
end
| uu____956 -> begin
(

let copt = (

let uu____960 = (FStar_List.zip us1 us2)
in (FStar_Util.find_map uu____960 (fun uu____975 -> (match (uu____975) with
| (u11, u21) -> begin
(

let c = (compare_univs u11 u21)
in (match ((Prims.op_disEquality c (Prims.parse_int "0"))) with
| true -> begin
FStar_Pervasives_Native.Some (c)
end
| uu____987 -> begin
FStar_Pervasives_Native.None
end))
end))))
in (match (copt) with
| FStar_Pervasives_Native.None -> begin
(Prims.parse_int "0")
end
| FStar_Pervasives_Native.Some (c) -> begin
c
end))
end)))
end
| (FStar_Syntax_Syntax.U_max (uu____989), uu____990) -> begin
(~- ((Prims.parse_int "1")))
end
| (uu____993, FStar_Syntax_Syntax.U_max (uu____994)) -> begin
(Prims.parse_int "1")
end
| uu____997 -> begin
(

let uu____1002 = (univ_kernel u1)
in (match (uu____1002) with
| (k1, n1) -> begin
(

let uu____1009 = (univ_kernel u2)
in (match (uu____1009) with
| (k2, n2) -> begin
(

let r = (compare_univs k1 k2)
in (match ((Prims.op_Equality r (Prims.parse_int "0"))) with
| true -> begin
(n1 - n2)
end
| uu____1017 -> begin
r
end))
end))
end))
end))


let eq_univs : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.universe  ->  Prims.bool = (fun u1 u2 -> (

let uu____1024 = (compare_univs u1 u2)
in (Prims.op_Equality uu____1024 (Prims.parse_int "0"))))


let ml_comp : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Range.range  ->  FStar_Syntax_Syntax.comp = (fun t r -> (FStar_Syntax_Syntax.mk_Comp {FStar_Syntax_Syntax.comp_univs = (FStar_Syntax_Syntax.U_zero)::[]; FStar_Syntax_Syntax.effect_name = (FStar_Ident.set_lid_range FStar_Parser_Const.effect_ML_lid r); FStar_Syntax_Syntax.result_typ = t; FStar_Syntax_Syntax.effect_args = []; FStar_Syntax_Syntax.flags = (FStar_Syntax_Syntax.MLEFFECT)::[]}))


let comp_effect_name : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Ident.lident = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (c1) -> begin
c1.FStar_Syntax_Syntax.effect_name
end
| FStar_Syntax_Syntax.Total (uu____1049) -> begin
FStar_Parser_Const.effect_Tot_lid
end
| FStar_Syntax_Syntax.GTotal (uu____1058) -> begin
FStar_Parser_Const.effect_GTot_lid
end))


let comp_flags : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.cflags Prims.list = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (uu____1078) -> begin
(FStar_Syntax_Syntax.TOTAL)::[]
end
| FStar_Syntax_Syntax.GTotal (uu____1087) -> begin
(FStar_Syntax_Syntax.SOMETRIVIAL)::[]
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
ct.FStar_Syntax_Syntax.flags
end))


let comp_to_comp_typ_nouniv : FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp_typ = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (c1) -> begin
c1
end
| FStar_Syntax_Syntax.Total (t, u_opt) -> begin
(

let uu____1111 = (

let uu____1112 = (FStar_Util.map_opt u_opt (fun x -> (x)::[]))
in (FStar_Util.dflt [] uu____1112))
in {FStar_Syntax_Syntax.comp_univs = uu____1111; FStar_Syntax_Syntax.effect_name = (comp_effect_name c); FStar_Syntax_Syntax.result_typ = t; FStar_Syntax_Syntax.effect_args = []; FStar_Syntax_Syntax.flags = (comp_flags c)})
end
| FStar_Syntax_Syntax.GTotal (t, u_opt) -> begin
(

let uu____1139 = (

let uu____1140 = (FStar_Util.map_opt u_opt (fun x -> (x)::[]))
in (FStar_Util.dflt [] uu____1140))
in {FStar_Syntax_Syntax.comp_univs = uu____1139; FStar_Syntax_Syntax.effect_name = (comp_effect_name c); FStar_Syntax_Syntax.result_typ = t; FStar_Syntax_Syntax.effect_args = []; FStar_Syntax_Syntax.flags = (comp_flags c)})
end))


let comp_set_flags : FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.cflags Prims.list  ->  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax = (fun c f -> (

let uu___53_1169 = c
in (

let uu____1170 = (

let uu____1171 = (

let uu___54_1172 = (comp_to_comp_typ_nouniv c)
in {FStar_Syntax_Syntax.comp_univs = uu___54_1172.FStar_Syntax_Syntax.comp_univs; FStar_Syntax_Syntax.effect_name = uu___54_1172.FStar_Syntax_Syntax.effect_name; FStar_Syntax_Syntax.result_typ = uu___54_1172.FStar_Syntax_Syntax.result_typ; FStar_Syntax_Syntax.effect_args = uu___54_1172.FStar_Syntax_Syntax.effect_args; FStar_Syntax_Syntax.flags = f})
in FStar_Syntax_Syntax.Comp (uu____1171))
in {FStar_Syntax_Syntax.n = uu____1170; FStar_Syntax_Syntax.pos = uu___53_1169.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___53_1169.FStar_Syntax_Syntax.vars})))


let lcomp_set_flags : FStar_Syntax_Syntax.lcomp  ->  FStar_Syntax_Syntax.cflags Prims.list  ->  FStar_Syntax_Syntax.lcomp = (fun lc fs -> (

let comp_typ_set_flags = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (uu____1187) -> begin
c
end
| FStar_Syntax_Syntax.GTotal (uu____1196) -> begin
c
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
(

let ct1 = (

let uu___55_1207 = ct
in {FStar_Syntax_Syntax.comp_univs = uu___55_1207.FStar_Syntax_Syntax.comp_univs; FStar_Syntax_Syntax.effect_name = uu___55_1207.FStar_Syntax_Syntax.effect_name; FStar_Syntax_Syntax.result_typ = uu___55_1207.FStar_Syntax_Syntax.result_typ; FStar_Syntax_Syntax.effect_args = uu___55_1207.FStar_Syntax_Syntax.effect_args; FStar_Syntax_Syntax.flags = fs})
in (

let uu___56_1208 = c
in {FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Comp (ct1); FStar_Syntax_Syntax.pos = uu___56_1208.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___56_1208.FStar_Syntax_Syntax.vars}))
end))
in (FStar_Syntax_Syntax.mk_lcomp lc.FStar_Syntax_Syntax.eff_name lc.FStar_Syntax_Syntax.res_typ fs (fun uu____1211 -> (

let uu____1212 = (FStar_Syntax_Syntax.lcomp_comp lc)
in (comp_typ_set_flags uu____1212))))))


let comp_to_comp_typ : FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp_typ = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (c1) -> begin
c1
end
| FStar_Syntax_Syntax.Total (t, FStar_Pervasives_Native.Some (u)) -> begin
{FStar_Syntax_Syntax.comp_univs = (u)::[]; FStar_Syntax_Syntax.effect_name = (comp_effect_name c); FStar_Syntax_Syntax.result_typ = t; FStar_Syntax_Syntax.effect_args = []; FStar_Syntax_Syntax.flags = (comp_flags c)}
end
| FStar_Syntax_Syntax.GTotal (t, FStar_Pervasives_Native.Some (u)) -> begin
{FStar_Syntax_Syntax.comp_univs = (u)::[]; FStar_Syntax_Syntax.effect_name = (comp_effect_name c); FStar_Syntax_Syntax.result_typ = t; FStar_Syntax_Syntax.effect_args = []; FStar_Syntax_Syntax.flags = (comp_flags c)}
end
| uu____1245 -> begin
(failwith "Assertion failed: Computation type without universe")
end))


let is_named_tot : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (c1) -> begin
(FStar_Ident.lid_equals c1.FStar_Syntax_Syntax.effect_name FStar_Parser_Const.effect_Tot_lid)
end
| FStar_Syntax_Syntax.Total (uu____1254) -> begin
true
end
| FStar_Syntax_Syntax.GTotal (uu____1263) -> begin
false
end))


let is_total_comp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> ((FStar_Ident.lid_equals (comp_effect_name c) FStar_Parser_Const.effect_Tot_lid) || (FStar_All.pipe_right (comp_flags c) (FStar_Util.for_some (fun uu___41_1282 -> (match (uu___41_1282) with
| FStar_Syntax_Syntax.TOTAL -> begin
true
end
| FStar_Syntax_Syntax.RETURN -> begin
true
end
| uu____1283 -> begin
false
end))))))


let is_total_lcomp : FStar_Syntax_Syntax.lcomp  ->  Prims.bool = (fun c -> ((FStar_Ident.lid_equals c.FStar_Syntax_Syntax.eff_name FStar_Parser_Const.effect_Tot_lid) || (FStar_All.pipe_right c.FStar_Syntax_Syntax.cflags (FStar_Util.for_some (fun uu___42_1290 -> (match (uu___42_1290) with
| FStar_Syntax_Syntax.TOTAL -> begin
true
end
| FStar_Syntax_Syntax.RETURN -> begin
true
end
| uu____1291 -> begin
false
end))))))


let is_tot_or_gtot_lcomp : FStar_Syntax_Syntax.lcomp  ->  Prims.bool = (fun c -> (((FStar_Ident.lid_equals c.FStar_Syntax_Syntax.eff_name FStar_Parser_Const.effect_Tot_lid) || (FStar_Ident.lid_equals c.FStar_Syntax_Syntax.eff_name FStar_Parser_Const.effect_GTot_lid)) || (FStar_All.pipe_right c.FStar_Syntax_Syntax.cflags (FStar_Util.for_some (fun uu___43_1298 -> (match (uu___43_1298) with
| FStar_Syntax_Syntax.TOTAL -> begin
true
end
| FStar_Syntax_Syntax.RETURN -> begin
true
end
| uu____1299 -> begin
false
end))))))


let is_partial_return : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> (FStar_All.pipe_right (comp_flags c) (FStar_Util.for_some (fun uu___44_1310 -> (match (uu___44_1310) with
| FStar_Syntax_Syntax.RETURN -> begin
true
end
| FStar_Syntax_Syntax.PARTIAL_RETURN -> begin
true
end
| uu____1311 -> begin
false
end)))))


let is_lcomp_partial_return : FStar_Syntax_Syntax.lcomp  ->  Prims.bool = (fun c -> (FStar_All.pipe_right c.FStar_Syntax_Syntax.cflags (FStar_Util.for_some (fun uu___45_1318 -> (match (uu___45_1318) with
| FStar_Syntax_Syntax.RETURN -> begin
true
end
| FStar_Syntax_Syntax.PARTIAL_RETURN -> begin
true
end
| uu____1319 -> begin
false
end)))))


let is_tot_or_gtot_comp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> ((is_total_comp c) || (FStar_Ident.lid_equals FStar_Parser_Const.effect_GTot_lid (comp_effect_name c))))


let is_pure_effect : FStar_Ident.lident  ->  Prims.bool = (fun l -> (((FStar_Ident.lid_equals l FStar_Parser_Const.effect_Tot_lid) || (FStar_Ident.lid_equals l FStar_Parser_Const.effect_PURE_lid)) || (FStar_Ident.lid_equals l FStar_Parser_Const.effect_Pure_lid)))


let is_pure_comp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (uu____1337) -> begin
true
end
| FStar_Syntax_Syntax.GTotal (uu____1346) -> begin
false
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
(((is_total_comp c) || (is_pure_effect ct.FStar_Syntax_Syntax.effect_name)) || (FStar_All.pipe_right ct.FStar_Syntax_Syntax.flags (FStar_Util.for_some (fun uu___46_1359 -> (match (uu___46_1359) with
| FStar_Syntax_Syntax.LEMMA -> begin
true
end
| uu____1360 -> begin
false
end)))))
end))


let is_ghost_effect : FStar_Ident.lident  ->  Prims.bool = (fun l -> (((FStar_Ident.lid_equals FStar_Parser_Const.effect_GTot_lid l) || (FStar_Ident.lid_equals FStar_Parser_Const.effect_GHOST_lid l)) || (FStar_Ident.lid_equals FStar_Parser_Const.effect_Ghost_lid l)))


let is_div_effect : FStar_Ident.lident  ->  Prims.bool = (fun l -> (((FStar_Ident.lid_equals l FStar_Parser_Const.effect_DIV_lid) || (FStar_Ident.lid_equals l FStar_Parser_Const.effect_Div_lid)) || (FStar_Ident.lid_equals l FStar_Parser_Const.effect_Dv_lid)))


let is_pure_or_ghost_comp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> ((is_pure_comp c) || (is_ghost_effect (comp_effect_name c))))


let is_pure_lcomp : FStar_Syntax_Syntax.lcomp  ->  Prims.bool = (fun lc -> (((is_total_lcomp lc) || (is_pure_effect lc.FStar_Syntax_Syntax.eff_name)) || (FStar_All.pipe_right lc.FStar_Syntax_Syntax.cflags (FStar_Util.for_some (fun uu___47_1380 -> (match (uu___47_1380) with
| FStar_Syntax_Syntax.LEMMA -> begin
true
end
| uu____1381 -> begin
false
end))))))


let is_pure_or_ghost_lcomp : FStar_Syntax_Syntax.lcomp  ->  Prims.bool = (fun lc -> ((is_pure_lcomp lc) || (is_ghost_effect lc.FStar_Syntax_Syntax.eff_name)))


let is_pure_or_ghost_function : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____1388 = (

let uu____1389 = (FStar_Syntax_Subst.compress t)
in uu____1389.FStar_Syntax_Syntax.n)
in (match (uu____1388) with
| FStar_Syntax_Syntax.Tm_arrow (uu____1392, c) -> begin
(is_pure_or_ghost_comp c)
end
| uu____1410 -> begin
true
end)))


let is_lemma_comp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (ct) -> begin
(FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name FStar_Parser_Const.effect_Lemma_lid)
end
| uu____1419 -> begin
false
end))


let is_lemma : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____1423 = (

let uu____1424 = (FStar_Syntax_Subst.compress t)
in uu____1424.FStar_Syntax_Syntax.n)
in (match (uu____1423) with
| FStar_Syntax_Syntax.Tm_arrow (uu____1427, c) -> begin
(is_lemma_comp c)
end
| uu____1445 -> begin
false
end)))


let head_and_args : FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual) Prims.list) = (fun t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_app (head1, args) -> begin
((head1), (args))
end
| uu____1510 -> begin
((t1), ([]))
end)))


let rec head_and_args' : FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual) Prims.list) = (fun t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_app (head1, args) -> begin
(

let uu____1575 = (head_and_args' head1)
in (match (uu____1575) with
| (head2, args') -> begin
((head2), ((FStar_List.append args' args)))
end))
end
| uu____1632 -> begin
((t1), ([]))
end)))


let un_uinst : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_uinst (t2, uu____1652) -> begin
(FStar_Syntax_Subst.compress t2)
end
| uu____1657 -> begin
t1
end)))


let is_smt_lemma : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____1661 = (

let uu____1662 = (FStar_Syntax_Subst.compress t)
in uu____1662.FStar_Syntax_Syntax.n)
in (match (uu____1661) with
| FStar_Syntax_Syntax.Tm_arrow (uu____1665, c) -> begin
(match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (ct) when (FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name FStar_Parser_Const.effect_Lemma_lid) -> begin
(match (ct.FStar_Syntax_Syntax.effect_args) with
| (_req)::(_ens)::((pats, uu____1687))::uu____1688 -> begin
(

let pats' = (unmeta pats)
in (

let uu____1732 = (head_and_args pats')
in (match (uu____1732) with
| (head1, uu____1748) -> begin
(

let uu____1769 = (

let uu____1770 = (un_uinst head1)
in uu____1770.FStar_Syntax_Syntax.n)
in (match (uu____1769) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.cons_lid)
end
| uu____1774 -> begin
false
end))
end)))
end
| uu____1775 -> begin
false
end)
end
| uu____1784 -> begin
false
end)
end
| uu____1785 -> begin
false
end)))


let is_ml_comp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (c1) -> begin
((FStar_Ident.lid_equals c1.FStar_Syntax_Syntax.effect_name FStar_Parser_Const.effect_ML_lid) || (FStar_All.pipe_right c1.FStar_Syntax_Syntax.flags (FStar_Util.for_some (fun uu___48_1797 -> (match (uu___48_1797) with
| FStar_Syntax_Syntax.MLEFFECT -> begin
true
end
| uu____1798 -> begin
false
end)))))
end
| uu____1799 -> begin
false
end))


let comp_result : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (t, uu____1812) -> begin
t
end
| FStar_Syntax_Syntax.GTotal (t, uu____1822) -> begin
t
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
ct.FStar_Syntax_Syntax.result_typ
end))


let set_result_typ : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.comp = (fun c t -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (uu____1842) -> begin
(FStar_Syntax_Syntax.mk_Total t)
end
| FStar_Syntax_Syntax.GTotal (uu____1851) -> begin
(FStar_Syntax_Syntax.mk_GTotal t)
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
(FStar_Syntax_Syntax.mk_Comp (

let uu___57_1863 = ct
in {FStar_Syntax_Syntax.comp_univs = uu___57_1863.FStar_Syntax_Syntax.comp_univs; FStar_Syntax_Syntax.effect_name = uu___57_1863.FStar_Syntax_Syntax.effect_name; FStar_Syntax_Syntax.result_typ = t; FStar_Syntax_Syntax.effect_args = uu___57_1863.FStar_Syntax_Syntax.effect_args; FStar_Syntax_Syntax.flags = uu___57_1863.FStar_Syntax_Syntax.flags}))
end))


let is_trivial_wp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> (FStar_All.pipe_right (comp_flags c) (FStar_Util.for_some (fun uu___49_1874 -> (match (uu___49_1874) with
| FStar_Syntax_Syntax.TOTAL -> begin
true
end
| FStar_Syntax_Syntax.RETURN -> begin
true
end
| uu____1875 -> begin
false
end)))))


let primops : FStar_Ident.lident Prims.list = (FStar_Parser_Const.op_Eq)::(FStar_Parser_Const.op_notEq)::(FStar_Parser_Const.op_LT)::(FStar_Parser_Const.op_LTE)::(FStar_Parser_Const.op_GT)::(FStar_Parser_Const.op_GTE)::(FStar_Parser_Const.op_Subtraction)::(FStar_Parser_Const.op_Minus)::(FStar_Parser_Const.op_Addition)::(FStar_Parser_Const.op_Multiply)::(FStar_Parser_Const.op_Division)::(FStar_Parser_Const.op_Modulus)::(FStar_Parser_Const.op_And)::(FStar_Parser_Const.op_Or)::(FStar_Parser_Const.op_Negation)::[]


let is_primop_lid : FStar_Ident.lident  ->  Prims.bool = (fun l -> (FStar_All.pipe_right primops (FStar_Util.for_some (FStar_Ident.lid_equals l))))


let is_primop : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun f -> (match (f.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(is_primop_lid fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
end
| uu____1891 -> begin
false
end))


let rec unascribe : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun e -> (

let e1 = (FStar_Syntax_Subst.compress e)
in (match (e1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_ascribed (e2, uu____1897, uu____1898) -> begin
(unascribe e2)
end
| uu____1939 -> begin
e1
end)))


let rec ascribe : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  ((FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax, FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax) FStar_Util.either * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option)  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t k -> (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_ascribed (t', uu____1987, uu____1988) -> begin
(ascribe t' k)
end
| uu____2029 -> begin
(FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_ascribed (((t), (k), (FStar_Pervasives_Native.None)))) FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos)
end))


let unfold_lazy : FStar_Syntax_Syntax.lazyinfo  ->  FStar_Syntax_Syntax.term = (fun i -> (

let uu____2053 = (

let uu____2058 = (FStar_ST.op_Bang FStar_Syntax_Syntax.lazy_chooser)
in (FStar_Util.must uu____2058))
in (uu____2053 i.FStar_Syntax_Syntax.lkind i)))


let rec unlazy : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun t -> (

let uu____2109 = (

let uu____2110 = (FStar_Syntax_Subst.compress t)
in uu____2110.FStar_Syntax_Syntax.n)
in (match (uu____2109) with
| FStar_Syntax_Syntax.Tm_lazy (i) -> begin
(

let uu____2114 = (unfold_lazy i)
in (FStar_All.pipe_left unlazy uu____2114))
end
| uu____2115 -> begin
t
end)))


let mk_lazy : 'a . 'a  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.lazy_kind  ->  FStar_Range.range FStar_Pervasives_Native.option  ->  FStar_Syntax_Syntax.term = (fun t typ k r -> (

let rng = (match (r) with
| FStar_Pervasives_Native.Some (r1) -> begin
r1
end
| FStar_Pervasives_Native.None -> begin
FStar_Range.dummyRange
end)
in (

let i = (

let uu____2145 = (FStar_Dyn.mkdyn t)
in {FStar_Syntax_Syntax.blob = uu____2145; FStar_Syntax_Syntax.lkind = k; FStar_Syntax_Syntax.typ = typ; FStar_Syntax_Syntax.rng = rng})
in (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_lazy (i)) FStar_Pervasives_Native.None rng))))


let canon_app : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t -> (

let uu____2151 = (

let uu____2164 = (unascribe t)
in (head_and_args' uu____2164))
in (match (uu____2151) with
| (hd1, args) -> begin
(FStar_Syntax_Syntax.mk_Tm_app hd1 args FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos)
end)))

type eq_result =
| Equal
| NotEqual
| Unknown


let uu___is_Equal : eq_result  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Equal -> begin
true
end
| uu____2188 -> begin
false
end))


let uu___is_NotEqual : eq_result  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NotEqual -> begin
true
end
| uu____2192 -> begin
false
end))


let uu___is_Unknown : eq_result  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Unknown -> begin
true
end
| uu____2196 -> begin
false
end))


let injectives : Prims.string Prims.list = ("FStar.Int8.int_to_t")::("FStar.Int16.int_to_t")::("FStar.Int32.int_to_t")::("FStar.Int64.int_to_t")::("FStar.UInt8.uint_to_t")::("FStar.UInt16.uint_to_t")::("FStar.UInt32.uint_to_t")::("FStar.UInt64.uint_to_t")::("FStar.Int8.__int_to_t")::("FStar.Int16.__int_to_t")::("FStar.Int32.__int_to_t")::("FStar.Int64.__int_to_t")::("FStar.UInt8.__uint_to_t")::("FStar.UInt16.__uint_to_t")::("FStar.UInt32.__uint_to_t")::("FStar.UInt64.__uint_to_t")::[]


let rec eq_tm : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  eq_result = (fun t1 t2 -> (

let t11 = (canon_app t1)
in (

let t21 = (canon_app t2)
in (

let equal_if = (fun uu___50_2254 -> (match (uu___50_2254) with
| true -> begin
Equal
end
| uu____2255 -> begin
Unknown
end))
in (

let equal_iff = (fun uu___51_2259 -> (match (uu___51_2259) with
| true -> begin
Equal
end
| uu____2260 -> begin
NotEqual
end))
in (

let eq_and = (fun f g -> (match (f) with
| Equal -> begin
(g ())
end
| uu____2273 -> begin
Unknown
end))
in (

let eq_inj = (fun f g -> (match (((f), (g))) with
| (Equal, Equal) -> begin
Equal
end
| (NotEqual, uu____2281) -> begin
NotEqual
end
| (uu____2282, NotEqual) -> begin
NotEqual
end
| (Unknown, uu____2283) -> begin
Unknown
end
| (uu____2284, Unknown) -> begin
Unknown
end))
in (

let equal_data = (fun f1 args1 f2 args2 -> (

let uu____2322 = (FStar_Syntax_Syntax.fv_eq f1 f2)
in (match (uu____2322) with
| true -> begin
(

let uu____2332 = (FStar_List.zip args1 args2)
in (FStar_All.pipe_left (FStar_List.fold_left (fun acc uu____2390 -> (match (uu____2390) with
| ((a1, q1), (a2, q2)) -> begin
(

let uu____2424 = (eq_tm a1 a2)
in (eq_inj acc uu____2424))
end)) Equal) uu____2332))
end
| uu____2425 -> begin
NotEqual
end)))
in (

let uu____2426 = (

let uu____2431 = (

let uu____2432 = (unmeta t11)
in uu____2432.FStar_Syntax_Syntax.n)
in (

let uu____2435 = (

let uu____2436 = (unmeta t21)
in uu____2436.FStar_Syntax_Syntax.n)
in ((uu____2431), (uu____2435))))
in (match (uu____2426) with
| (FStar_Syntax_Syntax.Tm_bvar (bv1), FStar_Syntax_Syntax.Tm_bvar (bv2)) -> begin
(equal_if (Prims.op_Equality bv1.FStar_Syntax_Syntax.index bv2.FStar_Syntax_Syntax.index))
end
| (FStar_Syntax_Syntax.Tm_lazy (uu____2441), uu____2442) -> begin
(

let uu____2443 = (unlazy t11)
in (eq_tm uu____2443 t21))
end
| (uu____2444, FStar_Syntax_Syntax.Tm_lazy (uu____2445)) -> begin
(

let uu____2446 = (unlazy t21)
in (eq_tm t11 uu____2446))
end
| (FStar_Syntax_Syntax.Tm_name (a), FStar_Syntax_Syntax.Tm_name (b)) -> begin
(equal_if (FStar_Syntax_Syntax.bv_eq a b))
end
| (FStar_Syntax_Syntax.Tm_fvar (f), FStar_Syntax_Syntax.Tm_fvar (g)) -> begin
(match (((Prims.op_Equality f.FStar_Syntax_Syntax.fv_qual (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor))) && (Prims.op_Equality g.FStar_Syntax_Syntax.fv_qual (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor))))) with
| true -> begin
(equal_data f [] g [])
end
| uu____2463 -> begin
(

let uu____2464 = (FStar_Syntax_Syntax.fv_eq f g)
in (equal_if uu____2464))
end)
end
| (FStar_Syntax_Syntax.Tm_uinst (f, us), FStar_Syntax_Syntax.Tm_uinst (g, vs)) -> begin
(

let uu____2477 = (eq_tm f g)
in (eq_and uu____2477 (fun uu____2480 -> (

let uu____2481 = (eq_univs_list us vs)
in (equal_if uu____2481)))))
end
| (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_range (uu____2482)), uu____2483) -> begin
Unknown
end
| (uu____2484, FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_range (uu____2485))) -> begin
Unknown
end
| (FStar_Syntax_Syntax.Tm_constant (c), FStar_Syntax_Syntax.Tm_constant (d)) -> begin
(

let uu____2488 = (FStar_Const.eq_const c d)
in (equal_iff uu____2488))
end
| (FStar_Syntax_Syntax.Tm_uvar (u1, uu____2490), FStar_Syntax_Syntax.Tm_uvar (u2, uu____2492)) -> begin
(

let uu____2541 = (FStar_Syntax_Unionfind.equiv u1 u2)
in (equal_if uu____2541))
end
| (FStar_Syntax_Syntax.Tm_app (h1, args1), FStar_Syntax_Syntax.Tm_app (h2, args2)) -> begin
(

let uu____2586 = (

let uu____2591 = (

let uu____2592 = (un_uinst h1)
in uu____2592.FStar_Syntax_Syntax.n)
in (

let uu____2595 = (

let uu____2596 = (un_uinst h2)
in uu____2596.FStar_Syntax_Syntax.n)
in ((uu____2591), (uu____2595))))
in (match (uu____2586) with
| (FStar_Syntax_Syntax.Tm_fvar (f1), FStar_Syntax_Syntax.Tm_fvar (f2)) when ((Prims.op_Equality f1.FStar_Syntax_Syntax.fv_qual (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor))) && (Prims.op_Equality f2.FStar_Syntax_Syntax.fv_qual (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)))) -> begin
(equal_data f1 args1 f2 args2)
end
| (FStar_Syntax_Syntax.Tm_fvar (f1), FStar_Syntax_Syntax.Tm_fvar (f2)) when ((FStar_Syntax_Syntax.fv_eq f1 f2) && (

let uu____2608 = (

let uu____2609 = (FStar_Syntax_Syntax.lid_of_fv f1)
in (FStar_Ident.string_of_lid uu____2609))
in (FStar_List.mem uu____2608 injectives))) -> begin
(equal_data f1 args1 f2 args2)
end
| uu____2610 -> begin
(

let uu____2615 = (eq_tm h1 h2)
in (eq_and uu____2615 (fun uu____2617 -> (eq_args args1 args2))))
end))
end
| (FStar_Syntax_Syntax.Tm_match (t12, bs1), FStar_Syntax_Syntax.Tm_match (t22, bs2)) -> begin
(match ((Prims.op_Equality (FStar_List.length bs1) (FStar_List.length bs2))) with
| true -> begin
(

let uu____2722 = (FStar_List.zip bs1 bs2)
in (

let uu____2785 = (eq_tm t12 t22)
in (FStar_List.fold_right (fun uu____2822 a -> (match (uu____2822) with
| (b1, b2) -> begin
(eq_and a (fun uu____2915 -> (branch_matches b1 b2)))
end)) uu____2722 uu____2785)))
end
| uu____2916 -> begin
Unknown
end)
end
| (FStar_Syntax_Syntax.Tm_type (u), FStar_Syntax_Syntax.Tm_type (v1)) -> begin
(

let uu____2919 = (eq_univs u v1)
in (equal_if uu____2919))
end
| (FStar_Syntax_Syntax.Tm_quoted (t12, q1), FStar_Syntax_Syntax.Tm_quoted (t22, q2)) -> begin
(match ((Prims.op_Equality q1 q2)) with
| true -> begin
(eq_tm t12 t22)
end
| uu____2932 -> begin
Unknown
end)
end
| uu____2933 -> begin
Unknown
end))))))))))
and branch_matches : (FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)  ->  (FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)  ->  eq_result = (fun b1 b2 -> (

let related_by = (fun f o1 o2 -> (match (((o1), (o2))) with
| (FStar_Pervasives_Native.None, FStar_Pervasives_Native.None) -> begin
true
end
| (FStar_Pervasives_Native.Some (x), FStar_Pervasives_Native.Some (y)) -> begin
(f x y)
end
| (uu____3010, uu____3011) -> begin
false
end))
in (

let uu____3020 = b1
in (match (uu____3020) with
| (p1, w1, t1) -> begin
(

let uu____3054 = b2
in (match (uu____3054) with
| (p2, w2, t2) -> begin
(

let uu____3088 = (FStar_Syntax_Syntax.eq_pat p1 p2)
in (match (uu____3088) with
| true -> begin
(

let uu____3089 = ((

let uu____3092 = (eq_tm t1 t2)
in (Prims.op_Equality uu____3092 Equal)) && (related_by (fun t11 t21 -> (

let uu____3101 = (eq_tm t11 t21)
in (Prims.op_Equality uu____3101 Equal))) w1 w2))
in (match (uu____3089) with
| true -> begin
Equal
end
| uu____3102 -> begin
Unknown
end))
end
| uu____3103 -> begin
Unknown
end))
end))
end))))
and eq_args : FStar_Syntax_Syntax.args  ->  FStar_Syntax_Syntax.args  ->  eq_result = (fun a1 a2 -> (match (((a1), (a2))) with
| ([], []) -> begin
Equal
end
| (((a, uu____3135))::a11, ((b, uu____3138))::b1) -> begin
(

let uu____3192 = (eq_tm a b)
in (match (uu____3192) with
| Equal -> begin
(eq_args a11 b1)
end
| uu____3193 -> begin
Unknown
end))
end
| uu____3194 -> begin
Unknown
end))
and eq_univs_list : FStar_Syntax_Syntax.universes  ->  FStar_Syntax_Syntax.universes  ->  Prims.bool = (fun us vs -> ((Prims.op_Equality (FStar_List.length us) (FStar_List.length vs)) && (FStar_List.forall2 eq_univs us vs)))


let rec unrefine : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_refine (x, uu____3206) -> begin
(unrefine x.FStar_Syntax_Syntax.sort)
end
| FStar_Syntax_Syntax.Tm_ascribed (t2, uu____3212, uu____3213) -> begin
(unrefine t2)
end
| uu____3254 -> begin
t1
end)))


let rec is_unit : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____3258 = (

let uu____3259 = (unrefine t)
in uu____3259.FStar_Syntax_Syntax.n)
in (match (uu____3258) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(((FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.unit_lid) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.squash_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.auto_squash_lid))
end
| FStar_Syntax_Syntax.Tm_uinst (t1, uu____3264) -> begin
(is_unit t1)
end
| uu____3269 -> begin
false
end)))


let rec non_informative : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____3273 = (

let uu____3274 = (unrefine t)
in uu____3274.FStar_Syntax_Syntax.n)
in (match (uu____3273) with
| FStar_Syntax_Syntax.Tm_type (uu____3277) -> begin
true
end
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
((((FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.unit_lid) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.squash_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.erased_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.prop_lid))
end
| FStar_Syntax_Syntax.Tm_app (head1, uu____3280) -> begin
(non_informative head1)
end
| FStar_Syntax_Syntax.Tm_uinst (t1, uu____3302) -> begin
(non_informative t1)
end
| FStar_Syntax_Syntax.Tm_arrow (uu____3307, c) -> begin
((is_tot_or_gtot_comp c) && (non_informative (comp_result c)))
end
| uu____3325 -> begin
false
end)))


let is_fun : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun e -> (

let uu____3329 = (

let uu____3330 = (FStar_Syntax_Subst.compress e)
in uu____3330.FStar_Syntax_Syntax.n)
in (match (uu____3329) with
| FStar_Syntax_Syntax.Tm_abs (uu____3333) -> begin
true
end
| uu____3350 -> begin
false
end)))


let is_function_typ : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____3354 = (

let uu____3355 = (FStar_Syntax_Subst.compress t)
in uu____3355.FStar_Syntax_Syntax.n)
in (match (uu____3354) with
| FStar_Syntax_Syntax.Tm_arrow (uu____3358) -> begin
true
end
| uu____3371 -> begin
false
end)))


let rec pre_typ : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_refine (x, uu____3377) -> begin
(pre_typ x.FStar_Syntax_Syntax.sort)
end
| FStar_Syntax_Syntax.Tm_ascribed (t2, uu____3383, uu____3384) -> begin
(pre_typ t2)
end
| uu____3425 -> begin
t1
end)))


let destruct : FStar_Syntax_Syntax.term  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual) Prims.list FStar_Pervasives_Native.option = (fun typ lid -> (

let typ1 = (FStar_Syntax_Subst.compress typ)
in (

let uu____3443 = (

let uu____3444 = (un_uinst typ1)
in uu____3444.FStar_Syntax_Syntax.n)
in (match (uu____3443) with
| FStar_Syntax_Syntax.Tm_app (head1, args) -> begin
(

let head2 = (un_uinst head1)
in (match (head2.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (tc) when (FStar_Syntax_Syntax.fv_eq_lid tc lid) -> begin
FStar_Pervasives_Native.Some (args)
end
| uu____3499 -> begin
FStar_Pervasives_Native.None
end))
end
| FStar_Syntax_Syntax.Tm_fvar (tc) when (FStar_Syntax_Syntax.fv_eq_lid tc lid) -> begin
FStar_Pervasives_Native.Some ([])
end
| uu____3523 -> begin
FStar_Pervasives_Native.None
end))))


let lids_of_sigelt : FStar_Syntax_Syntax.sigelt  ->  FStar_Ident.lident Prims.list = (fun se -> (match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_let (uu____3539, lids) -> begin
lids
end
| FStar_Syntax_Syntax.Sig_bundle (uu____3545, lids) -> begin
lids
end
| FStar_Syntax_Syntax.Sig_inductive_typ (lid, uu____3556, uu____3557, uu____3558, uu____3559, uu____3560) -> begin
(lid)::[]
end
| FStar_Syntax_Syntax.Sig_effect_abbrev (lid, uu____3570, uu____3571, uu____3572, uu____3573) -> begin
(lid)::[]
end
| FStar_Syntax_Syntax.Sig_datacon (lid, uu____3579, uu____3580, uu____3581, uu____3582, uu____3583) -> begin
(lid)::[]
end
| FStar_Syntax_Syntax.Sig_declare_typ (lid, uu____3589, uu____3590) -> begin
(lid)::[]
end
| FStar_Syntax_Syntax.Sig_assume (lid, uu____3592, uu____3593) -> begin
(lid)::[]
end
| FStar_Syntax_Syntax.Sig_new_effect_for_free (n1) -> begin
(n1.FStar_Syntax_Syntax.mname)::[]
end
| FStar_Syntax_Syntax.Sig_new_effect (n1) -> begin
(n1.FStar_Syntax_Syntax.mname)::[]
end
| FStar_Syntax_Syntax.Sig_sub_effect (uu____3596) -> begin
[]
end
| FStar_Syntax_Syntax.Sig_pragma (uu____3597) -> begin
[]
end
| FStar_Syntax_Syntax.Sig_main (uu____3598) -> begin
[]
end
| FStar_Syntax_Syntax.Sig_splice (uu____3599) -> begin
[]
end))


let lid_of_sigelt : FStar_Syntax_Syntax.sigelt  ->  FStar_Ident.lident FStar_Pervasives_Native.option = (fun se -> (match ((lids_of_sigelt se)) with
| (l)::[] -> begin
FStar_Pervasives_Native.Some (l)
end
| uu____3610 -> begin
FStar_Pervasives_Native.None
end))


let quals_of_sigelt : FStar_Syntax_Syntax.sigelt  ->  FStar_Syntax_Syntax.qualifier Prims.list = (fun x -> x.FStar_Syntax_Syntax.sigquals)


let range_of_sigelt : FStar_Syntax_Syntax.sigelt  ->  FStar_Range.range = (fun x -> x.FStar_Syntax_Syntax.sigrng)


let range_of_lbname : (FStar_Syntax_Syntax.bv, FStar_Syntax_Syntax.fv) FStar_Util.either  ->  FStar_Range.range = (fun uu___52_3627 -> (match (uu___52_3627) with
| FStar_Util.Inl (x) -> begin
(FStar_Syntax_Syntax.range_of_bv x)
end
| FStar_Util.Inr (fv) -> begin
(FStar_Ident.range_of_lid fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
end))


let range_of_arg : 'Auu____3637 'Auu____3638 . ('Auu____3637 FStar_Syntax_Syntax.syntax * 'Auu____3638)  ->  FStar_Range.range = (fun uu____3648 -> (match (uu____3648) with
| (hd1, uu____3656) -> begin
hd1.FStar_Syntax_Syntax.pos
end))


let range_of_args : 'Auu____3665 'Auu____3666 . ('Auu____3665 FStar_Syntax_Syntax.syntax * 'Auu____3666) Prims.list  ->  FStar_Range.range  ->  FStar_Range.range = (fun args r -> (FStar_All.pipe_right args (FStar_List.fold_left (fun r1 a -> (FStar_Range.union_ranges r1 (range_of_arg a))) r)))


let mk_app : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual) Prims.list  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun f args -> (

let r = (range_of_args args f.FStar_Syntax_Syntax.pos)
in (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (((f), (args)))) FStar_Pervasives_Native.None r)))


let mk_data : FStar_Ident.lident  ->  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual) Prims.list  ->  FStar_Syntax_Syntax.term FStar_Syntax_Syntax.syntax = (fun l args -> (match (args) with
| [] -> begin
(

let uu____3786 = (

let uu____3789 = (FStar_Syntax_Syntax.fvar l FStar_Syntax_Syntax.Delta_constant (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)))
in (FStar_Syntax_Syntax.mk uu____3789))
in (uu____3786 FStar_Pervasives_Native.None (FStar_Ident.range_of_lid l)))
end
| uu____3793 -> begin
(

let e = (

let uu____3805 = (FStar_Syntax_Syntax.fvar l FStar_Syntax_Syntax.Delta_constant (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)))
in (mk_app uu____3805 args))
in (FStar_Syntax_Syntax.mk e FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos))
end))


let mangle_field_name : FStar_Ident.ident  ->  FStar_Ident.ident = (fun x -> (FStar_Ident.mk_ident (((Prims.strcat "__fname__" x.FStar_Ident.idText)), (x.FStar_Ident.idRange))))


let unmangle_field_name : FStar_Ident.ident  ->  FStar_Ident.ident = (fun x -> (match ((FStar_Util.starts_with x.FStar_Ident.idText "__fname__")) with
| true -> begin
(

let uu____3816 = (

let uu____3821 = (FStar_Util.substring_from x.FStar_Ident.idText (Prims.parse_int "9"))
in ((uu____3821), (x.FStar_Ident.idRange)))
in (FStar_Ident.mk_ident uu____3816))
end
| uu____3822 -> begin
x
end))


let field_projector_prefix : Prims.string = "__proj__"


let field_projector_sep : Prims.string = "__item__"


let field_projector_contains_constructor : Prims.string  ->  Prims.bool = (fun s -> (FStar_Util.starts_with s field_projector_prefix))


let mk_field_projector_name_from_string : Prims.string  ->  Prims.string  ->  Prims.string = (fun constr field -> (Prims.strcat field_projector_prefix (Prims.strcat constr (Prims.strcat field_projector_sep field))))


let mk_field_projector_name_from_ident : FStar_Ident.lident  ->  FStar_Ident.ident  ->  FStar_Ident.lident = (fun lid i -> (

let j = (unmangle_field_name i)
in (

let jtext = j.FStar_Ident.idText
in (

let newi = (match ((field_projector_contains_constructor jtext)) with
| true -> begin
j
end
| uu____3841 -> begin
(FStar_Ident.mk_ident (((mk_field_projector_name_from_string lid.FStar_Ident.ident.FStar_Ident.idText jtext)), (i.FStar_Ident.idRange)))
end)
in (FStar_Ident.lid_of_ids (FStar_List.append lid.FStar_Ident.ns ((newi)::[])))))))


let mk_field_projector_name : FStar_Ident.lident  ->  FStar_Syntax_Syntax.bv  ->  Prims.int  ->  (FStar_Ident.lident * FStar_Syntax_Syntax.bv) = (fun lid x i -> (

let nm = (

let uu____3856 = (FStar_Syntax_Syntax.is_null_bv x)
in (match (uu____3856) with
| true -> begin
(

let uu____3857 = (

let uu____3862 = (

let uu____3863 = (FStar_Util.string_of_int i)
in (Prims.strcat "_" uu____3863))
in (

let uu____3864 = (FStar_Syntax_Syntax.range_of_bv x)
in ((uu____3862), (uu____3864))))
in (FStar_Ident.mk_ident uu____3857))
end
| uu____3865 -> begin
x.FStar_Syntax_Syntax.ppname
end))
in (

let y = (

let uu___58_3867 = x
in {FStar_Syntax_Syntax.ppname = nm; FStar_Syntax_Syntax.index = uu___58_3867.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu___58_3867.FStar_Syntax_Syntax.sort})
in (

let uu____3868 = (mk_field_projector_name_from_ident lid nm)
in ((uu____3868), (y))))))


let set_uvar : FStar_Syntax_Syntax.uvar  ->  FStar_Syntax_Syntax.term  ->  Prims.unit = (fun uv t -> (

let uu____3875 = (FStar_Syntax_Unionfind.find uv)
in (match (uu____3875) with
| FStar_Pervasives_Native.Some (uu____3878) -> begin
(

let uu____3879 = (

let uu____3880 = (

let uu____3881 = (FStar_Syntax_Unionfind.uvar_id uv)
in (FStar_All.pipe_left FStar_Util.string_of_int uu____3881))
in (FStar_Util.format1 "Changing a fixed uvar! ?%s\n" uu____3880))
in (failwith uu____3879))
end
| uu____3882 -> begin
(FStar_Syntax_Unionfind.change uv t)
end)))


let qualifier_equal : FStar_Syntax_Syntax.qualifier  ->  FStar_Syntax_Syntax.qualifier  ->  Prims.bool = (fun q1 q2 -> (match (((q1), (q2))) with
| (FStar_Syntax_Syntax.Discriminator (l1), FStar_Syntax_Syntax.Discriminator (l2)) -> begin
(FStar_Ident.lid_equals l1 l2)
end
| (FStar_Syntax_Syntax.Projector (l1a, l1b), FStar_Syntax_Syntax.Projector (l2a, l2b)) -> begin
((FStar_Ident.lid_equals l1a l2a) && (Prims.op_Equality l1b.FStar_Ident.idText l2b.FStar_Ident.idText))
end
| (FStar_Syntax_Syntax.RecordType (ns1, f1), FStar_Syntax_Syntax.RecordType (ns2, f2)) -> begin
((((Prims.op_Equality (FStar_List.length ns1) (FStar_List.length ns2)) && (FStar_List.forall2 (fun x1 x2 -> (Prims.op_Equality x1.FStar_Ident.idText x2.FStar_Ident.idText)) f1 f2)) && (Prims.op_Equality (FStar_List.length f1) (FStar_List.length f2))) && (FStar_List.forall2 (fun x1 x2 -> (Prims.op_Equality x1.FStar_Ident.idText x2.FStar_Ident.idText)) f1 f2))
end
| (FStar_Syntax_Syntax.RecordConstructor (ns1, f1), FStar_Syntax_Syntax.RecordConstructor (ns2, f2)) -> begin
((((Prims.op_Equality (FStar_List.length ns1) (FStar_List.length ns2)) && (FStar_List.forall2 (fun x1 x2 -> (Prims.op_Equality x1.FStar_Ident.idText x2.FStar_Ident.idText)) f1 f2)) && (Prims.op_Equality (FStar_List.length f1) (FStar_List.length f2))) && (FStar_List.forall2 (fun x1 x2 -> (Prims.op_Equality x1.FStar_Ident.idText x2.FStar_Ident.idText)) f1 f2))
end
| uu____3953 -> begin
(Prims.op_Equality q1 q2)
end))


let abs : FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option  ->  FStar_Syntax_Syntax.term = (fun bs t lopt -> (

let close_lopt = (fun lopt1 -> (match (lopt1) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (rc) -> begin
(

let uu____3984 = (

let uu___59_3985 = rc
in (

let uu____3986 = (FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ (FStar_Syntax_Subst.close bs))
in {FStar_Syntax_Syntax.residual_effect = uu___59_3985.FStar_Syntax_Syntax.residual_effect; FStar_Syntax_Syntax.residual_typ = uu____3986; FStar_Syntax_Syntax.residual_flags = uu___59_3985.FStar_Syntax_Syntax.residual_flags}))
in FStar_Pervasives_Native.Some (uu____3984))
end))
in (match (bs) with
| [] -> begin
t
end
| uu____3997 -> begin
(

let body = (

let uu____3999 = (FStar_Syntax_Subst.close bs t)
in (FStar_Syntax_Subst.compress uu____3999))
in (match (((body.FStar_Syntax_Syntax.n), (lopt))) with
| (FStar_Syntax_Syntax.Tm_abs (bs', t1, lopt'), FStar_Pervasives_Native.None) -> begin
(

let uu____4027 = (

let uu____4030 = (

let uu____4031 = (

let uu____4048 = (

let uu____4055 = (FStar_Syntax_Subst.close_binders bs)
in (FStar_List.append uu____4055 bs'))
in (

let uu____4066 = (close_lopt lopt')
in ((uu____4048), (t1), (uu____4066))))
in FStar_Syntax_Syntax.Tm_abs (uu____4031))
in (FStar_Syntax_Syntax.mk uu____4030))
in (uu____4027 FStar_Pervasives_Native.None t1.FStar_Syntax_Syntax.pos))
end
| uu____4082 -> begin
(

let uu____4089 = (

let uu____4092 = (

let uu____4093 = (

let uu____4110 = (FStar_Syntax_Subst.close_binders bs)
in (

let uu____4111 = (close_lopt lopt)
in ((uu____4110), (body), (uu____4111))))
in FStar_Syntax_Syntax.Tm_abs (uu____4093))
in (FStar_Syntax_Syntax.mk uu____4092))
in (uu____4089 FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos))
end))
end)))


let arrow : (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.aqual) Prims.list  ->  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun bs c -> (match (bs) with
| [] -> begin
(comp_result c)
end
| uu____4149 -> begin
(

let uu____4156 = (

let uu____4159 = (

let uu____4160 = (

let uu____4173 = (FStar_Syntax_Subst.close_binders bs)
in (

let uu____4174 = (FStar_Syntax_Subst.close_comp bs c)
in ((uu____4173), (uu____4174))))
in FStar_Syntax_Syntax.Tm_arrow (uu____4160))
in (FStar_Syntax_Syntax.mk uu____4159))
in (uu____4156 FStar_Pervasives_Native.None c.FStar_Syntax_Syntax.pos))
end))


let flat_arrow : (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.aqual) Prims.list  ->  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun bs c -> (

let t = (arrow bs c)
in (

let uu____4205 = (

let uu____4206 = (FStar_Syntax_Subst.compress t)
in uu____4206.FStar_Syntax_Syntax.n)
in (match (uu____4205) with
| FStar_Syntax_Syntax.Tm_arrow (bs1, c1) -> begin
(match (c1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (tres, uu____4232) -> begin
(

let uu____4241 = (

let uu____4242 = (FStar_Syntax_Subst.compress tres)
in uu____4242.FStar_Syntax_Syntax.n)
in (match (uu____4241) with
| FStar_Syntax_Syntax.Tm_arrow (bs', c') -> begin
(FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_arrow ((((FStar_List.append bs1 bs')), (c')))) FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos)
end
| uu____4277 -> begin
t
end))
end
| uu____4278 -> begin
t
end)
end
| uu____4279 -> begin
t
end))))


let refine : FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun b t -> (

let uu____4288 = (

let uu____4289 = (FStar_Syntax_Syntax.range_of_bv b)
in (FStar_Range.union_ranges uu____4289 t.FStar_Syntax_Syntax.pos))
in (

let uu____4290 = (

let uu____4293 = (

let uu____4294 = (

let uu____4301 = (

let uu____4302 = (

let uu____4303 = (FStar_Syntax_Syntax.mk_binder b)
in (uu____4303)::[])
in (FStar_Syntax_Subst.close uu____4302 t))
in ((b), (uu____4301)))
in FStar_Syntax_Syntax.Tm_refine (uu____4294))
in (FStar_Syntax_Syntax.mk uu____4293))
in (uu____4290 FStar_Pervasives_Native.None uu____4288))))


let branch : FStar_Syntax_Syntax.branch  ->  FStar_Syntax_Syntax.branch = (fun b -> (FStar_Syntax_Subst.close_branch b))


let rec arrow_formals_comp : FStar_Syntax_Syntax.term  ->  ((FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.aqual) Prims.list * FStar_Syntax_Syntax.comp) = (fun k -> (

let k1 = (FStar_Syntax_Subst.compress k)
in (match (k1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(

let uu____4352 = (FStar_Syntax_Subst.open_comp bs c)
in (match (uu____4352) with
| (bs1, c1) -> begin
(

let uu____4369 = (is_tot_or_gtot_comp c1)
in (match (uu____4369) with
| true -> begin
(

let uu____4380 = (arrow_formals_comp (comp_result c1))
in (match (uu____4380) with
| (bs', k2) -> begin
(((FStar_List.append bs1 bs')), (k2))
end))
end
| uu____4425 -> begin
((bs1), (c1))
end))
end))
end
| FStar_Syntax_Syntax.Tm_refine ({FStar_Syntax_Syntax.ppname = uu____4426; FStar_Syntax_Syntax.index = uu____4427; FStar_Syntax_Syntax.sort = k2}, uu____4429) -> begin
(arrow_formals_comp k2)
end
| uu____4436 -> begin
(

let uu____4437 = (FStar_Syntax_Syntax.mk_Total k1)
in (([]), (uu____4437)))
end)))


let rec arrow_formals : FStar_Syntax_Syntax.term  ->  ((FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.aqual) Prims.list * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax) = (fun k -> (

let uu____4463 = (arrow_formals_comp k)
in (match (uu____4463) with
| (bs, c) -> begin
((bs), ((comp_result c)))
end)))


let abs_formals : FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.binders * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option) = (fun t -> (

let subst_lcomp_opt = (fun s l -> (match (l) with
| FStar_Pervasives_Native.Some (rc) -> begin
(

let uu____4539 = (

let uu___60_4540 = rc
in (

let uu____4541 = (FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ (FStar_Syntax_Subst.subst s))
in {FStar_Syntax_Syntax.residual_effect = uu___60_4540.FStar_Syntax_Syntax.residual_effect; FStar_Syntax_Syntax.residual_typ = uu____4541; FStar_Syntax_Syntax.residual_flags = uu___60_4540.FStar_Syntax_Syntax.residual_flags}))
in FStar_Pervasives_Native.Some (uu____4539))
end
| uu____4548 -> begin
l
end))
in (

let rec aux = (fun t1 abs_body_lcomp -> (

let uu____4576 = (

let uu____4577 = (

let uu____4580 = (FStar_Syntax_Subst.compress t1)
in (FStar_All.pipe_left unascribe uu____4580))
in uu____4577.FStar_Syntax_Syntax.n)
in (match (uu____4576) with
| FStar_Syntax_Syntax.Tm_abs (bs, t2, what) -> begin
(

let uu____4618 = (aux t2 what)
in (match (uu____4618) with
| (bs', t3, what1) -> begin
(((FStar_List.append bs bs')), (t3), (what1))
end))
end
| uu____4678 -> begin
(([]), (t1), (abs_body_lcomp))
end)))
in (

let uu____4691 = (aux t FStar_Pervasives_Native.None)
in (match (uu____4691) with
| (bs, t1, abs_body_lcomp) -> begin
(

let uu____4733 = (FStar_Syntax_Subst.open_term' bs t1)
in (match (uu____4733) with
| (bs1, t2, opening) -> begin
(

let abs_body_lcomp1 = (subst_lcomp_opt opening abs_body_lcomp)
in ((bs1), (t2), (abs_body_lcomp1)))
end))
end)))))


let mk_letbinding : (FStar_Syntax_Syntax.bv, FStar_Syntax_Syntax.fv) FStar_Util.either  ->  FStar_Syntax_Syntax.univ_name Prims.list  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax Prims.list  ->  FStar_Range.range  ->  FStar_Syntax_Syntax.letbinding = (fun lbname univ_vars typ eff def lbattrs pos -> {FStar_Syntax_Syntax.lbname = lbname; FStar_Syntax_Syntax.lbunivs = univ_vars; FStar_Syntax_Syntax.lbtyp = typ; FStar_Syntax_Syntax.lbeff = eff; FStar_Syntax_Syntax.lbdef = def; FStar_Syntax_Syntax.lbattrs = lbattrs; FStar_Syntax_Syntax.lbpos = pos})


let close_univs_and_mk_letbinding : FStar_Syntax_Syntax.fv Prims.list FStar_Pervasives_Native.option  ->  (FStar_Syntax_Syntax.bv, FStar_Syntax_Syntax.fv) FStar_Util.either  ->  FStar_Ident.ident Prims.list  ->  FStar_Syntax_Syntax.term  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax Prims.list  ->  FStar_Range.range  ->  FStar_Syntax_Syntax.letbinding = (fun recs lbname univ_vars typ eff def attrs pos -> (

let def1 = (match (((recs), (univ_vars))) with
| (FStar_Pervasives_Native.None, uu____4864) -> begin
def
end
| (uu____4875, []) -> begin
def
end
| (FStar_Pervasives_Native.Some (fvs), uu____4887) -> begin
(

let universes = (FStar_All.pipe_right univ_vars (FStar_List.map (fun _0_27 -> FStar_Syntax_Syntax.U_name (_0_27))))
in (

let inst1 = (FStar_All.pipe_right fvs (FStar_List.map (fun fv -> ((fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v), (universes)))))
in (FStar_Syntax_InstFV.instantiate inst1 def)))
end)
in (

let typ1 = (FStar_Syntax_Subst.close_univ_vars univ_vars typ)
in (

let def2 = (FStar_Syntax_Subst.close_univ_vars univ_vars def1)
in (mk_letbinding lbname univ_vars typ1 eff def2 attrs pos)))))


let open_univ_vars_binders_and_comp : FStar_Syntax_Syntax.univ_names  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.aqual) Prims.list  ->  FStar_Syntax_Syntax.comp  ->  (FStar_Syntax_Syntax.univ_names * (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.aqual) Prims.list * FStar_Syntax_Syntax.comp) = (fun uvs binders c -> (match (binders) with
| [] -> begin
(

let uu____4987 = (FStar_Syntax_Subst.open_univ_vars_comp uvs c)
in (match (uu____4987) with
| (uvs1, c1) -> begin
((uvs1), ([]), (c1))
end))
end
| uu____5016 -> begin
(

let t' = (arrow binders c)
in (

let uu____5026 = (FStar_Syntax_Subst.open_univ_vars uvs t')
in (match (uu____5026) with
| (uvs1, t'1) -> begin
(

let uu____5045 = (

let uu____5046 = (FStar_Syntax_Subst.compress t'1)
in uu____5046.FStar_Syntax_Syntax.n)
in (match (uu____5045) with
| FStar_Syntax_Syntax.Tm_arrow (binders1, c1) -> begin
((uvs1), (binders1), (c1))
end
| uu____5087 -> begin
(failwith "Impossible")
end))
end)))
end))


let is_tuple_constructor : FStar_Syntax_Syntax.typ  ->  Prims.bool = (fun t -> (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Parser_Const.is_tuple_constructor_string fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v.FStar_Ident.str)
end
| uu____5104 -> begin
false
end))


let is_dtuple_constructor : FStar_Syntax_Syntax.typ  ->  Prims.bool = (fun t -> (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Parser_Const.is_dtuple_constructor_lid fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
end
| uu____5109 -> begin
false
end))


let is_lid_equality : FStar_Ident.lident  ->  Prims.bool = (fun x -> (FStar_Ident.lid_equals x FStar_Parser_Const.eq2_lid))


let is_forall : FStar_Ident.lident  ->  Prims.bool = (fun lid -> (FStar_Ident.lid_equals lid FStar_Parser_Const.forall_lid))


let is_exists : FStar_Ident.lident  ->  Prims.bool = (fun lid -> (FStar_Ident.lid_equals lid FStar_Parser_Const.exists_lid))


let is_qlid : FStar_Ident.lident  ->  Prims.bool = (fun lid -> ((is_forall lid) || (is_exists lid)))


let is_equality : FStar_Ident.lident FStar_Syntax_Syntax.withinfo_t  ->  Prims.bool = (fun x -> (is_lid_equality x.FStar_Syntax_Syntax.v))


let lid_is_connective : FStar_Ident.lident  ->  Prims.bool = (

let lst = (FStar_Parser_Const.and_lid)::(FStar_Parser_Const.or_lid)::(FStar_Parser_Const.not_lid)::(FStar_Parser_Const.iff_lid)::(FStar_Parser_Const.imp_lid)::[]
in (fun lid -> (FStar_Util.for_some (FStar_Ident.lid_equals lid) lst)))


let is_constructor : FStar_Syntax_Syntax.term  ->  FStar_Ident.lident  ->  Prims.bool = (fun t lid -> (

let uu____5141 = (

let uu____5142 = (pre_typ t)
in uu____5142.FStar_Syntax_Syntax.n)
in (match (uu____5141) with
| FStar_Syntax_Syntax.Tm_fvar (tc) -> begin
(FStar_Ident.lid_equals tc.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v lid)
end
| uu____5146 -> begin
false
end)))


let rec is_constructed_typ : FStar_Syntax_Syntax.term  ->  FStar_Ident.lident  ->  Prims.bool = (fun t lid -> (

let uu____5153 = (

let uu____5154 = (pre_typ t)
in uu____5154.FStar_Syntax_Syntax.n)
in (match (uu____5153) with
| FStar_Syntax_Syntax.Tm_fvar (uu____5157) -> begin
(is_constructor t lid)
end
| FStar_Syntax_Syntax.Tm_app (t1, uu____5159) -> begin
(is_constructed_typ t1 lid)
end
| FStar_Syntax_Syntax.Tm_uinst (t1, uu____5181) -> begin
(is_constructed_typ t1 lid)
end
| uu____5186 -> begin
false
end)))


let rec get_tycon : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term FStar_Pervasives_Native.option = (fun t -> (

let t1 = (pre_typ t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_bvar (uu____5195) -> begin
FStar_Pervasives_Native.Some (t1)
end
| FStar_Syntax_Syntax.Tm_name (uu____5196) -> begin
FStar_Pervasives_Native.Some (t1)
end
| FStar_Syntax_Syntax.Tm_fvar (uu____5197) -> begin
FStar_Pervasives_Native.Some (t1)
end
| FStar_Syntax_Syntax.Tm_app (t2, uu____5199) -> begin
(get_tycon t2)
end
| uu____5220 -> begin
FStar_Pervasives_Native.None
end)))


let is_interpreted : FStar_Ident.lident  ->  Prims.bool = (fun l -> (

let theory_syms = (FStar_Parser_Const.op_Eq)::(FStar_Parser_Const.op_notEq)::(FStar_Parser_Const.op_LT)::(FStar_Parser_Const.op_LTE)::(FStar_Parser_Const.op_GT)::(FStar_Parser_Const.op_GTE)::(FStar_Parser_Const.op_Subtraction)::(FStar_Parser_Const.op_Minus)::(FStar_Parser_Const.op_Addition)::(FStar_Parser_Const.op_Multiply)::(FStar_Parser_Const.op_Division)::(FStar_Parser_Const.op_Modulus)::(FStar_Parser_Const.op_And)::(FStar_Parser_Const.op_Or)::(FStar_Parser_Const.op_Negation)::[]
in (FStar_Util.for_some (FStar_Ident.lid_equals l) theory_syms)))


let is_fstar_tactics_by_tactic : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____5230 = (

let uu____5231 = (un_uinst t)
in uu____5231.FStar_Syntax_Syntax.n)
in (match (uu____5230) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.by_tactic_lid)
end
| uu____5235 -> begin
false
end)))


let is_builtin_tactic : FStar_Ident.lident  ->  Prims.bool = (fun md -> (

let path = (FStar_Ident.path_of_lid md)
in (match (((FStar_List.length path) > (Prims.parse_int "2"))) with
| true -> begin
(

let uu____5242 = (

let uu____5245 = (FStar_List.splitAt (Prims.parse_int "2") path)
in (FStar_Pervasives_Native.fst uu____5245))
in (match (uu____5242) with
| ("FStar")::("Tactics")::[] -> begin
true
end
| ("FStar")::("Reflection")::[] -> begin
true
end
| uu____5258 -> begin
false
end))
end
| uu____5261 -> begin
false
end)))


let ktype : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (FStar_Syntax_Syntax.U_unknown)) FStar_Pervasives_Native.None FStar_Range.dummyRange)


let ktype0 : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (FStar_Syntax_Syntax.U_zero)) FStar_Pervasives_Native.None FStar_Range.dummyRange)


let kprop : FStar_Syntax_Syntax.term = (

let uu____5266 = (FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.prop_lid FStar_Syntax_Syntax.Delta_constant FStar_Pervasives_Native.None)
in (FStar_Syntax_Syntax.fv_to_tm uu____5266))


let type_u : Prims.unit  ->  (FStar_Syntax_Syntax.typ * FStar_Syntax_Syntax.universe) = (fun uu____5273 -> (

let u = (

let uu____5279 = (FStar_Syntax_Unionfind.univ_fresh ())
in (FStar_All.pipe_left (fun _0_28 -> FStar_Syntax_Syntax.U_unif (_0_28)) uu____5279))
in (

let uu____5296 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (u)) FStar_Pervasives_Native.None FStar_Range.dummyRange)
in ((uu____5296), (u)))))


let attr_eq : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun a a' -> (

let uu____5307 = (eq_tm a a')
in (match (uu____5307) with
| Equal -> begin
true
end
| uu____5308 -> begin
false
end)))


let attr_substitute : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (

let uu____5311 = (

let uu____5314 = (

let uu____5315 = (

let uu____5316 = (FStar_Ident.lid_of_path (("FStar")::("Pervasives")::("Substitute")::[]) FStar_Range.dummyRange)
in (FStar_Syntax_Syntax.lid_as_fv uu____5316 FStar_Syntax_Syntax.Delta_constant FStar_Pervasives_Native.None))
in FStar_Syntax_Syntax.Tm_fvar (uu____5315))
in (FStar_Syntax_Syntax.mk uu____5314))
in (uu____5311 FStar_Pervasives_Native.None FStar_Range.dummyRange))


let exp_true_bool : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool (true))) FStar_Pervasives_Native.None FStar_Range.dummyRange)


let exp_false_bool : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool (false))) FStar_Pervasives_Native.None FStar_Range.dummyRange)


let exp_unit : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_unit)) FStar_Pervasives_Native.None FStar_Range.dummyRange)


let exp_int : Prims.string  ->  FStar_Syntax_Syntax.term = (fun s -> (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int (((s), (FStar_Pervasives_Native.None))))) FStar_Pervasives_Native.None FStar_Range.dummyRange))


let exp_char : FStar_BaseTypes.char  ->  FStar_Syntax_Syntax.term = (fun c -> (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_char (c))) FStar_Pervasives_Native.None FStar_Range.dummyRange))


let exp_string : Prims.string  ->  FStar_Syntax_Syntax.term = (fun s -> (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_string (((s), (FStar_Range.dummyRange))))) FStar_Pervasives_Native.None FStar_Range.dummyRange))


let fvar_const : FStar_Ident.lident  ->  FStar_Syntax_Syntax.term = (fun l -> (FStar_Syntax_Syntax.fvar l FStar_Syntax_Syntax.Delta_constant FStar_Pervasives_Native.None))


let tand : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.and_lid)


let tor : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.or_lid)


let timp : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.imp_lid (FStar_Syntax_Syntax.Delta_defined_at_level ((Prims.parse_int "1"))) FStar_Pervasives_Native.None)


let tiff : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.iff_lid (FStar_Syntax_Syntax.Delta_defined_at_level ((Prims.parse_int "2"))) FStar_Pervasives_Native.None)


let t_bool : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.bool_lid)


let b2p_v : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.b2p_lid)


let t_not : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.not_lid)


let t_false : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.false_lid)


let t_true : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.true_lid)


let tac_opaque_attr : FStar_Syntax_Syntax.term = (exp_string "tac_opaque")


let dm4f_bind_range_attr : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.dm4f_bind_range_attr)


let mk_conj_opt : FStar_Syntax_Syntax.term FStar_Pervasives_Native.option  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term FStar_Pervasives_Native.option = (fun phi1 phi2 -> (match (phi1) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.Some (phi2)
end
| FStar_Pervasives_Native.Some (phi11) -> begin
(

let uu____5363 = (

let uu____5366 = (FStar_Range.union_ranges phi11.FStar_Syntax_Syntax.pos phi2.FStar_Syntax_Syntax.pos)
in (

let uu____5367 = (

let uu____5370 = (

let uu____5371 = (

let uu____5386 = (

let uu____5389 = (FStar_Syntax_Syntax.as_arg phi11)
in (

let uu____5390 = (

let uu____5393 = (FStar_Syntax_Syntax.as_arg phi2)
in (uu____5393)::[])
in (uu____5389)::uu____5390))
in ((tand), (uu____5386)))
in FStar_Syntax_Syntax.Tm_app (uu____5371))
in (FStar_Syntax_Syntax.mk uu____5370))
in (uu____5367 FStar_Pervasives_Native.None uu____5366)))
in FStar_Pervasives_Native.Some (uu____5363))
end))


let mk_binop : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun op_t phi1 phi2 -> (

let uu____5416 = (FStar_Range.union_ranges phi1.FStar_Syntax_Syntax.pos phi2.FStar_Syntax_Syntax.pos)
in (

let uu____5417 = (

let uu____5420 = (

let uu____5421 = (

let uu____5436 = (

let uu____5439 = (FStar_Syntax_Syntax.as_arg phi1)
in (

let uu____5440 = (

let uu____5443 = (FStar_Syntax_Syntax.as_arg phi2)
in (uu____5443)::[])
in (uu____5439)::uu____5440))
in ((op_t), (uu____5436)))
in FStar_Syntax_Syntax.Tm_app (uu____5421))
in (FStar_Syntax_Syntax.mk uu____5420))
in (uu____5417 FStar_Pervasives_Native.None uu____5416))))


let mk_neg : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun phi -> (

let uu____5456 = (

let uu____5459 = (

let uu____5460 = (

let uu____5475 = (

let uu____5478 = (FStar_Syntax_Syntax.as_arg phi)
in (uu____5478)::[])
in ((t_not), (uu____5475)))
in FStar_Syntax_Syntax.Tm_app (uu____5460))
in (FStar_Syntax_Syntax.mk uu____5459))
in (uu____5456 FStar_Pervasives_Native.None phi.FStar_Syntax_Syntax.pos)))


let mk_conj : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun phi1 phi2 -> (mk_binop tand phi1 phi2))


let mk_conj_l : FStar_Syntax_Syntax.term Prims.list  ->  FStar_Syntax_Syntax.term = (fun phi -> (match (phi) with
| [] -> begin
(FStar_Syntax_Syntax.fvar FStar_Parser_Const.true_lid FStar_Syntax_Syntax.Delta_constant FStar_Pervasives_Native.None)
end
| (hd1)::tl1 -> begin
(FStar_List.fold_right mk_conj tl1 hd1)
end))


let mk_disj : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun phi1 phi2 -> (mk_binop tor phi1 phi2))


let mk_disj_l : FStar_Syntax_Syntax.term Prims.list  ->  FStar_Syntax_Syntax.term = (fun phi -> (match (phi) with
| [] -> begin
t_false
end
| (hd1)::tl1 -> begin
(FStar_List.fold_right mk_disj tl1 hd1)
end))


let mk_imp : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun phi1 phi2 -> (mk_binop timp phi1 phi2))


let mk_iff : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun phi1 phi2 -> (mk_binop tiff phi1 phi2))


let b2p : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun e -> (

let uu____5539 = (

let uu____5542 = (

let uu____5543 = (

let uu____5558 = (

let uu____5561 = (FStar_Syntax_Syntax.as_arg e)
in (uu____5561)::[])
in ((b2p_v), (uu____5558)))
in FStar_Syntax_Syntax.Tm_app (uu____5543))
in (FStar_Syntax_Syntax.mk uu____5542))
in (uu____5539 FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos)))


let teq : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.eq2_lid)


let mk_untyped_eq2 : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun e1 e2 -> (

let uu____5575 = (FStar_Range.union_ranges e1.FStar_Syntax_Syntax.pos e2.FStar_Syntax_Syntax.pos)
in (

let uu____5576 = (

let uu____5579 = (

let uu____5580 = (

let uu____5595 = (

let uu____5598 = (FStar_Syntax_Syntax.as_arg e1)
in (

let uu____5599 = (

let uu____5602 = (FStar_Syntax_Syntax.as_arg e2)
in (uu____5602)::[])
in (uu____5598)::uu____5599))
in ((teq), (uu____5595)))
in FStar_Syntax_Syntax.Tm_app (uu____5580))
in (FStar_Syntax_Syntax.mk uu____5579))
in (uu____5576 FStar_Pervasives_Native.None uu____5575))))


let mk_eq2 : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun u t e1 e2 -> (

let eq_inst = (FStar_Syntax_Syntax.mk_Tm_uinst teq ((u)::[]))
in (

let uu____5621 = (FStar_Range.union_ranges e1.FStar_Syntax_Syntax.pos e2.FStar_Syntax_Syntax.pos)
in (

let uu____5622 = (

let uu____5625 = (

let uu____5626 = (

let uu____5641 = (

let uu____5644 = (FStar_Syntax_Syntax.iarg t)
in (

let uu____5645 = (

let uu____5648 = (FStar_Syntax_Syntax.as_arg e1)
in (

let uu____5649 = (

let uu____5652 = (FStar_Syntax_Syntax.as_arg e2)
in (uu____5652)::[])
in (uu____5648)::uu____5649))
in (uu____5644)::uu____5645))
in ((eq_inst), (uu____5641)))
in FStar_Syntax_Syntax.Tm_app (uu____5626))
in (FStar_Syntax_Syntax.mk uu____5625))
in (uu____5622 FStar_Pervasives_Native.None uu____5621)))))


let mk_has_type : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t x t' -> (

let t_has_type = (fvar_const FStar_Parser_Const.has_type_lid)
in (

let t_has_type1 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_uinst (((t_has_type), ((FStar_Syntax_Syntax.U_zero)::(FStar_Syntax_Syntax.U_zero)::[])))) FStar_Pervasives_Native.None FStar_Range.dummyRange)
in (

let uu____5675 = (

let uu____5678 = (

let uu____5679 = (

let uu____5694 = (

let uu____5697 = (FStar_Syntax_Syntax.iarg t)
in (

let uu____5698 = (

let uu____5701 = (FStar_Syntax_Syntax.as_arg x)
in (

let uu____5702 = (

let uu____5705 = (FStar_Syntax_Syntax.as_arg t')
in (uu____5705)::[])
in (uu____5701)::uu____5702))
in (uu____5697)::uu____5698))
in ((t_has_type1), (uu____5694)))
in FStar_Syntax_Syntax.Tm_app (uu____5679))
in (FStar_Syntax_Syntax.mk uu____5678))
in (uu____5675 FStar_Pervasives_Native.None FStar_Range.dummyRange)))))


let mk_with_type : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun u t e -> (

let t_with_type = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.with_type_lid FStar_Syntax_Syntax.Delta_equational FStar_Pervasives_Native.None)
in (

let t_with_type1 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_uinst (((t_with_type), ((u)::[])))) FStar_Pervasives_Native.None FStar_Range.dummyRange)
in (

let uu____5730 = (

let uu____5733 = (

let uu____5734 = (

let uu____5749 = (

let uu____5752 = (FStar_Syntax_Syntax.iarg t)
in (

let uu____5753 = (

let uu____5756 = (FStar_Syntax_Syntax.as_arg e)
in (uu____5756)::[])
in (uu____5752)::uu____5753))
in ((t_with_type1), (uu____5749)))
in FStar_Syntax_Syntax.Tm_app (uu____5734))
in (FStar_Syntax_Syntax.mk uu____5733))
in (uu____5730 FStar_Pervasives_Native.None FStar_Range.dummyRange)))))


let lex_t : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.lex_t_lid)


let lex_top : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (

let uu____5766 = (

let uu____5769 = (

let uu____5770 = (

let uu____5777 = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.lextop_lid FStar_Syntax_Syntax.Delta_constant (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)))
in ((uu____5777), ((FStar_Syntax_Syntax.U_zero)::[])))
in FStar_Syntax_Syntax.Tm_uinst (uu____5770))
in (FStar_Syntax_Syntax.mk uu____5769))
in (uu____5766 FStar_Pervasives_Native.None FStar_Range.dummyRange))


let lex_pair : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.lexcons_lid FStar_Syntax_Syntax.Delta_constant (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)))


let tforall : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.forall_lid (FStar_Syntax_Syntax.Delta_defined_at_level ((Prims.parse_int "1"))) FStar_Pervasives_Native.None)


let t_haseq : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.haseq_lid FStar_Syntax_Syntax.Delta_constant FStar_Pervasives_Native.None)


let lcomp_of_comp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.lcomp = (fun c0 -> (

let uu____5790 = (match (c0.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (uu____5803) -> begin
((FStar_Parser_Const.effect_Tot_lid), ((FStar_Syntax_Syntax.TOTAL)::[]))
end
| FStar_Syntax_Syntax.GTotal (uu____5814) -> begin
((FStar_Parser_Const.effect_GTot_lid), ((FStar_Syntax_Syntax.SOMETRIVIAL)::[]))
end
| FStar_Syntax_Syntax.Comp (c) -> begin
((c.FStar_Syntax_Syntax.effect_name), (c.FStar_Syntax_Syntax.flags))
end)
in (match (uu____5790) with
| (eff_name, flags1) -> begin
(FStar_Syntax_Syntax.mk_lcomp eff_name (comp_result c0) flags1 (fun uu____5835 -> c0))
end)))


let mk_residual_comp : FStar_Ident.lident  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option  ->  FStar_Syntax_Syntax.cflags Prims.list  ->  FStar_Syntax_Syntax.residual_comp = (fun l t f -> {FStar_Syntax_Syntax.residual_effect = l; FStar_Syntax_Syntax.residual_typ = t; FStar_Syntax_Syntax.residual_flags = f})


let residual_tot : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.residual_comp = (fun t -> {FStar_Syntax_Syntax.residual_effect = FStar_Parser_Const.effect_Tot_lid; FStar_Syntax_Syntax.residual_typ = FStar_Pervasives_Native.Some (t); FStar_Syntax_Syntax.residual_flags = (FStar_Syntax_Syntax.TOTAL)::[]})


let residual_comp_of_comp : FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.residual_comp = (fun c -> {FStar_Syntax_Syntax.residual_effect = (comp_effect_name c); FStar_Syntax_Syntax.residual_typ = FStar_Pervasives_Native.Some ((comp_result c)); FStar_Syntax_Syntax.residual_flags = (comp_flags c)})


let residual_comp_of_lcomp : FStar_Syntax_Syntax.lcomp  ->  FStar_Syntax_Syntax.residual_comp = (fun lc -> {FStar_Syntax_Syntax.residual_effect = lc.FStar_Syntax_Syntax.eff_name; FStar_Syntax_Syntax.residual_typ = FStar_Pervasives_Native.Some (lc.FStar_Syntax_Syntax.res_typ); FStar_Syntax_Syntax.residual_flags = lc.FStar_Syntax_Syntax.cflags})


let mk_forall_aux : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun fa x body -> (

let uu____5891 = (

let uu____5894 = (

let uu____5895 = (

let uu____5910 = (

let uu____5913 = (FStar_Syntax_Syntax.iarg x.FStar_Syntax_Syntax.sort)
in (

let uu____5914 = (

let uu____5917 = (

let uu____5918 = (

let uu____5919 = (

let uu____5920 = (FStar_Syntax_Syntax.mk_binder x)
in (uu____5920)::[])
in (abs uu____5919 body (FStar_Pervasives_Native.Some ((residual_tot ktype0)))))
in (FStar_Syntax_Syntax.as_arg uu____5918))
in (uu____5917)::[])
in (uu____5913)::uu____5914))
in ((fa), (uu____5910)))
in FStar_Syntax_Syntax.Tm_app (uu____5895))
in (FStar_Syntax_Syntax.mk uu____5894))
in (uu____5891 FStar_Pervasives_Native.None FStar_Range.dummyRange)))


let mk_forall_no_univ : FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ = (fun x body -> (mk_forall_aux tforall x body))


let mk_forall : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ = (fun u x body -> (

let tforall1 = (FStar_Syntax_Syntax.mk_Tm_uinst tforall ((u)::[]))
in (mk_forall_aux tforall1 x body)))


let close_forall_no_univs : FStar_Syntax_Syntax.binder Prims.list  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ = (fun bs f -> (FStar_List.fold_right (fun b f1 -> (

let uu____5959 = (FStar_Syntax_Syntax.is_null_binder b)
in (match (uu____5959) with
| true -> begin
f1
end
| uu____5960 -> begin
(mk_forall_no_univ (FStar_Pervasives_Native.fst b) f1)
end))) bs f))


let rec is_wild_pat : FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t  ->  Prims.bool = (fun p -> (match (p.FStar_Syntax_Syntax.v) with
| FStar_Syntax_Syntax.Pat_wild (uu____5968) -> begin
true
end
| uu____5969 -> begin
false
end))


let if_then_else : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun b t1 t2 -> (

let then_branch = (

let uu____6008 = (FStar_Syntax_Syntax.withinfo (FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool (true))) t1.FStar_Syntax_Syntax.pos)
in ((uu____6008), (FStar_Pervasives_Native.None), (t1)))
in (

let else_branch = (

let uu____6036 = (FStar_Syntax_Syntax.withinfo (FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool (false))) t2.FStar_Syntax_Syntax.pos)
in ((uu____6036), (FStar_Pervasives_Native.None), (t2)))
in (

let uu____6049 = (

let uu____6050 = (FStar_Range.union_ranges t1.FStar_Syntax_Syntax.pos t2.FStar_Syntax_Syntax.pos)
in (FStar_Range.union_ranges b.FStar_Syntax_Syntax.pos uu____6050))
in (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_match (((b), ((then_branch)::(else_branch)::[])))) FStar_Pervasives_Native.None uu____6049)))))


let mk_squash : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun u p -> (

let sq = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.squash_lid (FStar_Syntax_Syntax.Delta_defined_at_level ((Prims.parse_int "1"))) FStar_Pervasives_Native.None)
in (

let uu____6120 = (FStar_Syntax_Syntax.mk_Tm_uinst sq ((u)::[]))
in (

let uu____6123 = (

let uu____6132 = (FStar_Syntax_Syntax.as_arg p)
in (uu____6132)::[])
in (mk_app uu____6120 uu____6123)))))


let mk_auto_squash : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun u p -> (

let sq = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.auto_squash_lid (FStar_Syntax_Syntax.Delta_defined_at_level ((Prims.parse_int "2"))) FStar_Pervasives_Native.None)
in (

let uu____6142 = (FStar_Syntax_Syntax.mk_Tm_uinst sq ((u)::[]))
in (

let uu____6145 = (

let uu____6154 = (FStar_Syntax_Syntax.as_arg p)
in (uu____6154)::[])
in (mk_app uu____6142 uu____6145)))))


let un_squash : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option = (fun t -> (

let uu____6162 = (head_and_args t)
in (match (uu____6162) with
| (head1, args) -> begin
(

let uu____6203 = (

let uu____6216 = (

let uu____6217 = (un_uinst head1)
in uu____6217.FStar_Syntax_Syntax.n)
in ((uu____6216), (args)))
in (match (uu____6203) with
| (FStar_Syntax_Syntax.Tm_fvar (fv), ((p, uu____6234))::[]) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.squash_lid) -> begin
FStar_Pervasives_Native.Some (p)
end
| (FStar_Syntax_Syntax.Tm_refine (b, p), []) -> begin
(match (b.FStar_Syntax_Syntax.sort.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (fv) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.unit_lid) -> begin
(

let uu____6286 = (

let uu____6291 = (

let uu____6292 = (FStar_Syntax_Syntax.mk_binder b)
in (uu____6292)::[])
in (FStar_Syntax_Subst.open_term uu____6291 p))
in (match (uu____6286) with
| (bs, p1) -> begin
(

let b1 = (match (bs) with
| (b1)::[] -> begin
b1
end
| uu____6321 -> begin
(failwith "impossible")
end)
in (

let uu____6326 = (

let uu____6327 = (FStar_Syntax_Free.names p1)
in (FStar_Util.set_mem (FStar_Pervasives_Native.fst b1) uu____6327))
in (match (uu____6326) with
| true -> begin
FStar_Pervasives_Native.None
end
| uu____6336 -> begin
FStar_Pervasives_Native.Some (p1)
end)))
end))
end
| uu____6337 -> begin
FStar_Pervasives_Native.None
end)
end
| uu____6340 -> begin
FStar_Pervasives_Native.None
end))
end)))


let is_squash : FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.universe * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax) FStar_Pervasives_Native.option = (fun t -> (

let uu____6366 = (head_and_args t)
in (match (uu____6366) with
| (head1, args) -> begin
(

let uu____6411 = (

let uu____6424 = (

let uu____6425 = (FStar_Syntax_Subst.compress head1)
in uu____6425.FStar_Syntax_Syntax.n)
in ((uu____6424), (args)))
in (match (uu____6411) with
| (FStar_Syntax_Syntax.Tm_uinst ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (fv); FStar_Syntax_Syntax.pos = uu____6445; FStar_Syntax_Syntax.vars = uu____6446}, (u)::[]), ((t1, uu____6449))::[]) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.squash_lid) -> begin
FStar_Pervasives_Native.Some (((u), (t1)))
end
| uu____6488 -> begin
FStar_Pervasives_Native.None
end))
end)))


let is_auto_squash : FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.universe * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax) FStar_Pervasives_Native.option = (fun t -> (

let uu____6518 = (head_and_args t)
in (match (uu____6518) with
| (head1, args) -> begin
(

let uu____6563 = (

let uu____6576 = (

let uu____6577 = (FStar_Syntax_Subst.compress head1)
in uu____6577.FStar_Syntax_Syntax.n)
in ((uu____6576), (args)))
in (match (uu____6563) with
| (FStar_Syntax_Syntax.Tm_uinst ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (fv); FStar_Syntax_Syntax.pos = uu____6597; FStar_Syntax_Syntax.vars = uu____6598}, (u)::[]), ((t1, uu____6601))::[]) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.auto_squash_lid) -> begin
FStar_Pervasives_Native.Some (((u), (t1)))
end
| uu____6640 -> begin
FStar_Pervasives_Native.None
end))
end)))


let is_sub_singleton : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____6662 = (

let uu____6677 = (unmeta t)
in (head_and_args uu____6677))
in (match (uu____6662) with
| (head1, uu____6679) -> begin
(

let uu____6700 = (

let uu____6701 = (un_uinst head1)
in uu____6701.FStar_Syntax_Syntax.n)
in (match (uu____6700) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
((((((((((((((((((FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.squash_lid) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.auto_squash_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.and_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.or_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.not_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.imp_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.iff_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.ite_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.exists_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.forall_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.true_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.false_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.eq2_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.eq3_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.b2p_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.haseq_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.has_type_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.precedes_lid))
end
| uu____6705 -> begin
false
end))
end)))


let arrow_one : FStar_Syntax_Syntax.typ  ->  (FStar_Syntax_Syntax.binder * FStar_Syntax_Syntax.comp) FStar_Pervasives_Native.option = (fun t -> (

let uu____6721 = (

let uu____6734 = (

let uu____6735 = (FStar_Syntax_Subst.compress t)
in uu____6735.FStar_Syntax_Syntax.n)
in (match (uu____6734) with
| FStar_Syntax_Syntax.Tm_arrow ([], c) -> begin
(failwith "fatal: empty binders on arrow?")
end
| FStar_Syntax_Syntax.Tm_arrow ((b)::[], c) -> begin
FStar_Pervasives_Native.Some (((b), (c)))
end
| FStar_Syntax_Syntax.Tm_arrow ((b)::bs, c) -> begin
(

let uu____6844 = (

let uu____6853 = (

let uu____6854 = (arrow bs c)
in (FStar_Syntax_Syntax.mk_Total uu____6854))
in ((b), (uu____6853)))
in FStar_Pervasives_Native.Some (uu____6844))
end
| uu____6867 -> begin
FStar_Pervasives_Native.None
end))
in (FStar_Util.bind_opt uu____6721 (fun uu____6903 -> (match (uu____6903) with
| (b, c) -> begin
(

let uu____6938 = (FStar_Syntax_Subst.open_comp ((b)::[]) c)
in (match (uu____6938) with
| (bs, c1) -> begin
(

let b1 = (match (bs) with
| (b1)::[] -> begin
b1
end
| uu____6985 -> begin
(failwith "impossible: open_comp returned different amount of binders")
end)
in FStar_Pervasives_Native.Some (((b1), (c1))))
end))
end)))))


let is_free_in : FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun bv t -> (

let uu____7008 = (FStar_Syntax_Free.names t)
in (FStar_Util.set_mem bv uu____7008)))


type qpats =
FStar_Syntax_Syntax.args Prims.list

type connective =
| QAll of (FStar_Syntax_Syntax.binders * qpats * FStar_Syntax_Syntax.typ)
| QEx of (FStar_Syntax_Syntax.binders * qpats * FStar_Syntax_Syntax.typ)
| BaseConn of (FStar_Ident.lident * FStar_Syntax_Syntax.args)


let uu___is_QAll : connective  ->  Prims.bool = (fun projectee -> (match (projectee) with
| QAll (_0) -> begin
true
end
| uu____7051 -> begin
false
end))


let __proj__QAll__item___0 : connective  ->  (FStar_Syntax_Syntax.binders * qpats * FStar_Syntax_Syntax.typ) = (fun projectee -> (match (projectee) with
| QAll (_0) -> begin
_0
end))


let uu___is_QEx : connective  ->  Prims.bool = (fun projectee -> (match (projectee) with
| QEx (_0) -> begin
true
end
| uu____7087 -> begin
false
end))


let __proj__QEx__item___0 : connective  ->  (FStar_Syntax_Syntax.binders * qpats * FStar_Syntax_Syntax.typ) = (fun projectee -> (match (projectee) with
| QEx (_0) -> begin
_0
end))


let uu___is_BaseConn : connective  ->  Prims.bool = (fun projectee -> (match (projectee) with
| BaseConn (_0) -> begin
true
end
| uu____7121 -> begin
false
end))


let __proj__BaseConn__item___0 : connective  ->  (FStar_Ident.lident * FStar_Syntax_Syntax.args) = (fun projectee -> (match (projectee) with
| BaseConn (_0) -> begin
_0
end))


let destruct_typ_as_formula : FStar_Syntax_Syntax.term  ->  connective FStar_Pervasives_Native.option = (fun f -> (

let rec unmeta_monadic = (fun f1 -> (

let f2 = (FStar_Syntax_Subst.compress f1)
in (match (f2.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_meta (t, FStar_Syntax_Syntax.Meta_monadic (uu____7154)) -> begin
(unmeta_monadic t)
end
| FStar_Syntax_Syntax.Tm_meta (t, FStar_Syntax_Syntax.Meta_monadic_lift (uu____7166)) -> begin
(unmeta_monadic t)
end
| uu____7179 -> begin
f2
end)))
in (

let destruct_base_conn = (fun f1 -> (

let connectives = (((FStar_Parser_Const.true_lid), ((Prims.parse_int "0"))))::(((FStar_Parser_Const.false_lid), ((Prims.parse_int "0"))))::(((FStar_Parser_Const.and_lid), ((Prims.parse_int "2"))))::(((FStar_Parser_Const.or_lid), ((Prims.parse_int "2"))))::(((FStar_Parser_Const.imp_lid), ((Prims.parse_int "2"))))::(((FStar_Parser_Const.iff_lid), ((Prims.parse_int "2"))))::(((FStar_Parser_Const.ite_lid), ((Prims.parse_int "3"))))::(((FStar_Parser_Const.not_lid), ((Prims.parse_int "1"))))::(((FStar_Parser_Const.eq2_lid), ((Prims.parse_int "3"))))::(((FStar_Parser_Const.eq2_lid), ((Prims.parse_int "2"))))::(((FStar_Parser_Const.eq3_lid), ((Prims.parse_int "4"))))::(((FStar_Parser_Const.eq3_lid), ((Prims.parse_int "2"))))::[]
in (

let aux = (fun f2 uu____7257 -> (match (uu____7257) with
| (lid, arity) -> begin
(

let uu____7266 = (

let uu____7281 = (unmeta_monadic f2)
in (head_and_args uu____7281))
in (match (uu____7266) with
| (t, args) -> begin
(

let t1 = (un_uinst t)
in (

let uu____7307 = ((is_constructor t1 lid) && (Prims.op_Equality (FStar_List.length args) arity))
in (match (uu____7307) with
| true -> begin
FStar_Pervasives_Native.Some (BaseConn (((lid), (args))))
end
| uu____7328 -> begin
FStar_Pervasives_Native.None
end)))
end))
end))
in (FStar_Util.find_map connectives (aux f1)))))
in (

let patterns = (fun t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_meta (t2, FStar_Syntax_Syntax.Meta_pattern (pats)) -> begin
(

let uu____7382 = (FStar_Syntax_Subst.compress t2)
in ((pats), (uu____7382)))
end
| uu____7393 -> begin
(([]), (t1))
end)))
in (

let destruct_q_conn = (fun t -> (

let is_q = (fun fa fv -> (match (fa) with
| true -> begin
(is_forall fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
end
| uu____7425 -> begin
(is_exists fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
end))
in (

let flat = (fun t1 -> (

let uu____7440 = (head_and_args t1)
in (match (uu____7440) with
| (t2, args) -> begin
(

let uu____7487 = (un_uinst t2)
in (

let uu____7488 = (FStar_All.pipe_right args (FStar_List.map (fun uu____7521 -> (match (uu____7521) with
| (t3, imp) -> begin
(

let uu____7532 = (unascribe t3)
in ((uu____7532), (imp)))
end))))
in ((uu____7487), (uu____7488))))
end)))
in (

let rec aux = (fun qopt out t1 -> (

let uu____7567 = (

let uu____7584 = (flat t1)
in ((qopt), (uu____7584)))
in (match (uu____7567) with
| (FStar_Pervasives_Native.Some (fa), ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (tc); FStar_Syntax_Syntax.pos = uu____7611; FStar_Syntax_Syntax.vars = uu____7612}, (({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_abs ((b)::[], t2, uu____7615); FStar_Syntax_Syntax.pos = uu____7616; FStar_Syntax_Syntax.vars = uu____7617}, uu____7618))::[])) when (is_q fa tc) -> begin
(aux qopt ((b)::out) t2)
end
| (FStar_Pervasives_Native.Some (fa), ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (tc); FStar_Syntax_Syntax.pos = uu____7695; FStar_Syntax_Syntax.vars = uu____7696}, (uu____7697)::(({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_abs ((b)::[], t2, uu____7700); FStar_Syntax_Syntax.pos = uu____7701; FStar_Syntax_Syntax.vars = uu____7702}, uu____7703))::[])) when (is_q fa tc) -> begin
(aux qopt ((b)::out) t2)
end
| (FStar_Pervasives_Native.None, ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (tc); FStar_Syntax_Syntax.pos = uu____7791; FStar_Syntax_Syntax.vars = uu____7792}, (({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_abs ((b)::[], t2, uu____7795); FStar_Syntax_Syntax.pos = uu____7796; FStar_Syntax_Syntax.vars = uu____7797}, uu____7798))::[])) when (is_qlid tc.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v) -> begin
(aux (FStar_Pervasives_Native.Some ((is_forall tc.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v))) ((b)::out) t2)
end
| (FStar_Pervasives_Native.None, ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (tc); FStar_Syntax_Syntax.pos = uu____7874; FStar_Syntax_Syntax.vars = uu____7875}, (uu____7876)::(({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_abs ((b)::[], t2, uu____7879); FStar_Syntax_Syntax.pos = uu____7880; FStar_Syntax_Syntax.vars = uu____7881}, uu____7882))::[])) when (is_qlid tc.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v) -> begin
(aux (FStar_Pervasives_Native.Some ((is_forall tc.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v))) ((b)::out) t2)
end
| (FStar_Pervasives_Native.Some (b), uu____7970) -> begin
(

let bs = (FStar_List.rev out)
in (

let uu____8004 = (FStar_Syntax_Subst.open_term bs t1)
in (match (uu____8004) with
| (bs1, t2) -> begin
(

let uu____8013 = (patterns t2)
in (match (uu____8013) with
| (pats, body) -> begin
(match (b) with
| true -> begin
FStar_Pervasives_Native.Some (QAll (((bs1), (pats), (body))))
end
| uu____8064 -> begin
FStar_Pervasives_Native.Some (QEx (((bs1), (pats), (body))))
end)
end))
end)))
end
| uu____8075 -> begin
FStar_Pervasives_Native.None
end)))
in (aux FStar_Pervasives_Native.None [] t)))))
in (

let u_connectives = (((FStar_Parser_Const.true_lid), (FStar_Parser_Const.c_true_lid), ((Prims.parse_int "0"))))::(((FStar_Parser_Const.false_lid), (FStar_Parser_Const.c_false_lid), ((Prims.parse_int "0"))))::(((FStar_Parser_Const.and_lid), (FStar_Parser_Const.c_and_lid), ((Prims.parse_int "2"))))::(((FStar_Parser_Const.or_lid), (FStar_Parser_Const.c_or_lid), ((Prims.parse_int "2"))))::[]
in (

let destruct_sq_base_conn = (fun t -> (

let uu____8141 = (un_squash t)
in (FStar_Util.bind_opt uu____8141 (fun t1 -> (

let uu____8157 = (head_and_args' t1)
in (match (uu____8157) with
| (hd1, args) -> begin
(

let uu____8190 = (

let uu____8195 = (

let uu____8196 = (un_uinst hd1)
in uu____8196.FStar_Syntax_Syntax.n)
in ((uu____8195), ((FStar_List.length args))))
in (match (uu____8190) with
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_29) when ((_0_29 = (Prims.parse_int "2")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_and_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.and_lid), (args))))
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_30) when ((_0_30 = (Prims.parse_int "2")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_or_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.or_lid), (args))))
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_31) when ((_0_31 = (Prims.parse_int "2")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_eq2_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.eq2_lid), (args))))
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_32) when ((_0_32 = (Prims.parse_int "3")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_eq2_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.eq2_lid), (args))))
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_33) when ((_0_33 = (Prims.parse_int "2")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_eq3_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.eq3_lid), (args))))
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_34) when ((_0_34 = (Prims.parse_int "4")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_eq3_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.eq3_lid), (args))))
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_35) when ((_0_35 = (Prims.parse_int "0")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_true_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.true_lid), (args))))
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_36) when ((_0_36 = (Prims.parse_int "0")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_false_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.false_lid), (args))))
end
| uu____8279 -> begin
FStar_Pervasives_Native.None
end))
end))))))
in (

let rec destruct_sq_forall = (fun t -> (

let uu____8302 = (un_squash t)
in (FStar_Util.bind_opt uu____8302 (fun t1 -> (

let uu____8317 = (arrow_one t1)
in (match (uu____8317) with
| FStar_Pervasives_Native.Some (b, c) -> begin
(

let uu____8332 = (

let uu____8333 = (is_tot_or_gtot_comp c)
in (not (uu____8333)))
in (match (uu____8332) with
| true -> begin
FStar_Pervasives_Native.None
end
| uu____8336 -> begin
(

let q = (

let uu____8340 = (comp_to_comp_typ_nouniv c)
in uu____8340.FStar_Syntax_Syntax.result_typ)
in (

let uu____8341 = (is_free_in (FStar_Pervasives_Native.fst b) q)
in (match (uu____8341) with
| true -> begin
(

let uu____8344 = (patterns q)
in (match (uu____8344) with
| (pats, q1) -> begin
(FStar_All.pipe_left maybe_collect (FStar_Pervasives_Native.Some (QAll ((((b)::[]), (pats), (q1))))))
end))
end
| uu____8399 -> begin
(

let uu____8400 = (

let uu____8401 = (

let uu____8406 = (

let uu____8409 = (FStar_Syntax_Syntax.as_arg (FStar_Pervasives_Native.fst b).FStar_Syntax_Syntax.sort)
in (

let uu____8410 = (

let uu____8413 = (FStar_Syntax_Syntax.as_arg q)
in (uu____8413)::[])
in (uu____8409)::uu____8410))
in ((FStar_Parser_Const.imp_lid), (uu____8406)))
in BaseConn (uu____8401))
in FStar_Pervasives_Native.Some (uu____8400))
end)))
end))
end
| uu____8416 -> begin
FStar_Pervasives_Native.None
end))))))
and destruct_sq_exists = (fun t -> (

let uu____8424 = (un_squash t)
in (FStar_Util.bind_opt uu____8424 (fun t1 -> (

let uu____8455 = (head_and_args' t1)
in (match (uu____8455) with
| (hd1, args) -> begin
(

let uu____8488 = (

let uu____8501 = (

let uu____8502 = (un_uinst hd1)
in uu____8502.FStar_Syntax_Syntax.n)
in ((uu____8501), (args)))
in (match (uu____8488) with
| (FStar_Syntax_Syntax.Tm_fvar (fv), ((a1, uu____8517))::((a2, uu____8519))::[]) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.dtuple2_lid) -> begin
(

let uu____8554 = (

let uu____8555 = (FStar_Syntax_Subst.compress a2)
in uu____8555.FStar_Syntax_Syntax.n)
in (match (uu____8554) with
| FStar_Syntax_Syntax.Tm_abs ((b)::[], q, uu____8562) -> begin
(

let uu____8589 = (FStar_Syntax_Subst.open_term ((b)::[]) q)
in (match (uu____8589) with
| (bs, q1) -> begin
(

let b1 = (match (bs) with
| (b1)::[] -> begin
b1
end
| uu____8628 -> begin
(failwith "impossible")
end)
in (

let uu____8633 = (patterns q1)
in (match (uu____8633) with
| (pats, q2) -> begin
(FStar_All.pipe_left maybe_collect (FStar_Pervasives_Native.Some (QEx ((((b1)::[]), (pats), (q2))))))
end)))
end))
end
| uu____8700 -> begin
FStar_Pervasives_Native.None
end))
end
| uu____8701 -> begin
FStar_Pervasives_Native.None
end))
end))))))
and maybe_collect = (fun f1 -> (match (f1) with
| FStar_Pervasives_Native.Some (QAll (bs, pats, phi)) -> begin
(

let uu____8722 = (destruct_sq_forall phi)
in (match (uu____8722) with
| FStar_Pervasives_Native.Some (QAll (bs', pats', psi)) -> begin
(FStar_All.pipe_left (fun _0_37 -> FStar_Pervasives_Native.Some (_0_37)) (QAll ((((FStar_List.append bs bs')), ((FStar_List.append pats pats')), (psi)))))
end
| uu____8744 -> begin
f1
end))
end
| FStar_Pervasives_Native.Some (QEx (bs, pats, phi)) -> begin
(

let uu____8750 = (destruct_sq_exists phi)
in (match (uu____8750) with
| FStar_Pervasives_Native.Some (QEx (bs', pats', psi)) -> begin
(FStar_All.pipe_left (fun _0_38 -> FStar_Pervasives_Native.Some (_0_38)) (QEx ((((FStar_List.append bs bs')), ((FStar_List.append pats pats')), (psi)))))
end
| uu____8772 -> begin
f1
end))
end
| uu____8775 -> begin
f1
end))
in (

let phi = (unmeta_monadic f)
in (

let uu____8779 = (destruct_base_conn phi)
in (FStar_Util.catch_opt uu____8779 (fun uu____8784 -> (

let uu____8785 = (destruct_q_conn phi)
in (FStar_Util.catch_opt uu____8785 (fun uu____8790 -> (

let uu____8791 = (destruct_sq_base_conn phi)
in (FStar_Util.catch_opt uu____8791 (fun uu____8796 -> (

let uu____8797 = (destruct_sq_forall phi)
in (FStar_Util.catch_opt uu____8797 (fun uu____8802 -> (

let uu____8803 = (destruct_sq_exists phi)
in (FStar_Util.catch_opt uu____8803 (fun uu____8807 -> FStar_Pervasives_Native.None))))))))))))))))))))))))


let unthunk_lemma_post : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t -> (

let uu____8813 = (

let uu____8814 = (FStar_Syntax_Subst.compress t)
in uu____8814.FStar_Syntax_Syntax.n)
in (match (uu____8813) with
| FStar_Syntax_Syntax.Tm_abs ((b)::[], e, uu____8821) -> begin
(

let uu____8848 = (FStar_Syntax_Subst.open_term ((b)::[]) e)
in (match (uu____8848) with
| (bs, e1) -> begin
(

let b1 = (FStar_List.hd bs)
in (

let uu____8874 = (is_free_in (FStar_Pervasives_Native.fst b1) e1)
in (match (uu____8874) with
| true -> begin
(

let uu____8877 = (

let uu____8886 = (FStar_Syntax_Syntax.as_arg exp_unit)
in (uu____8886)::[])
in (mk_app t uu____8877))
end
| uu____8887 -> begin
e1
end)))
end))
end
| uu____8888 -> begin
(

let uu____8889 = (

let uu____8898 = (FStar_Syntax_Syntax.as_arg exp_unit)
in (uu____8898)::[])
in (mk_app t uu____8889))
end)))


let action_as_lb : FStar_Ident.lident  ->  FStar_Syntax_Syntax.action  ->  FStar_Range.range  ->  FStar_Syntax_Syntax.sigelt = (fun eff_lid a pos -> (

let lb = (

let uu____8909 = (

let uu____8914 = (FStar_Syntax_Syntax.lid_as_fv a.FStar_Syntax_Syntax.action_name FStar_Syntax_Syntax.Delta_equational FStar_Pervasives_Native.None)
in FStar_Util.Inr (uu____8914))
in (

let uu____8915 = (

let uu____8916 = (FStar_Syntax_Syntax.mk_Total a.FStar_Syntax_Syntax.action_typ)
in (arrow a.FStar_Syntax_Syntax.action_params uu____8916))
in (

let uu____8919 = (abs a.FStar_Syntax_Syntax.action_params a.FStar_Syntax_Syntax.action_defn FStar_Pervasives_Native.None)
in (close_univs_and_mk_letbinding FStar_Pervasives_Native.None uu____8909 a.FStar_Syntax_Syntax.action_univs uu____8915 FStar_Parser_Const.effect_Tot_lid uu____8919 [] pos))))
in {FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let (((((false), ((lb)::[]))), ((a.FStar_Syntax_Syntax.action_name)::[]))); FStar_Syntax_Syntax.sigrng = a.FStar_Syntax_Syntax.action_defn.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.sigquals = (FStar_Syntax_Syntax.Visible_default)::(FStar_Syntax_Syntax.Action (eff_lid))::[]; FStar_Syntax_Syntax.sigmeta = FStar_Syntax_Syntax.default_sigmeta; FStar_Syntax_Syntax.sigattrs = []}))


let mk_reify : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t -> (

let reify_ = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify)) FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos)
in (

let uu____8946 = (

let uu____8949 = (

let uu____8950 = (

let uu____8965 = (

let uu____8968 = (FStar_Syntax_Syntax.as_arg t)
in (uu____8968)::[])
in ((reify_), (uu____8965)))
in FStar_Syntax_Syntax.Tm_app (uu____8950))
in (FStar_Syntax_Syntax.mk uu____8949))
in (uu____8946 FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos))))


let rec delta_qualifier : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.delta_depth = (fun t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_delayed (uu____8980) -> begin
(failwith "Impossible")
end
| FStar_Syntax_Syntax.Tm_lazy (i) -> begin
(

let uu____9006 = (unfold_lazy i)
in (delta_qualifier uu____9006))
end
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
fv.FStar_Syntax_Syntax.fv_delta
end
| FStar_Syntax_Syntax.Tm_bvar (uu____9008) -> begin
FStar_Syntax_Syntax.Delta_equational
end
| FStar_Syntax_Syntax.Tm_name (uu____9009) -> begin
FStar_Syntax_Syntax.Delta_equational
end
| FStar_Syntax_Syntax.Tm_match (uu____9010) -> begin
FStar_Syntax_Syntax.Delta_equational
end
| FStar_Syntax_Syntax.Tm_uvar (uu____9033) -> begin
FStar_Syntax_Syntax.Delta_equational
end
| FStar_Syntax_Syntax.Tm_unknown -> begin
FStar_Syntax_Syntax.Delta_equational
end
| FStar_Syntax_Syntax.Tm_type (uu____9050) -> begin
FStar_Syntax_Syntax.Delta_constant
end
| FStar_Syntax_Syntax.Tm_quoted (uu____9051) -> begin
FStar_Syntax_Syntax.Delta_constant
end
| FStar_Syntax_Syntax.Tm_constant (uu____9058) -> begin
FStar_Syntax_Syntax.Delta_constant
end
| FStar_Syntax_Syntax.Tm_arrow (uu____9059) -> begin
FStar_Syntax_Syntax.Delta_constant
end
| FStar_Syntax_Syntax.Tm_uinst (t2, uu____9073) -> begin
(delta_qualifier t2)
end
| FStar_Syntax_Syntax.Tm_refine ({FStar_Syntax_Syntax.ppname = uu____9078; FStar_Syntax_Syntax.index = uu____9079; FStar_Syntax_Syntax.sort = t2}, uu____9081) -> begin
(delta_qualifier t2)
end
| FStar_Syntax_Syntax.Tm_meta (t2, uu____9089) -> begin
(delta_qualifier t2)
end
| FStar_Syntax_Syntax.Tm_ascribed (t2, uu____9095, uu____9096) -> begin
(delta_qualifier t2)
end
| FStar_Syntax_Syntax.Tm_app (t2, uu____9138) -> begin
(delta_qualifier t2)
end
| FStar_Syntax_Syntax.Tm_abs (uu____9159, t2, uu____9161) -> begin
(delta_qualifier t2)
end
| FStar_Syntax_Syntax.Tm_let (uu____9182, t2) -> begin
(delta_qualifier t2)
end)))


let rec incr_delta_depth : FStar_Syntax_Syntax.delta_depth  ->  FStar_Syntax_Syntax.delta_depth = (fun d -> (match (d) with
| FStar_Syntax_Syntax.Delta_equational -> begin
d
end
| FStar_Syntax_Syntax.Delta_constant -> begin
FStar_Syntax_Syntax.Delta_defined_at_level ((Prims.parse_int "1"))
end
| FStar_Syntax_Syntax.Delta_defined_at_level (i) -> begin
FStar_Syntax_Syntax.Delta_defined_at_level ((i + (Prims.parse_int "1")))
end
| FStar_Syntax_Syntax.Delta_abstract (d1) -> begin
(incr_delta_depth d1)
end))


let incr_delta_qualifier : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.delta_depth = (fun t -> (

let uu____9208 = (delta_qualifier t)
in (incr_delta_depth uu____9208)))


let is_unknown : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____9212 = (

let uu____9213 = (FStar_Syntax_Subst.compress t)
in uu____9213.FStar_Syntax_Syntax.n)
in (match (uu____9212) with
| FStar_Syntax_Syntax.Tm_unknown -> begin
true
end
| uu____9216 -> begin
false
end)))


let rec list_elements : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term Prims.list FStar_Pervasives_Native.option = (fun e -> (

let uu____9228 = (

let uu____9243 = (unmeta e)
in (head_and_args uu____9243))
in (match (uu____9228) with
| (head1, args) -> begin
(

let uu____9270 = (

let uu____9283 = (

let uu____9284 = (un_uinst head1)
in uu____9284.FStar_Syntax_Syntax.n)
in ((uu____9283), (args)))
in (match (uu____9270) with
| (FStar_Syntax_Syntax.Tm_fvar (fv), uu____9300) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.nil_lid) -> begin
FStar_Pervasives_Native.Some ([])
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), (uu____9320)::((hd1, uu____9322))::((tl1, uu____9324))::[]) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.cons_lid) -> begin
(

let uu____9371 = (

let uu____9376 = (

let uu____9381 = (list_elements tl1)
in (FStar_Util.must uu____9381))
in (hd1)::uu____9376)
in FStar_Pervasives_Native.Some (uu____9371))
end
| uu____9394 -> begin
FStar_Pervasives_Native.None
end))
end)))


let rec apply_last : 'Auu____9412 . ('Auu____9412  ->  'Auu____9412)  ->  'Auu____9412 Prims.list  ->  'Auu____9412 Prims.list = (fun f l -> (match (l) with
| [] -> begin
(failwith "apply_last: got empty list")
end
| (a)::[] -> begin
(

let uu____9435 = (f a)
in (uu____9435)::[])
end
| (x)::xs -> begin
(

let uu____9440 = (apply_last f xs)
in (x)::uu____9440)
end))


let dm4f_lid : FStar_Syntax_Syntax.eff_decl  ->  Prims.string  ->  FStar_Ident.lident = (fun ed name -> (

let p = (FStar_Ident.path_of_lid ed.FStar_Syntax_Syntax.mname)
in (

let p' = (apply_last (fun s -> (Prims.strcat "_dm4f_" (Prims.strcat s (Prims.strcat "_" name)))) p)
in (FStar_Ident.lid_of_path p' FStar_Range.dummyRange))))


let rec mk_list : FStar_Syntax_Syntax.term  ->  FStar_Range.range  ->  FStar_Syntax_Syntax.term Prims.list  ->  FStar_Syntax_Syntax.term = (fun typ rng l -> (

let ctor = (fun l1 -> (

let uu____9476 = (

let uu____9479 = (

let uu____9480 = (FStar_Syntax_Syntax.lid_as_fv l1 FStar_Syntax_Syntax.Delta_constant (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)))
in FStar_Syntax_Syntax.Tm_fvar (uu____9480))
in (FStar_Syntax_Syntax.mk uu____9479))
in (uu____9476 FStar_Pervasives_Native.None rng)))
in (

let cons1 = (fun args pos -> (

let uu____9493 = (

let uu____9494 = (

let uu____9495 = (ctor FStar_Parser_Const.cons_lid)
in (FStar_Syntax_Syntax.mk_Tm_uinst uu____9495 ((FStar_Syntax_Syntax.U_zero)::[])))
in (FStar_Syntax_Syntax.mk_Tm_app uu____9494 args))
in (uu____9493 FStar_Pervasives_Native.None pos)))
in (

let nil = (fun args pos -> (

let uu____9507 = (

let uu____9508 = (

let uu____9509 = (ctor FStar_Parser_Const.nil_lid)
in (FStar_Syntax_Syntax.mk_Tm_uinst uu____9509 ((FStar_Syntax_Syntax.U_zero)::[])))
in (FStar_Syntax_Syntax.mk_Tm_app uu____9508 args))
in (uu____9507 FStar_Pervasives_Native.None pos)))
in (

let uu____9512 = (

let uu____9513 = (

let uu____9514 = (FStar_Syntax_Syntax.iarg typ)
in (uu____9514)::[])
in (nil uu____9513 rng))
in (FStar_List.fold_right (fun t a -> (

let uu____9520 = (

let uu____9521 = (FStar_Syntax_Syntax.iarg typ)
in (

let uu____9522 = (

let uu____9525 = (FStar_Syntax_Syntax.as_arg t)
in (

let uu____9526 = (

let uu____9529 = (FStar_Syntax_Syntax.as_arg a)
in (uu____9529)::[])
in (uu____9525)::uu____9526))
in (uu____9521)::uu____9522))
in (cons1 uu____9520 t.FStar_Syntax_Syntax.pos))) l uu____9512))))))


let uvar_from_id : Prims.int  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun id1 t -> (

let uu____9538 = (

let uu____9541 = (

let uu____9542 = (

let uu____9559 = (FStar_Syntax_Unionfind.from_id id1)
in ((uu____9559), (t)))
in FStar_Syntax_Syntax.Tm_uvar (uu____9542))
in (FStar_Syntax_Syntax.mk uu____9541))
in (uu____9538 FStar_Pervasives_Native.None FStar_Range.dummyRange)))


let rec eqlist : 'a . ('a  ->  'a  ->  Prims.bool)  ->  'a Prims.list  ->  'a Prims.list  ->  Prims.bool = (fun eq1 xs ys -> (match (((xs), (ys))) with
| ([], []) -> begin
true
end
| ((x)::xs1, (y)::ys1) -> begin
((eq1 x y) && (eqlist eq1 xs1 ys1))
end
| uu____9619 -> begin
false
end))


let eqsum : 'a 'b . ('a  ->  'a  ->  Prims.bool)  ->  ('b  ->  'b  ->  Prims.bool)  ->  ('a, 'b) FStar_Util.either  ->  ('a, 'b) FStar_Util.either  ->  Prims.bool = (fun e1 e2 x y -> (match (((x), (y))) with
| (FStar_Util.Inl (x1), FStar_Util.Inl (y1)) -> begin
(e1 x1 y1)
end
| (FStar_Util.Inr (x1), FStar_Util.Inr (y1)) -> begin
(e2 x1 y1)
end
| uu____9716 -> begin
false
end))


let eqprod : 'a 'b . ('a  ->  'a  ->  Prims.bool)  ->  ('b  ->  'b  ->  Prims.bool)  ->  ('a * 'b)  ->  ('a * 'b)  ->  Prims.bool = (fun e1 e2 x y -> (match (((x), (y))) with
| ((x1, x2), (y1, y2)) -> begin
((e1 x1 y1) && (e2 x2 y2))
end))


let eqopt : 'a . ('a  ->  'a  ->  Prims.bool)  ->  'a FStar_Pervasives_Native.option  ->  'a FStar_Pervasives_Native.option  ->  Prims.bool = (fun e x y -> (match (((x), (y))) with
| (FStar_Pervasives_Native.Some (x1), FStar_Pervasives_Native.Some (y1)) -> begin
(e x1 y1)
end
| uu____9854 -> begin
false
end))


let debug_term_eq : Prims.bool FStar_ST.ref = (FStar_Util.mk_ref false)


let check : Prims.string  ->  Prims.bool  ->  Prims.bool = (fun msg cond -> (match (cond) with
| true -> begin
true
end
| uu____9906 -> begin
((

let uu____9908 = (FStar_ST.op_Bang debug_term_eq)
in (match (uu____9908) with
| true -> begin
(FStar_Util.print1 ">>> term_eq failing: %s\n" msg)
end
| uu____9934 -> begin
()
end));
false;
)
end))


let fail : Prims.string  ->  Prims.bool = (fun msg -> (check msg false))


let rec term_eq_dbg : Prims.bool  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun dbg t1 t2 -> (

let t11 = (

let uu____10046 = (unmeta_safe t1)
in (canon_app uu____10046))
in (

let t21 = (

let uu____10050 = (unmeta_safe t2)
in (canon_app uu____10050))
in (

let uu____10051 = (

let uu____10056 = (

let uu____10057 = (

let uu____10060 = (un_uinst t11)
in (FStar_Syntax_Subst.compress uu____10060))
in uu____10057.FStar_Syntax_Syntax.n)
in (

let uu____10061 = (

let uu____10062 = (

let uu____10065 = (un_uinst t21)
in (FStar_Syntax_Subst.compress uu____10065))
in uu____10062.FStar_Syntax_Syntax.n)
in ((uu____10056), (uu____10061))))
in (match (uu____10051) with
| (FStar_Syntax_Syntax.Tm_uinst (uu____10066), uu____10067) -> begin
(failwith "term_eq: impossible, should have been removed")
end
| (uu____10074, FStar_Syntax_Syntax.Tm_uinst (uu____10075)) -> begin
(failwith "term_eq: impossible, should have been removed")
end
| (FStar_Syntax_Syntax.Tm_delayed (uu____10082), uu____10083) -> begin
(failwith "term_eq: impossible, should have been removed")
end
| (uu____10108, FStar_Syntax_Syntax.Tm_delayed (uu____10109)) -> begin
(failwith "term_eq: impossible, should have been removed")
end
| (FStar_Syntax_Syntax.Tm_ascribed (uu____10134), uu____10135) -> begin
(failwith "term_eq: impossible, should have been removed")
end
| (uu____10162, FStar_Syntax_Syntax.Tm_ascribed (uu____10163)) -> begin
(failwith "term_eq: impossible, should have been removed")
end
| (FStar_Syntax_Syntax.Tm_bvar (x), FStar_Syntax_Syntax.Tm_bvar (y)) -> begin
(check "bvar" (Prims.op_Equality x.FStar_Syntax_Syntax.index y.FStar_Syntax_Syntax.index))
end
| (FStar_Syntax_Syntax.Tm_name (x), FStar_Syntax_Syntax.Tm_name (y)) -> begin
(check "name" (Prims.op_Equality x.FStar_Syntax_Syntax.index y.FStar_Syntax_Syntax.index))
end
| (FStar_Syntax_Syntax.Tm_fvar (x), FStar_Syntax_Syntax.Tm_fvar (y)) -> begin
(

let uu____10196 = (FStar_Syntax_Syntax.fv_eq x y)
in (check "fvar" uu____10196))
end
| (FStar_Syntax_Syntax.Tm_constant (c1), FStar_Syntax_Syntax.Tm_constant (c2)) -> begin
(

let uu____10199 = (FStar_Const.eq_const c1 c2)
in (check "const" uu____10199))
end
| (FStar_Syntax_Syntax.Tm_type (uu____10200), FStar_Syntax_Syntax.Tm_type (uu____10201)) -> begin
true
end
| (FStar_Syntax_Syntax.Tm_abs (b1, t12, k1), FStar_Syntax_Syntax.Tm_abs (b2, t22, k2)) -> begin
((

let uu____10250 = (eqlist (binder_eq_dbg dbg) b1 b2)
in (check "abs binders" uu____10250)) && (

let uu____10256 = (term_eq_dbg dbg t12 t22)
in (check "abs bodies" uu____10256)))
end
| (FStar_Syntax_Syntax.Tm_arrow (b1, c1), FStar_Syntax_Syntax.Tm_arrow (b2, c2)) -> begin
((

let uu____10295 = (eqlist (binder_eq_dbg dbg) b1 b2)
in (check "arrow binders" uu____10295)) && (

let uu____10301 = (comp_eq_dbg dbg c1 c2)
in (check "arrow comp" uu____10301)))
end
| (FStar_Syntax_Syntax.Tm_refine (b1, t12), FStar_Syntax_Syntax.Tm_refine (b2, t22)) -> begin
((check "refine bv" (Prims.op_Equality b1.FStar_Syntax_Syntax.index b2.FStar_Syntax_Syntax.index)) && (

let uu____10315 = (term_eq_dbg dbg t12 t22)
in (check "refine formula" uu____10315)))
end
| (FStar_Syntax_Syntax.Tm_app (f1, a1), FStar_Syntax_Syntax.Tm_app (f2, a2)) -> begin
((

let uu____10362 = (term_eq_dbg dbg f1 f2)
in (check "app head" uu____10362)) && (

let uu____10364 = (eqlist (arg_eq_dbg dbg) a1 a2)
in (check "app args" uu____10364)))
end
| (FStar_Syntax_Syntax.Tm_match (t12, bs1), FStar_Syntax_Syntax.Tm_match (t22, bs2)) -> begin
((

let uu____10449 = (term_eq_dbg dbg t12 t22)
in (check "match head" uu____10449)) && (

let uu____10451 = (eqlist (branch_eq_dbg dbg) bs1 bs2)
in (check "match branches" uu____10451)))
end
| (FStar_Syntax_Syntax.Tm_lazy (uu____10466), uu____10467) -> begin
(

let uu____10468 = (

let uu____10469 = (unlazy t11)
in (term_eq_dbg dbg uu____10469 t21))
in (check "lazy_l" uu____10468))
end
| (uu____10470, FStar_Syntax_Syntax.Tm_lazy (uu____10471)) -> begin
(

let uu____10472 = (

let uu____10473 = (unlazy t21)
in (term_eq_dbg dbg t11 uu____10473))
in (check "lazy_r" uu____10472))
end
| (FStar_Syntax_Syntax.Tm_let ((b1, lbs1), t12), FStar_Syntax_Syntax.Tm_let ((b2, lbs2), t22)) -> begin
(((check "let flag" (Prims.op_Equality b1 b2)) && (

let uu____10509 = (eqlist (letbinding_eq_dbg dbg) lbs1 lbs2)
in (check "let lbs" uu____10509))) && (

let uu____10511 = (term_eq_dbg dbg t12 t22)
in (check "let body" uu____10511)))
end
| (FStar_Syntax_Syntax.Tm_uvar (u1, uu____10513), FStar_Syntax_Syntax.Tm_uvar (u2, uu____10515)) -> begin
(check "uvar" (Prims.op_Equality u1 u2))
end
| (FStar_Syntax_Syntax.Tm_quoted (qt1, qi1), FStar_Syntax_Syntax.Tm_quoted (qt2, qi2)) -> begin
((check "tm_quoted qi" (Prims.op_Equality qi1 qi2)) && (

let uu____10587 = (term_eq_dbg dbg qt1 qt2)
in (check "tm_quoted payload" uu____10587)))
end
| (FStar_Syntax_Syntax.Tm_meta (t12, m1), FStar_Syntax_Syntax.Tm_meta (t22, m2)) -> begin
(match (((m1), (m2))) with
| (FStar_Syntax_Syntax.Meta_monadic (n1, ty1), FStar_Syntax_Syntax.Meta_monadic (n2, ty2)) -> begin
((check "meta_monadic lid" (FStar_Ident.lid_equals n1 n2)) && (

let uu____10613 = (term_eq_dbg dbg ty1 ty2)
in (check "meta_monadic type" uu____10613)))
end
| (FStar_Syntax_Syntax.Meta_monadic_lift (s1, t13, ty1), FStar_Syntax_Syntax.Meta_monadic_lift (s2, t23, ty2)) -> begin
(((check "meta_monadic_lift src" (FStar_Ident.lid_equals s1 s2)) && (check "meta_monadic_lift tgt" (FStar_Ident.lid_equals t13 t23))) && (

let uu____10629 = (term_eq_dbg dbg ty1 ty2)
in (check "meta_monadic_lift type" uu____10629)))
end
| uu____10630 -> begin
(fail "metas")
end)
end
| (FStar_Syntax_Syntax.Tm_unknown, uu____10635) -> begin
(fail "unk")
end
| (uu____10636, FStar_Syntax_Syntax.Tm_unknown) -> begin
(fail "unk")
end
| (FStar_Syntax_Syntax.Tm_bvar (uu____10637), uu____10638) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_name (uu____10639), uu____10640) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_fvar (uu____10641), uu____10642) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_constant (uu____10643), uu____10644) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_type (uu____10645), uu____10646) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_abs (uu____10647), uu____10648) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_arrow (uu____10665), uu____10666) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_refine (uu____10679), uu____10680) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_app (uu____10687), uu____10688) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_match (uu____10703), uu____10704) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_let (uu____10727), uu____10728) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_uvar (uu____10741), uu____10742) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_meta (uu____10759), uu____10760) -> begin
(fail "bottom")
end
| (uu____10767, FStar_Syntax_Syntax.Tm_bvar (uu____10768)) -> begin
(fail "bottom")
end
| (uu____10769, FStar_Syntax_Syntax.Tm_name (uu____10770)) -> begin
(fail "bottom")
end
| (uu____10771, FStar_Syntax_Syntax.Tm_fvar (uu____10772)) -> begin
(fail "bottom")
end
| (uu____10773, FStar_Syntax_Syntax.Tm_constant (uu____10774)) -> begin
(fail "bottom")
end
| (uu____10775, FStar_Syntax_Syntax.Tm_type (uu____10776)) -> begin
(fail "bottom")
end
| (uu____10777, FStar_Syntax_Syntax.Tm_abs (uu____10778)) -> begin
(fail "bottom")
end
| (uu____10795, FStar_Syntax_Syntax.Tm_arrow (uu____10796)) -> begin
(fail "bottom")
end
| (uu____10809, FStar_Syntax_Syntax.Tm_refine (uu____10810)) -> begin
(fail "bottom")
end
| (uu____10817, FStar_Syntax_Syntax.Tm_app (uu____10818)) -> begin
(fail "bottom")
end
| (uu____10833, FStar_Syntax_Syntax.Tm_match (uu____10834)) -> begin
(fail "bottom")
end
| (uu____10857, FStar_Syntax_Syntax.Tm_let (uu____10858)) -> begin
(fail "bottom")
end
| (uu____10871, FStar_Syntax_Syntax.Tm_uvar (uu____10872)) -> begin
(fail "bottom")
end
| (uu____10889, FStar_Syntax_Syntax.Tm_meta (uu____10890)) -> begin
(fail "bottom")
end)))))
and arg_eq_dbg : Prims.bool  ->  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual)  ->  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual)  ->  Prims.bool = (fun dbg a1 a2 -> (eqprod (fun t1 t2 -> (

let uu____10917 = (term_eq_dbg dbg t1 t2)
in (check "arg tm" uu____10917))) (fun q1 q2 -> (check "arg qual" (Prims.op_Equality q1 q2))) a1 a2))
and binder_eq_dbg : Prims.bool  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.aqual)  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.aqual)  ->  Prims.bool = (fun dbg b1 b2 -> (eqprod (fun b11 b21 -> (

let uu____10938 = (term_eq_dbg dbg b11.FStar_Syntax_Syntax.sort b21.FStar_Syntax_Syntax.sort)
in (check "binder sort" uu____10938))) (fun q1 q2 -> (check "binder qual" (Prims.op_Equality q1 q2))) b1 b2))
and lcomp_eq_dbg : FStar_Syntax_Syntax.lcomp  ->  FStar_Syntax_Syntax.lcomp  ->  Prims.bool = (fun c1 c2 -> (fail "lcomp"))
and residual_eq_dbg : FStar_Syntax_Syntax.residual_comp  ->  FStar_Syntax_Syntax.residual_comp  ->  Prims.bool = (fun r1 r2 -> (fail "residual"))
and comp_eq_dbg : Prims.bool  ->  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun dbg c1 c2 -> (

let c11 = (comp_to_comp_typ_nouniv c1)
in (

let c21 = (comp_to_comp_typ_nouniv c2)
in (((check "comp eff" (FStar_Ident.lid_equals c11.FStar_Syntax_Syntax.effect_name c21.FStar_Syntax_Syntax.effect_name)) && (

let uu____10957 = (term_eq_dbg dbg c11.FStar_Syntax_Syntax.result_typ c21.FStar_Syntax_Syntax.result_typ)
in (check "comp result typ" uu____10957))) && true))))
and eq_flags_dbg : Prims.bool  ->  FStar_Syntax_Syntax.cflags  ->  FStar_Syntax_Syntax.cflags  ->  Prims.bool = (fun dbg f1 f2 -> true)
and branch_eq_dbg : Prims.bool  ->  (FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)  ->  (FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)  ->  Prims.bool = (fun dbg uu____10962 uu____10963 -> (match (((uu____10962), (uu____10963))) with
| ((p1, w1, t1), (p2, w2, t2)) -> begin
(((

let uu____11088 = (FStar_Syntax_Syntax.eq_pat p1 p2)
in (check "branch pat" uu____11088)) && (

let uu____11090 = (term_eq_dbg dbg t1 t2)
in (check "branch body" uu____11090))) && (

let uu____11092 = (match (((w1), (w2))) with
| (FStar_Pervasives_Native.Some (x), FStar_Pervasives_Native.Some (y)) -> begin
(term_eq_dbg dbg x y)
end
| (FStar_Pervasives_Native.None, FStar_Pervasives_Native.None) -> begin
true
end
| uu____11131 -> begin
false
end)
in (check "branch when" uu____11092)))
end))
and letbinding_eq_dbg : Prims.bool  ->  FStar_Syntax_Syntax.letbinding  ->  FStar_Syntax_Syntax.letbinding  ->  Prims.bool = (fun dbg lb1 lb2 -> (((

let uu____11149 = (eqsum (fun bv1 bv2 -> true) FStar_Syntax_Syntax.fv_eq lb1.FStar_Syntax_Syntax.lbname lb2.FStar_Syntax_Syntax.lbname)
in (check "lb bv" uu____11149)) && (

let uu____11155 = (term_eq_dbg dbg lb1.FStar_Syntax_Syntax.lbtyp lb2.FStar_Syntax_Syntax.lbtyp)
in (check "lb typ" uu____11155))) && (

let uu____11157 = (term_eq_dbg dbg lb1.FStar_Syntax_Syntax.lbdef lb2.FStar_Syntax_Syntax.lbdef)
in (check "lb def" uu____11157))))


let term_eq : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t1 t2 -> (

let r = (

let uu____11165 = (FStar_ST.op_Bang debug_term_eq)
in (term_eq_dbg uu____11165 t1 t2))
in ((FStar_ST.op_Colon_Equals debug_term_eq false);
r;
)))


let rec bottom_fold : (FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term)  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun f t -> (

let ff = (bottom_fold f)
in (

let tn = (

let uu____11232 = (FStar_Syntax_Subst.compress t)
in uu____11232.FStar_Syntax_Syntax.n)
in (

let tn1 = (match (tn) with
| FStar_Syntax_Syntax.Tm_app (f1, args) -> begin
(

let uu____11258 = (

let uu____11273 = (ff f1)
in (

let uu____11274 = (FStar_List.map (fun uu____11293 -> (match (uu____11293) with
| (a, q) -> begin
(

let uu____11304 = (ff a)
in ((uu____11304), (q)))
end)) args)
in ((uu____11273), (uu____11274))))
in FStar_Syntax_Syntax.Tm_app (uu____11258))
end
| FStar_Syntax_Syntax.Tm_abs (bs, t1, k) -> begin
(

let uu____11334 = (FStar_Syntax_Subst.open_term bs t1)
in (match (uu____11334) with
| (bs1, t') -> begin
(

let t'' = (ff t')
in (

let uu____11342 = (

let uu____11359 = (FStar_Syntax_Subst.close bs1 t'')
in ((bs1), (uu____11359), (k)))
in FStar_Syntax_Syntax.Tm_abs (uu____11342)))
end))
end
| FStar_Syntax_Syntax.Tm_arrow (bs, k) -> begin
tn
end
| FStar_Syntax_Syntax.Tm_uinst (t1, us) -> begin
(

let uu____11386 = (

let uu____11393 = (ff t1)
in ((uu____11393), (us)))
in FStar_Syntax_Syntax.Tm_uinst (uu____11386))
end
| uu____11394 -> begin
tn
end)
in (f (

let uu___61_11397 = t
in {FStar_Syntax_Syntax.n = tn1; FStar_Syntax_Syntax.pos = uu___61_11397.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___61_11397.FStar_Syntax_Syntax.vars}))))))


let rec sizeof : FStar_Syntax_Syntax.term  ->  Prims.int = (fun t -> (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_delayed (uu____11401) -> begin
(

let uu____11426 = (

let uu____11427 = (FStar_Syntax_Subst.compress t)
in (sizeof uu____11427))
in ((Prims.parse_int "1") + uu____11426))
end
| FStar_Syntax_Syntax.Tm_bvar (bv) -> begin
(

let uu____11429 = (sizeof bv.FStar_Syntax_Syntax.sort)
in ((Prims.parse_int "1") + uu____11429))
end
| FStar_Syntax_Syntax.Tm_name (bv) -> begin
(

let uu____11431 = (sizeof bv.FStar_Syntax_Syntax.sort)
in ((Prims.parse_int "1") + uu____11431))
end
| FStar_Syntax_Syntax.Tm_uinst (t1, us) -> begin
(

let uu____11438 = (sizeof t1)
in ((FStar_List.length us) + uu____11438))
end
| FStar_Syntax_Syntax.Tm_abs (bs, t1, uu____11441) -> begin
(

let uu____11462 = (sizeof t1)
in (

let uu____11463 = (FStar_List.fold_left (fun acc uu____11474 -> (match (uu____11474) with
| (bv, uu____11480) -> begin
(

let uu____11481 = (sizeof bv.FStar_Syntax_Syntax.sort)
in (acc + uu____11481))
end)) (Prims.parse_int "0") bs)
in (uu____11462 + uu____11463)))
end
| FStar_Syntax_Syntax.Tm_app (hd1, args) -> begin
(

let uu____11504 = (sizeof hd1)
in (

let uu____11505 = (FStar_List.fold_left (fun acc uu____11516 -> (match (uu____11516) with
| (arg, uu____11522) -> begin
(

let uu____11523 = (sizeof arg)
in (acc + uu____11523))
end)) (Prims.parse_int "0") args)
in (uu____11504 + uu____11505)))
end
| uu____11524 -> begin
(Prims.parse_int "1")
end))


let is_fvar : FStar_Ident.lident  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun lid t -> (

let uu____11531 = (

let uu____11532 = (un_uinst t)
in uu____11532.FStar_Syntax_Syntax.n)
in (match (uu____11531) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv lid)
end
| uu____11536 -> begin
false
end)))


let is_synth_by_tactic : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (is_fvar FStar_Parser_Const.synth_lid t))


let has_attribute : FStar_Syntax_Syntax.attribute Prims.list  ->  FStar_Ident.lident  ->  Prims.bool = (fun attrs attr -> (FStar_Util.for_some (is_fvar attr) attrs))


let process_pragma : FStar_Syntax_Syntax.pragma  ->  FStar_Range.range  ->  Prims.unit = (fun p r -> (

let set_options1 = (fun t s -> (

let uu____11563 = (FStar_Options.set_options t s)
in (match (uu____11563) with
| FStar_Getopt.Success -> begin
()
end
| FStar_Getopt.Help -> begin
(FStar_Errors.raise_error ((FStar_Errors.Fatal_FailToProcessPragma), ("Failed to process pragma: use \'fstar --help\' to see which options are available")) r)
end
| FStar_Getopt.Error (s1) -> begin
(FStar_Errors.raise_error ((FStar_Errors.Fatal_FailToProcessPragma), ((Prims.strcat "Failed to process pragma: " s1))) r)
end)))
in (match (p) with
| FStar_Syntax_Syntax.LightOff -> begin
(match ((Prims.op_Equality p FStar_Syntax_Syntax.LightOff)) with
| true -> begin
(FStar_Options.set_ml_ish ())
end
| uu____11565 -> begin
()
end)
end
| FStar_Syntax_Syntax.SetOptions (o) -> begin
(set_options1 FStar_Options.Set o)
end
| FStar_Syntax_Syntax.ResetOptions (sopt) -> begin
((

let uu____11571 = (FStar_Options.restore_cmd_line_options false)
in (FStar_All.pipe_right uu____11571 FStar_Pervasives.ignore));
(match (sopt) with
| FStar_Pervasives_Native.None -> begin
()
end
| FStar_Pervasives_Native.Some (s) -> begin
(set_options1 FStar_Options.Reset s)
end);
)
end)))




