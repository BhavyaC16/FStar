open Prims
let (tc_one_file :
  Prims.string Prims.list ->
    FStar_TypeChecker_Env.env ->
      ((Prims.string FStar_Pervasives_Native.option * Prims.string) *
        FStar_TypeChecker_Env.env_t * Prims.string Prims.list))
  =
  fun remaining ->
    fun env ->
      let uu____37 =
        match remaining with
        | intf::impl::remaining1 when
            FStar_Universal.needs_interleaving intf impl ->
            let uu____82 =
              FStar_Universal.tc_one_file_for_ide env
                (FStar_Pervasives_Native.Some intf) impl
                FStar_Parser_Dep.empty_parsing_data in
            (match uu____82 with
             | (uu____105, env1) ->
                 (((FStar_Pervasives_Native.Some intf), impl), env1,
                   remaining1))
        | intf_or_impl::remaining1 ->
            let uu____130 =
              FStar_Universal.tc_one_file_for_ide env
                FStar_Pervasives_Native.None intf_or_impl
                FStar_Parser_Dep.empty_parsing_data in
            (match uu____130 with
             | (uu____153, env1) ->
                 ((FStar_Pervasives_Native.None, intf_or_impl), env1,
                   remaining1))
        | [] -> failwith "Impossible" in
      match uu____37 with
      | ((intf, impl), env1, remaining1) -> ((intf, impl), env1, remaining1)
type env_t = FStar_TypeChecker_Env.env
type modul_t = FStar_Syntax_Syntax.modul FStar_Pervasives_Native.option
type stack_t = (env_t * modul_t) Prims.list
let (pop : FStar_TypeChecker_Env.env -> Prims.string -> unit) =
  fun env ->
    fun msg ->
      (let uu____270 = FStar_TypeChecker_Tc.pop_context env msg in ());
      FStar_Options.pop ()
