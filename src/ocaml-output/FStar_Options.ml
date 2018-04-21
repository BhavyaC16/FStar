open Prims
type debug_level_t =
  | Low 
  | Medium 
  | High 
  | Extreme 
  | Other of Prims.string [@@deriving show]
let (uu___is_Low : debug_level_t -> Prims.bool) =
  fun projectee -> match projectee with | Low -> true | uu____8 -> false
let (uu___is_Medium : debug_level_t -> Prims.bool) =
  fun projectee -> match projectee with | Medium -> true | uu____12 -> false
let (uu___is_High : debug_level_t -> Prims.bool) =
  fun projectee -> match projectee with | High -> true | uu____16 -> false
let (uu___is_Extreme : debug_level_t -> Prims.bool) =
  fun projectee -> match projectee with | Extreme -> true | uu____20 -> false
let (uu___is_Other : debug_level_t -> Prims.bool) =
  fun projectee ->
    match projectee with | Other _0 -> true | uu____25 -> false
let (__proj__Other__item___0 : debug_level_t -> Prims.string) =
  fun projectee -> match projectee with | Other _0 -> _0
type option_val =
  | Bool of Prims.bool 
  | String of Prims.string 
  | Path of Prims.string 
  | Int of Prims.int 
  | List of option_val Prims.list 
  | Unset [@@deriving show]
let (uu___is_Bool : option_val -> Prims.bool) =
  fun projectee -> match projectee with | Bool _0 -> true | uu____59 -> false
let (__proj__Bool__item___0 : option_val -> Prims.bool) =
  fun projectee -> match projectee with | Bool _0 -> _0
let (uu___is_String : option_val -> Prims.bool) =
  fun projectee ->
    match projectee with | String _0 -> true | uu____71 -> false
let (__proj__String__item___0 : option_val -> Prims.string) =
  fun projectee -> match projectee with | String _0 -> _0
let (uu___is_Path : option_val -> Prims.bool) =
  fun projectee -> match projectee with | Path _0 -> true | uu____83 -> false
let (__proj__Path__item___0 : option_val -> Prims.string) =
  fun projectee -> match projectee with | Path _0 -> _0
let (uu___is_Int : option_val -> Prims.bool) =
  fun projectee -> match projectee with | Int _0 -> true | uu____95 -> false
let (__proj__Int__item___0 : option_val -> Prims.int) =
  fun projectee -> match projectee with | Int _0 -> _0
let (uu___is_List : option_val -> Prims.bool) =
  fun projectee ->
    match projectee with | List _0 -> true | uu____109 -> false
let (__proj__List__item___0 : option_val -> option_val Prims.list) =
  fun projectee -> match projectee with | List _0 -> _0
let (uu___is_Unset : option_val -> Prims.bool) =
  fun projectee -> match projectee with | Unset -> true | uu____126 -> false
let (mk_bool : Prims.bool -> option_val) = fun _0_27 -> Bool _0_27
let (mk_string : Prims.string -> option_val) = fun _0_28 -> String _0_28
let (mk_path : Prims.string -> option_val) = fun _0_29 -> Path _0_29
let (mk_int : Prims.int -> option_val) = fun _0_30 -> Int _0_30
let (mk_list : option_val Prims.list -> option_val) = fun _0_31 -> List _0_31
type options =
  | Set 
  | Reset 
  | Restore [@@deriving show]
let (uu___is_Set : options -> Prims.bool) =
  fun projectee -> match projectee with | Set -> true | uu____142 -> false
let (uu___is_Reset : options -> Prims.bool) =
  fun projectee -> match projectee with | Reset -> true | uu____146 -> false
let (uu___is_Restore : options -> Prims.bool) =
  fun projectee ->
    match projectee with | Restore -> true | uu____150 -> false
let (__unit_tests__ : Prims.bool FStar_ST.ref) = FStar_Util.mk_ref false
let (__unit_tests : Prims.unit -> Prims.bool) =
  fun uu____190 -> FStar_ST.op_Bang __unit_tests__
let (__set_unit_tests : Prims.unit -> Prims.unit) =
  fun uu____218 -> FStar_ST.op_Colon_Equals __unit_tests__ true
let (__clear_unit_tests : Prims.unit -> Prims.unit) =
  fun uu____246 -> FStar_ST.op_Colon_Equals __unit_tests__ false
let (as_bool : option_val -> Prims.bool) =
  fun uu___39_274 ->
    match uu___39_274 with
    | Bool b -> b
    | uu____276 -> failwith "Impos: expected Bool"
let (as_int : option_val -> Prims.int) =
  fun uu___40_279 ->
    match uu___40_279 with
    | Int b -> b
    | uu____281 -> failwith "Impos: expected Int"
let (as_string : option_val -> Prims.string) =
  fun uu___41_284 ->
    match uu___41_284 with
    | String b -> b
    | Path b -> FStar_Common.try_convert_file_name_to_mixed b
    | uu____287 -> failwith "Impos: expected String"
