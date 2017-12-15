
open Prims
open FStar_Pervasives

type local_binding =
(FStar_Ident.ident * FStar_Syntax_Syntax.bv * Prims.bool)


type rec_binding =
(FStar_Ident.ident * FStar_Ident.lid * FStar_Syntax_Syntax.delta_depth)


type module_abbrev =
(FStar_Ident.ident * FStar_Ident.lident)

type open_kind =
| Open_module
| Open_namespace


let uu___is_Open_module : open_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Open_module -> begin
true
end
| uu____21 -> begin
false
end))


let uu___is_Open_namespace : open_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Open_namespace -> begin
true
end
| uu____26 -> begin
false
end))


type open_module_or_namespace =
(FStar_Ident.lident * open_kind)

type record_or_dc =
{typename : FStar_Ident.lident; constrname : FStar_Ident.ident; parms : FStar_Syntax_Syntax.binders; fields : (FStar_Ident.ident * FStar_Syntax_Syntax.typ) Prims.list; is_private_or_abstract : Prims.bool; is_record : Prims.bool}


let __proj__Mkrecord_or_dc__item__typename : record_or_dc  ->  FStar_Ident.lident = (fun projectee -> (match (projectee) with
| {typename = __fname__typename; constrname = __fname__constrname; parms = __fname__parms; fields = __fname__fields; is_private_or_abstract = __fname__is_private_or_abstract; is_record = __fname__is_record} -> begin
__fname__typename
end))


let __proj__Mkrecord_or_dc__item__constrname : record_or_dc  ->  FStar_Ident.ident = (fun projectee -> (match (projectee) with
| {typename = __fname__typename; constrname = __fname__constrname; parms = __fname__parms; fields = __fname__fields; is_private_or_abstract = __fname__is_private_or_abstract; is_record = __fname__is_record} -> begin
__fname__constrname
end))


let __proj__Mkrecord_or_dc__item__parms : record_or_dc  ->  FStar_Syntax_Syntax.binders = (fun projectee -> (match (projectee) with
| {typename = __fname__typename; constrname = __fname__constrname; parms = __fname__parms; fields = __fname__fields; is_private_or_abstract = __fname__is_private_or_abstract; is_record = __fname__is_record} -> begin
__fname__parms
end))


let __proj__Mkrecord_or_dc__item__fields : record_or_dc  ->  (FStar_Ident.ident * FStar_Syntax_Syntax.typ) Prims.list = (fun projectee -> (match (projectee) with
| {typename = __fname__typename; constrname = __fname__constrname; parms = __fname__parms; fields = __fname__fields; is_private_or_abstract = __fname__is_private_or_abstract; is_record = __fname__is_record} -> begin
__fname__fields
end))


let __proj__Mkrecord_or_dc__item__is_private_or_abstract : record_or_dc  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {typename = __fname__typename; constrname = __fname__constrname; parms = __fname__parms; fields = __fname__fields; is_private_or_abstract = __fname__is_private_or_abstract; is_record = __fname__is_record} -> begin
__fname__is_private_or_abstract
end))


let __proj__Mkrecord_or_dc__item__is_record : record_or_dc  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {typename = __fname__typename; constrname = __fname__constrname; parms = __fname__parms; fields = __fname__fields; is_private_or_abstract = __fname__is_private_or_abstract; is_record = __fname__is_record} -> begin
__fname__is_record
end))

type scope_mod =
| Local_binding of local_binding
| Rec_binding of rec_binding
| Module_abbrev of module_abbrev
| Open_module_or_namespace of open_module_or_namespace
| Top_level_def of FStar_Ident.ident
| Record_or_dc of record_or_dc


let uu___is_Local_binding : scope_mod  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Local_binding (_0) -> begin
true
end
| uu____198 -> begin
false
end))


let __proj__Local_binding__item___0 : scope_mod  ->  local_binding = (fun projectee -> (match (projectee) with
| Local_binding (_0) -> begin
_0
end))


let uu___is_Rec_binding : scope_mod  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Rec_binding (_0) -> begin
true
end
| uu____212 -> begin
false
end))


let __proj__Rec_binding__item___0 : scope_mod  ->  rec_binding = (fun projectee -> (match (projectee) with
| Rec_binding (_0) -> begin
_0
end))


let uu___is_Module_abbrev : scope_mod  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Module_abbrev (_0) -> begin
true
end
| uu____226 -> begin
false
end))


let __proj__Module_abbrev__item___0 : scope_mod  ->  module_abbrev = (fun projectee -> (match (projectee) with
| Module_abbrev (_0) -> begin
_0
end))


let uu___is_Open_module_or_namespace : scope_mod  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Open_module_or_namespace (_0) -> begin
true
end
| uu____240 -> begin
false
end))


let __proj__Open_module_or_namespace__item___0 : scope_mod  ->  open_module_or_namespace = (fun projectee -> (match (projectee) with
| Open_module_or_namespace (_0) -> begin
_0
end))


let uu___is_Top_level_def : scope_mod  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Top_level_def (_0) -> begin
true
end
| uu____254 -> begin
false
end))


let __proj__Top_level_def__item___0 : scope_mod  ->  FStar_Ident.ident = (fun projectee -> (match (projectee) with
| Top_level_def (_0) -> begin
_0
end))


let uu___is_Record_or_dc : scope_mod  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Record_or_dc (_0) -> begin
true
end
| uu____268 -> begin
false
end))


let __proj__Record_or_dc__item___0 : scope_mod  ->  record_or_dc = (fun projectee -> (match (projectee) with
| Record_or_dc (_0) -> begin
_0
end))


type string_set =
Prims.string FStar_Util.set

type exported_id_kind =
| Exported_id_term_type
| Exported_id_field


let uu___is_Exported_id_term_type : exported_id_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Exported_id_term_type -> begin
true
end
| uu____283 -> begin
false
end))


let uu___is_Exported_id_field : exported_id_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Exported_id_field -> begin
true
end
| uu____288 -> begin
false
end))


type exported_id_set =
exported_id_kind  ->  string_set FStar_ST.ref

type env =
{curmodule : FStar_Ident.lident FStar_Pervasives_Native.option; curmonad : FStar_Ident.ident FStar_Pervasives_Native.option; modules : (FStar_Ident.lident * FStar_Syntax_Syntax.modul) Prims.list; scope_mods : scope_mod Prims.list; exported_ids : exported_id_set FStar_Util.smap; trans_exported_ids : exported_id_set FStar_Util.smap; includes : FStar_Ident.lident Prims.list FStar_ST.ref FStar_Util.smap; sigaccum : FStar_Syntax_Syntax.sigelts; sigmap : (FStar_Syntax_Syntax.sigelt * Prims.bool) FStar_Util.smap; iface : Prims.bool; admitted_iface : Prims.bool; expect_typ : Prims.bool; docs : FStar_Parser_AST.fsdoc FStar_Util.smap; remaining_iface_decls : (FStar_Ident.lident * FStar_Parser_AST.decl Prims.list) Prims.list; syntax_only : Prims.bool}


let __proj__Mkenv__item__curmodule : env  ->  FStar_Ident.lident FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__curmodule
end))


let __proj__Mkenv__item__curmonad : env  ->  FStar_Ident.ident FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__curmonad
end))


let __proj__Mkenv__item__modules : env  ->  (FStar_Ident.lident * FStar_Syntax_Syntax.modul) Prims.list = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__modules
end))


let __proj__Mkenv__item__scope_mods : env  ->  scope_mod Prims.list = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__scope_mods
end))


let __proj__Mkenv__item__exported_ids : env  ->  exported_id_set FStar_Util.smap = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__exported_ids
end))


let __proj__Mkenv__item__trans_exported_ids : env  ->  exported_id_set FStar_Util.smap = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__trans_exported_ids
end))


let __proj__Mkenv__item__includes : env  ->  FStar_Ident.lident Prims.list FStar_ST.ref FStar_Util.smap = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__includes
end))


let __proj__Mkenv__item__sigaccum : env  ->  FStar_Syntax_Syntax.sigelts = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__sigaccum
end))


let __proj__Mkenv__item__sigmap : env  ->  (FStar_Syntax_Syntax.sigelt * Prims.bool) FStar_Util.smap = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__sigmap
end))


let __proj__Mkenv__item__iface : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__iface
end))


let __proj__Mkenv__item__admitted_iface : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__admitted_iface
end))


let __proj__Mkenv__item__expect_typ : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__expect_typ
end))


let __proj__Mkenv__item__docs : env  ->  FStar_Parser_AST.fsdoc FStar_Util.smap = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__docs
end))


let __proj__Mkenv__item__remaining_iface_decls : env  ->  (FStar_Ident.lident * FStar_Parser_AST.decl Prims.list) Prims.list = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__remaining_iface_decls
end))


let __proj__Mkenv__item__syntax_only : env  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {curmodule = __fname__curmodule; curmonad = __fname__curmonad; modules = __fname__modules; scope_mods = __fname__scope_mods; exported_ids = __fname__exported_ids; trans_exported_ids = __fname__trans_exported_ids; includes = __fname__includes; sigaccum = __fname__sigaccum; sigmap = __fname__sigmap; iface = __fname__iface; admitted_iface = __fname__admitted_iface; expect_typ = __fname__expect_typ; docs = __fname__docs; remaining_iface_decls = __fname__remaining_iface_decls; syntax_only = __fname__syntax_only} -> begin
__fname__syntax_only
end))

type foundname =
| Term_name of (FStar_Syntax_Syntax.typ * Prims.bool)
| Eff_name of (FStar_Syntax_Syntax.sigelt * FStar_Ident.lident)


let uu___is_Term_name : foundname  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Term_name (_0) -> begin
true
end
| uu____1367 -> begin
false
end))


let __proj__Term_name__item___0 : foundname  ->  (FStar_Syntax_Syntax.typ * Prims.bool) = (fun projectee -> (match (projectee) with
| Term_name (_0) -> begin
_0
end))


let uu___is_Eff_name : foundname  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Eff_name (_0) -> begin
true
end
| uu____1397 -> begin
false
end))


let __proj__Eff_name__item___0 : foundname  ->  (FStar_Syntax_Syntax.sigelt * FStar_Ident.lident) = (fun projectee -> (match (projectee) with
| Eff_name (_0) -> begin
_0
end))


let set_iface : env  ->  Prims.bool  ->  env = (fun env b -> (

let uu___182_1426 = env
in {curmodule = uu___182_1426.curmodule; curmonad = uu___182_1426.curmonad; modules = uu___182_1426.modules; scope_mods = uu___182_1426.scope_mods; exported_ids = uu___182_1426.exported_ids; trans_exported_ids = uu___182_1426.trans_exported_ids; includes = uu___182_1426.includes; sigaccum = uu___182_1426.sigaccum; sigmap = uu___182_1426.sigmap; iface = b; admitted_iface = uu___182_1426.admitted_iface; expect_typ = uu___182_1426.expect_typ; docs = uu___182_1426.docs; remaining_iface_decls = uu___182_1426.remaining_iface_decls; syntax_only = uu___182_1426.syntax_only}))


let iface : env  ->  Prims.bool = (fun e -> e.iface)


let set_admitted_iface : env  ->  Prims.bool  ->  env = (fun e b -> (

let uu___183_1439 = e
in {curmodule = uu___183_1439.curmodule; curmonad = uu___183_1439.curmonad; modules = uu___183_1439.modules; scope_mods = uu___183_1439.scope_mods; exported_ids = uu___183_1439.exported_ids; trans_exported_ids = uu___183_1439.trans_exported_ids; includes = uu___183_1439.includes; sigaccum = uu___183_1439.sigaccum; sigmap = uu___183_1439.sigmap; iface = uu___183_1439.iface; admitted_iface = b; expect_typ = uu___183_1439.expect_typ; docs = uu___183_1439.docs; remaining_iface_decls = uu___183_1439.remaining_iface_decls; syntax_only = uu___183_1439.syntax_only}))


let admitted_iface : env  ->  Prims.bool = (fun e -> e.admitted_iface)


let set_expect_typ : env  ->  Prims.bool  ->  env = (fun e b -> (

let uu___184_1452 = e
in {curmodule = uu___184_1452.curmodule; curmonad = uu___184_1452.curmonad; modules = uu___184_1452.modules; scope_mods = uu___184_1452.scope_mods; exported_ids = uu___184_1452.exported_ids; trans_exported_ids = uu___184_1452.trans_exported_ids; includes = uu___184_1452.includes; sigaccum = uu___184_1452.sigaccum; sigmap = uu___184_1452.sigmap; iface = uu___184_1452.iface; admitted_iface = uu___184_1452.admitted_iface; expect_typ = b; docs = uu___184_1452.docs; remaining_iface_decls = uu___184_1452.remaining_iface_decls; syntax_only = uu___184_1452.syntax_only}))


let expect_typ : env  ->  Prims.bool = (fun e -> e.expect_typ)


let all_exported_id_kinds : exported_id_kind Prims.list = (Exported_id_field)::(Exported_id_term_type)::[]


let transitive_exported_ids : env  ->  FStar_Ident.lident  ->  Prims.string Prims.list = (fun env lid -> (

let module_name = (FStar_Ident.string_of_lid lid)
in (

let uu____1470 = (FStar_Util.smap_try_find env.trans_exported_ids module_name)
in (match (uu____1470) with
| FStar_Pervasives_Native.None -> begin
[]
end
| FStar_Pervasives_Native.Some (exported_id_set) -> begin
(

let uu____1476 = (

let uu____1477 = (exported_id_set Exported_id_term_type)
in (FStar_ST.op_Bang uu____1477))
in (FStar_All.pipe_right uu____1476 FStar_Util.set_elements))
end))))


let open_modules : env  ->  (FStar_Ident.lident * FStar_Syntax_Syntax.modul) Prims.list = (fun e -> e.modules)


let set_current_module : env  ->  FStar_Ident.lident  ->  env = (fun e l -> (

let uu___185_1669 = e
in {curmodule = FStar_Pervasives_Native.Some (l); curmonad = uu___185_1669.curmonad; modules = uu___185_1669.modules; scope_mods = uu___185_1669.scope_mods; exported_ids = uu___185_1669.exported_ids; trans_exported_ids = uu___185_1669.trans_exported_ids; includes = uu___185_1669.includes; sigaccum = uu___185_1669.sigaccum; sigmap = uu___185_1669.sigmap; iface = uu___185_1669.iface; admitted_iface = uu___185_1669.admitted_iface; expect_typ = uu___185_1669.expect_typ; docs = uu___185_1669.docs; remaining_iface_decls = uu___185_1669.remaining_iface_decls; syntax_only = uu___185_1669.syntax_only}))


let current_module : env  ->  FStar_Ident.lident = (fun env -> (match (env.curmodule) with
| FStar_Pervasives_Native.None -> begin
(failwith "Unset current module")
end
| FStar_Pervasives_Native.Some (m) -> begin
m
end))


