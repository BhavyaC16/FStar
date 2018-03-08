open Prims
let add_fuel :
  'Auu____4 . 'Auu____4 -> 'Auu____4 Prims.list -> 'Auu____4 Prims.list =
  fun x  ->
    fun tl1  ->
      let uu____19 = FStar_Options.unthrottle_inductives ()  in
      if uu____19 then tl1 else x :: tl1
  
let withenv :
  'Auu____28 'Auu____29 'Auu____30 .
    'Auu____28 ->
      ('Auu____29,'Auu____30) FStar_Pervasives_Native.tuple2 ->
        ('Auu____29,'Auu____30,'Auu____28) FStar_Pervasives_Native.tuple3
  = fun c  -> fun uu____48  -> match uu____48 with | (a,b) -> (a, b, c) 
let vargs :
  'Auu____59 'Auu____60 'Auu____61 .
    (('Auu____59,'Auu____60) FStar_Util.either,'Auu____61)
      FStar_Pervasives_Native.tuple2 Prims.list ->
      (('Auu____59,'Auu____60) FStar_Util.either,'Auu____61)
        FStar_Pervasives_Native.tuple2 Prims.list
  =
  fun args  ->
    FStar_List.filter
      (fun uu___79_107  ->
         match uu___79_107 with
         | (FStar_Util.Inl uu____116,uu____117) -> false
         | uu____122 -> true) args
  
let (escape : Prims.string -> Prims.string) =
  fun s  -> FStar_Util.replace_char s 39 95 
let (mk_term_projector_name :
  FStar_Ident.lident -> FStar_Syntax_Syntax.bv -> Prims.string) =
  fun lid  ->
    fun a  ->
      let a1 =
        let uu___102_143 = a  in
        let uu____144 =
          FStar_Syntax_Util.unmangle_field_name a.FStar_Syntax_Syntax.ppname
           in
        {
          FStar_Syntax_Syntax.ppname = uu____144;
          FStar_Syntax_Syntax.index =
            (uu___102_143.FStar_Syntax_Syntax.index);
          FStar_Syntax_Syntax.sort = (uu___102_143.FStar_Syntax_Syntax.sort)
        }  in
      let uu____145 =
        FStar_Util.format2 "%s_%s" lid.FStar_Ident.str
          (a1.FStar_Syntax_Syntax.ppname).FStar_Ident.idText
         in
      FStar_All.pipe_left escape uu____145
  
let (primitive_projector_by_pos :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident -> Prims.int -> Prims.string)
  =
  fun env  ->
    fun lid  ->
      fun i  ->
        let fail uu____158 =
          let uu____159 =
            FStar_Util.format2
              "Projector %s on data constructor %s not found"
              (Prims.string_of_int i) lid.FStar_Ident.str
             in
          failwith uu____159  in
        let uu____160 = FStar_TypeChecker_Env.lookup_datacon env lid  in
        match uu____160 with
        | (uu____165,t) ->
            let uu____167 =
              let uu____168 = FStar_Syntax_Subst.compress t  in
              uu____168.FStar_Syntax_Syntax.n  in
            (match uu____167 with
             | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
                 let uu____189 = FStar_Syntax_Subst.open_comp bs c  in
                 (match uu____189 with
                  | (binders,uu____195) ->
                      if
                        (i < (Prims.parse_int "0")) ||
                          (i >= (FStar_List.length binders))
                      then fail ()
                      else
                        (let b = FStar_List.nth binders i  in
                         mk_term_projector_name lid
                           (FStar_Pervasives_Native.fst b)))
             | uu____210 -> fail ())
  
let (mk_term_projector_name_by_pos :
  FStar_Ident.lident -> Prims.int -> Prims.string) =
  fun lid  ->
    fun i  ->
      let uu____217 =
        FStar_Util.format2 "%s_%s" lid.FStar_Ident.str
          (Prims.string_of_int i)
         in
      FStar_All.pipe_left escape uu____217
  
let (mk_term_projector :
  FStar_Ident.lident -> FStar_Syntax_Syntax.bv -> FStar_SMTEncoding_Term.term)
  =
  fun lid  ->
    fun a  ->
      let uu____224 =
        let uu____229 = mk_term_projector_name lid a  in
        (uu____229,
          (FStar_SMTEncoding_Term.Arrow
             (FStar_SMTEncoding_Term.Term_sort,
               FStar_SMTEncoding_Term.Term_sort)))
         in
      FStar_SMTEncoding_Util.mkFreeV uu____224
  
let (mk_term_projector_by_pos :
  FStar_Ident.lident -> Prims.int -> FStar_SMTEncoding_Term.term) =
  fun lid  ->
    fun i  ->
      let uu____236 =
        let uu____241 = mk_term_projector_name_by_pos lid i  in
        (uu____241,
          (FStar_SMTEncoding_Term.Arrow
             (FStar_SMTEncoding_Term.Term_sort,
               FStar_SMTEncoding_Term.Term_sort)))
         in
      FStar_SMTEncoding_Util.mkFreeV uu____236
  
let mk_data_tester :
  'Auu____246 .
    'Auu____246 ->
      FStar_Ident.lident ->
        FStar_SMTEncoding_Term.term -> FStar_SMTEncoding_Term.term
  =
  fun env  ->
    fun l  ->
      fun x  -> FStar_SMTEncoding_Term.mk_tester (escape l.FStar_Ident.str) x
  
type varops_t =
  {
  push: Prims.unit -> Prims.unit ;
  pop: Prims.unit -> Prims.unit ;
  new_var: FStar_Ident.ident -> Prims.int -> Prims.string ;
  new_fvar: FStar_Ident.lident -> Prims.string ;
  fresh: Prims.string -> Prims.string ;
  string_const: Prims.string -> FStar_SMTEncoding_Term.term ;
  next_id: Prims.unit -> Prims.int ;
  mk_unique: Prims.string -> Prims.string }[@@deriving show]
let (__proj__Mkvarops_t__item__push : varops_t -> Prims.unit -> Prims.unit) =
  fun projectee  ->
    match projectee with
    | { push = __fname__push; pop = __fname__pop; new_var = __fname__new_var;
        new_fvar = __fname__new_fvar; fresh = __fname__fresh;
        string_const = __fname__string_const; next_id = __fname__next_id;
        mk_unique = __fname__mk_unique;_} -> __fname__push
  
let (__proj__Mkvarops_t__item__pop : varops_t -> Prims.unit -> Prims.unit) =
  fun projectee  ->
    match projectee with
    | { push = __fname__push; pop = __fname__pop; new_var = __fname__new_var;
        new_fvar = __fname__new_fvar; fresh = __fname__fresh;
        string_const = __fname__string_const; next_id = __fname__next_id;
        mk_unique = __fname__mk_unique;_} -> __fname__pop
  
let (__proj__Mkvarops_t__item__new_var :
  varops_t -> FStar_Ident.ident -> Prims.int -> Prims.string) =
  fun projectee  ->
    match projectee with
    | { push = __fname__push; pop = __fname__pop; new_var = __fname__new_var;
        new_fvar = __fname__new_fvar; fresh = __fname__fresh;
        string_const = __fname__string_const; next_id = __fname__next_id;
        mk_unique = __fname__mk_unique;_} -> __fname__new_var
  
let (__proj__Mkvarops_t__item__new_fvar :
  varops_t -> FStar_Ident.lident -> Prims.string) =
  fun projectee  ->
    match projectee with
    | { push = __fname__push; pop = __fname__pop; new_var = __fname__new_var;
        new_fvar = __fname__new_fvar; fresh = __fname__fresh;
        string_const = __fname__string_const; next_id = __fname__next_id;
        mk_unique = __fname__mk_unique;_} -> __fname__new_fvar
  
let (__proj__Mkvarops_t__item__fresh :
  varops_t -> Prims.string -> Prims.string) =
  fun projectee  ->
    match projectee with
    | { push = __fname__push; pop = __fname__pop; new_var = __fname__new_var;
        new_fvar = __fname__new_fvar; fresh = __fname__fresh;
        string_const = __fname__string_const; next_id = __fname__next_id;
        mk_unique = __fname__mk_unique;_} -> __fname__fresh
  
let (__proj__Mkvarops_t__item__string_const :
  varops_t -> Prims.string -> FStar_SMTEncoding_Term.term) =
  fun projectee  ->
    match projectee with
    | { push = __fname__push; pop = __fname__pop; new_var = __fname__new_var;
        new_fvar = __fname__new_fvar; fresh = __fname__fresh;
        string_const = __fname__string_const; next_id = __fname__next_id;
        mk_unique = __fname__mk_unique;_} -> __fname__string_const
  
let (__proj__Mkvarops_t__item__next_id : varops_t -> Prims.unit -> Prims.int)
  =
  fun projectee  ->
    match projectee with
    | { push = __fname__push; pop = __fname__pop; new_var = __fname__new_var;
        new_fvar = __fname__new_fvar; fresh = __fname__fresh;
        string_const = __fname__string_const; next_id = __fname__next_id;
        mk_unique = __fname__mk_unique;_} -> __fname__next_id
  
let (__proj__Mkvarops_t__item__mk_unique :
  varops_t -> Prims.string -> Prims.string) =
  fun projectee  ->
    match projectee with
    | { push = __fname__push; pop = __fname__pop; new_var = __fname__new_var;
        new_fvar = __fname__new_fvar; fresh = __fname__fresh;
        string_const = __fname__string_const; next_id = __fname__next_id;
        mk_unique = __fname__mk_unique;_} -> __fname__mk_unique
  
let (varops : varops_t) =
  let initial_ctr = (Prims.parse_int "100")  in
  let ctr = FStar_Util.mk_ref initial_ctr  in
  let new_scope uu____610 =
    let uu____611 = FStar_Util.smap_create (Prims.parse_int "100")  in
    let uu____614 = FStar_Util.smap_create (Prims.parse_int "100")  in
    (uu____611, uu____614)  in
  let scopes =
    let uu____634 = let uu____645 = new_scope ()  in [uu____645]  in
    FStar_Util.mk_ref uu____634  in
  let mk_unique y =
    let y1 = escape y  in
    let y2 =
      let uu____686 =
        let uu____689 = FStar_ST.op_Bang scopes  in
        FStar_Util.find_map uu____689
          (fun uu____772  ->
             match uu____772 with
             | (names1,uu____784) -> FStar_Util.smap_try_find names1 y1)
         in
      match uu____686 with
      | FStar_Pervasives_Native.None  -> y1
      | FStar_Pervasives_Native.Some uu____793 ->
          (FStar_Util.incr ctr;
           (let uu____828 =
              let uu____829 =
                let uu____830 = FStar_ST.op_Bang ctr  in
                Prims.string_of_int uu____830  in
              Prims.strcat "__" uu____829  in
            Prims.strcat y1 uu____828))
       in
    let top_scope =
      let uu____875 =
        let uu____884 = FStar_ST.op_Bang scopes  in FStar_List.hd uu____884
         in
      FStar_All.pipe_left FStar_Pervasives_Native.fst uu____875  in
    FStar_Util.smap_add top_scope y2 true; y2  in
  let new_var pp rn =
    FStar_All.pipe_left mk_unique
      (Prims.strcat pp.FStar_Ident.idText
         (Prims.strcat "__" (Prims.string_of_int rn)))
     in
  let new_fvar lid = mk_unique lid.FStar_Ident.str  in
  let next_id1 uu____993 = FStar_Util.incr ctr; FStar_ST.op_Bang ctr  in
  let fresh1 pfx =
    let uu____1073 =
      let uu____1074 = next_id1 ()  in
      FStar_All.pipe_left Prims.string_of_int uu____1074  in
    FStar_Util.format2 "%s_%s" pfx uu____1073  in
  let string_const s =
    let uu____1079 =
      let uu____1082 = FStar_ST.op_Bang scopes  in
      FStar_Util.find_map uu____1082
        (fun uu____1165  ->
           match uu____1165 with
           | (uu____1176,strings) -> FStar_Util.smap_try_find strings s)
       in
    match uu____1079 with
    | FStar_Pervasives_Native.Some f -> f
    | FStar_Pervasives_Native.None  ->
        let id1 = next_id1 ()  in
        let f =
          let uu____1189 = FStar_SMTEncoding_Util.mk_String_const id1  in
          FStar_All.pipe_left FStar_SMTEncoding_Term.boxString uu____1189  in
        let top_scope =
          let uu____1193 =
            let uu____1202 = FStar_ST.op_Bang scopes  in
            FStar_List.hd uu____1202  in
          FStar_All.pipe_left FStar_Pervasives_Native.snd uu____1193  in
        (FStar_Util.smap_add top_scope s f; f)
     in
  let push1 uu____1300 =
    let uu____1301 =
      let uu____1312 = new_scope ()  in
      let uu____1321 = FStar_ST.op_Bang scopes  in uu____1312 :: uu____1321
       in
    FStar_ST.op_Colon_Equals scopes uu____1301  in
  let pop1 uu____1465 =
    let uu____1466 =
      let uu____1477 = FStar_ST.op_Bang scopes  in FStar_List.tl uu____1477
       in
    FStar_ST.op_Colon_Equals scopes uu____1466  in
  {
    push = push1;
    pop = pop1;
    new_var;
    new_fvar;
    fresh = fresh1;
    string_const;
    next_id = next_id1;
    mk_unique
  } 
let (unmangle : FStar_Syntax_Syntax.bv -> FStar_Syntax_Syntax.bv) =
  fun x  ->
    let uu___103_1621 = x  in
    let uu____1622 =
      FStar_Syntax_Util.unmangle_field_name x.FStar_Syntax_Syntax.ppname  in
    {
      FStar_Syntax_Syntax.ppname = uu____1622;
      FStar_Syntax_Syntax.index = (uu___103_1621.FStar_Syntax_Syntax.index);
      FStar_Syntax_Syntax.sort = (uu___103_1621.FStar_Syntax_Syntax.sort)
    }
  
type fvar_binding =
  {
  fvar_lid: FStar_Ident.lident ;
  smt_arity: Prims.int ;
  smt_id: Prims.string ;
  smt_token: FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option ;
  smt_fuel_partial_app:
    FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option }[@@deriving
                                                                  show]
let (__proj__Mkfvar_binding__item__fvar_lid :
  fvar_binding -> FStar_Ident.lident) =
  fun projectee  ->
    match projectee with
    | { fvar_lid = __fname__fvar_lid; smt_arity = __fname__smt_arity;
        smt_id = __fname__smt_id; smt_token = __fname__smt_token;
        smt_fuel_partial_app = __fname__smt_fuel_partial_app;_} ->
        __fname__fvar_lid
  
let (__proj__Mkfvar_binding__item__smt_arity : fvar_binding -> Prims.int) =
  fun projectee  ->
    match projectee with
    | { fvar_lid = __fname__fvar_lid; smt_arity = __fname__smt_arity;
        smt_id = __fname__smt_id; smt_token = __fname__smt_token;
        smt_fuel_partial_app = __fname__smt_fuel_partial_app;_} ->
        __fname__smt_arity
  
let (__proj__Mkfvar_binding__item__smt_id : fvar_binding -> Prims.string) =
  fun projectee  ->
    match projectee with
    | { fvar_lid = __fname__fvar_lid; smt_arity = __fname__smt_arity;
        smt_id = __fname__smt_id; smt_token = __fname__smt_token;
        smt_fuel_partial_app = __fname__smt_fuel_partial_app;_} ->
        __fname__smt_id
  
let (__proj__Mkfvar_binding__item__smt_token :
  fvar_binding -> FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option)
  =
  fun projectee  ->
    match projectee with
    | { fvar_lid = __fname__fvar_lid; smt_arity = __fname__smt_arity;
        smt_id = __fname__smt_id; smt_token = __fname__smt_token;
        smt_fuel_partial_app = __fname__smt_fuel_partial_app;_} ->
        __fname__smt_token
  
let (__proj__Mkfvar_binding__item__smt_fuel_partial_app :
  fvar_binding -> FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option)
  =
  fun projectee  ->
    match projectee with
    | { fvar_lid = __fname__fvar_lid; smt_arity = __fname__smt_arity;
        smt_id = __fname__smt_id; smt_token = __fname__smt_token;
        smt_fuel_partial_app = __fname__smt_fuel_partial_app;_} ->
        __fname__smt_fuel_partial_app
  
type binding =
  | Binding_var of (FStar_Syntax_Syntax.bv,FStar_SMTEncoding_Term.term)
  FStar_Pervasives_Native.tuple2 
  | Binding_fvar of fvar_binding [@@deriving show]
let (uu___is_Binding_var : binding -> Prims.bool) =
  fun projectee  ->
    match projectee with | Binding_var _0 -> true | uu____1735 -> false
  
let (__proj__Binding_var__item___0 :
  binding ->
    (FStar_Syntax_Syntax.bv,FStar_SMTEncoding_Term.term)
      FStar_Pervasives_Native.tuple2)
  = fun projectee  -> match projectee with | Binding_var _0 -> _0 
let (uu___is_Binding_fvar : binding -> Prims.bool) =
  fun projectee  ->
    match projectee with | Binding_fvar _0 -> true | uu____1759 -> false
  
let (__proj__Binding_fvar__item___0 : binding -> fvar_binding) =
  fun projectee  -> match projectee with | Binding_fvar _0 -> _0 
let binder_of_eithervar :
  'Auu____1770 'Auu____1771 .
    'Auu____1770 ->
      ('Auu____1770,'Auu____1771 FStar_Pervasives_Native.option)
        FStar_Pervasives_Native.tuple2
  = fun v1  -> (v1, FStar_Pervasives_Native.None) 
type cache_entry =
  {
  cache_symbol_name: Prims.string ;
  cache_symbol_arg_sorts: FStar_SMTEncoding_Term.sort Prims.list ;
  cache_symbol_decls: FStar_SMTEncoding_Term.decl Prims.list ;
  cache_symbol_assumption_names: Prims.string Prims.list }[@@deriving show]
let (__proj__Mkcache_entry__item__cache_symbol_name :
  cache_entry -> Prims.string) =
  fun projectee  ->
    match projectee with
    | { cache_symbol_name = __fname__cache_symbol_name;
        cache_symbol_arg_sorts = __fname__cache_symbol_arg_sorts;
        cache_symbol_decls = __fname__cache_symbol_decls;
        cache_symbol_assumption_names =
          __fname__cache_symbol_assumption_names;_}
        -> __fname__cache_symbol_name
  
let (__proj__Mkcache_entry__item__cache_symbol_arg_sorts :
  cache_entry -> FStar_SMTEncoding_Term.sort Prims.list) =
  fun projectee  ->
    match projectee with
    | { cache_symbol_name = __fname__cache_symbol_name;
        cache_symbol_arg_sorts = __fname__cache_symbol_arg_sorts;
        cache_symbol_decls = __fname__cache_symbol_decls;
        cache_symbol_assumption_names =
          __fname__cache_symbol_assumption_names;_}
        -> __fname__cache_symbol_arg_sorts
  
let (__proj__Mkcache_entry__item__cache_symbol_decls :
  cache_entry -> FStar_SMTEncoding_Term.decl Prims.list) =
  fun projectee  ->
    match projectee with
    | { cache_symbol_name = __fname__cache_symbol_name;
        cache_symbol_arg_sorts = __fname__cache_symbol_arg_sorts;
        cache_symbol_decls = __fname__cache_symbol_decls;
        cache_symbol_assumption_names =
          __fname__cache_symbol_assumption_names;_}
        -> __fname__cache_symbol_decls
  
let (__proj__Mkcache_entry__item__cache_symbol_assumption_names :
  cache_entry -> Prims.string Prims.list) =
  fun projectee  ->
    match projectee with
    | { cache_symbol_name = __fname__cache_symbol_name;
        cache_symbol_arg_sorts = __fname__cache_symbol_arg_sorts;
        cache_symbol_decls = __fname__cache_symbol_decls;
        cache_symbol_assumption_names =
          __fname__cache_symbol_assumption_names;_}
        -> __fname__cache_symbol_assumption_names
  
type env_t =
  {
  bindings: binding Prims.list ;
  depth: Prims.int ;
  tcenv: FStar_TypeChecker_Env.env ;
  warn: Prims.bool ;
  cache: cache_entry FStar_Util.smap ;
  nolabels: Prims.bool ;
  use_zfuel_name: Prims.bool ;
  encode_non_total_function_typ: Prims.bool ;
  current_module_name: Prims.string }[@@deriving show]
let (__proj__Mkenv_t__item__bindings : env_t -> binding Prims.list) =
  fun projectee  ->
    match projectee with
    | { bindings = __fname__bindings; depth = __fname__depth;
        tcenv = __fname__tcenv; warn = __fname__warn; cache = __fname__cache;
        nolabels = __fname__nolabels;
        use_zfuel_name = __fname__use_zfuel_name;
        encode_non_total_function_typ =
          __fname__encode_non_total_function_typ;
        current_module_name = __fname__current_module_name;_} ->
        __fname__bindings
  
let (__proj__Mkenv_t__item__depth : env_t -> Prims.int) =
  fun projectee  ->
    match projectee with
    | { bindings = __fname__bindings; depth = __fname__depth;
        tcenv = __fname__tcenv; warn = __fname__warn; cache = __fname__cache;
        nolabels = __fname__nolabels;
        use_zfuel_name = __fname__use_zfuel_name;
        encode_non_total_function_typ =
          __fname__encode_non_total_function_typ;
        current_module_name = __fname__current_module_name;_} ->
        __fname__depth
  
let (__proj__Mkenv_t__item__tcenv : env_t -> FStar_TypeChecker_Env.env) =
  fun projectee  ->
    match projectee with
    | { bindings = __fname__bindings; depth = __fname__depth;
        tcenv = __fname__tcenv; warn = __fname__warn; cache = __fname__cache;
        nolabels = __fname__nolabels;
        use_zfuel_name = __fname__use_zfuel_name;
        encode_non_total_function_typ =
          __fname__encode_non_total_function_typ;
        current_module_name = __fname__current_module_name;_} ->
        __fname__tcenv
  
let (__proj__Mkenv_t__item__warn : env_t -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { bindings = __fname__bindings; depth = __fname__depth;
        tcenv = __fname__tcenv; warn = __fname__warn; cache = __fname__cache;
        nolabels = __fname__nolabels;
        use_zfuel_name = __fname__use_zfuel_name;
        encode_non_total_function_typ =
          __fname__encode_non_total_function_typ;
        current_module_name = __fname__current_module_name;_} ->
        __fname__warn
  
let (__proj__Mkenv_t__item__cache : env_t -> cache_entry FStar_Util.smap) =
  fun projectee  ->
    match projectee with
    | { bindings = __fname__bindings; depth = __fname__depth;
        tcenv = __fname__tcenv; warn = __fname__warn; cache = __fname__cache;
        nolabels = __fname__nolabels;
        use_zfuel_name = __fname__use_zfuel_name;
        encode_non_total_function_typ =
          __fname__encode_non_total_function_typ;
        current_module_name = __fname__current_module_name;_} ->
        __fname__cache
  
let (__proj__Mkenv_t__item__nolabels : env_t -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { bindings = __fname__bindings; depth = __fname__depth;
        tcenv = __fname__tcenv; warn = __fname__warn; cache = __fname__cache;
        nolabels = __fname__nolabels;
        use_zfuel_name = __fname__use_zfuel_name;
        encode_non_total_function_typ =
          __fname__encode_non_total_function_typ;
        current_module_name = __fname__current_module_name;_} ->
        __fname__nolabels
  
let (__proj__Mkenv_t__item__use_zfuel_name : env_t -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { bindings = __fname__bindings; depth = __fname__depth;
        tcenv = __fname__tcenv; warn = __fname__warn; cache = __fname__cache;
        nolabels = __fname__nolabels;
        use_zfuel_name = __fname__use_zfuel_name;
        encode_non_total_function_typ =
          __fname__encode_non_total_function_typ;
        current_module_name = __fname__current_module_name;_} ->
        __fname__use_zfuel_name
  
let (__proj__Mkenv_t__item__encode_non_total_function_typ :
  env_t -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { bindings = __fname__bindings; depth = __fname__depth;
        tcenv = __fname__tcenv; warn = __fname__warn; cache = __fname__cache;
        nolabels = __fname__nolabels;
        use_zfuel_name = __fname__use_zfuel_name;
        encode_non_total_function_typ =
          __fname__encode_non_total_function_typ;
        current_module_name = __fname__current_module_name;_} ->
        __fname__encode_non_total_function_typ
  
let (__proj__Mkenv_t__item__current_module_name : env_t -> Prims.string) =
  fun projectee  ->
    match projectee with
    | { bindings = __fname__bindings; depth = __fname__depth;
        tcenv = __fname__tcenv; warn = __fname__warn; cache = __fname__cache;
        nolabels = __fname__nolabels;
        use_zfuel_name = __fname__use_zfuel_name;
        encode_non_total_function_typ =
          __fname__encode_non_total_function_typ;
        current_module_name = __fname__current_module_name;_} ->
        __fname__current_module_name
  
let mk_cache_entry :
  'Auu____2067 .
    'Auu____2067 ->
      Prims.string ->
        FStar_SMTEncoding_Term.sort Prims.list ->
          FStar_SMTEncoding_Term.decl Prims.list -> cache_entry
  =
  fun env  ->
    fun tsym  ->
      fun cvar_sorts  ->
        fun t_decls  ->
          let names1 =
            FStar_All.pipe_right t_decls
              (FStar_List.collect
                 (fun uu___80_2101  ->
                    match uu___80_2101 with
                    | FStar_SMTEncoding_Term.Assume a ->
                        [a.FStar_SMTEncoding_Term.assumption_name]
                    | uu____2105 -> []))
             in
          {
            cache_symbol_name = tsym;
            cache_symbol_arg_sorts = cvar_sorts;
            cache_symbol_decls = t_decls;
            cache_symbol_assumption_names = names1
          }
  
let (use_cache_entry : cache_entry -> FStar_SMTEncoding_Term.decl Prims.list)
  =
  fun ce  ->
    [FStar_SMTEncoding_Term.RetainAssumptions
       (ce.cache_symbol_assumption_names)]
  
let (print_env : env_t -> Prims.string) =
  fun e  ->
    let uu____2114 =
      FStar_All.pipe_right e.bindings
        (FStar_List.map
           (fun uu___81_2124  ->
              match uu___81_2124 with
              | Binding_var (x,uu____2126) ->
                  FStar_Syntax_Print.bv_to_string x
              | Binding_fvar fvb ->
                  FStar_Syntax_Print.lid_to_string fvb.fvar_lid))
       in
    FStar_All.pipe_right uu____2114 (FStar_String.concat ", ")
  
let lookup_binding :
  'Auu____2133 .
    env_t ->
      (binding -> 'Auu____2133 FStar_Pervasives_Native.option) ->
        'Auu____2133 FStar_Pervasives_Native.option
  = fun env  -> fun f  -> FStar_Util.find_map env.bindings f 
let (caption_t :
  env_t ->
    FStar_Syntax_Syntax.term -> Prims.string FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun t  ->
      let uu____2161 =
        FStar_TypeChecker_Env.debug env.tcenv FStar_Options.Low  in
      if uu____2161
      then
        let uu____2164 = FStar_Syntax_Print.term_to_string t  in
        FStar_Pervasives_Native.Some uu____2164
      else FStar_Pervasives_Native.None
  
let (fresh_fvar :
  Prims.string ->
    FStar_SMTEncoding_Term.sort ->
      (Prims.string,FStar_SMTEncoding_Term.term)
        FStar_Pervasives_Native.tuple2)
  =
  fun x  ->
    fun s  ->
      let xsym = varops.fresh x  in
      let uu____2177 = FStar_SMTEncoding_Util.mkFreeV (xsym, s)  in
      (xsym, uu____2177)
  
let (gen_term_var :
  env_t ->
    FStar_Syntax_Syntax.bv ->
      (Prims.string,FStar_SMTEncoding_Term.term,env_t)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun x  ->
      let ysym = Prims.strcat "@x" (Prims.string_of_int env.depth)  in
      let y =
        FStar_SMTEncoding_Util.mkFreeV
          (ysym, FStar_SMTEncoding_Term.Term_sort)
         in
      (ysym, y,
        (let uu___104_2193 = env  in
         {
           bindings = ((Binding_var (x, y)) :: (env.bindings));
           depth = (env.depth + (Prims.parse_int "1"));
           tcenv = (uu___104_2193.tcenv);
           warn = (uu___104_2193.warn);
           cache = (uu___104_2193.cache);
           nolabels = (uu___104_2193.nolabels);
           use_zfuel_name = (uu___104_2193.use_zfuel_name);
           encode_non_total_function_typ =
             (uu___104_2193.encode_non_total_function_typ);
           current_module_name = (uu___104_2193.current_module_name)
         }))
  
let (new_term_constant :
  env_t ->
    FStar_Syntax_Syntax.bv ->
      (Prims.string,FStar_SMTEncoding_Term.term,env_t)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun x  ->
      let ysym =
        varops.new_var x.FStar_Syntax_Syntax.ppname
          x.FStar_Syntax_Syntax.index
         in
      let y = FStar_SMTEncoding_Util.mkApp (ysym, [])  in
      (ysym, y,
        (let uu___105_2211 = env  in
         {
           bindings = ((Binding_var (x, y)) :: (env.bindings));
           depth = (uu___105_2211.depth);
           tcenv = (uu___105_2211.tcenv);
           warn = (uu___105_2211.warn);
           cache = (uu___105_2211.cache);
           nolabels = (uu___105_2211.nolabels);
           use_zfuel_name = (uu___105_2211.use_zfuel_name);
           encode_non_total_function_typ =
             (uu___105_2211.encode_non_total_function_typ);
           current_module_name = (uu___105_2211.current_module_name)
         }))
  
let (new_term_constant_from_string :
  env_t ->
    FStar_Syntax_Syntax.bv ->
      Prims.string ->
        (Prims.string,FStar_SMTEncoding_Term.term,env_t)
          FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun x  ->
      fun str  ->
        let ysym = varops.mk_unique str  in
        let y = FStar_SMTEncoding_Util.mkApp (ysym, [])  in
        (ysym, y,
          (let uu___106_2232 = env  in
           {
             bindings = ((Binding_var (x, y)) :: (env.bindings));
             depth = (uu___106_2232.depth);
             tcenv = (uu___106_2232.tcenv);
             warn = (uu___106_2232.warn);
             cache = (uu___106_2232.cache);
             nolabels = (uu___106_2232.nolabels);
             use_zfuel_name = (uu___106_2232.use_zfuel_name);
             encode_non_total_function_typ =
               (uu___106_2232.encode_non_total_function_typ);
             current_module_name = (uu___106_2232.current_module_name)
           }))
  
let (push_term_var :
  env_t -> FStar_Syntax_Syntax.bv -> FStar_SMTEncoding_Term.term -> env_t) =
  fun env  ->
    fun x  ->
      fun t  ->
        let uu___107_2242 = env  in
        {
          bindings = ((Binding_var (x, t)) :: (env.bindings));
          depth = (uu___107_2242.depth);
          tcenv = (uu___107_2242.tcenv);
          warn = (uu___107_2242.warn);
          cache = (uu___107_2242.cache);
          nolabels = (uu___107_2242.nolabels);
          use_zfuel_name = (uu___107_2242.use_zfuel_name);
          encode_non_total_function_typ =
            (uu___107_2242.encode_non_total_function_typ);
          current_module_name = (uu___107_2242.current_module_name)
        }
  
let (lookup_term_var :
  env_t -> FStar_Syntax_Syntax.bv -> FStar_SMTEncoding_Term.term) =
  fun env  ->
    fun a  ->
      let aux a' =
        lookup_binding env
          (fun uu___82_2266  ->
             match uu___82_2266 with
             | Binding_var (b,t) when FStar_Syntax_Syntax.bv_eq b a' ->
                 FStar_Pervasives_Native.Some (b, t)
             | uu____2279 -> FStar_Pervasives_Native.None)
         in
      let uu____2284 = aux a  in
      match uu____2284 with
      | FStar_Pervasives_Native.None  ->
          let a2 = unmangle a  in
          let uu____2296 = aux a2  in
          (match uu____2296 with
           | FStar_Pervasives_Native.None  ->
               let uu____2307 =
                 let uu____2308 = FStar_Syntax_Print.bv_to_string a2  in
                 let uu____2309 = print_env env  in
                 FStar_Util.format2
                   "Bound term variable not found (after unmangling): %s in environment: %s"
                   uu____2308 uu____2309
                  in
               failwith uu____2307
           | FStar_Pervasives_Native.Some (b,t) -> t)
      | FStar_Pervasives_Native.Some (b,t) -> t
  
let (mk_fvb :
  FStar_Ident.lident ->
    Prims.string ->
      Prims.int ->
        FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option ->
          FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option ->
            fvar_binding)
  =
  fun lid  ->
    fun fname  ->
      fun arity  ->
        fun ftok  ->
          fun fuel_partial_app  ->
            {
              fvar_lid = lid;
              smt_arity = arity;
              smt_id = fname;
              smt_token = ftok;
              smt_fuel_partial_app = fuel_partial_app
            }
  
let (new_term_constant_and_tok_from_lid :
  env_t ->
    FStar_Ident.lident ->
      Prims.int ->
        (Prims.string,Prims.string,env_t) FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun x  ->
      fun arity  ->
        let fname = varops.new_fvar x  in
        let ftok_name = Prims.strcat fname "@tok"  in
        let ftok = FStar_SMTEncoding_Util.mkApp (ftok_name, [])  in
        let fvb =
          mk_fvb x fname arity (FStar_Pervasives_Native.Some ftok)
            FStar_Pervasives_Native.None
           in
        (fname, ftok_name,
          (let uu___108_2367 = env  in
           {
             bindings = ((Binding_fvar fvb) :: (env.bindings));
             depth = (uu___108_2367.depth);
             tcenv = (uu___108_2367.tcenv);
             warn = (uu___108_2367.warn);
             cache = (uu___108_2367.cache);
             nolabels = (uu___108_2367.nolabels);
             use_zfuel_name = (uu___108_2367.use_zfuel_name);
             encode_non_total_function_typ =
               (uu___108_2367.encode_non_total_function_typ);
             current_module_name = (uu___108_2367.current_module_name)
           }))
  
let (try_lookup_lid :
  env_t -> FStar_Ident.lident -> fvar_binding FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun a  ->
      lookup_binding env
        (fun uu___83_2378  ->
           match uu___83_2378 with
           | Binding_fvar fvb when FStar_Ident.lid_equals fvb.fvar_lid a ->
               FStar_Pervasives_Native.Some fvb
           | uu____2382 -> FStar_Pervasives_Native.None)
  
let (contains_name : env_t -> Prims.string -> Prims.bool) =
  fun env  ->
    fun s  ->
      let uu____2389 =
        lookup_binding env
          (fun uu___84_2394  ->
             match uu___84_2394 with
             | Binding_fvar fvb when (fvb.fvar_lid).FStar_Ident.str = s ->
                 FStar_Pervasives_Native.Some ()
             | uu____2398 -> FStar_Pervasives_Native.None)
         in
      FStar_All.pipe_right uu____2389 FStar_Option.isSome
  
let (lookup_lid : env_t -> FStar_Ident.lident -> fvar_binding) =
  fun env  ->
    fun a  ->
      let uu____2407 = try_lookup_lid env a  in
      match uu____2407 with
      | FStar_Pervasives_Native.None  ->
          let uu____2410 =
            let uu____2411 = FStar_Syntax_Print.lid_to_string a  in
            FStar_Util.format1 "Name not found: %s" uu____2411  in
          failwith uu____2410
      | FStar_Pervasives_Native.Some s -> s
  
let (push_free_var :
  env_t ->
    FStar_Ident.lident ->
      Prims.int ->
        Prims.string ->
          FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option -> env_t)
  =
  fun env  ->
    fun x  ->
      fun arity  ->
        fun fname  ->
          fun ftok  ->
            let fvb = mk_fvb x fname arity ftok FStar_Pervasives_Native.None
               in
            let uu___109_2433 = env  in
            {
              bindings = ((Binding_fvar fvb) :: (env.bindings));
              depth = (uu___109_2433.depth);
              tcenv = (uu___109_2433.tcenv);
              warn = (uu___109_2433.warn);
              cache = (uu___109_2433.cache);
              nolabels = (uu___109_2433.nolabels);
              use_zfuel_name = (uu___109_2433.use_zfuel_name);
              encode_non_total_function_typ =
                (uu___109_2433.encode_non_total_function_typ);
              current_module_name = (uu___109_2433.current_module_name)
            }
  
let (push_zfuel_name : env_t -> FStar_Ident.lident -> Prims.string -> env_t)
  =
  fun env  ->
    fun x  ->
      fun f  ->
        let fvb = lookup_lid env x  in
        let t3 =
          let uu____2445 =
            let uu____2452 =
              let uu____2455 = FStar_SMTEncoding_Util.mkApp ("ZFuel", [])  in
              [uu____2455]  in
            (f, uu____2452)  in
          FStar_SMTEncoding_Util.mkApp uu____2445  in
        let fvb1 =
          mk_fvb x fvb.smt_id fvb.smt_arity fvb.smt_token
            (FStar_Pervasives_Native.Some t3)
           in
        let uu___110_2461 = env  in
        {
          bindings = ((Binding_fvar fvb1) :: (env.bindings));
          depth = (uu___110_2461.depth);
          tcenv = (uu___110_2461.tcenv);
          warn = (uu___110_2461.warn);
          cache = (uu___110_2461.cache);
          nolabels = (uu___110_2461.nolabels);
          use_zfuel_name = (uu___110_2461.use_zfuel_name);
          encode_non_total_function_typ =
            (uu___110_2461.encode_non_total_function_typ);
          current_module_name = (uu___110_2461.current_module_name)
        }
  
let (try_lookup_free_var :
  env_t ->
    FStar_Ident.lident ->
      FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun l  ->
      let uu____2470 = try_lookup_lid env l  in
      match uu____2470 with
      | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
      | FStar_Pervasives_Native.Some fvb ->
          (match fvb.smt_fuel_partial_app with
           | FStar_Pervasives_Native.Some f when env.use_zfuel_name ->
               FStar_Pervasives_Native.Some f
           | uu____2479 ->
               (match fvb.smt_token with
                | FStar_Pervasives_Native.Some t ->
                    (match t.FStar_SMTEncoding_Term.tm with
                     | FStar_SMTEncoding_Term.App (uu____2487,fuel::[]) ->
                         let uu____2491 =
                           let uu____2492 =
                             let uu____2493 =
                               FStar_SMTEncoding_Term.fv_of_term fuel  in
                             FStar_All.pipe_right uu____2493
                               FStar_Pervasives_Native.fst
                              in
                           FStar_Util.starts_with uu____2492 "fuel"  in
                         if uu____2491
                         then
                           let uu____2496 =
                             let uu____2497 =
                               FStar_SMTEncoding_Util.mkFreeV
                                 ((fvb.smt_id),
                                   FStar_SMTEncoding_Term.Term_sort)
                                in
                             FStar_SMTEncoding_Term.mk_ApplyTF uu____2497
                               fuel
                              in
                           FStar_All.pipe_left
                             (fun _0_40  ->
                                FStar_Pervasives_Native.Some _0_40)
                             uu____2496
                         else FStar_Pervasives_Native.Some t
                     | uu____2501 -> FStar_Pervasives_Native.Some t)
                | uu____2502 -> FStar_Pervasives_Native.None))
  
let (lookup_free_var :
  env_t ->
    FStar_Ident.lident FStar_Syntax_Syntax.withinfo_t ->
      FStar_SMTEncoding_Term.term)
  =
  fun env  ->
    fun a  ->
      let uu____2515 = try_lookup_free_var env a.FStar_Syntax_Syntax.v  in
      match uu____2515 with
      | FStar_Pervasives_Native.Some t -> t
      | FStar_Pervasives_Native.None  ->
          let uu____2519 =
            let uu____2520 =
              FStar_Syntax_Print.lid_to_string a.FStar_Syntax_Syntax.v  in
            FStar_Util.format1 "Name not found: %s" uu____2520  in
          failwith uu____2519
  
let (lookup_free_var_name :
  env_t ->
    FStar_Ident.lident FStar_Syntax_Syntax.withinfo_t ->
      (Prims.string,Prims.int) FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun a  ->
      let fvb = lookup_lid env a.FStar_Syntax_Syntax.v  in
      ((fvb.smt_id), (fvb.smt_arity))
  
let (lookup_free_var_sym :
  env_t ->
    FStar_Ident.lident FStar_Syntax_Syntax.withinfo_t ->
      (FStar_SMTEncoding_Term.op,FStar_SMTEncoding_Term.term Prims.list,
        Prims.int) FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun a  ->
      let fvb = lookup_lid env a.FStar_Syntax_Syntax.v  in
      match fvb.smt_fuel_partial_app with
      | FStar_Pervasives_Native.Some
          { FStar_SMTEncoding_Term.tm = FStar_SMTEncoding_Term.App (g,zf);
            FStar_SMTEncoding_Term.freevars = uu____2565;
            FStar_SMTEncoding_Term.rng = uu____2566;_}
          when env.use_zfuel_name ->
          (g, zf, (fvb.smt_arity + (Prims.parse_int "1")))
      | uu____2581 ->
          (match fvb.smt_token with
           | FStar_Pervasives_Native.None  ->
               ((FStar_SMTEncoding_Term.Var (fvb.smt_id)), [],
                 (fvb.smt_arity))
           | FStar_Pervasives_Native.Some sym ->
               (match sym.FStar_SMTEncoding_Term.tm with
                | FStar_SMTEncoding_Term.App (g,fuel::[]) ->
                    (g, [fuel], (fvb.smt_arity + (Prims.parse_int "1")))
                | uu____2609 ->
                    ((FStar_SMTEncoding_Term.Var (fvb.smt_id)), [],
                      (fvb.smt_arity))))
  
let (tok_of_name :
  env_t ->
    Prims.string ->
      FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun nm  ->
      FStar_Util.find_map env.bindings
        (fun uu___85_2622  ->
           match uu___85_2622 with
           | Binding_fvar fvb when fvb.smt_id = nm -> fvb.smt_token
           | uu____2626 -> FStar_Pervasives_Native.None)
  
let mkForall_fuel' :
  'Auu____2630 .
    'Auu____2630 ->
      (FStar_SMTEncoding_Term.pat Prims.list Prims.list,FStar_SMTEncoding_Term.fvs,
        FStar_SMTEncoding_Term.term) FStar_Pervasives_Native.tuple3 ->
        FStar_SMTEncoding_Term.term
  =
  fun n1  ->
    fun uu____2648  ->
      match uu____2648 with
      | (pats,vars,body) ->
          let fallback uu____2673 =
            FStar_SMTEncoding_Util.mkForall (pats, vars, body)  in
          let uu____2678 = FStar_Options.unthrottle_inductives ()  in
          if uu____2678
          then fallback ()
          else
            (let uu____2680 = fresh_fvar "f" FStar_SMTEncoding_Term.Fuel_sort
                in
             match uu____2680 with
             | (fsym,fterm) ->
                 let add_fuel1 tms =
                   FStar_All.pipe_right tms
                     (FStar_List.map
                        (fun p  ->
                           match p.FStar_SMTEncoding_Term.tm with
                           | FStar_SMTEncoding_Term.App
                               (FStar_SMTEncoding_Term.Var "HasType",args) ->
                               FStar_SMTEncoding_Util.mkApp
                                 ("HasTypeFuel", (fterm :: args))
                           | uu____2711 -> p))
                    in
                 let pats1 = FStar_List.map add_fuel1 pats  in
                 let body1 =
                   match body.FStar_SMTEncoding_Term.tm with
                   | FStar_SMTEncoding_Term.App
                       (FStar_SMTEncoding_Term.Imp ,guard::body'::[]) ->
                       let guard1 =
                         match guard.FStar_SMTEncoding_Term.tm with
                         | FStar_SMTEncoding_Term.App
                             (FStar_SMTEncoding_Term.And ,guards) ->
                             let uu____2732 = add_fuel1 guards  in
                             FStar_SMTEncoding_Util.mk_and_l uu____2732
                         | uu____2735 ->
                             let uu____2736 = add_fuel1 [guard]  in
                             FStar_All.pipe_right uu____2736 FStar_List.hd
                          in
                       FStar_SMTEncoding_Util.mkImp (guard1, body')
                   | uu____2741 -> body  in
                 let vars1 = (fsym, FStar_SMTEncoding_Term.Fuel_sort) :: vars
                    in
                 FStar_SMTEncoding_Util.mkForall (pats1, vars1, body1))
  
let (mkForall_fuel :
  (FStar_SMTEncoding_Term.pat Prims.list Prims.list,FStar_SMTEncoding_Term.fvs,
    FStar_SMTEncoding_Term.term) FStar_Pervasives_Native.tuple3 ->
    FStar_SMTEncoding_Term.term)
  = mkForall_fuel' (Prims.parse_int "1") 
let (head_normal : env_t -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun env  ->
    fun t  ->
      let t1 = FStar_Syntax_Util.unmeta t  in
      match t1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_arrow uu____2782 -> true
      | FStar_Syntax_Syntax.Tm_refine uu____2795 -> true
      | FStar_Syntax_Syntax.Tm_bvar uu____2802 -> true
      | FStar_Syntax_Syntax.Tm_uvar uu____2803 -> true
      | FStar_Syntax_Syntax.Tm_abs uu____2820 -> true
      | FStar_Syntax_Syntax.Tm_constant uu____2837 -> true
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let uu____2839 =
            FStar_TypeChecker_Env.lookup_definition
              [FStar_TypeChecker_Env.Eager_unfolding_only] env.tcenv
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          FStar_All.pipe_right uu____2839 FStar_Option.isNone
      | FStar_Syntax_Syntax.Tm_app
          ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
             FStar_Syntax_Syntax.pos = uu____2857;
             FStar_Syntax_Syntax.vars = uu____2858;_},uu____2859)
          ->
          let uu____2880 =
            FStar_TypeChecker_Env.lookup_definition
              [FStar_TypeChecker_Env.Eager_unfolding_only] env.tcenv
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          FStar_All.pipe_right uu____2880 FStar_Option.isNone
      | uu____2897 -> false
  
let (head_redex : env_t -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun env  ->
    fun t  ->
      let uu____2904 =
        let uu____2905 = FStar_Syntax_Util.un_uinst t  in
        uu____2905.FStar_Syntax_Syntax.n  in
      match uu____2904 with
      | FStar_Syntax_Syntax.Tm_abs
          (uu____2908,uu____2909,FStar_Pervasives_Native.Some rc) ->
          ((FStar_Ident.lid_equals rc.FStar_Syntax_Syntax.residual_effect
              FStar_Parser_Const.effect_Tot_lid)
             ||
             (FStar_Ident.lid_equals rc.FStar_Syntax_Syntax.residual_effect
                FStar_Parser_Const.effect_GTot_lid))
            ||
            (FStar_List.existsb
               (fun uu___86_2930  ->
                  match uu___86_2930 with
                  | FStar_Syntax_Syntax.TOTAL  -> true
                  | uu____2931 -> false)
               rc.FStar_Syntax_Syntax.residual_flags)
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let uu____2933 =
            FStar_TypeChecker_Env.lookup_definition
              [FStar_TypeChecker_Env.Eager_unfolding_only] env.tcenv
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          FStar_All.pipe_right uu____2933 FStar_Option.isSome
      | uu____2950 -> false
  
let (whnf : env_t -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun env  ->
    fun t  ->
      let uu____2957 = head_normal env t  in
      if uu____2957
      then t
      else
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Normalize.Beta;
          FStar_TypeChecker_Normalize.Weak;
          FStar_TypeChecker_Normalize.HNF;
          FStar_TypeChecker_Normalize.Exclude
            FStar_TypeChecker_Normalize.Zeta;
          FStar_TypeChecker_Normalize.Eager_unfolding;
          FStar_TypeChecker_Normalize.EraseUniverses] env.tcenv t
  
let (norm : env_t -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun env  ->
    fun t  ->
      FStar_TypeChecker_Normalize.normalize
        [FStar_TypeChecker_Normalize.Beta;
        FStar_TypeChecker_Normalize.Exclude FStar_TypeChecker_Normalize.Zeta;
        FStar_TypeChecker_Normalize.Eager_unfolding;
        FStar_TypeChecker_Normalize.EraseUniverses] env.tcenv t
  
let (trivial_post : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t  ->
    let uu____2968 =
      let uu____2969 = FStar_Syntax_Syntax.null_binder t  in [uu____2969]  in
    let uu____2970 =
      FStar_Syntax_Syntax.fvar FStar_Parser_Const.true_lid
        FStar_Syntax_Syntax.Delta_constant FStar_Pervasives_Native.None
       in
    FStar_Syntax_Util.abs uu____2968 uu____2970 FStar_Pervasives_Native.None
  
let (mk_Apply :
  FStar_SMTEncoding_Term.term ->
    (Prims.string,FStar_SMTEncoding_Term.sort) FStar_Pervasives_Native.tuple2
      Prims.list -> FStar_SMTEncoding_Term.term)
  =
  fun e  ->
    fun vars  ->
      FStar_All.pipe_right vars
        (FStar_List.fold_left
           (fun out  ->
              fun var  ->
                match FStar_Pervasives_Native.snd var with
                | FStar_SMTEncoding_Term.Fuel_sort  ->
                    let uu____3008 = FStar_SMTEncoding_Util.mkFreeV var  in
                    FStar_SMTEncoding_Term.mk_ApplyTF out uu____3008
                | s ->
                    let uu____3013 = FStar_SMTEncoding_Util.mkFreeV var  in
                    FStar_SMTEncoding_Util.mk_ApplyTT out uu____3013) e)
  
let (mk_Apply_args :
  FStar_SMTEncoding_Term.term ->
    FStar_SMTEncoding_Term.term Prims.list -> FStar_SMTEncoding_Term.term)
  =
  fun e  ->
    fun args  ->
      FStar_All.pipe_right args
        (FStar_List.fold_left FStar_SMTEncoding_Util.mk_ApplyTT e)
  
let raise_arity_mismatch :
  'Auu____3031 .
    Prims.string ->
      Prims.int -> Prims.int -> FStar_Range.range -> 'Auu____3031
  =
  fun head1  ->
    fun arity  ->
      fun n_args  ->
        fun rng  ->
          let uu____3048 =
            let uu____3053 =
              let uu____3054 = FStar_Util.string_of_int arity  in
              let uu____3055 = FStar_Util.string_of_int n_args  in
              FStar_Util.format3
                "Head symbol %s expects at least %s arguments; got only %s"
                head1 uu____3054 uu____3055
               in
            (FStar_Errors.Fatal_SMTEncodingArityMismatch, uu____3053)  in
          FStar_Errors.raise_error uu____3048 rng
  
let (maybe_curry_app :
  FStar_Range.range ->
    FStar_SMTEncoding_Term.op ->
      Prims.int ->
        FStar_SMTEncoding_Term.term Prims.list -> FStar_SMTEncoding_Term.term)
  =
  fun rng  ->
    fun head1  ->
      fun arity  ->
        fun args  ->
          let n_args = FStar_List.length args  in
          if n_args = arity
          then FStar_SMTEncoding_Util.mkApp' (head1, args)
          else
            if n_args > arity
            then
              (let uu____3086 = FStar_Util.first_N arity args  in
               match uu____3086 with
               | (args1,rest) ->
                   let head2 = FStar_SMTEncoding_Util.mkApp' (head1, args1)
                      in
                   mk_Apply_args head2 rest)
            else
              (let uu____3109 = FStar_SMTEncoding_Term.op_to_string head1  in
               raise_arity_mismatch uu____3109 arity n_args rng)
  
let (is_app : FStar_SMTEncoding_Term.op -> Prims.bool) =
  fun uu___87_3116  ->
    match uu___87_3116 with
    | FStar_SMTEncoding_Term.Var "ApplyTT" -> true
    | FStar_SMTEncoding_Term.Var "ApplyTF" -> true
    | uu____3117 -> false
  
let (is_an_eta_expansion :
  env_t ->
    FStar_SMTEncoding_Term.fv Prims.list ->
      FStar_SMTEncoding_Term.term ->
        FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun vars  ->
      fun body  ->
        let rec check_partial_applications t xs =
          match ((t.FStar_SMTEncoding_Term.tm), xs) with
          | (FStar_SMTEncoding_Term.App
             (app,f::{
                       FStar_SMTEncoding_Term.tm =
                         FStar_SMTEncoding_Term.FreeV y;
                       FStar_SMTEncoding_Term.freevars = uu____3153;
                       FStar_SMTEncoding_Term.rng = uu____3154;_}::[]),x::xs1)
              when (is_app app) && (FStar_SMTEncoding_Term.fv_eq x y) ->
              check_partial_applications f xs1
          | (FStar_SMTEncoding_Term.App
             (FStar_SMTEncoding_Term.Var f,args),uu____3177) ->
              let uu____3186 =
                ((FStar_List.length args) = (FStar_List.length xs)) &&
                  (FStar_List.forall2
                     (fun a  ->
                        fun v1  ->
                          match a.FStar_SMTEncoding_Term.tm with
                          | FStar_SMTEncoding_Term.FreeV fv ->
                              FStar_SMTEncoding_Term.fv_eq fv v1
                          | uu____3197 -> false) args (FStar_List.rev xs))
                 in
              if uu____3186
              then tok_of_name env f
              else FStar_Pervasives_Native.None
          | (uu____3201,[]) ->
              let fvs = FStar_SMTEncoding_Term.free_variables t  in
              let uu____3205 =
                FStar_All.pipe_right fvs
                  (FStar_List.for_all
                     (fun fv  ->
                        let uu____3209 =
                          FStar_Util.for_some
                            (FStar_SMTEncoding_Term.fv_eq fv) vars
                           in
                        Prims.op_Negation uu____3209))
                 in
              if uu____3205
              then FStar_Pervasives_Native.Some t
              else FStar_Pervasives_Native.None
          | uu____3213 -> FStar_Pervasives_Native.None  in
        check_partial_applications body (FStar_List.rev vars)
  
type label =
  (FStar_SMTEncoding_Term.fv,Prims.string,FStar_Range.range)
    FStar_Pervasives_Native.tuple3[@@deriving show]
type labels = label Prims.list[@@deriving show]
type pattern =
  {
  pat_vars:
    (FStar_Syntax_Syntax.bv,FStar_SMTEncoding_Term.fv)
      FStar_Pervasives_Native.tuple2 Prims.list
    ;
  pat_term:
    Prims.unit ->
      (FStar_SMTEncoding_Term.term,FStar_SMTEncoding_Term.decls_t)
        FStar_Pervasives_Native.tuple2
    ;
  guard: FStar_SMTEncoding_Term.term -> FStar_SMTEncoding_Term.term ;
  projections:
    FStar_SMTEncoding_Term.term ->
      (FStar_Syntax_Syntax.bv,FStar_SMTEncoding_Term.term)
        FStar_Pervasives_Native.tuple2 Prims.list
    }[@@deriving show]
let (__proj__Mkpattern__item__pat_vars :
  pattern ->
    (FStar_Syntax_Syntax.bv,FStar_SMTEncoding_Term.fv)
      FStar_Pervasives_Native.tuple2 Prims.list)
  =
  fun projectee  ->
    match projectee with
    | { pat_vars = __fname__pat_vars; pat_term = __fname__pat_term;
        guard = __fname__guard; projections = __fname__projections;_} ->
        __fname__pat_vars
  
let (__proj__Mkpattern__item__pat_term :
  pattern ->
    Prims.unit ->
      (FStar_SMTEncoding_Term.term,FStar_SMTEncoding_Term.decls_t)
        FStar_Pervasives_Native.tuple2)
  =
  fun projectee  ->
    match projectee with
    | { pat_vars = __fname__pat_vars; pat_term = __fname__pat_term;
        guard = __fname__guard; projections = __fname__projections;_} ->
        __fname__pat_term
  
let (__proj__Mkpattern__item__guard :
  pattern -> FStar_SMTEncoding_Term.term -> FStar_SMTEncoding_Term.term) =
  fun projectee  ->
    match projectee with
    | { pat_vars = __fname__pat_vars; pat_term = __fname__pat_term;
        guard = __fname__guard; projections = __fname__projections;_} ->
        __fname__guard
  
let (__proj__Mkpattern__item__projections :
  pattern ->
    FStar_SMTEncoding_Term.term ->
      (FStar_Syntax_Syntax.bv,FStar_SMTEncoding_Term.term)
        FStar_Pervasives_Native.tuple2 Prims.list)
  =
  fun projectee  ->
    match projectee with
    | { pat_vars = __fname__pat_vars; pat_term = __fname__pat_term;
        guard = __fname__guard; projections = __fname__projections;_} ->
        __fname__projections
  
exception Let_rec_unencodeable 
let (uu___is_Let_rec_unencodeable : Prims.exn -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | Let_rec_unencodeable  -> true
    | uu____3435 -> false
  
exception Inner_let_rec 
let (uu___is_Inner_let_rec : Prims.exn -> Prims.bool) =
  fun projectee  ->
    match projectee with | Inner_let_rec  -> true | uu____3439 -> false
  
let (as_function_typ :
  env_t ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t0  ->
      let rec aux norm1 t =
        let t1 = FStar_Syntax_Subst.compress t  in
        match t1.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Tm_arrow uu____3458 -> t1
        | FStar_Syntax_Syntax.Tm_refine uu____3471 ->
            let uu____3478 = FStar_Syntax_Util.unrefine t1  in
            aux true uu____3478
        | uu____3479 ->
            if norm1
            then let uu____3480 = whnf env t1  in aux false uu____3480
            else
              (let uu____3482 =
                 let uu____3483 =
                   FStar_Range.string_of_range t0.FStar_Syntax_Syntax.pos  in
                 let uu____3484 = FStar_Syntax_Print.term_to_string t0  in
                 FStar_Util.format2 "(%s) Expected a function typ; got %s"
                   uu____3483 uu____3484
                  in
               failwith uu____3482)
         in
      aux true t0
  
let rec (curried_arrow_formals_comp :
  FStar_Syntax_Syntax.term ->
    (FStar_Syntax_Syntax.binders,FStar_Syntax_Syntax.comp)
      FStar_Pervasives_Native.tuple2)
  =
  fun k  ->
    let k1 = FStar_Syntax_Subst.compress k  in
    match k1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
        FStar_Syntax_Subst.open_comp bs c
    | FStar_Syntax_Syntax.Tm_refine (bv,uu____3516) ->
        curried_arrow_formals_comp bv.FStar_Syntax_Syntax.sort
    | uu____3521 ->
        let uu____3522 = FStar_Syntax_Syntax.mk_Total k1  in ([], uu____3522)
  
let is_arithmetic_primitive :
  'Auu____3536 .
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      'Auu____3536 Prims.list -> Prims.bool
  =
  fun head1  ->
    fun args  ->
      match ((head1.FStar_Syntax_Syntax.n), args) with
      | (FStar_Syntax_Syntax.Tm_fvar fv,uu____3556::uu____3557::[]) ->
          ((((FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.op_Addition)
               ||
               (FStar_Syntax_Syntax.fv_eq_lid fv
                  FStar_Parser_Const.op_Subtraction))
              ||
              (FStar_Syntax_Syntax.fv_eq_lid fv
                 FStar_Parser_Const.op_Multiply))
             ||
             (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.op_Division))
            ||
            (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.op_Modulus)
      | (FStar_Syntax_Syntax.Tm_fvar fv,uu____3561::[]) ->
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.op_Minus
      | uu____3564 -> false
  
let (isInteger : FStar_Syntax_Syntax.term' -> Prims.bool) =
  fun tm  ->
    match tm with
    | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int
        (n1,FStar_Pervasives_Native.None )) -> true
    | uu____3585 -> false
  
let (getInteger : FStar_Syntax_Syntax.term' -> Prims.int) =
  fun tm  ->
    match tm with
    | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int
        (n1,FStar_Pervasives_Native.None )) -> FStar_Util.int_of_string n1
    | uu____3600 -> failwith "Expected an Integer term"
  
let is_BitVector_primitive :
  'Auu____3604 .
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,'Auu____3604)
        FStar_Pervasives_Native.tuple2 Prims.list -> Prims.bool
  =
  fun head1  ->
    fun args  ->
      match ((head1.FStar_Syntax_Syntax.n), args) with
      | (FStar_Syntax_Syntax.Tm_fvar
         fv,(sz_arg,uu____3643)::uu____3644::uu____3645::[]) ->
          (((((((((((FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Parser_Const.bv_and_lid)
                      ||
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Parser_Const.bv_xor_lid))
                     ||
                     (FStar_Syntax_Syntax.fv_eq_lid fv
                        FStar_Parser_Const.bv_or_lid))
                    ||
                    (FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Parser_Const.bv_add_lid))
                   ||
                   (FStar_Syntax_Syntax.fv_eq_lid fv
                      FStar_Parser_Const.bv_sub_lid))
                  ||
                  (FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.bv_shift_left_lid))
                 ||
                 (FStar_Syntax_Syntax.fv_eq_lid fv
                    FStar_Parser_Const.bv_shift_right_lid))
                ||
                (FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.bv_udiv_lid))
               ||
               (FStar_Syntax_Syntax.fv_eq_lid fv
                  FStar_Parser_Const.bv_mod_lid))
              ||
              (FStar_Syntax_Syntax.fv_eq_lid fv
                 FStar_Parser_Const.bv_uext_lid))
             ||
             (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.bv_mul_lid))
            && (isInteger sz_arg.FStar_Syntax_Syntax.n)
      | (FStar_Syntax_Syntax.Tm_fvar fv,(sz_arg,uu____3696)::uu____3697::[])
          ->
          ((FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.nat_to_bv_lid)
             ||
             (FStar_Syntax_Syntax.fv_eq_lid fv
                FStar_Parser_Const.bv_to_nat_lid))
            && (isInteger sz_arg.FStar_Syntax_Syntax.n)
      | uu____3734 -> false
  
let rec (encode_const :
  FStar_Const.sconst ->
    env_t ->
      (FStar_SMTEncoding_Term.term,FStar_SMTEncoding_Term.decl Prims.list)
        FStar_Pervasives_Native.tuple2)
  =
  fun c  ->
    fun env  ->
      match c with
      | FStar_Const.Const_unit  -> (FStar_SMTEncoding_Term.mk_Term_unit, [])
      | FStar_Const.Const_bool (true ) ->
          let uu____3953 =
            FStar_SMTEncoding_Term.boxBool FStar_SMTEncoding_Util.mkTrue  in
          (uu____3953, [])
      | FStar_Const.Const_bool (false ) ->
          let uu____3956 =
            FStar_SMTEncoding_Term.boxBool FStar_SMTEncoding_Util.mkFalse  in
          (uu____3956, [])
      | FStar_Const.Const_char c1 ->
          let uu____3960 =
            let uu____3961 =
              let uu____3968 =
                let uu____3971 =
                  let uu____3972 =
                    FStar_SMTEncoding_Util.mkInteger'
                      (FStar_Util.int_of_char c1)
                     in
                  FStar_SMTEncoding_Term.boxInt uu____3972  in
                [uu____3971]  in
              ("FStar.Char.__char_of_int", uu____3968)  in
            FStar_SMTEncoding_Util.mkApp uu____3961  in
          (uu____3960, [])
      | FStar_Const.Const_int (i,FStar_Pervasives_Native.None ) ->
          let uu____3988 =
            let uu____3989 = FStar_SMTEncoding_Util.mkInteger i  in
            FStar_SMTEncoding_Term.boxInt uu____3989  in
          (uu____3988, [])
      | FStar_Const.Const_int (repr,FStar_Pervasives_Native.Some sw) ->
          let syntax_term =
            FStar_ToSyntax_ToSyntax.desugar_machine_integer
              (env.tcenv).FStar_TypeChecker_Env.dsenv repr sw
              FStar_Range.dummyRange
             in
          encode_term syntax_term env
      | FStar_Const.Const_string (s,uu____4010) ->
          let uu____4011 = varops.string_const s  in (uu____4011, [])
      | FStar_Const.Const_range uu____4014 ->
          let uu____4015 = FStar_SMTEncoding_Term.mk_Range_const ()  in
          (uu____4015, [])
      | FStar_Const.Const_effect  ->
          (FStar_SMTEncoding_Term.mk_Term_type, [])
      | c1 ->
          let uu____4021 =
            let uu____4022 = FStar_Syntax_Print.const_to_string c1  in
            FStar_Util.format1 "Unhandled constant: %s" uu____4022  in
          failwith uu____4021

and (encode_binders :
  FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option ->
    FStar_Syntax_Syntax.binders ->
      env_t ->
        (FStar_SMTEncoding_Term.fv Prims.list,FStar_SMTEncoding_Term.term
                                                Prims.list,env_t,FStar_SMTEncoding_Term.decls_t,
          FStar_Syntax_Syntax.bv Prims.list) FStar_Pervasives_Native.tuple5)
  =
  fun fuel_opt  ->
    fun bs  ->
      fun env  ->
        (let uu____4051 =
           FStar_TypeChecker_Env.debug env.tcenv FStar_Options.Low  in
         if uu____4051
         then
           let uu____4052 = FStar_Syntax_Print.binders_to_string ", " bs  in
           FStar_Util.print1 "Encoding binders %s\n" uu____4052
         else ());
        (let uu____4054 =
           FStar_All.pipe_right bs
             (FStar_List.fold_left
                (fun uu____4138  ->
                   fun b  ->
                     match uu____4138 with
                     | (vars,guards,env1,decls,names1) ->
                         let uu____4217 =
                           let x = unmangle (FStar_Pervasives_Native.fst b)
                              in
                           let uu____4233 = gen_term_var env1 x  in
                           match uu____4233 with
                           | (xxsym,xx,env') ->
                               let uu____4257 =
                                 let uu____4262 =
                                   norm env1 x.FStar_Syntax_Syntax.sort  in
                                 encode_term_pred fuel_opt uu____4262 env1 xx
                                  in
                               (match uu____4257 with
                                | (guard_x_t,decls') ->
                                    ((xxsym,
                                       FStar_SMTEncoding_Term.Term_sort),
                                      guard_x_t, env', decls', x))
                            in
                         (match uu____4217 with
                          | (v1,g,env2,decls',n1) ->
                              ((v1 :: vars), (g :: guards), env2,
                                (FStar_List.append decls decls'), (n1 ::
                                names1)))) ([], [], env, [], []))
            in
         match uu____4054 with
         | (vars,guards,env1,decls,names1) ->
             ((FStar_List.rev vars), (FStar_List.rev guards), env1, decls,
               (FStar_List.rev names1)))

and (encode_term_pred :
  FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option ->
    FStar_Syntax_Syntax.typ ->
      env_t ->
        FStar_SMTEncoding_Term.term ->
          (FStar_SMTEncoding_Term.term,FStar_SMTEncoding_Term.decls_t)
            FStar_Pervasives_Native.tuple2)
  =
  fun fuel_opt  ->
    fun t  ->
      fun env  ->
        fun e  ->
          let uu____4421 = encode_term t env  in
          match uu____4421 with
          | (t1,decls) ->
              let uu____4432 =
                FStar_SMTEncoding_Term.mk_HasTypeWithFuel fuel_opt e t1  in
              (uu____4432, decls)

and (encode_term_pred' :
  FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option ->
    FStar_Syntax_Syntax.typ ->
      env_t ->
        FStar_SMTEncoding_Term.term ->
          (FStar_SMTEncoding_Term.term,FStar_SMTEncoding_Term.decls_t)
            FStar_Pervasives_Native.tuple2)
  =
  fun fuel_opt  ->
    fun t  ->
      fun env  ->
        fun e  ->
          let uu____4443 = encode_term t env  in
          match uu____4443 with
          | (t1,decls) ->
              (match fuel_opt with
               | FStar_Pervasives_Native.None  ->
                   let uu____4458 = FStar_SMTEncoding_Term.mk_HasTypeZ e t1
                      in
                   (uu____4458, decls)
               | FStar_Pervasives_Native.Some f ->
                   let uu____4460 =
                     FStar_SMTEncoding_Term.mk_HasTypeFuel f e t1  in
                   (uu____4460, decls))

and (encode_arith_term :
  env_t ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.args ->
        (FStar_SMTEncoding_Term.term,FStar_SMTEncoding_Term.decls_t)
          FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun head1  ->
      fun args_e  ->
        let uu____4466 = encode_args args_e env  in
        match uu____4466 with
        | (arg_tms,decls) ->
            let head_fv =
              match head1.FStar_Syntax_Syntax.n with
              | FStar_Syntax_Syntax.Tm_fvar fv -> fv
              | uu____4485 -> failwith "Impossible"  in
            let unary arg_tms1 =
              let uu____4494 = FStar_List.hd arg_tms1  in
              FStar_SMTEncoding_Term.unboxInt uu____4494  in
            let binary arg_tms1 =
              let uu____4507 =
                let uu____4508 = FStar_List.hd arg_tms1  in
                FStar_SMTEncoding_Term.unboxInt uu____4508  in
              let uu____4509 =
                let uu____4510 =
                  let uu____4511 = FStar_List.tl arg_tms1  in
                  FStar_List.hd uu____4511  in
                FStar_SMTEncoding_Term.unboxInt uu____4510  in
              (uu____4507, uu____4509)  in
            let mk_default uu____4517 =
              let uu____4518 =
                lookup_free_var_sym env head_fv.FStar_Syntax_Syntax.fv_name
                 in
              match uu____4518 with
              | (fname,fuel_args,arity) ->
                  let args = FStar_List.append fuel_args arg_tms  in
                  maybe_curry_app head1.FStar_Syntax_Syntax.pos fname arity
                    args
               in
            let mk_l a op mk_args ts =
              let uu____4568 = FStar_Options.smtencoding_l_arith_native ()
                 in
              if uu____4568
              then
                let uu____4569 =
                  let uu____4570 = mk_args ts  in op uu____4570  in
                FStar_All.pipe_right uu____4569 FStar_SMTEncoding_Term.boxInt
              else mk_default ()  in
            let mk_nl nm op ts =
              let uu____4599 = FStar_Options.smtencoding_nl_arith_wrapped ()
                 in
              if uu____4599
              then
                let uu____4600 = binary ts  in
                match uu____4600 with
                | (t1,t2) ->
                    let uu____4607 =
                      FStar_SMTEncoding_Util.mkApp (nm, [t1; t2])  in
                    FStar_All.pipe_right uu____4607
                      FStar_SMTEncoding_Term.boxInt
              else
                (let uu____4611 =
                   FStar_Options.smtencoding_nl_arith_native ()  in
                 if uu____4611
                 then
                   let uu____4612 = op (binary ts)  in
                   FStar_All.pipe_right uu____4612
                     FStar_SMTEncoding_Term.boxInt
                 else mk_default ())
               in
            let add1 =
              mk_l ()
                (fun a415  -> (Obj.magic FStar_SMTEncoding_Util.mkAdd) a415)
                (fun a416  -> (Obj.magic binary) a416)
               in
            let sub1 =
              mk_l ()
                (fun a417  -> (Obj.magic FStar_SMTEncoding_Util.mkSub) a417)
                (fun a418  -> (Obj.magic binary) a418)
               in
            let minus =
              mk_l ()
                (fun a419  -> (Obj.magic FStar_SMTEncoding_Util.mkMinus) a419)
                (fun a420  -> (Obj.magic unary) a420)
               in
            let mul1 = mk_nl "_mul" FStar_SMTEncoding_Util.mkMul  in
            let div1 = mk_nl "_div" FStar_SMTEncoding_Util.mkDiv  in
            let modulus = mk_nl "_mod" FStar_SMTEncoding_Util.mkMod  in
            let ops =
              [(FStar_Parser_Const.op_Addition, add1);
              (FStar_Parser_Const.op_Subtraction, sub1);
              (FStar_Parser_Const.op_Multiply, mul1);
              (FStar_Parser_Const.op_Division, div1);
              (FStar_Parser_Const.op_Modulus, modulus);
              (FStar_Parser_Const.op_Minus, minus)]  in
            let uu____4735 =
              let uu____4744 =
                FStar_List.tryFind
                  (fun uu____4766  ->
                     match uu____4766 with
                     | (l,uu____4776) ->
                         FStar_Syntax_Syntax.fv_eq_lid head_fv l) ops
                 in
              FStar_All.pipe_right uu____4744 FStar_Util.must  in
            (match uu____4735 with
             | (uu____4815,op) ->
                 let uu____4825 = op arg_tms  in (uu____4825, decls))

and (encode_BitVector_term :
  env_t ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.arg Prims.list ->
        (FStar_SMTEncoding_Term.term,FStar_SMTEncoding_Term.decl Prims.list)
          FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun head1  ->
      fun args_e  ->
        let uu____4833 = FStar_List.hd args_e  in
        match uu____4833 with
        | (tm_sz,uu____4841) ->
            let sz = getInteger tm_sz.FStar_Syntax_Syntax.n  in
            let sz_key =
              FStar_Util.format1 "BitVector_%s" (Prims.string_of_int sz)  in
            let sz_decls =
              let uu____4851 = FStar_Util.smap_try_find env.cache sz_key  in
              match uu____4851 with
              | FStar_Pervasives_Native.Some cache_entry -> []
              | FStar_Pervasives_Native.None  ->
                  let t_decls = FStar_SMTEncoding_Term.mkBvConstructor sz  in
                  ((let uu____4859 = mk_cache_entry env "" [] []  in
                    FStar_Util.smap_add env.cache sz_key uu____4859);
                   t_decls)
               in
            let uu____4860 =
              match ((head1.FStar_Syntax_Syntax.n), args_e) with
              | (FStar_Syntax_Syntax.Tm_fvar
                 fv,uu____4880::(sz_arg,uu____4882)::uu____4883::[]) when
                  (FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.bv_uext_lid)
                    && (isInteger sz_arg.FStar_Syntax_Syntax.n)
                  ->
                  let uu____4932 =
                    let uu____4935 = FStar_List.tail args_e  in
                    FStar_List.tail uu____4935  in
                  let uu____4938 =
                    let uu____4941 = getInteger sz_arg.FStar_Syntax_Syntax.n
                       in
                    FStar_Pervasives_Native.Some uu____4941  in
                  (uu____4932, uu____4938)
              | (FStar_Syntax_Syntax.Tm_fvar
                 fv,uu____4947::(sz_arg,uu____4949)::uu____4950::[]) when
                  FStar_Syntax_Syntax.fv_eq_lid fv
                    FStar_Parser_Const.bv_uext_lid
                  ->
                  let uu____4999 =
                    let uu____5000 = FStar_Syntax_Print.term_to_string sz_arg
                       in
                    FStar_Util.format1
                      "Not a constant bitvector extend size: %s" uu____5000
                     in
                  failwith uu____4999
              | uu____5009 ->
                  let uu____5016 = FStar_List.tail args_e  in
                  (uu____5016, FStar_Pervasives_Native.None)
               in
            (match uu____4860 with
             | (arg_tms,ext_sz) ->
                 let uu____5039 = encode_args arg_tms env  in
                 (match uu____5039 with
                  | (arg_tms1,decls) ->
                      let head_fv =
                        match head1.FStar_Syntax_Syntax.n with
                        | FStar_Syntax_Syntax.Tm_fvar fv -> fv
                        | uu____5060 -> failwith "Impossible"  in
                      let unary arg_tms2 =
                        let uu____5069 = FStar_List.hd arg_tms2  in
                        FStar_SMTEncoding_Term.unboxBitVec sz uu____5069  in
                      let unary_arith arg_tms2 =
                        let uu____5078 = FStar_List.hd arg_tms2  in
                        FStar_SMTEncoding_Term.unboxInt uu____5078  in
                      let binary arg_tms2 =
                        let uu____5091 =
                          let uu____5092 = FStar_List.hd arg_tms2  in
                          FStar_SMTEncoding_Term.unboxBitVec sz uu____5092
                           in
                        let uu____5093 =
                          let uu____5094 =
                            let uu____5095 = FStar_List.tl arg_tms2  in
                            FStar_List.hd uu____5095  in
                          FStar_SMTEncoding_Term.unboxBitVec sz uu____5094
                           in
                        (uu____5091, uu____5093)  in
                      let binary_arith arg_tms2 =
                        let uu____5110 =
                          let uu____5111 = FStar_List.hd arg_tms2  in
                          FStar_SMTEncoding_Term.unboxBitVec sz uu____5111
                           in
                        let uu____5112 =
                          let uu____5113 =
                            let uu____5114 = FStar_List.tl arg_tms2  in
                            FStar_List.hd uu____5114  in
                          FStar_SMTEncoding_Term.unboxInt uu____5113  in
                        (uu____5110, uu____5112)  in
                      let mk_bv a op mk_args resBox ts =
                        let uu____5156 =
                          let uu____5157 = mk_args ts  in op uu____5157  in
                        FStar_All.pipe_right uu____5156 resBox  in
                      let bv_and =
                        mk_bv ()
                          (fun a421  ->
                             (Obj.magic FStar_SMTEncoding_Util.mkBvAnd) a421)
                          (fun a422  -> (Obj.magic binary) a422)
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_xor =
                        mk_bv ()
                          (fun a423  ->
                             (Obj.magic FStar_SMTEncoding_Util.mkBvXor) a423)
                          (fun a424  -> (Obj.magic binary) a424)
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_or =
                        mk_bv ()
                          (fun a425  ->
                             (Obj.magic FStar_SMTEncoding_Util.mkBvOr) a425)
                          (fun a426  -> (Obj.magic binary) a426)
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_add =
                        mk_bv ()
                          (fun a427  ->
                             (Obj.magic FStar_SMTEncoding_Util.mkBvAdd) a427)
                          (fun a428  -> (Obj.magic binary) a428)
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_sub =
                        mk_bv ()
                          (fun a429  ->
                             (Obj.magic FStar_SMTEncoding_Util.mkBvSub) a429)
                          (fun a430  -> (Obj.magic binary) a430)
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_shl =
                        mk_bv ()
                          (fun a431  ->
                             (Obj.magic (FStar_SMTEncoding_Util.mkBvShl sz))
                               a431)
                          (fun a432  -> (Obj.magic binary_arith) a432)
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_shr =
                        mk_bv ()
                          (fun a433  ->
                             (Obj.magic (FStar_SMTEncoding_Util.mkBvShr sz))
                               a433)
                          (fun a434  -> (Obj.magic binary_arith) a434)
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_udiv =
                        mk_bv ()
                          (fun a435  ->
                             (Obj.magic (FStar_SMTEncoding_Util.mkBvUdiv sz))
                               a435)
                          (fun a436  -> (Obj.magic binary_arith) a436)
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_mod =
                        mk_bv ()
                          (fun a437  ->
                             (Obj.magic (FStar_SMTEncoding_Util.mkBvMod sz))
                               a437)
                          (fun a438  -> (Obj.magic binary_arith) a438)
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_mul =
                        mk_bv ()
                          (fun a439  ->
                             (Obj.magic (FStar_SMTEncoding_Util.mkBvMul sz))
                               a439)
                          (fun a440  -> (Obj.magic binary_arith) a440)
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_ult =
                        mk_bv ()
                          (fun a441  ->
                             (Obj.magic FStar_SMTEncoding_Util.mkBvUlt) a441)
                          (fun a442  -> (Obj.magic binary) a442)
                          FStar_SMTEncoding_Term.boxBool
                         in
                      let bv_uext arg_tms2 =
                        let uu____5221 =
                          let uu____5224 =
                            match ext_sz with
                            | FStar_Pervasives_Native.Some x -> x
                            | FStar_Pervasives_Native.None  ->
                                failwith "impossible"
                             in
                          FStar_SMTEncoding_Util.mkBvUext uu____5224  in
                        let uu____5226 =
                          let uu____5229 =
                            let uu____5230 =
                              match ext_sz with
                              | FStar_Pervasives_Native.Some x -> x
                              | FStar_Pervasives_Native.None  ->
                                  failwith "impossible"
                               in
                            sz + uu____5230  in
                          FStar_SMTEncoding_Term.boxBitVec uu____5229  in
                        mk_bv () (fun a443  -> (Obj.magic uu____5221) a443)
                          (fun a444  -> (Obj.magic unary) a444) uu____5226
                          arg_tms2
                         in
                      let to_int1 =
                        mk_bv ()
                          (fun a445  ->
                             (Obj.magic FStar_SMTEncoding_Util.mkBvToNat)
                               a445) (fun a446  -> (Obj.magic unary) a446)
                          FStar_SMTEncoding_Term.boxInt
                         in
                      let bv_to =
                        mk_bv ()
                          (fun a447  ->
                             (Obj.magic (FStar_SMTEncoding_Util.mkNatToBv sz))
                               a447)
                          (fun a448  -> (Obj.magic unary_arith) a448)
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let ops =
                        [(FStar_Parser_Const.bv_and_lid, bv_and);
                        (FStar_Parser_Const.bv_xor_lid, bv_xor);
                        (FStar_Parser_Const.bv_or_lid, bv_or);
                        (FStar_Parser_Const.bv_add_lid, bv_add);
                        (FStar_Parser_Const.bv_sub_lid, bv_sub);
                        (FStar_Parser_Const.bv_shift_left_lid, bv_shl);
                        (FStar_Parser_Const.bv_shift_right_lid, bv_shr);
                        (FStar_Parser_Const.bv_udiv_lid, bv_udiv);
                        (FStar_Parser_Const.bv_mod_lid, bv_mod);
                        (FStar_Parser_Const.bv_mul_lid, bv_mul);
                        (FStar_Parser_Const.bv_ult_lid, bv_ult);
                        (FStar_Parser_Const.bv_uext_lid, bv_uext);
                        (FStar_Parser_Const.bv_to_nat_lid, to_int1);
                        (FStar_Parser_Const.nat_to_bv_lid, bv_to)]  in
                      let uu____5429 =
                        let uu____5438 =
                          FStar_List.tryFind
                            (fun uu____5460  ->
                               match uu____5460 with
                               | (l,uu____5470) ->
                                   FStar_Syntax_Syntax.fv_eq_lid head_fv l)
                            ops
                           in
                        FStar_All.pipe_right uu____5438 FStar_Util.must  in
                      (match uu____5429 with
                       | (uu____5511,op) ->
                           let uu____5521 = op arg_tms1  in
                           (uu____5521, (FStar_List.append sz_decls decls)))))

and (encode_term :
  FStar_Syntax_Syntax.typ ->
    env_t ->
      (FStar_SMTEncoding_Term.term,FStar_SMTEncoding_Term.decls_t)
        FStar_Pervasives_Native.tuple2)
  =
  fun t  ->
    fun env  ->
      let t0 = FStar_Syntax_Subst.compress t  in
      (let uu____5532 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env.tcenv)
           (FStar_Options.Other "SMTEncoding")
          in
       if uu____5532
       then
         let uu____5533 = FStar_Syntax_Print.tag_of_term t  in
         let uu____5534 = FStar_Syntax_Print.tag_of_term t0  in
         let uu____5535 = FStar_Syntax_Print.term_to_string t0  in
         FStar_Util.print3 "(%s) (%s)   %s\n" uu____5533 uu____5534
           uu____5535
       else ());
      (match t0.FStar_Syntax_Syntax.n with
       | FStar_Syntax_Syntax.Tm_delayed uu____5541 ->
           let uu____5566 =
             let uu____5567 =
               FStar_All.pipe_left FStar_Range.string_of_range
                 t.FStar_Syntax_Syntax.pos
                in
             let uu____5568 = FStar_Syntax_Print.tag_of_term t0  in
             let uu____5569 = FStar_Syntax_Print.term_to_string t0  in
             let uu____5570 = FStar_Syntax_Print.term_to_string t  in
             FStar_Util.format4 "(%s) Impossible: %s\n%s\n%s\n" uu____5567
               uu____5568 uu____5569 uu____5570
              in
           failwith uu____5566
       | FStar_Syntax_Syntax.Tm_unknown  ->
           let uu____5575 =
             let uu____5576 =
               FStar_All.pipe_left FStar_Range.string_of_range
                 t.FStar_Syntax_Syntax.pos
                in
             let uu____5577 = FStar_Syntax_Print.tag_of_term t0  in
             let uu____5578 = FStar_Syntax_Print.term_to_string t0  in
             let uu____5579 = FStar_Syntax_Print.term_to_string t  in
             FStar_Util.format4 "(%s) Impossible: %s\n%s\n%s\n" uu____5576
               uu____5577 uu____5578 uu____5579
              in
           failwith uu____5575
       | FStar_Syntax_Syntax.Tm_lazy i ->
           let uu____5585 = FStar_Syntax_Util.unfold_lazy i  in
           encode_term uu____5585 env
       | FStar_Syntax_Syntax.Tm_bvar x ->
           let uu____5587 =
             let uu____5588 = FStar_Syntax_Print.bv_to_string x  in
             FStar_Util.format1 "Impossible: locally nameless; got %s"
               uu____5588
              in
           failwith uu____5587
       | FStar_Syntax_Syntax.Tm_ascribed (t1,(k,uu____5595),uu____5596) ->
           let uu____5645 =
             match k with
             | FStar_Util.Inl t2 -> FStar_Syntax_Util.is_unit t2
             | uu____5653 -> false  in
           if uu____5645
           then (FStar_SMTEncoding_Term.mk_Term_unit, [])
           else encode_term t1 env
       | FStar_Syntax_Syntax.Tm_meta
           ({ FStar_Syntax_Syntax.n = uu____5669;
              FStar_Syntax_Syntax.pos = uu____5670;
              FStar_Syntax_Syntax.vars = uu____5671;_},FStar_Syntax_Syntax.Meta_quoted
            (qt,uu____5673))
           ->
           let tv =
             let uu____5683 = FStar_Reflection_Basic.inspect qt  in
             FStar_Reflection_Embeddings.embed_term_view
               t.FStar_Syntax_Syntax.pos uu____5683
              in
           let t1 =
             let uu____5687 =
               let uu____5696 = FStar_Syntax_Syntax.as_arg tv  in
               [uu____5696]  in
             FStar_Syntax_Util.mk_app FStar_Reflection_Data.fstar_refl_pack
               uu____5687
              in
           encode_term t1 env
       | FStar_Syntax_Syntax.Tm_meta (t1,uu____5698) -> encode_term t1 env
       | FStar_Syntax_Syntax.Tm_name x ->
           let t1 = lookup_term_var env x  in (t1, [])
       | FStar_Syntax_Syntax.Tm_fvar v1 ->
           let uu____5708 =
             lookup_free_var env v1.FStar_Syntax_Syntax.fv_name  in
           (uu____5708, [])
       | FStar_Syntax_Syntax.Tm_type uu____5711 ->
           (FStar_SMTEncoding_Term.mk_Term_type, [])
       | FStar_Syntax_Syntax.Tm_uinst (t1,uu____5715) -> encode_term t1 env
       | FStar_Syntax_Syntax.Tm_constant c -> encode_const c env
       | FStar_Syntax_Syntax.Tm_arrow (binders,c) ->
           let module_name = env.current_module_name  in
           let uu____5740 = FStar_Syntax_Subst.open_comp binders c  in
           (match uu____5740 with
            | (binders1,res) ->
                let uu____5751 =
                  (env.encode_non_total_function_typ &&
                     (FStar_Syntax_Util.is_pure_or_ghost_comp res))
                    || (FStar_Syntax_Util.is_tot_or_gtot_comp res)
                   in
                if uu____5751
                then
                  let uu____5756 =
                    encode_binders FStar_Pervasives_Native.None binders1 env
                     in
                  (match uu____5756 with
                   | (vars,guards,env',decls,uu____5781) ->
                       let fsym =
                         let uu____5799 = varops.fresh "f"  in
                         (uu____5799, FStar_SMTEncoding_Term.Term_sort)  in
                       let f = FStar_SMTEncoding_Util.mkFreeV fsym  in
                       let app = mk_Apply f vars  in
                       let uu____5802 =
                         FStar_TypeChecker_Util.pure_or_ghost_pre_and_post
                           (let uu___111_5811 = env.tcenv  in
                            {
                              FStar_TypeChecker_Env.solver =
                                (uu___111_5811.FStar_TypeChecker_Env.solver);
                              FStar_TypeChecker_Env.range =
                                (uu___111_5811.FStar_TypeChecker_Env.range);
                              FStar_TypeChecker_Env.curmodule =
                                (uu___111_5811.FStar_TypeChecker_Env.curmodule);
                              FStar_TypeChecker_Env.gamma =
                                (uu___111_5811.FStar_TypeChecker_Env.gamma);
                              FStar_TypeChecker_Env.gamma_cache =
                                (uu___111_5811.FStar_TypeChecker_Env.gamma_cache);
                              FStar_TypeChecker_Env.modules =
                                (uu___111_5811.FStar_TypeChecker_Env.modules);
                              FStar_TypeChecker_Env.expected_typ =
                                (uu___111_5811.FStar_TypeChecker_Env.expected_typ);
                              FStar_TypeChecker_Env.sigtab =
                                (uu___111_5811.FStar_TypeChecker_Env.sigtab);
                              FStar_TypeChecker_Env.is_pattern =
                                (uu___111_5811.FStar_TypeChecker_Env.is_pattern);
                              FStar_TypeChecker_Env.instantiate_imp =
                                (uu___111_5811.FStar_TypeChecker_Env.instantiate_imp);
                              FStar_TypeChecker_Env.effects =
                                (uu___111_5811.FStar_TypeChecker_Env.effects);
                              FStar_TypeChecker_Env.generalize =
                                (uu___111_5811.FStar_TypeChecker_Env.generalize);
                              FStar_TypeChecker_Env.letrecs =
                                (uu___111_5811.FStar_TypeChecker_Env.letrecs);
                              FStar_TypeChecker_Env.top_level =
                                (uu___111_5811.FStar_TypeChecker_Env.top_level);
                              FStar_TypeChecker_Env.check_uvars =
                                (uu___111_5811.FStar_TypeChecker_Env.check_uvars);
                              FStar_TypeChecker_Env.use_eq =
                                (uu___111_5811.FStar_TypeChecker_Env.use_eq);
                              FStar_TypeChecker_Env.is_iface =
                                (uu___111_5811.FStar_TypeChecker_Env.is_iface);
                              FStar_TypeChecker_Env.admit =
                                (uu___111_5811.FStar_TypeChecker_Env.admit);
                              FStar_TypeChecker_Env.lax = true;
                              FStar_TypeChecker_Env.lax_universes =
                                (uu___111_5811.FStar_TypeChecker_Env.lax_universes);
                              FStar_TypeChecker_Env.failhard =
                                (uu___111_5811.FStar_TypeChecker_Env.failhard);
                              FStar_TypeChecker_Env.nosynth =
                                (uu___111_5811.FStar_TypeChecker_Env.nosynth);
                              FStar_TypeChecker_Env.tc_term =
                                (uu___111_5811.FStar_TypeChecker_Env.tc_term);
                              FStar_TypeChecker_Env.type_of =
                                (uu___111_5811.FStar_TypeChecker_Env.type_of);
                              FStar_TypeChecker_Env.universe_of =
                                (uu___111_5811.FStar_TypeChecker_Env.universe_of);
                              FStar_TypeChecker_Env.check_type_of =
                                (uu___111_5811.FStar_TypeChecker_Env.check_type_of);
                              FStar_TypeChecker_Env.use_bv_sorts =
                                (uu___111_5811.FStar_TypeChecker_Env.use_bv_sorts);
                              FStar_TypeChecker_Env.qtbl_name_and_index =
                                (uu___111_5811.FStar_TypeChecker_Env.qtbl_name_and_index);
                              FStar_TypeChecker_Env.proof_ns =
                                (uu___111_5811.FStar_TypeChecker_Env.proof_ns);
                              FStar_TypeChecker_Env.synth =
                                (uu___111_5811.FStar_TypeChecker_Env.synth);
                              FStar_TypeChecker_Env.is_native_tactic =
                                (uu___111_5811.FStar_TypeChecker_Env.is_native_tactic);
                              FStar_TypeChecker_Env.identifier_info =
                                (uu___111_5811.FStar_TypeChecker_Env.identifier_info);
                              FStar_TypeChecker_Env.tc_hooks =
                                (uu___111_5811.FStar_TypeChecker_Env.tc_hooks);
                              FStar_TypeChecker_Env.dsenv =
                                (uu___111_5811.FStar_TypeChecker_Env.dsenv);
                              FStar_TypeChecker_Env.dep_graph =
                                (uu___111_5811.FStar_TypeChecker_Env.dep_graph)
                            }) res
                          in
                       (match uu____5802 with
                        | (pre_opt,res_t) ->
                            let uu____5822 =
                              encode_term_pred FStar_Pervasives_Native.None
                                res_t env' app
                               in
                            (match uu____5822 with
                             | (res_pred,decls') ->
                                 let uu____5833 =
                                   match pre_opt with
                                   | FStar_Pervasives_Native.None  ->
                                       let uu____5846 =
                                         FStar_SMTEncoding_Util.mk_and_l
                                           guards
                                          in
                                       (uu____5846, [])
                                   | FStar_Pervasives_Native.Some pre ->
                                       let uu____5850 =
                                         encode_formula pre env'  in
                                       (match uu____5850 with
                                        | (guard,decls0) ->
                                            let uu____5863 =
                                              FStar_SMTEncoding_Util.mk_and_l
                                                (guard :: guards)
                                               in
                                            (uu____5863, decls0))
                                    in
                                 (match uu____5833 with
                                  | (guards1,guard_decls) ->
                                      let t_interp =
                                        let uu____5875 =
                                          let uu____5886 =
                                            FStar_SMTEncoding_Util.mkImp
                                              (guards1, res_pred)
                                             in
                                          ([[app]], vars, uu____5886)  in
                                        FStar_SMTEncoding_Util.mkForall
                                          uu____5875
                                         in
                                      let cvars =
                                        let uu____5904 =
                                          FStar_SMTEncoding_Term.free_variables
                                            t_interp
                                           in
                                        FStar_All.pipe_right uu____5904
                                          (FStar_List.filter
                                             (fun uu____5918  ->
                                                match uu____5918 with
                                                | (x,uu____5924) ->
                                                    x <>
                                                      (FStar_Pervasives_Native.fst
                                                         fsym)))
                                         in
                                      let tkey =
                                        FStar_SMTEncoding_Util.mkForall
                                          ([], (fsym :: cvars), t_interp)
                                         in
                                      let tkey_hash =
                                        FStar_SMTEncoding_Term.hash_of_term
                                          tkey
                                         in
                                      let uu____5943 =
                                        FStar_Util.smap_try_find env.cache
                                          tkey_hash
                                         in
                                      (match uu____5943 with
                                       | FStar_Pervasives_Native.Some
                                           cache_entry ->
                                           let uu____5951 =
                                             let uu____5952 =
                                               let uu____5959 =
                                                 FStar_All.pipe_right cvars
                                                   (FStar_List.map
                                                      FStar_SMTEncoding_Util.mkFreeV)
                                                  in
                                               ((cache_entry.cache_symbol_name),
                                                 uu____5959)
                                                in
                                             FStar_SMTEncoding_Util.mkApp
                                               uu____5952
                                              in
                                           (uu____5951,
                                             (FStar_List.append decls
                                                (FStar_List.append decls'
                                                   (FStar_List.append
                                                      guard_decls
                                                      (use_cache_entry
                                                         cache_entry)))))
                                       | FStar_Pervasives_Native.None  ->
                                           let tsym =
                                             let uu____5979 =
                                               let uu____5980 =
                                                 FStar_Util.digest_of_string
                                                   tkey_hash
                                                  in
                                               Prims.strcat "Tm_arrow_"
                                                 uu____5980
                                                in
                                             varops.mk_unique uu____5979  in
                                           let cvar_sorts =
                                             FStar_List.map
                                               FStar_Pervasives_Native.snd
                                               cvars
                                              in
                                           let caption =
                                             let uu____5991 =
                                               FStar_Options.log_queries ()
                                                in
                                             if uu____5991
                                             then
                                               let uu____5994 =
                                                 FStar_TypeChecker_Normalize.term_to_string
                                                   env.tcenv t0
                                                  in
                                               FStar_Pervasives_Native.Some
                                                 uu____5994
                                             else
                                               FStar_Pervasives_Native.None
                                              in
                                           let tdecl =
                                             FStar_SMTEncoding_Term.DeclFun
                                               (tsym, cvar_sorts,
                                                 FStar_SMTEncoding_Term.Term_sort,
                                                 caption)
                                              in
                                           let t1 =
                                             let uu____6002 =
                                               let uu____6009 =
                                                 FStar_List.map
                                                   FStar_SMTEncoding_Util.mkFreeV
                                                   cvars
                                                  in
                                               (tsym, uu____6009)  in
                                             FStar_SMTEncoding_Util.mkApp
                                               uu____6002
                                              in
                                           let t_has_kind =
                                             FStar_SMTEncoding_Term.mk_HasType
                                               t1
                                               FStar_SMTEncoding_Term.mk_Term_type
                                              in
                                           let k_assumption =
                                             let a_name =
                                               Prims.strcat "kinding_" tsym
                                                in
                                             let uu____6021 =
                                               let uu____6028 =
                                                 FStar_SMTEncoding_Util.mkForall
                                                   ([[t_has_kind]], cvars,
                                                     t_has_kind)
                                                  in
                                               (uu____6028,
                                                 (FStar_Pervasives_Native.Some
                                                    a_name), a_name)
                                                in
                                             FStar_SMTEncoding_Util.mkAssume
                                               uu____6021
                                              in
                                           let f_has_t =
                                             FStar_SMTEncoding_Term.mk_HasType
                                               f t1
                                              in
                                           let f_has_t_z =
                                             FStar_SMTEncoding_Term.mk_HasTypeZ
                                               f t1
                                              in
                                           let pre_typing =
                                             let a_name =
                                               Prims.strcat "pre_typing_"
                                                 tsym
                                                in
                                             let uu____6049 =
                                               let uu____6056 =
                                                 let uu____6057 =
                                                   let uu____6068 =
                                                     let uu____6069 =
                                                       let uu____6074 =
                                                         let uu____6075 =
                                                           FStar_SMTEncoding_Term.mk_PreType
                                                             f
                                                            in
                                                         FStar_SMTEncoding_Term.mk_tester
                                                           "Tm_arrow"
                                                           uu____6075
                                                          in
                                                       (f_has_t, uu____6074)
                                                        in
                                                     FStar_SMTEncoding_Util.mkImp
                                                       uu____6069
                                                      in
                                                   ([[f_has_t]], (fsym ::
                                                     cvars), uu____6068)
                                                    in
                                                 mkForall_fuel uu____6057  in
                                               (uu____6056,
                                                 (FStar_Pervasives_Native.Some
                                                    "pre-typing for functions"),
                                                 (Prims.strcat module_name
                                                    (Prims.strcat "_" a_name)))
                                                in
                                             FStar_SMTEncoding_Util.mkAssume
                                               uu____6049
                                              in
                                           let t_interp1 =
                                             let a_name =
                                               Prims.strcat "interpretation_"
                                                 tsym
                                                in
                                             let uu____6098 =
                                               let uu____6105 =
                                                 let uu____6106 =
                                                   let uu____6117 =
                                                     FStar_SMTEncoding_Util.mkIff
                                                       (f_has_t_z, t_interp)
                                                      in
                                                   ([[f_has_t_z]], (fsym ::
                                                     cvars), uu____6117)
                                                    in
                                                 FStar_SMTEncoding_Util.mkForall
                                                   uu____6106
                                                  in
                                               (uu____6105,
                                                 (FStar_Pervasives_Native.Some
                                                    a_name),
                                                 (Prims.strcat module_name
                                                    (Prims.strcat "_" a_name)))
                                                in
                                             FStar_SMTEncoding_Util.mkAssume
                                               uu____6098
                                              in
                                           let t_decls =
                                             FStar_List.append (tdecl ::
                                               decls)
                                               (FStar_List.append decls'
                                                  (FStar_List.append
                                                     guard_decls
                                                     [k_assumption;
                                                     pre_typing;
                                                     t_interp1]))
                                              in
                                           ((let uu____6142 =
                                               mk_cache_entry env tsym
                                                 cvar_sorts t_decls
                                                in
                                             FStar_Util.smap_add env.cache
                                               tkey_hash uu____6142);
                                            (t1, t_decls)))))))
                else
                  (let tsym = varops.fresh "Non_total_Tm_arrow"  in
                   let tdecl =
                     FStar_SMTEncoding_Term.DeclFun
                       (tsym, [], FStar_SMTEncoding_Term.Term_sort,
                         FStar_Pervasives_Native.None)
                      in
                   let t1 = FStar_SMTEncoding_Util.mkApp (tsym, [])  in
                   let t_kinding =
                     let a_name =
                       Prims.strcat "non_total_function_typing_" tsym  in
                     let uu____6157 =
                       let uu____6164 =
                         FStar_SMTEncoding_Term.mk_HasType t1
                           FStar_SMTEncoding_Term.mk_Term_type
                          in
                       (uu____6164,
                         (FStar_Pervasives_Native.Some
                            "Typing for non-total arrows"),
                         (Prims.strcat module_name (Prims.strcat "_" a_name)))
                        in
                     FStar_SMTEncoding_Util.mkAssume uu____6157  in
                   let fsym = ("f", FStar_SMTEncoding_Term.Term_sort)  in
                   let f = FStar_SMTEncoding_Util.mkFreeV fsym  in
                   let f_has_t = FStar_SMTEncoding_Term.mk_HasType f t1  in
                   let t_interp =
                     let a_name = Prims.strcat "pre_typing_" tsym  in
                     let uu____6176 =
                       let uu____6183 =
                         let uu____6184 =
                           let uu____6195 =
                             let uu____6196 =
                               let uu____6201 =
                                 let uu____6202 =
                                   FStar_SMTEncoding_Term.mk_PreType f  in
                                 FStar_SMTEncoding_Term.mk_tester "Tm_arrow"
                                   uu____6202
                                  in
                               (f_has_t, uu____6201)  in
                             FStar_SMTEncoding_Util.mkImp uu____6196  in
                           ([[f_has_t]], [fsym], uu____6195)  in
                         mkForall_fuel uu____6184  in
                       (uu____6183, (FStar_Pervasives_Native.Some a_name),
                         (Prims.strcat module_name (Prims.strcat "_" a_name)))
                        in
                     FStar_SMTEncoding_Util.mkAssume uu____6176  in
                   (t1, [tdecl; t_kinding; t_interp])))
       | FStar_Syntax_Syntax.Tm_refine uu____6229 ->
           let uu____6236 =
             let uu____6241 =
               FStar_TypeChecker_Normalize.normalize_refinement
                 [FStar_TypeChecker_Normalize.Weak;
                 FStar_TypeChecker_Normalize.HNF;
                 FStar_TypeChecker_Normalize.EraseUniverses] env.tcenv t0
                in
             match uu____6241 with
             | { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_refine (x,f);
                 FStar_Syntax_Syntax.pos = uu____6248;
                 FStar_Syntax_Syntax.vars = uu____6249;_} ->
                 let uu____6256 =
                   FStar_Syntax_Subst.open_term
                     [(x, FStar_Pervasives_Native.None)] f
                    in
                 (match uu____6256 with
                  | (b,f1) ->
                      let uu____6281 =
                        let uu____6282 = FStar_List.hd b  in
                        FStar_Pervasives_Native.fst uu____6282  in
                      (uu____6281, f1))
             | uu____6291 -> failwith "impossible"  in
           (match uu____6236 with
            | (x,f) ->
                let uu____6302 = encode_term x.FStar_Syntax_Syntax.sort env
                   in
                (match uu____6302 with
                 | (base_t,decls) ->
                     let uu____6313 = gen_term_var env x  in
                     (match uu____6313 with
                      | (x1,xtm,env') ->
                          let uu____6327 = encode_formula f env'  in
                          (match uu____6327 with
                           | (refinement,decls') ->
                               let uu____6338 =
                                 fresh_fvar "f"
                                   FStar_SMTEncoding_Term.Fuel_sort
                                  in
                               (match uu____6338 with
                                | (fsym,fterm) ->
                                    let tm_has_type_with_fuel =
                                      FStar_SMTEncoding_Term.mk_HasTypeWithFuel
                                        (FStar_Pervasives_Native.Some fterm)
                                        xtm base_t
                                       in
                                    let encoding =
                                      FStar_SMTEncoding_Util.mkAnd
                                        (tm_has_type_with_fuel, refinement)
                                       in
                                    let cvars =
                                      let uu____6354 =
                                        let uu____6357 =
                                          FStar_SMTEncoding_Term.free_variables
                                            refinement
                                           in
                                        let uu____6364 =
                                          FStar_SMTEncoding_Term.free_variables
                                            tm_has_type_with_fuel
                                           in
                                        FStar_List.append uu____6357
                                          uu____6364
                                         in
                                      FStar_Util.remove_dups
                                        FStar_SMTEncoding_Term.fv_eq
                                        uu____6354
                                       in
                                    let cvars1 =
                                      FStar_All.pipe_right cvars
                                        (FStar_List.filter
                                           (fun uu____6397  ->
                                              match uu____6397 with
                                              | (y,uu____6403) ->
                                                  (y <> x1) && (y <> fsym)))
                                       in
                                    let xfv =
                                      (x1, FStar_SMTEncoding_Term.Term_sort)
                                       in
                                    let ffv =
                                      (fsym,
                                        FStar_SMTEncoding_Term.Fuel_sort)
                                       in
                                    let tkey =
                                      FStar_SMTEncoding_Util.mkForall
                                        ([], (ffv :: xfv :: cvars1),
                                          encoding)
                                       in
                                    let tkey_hash =
                                      FStar_SMTEncoding_Term.hash_of_term
                                        tkey
                                       in
                                    let uu____6436 =
                                      FStar_Util.smap_try_find env.cache
                                        tkey_hash
                                       in
                                    (match uu____6436 with
                                     | FStar_Pervasives_Native.Some
                                         cache_entry ->
                                         let uu____6444 =
                                           let uu____6445 =
                                             let uu____6452 =
                                               FStar_All.pipe_right cvars1
                                                 (FStar_List.map
                                                    FStar_SMTEncoding_Util.mkFreeV)
                                                in
                                             ((cache_entry.cache_symbol_name),
                                               uu____6452)
                                              in
                                           FStar_SMTEncoding_Util.mkApp
                                             uu____6445
                                            in
                                         (uu____6444,
                                           (FStar_List.append decls
                                              (FStar_List.append decls'
                                                 (use_cache_entry cache_entry))))
                                     | FStar_Pervasives_Native.None  ->
                                         let module_name =
                                           env.current_module_name  in
                                         let tsym =
                                           let uu____6473 =
                                             let uu____6474 =
                                               let uu____6475 =
                                                 FStar_Util.digest_of_string
                                                   tkey_hash
                                                  in
                                               Prims.strcat "_Tm_refine_"
                                                 uu____6475
                                                in
                                             Prims.strcat module_name
                                               uu____6474
                                              in
                                           varops.mk_unique uu____6473  in
                                         let cvar_sorts =
                                           FStar_List.map
                                             FStar_Pervasives_Native.snd
                                             cvars1
                                            in
                                         let tdecl =
                                           FStar_SMTEncoding_Term.DeclFun
                                             (tsym, cvar_sorts,
                                               FStar_SMTEncoding_Term.Term_sort,
                                               FStar_Pervasives_Native.None)
                                            in
                                         let t1 =
                                           let uu____6489 =
                                             let uu____6496 =
                                               FStar_List.map
                                                 FStar_SMTEncoding_Util.mkFreeV
                                                 cvars1
                                                in
                                             (tsym, uu____6496)  in
                                           FStar_SMTEncoding_Util.mkApp
                                             uu____6489
                                            in
                                         let x_has_base_t =
                                           FStar_SMTEncoding_Term.mk_HasType
                                             xtm base_t
                                            in
                                         let x_has_t =
                                           FStar_SMTEncoding_Term.mk_HasTypeWithFuel
                                             (FStar_Pervasives_Native.Some
                                                fterm) xtm t1
                                            in
                                         let t_has_kind =
                                           FStar_SMTEncoding_Term.mk_HasType
                                             t1
                                             FStar_SMTEncoding_Term.mk_Term_type
                                            in
                                         let t_haseq_base =
                                           FStar_SMTEncoding_Term.mk_haseq
                                             base_t
                                            in
                                         let t_haseq_ref =
                                           FStar_SMTEncoding_Term.mk_haseq t1
                                            in
                                         let t_haseq1 =
                                           let uu____6511 =
                                             let uu____6518 =
                                               let uu____6519 =
                                                 let uu____6530 =
                                                   FStar_SMTEncoding_Util.mkIff
                                                     (t_haseq_ref,
                                                       t_haseq_base)
                                                    in
                                                 ([[t_haseq_ref]], cvars1,
                                                   uu____6530)
                                                  in
                                               FStar_SMTEncoding_Util.mkForall
                                                 uu____6519
                                                in
                                             (uu____6518,
                                               (FStar_Pervasives_Native.Some
                                                  (Prims.strcat "haseq for "
                                                     tsym)),
                                               (Prims.strcat "haseq" tsym))
                                              in
                                           FStar_SMTEncoding_Util.mkAssume
                                             uu____6511
                                            in
                                         let t_kinding =
                                           let uu____6548 =
                                             let uu____6555 =
                                               FStar_SMTEncoding_Util.mkForall
                                                 ([[t_has_kind]], cvars1,
                                                   t_has_kind)
                                                in
                                             (uu____6555,
                                               (FStar_Pervasives_Native.Some
                                                  "refinement kinding"),
                                               (Prims.strcat
                                                  "refinement_kinding_" tsym))
                                              in
                                           FStar_SMTEncoding_Util.mkAssume
                                             uu____6548
                                            in
                                         let t_interp =
                                           let uu____6573 =
                                             let uu____6580 =
                                               let uu____6581 =
                                                 let uu____6592 =
                                                   FStar_SMTEncoding_Util.mkIff
                                                     (x_has_t, encoding)
                                                    in
                                                 ([[x_has_t]], (ffv :: xfv ::
                                                   cvars1), uu____6592)
                                                  in
                                               FStar_SMTEncoding_Util.mkForall
                                                 uu____6581
                                                in
                                             let uu____6615 =
                                               let uu____6618 =
                                                 FStar_Syntax_Print.term_to_string
                                                   t0
                                                  in
                                               FStar_Pervasives_Native.Some
                                                 uu____6618
                                                in
                                             (uu____6580, uu____6615,
                                               (Prims.strcat
                                                  "refinement_interpretation_"
                                                  tsym))
                                              in
                                           FStar_SMTEncoding_Util.mkAssume
                                             uu____6573
                                            in
                                         let t_decls =
                                           FStar_List.append decls
                                             (FStar_List.append decls'
                                                [tdecl;
                                                t_kinding;
                                                t_interp;
                                                t_haseq1])
                                            in
                                         ((let uu____6625 =
                                             mk_cache_entry env tsym
                                               cvar_sorts t_decls
                                              in
                                           FStar_Util.smap_add env.cache
                                             tkey_hash uu____6625);
                                          (t1, t_decls))))))))
       | FStar_Syntax_Syntax.Tm_uvar (uv,k) ->
           let ttm =
             let uu____6655 = FStar_Syntax_Unionfind.uvar_id uv  in
             FStar_SMTEncoding_Util.mk_Term_uvar uu____6655  in
           let uu____6656 =
             encode_term_pred FStar_Pervasives_Native.None k env ttm  in
           (match uu____6656 with
            | (t_has_k,decls) ->
                let d =
                  let uu____6668 =
                    let uu____6675 =
                      let uu____6676 =
                        let uu____6677 =
                          let uu____6678 = FStar_Syntax_Unionfind.uvar_id uv
                             in
                          FStar_All.pipe_left FStar_Util.string_of_int
                            uu____6678
                           in
                        FStar_Util.format1 "uvar_typing_%s" uu____6677  in
                      varops.mk_unique uu____6676  in
                    (t_has_k, (FStar_Pervasives_Native.Some "Uvar typing"),
                      uu____6675)
                     in
                  FStar_SMTEncoding_Util.mkAssume uu____6668  in
                (ttm, (FStar_List.append decls [d])))
       | FStar_Syntax_Syntax.Tm_app uu____6683 ->
           let uu____6698 = FStar_Syntax_Util.head_and_args t0  in
           (match uu____6698 with
            | (head1,args_e) ->
                let uu____6739 =
                  let uu____6752 =
                    let uu____6753 = FStar_Syntax_Subst.compress head1  in
                    uu____6753.FStar_Syntax_Syntax.n  in
                  (uu____6752, args_e)  in
                (match uu____6739 with
                 | uu____6768 when head_redex env head1 ->
                     let uu____6781 = whnf env t  in
                     encode_term uu____6781 env
                 | uu____6782 when is_arithmetic_primitive head1 args_e ->
                     encode_arith_term env head1 args_e
                 | uu____6801 when is_BitVector_primitive head1 args_e ->
                     encode_BitVector_term env head1 args_e
                 | (FStar_Syntax_Syntax.Tm_uinst
                    ({
                       FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
                       FStar_Syntax_Syntax.pos = uu____6815;
                       FStar_Syntax_Syntax.vars = uu____6816;_},uu____6817),uu____6818::
                    (v1,uu____6820)::(v2,uu____6822)::[]) when
                     FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Parser_Const.lexcons_lid
                     ->
                     let uu____6873 = encode_term v1 env  in
                     (match uu____6873 with
                      | (v11,decls1) ->
                          let uu____6884 = encode_term v2 env  in
                          (match uu____6884 with
                           | (v21,decls2) ->
                               let uu____6895 =
                                 FStar_SMTEncoding_Util.mk_LexCons v11 v21
                                  in
                               (uu____6895,
                                 (FStar_List.append decls1 decls2))))
                 | (FStar_Syntax_Syntax.Tm_fvar
                    fv,uu____6899::(v1,uu____6901)::(v2,uu____6903)::[]) when
                     FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Parser_Const.lexcons_lid
                     ->
                     let uu____6950 = encode_term v1 env  in
                     (match uu____6950 with
                      | (v11,decls1) ->
                          let uu____6961 = encode_term v2 env  in
                          (match uu____6961 with
                           | (v21,decls2) ->
                               let uu____6972 =
                                 FStar_SMTEncoding_Util.mk_LexCons v11 v21
                                  in
                               (uu____6972,
                                 (FStar_List.append decls1 decls2))))
                 | (FStar_Syntax_Syntax.Tm_constant
                    (FStar_Const.Const_range_of ),(arg,uu____6976)::[]) ->
                     encode_const
                       (FStar_Const.Const_range (arg.FStar_Syntax_Syntax.pos))
                       env
                 | (FStar_Syntax_Syntax.Tm_constant
                    (FStar_Const.Const_set_range_of
                    ),(arg,uu____7002)::(rng,uu____7004)::[]) ->
                     encode_term arg env
                 | (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify
                    ),uu____7039) ->
                     let e0 =
                       let uu____7057 = FStar_List.hd args_e  in
                       FStar_TypeChecker_Util.reify_body_with_arg env.tcenv
                         head1 uu____7057
                        in
                     ((let uu____7065 =
                         FStar_All.pipe_left
                           (FStar_TypeChecker_Env.debug env.tcenv)
                           (FStar_Options.Other "SMTEncodingReify")
                          in
                       if uu____7065
                       then
                         let uu____7066 =
                           FStar_Syntax_Print.term_to_string e0  in
                         FStar_Util.print1 "Result of normalization %s\n"
                           uu____7066
                       else ());
                      (let e =
                         let uu____7071 =
                           let uu____7072 =
                             FStar_TypeChecker_Util.remove_reify e0  in
                           let uu____7073 = FStar_List.tl args_e  in
                           FStar_Syntax_Syntax.mk_Tm_app uu____7072
                             uu____7073
                            in
                         uu____7071 FStar_Pervasives_Native.None
                           t0.FStar_Syntax_Syntax.pos
                          in
                       encode_term e env))
                 | (FStar_Syntax_Syntax.Tm_constant
                    (FStar_Const.Const_reflect
                    uu____7082),(arg,uu____7084)::[]) -> encode_term arg env
                 | uu____7109 ->
                     let uu____7122 = encode_args args_e env  in
                     (match uu____7122 with
                      | (args,decls) ->
                          let encode_partial_app ht_opt =
                            let uu____7177 = encode_term head1 env  in
                            match uu____7177 with
                            | (head2,decls') ->
                                let app_tm = mk_Apply_args head2 args  in
                                (match ht_opt with
                                 | FStar_Pervasives_Native.None  ->
                                     (app_tm,
                                       (FStar_List.append decls decls'))
                                 | FStar_Pervasives_Native.Some (formals,c)
                                     ->
                                     let uu____7241 =
                                       FStar_Util.first_N
                                         (FStar_List.length args_e) formals
                                        in
                                     (match uu____7241 with
                                      | (formals1,rest) ->
                                          let subst1 =
                                            FStar_List.map2
                                              (fun uu____7319  ->
                                                 fun uu____7320  ->
                                                   match (uu____7319,
                                                           uu____7320)
                                                   with
                                                   | ((bv,uu____7342),
                                                      (a,uu____7344)) ->
                                                       FStar_Syntax_Syntax.NT
                                                         (bv, a)) formals1
                                              args_e
                                             in
                                          let ty =
                                            let uu____7362 =
                                              FStar_Syntax_Util.arrow rest c
                                               in
                                            FStar_All.pipe_right uu____7362
                                              (FStar_Syntax_Subst.subst
                                                 subst1)
                                             in
                                          let uu____7367 =
                                            encode_term_pred
                                              FStar_Pervasives_Native.None ty
                                              env app_tm
                                             in
                                          (match uu____7367 with
                                           | (has_type,decls'') ->
                                               let cvars =
                                                 FStar_SMTEncoding_Term.free_variables
                                                   has_type
                                                  in
                                               let e_typing =
                                                 let uu____7382 =
                                                   let uu____7389 =
                                                     FStar_SMTEncoding_Util.mkForall
                                                       ([[has_type]], cvars,
                                                         has_type)
                                                      in
                                                   let uu____7398 =
                                                     let uu____7399 =
                                                       let uu____7400 =
                                                         let uu____7401 =
                                                           FStar_SMTEncoding_Term.hash_of_term
                                                             app_tm
                                                            in
                                                         FStar_Util.digest_of_string
                                                           uu____7401
                                                          in
                                                       Prims.strcat
                                                         "partial_app_typing_"
                                                         uu____7400
                                                        in
                                                     varops.mk_unique
                                                       uu____7399
                                                      in
                                                   (uu____7389,
                                                     (FStar_Pervasives_Native.Some
                                                        "Partial app typing"),
                                                     uu____7398)
                                                    in
                                                 FStar_SMTEncoding_Util.mkAssume
                                                   uu____7382
                                                  in
                                               (app_tm,
                                                 (FStar_List.append decls
                                                    (FStar_List.append decls'
                                                       (FStar_List.append
                                                          decls'' [e_typing])))))))
                             in
                          let encode_full_app fv =
                            let uu____7418 = lookup_free_var_sym env fv  in
                            match uu____7418 with
                            | (fname,fuel_args,arity) ->
                                let tm =
                                  maybe_curry_app t0.FStar_Syntax_Syntax.pos
                                    fname arity
                                    (FStar_List.append fuel_args args)
                                   in
                                (tm, decls)
                             in
                          let head2 = FStar_Syntax_Subst.compress head1  in
                          let head_type =
                            match head2.FStar_Syntax_Syntax.n with
                            | FStar_Syntax_Syntax.Tm_uinst
                                ({
                                   FStar_Syntax_Syntax.n =
                                     FStar_Syntax_Syntax.Tm_name x;
                                   FStar_Syntax_Syntax.pos = uu____7450;
                                   FStar_Syntax_Syntax.vars = uu____7451;_},uu____7452)
                                ->
                                FStar_Pervasives_Native.Some
                                  (x.FStar_Syntax_Syntax.sort)
                            | FStar_Syntax_Syntax.Tm_name x ->
                                FStar_Pervasives_Native.Some
                                  (x.FStar_Syntax_Syntax.sort)
                            | FStar_Syntax_Syntax.Tm_uinst
                                ({
                                   FStar_Syntax_Syntax.n =
                                     FStar_Syntax_Syntax.Tm_fvar fv;
                                   FStar_Syntax_Syntax.pos = uu____7463;
                                   FStar_Syntax_Syntax.vars = uu____7464;_},uu____7465)
                                ->
                                let uu____7470 =
                                  let uu____7471 =
                                    let uu____7476 =
                                      FStar_TypeChecker_Env.lookup_lid
                                        env.tcenv
                                        (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                                       in
                                    FStar_All.pipe_right uu____7476
                                      FStar_Pervasives_Native.fst
                                     in
                                  FStar_All.pipe_right uu____7471
                                    FStar_Pervasives_Native.snd
                                   in
                                FStar_Pervasives_Native.Some uu____7470
                            | FStar_Syntax_Syntax.Tm_fvar fv ->
                                let uu____7506 =
                                  let uu____7507 =
                                    let uu____7512 =
                                      FStar_TypeChecker_Env.lookup_lid
                                        env.tcenv
                                        (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                                       in
                                    FStar_All.pipe_right uu____7512
                                      FStar_Pervasives_Native.fst
                                     in
                                  FStar_All.pipe_right uu____7507
                                    FStar_Pervasives_Native.snd
                                   in
                                FStar_Pervasives_Native.Some uu____7506
                            | FStar_Syntax_Syntax.Tm_ascribed
                                (uu____7541,(FStar_Util.Inl t1,uu____7543),uu____7544)
                                -> FStar_Pervasives_Native.Some t1
                            | FStar_Syntax_Syntax.Tm_ascribed
                                (uu____7593,(FStar_Util.Inr c,uu____7595),uu____7596)
                                ->
                                FStar_Pervasives_Native.Some
                                  (FStar_Syntax_Util.comp_result c)
                            | uu____7645 -> FStar_Pervasives_Native.None  in
                          (match head_type with
                           | FStar_Pervasives_Native.None  ->
                               encode_partial_app
                                 FStar_Pervasives_Native.None
                           | FStar_Pervasives_Native.Some head_type1 ->
                               let head_type2 =
                                 let uu____7672 =
                                   FStar_TypeChecker_Normalize.normalize_refinement
                                     [FStar_TypeChecker_Normalize.Weak;
                                     FStar_TypeChecker_Normalize.HNF;
                                     FStar_TypeChecker_Normalize.EraseUniverses]
                                     env.tcenv head_type1
                                    in
                                 FStar_All.pipe_left
                                   FStar_Syntax_Util.unrefine uu____7672
                                  in
                               let uu____7673 =
                                 curried_arrow_formals_comp head_type2  in
                               (match uu____7673 with
                                | (formals,c) ->
                                    (match head2.FStar_Syntax_Syntax.n with
                                     | FStar_Syntax_Syntax.Tm_uinst
                                         ({
                                            FStar_Syntax_Syntax.n =
                                              FStar_Syntax_Syntax.Tm_fvar fv;
                                            FStar_Syntax_Syntax.pos =
                                              uu____7689;
                                            FStar_Syntax_Syntax.vars =
                                              uu____7690;_},uu____7691)
                                         when
                                         (FStar_List.length formals) =
                                           (FStar_List.length args)
                                         ->
                                         encode_full_app
                                           fv.FStar_Syntax_Syntax.fv_name
                                     | FStar_Syntax_Syntax.Tm_fvar fv when
                                         (FStar_List.length formals) =
                                           (FStar_List.length args)
                                         ->
                                         encode_full_app
                                           fv.FStar_Syntax_Syntax.fv_name
                                     | uu____7705 ->
                                         if
                                           (FStar_List.length formals) >
                                             (FStar_List.length args)
                                         then
                                           encode_partial_app
                                             (FStar_Pervasives_Native.Some
                                                (formals, c))
                                         else
                                           encode_partial_app
                                             FStar_Pervasives_Native.None))))))
       | FStar_Syntax_Syntax.Tm_abs (bs,body,lopt) ->
           let uu____7754 = FStar_Syntax_Subst.open_term' bs body  in
           (match uu____7754 with
            | (bs1,body1,opening) ->
                let fallback uu____7777 =
                  let f = varops.fresh "Tm_abs"  in
                  let decl =
                    FStar_SMTEncoding_Term.DeclFun
                      (f, [], FStar_SMTEncoding_Term.Term_sort,
                        (FStar_Pervasives_Native.Some
                           "Imprecise function encoding"))
                     in
                  let uu____7784 =
                    FStar_SMTEncoding_Util.mkFreeV
                      (f, FStar_SMTEncoding_Term.Term_sort)
                     in
                  (uu____7784, [decl])  in
                let is_impure rc =
                  let uu____7791 =
                    FStar_TypeChecker_Util.is_pure_or_ghost_effect env.tcenv
                      rc.FStar_Syntax_Syntax.residual_effect
                     in
                  FStar_All.pipe_right uu____7791 Prims.op_Negation  in
                let codomain_eff rc =
                  let res_typ =
                    match rc.FStar_Syntax_Syntax.residual_typ with
                    | FStar_Pervasives_Native.None  ->
                        let uu____7801 =
                          FStar_TypeChecker_Rel.new_uvar
                            FStar_Range.dummyRange []
                            FStar_Syntax_Util.ktype0
                           in
                        FStar_All.pipe_right uu____7801
                          FStar_Pervasives_Native.fst
                    | FStar_Pervasives_Native.Some t1 -> t1  in
                  if
                    FStar_Ident.lid_equals
                      rc.FStar_Syntax_Syntax.residual_effect
                      FStar_Parser_Const.effect_Tot_lid
                  then
                    let uu____7821 = FStar_Syntax_Syntax.mk_Total res_typ  in
                    FStar_Pervasives_Native.Some uu____7821
                  else
                    if
                      FStar_Ident.lid_equals
                        rc.FStar_Syntax_Syntax.residual_effect
                        FStar_Parser_Const.effect_GTot_lid
                    then
                      (let uu____7825 = FStar_Syntax_Syntax.mk_GTotal res_typ
                          in
                       FStar_Pervasives_Native.Some uu____7825)
                    else FStar_Pervasives_Native.None
                   in
                (match lopt with
                 | FStar_Pervasives_Native.None  ->
                     ((let uu____7832 =
                         let uu____7837 =
                           let uu____7838 =
                             FStar_Syntax_Print.term_to_string t0  in
                           FStar_Util.format1
                             "Losing precision when encoding a function literal: %s\n(Unnannotated abstraction in the compiler ?)"
                             uu____7838
                            in
                         (FStar_Errors.Warning_FunctionLiteralPrecisionLoss,
                           uu____7837)
                          in
                       FStar_Errors.log_issue t0.FStar_Syntax_Syntax.pos
                         uu____7832);
                      fallback ())
                 | FStar_Pervasives_Native.Some rc ->
                     let uu____7840 =
                       (is_impure rc) &&
                         (let uu____7842 =
                            FStar_TypeChecker_Env.is_reifiable env.tcenv rc
                             in
                          Prims.op_Negation uu____7842)
                        in
                     if uu____7840
                     then fallback ()
                     else
                       (let cache_size = FStar_Util.smap_size env.cache  in
                        let uu____7849 =
                          encode_binders FStar_Pervasives_Native.None bs1 env
                           in
                        match uu____7849 with
                        | (vars,guards,envbody,decls,uu____7874) ->
                            let body2 =
                              let uu____7888 =
                                FStar_TypeChecker_Env.is_reifiable env.tcenv
                                  rc
                                 in
                              if uu____7888
                              then
                                FStar_TypeChecker_Util.reify_body env.tcenv
                                  body1
                              else body1  in
                            let uu____7890 = encode_term body2 envbody  in
                            (match uu____7890 with
                             | (body3,decls') ->
                                 let uu____7901 =
                                   let uu____7910 = codomain_eff rc  in
                                   match uu____7910 with
                                   | FStar_Pervasives_Native.None  ->
                                       (FStar_Pervasives_Native.None, [])
                                   | FStar_Pervasives_Native.Some c ->
                                       let tfun =
                                         FStar_Syntax_Util.arrow bs1 c  in
                                       let uu____7929 = encode_term tfun env
                                          in
                                       (match uu____7929 with
                                        | (t1,decls1) ->
                                            ((FStar_Pervasives_Native.Some t1),
                                              decls1))
                                    in
                                 (match uu____7901 with
                                  | (arrow_t_opt,decls'') ->
                                      let key_body =
                                        let uu____7961 =
                                          let uu____7972 =
                                            let uu____7973 =
                                              let uu____7978 =
                                                FStar_SMTEncoding_Util.mk_and_l
                                                  guards
                                                 in
                                              (uu____7978, body3)  in
                                            FStar_SMTEncoding_Util.mkImp
                                              uu____7973
                                             in
                                          ([], vars, uu____7972)  in
                                        FStar_SMTEncoding_Util.mkForall
                                          uu____7961
                                         in
                                      let cvars =
                                        FStar_SMTEncoding_Term.free_variables
                                          key_body
                                         in
                                      let cvars1 =
                                        match arrow_t_opt with
                                        | FStar_Pervasives_Native.None  ->
                                            cvars
                                        | FStar_Pervasives_Native.Some t1 ->
                                            let uu____7990 =
                                              let uu____7993 =
                                                FStar_SMTEncoding_Term.free_variables
                                                  t1
                                                 in
                                              FStar_List.append uu____7993
                                                cvars
                                               in
                                            FStar_Util.remove_dups
                                              FStar_SMTEncoding_Term.fv_eq
                                              uu____7990
                                         in
                                      let tkey =
                                        FStar_SMTEncoding_Util.mkForall
                                          ([], cvars1, key_body)
                                         in
                                      let tkey_hash =
                                        FStar_SMTEncoding_Term.hash_of_term
                                          tkey
                                         in
                                      let uu____8012 =
                                        FStar_Util.smap_try_find env.cache
                                          tkey_hash
                                         in
                                      (match uu____8012 with
                                       | FStar_Pervasives_Native.Some
                                           cache_entry ->
                                           let uu____8020 =
                                             let uu____8021 =
                                               let uu____8028 =
                                                 FStar_List.map
                                                   FStar_SMTEncoding_Util.mkFreeV
                                                   cvars1
                                                  in
                                               ((cache_entry.cache_symbol_name),
                                                 uu____8028)
                                                in
                                             FStar_SMTEncoding_Util.mkApp
                                               uu____8021
                                              in
                                           (uu____8020,
                                             (FStar_List.append decls
                                                (FStar_List.append decls'
                                                   (FStar_List.append decls''
                                                      (use_cache_entry
                                                         cache_entry)))))
                                       | FStar_Pervasives_Native.None  ->
                                           let uu____8039 =
                                             is_an_eta_expansion env vars
                                               body3
                                              in
                                           (match uu____8039 with
                                            | FStar_Pervasives_Native.Some t1
                                                ->
                                                let decls1 =
                                                  let uu____8050 =
                                                    let uu____8051 =
                                                      FStar_Util.smap_size
                                                        env.cache
                                                       in
                                                    uu____8051 = cache_size
                                                     in
                                                  if uu____8050
                                                  then []
                                                  else
                                                    FStar_List.append decls
                                                      (FStar_List.append
                                                         decls' decls'')
                                                   in
                                                (t1, decls1)
                                            | FStar_Pervasives_Native.None 
                                                ->
                                                let cvar_sorts =
                                                  FStar_List.map
                                                    FStar_Pervasives_Native.snd
                                                    cvars1
                                                   in
                                                let fsym =
                                                  let module_name =
                                                    env.current_module_name
                                                     in
                                                  let fsym =
                                                    let uu____8067 =
                                                      let uu____8068 =
                                                        FStar_Util.digest_of_string
                                                          tkey_hash
                                                         in
                                                      Prims.strcat "Tm_abs_"
                                                        uu____8068
                                                       in
                                                    varops.mk_unique
                                                      uu____8067
                                                     in
                                                  Prims.strcat module_name
                                                    (Prims.strcat "_" fsym)
                                                   in
                                                let fdecl =
                                                  FStar_SMTEncoding_Term.DeclFun
                                                    (fsym, cvar_sorts,
                                                      FStar_SMTEncoding_Term.Term_sort,
                                                      FStar_Pervasives_Native.None)
                                                   in
                                                let f =
                                                  let uu____8075 =
                                                    let uu____8082 =
                                                      FStar_List.map
                                                        FStar_SMTEncoding_Util.mkFreeV
                                                        cvars1
                                                       in
                                                    (fsym, uu____8082)  in
                                                  FStar_SMTEncoding_Util.mkApp
                                                    uu____8075
                                                   in
                                                let app = mk_Apply f vars  in
                                                let typing_f =
                                                  match arrow_t_opt with
                                                  | FStar_Pervasives_Native.None
                                                       -> []
                                                  | FStar_Pervasives_Native.Some
                                                      t1 ->
                                                      let f_has_t =
                                                        FStar_SMTEncoding_Term.mk_HasTypeWithFuel
                                                          FStar_Pervasives_Native.None
                                                          f t1
                                                         in
                                                      let a_name =
                                                        Prims.strcat
                                                          "typing_" fsym
                                                         in
                                                      let uu____8100 =
                                                        let uu____8101 =
                                                          let uu____8108 =
                                                            FStar_SMTEncoding_Util.mkForall
                                                              ([[f]], cvars1,
                                                                f_has_t)
                                                             in
                                                          (uu____8108,
                                                            (FStar_Pervasives_Native.Some
                                                               a_name),
                                                            a_name)
                                                           in
                                                        FStar_SMTEncoding_Util.mkAssume
                                                          uu____8101
                                                         in
                                                      [uu____8100]
                                                   in
                                                let interp_f =
                                                  let a_name =
                                                    Prims.strcat
                                                      "interpretation_" fsym
                                                     in
                                                  let uu____8121 =
                                                    let uu____8128 =
                                                      let uu____8129 =
                                                        let uu____8140 =
                                                          FStar_SMTEncoding_Util.mkEq
                                                            (app, body3)
                                                           in
                                                        ([[app]],
                                                          (FStar_List.append
                                                             vars cvars1),
                                                          uu____8140)
                                                         in
                                                      FStar_SMTEncoding_Util.mkForall
                                                        uu____8129
                                                       in
                                                    (uu____8128,
                                                      (FStar_Pervasives_Native.Some
                                                         a_name), a_name)
                                                     in
                                                  FStar_SMTEncoding_Util.mkAssume
                                                    uu____8121
                                                   in
                                                let f_decls =
                                                  FStar_List.append decls
                                                    (FStar_List.append decls'
                                                       (FStar_List.append
                                                          decls''
                                                          (FStar_List.append
                                                             (fdecl ::
                                                             typing_f)
                                                             [interp_f])))
                                                   in
                                                ((let uu____8157 =
                                                    mk_cache_entry env fsym
                                                      cvar_sorts f_decls
                                                     in
                                                  FStar_Util.smap_add
                                                    env.cache tkey_hash
                                                    uu____8157);
                                                 (f, f_decls)))))))))
       | FStar_Syntax_Syntax.Tm_let
           ((uu____8160,{
                          FStar_Syntax_Syntax.lbname = FStar_Util.Inr
                            uu____8161;
                          FStar_Syntax_Syntax.lbunivs = uu____8162;
                          FStar_Syntax_Syntax.lbtyp = uu____8163;
                          FStar_Syntax_Syntax.lbeff = uu____8164;
                          FStar_Syntax_Syntax.lbdef = uu____8165;
                          FStar_Syntax_Syntax.lbattrs = uu____8166;
                          FStar_Syntax_Syntax.lbpos = uu____8167;_}::uu____8168),uu____8169)
           -> failwith "Impossible: already handled by encoding of Sig_let"
       | FStar_Syntax_Syntax.Tm_let
           ((false
             ,{ FStar_Syntax_Syntax.lbname = FStar_Util.Inl x;
                FStar_Syntax_Syntax.lbunivs = uu____8199;
                FStar_Syntax_Syntax.lbtyp = t1;
                FStar_Syntax_Syntax.lbeff = uu____8201;
                FStar_Syntax_Syntax.lbdef = e1;
                FStar_Syntax_Syntax.lbattrs = uu____8203;
                FStar_Syntax_Syntax.lbpos = uu____8204;_}::[]),e2)
           -> encode_let x t1 e1 e2 env encode_term
       | FStar_Syntax_Syntax.Tm_let uu____8228 ->
           (FStar_Errors.diag t0.FStar_Syntax_Syntax.pos
              "Non-top-level recursive functions, and their enclosings let bindings (including the top-level let) are not yet fully encoded to the SMT solver; you may not be able to prove some facts";
            FStar_Exn.raise Inner_let_rec)
       | FStar_Syntax_Syntax.Tm_match (e,pats) ->
           encode_match e pats FStar_SMTEncoding_Term.mk_Term_unit env
             encode_term)

and (encode_let :
  FStar_Syntax_Syntax.bv ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.term ->
          env_t ->
            (FStar_Syntax_Syntax.term ->
               env_t ->
                 (FStar_SMTEncoding_Term.term,FStar_SMTEncoding_Term.decls_t)
                   FStar_Pervasives_Native.tuple2)
              ->
              (FStar_SMTEncoding_Term.term,FStar_SMTEncoding_Term.decls_t)
                FStar_Pervasives_Native.tuple2)
  =
  fun x  ->
    fun t1  ->
      fun e1  ->
        fun e2  ->
          fun env  ->
            fun encode_body  ->
              let uu____8298 =
                let uu____8303 =
                  FStar_Syntax_Util.ascribe e1
                    ((FStar_Util.Inl t1), FStar_Pervasives_Native.None)
                   in
                encode_term uu____8303 env  in
              match uu____8298 with
              | (ee1,decls1) ->
                  let uu____8324 =
                    FStar_Syntax_Subst.open_term
                      [(x, FStar_Pervasives_Native.None)] e2
                     in
                  (match uu____8324 with
                   | (xs,e21) ->
                       let uu____8349 = FStar_List.hd xs  in
                       (match uu____8349 with
                        | (x1,uu____8363) ->
                            let env' = push_term_var env x1 ee1  in
                            let uu____8365 = encode_body e21 env'  in
                            (match uu____8365 with
                             | (ee2,decls2) ->
                                 (ee2, (FStar_List.append decls1 decls2)))))

and (encode_match :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.branch Prims.list ->
      FStar_SMTEncoding_Term.term ->
        env_t ->
          (FStar_Syntax_Syntax.term ->
             env_t ->
               (FStar_SMTEncoding_Term.term,FStar_SMTEncoding_Term.decls_t)
                 FStar_Pervasives_Native.tuple2)
            ->
            (FStar_SMTEncoding_Term.term,FStar_SMTEncoding_Term.decls_t)
              FStar_Pervasives_Native.tuple2)
  =
  fun e  ->
    fun pats  ->
      fun default_case  ->
        fun env  ->
          fun encode_br  ->
            let uu____8397 =
              let uu____8404 =
                let uu____8405 =
                  FStar_Syntax_Syntax.mk FStar_Syntax_Syntax.Tm_unknown
                    FStar_Pervasives_Native.None FStar_Range.dummyRange
                   in
                FStar_Syntax_Syntax.null_bv uu____8405  in
              gen_term_var env uu____8404  in
            match uu____8397 with
            | (scrsym,scr',env1) ->
                let uu____8413 = encode_term e env1  in
                (match uu____8413 with
                 | (scr,decls) ->
                     let uu____8424 =
                       let encode_branch b uu____8449 =
                         match uu____8449 with
                         | (else_case,decls1) ->
                             let uu____8468 =
                               FStar_Syntax_Subst.open_branch b  in
                             (match uu____8468 with
                              | (p,w,br) ->
                                  let uu____8494 = encode_pat env1 p  in
                                  (match uu____8494 with
                                   | (env0,pattern) ->
                                       let guard = pattern.guard scr'  in
                                       let projections =
                                         pattern.projections scr'  in
                                       let env2 =
                                         FStar_All.pipe_right projections
                                           (FStar_List.fold_left
                                              (fun env2  ->
                                                 fun uu____8531  ->
                                                   match uu____8531 with
                                                   | (x,t) ->
                                                       push_term_var env2 x t)
                                              env1)
                                          in
                                       let uu____8538 =
                                         match w with
                                         | FStar_Pervasives_Native.None  ->
                                             (guard, [])
                                         | FStar_Pervasives_Native.Some w1 ->
                                             let uu____8560 =
                                               encode_term w1 env2  in
                                             (match uu____8560 with
                                              | (w2,decls2) ->
                                                  let uu____8573 =
                                                    let uu____8574 =
                                                      let uu____8579 =
                                                        let uu____8580 =
                                                          let uu____8585 =
                                                            FStar_SMTEncoding_Term.boxBool
                                                              FStar_SMTEncoding_Util.mkTrue
                                                             in
                                                          (w2, uu____8585)
                                                           in
                                                        FStar_SMTEncoding_Util.mkEq
                                                          uu____8580
                                                         in
                                                      (guard, uu____8579)  in
                                                    FStar_SMTEncoding_Util.mkAnd
                                                      uu____8574
                                                     in
                                                  (uu____8573, decls2))
                                          in
                                       (match uu____8538 with
                                        | (guard1,decls2) ->
                                            let uu____8598 =
                                              encode_br br env2  in
                                            (match uu____8598 with
                                             | (br1,decls3) ->
                                                 let uu____8611 =
                                                   FStar_SMTEncoding_Util.mkITE
                                                     (guard1, br1, else_case)
                                                    in
                                                 (uu____8611,
                                                   (FStar_List.append decls1
                                                      (FStar_List.append
                                                         decls2 decls3)))))))
                          in
                       FStar_List.fold_right encode_branch pats
                         (default_case, decls)
                        in
                     (match uu____8424 with
                      | (match_tm,decls1) ->
                          let uu____8630 =
                            FStar_SMTEncoding_Term.mkLet'
                              ([((scrsym, FStar_SMTEncoding_Term.Term_sort),
                                  scr)], match_tm) FStar_Range.dummyRange
                             in
                          (uu____8630, decls1)))

and (encode_pat :
  env_t ->
    FStar_Syntax_Syntax.pat -> (env_t,pattern) FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun pat  ->
      (let uu____8670 =
         FStar_TypeChecker_Env.debug env.tcenv FStar_Options.Low  in
       if uu____8670
       then
         let uu____8671 = FStar_Syntax_Print.pat_to_string pat  in
         FStar_Util.print1 "Encoding pattern %s\n" uu____8671
       else ());
      (let uu____8673 = FStar_TypeChecker_Util.decorated_pattern_as_term pat
          in
       match uu____8673 with
       | (vars,pat_term) ->
           let uu____8690 =
             FStar_All.pipe_right vars
               (FStar_List.fold_left
                  (fun uu____8743  ->
                     fun v1  ->
                       match uu____8743 with
                       | (env1,vars1) ->
                           let uu____8795 = gen_term_var env1 v1  in
                           (match uu____8795 with
                            | (xx,uu____8817,env2) ->
                                (env2,
                                  ((v1,
                                     (xx, FStar_SMTEncoding_Term.Term_sort))
                                  :: vars1)))) (env, []))
              in
           (match uu____8690 with
            | (env1,vars1) ->
                let rec mk_guard pat1 scrutinee =
                  match pat1.FStar_Syntax_Syntax.v with
                  | FStar_Syntax_Syntax.Pat_var uu____8896 ->
                      FStar_SMTEncoding_Util.mkTrue
                  | FStar_Syntax_Syntax.Pat_wild uu____8897 ->
                      FStar_SMTEncoding_Util.mkTrue
                  | FStar_Syntax_Syntax.Pat_dot_term uu____8898 ->
                      FStar_SMTEncoding_Util.mkTrue
                  | FStar_Syntax_Syntax.Pat_constant c ->
                      let uu____8906 = encode_const c env1  in
                      (match uu____8906 with
                       | (tm,decls) ->
                           ((match decls with
                             | uu____8920::uu____8921 ->
                                 failwith
                                   "Unexpected encoding of constant pattern"
                             | uu____8924 -> ());
                            FStar_SMTEncoding_Util.mkEq (scrutinee, tm)))
                  | FStar_Syntax_Syntax.Pat_cons (f,args) ->
                      let is_f =
                        let tc_name =
                          FStar_TypeChecker_Env.typ_of_datacon env1.tcenv
                            (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                           in
                        let uu____8947 =
                          FStar_TypeChecker_Env.datacons_of_typ env1.tcenv
                            tc_name
                           in
                        match uu____8947 with
                        | (uu____8954,uu____8955::[]) ->
                            FStar_SMTEncoding_Util.mkTrue
                        | uu____8958 ->
                            mk_data_tester env1
                              (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                              scrutinee
                         in
                      let sub_term_guards =
                        FStar_All.pipe_right args
                          (FStar_List.mapi
                             (fun i  ->
                                fun uu____8991  ->
                                  match uu____8991 with
                                  | (arg,uu____8999) ->
                                      let proj =
                                        primitive_projector_by_pos env1.tcenv
                                          (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                                          i
                                         in
                                      let uu____9005 =
                                        FStar_SMTEncoding_Util.mkApp
                                          (proj, [scrutinee])
                                         in
                                      mk_guard arg uu____9005))
                         in
                      FStar_SMTEncoding_Util.mk_and_l (is_f ::
                        sub_term_guards)
                   in
                let rec mk_projections pat1 scrutinee =
                  match pat1.FStar_Syntax_Syntax.v with
                  | FStar_Syntax_Syntax.Pat_dot_term (x,uu____9032) ->
                      [(x, scrutinee)]
                  | FStar_Syntax_Syntax.Pat_var x -> [(x, scrutinee)]
                  | FStar_Syntax_Syntax.Pat_wild x -> [(x, scrutinee)]
                  | FStar_Syntax_Syntax.Pat_constant uu____9063 -> []
                  | FStar_Syntax_Syntax.Pat_cons (f,args) ->
                      let uu____9086 =
                        FStar_All.pipe_right args
                          (FStar_List.mapi
                             (fun i  ->
                                fun uu____9130  ->
                                  match uu____9130 with
                                  | (arg,uu____9144) ->
                                      let proj =
                                        primitive_projector_by_pos env1.tcenv
                                          (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                                          i
                                         in
                                      let uu____9150 =
                                        FStar_SMTEncoding_Util.mkApp
                                          (proj, [scrutinee])
                                         in
                                      mk_projections arg uu____9150))
                         in
                      FStar_All.pipe_right uu____9086 FStar_List.flatten
                   in
                let pat_term1 uu____9178 = encode_term pat_term env1  in
                let pattern =
                  {
                    pat_vars = vars1;
                    pat_term = pat_term1;
                    guard = (mk_guard pat);
                    projections = (mk_projections pat)
                  }  in
                (env1, pattern)))

and (encode_args :
  FStar_Syntax_Syntax.args ->
    env_t ->
      (FStar_SMTEncoding_Term.term Prims.list,FStar_SMTEncoding_Term.decls_t)
        FStar_Pervasives_Native.tuple2)
  =
  fun l  ->
    fun env  ->
      let uu____9188 =
        FStar_All.pipe_right l
          (FStar_List.fold_left
             (fun uu____9226  ->
                fun uu____9227  ->
                  match (uu____9226, uu____9227) with
                  | ((tms,decls),(t,uu____9263)) ->
                      let uu____9284 = encode_term t env  in
                      (match uu____9284 with
                       | (t1,decls') ->
                           ((t1 :: tms), (FStar_List.append decls decls'))))
             ([], []))
         in
      match uu____9188 with | (l1,decls) -> ((FStar_List.rev l1), decls)

and (encode_function_type_as_formula :
  FStar_Syntax_Syntax.typ ->
    env_t ->
      (FStar_SMTEncoding_Term.term,FStar_SMTEncoding_Term.decls_t)
        FStar_Pervasives_Native.tuple2)
  =
  fun t  ->
    fun env  ->
      let list_elements1 e =
        let uu____9341 = FStar_Syntax_Util.list_elements e  in
        match uu____9341 with
        | FStar_Pervasives_Native.Some l -> l
        | FStar_Pervasives_Native.None  ->
            (FStar_Errors.log_issue e.FStar_Syntax_Syntax.pos
               (FStar_Errors.Warning_NonListLiteralSMTPattern,
                 "SMT pattern is not a list literal; ignoring the pattern");
             [])
         in
      let one_pat p =
        let uu____9362 =
          let uu____9377 = FStar_Syntax_Util.unmeta p  in
          FStar_All.pipe_right uu____9377 FStar_Syntax_Util.head_and_args  in
        match uu____9362 with
        | (head1,args) ->
            let uu____9416 =
              let uu____9429 =
                let uu____9430 = FStar_Syntax_Util.un_uinst head1  in
                uu____9430.FStar_Syntax_Syntax.n  in
              (uu____9429, args)  in
            (match uu____9416 with
             | (FStar_Syntax_Syntax.Tm_fvar
                fv,(uu____9444,uu____9445)::(e,uu____9447)::[]) when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.smtpat_lid
                 -> e
             | uu____9482 -> failwith "Unexpected pattern term")
         in
      let lemma_pats p =
        let elts = list_elements1 p  in
        let smt_pat_or1 t1 =
          let uu____9518 =
            let uu____9533 = FStar_Syntax_Util.unmeta t1  in
            FStar_All.pipe_right uu____9533 FStar_Syntax_Util.head_and_args
             in
          match uu____9518 with
          | (head1,args) ->
              let uu____9574 =
                let uu____9587 =
                  let uu____9588 = FStar_Syntax_Util.un_uinst head1  in
                  uu____9588.FStar_Syntax_Syntax.n  in
                (uu____9587, args)  in
              (match uu____9574 with
               | (FStar_Syntax_Syntax.Tm_fvar fv,(e,uu____9605)::[]) when
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.smtpatOr_lid
                   -> FStar_Pervasives_Native.Some e
               | uu____9632 -> FStar_Pervasives_Native.None)
           in
        match elts with
        | t1::[] ->
            let uu____9654 = smt_pat_or1 t1  in
            (match uu____9654 with
             | FStar_Pervasives_Native.Some e ->
                 let uu____9670 = list_elements1 e  in
                 FStar_All.pipe_right uu____9670
                   (FStar_List.map
                      (fun branch1  ->
                         let uu____9688 = list_elements1 branch1  in
                         FStar_All.pipe_right uu____9688
                           (FStar_List.map one_pat)))
             | uu____9699 ->
                 let uu____9704 =
                   FStar_All.pipe_right elts (FStar_List.map one_pat)  in
                 [uu____9704])
        | uu____9725 ->
            let uu____9728 =
              FStar_All.pipe_right elts (FStar_List.map one_pat)  in
            [uu____9728]
         in
      let uu____9749 =
        let uu____9768 =
          let uu____9769 = FStar_Syntax_Subst.compress t  in
          uu____9769.FStar_Syntax_Syntax.n  in
        match uu____9768 with
        | FStar_Syntax_Syntax.Tm_arrow (binders,c) ->
            let uu____9808 = FStar_Syntax_Subst.open_comp binders c  in
            (match uu____9808 with
             | (binders1,c1) ->
                 (match c1.FStar_Syntax_Syntax.n with
                  | FStar_Syntax_Syntax.Comp
                      { FStar_Syntax_Syntax.comp_univs = uu____9851;
                        FStar_Syntax_Syntax.effect_name = uu____9852;
                        FStar_Syntax_Syntax.result_typ = uu____9853;
                        FStar_Syntax_Syntax.effect_args =
                          (pre,uu____9855)::(post,uu____9857)::(pats,uu____9859)::[];
                        FStar_Syntax_Syntax.flags = uu____9860;_}
                      ->
                      let uu____9901 = lemma_pats pats  in
                      (binders1, pre, post, uu____9901)
                  | uu____9918 -> failwith "impos"))
        | uu____9937 -> failwith "Impos"  in
      match uu____9749 with
      | (binders,pre,post,patterns) ->
          let env1 =
            let uu___112_9985 = env  in
            {
              bindings = (uu___112_9985.bindings);
              depth = (uu___112_9985.depth);
              tcenv = (uu___112_9985.tcenv);
              warn = (uu___112_9985.warn);
              cache = (uu___112_9985.cache);
              nolabels = (uu___112_9985.nolabels);
              use_zfuel_name = true;
              encode_non_total_function_typ =
                (uu___112_9985.encode_non_total_function_typ);
              current_module_name = (uu___112_9985.current_module_name)
            }  in
          let uu____9986 =
            encode_binders FStar_Pervasives_Native.None binders env1  in
          (match uu____9986 with
           | (vars,guards,env2,decls,uu____10011) ->
               let uu____10024 =
                 let uu____10039 =
                   FStar_All.pipe_right patterns
                     (FStar_List.map
                        (fun branch1  ->
                           let uu____10093 =
                             let uu____10104 =
                               FStar_All.pipe_right branch1
                                 (FStar_List.map
                                    (fun t1  -> encode_smt_pattern t1 env2))
                                in
                             FStar_All.pipe_right uu____10104
                               FStar_List.unzip
                              in
                           match uu____10093 with
                           | (pats,decls1) -> (pats, decls1)))
                    in
                 FStar_All.pipe_right uu____10039 FStar_List.unzip  in
               (match uu____10024 with
                | (pats,decls') ->
                    let decls'1 = FStar_List.flatten decls'  in
                    let post1 = FStar_Syntax_Util.unthunk_lemma_post post  in
                    let env3 =
                      let uu___113_10256 = env2  in
                      {
                        bindings = (uu___113_10256.bindings);
                        depth = (uu___113_10256.depth);
                        tcenv = (uu___113_10256.tcenv);
                        warn = (uu___113_10256.warn);
                        cache = (uu___113_10256.cache);
                        nolabels = true;
                        use_zfuel_name = (uu___113_10256.use_zfuel_name);
                        encode_non_total_function_typ =
                          (uu___113_10256.encode_non_total_function_typ);
                        current_module_name =
                          (uu___113_10256.current_module_name)
                      }  in
                    let uu____10257 =
                      let uu____10262 = FStar_Syntax_Util.unmeta pre  in
                      encode_formula uu____10262 env3  in
                    (match uu____10257 with
                     | (pre1,decls'') ->
                         let uu____10269 =
                           let uu____10274 = FStar_Syntax_Util.unmeta post1
                              in
                           encode_formula uu____10274 env3  in
                         (match uu____10269 with
                          | (post2,decls''') ->
                              let decls1 =
                                FStar_List.append decls
                                  (FStar_List.append
                                     (FStar_List.flatten decls'1)
                                     (FStar_List.append decls'' decls'''))
                                 in
                              let uu____10284 =
                                let uu____10285 =
                                  let uu____10296 =
                                    let uu____10297 =
                                      let uu____10302 =
                                        FStar_SMTEncoding_Util.mk_and_l (pre1
                                          :: guards)
                                         in
                                      (uu____10302, post2)  in
                                    FStar_SMTEncoding_Util.mkImp uu____10297
                                     in
                                  (pats, vars, uu____10296)  in
                                FStar_SMTEncoding_Util.mkForall uu____10285
                                 in
                              (uu____10284, decls1)))))

and (encode_smt_pattern :
  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
    env_t ->
      (FStar_SMTEncoding_Term.pat,FStar_SMTEncoding_Term.decl Prims.list)
        FStar_Pervasives_Native.tuple2)
  =
  fun t  ->
    fun env  ->
      let uu____10315 = FStar_Syntax_Util.head_and_args t  in
      match uu____10315 with
      | (head1,args) ->
          let head2 = FStar_Syntax_Util.un_uinst head1  in
          (match ((head2.FStar_Syntax_Syntax.n), args) with
           | (FStar_Syntax_Syntax.Tm_fvar
              fv,uu____10374::(x,uu____10376)::(t1,uu____10378)::[]) when
               FStar_Syntax_Syntax.fv_eq_lid fv
                 FStar_Parser_Const.has_type_lid
               ->
               let uu____10425 = encode_term x env  in
               (match uu____10425 with
                | (x1,decls) ->
                    let uu____10438 = encode_term t1 env  in
                    (match uu____10438 with
                     | (t2,decls') ->
                         let uu____10451 =
                           FStar_SMTEncoding_Term.mk_HasType x1 t2  in
                         (uu____10451, (FStar_List.append decls decls'))))
           | uu____10454 -> encode_term t env)

and (encode_formula :
  FStar_Syntax_Syntax.typ ->
    env_t ->
      (FStar_SMTEncoding_Term.term,FStar_SMTEncoding_Term.decls_t)
        FStar_Pervasives_Native.tuple2)
  =
  fun phi  ->
    fun env  ->
      let debug1 phi1 =
        let uu____10477 =
          FStar_All.pipe_left (FStar_TypeChecker_Env.debug env.tcenv)
            (FStar_Options.Other "SMTEncoding")
           in
        if uu____10477
        then
          let uu____10478 = FStar_Syntax_Print.tag_of_term phi1  in
          let uu____10479 = FStar_Syntax_Print.term_to_string phi1  in
          FStar_Util.print2 "Formula (%s)  %s\n" uu____10478 uu____10479
        else ()  in
      let enc f r l =
        let uu____10512 =
          FStar_Util.fold_map
            (fun decls  ->
               fun x  ->
                 let uu____10540 =
                   encode_term (FStar_Pervasives_Native.fst x) env  in
                 match uu____10540 with
                 | (t,decls') -> ((FStar_List.append decls decls'), t)) [] l
           in
        match uu____10512 with
        | (decls,args) ->
            let uu____10569 =
              let uu___114_10570 = f args  in
              {
                FStar_SMTEncoding_Term.tm =
                  (uu___114_10570.FStar_SMTEncoding_Term.tm);
                FStar_SMTEncoding_Term.freevars =
                  (uu___114_10570.FStar_SMTEncoding_Term.freevars);
                FStar_SMTEncoding_Term.rng = r
              }  in
            (uu____10569, decls)
         in
      let const_op f r uu____10601 =
        let uu____10614 = f r  in (uu____10614, [])  in
      let un_op f l =
        let uu____10633 = FStar_List.hd l  in
        FStar_All.pipe_left f uu____10633  in
      let bin_op f uu___88_10649 =
        match uu___88_10649 with
        | t1::t2::[] -> f (t1, t2)
        | uu____10660 -> failwith "Impossible"  in
      let enc_prop_c f r l =
        let uu____10694 =
          FStar_Util.fold_map
            (fun decls  ->
               fun uu____10717  ->
                 match uu____10717 with
                 | (t,uu____10731) ->
                     let uu____10732 = encode_formula t env  in
                     (match uu____10732 with
                      | (phi1,decls') ->
                          ((FStar_List.append decls decls'), phi1))) [] l
           in
        match uu____10694 with
        | (decls,phis) ->
            let uu____10761 =
              let uu___115_10762 = f phis  in
              {
                FStar_SMTEncoding_Term.tm =
                  (uu___115_10762.FStar_SMTEncoding_Term.tm);
                FStar_SMTEncoding_Term.freevars =
                  (uu___115_10762.FStar_SMTEncoding_Term.freevars);
                FStar_SMTEncoding_Term.rng = r
              }  in
            (uu____10761, decls)
         in
      let eq_op r args =
        let rf =
          FStar_List.filter
            (fun uu____10823  ->
               match uu____10823 with
               | (a,q) ->
                   (match q with
                    | FStar_Pervasives_Native.Some
                        (FStar_Syntax_Syntax.Implicit uu____10842) -> false
                    | uu____10843 -> true)) args
           in
        if (FStar_List.length rf) <> (Prims.parse_int "2")
        then
          let uu____10858 =
            FStar_Util.format1
              "eq_op: got %s non-implicit arguments instead of 2?"
              (Prims.string_of_int (FStar_List.length rf))
             in
          failwith uu____10858
        else
          (let uu____10872 = enc (bin_op FStar_SMTEncoding_Util.mkEq)  in
           uu____10872 r rf)
         in
      let mk_imp1 r uu___89_10897 =
        match uu___89_10897 with
        | (lhs,uu____10903)::(rhs,uu____10905)::[] ->
            let uu____10932 = encode_formula rhs env  in
            (match uu____10932 with
             | (l1,decls1) ->
                 (match l1.FStar_SMTEncoding_Term.tm with
                  | FStar_SMTEncoding_Term.App
                      (FStar_SMTEncoding_Term.TrueOp ,uu____10947) ->
                      (l1, decls1)
                  | uu____10952 ->
                      let uu____10953 = encode_formula lhs env  in
                      (match uu____10953 with
                       | (l2,decls2) ->
                           let uu____10964 =
                             FStar_SMTEncoding_Term.mkImp (l2, l1) r  in
                           (uu____10964, (FStar_List.append decls1 decls2)))))
        | uu____10967 -> failwith "impossible"  in
      let mk_ite r uu___90_10988 =
        match uu___90_10988 with
        | (guard,uu____10994)::(_then,uu____10996)::(_else,uu____10998)::[]
            ->
            let uu____11035 = encode_formula guard env  in
            (match uu____11035 with
             | (g,decls1) ->
                 let uu____11046 = encode_formula _then env  in
                 (match uu____11046 with
                  | (t,decls2) ->
                      let uu____11057 = encode_formula _else env  in
                      (match uu____11057 with
                       | (e,decls3) ->
                           let res = FStar_SMTEncoding_Term.mkITE (g, t, e) r
                              in
                           (res,
                             (FStar_List.append decls1
                                (FStar_List.append decls2 decls3))))))
        | uu____11071 -> failwith "impossible"  in
      let unboxInt_l f l =
        let uu____11096 = FStar_List.map FStar_SMTEncoding_Term.unboxInt l
           in
        f uu____11096  in
      let connectives =
        let uu____11114 =
          let uu____11127 = enc_prop_c (bin_op FStar_SMTEncoding_Util.mkAnd)
             in
          (FStar_Parser_Const.and_lid, uu____11127)  in
        let uu____11144 =
          let uu____11159 =
            let uu____11172 = enc_prop_c (bin_op FStar_SMTEncoding_Util.mkOr)
               in
            (FStar_Parser_Const.or_lid, uu____11172)  in
          let uu____11189 =
            let uu____11204 =
              let uu____11219 =
                let uu____11232 =
                  enc_prop_c (bin_op FStar_SMTEncoding_Util.mkIff)  in
                (FStar_Parser_Const.iff_lid, uu____11232)  in
              let uu____11249 =
                let uu____11264 =
                  let uu____11279 =
                    let uu____11292 =
                      enc_prop_c (un_op FStar_SMTEncoding_Util.mkNot)  in
                    (FStar_Parser_Const.not_lid, uu____11292)  in
                  [uu____11279;
                  (FStar_Parser_Const.eq2_lid, eq_op);
                  (FStar_Parser_Const.eq3_lid, eq_op);
                  (FStar_Parser_Const.true_lid,
                    (const_op FStar_SMTEncoding_Term.mkTrue));
                  (FStar_Parser_Const.false_lid,
                    (const_op FStar_SMTEncoding_Term.mkFalse))]
                   in
                (FStar_Parser_Const.ite_lid, mk_ite) :: uu____11264  in
              uu____11219 :: uu____11249  in
            (FStar_Parser_Const.imp_lid, mk_imp1) :: uu____11204  in
          uu____11159 :: uu____11189  in
        uu____11114 :: uu____11144  in
      let rec fallback phi1 =
        match phi1.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Tm_meta
            (phi',FStar_Syntax_Syntax.Meta_labeled (msg,r,b)) ->
            let uu____11613 = encode_formula phi' env  in
            (match uu____11613 with
             | (phi2,decls) ->
                 let uu____11624 =
                   FStar_SMTEncoding_Term.mk
                     (FStar_SMTEncoding_Term.Labeled (phi2, msg, r)) r
                    in
                 (uu____11624, decls))
        | FStar_Syntax_Syntax.Tm_meta uu____11625 ->
            let uu____11632 = FStar_Syntax_Util.unmeta phi1  in
            encode_formula uu____11632 env
        | FStar_Syntax_Syntax.Tm_match (e,pats) ->
            let uu____11671 =
              encode_match e pats FStar_SMTEncoding_Util.mkFalse env
                encode_formula
               in
            (match uu____11671 with | (t,decls) -> (t, decls))
        | FStar_Syntax_Syntax.Tm_let
            ((false
              ,{ FStar_Syntax_Syntax.lbname = FStar_Util.Inl x;
                 FStar_Syntax_Syntax.lbunivs = uu____11683;
                 FStar_Syntax_Syntax.lbtyp = t1;
                 FStar_Syntax_Syntax.lbeff = uu____11685;
                 FStar_Syntax_Syntax.lbdef = e1;
                 FStar_Syntax_Syntax.lbattrs = uu____11687;
                 FStar_Syntax_Syntax.lbpos = uu____11688;_}::[]),e2)
            ->
            let uu____11712 = encode_let x t1 e1 e2 env encode_formula  in
            (match uu____11712 with | (t,decls) -> (t, decls))
        | FStar_Syntax_Syntax.Tm_app (head1,args) ->
            let head2 = FStar_Syntax_Util.un_uinst head1  in
            (match ((head2.FStar_Syntax_Syntax.n), args) with
             | (FStar_Syntax_Syntax.Tm_fvar
                fv,uu____11759::(x,uu____11761)::(t,uu____11763)::[]) when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.has_type_lid
                 ->
                 let uu____11810 = encode_term x env  in
                 (match uu____11810 with
                  | (x1,decls) ->
                      let uu____11821 = encode_term t env  in
                      (match uu____11821 with
                       | (t1,decls') ->
                           let uu____11832 =
                             FStar_SMTEncoding_Term.mk_HasType x1 t1  in
                           (uu____11832, (FStar_List.append decls decls'))))
             | (FStar_Syntax_Syntax.Tm_fvar
                fv,(r,uu____11837)::(msg,uu____11839)::(phi2,uu____11841)::[])
                 when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.labeled_lid
                 ->
                 let uu____11886 =
                   let uu____11891 =
                     let uu____11892 = FStar_Syntax_Subst.compress r  in
                     uu____11892.FStar_Syntax_Syntax.n  in
                   let uu____11895 =
                     let uu____11896 = FStar_Syntax_Subst.compress msg  in
                     uu____11896.FStar_Syntax_Syntax.n  in
                   (uu____11891, uu____11895)  in
                 (match uu____11886 with
                  | (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_range
                     r1),FStar_Syntax_Syntax.Tm_constant
                     (FStar_Const.Const_string (s,uu____11905))) ->
                      let phi3 =
                        FStar_Syntax_Syntax.mk
                          (FStar_Syntax_Syntax.Tm_meta
                             (phi2,
                               (FStar_Syntax_Syntax.Meta_labeled
                                  (s, r1, false))))
                          FStar_Pervasives_Native.None r1
                         in
                      fallback phi3
                  | uu____11911 -> fallback phi2)
             | (FStar_Syntax_Syntax.Tm_fvar fv,(t,uu____11918)::[]) when
                 (FStar_Syntax_Syntax.fv_eq_lid fv
                    FStar_Parser_Const.squash_lid)
                   ||
                   (FStar_Syntax_Syntax.fv_eq_lid fv
                      FStar_Parser_Const.auto_squash_lid)
                 -> encode_formula t env
             | uu____11943 when head_redex env head2 ->
                 let uu____11956 = whnf env phi1  in
                 encode_formula uu____11956 env
             | uu____11957 ->
                 let uu____11970 = encode_term phi1 env  in
                 (match uu____11970 with
                  | (tt,decls) ->
                      let uu____11981 =
                        FStar_SMTEncoding_Term.mk_Valid
                          (let uu___116_11984 = tt  in
                           {
                             FStar_SMTEncoding_Term.tm =
                               (uu___116_11984.FStar_SMTEncoding_Term.tm);
                             FStar_SMTEncoding_Term.freevars =
                               (uu___116_11984.FStar_SMTEncoding_Term.freevars);
                             FStar_SMTEncoding_Term.rng =
                               (phi1.FStar_Syntax_Syntax.pos)
                           })
                         in
                      (uu____11981, decls)))
        | uu____11985 ->
            let uu____11986 = encode_term phi1 env  in
            (match uu____11986 with
             | (tt,decls) ->
                 let uu____11997 =
                   FStar_SMTEncoding_Term.mk_Valid
                     (let uu___117_12000 = tt  in
                      {
                        FStar_SMTEncoding_Term.tm =
                          (uu___117_12000.FStar_SMTEncoding_Term.tm);
                        FStar_SMTEncoding_Term.freevars =
                          (uu___117_12000.FStar_SMTEncoding_Term.freevars);
                        FStar_SMTEncoding_Term.rng =
                          (phi1.FStar_Syntax_Syntax.pos)
                      })
                    in
                 (uu____11997, decls))
         in
      let encode_q_body env1 bs ps body =
        let uu____12036 = encode_binders FStar_Pervasives_Native.None bs env1
           in
        match uu____12036 with
        | (vars,guards,env2,decls,uu____12075) ->
            let uu____12088 =
              let uu____12101 =
                FStar_All.pipe_right ps
                  (FStar_List.map
                     (fun p  ->
                        let uu____12153 =
                          let uu____12164 =
                            FStar_All.pipe_right p
                              (FStar_List.map
                                 (fun uu____12204  ->
                                    match uu____12204 with
                                    | (t,uu____12218) ->
                                        encode_smt_pattern t
                                          (let uu___118_12224 = env2  in
                                           {
                                             bindings =
                                               (uu___118_12224.bindings);
                                             depth = (uu___118_12224.depth);
                                             tcenv = (uu___118_12224.tcenv);
                                             warn = (uu___118_12224.warn);
                                             cache = (uu___118_12224.cache);
                                             nolabels =
                                               (uu___118_12224.nolabels);
                                             use_zfuel_name = true;
                                             encode_non_total_function_typ =
                                               (uu___118_12224.encode_non_total_function_typ);
                                             current_module_name =
                                               (uu___118_12224.current_module_name)
                                           })))
                             in
                          FStar_All.pipe_right uu____12164 FStar_List.unzip
                           in
                        match uu____12153 with
                        | (p1,decls1) -> (p1, (FStar_List.flatten decls1))))
                 in
              FStar_All.pipe_right uu____12101 FStar_List.unzip  in
            (match uu____12088 with
             | (pats,decls') ->
                 let uu____12333 = encode_formula body env2  in
                 (match uu____12333 with
                  | (body1,decls'') ->
                      let guards1 =
                        match pats with
                        | ({
                             FStar_SMTEncoding_Term.tm =
                               FStar_SMTEncoding_Term.App
                               (FStar_SMTEncoding_Term.Var gf,p::[]);
                             FStar_SMTEncoding_Term.freevars = uu____12365;
                             FStar_SMTEncoding_Term.rng = uu____12366;_}::[])::[]
                            when
                            (FStar_Ident.text_of_lid
                               FStar_Parser_Const.guard_free)
                              = gf
                            -> []
                        | uu____12381 -> guards  in
                      let uu____12386 =
                        FStar_SMTEncoding_Util.mk_and_l guards1  in
                      (vars, pats, uu____12386, body1,
                        (FStar_List.append decls
                           (FStar_List.append (FStar_List.flatten decls')
                              decls'')))))
         in
      debug1 phi;
      (let phi1 = FStar_Syntax_Util.unascribe phi  in
       let check_pattern_vars vars pats =
         let pats1 =
           FStar_All.pipe_right pats
             (FStar_List.map
                (fun uu____12446  ->
                   match uu____12446 with
                   | (x,uu____12452) ->
                       FStar_TypeChecker_Normalize.normalize
                         [FStar_TypeChecker_Normalize.Beta;
                         FStar_TypeChecker_Normalize.AllowUnboundUniverses;
                         FStar_TypeChecker_Normalize.EraseUniverses]
                         env.tcenv x))
            in
         match pats1 with
         | [] -> ()
         | hd1::tl1 ->
             let pat_vars =
               let uu____12460 = FStar_Syntax_Free.names hd1  in
               FStar_List.fold_left
                 (fun out  ->
                    fun x  ->
                      let uu____12472 = FStar_Syntax_Free.names x  in
                      FStar_Util.set_union out uu____12472) uu____12460 tl1
                in
             let uu____12475 =
               FStar_All.pipe_right vars
                 (FStar_Util.find_opt
                    (fun uu____12502  ->
                       match uu____12502 with
                       | (b,uu____12508) ->
                           let uu____12509 = FStar_Util.set_mem b pat_vars
                              in
                           Prims.op_Negation uu____12509))
                in
             (match uu____12475 with
              | FStar_Pervasives_Native.None  -> ()
              | FStar_Pervasives_Native.Some (x,uu____12515) ->
                  let pos =
                    FStar_List.fold_left
                      (fun out  ->
                         fun t  ->
                           FStar_Range.union_ranges out
                             t.FStar_Syntax_Syntax.pos)
                      hd1.FStar_Syntax_Syntax.pos tl1
                     in
                  let uu____12529 =
                    let uu____12534 =
                      let uu____12535 = FStar_Syntax_Print.bv_to_string x  in
                      FStar_Util.format1
                        "SMT pattern misses at least one bound variable: %s"
                        uu____12535
                       in
                    (FStar_Errors.Warning_SMTPatternMissingBoundVar,
                      uu____12534)
                     in
                  FStar_Errors.log_issue pos uu____12529)
          in
       let uu____12536 = FStar_Syntax_Util.destruct_typ_as_formula phi1  in
       match uu____12536 with
       | FStar_Pervasives_Native.None  -> fallback phi1
       | FStar_Pervasives_Native.Some (FStar_Syntax_Util.BaseConn (op,arms))
           ->
           let uu____12545 =
             FStar_All.pipe_right connectives
               (FStar_List.tryFind
                  (fun uu____12603  ->
                     match uu____12603 with
                     | (l,uu____12617) -> FStar_Ident.lid_equals op l))
              in
           (match uu____12545 with
            | FStar_Pervasives_Native.None  -> fallback phi1
            | FStar_Pervasives_Native.Some (uu____12650,f) ->
                f phi1.FStar_Syntax_Syntax.pos arms)
       | FStar_Pervasives_Native.Some (FStar_Syntax_Util.QAll
           (vars,pats,body)) ->
           (FStar_All.pipe_right pats
              (FStar_List.iter (check_pattern_vars vars));
            (let uu____12690 = encode_q_body env vars pats body  in
             match uu____12690 with
             | (vars1,pats1,guard,body1,decls) ->
                 let tm =
                   let uu____12735 =
                     let uu____12746 =
                       FStar_SMTEncoding_Util.mkImp (guard, body1)  in
                     (pats1, vars1, uu____12746)  in
                   FStar_SMTEncoding_Term.mkForall uu____12735
                     phi1.FStar_Syntax_Syntax.pos
                    in
                 (tm, decls)))
       | FStar_Pervasives_Native.Some (FStar_Syntax_Util.QEx
           (vars,pats,body)) ->
           (FStar_All.pipe_right pats
              (FStar_List.iter (check_pattern_vars vars));
            (let uu____12765 = encode_q_body env vars pats body  in
             match uu____12765 with
             | (vars1,pats1,guard,body1,decls) ->
                 let uu____12809 =
                   let uu____12810 =
                     let uu____12821 =
                       FStar_SMTEncoding_Util.mkAnd (guard, body1)  in
                     (pats1, vars1, uu____12821)  in
                   FStar_SMTEncoding_Term.mkExists uu____12810
                     phi1.FStar_Syntax_Syntax.pos
                    in
                 (uu____12809, decls))))

type prims_t =
  {
  mk:
    FStar_Ident.lident ->
      Prims.string ->
        (FStar_SMTEncoding_Term.term,Prims.int,FStar_SMTEncoding_Term.decl
                                                 Prims.list)
          FStar_Pervasives_Native.tuple3
    ;
  is: FStar_Ident.lident -> Prims.bool }[@@deriving show]
let (__proj__Mkprims_t__item__mk :
  prims_t ->
    FStar_Ident.lident ->
      Prims.string ->
        (FStar_SMTEncoding_Term.term,Prims.int,FStar_SMTEncoding_Term.decl
                                                 Prims.list)
          FStar_Pervasives_Native.tuple3)
  =
  fun projectee  ->
    match projectee with
    | { mk = __fname__mk; is = __fname__is;_} -> __fname__mk
  
let (__proj__Mkprims_t__item__is :
  prims_t -> FStar_Ident.lident -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { mk = __fname__mk; is = __fname__is;_} -> __fname__is
  
let (prims : prims_t) =
  let uu____12924 = fresh_fvar "a" FStar_SMTEncoding_Term.Term_sort  in
  match uu____12924 with
  | (asym,a) ->
      let uu____12931 = fresh_fvar "x" FStar_SMTEncoding_Term.Term_sort  in
      (match uu____12931 with
       | (xsym,x) ->
           let uu____12938 = fresh_fvar "y" FStar_SMTEncoding_Term.Term_sort
              in
           (match uu____12938 with
            | (ysym,y) ->
                let quant vars body x1 =
                  let xname_decl =
                    let uu____12986 =
                      let uu____12997 =
                        FStar_All.pipe_right vars
                          (FStar_List.map FStar_Pervasives_Native.snd)
                         in
                      (x1, uu____12997, FStar_SMTEncoding_Term.Term_sort,
                        FStar_Pervasives_Native.None)
                       in
                    FStar_SMTEncoding_Term.DeclFun uu____12986  in
                  let xtok = Prims.strcat x1 "@tok"  in
                  let xtok_decl =
                    FStar_SMTEncoding_Term.DeclFun
                      (xtok, [], FStar_SMTEncoding_Term.Term_sort,
                        FStar_Pervasives_Native.None)
                     in
                  let xapp =
                    let uu____13023 =
                      let uu____13030 =
                        FStar_List.map FStar_SMTEncoding_Util.mkFreeV vars
                         in
                      (x1, uu____13030)  in
                    FStar_SMTEncoding_Util.mkApp uu____13023  in
                  let xtok1 = FStar_SMTEncoding_Util.mkApp (xtok, [])  in
                  let xtok_app = mk_Apply xtok1 vars  in
                  let uu____13043 =
                    let uu____13046 =
                      let uu____13049 =
                        let uu____13052 =
                          let uu____13053 =
                            let uu____13060 =
                              let uu____13061 =
                                let uu____13072 =
                                  FStar_SMTEncoding_Util.mkEq (xapp, body)
                                   in
                                ([[xapp]], vars, uu____13072)  in
                              FStar_SMTEncoding_Util.mkForall uu____13061  in
                            (uu____13060, FStar_Pervasives_Native.None,
                              (Prims.strcat "primitive_" x1))
                             in
                          FStar_SMTEncoding_Util.mkAssume uu____13053  in
                        let uu____13089 =
                          let uu____13092 =
                            let uu____13093 =
                              let uu____13100 =
                                let uu____13101 =
                                  let uu____13112 =
                                    FStar_SMTEncoding_Util.mkEq
                                      (xtok_app, xapp)
                                     in
                                  ([[xtok_app]], vars, uu____13112)  in
                                FStar_SMTEncoding_Util.mkForall uu____13101
                                 in
                              (uu____13100,
                                (FStar_Pervasives_Native.Some
                                   "Name-token correspondence"),
                                (Prims.strcat "token_correspondence_" x1))
                               in
                            FStar_SMTEncoding_Util.mkAssume uu____13093  in
                          [uu____13092]  in
                        uu____13052 :: uu____13089  in
                      xtok_decl :: uu____13049  in
                    xname_decl :: uu____13046  in
                  (xtok1, (FStar_List.length vars), uu____13043)  in
                let axy =
                  [(asym, FStar_SMTEncoding_Term.Term_sort);
                  (xsym, FStar_SMTEncoding_Term.Term_sort);
                  (ysym, FStar_SMTEncoding_Term.Term_sort)]  in
                let xy =
                  [(xsym, FStar_SMTEncoding_Term.Term_sort);
                  (ysym, FStar_SMTEncoding_Term.Term_sort)]  in
                let qx = [(xsym, FStar_SMTEncoding_Term.Term_sort)]  in
                let prims1 =
                  let uu____13209 =
                    let uu____13224 =
                      let uu____13235 =
                        let uu____13236 = FStar_SMTEncoding_Util.mkEq (x, y)
                           in
                        FStar_All.pipe_left FStar_SMTEncoding_Term.boxBool
                          uu____13236
                         in
                      quant axy uu____13235  in
                    (FStar_Parser_Const.op_Eq, uu____13224)  in
                  let uu____13247 =
                    let uu____13264 =
                      let uu____13279 =
                        let uu____13290 =
                          let uu____13291 =
                            let uu____13292 =
                              FStar_SMTEncoding_Util.mkEq (x, y)  in
                            FStar_SMTEncoding_Util.mkNot uu____13292  in
                          FStar_All.pipe_left FStar_SMTEncoding_Term.boxBool
                            uu____13291
                           in
                        quant axy uu____13290  in
                      (FStar_Parser_Const.op_notEq, uu____13279)  in
                    let uu____13303 =
                      let uu____13320 =
                        let uu____13335 =
                          let uu____13346 =
                            let uu____13347 =
                              let uu____13348 =
                                let uu____13353 =
                                  FStar_SMTEncoding_Term.unboxInt x  in
                                let uu____13354 =
                                  FStar_SMTEncoding_Term.unboxInt y  in
                                (uu____13353, uu____13354)  in
                              FStar_SMTEncoding_Util.mkLT uu____13348  in
                            FStar_All.pipe_left
                              FStar_SMTEncoding_Term.boxBool uu____13347
                             in
                          quant xy uu____13346  in
                        (FStar_Parser_Const.op_LT, uu____13335)  in
                      let uu____13365 =
                        let uu____13382 =
                          let uu____13397 =
                            let uu____13408 =
                              let uu____13409 =
                                let uu____13410 =
                                  let uu____13415 =
                                    FStar_SMTEncoding_Term.unboxInt x  in
                                  let uu____13416 =
                                    FStar_SMTEncoding_Term.unboxInt y  in
                                  (uu____13415, uu____13416)  in
                                FStar_SMTEncoding_Util.mkLTE uu____13410  in
                              FStar_All.pipe_left
                                FStar_SMTEncoding_Term.boxBool uu____13409
                               in
                            quant xy uu____13408  in
                          (FStar_Parser_Const.op_LTE, uu____13397)  in
                        let uu____13427 =
                          let uu____13444 =
                            let uu____13459 =
                              let uu____13470 =
                                let uu____13471 =
                                  let uu____13472 =
                                    let uu____13477 =
                                      FStar_SMTEncoding_Term.unboxInt x  in
                                    let uu____13478 =
                                      FStar_SMTEncoding_Term.unboxInt y  in
                                    (uu____13477, uu____13478)  in
                                  FStar_SMTEncoding_Util.mkGT uu____13472  in
                                FStar_All.pipe_left
                                  FStar_SMTEncoding_Term.boxBool uu____13471
                                 in
                              quant xy uu____13470  in
                            (FStar_Parser_Const.op_GT, uu____13459)  in
                          let uu____13489 =
                            let uu____13506 =
                              let uu____13521 =
                                let uu____13532 =
                                  let uu____13533 =
                                    let uu____13534 =
                                      let uu____13539 =
                                        FStar_SMTEncoding_Term.unboxInt x  in
                                      let uu____13540 =
                                        FStar_SMTEncoding_Term.unboxInt y  in
                                      (uu____13539, uu____13540)  in
                                    FStar_SMTEncoding_Util.mkGTE uu____13534
                                     in
                                  FStar_All.pipe_left
                                    FStar_SMTEncoding_Term.boxBool
                                    uu____13533
                                   in
                                quant xy uu____13532  in
                              (FStar_Parser_Const.op_GTE, uu____13521)  in
                            let uu____13551 =
                              let uu____13568 =
                                let uu____13583 =
                                  let uu____13594 =
                                    let uu____13595 =
                                      let uu____13596 =
                                        let uu____13601 =
                                          FStar_SMTEncoding_Term.unboxInt x
                                           in
                                        let uu____13602 =
                                          FStar_SMTEncoding_Term.unboxInt y
                                           in
                                        (uu____13601, uu____13602)  in
                                      FStar_SMTEncoding_Util.mkSub
                                        uu____13596
                                       in
                                    FStar_All.pipe_left
                                      FStar_SMTEncoding_Term.boxInt
                                      uu____13595
                                     in
                                  quant xy uu____13594  in
                                (FStar_Parser_Const.op_Subtraction,
                                  uu____13583)
                                 in
                              let uu____13613 =
                                let uu____13630 =
                                  let uu____13645 =
                                    let uu____13656 =
                                      let uu____13657 =
                                        let uu____13658 =
                                          FStar_SMTEncoding_Term.unboxInt x
                                           in
                                        FStar_SMTEncoding_Util.mkMinus
                                          uu____13658
                                         in
                                      FStar_All.pipe_left
                                        FStar_SMTEncoding_Term.boxInt
                                        uu____13657
                                       in
                                    quant qx uu____13656  in
                                  (FStar_Parser_Const.op_Minus, uu____13645)
                                   in
                                let uu____13669 =
                                  let uu____13686 =
                                    let uu____13701 =
                                      let uu____13712 =
                                        let uu____13713 =
                                          let uu____13714 =
                                            let uu____13719 =
                                              FStar_SMTEncoding_Term.unboxInt
                                                x
                                               in
                                            let uu____13720 =
                                              FStar_SMTEncoding_Term.unboxInt
                                                y
                                               in
                                            (uu____13719, uu____13720)  in
                                          FStar_SMTEncoding_Util.mkAdd
                                            uu____13714
                                           in
                                        FStar_All.pipe_left
                                          FStar_SMTEncoding_Term.boxInt
                                          uu____13713
                                         in
                                      quant xy uu____13712  in
                                    (FStar_Parser_Const.op_Addition,
                                      uu____13701)
                                     in
                                  let uu____13731 =
                                    let uu____13748 =
                                      let uu____13763 =
                                        let uu____13774 =
                                          let uu____13775 =
                                            let uu____13776 =
                                              let uu____13781 =
                                                FStar_SMTEncoding_Term.unboxInt
                                                  x
                                                 in
                                              let uu____13782 =
                                                FStar_SMTEncoding_Term.unboxInt
                                                  y
                                                 in
                                              (uu____13781, uu____13782)  in
                                            FStar_SMTEncoding_Util.mkMul
                                              uu____13776
                                             in
                                          FStar_All.pipe_left
                                            FStar_SMTEncoding_Term.boxInt
                                            uu____13775
                                           in
                                        quant xy uu____13774  in
                                      (FStar_Parser_Const.op_Multiply,
                                        uu____13763)
                                       in
                                    let uu____13793 =
                                      let uu____13810 =
                                        let uu____13825 =
                                          let uu____13836 =
                                            let uu____13837 =
                                              let uu____13838 =
                                                let uu____13843 =
                                                  FStar_SMTEncoding_Term.unboxInt
                                                    x
                                                   in
                                                let uu____13844 =
                                                  FStar_SMTEncoding_Term.unboxInt
                                                    y
                                                   in
                                                (uu____13843, uu____13844)
                                                 in
                                              FStar_SMTEncoding_Util.mkDiv
                                                uu____13838
                                               in
                                            FStar_All.pipe_left
                                              FStar_SMTEncoding_Term.boxInt
                                              uu____13837
                                             in
                                          quant xy uu____13836  in
                                        (FStar_Parser_Const.op_Division,
                                          uu____13825)
                                         in
                                      let uu____13855 =
                                        let uu____13872 =
                                          let uu____13887 =
                                            let uu____13898 =
                                              let uu____13899 =
                                                let uu____13900 =
                                                  let uu____13905 =
                                                    FStar_SMTEncoding_Term.unboxInt
                                                      x
                                                     in
                                                  let uu____13906 =
                                                    FStar_SMTEncoding_Term.unboxInt
                                                      y
                                                     in
                                                  (uu____13905, uu____13906)
                                                   in
                                                FStar_SMTEncoding_Util.mkMod
                                                  uu____13900
                                                 in
                                              FStar_All.pipe_left
                                                FStar_SMTEncoding_Term.boxInt
                                                uu____13899
                                               in
                                            quant xy uu____13898  in
                                          (FStar_Parser_Const.op_Modulus,
                                            uu____13887)
                                           in
                                        let uu____13917 =
                                          let uu____13934 =
                                            let uu____13949 =
                                              let uu____13960 =
                                                let uu____13961 =
                                                  let uu____13962 =
                                                    let uu____13967 =
                                                      FStar_SMTEncoding_Term.unboxBool
                                                        x
                                                       in
                                                    let uu____13968 =
                                                      FStar_SMTEncoding_Term.unboxBool
                                                        y
                                                       in
                                                    (uu____13967,
                                                      uu____13968)
                                                     in
                                                  FStar_SMTEncoding_Util.mkAnd
                                                    uu____13962
                                                   in
                                                FStar_All.pipe_left
                                                  FStar_SMTEncoding_Term.boxBool
                                                  uu____13961
                                                 in
                                              quant xy uu____13960  in
                                            (FStar_Parser_Const.op_And,
                                              uu____13949)
                                             in
                                          let uu____13979 =
                                            let uu____13996 =
                                              let uu____14011 =
                                                let uu____14022 =
                                                  let uu____14023 =
                                                    let uu____14024 =
                                                      let uu____14029 =
                                                        FStar_SMTEncoding_Term.unboxBool
                                                          x
                                                         in
                                                      let uu____14030 =
                                                        FStar_SMTEncoding_Term.unboxBool
                                                          y
                                                         in
                                                      (uu____14029,
                                                        uu____14030)
                                                       in
                                                    FStar_SMTEncoding_Util.mkOr
                                                      uu____14024
                                                     in
                                                  FStar_All.pipe_left
                                                    FStar_SMTEncoding_Term.boxBool
                                                    uu____14023
                                                   in
                                                quant xy uu____14022  in
                                              (FStar_Parser_Const.op_Or,
                                                uu____14011)
                                               in
                                            let uu____14041 =
                                              let uu____14058 =
                                                let uu____14073 =
                                                  let uu____14084 =
                                                    let uu____14085 =
                                                      let uu____14086 =
                                                        FStar_SMTEncoding_Term.unboxBool
                                                          x
                                                         in
                                                      FStar_SMTEncoding_Util.mkNot
                                                        uu____14086
                                                       in
                                                    FStar_All.pipe_left
                                                      FStar_SMTEncoding_Term.boxBool
                                                      uu____14085
                                                     in
                                                  quant qx uu____14084  in
                                                (FStar_Parser_Const.op_Negation,
                                                  uu____14073)
                                                 in
                                              [uu____14058]  in
                                            uu____13996 :: uu____14041  in
                                          uu____13934 :: uu____13979  in
                                        uu____13872 :: uu____13917  in
                                      uu____13810 :: uu____13855  in
                                    uu____13748 :: uu____13793  in
                                  uu____13686 :: uu____13731  in
                                uu____13630 :: uu____13669  in
                              uu____13568 :: uu____13613  in
                            uu____13506 :: uu____13551  in
                          uu____13444 :: uu____13489  in
                        uu____13382 :: uu____13427  in
                      uu____13320 :: uu____13365  in
                    uu____13264 :: uu____13303  in
                  uu____13209 :: uu____13247  in
                let mk1 l v1 =
                  let uu____14336 =
                    let uu____14347 =
                      FStar_All.pipe_right prims1
                        (FStar_List.find
                           (fun uu____14413  ->
                              match uu____14413 with
                              | (l',uu____14429) ->
                                  FStar_Ident.lid_equals l l'))
                       in
                    FStar_All.pipe_right uu____14347
                      (FStar_Option.map
                         (fun uu____14501  ->
                            match uu____14501 with | (uu____14524,b) -> b v1))
                     in
                  FStar_All.pipe_right uu____14336 FStar_Option.get  in
                let is l =
                  FStar_All.pipe_right prims1
                    (FStar_Util.for_some
                       (fun uu____14609  ->
                          match uu____14609 with
                          | (l',uu____14625) -> FStar_Ident.lid_equals l l'))
                   in
                { mk = mk1; is }))
  
let (pretype_axiom :
  env_t ->
    FStar_SMTEncoding_Term.term ->
      (Prims.string,FStar_SMTEncoding_Term.sort)
        FStar_Pervasives_Native.tuple2 Prims.list ->
        FStar_SMTEncoding_Term.decl)
  =
  fun env  ->
    fun tapp  ->
      fun vars  ->
        let uu____14667 = fresh_fvar "x" FStar_SMTEncoding_Term.Term_sort  in
        match uu____14667 with
        | (xxsym,xx) ->
            let uu____14674 = fresh_fvar "f" FStar_SMTEncoding_Term.Fuel_sort
               in
            (match uu____14674 with
             | (ffsym,ff) ->
                 let xx_has_type =
                   FStar_SMTEncoding_Term.mk_HasTypeFuel ff xx tapp  in
                 let tapp_hash = FStar_SMTEncoding_Term.hash_of_term tapp  in
                 let module_name = env.current_module_name  in
                 let uu____14684 =
                   let uu____14691 =
                     let uu____14692 =
                       let uu____14703 =
                         let uu____14704 =
                           let uu____14709 =
                             let uu____14710 =
                               let uu____14715 =
                                 FStar_SMTEncoding_Util.mkApp
                                   ("PreType", [xx])
                                  in
                               (tapp, uu____14715)  in
                             FStar_SMTEncoding_Util.mkEq uu____14710  in
                           (xx_has_type, uu____14709)  in
                         FStar_SMTEncoding_Util.mkImp uu____14704  in
                       ([[xx_has_type]],
                         ((xxsym, FStar_SMTEncoding_Term.Term_sort) ::
                         (ffsym, FStar_SMTEncoding_Term.Fuel_sort) :: vars),
                         uu____14703)
                        in
                     FStar_SMTEncoding_Util.mkForall uu____14692  in
                   let uu____14740 =
                     let uu____14741 =
                       let uu____14742 =
                         let uu____14743 =
                           FStar_Util.digest_of_string tapp_hash  in
                         Prims.strcat "_pretyping_" uu____14743  in
                       Prims.strcat module_name uu____14742  in
                     varops.mk_unique uu____14741  in
                   (uu____14691, (FStar_Pervasives_Native.Some "pretyping"),
                     uu____14740)
                    in
                 FStar_SMTEncoding_Util.mkAssume uu____14684)
  
let (primitive_type_axioms :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      Prims.string ->
        FStar_SMTEncoding_Term.term -> FStar_SMTEncoding_Term.decl Prims.list)
  =
  let xx = ("x", FStar_SMTEncoding_Term.Term_sort)  in
  let x = FStar_SMTEncoding_Util.mkFreeV xx  in
  let yy = ("y", FStar_SMTEncoding_Term.Term_sort)  in
  let y = FStar_SMTEncoding_Util.mkFreeV yy  in
  let mk_unit env nm tt =
    let typing_pred = FStar_SMTEncoding_Term.mk_HasType x tt  in
    let uu____14779 =
      let uu____14780 =
        let uu____14787 =
          FStar_SMTEncoding_Term.mk_HasType
            FStar_SMTEncoding_Term.mk_Term_unit tt
           in
        (uu____14787, (FStar_Pervasives_Native.Some "unit typing"),
          "unit_typing")
         in
      FStar_SMTEncoding_Util.mkAssume uu____14780  in
    let uu____14790 =
      let uu____14793 =
        let uu____14794 =
          let uu____14801 =
            let uu____14802 =
              let uu____14813 =
                let uu____14814 =
                  let uu____14819 =
                    FStar_SMTEncoding_Util.mkEq
                      (x, FStar_SMTEncoding_Term.mk_Term_unit)
                     in
                  (typing_pred, uu____14819)  in
                FStar_SMTEncoding_Util.mkImp uu____14814  in
              ([[typing_pred]], [xx], uu____14813)  in
            mkForall_fuel uu____14802  in
          (uu____14801, (FStar_Pervasives_Native.Some "unit inversion"),
            "unit_inversion")
           in
        FStar_SMTEncoding_Util.mkAssume uu____14794  in
      [uu____14793]  in
    uu____14779 :: uu____14790  in
  let mk_bool env nm tt =
    let typing_pred = FStar_SMTEncoding_Term.mk_HasType x tt  in
    let bb = ("b", FStar_SMTEncoding_Term.Bool_sort)  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let uu____14861 =
      let uu____14862 =
        let uu____14869 =
          let uu____14870 =
            let uu____14881 =
              let uu____14886 =
                let uu____14889 = FStar_SMTEncoding_Term.boxBool b  in
                [uu____14889]  in
              [uu____14886]  in
            let uu____14894 =
              let uu____14895 = FStar_SMTEncoding_Term.boxBool b  in
              FStar_SMTEncoding_Term.mk_HasType uu____14895 tt  in
            (uu____14881, [bb], uu____14894)  in
          FStar_SMTEncoding_Util.mkForall uu____14870  in
        (uu____14869, (FStar_Pervasives_Native.Some "bool typing"),
          "bool_typing")
         in
      FStar_SMTEncoding_Util.mkAssume uu____14862  in
    let uu____14916 =
      let uu____14919 =
        let uu____14920 =
          let uu____14927 =
            let uu____14928 =
              let uu____14939 =
                let uu____14940 =
                  let uu____14945 =
                    FStar_SMTEncoding_Term.mk_tester
                      (FStar_Pervasives_Native.fst
                         FStar_SMTEncoding_Term.boxBoolFun) x
                     in
                  (typing_pred, uu____14945)  in
                FStar_SMTEncoding_Util.mkImp uu____14940  in
              ([[typing_pred]], [xx], uu____14939)  in
            mkForall_fuel uu____14928  in
          (uu____14927, (FStar_Pervasives_Native.Some "bool inversion"),
            "bool_inversion")
           in
        FStar_SMTEncoding_Util.mkAssume uu____14920  in
      [uu____14919]  in
    uu____14861 :: uu____14916  in
  let mk_int env nm tt =
    let typing_pred = FStar_SMTEncoding_Term.mk_HasType x tt  in
    let typing_pred_y = FStar_SMTEncoding_Term.mk_HasType y tt  in
    let aa = ("a", FStar_SMTEncoding_Term.Int_sort)  in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let bb = ("b", FStar_SMTEncoding_Term.Int_sort)  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let precedes =
      let uu____14995 =
        let uu____14996 =
          let uu____15003 =
            let uu____15006 =
              let uu____15009 =
                let uu____15012 = FStar_SMTEncoding_Term.boxInt a  in
                let uu____15013 =
                  let uu____15016 = FStar_SMTEncoding_Term.boxInt b  in
                  [uu____15016]  in
                uu____15012 :: uu____15013  in
              tt :: uu____15009  in
            tt :: uu____15006  in
          ("Prims.Precedes", uu____15003)  in
        FStar_SMTEncoding_Util.mkApp uu____14996  in
      FStar_All.pipe_left FStar_SMTEncoding_Term.mk_Valid uu____14995  in
    let precedes_y_x =
      let uu____15020 = FStar_SMTEncoding_Util.mkApp ("Precedes", [y; x])  in
      FStar_All.pipe_left FStar_SMTEncoding_Term.mk_Valid uu____15020  in
    let uu____15023 =
      let uu____15024 =
        let uu____15031 =
          let uu____15032 =
            let uu____15043 =
              let uu____15048 =
                let uu____15051 = FStar_SMTEncoding_Term.boxInt b  in
                [uu____15051]  in
              [uu____15048]  in
            let uu____15056 =
              let uu____15057 = FStar_SMTEncoding_Term.boxInt b  in
              FStar_SMTEncoding_Term.mk_HasType uu____15057 tt  in
            (uu____15043, [bb], uu____15056)  in
          FStar_SMTEncoding_Util.mkForall uu____15032  in
        (uu____15031, (FStar_Pervasives_Native.Some "int typing"),
          "int_typing")
         in
      FStar_SMTEncoding_Util.mkAssume uu____15024  in
    let uu____15078 =
      let uu____15081 =
        let uu____15082 =
          let uu____15089 =
            let uu____15090 =
              let uu____15101 =
                let uu____15102 =
                  let uu____15107 =
                    FStar_SMTEncoding_Term.mk_tester
                      (FStar_Pervasives_Native.fst
                         FStar_SMTEncoding_Term.boxIntFun) x
                     in
                  (typing_pred, uu____15107)  in
                FStar_SMTEncoding_Util.mkImp uu____15102  in
              ([[typing_pred]], [xx], uu____15101)  in
            mkForall_fuel uu____15090  in
          (uu____15089, (FStar_Pervasives_Native.Some "int inversion"),
            "int_inversion")
           in
        FStar_SMTEncoding_Util.mkAssume uu____15082  in
      let uu____15132 =
        let uu____15135 =
          let uu____15136 =
            let uu____15143 =
              let uu____15144 =
                let uu____15155 =
                  let uu____15156 =
                    let uu____15161 =
                      let uu____15162 =
                        let uu____15165 =
                          let uu____15168 =
                            let uu____15171 =
                              let uu____15172 =
                                let uu____15177 =
                                  FStar_SMTEncoding_Term.unboxInt x  in
                                let uu____15178 =
                                  FStar_SMTEncoding_Util.mkInteger'
                                    (Prims.parse_int "0")
                                   in
                                (uu____15177, uu____15178)  in
                              FStar_SMTEncoding_Util.mkGT uu____15172  in
                            let uu____15179 =
                              let uu____15182 =
                                let uu____15183 =
                                  let uu____15188 =
                                    FStar_SMTEncoding_Term.unboxInt y  in
                                  let uu____15189 =
                                    FStar_SMTEncoding_Util.mkInteger'
                                      (Prims.parse_int "0")
                                     in
                                  (uu____15188, uu____15189)  in
                                FStar_SMTEncoding_Util.mkGTE uu____15183  in
                              let uu____15190 =
                                let uu____15193 =
                                  let uu____15194 =
                                    let uu____15199 =
                                      FStar_SMTEncoding_Term.unboxInt y  in
                                    let uu____15200 =
                                      FStar_SMTEncoding_Term.unboxInt x  in
                                    (uu____15199, uu____15200)  in
                                  FStar_SMTEncoding_Util.mkLT uu____15194  in
                                [uu____15193]  in
                              uu____15182 :: uu____15190  in
                            uu____15171 :: uu____15179  in
                          typing_pred_y :: uu____15168  in
                        typing_pred :: uu____15165  in
                      FStar_SMTEncoding_Util.mk_and_l uu____15162  in
                    (uu____15161, precedes_y_x)  in
                  FStar_SMTEncoding_Util.mkImp uu____15156  in
                ([[typing_pred; typing_pred_y; precedes_y_x]], [xx; yy],
                  uu____15155)
                 in
              mkForall_fuel uu____15144  in
            (uu____15143,
              (FStar_Pervasives_Native.Some
                 "well-founded ordering on nat (alt)"),
              "well-founded-ordering-on-nat")
             in
          FStar_SMTEncoding_Util.mkAssume uu____15136  in
        [uu____15135]  in
      uu____15081 :: uu____15132  in
    uu____15023 :: uu____15078  in
  let mk_str env nm tt =
    let typing_pred = FStar_SMTEncoding_Term.mk_HasType x tt  in
    let bb = ("b", FStar_SMTEncoding_Term.String_sort)  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let uu____15246 =
      let uu____15247 =
        let uu____15254 =
          let uu____15255 =
            let uu____15266 =
              let uu____15271 =
                let uu____15274 = FStar_SMTEncoding_Term.boxString b  in
                [uu____15274]  in
              [uu____15271]  in
            let uu____15279 =
              let uu____15280 = FStar_SMTEncoding_Term.boxString b  in
              FStar_SMTEncoding_Term.mk_HasType uu____15280 tt  in
            (uu____15266, [bb], uu____15279)  in
          FStar_SMTEncoding_Util.mkForall uu____15255  in
        (uu____15254, (FStar_Pervasives_Native.Some "string typing"),
          "string_typing")
         in
      FStar_SMTEncoding_Util.mkAssume uu____15247  in
    let uu____15301 =
      let uu____15304 =
        let uu____15305 =
          let uu____15312 =
            let uu____15313 =
              let uu____15324 =
                let uu____15325 =
                  let uu____15330 =
                    FStar_SMTEncoding_Term.mk_tester
                      (FStar_Pervasives_Native.fst
                         FStar_SMTEncoding_Term.boxStringFun) x
                     in
                  (typing_pred, uu____15330)  in
                FStar_SMTEncoding_Util.mkImp uu____15325  in
              ([[typing_pred]], [xx], uu____15324)  in
            mkForall_fuel uu____15313  in
          (uu____15312, (FStar_Pervasives_Native.Some "string inversion"),
            "string_inversion")
           in
        FStar_SMTEncoding_Util.mkAssume uu____15305  in
      [uu____15304]  in
    uu____15246 :: uu____15301  in
  let mk_true_interp env nm true_tm =
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [true_tm])  in
    [FStar_SMTEncoding_Util.mkAssume
       (valid, (FStar_Pervasives_Native.Some "True interpretation"),
         "true_interp")]
     in
  let mk_false_interp env nm false_tm =
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [false_tm])  in
    let uu____15383 =
      let uu____15384 =
        let uu____15391 =
          FStar_SMTEncoding_Util.mkIff
            (FStar_SMTEncoding_Util.mkFalse, valid)
           in
        (uu____15391, (FStar_Pervasives_Native.Some "False interpretation"),
          "false_interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____15384  in
    [uu____15383]  in
  let mk_and_interp env conj uu____15403 =
    let aa = ("a", FStar_SMTEncoding_Term.Term_sort)  in
    let bb = ("b", FStar_SMTEncoding_Term.Term_sort)  in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let l_and_a_b = FStar_SMTEncoding_Util.mkApp (conj, [a; b])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [l_and_a_b])  in
    let valid_a = FStar_SMTEncoding_Util.mkApp ("Valid", [a])  in
    let valid_b = FStar_SMTEncoding_Util.mkApp ("Valid", [b])  in
    let uu____15428 =
      let uu____15429 =
        let uu____15436 =
          let uu____15437 =
            let uu____15448 =
              let uu____15449 =
                let uu____15454 =
                  FStar_SMTEncoding_Util.mkAnd (valid_a, valid_b)  in
                (uu____15454, valid)  in
              FStar_SMTEncoding_Util.mkIff uu____15449  in
            ([[l_and_a_b]], [aa; bb], uu____15448)  in
          FStar_SMTEncoding_Util.mkForall uu____15437  in
        (uu____15436, (FStar_Pervasives_Native.Some "/\\ interpretation"),
          "l_and-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____15429  in
    [uu____15428]  in
  let mk_or_interp env disj uu____15492 =
    let aa = ("a", FStar_SMTEncoding_Term.Term_sort)  in
    let bb = ("b", FStar_SMTEncoding_Term.Term_sort)  in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let l_or_a_b = FStar_SMTEncoding_Util.mkApp (disj, [a; b])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [l_or_a_b])  in
    let valid_a = FStar_SMTEncoding_Util.mkApp ("Valid", [a])  in
    let valid_b = FStar_SMTEncoding_Util.mkApp ("Valid", [b])  in
    let uu____15517 =
      let uu____15518 =
        let uu____15525 =
          let uu____15526 =
            let uu____15537 =
              let uu____15538 =
                let uu____15543 =
                  FStar_SMTEncoding_Util.mkOr (valid_a, valid_b)  in
                (uu____15543, valid)  in
              FStar_SMTEncoding_Util.mkIff uu____15538  in
            ([[l_or_a_b]], [aa; bb], uu____15537)  in
          FStar_SMTEncoding_Util.mkForall uu____15526  in
        (uu____15525, (FStar_Pervasives_Native.Some "\\/ interpretation"),
          "l_or-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____15518  in
    [uu____15517]  in
  let mk_eq2_interp env eq2 tt =
    let aa = ("a", FStar_SMTEncoding_Term.Term_sort)  in
    let xx1 = ("x", FStar_SMTEncoding_Term.Term_sort)  in
    let yy1 = ("y", FStar_SMTEncoding_Term.Term_sort)  in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let x1 = FStar_SMTEncoding_Util.mkFreeV xx1  in
    let y1 = FStar_SMTEncoding_Util.mkFreeV yy1  in
    let eq2_x_y = FStar_SMTEncoding_Util.mkApp (eq2, [a; x1; y1])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [eq2_x_y])  in
    let uu____15606 =
      let uu____15607 =
        let uu____15614 =
          let uu____15615 =
            let uu____15626 =
              let uu____15627 =
                let uu____15632 = FStar_SMTEncoding_Util.mkEq (x1, y1)  in
                (uu____15632, valid)  in
              FStar_SMTEncoding_Util.mkIff uu____15627  in
            ([[eq2_x_y]], [aa; xx1; yy1], uu____15626)  in
          FStar_SMTEncoding_Util.mkForall uu____15615  in
        (uu____15614, (FStar_Pervasives_Native.Some "Eq2 interpretation"),
          "eq2-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____15607  in
    [uu____15606]  in
  let mk_eq3_interp env eq3 tt =
    let aa = ("a", FStar_SMTEncoding_Term.Term_sort)  in
    let bb = ("b", FStar_SMTEncoding_Term.Term_sort)  in
    let xx1 = ("x", FStar_SMTEncoding_Term.Term_sort)  in
    let yy1 = ("y", FStar_SMTEncoding_Term.Term_sort)  in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let x1 = FStar_SMTEncoding_Util.mkFreeV xx1  in
    let y1 = FStar_SMTEncoding_Util.mkFreeV yy1  in
    let eq3_x_y = FStar_SMTEncoding_Util.mkApp (eq3, [a; b; x1; y1])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [eq3_x_y])  in
    let uu____15705 =
      let uu____15706 =
        let uu____15713 =
          let uu____15714 =
            let uu____15725 =
              let uu____15726 =
                let uu____15731 = FStar_SMTEncoding_Util.mkEq (x1, y1)  in
                (uu____15731, valid)  in
              FStar_SMTEncoding_Util.mkIff uu____15726  in
            ([[eq3_x_y]], [aa; bb; xx1; yy1], uu____15725)  in
          FStar_SMTEncoding_Util.mkForall uu____15714  in
        (uu____15713, (FStar_Pervasives_Native.Some "Eq3 interpretation"),
          "eq3-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____15706  in
    [uu____15705]  in
  let mk_imp_interp env imp tt =
    let aa = ("a", FStar_SMTEncoding_Term.Term_sort)  in
    let bb = ("b", FStar_SMTEncoding_Term.Term_sort)  in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let l_imp_a_b = FStar_SMTEncoding_Util.mkApp (imp, [a; b])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [l_imp_a_b])  in
    let valid_a = FStar_SMTEncoding_Util.mkApp ("Valid", [a])  in
    let valid_b = FStar_SMTEncoding_Util.mkApp ("Valid", [b])  in
    let uu____15802 =
      let uu____15803 =
        let uu____15810 =
          let uu____15811 =
            let uu____15822 =
              let uu____15823 =
                let uu____15828 =
                  FStar_SMTEncoding_Util.mkImp (valid_a, valid_b)  in
                (uu____15828, valid)  in
              FStar_SMTEncoding_Util.mkIff uu____15823  in
            ([[l_imp_a_b]], [aa; bb], uu____15822)  in
          FStar_SMTEncoding_Util.mkForall uu____15811  in
        (uu____15810, (FStar_Pervasives_Native.Some "==> interpretation"),
          "l_imp-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____15803  in
    [uu____15802]  in
  let mk_iff_interp env iff tt =
    let aa = ("a", FStar_SMTEncoding_Term.Term_sort)  in
    let bb = ("b", FStar_SMTEncoding_Term.Term_sort)  in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let l_iff_a_b = FStar_SMTEncoding_Util.mkApp (iff, [a; b])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [l_iff_a_b])  in
    let valid_a = FStar_SMTEncoding_Util.mkApp ("Valid", [a])  in
    let valid_b = FStar_SMTEncoding_Util.mkApp ("Valid", [b])  in
    let uu____15891 =
      let uu____15892 =
        let uu____15899 =
          let uu____15900 =
            let uu____15911 =
              let uu____15912 =
                let uu____15917 =
                  FStar_SMTEncoding_Util.mkIff (valid_a, valid_b)  in
                (uu____15917, valid)  in
              FStar_SMTEncoding_Util.mkIff uu____15912  in
            ([[l_iff_a_b]], [aa; bb], uu____15911)  in
          FStar_SMTEncoding_Util.mkForall uu____15900  in
        (uu____15899, (FStar_Pervasives_Native.Some "<==> interpretation"),
          "l_iff-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____15892  in
    [uu____15891]  in
  let mk_not_interp env l_not tt =
    let aa = ("a", FStar_SMTEncoding_Term.Term_sort)  in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let l_not_a = FStar_SMTEncoding_Util.mkApp (l_not, [a])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [l_not_a])  in
    let not_valid_a =
      let uu____15969 = FStar_SMTEncoding_Util.mkApp ("Valid", [a])  in
      FStar_All.pipe_left FStar_SMTEncoding_Util.mkNot uu____15969  in
    let uu____15972 =
      let uu____15973 =
        let uu____15980 =
          let uu____15981 =
            let uu____15992 =
              FStar_SMTEncoding_Util.mkIff (not_valid_a, valid)  in
            ([[l_not_a]], [aa], uu____15992)  in
          FStar_SMTEncoding_Util.mkForall uu____15981  in
        (uu____15980, (FStar_Pervasives_Native.Some "not interpretation"),
          "l_not-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____15973  in
    [uu____15972]  in
  let mk_forall_interp env for_all1 tt =
    let aa = ("a", FStar_SMTEncoding_Term.Term_sort)  in
    let bb = ("b", FStar_SMTEncoding_Term.Term_sort)  in
    let xx1 = ("x", FStar_SMTEncoding_Term.Term_sort)  in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let x1 = FStar_SMTEncoding_Util.mkFreeV xx1  in
    let l_forall_a_b = FStar_SMTEncoding_Util.mkApp (for_all1, [a; b])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [l_forall_a_b])  in
    let valid_b_x =
      let uu____16052 =
        let uu____16059 =
          let uu____16062 = FStar_SMTEncoding_Util.mk_ApplyTT b x1  in
          [uu____16062]  in
        ("Valid", uu____16059)  in
      FStar_SMTEncoding_Util.mkApp uu____16052  in
    let uu____16065 =
      let uu____16066 =
        let uu____16073 =
          let uu____16074 =
            let uu____16085 =
              let uu____16086 =
                let uu____16091 =
                  let uu____16092 =
                    let uu____16103 =
                      let uu____16108 =
                        let uu____16111 =
                          FStar_SMTEncoding_Term.mk_HasTypeZ x1 a  in
                        [uu____16111]  in
                      [uu____16108]  in
                    let uu____16116 =
                      let uu____16117 =
                        let uu____16122 =
                          FStar_SMTEncoding_Term.mk_HasTypeZ x1 a  in
                        (uu____16122, valid_b_x)  in
                      FStar_SMTEncoding_Util.mkImp uu____16117  in
                    (uu____16103, [xx1], uu____16116)  in
                  FStar_SMTEncoding_Util.mkForall uu____16092  in
                (uu____16091, valid)  in
              FStar_SMTEncoding_Util.mkIff uu____16086  in
            ([[l_forall_a_b]], [aa; bb], uu____16085)  in
          FStar_SMTEncoding_Util.mkForall uu____16074  in
        (uu____16073, (FStar_Pervasives_Native.Some "forall interpretation"),
          "forall-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____16066  in
    [uu____16065]  in
  let mk_exists_interp env for_some1 tt =
    let aa = ("a", FStar_SMTEncoding_Term.Term_sort)  in
    let bb = ("b", FStar_SMTEncoding_Term.Term_sort)  in
    let xx1 = ("x", FStar_SMTEncoding_Term.Term_sort)  in
    let a = FStar_SMTEncoding_Util.mkFreeV aa  in
    let b = FStar_SMTEncoding_Util.mkFreeV bb  in
    let x1 = FStar_SMTEncoding_Util.mkFreeV xx1  in
    let l_exists_a_b = FStar_SMTEncoding_Util.mkApp (for_some1, [a; b])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [l_exists_a_b])  in
    let valid_b_x =
      let uu____16204 =
        let uu____16211 =
          let uu____16214 = FStar_SMTEncoding_Util.mk_ApplyTT b x1  in
          [uu____16214]  in
        ("Valid", uu____16211)  in
      FStar_SMTEncoding_Util.mkApp uu____16204  in
    let uu____16217 =
      let uu____16218 =
        let uu____16225 =
          let uu____16226 =
            let uu____16237 =
              let uu____16238 =
                let uu____16243 =
                  let uu____16244 =
                    let uu____16255 =
                      let uu____16260 =
                        let uu____16263 =
                          FStar_SMTEncoding_Term.mk_HasTypeZ x1 a  in
                        [uu____16263]  in
                      [uu____16260]  in
                    let uu____16268 =
                      let uu____16269 =
                        let uu____16274 =
                          FStar_SMTEncoding_Term.mk_HasTypeZ x1 a  in
                        (uu____16274, valid_b_x)  in
                      FStar_SMTEncoding_Util.mkImp uu____16269  in
                    (uu____16255, [xx1], uu____16268)  in
                  FStar_SMTEncoding_Util.mkExists uu____16244  in
                (uu____16243, valid)  in
              FStar_SMTEncoding_Util.mkIff uu____16238  in
            ([[l_exists_a_b]], [aa; bb], uu____16237)  in
          FStar_SMTEncoding_Util.mkForall uu____16226  in
        (uu____16225, (FStar_Pervasives_Native.Some "exists interpretation"),
          "exists-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____16218  in
    [uu____16217]  in
  let mk_range_interp env range tt =
    let range_ty = FStar_SMTEncoding_Util.mkApp (range, [])  in
    let uu____16334 =
      let uu____16335 =
        let uu____16342 =
          let uu____16343 = FStar_SMTEncoding_Term.mk_Range_const ()  in
          FStar_SMTEncoding_Term.mk_HasTypeZ uu____16343 range_ty  in
        let uu____16344 = varops.mk_unique "typing_range_const"  in
        (uu____16342, (FStar_Pervasives_Native.Some "Range_const typing"),
          uu____16344)
         in
      FStar_SMTEncoding_Util.mkAssume uu____16335  in
    [uu____16334]  in
  let mk_inversion_axiom env inversion tt =
    let tt1 = ("t", FStar_SMTEncoding_Term.Term_sort)  in
    let t = FStar_SMTEncoding_Util.mkFreeV tt1  in
    let xx1 = ("x", FStar_SMTEncoding_Term.Term_sort)  in
    let x1 = FStar_SMTEncoding_Util.mkFreeV xx1  in
    let inversion_t = FStar_SMTEncoding_Util.mkApp (inversion, [t])  in
    let valid = FStar_SMTEncoding_Util.mkApp ("Valid", [inversion_t])  in
    let body =
      let hastypeZ = FStar_SMTEncoding_Term.mk_HasTypeZ x1 t  in
      let hastypeS =
        let uu____16378 = FStar_SMTEncoding_Term.n_fuel (Prims.parse_int "1")
           in
        FStar_SMTEncoding_Term.mk_HasTypeFuel uu____16378 x1 t  in
      let uu____16379 =
        let uu____16390 = FStar_SMTEncoding_Util.mkImp (hastypeZ, hastypeS)
           in
        ([[hastypeZ]], [xx1], uu____16390)  in
      FStar_SMTEncoding_Util.mkForall uu____16379  in
    let uu____16413 =
      let uu____16414 =
        let uu____16421 =
          let uu____16422 =
            let uu____16433 = FStar_SMTEncoding_Util.mkImp (valid, body)  in
            ([[inversion_t]], [tt1], uu____16433)  in
          FStar_SMTEncoding_Util.mkForall uu____16422  in
        (uu____16421,
          (FStar_Pervasives_Native.Some "inversion interpretation"),
          "inversion-interp")
         in
      FStar_SMTEncoding_Util.mkAssume uu____16414  in
    [uu____16413]  in
  let mk_with_type_axiom env with_type1 tt =
    let tt1 = ("t", FStar_SMTEncoding_Term.Term_sort)  in
    let t = FStar_SMTEncoding_Util.mkFreeV tt1  in
    let ee = ("e", FStar_SMTEncoding_Term.Term_sort)  in
    let e = FStar_SMTEncoding_Util.mkFreeV ee  in
    let with_type_t_e = FStar_SMTEncoding_Util.mkApp (with_type1, [t; e])  in
    let uu____16483 =
      let uu____16484 =
        let uu____16491 =
          let uu____16492 =
            let uu____16507 =
              let uu____16508 =
                let uu____16513 =
                  FStar_SMTEncoding_Util.mkEq (with_type_t_e, e)  in
                let uu____16514 =
                  FStar_SMTEncoding_Term.mk_HasType with_type_t_e t  in
                (uu____16513, uu____16514)  in
              FStar_SMTEncoding_Util.mkAnd uu____16508  in
            ([[with_type_t_e]],
              (FStar_Pervasives_Native.Some (Prims.parse_int "0")),
              [tt1; ee], uu____16507)
             in
          FStar_SMTEncoding_Util.mkForall' uu____16492  in
        (uu____16491,
          (FStar_Pervasives_Native.Some "with_type primitive axiom"),
          "@with_type_primitive_axiom")
         in
      FStar_SMTEncoding_Util.mkAssume uu____16484  in
    [uu____16483]  in
  let prims1 =
    [(FStar_Parser_Const.unit_lid, mk_unit);
    (FStar_Parser_Const.bool_lid, mk_bool);
    (FStar_Parser_Const.int_lid, mk_int);
    (FStar_Parser_Const.string_lid, mk_str);
    (FStar_Parser_Const.true_lid, mk_true_interp);
    (FStar_Parser_Const.false_lid, mk_false_interp);
    (FStar_Parser_Const.and_lid, mk_and_interp);
    (FStar_Parser_Const.or_lid, mk_or_interp);
    (FStar_Parser_Const.eq2_lid, mk_eq2_interp);
    (FStar_Parser_Const.eq3_lid, mk_eq3_interp);
    (FStar_Parser_Const.imp_lid, mk_imp_interp);
    (FStar_Parser_Const.iff_lid, mk_iff_interp);
    (FStar_Parser_Const.not_lid, mk_not_interp);
    (FStar_Parser_Const.forall_lid, mk_forall_interp);
    (FStar_Parser_Const.exists_lid, mk_exists_interp);
    (FStar_Parser_Const.range_lid, mk_range_interp);
    (FStar_Parser_Const.inversion_lid, mk_inversion_axiom);
    (FStar_Parser_Const.with_type_lid, mk_with_type_axiom)]  in
  fun env  ->
    fun t  ->
      fun s  ->
        fun tt  ->
          let uu____16860 =
            FStar_Util.find_opt
              (fun uu____16886  ->
                 match uu____16886 with
                 | (l,uu____16898) -> FStar_Ident.lid_equals l t) prims1
             in
          match uu____16860 with
          | FStar_Pervasives_Native.None  -> []
          | FStar_Pervasives_Native.Some (uu____16923,f) -> f env s tt
  
let (encode_smt_lemma :
  env_t ->
    FStar_Syntax_Syntax.fv ->
      FStar_Syntax_Syntax.typ -> FStar_SMTEncoding_Term.decl Prims.list)
  =
  fun env  ->
    fun fv  ->
      fun t  ->
        let lid = (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v  in
        let uu____16959 = encode_function_type_as_formula t env  in
        match uu____16959 with
        | (form,decls) ->
            FStar_List.append decls
              [FStar_SMTEncoding_Util.mkAssume
                 (form,
                   (FStar_Pervasives_Native.Some
                      (Prims.strcat "Lemma: " lid.FStar_Ident.str)),
                   (Prims.strcat "lemma_" lid.FStar_Ident.str))]
  
let (encode_free_var :
  Prims.bool ->
    env_t ->
      FStar_Syntax_Syntax.fv ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.term ->
            FStar_Syntax_Syntax.qualifier Prims.list ->
              (FStar_SMTEncoding_Term.decl Prims.list,env_t)
                FStar_Pervasives_Native.tuple2)
  =
  fun uninterpreted  ->
    fun env  ->
      fun fv  ->
        fun tt  ->
          fun t_norm  ->
            fun quals  ->
              let lid =
                (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v  in
              let uu____16999 =
                ((let uu____17002 =
                    (FStar_Syntax_Util.is_pure_or_ghost_function t_norm) ||
                      (FStar_TypeChecker_Env.is_reifiable_function env.tcenv
                         t_norm)
                     in
                  FStar_All.pipe_left Prims.op_Negation uu____17002) ||
                   (FStar_Syntax_Util.is_lemma t_norm))
                  || uninterpreted
                 in
              if uu____16999
              then
                let arg_sorts =
                  let uu____17012 =
                    let uu____17013 = FStar_Syntax_Subst.compress t_norm  in
                    uu____17013.FStar_Syntax_Syntax.n  in
                  match uu____17012 with
                  | FStar_Syntax_Syntax.Tm_arrow (binders,uu____17019) ->
                      FStar_All.pipe_right binders
                        (FStar_List.map
                           (fun uu____17049  ->
                              FStar_SMTEncoding_Term.Term_sort))
                  | uu____17054 -> []  in
                let arity = FStar_List.length arg_sorts  in
                let uu____17056 =
                  new_term_constant_and_tok_from_lid env lid arity  in
                match uu____17056 with
                | (vname,vtok,env1) ->
                    let d =
                      FStar_SMTEncoding_Term.DeclFun
                        (vname, arg_sorts, FStar_SMTEncoding_Term.Term_sort,
                          (FStar_Pervasives_Native.Some
                             "Uninterpreted function symbol for impure function"))
                       in
                    let dd =
                      FStar_SMTEncoding_Term.DeclFun
                        (vtok, [], FStar_SMTEncoding_Term.Term_sort,
                          (FStar_Pervasives_Native.Some
                             "Uninterpreted name for impure function"))
                       in
                    ([d; dd], env1)
              else
                (let uu____17089 = prims.is lid  in
                 if uu____17089
                 then
                   let vname = varops.new_fvar lid  in
                   let uu____17097 = prims.mk lid vname  in
                   match uu____17097 with
                   | (tok,arity,definition) ->
                       let env1 =
                         push_free_var env lid arity vname
                           (FStar_Pervasives_Native.Some tok)
                          in
                       (definition, env1)
                 else
                   (let encode_non_total_function_typ =
                      lid.FStar_Ident.nsstr <> "Prims"  in
                    let uu____17124 =
                      let uu____17135 = curried_arrow_formals_comp t_norm  in
                      match uu____17135 with
                      | (args,comp) ->
                          let comp1 =
                            let uu____17153 =
                              FStar_TypeChecker_Env.is_reifiable_comp
                                env.tcenv comp
                               in
                            if uu____17153
                            then
                              let uu____17154 =
                                FStar_TypeChecker_Env.reify_comp
                                  (let uu___119_17157 = env.tcenv  in
                                   {
                                     FStar_TypeChecker_Env.solver =
                                       (uu___119_17157.FStar_TypeChecker_Env.solver);
                                     FStar_TypeChecker_Env.range =
                                       (uu___119_17157.FStar_TypeChecker_Env.range);
                                     FStar_TypeChecker_Env.curmodule =
                                       (uu___119_17157.FStar_TypeChecker_Env.curmodule);
                                     FStar_TypeChecker_Env.gamma =
                                       (uu___119_17157.FStar_TypeChecker_Env.gamma);
                                     FStar_TypeChecker_Env.gamma_cache =
                                       (uu___119_17157.FStar_TypeChecker_Env.gamma_cache);
                                     FStar_TypeChecker_Env.modules =
                                       (uu___119_17157.FStar_TypeChecker_Env.modules);
                                     FStar_TypeChecker_Env.expected_typ =
                                       (uu___119_17157.FStar_TypeChecker_Env.expected_typ);
                                     FStar_TypeChecker_Env.sigtab =
                                       (uu___119_17157.FStar_TypeChecker_Env.sigtab);
                                     FStar_TypeChecker_Env.is_pattern =
                                       (uu___119_17157.FStar_TypeChecker_Env.is_pattern);
                                     FStar_TypeChecker_Env.instantiate_imp =
                                       (uu___119_17157.FStar_TypeChecker_Env.instantiate_imp);
                                     FStar_TypeChecker_Env.effects =
                                       (uu___119_17157.FStar_TypeChecker_Env.effects);
                                     FStar_TypeChecker_Env.generalize =
                                       (uu___119_17157.FStar_TypeChecker_Env.generalize);
                                     FStar_TypeChecker_Env.letrecs =
                                       (uu___119_17157.FStar_TypeChecker_Env.letrecs);
                                     FStar_TypeChecker_Env.top_level =
                                       (uu___119_17157.FStar_TypeChecker_Env.top_level);
                                     FStar_TypeChecker_Env.check_uvars =
                                       (uu___119_17157.FStar_TypeChecker_Env.check_uvars);
                                     FStar_TypeChecker_Env.use_eq =
                                       (uu___119_17157.FStar_TypeChecker_Env.use_eq);
                                     FStar_TypeChecker_Env.is_iface =
                                       (uu___119_17157.FStar_TypeChecker_Env.is_iface);
                                     FStar_TypeChecker_Env.admit =
                                       (uu___119_17157.FStar_TypeChecker_Env.admit);
                                     FStar_TypeChecker_Env.lax = true;
                                     FStar_TypeChecker_Env.lax_universes =
                                       (uu___119_17157.FStar_TypeChecker_Env.lax_universes);
                                     FStar_TypeChecker_Env.failhard =
                                       (uu___119_17157.FStar_TypeChecker_Env.failhard);
                                     FStar_TypeChecker_Env.nosynth =
                                       (uu___119_17157.FStar_TypeChecker_Env.nosynth);
                                     FStar_TypeChecker_Env.tc_term =
                                       (uu___119_17157.FStar_TypeChecker_Env.tc_term);
                                     FStar_TypeChecker_Env.type_of =
                                       (uu___119_17157.FStar_TypeChecker_Env.type_of);
                                     FStar_TypeChecker_Env.universe_of =
                                       (uu___119_17157.FStar_TypeChecker_Env.universe_of);
                                     FStar_TypeChecker_Env.check_type_of =
                                       (uu___119_17157.FStar_TypeChecker_Env.check_type_of);
                                     FStar_TypeChecker_Env.use_bv_sorts =
                                       (uu___119_17157.FStar_TypeChecker_Env.use_bv_sorts);
                                     FStar_TypeChecker_Env.qtbl_name_and_index
                                       =
                                       (uu___119_17157.FStar_TypeChecker_Env.qtbl_name_and_index);
                                     FStar_TypeChecker_Env.proof_ns =
                                       (uu___119_17157.FStar_TypeChecker_Env.proof_ns);
                                     FStar_TypeChecker_Env.synth =
                                       (uu___119_17157.FStar_TypeChecker_Env.synth);
                                     FStar_TypeChecker_Env.is_native_tactic =
                                       (uu___119_17157.FStar_TypeChecker_Env.is_native_tactic);
                                     FStar_TypeChecker_Env.identifier_info =
                                       (uu___119_17157.FStar_TypeChecker_Env.identifier_info);
                                     FStar_TypeChecker_Env.tc_hooks =
                                       (uu___119_17157.FStar_TypeChecker_Env.tc_hooks);
                                     FStar_TypeChecker_Env.dsenv =
                                       (uu___119_17157.FStar_TypeChecker_Env.dsenv);
                                     FStar_TypeChecker_Env.dep_graph =
                                       (uu___119_17157.FStar_TypeChecker_Env.dep_graph)
                                   }) comp FStar_Syntax_Syntax.U_unknown
                                 in
                              FStar_Syntax_Syntax.mk_Total uu____17154
                            else comp  in
                          if encode_non_total_function_typ
                          then
                            let uu____17169 =
                              FStar_TypeChecker_Util.pure_or_ghost_pre_and_post
                                env.tcenv comp1
                               in
                            (args, uu____17169)
                          else
                            (args,
                              (FStar_Pervasives_Native.None,
                                (FStar_Syntax_Util.comp_result comp1)))
                       in
                    match uu____17124 with
                    | (formals,(pre_opt,res_t)) ->
                        let arity = FStar_List.length formals  in
                        let uu____17219 =
                          new_term_constant_and_tok_from_lid env lid arity
                           in
                        (match uu____17219 with
                         | (vname,vtok,env1) ->
                             let vtok_tm =
                               match formals with
                               | [] ->
                                   FStar_SMTEncoding_Util.mkFreeV
                                     (vname,
                                       FStar_SMTEncoding_Term.Term_sort)
                               | uu____17244 ->
                                   FStar_SMTEncoding_Util.mkApp (vtok, [])
                                in
                             let mk_disc_proj_axioms guard encoded_res_t vapp
                               vars =
                               FStar_All.pipe_right quals
                                 (FStar_List.collect
                                    (fun uu___91_17286  ->
                                       match uu___91_17286 with
                                       | FStar_Syntax_Syntax.Discriminator d
                                           ->
                                           let uu____17290 =
                                             FStar_Util.prefix vars  in
                                           (match uu____17290 with
                                            | (uu____17311,(xxsym,uu____17313))
                                                ->
                                                let xx =
                                                  FStar_SMTEncoding_Util.mkFreeV
                                                    (xxsym,
                                                      FStar_SMTEncoding_Term.Term_sort)
                                                   in
                                                let uu____17331 =
                                                  let uu____17332 =
                                                    let uu____17339 =
                                                      let uu____17340 =
                                                        let uu____17351 =
                                                          let uu____17352 =
                                                            let uu____17357 =
                                                              let uu____17358
                                                                =
                                                                FStar_SMTEncoding_Term.mk_tester
                                                                  (escape
                                                                    d.FStar_Ident.str)
                                                                  xx
                                                                 in
                                                              FStar_All.pipe_left
                                                                FStar_SMTEncoding_Term.boxBool
                                                                uu____17358
                                                               in
                                                            (vapp,
                                                              uu____17357)
                                                             in
                                                          FStar_SMTEncoding_Util.mkEq
                                                            uu____17352
                                                           in
                                                        ([[vapp]], vars,
                                                          uu____17351)
                                                         in
                                                      FStar_SMTEncoding_Util.mkForall
                                                        uu____17340
                                                       in
                                                    (uu____17339,
                                                      (FStar_Pervasives_Native.Some
                                                         "Discriminator equation"),
                                                      (Prims.strcat
                                                         "disc_equation_"
                                                         (escape
                                                            d.FStar_Ident.str)))
                                                     in
                                                  FStar_SMTEncoding_Util.mkAssume
                                                    uu____17332
                                                   in
                                                [uu____17331])
                                       | FStar_Syntax_Syntax.Projector 
                                           (d,f) ->
                                           let uu____17377 =
                                             FStar_Util.prefix vars  in
                                           (match uu____17377 with
                                            | (uu____17398,(xxsym,uu____17400))
                                                ->
                                                let xx =
                                                  FStar_SMTEncoding_Util.mkFreeV
                                                    (xxsym,
                                                      FStar_SMTEncoding_Term.Term_sort)
                                                   in
                                                let f1 =
                                                  {
                                                    FStar_Syntax_Syntax.ppname
                                                      = f;
                                                    FStar_Syntax_Syntax.index
                                                      = (Prims.parse_int "0");
                                                    FStar_Syntax_Syntax.sort
                                                      =
                                                      FStar_Syntax_Syntax.tun
                                                  }  in
                                                let tp_name =
                                                  mk_term_projector_name d f1
                                                   in
                                                let prim_app =
                                                  FStar_SMTEncoding_Util.mkApp
                                                    (tp_name, [xx])
                                                   in
                                                let uu____17423 =
                                                  let uu____17424 =
                                                    let uu____17431 =
                                                      let uu____17432 =
                                                        let uu____17443 =
                                                          FStar_SMTEncoding_Util.mkEq
                                                            (vapp, prim_app)
                                                           in
                                                        ([[vapp]], vars,
                                                          uu____17443)
                                                         in
                                                      FStar_SMTEncoding_Util.mkForall
                                                        uu____17432
                                                       in
                                                    (uu____17431,
                                                      (FStar_Pervasives_Native.Some
                                                         "Projector equation"),
                                                      (Prims.strcat
                                                         "proj_equation_"
                                                         tp_name))
                                                     in
                                                  FStar_SMTEncoding_Util.mkAssume
                                                    uu____17424
                                                   in
                                                [uu____17423])
                                       | uu____17460 -> []))
                                in
                             let uu____17461 =
                               encode_binders FStar_Pervasives_Native.None
                                 formals env1
                                in
                             (match uu____17461 with
                              | (vars,guards,env',decls1,uu____17488) ->
                                  let uu____17501 =
                                    match pre_opt with
                                    | FStar_Pervasives_Native.None  ->
                                        let uu____17510 =
                                          FStar_SMTEncoding_Util.mk_and_l
                                            guards
                                           in
                                        (uu____17510, decls1)
                                    | FStar_Pervasives_Native.Some p ->
                                        let uu____17512 =
                                          encode_formula p env'  in
                                        (match uu____17512 with
                                         | (g,ds) ->
                                             let uu____17523 =
                                               FStar_SMTEncoding_Util.mk_and_l
                                                 (g :: guards)
                                                in
                                             (uu____17523,
                                               (FStar_List.append decls1 ds)))
                                     in
                                  (match uu____17501 with
                                   | (guard,decls11) ->
                                       let vtok_app = mk_Apply vtok_tm vars
                                          in
                                       let vapp =
                                         let uu____17536 =
                                           let uu____17543 =
                                             FStar_List.map
                                               FStar_SMTEncoding_Util.mkFreeV
                                               vars
                                              in
                                           (vname, uu____17543)  in
                                         FStar_SMTEncoding_Util.mkApp
                                           uu____17536
                                          in
                                       let uu____17552 =
                                         let vname_decl =
                                           let uu____17560 =
                                             let uu____17571 =
                                               FStar_All.pipe_right formals
                                                 (FStar_List.map
                                                    (fun uu____17581  ->
                                                       FStar_SMTEncoding_Term.Term_sort))
                                                in
                                             (vname, uu____17571,
                                               FStar_SMTEncoding_Term.Term_sort,
                                               FStar_Pervasives_Native.None)
                                              in
                                           FStar_SMTEncoding_Term.DeclFun
                                             uu____17560
                                            in
                                         let uu____17590 =
                                           let env2 =
                                             let uu___120_17596 = env1  in
                                             {
                                               bindings =
                                                 (uu___120_17596.bindings);
                                               depth = (uu___120_17596.depth);
                                               tcenv = (uu___120_17596.tcenv);
                                               warn = (uu___120_17596.warn);
                                               cache = (uu___120_17596.cache);
                                               nolabels =
                                                 (uu___120_17596.nolabels);
                                               use_zfuel_name =
                                                 (uu___120_17596.use_zfuel_name);
                                               encode_non_total_function_typ;
                                               current_module_name =
                                                 (uu___120_17596.current_module_name)
                                             }  in
                                           let uu____17597 =
                                             let uu____17598 =
                                               head_normal env2 tt  in
                                             Prims.op_Negation uu____17598
                                              in
                                           if uu____17597
                                           then
                                             encode_term_pred
                                               FStar_Pervasives_Native.None
                                               tt env2 vtok_tm
                                           else
                                             encode_term_pred
                                               FStar_Pervasives_Native.None
                                               t_norm env2 vtok_tm
                                            in
                                         match uu____17590 with
                                         | (tok_typing,decls2) ->
                                             let tok_typing1 =
                                               match formals with
                                               | uu____17613::uu____17614 ->
                                                   let ff =
                                                     ("ty",
                                                       FStar_SMTEncoding_Term.Term_sort)
                                                      in
                                                   let f =
                                                     FStar_SMTEncoding_Util.mkFreeV
                                                       ff
                                                      in
                                                   let vtok_app_l =
                                                     mk_Apply vtok_tm [ff]
                                                      in
                                                   let vtok_app_r =
                                                     mk_Apply f
                                                       [(vtok,
                                                          FStar_SMTEncoding_Term.Term_sort)]
                                                      in
                                                   let guarded_tok_typing =
                                                     let uu____17654 =
                                                       let uu____17665 =
                                                         FStar_SMTEncoding_Term.mk_NoHoist
                                                           f tok_typing
                                                          in
                                                       ([[vtok_app_l];
                                                        [vtok_app_r]], 
                                                         [ff], uu____17665)
                                                        in
                                                     FStar_SMTEncoding_Util.mkForall
                                                       uu____17654
                                                      in
                                                   FStar_SMTEncoding_Util.mkAssume
                                                     (guarded_tok_typing,
                                                       (FStar_Pervasives_Native.Some
                                                          "function token typing"),
                                                       (Prims.strcat
                                                          "function_token_typing_"
                                                          vname))
                                               | uu____17692 ->
                                                   FStar_SMTEncoding_Util.mkAssume
                                                     (tok_typing,
                                                       (FStar_Pervasives_Native.Some
                                                          "function token typing"),
                                                       (Prims.strcat
                                                          "function_token_typing_"
                                                          vname))
                                                in
                                             let uu____17695 =
                                               match formals with
                                               | [] ->
                                                   let uu____17712 =
                                                     let uu____17713 =
                                                       let uu____17716 =
                                                         FStar_SMTEncoding_Util.mkFreeV
                                                           (vname,
                                                             FStar_SMTEncoding_Term.Term_sort)
                                                          in
                                                       FStar_All.pipe_left
                                                         (fun _0_41  ->
                                                            FStar_Pervasives_Native.Some
                                                              _0_41)
                                                         uu____17716
                                                        in
                                                     push_free_var env1 lid
                                                       arity vname
                                                       uu____17713
                                                      in
                                                   ((FStar_List.append decls2
                                                       [tok_typing1]),
                                                     uu____17712)
                                               | uu____17725 ->
                                                   let vtok_decl =
                                                     FStar_SMTEncoding_Term.DeclFun
                                                       (vtok, [],
                                                         FStar_SMTEncoding_Term.Term_sort,
                                                         FStar_Pervasives_Native.None)
                                                      in
                                                   let name_tok_corr =
                                                     let uu____17732 =
                                                       let uu____17739 =
                                                         let uu____17740 =
                                                           let uu____17751 =
                                                             FStar_SMTEncoding_Util.mkEq
                                                               (vtok_app,
                                                                 vapp)
                                                              in
                                                           ([[vtok_app];
                                                            [vapp]], vars,
                                                             uu____17751)
                                                            in
                                                         FStar_SMTEncoding_Util.mkForall
                                                           uu____17740
                                                          in
                                                       (uu____17739,
                                                         (FStar_Pervasives_Native.Some
                                                            "Name-token correspondence"),
                                                         (Prims.strcat
                                                            "token_correspondence_"
                                                            vname))
                                                        in
                                                     FStar_SMTEncoding_Util.mkAssume
                                                       uu____17732
                                                      in
                                                   ((FStar_List.append decls2
                                                       [vtok_decl;
                                                       name_tok_corr;
                                                       tok_typing1]), env1)
                                                in
                                             (match uu____17695 with
                                              | (tok_decl,env2) ->
                                                  ((vname_decl :: tok_decl),
                                                    env2))
                                          in
                                       (match uu____17552 with
                                        | (decls2,env2) ->
                                            let uu____17794 =
                                              let res_t1 =
                                                FStar_Syntax_Subst.compress
                                                  res_t
                                                 in
                                              let uu____17802 =
                                                encode_term res_t1 env'  in
                                              match uu____17802 with
                                              | (encoded_res_t,decls) ->
                                                  let uu____17815 =
                                                    FStar_SMTEncoding_Term.mk_HasType
                                                      vapp encoded_res_t
                                                     in
                                                  (encoded_res_t,
                                                    uu____17815, decls)
                                               in
                                            (match uu____17794 with
                                             | (encoded_res_t,ty_pred,decls3)
                                                 ->
                                                 let typingAx =
                                                   let uu____17826 =
                                                     let uu____17833 =
                                                       let uu____17834 =
                                                         let uu____17845 =
                                                           FStar_SMTEncoding_Util.mkImp
                                                             (guard, ty_pred)
                                                            in
                                                         ([[vapp]], vars,
                                                           uu____17845)
                                                          in
                                                       FStar_SMTEncoding_Util.mkForall
                                                         uu____17834
                                                        in
                                                     (uu____17833,
                                                       (FStar_Pervasives_Native.Some
                                                          "free var typing"),
                                                       (Prims.strcat
                                                          "typing_" vname))
                                                      in
                                                   FStar_SMTEncoding_Util.mkAssume
                                                     uu____17826
                                                    in
                                                 let freshness =
                                                   let uu____17861 =
                                                     FStar_All.pipe_right
                                                       quals
                                                       (FStar_List.contains
                                                          FStar_Syntax_Syntax.New)
                                                      in
                                                   if uu____17861
                                                   then
                                                     let uu____17866 =
                                                       let uu____17867 =
                                                         let uu____17878 =
                                                           FStar_All.pipe_right
                                                             vars
                                                             (FStar_List.map
                                                                FStar_Pervasives_Native.snd)
                                                            in
                                                         let uu____17889 =
                                                           varops.next_id ()
                                                            in
                                                         (vname, uu____17878,
                                                           FStar_SMTEncoding_Term.Term_sort,
                                                           uu____17889)
                                                          in
                                                       FStar_SMTEncoding_Term.fresh_constructor
                                                         uu____17867
                                                        in
                                                     let uu____17892 =
                                                       let uu____17895 =
                                                         pretype_axiom env2
                                                           vapp vars
                                                          in
                                                       [uu____17895]  in
                                                     uu____17866 ::
                                                       uu____17892
                                                   else []  in
                                                 let g =
                                                   let uu____17900 =
                                                     let uu____17903 =
                                                       let uu____17906 =
                                                         let uu____17909 =
                                                           let uu____17912 =
                                                             mk_disc_proj_axioms
                                                               guard
                                                               encoded_res_t
                                                               vapp vars
                                                              in
                                                           typingAx ::
                                                             uu____17912
                                                            in
                                                         FStar_List.append
                                                           freshness
                                                           uu____17909
                                                          in
                                                       FStar_List.append
                                                         decls3 uu____17906
                                                        in
                                                     FStar_List.append decls2
                                                       uu____17903
                                                      in
                                                   FStar_List.append decls11
                                                     uu____17900
                                                    in
                                                 (g, env2))))))))
  
let (declare_top_level_let :
  env_t ->
    FStar_Syntax_Syntax.fv ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.term ->
          (fvar_binding,FStar_SMTEncoding_Term.decl Prims.list,env_t)
            FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun x  ->
      fun t  ->
        fun t_norm  ->
          let uu____17937 =
            try_lookup_lid env
              (x.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          match uu____17937 with
          | FStar_Pervasives_Native.None  ->
              let uu____17948 = encode_free_var false env x t t_norm []  in
              (match uu____17948 with
               | (decls,env1) ->
                   let fvb =
                     lookup_lid env1
                       (x.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                      in
                   (fvb, decls, env1))
          | FStar_Pervasives_Native.Some fvb -> (fvb, [], env)
  
let (encode_top_level_val :
  Prims.bool ->
    env_t ->
      FStar_Syntax_Syntax.fv ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.qualifier Prims.list ->
            (FStar_SMTEncoding_Term.decl Prims.list,env_t)
              FStar_Pervasives_Native.tuple2)
  =
  fun uninterpreted  ->
    fun env  ->
      fun lid  ->
        fun t  ->
          fun quals  ->
            let tt = norm env t  in
            let uu____18001 =
              encode_free_var uninterpreted env lid t tt quals  in
            match uu____18001 with
            | (decls,env1) ->
                let uu____18020 = FStar_Syntax_Util.is_smt_lemma t  in
                if uu____18020
                then
                  let uu____18027 =
                    let uu____18030 = encode_smt_lemma env1 lid tt  in
                    FStar_List.append decls uu____18030  in
                  (uu____18027, env1)
                else (decls, env1)
  
let (encode_top_level_vals :
  env_t ->
    FStar_Syntax_Syntax.letbinding Prims.list ->
      FStar_Syntax_Syntax.qualifier Prims.list ->
        (FStar_SMTEncoding_Term.decl Prims.list,env_t)
          FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun bindings  ->
      fun quals  ->
        FStar_All.pipe_right bindings
          (FStar_List.fold_left
             (fun uu____18082  ->
                fun lb  ->
                  match uu____18082 with
                  | (decls,env1) ->
                      let uu____18102 =
                        let uu____18109 =
                          FStar_Util.right lb.FStar_Syntax_Syntax.lbname  in
                        encode_top_level_val false env1 uu____18109
                          lb.FStar_Syntax_Syntax.lbtyp quals
                         in
                      (match uu____18102 with
                       | (decls',env2) ->
                           ((FStar_List.append decls decls'), env2)))
             ([], env))
  
let (is_tactic : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t  ->
    let fstar_tactics_tactic_lid =
      FStar_Parser_Const.p2l ["FStar"; "Tactics"; "tactic"]  in
    let uu____18130 = FStar_Syntax_Util.head_and_args t  in
    match uu____18130 with
    | (hd1,args) ->
        let uu____18167 =
          let uu____18168 = FStar_Syntax_Util.un_uinst hd1  in
          uu____18168.FStar_Syntax_Syntax.n  in
        (match uu____18167 with
         | FStar_Syntax_Syntax.Tm_fvar fv when
             FStar_Syntax_Syntax.fv_eq_lid fv fstar_tactics_tactic_lid ->
             true
         | FStar_Syntax_Syntax.Tm_arrow (uu____18172,c) ->
             let effect_name = FStar_Syntax_Util.comp_effect_name c  in
             FStar_Util.starts_with "FStar.Tactics"
               effect_name.FStar_Ident.str
         | uu____18191 -> false)
  
let (encode_top_level_let :
  env_t ->
    (Prims.bool,FStar_Syntax_Syntax.letbinding Prims.list)
      FStar_Pervasives_Native.tuple2 ->
      FStar_Syntax_Syntax.qualifier Prims.list ->
        (FStar_SMTEncoding_Term.decl Prims.list,env_t)
          FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun uu____18213  ->
      fun quals  ->
        match uu____18213 with
        | (is_rec,bindings) ->
            let eta_expand1 binders formals body t =
              let nbinders = FStar_List.length binders  in
              let uu____18289 = FStar_Util.first_N nbinders formals  in
              match uu____18289 with
              | (formals1,extra_formals) ->
                  let subst1 =
                    FStar_List.map2
                      (fun uu____18370  ->
                         fun uu____18371  ->
                           match (uu____18370, uu____18371) with
                           | ((formal,uu____18389),(binder,uu____18391)) ->
                               let uu____18400 =
                                 let uu____18407 =
                                   FStar_Syntax_Syntax.bv_to_name binder  in
                                 (formal, uu____18407)  in
                               FStar_Syntax_Syntax.NT uu____18400) formals1
                      binders
                     in
                  let extra_formals1 =
                    let uu____18415 =
                      FStar_All.pipe_right extra_formals
                        (FStar_List.map
                           (fun uu____18446  ->
                              match uu____18446 with
                              | (x,i) ->
                                  let uu____18457 =
                                    let uu___121_18458 = x  in
                                    let uu____18459 =
                                      FStar_Syntax_Subst.subst subst1
                                        x.FStar_Syntax_Syntax.sort
                                       in
                                    {
                                      FStar_Syntax_Syntax.ppname =
                                        (uu___121_18458.FStar_Syntax_Syntax.ppname);
                                      FStar_Syntax_Syntax.index =
                                        (uu___121_18458.FStar_Syntax_Syntax.index);
                                      FStar_Syntax_Syntax.sort = uu____18459
                                    }  in
                                  (uu____18457, i)))
                       in
                    FStar_All.pipe_right uu____18415
                      FStar_Syntax_Util.name_binders
                     in
                  let body1 =
                    let uu____18477 =
                      let uu____18478 = FStar_Syntax_Subst.compress body  in
                      let uu____18479 =
                        let uu____18480 =
                          FStar_Syntax_Util.args_of_binders extra_formals1
                           in
                        FStar_All.pipe_left FStar_Pervasives_Native.snd
                          uu____18480
                         in
                      FStar_Syntax_Syntax.extend_app_n uu____18478
                        uu____18479
                       in
                    uu____18477 FStar_Pervasives_Native.None
                      body.FStar_Syntax_Syntax.pos
                     in
                  ((FStar_List.append binders extra_formals1), body1)
               in
            let destruct_bound_function flid t_norm e =
              let get_result_type c =
                let uu____18541 =
                  FStar_TypeChecker_Env.is_reifiable_comp env.tcenv c  in
                if uu____18541
                then
                  FStar_TypeChecker_Env.reify_comp
                    (let uu___122_18544 = env.tcenv  in
                     {
                       FStar_TypeChecker_Env.solver =
                         (uu___122_18544.FStar_TypeChecker_Env.solver);
                       FStar_TypeChecker_Env.range =
                         (uu___122_18544.FStar_TypeChecker_Env.range);
                       FStar_TypeChecker_Env.curmodule =
                         (uu___122_18544.FStar_TypeChecker_Env.curmodule);
                       FStar_TypeChecker_Env.gamma =
                         (uu___122_18544.FStar_TypeChecker_Env.gamma);
                       FStar_TypeChecker_Env.gamma_cache =
                         (uu___122_18544.FStar_TypeChecker_Env.gamma_cache);
                       FStar_TypeChecker_Env.modules =
                         (uu___122_18544.FStar_TypeChecker_Env.modules);
                       FStar_TypeChecker_Env.expected_typ =
                         (uu___122_18544.FStar_TypeChecker_Env.expected_typ);
                       FStar_TypeChecker_Env.sigtab =
                         (uu___122_18544.FStar_TypeChecker_Env.sigtab);
                       FStar_TypeChecker_Env.is_pattern =
                         (uu___122_18544.FStar_TypeChecker_Env.is_pattern);
                       FStar_TypeChecker_Env.instantiate_imp =
                         (uu___122_18544.FStar_TypeChecker_Env.instantiate_imp);
                       FStar_TypeChecker_Env.effects =
                         (uu___122_18544.FStar_TypeChecker_Env.effects);
                       FStar_TypeChecker_Env.generalize =
                         (uu___122_18544.FStar_TypeChecker_Env.generalize);
                       FStar_TypeChecker_Env.letrecs =
                         (uu___122_18544.FStar_TypeChecker_Env.letrecs);
                       FStar_TypeChecker_Env.top_level =
                         (uu___122_18544.FStar_TypeChecker_Env.top_level);
                       FStar_TypeChecker_Env.check_uvars =
                         (uu___122_18544.FStar_TypeChecker_Env.check_uvars);
                       FStar_TypeChecker_Env.use_eq =
                         (uu___122_18544.FStar_TypeChecker_Env.use_eq);
                       FStar_TypeChecker_Env.is_iface =
                         (uu___122_18544.FStar_TypeChecker_Env.is_iface);
                       FStar_TypeChecker_Env.admit =
                         (uu___122_18544.FStar_TypeChecker_Env.admit);
                       FStar_TypeChecker_Env.lax = true;
                       FStar_TypeChecker_Env.lax_universes =
                         (uu___122_18544.FStar_TypeChecker_Env.lax_universes);
                       FStar_TypeChecker_Env.failhard =
                         (uu___122_18544.FStar_TypeChecker_Env.failhard);
                       FStar_TypeChecker_Env.nosynth =
                         (uu___122_18544.FStar_TypeChecker_Env.nosynth);
                       FStar_TypeChecker_Env.tc_term =
                         (uu___122_18544.FStar_TypeChecker_Env.tc_term);
                       FStar_TypeChecker_Env.type_of =
                         (uu___122_18544.FStar_TypeChecker_Env.type_of);
                       FStar_TypeChecker_Env.universe_of =
                         (uu___122_18544.FStar_TypeChecker_Env.universe_of);
                       FStar_TypeChecker_Env.check_type_of =
                         (uu___122_18544.FStar_TypeChecker_Env.check_type_of);
                       FStar_TypeChecker_Env.use_bv_sorts =
                         (uu___122_18544.FStar_TypeChecker_Env.use_bv_sorts);
                       FStar_TypeChecker_Env.qtbl_name_and_index =
                         (uu___122_18544.FStar_TypeChecker_Env.qtbl_name_and_index);
                       FStar_TypeChecker_Env.proof_ns =
                         (uu___122_18544.FStar_TypeChecker_Env.proof_ns);
                       FStar_TypeChecker_Env.synth =
                         (uu___122_18544.FStar_TypeChecker_Env.synth);
                       FStar_TypeChecker_Env.is_native_tactic =
                         (uu___122_18544.FStar_TypeChecker_Env.is_native_tactic);
                       FStar_TypeChecker_Env.identifier_info =
                         (uu___122_18544.FStar_TypeChecker_Env.identifier_info);
                       FStar_TypeChecker_Env.tc_hooks =
                         (uu___122_18544.FStar_TypeChecker_Env.tc_hooks);
                       FStar_TypeChecker_Env.dsenv =
                         (uu___122_18544.FStar_TypeChecker_Env.dsenv);
                       FStar_TypeChecker_Env.dep_graph =
                         (uu___122_18544.FStar_TypeChecker_Env.dep_graph)
                     }) c FStar_Syntax_Syntax.U_unknown
                else FStar_Syntax_Util.comp_result c  in
              let rec aux norm1 t_norm1 =
                let uu____18577 = FStar_Syntax_Util.abs_formals e  in
                match uu____18577 with
                | (binders,body,lopt) ->
                    (match binders with
                     | uu____18641::uu____18642 ->
                         let uu____18657 =
                           let uu____18658 =
                             let uu____18661 =
                               FStar_Syntax_Subst.compress t_norm1  in
                             FStar_All.pipe_left FStar_Syntax_Util.unascribe
                               uu____18661
                              in
                           uu____18658.FStar_Syntax_Syntax.n  in
                         (match uu____18657 with
                          | FStar_Syntax_Syntax.Tm_arrow (formals,c) ->
                              let uu____18704 =
                                FStar_Syntax_Subst.open_comp formals c  in
                              (match uu____18704 with
                               | (formals1,c1) ->
                                   let nformals = FStar_List.length formals1
                                      in
                                   let nbinders = FStar_List.length binders
                                      in
                                   let tres = get_result_type c1  in
                                   let uu____18746 =
                                     (nformals < nbinders) &&
                                       (FStar_Syntax_Util.is_total_comp c1)
                                      in
                                   if uu____18746
                                   then
                                     let uu____18781 =
                                       FStar_Util.first_N nformals binders
                                        in
                                     (match uu____18781 with
                                      | (bs0,rest) ->
                                          let c2 =
                                            let subst1 =
                                              FStar_List.map2
                                                (fun uu____18875  ->
                                                   fun uu____18876  ->
                                                     match (uu____18875,
                                                             uu____18876)
                                                     with
                                                     | ((x,uu____18894),
                                                        (b,uu____18896)) ->
                                                         let uu____18905 =
                                                           let uu____18912 =
                                                             FStar_Syntax_Syntax.bv_to_name
                                                               b
                                                              in
                                                           (x, uu____18912)
                                                            in
                                                         FStar_Syntax_Syntax.NT
                                                           uu____18905)
                                                formals1 bs0
                                               in
                                            FStar_Syntax_Subst.subst_comp
                                              subst1 c1
                                             in
                                          let body1 =
                                            FStar_Syntax_Util.abs rest body
                                              lopt
                                             in
                                          let uu____18914 =
                                            let uu____18935 =
                                              get_result_type c2  in
                                            (bs0, body1, bs0, uu____18935)
                                             in
                                          (uu____18914, false))
                                   else
                                     if nformals > nbinders
                                     then
                                       (let uu____19003 =
                                          eta_expand1 binders formals1 body
                                            tres
                                           in
                                        match uu____19003 with
                                        | (binders1,body1) ->
                                            ((binders1, body1, formals1,
                                               tres), false))
                                     else
                                       ((binders, body, formals1, tres),
                                         false))
                          | FStar_Syntax_Syntax.Tm_refine (x,uu____19092) ->
                              let uu____19097 =
                                let uu____19118 =
                                  aux norm1 x.FStar_Syntax_Syntax.sort  in
                                FStar_Pervasives_Native.fst uu____19118  in
                              (uu____19097, true)
                          | uu____19183 when Prims.op_Negation norm1 ->
                              let t_norm2 =
                                FStar_TypeChecker_Normalize.normalize
                                  [FStar_TypeChecker_Normalize.AllowUnboundUniverses;
                                  FStar_TypeChecker_Normalize.Beta;
                                  FStar_TypeChecker_Normalize.Weak;
                                  FStar_TypeChecker_Normalize.HNF;
                                  FStar_TypeChecker_Normalize.Exclude
                                    FStar_TypeChecker_Normalize.Zeta;
                                  FStar_TypeChecker_Normalize.UnfoldUntil
                                    FStar_Syntax_Syntax.Delta_constant;
                                  FStar_TypeChecker_Normalize.EraseUniverses]
                                  env.tcenv t_norm1
                                 in
                              aux true t_norm2
                          | uu____19185 ->
                              let uu____19186 =
                                let uu____19187 =
                                  FStar_Syntax_Print.term_to_string e  in
                                let uu____19188 =
                                  FStar_Syntax_Print.term_to_string t_norm1
                                   in
                                FStar_Util.format3
                                  "Impossible! let-bound lambda %s = %s has a type that's not a function: %s\n"
                                  flid.FStar_Ident.str uu____19187
                                  uu____19188
                                 in
                              failwith uu____19186)
                     | uu____19213 ->
                         let rec aux' t_norm2 =
                           let uu____19238 =
                             let uu____19239 =
                               FStar_Syntax_Subst.compress t_norm2  in
                             uu____19239.FStar_Syntax_Syntax.n  in
                           match uu____19238 with
                           | FStar_Syntax_Syntax.Tm_arrow (formals,c) ->
                               let uu____19280 =
                                 FStar_Syntax_Subst.open_comp formals c  in
                               (match uu____19280 with
                                | (formals1,c1) ->
                                    let tres = get_result_type c1  in
                                    let uu____19308 =
                                      eta_expand1 [] formals1 e tres  in
                                    (match uu____19308 with
                                     | (binders1,body1) ->
                                         ((binders1, body1, formals1, tres),
                                           false)))
                           | FStar_Syntax_Syntax.Tm_refine (bv,uu____19388)
                               -> aux' bv.FStar_Syntax_Syntax.sort
                           | uu____19393 -> (([], e, [], t_norm2), false)  in
                         aux' t_norm1)
                 in
              aux false t_norm  in
            (try
               let uu____19449 =
                 FStar_All.pipe_right bindings
                   (FStar_Util.for_all
                      (fun lb  ->
                         (FStar_Syntax_Util.is_lemma
                            lb.FStar_Syntax_Syntax.lbtyp)
                           || (is_tactic lb.FStar_Syntax_Syntax.lbtyp)))
                  in
               if uu____19449
               then encode_top_level_vals env bindings quals
               else
                 (let uu____19461 =
                    FStar_All.pipe_right bindings
                      (FStar_List.fold_left
                         (fun uu____19524  ->
                            fun lb  ->
                              match uu____19524 with
                              | (toks,typs,decls,env1) ->
                                  ((let uu____19579 =
                                      FStar_Syntax_Util.is_lemma
                                        lb.FStar_Syntax_Syntax.lbtyp
                                       in
                                    if uu____19579
                                    then FStar_Exn.raise Let_rec_unencodeable
                                    else ());
                                   (let t_norm =
                                      whnf env1 lb.FStar_Syntax_Syntax.lbtyp
                                       in
                                    let uu____19582 =
                                      let uu____19591 =
                                        FStar_Util.right
                                          lb.FStar_Syntax_Syntax.lbname
                                         in
                                      declare_top_level_let env1 uu____19591
                                        lb.FStar_Syntax_Syntax.lbtyp t_norm
                                       in
                                    match uu____19582 with
                                    | (tok,decl,env2) ->
                                        ((tok :: toks), (t_norm :: typs),
                                          (decl :: decls), env2))))
                         ([], [], [], env))
                     in
                  match uu____19461 with
                  | (toks,typs,decls,env1) ->
                      let toks_fvbs = FStar_List.rev toks  in
                      let decls1 =
                        FStar_All.pipe_right (FStar_List.rev decls)
                          FStar_List.flatten
                         in
                      let typs1 = FStar_List.rev typs  in
                      let mk_app1 rng curry fvb vars =
                        let mk_fv uu____19706 =
                          if fvb.smt_arity = (Prims.parse_int "0")
                          then
                            FStar_SMTEncoding_Util.mkFreeV
                              ((fvb.smt_id),
                                FStar_SMTEncoding_Term.Term_sort)
                          else
                            raise_arity_mismatch fvb.smt_id fvb.smt_arity
                              (Prims.parse_int "0") rng
                           in
                        match vars with
                        | [] -> mk_fv ()
                        | uu____19712 ->
                            if curry
                            then
                              (match fvb.smt_token with
                               | FStar_Pervasives_Native.Some ftok ->
                                   mk_Apply ftok vars
                               | FStar_Pervasives_Native.None  ->
                                   let uu____19720 = mk_fv ()  in
                                   mk_Apply uu____19720 vars)
                            else
                              (let uu____19722 =
                                 FStar_List.map
                                   FStar_SMTEncoding_Util.mkFreeV vars
                                  in
                               maybe_curry_app rng
                                 (FStar_SMTEncoding_Term.Var (fvb.smt_id))
                                 fvb.smt_arity uu____19722)
                         in
                      let encode_non_rec_lbdef bindings1 typs2 toks1 env2 =
                        match (bindings1, typs2, toks1) with
                        | ({ FStar_Syntax_Syntax.lbname = lbn;
                             FStar_Syntax_Syntax.lbunivs = uvs;
                             FStar_Syntax_Syntax.lbtyp = uu____19774;
                             FStar_Syntax_Syntax.lbeff = uu____19775;
                             FStar_Syntax_Syntax.lbdef = e;
                             FStar_Syntax_Syntax.lbattrs = uu____19777;
                             FStar_Syntax_Syntax.lbpos = uu____19778;_}::[],t_norm::[],fvb::[])
                            ->
                            let flid = fvb.fvar_lid  in
                            let uu____19802 =
                              let uu____19809 =
                                FStar_TypeChecker_Env.open_universes_in
                                  env2.tcenv uvs [e; t_norm]
                                 in
                              match uu____19809 with
                              | (tcenv',uu____19827,e_t) ->
                                  let uu____19833 =
                                    match e_t with
                                    | e1::t_norm1::[] -> (e1, t_norm1)
                                    | uu____19844 -> failwith "Impossible"
                                     in
                                  (match uu____19833 with
                                   | (e1,t_norm1) ->
                                       ((let uu___125_19860 = env2  in
                                         {
                                           bindings =
                                             (uu___125_19860.bindings);
                                           depth = (uu___125_19860.depth);
                                           tcenv = tcenv';
                                           warn = (uu___125_19860.warn);
                                           cache = (uu___125_19860.cache);
                                           nolabels =
                                             (uu___125_19860.nolabels);
                                           use_zfuel_name =
                                             (uu___125_19860.use_zfuel_name);
                                           encode_non_total_function_typ =
                                             (uu___125_19860.encode_non_total_function_typ);
                                           current_module_name =
                                             (uu___125_19860.current_module_name)
                                         }), e1, t_norm1))
                               in
                            (match uu____19802 with
                             | (env',e1,t_norm1) ->
                                 let uu____19870 =
                                   destruct_bound_function flid t_norm1 e1
                                    in
                                 (match uu____19870 with
                                  | ((binders,body,uu____19891,t_body),curry)
                                      ->
                                      ((let uu____19903 =
                                          FStar_All.pipe_left
                                            (FStar_TypeChecker_Env.debug
                                               env2.tcenv)
                                            (FStar_Options.Other
                                               "SMTEncoding")
                                           in
                                        if uu____19903
                                        then
                                          let uu____19904 =
                                            FStar_Syntax_Print.binders_to_string
                                              ", " binders
                                             in
                                          let uu____19905 =
                                            FStar_Syntax_Print.term_to_string
                                              body
                                             in
                                          FStar_Util.print2
                                            "Encoding let : binders=[%s], body=%s\n"
                                            uu____19904 uu____19905
                                        else ());
                                       (let uu____19907 =
                                          encode_binders
                                            FStar_Pervasives_Native.None
                                            binders env'
                                           in
                                        match uu____19907 with
                                        | (vars,guards,env'1,binder_decls,uu____19934)
                                            ->
                                            let body1 =
                                              let uu____19948 =
                                                FStar_TypeChecker_Env.is_reifiable_function
                                                  env'1.tcenv t_norm1
                                                 in
                                              if uu____19948
                                              then
                                                FStar_TypeChecker_Util.reify_body
                                                  env'1.tcenv body
                                              else
                                                FStar_Syntax_Util.ascribe
                                                  body
                                                  ((FStar_Util.Inl t_body),
                                                    FStar_Pervasives_Native.None)
                                               in
                                            let app =
                                              let uu____19965 =
                                                FStar_Syntax_Util.range_of_lbname
                                                  lbn
                                                 in
                                              mk_app1 uu____19965 curry fvb
                                                vars
                                               in
                                            let uu____19966 =
                                              let uu____19975 =
                                                FStar_All.pipe_right quals
                                                  (FStar_List.contains
                                                     FStar_Syntax_Syntax.Logic)
                                                 in
                                              if uu____19975
                                              then
                                                let uu____19986 =
                                                  FStar_SMTEncoding_Term.mk_Valid
                                                    app
                                                   in
                                                let uu____19987 =
                                                  encode_formula body1 env'1
                                                   in
                                                (uu____19986, uu____19987)
                                              else
                                                (let uu____19997 =
                                                   encode_term body1 env'1
                                                    in
                                                 (app, uu____19997))
                                               in
                                            (match uu____19966 with
                                             | (app1,(body2,decls2)) ->
                                                 let eqn =
                                                   let uu____20020 =
                                                     let uu____20027 =
                                                       let uu____20028 =
                                                         let uu____20039 =
                                                           FStar_SMTEncoding_Util.mkEq
                                                             (app1, body2)
                                                            in
                                                         ([[app1]], vars,
                                                           uu____20039)
                                                          in
                                                       FStar_SMTEncoding_Util.mkForall
                                                         uu____20028
                                                        in
                                                     let uu____20050 =
                                                       let uu____20053 =
                                                         FStar_Util.format1
                                                           "Equation for %s"
                                                           flid.FStar_Ident.str
                                                          in
                                                       FStar_Pervasives_Native.Some
                                                         uu____20053
                                                        in
                                                     (uu____20027,
                                                       uu____20050,
                                                       (Prims.strcat
                                                          "equation_"
                                                          fvb.smt_id))
                                                      in
                                                   FStar_SMTEncoding_Util.mkAssume
                                                     uu____20020
                                                    in
                                                 let uu____20056 =
                                                   let uu____20059 =
                                                     let uu____20062 =
                                                       let uu____20065 =
                                                         let uu____20068 =
                                                           primitive_type_axioms
                                                             env2.tcenv flid
                                                             fvb.smt_id app1
                                                            in
                                                         FStar_List.append
                                                           [eqn] uu____20068
                                                          in
                                                       FStar_List.append
                                                         decls2 uu____20065
                                                        in
                                                     FStar_List.append
                                                       binder_decls
                                                       uu____20062
                                                      in
                                                   FStar_List.append decls1
                                                     uu____20059
                                                    in
                                                 (uu____20056, env2))))))
                        | uu____20073 -> failwith "Impossible"  in
                      let encode_rec_lbdefs bindings1 typs2 toks1 env2 =
                        let fuel =
                          let uu____20128 = varops.fresh "fuel"  in
                          (uu____20128, FStar_SMTEncoding_Term.Fuel_sort)  in
                        let fuel_tm = FStar_SMTEncoding_Util.mkFreeV fuel  in
                        let env0 = env2  in
                        let uu____20131 =
                          FStar_All.pipe_right toks1
                            (FStar_List.fold_left
                               (fun uu____20178  ->
                                  fun fvb  ->
                                    match uu____20178 with
                                    | (gtoks,env3) ->
                                        let flid = fvb.fvar_lid  in
                                        let g =
                                          let uu____20224 =
                                            FStar_Ident.lid_add_suffix flid
                                              "fuel_instrumented"
                                             in
                                          varops.new_fvar uu____20224  in
                                        let gtok =
                                          let uu____20226 =
                                            FStar_Ident.lid_add_suffix flid
                                              "fuel_instrumented_token"
                                             in
                                          varops.new_fvar uu____20226  in
                                        let env4 =
                                          let uu____20228 =
                                            let uu____20231 =
                                              FStar_SMTEncoding_Util.mkApp
                                                (g, [fuel_tm])
                                               in
                                            FStar_All.pipe_left
                                              (fun _0_42  ->
                                                 FStar_Pervasives_Native.Some
                                                   _0_42) uu____20231
                                             in
                                          push_free_var env3 flid
                                            fvb.smt_arity gtok uu____20228
                                           in
                                        (((fvb, g, gtok) :: gtoks), env4))
                               ([], env2))
                           in
                        match uu____20131 with
                        | (gtoks,env3) ->
                            let gtoks1 = FStar_List.rev gtoks  in
                            let encode_one_binding env01 uu____20331 t_norm
                              uu____20333 =
                              match (uu____20331, uu____20333) with
                              | ((fvb,g,gtok),{
                                                FStar_Syntax_Syntax.lbname =
                                                  lbn;
                                                FStar_Syntax_Syntax.lbunivs =
                                                  uvs;
                                                FStar_Syntax_Syntax.lbtyp =
                                                  uu____20363;
                                                FStar_Syntax_Syntax.lbeff =
                                                  uu____20364;
                                                FStar_Syntax_Syntax.lbdef = e;
                                                FStar_Syntax_Syntax.lbattrs =
                                                  uu____20366;
                                                FStar_Syntax_Syntax.lbpos =
                                                  uu____20367;_})
                                  ->
                                  let uu____20388 =
                                    let uu____20395 =
                                      FStar_TypeChecker_Env.open_universes_in
                                        env3.tcenv uvs [e; t_norm]
                                       in
                                    match uu____20395 with
                                    | (tcenv',uu____20417,e_t) ->
                                        let uu____20423 =
                                          match e_t with
                                          | e1::t_norm1::[] -> (e1, t_norm1)
                                          | uu____20434 ->
                                              failwith "Impossible"
                                           in
                                        (match uu____20423 with
                                         | (e1,t_norm1) ->
                                             ((let uu___126_20450 = env3  in
                                               {
                                                 bindings =
                                                   (uu___126_20450.bindings);
                                                 depth =
                                                   (uu___126_20450.depth);
                                                 tcenv = tcenv';
                                                 warn = (uu___126_20450.warn);
                                                 cache =
                                                   (uu___126_20450.cache);
                                                 nolabels =
                                                   (uu___126_20450.nolabels);
                                                 use_zfuel_name =
                                                   (uu___126_20450.use_zfuel_name);
                                                 encode_non_total_function_typ
                                                   =
                                                   (uu___126_20450.encode_non_total_function_typ);
                                                 current_module_name =
                                                   (uu___126_20450.current_module_name)
                                               }), e1, t_norm1))
                                     in
                                  (match uu____20388 with
                                   | (env',e1,t_norm1) ->
                                       ((let uu____20465 =
                                           FStar_All.pipe_left
                                             (FStar_TypeChecker_Env.debug
                                                env01.tcenv)
                                             (FStar_Options.Other
                                                "SMTEncoding")
                                            in
                                         if uu____20465
                                         then
                                           let uu____20466 =
                                             FStar_Syntax_Print.lbname_to_string
                                               lbn
                                              in
                                           let uu____20467 =
                                             FStar_Syntax_Print.term_to_string
                                               t_norm1
                                              in
                                           let uu____20468 =
                                             FStar_Syntax_Print.term_to_string
                                               e1
                                              in
                                           FStar_Util.print3
                                             "Encoding let rec %s : %s = %s\n"
                                             uu____20466 uu____20467
                                             uu____20468
                                         else ());
                                        (let uu____20470 =
                                           destruct_bound_function
                                             fvb.fvar_lid t_norm1 e1
                                            in
                                         match uu____20470 with
                                         | ((binders,body,formals,tres),curry)
                                             ->
                                             ((let uu____20507 =
                                                 FStar_All.pipe_left
                                                   (FStar_TypeChecker_Env.debug
                                                      env01.tcenv)
                                                   (FStar_Options.Other
                                                      "SMTEncoding")
                                                  in
                                               if uu____20507
                                               then
                                                 let uu____20508 =
                                                   FStar_Syntax_Print.binders_to_string
                                                     ", " binders
                                                    in
                                                 let uu____20509 =
                                                   FStar_Syntax_Print.term_to_string
                                                     body
                                                    in
                                                 let uu____20510 =
                                                   FStar_Syntax_Print.binders_to_string
                                                     ", " formals
                                                    in
                                                 let uu____20511 =
                                                   FStar_Syntax_Print.term_to_string
                                                     tres
                                                    in
                                                 FStar_Util.print4
                                                   "Encoding let rec: binders=[%s], body=%s, formals=[%s], tres=%s\n"
                                                   uu____20508 uu____20509
                                                   uu____20510 uu____20511
                                               else ());
                                              if curry
                                              then
                                                failwith
                                                  "Unexpected type of let rec in SMT Encoding; expected it to be annotated with an arrow type"
                                              else ();
                                              (let uu____20515 =
                                                 encode_binders
                                                   FStar_Pervasives_Native.None
                                                   binders env'
                                                  in
                                               match uu____20515 with
                                               | (vars,guards,env'1,binder_decls,uu____20546)
                                                   ->
                                                   let decl_g =
                                                     let uu____20560 =
                                                       let uu____20571 =
                                                         let uu____20574 =
                                                           FStar_List.map
                                                             FStar_Pervasives_Native.snd
                                                             vars
                                                            in
                                                         FStar_SMTEncoding_Term.Fuel_sort
                                                           :: uu____20574
                                                          in
                                                       (g, uu____20571,
                                                         FStar_SMTEncoding_Term.Term_sort,
                                                         (FStar_Pervasives_Native.Some
                                                            "Fuel-instrumented function name"))
                                                        in
                                                     FStar_SMTEncoding_Term.DeclFun
                                                       uu____20560
                                                      in
                                                   let env02 =
                                                     push_zfuel_name env01
                                                       fvb.fvar_lid g
                                                      in
                                                   let decl_g_tok =
                                                     FStar_SMTEncoding_Term.DeclFun
                                                       (gtok, [],
                                                         FStar_SMTEncoding_Term.Term_sort,
                                                         (FStar_Pervasives_Native.Some
                                                            "Token for fuel-instrumented partial applications"))
                                                      in
                                                   let vars_tm =
                                                     FStar_List.map
                                                       FStar_SMTEncoding_Util.mkFreeV
                                                       vars
                                                      in
                                                   let app =
                                                     let uu____20599 =
                                                       let uu____20606 =
                                                         FStar_List.map
                                                           FStar_SMTEncoding_Util.mkFreeV
                                                           vars
                                                          in
                                                       ((fvb.smt_id),
                                                         uu____20606)
                                                        in
                                                     FStar_SMTEncoding_Util.mkApp
                                                       uu____20599
                                                      in
                                                   let gsapp =
                                                     let uu____20616 =
                                                       let uu____20623 =
                                                         let uu____20626 =
                                                           FStar_SMTEncoding_Util.mkApp
                                                             ("SFuel",
                                                               [fuel_tm])
                                                            in
                                                         uu____20626 ::
                                                           vars_tm
                                                          in
                                                       (g, uu____20623)  in
                                                     FStar_SMTEncoding_Util.mkApp
                                                       uu____20616
                                                      in
                                                   let gmax =
                                                     let uu____20632 =
                                                       let uu____20639 =
                                                         let uu____20642 =
                                                           FStar_SMTEncoding_Util.mkApp
                                                             ("MaxFuel", [])
                                                            in
                                                         uu____20642 ::
                                                           vars_tm
                                                          in
                                                       (g, uu____20639)  in
                                                     FStar_SMTEncoding_Util.mkApp
                                                       uu____20632
                                                      in
                                                   let body1 =
                                                     let uu____20648 =
                                                       FStar_TypeChecker_Env.is_reifiable_function
                                                         env'1.tcenv t_norm1
                                                        in
                                                     if uu____20648
                                                     then
                                                       FStar_TypeChecker_Util.reify_body
                                                         env'1.tcenv body
                                                     else body  in
                                                   let uu____20650 =
                                                     encode_term body1 env'1
                                                      in
                                                   (match uu____20650 with
                                                    | (body_tm,decls2) ->
                                                        let eqn_g =
                                                          let uu____20668 =
                                                            let uu____20675 =
                                                              let uu____20676
                                                                =
                                                                let uu____20691
                                                                  =
                                                                  FStar_SMTEncoding_Util.mkEq
                                                                    (gsapp,
                                                                    body_tm)
                                                                   in
                                                                ([[gsapp]],
                                                                  (FStar_Pervasives_Native.Some
                                                                    (Prims.parse_int "0")),
                                                                  (fuel ::
                                                                  vars),
                                                                  uu____20691)
                                                                 in
                                                              FStar_SMTEncoding_Util.mkForall'
                                                                uu____20676
                                                               in
                                                            let uu____20712 =
                                                              let uu____20715
                                                                =
                                                                FStar_Util.format1
                                                                  "Equation for fuel-instrumented recursive function: %s"
                                                                  (fvb.fvar_lid).FStar_Ident.str
                                                                 in
                                                              FStar_Pervasives_Native.Some
                                                                uu____20715
                                                               in
                                                            (uu____20675,
                                                              uu____20712,
                                                              (Prims.strcat
                                                                 "equation_with_fuel_"
                                                                 g))
                                                             in
                                                          FStar_SMTEncoding_Util.mkAssume
                                                            uu____20668
                                                           in
                                                        let eqn_f =
                                                          let uu____20719 =
                                                            let uu____20726 =
                                                              let uu____20727
                                                                =
                                                                let uu____20738
                                                                  =
                                                                  FStar_SMTEncoding_Util.mkEq
                                                                    (app,
                                                                    gmax)
                                                                   in
                                                                ([[app]],
                                                                  vars,
                                                                  uu____20738)
                                                                 in
                                                              FStar_SMTEncoding_Util.mkForall
                                                                uu____20727
                                                               in
                                                            (uu____20726,
                                                              (FStar_Pervasives_Native.Some
                                                                 "Correspondence of recursive function to instrumented version"),
                                                              (Prims.strcat
                                                                 "@fuel_correspondence_"
                                                                 g))
                                                             in
                                                          FStar_SMTEncoding_Util.mkAssume
                                                            uu____20719
                                                           in
                                                        let eqn_g' =
                                                          let uu____20752 =
                                                            let uu____20759 =
                                                              let uu____20760
                                                                =
                                                                let uu____20771
                                                                  =
                                                                  let uu____20772
                                                                    =
                                                                    let uu____20777
                                                                    =
                                                                    let uu____20778
                                                                    =
                                                                    let uu____20785
                                                                    =
                                                                    let uu____20788
                                                                    =
                                                                    FStar_SMTEncoding_Term.n_fuel
                                                                    (Prims.parse_int "0")
                                                                     in
                                                                    uu____20788
                                                                    ::
                                                                    vars_tm
                                                                     in
                                                                    (g,
                                                                    uu____20785)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkApp
                                                                    uu____20778
                                                                     in
                                                                    (gsapp,
                                                                    uu____20777)
                                                                     in
                                                                  FStar_SMTEncoding_Util.mkEq
                                                                    uu____20772
                                                                   in
                                                                ([[gsapp]],
                                                                  (fuel ::
                                                                  vars),
                                                                  uu____20771)
                                                                 in
                                                              FStar_SMTEncoding_Util.mkForall
                                                                uu____20760
                                                               in
                                                            (uu____20759,
                                                              (FStar_Pervasives_Native.Some
                                                                 "Fuel irrelevance"),
                                                              (Prims.strcat
                                                                 "@fuel_irrelevance_"
                                                                 g))
                                                             in
                                                          FStar_SMTEncoding_Util.mkAssume
                                                            uu____20752
                                                           in
                                                        let uu____20811 =
                                                          let uu____20820 =
                                                            encode_binders
                                                              FStar_Pervasives_Native.None
                                                              formals env02
                                                             in
                                                          match uu____20820
                                                          with
                                                          | (vars1,v_guards,env4,binder_decls1,uu____20849)
                                                              ->
                                                              let vars_tm1 =
                                                                FStar_List.map
                                                                  FStar_SMTEncoding_Util.mkFreeV
                                                                  vars1
                                                                 in
                                                              let gapp =
                                                                FStar_SMTEncoding_Util.mkApp
                                                                  (g,
                                                                    (fuel_tm
                                                                    ::
                                                                    vars_tm1))
                                                                 in
                                                              let tok_corr =
                                                                let tok_app =
                                                                  let uu____20874
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    (gtok,
                                                                    FStar_SMTEncoding_Term.Term_sort)
                                                                     in
                                                                  mk_Apply
                                                                    uu____20874
                                                                    (fuel ::
                                                                    vars1)
                                                                   in
                                                                let uu____20879
                                                                  =
                                                                  let uu____20886
                                                                    =
                                                                    let uu____20887
                                                                    =
                                                                    let uu____20898
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkEq
                                                                    (tok_app,
                                                                    gapp)  in
                                                                    ([
                                                                    [tok_app]],
                                                                    (fuel ::
                                                                    vars1),
                                                                    uu____20898)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkForall
                                                                    uu____20887
                                                                     in
                                                                  (uu____20886,
                                                                    (
                                                                    FStar_Pervasives_Native.Some
                                                                    "Fuel token correspondence"),
                                                                    (
                                                                    Prims.strcat
                                                                    "fuel_token_correspondence_"
                                                                    gtok))
                                                                   in
                                                                FStar_SMTEncoding_Util.mkAssume
                                                                  uu____20879
                                                                 in
                                                              let uu____20919
                                                                =
                                                                let uu____20926
                                                                  =
                                                                  encode_term_pred
                                                                    FStar_Pervasives_Native.None
                                                                    tres env4
                                                                    gapp
                                                                   in
                                                                match uu____20926
                                                                with
                                                                | (g_typing,d3)
                                                                    ->
                                                                    let uu____20939
                                                                    =
                                                                    let uu____20942
                                                                    =
                                                                    let uu____20943
                                                                    =
                                                                    let uu____20950
                                                                    =
                                                                    let uu____20951
                                                                    =
                                                                    let uu____20962
                                                                    =
                                                                    let uu____20963
                                                                    =
                                                                    let uu____20968
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_and_l
                                                                    v_guards
                                                                     in
                                                                    (uu____20968,
                                                                    g_typing)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    uu____20963
                                                                     in
                                                                    ([[gapp]],
                                                                    (fuel ::
                                                                    vars1),
                                                                    uu____20962)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkForall
                                                                    uu____20951
                                                                     in
                                                                    (uu____20950,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "Typing correspondence of token to term"),
                                                                    (Prims.strcat
                                                                    "token_correspondence_"
                                                                    g))  in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____20943
                                                                     in
                                                                    [uu____20942]
                                                                     in
                                                                    (d3,
                                                                    uu____20939)
                                                                 in
                                                              (match uu____20919
                                                               with
                                                               | (aux_decls,typing_corr)
                                                                   ->
                                                                   ((FStar_List.append
                                                                    binder_decls1
                                                                    aux_decls),
                                                                    (FStar_List.append
                                                                    typing_corr
                                                                    [tok_corr])))
                                                           in
                                                        (match uu____20811
                                                         with
                                                         | (aux_decls,g_typing)
                                                             ->
                                                             ((FStar_List.append
                                                                 binder_decls
                                                                 (FStar_List.append
                                                                    decls2
                                                                    (
                                                                    FStar_List.append
                                                                    aux_decls
                                                                    [decl_g;
                                                                    decl_g_tok]))),
                                                               (FStar_List.append
                                                                  [eqn_g;
                                                                  eqn_g';
                                                                  eqn_f]
                                                                  g_typing),
                                                               env02))))))))
                               in
                            let uu____21033 =
                              let uu____21046 =
                                FStar_List.zip3 gtoks1 typs2 bindings1  in
                              FStar_List.fold_left
                                (fun uu____21107  ->
                                   fun uu____21108  ->
                                     match (uu____21107, uu____21108) with
                                     | ((decls2,eqns,env01),(gtok,ty,lb)) ->
                                         let uu____21233 =
                                           encode_one_binding env01 gtok ty
                                             lb
                                            in
                                         (match uu____21233 with
                                          | (decls',eqns',env02) ->
                                              ((decls' :: decls2),
                                                (FStar_List.append eqns' eqns),
                                                env02))) ([decls1], [], env0)
                                uu____21046
                               in
                            (match uu____21033 with
                             | (decls2,eqns,env01) ->
                                 let uu____21306 =
                                   let isDeclFun uu___92_21318 =
                                     match uu___92_21318 with
                                     | FStar_SMTEncoding_Term.DeclFun
                                         uu____21319 -> true
                                     | uu____21330 -> false  in
                                   let uu____21331 =
                                     FStar_All.pipe_right decls2
                                       FStar_List.flatten
                                      in
                                   FStar_All.pipe_right uu____21331
                                     (FStar_List.partition isDeclFun)
                                    in
                                 (match uu____21306 with
                                  | (prefix_decls,rest) ->
                                      let eqns1 = FStar_List.rev eqns  in
                                      ((FStar_List.append prefix_decls
                                          (FStar_List.append rest eqns1)),
                                        env01)))
                         in
                      let uu____21371 =
                        (FStar_All.pipe_right quals
                           (FStar_Util.for_some
                              (fun uu___93_21375  ->
                                 match uu___93_21375 with
                                 | FStar_Syntax_Syntax.HasMaskedEffect  ->
                                     true
                                 | uu____21376 -> false)))
                          ||
                          (FStar_All.pipe_right typs1
                             (FStar_Util.for_some
                                (fun t  ->
                                   let uu____21382 =
                                     (FStar_Syntax_Util.is_pure_or_ghost_function
                                        t)
                                       ||
                                       (FStar_TypeChecker_Env.is_reifiable_function
                                          env1.tcenv t)
                                      in
                                   FStar_All.pipe_left Prims.op_Negation
                                     uu____21382)))
                         in
                      if uu____21371
                      then (decls1, env1)
                      else
                        (try
                           if Prims.op_Negation is_rec
                           then
                             encode_non_rec_lbdef bindings typs1 toks_fvbs
                               env1
                           else
                             encode_rec_lbdefs bindings typs1 toks_fvbs env1
                         with | Inner_let_rec  -> (decls1, env1)))
             with
             | Let_rec_unencodeable  ->
                 let msg =
                   let uu____21434 =
                     FStar_All.pipe_right bindings
                       (FStar_List.map
                          (fun lb  ->
                             FStar_Syntax_Print.lbname_to_string
                               lb.FStar_Syntax_Syntax.lbname))
                      in
                   FStar_All.pipe_right uu____21434
                     (FStar_String.concat " and ")
                    in
                 let decl =
                   FStar_SMTEncoding_Term.Caption
                     (Prims.strcat "let rec unencodeable: Skipping: " msg)
                    in
                 ([decl], env))
  
let rec (encode_sigelt :
  env_t ->
    FStar_Syntax_Syntax.sigelt ->
      (FStar_SMTEncoding_Term.decls_t,env_t) FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun se  ->
      let nm =
        let uu____21483 = FStar_Syntax_Util.lid_of_sigelt se  in
        match uu____21483 with
        | FStar_Pervasives_Native.None  -> ""
        | FStar_Pervasives_Native.Some l -> l.FStar_Ident.str  in
      let uu____21487 = encode_sigelt' env se  in
      match uu____21487 with
      | (g,env1) ->
          let g1 =
            match g with
            | [] ->
                let uu____21503 =
                  let uu____21504 = FStar_Util.format1 "<Skipped %s/>" nm  in
                  FStar_SMTEncoding_Term.Caption uu____21504  in
                [uu____21503]
            | uu____21505 ->
                let uu____21506 =
                  let uu____21509 =
                    let uu____21510 =
                      FStar_Util.format1 "<Start encoding %s>" nm  in
                    FStar_SMTEncoding_Term.Caption uu____21510  in
                  uu____21509 :: g  in
                let uu____21511 =
                  let uu____21514 =
                    let uu____21515 =
                      FStar_Util.format1 "</end encoding %s>" nm  in
                    FStar_SMTEncoding_Term.Caption uu____21515  in
                  [uu____21514]  in
                FStar_List.append uu____21506 uu____21511
             in
          (g1, env1)

and (encode_sigelt' :
  env_t ->
    FStar_Syntax_Syntax.sigelt ->
      (FStar_SMTEncoding_Term.decls_t,env_t) FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun se  ->
      let is_opaque_to_smt t =
        let uu____21528 =
          let uu____21529 = FStar_Syntax_Subst.compress t  in
          uu____21529.FStar_Syntax_Syntax.n  in
        match uu____21528 with
        | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_string
            (s,uu____21533)) -> s = "opaque_to_smt"
        | uu____21534 -> false  in
      let is_uninterpreted_by_smt t =
        let uu____21539 =
          let uu____21540 = FStar_Syntax_Subst.compress t  in
          uu____21540.FStar_Syntax_Syntax.n  in
        match uu____21539 with
        | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_string
            (s,uu____21544)) -> s = "uninterpreted_by_smt"
        | uu____21545 -> false  in
      match se.FStar_Syntax_Syntax.sigel with
      | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____21550 ->
          failwith
            "impossible -- new_effect_for_free should have been removed by Tc.fs"
      | FStar_Syntax_Syntax.Sig_splice uu____21555 ->
          failwith "impossible -- splice should have been removed by Tc.fs"
      | FStar_Syntax_Syntax.Sig_pragma uu____21560 -> ([], env)
      | FStar_Syntax_Syntax.Sig_main uu____21563 -> ([], env)
      | FStar_Syntax_Syntax.Sig_effect_abbrev uu____21566 -> ([], env)
      | FStar_Syntax_Syntax.Sig_sub_effect uu____21581 -> ([], env)
      | FStar_Syntax_Syntax.Sig_new_effect ed ->
          let uu____21585 =
            let uu____21586 =
              FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
                (FStar_List.contains FStar_Syntax_Syntax.Reifiable)
               in
            FStar_All.pipe_right uu____21586 Prims.op_Negation  in
          if uu____21585
          then ([], env)
          else
            (let close_effect_params tm =
               match ed.FStar_Syntax_Syntax.binders with
               | [] -> tm
               | uu____21612 ->
                   FStar_Syntax_Syntax.mk
                     (FStar_Syntax_Syntax.Tm_abs
                        ((ed.FStar_Syntax_Syntax.binders), tm,
                          (FStar_Pervasives_Native.Some
                             (FStar_Syntax_Util.mk_residual_comp
                                FStar_Parser_Const.effect_Tot_lid
                                FStar_Pervasives_Native.None
                                [FStar_Syntax_Syntax.TOTAL]))))
                     FStar_Pervasives_Native.None tm.FStar_Syntax_Syntax.pos
                in
             let encode_action env1 a =
               let uu____21632 =
                 FStar_Syntax_Util.arrow_formals_comp
                   a.FStar_Syntax_Syntax.action_typ
                  in
               match uu____21632 with
               | (formals,uu____21650) ->
                   let arity = FStar_List.length formals  in
                   let uu____21668 =
                     new_term_constant_and_tok_from_lid env1
                       a.FStar_Syntax_Syntax.action_name arity
                      in
                   (match uu____21668 with
                    | (aname,atok,env2) ->
                        let uu____21688 =
                          let uu____21693 =
                            close_effect_params
                              a.FStar_Syntax_Syntax.action_defn
                             in
                          encode_term uu____21693 env2  in
                        (match uu____21688 with
                         | (tm,decls) ->
                             let a_decls =
                               let uu____21705 =
                                 let uu____21706 =
                                   let uu____21717 =
                                     FStar_All.pipe_right formals
                                       (FStar_List.map
                                          (fun uu____21733  ->
                                             FStar_SMTEncoding_Term.Term_sort))
                                      in
                                   (aname, uu____21717,
                                     FStar_SMTEncoding_Term.Term_sort,
                                     (FStar_Pervasives_Native.Some "Action"))
                                    in
                                 FStar_SMTEncoding_Term.DeclFun uu____21706
                                  in
                               [uu____21705;
                               FStar_SMTEncoding_Term.DeclFun
                                 (atok, [], FStar_SMTEncoding_Term.Term_sort,
                                   (FStar_Pervasives_Native.Some
                                      "Action token"))]
                                in
                             let uu____21746 =
                               let aux uu____21798 uu____21799 =
                                 match (uu____21798, uu____21799) with
                                 | ((bv,uu____21851),(env3,acc_sorts,acc)) ->
                                     let uu____21889 = gen_term_var env3 bv
                                        in
                                     (match uu____21889 with
                                      | (xxsym,xx,env4) ->
                                          (env4,
                                            ((xxsym,
                                               FStar_SMTEncoding_Term.Term_sort)
                                            :: acc_sorts), (xx :: acc)))
                                  in
                               FStar_List.fold_right aux formals
                                 (env2, [], [])
                                in
                             (match uu____21746 with
                              | (uu____21961,xs_sorts,xs) ->
                                  let app =
                                    FStar_SMTEncoding_Util.mkApp (aname, xs)
                                     in
                                  let a_eq =
                                    let uu____21984 =
                                      let uu____21991 =
                                        let uu____21992 =
                                          let uu____22003 =
                                            let uu____22004 =
                                              let uu____22009 =
                                                mk_Apply tm xs_sorts  in
                                              (app, uu____22009)  in
                                            FStar_SMTEncoding_Util.mkEq
                                              uu____22004
                                             in
                                          ([[app]], xs_sorts, uu____22003)
                                           in
                                        FStar_SMTEncoding_Util.mkForall
                                          uu____21992
                                         in
                                      (uu____21991,
                                        (FStar_Pervasives_Native.Some
                                           "Action equality"),
                                        (Prims.strcat aname "_equality"))
                                       in
                                    FStar_SMTEncoding_Util.mkAssume
                                      uu____21984
                                     in
                                  let tok_correspondence =
                                    let tok_term =
                                      FStar_SMTEncoding_Util.mkFreeV
                                        (atok,
                                          FStar_SMTEncoding_Term.Term_sort)
                                       in
                                    let tok_app = mk_Apply tok_term xs_sorts
                                       in
                                    let uu____22029 =
                                      let uu____22036 =
                                        let uu____22037 =
                                          let uu____22048 =
                                            FStar_SMTEncoding_Util.mkEq
                                              (tok_app, app)
                                             in
                                          ([[tok_app]], xs_sorts,
                                            uu____22048)
                                           in
                                        FStar_SMTEncoding_Util.mkForall
                                          uu____22037
                                         in
                                      (uu____22036,
                                        (FStar_Pervasives_Native.Some
                                           "Action token correspondence"),
                                        (Prims.strcat aname
                                           "_token_correspondence"))
                                       in
                                    FStar_SMTEncoding_Util.mkAssume
                                      uu____22029
                                     in
                                  (env2,
                                    (FStar_List.append decls
                                       (FStar_List.append a_decls
                                          [a_eq; tok_correspondence]))))))
                in
             let uu____22067 =
               FStar_Util.fold_map encode_action env
                 ed.FStar_Syntax_Syntax.actions
                in
             match uu____22067 with
             | (env1,decls2) -> ((FStar_List.flatten decls2), env1))
      | FStar_Syntax_Syntax.Sig_declare_typ (lid,uu____22095,uu____22096)
          when FStar_Ident.lid_equals lid FStar_Parser_Const.precedes_lid ->
          let uu____22097 =
            new_term_constant_and_tok_from_lid env lid (Prims.parse_int "4")
             in
          (match uu____22097 with | (tname,ttok,env1) -> ([], env1))
      | FStar_Syntax_Syntax.Sig_declare_typ (lid,uu____22114,t) ->
          let quals = se.FStar_Syntax_Syntax.sigquals  in
          let will_encode_definition =
            let uu____22120 =
              FStar_All.pipe_right quals
                (FStar_Util.for_some
                   (fun uu___94_22124  ->
                      match uu___94_22124 with
                      | FStar_Syntax_Syntax.Assumption  -> true
                      | FStar_Syntax_Syntax.Projector uu____22125 -> true
                      | FStar_Syntax_Syntax.Discriminator uu____22130 -> true
                      | FStar_Syntax_Syntax.Irreducible  -> true
                      | uu____22131 -> false))
               in
            Prims.op_Negation uu____22120  in
          if will_encode_definition
          then ([], env)
          else
            (let fv =
               FStar_Syntax_Syntax.lid_as_fv lid
                 FStar_Syntax_Syntax.Delta_constant
                 FStar_Pervasives_Native.None
                in
             let uu____22140 =
               let uu____22147 =
                 FStar_All.pipe_right se.FStar_Syntax_Syntax.sigattrs
                   (FStar_Util.for_some is_uninterpreted_by_smt)
                  in
               encode_top_level_val uu____22147 env fv t quals  in
             match uu____22140 with
             | (decls,env1) ->
                 let tname = lid.FStar_Ident.str  in
                 let tsym =
                   FStar_SMTEncoding_Util.mkFreeV
                     (tname, FStar_SMTEncoding_Term.Term_sort)
                    in
                 let uu____22162 =
                   let uu____22165 =
                     primitive_type_axioms env1.tcenv lid tname tsym  in
                   FStar_List.append decls uu____22165  in
                 (uu____22162, env1))
      | FStar_Syntax_Syntax.Sig_assume (l,us,f) ->
          let uu____22173 = FStar_Syntax_Subst.open_univ_vars us f  in
          (match uu____22173 with
           | (uu____22182,f1) ->
               let uu____22184 = encode_formula f1 env  in
               (match uu____22184 with
                | (f2,decls) ->
                    let g =
                      let uu____22198 =
                        let uu____22199 =
                          let uu____22206 =
                            let uu____22209 =
                              let uu____22210 =
                                FStar_Syntax_Print.lid_to_string l  in
                              FStar_Util.format1 "Assumption: %s" uu____22210
                               in
                            FStar_Pervasives_Native.Some uu____22209  in
                          let uu____22211 =
                            varops.mk_unique
                              (Prims.strcat "assumption_" l.FStar_Ident.str)
                             in
                          (f2, uu____22206, uu____22211)  in
                        FStar_SMTEncoding_Util.mkAssume uu____22199  in
                      [uu____22198]  in
                    ((FStar_List.append decls g), env)))
      | FStar_Syntax_Syntax.Sig_let (lbs,uu____22217) when
          (FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
             (FStar_List.contains FStar_Syntax_Syntax.Irreducible))
            ||
            (FStar_All.pipe_right se.FStar_Syntax_Syntax.sigattrs
               (FStar_Util.for_some is_opaque_to_smt))
          ->
          let attrs = se.FStar_Syntax_Syntax.sigattrs  in
          let uu____22229 =
            FStar_Util.fold_map
              (fun env1  ->
                 fun lb  ->
                   let lid =
                     let uu____22247 =
                       let uu____22250 =
                         FStar_Util.right lb.FStar_Syntax_Syntax.lbname  in
                       uu____22250.FStar_Syntax_Syntax.fv_name  in
                     uu____22247.FStar_Syntax_Syntax.v  in
                   let uu____22251 =
                     let uu____22252 =
                       FStar_TypeChecker_Env.try_lookup_val_decl env1.tcenv
                         lid
                        in
                     FStar_All.pipe_left FStar_Option.isNone uu____22252  in
                   if uu____22251
                   then
                     let val_decl =
                       let uu___129_22280 = se  in
                       {
                         FStar_Syntax_Syntax.sigel =
                           (FStar_Syntax_Syntax.Sig_declare_typ
                              (lid, (lb.FStar_Syntax_Syntax.lbunivs),
                                (lb.FStar_Syntax_Syntax.lbtyp)));
                         FStar_Syntax_Syntax.sigrng =
                           (uu___129_22280.FStar_Syntax_Syntax.sigrng);
                         FStar_Syntax_Syntax.sigquals =
                           (FStar_Syntax_Syntax.Irreducible ::
                           (se.FStar_Syntax_Syntax.sigquals));
                         FStar_Syntax_Syntax.sigmeta =
                           (uu___129_22280.FStar_Syntax_Syntax.sigmeta);
                         FStar_Syntax_Syntax.sigattrs =
                           (uu___129_22280.FStar_Syntax_Syntax.sigattrs)
                       }  in
                     let uu____22285 = encode_sigelt' env1 val_decl  in
                     match uu____22285 with | (decls,env2) -> (env2, decls)
                   else (env1, [])) env (FStar_Pervasives_Native.snd lbs)
             in
          (match uu____22229 with
           | (env1,decls) -> ((FStar_List.flatten decls), env1))
      | FStar_Syntax_Syntax.Sig_let
          ((uu____22313,{ FStar_Syntax_Syntax.lbname = FStar_Util.Inr b2t1;
                          FStar_Syntax_Syntax.lbunivs = uu____22315;
                          FStar_Syntax_Syntax.lbtyp = uu____22316;
                          FStar_Syntax_Syntax.lbeff = uu____22317;
                          FStar_Syntax_Syntax.lbdef = uu____22318;
                          FStar_Syntax_Syntax.lbattrs = uu____22319;
                          FStar_Syntax_Syntax.lbpos = uu____22320;_}::[]),uu____22321)
          when FStar_Syntax_Syntax.fv_eq_lid b2t1 FStar_Parser_Const.b2t_lid
          ->
          let uu____22344 =
            new_term_constant_and_tok_from_lid env
              (b2t1.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
              (Prims.parse_int "1")
             in
          (match uu____22344 with
           | (tname,ttok,env1) ->
               let xx = ("x", FStar_SMTEncoding_Term.Term_sort)  in
               let x = FStar_SMTEncoding_Util.mkFreeV xx  in
               let b2t_x = FStar_SMTEncoding_Util.mkApp ("Prims.b2t", [x])
                  in
               let valid_b2t_x =
                 FStar_SMTEncoding_Util.mkApp ("Valid", [b2t_x])  in
               let decls =
                 let uu____22373 =
                   let uu____22376 =
                     let uu____22377 =
                       let uu____22384 =
                         let uu____22385 =
                           let uu____22396 =
                             let uu____22397 =
                               let uu____22402 =
                                 FStar_SMTEncoding_Util.mkApp
                                   ((FStar_Pervasives_Native.snd
                                       FStar_SMTEncoding_Term.boxBoolFun),
                                     [x])
                                  in
                               (valid_b2t_x, uu____22402)  in
                             FStar_SMTEncoding_Util.mkEq uu____22397  in
                           ([[b2t_x]], [xx], uu____22396)  in
                         FStar_SMTEncoding_Util.mkForall uu____22385  in
                       (uu____22384,
                         (FStar_Pervasives_Native.Some "b2t def"), "b2t_def")
                        in
                     FStar_SMTEncoding_Util.mkAssume uu____22377  in
                   [uu____22376]  in
                 (FStar_SMTEncoding_Term.DeclFun
                    (tname, [FStar_SMTEncoding_Term.Term_sort],
                      FStar_SMTEncoding_Term.Term_sort,
                      FStar_Pervasives_Native.None))
                   :: uu____22373
                  in
               (decls, env1))
      | FStar_Syntax_Syntax.Sig_let (uu____22435,uu____22436) when
          FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
            (FStar_Util.for_some
               (fun uu___95_22445  ->
                  match uu___95_22445 with
                  | FStar_Syntax_Syntax.Discriminator uu____22446 -> true
                  | uu____22447 -> false))
          -> ([], env)
      | FStar_Syntax_Syntax.Sig_let (uu____22450,lids) when
          (FStar_All.pipe_right lids
             (FStar_Util.for_some
                (fun l  ->
                   let uu____22461 =
                     let uu____22462 = FStar_List.hd l.FStar_Ident.ns  in
                     uu____22462.FStar_Ident.idText  in
                   uu____22461 = "Prims")))
            &&
            (FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
               (FStar_Util.for_some
                  (fun uu___96_22466  ->
                     match uu___96_22466 with
                     | FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen 
                         -> true
                     | uu____22467 -> false)))
          -> ([], env)
      | FStar_Syntax_Syntax.Sig_let ((false ,lb::[]),uu____22471) when
          FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
            (FStar_Util.for_some
               (fun uu___97_22488  ->
                  match uu___97_22488 with
                  | FStar_Syntax_Syntax.Projector uu____22489 -> true
                  | uu____22494 -> false))
          ->
          let fv = FStar_Util.right lb.FStar_Syntax_Syntax.lbname  in
          let l = (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v  in
          let uu____22497 = try_lookup_free_var env l  in
          (match uu____22497 with
           | FStar_Pervasives_Native.Some uu____22504 -> ([], env)
           | FStar_Pervasives_Native.None  ->
               let se1 =
                 let uu___130_22508 = se  in
                 {
                   FStar_Syntax_Syntax.sigel =
                     (FStar_Syntax_Syntax.Sig_declare_typ
                        (l, (lb.FStar_Syntax_Syntax.lbunivs),
                          (lb.FStar_Syntax_Syntax.lbtyp)));
                   FStar_Syntax_Syntax.sigrng = (FStar_Ident.range_of_lid l);
                   FStar_Syntax_Syntax.sigquals =
                     (uu___130_22508.FStar_Syntax_Syntax.sigquals);
                   FStar_Syntax_Syntax.sigmeta =
                     (uu___130_22508.FStar_Syntax_Syntax.sigmeta);
                   FStar_Syntax_Syntax.sigattrs =
                     (uu___130_22508.FStar_Syntax_Syntax.sigattrs)
                 }  in
               encode_sigelt env se1)
      | FStar_Syntax_Syntax.Sig_let ((is_rec,bindings),uu____22515) ->
          encode_top_level_let env (is_rec, bindings)
            se.FStar_Syntax_Syntax.sigquals
      | FStar_Syntax_Syntax.Sig_bundle (ses,uu____22533) ->
          let uu____22542 = encode_sigelts env ses  in
          (match uu____22542 with
           | (g,env1) ->
               let uu____22559 =
                 FStar_All.pipe_right g
                   (FStar_List.partition
                      (fun uu___98_22582  ->
                         match uu___98_22582 with
                         | FStar_SMTEncoding_Term.Assume
                             {
                               FStar_SMTEncoding_Term.assumption_term =
                                 uu____22583;
                               FStar_SMTEncoding_Term.assumption_caption =
                                 FStar_Pervasives_Native.Some
                                 "inversion axiom";
                               FStar_SMTEncoding_Term.assumption_name =
                                 uu____22584;
                               FStar_SMTEncoding_Term.assumption_fact_ids =
                                 uu____22585;_}
                             -> false
                         | uu____22588 -> true))
                  in
               (match uu____22559 with
                | (g',inversions) ->
                    let uu____22603 =
                      FStar_All.pipe_right g'
                        (FStar_List.partition
                           (fun uu___99_22624  ->
                              match uu___99_22624 with
                              | FStar_SMTEncoding_Term.DeclFun uu____22625 ->
                                  true
                              | uu____22636 -> false))
                       in
                    (match uu____22603 with
                     | (decls,rest) ->
                         ((FStar_List.append decls
                             (FStar_List.append rest inversions)), env1))))
      | FStar_Syntax_Syntax.Sig_inductive_typ
          (t,uu____22654,tps,k,uu____22657,datas) ->
          let quals = se.FStar_Syntax_Syntax.sigquals  in
          let is_logical =
            FStar_All.pipe_right quals
              (FStar_Util.for_some
                 (fun uu___100_22674  ->
                    match uu___100_22674 with
                    | FStar_Syntax_Syntax.Logic  -> true
                    | FStar_Syntax_Syntax.Assumption  -> true
                    | uu____22675 -> false))
             in
          let constructor_or_logic_type_decl c =
            if is_logical
            then
              let uu____22684 = c  in
              match uu____22684 with
              | (name,args,uu____22689,uu____22690,uu____22691) ->
                  let uu____22696 =
                    let uu____22697 =
                      let uu____22708 =
                        FStar_All.pipe_right args
                          (FStar_List.map
                             (fun uu____22725  ->
                                match uu____22725 with
                                | (uu____22732,sort,uu____22734) -> sort))
                         in
                      (name, uu____22708, FStar_SMTEncoding_Term.Term_sort,
                        FStar_Pervasives_Native.None)
                       in
                    FStar_SMTEncoding_Term.DeclFun uu____22697  in
                  [uu____22696]
            else FStar_SMTEncoding_Term.constructor_to_decl c  in
          let inversion_axioms tapp vars =
            let uu____22761 =
              FStar_All.pipe_right datas
                (FStar_Util.for_some
                   (fun l  ->
                      let uu____22767 =
                        FStar_TypeChecker_Env.try_lookup_lid env.tcenv l  in
                      FStar_All.pipe_right uu____22767 FStar_Option.isNone))
               in
            if uu____22761
            then []
            else
              (let uu____22799 =
                 fresh_fvar "x" FStar_SMTEncoding_Term.Term_sort  in
               match uu____22799 with
               | (xxsym,xx) ->
                   let uu____22808 =
                     FStar_All.pipe_right datas
                       (FStar_List.fold_left
                          (fun uu____22847  ->
                             fun l  ->
                               match uu____22847 with
                               | (out,decls) ->
                                   let uu____22867 =
                                     FStar_TypeChecker_Env.lookup_datacon
                                       env.tcenv l
                                      in
                                   (match uu____22867 with
                                    | (uu____22878,data_t) ->
                                        let uu____22880 =
                                          FStar_Syntax_Util.arrow_formals
                                            data_t
                                           in
                                        (match uu____22880 with
                                         | (args,res) ->
                                             let indices =
                                               let uu____22926 =
                                                 let uu____22927 =
                                                   FStar_Syntax_Subst.compress
                                                     res
                                                    in
                                                 uu____22927.FStar_Syntax_Syntax.n
                                                  in
                                               match uu____22926 with
                                               | FStar_Syntax_Syntax.Tm_app
                                                   (uu____22938,indices) ->
                                                   indices
                                               | uu____22960 -> []  in
                                             let env1 =
                                               FStar_All.pipe_right args
                                                 (FStar_List.fold_left
                                                    (fun env1  ->
                                                       fun uu____22984  ->
                                                         match uu____22984
                                                         with
                                                         | (x,uu____22990) ->
                                                             let uu____22991
                                                               =
                                                               let uu____22992
                                                                 =
                                                                 let uu____22999
                                                                   =
                                                                   mk_term_projector_name
                                                                    l x
                                                                    in
                                                                 (uu____22999,
                                                                   [xx])
                                                                  in
                                                               FStar_SMTEncoding_Util.mkApp
                                                                 uu____22992
                                                                in
                                                             push_term_var
                                                               env1 x
                                                               uu____22991)
                                                    env)
                                                in
                                             let uu____23002 =
                                               encode_args indices env1  in
                                             (match uu____23002 with
                                              | (indices1,decls') ->
                                                  (if
                                                     (FStar_List.length
                                                        indices1)
                                                       <>
                                                       (FStar_List.length
                                                          vars)
                                                   then failwith "Impossible"
                                                   else ();
                                                   (let eqs =
                                                      let uu____23028 =
                                                        FStar_List.map2
                                                          (fun v1  ->
                                                             fun a  ->
                                                               let uu____23044
                                                                 =
                                                                 let uu____23049
                                                                   =
                                                                   FStar_SMTEncoding_Util.mkFreeV
                                                                    v1
                                                                    in
                                                                 (uu____23049,
                                                                   a)
                                                                  in
                                                               FStar_SMTEncoding_Util.mkEq
                                                                 uu____23044)
                                                          vars indices1
                                                         in
                                                      FStar_All.pipe_right
                                                        uu____23028
                                                        FStar_SMTEncoding_Util.mk_and_l
                                                       in
                                                    let uu____23052 =
                                                      let uu____23053 =
                                                        let uu____23058 =
                                                          let uu____23059 =
                                                            let uu____23064 =
                                                              mk_data_tester
                                                                env1 l xx
                                                               in
                                                            (uu____23064,
                                                              eqs)
                                                             in
                                                          FStar_SMTEncoding_Util.mkAnd
                                                            uu____23059
                                                           in
                                                        (out, uu____23058)
                                                         in
                                                      FStar_SMTEncoding_Util.mkOr
                                                        uu____23053
                                                       in
                                                    (uu____23052,
                                                      (FStar_List.append
                                                         decls decls'))))))))
                          (FStar_SMTEncoding_Util.mkFalse, []))
                      in
                   (match uu____22808 with
                    | (data_ax,decls) ->
                        let uu____23077 =
                          fresh_fvar "f" FStar_SMTEncoding_Term.Fuel_sort  in
                        (match uu____23077 with
                         | (ffsym,ff) ->
                             let fuel_guarded_inversion =
                               let xx_has_type_sfuel =
                                 if
                                   (FStar_List.length datas) >
                                     (Prims.parse_int "1")
                                 then
                                   let uu____23088 =
                                     FStar_SMTEncoding_Util.mkApp
                                       ("SFuel", [ff])
                                      in
                                   FStar_SMTEncoding_Term.mk_HasTypeFuel
                                     uu____23088 xx tapp
                                 else
                                   FStar_SMTEncoding_Term.mk_HasTypeFuel ff
                                     xx tapp
                                  in
                               let uu____23092 =
                                 let uu____23099 =
                                   let uu____23100 =
                                     let uu____23111 =
                                       add_fuel
                                         (ffsym,
                                           FStar_SMTEncoding_Term.Fuel_sort)
                                         ((xxsym,
                                            FStar_SMTEncoding_Term.Term_sort)
                                         :: vars)
                                        in
                                     let uu____23126 =
                                       FStar_SMTEncoding_Util.mkImp
                                         (xx_has_type_sfuel, data_ax)
                                        in
                                     ([[xx_has_type_sfuel]], uu____23111,
                                       uu____23126)
                                      in
                                   FStar_SMTEncoding_Util.mkForall
                                     uu____23100
                                    in
                                 let uu____23141 =
                                   varops.mk_unique
                                     (Prims.strcat "fuel_guarded_inversion_"
                                        t.FStar_Ident.str)
                                    in
                                 (uu____23099,
                                   (FStar_Pervasives_Native.Some
                                      "inversion axiom"), uu____23141)
                                  in
                               FStar_SMTEncoding_Util.mkAssume uu____23092
                                in
                             FStar_List.append decls [fuel_guarded_inversion])))
             in
          let uu____23144 =
            let uu____23157 =
              let uu____23158 = FStar_Syntax_Subst.compress k  in
              uu____23158.FStar_Syntax_Syntax.n  in
            match uu____23157 with
            | FStar_Syntax_Syntax.Tm_arrow (formals,kres) ->
                ((FStar_List.append tps formals),
                  (FStar_Syntax_Util.comp_result kres))
            | uu____23203 -> (tps, k)  in
          (match uu____23144 with
           | (formals,res) ->
               let uu____23226 = FStar_Syntax_Subst.open_term formals res  in
               (match uu____23226 with
                | (formals1,res1) ->
                    let uu____23237 =
                      encode_binders FStar_Pervasives_Native.None formals1
                        env
                       in
                    (match uu____23237 with
                     | (vars,guards,env',binder_decls,uu____23262) ->
                         let arity = FStar_List.length vars  in
                         let uu____23276 =
                           new_term_constant_and_tok_from_lid env t arity  in
                         (match uu____23276 with
                          | (tname,ttok,env1) ->
                              let ttok_tm =
                                FStar_SMTEncoding_Util.mkApp (ttok, [])  in
                              let guard =
                                FStar_SMTEncoding_Util.mk_and_l guards  in
                              let tapp =
                                let uu____23299 =
                                  let uu____23306 =
                                    FStar_List.map
                                      FStar_SMTEncoding_Util.mkFreeV vars
                                     in
                                  (tname, uu____23306)  in
                                FStar_SMTEncoding_Util.mkApp uu____23299  in
                              let uu____23315 =
                                let tname_decl =
                                  let uu____23325 =
                                    let uu____23326 =
                                      FStar_All.pipe_right vars
                                        (FStar_List.map
                                           (fun uu____23358  ->
                                              match uu____23358 with
                                              | (n1,s) ->
                                                  ((Prims.strcat tname n1),
                                                    s, false)))
                                       in
                                    let uu____23371 = varops.next_id ()  in
                                    (tname, uu____23326,
                                      FStar_SMTEncoding_Term.Term_sort,
                                      uu____23371, false)
                                     in
                                  constructor_or_logic_type_decl uu____23325
                                   in
                                let uu____23380 =
                                  match vars with
                                  | [] ->
                                      let uu____23393 =
                                        let uu____23394 =
                                          let uu____23397 =
                                            FStar_SMTEncoding_Util.mkApp
                                              (tname, [])
                                             in
                                          FStar_All.pipe_left
                                            (fun _0_43  ->
                                               FStar_Pervasives_Native.Some
                                                 _0_43) uu____23397
                                           in
                                        push_free_var env1 t arity tname
                                          uu____23394
                                         in
                                      ([], uu____23393)
                                  | uu____23408 ->
                                      let ttok_decl =
                                        FStar_SMTEncoding_Term.DeclFun
                                          (ttok, [],
                                            FStar_SMTEncoding_Term.Term_sort,
                                            (FStar_Pervasives_Native.Some
                                               "token"))
                                         in
                                      let ttok_fresh =
                                        let uu____23417 = varops.next_id ()
                                           in
                                        FStar_SMTEncoding_Term.fresh_token
                                          (ttok,
                                            FStar_SMTEncoding_Term.Term_sort)
                                          uu____23417
                                         in
                                      let ttok_app = mk_Apply ttok_tm vars
                                         in
                                      let pats = [[ttok_app]; [tapp]]  in
                                      let name_tok_corr =
                                        let uu____23431 =
                                          let uu____23438 =
                                            let uu____23439 =
                                              let uu____23454 =
                                                FStar_SMTEncoding_Util.mkEq
                                                  (ttok_app, tapp)
                                                 in
                                              (pats,
                                                FStar_Pervasives_Native.None,
                                                vars, uu____23454)
                                               in
                                            FStar_SMTEncoding_Util.mkForall'
                                              uu____23439
                                             in
                                          (uu____23438,
                                            (FStar_Pervasives_Native.Some
                                               "name-token correspondence"),
                                            (Prims.strcat
                                               "token_correspondence_" ttok))
                                           in
                                        FStar_SMTEncoding_Util.mkAssume
                                          uu____23431
                                         in
                                      ([ttok_decl; ttok_fresh; name_tok_corr],
                                        env1)
                                   in
                                match uu____23380 with
                                | (tok_decls,env2) ->
                                    ((FStar_List.append tname_decl tok_decls),
                                      env2)
                                 in
                              (match uu____23315 with
                               | (decls,env2) ->
                                   let kindingAx =
                                     let uu____23494 =
                                       encode_term_pred
                                         FStar_Pervasives_Native.None res1
                                         env' tapp
                                        in
                                     match uu____23494 with
                                     | (k1,decls1) ->
                                         let karr =
                                           if
                                             (FStar_List.length formals1) >
                                               (Prims.parse_int "0")
                                           then
                                             let uu____23512 =
                                               let uu____23513 =
                                                 let uu____23520 =
                                                   let uu____23521 =
                                                     FStar_SMTEncoding_Term.mk_PreType
                                                       ttok_tm
                                                      in
                                                   FStar_SMTEncoding_Term.mk_tester
                                                     "Tm_arrow" uu____23521
                                                    in
                                                 (uu____23520,
                                                   (FStar_Pervasives_Native.Some
                                                      "kinding"),
                                                   (Prims.strcat
                                                      "pre_kinding_" ttok))
                                                  in
                                               FStar_SMTEncoding_Util.mkAssume
                                                 uu____23513
                                                in
                                             [uu____23512]
                                           else []  in
                                         let uu____23525 =
                                           let uu____23528 =
                                             let uu____23531 =
                                               let uu____23532 =
                                                 let uu____23539 =
                                                   let uu____23540 =
                                                     let uu____23551 =
                                                       FStar_SMTEncoding_Util.mkImp
                                                         (guard, k1)
                                                        in
                                                     ([[tapp]], vars,
                                                       uu____23551)
                                                      in
                                                   FStar_SMTEncoding_Util.mkForall
                                                     uu____23540
                                                    in
                                                 (uu____23539,
                                                   FStar_Pervasives_Native.None,
                                                   (Prims.strcat "kinding_"
                                                      ttok))
                                                  in
                                               FStar_SMTEncoding_Util.mkAssume
                                                 uu____23532
                                                in
                                             [uu____23531]  in
                                           FStar_List.append karr uu____23528
                                            in
                                         FStar_List.append decls1 uu____23525
                                      in
                                   let aux =
                                     let uu____23567 =
                                       let uu____23570 =
                                         inversion_axioms tapp vars  in
                                       let uu____23573 =
                                         let uu____23576 =
                                           pretype_axiom env2 tapp vars  in
                                         [uu____23576]  in
                                       FStar_List.append uu____23570
                                         uu____23573
                                        in
                                     FStar_List.append kindingAx uu____23567
                                      in
                                   let g =
                                     FStar_List.append decls
                                       (FStar_List.append binder_decls aux)
                                      in
                                   (g, env2))))))
      | FStar_Syntax_Syntax.Sig_datacon
          (d,uu____23583,uu____23584,uu____23585,uu____23586,uu____23587)
          when FStar_Ident.lid_equals d FStar_Parser_Const.lexcons_lid ->
          ([], env)
      | FStar_Syntax_Syntax.Sig_datacon
          (d,uu____23595,t,uu____23597,n_tps,uu____23599) ->
          let quals = se.FStar_Syntax_Syntax.sigquals  in
          let uu____23607 = FStar_Syntax_Util.arrow_formals t  in
          (match uu____23607 with
           | (formals,t_res) ->
               let arity = FStar_List.length formals  in
               let uu____23647 =
                 new_term_constant_and_tok_from_lid env d arity  in
               (match uu____23647 with
                | (ddconstrsym,ddtok,env1) ->
                    let ddtok_tm = FStar_SMTEncoding_Util.mkApp (ddtok, [])
                       in
                    let uu____23668 =
                      fresh_fvar "f" FStar_SMTEncoding_Term.Fuel_sort  in
                    (match uu____23668 with
                     | (fuel_var,fuel_tm) ->
                         let s_fuel_tm =
                           FStar_SMTEncoding_Util.mkApp ("SFuel", [fuel_tm])
                            in
                         let uu____23682 =
                           encode_binders
                             (FStar_Pervasives_Native.Some fuel_tm) formals
                             env1
                            in
                         (match uu____23682 with
                          | (vars,guards,env',binder_decls,names1) ->
                              let fields =
                                FStar_All.pipe_right names1
                                  (FStar_List.mapi
                                     (fun n1  ->
                                        fun x  ->
                                          let projectible = true  in
                                          let uu____23752 =
                                            mk_term_projector_name d x  in
                                          (uu____23752,
                                            FStar_SMTEncoding_Term.Term_sort,
                                            projectible)))
                                 in
                              let datacons =
                                let uu____23754 =
                                  let uu____23773 = varops.next_id ()  in
                                  (ddconstrsym, fields,
                                    FStar_SMTEncoding_Term.Term_sort,
                                    uu____23773, true)
                                   in
                                FStar_All.pipe_right uu____23754
                                  FStar_SMTEncoding_Term.constructor_to_decl
                                 in
                              let app = mk_Apply ddtok_tm vars  in
                              let guard =
                                FStar_SMTEncoding_Util.mk_and_l guards  in
                              let xvars =
                                FStar_List.map FStar_SMTEncoding_Util.mkFreeV
                                  vars
                                 in
                              let dapp =
                                FStar_SMTEncoding_Util.mkApp
                                  (ddconstrsym, xvars)
                                 in
                              let uu____23812 =
                                encode_term_pred FStar_Pervasives_Native.None
                                  t env1 ddtok_tm
                                 in
                              (match uu____23812 with
                               | (tok_typing,decls3) ->
                                   let tok_typing1 =
                                     match fields with
                                     | uu____23824::uu____23825 ->
                                         let ff =
                                           ("ty",
                                             FStar_SMTEncoding_Term.Term_sort)
                                            in
                                         let f =
                                           FStar_SMTEncoding_Util.mkFreeV ff
                                            in
                                         let vtok_app_l =
                                           mk_Apply ddtok_tm [ff]  in
                                         let vtok_app_r =
                                           mk_Apply f
                                             [(ddtok,
                                                FStar_SMTEncoding_Term.Term_sort)]
                                            in
                                         let uu____23870 =
                                           let uu____23881 =
                                             FStar_SMTEncoding_Term.mk_NoHoist
                                               f tok_typing
                                              in
                                           ([[vtok_app_l]; [vtok_app_r]],
                                             [ff], uu____23881)
                                            in
                                         FStar_SMTEncoding_Util.mkForall
                                           uu____23870
                                     | uu____23906 -> tok_typing  in
                                   let uu____23915 =
                                     encode_binders
                                       (FStar_Pervasives_Native.Some fuel_tm)
                                       formals env1
                                      in
                                   (match uu____23915 with
                                    | (vars',guards',env'',decls_formals,uu____23940)
                                        ->
                                        let uu____23953 =
                                          let xvars1 =
                                            FStar_List.map
                                              FStar_SMTEncoding_Util.mkFreeV
                                              vars'
                                             in
                                          let dapp1 =
                                            FStar_SMTEncoding_Util.mkApp
                                              (ddconstrsym, xvars1)
                                             in
                                          encode_term_pred
                                            (FStar_Pervasives_Native.Some
                                               fuel_tm) t_res env'' dapp1
                                           in
                                        (match uu____23953 with
                                         | (ty_pred',decls_pred) ->
                                             let guard' =
                                               FStar_SMTEncoding_Util.mk_and_l
                                                 guards'
                                                in
                                             let proxy_fresh =
                                               match formals with
                                               | [] -> []
                                               | uu____23984 ->
                                                   let uu____23991 =
                                                     let uu____23992 =
                                                       varops.next_id ()  in
                                                     FStar_SMTEncoding_Term.fresh_token
                                                       (ddtok,
                                                         FStar_SMTEncoding_Term.Term_sort)
                                                       uu____23992
                                                      in
                                                   [uu____23991]
                                                in
                                             let encode_elim uu____24002 =
                                               let uu____24003 =
                                                 FStar_Syntax_Util.head_and_args
                                                   t_res
                                                  in
                                               match uu____24003 with
                                               | (head1,args) ->
                                                   let uu____24046 =
                                                     let uu____24047 =
                                                       FStar_Syntax_Subst.compress
                                                         head1
                                                        in
                                                     uu____24047.FStar_Syntax_Syntax.n
                                                      in
                                                   (match uu____24046 with
                                                    | FStar_Syntax_Syntax.Tm_uinst
                                                        ({
                                                           FStar_Syntax_Syntax.n
                                                             =
                                                             FStar_Syntax_Syntax.Tm_fvar
                                                             fv;
                                                           FStar_Syntax_Syntax.pos
                                                             = uu____24057;
                                                           FStar_Syntax_Syntax.vars
                                                             = uu____24058;_},uu____24059)
                                                        ->
                                                        let uu____24064 =
                                                          lookup_free_var_name
                                                            env'
                                                            fv.FStar_Syntax_Syntax.fv_name
                                                           in
                                                        (match uu____24064
                                                         with
                                                         | (encoded_head,encoded_head_arity)
                                                             ->
                                                             let uu____24077
                                                               =
                                                               encode_args
                                                                 args env'
                                                                in
                                                             (match uu____24077
                                                              with
                                                              | (encoded_args,arg_decls)
                                                                  ->
                                                                  let guards_for_parameter
                                                                    orig_arg
                                                                    arg xv =
                                                                    let fv1 =
                                                                    match 
                                                                    arg.FStar_SMTEncoding_Term.tm
                                                                    with
                                                                    | 
                                                                    FStar_SMTEncoding_Term.FreeV
                                                                    fv1 ->
                                                                    fv1
                                                                    | 
                                                                    uu____24120
                                                                    ->
                                                                    let uu____24121
                                                                    =
                                                                    let uu____24126
                                                                    =
                                                                    let uu____24127
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    orig_arg
                                                                     in
                                                                    FStar_Util.format1
                                                                    "Inductive type parameter %s must be a variable ; You may want to change it to an index."
                                                                    uu____24127
                                                                     in
                                                                    (FStar_Errors.Fatal_NonVariableInductiveTypeParameter,
                                                                    uu____24126)
                                                                     in
                                                                    FStar_Errors.raise_error
                                                                    uu____24121
                                                                    orig_arg.FStar_Syntax_Syntax.pos
                                                                     in
                                                                    let guards1
                                                                    =
                                                                    FStar_All.pipe_right
                                                                    guards
                                                                    (FStar_List.collect
                                                                    (fun g 
                                                                    ->
                                                                    let uu____24143
                                                                    =
                                                                    let uu____24144
                                                                    =
                                                                    FStar_SMTEncoding_Term.free_variables
                                                                    g  in
                                                                    FStar_List.contains
                                                                    fv1
                                                                    uu____24144
                                                                     in
                                                                    if
                                                                    uu____24143
                                                                    then
                                                                    let uu____24157
                                                                    =
                                                                    FStar_SMTEncoding_Term.subst
                                                                    g fv1 xv
                                                                     in
                                                                    [uu____24157]
                                                                    else []))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mk_and_l
                                                                    guards1
                                                                     in
                                                                  let uu____24159
                                                                    =
                                                                    let uu____24172
                                                                    =
                                                                    FStar_List.zip
                                                                    args
                                                                    encoded_args
                                                                     in
                                                                    FStar_List.fold_left
                                                                    (fun
                                                                    uu____24222
                                                                     ->
                                                                    fun
                                                                    uu____24223
                                                                     ->
                                                                    match 
                                                                    (uu____24222,
                                                                    uu____24223)
                                                                    with
                                                                    | 
                                                                    ((env2,arg_vars,eqns_or_guards,i),
                                                                    (orig_arg,arg))
                                                                    ->
                                                                    let uu____24318
                                                                    =
                                                                    let uu____24325
                                                                    =
                                                                    FStar_Syntax_Syntax.new_bv
                                                                    FStar_Pervasives_Native.None
                                                                    FStar_Syntax_Syntax.tun
                                                                     in
                                                                    gen_term_var
                                                                    env2
                                                                    uu____24325
                                                                     in
                                                                    (match uu____24318
                                                                    with
                                                                    | 
                                                                    (uu____24338,xv,env3)
                                                                    ->
                                                                    let eqns
                                                                    =
                                                                    if
                                                                    i < n_tps
                                                                    then
                                                                    let uu____24346
                                                                    =
                                                                    guards_for_parameter
                                                                    (FStar_Pervasives_Native.fst
                                                                    orig_arg)
                                                                    arg xv
                                                                     in
                                                                    uu____24346
                                                                    ::
                                                                    eqns_or_guards
                                                                    else
                                                                    (let uu____24348
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkEq
                                                                    (arg, xv)
                                                                     in
                                                                    uu____24348
                                                                    ::
                                                                    eqns_or_guards)
                                                                     in
                                                                    (env3,
                                                                    (xv ::
                                                                    arg_vars),
                                                                    eqns,
                                                                    (i +
                                                                    (Prims.parse_int "1")))))
                                                                    (env',
                                                                    [], [],
                                                                    (Prims.parse_int "0"))
                                                                    uu____24172
                                                                     in
                                                                  (match uu____24159
                                                                   with
                                                                   | 
                                                                   (uu____24363,arg_vars,elim_eqns_or_guards,uu____24366)
                                                                    ->
                                                                    let arg_vars1
                                                                    =
                                                                    FStar_List.rev
                                                                    arg_vars
                                                                     in
                                                                    let ty =
                                                                    maybe_curry_app
                                                                    (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.p
                                                                    (FStar_SMTEncoding_Term.Var
                                                                    encoded_head)
                                                                    encoded_head_arity
                                                                    arg_vars1
                                                                     in
                                                                    let xvars1
                                                                    =
                                                                    FStar_List.map
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    vars  in
                                                                    let dapp1
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkApp
                                                                    (ddconstrsym,
                                                                    xvars1)
                                                                     in
                                                                    let ty_pred
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_HasTypeWithFuel
                                                                    (FStar_Pervasives_Native.Some
                                                                    s_fuel_tm)
                                                                    dapp1 ty
                                                                     in
                                                                    let arg_binders
                                                                    =
                                                                    FStar_List.map
                                                                    FStar_SMTEncoding_Term.fv_of_term
                                                                    arg_vars1
                                                                     in
                                                                    let typing_inversion
                                                                    =
                                                                    let uu____24394
                                                                    =
                                                                    let uu____24401
                                                                    =
                                                                    let uu____24402
                                                                    =
                                                                    let uu____24413
                                                                    =
                                                                    add_fuel
                                                                    (fuel_var,
                                                                    FStar_SMTEncoding_Term.Fuel_sort)
                                                                    (FStar_List.append
                                                                    vars
                                                                    arg_binders)
                                                                     in
                                                                    let uu____24424
                                                                    =
                                                                    let uu____24425
                                                                    =
                                                                    let uu____24430
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_and_l
                                                                    (FStar_List.append
                                                                    elim_eqns_or_guards
                                                                    guards)
                                                                     in
                                                                    (ty_pred,
                                                                    uu____24430)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    uu____24425
                                                                     in
                                                                    ([
                                                                    [ty_pred]],
                                                                    uu____24413,
                                                                    uu____24424)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkForall
                                                                    uu____24402
                                                                     in
                                                                    (uu____24401,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "data constructor typing elim"),
                                                                    (Prims.strcat
                                                                    "data_elim_"
                                                                    ddconstrsym))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____24394
                                                                     in
                                                                    let subterm_ordering
                                                                    =
                                                                    if
                                                                    FStar_Ident.lid_equals
                                                                    d
                                                                    FStar_Parser_Const.lextop_lid
                                                                    then
                                                                    let x =
                                                                    let uu____24453
                                                                    =
                                                                    varops.fresh
                                                                    "x"  in
                                                                    (uu____24453,
                                                                    FStar_SMTEncoding_Term.Term_sort)
                                                                     in
                                                                    let xtm =
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    x  in
                                                                    let uu____24455
                                                                    =
                                                                    let uu____24462
                                                                    =
                                                                    let uu____24463
                                                                    =
                                                                    let uu____24474
                                                                    =
                                                                    let uu____24479
                                                                    =
                                                                    let uu____24482
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_Precedes
                                                                    xtm dapp1
                                                                     in
                                                                    [uu____24482]
                                                                     in
                                                                    [uu____24479]
                                                                     in
                                                                    let uu____24487
                                                                    =
                                                                    let uu____24488
                                                                    =
                                                                    let uu____24493
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_tester
                                                                    "LexCons"
                                                                    xtm  in
                                                                    let uu____24494
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_Precedes
                                                                    xtm dapp1
                                                                     in
                                                                    (uu____24493,
                                                                    uu____24494)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    uu____24488
                                                                     in
                                                                    (uu____24474,
                                                                    [x],
                                                                    uu____24487)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkForall
                                                                    uu____24463
                                                                     in
                                                                    let uu____24513
                                                                    =
                                                                    varops.mk_unique
                                                                    "lextop"
                                                                     in
                                                                    (uu____24462,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "lextop is top"),
                                                                    uu____24513)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____24455
                                                                    else
                                                                    (let prec
                                                                    =
                                                                    let uu____24520
                                                                    =
                                                                    FStar_All.pipe_right
                                                                    vars
                                                                    (FStar_List.mapi
                                                                    (fun i 
                                                                    ->
                                                                    fun v1 
                                                                    ->
                                                                    if
                                                                    i < n_tps
                                                                    then []
                                                                    else
                                                                    (let uu____24548
                                                                    =
                                                                    let uu____24549
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    v1  in
                                                                    FStar_SMTEncoding_Util.mk_Precedes
                                                                    uu____24549
                                                                    dapp1  in
                                                                    [uu____24548])))
                                                                     in
                                                                    FStar_All.pipe_right
                                                                    uu____24520
                                                                    FStar_List.flatten
                                                                     in
                                                                    let uu____24556
                                                                    =
                                                                    let uu____24563
                                                                    =
                                                                    let uu____24564
                                                                    =
                                                                    let uu____24575
                                                                    =
                                                                    add_fuel
                                                                    (fuel_var,
                                                                    FStar_SMTEncoding_Term.Fuel_sort)
                                                                    (FStar_List.append
                                                                    vars
                                                                    arg_binders)
                                                                     in
                                                                    let uu____24586
                                                                    =
                                                                    let uu____24587
                                                                    =
                                                                    let uu____24592
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_and_l
                                                                    prec  in
                                                                    (ty_pred,
                                                                    uu____24592)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    uu____24587
                                                                     in
                                                                    ([
                                                                    [ty_pred]],
                                                                    uu____24575,
                                                                    uu____24586)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkForall
                                                                    uu____24564
                                                                     in
                                                                    (uu____24563,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "subterm ordering"),
                                                                    (Prims.strcat
                                                                    "subterm_ordering_"
                                                                    ddconstrsym))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____24556)
                                                                     in
                                                                    (arg_decls,
                                                                    [typing_inversion;
                                                                    subterm_ordering]))))
                                                    | FStar_Syntax_Syntax.Tm_fvar
                                                        fv ->
                                                        let uu____24612 =
                                                          lookup_free_var_name
                                                            env'
                                                            fv.FStar_Syntax_Syntax.fv_name
                                                           in
                                                        (match uu____24612
                                                         with
                                                         | (encoded_head,encoded_head_arity)
                                                             ->
                                                             let uu____24625
                                                               =
                                                               encode_args
                                                                 args env'
                                                                in
                                                             (match uu____24625
                                                              with
                                                              | (encoded_args,arg_decls)
                                                                  ->
                                                                  let guards_for_parameter
                                                                    orig_arg
                                                                    arg xv =
                                                                    let fv1 =
                                                                    match 
                                                                    arg.FStar_SMTEncoding_Term.tm
                                                                    with
                                                                    | 
                                                                    FStar_SMTEncoding_Term.FreeV
                                                                    fv1 ->
                                                                    fv1
                                                                    | 
                                                                    uu____24668
                                                                    ->
                                                                    let uu____24669
                                                                    =
                                                                    let uu____24674
                                                                    =
                                                                    let uu____24675
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    orig_arg
                                                                     in
                                                                    FStar_Util.format1
                                                                    "Inductive type parameter %s must be a variable ; You may want to change it to an index."
                                                                    uu____24675
                                                                     in
                                                                    (FStar_Errors.Fatal_NonVariableInductiveTypeParameter,
                                                                    uu____24674)
                                                                     in
                                                                    FStar_Errors.raise_error
                                                                    uu____24669
                                                                    orig_arg.FStar_Syntax_Syntax.pos
                                                                     in
                                                                    let guards1
                                                                    =
                                                                    FStar_All.pipe_right
                                                                    guards
                                                                    (FStar_List.collect
                                                                    (fun g 
                                                                    ->
                                                                    let uu____24691
                                                                    =
                                                                    let uu____24692
                                                                    =
                                                                    FStar_SMTEncoding_Term.free_variables
                                                                    g  in
                                                                    FStar_List.contains
                                                                    fv1
                                                                    uu____24692
                                                                     in
                                                                    if
                                                                    uu____24691
                                                                    then
                                                                    let uu____24705
                                                                    =
                                                                    FStar_SMTEncoding_Term.subst
                                                                    g fv1 xv
                                                                     in
                                                                    [uu____24705]
                                                                    else []))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mk_and_l
                                                                    guards1
                                                                     in
                                                                  let uu____24707
                                                                    =
                                                                    let uu____24720
                                                                    =
                                                                    FStar_List.zip
                                                                    args
                                                                    encoded_args
                                                                     in
                                                                    FStar_List.fold_left
                                                                    (fun
                                                                    uu____24770
                                                                     ->
                                                                    fun
                                                                    uu____24771
                                                                     ->
                                                                    match 
                                                                    (uu____24770,
                                                                    uu____24771)
                                                                    with
                                                                    | 
                                                                    ((env2,arg_vars,eqns_or_guards,i),
                                                                    (orig_arg,arg))
                                                                    ->
                                                                    let uu____24866
                                                                    =
                                                                    let uu____24873
                                                                    =
                                                                    FStar_Syntax_Syntax.new_bv
                                                                    FStar_Pervasives_Native.None
                                                                    FStar_Syntax_Syntax.tun
                                                                     in
                                                                    gen_term_var
                                                                    env2
                                                                    uu____24873
                                                                     in
                                                                    (match uu____24866
                                                                    with
                                                                    | 
                                                                    (uu____24886,xv,env3)
                                                                    ->
                                                                    let eqns
                                                                    =
                                                                    if
                                                                    i < n_tps
                                                                    then
                                                                    let uu____24894
                                                                    =
                                                                    guards_for_parameter
                                                                    (FStar_Pervasives_Native.fst
                                                                    orig_arg)
                                                                    arg xv
                                                                     in
                                                                    uu____24894
                                                                    ::
                                                                    eqns_or_guards
                                                                    else
                                                                    (let uu____24896
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkEq
                                                                    (arg, xv)
                                                                     in
                                                                    uu____24896
                                                                    ::
                                                                    eqns_or_guards)
                                                                     in
                                                                    (env3,
                                                                    (xv ::
                                                                    arg_vars),
                                                                    eqns,
                                                                    (i +
                                                                    (Prims.parse_int "1")))))
                                                                    (env',
                                                                    [], [],
                                                                    (Prims.parse_int "0"))
                                                                    uu____24720
                                                                     in
                                                                  (match uu____24707
                                                                   with
                                                                   | 
                                                                   (uu____24911,arg_vars,elim_eqns_or_guards,uu____24914)
                                                                    ->
                                                                    let arg_vars1
                                                                    =
                                                                    FStar_List.rev
                                                                    arg_vars
                                                                     in
                                                                    let ty =
                                                                    maybe_curry_app
                                                                    (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.p
                                                                    (FStar_SMTEncoding_Term.Var
                                                                    encoded_head)
                                                                    encoded_head_arity
                                                                    arg_vars1
                                                                     in
                                                                    let xvars1
                                                                    =
                                                                    FStar_List.map
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    vars  in
                                                                    let dapp1
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkApp
                                                                    (ddconstrsym,
                                                                    xvars1)
                                                                     in
                                                                    let ty_pred
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_HasTypeWithFuel
                                                                    (FStar_Pervasives_Native.Some
                                                                    s_fuel_tm)
                                                                    dapp1 ty
                                                                     in
                                                                    let arg_binders
                                                                    =
                                                                    FStar_List.map
                                                                    FStar_SMTEncoding_Term.fv_of_term
                                                                    arg_vars1
                                                                     in
                                                                    let typing_inversion
                                                                    =
                                                                    let uu____24942
                                                                    =
                                                                    let uu____24949
                                                                    =
                                                                    let uu____24950
                                                                    =
                                                                    let uu____24961
                                                                    =
                                                                    add_fuel
                                                                    (fuel_var,
                                                                    FStar_SMTEncoding_Term.Fuel_sort)
                                                                    (FStar_List.append
                                                                    vars
                                                                    arg_binders)
                                                                     in
                                                                    let uu____24972
                                                                    =
                                                                    let uu____24973
                                                                    =
                                                                    let uu____24978
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_and_l
                                                                    (FStar_List.append
                                                                    elim_eqns_or_guards
                                                                    guards)
                                                                     in
                                                                    (ty_pred,
                                                                    uu____24978)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    uu____24973
                                                                     in
                                                                    ([
                                                                    [ty_pred]],
                                                                    uu____24961,
                                                                    uu____24972)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkForall
                                                                    uu____24950
                                                                     in
                                                                    (uu____24949,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "data constructor typing elim"),
                                                                    (Prims.strcat
                                                                    "data_elim_"
                                                                    ddconstrsym))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____24942
                                                                     in
                                                                    let subterm_ordering
                                                                    =
                                                                    if
                                                                    FStar_Ident.lid_equals
                                                                    d
                                                                    FStar_Parser_Const.lextop_lid
                                                                    then
                                                                    let x =
                                                                    let uu____25001
                                                                    =
                                                                    varops.fresh
                                                                    "x"  in
                                                                    (uu____25001,
                                                                    FStar_SMTEncoding_Term.Term_sort)
                                                                     in
                                                                    let xtm =
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    x  in
                                                                    let uu____25003
                                                                    =
                                                                    let uu____25010
                                                                    =
                                                                    let uu____25011
                                                                    =
                                                                    let uu____25022
                                                                    =
                                                                    let uu____25027
                                                                    =
                                                                    let uu____25030
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_Precedes
                                                                    xtm dapp1
                                                                     in
                                                                    [uu____25030]
                                                                     in
                                                                    [uu____25027]
                                                                     in
                                                                    let uu____25035
                                                                    =
                                                                    let uu____25036
                                                                    =
                                                                    let uu____25041
                                                                    =
                                                                    FStar_SMTEncoding_Term.mk_tester
                                                                    "LexCons"
                                                                    xtm  in
                                                                    let uu____25042
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_Precedes
                                                                    xtm dapp1
                                                                     in
                                                                    (uu____25041,
                                                                    uu____25042)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    uu____25036
                                                                     in
                                                                    (uu____25022,
                                                                    [x],
                                                                    uu____25035)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkForall
                                                                    uu____25011
                                                                     in
                                                                    let uu____25061
                                                                    =
                                                                    varops.mk_unique
                                                                    "lextop"
                                                                     in
                                                                    (uu____25010,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "lextop is top"),
                                                                    uu____25061)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____25003
                                                                    else
                                                                    (let prec
                                                                    =
                                                                    let uu____25068
                                                                    =
                                                                    FStar_All.pipe_right
                                                                    vars
                                                                    (FStar_List.mapi
                                                                    (fun i 
                                                                    ->
                                                                    fun v1 
                                                                    ->
                                                                    if
                                                                    i < n_tps
                                                                    then []
                                                                    else
                                                                    (let uu____25096
                                                                    =
                                                                    let uu____25097
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkFreeV
                                                                    v1  in
                                                                    FStar_SMTEncoding_Util.mk_Precedes
                                                                    uu____25097
                                                                    dapp1  in
                                                                    [uu____25096])))
                                                                     in
                                                                    FStar_All.pipe_right
                                                                    uu____25068
                                                                    FStar_List.flatten
                                                                     in
                                                                    let uu____25104
                                                                    =
                                                                    let uu____25111
                                                                    =
                                                                    let uu____25112
                                                                    =
                                                                    let uu____25123
                                                                    =
                                                                    add_fuel
                                                                    (fuel_var,
                                                                    FStar_SMTEncoding_Term.Fuel_sort)
                                                                    (FStar_List.append
                                                                    vars
                                                                    arg_binders)
                                                                     in
                                                                    let uu____25134
                                                                    =
                                                                    let uu____25135
                                                                    =
                                                                    let uu____25140
                                                                    =
                                                                    FStar_SMTEncoding_Util.mk_and_l
                                                                    prec  in
                                                                    (ty_pred,
                                                                    uu____25140)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    uu____25135
                                                                     in
                                                                    ([
                                                                    [ty_pred]],
                                                                    uu____25123,
                                                                    uu____25134)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkForall
                                                                    uu____25112
                                                                     in
                                                                    (uu____25111,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "subterm ordering"),
                                                                    (Prims.strcat
                                                                    "subterm_ordering_"
                                                                    ddconstrsym))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____25104)
                                                                     in
                                                                    (arg_decls,
                                                                    [typing_inversion;
                                                                    subterm_ordering]))))
                                                    | uu____25159 ->
                                                        ((let uu____25161 =
                                                            let uu____25166 =
                                                              let uu____25167
                                                                =
                                                                FStar_Syntax_Print.lid_to_string
                                                                  d
                                                                 in
                                                              let uu____25168
                                                                =
                                                                FStar_Syntax_Print.term_to_string
                                                                  head1
                                                                 in
                                                              FStar_Util.format2
                                                                "Constructor %s builds an unexpected type %s\n"
                                                                uu____25167
                                                                uu____25168
                                                               in
                                                            (FStar_Errors.Warning_ConstructorBuildsUnexpectedType,
                                                              uu____25166)
                                                             in
                                                          FStar_Errors.log_issue
                                                            se.FStar_Syntax_Syntax.sigrng
                                                            uu____25161);
                                                         ([], [])))
                                                in
                                             let uu____25173 = encode_elim ()
                                                in
                                             (match uu____25173 with
                                              | (decls2,elim) ->
                                                  let g =
                                                    let uu____25193 =
                                                      let uu____25196 =
                                                        let uu____25199 =
                                                          let uu____25202 =
                                                            let uu____25205 =
                                                              let uu____25206
                                                                =
                                                                let uu____25217
                                                                  =
                                                                  let uu____25220
                                                                    =
                                                                    let uu____25221
                                                                    =
                                                                    FStar_Syntax_Print.lid_to_string
                                                                    d  in
                                                                    FStar_Util.format1
                                                                    "data constructor proxy: %s"
                                                                    uu____25221
                                                                     in
                                                                  FStar_Pervasives_Native.Some
                                                                    uu____25220
                                                                   in
                                                                (ddtok, [],
                                                                  FStar_SMTEncoding_Term.Term_sort,
                                                                  uu____25217)
                                                                 in
                                                              FStar_SMTEncoding_Term.DeclFun
                                                                uu____25206
                                                               in
                                                            [uu____25205]  in
                                                          let uu____25226 =
                                                            let uu____25229 =
                                                              let uu____25232
                                                                =
                                                                let uu____25235
                                                                  =
                                                                  let uu____25238
                                                                    =
                                                                    let uu____25241
                                                                    =
                                                                    let uu____25244
                                                                    =
                                                                    let uu____25245
                                                                    =
                                                                    let uu____25252
                                                                    =
                                                                    let uu____25253
                                                                    =
                                                                    let uu____25264
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkEq
                                                                    (app,
                                                                    dapp)  in
                                                                    ([[app]],
                                                                    vars,
                                                                    uu____25264)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkForall
                                                                    uu____25253
                                                                     in
                                                                    (uu____25252,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "equality for proxy"),
                                                                    (Prims.strcat
                                                                    "equality_tok_"
                                                                    ddtok))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____25245
                                                                     in
                                                                    let uu____25277
                                                                    =
                                                                    let uu____25280
                                                                    =
                                                                    let uu____25281
                                                                    =
                                                                    let uu____25288
                                                                    =
                                                                    let uu____25289
                                                                    =
                                                                    let uu____25300
                                                                    =
                                                                    add_fuel
                                                                    (fuel_var,
                                                                    FStar_SMTEncoding_Term.Fuel_sort)
                                                                    vars'  in
                                                                    let uu____25311
                                                                    =
                                                                    FStar_SMTEncoding_Util.mkImp
                                                                    (guard',
                                                                    ty_pred')
                                                                     in
                                                                    ([
                                                                    [ty_pred']],
                                                                    uu____25300,
                                                                    uu____25311)
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkForall
                                                                    uu____25289
                                                                     in
                                                                    (uu____25288,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "data constructor typing intro"),
                                                                    (Prims.strcat
                                                                    "data_typing_intro_"
                                                                    ddtok))
                                                                     in
                                                                    FStar_SMTEncoding_Util.mkAssume
                                                                    uu____25281
                                                                     in
                                                                    [uu____25280]
                                                                     in
                                                                    uu____25244
                                                                    ::
                                                                    uu____25277
                                                                     in
                                                                    (FStar_SMTEncoding_Util.mkAssume
                                                                    (tok_typing1,
                                                                    (FStar_Pervasives_Native.Some
                                                                    "typing for data constructor proxy"),
                                                                    (Prims.strcat
                                                                    "typing_tok_"
                                                                    ddtok)))
                                                                    ::
                                                                    uu____25241
                                                                     in
                                                                  FStar_List.append
                                                                    uu____25238
                                                                    elim
                                                                   in
                                                                FStar_List.append
                                                                  decls_pred
                                                                  uu____25235
                                                                 in
                                                              FStar_List.append
                                                                decls_formals
                                                                uu____25232
                                                               in
                                                            FStar_List.append
                                                              proxy_fresh
                                                              uu____25229
                                                             in
                                                          FStar_List.append
                                                            uu____25202
                                                            uu____25226
                                                           in
                                                        FStar_List.append
                                                          decls3 uu____25199
                                                         in
                                                      FStar_List.append
                                                        decls2 uu____25196
                                                       in
                                                    FStar_List.append
                                                      binder_decls
                                                      uu____25193
                                                     in
                                                  ((FStar_List.append
                                                      datacons g), env1)))))))))

and (encode_sigelts :
  env_t ->
    FStar_Syntax_Syntax.sigelt Prims.list ->
      (FStar_SMTEncoding_Term.decl Prims.list,env_t)
        FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun ses  ->
      FStar_All.pipe_right ses
        (FStar_List.fold_left
           (fun uu____25357  ->
              fun se  ->
                match uu____25357 with
                | (g,env1) ->
                    let uu____25377 = encode_sigelt env1 se  in
                    (match uu____25377 with
                     | (g',env2) -> ((FStar_List.append g g'), env2)))
           ([], env))

let (encode_env_bindings :
  env_t ->
    FStar_TypeChecker_Env.binding Prims.list ->
      (FStar_SMTEncoding_Term.decls_t,env_t) FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun bindings  ->
      let encode_binding b uu____25434 =
        match uu____25434 with
        | (i,decls,env1) ->
            (match b with
             | FStar_TypeChecker_Env.Binding_univ uu____25466 ->
                 ((i + (Prims.parse_int "1")), [], env1)
             | FStar_TypeChecker_Env.Binding_var x ->
                 let t1 =
                   FStar_TypeChecker_Normalize.normalize
                     [FStar_TypeChecker_Normalize.Beta;
                     FStar_TypeChecker_Normalize.Eager_unfolding;
                     FStar_TypeChecker_Normalize.Simplify;
                     FStar_TypeChecker_Normalize.Primops;
                     FStar_TypeChecker_Normalize.EraseUniverses] env1.tcenv
                     x.FStar_Syntax_Syntax.sort
                    in
                 ((let uu____25472 =
                     FStar_All.pipe_left
                       (FStar_TypeChecker_Env.debug env1.tcenv)
                       (FStar_Options.Other "SMTEncoding")
                      in
                   if uu____25472
                   then
                     let uu____25473 = FStar_Syntax_Print.bv_to_string x  in
                     let uu____25474 =
                       FStar_Syntax_Print.term_to_string
                         x.FStar_Syntax_Syntax.sort
                        in
                     let uu____25475 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print3 "Normalized %s : %s to %s\n"
                       uu____25473 uu____25474 uu____25475
                   else ());
                  (let uu____25477 = encode_term t1 env1  in
                   match uu____25477 with
                   | (t,decls') ->
                       let t_hash = FStar_SMTEncoding_Term.hash_of_term t  in
                       let uu____25493 =
                         let uu____25500 =
                           let uu____25501 =
                             let uu____25502 =
                               FStar_Util.digest_of_string t_hash  in
                             Prims.strcat uu____25502
                               (Prims.strcat "_" (Prims.string_of_int i))
                              in
                           Prims.strcat "x_" uu____25501  in
                         new_term_constant_from_string env1 x uu____25500  in
                       (match uu____25493 with
                        | (xxsym,xx,env') ->
                            let t2 =
                              FStar_SMTEncoding_Term.mk_HasTypeWithFuel
                                FStar_Pervasives_Native.None xx t
                               in
                            let caption =
                              let uu____25518 = FStar_Options.log_queries ()
                                 in
                              if uu____25518
                              then
                                let uu____25521 =
                                  let uu____25522 =
                                    FStar_Syntax_Print.bv_to_string x  in
                                  let uu____25523 =
                                    FStar_Syntax_Print.term_to_string
                                      x.FStar_Syntax_Syntax.sort
                                     in
                                  let uu____25524 =
                                    FStar_Syntax_Print.term_to_string t1  in
                                  FStar_Util.format3 "%s : %s (%s)"
                                    uu____25522 uu____25523 uu____25524
                                   in
                                FStar_Pervasives_Native.Some uu____25521
                              else FStar_Pervasives_Native.None  in
                            let ax =
                              let a_name = Prims.strcat "binder_" xxsym  in
                              FStar_SMTEncoding_Util.mkAssume
                                (t2, (FStar_Pervasives_Native.Some a_name),
                                  a_name)
                               in
                            let g =
                              FStar_List.append
                                [FStar_SMTEncoding_Term.DeclFun
                                   (xxsym, [],
                                     FStar_SMTEncoding_Term.Term_sort,
                                     caption)]
                                (FStar_List.append decls' [ax])
                               in
                            ((i + (Prims.parse_int "1")),
                              (FStar_List.append decls g), env'))))
             | FStar_TypeChecker_Env.Binding_lid (x,(uu____25540,t)) ->
                 let t_norm = whnf env1 t  in
                 let fv =
                   FStar_Syntax_Syntax.lid_as_fv x
                     FStar_Syntax_Syntax.Delta_constant
                     FStar_Pervasives_Native.None
                    in
                 let uu____25554 = encode_free_var false env1 fv t t_norm []
                    in
                 (match uu____25554 with
                  | (g,env') ->
                      ((i + (Prims.parse_int "1")),
                        (FStar_List.append decls g), env'))
             | FStar_TypeChecker_Env.Binding_sig_inst
                 (uu____25577,se,uu____25579) ->
                 let uu____25584 = encode_sigelt env1 se  in
                 (match uu____25584 with
                  | (g,env') ->
                      ((i + (Prims.parse_int "1")),
                        (FStar_List.append decls g), env'))
             | FStar_TypeChecker_Env.Binding_sig (uu____25601,se) ->
                 let uu____25607 = encode_sigelt env1 se  in
                 (match uu____25607 with
                  | (g,env') ->
                      ((i + (Prims.parse_int "1")),
                        (FStar_List.append decls g), env')))
         in
      let uu____25624 =
        FStar_List.fold_right encode_binding bindings
          ((Prims.parse_int "0"), [], env)
         in
      match uu____25624 with | (uu____25647,decls,env1) -> (decls, env1)
  
let encode_labels :
  'Auu____25659 'Auu____25660 .
    ((Prims.string,FStar_SMTEncoding_Term.sort)
       FStar_Pervasives_Native.tuple2,'Auu____25659,'Auu____25660)
      FStar_Pervasives_Native.tuple3 Prims.list ->
      (FStar_SMTEncoding_Term.decl Prims.list,FStar_SMTEncoding_Term.decl
                                                Prims.list)
        FStar_Pervasives_Native.tuple2
  =
  fun labs  ->
    let prefix1 =
      FStar_All.pipe_right labs
        (FStar_List.map
           (fun uu____25728  ->
              match uu____25728 with
              | (l,uu____25740,uu____25741) ->
                  FStar_SMTEncoding_Term.DeclFun
                    ((FStar_Pervasives_Native.fst l), [],
                      FStar_SMTEncoding_Term.Bool_sort,
                      FStar_Pervasives_Native.None)))
       in
    let suffix =
      FStar_All.pipe_right labs
        (FStar_List.collect
           (fun uu____25787  ->
              match uu____25787 with
              | (l,uu____25801,uu____25802) ->
                  let uu____25811 =
                    FStar_All.pipe_left
                      (fun _0_44  -> FStar_SMTEncoding_Term.Echo _0_44)
                      (FStar_Pervasives_Native.fst l)
                     in
                  let uu____25812 =
                    let uu____25815 =
                      let uu____25816 = FStar_SMTEncoding_Util.mkFreeV l  in
                      FStar_SMTEncoding_Term.Eval uu____25816  in
                    [uu____25815]  in
                  uu____25811 :: uu____25812))
       in
    (prefix1, suffix)
  
let (last_env : env_t Prims.list FStar_ST.ref) = FStar_Util.mk_ref [] 
let (init_env : FStar_TypeChecker_Env.env -> Prims.unit) =
  fun tcenv  ->
    let uu____25841 =
      let uu____25844 =
        let uu____25845 = FStar_Util.smap_create (Prims.parse_int "100")  in
        let uu____25848 =
          let uu____25849 = FStar_TypeChecker_Env.current_module tcenv  in
          FStar_All.pipe_right uu____25849 FStar_Ident.string_of_lid  in
        {
          bindings = [];
          depth = (Prims.parse_int "0");
          tcenv;
          warn = true;
          cache = uu____25845;
          nolabels = false;
          use_zfuel_name = false;
          encode_non_total_function_typ = true;
          current_module_name = uu____25848
        }  in
      [uu____25844]  in
    FStar_ST.op_Colon_Equals last_env uu____25841
  
let (get_env : FStar_Ident.lident -> FStar_TypeChecker_Env.env -> env_t) =
  fun cmn  ->
    fun tcenv  ->
      let uu____25879 = FStar_ST.op_Bang last_env  in
      match uu____25879 with
      | [] -> failwith "No env; call init first!"
      | e::uu____25906 ->
          let uu___131_25909 = e  in
          let uu____25910 = FStar_Ident.string_of_lid cmn  in
          {
            bindings = (uu___131_25909.bindings);
            depth = (uu___131_25909.depth);
            tcenv;
            warn = (uu___131_25909.warn);
            cache = (uu___131_25909.cache);
            nolabels = (uu___131_25909.nolabels);
            use_zfuel_name = (uu___131_25909.use_zfuel_name);
            encode_non_total_function_typ =
              (uu___131_25909.encode_non_total_function_typ);
            current_module_name = uu____25910
          }
  
let (set_env : env_t -> Prims.unit) =
  fun env  ->
    let uu____25914 = FStar_ST.op_Bang last_env  in
    match uu____25914 with
    | [] -> failwith "Empty env stack"
    | uu____25940::tl1 -> FStar_ST.op_Colon_Equals last_env (env :: tl1)
  
let (push_env : Prims.unit -> Prims.unit) =
  fun uu____25969  ->
    let uu____25970 = FStar_ST.op_Bang last_env  in
    match uu____25970 with
    | [] -> failwith "Empty env stack"
    | hd1::tl1 ->
        let refs = FStar_Util.smap_copy hd1.cache  in
        let top =
          let uu___132_26004 = hd1  in
          {
            bindings = (uu___132_26004.bindings);
            depth = (uu___132_26004.depth);
            tcenv = (uu___132_26004.tcenv);
            warn = (uu___132_26004.warn);
            cache = refs;
            nolabels = (uu___132_26004.nolabels);
            use_zfuel_name = (uu___132_26004.use_zfuel_name);
            encode_non_total_function_typ =
              (uu___132_26004.encode_non_total_function_typ);
            current_module_name = (uu___132_26004.current_module_name)
          }  in
        FStar_ST.op_Colon_Equals last_env (top :: hd1 :: tl1)
  
let (pop_env : Prims.unit -> Prims.unit) =
  fun uu____26030  ->
    let uu____26031 = FStar_ST.op_Bang last_env  in
    match uu____26031 with
    | [] -> failwith "Popping an empty stack"
    | uu____26057::tl1 -> FStar_ST.op_Colon_Equals last_env tl1
  
let (init : FStar_TypeChecker_Env.env -> Prims.unit) =
  fun tcenv  ->
    init_env tcenv;
    FStar_SMTEncoding_Z3.init ();
    FStar_SMTEncoding_Z3.giveZ3 [FStar_SMTEncoding_Term.DefPrelude]
  
let (push : Prims.string -> Prims.unit) =
  fun msg  -> push_env (); varops.push (); FStar_SMTEncoding_Z3.push msg 
let (pop : Prims.string -> Prims.unit) =
  fun msg  -> pop_env (); varops.pop (); FStar_SMTEncoding_Z3.pop msg 
let (open_fact_db_tags :
  env_t -> FStar_SMTEncoding_Term.fact_db_id Prims.list) = fun env  -> [] 
let (place_decl_in_fact_dbs :
  env_t ->
    FStar_SMTEncoding_Term.fact_db_id Prims.list ->
      FStar_SMTEncoding_Term.decl -> FStar_SMTEncoding_Term.decl)
  =
  fun env  ->
    fun fact_db_ids  ->
      fun d  ->
        match (fact_db_ids, d) with
        | (uu____26121::uu____26122,FStar_SMTEncoding_Term.Assume a) ->
            FStar_SMTEncoding_Term.Assume
              (let uu___133_26130 = a  in
               {
                 FStar_SMTEncoding_Term.assumption_term =
                   (uu___133_26130.FStar_SMTEncoding_Term.assumption_term);
                 FStar_SMTEncoding_Term.assumption_caption =
                   (uu___133_26130.FStar_SMTEncoding_Term.assumption_caption);
                 FStar_SMTEncoding_Term.assumption_name =
                   (uu___133_26130.FStar_SMTEncoding_Term.assumption_name);
                 FStar_SMTEncoding_Term.assumption_fact_ids = fact_db_ids
               })
        | uu____26131 -> d
  
let (fact_dbs_for_lid :
  env_t -> FStar_Ident.lid -> FStar_SMTEncoding_Term.fact_db_id Prims.list) =
  fun env  ->
    fun lid  ->
      let uu____26146 =
        let uu____26149 =
          let uu____26150 = FStar_Ident.lid_of_ids lid.FStar_Ident.ns  in
          FStar_SMTEncoding_Term.Namespace uu____26150  in
        let uu____26151 = open_fact_db_tags env  in uu____26149 ::
          uu____26151
         in
      (FStar_SMTEncoding_Term.Name lid) :: uu____26146
  
let (encode_top_level_facts :
  env_t ->
    FStar_Syntax_Syntax.sigelt ->
      (FStar_SMTEncoding_Term.decl Prims.list,env_t)
        FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun se  ->
      let fact_db_ids =
        FStar_All.pipe_right (FStar_Syntax_Util.lids_of_sigelt se)
          (FStar_List.collect (fact_dbs_for_lid env))
         in
      let uu____26173 = encode_sigelt env se  in
      match uu____26173 with
      | (g,env1) ->
          let g1 =
            FStar_All.pipe_right g
              (FStar_List.map (place_decl_in_fact_dbs env1 fact_db_ids))
             in
          (g1, env1)
  
let (encode_sig :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.sigelt -> Prims.unit) =
  fun tcenv  ->
    fun se  ->
      let caption decls =
        let uu____26209 = FStar_Options.log_queries ()  in
        if uu____26209
        then
          let uu____26212 =
            let uu____26213 =
              let uu____26214 =
                let uu____26215 =
                  FStar_All.pipe_right (FStar_Syntax_Util.lids_of_sigelt se)
                    (FStar_List.map FStar_Syntax_Print.lid_to_string)
                   in
                FStar_All.pipe_right uu____26215 (FStar_String.concat ", ")
                 in
              Prims.strcat "encoding sigelt " uu____26214  in
            FStar_SMTEncoding_Term.Caption uu____26213  in
          uu____26212 :: decls
        else decls  in
      (let uu____26226 = FStar_TypeChecker_Env.debug tcenv FStar_Options.Low
          in
       if uu____26226
       then
         let uu____26227 = FStar_Syntax_Print.sigelt_to_string se  in
         FStar_Util.print1 "+++++++++++Encoding sigelt %s\n" uu____26227
       else ());
      (let env =
         let uu____26230 = FStar_TypeChecker_Env.current_module tcenv  in
         get_env uu____26230 tcenv  in
       let uu____26231 = encode_top_level_facts env se  in
       match uu____26231 with
       | (decls,env1) ->
           (set_env env1;
            (let uu____26245 = caption decls  in
             FStar_SMTEncoding_Z3.giveZ3 uu____26245)))
  
let (encode_modul :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.modul -> Prims.unit) =
  fun tcenv  ->
    fun modul  ->
      let name =
        FStar_Util.format2 "%s %s"
          (if modul.FStar_Syntax_Syntax.is_interface
           then "interface"
           else "module") (modul.FStar_Syntax_Syntax.name).FStar_Ident.str
         in
      (let uu____26257 = FStar_TypeChecker_Env.debug tcenv FStar_Options.Low
          in
       if uu____26257
       then
         let uu____26258 =
           FStar_All.pipe_right
             (FStar_List.length modul.FStar_Syntax_Syntax.exports)
             Prims.string_of_int
            in
         FStar_Util.print2
           "+++++++++++Encoding externals for %s ... %s exports\n" name
           uu____26258
       else ());
      (let env = get_env modul.FStar_Syntax_Syntax.name tcenv  in
       let encode_signature env1 ses =
         FStar_All.pipe_right ses
           (FStar_List.fold_left
              (fun uu____26293  ->
                 fun se  ->
                   match uu____26293 with
                   | (g,env2) ->
                       let uu____26313 = encode_top_level_facts env2 se  in
                       (match uu____26313 with
                        | (g',env3) -> ((FStar_List.append g g'), env3)))
              ([], env1))
          in
       let uu____26336 =
         encode_signature
           (let uu___134_26345 = env  in
            {
              bindings = (uu___134_26345.bindings);
              depth = (uu___134_26345.depth);
              tcenv = (uu___134_26345.tcenv);
              warn = false;
              cache = (uu___134_26345.cache);
              nolabels = (uu___134_26345.nolabels);
              use_zfuel_name = (uu___134_26345.use_zfuel_name);
              encode_non_total_function_typ =
                (uu___134_26345.encode_non_total_function_typ);
              current_module_name = (uu___134_26345.current_module_name)
            }) modul.FStar_Syntax_Syntax.exports
          in
       match uu____26336 with
       | (decls,env1) ->
           let caption decls1 =
             let uu____26362 = FStar_Options.log_queries ()  in
             if uu____26362
             then
               let msg = Prims.strcat "Externals for " name  in
               FStar_List.append ((FStar_SMTEncoding_Term.Caption msg) ::
                 decls1)
                 [FStar_SMTEncoding_Term.Caption (Prims.strcat "End " msg)]
             else decls1  in
           (set_env
              (let uu___135_26370 = env1  in
               {
                 bindings = (uu___135_26370.bindings);
                 depth = (uu___135_26370.depth);
                 tcenv = (uu___135_26370.tcenv);
                 warn = true;
                 cache = (uu___135_26370.cache);
                 nolabels = (uu___135_26370.nolabels);
                 use_zfuel_name = (uu___135_26370.use_zfuel_name);
                 encode_non_total_function_typ =
                   (uu___135_26370.encode_non_total_function_typ);
                 current_module_name = (uu___135_26370.current_module_name)
               });
            (let uu____26372 =
               FStar_TypeChecker_Env.debug tcenv FStar_Options.Low  in
             if uu____26372
             then FStar_Util.print1 "Done encoding externals for %s\n" name
             else ());
            (let decls1 = caption decls  in
             FStar_SMTEncoding_Z3.giveZ3 decls1)))
  
let (encode_query :
  (Prims.unit -> Prims.string) FStar_Pervasives_Native.option ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term ->
        (FStar_SMTEncoding_Term.decl Prims.list,FStar_SMTEncoding_ErrorReporting.label
                                                  Prims.list,FStar_SMTEncoding_Term.decl,
          FStar_SMTEncoding_Term.decl Prims.list)
          FStar_Pervasives_Native.tuple4)
  =
  fun use_env_msg  ->
    fun tcenv  ->
      fun q  ->
        (let uu____26424 =
           let uu____26425 = FStar_TypeChecker_Env.current_module tcenv  in
           uu____26425.FStar_Ident.str  in
         FStar_SMTEncoding_Z3.query_logging.FStar_SMTEncoding_Z3.set_module_name
           uu____26424);
        (let env =
           let uu____26427 = FStar_TypeChecker_Env.current_module tcenv  in
           get_env uu____26427 tcenv  in
         let bindings =
           FStar_TypeChecker_Env.fold_env tcenv
             (fun bs  -> fun b  -> b :: bs) []
            in
         let uu____26439 =
           let rec aux bindings1 =
             match bindings1 with
             | (FStar_TypeChecker_Env.Binding_var x)::rest ->
                 let uu____26474 = aux rest  in
                 (match uu____26474 with
                  | (out,rest1) ->
                      let t =
                        let uu____26504 =
                          FStar_Syntax_Util.destruct_typ_as_formula
                            x.FStar_Syntax_Syntax.sort
                           in
                        match uu____26504 with
                        | FStar_Pervasives_Native.Some uu____26509 ->
                            let uu____26510 =
                              FStar_Syntax_Syntax.new_bv
                                FStar_Pervasives_Native.None
                                FStar_Syntax_Syntax.t_unit
                               in
                            FStar_Syntax_Util.refine uu____26510
                              x.FStar_Syntax_Syntax.sort
                        | uu____26511 -> x.FStar_Syntax_Syntax.sort  in
                      let t1 =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Simplify;
                          FStar_TypeChecker_Normalize.Primops;
                          FStar_TypeChecker_Normalize.EraseUniverses]
                          env.tcenv t
                         in
                      let uu____26515 =
                        let uu____26518 =
                          FStar_Syntax_Syntax.mk_binder
                            (let uu___136_26521 = x  in
                             {
                               FStar_Syntax_Syntax.ppname =
                                 (uu___136_26521.FStar_Syntax_Syntax.ppname);
                               FStar_Syntax_Syntax.index =
                                 (uu___136_26521.FStar_Syntax_Syntax.index);
                               FStar_Syntax_Syntax.sort = t1
                             })
                           in
                        uu____26518 :: out  in
                      (uu____26515, rest1))
             | uu____26526 -> ([], bindings1)  in
           let uu____26533 = aux bindings  in
           match uu____26533 with
           | (closing,bindings1) ->
               let uu____26558 =
                 FStar_Syntax_Util.close_forall_no_univs
                   (FStar_List.rev closing) q
                  in
               (uu____26558, bindings1)
            in
         match uu____26439 with
         | (q1,bindings1) ->
             let uu____26581 =
               let uu____26586 =
                 FStar_List.filter
                   (fun uu___101_26591  ->
                      match uu___101_26591 with
                      | FStar_TypeChecker_Env.Binding_sig uu____26592 ->
                          false
                      | uu____26599 -> true) bindings1
                  in
               encode_env_bindings env uu____26586  in
             (match uu____26581 with
              | (env_decls,env1) ->
                  ((let uu____26617 =
                      ((FStar_TypeChecker_Env.debug tcenv FStar_Options.Low)
                         ||
                         (FStar_All.pipe_left
                            (FStar_TypeChecker_Env.debug tcenv)
                            (FStar_Options.Other "SMTEncoding")))
                        ||
                        (FStar_All.pipe_left
                           (FStar_TypeChecker_Env.debug tcenv)
                           (FStar_Options.Other "SMTQuery"))
                       in
                    if uu____26617
                    then
                      let uu____26618 = FStar_Syntax_Print.term_to_string q1
                         in
                      FStar_Util.print1 "Encoding query formula: %s\n"
                        uu____26618
                    else ());
                   (let uu____26620 = encode_formula q1 env1  in
                    match uu____26620 with
                    | (phi,qdecls) ->
                        let uu____26641 =
                          let uu____26646 =
                            FStar_TypeChecker_Env.get_range tcenv  in
                          FStar_SMTEncoding_ErrorReporting.label_goals
                            use_env_msg uu____26646 phi
                           in
                        (match uu____26641 with
                         | (labels,phi1) ->
                             let uu____26663 = encode_labels labels  in
                             (match uu____26663 with
                              | (label_prefix,label_suffix) ->
                                  let query_prelude =
                                    FStar_List.append env_decls
                                      (FStar_List.append label_prefix qdecls)
                                     in
                                  let qry =
                                    let uu____26700 =
                                      let uu____26707 =
                                        FStar_SMTEncoding_Util.mkNot phi1  in
                                      let uu____26708 =
                                        varops.mk_unique "@query"  in
                                      (uu____26707,
                                        (FStar_Pervasives_Native.Some "query"),
                                        uu____26708)
                                       in
                                    FStar_SMTEncoding_Util.mkAssume
                                      uu____26700
                                     in
                                  let suffix =
                                    FStar_List.append
                                      [FStar_SMTEncoding_Term.Echo "<labels>"]
                                      (FStar_List.append label_suffix
                                         [FStar_SMTEncoding_Term.Echo
                                            "</labels>";
                                         FStar_SMTEncoding_Term.Echo "Done!"])
                                     in
                                  (query_prelude, labels, qry, suffix)))))))
  