let (as_list' : option_val -> option_val Prims.list) =
  fun uu___42_292 ->
    match uu___42_292 with
    | List ts -> ts
    | uu____298 -> failwith "Impos: expected List"
let as_list :
  'Auu____304 .
    (option_val -> 'Auu____304) -> option_val -> 'Auu____304 Prims.list
  =
  fun as_t ->
    fun x ->
      let uu____320 = as_list' x in
      FStar_All.pipe_right uu____320 (FStar_List.map as_t)
let as_option :
  'Auu____330 .
    (option_val -> 'Auu____330) ->
      option_val -> 'Auu____330 FStar_Pervasives_Native.option
  =
  fun as_t ->
    fun uu___43_343 ->
      match uu___43_343 with
      | Unset -> FStar_Pervasives_Native.None
      | v1 ->
          let uu____347 = as_t v1 in FStar_Pervasives_Native.Some uu____347
type optionstate = option_val FStar_Util.smap[@@deriving show]
let (fstar_options : optionstate Prims.list FStar_ST.ref) =
  FStar_Util.mk_ref []
let (peek : Prims.unit -> optionstate) =
  fun uu____393 ->
    let uu____394 = FStar_ST.op_Bang fstar_options in FStar_List.hd uu____394
let (pop : Prims.unit -> Prims.unit) =
  fun uu____428 ->
    let uu____429 = FStar_ST.op_Bang fstar_options in
    match uu____429 with
    | [] -> failwith "TOO MANY POPS!"
    | uu____461::[] -> failwith "TOO MANY POPS!"
    | uu____462::tl1 -> FStar_ST.op_Colon_Equals fstar_options tl1
let (push : Prims.unit -> Prims.unit) =
  fun uu____497 ->
    let uu____498 =
      let uu____501 =
        let uu____504 = peek () in FStar_Util.smap_copy uu____504 in
      let uu____507 = FStar_ST.op_Bang fstar_options in uu____501 ::
        uu____507 in
    FStar_ST.op_Colon_Equals fstar_options uu____498
let (set : optionstate -> Prims.unit) =
  fun o ->
    let uu____575 = FStar_ST.op_Bang fstar_options in
    match uu____575 with
    | [] -> failwith "set on empty option stack"
    | uu____607::os -> FStar_ST.op_Colon_Equals fstar_options (o :: os)
let (set_option : Prims.string -> option_val -> Prims.unit) =
  fun k ->
    fun v1 -> let uu____646 = peek () in FStar_Util.smap_add uu____646 k v1
let (set_option' :
  (Prims.string, option_val) FStar_Pervasives_Native.tuple2 -> Prims.unit) =
  fun uu____655 -> match uu____655 with | (k, v1) -> set_option k v1
let with_saved_options : 'a . (Prims.unit -> 'a) -> 'a =
  fun f -> push (); (let retv = f () in pop (); retv)
let (light_off_files : Prims.string Prims.list FStar_ST.ref) =
  FStar_Util.mk_ref []
let (add_light_off_file : Prims.string -> Prims.unit) =
  fun filename ->
    let uu____721 =
      let uu____724 = FStar_ST.op_Bang light_off_files in filename ::
        uu____724 in
    FStar_ST.op_Colon_Equals light_off_files uu____721
let (defaults :
  (Prims.string, option_val) FStar_Pervasives_Native.tuple2 Prims.list) =
  [("__temp_no_proj", (List []));
  ("__temp_fast_implicits", (Bool false));
  ("admit_smt_queries", (Bool false));
  ("admit_except", Unset);
  ("cache_checked_modules", (Bool false));
  ("cache_dir", Unset);
  ("codegen", Unset);
  ("codegen-lib", (List []));
  ("debug", (List []));
  ("debug_level", (List []));
  ("defensive", (String "no"));
  ("dep", Unset);
  ("detail_errors", (Bool false));
  ("detail_hint_replay", (Bool false));
  ("doc", (Bool false));
  ("dump_module", (List []));
  ("eager_inference", (Bool false));
  ("expose_interfaces", (Bool false));
  ("extract", Unset);
  ("extract_all", (Bool false));
  ("extract_module", (List []));
  ("extract_namespace", (List []));
  ("fs_typ_app", (Bool false));
  ("fstar_home", Unset);
  ("full_context_dependency", (Bool true));
  ("hide_uvar_nums", (Bool false));
  ("hint_info", (Bool false));
  ("hint_file", Unset);
  ("in", (Bool false));
  ("ide", (Bool false));
  ("include", (List []));
  ("indent", (Bool false));
  ("initial_fuel", (Int (Prims.parse_int "2")));
  ("initial_ifuel", (Int (Prims.parse_int "1")));
  ("lax", (Bool false));
  ("load", (List []));
  ("log_queries", (Bool false));
  ("log_types", (Bool false));
  ("max_fuel", (Int (Prims.parse_int "8")));
  ("max_ifuel", (Int (Prims.parse_int "2")));
  ("min_fuel", (Int (Prims.parse_int "1")));
  ("MLish", (Bool false));
  ("n_cores", (Int (Prims.parse_int "1")));
  ("no_default_includes", (Bool false));
  ("no_extract", (List []));
  ("no_location_info", (Bool false));
  ("no_smt", (Bool false));
  ("no_tactics", (Bool false));
  ("normalize_pure_terms_for_extraction", (Bool false));
  ("odir", Unset);
  ("prims", Unset);
  ("pretype", (Bool true));
  ("prims_ref", Unset);
  ("print_bound_var_types", (Bool false));
  ("print_effect_args", (Bool false));
  ("print_full_names", (Bool false));
  ("print_implicits", (Bool false));
  ("print_universes", (Bool false));
  ("print_z3_statistics", (Bool false));
  ("prn", (Bool false));
  ("query_stats", (Bool false));
  ("record_hints", (Bool false));
  ("reuse_hint_for", Unset);
  ("silent", (Bool false));
  ("smt", Unset);
  ("smtencoding.elim_box", (Bool false));
  ("smtencoding.nl_arith_repr", (String "boxwrap"));
  ("smtencoding.l_arith_repr", (String "boxwrap"));
  ("tactic_raw_binders", (Bool false));
  ("tactic_trace", (Bool false));
  ("tactic_trace_d", (Int (Prims.parse_int "0")));
  ("timing", (Bool false));
  ("trace_error", (Bool false));
  ("ugly", (Bool false));
  ("unthrottle_inductives", (Bool false));
  ("unsafe_tactic_exec", (Bool false));
  ("use_native_tactics", Unset);
  ("use_eq_at_higher_order", (Bool false));
  ("use_hints", (Bool false));
  ("use_hint_hashes", (Bool false));
  ("using_facts_from", Unset);
  ("vcgen.optimize_bind_as_seq", Unset);
  ("verify_module", (List []));
  ("warn_default_effects", (Bool false));
  ("z3refresh", (Bool false));
  ("z3rlimit", (Int (Prims.parse_int "5")));
  ("z3rlimit_factor", (Int (Prims.parse_int "1")));
  ("z3seed", (Int (Prims.parse_int "0")));
  ("z3cliopt", (List []));
  ("use_two_phase_tc", (Bool false));
  ("__no_positivity", (Bool false));
  ("__ml_no_eta_expand_coertions", (Bool false));
  ("warn_error", (String ""));
  ("use_extracted_interfaces", (Bool false))]
let (init : Prims.unit -> Prims.unit) =
  fun uu____1173 ->
    let o = peek () in
    FStar_Util.smap_clear o;
    FStar_All.pipe_right defaults (FStar_List.iter set_option')
let (clear : Prims.unit -> Prims.unit) =
  fun uu____1188 ->
    let o = FStar_Util.smap_create (Prims.parse_int "50") in
    FStar_ST.op_Colon_Equals fstar_options [o];
    FStar_ST.op_Colon_Equals light_off_files [];
    init ()
let (_run : Prims.unit) = clear ()
let (get_option : Prims.string -> option_val) =
  fun s ->
    let uu____1259 =
      let uu____1262 = peek () in FStar_Util.smap_try_find uu____1262 s in
    match uu____1259 with
    | FStar_Pervasives_Native.None ->
        failwith
          (Prims.strcat "Impossible: option " (Prims.strcat s " not found"))
    | FStar_Pervasives_Native.Some s1 -> s1
let lookup_opt :
  'Auu____1269 . Prims.string -> (option_val -> 'Auu____1269) -> 'Auu____1269
  = fun s -> fun c -> c (get_option s)
let (get_admit_smt_queries : Prims.unit -> Prims.bool) =
  fun uu____1285 -> lookup_opt "admit_smt_queries" as_bool
let (get_admit_except :
  Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____1290 -> lookup_opt "admit_except" (as_option as_string)
let (get_cache_checked_modules : Prims.unit -> Prims.bool) =
  fun uu____1295 -> lookup_opt "cache_checked_modules" as_bool
let (get_cache_dir :
  Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____1300 -> lookup_opt "cache_dir" (as_option as_string)
let (get_codegen : Prims.unit -> Prims.string FStar_Pervasives_Native.option)
  = fun uu____1307 -> lookup_opt "codegen" (as_option as_string)
let (get_codegen_lib : Prims.unit -> Prims.string Prims.list) =
  fun uu____1314 -> lookup_opt "codegen-lib" (as_list as_string)
let (get_debug : Prims.unit -> Prims.string Prims.list) =
  fun uu____1321 -> lookup_opt "debug" (as_list as_string)
let (get_debug_level : Prims.unit -> Prims.string Prims.list) =
  fun uu____1328 -> lookup_opt "debug_level" (as_list as_string)
let (get_defensive : Prims.unit -> Prims.string) =
  fun uu____1333 -> lookup_opt "defensive" as_string
let (get_dep : Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____1338 -> lookup_opt "dep" (as_option as_string)
let (get_detail_errors : Prims.unit -> Prims.bool) =
  fun uu____1343 -> lookup_opt "detail_errors" as_bool
let (get_detail_hint_replay : Prims.unit -> Prims.bool) =
  fun uu____1346 -> lookup_opt "detail_hint_replay" as_bool
let (get_doc : Prims.unit -> Prims.bool) =
  fun uu____1349 -> lookup_opt "doc" as_bool
let (get_dump_module : Prims.unit -> Prims.string Prims.list) =
  fun uu____1354 -> lookup_opt "dump_module" (as_list as_string)
let (get_eager_inference : Prims.unit -> Prims.bool) =
  fun uu____1359 -> lookup_opt "eager_inference" as_bool
let (get_expose_interfaces : Prims.unit -> Prims.bool) =
  fun uu____1362 -> lookup_opt "expose_interfaces" as_bool
let (get_extract :
  Prims.unit -> Prims.string Prims.list FStar_Pervasives_Native.option) =
  fun uu____1369 -> lookup_opt "extract" (as_option (as_list as_string))
let (get_extract_module : Prims.unit -> Prims.string Prims.list) =
  fun uu____1380 -> lookup_opt "extract_module" (as_list as_string)
let (get_extract_namespace : Prims.unit -> Prims.string Prims.list) =
  fun uu____1387 -> lookup_opt "extract_namespace" (as_list as_string)
let (get_fs_typ_app : Prims.unit -> Prims.bool) =
  fun uu____1392 -> lookup_opt "fs_typ_app" as_bool
let (get_fstar_home :
  Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____1397 -> lookup_opt "fstar_home" (as_option as_string)
let (get_hide_uvar_nums : Prims.unit -> Prims.bool) =
  fun uu____1402 -> lookup_opt "hide_uvar_nums" as_bool
let (get_hint_info : Prims.unit -> Prims.bool) =
  fun uu____1405 -> lookup_opt "hint_info" as_bool
let (get_hint_file :
  Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____1410 -> lookup_opt "hint_file" (as_option as_string)
let (get_in : Prims.unit -> Prims.bool) =
  fun uu____1415 -> lookup_opt "in" as_bool
let (get_ide : Prims.unit -> Prims.bool) =
  fun uu____1418 -> lookup_opt "ide" as_bool
let (get_include : Prims.unit -> Prims.string Prims.list) =
  fun uu____1423 -> lookup_opt "include" (as_list as_string)
let (get_indent : Prims.unit -> Prims.bool) =
  fun uu____1428 -> lookup_opt "indent" as_bool
let (get_initial_fuel : Prims.unit -> Prims.int) =
  fun uu____1431 -> lookup_opt "initial_fuel" as_int
let (get_initial_ifuel : Prims.unit -> Prims.int) =
  fun uu____1434 -> lookup_opt "initial_ifuel" as_int
let (get_lax : Prims.unit -> Prims.bool) =
  fun uu____1437 -> lookup_opt "lax" as_bool
let (get_load : Prims.unit -> Prims.string Prims.list) =
  fun uu____1442 -> lookup_opt "load" (as_list as_string)
let (get_log_queries : Prims.unit -> Prims.bool) =
  fun uu____1447 -> lookup_opt "log_queries" as_bool
let (get_log_types : Prims.unit -> Prims.bool) =
  fun uu____1450 -> lookup_opt "log_types" as_bool
let (get_max_fuel : Prims.unit -> Prims.int) =
  fun uu____1453 -> lookup_opt "max_fuel" as_int
let (get_max_ifuel : Prims.unit -> Prims.int) =
  fun uu____1456 -> lookup_opt "max_ifuel" as_int
let (get_min_fuel : Prims.unit -> Prims.int) =
  fun uu____1459 -> lookup_opt "min_fuel" as_int
let (get_MLish : Prims.unit -> Prims.bool) =
  fun uu____1462 -> lookup_opt "MLish" as_bool
let (get_n_cores : Prims.unit -> Prims.int) =
  fun uu____1465 -> lookup_opt "n_cores" as_int
let (get_no_default_includes : Prims.unit -> Prims.bool) =
  fun uu____1468 -> lookup_opt "no_default_includes" as_bool
let (get_no_extract : Prims.unit -> Prims.string Prims.list) =
  fun uu____1473 -> lookup_opt "no_extract" (as_list as_string)
let (get_no_location_info : Prims.unit -> Prims.bool) =
  fun uu____1478 -> lookup_opt "no_location_info" as_bool
let (get_no_smt : Prims.unit -> Prims.bool) =
  fun uu____1481 -> lookup_opt "no_smt" as_bool
let (get_normalize_pure_terms_for_extraction : Prims.unit -> Prims.bool) =
  fun uu____1484 -> lookup_opt "normalize_pure_terms_for_extraction" as_bool
let (get_odir : Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____1489 -> lookup_opt "odir" (as_option as_string)
let (get_ugly : Prims.unit -> Prims.bool) =
  fun uu____1494 -> lookup_opt "ugly" as_bool
let (get_prims : Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____1499 -> lookup_opt "prims" (as_option as_string)
let (get_print_bound_var_types : Prims.unit -> Prims.bool) =
  fun uu____1504 -> lookup_opt "print_bound_var_types" as_bool
let (get_print_effect_args : Prims.unit -> Prims.bool) =
  fun uu____1507 -> lookup_opt "print_effect_args" as_bool
let (get_print_full_names : Prims.unit -> Prims.bool) =
  fun uu____1510 -> lookup_opt "print_full_names" as_bool
let (get_print_implicits : Prims.unit -> Prims.bool) =
  fun uu____1513 -> lookup_opt "print_implicits" as_bool
let (get_print_universes : Prims.unit -> Prims.bool) =
  fun uu____1516 -> lookup_opt "print_universes" as_bool
let (get_print_z3_statistics : Prims.unit -> Prims.bool) =
  fun uu____1519 -> lookup_opt "print_z3_statistics" as_bool
let (get_prn : Prims.unit -> Prims.bool) =
  fun uu____1522 -> lookup_opt "prn" as_bool
let (get_query_stats : Prims.unit -> Prims.bool) =
  fun uu____1525 -> lookup_opt "query_stats" as_bool
let (get_record_hints : Prims.unit -> Prims.bool) =
  fun uu____1528 -> lookup_opt "record_hints" as_bool
let (get_reuse_hint_for :
  Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____1533 -> lookup_opt "reuse_hint_for" (as_option as_string)
let (get_silent : Prims.unit -> Prims.bool) =
  fun uu____1538 -> lookup_opt "silent" as_bool
let (get_smt : Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____1543 -> lookup_opt "smt" (as_option as_string)
let (get_smtencoding_elim_box : Prims.unit -> Prims.bool) =
  fun uu____1548 -> lookup_opt "smtencoding.elim_box" as_bool
let (get_smtencoding_nl_arith_repr : Prims.unit -> Prims.string) =
  fun uu____1551 -> lookup_opt "smtencoding.nl_arith_repr" as_string
let (get_smtencoding_l_arith_repr : Prims.unit -> Prims.string) =
  fun uu____1554 -> lookup_opt "smtencoding.l_arith_repr" as_string
let (get_tactic_raw_binders : Prims.unit -> Prims.bool) =
  fun uu____1557 -> lookup_opt "tactic_raw_binders" as_bool
let (get_tactic_trace : Prims.unit -> Prims.bool) =
  fun uu____1560 -> lookup_opt "tactic_trace" as_bool
let (get_tactic_trace_d : Prims.unit -> Prims.int) =
  fun uu____1563 -> lookup_opt "tactic_trace_d" as_int
let (get_timing : Prims.unit -> Prims.bool) =
  fun uu____1566 -> lookup_opt "timing" as_bool
let (get_trace_error : Prims.unit -> Prims.bool) =
  fun uu____1569 -> lookup_opt "trace_error" as_bool
let (get_unthrottle_inductives : Prims.unit -> Prims.bool) =
  fun uu____1572 -> lookup_opt "unthrottle_inductives" as_bool
let (get_unsafe_tactic_exec : Prims.unit -> Prims.bool) =
  fun uu____1575 -> lookup_opt "unsafe_tactic_exec" as_bool
let (get_use_eq_at_higher_order : Prims.unit -> Prims.bool) =
  fun uu____1578 -> lookup_opt "use_eq_at_higher_order" as_bool
let (get_use_hints : Prims.unit -> Prims.bool) =
  fun uu____1581 -> lookup_opt "use_hints" as_bool
let (get_use_hint_hashes : Prims.unit -> Prims.bool) =
  fun uu____1584 -> lookup_opt "use_hint_hashes" as_bool
let (get_use_native_tactics :
  Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____1589 -> lookup_opt "use_native_tactics" (as_option as_string)
let (get_use_tactics : Prims.unit -> Prims.bool) =
  fun uu____1594 ->
    let uu____1595 = lookup_opt "no_tactics" as_bool in
    Prims.op_Negation uu____1595
let (get_using_facts_from :
  Prims.unit -> Prims.string Prims.list FStar_Pervasives_Native.option) =
  fun uu____1602 ->
    lookup_opt "using_facts_from" (as_option (as_list as_string))
let (get_vcgen_optimize_bind_as_seq :
  Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____1613 ->
    lookup_opt "vcgen.optimize_bind_as_seq" (as_option as_string)
let (get_verify_module : Prims.unit -> Prims.string Prims.list) =
  fun uu____1620 -> lookup_opt "verify_module" (as_list as_string)
let (get___temp_no_proj : Prims.unit -> Prims.string Prims.list) =
  fun uu____1627 -> lookup_opt "__temp_no_proj" (as_list as_string)
let (get_version : Prims.unit -> Prims.bool) =
  fun uu____1632 -> lookup_opt "version" as_bool
let (get_warn_default_effects : Prims.unit -> Prims.bool) =
  fun uu____1635 -> lookup_opt "warn_default_effects" as_bool
let (get_z3cliopt : Prims.unit -> Prims.string Prims.list) =
  fun uu____1640 -> lookup_opt "z3cliopt" (as_list as_string)
let (get_z3refresh : Prims.unit -> Prims.bool) =
  fun uu____1645 -> lookup_opt "z3refresh" as_bool
let (get_z3rlimit : Prims.unit -> Prims.int) =
  fun uu____1648 -> lookup_opt "z3rlimit" as_int
let (get_z3rlimit_factor : Prims.unit -> Prims.int) =
  fun uu____1651 -> lookup_opt "z3rlimit_factor" as_int
let (get_z3seed : Prims.unit -> Prims.int) =
  fun uu____1654 -> lookup_opt "z3seed" as_int
let (get_use_two_phase_tc : Prims.unit -> Prims.bool) =
  fun uu____1657 -> lookup_opt "use_two_phase_tc" as_bool
let (get_no_positivity : Prims.unit -> Prims.bool) =
  fun uu____1660 -> lookup_opt "__no_positivity" as_bool
let (get_ml_no_eta_expand_coertions : Prims.unit -> Prims.bool) =
  fun uu____1663 -> lookup_opt "__ml_no_eta_expand_coertions" as_bool
let (get_warn_error : Prims.unit -> Prims.string) =
  fun uu____1666 -> lookup_opt "warn_error" as_string
let (get_use_extracted_interfaces : Prims.unit -> Prims.bool) =
  fun uu____1669 -> lookup_opt "use_extracted_interfaces" as_bool
let (dlevel : Prims.string -> debug_level_t) =
  fun uu___44_1672 ->
    match uu___44_1672 with
    | "Low" -> Low
    | "Medium" -> Medium
    | "High" -> High
    | "Extreme" -> Extreme
    | s -> Other s
let (one_debug_level_geq : debug_level_t -> debug_level_t -> Prims.bool) =
  fun l1 ->
    fun l2 ->
      match l1 with
      | Other uu____1680 -> l1 = l2
      | Low -> l1 = l2
      | Medium -> (l2 = Low) || (l2 = Medium)
      | High -> ((l2 = Low) || (l2 = Medium)) || (l2 = High)
      | Extreme ->
          (((l2 = Low) || (l2 = Medium)) || (l2 = High)) || (l2 = Extreme)
let (debug_level_geq : debug_level_t -> Prims.bool) =
  fun l2 ->
    let uu____1684 = get_debug_level () in
    FStar_All.pipe_right uu____1684
      (FStar_Util.for_some (fun l1 -> one_debug_level_geq (dlevel l1) l2))
let (universe_include_path_base_dirs : Prims.string Prims.list) =
  ["/ulib"; "/lib/fstar"]
let (_version : Prims.string FStar_ST.ref) = FStar_Util.mk_ref ""
let (_platform : Prims.string FStar_ST.ref) = FStar_Util.mk_ref ""
let (_compiler : Prims.string FStar_ST.ref) = FStar_Util.mk_ref ""
let (_date : Prims.string FStar_ST.ref) = FStar_Util.mk_ref ""
let (_commit : Prims.string FStar_ST.ref) = FStar_Util.mk_ref ""
let (display_version : Prims.unit -> Prims.unit) =
  fun uu____2055 ->
    let uu____2056 =
      let uu____2057 = FStar_ST.op_Bang _version in
      let uu____2083 = FStar_ST.op_Bang _platform in
      let uu____2109 = FStar_ST.op_Bang _compiler in
      let uu____2135 = FStar_ST.op_Bang _date in
      let uu____2161 = FStar_ST.op_Bang _commit in
      FStar_Util.format5
        "F* %s\nplatform=%s\ncompiler=%s\ndate=%s\ncommit=%s\n" uu____2057
        uu____2083 uu____2109 uu____2135 uu____2161 in
    FStar_Util.print_string uu____2056
let display_usage_aux :
  'Auu____2190 'Auu____2191 .
    ('Auu____2190, Prims.string, 'Auu____2191 FStar_Getopt.opt_variant,
      Prims.string) FStar_Pervasives_Native.tuple4 Prims.list -> Prims.unit
  =
  fun specs ->
    FStar_Util.print_string "fstar.exe [options] file[s]\n";
    FStar_List.iter
      (fun uu____2238 ->
         match uu____2238 with
         | (uu____2249, flag, p, doc) ->
             (match p with
              | FStar_Getopt.ZeroArgs ig ->
                  if doc = ""
                  then
                    let uu____2260 =
                      let uu____2261 = FStar_Util.colorize_bold flag in
                      FStar_Util.format1 "  --%s\n" uu____2261 in
                    FStar_Util.print_string uu____2260
                  else
                    (let uu____2263 =
                       let uu____2264 = FStar_Util.colorize_bold flag in
                       FStar_Util.format2 "  --%s  %s\n" uu____2264 doc in
                     FStar_Util.print_string uu____2263)
              | FStar_Getopt.OneArg (uu____2265, argname) ->
                  if doc = ""
                  then
                    let uu____2271 =
                      let uu____2272 = FStar_Util.colorize_bold flag in
                      let uu____2273 = FStar_Util.colorize_bold argname in
                      FStar_Util.format2 "  --%s %s\n" uu____2272 uu____2273 in
                    FStar_Util.print_string uu____2271
                  else
                    (let uu____2275 =
                       let uu____2276 = FStar_Util.colorize_bold flag in
                       let uu____2277 = FStar_Util.colorize_bold argname in
                       FStar_Util.format3 "  --%s %s  %s\n" uu____2276
                         uu____2277 doc in
                     FStar_Util.print_string uu____2275))) specs
let (mk_spec :
  (FStar_BaseTypes.char, Prims.string, option_val FStar_Getopt.opt_variant,
    Prims.string) FStar_Pervasives_Native.tuple4 -> FStar_Getopt.opt)
  =
  fun o ->
    let uu____2301 = o in
    match uu____2301 with
    | (ns, name, arg, desc) ->
        let arg1 =
          match arg with
          | FStar_Getopt.ZeroArgs f ->
              let g uu____2331 =
                let uu____2332 = f () in set_option name uu____2332 in
              FStar_Getopt.ZeroArgs g
          | FStar_Getopt.OneArg (f, d) ->
              let g x = let uu____2343 = f x in set_option name uu____2343 in
              FStar_Getopt.OneArg (g, d) in
        (ns, name, arg1, desc)
let (accumulated_option : Prims.string -> option_val -> option_val) =
  fun name ->
    fun value ->
      let prev_values =
        let uu____2357 = lookup_opt name (as_option as_list') in
        FStar_Util.dflt [] uu____2357 in
      mk_list (value :: prev_values)
let (reverse_accumulated_option : Prims.string -> option_val -> option_val) =
  fun name ->
    fun value ->
      let uu____2376 =
        let uu____2379 = lookup_opt name as_list' in
        FStar_List.append uu____2379 [value] in
      mk_list uu____2376
let accumulate_string :
  'Auu____2388 .
    Prims.string ->
      ('Auu____2388 -> Prims.string) -> 'Auu____2388 -> Prims.unit
  =
  fun name ->
    fun post_processor ->
      fun value ->
        let uu____2406 =
          let uu____2407 =
            let uu____2408 = post_processor value in mk_string uu____2408 in
          accumulated_option name uu____2407 in
        set_option name uu____2406
let (add_extract_module : Prims.string -> Prims.unit) =
  fun s -> accumulate_string "extract_module" FStar_String.lowercase s
let (add_extract_namespace : Prims.string -> Prims.unit) =
  fun s -> accumulate_string "extract_namespace" FStar_String.lowercase s
let (add_verify_module : Prims.string -> Prims.unit) =
  fun s -> accumulate_string "verify_module" FStar_String.lowercase s
type opt_type =
  | Const of option_val 
  | IntStr of Prims.string 
  | BoolStr 
  | PathStr of Prims.string 
  | SimpleStr of Prims.string 
  | EnumStr of Prims.string Prims.list 
  | OpenEnumStr of (Prims.string Prims.list, Prims.string)
  FStar_Pervasives_Native.tuple2 
  | PostProcessed of (option_val -> option_val, opt_type)
  FStar_Pervasives_Native.tuple2 
  | Accumulated of opt_type 
  | ReverseAccumulated of opt_type 
  | WithSideEffect of (Prims.unit -> Prims.unit, opt_type)
  FStar_Pervasives_Native.tuple2 [@@deriving show]
let (uu___is_Const : opt_type -> Prims.bool) =
  fun projectee ->
    match projectee with | Const _0 -> true | uu____2486 -> false
let (__proj__Const__item___0 : opt_type -> option_val) =
  fun projectee -> match projectee with | Const _0 -> _0
let (uu___is_IntStr : opt_type -> Prims.bool) =
  fun projectee ->
    match projectee with | IntStr _0 -> true | uu____2498 -> false
let (__proj__IntStr__item___0 : opt_type -> Prims.string) =
  fun projectee -> match projectee with | IntStr _0 -> _0
let (uu___is_BoolStr : opt_type -> Prims.bool) =
  fun projectee ->
    match projectee with | BoolStr -> true | uu____2509 -> false
let (uu___is_PathStr : opt_type -> Prims.bool) =
  fun projectee ->
    match projectee with | PathStr _0 -> true | uu____2514 -> false
let (__proj__PathStr__item___0 : opt_type -> Prims.string) =
  fun projectee -> match projectee with | PathStr _0 -> _0
let (uu___is_SimpleStr : opt_type -> Prims.bool) =
  fun projectee ->
    match projectee with | SimpleStr _0 -> true | uu____2526 -> false
let (__proj__SimpleStr__item___0 : opt_type -> Prims.string) =
  fun projectee -> match projectee with | SimpleStr _0 -> _0
let (uu___is_EnumStr : opt_type -> Prims.bool) =
  fun projectee ->
    match projectee with | EnumStr _0 -> true | uu____2540 -> false
let (__proj__EnumStr__item___0 : opt_type -> Prims.string Prims.list) =
  fun projectee -> match projectee with | EnumStr _0 -> _0
let (uu___is_OpenEnumStr : opt_type -> Prims.bool) =
  fun projectee ->
    match projectee with | OpenEnumStr _0 -> true | uu____2564 -> false
let (__proj__OpenEnumStr__item___0 :
  opt_type ->
    (Prims.string Prims.list, Prims.string) FStar_Pervasives_Native.tuple2)
  = fun projectee -> match projectee with | OpenEnumStr _0 -> _0
let (uu___is_PostProcessed : opt_type -> Prims.bool) =
  fun projectee ->
    match projectee with | PostProcessed _0 -> true | uu____2600 -> false
let (__proj__PostProcessed__item___0 :
  opt_type ->
    (option_val -> option_val, opt_type) FStar_Pervasives_Native.tuple2)
  = fun projectee -> match projectee with | PostProcessed _0 -> _0
let (uu___is_Accumulated : opt_type -> Prims.bool) =
  fun projectee ->
    match projectee with | Accumulated _0 -> true | uu____2630 -> false
let (__proj__Accumulated__item___0 : opt_type -> opt_type) =
  fun projectee -> match projectee with | Accumulated _0 -> _0
let (uu___is_ReverseAccumulated : opt_type -> Prims.bool) =
  fun projectee ->
    match projectee with
    | ReverseAccumulated _0 -> true
    | uu____2642 -> false
let (__proj__ReverseAccumulated__item___0 : opt_type -> opt_type) =
  fun projectee -> match projectee with | ReverseAccumulated _0 -> _0
let (uu___is_WithSideEffect : opt_type -> Prims.bool) =
  fun projectee ->
    match projectee with | WithSideEffect _0 -> true | uu____2660 -> false
let (__proj__WithSideEffect__item___0 :
  opt_type ->
    (Prims.unit -> Prims.unit, opt_type) FStar_Pervasives_Native.tuple2)
  = fun projectee -> match projectee with | WithSideEffect _0 -> _0
exception InvalidArgument of Prims.string 
let (uu___is_InvalidArgument : Prims.exn -> Prims.bool) =
  fun projectee ->
    match projectee with
    | InvalidArgument uu____2692 -> true
    | uu____2693 -> false
let (__proj__InvalidArgument__item__uu___ : Prims.exn -> Prims.string) =
  fun projectee ->
    match projectee with | InvalidArgument uu____2700 -> uu____2700
let rec (parse_opt_val :
  Prims.string -> opt_type -> Prims.string -> option_val) =
  fun opt_name ->
    fun typ ->
      fun str_val ->
        try
          match typ with
          | Const c -> c
          | IntStr uu____2714 ->
              let uu____2715 = FStar_Util.safe_int_of_string str_val in
              (match uu____2715 with
               | FStar_Pervasives_Native.Some v1 -> mk_int v1
               | FStar_Pervasives_Native.None ->
                   FStar_Exn.raise (InvalidArgument opt_name))
          | BoolStr ->
              let uu____2719 =
                if str_val = "true"
                then true
                else
                  if str_val = "false"
                  then false
                  else FStar_Exn.raise (InvalidArgument opt_name) in
              mk_bool uu____2719
          | PathStr uu____2722 -> mk_path str_val
          | SimpleStr uu____2723 -> mk_string str_val
          | EnumStr strs ->
              if FStar_List.mem str_val strs
              then mk_string str_val
              else FStar_Exn.raise (InvalidArgument opt_name)
          | OpenEnumStr uu____2728 -> mk_string str_val
          | PostProcessed (pp, elem_spec) ->
              let uu____2741 = parse_opt_val opt_name elem_spec str_val in
              pp uu____2741
          | Accumulated elem_spec ->
              let v1 = parse_opt_val opt_name elem_spec str_val in
              accumulated_option opt_name v1
          | ReverseAccumulated elem_spec ->
              let v1 = parse_opt_val opt_name elem_spec str_val in
              reverse_accumulated_option opt_name v1
          | WithSideEffect (side_effect, elem_spec) ->
              (side_effect (); parse_opt_val opt_name elem_spec str_val)
        with
        | InvalidArgument opt_name1 ->
            let uu____2758 =
              FStar_Util.format1 "Invalid argument to --%s" opt_name1 in
            failwith uu____2758
let rec (desc_of_opt_type :
  opt_type -> Prims.string FStar_Pervasives_Native.option) =
  fun typ ->
    let desc_of_enum cases =
      FStar_Pervasives_Native.Some
        (Prims.strcat "[" (Prims.strcat (FStar_String.concat "|" cases) "]")) in
    match typ with
    | Const c -> FStar_Pervasives_Native.None
    | IntStr desc -> FStar_Pervasives_Native.Some desc
    | BoolStr -> desc_of_enum ["true"; "false"]
    | PathStr desc -> FStar_Pervasives_Native.Some desc
    | SimpleStr desc -> FStar_Pervasives_Native.Some desc
    | EnumStr strs -> desc_of_enum strs
    | OpenEnumStr (strs, desc) ->
        desc_of_enum (FStar_List.append strs [desc])
    | PostProcessed (uu____2791, elem_spec) -> desc_of_opt_type elem_spec
    | Accumulated elem_spec -> desc_of_opt_type elem_spec
    | ReverseAccumulated elem_spec -> desc_of_opt_type elem_spec
    | WithSideEffect (uu____2799, elem_spec) -> desc_of_opt_type elem_spec
let rec (arg_spec_of_opt_type :
  Prims.string -> opt_type -> option_val FStar_Getopt.opt_variant) =
  fun opt_name ->
    fun typ ->
      let parser = parse_opt_val opt_name typ in
      let uu____2818 = desc_of_opt_type typ in
      match uu____2818 with
      | FStar_Pervasives_Native.None ->
          FStar_Getopt.ZeroArgs ((fun uu____2824 -> parser ""))
      | FStar_Pervasives_Native.Some desc ->
          FStar_Getopt.OneArg (parser, desc)
let (pp_validate_dir : option_val -> option_val) =
  fun p -> let pp = as_string p in FStar_Util.mkdir false pp; p
let (pp_lowercase : option_val -> option_val) =
  fun s ->
    let uu____2836 =
      let uu____2837 = as_string s in FStar_String.lowercase uu____2837 in
    mk_string uu____2836
let rec (specs_with_types :
  Prims.unit ->
    (FStar_BaseTypes.char, Prims.string, opt_type, Prims.string)
      FStar_Pervasives_Native.tuple4 Prims.list)
  =
  fun uu____2854 ->
    let uu____2865 =
      let uu____2876 =
        let uu____2887 =
          let uu____2896 = let uu____2897 = mk_bool true in Const uu____2897 in
          (FStar_Getopt.noshort, "cache_checked_modules", uu____2896,
            "Write a '.checked' file for each module after verification and read from it if present, instead of re-verifying") in
        let uu____2898 =
          let uu____2909 =
            let uu____2920 =
              let uu____2931 =
                let uu____2942 =
                  let uu____2953 =
                    let uu____2964 =
                      let uu____2975 =
                        let uu____2986 =
                          let uu____2995 =
                            let uu____2996 = mk_bool true in Const uu____2996 in
                          (FStar_Getopt.noshort, "detail_errors", uu____2995,
                            "Emit a detailed error report by asking the SMT solver many queries; will take longer;\n         implies n_cores=1") in
                        let uu____2997 =
                          let uu____3008 =
                            let uu____3017 =
                              let uu____3018 = mk_bool true in
                              Const uu____3018 in
                            (FStar_Getopt.noshort, "detail_hint_replay",
                              uu____3017,
                              "Emit a detailed report for proof whose unsat core fails to replay;\n         implies n_cores=1") in
                          let uu____3019 =
                            let uu____3030 =
                              let uu____3039 =
                                let uu____3040 = mk_bool true in
                                Const uu____3040 in
                              (FStar_Getopt.noshort, "doc", uu____3039,
                                "Extract Markdown documentation files for the input modules, as well as an index. Output is written to --odir directory.") in
                            let uu____3041 =
                              let uu____3052 =
                                let uu____3063 =
                                  let uu____3072 =
                                    let uu____3073 = mk_bool true in
                                    Const uu____3073 in
                                  (FStar_Getopt.noshort, "eager_inference",
                                    uu____3072,
                                    "Solve all type-inference constraints eagerly; more efficient but at the cost of generality") in
                                let uu____3074 =
                                  let uu____3085 =
                                    let uu____3096 =
                                      let uu____3107 =
                                        let uu____3118 =
                                          let uu____3127 =
                                            let uu____3128 = mk_bool true in
                                            Const uu____3128 in
                                          (FStar_Getopt.noshort,
                                            "expose_interfaces", uu____3127,
                                            "Explicitly break the abstraction imposed by the interface of any implementation file that appears on the command line (use with care!)") in
                                        let uu____3129 =
                                          let uu____3140 =
                                            let uu____3151 =
                                              let uu____3160 =
                                                let uu____3161 = mk_bool true in
                                                Const uu____3161 in
                                              (FStar_Getopt.noshort,
                                                "hide_uvar_nums", uu____3160,
                                                "Don't print unification variable numbers") in
                                            let uu____3162 =
                                              let uu____3173 =
                                                let uu____3184 =
                                                  let uu____3193 =
                                                    let uu____3194 =
                                                      mk_bool true in
                                                    Const uu____3194 in
                                                  (FStar_Getopt.noshort,
                                                    "hint_info", uu____3193,
                                                    "Print information regarding hints (deprecated; use --query_stats instead)") in
                                                let uu____3195 =
                                                  let uu____3206 =
                                                    let uu____3215 =
                                                      let uu____3216 =
                                                        mk_bool true in
                                                      Const uu____3216 in
                                                    (FStar_Getopt.noshort,
                                                      "in", uu____3215,
                                                      "Legacy interactive mode; reads input from stdin") in
                                                  let uu____3217 =
                                                    let uu____3228 =
                                                      let uu____3237 =
                                                        let uu____3238 =
                                                          mk_bool true in
                                                        Const uu____3238 in
                                                      (FStar_Getopt.noshort,
                                                        "ide", uu____3237,
                                                        "JSON-based interactive mode for IDEs") in
                                                    let uu____3239 =
                                                      let uu____3250 =
                                                        let uu____3261 =
                                                          let uu____3270 =
                                                            let uu____3271 =
                                                              mk_bool true in
                                                            Const uu____3271 in
                                                          (FStar_Getopt.noshort,
                                                            "indent",
                                                            uu____3270,
                                                            "Parses and outputs the files on the command line") in
                                                        let uu____3272 =
                                                          let uu____3283 =
                                                            let uu____3294 =
                                                              let uu____3305
                                                                =
                                                                let uu____3314
                                                                  =
                                                                  let uu____3315
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                  Const
                                                                    uu____3315 in
                                                                (FStar_Getopt.noshort,
                                                                  "lax",
                                                                  uu____3314,
                                                                  "Run the lax-type checker only (admit all verification conditions)") in
                                                              let uu____3316
                                                                =
                                                                let uu____3327
                                                                  =
                                                                  let uu____3338
                                                                    =
                                                                    let uu____3347
                                                                    =
                                                                    let uu____3348
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3348 in
                                                                    (FStar_Getopt.noshort,
                                                                    "log_types",
                                                                    uu____3347,
                                                                    "Print types computed for data/val/let-bindings") in
                                                                  let uu____3349
                                                                    =
                                                                    let uu____3360
                                                                    =
                                                                    let uu____3369
                                                                    =
                                                                    let uu____3370
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3370 in
                                                                    (FStar_Getopt.noshort,
                                                                    "log_queries",
                                                                    uu____3369,
                                                                    "Log the Z3 queries in several queries-*.smt2 files, as we go") in
                                                                    let uu____3371
                                                                    =
                                                                    let uu____3382
                                                                    =
                                                                    let uu____3393
                                                                    =
                                                                    let uu____3404
                                                                    =
                                                                    let uu____3415
                                                                    =
                                                                    let uu____3424
                                                                    =
                                                                    let uu____3425
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3425 in
                                                                    (FStar_Getopt.noshort,
                                                                    "MLish",
                                                                    uu____3424,
                                                                    "Trigger various specializations for compiling the F* compiler itself (not meant for user code)") in
                                                                    let uu____3426
                                                                    =
                                                                    let uu____3437
                                                                    =
                                                                    let uu____3448
                                                                    =
                                                                    let uu____3457
                                                                    =
                                                                    let uu____3458
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3458 in
                                                                    (FStar_Getopt.noshort,
                                                                    "no_default_includes",
                                                                    uu____3457,
                                                                    "Ignore the default module search paths") in
                                                                    let uu____3459
                                                                    =
                                                                    let uu____3470
                                                                    =
                                                                    let uu____3481
                                                                    =
                                                                    let uu____3490
                                                                    =
                                                                    let uu____3491
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3491 in
                                                                    (FStar_Getopt.noshort,
                                                                    "no_location_info",
                                                                    uu____3490,
                                                                    "Suppress location information in the generated OCaml output (only relevant with --codegen OCaml)") in
                                                                    let uu____3492
                                                                    =
                                                                    let uu____3503
                                                                    =
                                                                    let uu____3512
                                                                    =
                                                                    let uu____3513
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3513 in
                                                                    (FStar_Getopt.noshort,
                                                                    "no_smt",
                                                                    uu____3512,
                                                                    "Do not send any queries to the SMT solver, and fail on them instead") in
                                                                    let uu____3514
                                                                    =
                                                                    let uu____3525
                                                                    =
                                                                    let uu____3534
                                                                    =
                                                                    let uu____3535
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3535 in
                                                                    (FStar_Getopt.noshort,
                                                                    "normalize_pure_terms_for_extraction",
                                                                    uu____3534,
                                                                    "Extract top-level pure terms after normalizing them. This can lead to very large code, but can result in more partial evaluation and compile-time specialization.") in
                                                                    let uu____3536
                                                                    =
                                                                    let uu____3547
                                                                    =
                                                                    let uu____3558
                                                                    =
                                                                    let uu____3569
                                                                    =
                                                                    let uu____3578
                                                                    =
                                                                    let uu____3579
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3579 in
                                                                    (FStar_Getopt.noshort,
                                                                    "print_bound_var_types",
                                                                    uu____3578,
                                                                    "Print the types of bound variables") in
                                                                    let uu____3580
                                                                    =
                                                                    let uu____3591
                                                                    =
                                                                    let uu____3600
                                                                    =
                                                                    let uu____3601
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3601 in
                                                                    (FStar_Getopt.noshort,
                                                                    "print_effect_args",
                                                                    uu____3600,
                                                                    "Print inferred predicate transformers for all computation types") in
                                                                    let uu____3602
                                                                    =
                                                                    let uu____3613
                                                                    =
                                                                    let uu____3622
                                                                    =
                                                                    let uu____3623
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3623 in
                                                                    (FStar_Getopt.noshort,
                                                                    "print_full_names",
                                                                    uu____3622,
                                                                    "Print full names of variables") in
                                                                    let uu____3624
                                                                    =
                                                                    let uu____3635
                                                                    =
                                                                    let uu____3644
                                                                    =
                                                                    let uu____3645
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3645 in
                                                                    (FStar_Getopt.noshort,
                                                                    "print_implicits",
                                                                    uu____3644,
                                                                    "Print implicit arguments") in
                                                                    let uu____3646
                                                                    =
                                                                    let uu____3657
                                                                    =
                                                                    let uu____3666
                                                                    =
                                                                    let uu____3667
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3667 in
                                                                    (FStar_Getopt.noshort,
                                                                    "print_universes",
                                                                    uu____3666,
                                                                    "Print universes") in
                                                                    let uu____3668
                                                                    =
                                                                    let uu____3679
                                                                    =
                                                                    let uu____3688
                                                                    =
                                                                    let uu____3689
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3689 in
                                                                    (FStar_Getopt.noshort,
                                                                    "print_z3_statistics",
                                                                    uu____3688,
                                                                    "Print Z3 statistics for each SMT query (deprecated; use --query_stats instead)") in
                                                                    let uu____3690
                                                                    =
                                                                    let uu____3701
                                                                    =
                                                                    let uu____3710
                                                                    =
                                                                    let uu____3711
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3711 in
                                                                    (FStar_Getopt.noshort,
                                                                    "prn",
                                                                    uu____3710,
                                                                    "Print full names (deprecated; use --print_full_names instead)") in
                                                                    let uu____3712
                                                                    =
                                                                    let uu____3723
                                                                    =
                                                                    let uu____3732
                                                                    =
                                                                    let uu____3733
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3733 in
                                                                    (FStar_Getopt.noshort,
                                                                    "query_stats",
                                                                    uu____3732,
                                                                    "Print SMT query statistics") in
                                                                    let uu____3734
                                                                    =
                                                                    let uu____3745
                                                                    =
                                                                    let uu____3754
                                                                    =
                                                                    let uu____3755
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3755 in
                                                                    (FStar_Getopt.noshort,
                                                                    "record_hints",
                                                                    uu____3754,
                                                                    "Record a database of hints for efficient proof replay") in
                                                                    let uu____3756
                                                                    =
                                                                    let uu____3767
                                                                    =
                                                                    let uu____3778
                                                                    =
                                                                    let uu____3787
                                                                    =
                                                                    let uu____3788
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3788 in
                                                                    (FStar_Getopt.noshort,
                                                                    "silent",
                                                                    uu____3787,
                                                                    " ") in
                                                                    let uu____3789
                                                                    =
                                                                    let uu____3800
                                                                    =
                                                                    let uu____3811
                                                                    =
                                                                    let uu____3822
                                                                    =
                                                                    let uu____3833
                                                                    =
                                                                    let uu____3844
                                                                    =
                                                                    let uu____3853
                                                                    =
                                                                    let uu____3854
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3854 in
                                                                    (FStar_Getopt.noshort,
                                                                    "tactic_raw_binders",
                                                                    uu____3853,
                                                                    "Do not use the lexical scope of tactics to improve binder names") in
                                                                    let uu____3855
                                                                    =
                                                                    let uu____3866
                                                                    =
                                                                    let uu____3875
                                                                    =
                                                                    let uu____3876
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3876 in
                                                                    (FStar_Getopt.noshort,
                                                                    "tactic_trace",
                                                                    uu____3875,
                                                                    "Print a depth-indexed trace of tactic execution (Warning: very verbose)") in
                                                                    let uu____3877
                                                                    =
                                                                    let uu____3888
                                                                    =
                                                                    let uu____3899
                                                                    =
                                                                    let uu____3908
                                                                    =
                                                                    let uu____3909
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3909 in
                                                                    (FStar_Getopt.noshort,
                                                                    "timing",
                                                                    uu____3908,
                                                                    "Print the time it takes to verify each top-level definition") in
                                                                    let uu____3910
                                                                    =
                                                                    let uu____3921
                                                                    =
                                                                    let uu____3930
                                                                    =
                                                                    let uu____3931
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3931 in
                                                                    (FStar_Getopt.noshort,
                                                                    "trace_error",
                                                                    uu____3930,
                                                                    "Don't print an error message; show an exception trace instead") in
                                                                    let uu____3932
                                                                    =
                                                                    let uu____3943
                                                                    =
                                                                    let uu____3952
                                                                    =
                                                                    let uu____3953
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3953 in
                                                                    (FStar_Getopt.noshort,
                                                                    "ugly",
                                                                    uu____3952,
                                                                    "Emit output formatted for debugging") in
                                                                    let uu____3954
                                                                    =
                                                                    let uu____3965
                                                                    =
                                                                    let uu____3974
                                                                    =
                                                                    let uu____3975
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3975 in
                                                                    (FStar_Getopt.noshort,
                                                                    "unthrottle_inductives",
                                                                    uu____3974,
                                                                    "Let the SMT solver unfold inductive types to arbitrary depths (may affect verifier performance)") in
                                                                    let uu____3976
                                                                    =
                                                                    let uu____3987
                                                                    =
                                                                    let uu____3996
                                                                    =
                                                                    let uu____3997
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3997 in
                                                                    (FStar_Getopt.noshort,
                                                                    "unsafe_tactic_exec",
                                                                    uu____3996,
                                                                    "Allow tactics to run external processes. WARNING: checking an untrusted F* file while using this option can have disastrous effects.") in
                                                                    let uu____3998
                                                                    =
                                                                    let uu____4009
                                                                    =
                                                                    let uu____4018
                                                                    =
                                                                    let uu____4019
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4019 in
                                                                    (FStar_Getopt.noshort,
                                                                    "use_eq_at_higher_order",
                                                                    uu____4018,
                                                                    "Use equality constraints when comparing higher-order types (Temporary)") in
                                                                    let uu____4020
                                                                    =
                                                                    let uu____4031
                                                                    =
                                                                    let uu____4040
                                                                    =
                                                                    let uu____4041
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4041 in
                                                                    (FStar_Getopt.noshort,
                                                                    "use_hints",
                                                                    uu____4040,
                                                                    "Use a previously recorded hints database for proof replay") in
                                                                    let uu____4042
                                                                    =
                                                                    let uu____4053
                                                                    =
                                                                    let uu____4062
                                                                    =
                                                                    let uu____4063
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4063 in
                                                                    (FStar_Getopt.noshort,
                                                                    "use_hint_hashes",
                                                                    uu____4062,
                                                                    "Admit queries if their hash matches the hash recorded in the hints database") in
                                                                    let uu____4064
                                                                    =
                                                                    let uu____4075
                                                                    =
                                                                    let uu____4086
                                                                    =
                                                                    let uu____4095
                                                                    =
                                                                    let uu____4096
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4096 in
                                                                    (FStar_Getopt.noshort,
                                                                    "no_tactics",
                                                                    uu____4095,
                                                                    "Do not run the tactic engine before discharging a VC") in
                                                                    let uu____4097
                                                                    =
                                                                    let uu____4108
                                                                    =
                                                                    let uu____4119
                                                                    =
                                                                    let uu____4130
                                                                    =
                                                                    let uu____4141
                                                                    =
                                                                    let uu____4150
                                                                    =
                                                                    let uu____4151
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4151 in
                                                                    (FStar_Getopt.noshort,
                                                                    "__temp_fast_implicits",
                                                                    uu____4150,
                                                                    "Don't use this option yet") in
                                                                    let uu____4152
                                                                    =
                                                                    let uu____4163
                                                                    =
                                                                    let uu____4173
                                                                    =
                                                                    let uu____4174
                                                                    =
                                                                    let uu____4181
                                                                    =
                                                                    let uu____4182
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4182 in
                                                                    ((fun
                                                                    uu____4187
                                                                    ->
                                                                    display_version
                                                                    ();
                                                                    FStar_All.exit
                                                                    (Prims.parse_int "0")),
                                                                    uu____4181) in
                                                                    WithSideEffect
                                                                    uu____4174 in
                                                                    (118,
                                                                    "version",
                                                                    uu____4173,
                                                                    "Display version number") in
                                                                    let uu____4191
                                                                    =
                                                                    let uu____4203
                                                                    =
                                                                    let uu____4212
                                                                    =
                                                                    let uu____4213
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4213 in
                                                                    (FStar_Getopt.noshort,
                                                                    "warn_default_effects",
                                                                    uu____4212,
                                                                    "Warn when (a -> b) is desugared to (a -> Tot b)") in
                                                                    let uu____4214
                                                                    =
                                                                    let uu____4225
                                                                    =
                                                                    let uu____4236
                                                                    =
                                                                    let uu____4245
                                                                    =
                                                                    let uu____4246
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4246 in
                                                                    (FStar_Getopt.noshort,
                                                                    "z3refresh",
                                                                    uu____4245,
                                                                    "Restart Z3 after each query; useful for ensuring proof robustness") in
                                                                    let uu____4247
                                                                    =
                                                                    let uu____4258
                                                                    =
                                                                    let uu____4269
                                                                    =
                                                                    let uu____4280
                                                                    =
                                                                    let uu____4291
                                                                    =
                                                                    let uu____4302
                                                                    =
                                                                    let uu____4311
                                                                    =
                                                                    let uu____4312
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4312 in
                                                                    (FStar_Getopt.noshort,
                                                                    "__no_positivity",
                                                                    uu____4311,
                                                                    "Don't check positivity of inductive types") in
                                                                    let uu____4313
                                                                    =
                                                                    let uu____4324
                                                                    =
                                                                    let uu____4333
                                                                    =
                                                                    let uu____4334
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4334 in
                                                                    (FStar_Getopt.noshort,
                                                                    "__ml_no_eta_expand_coertions",
                                                                    uu____4333,
                                                                    "Do not eta-expand coertions in generated OCaml") in
                                                                    let uu____4335
                                                                    =
                                                                    let uu____4346
                                                                    =
                                                                    let uu____4357
                                                                    =
                                                                    let uu____4366
                                                                    =
                                                                    let uu____4367
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4367 in
                                                                    (FStar_Getopt.noshort,
                                                                    "use_extracted_interfaces",
                                                                    uu____4366,
                                                                    "Extract interfaces from the dependencies and use them for verification") in
                                                                    let uu____4368
                                                                    =
                                                                    let uu____4379
                                                                    =
                                                                    let uu____4389
                                                                    =
                                                                    let uu____4390
                                                                    =
                                                                    let uu____4397
                                                                    =
                                                                    let uu____4398
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4398 in
                                                                    ((fun
                                                                    uu____4403
                                                                    ->
                                                                    (
                                                                    let uu____4405
                                                                    =
                                                                    specs () in
                                                                    display_usage_aux
                                                                    uu____4405);
                                                                    FStar_All.exit
                                                                    (Prims.parse_int "0")),
                                                                    uu____4397) in
                                                                    WithSideEffect
                                                                    uu____4390 in
                                                                    (104,
                                                                    "help",
                                                                    uu____4389,
                                                                    "Display this information") in
                                                                    [uu____4379] in
                                                                    uu____4357
                                                                    ::
                                                                    uu____4368 in
                                                                    (FStar_Getopt.noshort,
                                                                    "warn_error",
                                                                    (SimpleStr
                                                                    ""),
                                                                    "The [-warn_error] option follows the OCaml syntax, namely:\n\t\t- [r] is a range of warnings (either a number [n], or a range [n..n])\n\t\t- [-r] silences range [r]\n\t\t- [+r] enables range [r]\n\t\t- [@r] makes range [r] fatal.")
                                                                    ::
                                                                    uu____4346 in
                                                                    uu____4324
                                                                    ::
                                                                    uu____4335 in
                                                                    uu____4302
                                                                    ::
                                                                    uu____4313 in
                                                                    (FStar_Getopt.noshort,
                                                                    "use_two_phase_tc",
                                                                    BoolStr,
                                                                    "Use the two phase typechecker (default 'false')")
                                                                    ::
                                                                    uu____4291 in
                                                                    (FStar_Getopt.noshort,
                                                                    "z3seed",
                                                                    (IntStr
                                                                    "positive_integer"),
                                                                    "Set the Z3 random seed (default 0)")
                                                                    ::
                                                                    uu____4280 in
                                                                    (FStar_Getopt.noshort,
                                                                    "z3rlimit_factor",
                                                                    (IntStr
                                                                    "positive_integer"),
                                                                    "Set the Z3 per-query resource limit multiplier. This is useful when, say, regenerating hints and you want to be more lax. (default 1)")
                                                                    ::
                                                                    uu____4269 in
                                                                    (FStar_Getopt.noshort,
                                                                    "z3rlimit",
                                                                    (IntStr
                                                                    "positive_integer"),
                                                                    "Set the Z3 per-query resource limit (default 5 units, taking roughtly 5s)")
                                                                    ::
                                                                    uu____4258 in
                                                                    uu____4236
                                                                    ::
                                                                    uu____4247 in
                                                                    (FStar_Getopt.noshort,
                                                                    "z3cliopt",
                                                                    (ReverseAccumulated
                                                                    (SimpleStr
                                                                    "option")),
                                                                    "Z3 command line options")
                                                                    ::
                                                                    uu____4225 in
                                                                    uu____4203
                                                                    ::
                                                                    uu____4214 in
                                                                    uu____4163
                                                                    ::
                                                                    uu____4191 in
                                                                    uu____4141
                                                                    ::
                                                                    uu____4152 in
                                                                    (FStar_Getopt.noshort,
                                                                    "__temp_no_proj",
                                                                    (Accumulated
                                                                    (SimpleStr
                                                                    "module_name")),
                                                                    "Don't generate projectors for this module")
                                                                    ::
                                                                    uu____4130 in
                                                                    (FStar_Getopt.noshort,
                                                                    "vcgen.optimize_bind_as_seq",
                                                                    (EnumStr
                                                                    ["off";
                                                                    "without_type";
                                                                    "with_type"]),
                                                                    "\n\t\tOptimize the generation of verification conditions, \n\t\t\tspecifically the construction of monadic `bind`,\n\t\t\tgenerating `seq` instead of `bind` when the first computation as a trivial post-condition.\n\t\t\tBy default, this optimization does not apply.\n\t\t\tWhen the `without_type` option is chosen, this imposes a cost on the SMT solver\n\t\t\tto reconstruct type information.\n\t\t\tWhen `with_type` is chosen, type information is provided to the SMT solver,\n\t\t\tbut at the cost of VC bloat, which may often be redundant.")
                                                                    ::
                                                                    uu____4119 in
                                                                    (FStar_Getopt.noshort,
                                                                    "using_facts_from",
                                                                    (Accumulated
                                                                    (SimpleStr
                                                                    "One or more space-separated occurrences of '[+|-]( * | namespace | fact id)'")),
                                                                    "\n\t\tPrunes the context to include only the facts from the given namespace or fact id. \n\t\t\tFacts can be include or excluded using the [+|-] qualifier. \n\t\t\tFor example --using_facts_from '* -FStar.Reflection +FStar.List -FStar.List.Tot' will \n\t\t\t\tremove all facts from FStar.List.Tot.*, \n\t\t\t\tretain all remaining facts from FStar.List.*, \n\t\t\t\tremove all facts from FStar.Reflection.*, \n\t\t\t\tand retain all the rest.\n\t\tNote, the '+' is optional: --using_facts_from 'FStar.List' is equivalent to --using_facts_from '+FStar.List'. \n\t\tMultiple uses of this option accumulate, e.g., --using_facts_from A --using_facts_from B is interpreted as --using_facts_from A^B.")
                                                                    ::
                                                                    uu____4108 in
                                                                    uu____4086
                                                                    ::
                                                                    uu____4097 in
                                                                    (FStar_Getopt.noshort,
                                                                    "use_native_tactics",
                                                                    (PathStr
                                                                    "path"),
                                                                    "Use compiled tactics from <path>")
                                                                    ::
                                                                    uu____4075 in
                                                                    uu____4053
                                                                    ::
                                                                    uu____4064 in
                                                                    uu____4031
                                                                    ::
                                                                    uu____4042 in
                                                                    uu____4009
                                                                    ::
                                                                    uu____4020 in
                                                                    uu____3987
                                                                    ::
                                                                    uu____3998 in
                                                                    uu____3965
                                                                    ::
                                                                    uu____3976 in
                                                                    uu____3943
                                                                    ::
                                                                    uu____3954 in
                                                                    uu____3921
                                                                    ::
                                                                    uu____3932 in
                                                                    uu____3899
                                                                    ::
                                                                    uu____3910 in
                                                                    (FStar_Getopt.noshort,
                                                                    "tactic_trace_d",
                                                                    (IntStr
                                                                    "positive_integer"),
                                                                    "Trace tactics up to a certain binding depth")
                                                                    ::
                                                                    uu____3888 in
                                                                    uu____3866
                                                                    ::
                                                                    uu____3877 in
                                                                    uu____3844
                                                                    ::
                                                                    uu____3855 in
                                                                    (FStar_Getopt.noshort,
                                                                    "smtencoding.l_arith_repr",
                                                                    (EnumStr
                                                                    ["native";
                                                                    "boxwrap"]),
                                                                    "Toggle the representation of linear arithmetic functions in the SMT encoding:\n\t\ti.e., if 'boxwrap', use 'Prims.op_Addition, Prims.op_Subtraction, Prims.op_Minus'; \n\t\tif 'native', use '+, -, -'; \n\t\t(default 'boxwrap')")
                                                                    ::
                                                                    uu____3833 in
                                                                    (FStar_Getopt.noshort,
                                                                    "smtencoding.nl_arith_repr",
                                                                    (EnumStr
                                                                    ["native";
                                                                    "wrapped";
                                                                    "boxwrap"]),
                                                                    "Control the representation of non-linear arithmetic functions in the SMT encoding:\n\t\ti.e., if 'boxwrap' use 'Prims.op_Multiply, Prims.op_Division, Prims.op_Modulus'; \n\t\tif 'native' use '*, div, mod';\n\t\tif 'wrapped' use '_mul, _div, _mod : Int*Int -> Int'; \n\t\t(default 'boxwrap')")
                                                                    ::
                                                                    uu____3822 in
                                                                    (FStar_Getopt.noshort,
                                                                    "smtencoding.elim_box",
                                                                    BoolStr,
                                                                    "Toggle a peephole optimization that eliminates redundant uses of boxing/unboxing in the SMT encoding (default 'false')")
                                                                    ::
                                                                    uu____3811 in
                                                                    (FStar_Getopt.noshort,
                                                                    "smt",
                                                                    (PathStr
                                                                    "path"),
                                                                    "Path to the Z3 SMT solver (we could eventually support other solvers)")
                                                                    ::
                                                                    uu____3800 in
                                                                    uu____3778
                                                                    ::
                                                                    uu____3789 in
                                                                    (FStar_Getopt.noshort,
                                                                    "reuse_hint_for",
                                                                    (SimpleStr
                                                                    "toplevel_name"),
                                                                    "Optimistically, attempt using the recorded hint for <toplevel_name> (a top-level name in the current module) when trying to verify some other term 'g'")
                                                                    ::
                                                                    uu____3767 in
                                                                    uu____3745
                                                                    ::
                                                                    uu____3756 in
                                                                    uu____3723
                                                                    ::
                                                                    uu____3734 in
                                                                    uu____3701
                                                                    ::
                                                                    uu____3712 in
                                                                    uu____3679
                                                                    ::
                                                                    uu____3690 in
                                                                    uu____3657
                                                                    ::
                                                                    uu____3668 in
                                                                    uu____3635
                                                                    ::
                                                                    uu____3646 in
                                                                    uu____3613
                                                                    ::
                                                                    uu____3624 in
                                                                    uu____3591
                                                                    ::
                                                                    uu____3602 in
                                                                    uu____3569
                                                                    ::
                                                                    uu____3580 in
                                                                    (FStar_Getopt.noshort,
                                                                    "prims",
                                                                    (PathStr
                                                                    "file"),
                                                                    "") ::
                                                                    uu____3558 in
                                                                    (FStar_Getopt.noshort,
                                                                    "odir",
                                                                    (PostProcessed
                                                                    (pp_validate_dir,
                                                                    (PathStr
                                                                    "dir"))),
                                                                    "Place output in directory <dir>")
                                                                    ::
                                                                    uu____3547 in
                                                                    uu____3525
                                                                    ::
                                                                    uu____3536 in
                                                                    uu____3503
                                                                    ::
                                                                    uu____3514 in
                                                                    uu____3481
                                                                    ::
                                                                    uu____3492 in
                                                                    (FStar_Getopt.noshort,
                                                                    "no_extract",
                                                                    (Accumulated
                                                                    (PathStr
                                                                    "module name")),
                                                                    "Deprecated: use --extract instead; Do not extract code from this module")
                                                                    ::
                                                                    uu____3470 in
                                                                    uu____3448
                                                                    ::
                                                                    uu____3459 in
                                                                    (FStar_Getopt.noshort,
                                                                    "n_cores",
                                                                    (IntStr
                                                                    "positive_integer"),
                                                                    "Maximum number of cores to use for the solver (implies detail_errors = false) (default 1)")
                                                                    ::
                                                                    uu____3437 in
                                                                    uu____3415
                                                                    ::
                                                                    uu____3426 in
                                                                    (FStar_Getopt.noshort,
                                                                    "min_fuel",
                                                                    (IntStr
                                                                    "non-negative integer"),
                                                                    "Minimum number of unrolling of recursive functions to try (default 1)")
                                                                    ::
                                                                    uu____3404 in
                                                                    (FStar_Getopt.noshort,
                                                                    "max_ifuel",
                                                                    (IntStr
                                                                    "non-negative integer"),
                                                                    "Number of unrolling of inductive datatypes to try at most (default 2)")
                                                                    ::
                                                                    uu____3393 in
                                                                    (FStar_Getopt.noshort,
                                                                    "max_fuel",
                                                                    (IntStr
                                                                    "non-negative integer"),
                                                                    "Number of unrolling of recursive functions to try at most (default 8)")
                                                                    ::
                                                                    uu____3382 in
                                                                    uu____3360
                                                                    ::
                                                                    uu____3371 in
                                                                  uu____3338
                                                                    ::
                                                                    uu____3349 in
                                                                (FStar_Getopt.noshort,
                                                                  "load",
                                                                  (ReverseAccumulated
                                                                    (PathStr
                                                                    "module")),
                                                                  "Load compiled module")
                                                                  ::
                                                                  uu____3327 in
                                                              uu____3305 ::
                                                                uu____3316 in
                                                            (FStar_Getopt.noshort,
                                                              "initial_ifuel",
                                                              (IntStr
                                                                 "non-negative integer"),
                                                              "Number of unrolling of inductive datatypes to try at first (default 1)")
                                                              :: uu____3294 in
                                                          (FStar_Getopt.noshort,
                                                            "initial_fuel",
                                                            (IntStr
                                                               "non-negative integer"),
                                                            "Number of unrolling of recursive functions to try initially (default 2)")
                                                            :: uu____3283 in
                                                        uu____3261 ::
                                                          uu____3272 in
                                                      (FStar_Getopt.noshort,
                                                        "include",
                                                        (ReverseAccumulated
                                                           (PathStr "path")),
                                                        "A directory in which to search for files included on the command line")
                                                        :: uu____3250 in
                                                    uu____3228 :: uu____3239 in
                                                  uu____3206 :: uu____3217 in
                                                uu____3184 :: uu____3195 in
                                              (FStar_Getopt.noshort,
                                                "hint_file",
                                                (PathStr "path"),
                                                "Read/write hints to <path> (instead of module-specific hints files)")
                                                :: uu____3173 in
                                            uu____3151 :: uu____3162 in
                                          (FStar_Getopt.noshort,
                                            "fstar_home", (PathStr "dir"),
                                            "Set the FSTAR_HOME variable to <dir>")
                                            :: uu____3140 in
                                        uu____3118 :: uu____3129 in
                                      (FStar_Getopt.noshort,
                                        "extract_namespace",
                                        (Accumulated
                                           (PostProcessed
                                              (pp_lowercase,
                                                (SimpleStr "namespace name")))),
                                        "Deprecated: use --extract instead; Only extract modules in the specified namespace")
                                        :: uu____3107 in
                                    (FStar_Getopt.noshort, "extract_module",
                                      (Accumulated
                                         (PostProcessed
                                            (pp_lowercase,
                                              (SimpleStr "module_name")))),
                                      "Deprecated: use --extract instead; Only extract the specified modules (instead of the possibly-partial dependency graph)")
                                      :: uu____3096 in
                                  (FStar_Getopt.noshort, "extract",
                                    (Accumulated
                                       (SimpleStr
                                          "One or more space-separated occurrences of '[+|-]( * | namespace | module)'")),
                                    "\n\t\tExtract only those modules whose names or namespaces match the provided options.\n\t\t\tModules can be extracted or not using the [+|-] qualifier. \n\t\t\tFor example --extract '* -FStar.Reflection +FStar.List -FStar.List.Tot' will \n\t\t\t\tnot extract FStar.List.Tot.*, \n\t\t\t\textract remaining modules from FStar.List.*, \n\t\t\t\tnot extract FStar.Reflection.*, \n\t\t\t\tand extract all the rest.\n\t\tNote, the '+' is optional: --extract '+A' and --extract 'A' mean the same thing.\n\t\tMultiple uses of this option accumulate, e.g., --extract A --extract B is interpreted as --extract 'A B'.")
                                    :: uu____3085 in
                                uu____3063 :: uu____3074 in
                              (FStar_Getopt.noshort, "dump_module",
                                (Accumulated (SimpleStr "module_name")), "")
                                :: uu____3052 in
                            uu____3030 :: uu____3041 in
                          uu____3008 :: uu____3019 in
                        uu____2986 :: uu____2997 in
                      (FStar_Getopt.noshort, "dep",
                        (EnumStr ["make"; "graph"; "full"]),
                        "Output the transitive closure of the full dependency graph in three formats:\n\t 'graph': a format suitable the 'dot' tool from 'GraphViz'\n\t 'full': a format suitable for 'make', including dependences for producing .ml and .krml files\n\t 'make': (deprecated) a format suitable for 'make', including only dependences among source files")
                        :: uu____2975 in
                    (FStar_Getopt.noshort, "defensive",
                      (EnumStr ["no"; "warn"; "fail"]),
                      "Enable several internal sanity checks, useful to track bugs and report issues.\n\t\tif 'no', no checks are performed\n\t\tif 'warn', checks are performed and raise a warning when they fail\n\t\tif 'fail', like 'warn', but the compiler aborts instead of issuing a warning\n\t\t(default 'no')")
                      :: uu____2964 in
                  (FStar_Getopt.noshort, "debug_level",
                    (Accumulated
                       (OpenEnumStr
                          (["Low"; "Medium"; "High"; "Extreme"], "..."))),
                    "Control the verbosity of debugging info") :: uu____2953 in
                (FStar_Getopt.noshort, "debug",
                  (Accumulated (SimpleStr "module_name")),
                  "Print lots of debugging information while checking module")
                  :: uu____2942 in
              (FStar_Getopt.noshort, "codegen-lib",
                (Accumulated (SimpleStr "namespace")),
                "External runtime library (i.e. M.N.x extracts to M.N.X instead of M_N.x)")
                :: uu____2931 in
            (FStar_Getopt.noshort, "codegen",
              (EnumStr ["OCaml"; "FSharp"; "Kremlin"; "Plugin"]),
              "Generate code for further compilation to executable code, or build a compiler plugin")
              :: uu____2920 in
          (FStar_Getopt.noshort, "cache_dir",
            (PostProcessed (pp_validate_dir, (PathStr "dir"))),
            "Read and write .checked and .checked.lax in directory <dir>") ::
            uu____2909 in
        uu____2887 :: uu____2898 in
      (FStar_Getopt.noshort, "admit_except",
        (SimpleStr "[symbol|(symbol, id)]"),
        "Admit all queries, except those with label (<symbol>, <id>)) (e.g. --admit_except '(FStar.Fin.pigeonhole, 1)' or --admit_except FStar.Fin.pigeonhole)")
        :: uu____2876 in
    (FStar_Getopt.noshort, "admit_smt_queries", BoolStr,
      "Admit SMT queries, unsafe! (default 'false')") :: uu____2865
and (specs : Prims.unit -> FStar_Getopt.opt Prims.list) =
  fun uu____5161 ->
    let uu____5164 = specs_with_types () in
    FStar_List.map
      (fun uu____5189 ->
         match uu____5189 with
         | (short, long, typ, doc) ->
             let uu____5202 =
               let uu____5213 = arg_spec_of_opt_type long typ in
               (short, long, uu____5213, doc) in
             mk_spec uu____5202) uu____5164
let (settable : Prims.string -> Prims.bool) =
  fun uu___45_5220 ->
    match uu___45_5220 with
    | "admit_smt_queries" -> true
    | "admit_except" -> true
    | "debug" -> true
    | "debug_level" -> true
    | "defensive" -> true
    | "detail_errors" -> true
    | "detail_hint_replay" -> true
    | "eager_inference" -> true
    | "hide_uvar_nums" -> true
    | "hint_info" -> true
    | "hint_file" -> true
    | "initial_fuel" -> true
    | "initial_ifuel" -> true
    | "lax" -> true
    | "load" -> true
    | "log_types" -> true
    | "log_queries" -> true
    | "max_fuel" -> true
    | "max_ifuel" -> true
    | "min_fuel" -> true
    | "no_smt" -> true
    | "__no_positivity" -> true
    | "ugly" -> true
    | "print_bound_var_types" -> true
    | "print_effect_args" -> true
    | "print_full_names" -> true
    | "print_implicits" -> true
    | "print_universes" -> true
    | "print_z3_statistics" -> true
    | "prn" -> true
    | "query_stats" -> true
    | "silent" -> true
    | "smtencoding.elim_box" -> true
    | "smtencoding.nl_arith_repr" -> true
    | "smtencoding.l_arith_repr" -> true
    | "timing" -> true
    | "trace_error" -> true
    | "unthrottle_inductives" -> true
    | "use_eq_at_higher_order" -> true
    | "no_tactics" -> true
    | "normalize_pure_terms_for_extraction" -> true
    | "tactic_raw_binders" -> true
    | "tactic_trace" -> true
    | "tactic_trace_d" -> true
    | "__temp_fast_implicits" -> true
    | "__temp_no_proj" -> true
    | "reuse_hint_for" -> true
    | "warn_error" -> true
    | "z3rlimit_factor" -> true
    | "z3rlimit" -> true
    | "z3refresh" -> true
    | "use_two_phase_tc" -> true
    | "vcgen.optimize_bind_as_seq" -> true
    | uu____5221 -> false
let (resettable : Prims.string -> Prims.bool) =
  fun s ->
    (((settable s) || (s = "z3seed")) || (s = "z3cliopt")) ||
      (s = "using_facts_from")
let (all_specs : FStar_Getopt.opt Prims.list) = specs ()
let (all_specs_with_types :
  (FStar_BaseTypes.char, Prims.string, opt_type, Prims.string)
    FStar_Pervasives_Native.tuple4 Prims.list)
  = specs_with_types ()
let (settable_specs :
  (FStar_BaseTypes.char, Prims.string, Prims.unit FStar_Getopt.opt_variant,
    Prims.string) FStar_Pervasives_Native.tuple4 Prims.list)
  =
  FStar_All.pipe_right all_specs
    (FStar_List.filter
       (fun uu____5278 ->
          match uu____5278 with
          | (uu____5289, x, uu____5291, uu____5292) -> settable x))
let (resettable_specs :
  (FStar_BaseTypes.char, Prims.string, Prims.unit FStar_Getopt.opt_variant,
    Prims.string) FStar_Pervasives_Native.tuple4 Prims.list)
  =
  FStar_All.pipe_right all_specs
    (FStar_List.filter
       (fun uu____5338 ->
          match uu____5338 with
          | (uu____5349, x, uu____5351, uu____5352) -> resettable x))
let (display_usage : Prims.unit -> Prims.unit) =
  fun uu____5359 -> let uu____5360 = specs () in display_usage_aux uu____5360
let (fstar_home : Prims.unit -> Prims.string) =
  fun uu____5375 ->
    let uu____5376 = get_fstar_home () in
    match uu____5376 with
    | FStar_Pervasives_Native.None ->
        let x = FStar_Util.get_exec_dir () in
        let x1 = Prims.strcat x "/.." in
        ((let uu____5382 =
            let uu____5387 = mk_string x1 in ("fstar_home", uu____5387) in
          set_option' uu____5382);
         x1)
    | FStar_Pervasives_Native.Some x -> x
exception File_argument of Prims.string 
let (uu___is_File_argument : Prims.exn -> Prims.bool) =
  fun projectee ->
    match projectee with
    | File_argument uu____5395 -> true
    | uu____5396 -> false
let (__proj__File_argument__item__uu___ : Prims.exn -> Prims.string) =
  fun projectee ->
    match projectee with | File_argument uu____5403 -> uu____5403
let (set_options : options -> Prims.string -> FStar_Getopt.parse_cmdline_res)
  =
  fun o ->
    fun s ->
      let specs1 =
        match o with
        | Set -> settable_specs
        | Reset -> resettable_specs
        | Restore -> all_specs in
      try
        if s = ""
        then FStar_Getopt.Success
        else
          FStar_Getopt.parse_string specs1
            (fun s1 -> FStar_Exn.raise (File_argument s1)) s
      with
      | File_argument s1 ->
          let uu____5447 =
            FStar_Util.format1 "File %s is not a valid option" s1 in
          FStar_Getopt.Error uu____5447
let (file_list_ : Prims.string Prims.list FStar_ST.ref) =
  FStar_Util.mk_ref []
let (parse_cmd_line :
  Prims.unit ->
    (FStar_Getopt.parse_cmdline_res, Prims.string Prims.list)
      FStar_Pervasives_Native.tuple2)
  =
  fun uu____5497 ->
    let res =
      FStar_Getopt.parse_cmdline all_specs
        (fun i ->
           let uu____5502 =
             let uu____5505 = FStar_ST.op_Bang file_list_ in
             FStar_List.append uu____5505 [i] in
           FStar_ST.op_Colon_Equals file_list_ uu____5502) in
    let uu____5566 =
      let uu____5569 = FStar_ST.op_Bang file_list_ in
      FStar_List.map FStar_Common.try_convert_file_name_to_mixed uu____5569 in
    (res, uu____5566)
let (file_list : Prims.unit -> Prims.string Prims.list) =
  fun uu____5607 -> FStar_ST.op_Bang file_list_
let (restore_cmd_line_options : Prims.bool -> FStar_Getopt.parse_cmdline_res)
  =
  fun should_clear ->
    let old_verify_module = get_verify_module () in
    if should_clear then clear () else init ();
    (let r =
       let uu____5646 = specs () in
       FStar_Getopt.parse_cmdline uu____5646 (fun x -> ()) in
     (let uu____5652 =
        let uu____5657 =
          let uu____5658 = FStar_List.map mk_string old_verify_module in
          List uu____5658 in
        ("verify_module", uu____5657) in
      set_option' uu____5652);
     r)
let (module_name_of_file_name : Prims.string -> Prims.string) =
  fun f ->
    let f1 = FStar_Util.basename f in
    let f2 =
      let uu____5666 =
        let uu____5667 =
          let uu____5668 =
            let uu____5669 = FStar_Util.get_file_extension f1 in
            FStar_String.length uu____5669 in
          (FStar_String.length f1) - uu____5668 in
        uu____5667 - (Prims.parse_int "1") in
      FStar_String.substring f1 (Prims.parse_int "0") uu____5666 in
    FStar_String.lowercase f2
let (should_verify : Prims.string -> Prims.bool) =
  fun m ->
    let uu____5673 = get_lax () in
    if uu____5673
    then false
    else
      (let l = get_verify_module () in
       FStar_List.contains (FStar_String.lowercase m) l)
let (should_verify_file : Prims.string -> Prims.bool) =
  fun fn ->
    let uu____5681 = module_name_of_file_name fn in should_verify uu____5681
let (dont_gen_projectors : Prims.string -> Prims.bool) =
  fun m ->
    let uu____5685 = get___temp_no_proj () in
    FStar_List.contains m uu____5685
let (should_print_message : Prims.string -> Prims.bool) =
  fun m ->
    let uu____5691 = should_verify m in
    if uu____5691 then m <> "Prims" else false
let (include_path : Prims.unit -> Prims.string Prims.list) =
  fun uu____5697 ->
    let uu____5698 = get_no_default_includes () in
    if uu____5698
    then get_include ()
    else
      (let h = fstar_home () in
       let defs = universe_include_path_base_dirs in
       let uu____5706 =
         let uu____5709 =
           FStar_All.pipe_right defs
             (FStar_List.map (fun x -> Prims.strcat h x)) in
         FStar_All.pipe_right uu____5709
           (FStar_List.filter FStar_Util.file_exists) in
       let uu____5722 =
         let uu____5725 = get_include () in
         FStar_List.append uu____5725 ["."] in
       FStar_List.append uu____5706 uu____5722)
let (find_file : Prims.string -> Prims.string FStar_Pervasives_Native.option)
  =
  fun filename ->
    let uu____5733 = FStar_Util.is_path_absolute filename in
    if uu____5733
    then
      (if FStar_Util.file_exists filename
       then FStar_Pervasives_Native.Some filename
       else FStar_Pervasives_Native.None)
    else
      (let uu____5740 =
         let uu____5743 = include_path () in FStar_List.rev uu____5743 in
       FStar_Util.find_map uu____5740
         (fun p ->
            let path =
              if p = "." then filename else FStar_Util.join_paths p filename in
            if FStar_Util.file_exists path
            then FStar_Pervasives_Native.Some path
            else FStar_Pervasives_Native.None))
let (prims : Prims.unit -> Prims.string) =
  fun uu____5756 ->
    let uu____5757 = get_prims () in
    match uu____5757 with
    | FStar_Pervasives_Native.None ->
        let filename = "prims.fst" in
        let uu____5761 = find_file filename in
        (match uu____5761 with
         | FStar_Pervasives_Native.Some result -> result
         | FStar_Pervasives_Native.None ->
             let uu____5765 =
               FStar_Util.format1
                 "unable to find required file \"%s\" in the module search path.\n"
                 filename in
             failwith uu____5765)
    | FStar_Pervasives_Native.Some x -> x
let (prims_basename : Prims.unit -> Prims.string) =
  fun uu____5769 ->
    let uu____5770 = prims () in FStar_Util.basename uu____5770
let (pervasives : Prims.unit -> Prims.string) =
  fun uu____5773 ->
    let filename = "FStar.Pervasives.fst" in
    let uu____5775 = find_file filename in
    match uu____5775 with
    | FStar_Pervasives_Native.Some result -> result
    | FStar_Pervasives_Native.None ->
        let uu____5779 =
          FStar_Util.format1
            "unable to find required file \"%s\" in the module search path.\n"
            filename in
        failwith uu____5779
let (pervasives_basename : Prims.unit -> Prims.string) =
  fun uu____5782 ->
    let uu____5783 = pervasives () in FStar_Util.basename uu____5783
let (pervasives_native_basename : Prims.unit -> Prims.string) =
  fun uu____5786 ->
    let filename = "FStar.Pervasives.Native.fst" in
    let uu____5788 = find_file filename in
    match uu____5788 with
    | FStar_Pervasives_Native.Some result -> FStar_Util.basename result
    | FStar_Pervasives_Native.None ->
        let uu____5792 =
          FStar_Util.format1
            "unable to find required file \"%s\" in the module search path.\n"
            filename in
        failwith uu____5792
let (prepend_output_dir : Prims.string -> Prims.string) =
  fun fname ->
    let uu____5796 = get_odir () in
    match uu____5796 with
    | FStar_Pervasives_Native.None -> fname
    | FStar_Pervasives_Native.Some x -> FStar_Util.join_paths x fname
let (prepend_cache_dir : Prims.string -> Prims.string) =
  fun fpath ->
    let uu____5803 = get_cache_dir () in
    match uu____5803 with
    | FStar_Pervasives_Native.None -> fpath
    | FStar_Pervasives_Native.Some x ->
        let uu____5807 = FStar_Util.basename fpath in
        FStar_Util.join_paths x uu____5807
let (parse_settings :
  Prims.string Prims.list ->
    (Prims.string Prims.list, Prims.bool) FStar_Pervasives_Native.tuple2
      Prims.list)
  =
  fun ns ->
    let parse_one_setting s =
      if s = "*"
      then ([], true)
      else
        if FStar_Util.starts_with s "-"
        then
          (let path =
             let uu____5859 =
               FStar_Util.substring_from s (Prims.parse_int "1") in
             FStar_Ident.path_of_text uu____5859 in
           (path, false))
        else
          (let s1 =
             if FStar_Util.starts_with s "+"
             then FStar_Util.substring_from s (Prims.parse_int "1")
             else s in
           ((FStar_Ident.path_of_text s1), true)) in
    let uu____5867 =
      FStar_All.pipe_right ns
        (FStar_List.collect
           (fun s ->
              FStar_All.pipe_right (FStar_Util.split s " ")
                (FStar_List.map parse_one_setting))) in
    FStar_All.pipe_right uu____5867 FStar_List.rev
let (__temp_no_proj : Prims.string -> Prims.bool) =
  fun s ->
    let uu____5935 = get___temp_no_proj () in
    FStar_All.pipe_right uu____5935 (FStar_List.contains s)
let (__temp_fast_implicits : Prims.unit -> Prims.bool) =
  fun uu____5942 -> lookup_opt "__temp_fast_implicits" as_bool
let (admit_smt_queries : Prims.unit -> Prims.bool) =
  fun uu____5945 -> get_admit_smt_queries ()
let (admit_except :
  Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____5950 -> get_admit_except ()
let (cache_checked_modules : Prims.unit -> Prims.bool) =
  fun uu____5953 -> get_cache_checked_modules ()
type codegen_t =
  | OCaml 
  | FSharp 
  | Kremlin 
  | Plugin [@@deriving show]
let (uu___is_OCaml : codegen_t -> Prims.bool) =
  fun projectee -> match projectee with | OCaml -> true | uu____5957 -> false
let (uu___is_FSharp : codegen_t -> Prims.bool) =
  fun projectee ->
    match projectee with | FSharp -> true | uu____5961 -> false
let (uu___is_Kremlin : codegen_t -> Prims.bool) =
  fun projectee ->
    match projectee with | Kremlin -> true | uu____5965 -> false
let (uu___is_Plugin : codegen_t -> Prims.bool) =
  fun projectee ->
    match projectee with | Plugin -> true | uu____5969 -> false
let (codegen : Prims.unit -> codegen_t FStar_Pervasives_Native.option) =
  fun uu____5974 ->
    let uu____5975 = get_codegen () in
    FStar_Util.map_opt uu____5975
      (fun uu___46_5979 ->
         match uu___46_5979 with
         | "OCaml" -> OCaml
         | "FSharp" -> FSharp
         | "Kremlin" -> Kremlin
         | "Plugin" -> Plugin
         | uu____5980 -> failwith "Impossible")
let (codegen_libs : Prims.unit -> Prims.string Prims.list Prims.list) =
  fun uu____5987 ->
    let uu____5988 = get_codegen_lib () in
    FStar_All.pipe_right uu____5988
      (FStar_List.map (fun x -> FStar_Util.split x "."))
let (debug_any : Prims.unit -> Prims.bool) =
  fun uu____6003 -> let uu____6004 = get_debug () in uu____6004 <> []
let (debug_at_level : Prims.string -> debug_level_t -> Prims.bool) =
  fun modul ->
    fun level ->
      (let uu____6017 = get_debug () in
       FStar_All.pipe_right uu____6017 (FStar_List.contains modul)) &&
        (debug_level_geq level)
let (defensive : Prims.unit -> Prims.bool) =
  fun uu____6024 -> let uu____6025 = get_defensive () in uu____6025 <> "no"
let (defensive_fail : Prims.unit -> Prims.bool) =
  fun uu____6028 -> let uu____6029 = get_defensive () in uu____6029 = "fail"
let (dep : Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____6034 -> get_dep ()
let (detail_errors : Prims.unit -> Prims.bool) =
  fun uu____6037 -> get_detail_errors ()
let (detail_hint_replay : Prims.unit -> Prims.bool) =
  fun uu____6040 -> get_detail_hint_replay ()
let (doc : Prims.unit -> Prims.bool) = fun uu____6043 -> get_doc ()
let (dump_module : Prims.string -> Prims.bool) =
  fun s ->
    let uu____6047 = get_dump_module () in
    FStar_All.pipe_right uu____6047 (FStar_List.contains s)
let (eager_inference : Prims.unit -> Prims.bool) =
  fun uu____6054 -> get_eager_inference ()
let (expose_interfaces : Prims.unit -> Prims.bool) =
  fun uu____6057 -> get_expose_interfaces ()
let (fs_typ_app : Prims.string -> Prims.bool) =
  fun filename ->
    let uu____6061 = FStar_ST.op_Bang light_off_files in
    FStar_List.contains filename uu____6061
let (full_context_dependency : Prims.unit -> Prims.bool) =
  fun uu____6095 -> true
let (hide_uvar_nums : Prims.unit -> Prims.bool) =
  fun uu____6098 -> get_hide_uvar_nums ()
let (hint_info : Prims.unit -> Prims.bool) =
  fun uu____6101 -> (get_hint_info ()) || (get_query_stats ())
let (hint_file : Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____6106 -> get_hint_file ()
let (ide : Prims.unit -> Prims.bool) = fun uu____6109 -> get_ide ()
let (indent : Prims.unit -> Prims.bool) = fun uu____6112 -> get_indent ()
let (initial_fuel : Prims.unit -> Prims.int) =
  fun uu____6115 ->
    let uu____6116 = get_initial_fuel () in
    let uu____6117 = get_max_fuel () in Prims.min uu____6116 uu____6117
let (initial_ifuel : Prims.unit -> Prims.int) =
  fun uu____6120 ->
    let uu____6121 = get_initial_ifuel () in
    let uu____6122 = get_max_ifuel () in Prims.min uu____6121 uu____6122
let (interactive : Prims.unit -> Prims.bool) =
  fun uu____6125 -> (get_in ()) || (get_ide ())
let (lax : Prims.unit -> Prims.bool) = fun uu____6128 -> get_lax ()
let (load : Prims.unit -> Prims.string Prims.list) =
  fun uu____6133 -> get_load ()
let (legacy_interactive : Prims.unit -> Prims.bool) =
  fun uu____6136 -> get_in ()
let (log_queries : Prims.unit -> Prims.bool) =
  fun uu____6139 -> get_log_queries ()
let (log_types : Prims.unit -> Prims.bool) =
  fun uu____6142 -> get_log_types ()
let (max_fuel : Prims.unit -> Prims.int) = fun uu____6145 -> get_max_fuel ()
let (max_ifuel : Prims.unit -> Prims.int) =
  fun uu____6148 -> get_max_ifuel ()
let (min_fuel : Prims.unit -> Prims.int) = fun uu____6151 -> get_min_fuel ()
let (ml_ish : Prims.unit -> Prims.bool) = fun uu____6154 -> get_MLish ()
let (set_ml_ish : Prims.unit -> Prims.unit) =
  fun uu____6157 -> set_option "MLish" (Bool true)
let (n_cores : Prims.unit -> Prims.int) = fun uu____6160 -> get_n_cores ()
let (no_default_includes : Prims.unit -> Prims.bool) =
  fun uu____6163 -> get_no_default_includes ()
let (no_extract : Prims.string -> Prims.bool) =
  fun s ->
    let s1 = FStar_String.lowercase s in
    let uu____6168 = get_no_extract () in
    FStar_All.pipe_right uu____6168
      (FStar_Util.for_some (fun f -> (FStar_String.lowercase f) = s1))
let (normalize_pure_terms_for_extraction : Prims.unit -> Prims.bool) =
  fun uu____6177 -> get_normalize_pure_terms_for_extraction ()
let (no_location_info : Prims.unit -> Prims.bool) =
  fun uu____6180 -> get_no_location_info ()
let (no_smt : Prims.unit -> Prims.bool) = fun uu____6183 -> get_no_smt ()
let (output_dir : Prims.unit -> Prims.string FStar_Pervasives_Native.option)
  = fun uu____6188 -> get_odir ()
let (ugly : Prims.unit -> Prims.bool) = fun uu____6191 -> get_ugly ()
let (print_bound_var_types : Prims.unit -> Prims.bool) =
  fun uu____6194 -> get_print_bound_var_types ()
let (print_effect_args : Prims.unit -> Prims.bool) =
  fun uu____6197 -> get_print_effect_args ()
let (print_implicits : Prims.unit -> Prims.bool) =
  fun uu____6200 -> get_print_implicits ()
let (print_real_names : Prims.unit -> Prims.bool) =
  fun uu____6203 -> (get_prn ()) || (get_print_full_names ())
let (print_universes : Prims.unit -> Prims.bool) =
  fun uu____6206 -> get_print_universes ()
let (print_z3_statistics : Prims.unit -> Prims.bool) =
  fun uu____6209 -> (get_print_z3_statistics ()) || (get_query_stats ())
let (query_stats : Prims.unit -> Prims.bool) =
  fun uu____6212 -> get_query_stats ()
let (record_hints : Prims.unit -> Prims.bool) =
  fun uu____6215 -> get_record_hints ()
let (reuse_hint_for :
  Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____6220 -> get_reuse_hint_for ()
let (silent : Prims.unit -> Prims.bool) = fun uu____6223 -> get_silent ()
let (smtencoding_elim_box : Prims.unit -> Prims.bool) =
  fun uu____6226 -> get_smtencoding_elim_box ()
let (smtencoding_nl_arith_native : Prims.unit -> Prims.bool) =
  fun uu____6229 ->
    let uu____6230 = get_smtencoding_nl_arith_repr () in
    uu____6230 = "native"
let (smtencoding_nl_arith_wrapped : Prims.unit -> Prims.bool) =
  fun uu____6233 ->
    let uu____6234 = get_smtencoding_nl_arith_repr () in
    uu____6234 = "wrapped"
let (smtencoding_nl_arith_default : Prims.unit -> Prims.bool) =
  fun uu____6237 ->
    let uu____6238 = get_smtencoding_nl_arith_repr () in
    uu____6238 = "boxwrap"
let (smtencoding_l_arith_native : Prims.unit -> Prims.bool) =
  fun uu____6241 ->
    let uu____6242 = get_smtencoding_l_arith_repr () in uu____6242 = "native"
let (smtencoding_l_arith_default : Prims.unit -> Prims.bool) =
  fun uu____6245 ->
    let uu____6246 = get_smtencoding_l_arith_repr () in
    uu____6246 = "boxwrap"
let (tactic_raw_binders : Prims.unit -> Prims.bool) =
  fun uu____6249 -> get_tactic_raw_binders ()
let (tactic_trace : Prims.unit -> Prims.bool) =
  fun uu____6252 -> get_tactic_trace ()
let (tactic_trace_d : Prims.unit -> Prims.int) =
  fun uu____6255 -> get_tactic_trace_d ()
let (timing : Prims.unit -> Prims.bool) = fun uu____6258 -> get_timing ()
let (trace_error : Prims.unit -> Prims.bool) =
  fun uu____6261 -> get_trace_error ()
let (unthrottle_inductives : Prims.unit -> Prims.bool) =
  fun uu____6264 -> get_unthrottle_inductives ()
let (unsafe_tactic_exec : Prims.unit -> Prims.bool) =
  fun uu____6267 -> get_unsafe_tactic_exec ()
let (use_eq_at_higher_order : Prims.unit -> Prims.bool) =
  fun uu____6270 -> get_use_eq_at_higher_order ()
let (use_hints : Prims.unit -> Prims.bool) =
  fun uu____6273 -> get_use_hints ()
let (use_hint_hashes : Prims.unit -> Prims.bool) =
  fun uu____6276 -> get_use_hint_hashes ()
let (use_native_tactics :
  Prims.unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____6281 -> get_use_native_tactics ()
let (use_tactics : Prims.unit -> Prims.bool) =
  fun uu____6284 -> get_use_tactics ()
let (using_facts_from :
  Prims.unit ->
    (FStar_Ident.path, Prims.bool) FStar_Pervasives_Native.tuple2 Prims.list)
  =
  fun uu____6293 ->
    let uu____6294 = get_using_facts_from () in
    match uu____6294 with
    | FStar_Pervasives_Native.None -> [([], true)]
    | FStar_Pervasives_Native.Some ns -> parse_settings ns
let (vcgen_optimize_bind_as_seq : Prims.unit -> Prims.bool) =
  fun uu____6328 ->
    let uu____6329 = get_vcgen_optimize_bind_as_seq () in
    FStar_Option.isSome uu____6329
let (vcgen_decorate_with_type : Prims.unit -> Prims.bool) =
  fun uu____6334 ->
    let uu____6335 = get_vcgen_optimize_bind_as_seq () in
    match uu____6335 with
    | FStar_Pervasives_Native.Some "with_type" -> true
    | uu____6338 -> false
let (warn_default_effects : Prims.unit -> Prims.bool) =
  fun uu____6343 -> get_warn_default_effects ()
let (z3_exe : Prims.unit -> Prims.string) =
  fun uu____6346 ->
    let uu____6347 = get_smt () in
    match uu____6347 with
    | FStar_Pervasives_Native.None -> FStar_Platform.exe "z3"
    | FStar_Pervasives_Native.Some s -> s
let (z3_cliopt : Prims.unit -> Prims.string Prims.list) =
  fun uu____6355 -> get_z3cliopt ()
let (z3_refresh : Prims.unit -> Prims.bool) =
  fun uu____6358 -> get_z3refresh ()
let (z3_rlimit : Prims.unit -> Prims.int) = fun uu____6361 -> get_z3rlimit ()
let (z3_rlimit_factor : Prims.unit -> Prims.int) =
  fun uu____6364 -> get_z3rlimit_factor ()
let (z3_seed : Prims.unit -> Prims.int) = fun uu____6367 -> get_z3seed ()
let (use_two_phase_tc : Prims.unit -> Prims.bool) =
  fun uu____6370 -> get_use_two_phase_tc ()
let (no_positivity : Prims.unit -> Prims.bool) =
  fun uu____6373 -> get_no_positivity ()
let (ml_no_eta_expand_coertions : Prims.unit -> Prims.bool) =
  fun uu____6376 -> get_ml_no_eta_expand_coertions ()
let (warn_error : Prims.unit -> Prims.string) =
  fun uu____6379 -> get_warn_error ()
let (use_extracted_interfaces : Prims.unit -> Prims.bool) =
  fun uu____6382 -> get_use_extracted_interfaces ()
let (should_extract : Prims.string -> Prims.bool) =
  fun m ->
    let m1 = FStar_String.lowercase m in
    let uu____6387 = get_extract () in
    match uu____6387 with
    | FStar_Pervasives_Native.Some extract_setting ->
        ((let uu____6398 =
            let uu____6411 = get_no_extract () in
            let uu____6414 = get_extract_namespace () in
            let uu____6417 = get_extract_module () in
            (uu____6411, uu____6414, uu____6417) in
          match uu____6398 with
          | ([], [], []) -> ()
          | uu____6432 ->
              failwith
                "Incompatible options: --extract cannot be used with --no_extract, --extract_namespace or --extract_module");
         (let setting = parse_settings extract_setting in
          let m_components = FStar_Ident.path_of_text m1 in
          let rec matches_path m_components1 path =
            match (m_components1, path) with
            | (uu____6476, []) -> true
            | (m2::ms, p::ps) ->
                (m2 = (FStar_String.lowercase p)) && (matches_path ms ps)
            | uu____6495 -> false in
          let uu____6504 =
            FStar_All.pipe_right setting
              (FStar_Util.try_find
                 (fun uu____6538 ->
                    match uu____6538 with
                    | (path, uu____6546) -> matches_path m_components path)) in
          match uu____6504 with
          | FStar_Pervasives_Native.None -> false
          | FStar_Pervasives_Native.Some (uu____6557, flag) -> flag))
    | FStar_Pervasives_Native.None ->
        let should_extract_namespace m2 =
          let uu____6575 = get_extract_namespace () in
          match uu____6575 with
          | [] -> false
          | ns ->
              FStar_All.pipe_right ns
                (FStar_Util.for_some
                   (fun n1 ->
                      FStar_Util.starts_with m2 (FStar_String.lowercase n1))) in
        let should_extract_module m2 =
          let uu____6589 = get_extract_module () in
          match uu____6589 with
          | [] -> false
          | l ->
              FStar_All.pipe_right l
                (FStar_Util.for_some
                   (fun n1 -> (FStar_String.lowercase n1) = m2)) in
        (let uu____6601 = no_extract m1 in Prims.op_Negation uu____6601) &&
          (let uu____6603 =
             let uu____6612 = get_extract_namespace () in
             let uu____6615 = get_extract_module () in
             (uu____6612, uu____6615) in
           (match uu____6603 with
            | ([], []) -> true
            | uu____6626 ->
                (should_extract_namespace m1) || (should_extract_module m1)))