let iface_decls : env  ->  FStar_Ident.lident  ->  FStar_Parser_AST.decl Prims.list FStar_Pervasives_Native.option = (fun env l -> (

let uu____1687 = (FStar_All.pipe_right env.remaining_iface_decls (FStar_List.tryFind (fun uu____1721 -> (match (uu____1721) with
| (m, uu____1729) -> begin
(FStar_Ident.lid_equals l m)
end))))
in (match (uu____1687) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (uu____1746, decls) -> begin
FStar_Pervasives_Native.Some (decls)
end)))


let set_iface_decls : env  ->  FStar_Ident.lident  ->  FStar_Parser_AST.decl Prims.list  ->  env = (fun env l ds -> (

let uu____1776 = (FStar_List.partition (fun uu____1806 -> (match (uu____1806) with
| (m, uu____1814) -> begin
(FStar_Ident.lid_equals l m)
end)) env.remaining_iface_decls)
in (match (uu____1776) with
| (uu____1819, rest) -> begin
(

let uu___186_1853 = env
in {curmodule = uu___186_1853.curmodule; curmonad = uu___186_1853.curmonad; modules = uu___186_1853.modules; scope_mods = uu___186_1853.scope_mods; exported_ids = uu___186_1853.exported_ids; trans_exported_ids = uu___186_1853.trans_exported_ids; includes = uu___186_1853.includes; sigaccum = uu___186_1853.sigaccum; sigmap = uu___186_1853.sigmap; iface = uu___186_1853.iface; admitted_iface = uu___186_1853.admitted_iface; expect_typ = uu___186_1853.expect_typ; docs = uu___186_1853.docs; remaining_iface_decls = (((l), (ds)))::rest; syntax_only = uu___186_1853.syntax_only})
end)))


let qual : FStar_Ident.lident  ->  FStar_Ident.ident  ->  FStar_Ident.lident = FStar_Syntax_Util.qual_id


let qualify : env  ->  FStar_Ident.ident  ->  FStar_Ident.lident = (fun env id -> (match (env.curmonad) with
| FStar_Pervasives_Native.None -> begin
(

let uu____1876 = (current_module env)
in (qual uu____1876 id))
end
| FStar_Pervasives_Native.Some (monad) -> begin
(

let uu____1878 = (

let uu____1879 = (current_module env)
in (qual uu____1879 monad))
in (FStar_Syntax_Util.mk_field_projector_name_from_ident uu____1878 id))
end))


let syntax_only : env  ->  Prims.bool = (fun env -> env.syntax_only)


let set_syntax_only : env  ->  Prims.bool  ->  env = (fun env b -> (

let uu___187_1892 = env
in {curmodule = uu___187_1892.curmodule; curmonad = uu___187_1892.curmonad; modules = uu___187_1892.modules; scope_mods = uu___187_1892.scope_mods; exported_ids = uu___187_1892.exported_ids; trans_exported_ids = uu___187_1892.trans_exported_ids; includes = uu___187_1892.includes; sigaccum = uu___187_1892.sigaccum; sigmap = uu___187_1892.sigmap; iface = uu___187_1892.iface; admitted_iface = uu___187_1892.admitted_iface; expect_typ = uu___187_1892.expect_typ; docs = uu___187_1892.docs; remaining_iface_decls = uu___187_1892.remaining_iface_decls; syntax_only = b}))


let new_sigmap : 'Auu____1897 . Prims.unit  ->  'Auu____1897 FStar_Util.smap = (fun uu____1903 -> (FStar_Util.smap_create (Prims.parse_int "100")))


let empty_env : Prims.unit  ->  env = (fun uu____1907 -> (

let uu____1908 = (new_sigmap ())
in (

let uu____1911 = (new_sigmap ())
in (

let uu____1914 = (new_sigmap ())
in (

let uu____1925 = (new_sigmap ())
in (

let uu____1936 = (new_sigmap ())
in {curmodule = FStar_Pervasives_Native.None; curmonad = FStar_Pervasives_Native.None; modules = []; scope_mods = []; exported_ids = uu____1908; trans_exported_ids = uu____1911; includes = uu____1914; sigaccum = []; sigmap = uu____1925; iface = false; admitted_iface = false; expect_typ = false; docs = uu____1936; remaining_iface_decls = []; syntax_only = false}))))))


let sigmap : env  ->  (FStar_Syntax_Syntax.sigelt * Prims.bool) FStar_Util.smap = (fun env -> env.sigmap)


let has_all_in_scope : env  ->  Prims.bool = (fun env -> (FStar_List.existsb (fun uu____1970 -> (match (uu____1970) with
| (m, uu____1976) -> begin
(FStar_Ident.lid_equals m FStar_Parser_Const.all_lid)
end)) env.modules))


let set_bv_range : FStar_Syntax_Syntax.bv  ->  FStar_Range.range  ->  FStar_Syntax_Syntax.bv = (fun bv r -> (

let id = (

let uu___188_1986 = bv.FStar_Syntax_Syntax.ppname
in {FStar_Ident.idText = uu___188_1986.FStar_Ident.idText; FStar_Ident.idRange = r})
in (

let uu___189_1987 = bv
in {FStar_Syntax_Syntax.ppname = id; FStar_Syntax_Syntax.index = uu___189_1987.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu___189_1987.FStar_Syntax_Syntax.sort})))


let bv_to_name : FStar_Syntax_Syntax.bv  ->  FStar_Range.range  ->  FStar_Syntax_Syntax.term = (fun bv r -> (FStar_Syntax_Syntax.bv_to_name (set_bv_range bv r)))


let unmangleMap : (Prims.string * Prims.string * FStar_Syntax_Syntax.delta_depth * FStar_Syntax_Syntax.fv_qual FStar_Pervasives_Native.option) Prims.list = ((("op_ColonColon"), ("Cons"), (FStar_Syntax_Syntax.Delta_constant), (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor))))::((("not"), ("op_Negation"), (FStar_Syntax_Syntax.Delta_equational), (FStar_Pervasives_Native.None)))::[]


let unmangleOpName : FStar_Ident.ident  ->  (FStar_Syntax_Syntax.term * Prims.bool) FStar_Pervasives_Native.option = (fun id -> (

let t = (FStar_Util.find_map unmangleMap (fun uu____2077 -> (match (uu____2077) with
| (x, y, dd, dq) -> begin
(match ((Prims.op_Equality id.FStar_Ident.idText x)) with
| true -> begin
(

let uu____2100 = (

let uu____2101 = (FStar_Ident.lid_of_path (("Prims")::(y)::[]) id.FStar_Ident.idRange)
in (FStar_Syntax_Syntax.fvar uu____2101 dd dq))
in FStar_Pervasives_Native.Some (uu____2100))
end
| uu____2102 -> begin
FStar_Pervasives_Native.None
end)
end)))
in (match (t) with
| FStar_Pervasives_Native.Some (v1) -> begin
FStar_Pervasives_Native.Some (((v1), (false)))
end
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end)))

type 'a cont_t =
| Cont_ok of 'a
| Cont_fail
| Cont_ignore


let uu___is_Cont_ok : 'a . 'a cont_t  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Cont_ok (_0) -> begin
true
end
| uu____2146 -> begin
false
end))


let __proj__Cont_ok__item___0 : 'a . 'a cont_t  ->  'a = (fun projectee -> (match (projectee) with
| Cont_ok (_0) -> begin
_0
end))


let uu___is_Cont_fail : 'a . 'a cont_t  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Cont_fail -> begin
true
end
| uu____2179 -> begin
false
end))


let uu___is_Cont_ignore : 'a . 'a cont_t  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Cont_ignore -> begin
true
end
| uu____2195 -> begin
false
end))


let option_of_cont : 'a . (Prims.unit  ->  'a FStar_Pervasives_Native.option)  ->  'a cont_t  ->  'a FStar_Pervasives_Native.option = (fun k_ignore uu___152_2221 -> (match (uu___152_2221) with
| Cont_ok (a) -> begin
FStar_Pervasives_Native.Some (a)
end
| Cont_fail -> begin
FStar_Pervasives_Native.None
end
| Cont_ignore -> begin
(k_ignore ())
end))


let find_in_record : 'Auu____2239 . FStar_Ident.ident Prims.list  ->  FStar_Ident.ident  ->  record_or_dc  ->  (record_or_dc  ->  'Auu____2239 cont_t)  ->  'Auu____2239 cont_t = (fun ns id record cont -> (

let typename' = (FStar_Ident.lid_of_ids (FStar_List.append ns ((record.typename.FStar_Ident.ident)::[])))
in (match ((FStar_Ident.lid_equals typename' record.typename)) with
| true -> begin
(

let fname = (FStar_Ident.lid_of_ids (FStar_List.append record.typename.FStar_Ident.ns ((id)::[])))
in (

let find1 = (FStar_Util.find_map record.fields (fun uu____2285 -> (match (uu____2285) with
| (f, uu____2293) -> begin
(match ((Prims.op_Equality id.FStar_Ident.idText f.FStar_Ident.idText)) with
| true -> begin
FStar_Pervasives_Native.Some (record)
end
| uu____2296 -> begin
FStar_Pervasives_Native.None
end)
end)))
in (match (find1) with
| FStar_Pervasives_Native.Some (r) -> begin
(cont r)
end
| FStar_Pervasives_Native.None -> begin
Cont_ignore
end)))
end
| uu____2300 -> begin
Cont_ignore
end)))


let get_exported_id_set : env  ->  Prims.string  ->  (exported_id_kind  ->  string_set FStar_ST.ref) FStar_Pervasives_Native.option = (fun e mname -> (FStar_Util.smap_try_find e.exported_ids mname))


let get_trans_exported_id_set : env  ->  Prims.string  ->  (exported_id_kind  ->  string_set FStar_ST.ref) FStar_Pervasives_Native.option = (fun e mname -> (FStar_Util.smap_try_find e.trans_exported_ids mname))


let string_of_exported_id_kind : exported_id_kind  ->  Prims.string = (fun uu___153_2344 -> (match (uu___153_2344) with
| Exported_id_field -> begin
"field"
end
| Exported_id_term_type -> begin
"term/type"
end))


let find_in_module_with_includes : 'a . exported_id_kind  ->  (FStar_Ident.lident  ->  'a cont_t)  ->  'a cont_t  ->  env  ->  FStar_Ident.lident  ->  FStar_Ident.ident  ->  'a cont_t = (fun eikind find_in_module find_in_module_default env ns id -> (

let idstr = id.FStar_Ident.idText
in (

let rec aux = (fun uu___154_2407 -> (match (uu___154_2407) with
| [] -> begin
find_in_module_default
end
| (modul)::q -> begin
(

let mname = modul.FStar_Ident.str
in (

let not_shadowed = (

let uu____2418 = (get_exported_id_set env mname)
in (match (uu____2418) with
| FStar_Pervasives_Native.None -> begin
true
end
| FStar_Pervasives_Native.Some (mex) -> begin
(

let mexports = (

let uu____2439 = (mex eikind)
in (FStar_ST.op_Bang uu____2439))
in (FStar_Util.set_mem idstr mexports))
end))
in (

let mincludes = (

let uu____2614 = (FStar_Util.smap_try_find env.includes mname)
in (match (uu____2614) with
| FStar_Pervasives_Native.None -> begin
[]
end
| FStar_Pervasives_Native.Some (minc) -> begin
(FStar_ST.op_Bang minc)
end))
in (

let look_into = (match (not_shadowed) with
| true -> begin
(

let uu____2677 = (qual modul id)
in (find_in_module uu____2677))
end
| uu____2678 -> begin
Cont_ignore
end)
in (match (look_into) with
| Cont_ignore -> begin
(aux (FStar_List.append mincludes q))
end
| uu____2681 -> begin
look_into
end)))))
end))
in (aux ((ns)::[])))))


let is_exported_id_field : exported_id_kind  ->  Prims.bool = (fun uu___155_2687 -> (match (uu___155_2687) with
| Exported_id_field -> begin
true
end
| uu____2688 -> begin
false
end))