let (push_with_kind :
  FStar_TypeChecker_Env.env ->
    Prims.bool -> Prims.bool -> Prims.string -> FStar_TypeChecker_Env.env)
  =
  fun env ->
    fun lax ->
      fun restore_cmd_line_options ->
        fun msg ->
          let env1 =
            let uu___30_299 = env in
            {
              FStar_TypeChecker_Env.solver =
                (uu___30_299.FStar_TypeChecker_Env.solver);
              FStar_TypeChecker_Env.range =
                (uu___30_299.FStar_TypeChecker_Env.range);
              FStar_TypeChecker_Env.curmodule =
                (uu___30_299.FStar_TypeChecker_Env.curmodule);
              FStar_TypeChecker_Env.gamma =
                (uu___30_299.FStar_TypeChecker_Env.gamma);
              FStar_TypeChecker_Env.gamma_sig =
                (uu___30_299.FStar_TypeChecker_Env.gamma_sig);
              FStar_TypeChecker_Env.gamma_cache =
                (uu___30_299.FStar_TypeChecker_Env.gamma_cache);
              FStar_TypeChecker_Env.modules =
                (uu___30_299.FStar_TypeChecker_Env.modules);
              FStar_TypeChecker_Env.expected_typ =
                (uu___30_299.FStar_TypeChecker_Env.expected_typ);
              FStar_TypeChecker_Env.sigtab =
                (uu___30_299.FStar_TypeChecker_Env.sigtab);
              FStar_TypeChecker_Env.attrtab =
                (uu___30_299.FStar_TypeChecker_Env.attrtab);
              FStar_TypeChecker_Env.instantiate_imp =
                (uu___30_299.FStar_TypeChecker_Env.instantiate_imp);
              FStar_TypeChecker_Env.effects =
                (uu___30_299.FStar_TypeChecker_Env.effects);
              FStar_TypeChecker_Env.generalize =
                (uu___30_299.FStar_TypeChecker_Env.generalize);
              FStar_TypeChecker_Env.letrecs =
                (uu___30_299.FStar_TypeChecker_Env.letrecs);
              FStar_TypeChecker_Env.top_level =
                (uu___30_299.FStar_TypeChecker_Env.top_level);
              FStar_TypeChecker_Env.check_uvars =
                (uu___30_299.FStar_TypeChecker_Env.check_uvars);
              FStar_TypeChecker_Env.use_eq =
                (uu___30_299.FStar_TypeChecker_Env.use_eq);
              FStar_TypeChecker_Env.use_eq_strict =
                (uu___30_299.FStar_TypeChecker_Env.use_eq_strict);
              FStar_TypeChecker_Env.is_iface =
                (uu___30_299.FStar_TypeChecker_Env.is_iface);
              FStar_TypeChecker_Env.admit =
                (uu___30_299.FStar_TypeChecker_Env.admit);
              FStar_TypeChecker_Env.lax = lax;
              FStar_TypeChecker_Env.lax_universes =
                (uu___30_299.FStar_TypeChecker_Env.lax_universes);
              FStar_TypeChecker_Env.phase1 =
                (uu___30_299.FStar_TypeChecker_Env.phase1);
              FStar_TypeChecker_Env.failhard =
                (uu___30_299.FStar_TypeChecker_Env.failhard);
              FStar_TypeChecker_Env.nosynth =
                (uu___30_299.FStar_TypeChecker_Env.nosynth);
              FStar_TypeChecker_Env.uvar_subtyping =
                (uu___30_299.FStar_TypeChecker_Env.uvar_subtyping);
              FStar_TypeChecker_Env.tc_term =
                (uu___30_299.FStar_TypeChecker_Env.tc_term);
              FStar_TypeChecker_Env.type_of =
                (uu___30_299.FStar_TypeChecker_Env.type_of);
              FStar_TypeChecker_Env.universe_of =
                (uu___30_299.FStar_TypeChecker_Env.universe_of);
              FStar_TypeChecker_Env.check_type_of =
                (uu___30_299.FStar_TypeChecker_Env.check_type_of);
              FStar_TypeChecker_Env.use_bv_sorts =
                (uu___30_299.FStar_TypeChecker_Env.use_bv_sorts);
              FStar_TypeChecker_Env.qtbl_name_and_index =
                (uu___30_299.FStar_TypeChecker_Env.qtbl_name_and_index);
              FStar_TypeChecker_Env.normalized_eff_names =
                (uu___30_299.FStar_TypeChecker_Env.normalized_eff_names);
              FStar_TypeChecker_Env.fv_delta_depths =
                (uu___30_299.FStar_TypeChecker_Env.fv_delta_depths);
              FStar_TypeChecker_Env.proof_ns =
                (uu___30_299.FStar_TypeChecker_Env.proof_ns);
              FStar_TypeChecker_Env.synth_hook =
                (uu___30_299.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.try_solve_implicits_hook =
                (uu___30_299.FStar_TypeChecker_Env.try_solve_implicits_hook);
              FStar_TypeChecker_Env.splice =
                (uu___30_299.FStar_TypeChecker_Env.splice);
              FStar_TypeChecker_Env.mpreprocess =
                (uu___30_299.FStar_TypeChecker_Env.mpreprocess);
              FStar_TypeChecker_Env.postprocess =
                (uu___30_299.FStar_TypeChecker_Env.postprocess);
              FStar_TypeChecker_Env.identifier_info =
                (uu___30_299.FStar_TypeChecker_Env.identifier_info);
              FStar_TypeChecker_Env.tc_hooks =
                (uu___30_299.FStar_TypeChecker_Env.tc_hooks);
              FStar_TypeChecker_Env.dsenv =
                (uu___30_299.FStar_TypeChecker_Env.dsenv);
              FStar_TypeChecker_Env.nbe =
                (uu___30_299.FStar_TypeChecker_Env.nbe);
              FStar_TypeChecker_Env.strict_args_tab =
                (uu___30_299.FStar_TypeChecker_Env.strict_args_tab);
              FStar_TypeChecker_Env.erasable_types_tab =
                (uu___30_299.FStar_TypeChecker_Env.erasable_types_tab);
              FStar_TypeChecker_Env.enable_defer_to_tac =
                (uu___30_299.FStar_TypeChecker_Env.enable_defer_to_tac)
            } in
          let res = FStar_TypeChecker_Tc.push_context env1 msg in
          FStar_Options.push ();
          if restore_cmd_line_options
          then
            (let uu____304 = FStar_Options.restore_cmd_line_options false in
             FStar_All.pipe_right uu____304 (fun uu____306 -> ()))
          else ();
          res
let (check_frag :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.modul FStar_Pervasives_Native.option ->
      FStar_Parser_ParseIt.input_frag ->
        (FStar_Syntax_Syntax.modul FStar_Pervasives_Native.option *
          FStar_TypeChecker_Env.env * Prims.int)
          FStar_Pervasives_Native.option)
  =
  fun env ->
    fun curmod ->
      fun frag ->
        try
          (fun uu___41_356 ->
             match () with
             | () ->
                 let uu____368 =
                   FStar_Universal.tc_one_fragment curmod env frag in
                 (match uu____368 with
                  | (m, env1) ->
                      let uu____392 =
                        let uu____402 = FStar_Errors.get_err_count () in
                        (m, env1, uu____402) in
                      FStar_Pervasives_Native.Some uu____392)) ()
        with
        | FStar_Errors.Error (e, msg, r) when
            let uu____438 = FStar_Options.trace_error () in
            Prims.op_Negation uu____438 ->
            (FStar_TypeChecker_Err.add_errors env [(e, msg, r)];
             FStar_Pervasives_Native.None)
        | FStar_Errors.Err (e, msg) when
            let uu____469 = FStar_Options.trace_error () in
            Prims.op_Negation uu____469 ->
            ((let uu____472 =
                let uu____482 =
                  let uu____490 = FStar_TypeChecker_Env.get_range env in
                  (e, msg, uu____490) in
                [uu____482] in
              FStar_TypeChecker_Err.add_errors env uu____472);
             FStar_Pervasives_Native.None)
let (report_fail : unit -> unit) =
  fun uu____520 ->
    (let uu____522 = FStar_Errors.report_all () in
     FStar_All.pipe_right uu____522 (fun uu____527 -> ()));
    FStar_Errors.clear ()
type input_chunks =
  | Push of (Prims.bool * Prims.int * Prims.int) 
  | Pop of Prims.string 
  | Code of (Prims.string * (Prims.string * Prims.string)) 
  | Info of (Prims.string * Prims.bool * (Prims.string * Prims.int *
  Prims.int) FStar_Pervasives_Native.option) 
  | Completions of Prims.string 
let (uu___is_Push : input_chunks -> Prims.bool) =
  fun projectee ->
    match projectee with | Push _0 -> true | uu____613 -> false
let (__proj__Push__item___0 :
  input_chunks -> (Prims.bool * Prims.int * Prims.int)) =
  fun projectee -> match projectee with | Push _0 -> _0
let (uu___is_Pop : input_chunks -> Prims.bool) =
  fun projectee -> match projectee with | Pop _0 -> true | uu____660 -> false
let (__proj__Pop__item___0 : input_chunks -> Prims.string) =
  fun projectee -> match projectee with | Pop _0 -> _0
let (uu___is_Code : input_chunks -> Prims.bool) =
  fun projectee ->
    match projectee with | Code _0 -> true | uu____693 -> false
let (__proj__Code__item___0 :
  input_chunks -> (Prims.string * (Prims.string * Prims.string))) =
  fun projectee -> match projectee with | Code _0 -> _0
let (uu___is_Info : input_chunks -> Prims.bool) =
  fun projectee ->
    match projectee with | Info _0 -> true | uu____764 -> false
let (__proj__Info__item___0 :
  input_chunks ->
    (Prims.string * Prims.bool * (Prims.string * Prims.int * Prims.int)
      FStar_Pervasives_Native.option))
  = fun projectee -> match projectee with | Info _0 -> _0
let (uu___is_Completions : input_chunks -> Prims.bool) =
  fun projectee ->
    match projectee with | Completions _0 -> true | uu____841 -> false
let (__proj__Completions__item___0 : input_chunks -> Prims.string) =
  fun projectee -> match projectee with | Completions _0 -> _0
type interactive_state =
  {
  chunk: FStar_Util.string_builder ;
  stdin: FStar_Util.stream_reader FStar_Pervasives_Native.option FStar_ST.ref ;
  buffer: input_chunks Prims.list FStar_ST.ref ;
  log: FStar_Util.file_handle FStar_Pervasives_Native.option FStar_ST.ref }
let (__proj__Mkinteractive_state__item__chunk :
  interactive_state -> FStar_Util.string_builder) =
  fun projectee ->
    match projectee with | { chunk; stdin; buffer; log;_} -> chunk
let (__proj__Mkinteractive_state__item__stdin :
  interactive_state ->
    FStar_Util.stream_reader FStar_Pervasives_Native.option FStar_ST.ref)
  =
  fun projectee ->
    match projectee with | { chunk; stdin; buffer; log;_} -> stdin
let (__proj__Mkinteractive_state__item__buffer :
  interactive_state -> input_chunks Prims.list FStar_ST.ref) =
  fun projectee ->
    match projectee with | { chunk; stdin; buffer; log;_} -> buffer
let (__proj__Mkinteractive_state__item__log :
  interactive_state ->
    FStar_Util.file_handle FStar_Pervasives_Native.option FStar_ST.ref)
  =
  fun projectee ->
    match projectee with | { chunk; stdin; buffer; log;_} -> log
let (the_interactive_state : interactive_state) =
  let uu____1004 = FStar_Util.new_string_builder () in
  let uu____1005 = FStar_Util.mk_ref FStar_Pervasives_Native.None in
  let uu____1012 = FStar_Util.mk_ref [] in
  let uu____1019 = FStar_Util.mk_ref FStar_Pervasives_Native.None in
  {
    chunk = uu____1004;
    stdin = uu____1005;
    buffer = uu____1012;
    log = uu____1019
  }
let rec (read_chunk : unit -> input_chunks) =
  fun uu____1031 ->
    let s = the_interactive_state in
    let log =
      let uu____1039 = FStar_Options.debug_any () in
      if uu____1039
      then
        let transcript =
          let uu____1047 = FStar_ST.op_Bang s.log in
          match uu____1047 with
          | FStar_Pervasives_Native.Some transcript -> transcript
          | FStar_Pervasives_Native.None ->
              let transcript = FStar_Util.open_file_for_writing "transcript" in
              (FStar_ST.op_Colon_Equals s.log
                 (FStar_Pervasives_Native.Some transcript);
               transcript) in
        fun line ->
          (FStar_Util.append_to_file transcript line;
           FStar_Util.flush_file transcript)
      else (fun uu____1105 -> ()) in
    let stdin =
      let uu____1108 = FStar_ST.op_Bang s.stdin in
      match uu____1108 with
      | FStar_Pervasives_Native.Some i -> i
      | FStar_Pervasives_Native.None ->
          let i = FStar_Util.open_stdin () in
          (FStar_ST.op_Colon_Equals s.stdin (FStar_Pervasives_Native.Some i);
           i) in
    let line =
      let uu____1162 = FStar_Util.read_line stdin in
      match uu____1162 with
      | FStar_Pervasives_Native.None -> FStar_All.exit Prims.int_zero
      | FStar_Pervasives_Native.Some l -> l in
    log line;
    (let l = FStar_Util.trim_string line in
     if FStar_Util.starts_with l "#end"
     then
       let responses =
         match FStar_Util.split l " " with
         | uu____1192::ok::fail::[] -> (ok, fail)
         | uu____1204 -> ("ok", "fail") in
       let str = FStar_Util.string_of_string_builder s.chunk in
       (FStar_Util.clear_string_builder s.chunk; Code (str, responses))
     else
       if FStar_Util.starts_with l "#pop"
       then (FStar_Util.clear_string_builder s.chunk; Pop l)
       else
         if FStar_Util.starts_with l "#push"
         then
           (FStar_Util.clear_string_builder s.chunk;
            (let lc_lax =
               let uu____1234 =
                 FStar_Util.substring_from l (FStar_String.length "#push") in
               FStar_Util.trim_string uu____1234 in
             let lc =
               match FStar_Util.split lc_lax " " with
               | l1::c::"#lax"::[] ->
                   let uu____1266 = FStar_Util.int_of_string l1 in
                   let uu____1268 = FStar_Util.int_of_string c in
                   (true, uu____1266, uu____1268)
               | l1::c::[] ->
                   let uu____1281 = FStar_Util.int_of_string l1 in
                   let uu____1283 = FStar_Util.int_of_string c in
                   (false, uu____1281, uu____1283)
               | uu____1289 ->
                   (FStar_Errors.log_issue FStar_Range.dummyRange
                      (FStar_Errors.Warning_WrongErrorLocation,
                        (Prims.op_Hat
                           "Error locations may be wrong, unrecognized string after #push: "
                           lc_lax));
                    (false, Prims.int_one, Prims.int_zero)) in
             Push lc))
         else
           if FStar_Util.starts_with l "#info "
           then
             (match FStar_Util.split l " " with
              | uu____1307::symbol::[] ->
                  (FStar_Util.clear_string_builder s.chunk;
                   Info (symbol, true, FStar_Pervasives_Native.None))
              | uu____1338::symbol::file::row::col::[] ->
                  (FStar_Util.clear_string_builder s.chunk;
                   (let uu____1355 =
                      let uu____1375 =
                        let uu____1387 =
                          let uu____1397 = FStar_Util.int_of_string row in
                          let uu____1399 = FStar_Util.int_of_string col in
                          (file, uu____1397, uu____1399) in
                        FStar_Pervasives_Native.Some uu____1387 in
                      (symbol, false, uu____1375) in
                    Info uu____1355))
              | uu____1427 ->
                  (FStar_Errors.log_issue FStar_Range.dummyRange
                     (FStar_Errors.Error_IDEUnrecognized,
                       (Prims.op_Hat "Unrecognized \"#info\" request: " l));
                   FStar_All.exit Prims.int_one))
           else
             if FStar_Util.starts_with l "#completions "
             then
               (match FStar_Util.split l " " with
                | uu____1440::prefix::"#"::[] ->
                    (FStar_Util.clear_string_builder s.chunk;
                     Completions prefix)
                | uu____1450 ->
                    (FStar_Errors.log_issue FStar_Range.dummyRange
                       (FStar_Errors.Error_IDEUnrecognized,
                         (Prims.op_Hat
                            "Unrecognized \"#completions\" request: " l));
                     FStar_All.exit Prims.int_one))
             else
               if l = "#finish"
               then FStar_All.exit Prims.int_zero
               else
                 (FStar_Util.string_builder_append s.chunk line;
                  FStar_Util.string_builder_append s.chunk "\n";
                  read_chunk ()))
let (shift_chunk : unit -> input_chunks) =
  fun uu____1474 ->
    let s = the_interactive_state in
    let uu____1476 = FStar_ST.op_Bang s.buffer in
    match uu____1476 with
    | [] -> read_chunk ()
    | chunk::chunks -> (FStar_ST.op_Colon_Equals s.buffer chunks; chunk)
let (fill_buffer : unit -> unit) =
  fun uu____1535 ->
    let s = the_interactive_state in
    let uu____1537 =
      let uu____1540 = FStar_ST.op_Bang s.buffer in
      let uu____1566 = let uu____1569 = read_chunk () in [uu____1569] in
      FStar_List.append uu____1540 uu____1566 in
    FStar_ST.op_Colon_Equals s.buffer uu____1537
let (deps_of_our_file :
  Prims.string ->
    (Prims.string Prims.list * Prims.string FStar_Pervasives_Native.option *
      FStar_Parser_Dep.deps))
  =
  fun filename ->
    let uu____1613 =
      FStar_Dependencies.find_deps_if_needed [filename]
        FStar_CheckedFiles.load_parsing_data_from_cache in
    match uu____1613 with
    | (deps, dep_graph) ->
        let uu____1643 =
          FStar_List.partition
            (fun x ->
               let uu____1660 = FStar_Parser_Dep.lowercase_module_name x in
               let uu____1662 =
                 FStar_Parser_Dep.lowercase_module_name filename in
               uu____1660 <> uu____1662) deps in
        (match uu____1643 with
         | (deps1, same_name) ->
             let maybe_intf =
               match same_name with
               | intf::impl::[] ->
                   ((let uu____1706 =
                       (let uu____1710 = FStar_Parser_Dep.is_interface intf in
                        Prims.op_Negation uu____1710) ||
                         (let uu____1713 =
                            FStar_Parser_Dep.is_implementation impl in
                          Prims.op_Negation uu____1713) in
                     if uu____1706
                     then
                       let uu____1716 =
                         let uu____1722 =
                           FStar_Util.format2
                             "Found %s and %s but not an interface + implementation"
                             intf impl in
                         (FStar_Errors.Warning_MissingInterfaceOrImplementation,
                           uu____1722) in
                       FStar_Errors.log_issue FStar_Range.dummyRange
                         uu____1716
                     else ());
                    FStar_Pervasives_Native.Some intf)
               | impl::[] -> FStar_Pervasives_Native.None
               | uu____1734 ->
                   ((let uu____1739 =
                       let uu____1745 =
                         FStar_Util.format1 "Unexpected: ended up with %s"
                           (FStar_String.concat " " same_name) in
                       (FStar_Errors.Warning_UnexpectedFile, uu____1745) in
                     FStar_Errors.log_issue FStar_Range.dummyRange uu____1739);
                    FStar_Pervasives_Native.None) in
             (deps1, maybe_intf, dep_graph))
type m_timestamps =
  (Prims.string FStar_Pervasives_Native.option * Prims.string *
    FStar_Util.time FStar_Pervasives_Native.option * FStar_Util.time)
    Prims.list
let rec (tc_deps :
  modul_t ->
    stack_t ->
      FStar_TypeChecker_Env.env ->
        Prims.string Prims.list ->
          m_timestamps ->
            (stack_t * FStar_TypeChecker_Env.env * m_timestamps))
  =
  fun m ->
    fun stack ->
      fun env ->
        fun remaining ->
          fun ts ->
            match remaining with
            | [] -> (stack, env, ts)
            | uu____1818 ->
                let stack1 = (env, m) :: stack in
                let env1 =
                  let uu____1834 = FStar_Options.lax () in
                  push_with_kind env uu____1834 true "typecheck_modul" in
                let uu____1838 = tc_one_file remaining env1 in
                (match uu____1838 with
                 | ((intf, impl), env2, remaining1) ->
                     let uu____1888 =
                       let intf_t =
                         match intf with
                         | FStar_Pervasives_Native.Some intf1 ->
                             let uu____1903 =
                               FStar_Parser_ParseIt.get_file_last_modification_time
                                 intf1 in
                             FStar_Pervasives_Native.Some uu____1903
                         | FStar_Pervasives_Native.None ->
                             FStar_Pervasives_Native.None in
                       let impl_t =
                         FStar_Parser_ParseIt.get_file_last_modification_time
                           impl in
                       (intf_t, impl_t) in
                     (match uu____1888 with
                      | (intf_t, impl_t) ->
                          tc_deps m stack1 env2 remaining1
                            ((intf, impl, intf_t, impl_t) :: ts)))
let (update_deps :
  Prims.string ->
    modul_t ->
      stack_t -> env_t -> m_timestamps -> (stack_t * env_t * m_timestamps))
  =
  fun filename ->
    fun m ->
      fun stk ->
        fun env ->
          fun ts ->
            let is_stale intf impl intf_t impl_t =
              let impl_mt =
                FStar_Parser_ParseIt.get_file_last_modification_time impl in
              (FStar_Util.is_before impl_t impl_mt) ||
                (match (intf, intf_t) with
                 | (FStar_Pervasives_Native.Some intf1,
                    FStar_Pervasives_Native.Some intf_t1) ->
                     let intf_mt =
                       FStar_Parser_ParseIt.get_file_last_modification_time
                         intf1 in
                     FStar_Util.is_before intf_t1 intf_mt
                 | (FStar_Pervasives_Native.None,
                    FStar_Pervasives_Native.None) -> false
                 | (uu____2042, uu____2043) ->
                     failwith
                       "Impossible, if the interface is None, the timestamp entry should also be None") in
            let rec iterate depnames st env' ts1 good_stack good_ts =
              let match_dep depnames1 intf impl =
                match intf with
                | FStar_Pervasives_Native.None ->
                    (match depnames1 with
                     | dep::depnames' ->
                         if dep = impl
                         then (true, depnames')
                         else (false, depnames1)
                     | uu____2191 -> (false, depnames1))
                | FStar_Pervasives_Native.Some intf1 ->
                    (match depnames1 with
                     | depintf::dep::depnames' ->
                         if (depintf = intf1) && (dep = impl)
                         then (true, depnames')
                         else (false, depnames1)
                     | uu____2244 -> (false, depnames1)) in
              let rec pop_tc_and_stack env1 stack ts2 =
                match ts2 with
                | [] -> env1
                | uu____2327::ts3 ->
                    (pop env1 "";
                     (let uu____2375 =
                        let uu____2390 = FStar_List.hd stack in
                        let uu____2399 = FStar_List.tl stack in
                        (uu____2390, uu____2399) in
                      match uu____2375 with
                      | ((env2, uu____2421), stack1) ->
                          pop_tc_and_stack env2 stack1 ts3)) in
              match ts1 with
              | ts_elt::ts' ->
                  let uu____2491 = ts_elt in
                  (match uu____2491 with
                   | (intf, impl, intf_t, impl_t) ->
                       let uu____2528 = match_dep depnames intf impl in
                       (match uu____2528 with
                        | (b, depnames') ->
                            let uu____2553 =
                              (Prims.op_Negation b) ||
                                (is_stale intf impl intf_t impl_t) in
                            if uu____2553
                            then
                              let env1 =
                                pop_tc_and_stack env'
                                  (FStar_List.rev_append st []) ts1 in
                              tc_deps m good_stack env1 depnames good_ts
                            else
                              (let uu____2573 =
                                 let uu____2582 = FStar_List.hd st in
                                 let uu____2591 = FStar_List.tl st in
                                 (uu____2582, uu____2591) in
                               match uu____2573 with
                               | (stack_elt, st') ->
                                   iterate depnames' st' env' ts' (stack_elt
                                     :: good_stack) (ts_elt :: good_ts))))
              | [] -> tc_deps m good_stack env' depnames good_ts in
            let uu____2648 = deps_of_our_file filename in
            match uu____2648 with
            | (filenames, uu____2668, dep_graph) ->
                iterate filenames (FStar_List.rev_append stk []) env
                  (FStar_List.rev_append ts []) [] []
let (format_info :
  FStar_TypeChecker_Env.env ->
    Prims.string ->
      FStar_Syntax_Syntax.term ->
        FStar_Range.range ->
          Prims.string FStar_Pervasives_Native.option -> Prims.string)
  =
  fun env ->
    fun name ->
      fun typ ->
        fun range ->
          fun doc ->
            let uu____2771 = FStar_Range.string_of_range range in
            let uu____2773 =
              FStar_TypeChecker_Normalize.term_to_string env typ in
            let uu____2775 =
              match doc with
              | FStar_Pervasives_Native.Some docstring ->
                  FStar_Util.format1 "#doc %s" docstring
              | FStar_Pervasives_Native.None -> "" in
            FStar_Util.format4 "(defined at %s) %s: %s%s" uu____2771 name
              uu____2773 uu____2775
let rec (go :
  (Prims.int * Prims.int) ->
    Prims.string -> stack_t -> modul_t -> env_t -> m_timestamps -> unit)
  =
  fun line_col ->
    fun filename ->
      fun stack ->
        fun curmod ->
          fun env ->
            fun ts ->
              let uu____2830 = shift_chunk () in
              match uu____2830 with
              | Info (symbol, fqn_only, pos_opt) ->
                  let info_at_pos_opt =
                    match pos_opt with
                    | FStar_Pervasives_Native.None ->
                        FStar_Pervasives_Native.None
                    | FStar_Pervasives_Native.Some (file, row, col) ->
                        FStar_TypeChecker_Err.info_at_pos env file row col in
                  let info_opt =
                    match info_at_pos_opt with
                    | FStar_Pervasives_Native.Some uu____2952 ->
                        info_at_pos_opt
                    | FStar_Pervasives_Native.None ->
                        if symbol = ""
                        then FStar_Pervasives_Native.None
                        else
                          (let lid =
                             let uu____3016 =
                               FStar_List.map FStar_Ident.id_of_text
                                 (FStar_Util.split symbol ".") in
                             FStar_Ident.lid_of_ids uu____3016 in
                           let lid1 =
                             if fqn_only
                             then lid
                             else
                               (let uu____3023 =
                                  FStar_Syntax_DsEnv.resolve_to_fully_qualified_name
                                    env.FStar_TypeChecker_Env.dsenv lid in
                                match uu____3023 with
                                | FStar_Pervasives_Native.None -> lid
                                | FStar_Pervasives_Native.Some lid1 -> lid1) in
                           let uu____3027 =
                             FStar_TypeChecker_Env.try_lookup_lid env lid1 in
                           FStar_All.pipe_right uu____3027
                             (FStar_Util.map_option
                                (fun uu____3084 ->
                                   match uu____3084 with
                                   | ((uu____3104, typ), r) ->
                                       ((FStar_Util.Inr lid1), typ, r)))) in
                  ((match info_opt with
                    | FStar_Pervasives_Native.None ->
                        FStar_Util.print_string "\n#done-nok\n"
                    | FStar_Pervasives_Native.Some (name_or_lid, typ, rng) ->
                        let uu____3154 =
                          match name_or_lid with
                          | FStar_Util.Inl name ->
                              (name, FStar_Pervasives_Native.None)
                          | FStar_Util.Inr lid ->
                              let uu____3181 = FStar_Ident.string_of_lid lid in
                              (uu____3181, FStar_Pervasives_Native.None) in
                        (match uu____3154 with
                         | (name, doc) ->
                             let uu____3198 =
                               format_info env name typ rng doc in
                             FStar_Util.print1 "%s\n#done-ok\n" uu____3198));
                   go line_col filename stack curmod env ts)
              | Completions search_term ->
                  let rec measure_anchored_match search_term1 candidate =
                    match (search_term1, candidate) with
                    | ([], uu____3247) ->
                        FStar_Pervasives_Native.Some ([], Prims.int_zero)
                    | (uu____3267, []) -> FStar_Pervasives_Native.None
                    | (hs::ts1, hc::tc) ->
                        let hc_text = FStar_Ident.string_of_id hc in
                        if FStar_Util.starts_with hc_text hs
                        then
                          (match ts1 with
                           | [] ->
                               FStar_Pervasives_Native.Some
                                 (candidate, (FStar_String.length hs))
                           | uu____3331 ->
                               let uu____3335 = measure_anchored_match ts1 tc in
                               FStar_All.pipe_right uu____3335
                                 (FStar_Util.map_option
                                    (fun uu____3380 ->
                                       match uu____3380 with
                                       | (matched, len) ->
                                           ((hc :: matched),
                                             (((FStar_String.length hc_text)
                                                 + Prims.int_one)
                                                + len)))))
                        else FStar_Pervasives_Native.None in
                  let rec locate_match needle candidate =
                    let uu____3450 = measure_anchored_match needle candidate in
                    match uu____3450 with
                    | FStar_Pervasives_Native.Some (matched, n) ->
                        FStar_Pervasives_Native.Some ([], matched, n)
                    | FStar_Pervasives_Native.None ->
                        (match candidate with
                         | [] -> FStar_Pervasives_Native.None
                         | hc::tc ->
                             let uu____3539 = locate_match needle tc in
                             FStar_All.pipe_right uu____3539
                               (FStar_Util.map_option
                                  (fun uu____3605 ->
                                     match uu____3605 with
                                     | (prefix, matched, len) ->
                                         ((hc :: prefix), matched, len)))) in
                  let str_of_ids ids =
                    let uu____3657 =
                      FStar_List.map FStar_Ident.string_of_id ids in
                    FStar_Util.concat_l "." uu____3657 in
                  let match_lident_against needle lident =
                    let uu____3693 =
                      let uu____3696 = FStar_Ident.ns_of_lid lident in
                      let uu____3699 =
                        let uu____3702 = FStar_Ident.ident_of_lid lident in
                        [uu____3702] in
                      FStar_List.append uu____3696 uu____3699 in
                    locate_match needle uu____3693 in
                  let shorten_namespace uu____3731 =
                    match uu____3731 with
                    | (prefix, matched, match_len) ->
                        let naked_match =
                          match matched with
                          | uu____3771::[] -> true
                          | uu____3773 -> false in
                        let uu____3777 =
                          FStar_Syntax_DsEnv.shorten_module_path
                            env.FStar_TypeChecker_Env.dsenv prefix
                            naked_match in
                        (match uu____3777 with
                         | (stripped_ns, shortened) ->
                             let uu____3808 = str_of_ids shortened in
                             let uu____3810 = str_of_ids matched in
                             let uu____3812 = str_of_ids stripped_ns in
                             (uu____3808, uu____3810, uu____3812, match_len)) in
                  let prepare_candidate uu____3844 =
                    match uu____3844 with
                    | (prefix, matched, stripped_ns, match_len) ->
                        if prefix = ""
                        then (matched, stripped_ns, match_len)
                        else
                          ((Prims.op_Hat prefix (Prims.op_Hat "." matched)),
                            stripped_ns,
                            (((FStar_String.length prefix) + match_len) +
                               Prims.int_one)) in
                  let needle = FStar_Util.split search_term "." in
                  let all_lidents_in_env = FStar_TypeChecker_Env.lidents env in
                  let matches =
                    let case_a_find_transitive_includes orig_ns m id =
                      let exported_names =
                        FStar_Syntax_DsEnv.transitive_exported_ids
                          env.FStar_TypeChecker_Env.dsenv m in
                      let matched_length =
                        FStar_List.fold_left
                          (fun out ->
                             fun s ->
                               ((FStar_String.length s) + out) +
                                 Prims.int_one) (FStar_String.length id)
                          orig_ns in
                      FStar_All.pipe_right exported_names
                        (FStar_List.filter_map
                           (fun n ->
                              if FStar_Util.starts_with n id
                              then
                                let lid =
                                  let uu____4033 = FStar_Ident.ids_of_lid m in
                                  let uu____4034 = FStar_Ident.id_of_text n in
                                  FStar_Ident.lid_of_ns_and_id uu____4033
                                    uu____4034 in
                                let uu____4035 =
                                  FStar_Syntax_DsEnv.resolve_to_fully_qualified_name
                                    env.FStar_TypeChecker_Env.dsenv lid in
                                FStar_Option.map
                                  (fun fqn ->
                                     let uu____4052 =
                                       let uu____4055 =
                                         FStar_List.map
                                           FStar_Ident.id_of_text orig_ns in
                                       let uu____4059 =
                                         let uu____4062 =
                                           FStar_Ident.ident_of_lid fqn in
                                         [uu____4062] in
                                       FStar_List.append uu____4055
                                         uu____4059 in
                                     ([], uu____4052, matched_length))
                                  uu____4035
                              else FStar_Pervasives_Native.None)) in
                    let case_b_find_matches_in_env uu____4099 =
                      let matches =
                        FStar_List.filter_map (match_lident_against needle)
                          all_lidents_in_env in
                      FStar_All.pipe_right matches
                        (FStar_List.filter
                           (fun uu____4180 ->
                              match uu____4180 with
                              | (ns, id, uu____4195) ->
                                  let uu____4206 =
                                    let uu____4209 =
                                      FStar_Ident.lid_of_ids id in
                                    FStar_Syntax_DsEnv.resolve_to_fully_qualified_name
                                      env.FStar_TypeChecker_Env.dsenv
                                      uu____4209 in
                                  (match uu____4206 with
                                   | FStar_Pervasives_Native.None -> false
                                   | FStar_Pervasives_Native.Some l ->
                                       let uu____4213 =
                                         FStar_Ident.lid_of_ids
                                           (FStar_List.append ns id) in
                                       FStar_Ident.lid_equals l uu____4213))) in
                    let uu____4214 = FStar_Util.prefix needle in
                    match uu____4214 with
                    | (ns, id) ->
                        let matched_ids =
                          match ns with
                          | [] -> case_b_find_matches_in_env ()
                          | uu____4273 ->
                              let l =
                                FStar_Ident.lid_of_path ns
                                  FStar_Range.dummyRange in
                              let uu____4278 =
                                FStar_Syntax_DsEnv.resolve_module_name
                                  env.FStar_TypeChecker_Env.dsenv l true in
                              (match uu____4278 with
                               | FStar_Pervasives_Native.None ->
                                   case_b_find_matches_in_env ()
                               | FStar_Pervasives_Native.Some m ->
                                   case_a_find_transitive_includes ns m id) in
                        FStar_All.pipe_right matched_ids
                          (FStar_List.map
                             (fun x ->
                                let uu____4354 = shorten_namespace x in
                                prepare_candidate uu____4354)) in
                  ((let uu____4368 =
                      FStar_Util.sort_with
                        (fun uu____4397 ->
                           fun uu____4398 ->
                             match (uu____4397, uu____4398) with
                             | ((cd1, ns1, uu____4438),
                                (cd2, ns2, uu____4441)) ->
                                 (match FStar_String.compare cd1 cd2 with
                                  | uu____4473 when
                                      uu____4473 = Prims.int_zero ->
                                      FStar_String.compare ns1 ns2
                                  | n -> n)) matches in
                    FStar_List.iter
                      (fun uu____4490 ->
                         match uu____4490 with
                         | (candidate, ns, match_len) ->
                             let uu____4509 =
                               FStar_Util.string_of_int match_len in
                             FStar_Util.print3 "%s %s %s \n" uu____4509 ns
                               candidate) uu____4368);
                   FStar_Util.print_string "#done-ok\n";
                   go line_col filename stack curmod env ts)
              | Pop msg ->
                  (pop env msg;
                   (let uu____4517 =
                      match stack with
                      | [] ->
                          (FStar_Errors.log_issue FStar_Range.dummyRange
                             (FStar_Errors.Error_IDETooManyPops,
                               "too many pops");
                           FStar_All.exit Prims.int_one)
                      | hd::tl -> (hd, tl) in
                    match uu____4517 with
                    | ((env1, curmod1), stack1) ->
                        go line_col filename stack1 curmod1 env1 ts))
              | Push (lax, l, c) ->
                  let uu____4586 =
                    if (FStar_List.length stack) = (FStar_List.length ts)
                    then
                      let uu____4628 =
                        update_deps filename curmod stack env ts in
                      (true, uu____4628)
                    else (false, (stack, env, ts)) in
                  (match uu____4586 with
                   | (restore_cmd_line_options, (stack1, env1, ts1)) ->
                       let stack2 = (env1, curmod) :: stack1 in
                       let env2 =
                         push_with_kind env1 lax restore_cmd_line_options
                           "#push" in
                       go (l, c) filename stack2 curmod env2 ts1)
              | Code (text, (ok, fail)) ->
                  let fail1 curmod1 tcenv =
                    report_fail ();
                    FStar_Util.print1 "%s\n" fail;
                    go line_col filename stack curmod1 tcenv ts in
                  let frag =
                    {
                      FStar_Parser_ParseIt.frag_fname = "<input>";
                      FStar_Parser_ParseIt.frag_text = text;
                      FStar_Parser_ParseIt.frag_line =
                        (FStar_Pervasives_Native.fst line_col);
                      FStar_Parser_ParseIt.frag_col =
                        (FStar_Pervasives_Native.snd line_col)
                    } in
                  let res = check_frag env curmod frag in
                  (match res with
                   | FStar_Pervasives_Native.Some (curmod1, env1, n_errs) ->
                       if n_errs = Prims.int_zero
                       then
                         (FStar_Util.print1 "\n%s\n" ok;
                          go line_col filename stack curmod1 env1 ts)
                       else fail1 curmod1 env1
                   | uu____4752 -> fail1 curmod env)
let (interactive_mode : Prims.string -> unit) =
  fun filename ->
    (let uu____4773 =
       let uu____4775 = FStar_Options.codegen () in
       FStar_Option.isSome uu____4775 in
     if uu____4773
     then
       FStar_Errors.log_issue FStar_Range.dummyRange
         (FStar_Errors.Warning_IDEIgnoreCodeGen,
           "code-generation is not supported in interactive mode, ignoring the codegen flag")
     else ());
    (let uu____4783 = deps_of_our_file filename in
     match uu____4783 with
     | (filenames, maybe_intf, dep_graph) ->
         let env = FStar_Universal.init_env dep_graph in
         let uu____4812 =
           tc_deps FStar_Pervasives_Native.None [] env filenames [] in
         (match uu____4812 with
          | (stack, env1, ts) ->
              let initial_range =
                let uu____4841 =
                  FStar_Range.mk_pos Prims.int_one Prims.int_zero in
                let uu____4844 =
                  FStar_Range.mk_pos Prims.int_one Prims.int_zero in
                FStar_Range.mk_range filename uu____4841 uu____4844 in
              let env2 = FStar_TypeChecker_Env.set_range env1 initial_range in
              let env3 =
                match maybe_intf with
                | FStar_Pervasives_Native.Some intf ->
                    FStar_Universal.load_interface_decls env2 intf
                | FStar_Pervasives_Native.None -> env2 in
              let uu____4853 =
                (FStar_Options.record_hints ()) ||
                  (FStar_Options.use_hints ()) in
              if uu____4853
              then
                let uu____4856 =
                  let uu____4858 = FStar_Options.file_list () in
                  FStar_List.hd uu____4858 in
                FStar_SMTEncoding_Solver.with_hints_db uu____4856
                  (fun uu____4864 ->
                     go (Prims.int_one, Prims.int_zero) filename stack
                       FStar_Pervasives_Native.None env3 ts)
              else
                go (Prims.int_one, Prims.int_zero) filename stack
                  FStar_Pervasives_Native.None env3 ts))