open Prims
let (escape : Prims.string -> Prims.string) =
  fun s -> FStar_Util.replace_char s 39 95
type sort =
  | Bool_sort 
  | Int_sort 
  | String_sort 
  | Term_sort 
  | Fuel_sort 
  | BitVec_sort of Prims.int 
  | Array of (sort * sort) 
  | Arrow of (sort * sort) 
  | Sort of Prims.string 
let (uu___is_Bool_sort : sort -> Prims.bool) =
  fun projectee ->
    match projectee with | Bool_sort -> true | uu____60 -> false
let (uu___is_Int_sort : sort -> Prims.bool) =
  fun projectee ->
    match projectee with | Int_sort -> true | uu____71 -> false
let (uu___is_String_sort : sort -> Prims.bool) =
  fun projectee ->
    match projectee with | String_sort -> true | uu____82 -> false
let (uu___is_Term_sort : sort -> Prims.bool) =
  fun projectee ->
    match projectee with | Term_sort -> true | uu____93 -> false
let (uu___is_Fuel_sort : sort -> Prims.bool) =
  fun projectee ->
    match projectee with | Fuel_sort -> true | uu____104 -> false
let (uu___is_BitVec_sort : sort -> Prims.bool) =
  fun projectee ->
    match projectee with | BitVec_sort _0 -> true | uu____117 -> false
let (__proj__BitVec_sort__item___0 : sort -> Prims.int) =
  fun projectee -> match projectee with | BitVec_sort _0 -> _0
let (uu___is_Array : sort -> Prims.bool) =
  fun projectee ->
    match projectee with | Array _0 -> true | uu____143 -> false
let (__proj__Array__item___0 : sort -> (sort * sort)) =
  fun projectee -> match projectee with | Array _0 -> _0
let (uu___is_Arrow : sort -> Prims.bool) =
  fun projectee ->
    match projectee with | Arrow _0 -> true | uu____178 -> false
let (__proj__Arrow__item___0 : sort -> (sort * sort)) =
  fun projectee -> match projectee with | Arrow _0 -> _0
let (uu___is_Sort : sort -> Prims.bool) =
  fun projectee ->
    match projectee with | Sort _0 -> true | uu____210 -> false
let (__proj__Sort__item___0 : sort -> Prims.string) =
  fun projectee -> match projectee with | Sort _0 -> _0
let rec (strSort : sort -> Prims.string) =
  fun x ->
    match x with
    | Bool_sort -> "Bool"
    | Int_sort -> "Int"
    | Term_sort -> "Term"
    | String_sort -> "FString"
    | Fuel_sort -> "Fuel"
    | BitVec_sort n ->
        let uu____237 = FStar_Util.string_of_int n in
        FStar_Util.format1 "(_ BitVec %s)" uu____237
    | Array (s1, s2) ->
        let uu____242 = strSort s1 in
        let uu____244 = strSort s2 in
        FStar_Util.format2 "(Array %s %s)" uu____242 uu____244
    | Arrow (s1, s2) ->
        let uu____249 = strSort s1 in
        let uu____251 = strSort s2 in
        FStar_Util.format2 "(%s -> %s)" uu____249 uu____251
    | Sort s -> s
type op =
  | TrueOp 
  | FalseOp 
  | Not 
  | And 
  | Or 
  | Imp 
  | Iff 
  | Eq 
  | LT 
  | LTE 
  | GT 
  | GTE 
  | Add 
  | Sub 
  | Div 
  | RealDiv 
  | Mul 
  | Minus 
  | Mod 
  | BvAnd 
  | BvXor 
  | BvOr 
  | BvAdd 
  | BvSub 
  | BvShl 
  | BvShr 
  | BvUdiv 
  | BvMod 
  | BvMul 
  | BvUlt 
  | BvUext of Prims.int 
  | NatToBv of Prims.int 
  | BvToNat 
  | ITE 
  | Var of Prims.string 
let (uu___is_TrueOp : op -> Prims.bool) =
  fun projectee -> match projectee with | TrueOp -> true | uu____283 -> false
let (uu___is_FalseOp : op -> Prims.bool) =
  fun projectee ->
    match projectee with | FalseOp -> true | uu____294 -> false
let (uu___is_Not : op -> Prims.bool) =
  fun projectee -> match projectee with | Not -> true | uu____305 -> false
let (uu___is_And : op -> Prims.bool) =
  fun projectee -> match projectee with | And -> true | uu____316 -> false
let (uu___is_Or : op -> Prims.bool) =
  fun projectee -> match projectee with | Or -> true | uu____327 -> false
let (uu___is_Imp : op -> Prims.bool) =
  fun projectee -> match projectee with | Imp -> true | uu____338 -> false
let (uu___is_Iff : op -> Prims.bool) =
  fun projectee -> match projectee with | Iff -> true | uu____349 -> false
let (uu___is_Eq : op -> Prims.bool) =
  fun projectee -> match projectee with | Eq -> true | uu____360 -> false
let (uu___is_LT : op -> Prims.bool) =
  fun projectee -> match projectee with | LT -> true | uu____371 -> false
let (uu___is_LTE : op -> Prims.bool) =
  fun projectee -> match projectee with | LTE -> true | uu____382 -> false
let (uu___is_GT : op -> Prims.bool) =
  fun projectee -> match projectee with | GT -> true | uu____393 -> false
let (uu___is_GTE : op -> Prims.bool) =
  fun projectee -> match projectee with | GTE -> true | uu____404 -> false
let (uu___is_Add : op -> Prims.bool) =
  fun projectee -> match projectee with | Add -> true | uu____415 -> false
let (uu___is_Sub : op -> Prims.bool) =
  fun projectee -> match projectee with | Sub -> true | uu____426 -> false
let (uu___is_Div : op -> Prims.bool) =
  fun projectee -> match projectee with | Div -> true | uu____437 -> false
let (uu___is_RealDiv : op -> Prims.bool) =
  fun projectee ->
    match projectee with | RealDiv -> true | uu____448 -> false
let (uu___is_Mul : op -> Prims.bool) =
  fun projectee -> match projectee with | Mul -> true | uu____459 -> false
let (uu___is_Minus : op -> Prims.bool) =
  fun projectee -> match projectee with | Minus -> true | uu____470 -> false
let (uu___is_Mod : op -> Prims.bool) =
  fun projectee -> match projectee with | Mod -> true | uu____481 -> false
let (uu___is_BvAnd : op -> Prims.bool) =
  fun projectee -> match projectee with | BvAnd -> true | uu____492 -> false
let (uu___is_BvXor : op -> Prims.bool) =
  fun projectee -> match projectee with | BvXor -> true | uu____503 -> false
let (uu___is_BvOr : op -> Prims.bool) =
  fun projectee -> match projectee with | BvOr -> true | uu____514 -> false
let (uu___is_BvAdd : op -> Prims.bool) =
  fun projectee -> match projectee with | BvAdd -> true | uu____525 -> false
let (uu___is_BvSub : op -> Prims.bool) =
  fun projectee -> match projectee with | BvSub -> true | uu____536 -> false
let (uu___is_BvShl : op -> Prims.bool) =
  fun projectee -> match projectee with | BvShl -> true | uu____547 -> false
let (uu___is_BvShr : op -> Prims.bool) =
  fun projectee -> match projectee with | BvShr -> true | uu____558 -> false
let (uu___is_BvUdiv : op -> Prims.bool) =
  fun projectee -> match projectee with | BvUdiv -> true | uu____569 -> false
let (uu___is_BvMod : op -> Prims.bool) =
  fun projectee -> match projectee with | BvMod -> true | uu____580 -> false
let (uu___is_BvMul : op -> Prims.bool) =
  fun projectee -> match projectee with | BvMul -> true | uu____591 -> false
let (uu___is_BvUlt : op -> Prims.bool) =
  fun projectee -> match projectee with | BvUlt -> true | uu____602 -> false
let (uu___is_BvUext : op -> Prims.bool) =
  fun projectee ->
    match projectee with | BvUext _0 -> true | uu____615 -> false
let (__proj__BvUext__item___0 : op -> Prims.int) =
  fun projectee -> match projectee with | BvUext _0 -> _0
let (uu___is_NatToBv : op -> Prims.bool) =
  fun projectee ->
    match projectee with | NatToBv _0 -> true | uu____638 -> false
let (__proj__NatToBv__item___0 : op -> Prims.int) =
  fun projectee -> match projectee with | NatToBv _0 -> _0
let (uu___is_BvToNat : op -> Prims.bool) =
  fun projectee ->
    match projectee with | BvToNat -> true | uu____659 -> false
let (uu___is_ITE : op -> Prims.bool) =
  fun projectee -> match projectee with | ITE -> true | uu____670 -> false
let (uu___is_Var : op -> Prims.bool) =
  fun projectee -> match projectee with | Var _0 -> true | uu____683 -> false
let (__proj__Var__item___0 : op -> Prims.string) =
  fun projectee -> match projectee with | Var _0 -> _0
type qop =
  | Forall 
  | Exists 
let (uu___is_Forall : qop -> Prims.bool) =
  fun projectee -> match projectee with | Forall -> true | uu____704 -> false
let (uu___is_Exists : qop -> Prims.bool) =
  fun projectee -> match projectee with | Exists -> true | uu____715 -> false
type term' =
  | Integer of Prims.string 
  | String of Prims.string 
  | Real of Prims.string 
  | BoundV of Prims.int 
  | FreeV of (Prims.string * sort * Prims.bool) 
  | App of (op * term Prims.list) 
  | Quant of (qop * term Prims.list Prims.list * Prims.int
  FStar_Pervasives_Native.option * sort Prims.list * term) 
  | Let of (term Prims.list * term) 
  | Labeled of (term * Prims.string * FStar_Range.range) 
  | LblPos of (term * Prims.string) 
and term =
  {
  tm: term' ;
  freevars:
    (Prims.string * sort * Prims.bool) Prims.list FStar_Syntax_Syntax.memo ;
  rng: FStar_Range.range }