let try_lookup_id'' : 'a . env  ->  FStar_Ident.ident  ->  exported_id_kind  ->  (local_binding  ->  'a cont_t)  ->  (rec_binding  ->  'a cont_t)  ->  (record_or_dc  ->  'a cont_t)  ->  (FStar_Ident.lident  ->  'a cont_t)  ->  ('a cont_t  ->  FStar_Ident.ident  ->  'a cont_t)  ->  'a FStar_Pervasives_Native.option = (fun env id eikind k_local_binding k_rec_binding k_record find_in_module lookup_default_id -> (

let check_local_binding_id = (fun uu___156_2799 -> (match (uu___156_2799) with
| (id', uu____2801, uu____2802) -> begin
(Prims.op_Equality id'.FStar_Ident.idText id.FStar_Ident.idText)
end))
in (

let check_rec_binding_id = (fun uu___157_2806 -> (match (uu___157_2806) with
| (id', uu____2808, uu____2809) -> begin
(Prims.op_Equality id'.FStar_Ident.idText id.FStar_Ident.idText)
end))
in (

let curmod_ns = (

let uu____2813 = (current_module env)
in (FStar_Ident.ids_of_lid uu____2813))
in (

let proc = (fun uu___158_2819 -> (match (uu___158_2819) with
| Local_binding (l) when (check_local_binding_id l) -> begin
(k_local_binding l)
end
| Rec_binding (r) when (check_rec_binding_id r) -> begin
(k_rec_binding r)
end
| Open_module_or_namespace (ns, Open_module) -> begin
(find_in_module_with_includes eikind find_in_module Cont_ignore env ns id)
end
| Top_level_def (id') when (Prims.op_Equality id'.FStar_Ident.idText id.FStar_Ident.idText) -> begin
(lookup_default_id Cont_ignore id)
end
| Record_or_dc (r) when (is_exported_id_field eikind) -> begin
(

let uu____2827 = (FStar_Ident.lid_of_ids curmod_ns)
in (find_in_module_with_includes Exported_id_field (fun lid -> (

let id1 = lid.FStar_Ident.ident
in (find_in_record lid.FStar_Ident.ns id1 r k_record))) Cont_ignore env uu____2827 id))
end
| uu____2832 -> begin
Cont_ignore
end))
in (

let rec aux = (fun uu___159_2840 -> (match (uu___159_2840) with
| (a)::q -> begin
(

let uu____2849 = (proc a)
in (option_of_cont (fun uu____2853 -> (aux q)) uu____2849))
end
| [] -> begin
(

let uu____2854 = (lookup_default_id Cont_fail id)
in (option_of_cont (fun uu____2858 -> FStar_Pervasives_Native.None) uu____2854))
end))
in (aux env.scope_mods)))))))


let found_local_binding : 'Auu____2867 'Auu____2868 . FStar_Range.range  ->  ('Auu____2868 * FStar_Syntax_Syntax.bv * 'Auu____2867)  ->  (FStar_Syntax_Syntax.term * 'Auu____2867) = (fun r uu____2886 -> (match (uu____2886) with
| (id', x, mut) -> begin
(

let uu____2896 = (bv_to_name x r)
in ((uu____2896), (mut)))
end))


let find_in_module : 'Auu____2907 . env  ->  FStar_Ident.lident  ->  (FStar_Ident.lident  ->  (FStar_Syntax_Syntax.sigelt * Prims.bool)  ->  'Auu____2907)  ->  'Auu____2907  ->  'Auu____2907 = (fun env lid k_global_def k_not_found -> (

let uu____2942 = (FStar_Util.smap_try_find (sigmap env) lid.FStar_Ident.str)
in (match (uu____2942) with
| FStar_Pervasives_Native.Some (sb) -> begin
(k_global_def lid sb)
end
| FStar_Pervasives_Native.None -> begin
k_not_found
end)))


let try_lookup_id : env  ->  FStar_Ident.ident  ->  (FStar_Syntax_Syntax.term * Prims.bool) FStar_Pervasives_Native.option = (fun env id -> (

let uu____2980 = (unmangleOpName id)
in (match (uu____2980) with
| FStar_Pervasives_Native.Some (f) -> begin
FStar_Pervasives_Native.Some (f)
end
| uu____3006 -> begin
(try_lookup_id'' env id Exported_id_term_type (fun r -> (

let uu____3020 = (found_local_binding id.FStar_Ident.idRange r)
in Cont_ok (uu____3020))) (fun uu____3030 -> Cont_fail) (fun uu____3036 -> Cont_ignore) (fun i -> (find_in_module env i (fun uu____3051 uu____3052 -> Cont_fail) Cont_ignore)) (fun uu____3067 uu____3068 -> Cont_fail))
end)))


let lookup_default_id : 'a . env  ->  FStar_Ident.ident  ->  (FStar_Ident.lident  ->  (FStar_Syntax_Syntax.sigelt * Prims.bool)  ->  'a cont_t)  ->  'a cont_t  ->  'a cont_t = (fun env id k_global_def k_not_found -> (

let find_in_monad = (match (env.curmonad) with
| FStar_Pervasives_Native.Some (uu____3143) -> begin
(

let lid = (qualify env id)
in (

let uu____3145 = (FStar_Util.smap_try_find (sigmap env) lid.FStar_Ident.str)
in (match (uu____3145) with
| FStar_Pervasives_Native.Some (r) -> begin
(

let uu____3169 = (k_global_def lid r)
in FStar_Pervasives_Native.Some (uu____3169))
end
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end)))
end
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end)
in (match (find_in_monad) with
| FStar_Pervasives_Native.Some (v1) -> begin
v1
end
| FStar_Pervasives_Native.None -> begin
(

let lid = (

let uu____3192 = (current_module env)
in (qual uu____3192 id))
in (find_in_module env lid k_global_def k_not_found))
end)))


let module_is_defined : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env lid -> ((match (env.curmodule) with
| FStar_Pervasives_Native.None -> begin
false
end
| FStar_Pervasives_Native.Some (m) -> begin
(

let uu____3204 = (current_module env)
in (FStar_Ident.lid_equals lid uu____3204))
end) || (FStar_List.existsb (fun x -> (FStar_Ident.lid_equals lid (FStar_Pervasives_Native.fst x))) env.modules)))


let resolve_module_name : env  ->  FStar_Ident.lident  ->  Prims.bool  ->  FStar_Ident.lident FStar_Pervasives_Native.option = (fun env lid honor_ns -> (

let nslen = (FStar_List.length lid.FStar_Ident.ns)
in (

let rec aux = (fun uu___160_3239 -> (match (uu___160_3239) with
| [] -> begin
(

let uu____3244 = (module_is_defined env lid)
in (match (uu____3244) with
| true -> begin
FStar_Pervasives_Native.Some (lid)
end
| uu____3247 -> begin
FStar_Pervasives_Native.None
end))
end
| (Open_module_or_namespace (ns, Open_namespace))::q when honor_ns -> begin
(

let new_lid = (

let uu____3253 = (

let uu____3256 = (FStar_Ident.path_of_lid ns)
in (

let uu____3259 = (FStar_Ident.path_of_lid lid)
in (FStar_List.append uu____3256 uu____3259)))
in (FStar_Ident.lid_of_path uu____3253 (FStar_Ident.range_of_lid lid)))
in (

let uu____3262 = (module_is_defined env new_lid)
in (match (uu____3262) with
| true -> begin
FStar_Pervasives_Native.Some (new_lid)
end
| uu____3265 -> begin
(aux q)
end)))
end
| (Module_abbrev (name, modul))::uu____3268 when ((Prims.op_Equality nslen (Prims.parse_int "0")) && (Prims.op_Equality name.FStar_Ident.idText lid.FStar_Ident.ident.FStar_Ident.idText)) -> begin
FStar_Pervasives_Native.Some (modul)
end
| (uu____3275)::q -> begin
(aux q)
end))
in (aux env.scope_mods))))


let fail_if_curmodule : env  ->  FStar_Ident.lident  ->  FStar_Ident.lident  ->  Prims.unit = (fun env ns_original ns_resolved -> (

let uu____3291 = (

let uu____3292 = (current_module env)
in (FStar_Ident.lid_equals ns_resolved uu____3292))
in (match (uu____3291) with
| true -> begin
(match ((FStar_Ident.lid_equals ns_resolved FStar_Parser_Const.prims_lid)) with
| true -> begin
()
end
| uu____3293 -> begin
(

let uu____3294 = (

let uu____3295 = (

let uu____3300 = (FStar_Util.format1 "Reference %s to current module is forbidden (see GitHub issue #451)" ns_original.FStar_Ident.str)
in ((uu____3300), ((FStar_Ident.range_of_lid ns_original))))
in FStar_Errors.Error (uu____3295))
in (FStar_Exn.raise uu____3294))
end)
end
| uu____3301 -> begin
()
end)))


let fail_if_qualified_by_curmodule : env  ->  FStar_Ident.lident  ->  Prims.unit = (fun env lid -> (match (lid.FStar_Ident.ns) with
| [] -> begin
()
end
| uu____3310 -> begin
(

let modul_orig = (FStar_Ident.lid_of_ids lid.FStar_Ident.ns)
in (

let uu____3314 = (resolve_module_name env modul_orig true)
in (match (uu____3314) with
| FStar_Pervasives_Native.Some (modul_res) -> begin
(fail_if_curmodule env modul_orig modul_res)
end
| uu____3318 -> begin
()
end)))
end))


let namespace_is_open : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env lid -> (FStar_List.existsb (fun uu___161_3331 -> (match (uu___161_3331) with
| Open_module_or_namespace (ns, Open_namespace) -> begin
(FStar_Ident.lid_equals lid ns)
end
| uu____3333 -> begin
false
end)) env.scope_mods))


let shorten_module_path : env  ->  FStar_Ident.ident Prims.list  ->  Prims.bool  ->  (FStar_Ident.ident Prims.list * FStar_Ident.ident Prims.list) = (fun env ids is_full_path -> (

let rec aux = (fun revns id -> (

let lid = (FStar_Ident.lid_of_ns_and_id (FStar_List.rev revns) id)
in (match ((namespace_is_open env lid)) with
| true -> begin
FStar_Pervasives_Native.Some ((((FStar_List.rev ((id)::revns))), ([])))
end
| uu____3402 -> begin
(match (revns) with
| [] -> begin
FStar_Pervasives_Native.None
end
| (ns_last_id)::rev_ns_prefix -> begin
(

let uu____3425 = (aux rev_ns_prefix ns_last_id)
in (FStar_All.pipe_right uu____3425 (FStar_Util.map_option (fun uu____3475 -> (match (uu____3475) with
| (stripped_ids, rev_kept_ids) -> begin
((stripped_ids), ((id)::rev_kept_ids))
end)))))
end)
end)))
in (

let uu____3506 = (is_full_path && (

let uu____3508 = (FStar_Ident.lid_of_ids ids)
in (module_is_defined env uu____3508)))
in (match (uu____3506) with
| true -> begin
((ids), ([]))
end
| uu____3521 -> begin
(match ((FStar_List.rev ids)) with
| [] -> begin
(([]), ([]))
end
| (ns_last_id)::ns_rev_prefix -> begin
(

let uu____3538 = (aux ns_rev_prefix ns_last_id)
in (match (uu____3538) with
| FStar_Pervasives_Native.None -> begin
(([]), (ids))
end
| FStar_Pervasives_Native.Some (stripped_ids, rev_kept_ids) -> begin
((stripped_ids), ((FStar_List.rev rev_kept_ids)))
end))
end)
end))))


let shorten_lid : env  ->  FStar_Ident.lid  ->  FStar_Ident.lid = (fun env lid -> (

let uu____3599 = (shorten_module_path env lid.FStar_Ident.ns true)
in (match (uu____3599) with
| (uu____3608, short) -> begin
(FStar_Ident.lid_of_ns_and_id short lid.FStar_Ident.ident)
end)))


let resolve_in_open_namespaces'' : 'a . env  ->  FStar_Ident.lident  ->  exported_id_kind  ->  (local_binding  ->  'a cont_t)  ->  (rec_binding  ->  'a cont_t)  ->  (record_or_dc  ->  'a cont_t)  ->  (FStar_Ident.lident  ->  'a cont_t)  ->  ('a cont_t  ->  FStar_Ident.ident  ->  'a cont_t)  ->  'a FStar_Pervasives_Native.option = (fun env lid eikind k_local_binding k_rec_binding k_record f_module l_default -> (match (lid.FStar_Ident.ns) with
| (uu____3725)::uu____3726 -> begin
(

let uu____3729 = (

let uu____3732 = (

let uu____3733 = (FStar_Ident.lid_of_ids lid.FStar_Ident.ns)
in (FStar_Ident.set_lid_range uu____3733 (FStar_Ident.range_of_lid lid)))
in (resolve_module_name env uu____3732 true))
in (match (uu____3729) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (modul) -> begin
(

let uu____3737 = (find_in_module_with_includes eikind f_module Cont_fail env modul lid.FStar_Ident.ident)
in (option_of_cont (fun uu____3741 -> FStar_Pervasives_Native.None) uu____3737))
end))
end
| [] -> begin
(try_lookup_id'' env lid.FStar_Ident.ident eikind k_local_binding k_rec_binding k_record f_module l_default)
end))


let cont_of_option : 'a . 'a cont_t  ->  'a FStar_Pervasives_Native.option  ->  'a cont_t = (fun k_none uu___162_3762 -> (match (uu___162_3762) with
| FStar_Pervasives_Native.Some (v1) -> begin
Cont_ok (v1)
end
| FStar_Pervasives_Native.None -> begin
k_none
end))


let resolve_in_open_namespaces' : 'a . env  ->  FStar_Ident.lident  ->  (local_binding  ->  'a FStar_Pervasives_Native.option)  ->  (rec_binding  ->  'a FStar_Pervasives_Native.option)  ->  (FStar_Ident.lident  ->  (FStar_Syntax_Syntax.sigelt * Prims.bool)  ->  'a FStar_Pervasives_Native.option)  ->  'a FStar_Pervasives_Native.option = (fun env lid k_local_binding k_rec_binding k_global_def -> (

let k_global_def' = (fun k lid1 def -> (

let uu____3867 = (k_global_def lid1 def)
in (cont_of_option k uu____3867)))
in (

let f_module = (fun lid' -> (

let k = Cont_ignore
in (find_in_module env lid' (k_global_def' k) k)))
in (

let l_default = (fun k i -> (lookup_default_id env i (k_global_def' k) k))
in (resolve_in_open_namespaces'' env lid Exported_id_term_type (fun l -> (

let uu____3897 = (k_local_binding l)
in (cont_of_option Cont_fail uu____3897))) (fun r -> (

let uu____3903 = (k_rec_binding r)
in (cont_of_option Cont_fail uu____3903))) (fun uu____3907 -> Cont_ignore) f_module l_default)))))


let fv_qual_of_se : FStar_Syntax_Syntax.sigelt  ->  FStar_Syntax_Syntax.fv_qual FStar_Pervasives_Native.option = (fun se -> (match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_datacon (uu____3916, uu____3917, uu____3918, l, uu____3920, uu____3921) -> begin
(

let qopt = (FStar_Util.find_map se.FStar_Syntax_Syntax.sigquals (fun uu___163_3932 -> (match (uu___163_3932) with
| FStar_Syntax_Syntax.RecordConstructor (uu____3935, fs) -> begin
FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_ctor (((l), (fs))))
end
| uu____3947 -> begin
FStar_Pervasives_Native.None
end)))
in (match (qopt) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)
end
| x -> begin
x
end))
end
| FStar_Syntax_Syntax.Sig_declare_typ (uu____3953, uu____3954, uu____3955) -> begin
FStar_Pervasives_Native.None
end
| uu____3956 -> begin
FStar_Pervasives_Native.None
end))


let lb_fv : FStar_Syntax_Syntax.letbinding Prims.list  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.fv = (fun lbs lid -> (

let uu____3969 = (FStar_Util.find_map lbs (fun lb -> (

let fv = (FStar_Util.right lb.FStar_Syntax_Syntax.lbname)
in (

let uu____3977 = (FStar_Syntax_Syntax.fv_eq_lid fv lid)
in (match (uu____3977) with
| true -> begin
FStar_Pervasives_Native.Some (fv)
end
| uu____3980 -> begin
FStar_Pervasives_Native.None
end)))))
in (FStar_All.pipe_right uu____3969 FStar_Util.must)))


let ns_of_lid_equals : FStar_Ident.lident  ->  FStar_Ident.lident  ->  Prims.bool = (fun lid ns -> ((Prims.op_Equality (FStar_List.length lid.FStar_Ident.ns) (FStar_List.length (FStar_Ident.ids_of_lid ns))) && (

let uu____3992 = (FStar_Ident.lid_of_ids lid.FStar_Ident.ns)
in (FStar_Ident.lid_equals uu____3992 ns))))


let try_lookup_name : Prims.bool  ->  Prims.bool  ->  env  ->  FStar_Ident.lident  ->  foundname FStar_Pervasives_Native.option = (fun any_val exclude_interf env lid -> (

let occurrence_range = (FStar_Ident.range_of_lid lid)
in (

let k_global_def = (fun source_lid uu___167_4026 -> (match (uu___167_4026) with
| (uu____4033, true) when exclude_interf -> begin
FStar_Pervasives_Native.None
end
| (se, uu____4035) -> begin
(match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_inductive_typ (uu____4038) -> begin
(

let uu____4055 = (

let uu____4056 = (

let uu____4061 = (FStar_Syntax_Syntax.fvar source_lid FStar_Syntax_Syntax.Delta_constant FStar_Pervasives_Native.None)
in ((uu____4061), (false)))
in Term_name (uu____4056))
in FStar_Pervasives_Native.Some (uu____4055))
end
| FStar_Syntax_Syntax.Sig_datacon (uu____4062) -> begin
(

let uu____4077 = (

let uu____4078 = (

let uu____4083 = (

let uu____4084 = (fv_qual_of_se se)
in (FStar_Syntax_Syntax.fvar source_lid FStar_Syntax_Syntax.Delta_constant uu____4084))
in ((uu____4083), (false)))
in Term_name (uu____4078))
in FStar_Pervasives_Native.Some (uu____4077))
end
| FStar_Syntax_Syntax.Sig_let ((uu____4087, lbs), uu____4089) -> begin
(

let fv = (lb_fv lbs source_lid)
in (

let uu____4105 = (

let uu____4106 = (

let uu____4111 = (FStar_Syntax_Syntax.fvar source_lid fv.FStar_Syntax_Syntax.fv_delta fv.FStar_Syntax_Syntax.fv_qual)
in ((uu____4111), (false)))
in Term_name (uu____4106))
in FStar_Pervasives_Native.Some (uu____4105)))
end
| FStar_Syntax_Syntax.Sig_declare_typ (lid1, uu____4113, uu____4114) -> begin
(

let quals = se.FStar_Syntax_Syntax.sigquals
in (

let uu____4118 = (any_val || (FStar_All.pipe_right quals (FStar_Util.for_some (fun uu___164_4122 -> (match (uu___164_4122) with
| FStar_Syntax_Syntax.Assumption -> begin
true
end
| uu____4123 -> begin
false
end)))))
in (match (uu____4118) with
| true -> begin
(

let lid2 = (FStar_Ident.set_lid_range lid1 (FStar_Ident.range_of_lid source_lid))
in (

let dd = (

let uu____4128 = ((FStar_Syntax_Util.is_primop_lid lid2) || (FStar_All.pipe_right quals (FStar_Util.for_some (fun uu___165_4133 -> (match (uu___165_4133) with
| FStar_Syntax_Syntax.Projector (uu____4134) -> begin
true
end
| FStar_Syntax_Syntax.Discriminator (uu____4139) -> begin
true
end
| uu____4140 -> begin
false
end)))))
in (match (uu____4128) with
| true -> begin
FStar_Syntax_Syntax.Delta_equational
end
| uu____4141 -> begin
FStar_Syntax_Syntax.Delta_constant
end))
in (

let uu____4142 = (FStar_Util.find_map quals (fun uu___166_4147 -> (match (uu___166_4147) with
| FStar_Syntax_Syntax.Reflectable (refl_monad) -> begin
FStar_Pervasives_Native.Some (refl_monad)
end
| uu____4151 -> begin
FStar_Pervasives_Native.None
end)))
in (match (uu____4142) with
| FStar_Pervasives_Native.Some (refl_monad) -> begin
(

let refl_const = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reflect (refl_monad))) FStar_Pervasives_Native.None occurrence_range)
in FStar_Pervasives_Native.Some (Term_name (((refl_const), (false)))))
end
| uu____4160 -> begin
(

let uu____4163 = (

let uu____4164 = (

let uu____4169 = (

let uu____4170 = (fv_qual_of_se se)
in (FStar_Syntax_Syntax.fvar lid2 dd uu____4170))
in ((uu____4169), (false)))
in Term_name (uu____4164))
in FStar_Pervasives_Native.Some (uu____4163))
end))))
end
| uu____4173 -> begin
FStar_Pervasives_Native.None
end)))
end
| FStar_Syntax_Syntax.Sig_new_effect_for_free (ne) -> begin
FStar_Pervasives_Native.Some (Eff_name (((se), ((FStar_Ident.set_lid_range ne.FStar_Syntax_Syntax.mname (FStar_Ident.range_of_lid source_lid))))))
end
| FStar_Syntax_Syntax.Sig_new_effect (ne) -> begin
FStar_Pervasives_Native.Some (Eff_name (((se), ((FStar_Ident.set_lid_range ne.FStar_Syntax_Syntax.mname (FStar_Ident.range_of_lid source_lid))))))
end
| FStar_Syntax_Syntax.Sig_effect_abbrev (uu____4176) -> begin
FStar_Pervasives_Native.Some (Eff_name (((se), (source_lid))))
end
| uu____4189 -> begin
FStar_Pervasives_Native.None
end)
end))
in (

let k_local_binding = (fun r -> (

let uu____4208 = (

let uu____4209 = (found_local_binding (FStar_Ident.range_of_lid lid) r)
in Term_name (uu____4209))
in FStar_Pervasives_Native.Some (uu____4208)))
in (

let k_rec_binding = (fun uu____4225 -> (match (uu____4225) with
| (id, l, dd) -> begin
(

let uu____4237 = (

let uu____4238 = (

let uu____4243 = (FStar_Syntax_Syntax.fvar (FStar_Ident.set_lid_range l (FStar_Ident.range_of_lid lid)) dd FStar_Pervasives_Native.None)
in ((uu____4243), (false)))
in Term_name (uu____4238))
in FStar_Pervasives_Native.Some (uu____4237))
end))
in (

let found_unmangled = (match (lid.FStar_Ident.ns) with
| [] -> begin
(

let uu____4249 = (unmangleOpName lid.FStar_Ident.ident)
in (match (uu____4249) with
| FStar_Pervasives_Native.Some (f) -> begin
FStar_Pervasives_Native.Some (Term_name (f))
end
| uu____4267 -> begin
FStar_Pervasives_Native.None
end))
end
| uu____4274 -> begin
FStar_Pervasives_Native.None
end)
in (match (found_unmangled) with
| FStar_Pervasives_Native.None -> begin
(resolve_in_open_namespaces' env lid k_local_binding k_rec_binding k_global_def)
end
| x -> begin
x
end)))))))


let try_lookup_effect_name' : Prims.bool  ->  env  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.sigelt * FStar_Ident.lident) FStar_Pervasives_Native.option = (fun exclude_interf env lid -> (

let uu____4306 = (try_lookup_name true exclude_interf env lid)
in (match (uu____4306) with
| FStar_Pervasives_Native.Some (Eff_name (o, l)) -> begin
FStar_Pervasives_Native.Some (((o), (l)))
end
| uu____4321 -> begin
FStar_Pervasives_Native.None
end)))


let try_lookup_effect_name : env  ->  FStar_Ident.lident  ->  FStar_Ident.lident FStar_Pervasives_Native.option = (fun env l -> (

let uu____4338 = (try_lookup_effect_name' (not (env.iface)) env l)
in (match (uu____4338) with
| FStar_Pervasives_Native.Some (o, l1) -> begin
FStar_Pervasives_Native.Some (l1)
end
| uu____4353 -> begin
FStar_Pervasives_Native.None
end)))


let try_lookup_effect_name_and_attributes : env  ->  FStar_Ident.lident  ->  (FStar_Ident.lident * FStar_Syntax_Syntax.cflags Prims.list) FStar_Pervasives_Native.option = (fun env l -> (

let uu____4376 = (try_lookup_effect_name' (not (env.iface)) env l)
in (match (uu____4376) with
| FStar_Pervasives_Native.Some ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_new_effect (ne); FStar_Syntax_Syntax.sigrng = uu____4392; FStar_Syntax_Syntax.sigquals = uu____4393; FStar_Syntax_Syntax.sigmeta = uu____4394; FStar_Syntax_Syntax.sigattrs = uu____4395}, l1) -> begin
FStar_Pervasives_Native.Some (((l1), (ne.FStar_Syntax_Syntax.cattributes)))
end
| FStar_Pervasives_Native.Some ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_new_effect_for_free (ne); FStar_Syntax_Syntax.sigrng = uu____4414; FStar_Syntax_Syntax.sigquals = uu____4415; FStar_Syntax_Syntax.sigmeta = uu____4416; FStar_Syntax_Syntax.sigattrs = uu____4417}, l1) -> begin
FStar_Pervasives_Native.Some (((l1), (ne.FStar_Syntax_Syntax.cattributes)))
end
| FStar_Pervasives_Native.Some ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_effect_abbrev (uu____4435, uu____4436, uu____4437, uu____4438, cattributes); FStar_Syntax_Syntax.sigrng = uu____4440; FStar_Syntax_Syntax.sigquals = uu____4441; FStar_Syntax_Syntax.sigmeta = uu____4442; FStar_Syntax_Syntax.sigattrs = uu____4443}, l1) -> begin
FStar_Pervasives_Native.Some (((l1), (cattributes)))
end
| uu____4465 -> begin
FStar_Pervasives_Native.None
end)))


let try_lookup_effect_defn : env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.eff_decl FStar_Pervasives_Native.option = (fun env l -> (

let uu____4488 = (try_lookup_effect_name' (not (env.iface)) env l)
in (match (uu____4488) with
| FStar_Pervasives_Native.Some ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_new_effect (ne); FStar_Syntax_Syntax.sigrng = uu____4498; FStar_Syntax_Syntax.sigquals = uu____4499; FStar_Syntax_Syntax.sigmeta = uu____4500; FStar_Syntax_Syntax.sigattrs = uu____4501}, uu____4502) -> begin
FStar_Pervasives_Native.Some (ne)
end
| FStar_Pervasives_Native.Some ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_new_effect_for_free (ne); FStar_Syntax_Syntax.sigrng = uu____4512; FStar_Syntax_Syntax.sigquals = uu____4513; FStar_Syntax_Syntax.sigmeta = uu____4514; FStar_Syntax_Syntax.sigattrs = uu____4515}, uu____4516) -> begin
FStar_Pervasives_Native.Some (ne)
end
| uu____4525 -> begin
FStar_Pervasives_Native.None
end)))


let is_effect_name : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env lid -> (

let uu____4540 = (try_lookup_effect_name env lid)
in (match (uu____4540) with
| FStar_Pervasives_Native.None -> begin
false
end
| FStar_Pervasives_Native.Some (uu____4543) -> begin
true
end)))