let (uu___is_Integer : term' -> Prims.bool) =
  fun projectee ->
    match projectee with | Integer _0 -> true | uu____862 -> false
let (__proj__Integer__item___0 : term' -> Prims.string) =
  fun projectee -> match projectee with | Integer _0 -> _0
let (uu___is_String : term' -> Prims.bool) =
  fun projectee ->
    match projectee with | String _0 -> true | uu____885 -> false
let (__proj__String__item___0 : term' -> Prims.string) =
  fun projectee -> match projectee with | String _0 -> _0
let (uu___is_Real : term' -> Prims.bool) =
  fun projectee ->
    match projectee with | Real _0 -> true | uu____908 -> false
let (__proj__Real__item___0 : term' -> Prims.string) =
  fun projectee -> match projectee with | Real _0 -> _0
let (uu___is_BoundV : term' -> Prims.bool) =
  fun projectee ->
    match projectee with | BoundV _0 -> true | uu____931 -> false
let (__proj__BoundV__item___0 : term' -> Prims.int) =
  fun projectee -> match projectee with | BoundV _0 -> _0
let (uu___is_FreeV : term' -> Prims.bool) =
  fun projectee ->
    match projectee with | FreeV _0 -> true | uu____961 -> false
let (__proj__FreeV__item___0 : term' -> (Prims.string * sort * Prims.bool)) =
  fun projectee -> match projectee with | FreeV _0 -> _0
let (uu___is_App : term' -> Prims.bool) =
  fun projectee ->
    match projectee with | App _0 -> true | uu____1010 -> false
let (__proj__App__item___0 : term' -> (op * term Prims.list)) =
  fun projectee -> match projectee with | App _0 -> _0
let (uu___is_Quant : term' -> Prims.bool) =
  fun projectee ->
    match projectee with | Quant _0 -> true | uu____1066 -> false
let (__proj__Quant__item___0 :
  term' ->
    (qop * term Prims.list Prims.list * Prims.int
      FStar_Pervasives_Native.option * sort Prims.list * term))
  = fun projectee -> match projectee with | Quant _0 -> _0
let (uu___is_Let : term' -> Prims.bool) =
  fun projectee ->
    match projectee with | Let _0 -> true | uu____1148 -> false
let (__proj__Let__item___0 : term' -> (term Prims.list * term)) =
  fun projectee -> match projectee with | Let _0 -> _0
let (uu___is_Labeled : term' -> Prims.bool) =
  fun projectee ->
    match projectee with | Labeled _0 -> true | uu____1192 -> false
let (__proj__Labeled__item___0 :
  term' -> (term * Prims.string * FStar_Range.range)) =
  fun projectee -> match projectee with | Labeled _0 -> _0
let (uu___is_LblPos : term' -> Prims.bool) =
  fun projectee ->
    match projectee with | LblPos _0 -> true | uu____1237 -> false
let (__proj__LblPos__item___0 : term' -> (term * Prims.string)) =
  fun projectee -> match projectee with | LblPos _0 -> _0
let (__proj__Mkterm__item__tm : term -> term') =
  fun projectee -> match projectee with | { tm; freevars; rng;_} -> tm
let (__proj__Mkterm__item__freevars :
  term ->
    (Prims.string * sort * Prims.bool) Prims.list FStar_Syntax_Syntax.memo)
  =
  fun projectee -> match projectee with | { tm; freevars; rng;_} -> freevars
let (__proj__Mkterm__item__rng : term -> FStar_Range.range) =
  fun projectee -> match projectee with | { tm; freevars; rng;_} -> rng
type pat = term
type fv = (Prims.string * sort * Prims.bool)
type fvs = (Prims.string * sort * Prims.bool) Prims.list
type caption = Prims.string FStar_Pervasives_Native.option
type binders = (Prims.string * sort) Prims.list
type constructor_field = (Prims.string * sort * Prims.bool)
type constructor_t =
  (Prims.string * constructor_field Prims.list * sort * Prims.int *
    Prims.bool)
type constructors = constructor_t Prims.list
type fact_db_id =
  | Name of FStar_Ident.lid 
  | Namespace of FStar_Ident.lid 
  | Tag of Prims.string 
let (uu___is_Name : fact_db_id -> Prims.bool) =
  fun projectee ->
    match projectee with | Name _0 -> true | uu____1427 -> false
let (__proj__Name__item___0 : fact_db_id -> FStar_Ident.lid) =
  fun projectee -> match projectee with | Name _0 -> _0
let (uu___is_Namespace : fact_db_id -> Prims.bool) =
  fun projectee ->
    match projectee with | Namespace _0 -> true | uu____1446 -> false
let (__proj__Namespace__item___0 : fact_db_id -> FStar_Ident.lid) =
  fun projectee -> match projectee with | Namespace _0 -> _0
let (uu___is_Tag : fact_db_id -> Prims.bool) =
  fun projectee ->
    match projectee with | Tag _0 -> true | uu____1466 -> false
let (__proj__Tag__item___0 : fact_db_id -> Prims.string) =
  fun projectee -> match projectee with | Tag _0 -> _0
type assumption =
  {
  assumption_term: term ;
  assumption_caption: caption ;
  assumption_name: Prims.string ;
  assumption_fact_ids: fact_db_id Prims.list }
let (__proj__Mkassumption__item__assumption_term : assumption -> term) =
  fun projectee ->
    match projectee with
    | { assumption_term; assumption_caption; assumption_name;
        assumption_fact_ids;_} -> assumption_term
let (__proj__Mkassumption__item__assumption_caption : assumption -> caption)
  =
  fun projectee ->
    match projectee with
    | { assumption_term; assumption_caption; assumption_name;
        assumption_fact_ids;_} -> assumption_caption
let (__proj__Mkassumption__item__assumption_name :
  assumption -> Prims.string) =
  fun projectee ->
    match projectee with
    | { assumption_term; assumption_caption; assumption_name;
        assumption_fact_ids;_} -> assumption_name
let (__proj__Mkassumption__item__assumption_fact_ids :
  assumption -> fact_db_id Prims.list) =
  fun projectee ->
    match projectee with
    | { assumption_term; assumption_caption; assumption_name;
        assumption_fact_ids;_} -> assumption_fact_ids
type decl =
  | DefPrelude 
  | DeclFun of (Prims.string * sort Prims.list * sort * caption) 
  | DefineFun of (Prims.string * sort Prims.list * sort * term * caption) 
  | Assume of assumption 
  | Caption of Prims.string 
  | Module of (Prims.string * decl Prims.list) 
  | Eval of term 
  | Echo of Prims.string 
  | RetainAssumptions of Prims.string Prims.list 
  | Push 
  | Pop 
  | CheckSat 
  | GetUnsatCore 
  | SetOption of (Prims.string * Prims.string) 
  | GetStatistics 
  | GetReasonUnknown 
let (uu___is_DefPrelude : decl -> Prims.bool) =
  fun projectee ->
    match projectee with | DefPrelude -> true | uu____1655 -> false
let (uu___is_DeclFun : decl -> Prims.bool) =
  fun projectee ->
    match projectee with | DeclFun _0 -> true | uu____1678 -> false
let (__proj__DeclFun__item___0 :
  decl -> (Prims.string * sort Prims.list * sort * caption)) =
  fun projectee -> match projectee with | DeclFun _0 -> _0
let (uu___is_DefineFun : decl -> Prims.bool) =
  fun projectee ->
    match projectee with | DefineFun _0 -> true | uu____1743 -> false
let (__proj__DefineFun__item___0 :
  decl -> (Prims.string * sort Prims.list * sort * term * caption)) =
  fun projectee -> match projectee with | DefineFun _0 -> _0
let (uu___is_Assume : decl -> Prims.bool) =
  fun projectee ->
    match projectee with | Assume _0 -> true | uu____1801 -> false
let (__proj__Assume__item___0 : decl -> assumption) =
  fun projectee -> match projectee with | Assume _0 -> _0
let (uu___is_Caption : decl -> Prims.bool) =
  fun projectee ->
    match projectee with | Caption _0 -> true | uu____1821 -> false
let (__proj__Caption__item___0 : decl -> Prims.string) =
  fun projectee -> match projectee with | Caption _0 -> _0
let (uu___is_Module : decl -> Prims.bool) =
  fun projectee ->
    match projectee with | Module _0 -> true | uu____1850 -> false
let (__proj__Module__item___0 : decl -> (Prims.string * decl Prims.list)) =
  fun projectee -> match projectee with | Module _0 -> _0
let (uu___is_Eval : decl -> Prims.bool) =
  fun projectee ->
    match projectee with | Eval _0 -> true | uu____1890 -> false
let (__proj__Eval__item___0 : decl -> term) =
  fun projectee -> match projectee with | Eval _0 -> _0
let (uu___is_Echo : decl -> Prims.bool) =
  fun projectee ->
    match projectee with | Echo _0 -> true | uu____1910 -> false
let (__proj__Echo__item___0 : decl -> Prims.string) =
  fun projectee -> match projectee with | Echo _0 -> _0
let (uu___is_RetainAssumptions : decl -> Prims.bool) =
  fun projectee ->
    match projectee with | RetainAssumptions _0 -> true | uu____1935 -> false
let (__proj__RetainAssumptions__item___0 : decl -> Prims.string Prims.list) =
  fun projectee -> match projectee with | RetainAssumptions _0 -> _0
let (uu___is_Push : decl -> Prims.bool) =
  fun projectee -> match projectee with | Push -> true | uu____1962 -> false
let (uu___is_Pop : decl -> Prims.bool) =
  fun projectee -> match projectee with | Pop -> true | uu____1973 -> false
let (uu___is_CheckSat : decl -> Prims.bool) =
  fun projectee ->
    match projectee with | CheckSat -> true | uu____1984 -> false
let (uu___is_GetUnsatCore : decl -> Prims.bool) =
  fun projectee ->
    match projectee with | GetUnsatCore -> true | uu____1995 -> false
let (uu___is_SetOption : decl -> Prims.bool) =
  fun projectee ->
    match projectee with | SetOption _0 -> true | uu____2013 -> false
let (__proj__SetOption__item___0 : decl -> (Prims.string * Prims.string)) =
  fun projectee -> match projectee with | SetOption _0 -> _0
let (uu___is_GetStatistics : decl -> Prims.bool) =
  fun projectee ->
    match projectee with | GetStatistics -> true | uu____2049 -> false
let (uu___is_GetReasonUnknown : decl -> Prims.bool) =
  fun projectee ->
    match projectee with | GetReasonUnknown -> true | uu____2060 -> false
type decls_elt =
  {
  sym_name: Prims.string FStar_Pervasives_Native.option ;
  key: Prims.string FStar_Pervasives_Native.option ;
  decls: decl Prims.list ;
  a_names: Prims.string Prims.list }
let (__proj__Mkdecls_elt__item__sym_name :
  decls_elt -> Prims.string FStar_Pervasives_Native.option) =
  fun projectee ->
    match projectee with | { sym_name; key; decls; a_names;_} -> sym_name
let (__proj__Mkdecls_elt__item__key :
  decls_elt -> Prims.string FStar_Pervasives_Native.option) =
  fun projectee ->
    match projectee with | { sym_name; key; decls; a_names;_} -> key
let (__proj__Mkdecls_elt__item__decls : decls_elt -> decl Prims.list) =
  fun projectee ->
    match projectee with | { sym_name; key; decls; a_names;_} -> decls
let (__proj__Mkdecls_elt__item__a_names :
  decls_elt -> Prims.string Prims.list) =
  fun projectee ->
    match projectee with | { sym_name; key; decls; a_names;_} -> a_names
type decls_t = decls_elt Prims.list
let (mk_decls :
  Prims.string ->
    Prims.string -> decl Prims.list -> decls_elt Prims.list -> decls_t)
  =
  fun name ->
    fun key ->
      fun decls ->
        fun aux_decls ->
          let uu____2234 =
            let uu____2235 =
              let sm = FStar_Util.smap_create (Prims.of_int (20)) in
              FStar_List.iter
                (fun elt ->
                   FStar_List.iter (fun s -> FStar_Util.smap_add sm s "0")
                     elt.a_names) aux_decls;
              FStar_List.iter
                (fun d ->
                   match d with
                   | Assume a -> FStar_Util.smap_add sm a.assumption_name "0"
                   | uu____2261 -> ()) decls;
              FStar_Util.smap_keys sm in
            {
              sym_name = (FStar_Pervasives_Native.Some name);
              key = (FStar_Pervasives_Native.Some key);
              decls;
              a_names = uu____2235
            } in
          [uu____2234]
let (mk_decls_trivial : decl Prims.list -> decls_t) =
  fun decls ->
    let uu____2275 =
      let uu____2276 =
        FStar_List.collect
          (fun uu___0_2283 ->
             match uu___0_2283 with
             | Assume a -> [a.assumption_name]
             | uu____2290 -> []) decls in
      {
        sym_name = FStar_Pervasives_Native.None;
        key = FStar_Pervasives_Native.None;
        decls;
        a_names = uu____2276
      } in
    [uu____2275]
let (decls_list_of : decls_t -> decl Prims.list) =
  fun l -> FStar_All.pipe_right l (FStar_List.collect (fun elt -> elt.decls))
type error_label = (fv * Prims.string * FStar_Range.range)
type error_labels = error_label Prims.list
let (mk_fv : (Prims.string * sort) -> fv) =
  fun uu____2327 -> match uu____2327 with | (x, y) -> (x, y, false)
let (fv_name : fv -> Prims.string) =
  fun x ->
    let uu____2347 = x in
    match uu____2347 with | (nm, uu____2350, uu____2351) -> nm
let (fv_sort : fv -> sort) =
  fun x ->
    let uu____2362 = x in
    match uu____2362 with | (uu____2363, sort1, uu____2365) -> sort1
let (fv_force : fv -> Prims.bool) =
  fun x ->
    let uu____2377 = x in
    match uu____2377 with | (uu____2379, uu____2380, force) -> force
let (fv_eq : fv -> fv -> Prims.bool) =
  fun x ->
    fun y ->
      let uu____2398 = fv_name x in
      let uu____2400 = fv_name y in uu____2398 = uu____2400
let (fvs_subset_of : fvs -> fvs -> Prims.bool) =
  fun x ->
    fun y ->
      let cmp_fv x1 y1 =
        let uu____2427 = fv_name x1 in
        let uu____2429 = fv_name y1 in
        FStar_Util.compare uu____2427 uu____2429 in
      let uu____2431 = FStar_Util.as_set x cmp_fv in
      let uu____2450 = FStar_Util.as_set y cmp_fv in
      FStar_Util.set_is_subset_of uu____2431 uu____2450
let (freevar_eq : term -> term -> Prims.bool) =
  fun x ->
    fun y ->
      match ((x.tm), (y.tm)) with
      | (FreeV x1, FreeV y1) -> fv_eq x1 y1
      | uu____2508 -> false
let (freevar_sort : term -> sort) =
  fun uu___1_2519 ->
    match uu___1_2519 with
    | { tm = FreeV x; freevars = uu____2521; rng = uu____2522;_} -> fv_sort x
    | uu____2543 -> failwith "impossible"
let (fv_of_term : term -> fv) =
  fun uu___2_2550 ->
    match uu___2_2550 with
    | { tm = FreeV fv1; freevars = uu____2552; rng = uu____2553;_} -> fv1
    | uu____2574 -> failwith "impossible"
let rec (freevars : term -> (Prims.string * sort * Prims.bool) Prims.list) =
  fun t ->
    match t.tm with
    | Integer uu____2602 -> []
    | String uu____2612 -> []
    | Real uu____2622 -> []
    | BoundV uu____2632 -> []
    | FreeV fv1 when fv_force fv1 -> []
    | FreeV fv1 -> [fv1]
    | App (uu____2684, tms) -> FStar_List.collect freevars tms
    | Quant (uu____2698, uu____2699, uu____2700, uu____2701, t1) ->
        freevars t1
    | Labeled (t1, uu____2722, uu____2723) -> freevars t1
    | LblPos (t1, uu____2727) -> freevars t1
    | Let (es, body) -> FStar_List.collect freevars (body :: es)
let (free_variables : term -> fvs) =
  fun t ->
    let uu____2750 = FStar_ST.op_Bang t.freevars in
    match uu____2750 with
    | FStar_Pervasives_Native.Some b -> b
    | FStar_Pervasives_Native.None ->
        let fvs1 =
          let uu____2848 = freevars t in
          FStar_Util.remove_dups fv_eq uu____2848 in
        (FStar_ST.op_Colon_Equals t.freevars
           (FStar_Pervasives_Native.Some fvs1);
         fvs1)
let (qop_to_string : qop -> Prims.string) =
  fun uu___3_2927 ->
    match uu___3_2927 with | Forall -> "forall" | Exists -> "exists"
let (op_to_string : op -> Prims.string) =
  fun uu___4_2937 ->
    match uu___4_2937 with
    | TrueOp -> "true"
    | FalseOp -> "false"
    | Not -> "not"
    | And -> "and"
    | Or -> "or"
    | Imp -> "implies"
    | Iff -> "iff"
    | Eq -> "="
    | LT -> "<"
    | LTE -> "<="
    | GT -> ">"
    | GTE -> ">="
    | Add -> "+"
    | Sub -> "-"
    | Div -> "div"
    | RealDiv -> "/"
    | Mul -> "*"
    | Minus -> "-"
    | Mod -> "mod"
    | ITE -> "ite"
    | BvAnd -> "bvand"
    | BvXor -> "bvxor"
    | BvOr -> "bvor"
    | BvAdd -> "bvadd"
    | BvSub -> "bvsub"
    | BvShl -> "bvshl"
    | BvShr -> "bvlshr"
    | BvUdiv -> "bvudiv"
    | BvMod -> "bvurem"
    | BvMul -> "bvmul"
    | BvUlt -> "bvult"
    | BvToNat -> "bv2int"
    | BvUext n ->
        let uu____2973 = FStar_Util.string_of_int n in
        FStar_Util.format1 "(_ zero_extend %s)" uu____2973
    | NatToBv n ->
        let uu____2978 = FStar_Util.string_of_int n in
        FStar_Util.format1 "(_ int2bv %s)" uu____2978
    | Var s -> s
let (weightToSmt : Prims.int FStar_Pervasives_Native.option -> Prims.string)
  =
  fun uu___5_2992 ->
    match uu___5_2992 with
    | FStar_Pervasives_Native.None -> ""
    | FStar_Pervasives_Native.Some i ->
        let uu____3002 = FStar_Util.string_of_int i in
        FStar_Util.format1 ":weight %s\n" uu____3002
let rec (hash_of_term' : term' -> Prims.string) =
  fun t ->
    match t with
    | Integer i -> i
    | String s -> s
    | Real r -> r
    | BoundV i ->
        let uu____3026 = FStar_Util.string_of_int i in
        Prims.op_Hat "@" uu____3026
    | FreeV x ->
        let uu____3038 = fv_name x in
        let uu____3040 =
          let uu____3042 = let uu____3044 = fv_sort x in strSort uu____3044 in
          Prims.op_Hat ":" uu____3042 in
        Prims.op_Hat uu____3038 uu____3040
    | App (op1, tms) ->
        let uu____3052 =
          let uu____3054 = op_to_string op1 in
          let uu____3056 =
            let uu____3058 =
              let uu____3060 = FStar_List.map hash_of_term tms in
              FStar_All.pipe_right uu____3060 (FStar_String.concat " ") in
            Prims.op_Hat uu____3058 ")" in
          Prims.op_Hat uu____3054 uu____3056 in
        Prims.op_Hat "(" uu____3052
    | Labeled (t1, r1, r2) ->
        let uu____3077 = hash_of_term t1 in
        let uu____3079 =
          let uu____3081 = FStar_Range.string_of_range r2 in
          Prims.op_Hat r1 uu____3081 in
        Prims.op_Hat uu____3077 uu____3079
    | LblPos (t1, r) ->
        let uu____3087 =
          let uu____3089 = hash_of_term t1 in
          Prims.op_Hat uu____3089
            (Prims.op_Hat " :lblpos " (Prims.op_Hat r ")")) in
        Prims.op_Hat "(! " uu____3087
    | Quant (qop1, pats, wopt, sorts, body) ->
        let uu____3117 =
          let uu____3119 =
            let uu____3121 =
              let uu____3123 =
                let uu____3125 = FStar_List.map strSort sorts in
                FStar_All.pipe_right uu____3125 (FStar_String.concat " ") in
              let uu____3135 =
                let uu____3137 =
                  let uu____3139 = hash_of_term body in
                  let uu____3141 =
                    let uu____3143 =
                      let uu____3145 = weightToSmt wopt in
                      let uu____3147 =
                        let uu____3149 =
                          let uu____3151 =
                            let uu____3153 =
                              FStar_All.pipe_right pats
                                (FStar_List.map
                                   (fun pats1 ->
                                      let uu____3172 =
                                        FStar_List.map hash_of_term pats1 in
                                      FStar_All.pipe_right uu____3172
                                        (FStar_String.concat " "))) in
                            FStar_All.pipe_right uu____3153
                              (FStar_String.concat "; ") in
                          Prims.op_Hat uu____3151 "))" in
                        Prims.op_Hat " " uu____3149 in
                      Prims.op_Hat uu____3145 uu____3147 in
                    Prims.op_Hat " " uu____3143 in
                  Prims.op_Hat uu____3139 uu____3141 in
                Prims.op_Hat ")(! " uu____3137 in
              Prims.op_Hat uu____3123 uu____3135 in
            Prims.op_Hat " (" uu____3121 in
          Prims.op_Hat (qop_to_string qop1) uu____3119 in
        Prims.op_Hat "(" uu____3117
    | Let (es, body) ->
        let uu____3199 =
          let uu____3201 =
            let uu____3203 = FStar_List.map hash_of_term es in
            FStar_All.pipe_right uu____3203 (FStar_String.concat " ") in
          let uu____3213 =
            let uu____3215 =
              let uu____3217 = hash_of_term body in
              Prims.op_Hat uu____3217 ")" in
            Prims.op_Hat ") " uu____3215 in
          Prims.op_Hat uu____3201 uu____3213 in
        Prims.op_Hat "(let (" uu____3199
and (hash_of_term : term -> Prims.string) = fun tm -> hash_of_term' tm.tm
let (mkBoxFunctions : Prims.string -> (Prims.string * Prims.string)) =
  fun s -> (s, (Prims.op_Hat s "_proj_0"))
let (boxIntFun : (Prims.string * Prims.string)) = mkBoxFunctions "BoxInt"
let (boxBoolFun : (Prims.string * Prims.string)) = mkBoxFunctions "BoxBool"
let (boxStringFun : (Prims.string * Prims.string)) =
  mkBoxFunctions "BoxString"
let (boxBitVecFun : Prims.int -> (Prims.string * Prims.string)) =
  fun sz ->
    let uu____3278 =
      let uu____3280 = FStar_Util.string_of_int sz in
      Prims.op_Hat "BoxBitVec" uu____3280 in
    mkBoxFunctions uu____3278
let (boxRealFun : (Prims.string * Prims.string)) = mkBoxFunctions "BoxReal"
let (isInjective : Prims.string -> Prims.bool) =
  fun s ->
    if (FStar_String.length s) >= (Prims.of_int (3))
    then
      (let uu____3305 =
         FStar_String.substring s Prims.int_zero (Prims.of_int (3)) in
       uu____3305 = "Box") &&
        (let uu____3312 =
           let uu____3314 = FStar_String.list_of_string s in
           FStar_List.existsML (fun c -> c = 46) uu____3314 in
         Prims.op_Negation uu____3312)
    else false
let (mk : term' -> FStar_Range.range -> term) =
  fun t ->
    fun r ->
      let uu____3338 = FStar_Util.mk_ref FStar_Pervasives_Native.None in
      { tm = t; freevars = uu____3338; rng = r }
let (mkTrue : FStar_Range.range -> term) = fun r -> mk (App (TrueOp, [])) r
let (mkFalse : FStar_Range.range -> term) = fun r -> mk (App (FalseOp, [])) r
let (mkInteger : Prims.string -> FStar_Range.range -> term) =
  fun i ->
    fun r ->
      let uu____3402 =
        let uu____3403 = FStar_Util.ensure_decimal i in Integer uu____3403 in
      mk uu____3402 r
let (mkInteger' : Prims.int -> FStar_Range.range -> term) =
  fun i ->
    fun r ->
      let uu____3418 = FStar_Util.string_of_int i in mkInteger uu____3418 r
let (mkReal : Prims.string -> FStar_Range.range -> term) =
  fun i -> fun r -> mk (Real i) r
let (mkBoundV : Prims.int -> FStar_Range.range -> term) =
  fun i -> fun r -> mk (BoundV i) r
let (mkFreeV : fv -> FStar_Range.range -> term) =
  fun x -> fun r -> mk (FreeV x) r
let (mkApp' : (op * term Prims.list) -> FStar_Range.range -> term) =
  fun f -> fun r -> mk (App f) r
let (mkApp : (Prims.string * term Prims.list) -> FStar_Range.range -> term) =
  fun uu____3496 ->
    fun r -> match uu____3496 with | (s, args) -> mk (App ((Var s), args)) r
let (mkNot : term -> FStar_Range.range -> term) =
  fun t ->
    fun r ->
      match t.tm with
      | App (TrueOp, uu____3526) -> mkFalse r
      | App (FalseOp, uu____3531) -> mkTrue r
      | uu____3536 -> mkApp' (Not, [t]) r
let (mkAnd : (term * term) -> FStar_Range.range -> term) =
  fun uu____3552 ->
    fun r ->
      match uu____3552 with
      | (t1, t2) ->
          (match ((t1.tm), (t2.tm)) with
           | (App (TrueOp, uu____3560), uu____3561) -> t2
           | (uu____3566, App (TrueOp, uu____3567)) -> t1
           | (App (FalseOp, uu____3572), uu____3573) -> mkFalse r
           | (uu____3578, App (FalseOp, uu____3579)) -> mkFalse r
           | (App (And, ts1), App (And, ts2)) ->
               mkApp' (And, (FStar_List.append ts1 ts2)) r
           | (uu____3596, App (And, ts2)) -> mkApp' (And, (t1 :: ts2)) r
           | (App (And, ts1), uu____3605) ->
               mkApp' (And, (FStar_List.append ts1 [t2])) r
           | uu____3612 -> mkApp' (And, [t1; t2]) r)
let (mkOr : (term * term) -> FStar_Range.range -> term) =
  fun uu____3632 ->
    fun r ->
      match uu____3632 with
      | (t1, t2) ->
          (match ((t1.tm), (t2.tm)) with
           | (App (TrueOp, uu____3640), uu____3641) -> mkTrue r
           | (uu____3646, App (TrueOp, uu____3647)) -> mkTrue r
           | (App (FalseOp, uu____3652), uu____3653) -> t2
           | (uu____3658, App (FalseOp, uu____3659)) -> t1
           | (App (Or, ts1), App (Or, ts2)) ->
               mkApp' (Or, (FStar_List.append ts1 ts2)) r
           | (uu____3676, App (Or, ts2)) -> mkApp' (Or, (t1 :: ts2)) r
           | (App (Or, ts1), uu____3685) ->
               mkApp' (Or, (FStar_List.append ts1 [t2])) r
           | uu____3692 -> mkApp' (Or, [t1; t2]) r)
let (mkImp : (term * term) -> FStar_Range.range -> term) =
  fun uu____3712 ->
    fun r ->
      match uu____3712 with
      | (t1, t2) ->
          (match ((t1.tm), (t2.tm)) with
           | (uu____3720, App (TrueOp, uu____3721)) -> mkTrue r
           | (App (FalseOp, uu____3726), uu____3727) -> mkTrue r
           | (App (TrueOp, uu____3732), uu____3733) -> t2
           | (uu____3738, App (Imp, t1'::t2'::[])) ->
               let uu____3743 =
                 let uu____3750 =
                   let uu____3753 = mkAnd (t1, t1') r in [uu____3753; t2'] in
                 (Imp, uu____3750) in
               mkApp' uu____3743 r
           | uu____3756 -> mkApp' (Imp, [t1; t2]) r)
let (mk_bin_op : op -> (term * term) -> FStar_Range.range -> term) =
  fun op1 ->
    fun uu____3781 ->
      fun r -> match uu____3781 with | (t1, t2) -> mkApp' (op1, [t1; t2]) r
let (mkMinus : term -> FStar_Range.range -> term) =
  fun t -> fun r -> mkApp' (Minus, [t]) r
let (mkNatToBv : Prims.int -> term -> FStar_Range.range -> term) =
  fun sz -> fun t -> fun r -> mkApp' ((NatToBv sz), [t]) r
let (mkBvUext : Prims.int -> term -> FStar_Range.range -> term) =
  fun sz -> fun t -> fun r -> mkApp' ((BvUext sz), [t]) r
let (mkBvToNat : term -> FStar_Range.range -> term) =
  fun t -> fun r -> mkApp' (BvToNat, [t]) r
let (mkBvAnd : (term * term) -> FStar_Range.range -> term) = mk_bin_op BvAnd
let (mkBvXor : (term * term) -> FStar_Range.range -> term) = mk_bin_op BvXor
let (mkBvOr : (term * term) -> FStar_Range.range -> term) = mk_bin_op BvOr
let (mkBvAdd : (term * term) -> FStar_Range.range -> term) = mk_bin_op BvAdd
let (mkBvSub : (term * term) -> FStar_Range.range -> term) = mk_bin_op BvSub
let (mkBvShl : Prims.int -> (term * term) -> FStar_Range.range -> term) =
  fun sz ->
    fun uu____3941 ->
      fun r ->
        match uu____3941 with
        | (t1, t2) ->
            let uu____3950 =
              let uu____3957 =
                let uu____3960 =
                  let uu____3963 = mkNatToBv sz t2 r in [uu____3963] in
                t1 :: uu____3960 in
              (BvShl, uu____3957) in
            mkApp' uu____3950 r
let (mkBvShr : Prims.int -> (term * term) -> FStar_Range.range -> term) =
  fun sz ->
    fun uu____3985 ->
      fun r ->
        match uu____3985 with
        | (t1, t2) ->
            let uu____3994 =
              let uu____4001 =
                let uu____4004 =
                  let uu____4007 = mkNatToBv sz t2 r in [uu____4007] in
                t1 :: uu____4004 in
              (BvShr, uu____4001) in
            mkApp' uu____3994 r
let (mkBvUdiv : Prims.int -> (term * term) -> FStar_Range.range -> term) =
  fun sz ->
    fun uu____4029 ->
      fun r ->
        match uu____4029 with
        | (t1, t2) ->
            let uu____4038 =
              let uu____4045 =
                let uu____4048 =
                  let uu____4051 = mkNatToBv sz t2 r in [uu____4051] in
                t1 :: uu____4048 in
              (BvUdiv, uu____4045) in
            mkApp' uu____4038 r
let (mkBvMod : Prims.int -> (term * term) -> FStar_Range.range -> term) =
  fun sz ->
    fun uu____4073 ->
      fun r ->
        match uu____4073 with
        | (t1, t2) ->
            let uu____4082 =
              let uu____4089 =
                let uu____4092 =
                  let uu____4095 = mkNatToBv sz t2 r in [uu____4095] in
                t1 :: uu____4092 in
              (BvMod, uu____4089) in
            mkApp' uu____4082 r
let (mkBvMul : Prims.int -> (term * term) -> FStar_Range.range -> term) =
  fun sz ->
    fun uu____4117 ->
      fun r ->
        match uu____4117 with
        | (t1, t2) ->
            let uu____4126 =
              let uu____4133 =
                let uu____4136 =
                  let uu____4139 = mkNatToBv sz t2 r in [uu____4139] in
                t1 :: uu____4136 in
              (BvMul, uu____4133) in
            mkApp' uu____4126 r
let (mkBvUlt : (term * term) -> FStar_Range.range -> term) = mk_bin_op BvUlt
let (mkIff : (term * term) -> FStar_Range.range -> term) = mk_bin_op Iff
let (mkEq : (term * term) -> FStar_Range.range -> term) =
  fun uu____4181 ->
    fun r ->
      match uu____4181 with
      | (t1, t2) ->
          (match ((t1.tm), (t2.tm)) with
           | (App (Var f1, s1::[]), App (Var f2, s2::[])) when
               (f1 = f2) && (isInjective f1) -> mk_bin_op Eq (s1, s2) r
           | uu____4200 -> mk_bin_op Eq (t1, t2) r)
let (mkLT : (term * term) -> FStar_Range.range -> term) = mk_bin_op LT
let (mkLTE : (term * term) -> FStar_Range.range -> term) = mk_bin_op LTE
let (mkGT : (term * term) -> FStar_Range.range -> term) = mk_bin_op GT
let (mkGTE : (term * term) -> FStar_Range.range -> term) = mk_bin_op GTE
let (mkAdd : (term * term) -> FStar_Range.range -> term) = mk_bin_op Add
let (mkSub : (term * term) -> FStar_Range.range -> term) = mk_bin_op Sub
let (mkDiv : (term * term) -> FStar_Range.range -> term) = mk_bin_op Div
let (mkRealDiv : (term * term) -> FStar_Range.range -> term) =
  mk_bin_op RealDiv
let (mkMul : (term * term) -> FStar_Range.range -> term) = mk_bin_op Mul
let (mkMod : (term * term) -> FStar_Range.range -> term) = mk_bin_op Mod
let (mkRealOfInt : term -> FStar_Range.range -> term) =
  fun t -> fun r -> mkApp ("to_real", [t]) r
let (mkITE : (term * term * term) -> FStar_Range.range -> term) =
  fun uu____4365 ->
    fun r ->
      match uu____4365 with
      | (t1, t2, t3) ->
          (match t1.tm with
           | App (TrueOp, uu____4376) -> t2
           | App (FalseOp, uu____4381) -> t3
           | uu____4386 ->
               (match ((t2.tm), (t3.tm)) with
                | (App (TrueOp, uu____4387), App (TrueOp, uu____4388)) ->
                    mkTrue r
                | (App (TrueOp, uu____4397), uu____4398) ->
                    let uu____4403 =
                      let uu____4408 = mkNot t1 t1.rng in (uu____4408, t3) in
                    mkImp uu____4403 r
                | (uu____4409, App (TrueOp, uu____4410)) -> mkImp (t1, t2) r
                | (uu____4415, uu____4416) -> mkApp' (ITE, [t1; t2; t3]) r))
let (mkCases : term Prims.list -> FStar_Range.range -> term) =
  fun t ->
    fun r ->
      match t with
      | [] -> failwith "Impos"
      | hd::tl ->
          FStar_List.fold_left (fun out -> fun t1 -> mkAnd (out, t1) r) hd tl
let (check_pattern_ok : term -> term FStar_Pervasives_Native.option) =
  fun t ->
    let rec aux t1 =
      match t1.tm with
      | Integer uu____4472 -> FStar_Pervasives_Native.None
      | String uu____4474 -> FStar_Pervasives_Native.None
      | Real uu____4476 -> FStar_Pervasives_Native.None
      | BoundV uu____4478 -> FStar_Pervasives_Native.None
      | FreeV uu____4480 -> FStar_Pervasives_Native.None
      | Let (tms, tm) -> aux_l (tm :: tms)
      | App (head, terms) ->
          let head_ok =
            match head with
            | Var uu____4504 -> true
            | TrueOp -> true
            | FalseOp -> true
            | Not -> false
            | And -> false
            | Or -> false
            | Imp -> false
            | Iff -> false
            | Eq -> false
            | LT -> true
            | LTE -> true
            | GT -> true
            | GTE -> true
            | Add -> true
            | Sub -> true
            | Div -> true
            | RealDiv -> true
            | Mul -> true
            | Minus -> true
            | Mod -> true
            | BvAnd -> false
            | BvXor -> false
            | BvOr -> false
            | BvAdd -> false
            | BvSub -> false
            | BvShl -> false
            | BvShr -> false
            | BvUdiv -> false
            | BvMod -> false
            | BvMul -> false
            | BvUlt -> false
            | BvUext uu____4537 -> false
            | NatToBv uu____4540 -> false
            | BvToNat -> false
            | ITE -> false in
          if Prims.op_Negation head_ok
          then FStar_Pervasives_Native.Some t1
          else aux_l terms
      | Labeled (t2, uu____4551, uu____4552) -> aux t2
      | Quant uu____4555 -> FStar_Pervasives_Native.Some t1
      | LblPos uu____4575 -> FStar_Pervasives_Native.Some t1
    and aux_l ts =
      match ts with
      | [] -> FStar_Pervasives_Native.None
      | t1::ts1 ->
          let uu____4590 = aux t1 in
          (match uu____4590 with
           | FStar_Pervasives_Native.Some t2 ->
               FStar_Pervasives_Native.Some t2
           | FStar_Pervasives_Native.None -> aux_l ts1) in
    aux t
let rec (print_smt_term : term -> Prims.string) =
  fun t ->
    match t.tm with
    | Integer n -> FStar_Util.format1 "(Integer %s)" n
    | String s -> FStar_Util.format1 "(String %s)" s
    | Real r -> FStar_Util.format1 "(Real %s)" r
    | BoundV n ->
        let uu____4631 = FStar_Util.string_of_int n in
        FStar_Util.format1 "(BoundV %s)" uu____4631
    | FreeV fv1 ->
        let uu____4643 = fv_name fv1 in
        FStar_Util.format1 "(FreeV %s)" uu____4643
    | App (op1, l) ->
        let uu____4652 = op_to_string op1 in
        let uu____4654 = print_smt_term_list l in
        FStar_Util.format2 "(%s %s)" uu____4652 uu____4654
    | Labeled (t1, r1, r2) ->
        let uu____4662 = print_smt_term t1 in
        FStar_Util.format2 "(Labeled '%s' %s)" r1 uu____4662
    | LblPos (t1, s) ->
        let uu____4669 = print_smt_term t1 in
        FStar_Util.format2 "(LblPos %s %s)" s uu____4669
    | Quant (qop1, l, uu____4674, uu____4675, t1) ->
        let uu____4695 = print_smt_term_list_list l in
        let uu____4697 = print_smt_term t1 in
        FStar_Util.format3 "(%s %s %s)" (qop_to_string qop1) uu____4695
          uu____4697
    | Let (es, body) ->
        let uu____4706 = print_smt_term_list es in
        let uu____4708 = print_smt_term body in
        FStar_Util.format2 "(let %s %s)" uu____4706 uu____4708
and (print_smt_term_list : term Prims.list -> Prims.string) =
  fun l ->
    let uu____4715 = FStar_List.map print_smt_term l in
    FStar_All.pipe_right uu____4715 (FStar_String.concat " ")
and (print_smt_term_list_list : term Prims.list Prims.list -> Prims.string) =
  fun l ->
    FStar_List.fold_left
      (fun s ->
         fun l1 ->
           let uu____4742 =
             let uu____4744 =
               let uu____4746 = print_smt_term_list l1 in
               Prims.op_Hat uu____4746 " ] " in
             Prims.op_Hat "; [ " uu____4744 in
           Prims.op_Hat s uu____4742) "" l
let (mkQuant :
  FStar_Range.range ->
    Prims.bool ->
      (qop * term Prims.list Prims.list * Prims.int
        FStar_Pervasives_Native.option * sort Prims.list * term) -> term)
  =
  fun r ->
    fun check_pats ->
      fun uu____4786 ->
        match uu____4786 with
        | (qop1, pats, wopt, vars, body) ->
            let all_pats_ok pats1 =
              if Prims.op_Negation check_pats
              then pats1
              else
                (let uu____4855 =
                   FStar_Util.find_map pats1
                     (fun x -> FStar_Util.find_map x check_pattern_ok) in
                 match uu____4855 with
                 | FStar_Pervasives_Native.None -> pats1
                 | FStar_Pervasives_Native.Some p ->
                     ((let uu____4870 =
                         let uu____4876 =
                           let uu____4878 = print_smt_term p in
                           FStar_Util.format1
                             "Pattern (%s) contains illegal symbols; dropping it"
                             uu____4878 in
                         (FStar_Errors.Warning_SMTPatternIllFormed,
                           uu____4876) in
                       FStar_Errors.log_issue r uu____4870);
                      [])) in
            if (FStar_List.length vars) = Prims.int_zero
            then body
            else
              (match body.tm with
               | App (TrueOp, uu____4889) -> body
               | uu____4894 ->
                   let uu____4895 =
                     let uu____4896 =
                       let uu____4916 = all_pats_ok pats in
                       (qop1, uu____4916, wopt, vars, body) in
                     Quant uu____4896 in
                   mk uu____4895 r)
let (mkLet : (term Prims.list * term) -> FStar_Range.range -> term) =
  fun uu____4945 ->
    fun r ->
      match uu____4945 with
      | (es, body) ->
          if (FStar_List.length es) = Prims.int_zero
          then body
          else mk (Let (es, body)) r
let (abstr : fv Prims.list -> term -> term) =
  fun fvs1 ->
    fun t ->
      let nvars = FStar_List.length fvs1 in
      let index_of fv1 =
        let uu____4991 = FStar_Util.try_find_index (fv_eq fv1) fvs1 in
        match uu____4991 with
        | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
        | FStar_Pervasives_Native.Some i ->
            FStar_Pervasives_Native.Some (nvars - (i + Prims.int_one)) in
      let rec aux ix t1 =
        let uu____5018 = FStar_ST.op_Bang t1.freevars in
        match uu____5018 with
        | FStar_Pervasives_Native.Some [] -> t1
        | uu____5092 ->
            (match t1.tm with
             | Integer uu____5105 -> t1
             | String uu____5107 -> t1
             | Real uu____5109 -> t1
             | BoundV uu____5111 -> t1
             | FreeV x ->
                 let uu____5122 = index_of x in
                 (match uu____5122 with
                  | FStar_Pervasives_Native.None -> t1
                  | FStar_Pervasives_Native.Some i ->
                      mkBoundV (i + ix) t1.rng)
             | App (op1, tms) ->
                 let uu____5136 =
                   let uu____5143 = FStar_List.map (aux ix) tms in
                   (op1, uu____5143) in
                 mkApp' uu____5136 t1.rng
             | Labeled (t2, r1, r2) ->
                 let uu____5153 =
                   let uu____5154 =
                     let uu____5162 = aux ix t2 in (uu____5162, r1, r2) in
                   Labeled uu____5154 in
                 mk uu____5153 t2.rng
             | LblPos (t2, r) ->
                 let uu____5168 =
                   let uu____5169 =
                     let uu____5175 = aux ix t2 in (uu____5175, r) in
                   LblPos uu____5169 in
                 mk uu____5168 t2.rng
             | Quant (qop1, pats, wopt, vars, body) ->
                 let n = FStar_List.length vars in
                 let uu____5201 =
                   let uu____5221 =
                     FStar_All.pipe_right pats
                       (FStar_List.map (FStar_List.map (aux (ix + n)))) in
                   let uu____5238 = aux (ix + n) body in
                   (qop1, uu____5221, wopt, vars, uu____5238) in
                 mkQuant t1.rng false uu____5201
             | Let (es, body) ->
                 let uu____5255 =
                   FStar_List.fold_left
                     (fun uu____5275 ->
                        fun e ->
                          match uu____5275 with
                          | (ix1, l) ->
                              let uu____5299 =
                                let uu____5302 = aux ix1 e in uu____5302 :: l in
                              ((ix1 + Prims.int_one), uu____5299)) (ix, [])
                     es in
                 (match uu____5255 with
                  | (ix1, es_rev) ->
                      let uu____5318 =
                        let uu____5325 = aux ix1 body in
                        ((FStar_List.rev es_rev), uu____5325) in
                      mkLet uu____5318 t1.rng)) in
      aux Prims.int_zero t
let (inst : term Prims.list -> term -> term) =
  fun tms ->
    fun t ->
      let tms1 = FStar_List.rev tms in
      let n = FStar_List.length tms1 in
      let rec aux shift t1 =
        match t1.tm with
        | Integer uu____5361 -> t1
        | String uu____5363 -> t1
        | Real uu____5365 -> t1
        | FreeV uu____5367 -> t1
        | BoundV i ->
            if (Prims.int_zero <= (i - shift)) && ((i - shift) < n)
            then FStar_List.nth tms1 (i - shift)
            else t1
        | App (op1, tms2) ->
            let uu____5388 =
              let uu____5395 = FStar_List.map (aux shift) tms2 in
              (op1, uu____5395) in
            mkApp' uu____5388 t1.rng
        | Labeled (t2, r1, r2) ->
            let uu____5405 =
              let uu____5406 =
                let uu____5414 = aux shift t2 in (uu____5414, r1, r2) in
              Labeled uu____5406 in
            mk uu____5405 t2.rng
        | LblPos (t2, r) ->
            let uu____5420 =
              let uu____5421 =
                let uu____5427 = aux shift t2 in (uu____5427, r) in
              LblPos uu____5421 in
            mk uu____5420 t2.rng
        | Quant (qop1, pats, wopt, vars, body) ->
            let m = FStar_List.length vars in
            let shift1 = shift + m in
            let uu____5455 =
              let uu____5475 =
                FStar_All.pipe_right pats
                  (FStar_List.map (FStar_List.map (aux shift1))) in
              let uu____5492 = aux shift1 body in
              (qop1, uu____5475, wopt, vars, uu____5492) in
            mkQuant t1.rng false uu____5455
        | Let (es, body) ->
            let uu____5509 =
              FStar_List.fold_left
                (fun uu____5529 ->
                   fun e ->
                     match uu____5529 with
                     | (ix, es1) ->
                         let uu____5553 =
                           let uu____5556 = aux shift e in uu____5556 :: es1 in
                         ((shift + Prims.int_one), uu____5553)) (shift, [])
                es in
            (match uu____5509 with
             | (shift1, es_rev) ->
                 let uu____5572 =
                   let uu____5579 = aux shift1 body in
                   ((FStar_List.rev es_rev), uu____5579) in
                 mkLet uu____5572 t1.rng) in
      aux Prims.int_zero t
let (subst : term -> fv -> term -> term) =
  fun t ->
    fun fv1 -> fun s -> let uu____5599 = abstr [fv1] t in inst [s] uu____5599
let (mkQuant' :
  FStar_Range.range ->
    (qop * term Prims.list Prims.list * Prims.int
      FStar_Pervasives_Native.option * fv Prims.list * term) -> term)
  =
  fun r ->
    fun uu____5629 ->
      match uu____5629 with
      | (qop1, pats, wopt, vars, body) ->
          let uu____5672 =
            let uu____5692 =
              FStar_All.pipe_right pats
                (FStar_List.map (FStar_List.map (abstr vars))) in
            let uu____5709 = FStar_List.map fv_sort vars in
            let uu____5712 = abstr vars body in
            (qop1, uu____5692, wopt, uu____5709, uu____5712) in
          mkQuant r true uu____5672
let (mkForall :
  FStar_Range.range -> (pat Prims.list Prims.list * fvs * term) -> term) =
  fun r ->
    fun uu____5743 ->
      match uu____5743 with
      | (pats, vars, body) ->
          mkQuant' r (Forall, pats, FStar_Pervasives_Native.None, vars, body)
let (mkForall'' :
  FStar_Range.range ->
    (pat Prims.list Prims.list * Prims.int FStar_Pervasives_Native.option *
      sort Prims.list * term) -> term)
  =
  fun r ->
    fun uu____5802 ->
      match uu____5802 with
      | (pats, wopt, sorts, body) ->
          mkQuant r true (Forall, pats, wopt, sorts, body)
let (mkForall' :
  FStar_Range.range ->
    (pat Prims.list Prims.list * Prims.int FStar_Pervasives_Native.option *
      fvs * term) -> term)
  =
  fun r ->
    fun uu____5877 ->
      match uu____5877 with
      | (pats, wopt, vars, body) ->
          mkQuant' r (Forall, pats, wopt, vars, body)
let (mkExists :
  FStar_Range.range -> (pat Prims.list Prims.list * fvs * term) -> term) =
  fun r ->
    fun uu____5940 ->
      match uu____5940 with
      | (pats, vars, body) ->
          mkQuant' r (Exists, pats, FStar_Pervasives_Native.None, vars, body)
let (mkLet' : ((fv * term) Prims.list * term) -> FStar_Range.range -> term) =
  fun uu____5991 ->
    fun r ->
      match uu____5991 with
      | (bindings, body) ->
          let uu____6017 = FStar_List.split bindings in
          (match uu____6017 with
           | (vars, es) ->
               let uu____6036 =
                 let uu____6043 = abstr vars body in (es, uu____6043) in
               mkLet uu____6036 r)
let (norng : FStar_Range.range) = FStar_Range.dummyRange
let (mkDefineFun :
  (Prims.string * fv Prims.list * sort * term * caption) -> decl) =
  fun uu____6065 ->
    match uu____6065 with
    | (nm, vars, s, tm, c) ->
        let uu____6090 =
          let uu____6104 = FStar_List.map fv_sort vars in
          let uu____6107 = abstr vars tm in
          (nm, uu____6104, s, uu____6107, c) in
        DefineFun uu____6090
let (constr_id_of_sort : sort -> Prims.string) =
  fun sort1 ->
    let uu____6118 = strSort sort1 in
    FStar_Util.format1 "%s_constr_id" uu____6118
let (fresh_token : (Prims.string * sort) -> Prims.int -> decl) =
  fun uu____6136 ->
    fun id ->
      match uu____6136 with
      | (tok_name, sort1) ->
          let a_name = Prims.op_Hat "fresh_token_" tok_name in
          let a =
            let uu____6152 =
              let uu____6153 =
                let uu____6158 = mkInteger' id norng in
                let uu____6159 =
                  let uu____6160 =
                    let uu____6168 = constr_id_of_sort sort1 in
                    let uu____6170 =
                      let uu____6173 = mkApp (tok_name, []) norng in
                      [uu____6173] in
                    (uu____6168, uu____6170) in
                  mkApp uu____6160 norng in
                (uu____6158, uu____6159) in
              mkEq uu____6153 norng in
            let uu____6180 = escape a_name in
            {
              assumption_term = uu____6152;
              assumption_caption =
                (FStar_Pervasives_Native.Some "fresh token");
              assumption_name = uu____6180;
              assumption_fact_ids = []
            } in
          Assume a
let (fresh_constructor :
  FStar_Range.range ->
    (Prims.string * sort Prims.list * sort * Prims.int) -> decl)
  =
  fun rng ->
    fun uu____6206 ->
      match uu____6206 with
      | (name, arg_sorts, sort1, id) ->
          let id1 = FStar_Util.string_of_int id in
          let bvars =
            FStar_All.pipe_right arg_sorts
              (FStar_List.mapi
                 (fun i ->
                    fun s ->
                      let uu____6246 =
                        let uu____6247 =
                          let uu____6253 =
                            let uu____6255 = FStar_Util.string_of_int i in
                            Prims.op_Hat "x_" uu____6255 in
                          (uu____6253, s) in
                        mk_fv uu____6247 in
                      mkFreeV uu____6246 norng)) in
          let bvar_names = FStar_List.map fv_of_term bvars in
          let capp = mkApp (name, bvars) norng in
          let cid_app =
            let uu____6283 =
              let uu____6291 = constr_id_of_sort sort1 in
              (uu____6291, [capp]) in
            mkApp uu____6283 norng in
          let a_name = Prims.op_Hat "constructor_distinct_" name in
          let a =
            let uu____6300 =
              let uu____6301 =
                let uu____6312 =
                  let uu____6313 =
                    let uu____6318 = mkInteger id1 norng in
                    (uu____6318, cid_app) in
                  mkEq uu____6313 norng in
                ([[capp]], bvar_names, uu____6312) in
              mkForall rng uu____6301 in
            let uu____6327 = escape a_name in
            {
              assumption_term = uu____6300;
              assumption_caption =
                (FStar_Pervasives_Native.Some "Constructor distinct");
              assumption_name = uu____6327;
              assumption_fact_ids = []
            } in
          Assume a
let (injective_constructor :
  FStar_Range.range ->
    (Prims.string * constructor_field Prims.list * sort) -> decl Prims.list)
  =
  fun rng ->
    fun uu____6352 ->
      match uu____6352 with
      | (name, fields, sort1) ->
          let n_bvars = FStar_List.length fields in
          let bvar_name i =
            let uu____6385 = FStar_Util.string_of_int i in
            Prims.op_Hat "x_" uu____6385 in
          let bvar_index i = n_bvars - (i + Prims.int_one) in
          let bvar i s =
            let uu____6414 =
              let uu____6415 =
                let uu____6421 = bvar_name i in (uu____6421, s) in
              mk_fv uu____6415 in
            FStar_All.pipe_left mkFreeV uu____6414 in
          let bvars =
            FStar_All.pipe_right fields
              (FStar_List.mapi
                 (fun i ->
                    fun uu____6457 ->
                      match uu____6457 with
                      | (uu____6467, s, uu____6469) ->
                          let uu____6474 = bvar i s in uu____6474 norng)) in
          let bvar_names = FStar_List.map fv_of_term bvars in
          let capp = mkApp (name, bvars) norng in
          let uu____6502 =
            FStar_All.pipe_right fields
              (FStar_List.mapi
                 (fun i ->
                    fun uu____6540 ->
                      match uu____6540 with
                      | (name1, s, projectible) ->
                          let cproj_app = mkApp (name1, [capp]) norng in
                          let proj_name =
                            DeclFun
                              (name1, [sort1], s,
                                (FStar_Pervasives_Native.Some "Projector")) in
                          if projectible
                          then
                            let a =
                              let uu____6573 =
                                let uu____6574 =
                                  let uu____6585 =
                                    let uu____6586 =
                                      let uu____6591 =
                                        let uu____6592 = bvar i s in
                                        uu____6592 norng in
                                      (cproj_app, uu____6591) in
                                    mkEq uu____6586 norng in
                                  ([[capp]], bvar_names, uu____6585) in
                                mkForall rng uu____6574 in
                              let uu____6605 =
                                escape
                                  (Prims.op_Hat "projection_inverse_" name1) in
                              {
                                assumption_term = uu____6573;
                                assumption_caption =
                                  (FStar_Pervasives_Native.Some
                                     "Projection inverse");
                                assumption_name = uu____6605;
                                assumption_fact_ids = []
                              } in
                            [proj_name; Assume a]
                          else [proj_name])) in
          FStar_All.pipe_right uu____6502 FStar_List.flatten
let (constructor_to_decl :
  FStar_Range.range -> constructor_t -> decl Prims.list) =
  fun rng ->
    fun uu____6630 ->
      match uu____6630 with
      | (name, fields, sort1, id, injective) ->
          let injective1 = injective || true in
          let field_sorts =
            FStar_All.pipe_right fields
              (FStar_List.map
                 (fun uu____6678 ->
                    match uu____6678 with
                    | (uu____6687, sort2, uu____6689) -> sort2)) in
          let cdecl =
            DeclFun
              (name, field_sorts, sort1,
                (FStar_Pervasives_Native.Some "Constructor")) in
          let cid = fresh_constructor rng (name, field_sorts, sort1, id) in
          let disc =
            let disc_name = Prims.op_Hat "is-" name in
            let xfv = mk_fv ("x", sort1) in
            let xx = mkFreeV xfv norng in
            let disc_eq =
              let uu____6714 =
                let uu____6719 =
                  let uu____6720 =
                    let uu____6728 = constr_id_of_sort sort1 in
                    (uu____6728, [xx]) in
                  mkApp uu____6720 norng in
                let uu____6733 =
                  let uu____6734 = FStar_Util.string_of_int id in
                  mkInteger uu____6734 norng in
                (uu____6719, uu____6733) in
              mkEq uu____6714 norng in
            let uu____6736 =
              let uu____6755 =
                FStar_All.pipe_right fields
                  (FStar_List.mapi
                     (fun i ->
                        fun uu____6819 ->
                          match uu____6819 with
                          | (proj, s, projectible) ->
                              if projectible
                              then
                                let uu____6849 = mkApp (proj, [xx]) norng in
                                (uu____6849, [])
                              else
                                (let fi =
                                   let uu____6858 =
                                     let uu____6864 =
                                       let uu____6866 =
                                         FStar_Util.string_of_int i in
                                       Prims.op_Hat "f_" uu____6866 in
                                     (uu____6864, s) in
                                   mk_fv uu____6858 in
                                 let uu____6870 = mkFreeV fi norng in
                                 (uu____6870, [fi])))) in
              FStar_All.pipe_right uu____6755 FStar_List.split in
            match uu____6736 with
            | (proj_terms, ex_vars) ->
                let ex_vars1 = FStar_List.flatten ex_vars in
                let disc_inv_body =
                  let uu____6967 =
                    let uu____6972 = mkApp (name, proj_terms) norng in
                    (xx, uu____6972) in
                  mkEq uu____6967 norng in
                let disc_inv_body1 =
                  match ex_vars1 with
                  | [] -> disc_inv_body
                  | uu____6985 ->
                      mkExists norng ([], ex_vars1, disc_inv_body) in
                let disc_ax = mkAnd (disc_eq, disc_inv_body1) norng in
                let def =
                  mkDefineFun
                    (disc_name, [xfv], Bool_sort, disc_ax,
                      (FStar_Pervasives_Native.Some
                         "Discriminator definition")) in
                def in
          let projs =
            if injective1
            then injective_constructor rng (name, fields, sort1)
            else [] in
          let uu____7020 =
            let uu____7023 =
              let uu____7024 =
                FStar_Util.format1 "<start constructor %s>" name in
              Caption uu____7024 in
            uu____7023 :: cdecl :: cid :: projs in
          let uu____7027 =
            let uu____7030 =
              let uu____7033 =
                let uu____7034 =
                  FStar_Util.format1 "</end constructor %s>" name in
                Caption uu____7034 in
              [uu____7033] in
            FStar_List.append [disc] uu____7030 in
          FStar_List.append uu____7020 uu____7027
let (name_binders_inner :
  Prims.string FStar_Pervasives_Native.option ->
    fv Prims.list ->
      Prims.int ->
        sort Prims.list ->
          (fv Prims.list * Prims.string Prims.list * Prims.int))
  =
  fun prefix_opt ->
    fun outer_names ->
      fun start ->
        fun sorts ->
          let uu____7086 =
            FStar_All.pipe_right sorts
              (FStar_List.fold_left
                 (fun uu____7135 ->
                    fun s ->
                      match uu____7135 with
                      | (names, binders1, n) ->
                          let prefix =
                            match s with
                            | Term_sort -> "@x"
                            | uu____7180 -> "@u" in
                          let prefix1 =
                            match prefix_opt with
                            | FStar_Pervasives_Native.None -> prefix
                            | FStar_Pervasives_Native.Some p ->
                                Prims.op_Hat p prefix in
                          let nm =
                            let uu____7191 = FStar_Util.string_of_int n in
                            Prims.op_Hat prefix1 uu____7191 in
                          let names1 =
                            let uu____7196 = mk_fv (nm, s) in uu____7196 ::
                              names in
                          let b =
                            let uu____7200 = strSort s in
                            FStar_Util.format2 "(%s %s)" nm uu____7200 in
                          (names1, (b :: binders1), (n + Prims.int_one)))
                 (outer_names, [], start)) in
          match uu____7086 with
          | (names, binders1, n) -> (names, (FStar_List.rev binders1), n)
let (name_macro_binders :
  sort Prims.list -> (fv Prims.list * Prims.string Prims.list)) =
  fun sorts ->
    let uu____7271 =
      name_binders_inner (FStar_Pervasives_Native.Some "__") []
        Prims.int_zero sorts in
    match uu____7271 with
    | (names, binders1, n) -> ((FStar_List.rev names), binders1)
let (termToSmt : Prims.bool -> Prims.string -> term -> Prims.string) =
  let string_id_counter = FStar_Util.mk_ref Prims.int_zero in
  let string_cache = FStar_Util.smap_create (Prims.of_int (20)) in
  fun print_ranges ->
    fun enclosing_name ->
      fun t ->
        let next_qid =
          let ctr = FStar_Util.mk_ref Prims.int_zero in
          fun depth ->
            let n = FStar_ST.op_Bang ctr in
            FStar_Util.incr ctr;
            if n = Prims.int_zero
            then enclosing_name
            else
              (let uu____7392 = FStar_Util.string_of_int n in
               FStar_Util.format2 "%s.%s" enclosing_name uu____7392) in
        let remove_guard_free pats =
          FStar_All.pipe_right pats
            (FStar_List.map
               (fun ps ->
                  FStar_All.pipe_right ps
                    (FStar_List.map
                       (fun tm ->
                          match tm.tm with
                          | App
                              (Var "Prims.guard_free",
                               { tm = BoundV uu____7438;
                                 freevars = uu____7439; rng = uu____7440;_}::[])
                              -> tm
                          | App (Var "Prims.guard_free", p::[]) -> p
                          | uu____7461 -> tm)))) in
        let rec aux' depth n names t1 =
          let aux1 = aux (depth + Prims.int_one) in
          match t1.tm with
          | Integer i -> i
          | Real r -> r
          | String s ->
              let id_opt = FStar_Util.smap_try_find string_cache s in
              (match id_opt with
               | FStar_Pervasives_Native.Some id -> id
               | FStar_Pervasives_Native.None ->
                   let id =
                     let uu____7551 = FStar_ST.op_Bang string_id_counter in
                     FStar_All.pipe_right uu____7551 FStar_Util.string_of_int in
                   (FStar_Util.incr string_id_counter;
                    FStar_Util.smap_add string_cache s id;
                    id))
          | BoundV i ->
              let uu____7581 = FStar_List.nth names i in
              FStar_All.pipe_right uu____7581 fv_name
          | FreeV x when fv_force x ->
              let uu____7592 =
                let uu____7594 = fv_name x in
                Prims.op_Hat uu____7594 " Dummy_value)" in
              Prims.op_Hat "(" uu____7592
          | FreeV x -> fv_name x
          | App (op1, []) -> op_to_string op1
          | App (op1, tms) ->
              let uu____7616 = op_to_string op1 in
              let uu____7618 =
                let uu____7620 = FStar_List.map (aux1 n names) tms in
                FStar_All.pipe_right uu____7620 (FStar_String.concat "\n") in
              FStar_Util.format2 "(%s %s)" uu____7616 uu____7618
          | Labeled (t2, uu____7632, uu____7633) -> aux1 n names t2
          | LblPos (t2, s) ->
              let uu____7640 = aux1 n names t2 in
              FStar_Util.format2 "(! %s :lblpos %s)" uu____7640 s
          | Quant (qop1, pats, wopt, sorts, body) ->
              let qid = next_qid () in
              let uu____7668 =
                name_binders_inner FStar_Pervasives_Native.None names n sorts in
              (match uu____7668 with
               | (names1, binders1, n1) ->
                   let binders2 =
                     FStar_All.pipe_right binders1 (FStar_String.concat " ") in
                   let pats1 = remove_guard_free pats in
                   let pats_str =
                     match pats1 with
                     | []::[] -> ";;no pats"
                     | [] -> ";;no pats"
                     | uu____7721 ->
                         let uu____7726 =
                           FStar_All.pipe_right pats1
                             (FStar_List.map
                                (fun pats2 ->
                                   let uu____7745 =
                                     let uu____7747 =
                                       FStar_List.map
                                         (fun p ->
                                            let uu____7755 = aux1 n1 names1 p in
                                            FStar_Util.format1 "%s"
                                              uu____7755) pats2 in
                                     FStar_String.concat " " uu____7747 in
                                   FStar_Util.format1 "\n:pattern (%s)"
                                     uu____7745)) in
                         FStar_All.pipe_right uu____7726
                           (FStar_String.concat "\n") in
                   let uu____7765 =
                     let uu____7769 =
                       let uu____7773 =
                         let uu____7777 = aux1 n1 names1 body in
                         let uu____7779 =
                           let uu____7783 = weightToSmt wopt in
                           [uu____7783; pats_str; qid] in
                         uu____7777 :: uu____7779 in
                       binders2 :: uu____7773 in
                     (qop_to_string qop1) :: uu____7769 in
                   FStar_Util.format "(%s (%s)\n (! %s\n %s\n%s\n:qid %s))"
                     uu____7765)
          | Let (es, body) ->
              let uu____7799 =
                FStar_List.fold_left
                  (fun uu____7832 ->
                     fun e ->
                       match uu____7832 with
                       | (names0, binders1, n0) ->
                           let nm =
                             let uu____7875 = FStar_Util.string_of_int n0 in
                             Prims.op_Hat "@lb" uu____7875 in
                           let names01 =
                             let uu____7881 = mk_fv (nm, Term_sort) in
                             uu____7881 :: names0 in
                           let b =
                             let uu____7885 = aux1 n names e in
                             FStar_Util.format2 "(%s %s)" nm uu____7885 in
                           (names01, (b :: binders1), (n0 + Prims.int_one)))
                  (names, [], n) es in
              (match uu____7799 with
               | (names1, binders1, n1) ->
                   let uu____7919 = aux1 n1 names1 body in
                   FStar_Util.format2 "(let (%s)\n%s)"
                     (FStar_String.concat " " binders1) uu____7919)
        and aux depth n names t1 =
          let s = aux' depth n names t1 in
          if print_ranges && (t1.rng <> norng)
          then
            let uu____7935 = FStar_Range.string_of_range t1.rng in
            let uu____7937 = FStar_Range.string_of_use_range t1.rng in
            FStar_Util.format3 "\n;; def=%s; use=%s\n%s\n" uu____7935
              uu____7937 s
          else s in
        aux Prims.int_zero Prims.int_zero [] t
let (caption_to_string :
  Prims.bool -> Prims.string FStar_Pervasives_Native.option -> Prims.string)
  =
  fun print_captions ->
    fun uu___6_7959 ->
      match uu___6_7959 with
      | FStar_Pervasives_Native.Some c when print_captions ->
          let c1 =
            let uu____7970 =
              FStar_All.pipe_right (FStar_String.split [10] c)
                (FStar_List.map FStar_Util.trim_string) in
            FStar_All.pipe_right uu____7970 (FStar_String.concat " ") in
          Prims.op_Hat ";;;;;;;;;;;;;;;;" (Prims.op_Hat c1 "\n")
      | uu____7992 -> ""
let rec (declToSmt' : Prims.bool -> Prims.string -> decl -> Prims.string) =
  fun print_captions ->
    fun z3options ->
      fun decl1 ->
        match decl1 with
        | DefPrelude -> mkPrelude z3options
        | Module (s, decls) ->
            let res =
              let uu____8045 =
                FStar_List.map (declToSmt' print_captions z3options) decls in
              FStar_All.pipe_right uu____8045 (FStar_String.concat "\n") in
            let uu____8055 = FStar_Options.keep_query_captions () in
            if uu____8055
            then
              let uu____8059 =
                FStar_Util.string_of_int (FStar_List.length decls) in
              let uu____8061 =
                FStar_Util.string_of_int (FStar_String.length res) in
              FStar_Util.format5
                "\n;;; Start %s\n%s\n;;; End %s (%s decls; total size %s)" s
                res s uu____8059 uu____8061
            else res
        | Caption c ->
            if print_captions
            then
              let uu____8070 =
                let uu____8072 =
                  FStar_All.pipe_right (FStar_Util.splitlines c)
                    (FStar_List.map
                       (fun s -> Prims.op_Hat "; " (Prims.op_Hat s "\n"))) in
                FStar_All.pipe_right uu____8072 (FStar_String.concat "") in
              Prims.op_Hat "\n" uu____8070
            else ""
        | DeclFun (f, argsorts, retsort, c) ->
            let l = FStar_List.map strSort argsorts in
            let uu____8113 = caption_to_string print_captions c in
            let uu____8115 = strSort retsort in
            FStar_Util.format4 "%s(declare-fun %s (%s) %s)" uu____8113 f
              (FStar_String.concat " " l) uu____8115
        | DefineFun (f, arg_sorts, retsort, body, c) ->
            let uu____8130 = name_macro_binders arg_sorts in
            (match uu____8130 with
             | (names, binders1) ->
                 let body1 =
                   let uu____8154 =
                     FStar_List.map (fun x -> mkFreeV x norng) names in
                   inst uu____8154 body in
                 let uu____8159 = caption_to_string print_captions c in
                 let uu____8161 = strSort retsort in
                 let uu____8163 =
                   let uu____8165 = escape f in
                   termToSmt print_captions uu____8165 body1 in
                 FStar_Util.format5 "%s(define-fun %s (%s) %s\n %s)"
                   uu____8159 f (FStar_String.concat " " binders1) uu____8161
                   uu____8163)
        | Assume a ->
            let fact_ids_to_string ids =
              FStar_All.pipe_right ids
                (FStar_List.map
                   (fun uu___7_8192 ->
                      match uu___7_8192 with
                      | Name n ->
                          let uu____8195 = FStar_Ident.string_of_lid n in
                          Prims.op_Hat "Name " uu____8195
                      | Namespace ns ->
                          let uu____8199 = FStar_Ident.string_of_lid ns in
                          Prims.op_Hat "Namespace " uu____8199
                      | Tag t -> Prims.op_Hat "Tag " t)) in
            let fids =
              if print_captions
              then
                let uu____8209 =
                  let uu____8211 = fact_ids_to_string a.assumption_fact_ids in
                  FStar_String.concat "; " uu____8211 in
                FStar_Util.format1 ";;; Fact-ids: %s\n" uu____8209
              else "" in
            let n = a.assumption_name in
            let uu____8222 =
              caption_to_string print_captions a.assumption_caption in
            let uu____8224 = termToSmt print_captions n a.assumption_term in
            FStar_Util.format4 "%s%s(assert (! %s\n:named %s))" uu____8222
              fids uu____8224 n
        | Eval t ->
            let uu____8228 = termToSmt print_captions "eval" t in
            FStar_Util.format1 "(eval %s)" uu____8228
        | Echo s -> FStar_Util.format1 "(echo \"%s\")" s
        | RetainAssumptions uu____8235 -> ""
        | CheckSat ->
            "(echo \"<result>\")\n(check-sat)\n(echo \"</result>\")"
        | GetUnsatCore ->
            "(echo \"<unsat-core>\")\n(get-unsat-core)\n(echo \"</unsat-core>\")"
        | Push -> "(push)"
        | Pop -> "(pop)"
        | SetOption (s, v) -> FStar_Util.format2 "(set-option :%s %s)" s v
        | GetStatistics ->
            "(echo \"<statistics>\")\n(get-info :all-statistics)\n(echo \"</statistics>\")"
        | GetReasonUnknown ->
            "(echo \"<reason-unknown>\")\n(get-info :reason-unknown)\n(echo \"</reason-unknown>\")"
and (declToSmt : Prims.string -> decl -> Prims.string) =
  fun z3options ->
    fun decl1 ->
      let uu____8256 = FStar_Options.keep_query_captions () in
      declToSmt' uu____8256 z3options decl1
and (mkPrelude : Prims.string -> Prims.string) =
  fun z3options ->
    let basic =
      Prims.op_Hat z3options
        "(declare-sort FString)\n(declare-fun FString_constr_id (FString) Int)\n\n(declare-sort Term)\n(declare-fun Term_constr_id (Term) Int)\n(declare-sort Dummy_sort)\n(declare-fun Dummy_value () Dummy_sort)\n(declare-datatypes () ((Fuel \n(ZFuel) \n(SFuel (prec Fuel)))))\n(declare-fun MaxIFuel () Fuel)\n(declare-fun MaxFuel () Fuel)\n(declare-fun PreType (Term) Term)\n(declare-fun Valid (Term) Bool)\n(declare-fun HasTypeFuel (Fuel Term Term) Bool)\n(define-fun HasTypeZ ((x Term) (t Term)) Bool\n(HasTypeFuel ZFuel x t))\n(define-fun HasType ((x Term) (t Term)) Bool\n(HasTypeFuel MaxIFuel x t))\n(declare-fun IsTotFun (Term) Bool)\n\n                ;;fuel irrelevance\n(assert (forall ((f Fuel) (x Term) (t Term))\n(! (= (HasTypeFuel (SFuel f) x t)\n(HasTypeZ x t))\n:pattern ((HasTypeFuel (SFuel f) x t)))))\n(declare-fun NoHoist (Term Bool) Bool)\n;;no-hoist\n(assert (forall ((dummy Term) (b Bool))\n(! (= (NoHoist dummy b)\nb)\n:pattern ((NoHoist dummy b)))))\n(define-fun  IsTyped ((x Term)) Bool\n(exists ((t Term)) (HasTypeZ x t)))\n(declare-fun ApplyTF (Term Fuel) Term)\n(declare-fun ApplyTT (Term Term) Term)\n(declare-fun Rank (Term) Int)\n(declare-fun Closure (Term) Term)\n(declare-fun ConsTerm (Term Term) Term)\n(declare-fun ConsFuel (Fuel Term) Term)\n(declare-fun Tm_uvar (Int) Term)\n(define-fun Reify ((x Term)) Term x)\n(declare-fun Prims.precedes (Term Term Term Term) Term)\n(declare-fun Range_const (Int) Term)\n(declare-fun _mul (Int Int) Int)\n(declare-fun _div (Int Int) Int)\n(declare-fun _mod (Int Int) Int)\n(declare-fun __uu__PartialApp () Term)\n(assert (forall ((x Int) (y Int)) (! (= (_mul x y) (* x y)) :pattern ((_mul x y)))))\n(assert (forall ((x Int) (y Int)) (! (= (_div x y) (div x y)) :pattern ((_div x y)))))\n(assert (forall ((x Int) (y Int)) (! (= (_mod x y) (mod x y)) :pattern ((_mod x y)))))\n(declare-fun _rmul (Real Real) Real)\n(declare-fun _rdiv (Real Real) Real)\n(assert (forall ((x Real) (y Real)) (! (= (_rmul x y) (* x y)) :pattern ((_rmul x y)))))\n(assert (forall ((x Real) (y Real)) (! (= (_rdiv x y) (/ x y)) :pattern ((_rdiv x y)))))" in
    let constrs =
      [("FString_const", [("FString_const_proj_0", Int_sort, true)],
         String_sort, Prims.int_zero, true);
      ("Tm_type", [], Term_sort, (Prims.of_int (2)), true);
      ("Tm_arrow", [("Tm_arrow_id", Int_sort, true)], Term_sort,
        (Prims.of_int (3)), false);
      ("Tm_unit", [], Term_sort, (Prims.of_int (6)), true);
      ((FStar_Pervasives_Native.fst boxIntFun),
        [((FStar_Pervasives_Native.snd boxIntFun), Int_sort, true)],
        Term_sort, (Prims.of_int (7)), true);
      ((FStar_Pervasives_Native.fst boxBoolFun),
        [((FStar_Pervasives_Native.snd boxBoolFun), Bool_sort, true)],
        Term_sort, (Prims.of_int (8)), true);
      ((FStar_Pervasives_Native.fst boxStringFun),
        [((FStar_Pervasives_Native.snd boxStringFun), String_sort, true)],
        Term_sort, (Prims.of_int (9)), true);
      ((FStar_Pervasives_Native.fst boxRealFun),
        [((FStar_Pervasives_Native.snd boxRealFun), (Sort "Real"), true)],
        Term_sort, (Prims.of_int (10)), true);
      ("LexCons",
        [("LexCons_0", Term_sort, true);
        ("LexCons_1", Term_sort, true);
        ("LexCons_2", Term_sort, true)], Term_sort, (Prims.of_int (11)),
        true)] in
    let bcons =
      let uu____8383 =
        let uu____8387 =
          FStar_All.pipe_right constrs
            (FStar_List.collect (constructor_to_decl norng)) in
        FStar_All.pipe_right uu____8387
          (FStar_List.map (declToSmt z3options)) in
      FStar_All.pipe_right uu____8383 (FStar_String.concat "\n") in
    let lex_ordering =
      "\n(define-fun is-Prims.LexCons ((t Term)) Bool \n(is-LexCons t))\n(declare-fun Prims.lex_t () Term)\n(assert (forall ((t1 Term) (t2 Term) (x1 Term) (x2 Term) (y1 Term) (y2 Term))\n(iff (Valid (Prims.precedes Prims.lex_t Prims.lex_t (LexCons t1 x1 x2) (LexCons t2 y1 y2)))\n(or (Valid (Prims.precedes t1 t2 x1 y1))\n(and (= x1 y1)\n(Valid (Prims.precedes Prims.lex_t Prims.lex_t x2 y2)))))))\n(assert (forall ((t1 Term) (t2 Term) (e1 Term) (e2 Term))\n(! (iff (Valid (Prims.precedes t1 t2 e1 e2))\n(Valid (Prims.precedes Prims.lex_t Prims.lex_t e1 e2)))\n:pattern (Prims.precedes t1 t2 e1 e2))))\n(assert (forall ((t1 Term) (t2 Term))\n(! (iff (Valid (Prims.precedes Prims.lex_t Prims.lex_t t1 t2)) \n(< (Rank t1) (Rank t2)))\n:pattern ((Prims.precedes Prims.lex_t Prims.lex_t t1 t2)))))\n" in
    let valid_intro =
      "(assert (forall ((e Term) (t Term))\n(! (implies (HasType e t)\n(Valid t))\n:pattern ((HasType e t)\n(Valid t))\n:qid __prelude_valid_intro)))\n" in
    let valid_elim =
      "(assert (forall ((t Term))\n(! (implies (Valid t)\n(exists ((e Term)) (HasType e t)))\n:pattern ((Valid t))\n:qid __prelude_valid_elim)))\n" in
    let uu____8414 =
      let uu____8416 =
        let uu____8418 =
          let uu____8420 =
            let uu____8422 = FStar_Options.smtencoding_valid_intro () in
            if uu____8422 then valid_intro else "" in
          let uu____8429 =
            let uu____8431 = FStar_Options.smtencoding_valid_elim () in
            if uu____8431 then valid_elim else "" in
          Prims.op_Hat uu____8420 uu____8429 in
        Prims.op_Hat lex_ordering uu____8418 in
      Prims.op_Hat bcons uu____8416 in
    Prims.op_Hat basic uu____8414
let (declsToSmt : Prims.string -> decl Prims.list -> Prims.string) =
  fun z3options ->
    fun decls ->
      let uu____8456 = FStar_List.map (declToSmt z3options) decls in
      FStar_All.pipe_right uu____8456 (FStar_String.concat "\n")
let (declToSmt_no_caps : Prims.string -> decl -> Prims.string) =
  fun z3options -> fun decl1 -> declToSmt' false z3options decl1
let (mkBvConstructor : Prims.int -> decl Prims.list) =
  fun sz ->
    let uu____8491 =
      let uu____8492 =
        let uu____8494 = boxBitVecFun sz in
        FStar_Pervasives_Native.fst uu____8494 in
      let uu____8503 =
        let uu____8506 =
          let uu____8507 =
            let uu____8509 = boxBitVecFun sz in
            FStar_Pervasives_Native.snd uu____8509 in
          (uu____8507, (BitVec_sort sz), true) in
        [uu____8506] in
      (uu____8492, uu____8503, Term_sort, ((Prims.of_int (12)) + sz), true) in
    FStar_All.pipe_right uu____8491 (constructor_to_decl norng)
let (__range_c : Prims.int FStar_ST.ref) = FStar_Util.mk_ref Prims.int_zero
let (mk_Range_const : unit -> term) =
  fun uu____8541 ->
    let i = FStar_ST.op_Bang __range_c in
    (let uu____8566 =
       let uu____8568 = FStar_ST.op_Bang __range_c in
       uu____8568 + Prims.int_one in
     FStar_ST.op_Colon_Equals __range_c uu____8566);
    (let uu____8613 =
       let uu____8621 = let uu____8624 = mkInteger' i norng in [uu____8624] in
       ("Range_const", uu____8621) in
     mkApp uu____8613 norng)
let (mk_Term_type : term) = mkApp ("Tm_type", []) norng
let (mk_Term_app : term -> term -> FStar_Range.range -> term) =
  fun t1 -> fun t2 -> fun r -> mkApp ("Tm_app", [t1; t2]) r
let (mk_Term_uvar : Prims.int -> FStar_Range.range -> term) =
  fun i ->
    fun r ->
      let uu____8667 =
        let uu____8675 = let uu____8678 = mkInteger' i norng in [uu____8678] in
        ("Tm_uvar", uu____8675) in
      mkApp uu____8667 r
let (mk_Term_unit : term) = mkApp ("Tm_unit", []) norng
let (elim_box : Prims.bool -> Prims.string -> Prims.string -> term -> term) =
  fun cond ->
    fun u ->
      fun v ->
        fun t ->
          match t.tm with
          | App (Var v', t1::[]) when (v = v') && cond -> t1
          | uu____8721 -> mkApp (u, [t]) t.rng
let (maybe_elim_box : Prims.string -> Prims.string -> term -> term) =
  fun u ->
    fun v ->
      fun t ->
        let uu____8745 = FStar_Options.smtencoding_elim_box () in
        elim_box uu____8745 u v t
let (boxInt : term -> term) =
  fun t ->
    maybe_elim_box (FStar_Pervasives_Native.fst boxIntFun)
      (FStar_Pervasives_Native.snd boxIntFun) t
let (unboxInt : term -> term) =
  fun t ->
    maybe_elim_box (FStar_Pervasives_Native.snd boxIntFun)
      (FStar_Pervasives_Native.fst boxIntFun) t
let (boxBool : term -> term) =
  fun t ->
    maybe_elim_box (FStar_Pervasives_Native.fst boxBoolFun)
      (FStar_Pervasives_Native.snd boxBoolFun) t
let (unboxBool : term -> term) =
  fun t ->
    maybe_elim_box (FStar_Pervasives_Native.snd boxBoolFun)
      (FStar_Pervasives_Native.fst boxBoolFun) t
let (boxString : term -> term) =
  fun t ->
    maybe_elim_box (FStar_Pervasives_Native.fst boxStringFun)
      (FStar_Pervasives_Native.snd boxStringFun) t
let (unboxString : term -> term) =
  fun t ->
    maybe_elim_box (FStar_Pervasives_Native.snd boxStringFun)
      (FStar_Pervasives_Native.fst boxStringFun) t
let (boxReal : term -> term) =
  fun t ->
    maybe_elim_box (FStar_Pervasives_Native.fst boxRealFun)
      (FStar_Pervasives_Native.snd boxRealFun) t
let (unboxReal : term -> term) =
  fun t ->
    maybe_elim_box (FStar_Pervasives_Native.snd boxRealFun)
      (FStar_Pervasives_Native.fst boxRealFun) t
let (boxBitVec : Prims.int -> term -> term) =
  fun sz ->
    fun t ->
      let uu____8840 =
        let uu____8842 = boxBitVecFun sz in
        FStar_Pervasives_Native.fst uu____8842 in
      let uu____8851 =
        let uu____8853 = boxBitVecFun sz in
        FStar_Pervasives_Native.snd uu____8853 in
      elim_box true uu____8840 uu____8851 t
let (unboxBitVec : Prims.int -> term -> term) =
  fun sz ->
    fun t ->
      let uu____8876 =
        let uu____8878 = boxBitVecFun sz in
        FStar_Pervasives_Native.snd uu____8878 in
      let uu____8887 =
        let uu____8889 = boxBitVecFun sz in
        FStar_Pervasives_Native.fst uu____8889 in
      elim_box true uu____8876 uu____8887 t
let (boxTerm : sort -> term -> term) =
  fun sort1 ->
    fun t ->
      match sort1 with
      | Int_sort -> boxInt t
      | Bool_sort -> boxBool t
      | String_sort -> boxString t
      | BitVec_sort sz -> boxBitVec sz t
      | Sort "Real" -> boxReal t
      | uu____8913 -> FStar_Exn.raise FStar_Util.Impos
let (unboxTerm : sort -> term -> term) =
  fun sort1 ->
    fun t ->
      match sort1 with
      | Int_sort -> unboxInt t
      | Bool_sort -> unboxBool t
      | String_sort -> unboxString t
      | BitVec_sort sz -> unboxBitVec sz t
      | Sort "Real" -> unboxReal t
      | uu____8928 -> FStar_Exn.raise FStar_Util.Impos
let (getBoxedInteger : term -> Prims.int FStar_Pervasives_Native.option) =
  fun t ->
    match t.tm with
    | App (Var s, t2::[]) when s = (FStar_Pervasives_Native.fst boxIntFun) ->
        (match t2.tm with
         | Integer n ->
             let uu____8954 = FStar_Util.int_of_string n in
             FStar_Pervasives_Native.Some uu____8954
         | uu____8957 -> FStar_Pervasives_Native.None)
    | uu____8959 -> FStar_Pervasives_Native.None
let (mk_PreType : term -> term) = fun t -> mkApp ("PreType", [t]) t.rng
let (mk_Valid : term -> term) =
  fun t ->
    match t.tm with
    | App
        (Var "Prims.b2t",
         { tm = App (Var "Prims.op_Equality", uu____8977::t1::t2::[]);
           freevars = uu____8980; rng = uu____8981;_}::[])
        -> mkEq (t1, t2) t.rng
    | App
        (Var "Prims.b2t",
         { tm = App (Var "Prims.op_disEquality", uu____9000::t1::t2::[]);
           freevars = uu____9003; rng = uu____9004;_}::[])
        -> let uu____9023 = mkEq (t1, t2) norng in mkNot uu____9023 t.rng
    | App
        (Var "Prims.b2t",
         { tm = App (Var "Prims.op_LessThanOrEqual", t1::t2::[]);
           freevars = uu____9026; rng = uu____9027;_}::[])
        ->
        let uu____9046 =
          let uu____9051 = unboxInt t1 in
          let uu____9052 = unboxInt t2 in (uu____9051, uu____9052) in
        mkLTE uu____9046 t.rng
    | App
        (Var "Prims.b2t",
         { tm = App (Var "Prims.op_LessThan", t1::t2::[]);
           freevars = uu____9055; rng = uu____9056;_}::[])
        ->
        let uu____9075 =
          let uu____9080 = unboxInt t1 in
          let uu____9081 = unboxInt t2 in (uu____9080, uu____9081) in
        mkLT uu____9075 t.rng
    | App
        (Var "Prims.b2t",
         { tm = App (Var "Prims.op_GreaterThanOrEqual", t1::t2::[]);
           freevars = uu____9084; rng = uu____9085;_}::[])
        ->
        let uu____9104 =
          let uu____9109 = unboxInt t1 in
          let uu____9110 = unboxInt t2 in (uu____9109, uu____9110) in
        mkGTE uu____9104 t.rng
    | App
        (Var "Prims.b2t",
         { tm = App (Var "Prims.op_GreaterThan", t1::t2::[]);
           freevars = uu____9113; rng = uu____9114;_}::[])
        ->
        let uu____9133 =
          let uu____9138 = unboxInt t1 in
          let uu____9139 = unboxInt t2 in (uu____9138, uu____9139) in
        mkGT uu____9133 t.rng
    | App
        (Var "Prims.b2t",
         { tm = App (Var "Prims.op_AmpAmp", t1::t2::[]);
           freevars = uu____9142; rng = uu____9143;_}::[])
        ->
        let uu____9162 =
          let uu____9167 = unboxBool t1 in
          let uu____9168 = unboxBool t2 in (uu____9167, uu____9168) in
        mkAnd uu____9162 t.rng
    | App
        (Var "Prims.b2t",
         { tm = App (Var "Prims.op_BarBar", t1::t2::[]);
           freevars = uu____9171; rng = uu____9172;_}::[])
        ->
        let uu____9191 =
          let uu____9196 = unboxBool t1 in
          let uu____9197 = unboxBool t2 in (uu____9196, uu____9197) in
        mkOr uu____9191 t.rng
    | App
        (Var "Prims.b2t",
         { tm = App (Var "Prims.op_Negation", t1::[]); freevars = uu____9199;
           rng = uu____9200;_}::[])
        -> let uu____9219 = unboxBool t1 in mkNot uu____9219 t1.rng
    | App
        (Var "Prims.b2t",
         { tm = App (Var "FStar.BV.bvult", t0::t1::t2::[]);
           freevars = uu____9223; rng = uu____9224;_}::[])
        when
        let uu____9243 = getBoxedInteger t0 in FStar_Util.is_some uu____9243
        ->
        let sz =
          let uu____9250 = getBoxedInteger t0 in
          match uu____9250 with
          | FStar_Pervasives_Native.Some sz -> sz
          | uu____9258 -> failwith "impossible" in
        let uu____9264 =
          let uu____9269 = unboxBitVec sz t1 in
          let uu____9270 = unboxBitVec sz t2 in (uu____9269, uu____9270) in
        mkBvUlt uu____9264 t.rng
    | App
        (Var "Prims.equals",
         uu____9271::{ tm = App (Var "FStar.BV.bvult", t0::t1::t2::[]);
                       freevars = uu____9275; rng = uu____9276;_}::uu____9277::[])
        when
        let uu____9296 = getBoxedInteger t0 in FStar_Util.is_some uu____9296
        ->
        let sz =
          let uu____9303 = getBoxedInteger t0 in
          match uu____9303 with
          | FStar_Pervasives_Native.Some sz -> sz
          | uu____9311 -> failwith "impossible" in
        let uu____9317 =
          let uu____9322 = unboxBitVec sz t1 in
          let uu____9323 = unboxBitVec sz t2 in (uu____9322, uu____9323) in
        mkBvUlt uu____9317 t.rng
    | App (Var "Prims.b2t", t1::[]) ->
        let uu___1422_9328 = unboxBool t1 in
        {
          tm = (uu___1422_9328.tm);
          freevars = (uu___1422_9328.freevars);
          rng = (t.rng)
        }
    | uu____9329 -> mkApp ("Valid", [t]) t.rng
let (mk_HasType : term -> term -> term) =
  fun v -> fun t -> mkApp ("HasType", [v; t]) t.rng
let (mk_HasTypeZ : term -> term -> term) =
  fun v -> fun t -> mkApp ("HasTypeZ", [v; t]) t.rng
let (mk_IsTotFun : term -> term) = fun t -> mkApp ("IsTotFun", [t]) t.rng
let (mk_IsTyped : term -> term) = fun v -> mkApp ("IsTyped", [v]) norng
let (mk_HasTypeFuel : term -> term -> term -> term) =
  fun f ->
    fun v ->
      fun t ->
        let uu____9400 = FStar_Options.unthrottle_inductives () in
        if uu____9400
        then mk_HasType v t
        else mkApp ("HasTypeFuel", [f; v; t]) t.rng
let (mk_HasTypeWithFuel :
  term FStar_Pervasives_Native.option -> term -> term -> term) =
  fun f ->
    fun v ->
      fun t ->
        match f with
        | FStar_Pervasives_Native.None -> mk_HasType v t
        | FStar_Pervasives_Native.Some f1 -> mk_HasTypeFuel f1 v t
let (mk_NoHoist : term -> term -> term) =
  fun dummy -> fun b -> mkApp ("NoHoist", [dummy; b]) b.rng
let (mk_Destruct : term -> FStar_Range.range -> term) =
  fun v -> mkApp ("Destruct", [v])
let (mk_Rank : term -> FStar_Range.range -> term) =
  fun x -> mkApp ("Rank", [x])
let (mk_tester : Prims.string -> term -> term) =
  fun n -> fun t -> mkApp ((Prims.op_Hat "is-" n), [t]) t.rng
let (mk_ApplyTF : term -> term -> term) =
  fun t -> fun t' -> mkApp ("ApplyTF", [t; t']) t.rng
let (mk_ApplyTT : term -> term -> FStar_Range.range -> term) =
  fun t -> fun t' -> fun r -> mkApp ("ApplyTT", [t; t']) r
let (kick_partial_app : term -> term) =
  fun t ->
    let uu____9533 =
      let uu____9534 = mkApp ("__uu__PartialApp", []) t.rng in
      mk_ApplyTT uu____9534 t t.rng in
    FStar_All.pipe_right uu____9533 mk_Valid
let (mk_String_const : Prims.string -> FStar_Range.range -> term) =
  fun s ->
    fun r ->
      let uu____9552 =
        let uu____9560 = let uu____9563 = mk (String s) r in [uu____9563] in
        ("FString_const", uu____9560) in
      mkApp uu____9552 r
let (mk_Precedes : term -> term -> term -> term -> FStar_Range.range -> term)
  =
  fun x1 ->
    fun x2 ->
      fun x3 ->
        fun x4 ->
          fun r ->
            let uu____9594 = mkApp ("Prims.precedes", [x1; x2; x3; x4]) r in
            FStar_All.pipe_right uu____9594 mk_Valid
let (mk_LexCons : term -> term -> term -> FStar_Range.range -> term) =
  fun x1 -> fun x2 -> fun x3 -> fun r -> mkApp ("LexCons", [x1; x2; x3]) r
let rec (n_fuel : Prims.int -> term) =
  fun n ->
    if n = Prims.int_zero
    then mkApp ("ZFuel", []) norng
    else
      (let uu____9641 =
         let uu____9649 =
           let uu____9652 = n_fuel (n - Prims.int_one) in [uu____9652] in
         ("SFuel", uu____9649) in
       mkApp uu____9641 norng)
let (fuel_2 : term) = n_fuel (Prims.of_int (2))
let (fuel_100 : term) = n_fuel (Prims.of_int (100))
let (mk_and_opt :
  term FStar_Pervasives_Native.option ->
    term FStar_Pervasives_Native.option ->
      FStar_Range.range -> term FStar_Pervasives_Native.option)
  =
  fun p1 ->
    fun p2 ->
      fun r ->
        match (p1, p2) with
        | (FStar_Pervasives_Native.Some p11, FStar_Pervasives_Native.Some
           p21) ->
            let uu____9700 = mkAnd (p11, p21) r in
            FStar_Pervasives_Native.Some uu____9700
        | (FStar_Pervasives_Native.Some p, FStar_Pervasives_Native.None) ->
            FStar_Pervasives_Native.Some p
        | (FStar_Pervasives_Native.None, FStar_Pervasives_Native.Some p) ->
            FStar_Pervasives_Native.Some p
        | (FStar_Pervasives_Native.None, FStar_Pervasives_Native.None) ->
            FStar_Pervasives_Native.None
let (mk_and_opt_l :
  term FStar_Pervasives_Native.option Prims.list ->
    FStar_Range.range -> term FStar_Pervasives_Native.option)
  =
  fun pl ->
    fun r ->
      FStar_List.fold_right (fun p -> fun out -> mk_and_opt p out r) pl
        FStar_Pervasives_Native.None
let (mk_and_l : term Prims.list -> FStar_Range.range -> term) =
  fun l ->
    fun r ->
      let uu____9763 = mkTrue r in
      FStar_List.fold_right (fun p1 -> fun p2 -> mkAnd (p1, p2) r) l
        uu____9763
let (mk_or_l : term Prims.list -> FStar_Range.range -> term) =
  fun l ->
    fun r ->
      let uu____9783 = mkFalse r in
      FStar_List.fold_right (fun p1 -> fun p2 -> mkOr (p1, p2) r) l
        uu____9783
let (mk_haseq : term -> term) =
  fun t ->
    let uu____9794 = mkApp ("Prims.hasEq", [t]) t.rng in mk_Valid uu____9794
let (dummy_sort : sort) = Sort "Dummy_sort"