let try_lookup_root_effect_name : env  ->  FStar_Ident.lident  ->  FStar_Ident.lident FStar_Pervasives_Native.option = (fun env l -> (

let uu____4554 = (try_lookup_effect_name' (not (env.iface)) env l)
in (match (uu____4554) with
| FStar_Pervasives_Native.Some ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_effect_abbrev (l', uu____4564, uu____4565, uu____4566, uu____4567); FStar_Syntax_Syntax.sigrng = uu____4568; FStar_Syntax_Syntax.sigquals = uu____4569; FStar_Syntax_Syntax.sigmeta = uu____4570; FStar_Syntax_Syntax.sigattrs = uu____4571}, uu____4572) -> begin
(

let rec aux = (fun new_name -> (

let uu____4591 = (FStar_Util.smap_try_find (sigmap env) new_name.FStar_Ident.str)
in (match (uu____4591) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (s, uu____4609) -> begin
(match (s.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_new_effect_for_free (ne) -> begin
FStar_Pervasives_Native.Some ((FStar_Ident.set_lid_range ne.FStar_Syntax_Syntax.mname (FStar_Ident.range_of_lid l)))
end
| FStar_Syntax_Syntax.Sig_new_effect (ne) -> begin
FStar_Pervasives_Native.Some ((FStar_Ident.set_lid_range ne.FStar_Syntax_Syntax.mname (FStar_Ident.range_of_lid l)))
end
| FStar_Syntax_Syntax.Sig_effect_abbrev (uu____4618, uu____4619, uu____4620, cmp, uu____4622) -> begin
(

let l'' = (FStar_Syntax_Util.comp_effect_name cmp)
in (aux l''))
end
| uu____4628 -> begin
FStar_Pervasives_Native.None
end)
end)))
in (aux l'))
end
| FStar_Pervasives_Native.Some (uu____4629, l') -> begin
FStar_Pervasives_Native.Some (l')
end
| uu____4635 -> begin
FStar_Pervasives_Native.None
end)))


let lookup_letbinding_quals : env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.qualifier Prims.list = (fun env lid -> (

let k_global_def = (fun lid1 uu___168_4666 -> (match (uu___168_4666) with
| ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_declare_typ (uu____4675, uu____4676, uu____4677); FStar_Syntax_Syntax.sigrng = uu____4678; FStar_Syntax_Syntax.sigquals = quals; FStar_Syntax_Syntax.sigmeta = uu____4680; FStar_Syntax_Syntax.sigattrs = uu____4681}, uu____4682) -> begin
FStar_Pervasives_Native.Some (quals)
end
| uu____4689 -> begin
FStar_Pervasives_Native.None
end))
in (

let uu____4696 = (resolve_in_open_namespaces' env lid (fun uu____4704 -> FStar_Pervasives_Native.None) (fun uu____4708 -> FStar_Pervasives_Native.None) k_global_def)
in (match (uu____4696) with
| FStar_Pervasives_Native.Some (quals) -> begin
quals
end
| uu____4718 -> begin
[]
end))))


let try_lookup_module : env  ->  Prims.string Prims.list  ->  FStar_Syntax_Syntax.modul FStar_Pervasives_Native.option = (fun env path -> (

let uu____4737 = (FStar_List.tryFind (fun uu____4752 -> (match (uu____4752) with
| (mlid, modul) -> begin
(

let uu____4759 = (FStar_Ident.path_of_lid mlid)
in (Prims.op_Equality uu____4759 path))
end)) env.modules)
in (match (uu____4737) with
| FStar_Pervasives_Native.Some (uu____4766, modul) -> begin
FStar_Pervasives_Native.Some (modul)
end
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end)))


let try_lookup_let : env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.term FStar_Pervasives_Native.option = (fun env lid -> (

let k_global_def = (fun lid1 uu___169_4798 -> (match (uu___169_4798) with
| ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let ((uu____4805, lbs), uu____4807); FStar_Syntax_Syntax.sigrng = uu____4808; FStar_Syntax_Syntax.sigquals = uu____4809; FStar_Syntax_Syntax.sigmeta = uu____4810; FStar_Syntax_Syntax.sigattrs = uu____4811}, uu____4812) -> begin
(

let fv = (lb_fv lbs lid1)
in (

let uu____4832 = (FStar_Syntax_Syntax.fvar lid1 fv.FStar_Syntax_Syntax.fv_delta fv.FStar_Syntax_Syntax.fv_qual)
in FStar_Pervasives_Native.Some (uu____4832)))
end
| uu____4833 -> begin
FStar_Pervasives_Native.None
end))
in (resolve_in_open_namespaces' env lid (fun uu____4839 -> FStar_Pervasives_Native.None) (fun uu____4841 -> FStar_Pervasives_Native.None) k_global_def)))


let try_lookup_definition : env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.term FStar_Pervasives_Native.option = (fun env lid -> (

let k_global_def = (fun lid1 uu___170_4866 -> (match (uu___170_4866) with
| ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let (lbs, uu____4876); FStar_Syntax_Syntax.sigrng = uu____4877; FStar_Syntax_Syntax.sigquals = uu____4878; FStar_Syntax_Syntax.sigmeta = uu____4879; FStar_Syntax_Syntax.sigattrs = uu____4880}, uu____4881) -> begin
(FStar_Util.find_map (FStar_Pervasives_Native.snd lbs) (fun lb -> (match (lb.FStar_Syntax_Syntax.lbname) with
| FStar_Util.Inr (fv) when (FStar_Syntax_Syntax.fv_eq_lid fv lid1) -> begin
FStar_Pervasives_Native.Some (lb.FStar_Syntax_Syntax.lbdef)
end
| uu____4904 -> begin
FStar_Pervasives_Native.None
end)))
end
| uu____4911 -> begin
FStar_Pervasives_Native.None
end))
in (resolve_in_open_namespaces' env lid (fun uu____4921 -> FStar_Pervasives_Native.None) (fun uu____4925 -> FStar_Pervasives_Native.None) k_global_def)))


let empty_include_smap : FStar_Ident.lident Prims.list FStar_ST.ref FStar_Util.smap = (new_sigmap ())


let empty_exported_id_smap : exported_id_set FStar_Util.smap = (new_sigmap ())


let try_lookup_lid' : Prims.bool  ->  Prims.bool  ->  env  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.term * Prims.bool) FStar_Pervasives_Native.option = (fun any_val exclude_interf env lid -> (

let uu____4968 = (try_lookup_name any_val exclude_interf env lid)
in (match (uu____4968) with
| FStar_Pervasives_Native.Some (Term_name (e, mut)) -> begin
FStar_Pervasives_Native.Some (((e), (mut)))
end
| uu____4983 -> begin
FStar_Pervasives_Native.None
end)))


let try_lookup_lid : env  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.term * Prims.bool) FStar_Pervasives_Native.option = (fun env l -> (try_lookup_lid' env.iface false env l))


let resolve_to_fully_qualified_name : env  ->  FStar_Ident.lident  ->  FStar_Ident.lident FStar_Pervasives_Native.option = (fun env l -> (

let uu____5014 = (try_lookup_lid env l)
in (match (uu____5014) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (e, uu____5028) -> begin
(

let uu____5033 = (

let uu____5034 = (FStar_Syntax_Subst.compress e)
in uu____5034.FStar_Syntax_Syntax.n)
in (match (uu____5033) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
FStar_Pervasives_Native.Some (fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
end
| uu____5040 -> begin
FStar_Pervasives_Native.None
end))
end)))


let try_lookup_lid_no_resolve : env  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.term * Prims.bool) FStar_Pervasives_Native.option = (fun env l -> (

let env' = (

let uu___190_5056 = env
in {curmodule = uu___190_5056.curmodule; curmonad = uu___190_5056.curmonad; modules = uu___190_5056.modules; scope_mods = []; exported_ids = empty_exported_id_smap; trans_exported_ids = uu___190_5056.trans_exported_ids; includes = empty_include_smap; sigaccum = uu___190_5056.sigaccum; sigmap = uu___190_5056.sigmap; iface = uu___190_5056.iface; admitted_iface = uu___190_5056.admitted_iface; expect_typ = uu___190_5056.expect_typ; docs = uu___190_5056.docs; remaining_iface_decls = uu___190_5056.remaining_iface_decls; syntax_only = uu___190_5056.syntax_only})
in (try_lookup_lid env' l)))


let try_lookup_doc : env  ->  FStar_Ident.lid  ->  FStar_Parser_AST.fsdoc FStar_Pervasives_Native.option = (fun env l -> (FStar_Util.smap_try_find env.docs l.FStar_Ident.str))


let try_lookup_datacon : env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.fv FStar_Pervasives_Native.option = (fun env lid -> (

let k_global_def = (fun lid1 uu___172_5089 -> (match (uu___172_5089) with
| ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_declare_typ (uu____5096, uu____5097, uu____5098); FStar_Syntax_Syntax.sigrng = uu____5099; FStar_Syntax_Syntax.sigquals = quals; FStar_Syntax_Syntax.sigmeta = uu____5101; FStar_Syntax_Syntax.sigattrs = uu____5102}, uu____5103) -> begin
(

let uu____5108 = (FStar_All.pipe_right quals (FStar_Util.for_some (fun uu___171_5112 -> (match (uu___171_5112) with
| FStar_Syntax_Syntax.Assumption -> begin
true
end
| uu____5113 -> begin
false
end))))
in (match (uu____5108) with
| true -> begin
(

let uu____5116 = (FStar_Syntax_Syntax.lid_as_fv lid1 FStar_Syntax_Syntax.Delta_constant FStar_Pervasives_Native.None)
in FStar_Pervasives_Native.Some (uu____5116))
end
| uu____5117 -> begin
FStar_Pervasives_Native.None
end))
end
| ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_datacon (uu____5118); FStar_Syntax_Syntax.sigrng = uu____5119; FStar_Syntax_Syntax.sigquals = uu____5120; FStar_Syntax_Syntax.sigmeta = uu____5121; FStar_Syntax_Syntax.sigattrs = uu____5122}, uu____5123) -> begin
(

let uu____5142 = (FStar_Syntax_Syntax.lid_as_fv lid1 FStar_Syntax_Syntax.Delta_constant (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)))
in FStar_Pervasives_Native.Some (uu____5142))
end
| uu____5143 -> begin
FStar_Pervasives_Native.None
end))
in (resolve_in_open_namespaces' env lid (fun uu____5149 -> FStar_Pervasives_Native.None) (fun uu____5151 -> FStar_Pervasives_Native.None) k_global_def)))


let find_all_datacons : env  ->  FStar_Ident.lident  ->  FStar_Ident.lident Prims.list FStar_Pervasives_Native.option = (fun env lid -> (

let k_global_def = (fun lid1 uu___173_5178 -> (match (uu___173_5178) with
| ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_inductive_typ (uu____5187, uu____5188, uu____5189, uu____5190, datas, uu____5192); FStar_Syntax_Syntax.sigrng = uu____5193; FStar_Syntax_Syntax.sigquals = uu____5194; FStar_Syntax_Syntax.sigmeta = uu____5195; FStar_Syntax_Syntax.sigattrs = uu____5196}, uu____5197) -> begin
FStar_Pervasives_Native.Some (datas)
end
| uu____5212 -> begin
FStar_Pervasives_Native.None
end))
in (resolve_in_open_namespaces' env lid (fun uu____5222 -> FStar_Pervasives_Native.None) (fun uu____5226 -> FStar_Pervasives_Native.None) k_global_def)))


let record_cache_aux_with_filter : (((Prims.unit  ->  Prims.unit) * (Prims.unit  ->  Prims.unit) * (Prims.unit  ->  record_or_dc Prims.list) * (record_or_dc  ->  Prims.unit)) * (Prims.unit  ->  Prims.unit)) = (

let record_cache = (FStar_Util.mk_ref (([])::[]))
in (

let push1 = (fun uu____5271 -> (

let uu____5272 = (

let uu____5277 = (

let uu____5280 = (FStar_ST.op_Bang record_cache)
in (FStar_List.hd uu____5280))
in (

let uu____5327 = (FStar_ST.op_Bang record_cache)
in (uu____5277)::uu____5327))
in (FStar_ST.op_Colon_Equals record_cache uu____5272)))
in (

let pop1 = (fun uu____5417 -> (

let uu____5418 = (

let uu____5423 = (FStar_ST.op_Bang record_cache)
in (FStar_List.tl uu____5423))
in (FStar_ST.op_Colon_Equals record_cache uu____5418)))
in (

let peek1 = (fun uu____5515 -> (

let uu____5516 = (FStar_ST.op_Bang record_cache)
in (FStar_List.hd uu____5516)))
in (

let insert = (fun r -> (

let uu____5567 = (

let uu____5572 = (

let uu____5575 = (peek1 ())
in (r)::uu____5575)
in (

let uu____5578 = (

let uu____5583 = (FStar_ST.op_Bang record_cache)
in (FStar_List.tl uu____5583))
in (uu____5572)::uu____5578))
in (FStar_ST.op_Colon_Equals record_cache uu____5567)))
in (

let filter1 = (fun uu____5675 -> (

let rc = (peek1 ())
in (

let filtered = (FStar_List.filter (fun r -> (not (r.is_private_or_abstract))) rc)
in (

let uu____5684 = (

let uu____5689 = (

let uu____5694 = (FStar_ST.op_Bang record_cache)
in (FStar_List.tl uu____5694))
in (filtered)::uu____5689)
in (FStar_ST.op_Colon_Equals record_cache uu____5684)))))
in (

let aux = ((push1), (pop1), (peek1), (insert))
in ((aux), (filter1)))))))))


let record_cache_aux : ((Prims.unit  ->  Prims.unit) * (Prims.unit  ->  Prims.unit) * (Prims.unit  ->  record_or_dc Prims.list) * (record_or_dc  ->  Prims.unit)) = (

let uu____5850 = record_cache_aux_with_filter
in (match (uu____5850) with
| (aux, uu____5894) -> begin
aux
end))


let filter_record_cache : Prims.unit  ->  Prims.unit = (

let uu____5938 = record_cache_aux_with_filter
in (match (uu____5938) with
| (uu____5965, filter1) -> begin
filter1
end))


let push_record_cache : Prims.unit  ->  Prims.unit = (

let uu____6010 = record_cache_aux
in (match (uu____6010) with
| (push1, uu____6032, uu____6033, uu____6034) -> begin
push1
end))


let pop_record_cache : Prims.unit  ->  Prims.unit = (

let uu____6058 = record_cache_aux
in (match (uu____6058) with
| (uu____6079, pop1, uu____6081, uu____6082) -> begin
pop1
end))


let peek_record_cache : Prims.unit  ->  record_or_dc Prims.list = (

let uu____6108 = record_cache_aux
in (match (uu____6108) with
| (uu____6131, uu____6132, peek1, uu____6134) -> begin
peek1
end))


let insert_record_cache : record_or_dc  ->  Prims.unit = (

let uu____6158 = record_cache_aux
in (match (uu____6158) with
| (uu____6179, uu____6180, uu____6181, insert) -> begin
insert
end))


let extract_record : env  ->  scope_mod Prims.list FStar_ST.ref  ->  FStar_Syntax_Syntax.sigelt  ->  Prims.unit = (fun e new_globs se -> (match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_bundle (sigs, uu____6238) -> begin
(

let is_record = (FStar_Util.for_some (fun uu___174_6254 -> (match (uu___174_6254) with
| FStar_Syntax_Syntax.RecordType (uu____6255) -> begin
true
end
| FStar_Syntax_Syntax.RecordConstructor (uu____6264) -> begin
true
end
| uu____6273 -> begin
false
end)))
in (

let find_dc = (fun dc -> (FStar_All.pipe_right sigs (FStar_Util.find_opt (fun uu___175_6295 -> (match (uu___175_6295) with
| {FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_datacon (lid, uu____6297, uu____6298, uu____6299, uu____6300, uu____6301); FStar_Syntax_Syntax.sigrng = uu____6302; FStar_Syntax_Syntax.sigquals = uu____6303; FStar_Syntax_Syntax.sigmeta = uu____6304; FStar_Syntax_Syntax.sigattrs = uu____6305} -> begin
(FStar_Ident.lid_equals dc lid)
end
| uu____6314 -> begin
false
end)))))
in (FStar_All.pipe_right sigs (FStar_List.iter (fun uu___176_6349 -> (match (uu___176_6349) with
| {FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_inductive_typ (typename, univs1, parms, uu____6353, uu____6354, (dc)::[]); FStar_Syntax_Syntax.sigrng = uu____6356; FStar_Syntax_Syntax.sigquals = typename_quals; FStar_Syntax_Syntax.sigmeta = uu____6358; FStar_Syntax_Syntax.sigattrs = uu____6359} -> begin
(

let uu____6370 = (

let uu____6371 = (find_dc dc)
in (FStar_All.pipe_left FStar_Util.must uu____6371))
in (match (uu____6370) with
| {FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_datacon (constrname, uu____6377, t, uu____6379, uu____6380, uu____6381); FStar_Syntax_Syntax.sigrng = uu____6382; FStar_Syntax_Syntax.sigquals = uu____6383; FStar_Syntax_Syntax.sigmeta = uu____6384; FStar_Syntax_Syntax.sigattrs = uu____6385} -> begin
(

let uu____6394 = (FStar_Syntax_Util.arrow_formals t)
in (match (uu____6394) with
| (formals, uu____6408) -> begin
(

let is_rec = (is_record typename_quals)
in (

let formals' = (FStar_All.pipe_right formals (FStar_List.collect (fun uu____6457 -> (match (uu____6457) with
| (x, q) -> begin
(

let uu____6470 = ((FStar_Syntax_Syntax.is_null_bv x) || (is_rec && (FStar_Syntax_Syntax.is_implicit q)))
in (match (uu____6470) with
| true -> begin
[]
end
| uu____6481 -> begin
(((x), (q)))::[]
end))
end))))
in (

let fields' = (FStar_All.pipe_right formals' (FStar_List.map (fun uu____6527 -> (match (uu____6527) with
| (x, q) -> begin
(

let uu____6540 = (match (is_rec) with
| true -> begin
(FStar_Syntax_Util.unmangle_field_name x.FStar_Syntax_Syntax.ppname)
end
| uu____6541 -> begin
x.FStar_Syntax_Syntax.ppname
end)
in ((uu____6540), (x.FStar_Syntax_Syntax.sort)))
end))))
in (

let fields = fields'
in (

let record = {typename = typename; constrname = constrname.FStar_Ident.ident; parms = parms; fields = fields; is_private_or_abstract = ((FStar_List.contains FStar_Syntax_Syntax.Private typename_quals) || (FStar_List.contains FStar_Syntax_Syntax.Abstract typename_quals)); is_record = is_rec}
in ((

let uu____6555 = (

let uu____6558 = (FStar_ST.op_Bang new_globs)
in (Record_or_dc (record))::uu____6558)
in (FStar_ST.op_Colon_Equals new_globs uu____6555));
(match (()) with
| () -> begin
((

let add_field = (fun uu____6635 -> (match (uu____6635) with
| (id, uu____6643) -> begin
(

let modul = (

let uu____6649 = (FStar_Ident.lid_of_ids constrname.FStar_Ident.ns)
in uu____6649.FStar_Ident.str)
in (

let uu____6650 = (get_exported_id_set e modul)
in (match (uu____6650) with
| FStar_Pervasives_Native.Some (my_ex) -> begin
(

let my_exported_ids = (my_ex Exported_id_field)
in ((

let uu____6677 = (

let uu____6678 = (FStar_ST.op_Bang my_exported_ids)
in (FStar_Util.set_add id.FStar_Ident.idText uu____6678))
in (FStar_ST.op_Colon_Equals my_exported_ids uu____6677));
(match (()) with
| () -> begin
(

let projname = (

let uu____6730 = (

let uu____6731 = (FStar_Syntax_Util.mk_field_projector_name_from_ident constrname id)
in uu____6731.FStar_Ident.ident)
in uu____6730.FStar_Ident.idText)
in (

let uu____6733 = (

let uu____6734 = (FStar_ST.op_Bang my_exported_ids)
in (FStar_Util.set_add projname uu____6734))
in (FStar_ST.op_Colon_Equals my_exported_ids uu____6733)))
end);
))
end
| FStar_Pervasives_Native.None -> begin
()
end)))
end))
in (FStar_List.iter add_field fields'));
(match (()) with
| () -> begin
(insert_record_cache record)
end);
)
end);
))))))
end))
end
| uu____6795 -> begin
()
end))
end
| uu____6796 -> begin
()
end))))))
end
| uu____6797 -> begin
()
end))


let try_lookup_record_or_dc_by_field_name : env  ->  FStar_Ident.lident  ->  record_or_dc FStar_Pervasives_Native.option = (fun env fieldname -> (

let find_in_cache = (fun fieldname1 -> (

let uu____6814 = ((fieldname1.FStar_Ident.ns), (fieldname1.FStar_Ident.ident))
in (match (uu____6814) with
| (ns, id) -> begin
(

let uu____6831 = (peek_record_cache ())
in (FStar_Util.find_map uu____6831 (fun record -> (

let uu____6837 = (find_in_record ns id record (fun r -> Cont_ok (r)))
in (option_of_cont (fun uu____6843 -> FStar_Pervasives_Native.None) uu____6837)))))
end)))
in (resolve_in_open_namespaces'' env fieldname Exported_id_field (fun uu____6845 -> Cont_ignore) (fun uu____6847 -> Cont_ignore) (fun r -> Cont_ok (r)) (fun fn -> (

let uu____6853 = (find_in_cache fn)
in (cont_of_option Cont_ignore uu____6853))) (fun k uu____6859 -> k))))


let try_lookup_record_by_field_name : env  ->  FStar_Ident.lident  ->  record_or_dc FStar_Pervasives_Native.option = (fun env fieldname -> (

let uu____6872 = (try_lookup_record_or_dc_by_field_name env fieldname)
in (match (uu____6872) with
| FStar_Pervasives_Native.Some (r) when r.is_record -> begin
FStar_Pervasives_Native.Some (r)
end
| uu____6878 -> begin
FStar_Pervasives_Native.None
end)))


let belongs_to_record : env  ->  FStar_Ident.lident  ->  record_or_dc  ->  Prims.bool = (fun env lid record -> (

let uu____6893 = (try_lookup_record_by_field_name env lid)
in (match (uu____6893) with
| FStar_Pervasives_Native.Some (record') when (

let uu____6897 = (

let uu____6898 = (FStar_Ident.path_of_ns record.typename.FStar_Ident.ns)
in (FStar_Ident.text_of_path uu____6898))
in (

let uu____6901 = (

let uu____6902 = (FStar_Ident.path_of_ns record'.typename.FStar_Ident.ns)
in (FStar_Ident.text_of_path uu____6902))
in (Prims.op_Equality uu____6897 uu____6901))) -> begin
(

let uu____6905 = (find_in_record record.typename.FStar_Ident.ns lid.FStar_Ident.ident record (fun uu____6909 -> Cont_ok (())))
in (match (uu____6905) with
| Cont_ok (uu____6910) -> begin
true
end
| uu____6911 -> begin
false
end))
end
| uu____6914 -> begin
false
end)))


let try_lookup_dc_by_field_name : env  ->  FStar_Ident.lident  ->  (FStar_Ident.lident * Prims.bool) FStar_Pervasives_Native.option = (fun env fieldname -> (

let uu____6931 = (try_lookup_record_or_dc_by_field_name env fieldname)
in (match (uu____6931) with
| FStar_Pervasives_Native.Some (r) -> begin
(

let uu____6941 = (

let uu____6946 = (

let uu____6947 = (FStar_Ident.lid_of_ids (FStar_List.append r.typename.FStar_Ident.ns ((r.constrname)::[])))
in (FStar_Ident.set_lid_range uu____6947 (FStar_Ident.range_of_lid fieldname)))
in ((uu____6946), (r.is_record)))
in FStar_Pervasives_Native.Some (uu____6941))
end
| uu____6952 -> begin
FStar_Pervasives_Native.None
end)))


let string_set_ref_new : Prims.unit  ->  Prims.string FStar_Util.set FStar_ST.ref = (fun uu____6973 -> (

let uu____6974 = (FStar_Util.new_set FStar_Util.compare)
in (FStar_Util.mk_ref uu____6974)))


let exported_id_set_new : Prims.unit  ->  exported_id_kind  ->  Prims.string FStar_Util.set FStar_ST.ref = (fun uu____6995 -> (

let term_type_set = (string_set_ref_new ())
in (

let field_set = (string_set_ref_new ())
in (fun uu___177_7006 -> (match (uu___177_7006) with
| Exported_id_term_type -> begin
term_type_set
end
| Exported_id_field -> begin
field_set
end)))))


let unique : Prims.bool  ->  Prims.bool  ->  env  ->  FStar_Ident.lident  ->  Prims.bool = (fun any_val exclude_if env lid -> (

let filter_scope_mods = (fun uu___178_7044 -> (match (uu___178_7044) with
| Rec_binding (uu____7045) -> begin
true
end
| uu____7046 -> begin
false
end))
in (

let this_env = (

let uu___191_7048 = env
in (

let uu____7049 = (FStar_List.filter filter_scope_mods env.scope_mods)
in {curmodule = uu___191_7048.curmodule; curmonad = uu___191_7048.curmonad; modules = uu___191_7048.modules; scope_mods = uu____7049; exported_ids = empty_exported_id_smap; trans_exported_ids = uu___191_7048.trans_exported_ids; includes = empty_include_smap; sigaccum = uu___191_7048.sigaccum; sigmap = uu___191_7048.sigmap; iface = uu___191_7048.iface; admitted_iface = uu___191_7048.admitted_iface; expect_typ = uu___191_7048.expect_typ; docs = uu___191_7048.docs; remaining_iface_decls = uu___191_7048.remaining_iface_decls; syntax_only = uu___191_7048.syntax_only}))
in (

let uu____7052 = (try_lookup_lid' any_val exclude_if this_env lid)
in (match (uu____7052) with
| FStar_Pervasives_Native.None -> begin
true
end
| FStar_Pervasives_Native.Some (uu____7063) -> begin
false
end)))))


let push_scope_mod : env  ->  scope_mod  ->  env = (fun env scope_mod -> (

let uu___192_7080 = env
in {curmodule = uu___192_7080.curmodule; curmonad = uu___192_7080.curmonad; modules = uu___192_7080.modules; scope_mods = (scope_mod)::env.scope_mods; exported_ids = uu___192_7080.exported_ids; trans_exported_ids = uu___192_7080.trans_exported_ids; includes = uu___192_7080.includes; sigaccum = uu___192_7080.sigaccum; sigmap = uu___192_7080.sigmap; iface = uu___192_7080.iface; admitted_iface = uu___192_7080.admitted_iface; expect_typ = uu___192_7080.expect_typ; docs = uu___192_7080.docs; remaining_iface_decls = uu___192_7080.remaining_iface_decls; syntax_only = uu___192_7080.syntax_only}))


let push_bv' : env  ->  FStar_Ident.ident  ->  Prims.bool  ->  (env * FStar_Syntax_Syntax.bv) = (fun env x is_mutable -> (

let bv = (FStar_Syntax_Syntax.gen_bv x.FStar_Ident.idText (FStar_Pervasives_Native.Some (x.FStar_Ident.idRange)) FStar_Syntax_Syntax.tun)
in (((push_scope_mod env (Local_binding (((x), (bv), (is_mutable)))))), (bv))))


let push_bv_mutable : env  ->  FStar_Ident.ident  ->  (env * FStar_Syntax_Syntax.bv) = (fun env x -> (push_bv' env x true))


let push_bv : env  ->  FStar_Ident.ident  ->  (env * FStar_Syntax_Syntax.bv) = (fun env x -> (push_bv' env x false))


let push_top_level_rec_binding : env  ->  FStar_Ident.ident  ->  FStar_Syntax_Syntax.delta_depth  ->  env = (fun env x dd -> (

let l = (qualify env x)
in (

let uu____7135 = ((unique false true env l) || (FStar_Options.interactive ()))
in (match (uu____7135) with
| true -> begin
(push_scope_mod env (Rec_binding (((x), (l), (dd)))))
end
| uu____7136 -> begin
(FStar_Exn.raise (FStar_Errors.Error ((((Prims.strcat "Duplicate top-level names " l.FStar_Ident.str)), ((FStar_Ident.range_of_lid l))))))
end))))


let push_sigelt : env  ->  FStar_Syntax_Syntax.sigelt  ->  env = (fun env s -> (

let err1 = (fun l -> (

let sopt = (FStar_Util.smap_try_find (sigmap env) l.FStar_Ident.str)
in (

let r = (match (sopt) with
| FStar_Pervasives_Native.Some (se, uu____7162) -> begin
(

let uu____7167 = (FStar_Util.find_opt (FStar_Ident.lid_equals l) (FStar_Syntax_Util.lids_of_sigelt se))
in (match (uu____7167) with
| FStar_Pervasives_Native.Some (l1) -> begin
(FStar_All.pipe_left FStar_Range.string_of_range (FStar_Ident.range_of_lid l1))
end
| FStar_Pervasives_Native.None -> begin
"<unknown>"
end))
end
| FStar_Pervasives_Native.None -> begin
"<unknown>"
end)
in (

let uu____7175 = (

let uu____7176 = (

let uu____7181 = (FStar_Util.format2 "Duplicate top-level names [%s]; previously declared at %s" (FStar_Ident.text_of_lid l) r)
in ((uu____7181), ((FStar_Ident.range_of_lid l))))
in FStar_Errors.Error (uu____7176))
in (FStar_Exn.raise uu____7175)))))
in (

let globals = (FStar_Util.mk_ref env.scope_mods)
in (

let env1 = (

let uu____7190 = (match (s.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_let (uu____7199) -> begin
((false), (true))
end
| FStar_Syntax_Syntax.Sig_bundle (uu____7206) -> begin
((true), (true))
end
| uu____7215 -> begin
((false), (false))
end)
in (match (uu____7190) with
| (any_val, exclude_if) -> begin
(

let lids = (FStar_Syntax_Util.lids_of_sigelt s)
in (

let uu____7221 = (FStar_Util.find_map lids (fun l -> (

let uu____7227 = (

let uu____7228 = (unique any_val exclude_if env l)
in (not (uu____7228)))
in (match (uu____7227) with
| true -> begin
FStar_Pervasives_Native.Some (l)
end
| uu____7231 -> begin
FStar_Pervasives_Native.None
end))))
in (match (uu____7221) with
| FStar_Pervasives_Native.Some (l) when (

let uu____7233 = (FStar_Options.interactive ())
in (not (uu____7233))) -> begin
(err1 l)
end
| uu____7234 -> begin
((extract_record env globals s);
(

let uu___193_7252 = env
in {curmodule = uu___193_7252.curmodule; curmonad = uu___193_7252.curmonad; modules = uu___193_7252.modules; scope_mods = uu___193_7252.scope_mods; exported_ids = uu___193_7252.exported_ids; trans_exported_ids = uu___193_7252.trans_exported_ids; includes = uu___193_7252.includes; sigaccum = (s)::env.sigaccum; sigmap = uu___193_7252.sigmap; iface = uu___193_7252.iface; admitted_iface = uu___193_7252.admitted_iface; expect_typ = uu___193_7252.expect_typ; docs = uu___193_7252.docs; remaining_iface_decls = uu___193_7252.remaining_iface_decls; syntax_only = uu___193_7252.syntax_only});
)
end)))
end))
in (

let env2 = (

let uu___194_7254 = env1
in (

let uu____7255 = (FStar_ST.op_Bang globals)
in {curmodule = uu___194_7254.curmodule; curmonad = uu___194_7254.curmonad; modules = uu___194_7254.modules; scope_mods = uu____7255; exported_ids = uu___194_7254.exported_ids; trans_exported_ids = uu___194_7254.trans_exported_ids; includes = uu___194_7254.includes; sigaccum = uu___194_7254.sigaccum; sigmap = uu___194_7254.sigmap; iface = uu___194_7254.iface; admitted_iface = uu___194_7254.admitted_iface; expect_typ = uu___194_7254.expect_typ; docs = uu___194_7254.docs; remaining_iface_decls = uu___194_7254.remaining_iface_decls; syntax_only = uu___194_7254.syntax_only}))
in (

let uu____7290 = (match (s.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_bundle (ses, uu____7316) -> begin
(

let uu____7325 = (FStar_List.map (fun se -> (((FStar_Syntax_Util.lids_of_sigelt se)), (se))) ses)
in ((env2), (uu____7325)))
end
| uu____7352 -> begin
((env2), (((((FStar_Syntax_Util.lids_of_sigelt s)), (s)))::[]))
end)
in (match (uu____7290) with
| (env3, lss) -> begin
((FStar_All.pipe_right lss (FStar_List.iter (fun uu____7411 -> (match (uu____7411) with
| (lids, se) -> begin
(FStar_All.pipe_right lids (FStar_List.iter (fun lid -> ((

let uu____7432 = (

let uu____7435 = (FStar_ST.op_Bang globals)
in (Top_level_def (lid.FStar_Ident.ident))::uu____7435)
in (FStar_ST.op_Colon_Equals globals uu____7432));
(match (()) with
| () -> begin
(

let modul = (

let uu____7503 = (FStar_Ident.lid_of_ids lid.FStar_Ident.ns)
in uu____7503.FStar_Ident.str)
in ((

let uu____7505 = (get_exported_id_set env3 modul)
in (match (uu____7505) with
| FStar_Pervasives_Native.Some (f) -> begin
(

let my_exported_ids = (f Exported_id_term_type)
in (

let uu____7531 = (

let uu____7532 = (FStar_ST.op_Bang my_exported_ids)
in (FStar_Util.set_add lid.FStar_Ident.ident.FStar_Ident.idText uu____7532))
in (FStar_ST.op_Colon_Equals my_exported_ids uu____7531)))
end
| FStar_Pervasives_Native.None -> begin
()
end));
(match (()) with
| () -> begin
(FStar_Util.smap_add (sigmap env3) lid.FStar_Ident.str ((se), ((env3.iface && (not (env3.admitted_iface))))))
end);
))
end);
))))
end))));
(

let env4 = (

let uu___195_7592 = env3
in (

let uu____7593 = (FStar_ST.op_Bang globals)
in {curmodule = uu___195_7592.curmodule; curmonad = uu___195_7592.curmonad; modules = uu___195_7592.modules; scope_mods = uu____7593; exported_ids = uu___195_7592.exported_ids; trans_exported_ids = uu___195_7592.trans_exported_ids; includes = uu___195_7592.includes; sigaccum = uu___195_7592.sigaccum; sigmap = uu___195_7592.sigmap; iface = uu___195_7592.iface; admitted_iface = uu___195_7592.admitted_iface; expect_typ = uu___195_7592.expect_typ; docs = uu___195_7592.docs; remaining_iface_decls = uu___195_7592.remaining_iface_decls; syntax_only = uu___195_7592.syntax_only}))
in env4);
)
end)))))))


let push_namespace : env  ->  FStar_Ident.lident  ->  env = (fun env ns -> (

let uu____7636 = (

let uu____7641 = (resolve_module_name env ns false)
in (match (uu____7641) with
| FStar_Pervasives_Native.None -> begin
(

let modules = env.modules
in (

let uu____7655 = (FStar_All.pipe_right modules (FStar_Util.for_some (fun uu____7669 -> (match (uu____7669) with
| (m, uu____7675) -> begin
(FStar_Util.starts_with (Prims.strcat (FStar_Ident.text_of_lid m) ".") (Prims.strcat (FStar_Ident.text_of_lid ns) "."))
end))))
in (match (uu____7655) with
| true -> begin
((ns), (Open_namespace))
end
| uu____7680 -> begin
(

let uu____7681 = (

let uu____7682 = (

let uu____7687 = (FStar_Util.format1 "Namespace %s cannot be found" (FStar_Ident.text_of_lid ns))
in ((uu____7687), ((FStar_Ident.range_of_lid ns))))
in FStar_Errors.Error (uu____7682))
in (FStar_Exn.raise uu____7681))
end)))
end
| FStar_Pervasives_Native.Some (ns') -> begin
((fail_if_curmodule env ns ns');
((ns'), (Open_module));
)
end))
in (match (uu____7636) with
| (ns', kd) -> begin
(push_scope_mod env (Open_module_or_namespace (((ns'), (kd)))))
end)))


let push_include : env  ->  FStar_Ident.lident  ->  env = (fun env ns -> (

let ns0 = ns
in (

let uu____7705 = (resolve_module_name env ns false)
in (match (uu____7705) with
| FStar_Pervasives_Native.Some (ns1) -> begin
((fail_if_curmodule env ns0 ns1);
(

let env1 = (push_scope_mod env (Open_module_or_namespace (((ns1), (Open_module)))))
in (

let curmod = (

let uu____7712 = (current_module env1)
in uu____7712.FStar_Ident.str)
in ((

let uu____7714 = (FStar_Util.smap_try_find env1.includes curmod)
in (match (uu____7714) with
| FStar_Pervasives_Native.None -> begin
()
end
| FStar_Pervasives_Native.Some (incl) -> begin
(

let uu____7738 = (

let uu____7741 = (FStar_ST.op_Bang incl)
in (ns1)::uu____7741)
in (FStar_ST.op_Colon_Equals incl uu____7738))
end));
(match (()) with
| () -> begin
(

let uu____7808 = (get_trans_exported_id_set env1 ns1.FStar_Ident.str)
in (match (uu____7808) with
| FStar_Pervasives_Native.Some (ns_trans_exports) -> begin
((

let uu____7825 = (

let uu____7842 = (get_exported_id_set env1 curmod)
in (

let uu____7849 = (get_trans_exported_id_set env1 curmod)
in ((uu____7842), (uu____7849))))
in (match (uu____7825) with
| (FStar_Pervasives_Native.Some (cur_exports), FStar_Pervasives_Native.Some (cur_trans_exports)) -> begin
(

let update_exports = (fun k -> (

let ns_ex = (

let uu____7903 = (ns_trans_exports k)
in (FStar_ST.op_Bang uu____7903))
in (

let ex = (cur_exports k)
in ((

let uu____8086 = (

let uu____8087 = (FStar_ST.op_Bang ex)
in (FStar_Util.set_difference uu____8087 ns_ex))
in (FStar_ST.op_Colon_Equals ex uu____8086));
(match (()) with
| () -> begin
(

let trans_ex = (cur_trans_exports k)
in (

let uu____8149 = (

let uu____8150 = (FStar_ST.op_Bang trans_ex)
in (FStar_Util.set_union uu____8150 ns_ex))
in (FStar_ST.op_Colon_Equals trans_ex uu____8149)))
end);
))))
in (FStar_List.iter update_exports all_exported_id_kinds))
end
| uu____8201 -> begin
()
end));
(match (()) with
| () -> begin
env1
end);
)
end
| FStar_Pervasives_Native.None -> begin
(

let uu____8222 = (

let uu____8223 = (

let uu____8228 = (FStar_Util.format1 "include: Module %s was not prepared" ns1.FStar_Ident.str)
in ((uu____8228), ((FStar_Ident.range_of_lid ns1))))
in FStar_Errors.Error (uu____8223))
in (FStar_Exn.raise uu____8222))
end))
end);
)));
)
end
| uu____8229 -> begin
(

let uu____8232 = (

let uu____8233 = (

let uu____8238 = (FStar_Util.format1 "include: Module %s cannot be found" ns.FStar_Ident.str)
in ((uu____8238), ((FStar_Ident.range_of_lid ns))))
in FStar_Errors.Error (uu____8233))
in (FStar_Exn.raise uu____8232))
end))))


let push_module_abbrev : env  ->  FStar_Ident.ident  ->  FStar_Ident.lident  ->  env = (fun env x l -> (

let uu____8251 = (module_is_defined env l)
in (match (uu____8251) with
| true -> begin
((fail_if_curmodule env l l);
(push_scope_mod env (Module_abbrev (((x), (l)))));
)
end
| uu____8253 -> begin
(

let uu____8254 = (

let uu____8255 = (

let uu____8260 = (FStar_Util.format1 "Module %s cannot be found" (FStar_Ident.text_of_lid l))
in ((uu____8260), ((FStar_Ident.range_of_lid l))))
in FStar_Errors.Error (uu____8255))
in (FStar_Exn.raise uu____8254))
end)))


let push_doc : env  ->  FStar_Ident.lident  ->  FStar_Parser_AST.fsdoc FStar_Pervasives_Native.option  ->  env = (fun env l doc_opt -> (match (doc_opt) with
| FStar_Pervasives_Native.None -> begin
env
end
| FStar_Pervasives_Native.Some (doc1) -> begin
((

let uu____8279 = (FStar_Util.smap_try_find env.docs l.FStar_Ident.str)
in (match (uu____8279) with
| FStar_Pervasives_Native.None -> begin
()
end
| FStar_Pervasives_Native.Some (old_doc) -> begin
(

let uu____8283 = (

let uu____8284 = (FStar_Ident.string_of_lid l)
in (

let uu____8285 = (FStar_Parser_AST.string_of_fsdoc old_doc)
in (

let uu____8286 = (FStar_Parser_AST.string_of_fsdoc doc1)
in (FStar_Util.format3 "Overwriting doc of %s; old doc was [%s]; new doc are [%s]" uu____8284 uu____8285 uu____8286))))
in (FStar_Errors.warn (FStar_Ident.range_of_lid l) uu____8283))
end));
(FStar_Util.smap_add env.docs l.FStar_Ident.str doc1);
env;
)
end))


let check_admits : env  ->  Prims.unit = (fun env -> (FStar_All.pipe_right env.sigaccum (FStar_List.iter (fun se -> (match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_declare_typ (l, u, t) -> begin
(

let uu____8303 = (try_lookup_lid env l)
in (match (uu____8303) with
| FStar_Pervasives_Native.None -> begin
((

let uu____8315 = (

let uu____8316 = (FStar_Options.interactive ())
in (not (uu____8316)))
in (match (uu____8315) with
| true -> begin
(

let uu____8317 = (

let uu____8318 = (FStar_Syntax_Print.lid_to_string l)
in (FStar_Util.format1 "Admitting %s without a definition" uu____8318))
in (FStar_Errors.warn (FStar_Ident.range_of_lid l) uu____8317))
end
| uu____8319 -> begin
()
end));
(

let quals = (FStar_Syntax_Syntax.Assumption)::se.FStar_Syntax_Syntax.sigquals
in (FStar_Util.smap_add (sigmap env) l.FStar_Ident.str (((

let uu___196_8328 = se
in {FStar_Syntax_Syntax.sigel = uu___196_8328.FStar_Syntax_Syntax.sigel; FStar_Syntax_Syntax.sigrng = uu___196_8328.FStar_Syntax_Syntax.sigrng; FStar_Syntax_Syntax.sigquals = quals; FStar_Syntax_Syntax.sigmeta = uu___196_8328.FStar_Syntax_Syntax.sigmeta; FStar_Syntax_Syntax.sigattrs = uu___196_8328.FStar_Syntax_Syntax.sigattrs})), (false))));
)
end
| FStar_Pervasives_Native.Some (uu____8329) -> begin
()
end))
end
| uu____8338 -> begin
()
end)))))


let finish : env  ->  FStar_Syntax_Syntax.modul  ->  env = (fun env modul -> ((FStar_All.pipe_right modul.FStar_Syntax_Syntax.declarations (FStar_List.iter (fun se -> (

let quals = se.FStar_Syntax_Syntax.sigquals
in (match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_bundle (ses, uu____8357) -> begin
(match (((FStar_List.contains FStar_Syntax_Syntax.Private quals) || (FStar_List.contains FStar_Syntax_Syntax.Abstract quals))) with
| true -> begin
(FStar_All.pipe_right ses (FStar_List.iter (fun se1 -> (match (se1.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_datacon (lid, uu____8377, uu____8378, uu____8379, uu____8380, uu____8381) -> begin
(FStar_Util.smap_remove (sigmap env) lid.FStar_Ident.str)
end
| uu____8390 -> begin
()
end))))
end
| uu____8391 -> begin
()
end)
end
| FStar_Syntax_Syntax.Sig_declare_typ (lid, uu____8393, uu____8394) -> begin
(match ((FStar_List.contains FStar_Syntax_Syntax.Private quals)) with
| true -> begin
(FStar_Util.smap_remove (sigmap env) lid.FStar_Ident.str)
end
| uu____8399 -> begin
()
end)
end
| FStar_Syntax_Syntax.Sig_let ((uu____8400, lbs), uu____8402) -> begin
((match (((FStar_List.contains FStar_Syntax_Syntax.Private quals) || (FStar_List.contains FStar_Syntax_Syntax.Abstract quals))) with
| true -> begin
(FStar_All.pipe_right lbs (FStar_List.iter (fun lb -> (

let uu____8423 = (

let uu____8424 = (

let uu____8425 = (

let uu____8428 = (FStar_Util.right lb.FStar_Syntax_Syntax.lbname)
in uu____8428.FStar_Syntax_Syntax.fv_name)
in uu____8425.FStar_Syntax_Syntax.v)
in uu____8424.FStar_Ident.str)
in (FStar_Util.smap_remove (sigmap env) uu____8423)))))
end
| uu____8433 -> begin
()
end);
(match (((FStar_List.contains FStar_Syntax_Syntax.Abstract quals) && (not ((FStar_List.contains FStar_Syntax_Syntax.Private quals))))) with
| true -> begin
(FStar_All.pipe_right lbs (FStar_List.iter (fun lb -> (

let lid = (

let uu____8442 = (

let uu____8445 = (FStar_Util.right lb.FStar_Syntax_Syntax.lbname)
in uu____8445.FStar_Syntax_Syntax.fv_name)
in uu____8442.FStar_Syntax_Syntax.v)
in (

let quals1 = (FStar_Syntax_Syntax.Assumption)::quals
in (

let decl = (

let uu___197_8450 = se
in {FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_declare_typ (((lid), (lb.FStar_Syntax_Syntax.lbunivs), (lb.FStar_Syntax_Syntax.lbtyp))); FStar_Syntax_Syntax.sigrng = uu___197_8450.FStar_Syntax_Syntax.sigrng; FStar_Syntax_Syntax.sigquals = quals1; FStar_Syntax_Syntax.sigmeta = uu___197_8450.FStar_Syntax_Syntax.sigmeta; FStar_Syntax_Syntax.sigattrs = uu___197_8450.FStar_Syntax_Syntax.sigattrs})
in (FStar_Util.smap_add (sigmap env) lid.FStar_Ident.str ((decl), (false)))))))))
end
| uu____8459 -> begin
()
end);
)
end
| uu____8460 -> begin
()
end)))));
(

let curmod = (

let uu____8462 = (current_module env)
in uu____8462.FStar_Ident.str)
in ((

let uu____8464 = (

let uu____8481 = (get_exported_id_set env curmod)
in (

let uu____8488 = (get_trans_exported_id_set env curmod)
in ((uu____8481), (uu____8488))))
in (match (uu____8464) with
| (FStar_Pervasives_Native.Some (cur_ex), FStar_Pervasives_Native.Some (cur_trans_ex)) -> begin
(

let update_exports = (fun eikind -> (

let cur_ex_set = (

let uu____8542 = (cur_ex eikind)
in (FStar_ST.op_Bang uu____8542))
in (

let cur_trans_ex_set_ref = (cur_trans_ex eikind)
in (

let uu____8724 = (

let uu____8725 = (FStar_ST.op_Bang cur_trans_ex_set_ref)
in (FStar_Util.set_union cur_ex_set uu____8725))
in (FStar_ST.op_Colon_Equals cur_trans_ex_set_ref uu____8724)))))
in (FStar_List.iter update_exports all_exported_id_kinds))
end
| uu____8776 -> begin
()
end));
(match (()) with
| () -> begin
((filter_record_cache ());
(match (()) with
| () -> begin
(

let uu___198_8794 = env
in {curmodule = FStar_Pervasives_Native.None; curmonad = uu___198_8794.curmonad; modules = (((modul.FStar_Syntax_Syntax.name), (modul)))::env.modules; scope_mods = []; exported_ids = uu___198_8794.exported_ids; trans_exported_ids = uu___198_8794.trans_exported_ids; includes = uu___198_8794.includes; sigaccum = []; sigmap = uu___198_8794.sigmap; iface = uu___198_8794.iface; admitted_iface = uu___198_8794.admitted_iface; expect_typ = uu___198_8794.expect_typ; docs = uu___198_8794.docs; remaining_iface_decls = uu___198_8794.remaining_iface_decls; syntax_only = uu___198_8794.syntax_only})
end);
)
end);
));
))


let stack : env Prims.list FStar_ST.ref = (FStar_Util.mk_ref [])


let push : env  ->  env = (fun env -> ((push_record_cache ());
(

let uu____8818 = (

let uu____8821 = (FStar_ST.op_Bang stack)
in (env)::uu____8821)
in (FStar_ST.op_Colon_Equals stack uu____8818));
(

let uu___199_8860 = env
in (

let uu____8861 = (FStar_Util.smap_copy (sigmap env))
in (

let uu____8872 = (FStar_Util.smap_copy env.docs)
in {curmodule = uu___199_8860.curmodule; curmonad = uu___199_8860.curmonad; modules = uu___199_8860.modules; scope_mods = uu___199_8860.scope_mods; exported_ids = uu___199_8860.exported_ids; trans_exported_ids = uu___199_8860.trans_exported_ids; includes = uu___199_8860.includes; sigaccum = uu___199_8860.sigaccum; sigmap = uu____8861; iface = uu___199_8860.iface; admitted_iface = uu___199_8860.admitted_iface; expect_typ = uu___199_8860.expect_typ; docs = uu____8872; remaining_iface_decls = uu___199_8860.remaining_iface_decls; syntax_only = uu___199_8860.syntax_only})));
))


let pop : Prims.unit  ->  env = (fun uu____8878 -> (

let uu____8879 = (FStar_ST.op_Bang stack)
in (match (uu____8879) with
| (env)::tl1 -> begin
((pop_record_cache ());
(FStar_ST.op_Colon_Equals stack tl1);
env;
)
end
| uu____8924 -> begin
(failwith "Impossible: Too many pops")
end)))


let export_interface : FStar_Ident.lident  ->  env  ->  env = (fun m env -> (

let sigelt_in_m = (fun se -> (match ((FStar_Syntax_Util.lids_of_sigelt se)) with
| (l)::uu____8940 -> begin
(Prims.op_Equality l.FStar_Ident.nsstr m.FStar_Ident.str)
end
| uu____8943 -> begin
false
end))
in (

let sm = (sigmap env)
in (

let env1 = (pop ())
in (

let keys = (FStar_Util.smap_keys sm)
in (

let sm' = (sigmap env1)
in ((FStar_All.pipe_right keys (FStar_List.iter (fun k -> (

let uu____8977 = (FStar_Util.smap_try_find sm' k)
in (match (uu____8977) with
| FStar_Pervasives_Native.Some (se, true) when (sigelt_in_m se) -> begin
((FStar_Util.smap_remove sm' k);
(

let se1 = (match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_declare_typ (l, u, t) -> begin
(

let uu___200_9002 = se
in {FStar_Syntax_Syntax.sigel = uu___200_9002.FStar_Syntax_Syntax.sigel; FStar_Syntax_Syntax.sigrng = uu___200_9002.FStar_Syntax_Syntax.sigrng; FStar_Syntax_Syntax.sigquals = (FStar_Syntax_Syntax.Assumption)::se.FStar_Syntax_Syntax.sigquals; FStar_Syntax_Syntax.sigmeta = uu___200_9002.FStar_Syntax_Syntax.sigmeta; FStar_Syntax_Syntax.sigattrs = uu___200_9002.FStar_Syntax_Syntax.sigattrs})
end
| uu____9003 -> begin
se
end)
in (FStar_Util.smap_add sm' k ((se1), (false))));
)
end
| uu____9008 -> begin
()
end)))));
env1;
)))))))


let finish_module_or_interface : env  ->  FStar_Syntax_Syntax.modul  ->  env = (fun env modul -> ((match ((not (modul.FStar_Syntax_Syntax.is_interface))) with
| true -> begin
(check_admits env)
end
| uu____9024 -> begin
()
end);
(finish env modul);
))

type exported_ids =
{exported_id_terms : Prims.string Prims.list; exported_id_fields : Prims.string Prims.list}


let __proj__Mkexported_ids__item__exported_id_terms : exported_ids  ->  Prims.string Prims.list = (fun projectee -> (match (projectee) with
| {exported_id_terms = __fname__exported_id_terms; exported_id_fields = __fname__exported_id_fields} -> begin
__fname__exported_id_terms
end))


let __proj__Mkexported_ids__item__exported_id_fields : exported_ids  ->  Prims.string Prims.list = (fun projectee -> (match (projectee) with
| {exported_id_terms = __fname__exported_id_terms; exported_id_fields = __fname__exported_id_fields} -> begin
__fname__exported_id_fields
end))


let as_exported_ids : exported_id_set  ->  exported_ids = (fun e -> (

let terms = (

let uu____9093 = (

let uu____9096 = (e Exported_id_term_type)
in (FStar_ST.op_Bang uu____9096))
in (FStar_Util.set_elements uu____9093))
in (

let fields = (

let uu____9271 = (

let uu____9274 = (e Exported_id_field)
in (FStar_ST.op_Bang uu____9274))
in (FStar_Util.set_elements uu____9271))
in {exported_id_terms = terms; exported_id_fields = fields})))


let as_exported_id_set : exported_ids FStar_Pervasives_Native.option  ->  exported_id_kind  ->  Prims.string FStar_Util.set FStar_ST.ref = (fun e -> (match (e) with
| FStar_Pervasives_Native.None -> begin
(exported_id_set_new ())
end
| FStar_Pervasives_Native.Some (e1) -> begin
(

let terms = (

let uu____9479 = (FStar_Util.as_set e1.exported_id_terms FStar_Util.compare)
in (FStar_Util.mk_ref uu____9479))
in (

let fields = (

let uu____9489 = (FStar_Util.as_set e1.exported_id_fields FStar_Util.compare)
in (FStar_Util.mk_ref uu____9489))
in (fun uu___179_9494 -> (match (uu___179_9494) with
| Exported_id_term_type -> begin
terms
end
| Exported_id_field -> begin
fields
end))))
end))

type module_inclusion_info =
{mii_exported_ids : exported_ids FStar_Pervasives_Native.option; mii_trans_exported_ids : exported_ids FStar_Pervasives_Native.option; mii_includes : FStar_Ident.lident Prims.list FStar_Pervasives_Native.option}


let __proj__Mkmodule_inclusion_info__item__mii_exported_ids : module_inclusion_info  ->  exported_ids FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {mii_exported_ids = __fname__mii_exported_ids; mii_trans_exported_ids = __fname__mii_trans_exported_ids; mii_includes = __fname__mii_includes} -> begin
__fname__mii_exported_ids
end))


let __proj__Mkmodule_inclusion_info__item__mii_trans_exported_ids : module_inclusion_info  ->  exported_ids FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {mii_exported_ids = __fname__mii_exported_ids; mii_trans_exported_ids = __fname__mii_trans_exported_ids; mii_includes = __fname__mii_includes} -> begin
__fname__mii_trans_exported_ids
end))


let __proj__Mkmodule_inclusion_info__item__mii_includes : module_inclusion_info  ->  FStar_Ident.lident Prims.list FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {mii_exported_ids = __fname__mii_exported_ids; mii_trans_exported_ids = __fname__mii_trans_exported_ids; mii_includes = __fname__mii_includes} -> begin
__fname__mii_includes
end))


let default_mii : module_inclusion_info = {mii_exported_ids = FStar_Pervasives_Native.None; mii_trans_exported_ids = FStar_Pervasives_Native.None; mii_includes = FStar_Pervasives_Native.None}


let as_includes : 'Auu____9607 . 'Auu____9607 Prims.list FStar_Pervasives_Native.option  ->  'Auu____9607 Prims.list FStar_ST.ref = (fun uu___180_9619 -> (match (uu___180_9619) with
| FStar_Pervasives_Native.None -> begin
(FStar_Util.mk_ref [])
end
| FStar_Pervasives_Native.Some (l) -> begin
(FStar_Util.mk_ref l)
end))


let inclusion_info : env  ->  FStar_Ident.lident  ->  module_inclusion_info = (fun env l -> (

let mname = (FStar_Ident.string_of_lid l)
in (

let as_ids_opt = (fun m -> (

let uu____9654 = (FStar_Util.smap_try_find m mname)
in (FStar_Util.map_opt uu____9654 as_exported_ids)))
in (

let uu____9657 = (as_ids_opt env.exported_ids)
in (

let uu____9660 = (as_ids_opt env.trans_exported_ids)
in (

let uu____9663 = (

let uu____9668 = (FStar_Util.smap_try_find env.includes mname)
in (FStar_Util.map_opt uu____9668 (fun r -> (FStar_ST.op_Bang r))))
in {mii_exported_ids = uu____9657; mii_trans_exported_ids = uu____9660; mii_includes = uu____9663}))))))


let prepare_module_or_interface : Prims.bool  ->  Prims.bool  ->  env  ->  FStar_Ident.lident  ->  module_inclusion_info  ->  (env * Prims.bool) = (fun intf admitted env mname mii -> (

let prep = (fun env1 -> (

let filename = (FStar_Util.strcat (FStar_Ident.text_of_lid mname) ".fst")
in (

let auto_open = (FStar_Parser_Dep.hard_coded_dependencies filename)
in (

let auto_open1 = (

let convert_kind = (fun uu___181_9776 -> (match (uu___181_9776) with
| FStar_Parser_Dep.Open_namespace -> begin
Open_namespace
end
| FStar_Parser_Dep.Open_module -> begin
Open_module
end))
in (FStar_List.map (fun uu____9788 -> (match (uu____9788) with
| (lid, kind) -> begin
((lid), ((convert_kind kind)))
end)) auto_open))
in (

let namespace_of_module = (match (((FStar_List.length mname.FStar_Ident.ns) > (Prims.parse_int "0"))) with
| true -> begin
(

let uu____9812 = (

let uu____9817 = (FStar_Ident.lid_of_ids mname.FStar_Ident.ns)
in ((uu____9817), (Open_namespace)))
in (uu____9812)::[])
end
| uu____9826 -> begin
[]
end)
in (

let auto_open2 = (FStar_List.rev (FStar_List.append auto_open1 namespace_of_module))
in ((

let uu____9847 = (as_exported_id_set mii.mii_exported_ids)
in (FStar_Util.smap_add env1.exported_ids mname.FStar_Ident.str uu____9847));
(match (()) with
| () -> begin
((

let uu____9863 = (as_exported_id_set mii.mii_trans_exported_ids)
in (FStar_Util.smap_add env1.trans_exported_ids mname.FStar_Ident.str uu____9863));
(match (()) with
| () -> begin
((

let uu____9879 = (as_includes mii.mii_includes)
in (FStar_Util.smap_add env1.includes mname.FStar_Ident.str uu____9879));
(match (()) with
| () -> begin
(

let uu___201_9902 = env1
in (

let uu____9903 = (FStar_List.map (fun x -> Open_module_or_namespace (x)) auto_open2)
in {curmodule = FStar_Pervasives_Native.Some (mname); curmonad = uu___201_9902.curmonad; modules = uu___201_9902.modules; scope_mods = uu____9903; exported_ids = uu___201_9902.exported_ids; trans_exported_ids = uu___201_9902.trans_exported_ids; includes = uu___201_9902.includes; sigaccum = uu___201_9902.sigaccum; sigmap = env1.sigmap; iface = intf; admitted_iface = admitted; expect_typ = uu___201_9902.expect_typ; docs = uu___201_9902.docs; remaining_iface_decls = uu___201_9902.remaining_iface_decls; syntax_only = uu___201_9902.syntax_only}))
end);
)
end);
)
end);
)))))))
in (

let uu____9908 = (FStar_All.pipe_right env.modules (FStar_Util.find_opt (fun uu____9934 -> (match (uu____9934) with
| (l, uu____9940) -> begin
(FStar_Ident.lid_equals l mname)
end))))
in (match (uu____9908) with
| FStar_Pervasives_Native.None -> begin
(

let uu____9949 = (prep env)
in ((uu____9949), (false)))
end
| FStar_Pervasives_Native.Some (uu____9950, m) -> begin
((

let uu____9957 = ((

let uu____9960 = (FStar_Options.interactive ())
in (not (uu____9960))) && ((not (m.FStar_Syntax_Syntax.is_interface)) || intf))
in (match (uu____9957) with
| true -> begin
(

let uu____9961 = (

let uu____9962 = (

let uu____9967 = (FStar_Util.format1 "Duplicate module or interface name: %s" mname.FStar_Ident.str)
in ((uu____9967), ((FStar_Ident.range_of_lid mname))))
in FStar_Errors.Error (uu____9962))
in (FStar_Exn.raise uu____9961))
end
| uu____9968 -> begin
()
end));
(

let uu____9969 = (

let uu____9970 = (push env)
in (prep uu____9970))
in ((uu____9969), (true)));
)
end))))


let enter_monad_scope : env  ->  FStar_Ident.ident  ->  env = (fun env mname -> (match (env.curmonad) with
| FStar_Pervasives_Native.Some (mname') -> begin
(FStar_Exn.raise (FStar_Errors.Error ((((Prims.strcat "Trying to define monad " (Prims.strcat mname.FStar_Ident.idText (Prims.strcat ", but already in monad scope " mname'.FStar_Ident.idText)))), (mname.FStar_Ident.idRange)))))
end
| FStar_Pervasives_Native.None -> begin
(

let uu___202_9980 = env
in {curmodule = uu___202_9980.curmodule; curmonad = FStar_Pervasives_Native.Some (mname); modules = uu___202_9980.modules; scope_mods = uu___202_9980.scope_mods; exported_ids = uu___202_9980.exported_ids; trans_exported_ids = uu___202_9980.trans_exported_ids; includes = uu___202_9980.includes; sigaccum = uu___202_9980.sigaccum; sigmap = uu___202_9980.sigmap; iface = uu___202_9980.iface; admitted_iface = uu___202_9980.admitted_iface; expect_typ = uu___202_9980.expect_typ; docs = uu___202_9980.docs; remaining_iface_decls = uu___202_9980.remaining_iface_decls; syntax_only = uu___202_9980.syntax_only})
end))


let fail_or : 'a . env  ->  (FStar_Ident.lident  ->  'a FStar_Pervasives_Native.option)  ->  FStar_Ident.lident  ->  'a = (fun env lookup lid -> (

let uu____10011 = (lookup lid)
in (match (uu____10011) with
| FStar_Pervasives_Native.None -> begin
(

let opened_modules = (FStar_List.map (fun uu____10024 -> (match (uu____10024) with
| (lid1, uu____10030) -> begin
(FStar_Ident.text_of_lid lid1)
end)) env.modules)
in (

let msg = (FStar_Util.format1 "Identifier not found: [%s]" (FStar_Ident.text_of_lid lid))
in (

let msg1 = (match ((Prims.op_Equality (FStar_List.length lid.FStar_Ident.ns) (Prims.parse_int "0"))) with
| true -> begin
msg
end
| uu____10033 -> begin
(

let modul = (

let uu____10035 = (FStar_Ident.lid_of_ids lid.FStar_Ident.ns)
in (FStar_Ident.set_lid_range uu____10035 (FStar_Ident.range_of_lid lid)))
in (

let uu____10036 = (resolve_module_name env modul true)
in (match (uu____10036) with
| FStar_Pervasives_Native.None -> begin
(

let opened_modules1 = (FStar_String.concat ", " opened_modules)
in (FStar_Util.format3 "%s\nModule %s does not belong to the list of modules in scope, namely %s" msg modul.FStar_Ident.str opened_modules1))
end
| FStar_Pervasives_Native.Some (modul') when (not ((FStar_List.existsb (fun m -> (Prims.op_Equality m modul'.FStar_Ident.str)) opened_modules))) -> begin
(

let opened_modules1 = (FStar_String.concat ", " opened_modules)
in (FStar_Util.format4 "%s\nModule %s resolved into %s, which does not belong to the list of modules in scope, namely %s" msg modul.FStar_Ident.str modul'.FStar_Ident.str opened_modules1))
end
| FStar_Pervasives_Native.Some (modul') -> begin
(FStar_Util.format4 "%s\nModule %s resolved into %s, definition %s not found" msg modul.FStar_Ident.str modul'.FStar_Ident.str lid.FStar_Ident.ident.FStar_Ident.idText)
end)))
end)
in (FStar_Exn.raise (FStar_Errors.Error (((msg1), ((FStar_Ident.range_of_lid lid)))))))))
end
| FStar_Pervasives_Native.Some (r) -> begin
r
end)))


let fail_or2 : 'a . (FStar_Ident.ident  ->  'a FStar_Pervasives_Native.option)  ->  FStar_Ident.ident  ->  'a = (fun lookup id -> (

let uu____10070 = (lookup id)
in (match (uu____10070) with
| FStar_Pervasives_Native.None -> begin
(FStar_Exn.raise (FStar_Errors.Error ((((Prims.strcat "Identifier not found [" (Prims.strcat id.FStar_Ident.idText "]"))), (id.FStar_Ident.idRange)))))
end
| FStar_Pervasives_Native.Some (r) -> begin
r
end)))




