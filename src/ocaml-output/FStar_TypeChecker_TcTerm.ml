open Prims
let (instantiate_both :
  FStar_TypeChecker_Env.env -> FStar_TypeChecker_Env.env) =
  fun env  ->
    let uu___332_6 = env  in
    {
      FStar_TypeChecker_Env.solver =
        (uu___332_6.FStar_TypeChecker_Env.solver);
      FStar_TypeChecker_Env.range = (uu___332_6.FStar_TypeChecker_Env.range);
      FStar_TypeChecker_Env.curmodule =
        (uu___332_6.FStar_TypeChecker_Env.curmodule);
      FStar_TypeChecker_Env.gamma = (uu___332_6.FStar_TypeChecker_Env.gamma);
      FStar_TypeChecker_Env.gamma_sig =
        (uu___332_6.FStar_TypeChecker_Env.gamma_sig);
      FStar_TypeChecker_Env.gamma_cache =
        (uu___332_6.FStar_TypeChecker_Env.gamma_cache);
      FStar_TypeChecker_Env.modules =
        (uu___332_6.FStar_TypeChecker_Env.modules);
      FStar_TypeChecker_Env.expected_typ =
        (uu___332_6.FStar_TypeChecker_Env.expected_typ);
      FStar_TypeChecker_Env.sigtab =
        (uu___332_6.FStar_TypeChecker_Env.sigtab);
      FStar_TypeChecker_Env.is_pattern =
        (uu___332_6.FStar_TypeChecker_Env.is_pattern);
      FStar_TypeChecker_Env.instantiate_imp = true;
      FStar_TypeChecker_Env.effects =
        (uu___332_6.FStar_TypeChecker_Env.effects);
      FStar_TypeChecker_Env.generalize =
        (uu___332_6.FStar_TypeChecker_Env.generalize);
      FStar_TypeChecker_Env.letrecs =
        (uu___332_6.FStar_TypeChecker_Env.letrecs);
      FStar_TypeChecker_Env.top_level =
        (uu___332_6.FStar_TypeChecker_Env.top_level);
      FStar_TypeChecker_Env.check_uvars =
        (uu___332_6.FStar_TypeChecker_Env.check_uvars);
      FStar_TypeChecker_Env.use_eq =
        (uu___332_6.FStar_TypeChecker_Env.use_eq);
      FStar_TypeChecker_Env.is_iface =
        (uu___332_6.FStar_TypeChecker_Env.is_iface);
      FStar_TypeChecker_Env.admit = (uu___332_6.FStar_TypeChecker_Env.admit);
      FStar_TypeChecker_Env.lax = (uu___332_6.FStar_TypeChecker_Env.lax);
      FStar_TypeChecker_Env.lax_universes =
        (uu___332_6.FStar_TypeChecker_Env.lax_universes);
      FStar_TypeChecker_Env.phase1 =
        (uu___332_6.FStar_TypeChecker_Env.phase1);
      FStar_TypeChecker_Env.failhard =
        (uu___332_6.FStar_TypeChecker_Env.failhard);
      FStar_TypeChecker_Env.nosynth =
        (uu___332_6.FStar_TypeChecker_Env.nosynth);
      FStar_TypeChecker_Env.uvar_subtyping =
        (uu___332_6.FStar_TypeChecker_Env.uvar_subtyping);
      FStar_TypeChecker_Env.tc_term =
        (uu___332_6.FStar_TypeChecker_Env.tc_term);
      FStar_TypeChecker_Env.type_of =
        (uu___332_6.FStar_TypeChecker_Env.type_of);
      FStar_TypeChecker_Env.universe_of =
        (uu___332_6.FStar_TypeChecker_Env.universe_of);
      FStar_TypeChecker_Env.check_type_of =
        (uu___332_6.FStar_TypeChecker_Env.check_type_of);
      FStar_TypeChecker_Env.use_bv_sorts =
        (uu___332_6.FStar_TypeChecker_Env.use_bv_sorts);
      FStar_TypeChecker_Env.qtbl_name_and_index =
        (uu___332_6.FStar_TypeChecker_Env.qtbl_name_and_index);
      FStar_TypeChecker_Env.normalized_eff_names =
        (uu___332_6.FStar_TypeChecker_Env.normalized_eff_names);
      FStar_TypeChecker_Env.proof_ns =
        (uu___332_6.FStar_TypeChecker_Env.proof_ns);
      FStar_TypeChecker_Env.synth_hook =
        (uu___332_6.FStar_TypeChecker_Env.synth_hook);
      FStar_TypeChecker_Env.splice =
        (uu___332_6.FStar_TypeChecker_Env.splice);
      FStar_TypeChecker_Env.is_native_tactic =
        (uu___332_6.FStar_TypeChecker_Env.is_native_tactic);
      FStar_TypeChecker_Env.identifier_info =
        (uu___332_6.FStar_TypeChecker_Env.identifier_info);
      FStar_TypeChecker_Env.tc_hooks =
        (uu___332_6.FStar_TypeChecker_Env.tc_hooks);
      FStar_TypeChecker_Env.dsenv = (uu___332_6.FStar_TypeChecker_Env.dsenv);
      FStar_TypeChecker_Env.dep_graph =
        (uu___332_6.FStar_TypeChecker_Env.dep_graph)
    }
  
let (no_inst : FStar_TypeChecker_Env.env -> FStar_TypeChecker_Env.env) =
  fun env  ->
    let uu___333_12 = env  in
    {
      FStar_TypeChecker_Env.solver =
        (uu___333_12.FStar_TypeChecker_Env.solver);
      FStar_TypeChecker_Env.range = (uu___333_12.FStar_TypeChecker_Env.range);
      FStar_TypeChecker_Env.curmodule =
        (uu___333_12.FStar_TypeChecker_Env.curmodule);
      FStar_TypeChecker_Env.gamma = (uu___333_12.FStar_TypeChecker_Env.gamma);
      FStar_TypeChecker_Env.gamma_sig =
        (uu___333_12.FStar_TypeChecker_Env.gamma_sig);
      FStar_TypeChecker_Env.gamma_cache =
        (uu___333_12.FStar_TypeChecker_Env.gamma_cache);
      FStar_TypeChecker_Env.modules =
        (uu___333_12.FStar_TypeChecker_Env.modules);
      FStar_TypeChecker_Env.expected_typ =
        (uu___333_12.FStar_TypeChecker_Env.expected_typ);
      FStar_TypeChecker_Env.sigtab =
        (uu___333_12.FStar_TypeChecker_Env.sigtab);
      FStar_TypeChecker_Env.is_pattern =
        (uu___333_12.FStar_TypeChecker_Env.is_pattern);
      FStar_TypeChecker_Env.instantiate_imp = false;
      FStar_TypeChecker_Env.effects =
        (uu___333_12.FStar_TypeChecker_Env.effects);
      FStar_TypeChecker_Env.generalize =
        (uu___333_12.FStar_TypeChecker_Env.generalize);
      FStar_TypeChecker_Env.letrecs =
        (uu___333_12.FStar_TypeChecker_Env.letrecs);
      FStar_TypeChecker_Env.top_level =
        (uu___333_12.FStar_TypeChecker_Env.top_level);
      FStar_TypeChecker_Env.check_uvars =
        (uu___333_12.FStar_TypeChecker_Env.check_uvars);
      FStar_TypeChecker_Env.use_eq =
        (uu___333_12.FStar_TypeChecker_Env.use_eq);
      FStar_TypeChecker_Env.is_iface =
        (uu___333_12.FStar_TypeChecker_Env.is_iface);
      FStar_TypeChecker_Env.admit = (uu___333_12.FStar_TypeChecker_Env.admit);
      FStar_TypeChecker_Env.lax = (uu___333_12.FStar_TypeChecker_Env.lax);
      FStar_TypeChecker_Env.lax_universes =
        (uu___333_12.FStar_TypeChecker_Env.lax_universes);
      FStar_TypeChecker_Env.phase1 =
        (uu___333_12.FStar_TypeChecker_Env.phase1);
      FStar_TypeChecker_Env.failhard =
        (uu___333_12.FStar_TypeChecker_Env.failhard);
      FStar_TypeChecker_Env.nosynth =
        (uu___333_12.FStar_TypeChecker_Env.nosynth);
      FStar_TypeChecker_Env.uvar_subtyping =
        (uu___333_12.FStar_TypeChecker_Env.uvar_subtyping);
      FStar_TypeChecker_Env.tc_term =
        (uu___333_12.FStar_TypeChecker_Env.tc_term);
      FStar_TypeChecker_Env.type_of =
        (uu___333_12.FStar_TypeChecker_Env.type_of);
      FStar_TypeChecker_Env.universe_of =
        (uu___333_12.FStar_TypeChecker_Env.universe_of);
      FStar_TypeChecker_Env.check_type_of =
        (uu___333_12.FStar_TypeChecker_Env.check_type_of);
      FStar_TypeChecker_Env.use_bv_sorts =
        (uu___333_12.FStar_TypeChecker_Env.use_bv_sorts);
      FStar_TypeChecker_Env.qtbl_name_and_index =
        (uu___333_12.FStar_TypeChecker_Env.qtbl_name_and_index);
      FStar_TypeChecker_Env.normalized_eff_names =
        (uu___333_12.FStar_TypeChecker_Env.normalized_eff_names);
      FStar_TypeChecker_Env.proof_ns =
        (uu___333_12.FStar_TypeChecker_Env.proof_ns);
      FStar_TypeChecker_Env.synth_hook =
        (uu___333_12.FStar_TypeChecker_Env.synth_hook);
      FStar_TypeChecker_Env.splice =
        (uu___333_12.FStar_TypeChecker_Env.splice);
      FStar_TypeChecker_Env.is_native_tactic =
        (uu___333_12.FStar_TypeChecker_Env.is_native_tactic);
      FStar_TypeChecker_Env.identifier_info =
        (uu___333_12.FStar_TypeChecker_Env.identifier_info);
      FStar_TypeChecker_Env.tc_hooks =
        (uu___333_12.FStar_TypeChecker_Env.tc_hooks);
      FStar_TypeChecker_Env.dsenv = (uu___333_12.FStar_TypeChecker_Env.dsenv);
      FStar_TypeChecker_Env.dep_graph =
        (uu___333_12.FStar_TypeChecker_Env.dep_graph)
    }
  
let (mk_lex_list :
  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax Prims.list ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun vs  ->
    FStar_List.fold_right
      (fun v1  ->
         fun tl1  ->
           let r =
             if tl1.FStar_Syntax_Syntax.pos = FStar_Range.dummyRange
             then v1.FStar_Syntax_Syntax.pos
             else
               FStar_Range.union_ranges v1.FStar_Syntax_Syntax.pos
                 tl1.FStar_Syntax_Syntax.pos
              in
           let uu____46 =
             let uu____51 =
               let uu____52 = FStar_Syntax_Syntax.as_arg v1  in
               let uu____59 =
                 let uu____68 = FStar_Syntax_Syntax.as_arg tl1  in [uu____68]
                  in
               uu____52 :: uu____59  in
             FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.lex_pair
               uu____51
              in
           uu____46 FStar_Pervasives_Native.None r) vs
      FStar_Syntax_Util.lex_top
  
let (is_eq :
  FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option ->
    Prims.bool)
  =
  fun uu___326_101  ->
    match uu___326_101 with
    | FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Equality ) -> true
    | uu____104 -> false
  
let steps :
  'Auu____111 . 'Auu____111 -> FStar_TypeChecker_Normalize.step Prims.list =
  fun env  ->
    [FStar_TypeChecker_Normalize.Beta;
    FStar_TypeChecker_Normalize.Eager_unfolding;
    FStar_TypeChecker_Normalize.NoFullNorm]
  
let (norm :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  -> FStar_TypeChecker_Normalize.normalize (steps env) env t
  
let (norm_c :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun c  -> FStar_TypeChecker_Normalize.normalize_comp (steps env) env c
  
let (check_no_escape :
  FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.bv Prims.list ->
        FStar_Syntax_Syntax.term ->
          (FStar_Syntax_Syntax.term,FStar_TypeChecker_Env.guard_t)
            FStar_Pervasives_Native.tuple2)
  =
  fun head_opt  ->
    fun env  ->
      fun fvs  ->
        fun kt  ->
          let rec aux try_norm t =
            match fvs with
            | [] -> (t, FStar_TypeChecker_Env.trivial_guard)
            | uu____194 ->
                let t1 = if try_norm then norm env t else t  in
                let fvs' = FStar_Syntax_Free.names t1  in
                let uu____206 =
                  FStar_List.tryFind (fun x  -> FStar_Util.set_mem x fvs')
                    fvs
                   in
                (match uu____206 with
                 | FStar_Pervasives_Native.None  ->
                     (t1, FStar_TypeChecker_Env.trivial_guard)
                 | FStar_Pervasives_Native.Some x ->
                     if Prims.op_Negation try_norm
                     then aux true t1
                     else
                       (let fail1 uu____230 =
                          let msg =
                            match head_opt with
                            | FStar_Pervasives_Native.None  ->
                                let uu____232 =
                                  FStar_Syntax_Print.bv_to_string x  in
                                FStar_Util.format1
                                  "Bound variables '%s' escapes; add a type annotation"
                                  uu____232
                            | FStar_Pervasives_Native.Some head1 ->
                                let uu____234 =
                                  FStar_Syntax_Print.bv_to_string x  in
                                let uu____235 =
                                  FStar_TypeChecker_Normalize.term_to_string
                                    env head1
                                   in
                                FStar_Util.format2
                                  "Bound variables '%s' in the type of '%s' escape because of impure applications; add explicit let-bindings"
                                  uu____234 uu____235
                             in
                          let uu____236 = FStar_TypeChecker_Env.get_range env
                             in
                          FStar_Errors.raise_error
                            (FStar_Errors.Fatal_EscapedBoundVar, msg)
                            uu____236
                           in
                        let uu____241 =
                          let uu____254 = FStar_TypeChecker_Env.get_range env
                             in
                          let uu____255 =
                            let uu____256 = FStar_Syntax_Util.type_u ()  in
                            FStar_All.pipe_left FStar_Pervasives_Native.fst
                              uu____256
                             in
                          FStar_TypeChecker_Util.new_implicit_var "no escape"
                            uu____254 env uu____255
                           in
                        match uu____241 with
                        | (s,uu____270,g0) ->
                            let uu____284 =
                              FStar_TypeChecker_Rel.try_teq true env t1 s  in
                            (match uu____284 with
                             | FStar_Pervasives_Native.Some g ->
                                 let g1 =
                                   let uu____293 =
                                     FStar_TypeChecker_Env.conj_guard g g0
                                      in
                                   FStar_TypeChecker_Rel.solve_deferred_constraints
                                     env uu____293
                                    in
                                 (s, g1)
                             | uu____294 -> fail1 ())))
             in
          aux false kt
  
let push_binding :
  'Auu____303 .
    FStar_TypeChecker_Env.env ->
      (FStar_Syntax_Syntax.bv,'Auu____303) FStar_Pervasives_Native.tuple2 ->
        FStar_TypeChecker_Env.env
  =
  fun env  ->
    fun b  ->
      FStar_TypeChecker_Env.push_bv env (FStar_Pervasives_Native.fst b)
  
let (maybe_extend_subst :
  FStar_Syntax_Syntax.subst_elt Prims.list ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.subst_t)
  =
  fun s  ->
    fun b  ->
      fun v1  ->
        let uu____353 = FStar_Syntax_Syntax.is_null_binder b  in
        if uu____353
        then s
        else (FStar_Syntax_Syntax.NT ((FStar_Pervasives_Native.fst b), v1))
          :: s
  
let (set_lcomp_result :
  FStar_Syntax_Syntax.lcomp ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.lcomp)
  =
  fun lc  ->
    fun t  ->
      FStar_Syntax_Syntax.mk_lcomp lc.FStar_Syntax_Syntax.eff_name t
        lc.FStar_Syntax_Syntax.cflags
        (fun uu____373  ->
           let uu____374 = FStar_Syntax_Syntax.lcomp_comp lc  in
           FStar_Syntax_Util.set_result_typ uu____374 t)
  
let (memo_tk :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  = fun e  -> fun t  -> e 
let (value_check_expected_typ :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.lcomp) FStar_Util.either
        ->
        FStar_TypeChecker_Env.guard_t ->
          (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
            FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      fun tlc  ->
        fun guard  ->
          FStar_TypeChecker_Env.def_check_guard_wf e.FStar_Syntax_Syntax.pos
            "value_check_expected_typ" env guard;
          (let lc =
             match tlc with
             | FStar_Util.Inl t ->
                 let uu____430 = FStar_Syntax_Syntax.mk_Total t  in
                 FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp
                   uu____430
             | FStar_Util.Inr lc -> lc  in
           let t = lc.FStar_Syntax_Syntax.res_typ  in
           let uu____433 =
             let uu____440 = FStar_TypeChecker_Env.expected_typ env  in
             match uu____440 with
             | FStar_Pervasives_Native.None  -> ((memo_tk e t), lc, guard)
             | FStar_Pervasives_Native.Some t' ->
                 let uu____450 =
                   FStar_TypeChecker_Util.maybe_coerce_bool_to_type env e lc
                     t'
                    in
                 (match uu____450 with
                  | (e1,lc1) ->
                      let t1 = lc1.FStar_Syntax_Syntax.res_typ  in
                      let uu____464 =
                        FStar_TypeChecker_Util.check_and_ascribe env e1 t1 t'
                         in
                      (match uu____464 with
                       | (e2,g) ->
                           ((let uu____478 =
                               FStar_TypeChecker_Env.debug env
                                 FStar_Options.High
                                in
                             if uu____478
                             then
                               let uu____479 =
                                 FStar_Syntax_Print.term_to_string t1  in
                               let uu____480 =
                                 FStar_Syntax_Print.term_to_string t'  in
                               let uu____481 =
                                 FStar_TypeChecker_Rel.guard_to_string env g
                                  in
                               let uu____482 =
                                 FStar_TypeChecker_Rel.guard_to_string env
                                   guard
                                  in
                               FStar_Util.print4
                                 "check_and_ascribe: type is %s<:%s \tguard is %s, %s\n"
                                 uu____479 uu____480 uu____481 uu____482
                             else ());
                            (let msg =
                               let uu____490 =
                                 FStar_TypeChecker_Env.is_trivial_guard_formula
                                   g
                                  in
                               if uu____490
                               then FStar_Pervasives_Native.None
                               else
                                 FStar_All.pipe_left
                                   (fun _0_16  ->
                                      FStar_Pervasives_Native.Some _0_16)
                                   (FStar_TypeChecker_Err.subtyping_failed
                                      env t1 t')
                                in
                             let g1 =
                               FStar_TypeChecker_Env.conj_guard g guard  in
                             let uu____512 =
                               FStar_TypeChecker_Util.strengthen_precondition
                                 msg env e2 lc1 g1
                                in
                             match uu____512 with
                             | (lc2,g2) ->
                                 let uu____525 = set_lcomp_result lc2 t'  in
                                 ((memo_tk e2 t'), uu____525, g2)))))
              in
           match uu____433 with | (e1,lc1,g) -> (e1, lc1, g))
  
let (comp_check_expected_typ :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.lcomp ->
        (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
          FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        let uu____562 = FStar_TypeChecker_Env.expected_typ env  in
        match uu____562 with
        | FStar_Pervasives_Native.None  ->
            (e, lc, FStar_TypeChecker_Env.trivial_guard)
        | FStar_Pervasives_Native.Some t ->
            let uu____572 =
              FStar_TypeChecker_Util.maybe_coerce_bool_to_type env e lc t  in
            (match uu____572 with
             | (e1,lc1) ->
                 FStar_TypeChecker_Util.weaken_result_typ env e1 lc1 t)
  
let (check_expected_effect :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp FStar_Pervasives_Native.option ->
      (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.comp)
        FStar_Pervasives_Native.tuple2 ->
        (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.comp,FStar_TypeChecker_Env.guard_t)
          FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun copt  ->
      fun ec  ->
        let uu____624 = ec  in
        match uu____624 with
        | (e,c) ->
            let tot_or_gtot c1 =
              let uu____647 = FStar_Syntax_Util.is_pure_comp c1  in
              if uu____647
              then
                FStar_Syntax_Syntax.mk_Total
                  (FStar_Syntax_Util.comp_result c1)
              else
                (let uu____649 = FStar_Syntax_Util.is_pure_or_ghost_comp c1
                    in
                 if uu____649
                 then
                   FStar_Syntax_Syntax.mk_GTotal
                     (FStar_Syntax_Util.comp_result c1)
                 else failwith "Impossible: Expected pure_or_ghost comp")
               in
            let uu____651 =
              match copt with
              | FStar_Pervasives_Native.Some uu____664 -> (copt, c)
              | FStar_Pervasives_Native.None  ->
                  let uu____667 =
                    ((FStar_Options.ml_ish ()) &&
                       (FStar_Ident.lid_equals
                          FStar_Parser_Const.effect_ALL_lid
                          (FStar_Syntax_Util.comp_effect_name c)))
                      ||
                      (((FStar_Options.ml_ish ()) &&
                          env.FStar_TypeChecker_Env.lax)
                         &&
                         (let uu____669 =
                            FStar_Syntax_Util.is_pure_or_ghost_comp c  in
                          Prims.op_Negation uu____669))
                     in
                  if uu____667
                  then
                    let uu____676 =
                      let uu____679 =
                        FStar_Syntax_Util.ml_comp
                          (FStar_Syntax_Util.comp_result c)
                          e.FStar_Syntax_Syntax.pos
                         in
                      FStar_Pervasives_Native.Some uu____679  in
                    (uu____676, c)
                  else
                    (let uu____683 = FStar_Syntax_Util.is_tot_or_gtot_comp c
                        in
                     if uu____683
                     then
                       let uu____690 = tot_or_gtot c  in
                       (FStar_Pervasives_Native.None, uu____690)
                     else
                       (let uu____694 =
                          FStar_Syntax_Util.is_pure_or_ghost_comp c  in
                        if uu____694
                        then
                          let uu____701 =
                            let uu____704 = tot_or_gtot c  in
                            FStar_Pervasives_Native.Some uu____704  in
                          (uu____701, c)
                        else (FStar_Pervasives_Native.None, c)))
               in
            (match uu____651 with
             | (expected_c_opt,c1) ->
                 let c2 = norm_c env c1  in
                 (match expected_c_opt with
                  | FStar_Pervasives_Native.None  ->
                      (e, c2, FStar_TypeChecker_Env.trivial_guard)
                  | FStar_Pervasives_Native.Some expected_c ->
                      let c3 =
                        let uu____731 = FStar_Syntax_Util.lcomp_of_comp c2
                           in
                        FStar_TypeChecker_Util.maybe_assume_result_eq_pure_term
                          env e uu____731
                         in
                      let c4 = FStar_Syntax_Syntax.lcomp_comp c3  in
                      ((let uu____734 =
                          FStar_All.pipe_left
                            (FStar_TypeChecker_Env.debug env)
                            FStar_Options.Low
                           in
                        if uu____734
                        then
                          let uu____735 = FStar_Syntax_Print.term_to_string e
                             in
                          let uu____736 =
                            FStar_Syntax_Print.comp_to_string c4  in
                          let uu____737 =
                            FStar_Syntax_Print.comp_to_string expected_c  in
                          FStar_Util.print3
                            "In check_expected_effect, asking rel to solve the problem on e=(%s) and c=(%s) and expected_c=(%s)\n"
                            uu____735 uu____736 uu____737
                        else ());
                       (let uu____739 =
                          FStar_TypeChecker_Util.check_comp env e c4
                            expected_c
                           in
                        match uu____739 with
                        | (e1,uu____753,g) ->
                            let g1 =
                              let uu____756 =
                                FStar_TypeChecker_Env.get_range env  in
                              FStar_TypeChecker_Util.label_guard uu____756
                                "could not prove post-condition" g
                               in
                            ((let uu____758 =
                                FStar_TypeChecker_Env.debug env
                                  FStar_Options.Low
                                 in
                              if uu____758
                              then
                                let uu____759 =
                                  FStar_Range.string_of_range
                                    e1.FStar_Syntax_Syntax.pos
                                   in
                                let uu____760 =
                                  FStar_TypeChecker_Rel.guard_to_string env
                                    g1
                                   in
                                FStar_Util.print2
                                  "(%s) DONE check_expected_effect;\n\tguard is: %s\n"
                                  uu____759 uu____760
                              else ());
                             (let e2 =
                                FStar_TypeChecker_Util.maybe_lift env e1
                                  (FStar_Syntax_Util.comp_effect_name c4)
                                  (FStar_Syntax_Util.comp_effect_name
                                     expected_c)
                                  (FStar_Syntax_Util.comp_result c4)
                                 in
                              (e2, expected_c, g1)))))))
  
let no_logical_guard :
  'Auu____771 'Auu____772 .
    FStar_TypeChecker_Env.env ->
      ('Auu____771,'Auu____772,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple3 ->
        ('Auu____771,'Auu____772,FStar_TypeChecker_Env.guard_t)
          FStar_Pervasives_Native.tuple3
  =
  fun env  ->
    fun uu____794  ->
      match uu____794 with
      | (te,kt,f) ->
          let uu____804 = FStar_TypeChecker_Env.guard_form f  in
          (match uu____804 with
           | FStar_TypeChecker_Common.Trivial  -> (te, kt, f)
           | FStar_TypeChecker_Common.NonTrivial f1 ->
               let uu____812 =
                 FStar_TypeChecker_Err.unexpected_non_trivial_precondition_on_term
                   env f1
                  in
               let uu____817 = FStar_TypeChecker_Env.get_range env  in
               FStar_Errors.raise_error uu____812 uu____817)
  
let (print_expected_ty : FStar_TypeChecker_Env.env -> unit) =
  fun env  ->
    let uu____829 = FStar_TypeChecker_Env.expected_typ env  in
    match uu____829 with
    | FStar_Pervasives_Native.None  ->
        FStar_Util.print_string "Expected type is None\n"
    | FStar_Pervasives_Native.Some t ->
        let uu____833 = FStar_Syntax_Print.term_to_string t  in
        FStar_Util.print1 "Expected type is %s" uu____833
  
let rec (get_pat_vars' :
  FStar_Syntax_Syntax.bv Prims.list ->
    Prims.bool ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.bv FStar_Util.set)
  =
  fun all  ->
    fun andlist  ->
      fun pats  ->
        let pats1 = FStar_Syntax_Util.unmeta pats  in
        let uu____870 = FStar_Syntax_Util.head_and_args pats1  in
        match uu____870 with
        | (head1,args) ->
            let uu____909 =
              let uu____924 =
                let uu____925 = FStar_Syntax_Util.un_uinst head1  in
                uu____925.FStar_Syntax_Syntax.n  in
              (uu____924, args)  in
            (match uu____909 with
             | (FStar_Syntax_Syntax.Tm_fvar fv,uu____941) when
                 FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.nil_lid
                 ->
                 if andlist
                 then FStar_Util.as_set all FStar_Syntax_Syntax.order_bv
                 else FStar_Util.new_set FStar_Syntax_Syntax.order_bv
             | (FStar_Syntax_Syntax.Tm_fvar
                fv,(uu____966,FStar_Pervasives_Native.Some
                    (FStar_Syntax_Syntax.Implicit uu____967))::(hd1,FStar_Pervasives_Native.None
                                                                )::(tl1,FStar_Pervasives_Native.None
                                                                    )::[])
                 when
                 FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.cons_lid
                 ->
                 let hdvs = get_pat_vars' all false hd1  in
                 let tlvs = get_pat_vars' all andlist tl1  in
                 if andlist
                 then FStar_Util.set_intersect hdvs tlvs
                 else FStar_Util.set_union hdvs tlvs
             | (FStar_Syntax_Syntax.Tm_fvar
                fv,(uu____1040,FStar_Pervasives_Native.Some
                    (FStar_Syntax_Syntax.Implicit uu____1041))::(pat,FStar_Pervasives_Native.None
                                                                 )::[])
                 when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.smtpat_lid
                 -> FStar_Syntax_Free.names pat
             | (FStar_Syntax_Syntax.Tm_fvar
                fv,(subpats,FStar_Pervasives_Native.None )::[]) when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.smtpatOr_lid
                 -> get_pat_vars' all true subpats
             | uu____1123 -> FStar_Util.new_set FStar_Syntax_Syntax.order_bv)

and (get_pat_vars :
  FStar_Syntax_Syntax.bv Prims.list ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.bv FStar_Util.set)
  = fun all  -> fun pats  -> get_pat_vars' all false pats

let check_pat_fvs :
  'Auu____1152 .
    FStar_Range.range ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.term ->
          (FStar_Syntax_Syntax.bv,'Auu____1152)
            FStar_Pervasives_Native.tuple2 Prims.list -> unit
  =
  fun rng  ->
    fun env  ->
      fun pats  ->
        fun bs  ->
          let pat_vars =
            let uu____1188 = FStar_List.map FStar_Pervasives_Native.fst bs
               in
            let uu____1195 =
              FStar_TypeChecker_Normalize.normalize
                [FStar_TypeChecker_Normalize.Beta] env pats
               in
            get_pat_vars uu____1188 uu____1195  in
          let uu____1196 =
            FStar_All.pipe_right bs
              (FStar_Util.find_opt
                 (fun uu____1223  ->
                    match uu____1223 with
                    | (b,uu____1229) ->
                        let uu____1230 = FStar_Util.set_mem b pat_vars  in
                        Prims.op_Negation uu____1230))
             in
          match uu____1196 with
          | FStar_Pervasives_Native.None  -> ()
          | FStar_Pervasives_Native.Some (x,uu____1236) ->
              let uu____1241 =
                let uu____1246 =
                  let uu____1247 = FStar_Syntax_Print.bv_to_string x  in
                  FStar_Util.format1
                    "Pattern misses at least one bound variable: %s"
                    uu____1247
                   in
                (FStar_Errors.Warning_PatternMissingBoundVar, uu____1246)  in
              FStar_Errors.log_issue rng uu____1241
  
let check_smt_pat :
  'Auu____1258 .
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        (FStar_Syntax_Syntax.bv,'Auu____1258) FStar_Pervasives_Native.tuple2
          Prims.list ->
          FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax -> unit
  =
  fun env  ->
    fun t  ->
      fun bs  ->
        fun c  ->
          let uu____1299 = FStar_Syntax_Util.is_smt_lemma t  in
          if uu____1299
          then
            match c.FStar_Syntax_Syntax.n with
            | FStar_Syntax_Syntax.Comp
                { FStar_Syntax_Syntax.comp_univs = uu____1300;
                  FStar_Syntax_Syntax.effect_name = uu____1301;
                  FStar_Syntax_Syntax.result_typ = uu____1302;
                  FStar_Syntax_Syntax.effect_args =
                    _pre::_post::(pats,uu____1306)::[];
                  FStar_Syntax_Syntax.flags = uu____1307;_}
                -> check_pat_fvs t.FStar_Syntax_Syntax.pos env pats bs
            | uu____1352 -> failwith "Impossible"
          else ()
  
let (guard_letrecs :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders ->
      FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax ->
        (FStar_Syntax_Syntax.lbname,FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.univ_names)
          FStar_Pervasives_Native.tuple3 Prims.list)
  =
  fun env  ->
    fun actuals  ->
      fun expected_c  ->
        match env.FStar_TypeChecker_Env.letrecs with
        | [] -> []
        | letrecs ->
            let r = FStar_TypeChecker_Env.get_range env  in
            let env1 =
              let uu___334_1412 = env  in
              {
                FStar_TypeChecker_Env.solver =
                  (uu___334_1412.FStar_TypeChecker_Env.solver);
                FStar_TypeChecker_Env.range =
                  (uu___334_1412.FStar_TypeChecker_Env.range);
                FStar_TypeChecker_Env.curmodule =
                  (uu___334_1412.FStar_TypeChecker_Env.curmodule);
                FStar_TypeChecker_Env.gamma =
                  (uu___334_1412.FStar_TypeChecker_Env.gamma);
                FStar_TypeChecker_Env.gamma_sig =
                  (uu___334_1412.FStar_TypeChecker_Env.gamma_sig);
                FStar_TypeChecker_Env.gamma_cache =
                  (uu___334_1412.FStar_TypeChecker_Env.gamma_cache);
                FStar_TypeChecker_Env.modules =
                  (uu___334_1412.FStar_TypeChecker_Env.modules);
                FStar_TypeChecker_Env.expected_typ =
                  (uu___334_1412.FStar_TypeChecker_Env.expected_typ);
                FStar_TypeChecker_Env.sigtab =
                  (uu___334_1412.FStar_TypeChecker_Env.sigtab);
                FStar_TypeChecker_Env.is_pattern =
                  (uu___334_1412.FStar_TypeChecker_Env.is_pattern);
                FStar_TypeChecker_Env.instantiate_imp =
                  (uu___334_1412.FStar_TypeChecker_Env.instantiate_imp);
                FStar_TypeChecker_Env.effects =
                  (uu___334_1412.FStar_TypeChecker_Env.effects);
                FStar_TypeChecker_Env.generalize =
                  (uu___334_1412.FStar_TypeChecker_Env.generalize);
                FStar_TypeChecker_Env.letrecs = [];
                FStar_TypeChecker_Env.top_level =
                  (uu___334_1412.FStar_TypeChecker_Env.top_level);
                FStar_TypeChecker_Env.check_uvars =
                  (uu___334_1412.FStar_TypeChecker_Env.check_uvars);
                FStar_TypeChecker_Env.use_eq =
                  (uu___334_1412.FStar_TypeChecker_Env.use_eq);
                FStar_TypeChecker_Env.is_iface =
                  (uu___334_1412.FStar_TypeChecker_Env.is_iface);
                FStar_TypeChecker_Env.admit =
                  (uu___334_1412.FStar_TypeChecker_Env.admit);
                FStar_TypeChecker_Env.lax =
                  (uu___334_1412.FStar_TypeChecker_Env.lax);
                FStar_TypeChecker_Env.lax_universes =
                  (uu___334_1412.FStar_TypeChecker_Env.lax_universes);
                FStar_TypeChecker_Env.phase1 =
                  (uu___334_1412.FStar_TypeChecker_Env.phase1);
                FStar_TypeChecker_Env.failhard =
                  (uu___334_1412.FStar_TypeChecker_Env.failhard);
                FStar_TypeChecker_Env.nosynth =
                  (uu___334_1412.FStar_TypeChecker_Env.nosynth);
                FStar_TypeChecker_Env.uvar_subtyping =
                  (uu___334_1412.FStar_TypeChecker_Env.uvar_subtyping);
                FStar_TypeChecker_Env.tc_term =
                  (uu___334_1412.FStar_TypeChecker_Env.tc_term);
                FStar_TypeChecker_Env.type_of =
                  (uu___334_1412.FStar_TypeChecker_Env.type_of);
                FStar_TypeChecker_Env.universe_of =
                  (uu___334_1412.FStar_TypeChecker_Env.universe_of);
                FStar_TypeChecker_Env.check_type_of =
                  (uu___334_1412.FStar_TypeChecker_Env.check_type_of);
                FStar_TypeChecker_Env.use_bv_sorts =
                  (uu___334_1412.FStar_TypeChecker_Env.use_bv_sorts);
                FStar_TypeChecker_Env.qtbl_name_and_index =
                  (uu___334_1412.FStar_TypeChecker_Env.qtbl_name_and_index);
                FStar_TypeChecker_Env.normalized_eff_names =
                  (uu___334_1412.FStar_TypeChecker_Env.normalized_eff_names);
                FStar_TypeChecker_Env.proof_ns =
                  (uu___334_1412.FStar_TypeChecker_Env.proof_ns);
                FStar_TypeChecker_Env.synth_hook =
                  (uu___334_1412.FStar_TypeChecker_Env.synth_hook);
                FStar_TypeChecker_Env.splice =
                  (uu___334_1412.FStar_TypeChecker_Env.splice);
                FStar_TypeChecker_Env.is_native_tactic =
                  (uu___334_1412.FStar_TypeChecker_Env.is_native_tactic);
                FStar_TypeChecker_Env.identifier_info =
                  (uu___334_1412.FStar_TypeChecker_Env.identifier_info);
                FStar_TypeChecker_Env.tc_hooks =
                  (uu___334_1412.FStar_TypeChecker_Env.tc_hooks);
                FStar_TypeChecker_Env.dsenv =
                  (uu___334_1412.FStar_TypeChecker_Env.dsenv);
                FStar_TypeChecker_Env.dep_graph =
                  (uu___334_1412.FStar_TypeChecker_Env.dep_graph)
              }  in
            let precedes =
              FStar_TypeChecker_Util.fvar_const env1
                FStar_Parser_Const.precedes_lid
               in
            let decreases_clause bs c =
              (let uu____1438 =
                 FStar_TypeChecker_Env.debug env1 FStar_Options.Low  in
               if uu____1438
               then
                 let uu____1439 =
                   FStar_Syntax_Print.binders_to_string ", " bs  in
                 let uu____1440 = FStar_Syntax_Print.comp_to_string c  in
                 FStar_Util.print2
                   "Building a decreases clause over (%s) and %s\n"
                   uu____1439 uu____1440
               else ());
              (let filter_types_and_functions bs1 =
                 FStar_All.pipe_right bs1
                   (FStar_List.collect
                      (fun uu____1467  ->
                         match uu____1467 with
                         | (b,uu____1475) ->
                             let t =
                               let uu____1477 =
                                 FStar_Syntax_Util.unrefine
                                   b.FStar_Syntax_Syntax.sort
                                  in
                               FStar_TypeChecker_Normalize.unfold_whnf env1
                                 uu____1477
                                in
                             (match t.FStar_Syntax_Syntax.n with
                              | FStar_Syntax_Syntax.Tm_type uu____1480 -> []
                              | FStar_Syntax_Syntax.Tm_arrow uu____1481 -> []
                              | uu____1494 ->
                                  let uu____1495 =
                                    FStar_Syntax_Syntax.bv_to_name b  in
                                  [uu____1495])))
                  in
               let as_lex_list dec =
                 let uu____1508 = FStar_Syntax_Util.head_and_args dec  in
                 match uu____1508 with
                 | (head1,uu____1526) ->
                     (match head1.FStar_Syntax_Syntax.n with
                      | FStar_Syntax_Syntax.Tm_fvar fv when
                          FStar_Syntax_Syntax.fv_eq_lid fv
                            FStar_Parser_Const.lexcons_lid
                          -> dec
                      | uu____1550 -> mk_lex_list [dec])
                  in
               let cflags = FStar_Syntax_Util.comp_flags c  in
               let uu____1558 =
                 FStar_All.pipe_right cflags
                   (FStar_List.tryFind
                      (fun uu___327_1567  ->
                         match uu___327_1567 with
                         | FStar_Syntax_Syntax.DECREASES uu____1568 -> true
                         | uu____1571 -> false))
                  in
               match uu____1558 with
               | FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.DECREASES
                   dec) -> as_lex_list dec
               | uu____1577 ->
                   let xs =
                     FStar_All.pipe_right bs filter_types_and_functions  in
                   (match xs with | x::[] -> x | uu____1598 -> mk_lex_list xs))
               in
            let previous_dec = decreases_clause actuals expected_c  in
            let guard_one_letrec uu____1627 =
              match uu____1627 with
              | (l,t,u_names) ->
                  let uu____1651 =
                    let uu____1652 = FStar_Syntax_Subst.compress t  in
                    uu____1652.FStar_Syntax_Syntax.n  in
                  (match uu____1651 with
                   | FStar_Syntax_Syntax.Tm_arrow (formals,c) ->
                       let formals1 =
                         FStar_All.pipe_right formals
                           (FStar_List.map
                              (fun uu____1701  ->
                                 match uu____1701 with
                                 | (x,imp) ->
                                     let uu____1712 =
                                       FStar_Syntax_Syntax.is_null_bv x  in
                                     if uu____1712
                                     then
                                       let uu____1717 =
                                         let uu____1718 =
                                           let uu____1721 =
                                             FStar_Syntax_Syntax.range_of_bv
                                               x
                                              in
                                           FStar_Pervasives_Native.Some
                                             uu____1721
                                            in
                                         FStar_Syntax_Syntax.new_bv
                                           uu____1718
                                           x.FStar_Syntax_Syntax.sort
                                          in
                                       (uu____1717, imp)
                                     else (x, imp)))
                          in
                       let uu____1723 =
                         FStar_Syntax_Subst.open_comp formals1 c  in
                       (match uu____1723 with
                        | (formals2,c1) ->
                            let dec = decreases_clause formals2 c1  in
                            let precedes1 =
                              let uu____1744 =
                                let uu____1749 =
                                  let uu____1750 =
                                    FStar_Syntax_Syntax.as_arg dec  in
                                  let uu____1757 =
                                    let uu____1766 =
                                      FStar_Syntax_Syntax.as_arg previous_dec
                                       in
                                    [uu____1766]  in
                                  uu____1750 :: uu____1757  in
                                FStar_Syntax_Syntax.mk_Tm_app precedes
                                  uu____1749
                                 in
                              uu____1744 FStar_Pervasives_Native.None r  in
                            let uu____1793 = FStar_Util.prefix formals2  in
                            (match uu____1793 with
                             | (bs,(last1,imp)) ->
                                 let last2 =
                                   let uu___335_1840 = last1  in
                                   let uu____1841 =
                                     FStar_Syntax_Util.refine last1 precedes1
                                      in
                                   {
                                     FStar_Syntax_Syntax.ppname =
                                       (uu___335_1840.FStar_Syntax_Syntax.ppname);
                                     FStar_Syntax_Syntax.index =
                                       (uu___335_1840.FStar_Syntax_Syntax.index);
                                     FStar_Syntax_Syntax.sort = uu____1841
                                   }  in
                                 let refined_formals =
                                   FStar_List.append bs [(last2, imp)]  in
                                 let t' =
                                   FStar_Syntax_Util.arrow refined_formals c1
                                    in
                                 ((let uu____1867 =
                                     FStar_TypeChecker_Env.debug env1
                                       FStar_Options.Low
                                      in
                                   if uu____1867
                                   then
                                     let uu____1868 =
                                       FStar_Syntax_Print.lbname_to_string l
                                        in
                                     let uu____1869 =
                                       FStar_Syntax_Print.term_to_string t
                                        in
                                     let uu____1870 =
                                       FStar_Syntax_Print.term_to_string t'
                                        in
                                     FStar_Util.print3
                                       "Refined let rec %s\n\tfrom type %s\n\tto type %s\n"
                                       uu____1868 uu____1869 uu____1870
                                   else ());
                                  (l, t', u_names))))
                   | uu____1874 ->
                       FStar_Errors.raise_error
                         (FStar_Errors.Fatal_ExpectedArrowAnnotatedType,
                           "Annotated type of 'let rec' must be an arrow")
                         t.FStar_Syntax_Syntax.pos)
               in
            FStar_All.pipe_right letrecs (FStar_List.map guard_one_letrec)
  
let rec (tc_term :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      let uu____2480 =
        FStar_Util.record_time
          (fun uu____2498  ->
             tc_maybe_toplevel_term
               (let uu___336_2501 = env  in
                {
                  FStar_TypeChecker_Env.solver =
                    (uu___336_2501.FStar_TypeChecker_Env.solver);
                  FStar_TypeChecker_Env.range =
                    (uu___336_2501.FStar_TypeChecker_Env.range);
                  FStar_TypeChecker_Env.curmodule =
                    (uu___336_2501.FStar_TypeChecker_Env.curmodule);
                  FStar_TypeChecker_Env.gamma =
                    (uu___336_2501.FStar_TypeChecker_Env.gamma);
                  FStar_TypeChecker_Env.gamma_sig =
                    (uu___336_2501.FStar_TypeChecker_Env.gamma_sig);
                  FStar_TypeChecker_Env.gamma_cache =
                    (uu___336_2501.FStar_TypeChecker_Env.gamma_cache);
                  FStar_TypeChecker_Env.modules =
                    (uu___336_2501.FStar_TypeChecker_Env.modules);
                  FStar_TypeChecker_Env.expected_typ =
                    (uu___336_2501.FStar_TypeChecker_Env.expected_typ);
                  FStar_TypeChecker_Env.sigtab =
                    (uu___336_2501.FStar_TypeChecker_Env.sigtab);
                  FStar_TypeChecker_Env.is_pattern =
                    (uu___336_2501.FStar_TypeChecker_Env.is_pattern);
                  FStar_TypeChecker_Env.instantiate_imp =
                    (uu___336_2501.FStar_TypeChecker_Env.instantiate_imp);
                  FStar_TypeChecker_Env.effects =
                    (uu___336_2501.FStar_TypeChecker_Env.effects);
                  FStar_TypeChecker_Env.generalize =
                    (uu___336_2501.FStar_TypeChecker_Env.generalize);
                  FStar_TypeChecker_Env.letrecs =
                    (uu___336_2501.FStar_TypeChecker_Env.letrecs);
                  FStar_TypeChecker_Env.top_level = false;
                  FStar_TypeChecker_Env.check_uvars =
                    (uu___336_2501.FStar_TypeChecker_Env.check_uvars);
                  FStar_TypeChecker_Env.use_eq =
                    (uu___336_2501.FStar_TypeChecker_Env.use_eq);
                  FStar_TypeChecker_Env.is_iface =
                    (uu___336_2501.FStar_TypeChecker_Env.is_iface);
                  FStar_TypeChecker_Env.admit =
                    (uu___336_2501.FStar_TypeChecker_Env.admit);
                  FStar_TypeChecker_Env.lax =
                    (uu___336_2501.FStar_TypeChecker_Env.lax);
                  FStar_TypeChecker_Env.lax_universes =
                    (uu___336_2501.FStar_TypeChecker_Env.lax_universes);
                  FStar_TypeChecker_Env.phase1 =
                    (uu___336_2501.FStar_TypeChecker_Env.phase1);
                  FStar_TypeChecker_Env.failhard =
                    (uu___336_2501.FStar_TypeChecker_Env.failhard);
                  FStar_TypeChecker_Env.nosynth =
                    (uu___336_2501.FStar_TypeChecker_Env.nosynth);
                  FStar_TypeChecker_Env.uvar_subtyping =
                    (uu___336_2501.FStar_TypeChecker_Env.uvar_subtyping);
                  FStar_TypeChecker_Env.tc_term =
                    (uu___336_2501.FStar_TypeChecker_Env.tc_term);
                  FStar_TypeChecker_Env.type_of =
                    (uu___336_2501.FStar_TypeChecker_Env.type_of);
                  FStar_TypeChecker_Env.universe_of =
                    (uu___336_2501.FStar_TypeChecker_Env.universe_of);
                  FStar_TypeChecker_Env.check_type_of =
                    (uu___336_2501.FStar_TypeChecker_Env.check_type_of);
                  FStar_TypeChecker_Env.use_bv_sorts =
                    (uu___336_2501.FStar_TypeChecker_Env.use_bv_sorts);
                  FStar_TypeChecker_Env.qtbl_name_and_index =
                    (uu___336_2501.FStar_TypeChecker_Env.qtbl_name_and_index);
                  FStar_TypeChecker_Env.normalized_eff_names =
                    (uu___336_2501.FStar_TypeChecker_Env.normalized_eff_names);
                  FStar_TypeChecker_Env.proof_ns =
                    (uu___336_2501.FStar_TypeChecker_Env.proof_ns);
                  FStar_TypeChecker_Env.synth_hook =
                    (uu___336_2501.FStar_TypeChecker_Env.synth_hook);
                  FStar_TypeChecker_Env.splice =
                    (uu___336_2501.FStar_TypeChecker_Env.splice);
                  FStar_TypeChecker_Env.is_native_tactic =
                    (uu___336_2501.FStar_TypeChecker_Env.is_native_tactic);
                  FStar_TypeChecker_Env.identifier_info =
                    (uu___336_2501.FStar_TypeChecker_Env.identifier_info);
                  FStar_TypeChecker_Env.tc_hooks =
                    (uu___336_2501.FStar_TypeChecker_Env.tc_hooks);
                  FStar_TypeChecker_Env.dsenv =
                    (uu___336_2501.FStar_TypeChecker_Env.dsenv);
                  FStar_TypeChecker_Env.dep_graph =
                    (uu___336_2501.FStar_TypeChecker_Env.dep_graph)
                }) e)
         in
      match uu____2480 with
      | (r,ms) ->
          ((let uu____2523 =
              FStar_TypeChecker_Env.debug env FStar_Options.Medium  in
            if uu____2523
            then
              let uu____2524 =
                let uu____2525 = FStar_TypeChecker_Env.get_range env  in
                FStar_All.pipe_left FStar_Range.string_of_range uu____2525
                 in
              let uu____2526 = FStar_Syntax_Print.term_to_string e  in
              let uu____2527 =
                let uu____2528 = FStar_Syntax_Subst.compress e  in
                FStar_Syntax_Print.tag_of_term uu____2528  in
              let uu____2529 = FStar_Util.string_of_int ms  in
              FStar_Util.print4 "(%s) tc_term of %s (%s) took %sms\n"
                uu____2524 uu____2526 uu____2527 uu____2529
            else ());
           r)

and (tc_maybe_toplevel_term :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      let env1 =
        if e.FStar_Syntax_Syntax.pos = FStar_Range.dummyRange
        then env
        else FStar_TypeChecker_Env.set_range env e.FStar_Syntax_Syntax.pos
         in
      let top = FStar_Syntax_Subst.compress e  in
      (let uu____2543 = FStar_TypeChecker_Env.debug env1 FStar_Options.Low
          in
       if uu____2543
       then
         let uu____2544 =
           let uu____2545 = FStar_TypeChecker_Env.get_range env1  in
           FStar_All.pipe_left FStar_Range.string_of_range uu____2545  in
         let uu____2546 = FStar_Syntax_Print.tag_of_term top  in
         let uu____2547 = FStar_Syntax_Print.term_to_string top  in
         FStar_Util.print3 "Typechecking %s (%s): %s\n" uu____2544 uu____2546
           uu____2547
       else ());
      (match top.FStar_Syntax_Syntax.n with
       | FStar_Syntax_Syntax.Tm_delayed uu____2555 -> failwith "Impossible"
       | FStar_Syntax_Syntax.Tm_uinst uu____2584 -> tc_value env1 e
       | FStar_Syntax_Syntax.Tm_uvar uu____2591 -> tc_value env1 e
       | FStar_Syntax_Syntax.Tm_bvar uu____2604 -> tc_value env1 e
       | FStar_Syntax_Syntax.Tm_name uu____2605 -> tc_value env1 e
       | FStar_Syntax_Syntax.Tm_fvar uu____2606 -> tc_value env1 e
       | FStar_Syntax_Syntax.Tm_constant uu____2607 -> tc_value env1 e
       | FStar_Syntax_Syntax.Tm_abs uu____2608 -> tc_value env1 e
       | FStar_Syntax_Syntax.Tm_arrow uu____2625 -> tc_value env1 e
       | FStar_Syntax_Syntax.Tm_refine uu____2638 -> tc_value env1 e
       | FStar_Syntax_Syntax.Tm_type uu____2645 -> tc_value env1 e
       | FStar_Syntax_Syntax.Tm_unknown  -> tc_value env1 e
       | FStar_Syntax_Syntax.Tm_quoted
           (uu____2646,{
                         FStar_Syntax_Syntax.qkind =
                           FStar_Syntax_Syntax.Quote_static ;
                         FStar_Syntax_Syntax.antiquotes = aqs;_})
           when
           FStar_List.for_all
             (fun uu____2674  ->
                match uu____2674 with
                | (uu____2683,b,uu____2685) -> Prims.op_Negation b) aqs
           ->
           value_check_expected_typ env1 top
             (FStar_Util.Inl FStar_Syntax_Syntax.t_term)
             FStar_TypeChecker_Env.trivial_guard
       | FStar_Syntax_Syntax.Tm_quoted uu____2690 ->
           let c =
             FStar_Syntax_Syntax.mk_Comp
               {
                 FStar_Syntax_Syntax.comp_univs =
                   [FStar_Syntax_Syntax.U_zero];
                 FStar_Syntax_Syntax.effect_name =
                   FStar_Parser_Const.effect_Tac_lid;
                 FStar_Syntax_Syntax.result_typ = FStar_Syntax_Syntax.t_term;
                 FStar_Syntax_Syntax.effect_args = [];
                 FStar_Syntax_Syntax.flags =
                   [FStar_Syntax_Syntax.SOMETRIVIAL;
                   FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
               }
              in
           let uu____2704 =
             let uu____2711 =
               let uu____2716 = FStar_Syntax_Util.lcomp_of_comp c  in
               FStar_Util.Inr uu____2716  in
             value_check_expected_typ env1 top uu____2711
               FStar_TypeChecker_Env.trivial_guard
              in
           (match uu____2704 with
            | (t,lc,g) ->
                let t1 =
                  FStar_Syntax_Syntax.mk
                    (FStar_Syntax_Syntax.Tm_meta
                       (t,
                         (FStar_Syntax_Syntax.Meta_monadic_lift
                            (FStar_Parser_Const.effect_PURE_lid,
                              FStar_Parser_Const.effect_TAC_lid,
                              FStar_Syntax_Syntax.t_term))))
                    FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos
                   in
                (t1, lc, g))
       | FStar_Syntax_Syntax.Tm_lazy i ->
           value_check_expected_typ env1 top
             (FStar_Util.Inl (i.FStar_Syntax_Syntax.typ))
             FStar_TypeChecker_Env.trivial_guard
       | FStar_Syntax_Syntax.Tm_meta
           (e1,FStar_Syntax_Syntax.Meta_desugared
            (FStar_Syntax_Syntax.Meta_smt_pat ))
           ->
           let uu____2739 = tc_tot_or_gtot_term env1 e1  in
           (match uu____2739 with
            | (e2,c,g) ->
                let g1 =
                  let uu___337_2756 = g  in
                  {
                    FStar_TypeChecker_Env.guard_f =
                      FStar_TypeChecker_Common.Trivial;
                    FStar_TypeChecker_Env.deferred =
                      (uu___337_2756.FStar_TypeChecker_Env.deferred);
                    FStar_TypeChecker_Env.univ_ineqs =
                      (uu___337_2756.FStar_TypeChecker_Env.univ_ineqs);
                    FStar_TypeChecker_Env.implicits =
                      (uu___337_2756.FStar_TypeChecker_Env.implicits)
                  }  in
                let uu____2757 =
                  FStar_Syntax_Syntax.mk
                    (FStar_Syntax_Syntax.Tm_meta
                       (e2,
                         (FStar_Syntax_Syntax.Meta_desugared
                            FStar_Syntax_Syntax.Meta_smt_pat)))
                    FStar_Pervasives_Native.None top.FStar_Syntax_Syntax.pos
                   in
                (uu____2757, c, g1))
       | FStar_Syntax_Syntax.Tm_meta
           (e1,FStar_Syntax_Syntax.Meta_pattern pats) ->
           let uu____2776 = FStar_Syntax_Util.type_u ()  in
           (match uu____2776 with
            | (t,u) ->
                let uu____2789 = tc_check_tot_or_gtot_term env1 e1 t  in
                (match uu____2789 with
                 | (e2,c,g) ->
                     let uu____2805 =
                       let uu____2820 =
                         FStar_TypeChecker_Env.clear_expected_typ env1  in
                       match uu____2820 with
                       | (env2,uu____2842) -> tc_pats env2 pats  in
                     (match uu____2805 with
                      | (pats1,g') ->
                          let g'1 =
                            let uu___338_2876 = g'  in
                            {
                              FStar_TypeChecker_Env.guard_f =
                                FStar_TypeChecker_Common.Trivial;
                              FStar_TypeChecker_Env.deferred =
                                (uu___338_2876.FStar_TypeChecker_Env.deferred);
                              FStar_TypeChecker_Env.univ_ineqs =
                                (uu___338_2876.FStar_TypeChecker_Env.univ_ineqs);
                              FStar_TypeChecker_Env.implicits =
                                (uu___338_2876.FStar_TypeChecker_Env.implicits)
                            }  in
                          let uu____2877 =
                            FStar_Syntax_Syntax.mk
                              (FStar_Syntax_Syntax.Tm_meta
                                 (e2,
                                   (FStar_Syntax_Syntax.Meta_pattern pats1)))
                              FStar_Pervasives_Native.None
                              top.FStar_Syntax_Syntax.pos
                             in
                          let uu____2880 =
                            FStar_TypeChecker_Env.conj_guard g g'1  in
                          (uu____2877, c, uu____2880))))
       | FStar_Syntax_Syntax.Tm_meta
           (e1,FStar_Syntax_Syntax.Meta_desugared
            (FStar_Syntax_Syntax.Sequence ))
           ->
           let uu____2886 =
             let uu____2887 = FStar_Syntax_Subst.compress e1  in
             uu____2887.FStar_Syntax_Syntax.n  in
           (match uu____2886 with
            | FStar_Syntax_Syntax.Tm_let
                ((uu____2896,{ FStar_Syntax_Syntax.lbname = x;
                               FStar_Syntax_Syntax.lbunivs = uu____2898;
                               FStar_Syntax_Syntax.lbtyp = uu____2899;
                               FStar_Syntax_Syntax.lbeff = uu____2900;
                               FStar_Syntax_Syntax.lbdef = e11;
                               FStar_Syntax_Syntax.lbattrs = uu____2902;
                               FStar_Syntax_Syntax.lbpos = uu____2903;_}::[]),e2)
                ->
                let uu____2931 =
                  let uu____2938 =
                    FStar_TypeChecker_Env.set_expected_typ env1
                      FStar_Syntax_Syntax.t_unit
                     in
                  tc_term uu____2938 e11  in
                (match uu____2931 with
                 | (e12,c1,g1) ->
                     let uu____2948 = tc_term env1 e2  in
                     (match uu____2948 with
                      | (e21,c2,g2) ->
                          let c =
                            FStar_TypeChecker_Util.maybe_return_e2_and_bind
                              e12.FStar_Syntax_Syntax.pos env1
                              (FStar_Pervasives_Native.Some e12) c1 e21
                              (FStar_Pervasives_Native.None, c2)
                             in
                          let e13 =
                            FStar_TypeChecker_Util.maybe_lift env1 e12
                              c1.FStar_Syntax_Syntax.eff_name
                              c.FStar_Syntax_Syntax.eff_name
                              c1.FStar_Syntax_Syntax.res_typ
                             in
                          let e22 =
                            FStar_TypeChecker_Util.maybe_lift env1 e21
                              c2.FStar_Syntax_Syntax.eff_name
                              c.FStar_Syntax_Syntax.eff_name
                              c2.FStar_Syntax_Syntax.res_typ
                             in
                          let e3 =
                            let uu____2972 =
                              let uu____2979 =
                                let uu____2980 =
                                  let uu____2993 =
                                    let uu____3000 =
                                      let uu____3003 =
                                        FStar_Syntax_Syntax.mk_lb
                                          (x, [],
                                            (c1.FStar_Syntax_Syntax.eff_name),
                                            FStar_Syntax_Syntax.t_unit, e13,
                                            (e13.FStar_Syntax_Syntax.pos))
                                         in
                                      [uu____3003]  in
                                    (false, uu____3000)  in
                                  (uu____2993, e22)  in
                                FStar_Syntax_Syntax.Tm_let uu____2980  in
                              FStar_Syntax_Syntax.mk uu____2979  in
                            uu____2972 FStar_Pervasives_Native.None
                              e1.FStar_Syntax_Syntax.pos
                             in
                          let e4 =
                            FStar_TypeChecker_Util.maybe_monadic env1 e3
                              c.FStar_Syntax_Syntax.eff_name
                              c.FStar_Syntax_Syntax.res_typ
                             in
                          let e5 =
                            FStar_Syntax_Syntax.mk
                              (FStar_Syntax_Syntax.Tm_meta
                                 (e4,
                                   (FStar_Syntax_Syntax.Meta_desugared
                                      FStar_Syntax_Syntax.Sequence)))
                              FStar_Pervasives_Native.None
                              top.FStar_Syntax_Syntax.pos
                             in
                          let uu____3025 =
                            FStar_TypeChecker_Env.conj_guard g1 g2  in
                          (e5, c, uu____3025)))
            | uu____3026 ->
                let uu____3027 = tc_term env1 e1  in
                (match uu____3027 with
                 | (e2,c,g) ->
                     let e3 =
                       FStar_Syntax_Syntax.mk
                         (FStar_Syntax_Syntax.Tm_meta
                            (e2,
                              (FStar_Syntax_Syntax.Meta_desugared
                                 FStar_Syntax_Syntax.Sequence)))
                         FStar_Pervasives_Native.None
                         top.FStar_Syntax_Syntax.pos
                        in
                     (e3, c, g)))
       | FStar_Syntax_Syntax.Tm_meta
           (e1,FStar_Syntax_Syntax.Meta_monadic uu____3049) ->
           tc_term env1 e1
       | FStar_Syntax_Syntax.Tm_meta
           (e1,FStar_Syntax_Syntax.Meta_monadic_lift uu____3061) ->
           tc_term env1 e1
       | FStar_Syntax_Syntax.Tm_meta (e1,m) ->
           let uu____3080 = tc_term env1 e1  in
           (match uu____3080 with
            | (e2,c,g) ->
                let e3 =
                  FStar_Syntax_Syntax.mk
                    (FStar_Syntax_Syntax.Tm_meta (e2, m))
                    FStar_Pervasives_Native.None top.FStar_Syntax_Syntax.pos
                   in
                (e3, c, g))
       | FStar_Syntax_Syntax.Tm_ascribed
           (e1,(FStar_Util.Inr expected_c,topt),uu____3104) ->
           let uu____3151 = FStar_TypeChecker_Env.clear_expected_typ env1  in
           (match uu____3151 with
            | (env0,uu____3165) ->
                let uu____3170 = tc_comp env0 expected_c  in
                (match uu____3170 with
                 | (expected_c1,uu____3184,g) ->
                     let uu____3186 =
                       let uu____3193 =
                         FStar_All.pipe_right
                           (FStar_Syntax_Util.comp_result expected_c1)
                           (FStar_TypeChecker_Env.set_expected_typ env0)
                          in
                       tc_term uu____3193 e1  in
                     (match uu____3186 with
                      | (e2,c',g') ->
                          let uu____3203 =
                            let uu____3210 =
                              let uu____3215 =
                                FStar_Syntax_Syntax.lcomp_comp c'  in
                              (e2, uu____3215)  in
                            check_expected_effect env0
                              (FStar_Pervasives_Native.Some expected_c1)
                              uu____3210
                             in
                          (match uu____3203 with
                           | (e3,expected_c2,g'') ->
                               let topt1 = tc_tactic_opt env0 topt  in
                               let e4 =
                                 FStar_Syntax_Syntax.mk
                                   (FStar_Syntax_Syntax.Tm_ascribed
                                      (e3,
                                        ((FStar_Util.Inr expected_c2), topt1),
                                        (FStar_Pervasives_Native.Some
                                           (FStar_Syntax_Util.comp_effect_name
                                              expected_c2))))
                                   FStar_Pervasives_Native.None
                                   top.FStar_Syntax_Syntax.pos
                                  in
                               let lc =
                                 FStar_Syntax_Util.lcomp_of_comp expected_c2
                                  in
                               let f =
                                 let uu____3269 =
                                   FStar_TypeChecker_Env.conj_guard g' g''
                                    in
                                 FStar_TypeChecker_Env.conj_guard g
                                   uu____3269
                                  in
                               let f1 =
                                 match topt1 with
                                 | FStar_Pervasives_Native.None  -> f
                                 | FStar_Pervasives_Native.Some tactic ->
                                     FStar_TypeChecker_Env.map_guard f
                                       (fun f1  ->
                                          let uu____3275 =
                                            FStar_Syntax_Util.mk_squash
                                              FStar_Syntax_Syntax.U_zero f1
                                             in
                                          FStar_TypeChecker_Common.mk_by_tactic
                                            tactic uu____3275)
                                  in
                               let uu____3276 =
                                 comp_check_expected_typ env1 e4 lc  in
                               (match uu____3276 with
                                | (e5,c,f2) ->
                                    let final_guard =
                                      FStar_TypeChecker_Env.conj_guard f1 f2
                                       in
                                    (e5, c, final_guard))))))
       | FStar_Syntax_Syntax.Tm_ascribed
           (e1,(FStar_Util.Inl t,topt),uu____3296) ->
           let uu____3343 = FStar_Syntax_Util.type_u ()  in
           (match uu____3343 with
            | (k,u) ->
                let uu____3356 = tc_check_tot_or_gtot_term env1 t k  in
                (match uu____3356 with
                 | (t1,uu____3370,f) ->
                     let uu____3372 =
                       let uu____3379 =
                         FStar_TypeChecker_Env.set_expected_typ env1 t1  in
                       tc_term uu____3379 e1  in
                     (match uu____3372 with
                      | (e2,c,g) ->
                          let uu____3389 =
                            let uu____3394 =
                              FStar_TypeChecker_Env.set_range env1
                                t1.FStar_Syntax_Syntax.pos
                               in
                            FStar_TypeChecker_Util.strengthen_precondition
                              (FStar_Pervasives_Native.Some
                                 (fun uu____3399  ->
                                    FStar_Util.return_all
                                      FStar_TypeChecker_Err.ill_kinded_type))
                              uu____3394 e2 c f
                             in
                          (match uu____3389 with
                           | (c1,f1) ->
                               let uu____3408 =
                                 let uu____3415 =
                                   FStar_Syntax_Syntax.mk
                                     (FStar_Syntax_Syntax.Tm_ascribed
                                        (e2,
                                          ((FStar_Util.Inl t1),
                                            FStar_Pervasives_Native.None),
                                          (FStar_Pervasives_Native.Some
                                             (c1.FStar_Syntax_Syntax.eff_name))))
                                     FStar_Pervasives_Native.None
                                     top.FStar_Syntax_Syntax.pos
                                    in
                                 comp_check_expected_typ env1 uu____3415 c1
                                  in
                               (match uu____3408 with
                                | (e3,c2,f2) ->
                                    let uu____3463 =
                                      let uu____3464 =
                                        FStar_TypeChecker_Env.conj_guard g f2
                                         in
                                      FStar_TypeChecker_Env.conj_guard f1
                                        uu____3464
                                       in
                                    (e3, c2, uu____3463))))))
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_range_of );
              FStar_Syntax_Syntax.pos = uu____3465;
              FStar_Syntax_Syntax.vars = uu____3466;_},a::hd1::rest)
           ->
           let rest1 = hd1 :: rest  in
           let uu____3529 = FStar_Syntax_Util.head_and_args top  in
           (match uu____3529 with
            | (unary_op,uu____3551) ->
                let head1 =
                  let uu____3575 =
                    FStar_Range.union_ranges unary_op.FStar_Syntax_Syntax.pos
                      (FStar_Pervasives_Native.fst a).FStar_Syntax_Syntax.pos
                     in
                  FStar_Syntax_Syntax.mk
                    (FStar_Syntax_Syntax.Tm_app (unary_op, [a]))
                    FStar_Pervasives_Native.None uu____3575
                   in
                let t =
                  FStar_Syntax_Syntax.mk
                    (FStar_Syntax_Syntax.Tm_app (head1, rest1))
                    FStar_Pervasives_Native.None top.FStar_Syntax_Syntax.pos
                   in
                tc_term env1 t)
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_reify );
              FStar_Syntax_Syntax.pos = uu____3613;
              FStar_Syntax_Syntax.vars = uu____3614;_},a::hd1::rest)
           ->
           let rest1 = hd1 :: rest  in
           let uu____3677 = FStar_Syntax_Util.head_and_args top  in
           (match uu____3677 with
            | (unary_op,uu____3699) ->
                let head1 =
                  let uu____3723 =
                    FStar_Range.union_ranges unary_op.FStar_Syntax_Syntax.pos
                      (FStar_Pervasives_Native.fst a).FStar_Syntax_Syntax.pos
                     in
                  FStar_Syntax_Syntax.mk
                    (FStar_Syntax_Syntax.Tm_app (unary_op, [a]))
                    FStar_Pervasives_Native.None uu____3723
                   in
                let t =
                  FStar_Syntax_Syntax.mk
                    (FStar_Syntax_Syntax.Tm_app (head1, rest1))
                    FStar_Pervasives_Native.None top.FStar_Syntax_Syntax.pos
                   in
                tc_term env1 t)
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_reflect uu____3761);
              FStar_Syntax_Syntax.pos = uu____3762;
              FStar_Syntax_Syntax.vars = uu____3763;_},a::hd1::rest)
           ->
           let rest1 = hd1 :: rest  in
           let uu____3826 = FStar_Syntax_Util.head_and_args top  in
           (match uu____3826 with
            | (unary_op,uu____3848) ->
                let head1 =
                  let uu____3872 =
                    FStar_Range.union_ranges unary_op.FStar_Syntax_Syntax.pos
                      (FStar_Pervasives_Native.fst a).FStar_Syntax_Syntax.pos
                     in
                  FStar_Syntax_Syntax.mk
                    (FStar_Syntax_Syntax.Tm_app (unary_op, [a]))
                    FStar_Pervasives_Native.None uu____3872
                   in
                let t =
                  FStar_Syntax_Syntax.mk
                    (FStar_Syntax_Syntax.Tm_app (head1, rest1))
                    FStar_Pervasives_Native.None top.FStar_Syntax_Syntax.pos
                   in
                tc_term env1 t)
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_set_range_of );
              FStar_Syntax_Syntax.pos = uu____3910;
              FStar_Syntax_Syntax.vars = uu____3911;_},a1::a2::hd1::rest)
           ->
           let rest1 = hd1 :: rest  in
           let uu____3987 = FStar_Syntax_Util.head_and_args top  in
           (match uu____3987 with
            | (unary_op,uu____4009) ->
                let head1 =
                  let uu____4033 =
                    FStar_Range.union_ranges unary_op.FStar_Syntax_Syntax.pos
                      (FStar_Pervasives_Native.fst a1).FStar_Syntax_Syntax.pos
                     in
                  FStar_Syntax_Syntax.mk
                    (FStar_Syntax_Syntax.Tm_app (unary_op, [a1; a2]))
                    FStar_Pervasives_Native.None uu____4033
                   in
                let t =
                  FStar_Syntax_Syntax.mk
                    (FStar_Syntax_Syntax.Tm_app (head1, rest1))
                    FStar_Pervasives_Native.None top.FStar_Syntax_Syntax.pos
                   in
                tc_term env1 t)
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_range_of );
              FStar_Syntax_Syntax.pos = uu____4077;
              FStar_Syntax_Syntax.vars = uu____4078;_},(e1,FStar_Pervasives_Native.None
                                                        )::[])
           ->
           let uu____4108 =
             let uu____4115 =
               let uu____4116 = FStar_TypeChecker_Env.clear_expected_typ env1
                  in
               FStar_All.pipe_left FStar_Pervasives_Native.fst uu____4116  in
             tc_term uu____4115 e1  in
           (match uu____4108 with
            | (e2,c,g) ->
                let uu____4140 = FStar_Syntax_Util.head_and_args top  in
                (match uu____4140 with
                 | (head1,uu____4162) ->
                     let uu____4183 =
                       FStar_Syntax_Syntax.mk
                         (FStar_Syntax_Syntax.Tm_app
                            (head1, [(e2, FStar_Pervasives_Native.None)]))
                         FStar_Pervasives_Native.None
                         top.FStar_Syntax_Syntax.pos
                        in
                     let uu____4208 =
                       let uu____4209 =
                         let uu____4210 =
                           FStar_Syntax_Syntax.tabbrev
                             FStar_Parser_Const.range_lid
                            in
                         FStar_Syntax_Syntax.mk_Total uu____4210  in
                       FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp
                         uu____4209
                        in
                     (uu____4183, uu____4208, g)))
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_set_range_of );
              FStar_Syntax_Syntax.pos = uu____4211;
              FStar_Syntax_Syntax.vars = uu____4212;_},(t,FStar_Pervasives_Native.None
                                                        )::(r,FStar_Pervasives_Native.None
                                                            )::[])
           ->
           let uu____4253 = FStar_Syntax_Util.head_and_args top  in
           (match uu____4253 with
            | (head1,uu____4275) ->
                let env' =
                  let uu____4297 =
                    FStar_Syntax_Syntax.tabbrev FStar_Parser_Const.range_lid
                     in
                  FStar_TypeChecker_Env.set_expected_typ env1 uu____4297  in
                let uu____4298 = tc_term env' r  in
                (match uu____4298 with
                 | (er,uu____4312,gr) ->
                     let uu____4314 = tc_term env1 t  in
                     (match uu____4314 with
                      | (t1,tt,gt1) ->
                          let g = FStar_TypeChecker_Env.conj_guard gr gt1  in
                          let uu____4331 =
                            let uu____4332 =
                              let uu____4337 =
                                let uu____4338 =
                                  FStar_Syntax_Syntax.as_arg t1  in
                                let uu____4345 =
                                  let uu____4354 =
                                    FStar_Syntax_Syntax.as_arg r  in
                                  [uu____4354]  in
                                uu____4338 :: uu____4345  in
                              FStar_Syntax_Syntax.mk_Tm_app head1 uu____4337
                               in
                            uu____4332 FStar_Pervasives_Native.None
                              top.FStar_Syntax_Syntax.pos
                             in
                          (uu____4331, tt, g))))
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_range_of );
              FStar_Syntax_Syntax.pos = uu____4381;
              FStar_Syntax_Syntax.vars = uu____4382;_},uu____4383)
           ->
           let uu____4404 =
             let uu____4409 =
               let uu____4410 = FStar_Syntax_Print.term_to_string top  in
               FStar_Util.format1 "Ill-applied constant %s" uu____4410  in
             (FStar_Errors.Fatal_IllAppliedConstant, uu____4409)  in
           FStar_Errors.raise_error uu____4404 e.FStar_Syntax_Syntax.pos
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_set_range_of );
              FStar_Syntax_Syntax.pos = uu____4417;
              FStar_Syntax_Syntax.vars = uu____4418;_},uu____4419)
           ->
           let uu____4440 =
             let uu____4445 =
               let uu____4446 = FStar_Syntax_Print.term_to_string top  in
               FStar_Util.format1 "Ill-applied constant %s" uu____4446  in
             (FStar_Errors.Fatal_IllAppliedConstant, uu____4445)  in
           FStar_Errors.raise_error uu____4440 e.FStar_Syntax_Syntax.pos
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_reify );
              FStar_Syntax_Syntax.pos = uu____4453;
              FStar_Syntax_Syntax.vars = uu____4454;_},(e1,aqual)::[])
           ->
           (if FStar_Option.isSome aqual
            then
              FStar_Errors.log_issue e1.FStar_Syntax_Syntax.pos
                (FStar_Errors.Warning_IrrelevantQualifierOnArgumentToReify,
                  "Qualifier on argument to reify is irrelevant and will be ignored")
            else ();
            (let uu____4487 = FStar_TypeChecker_Env.clear_expected_typ env1
                in
             match uu____4487 with
             | (env0,uu____4501) ->
                 let uu____4506 = tc_term env0 e1  in
                 (match uu____4506 with
                  | (e2,c,g) ->
                      let uu____4522 = FStar_Syntax_Util.head_and_args top
                         in
                      (match uu____4522 with
                       | (reify_op,uu____4544) ->
                           let u_c =
                             let uu____4566 =
                               tc_term env0 c.FStar_Syntax_Syntax.res_typ  in
                             match uu____4566 with
                             | (uu____4573,c',uu____4575) ->
                                 let uu____4576 =
                                   let uu____4577 =
                                     FStar_Syntax_Subst.compress
                                       c'.FStar_Syntax_Syntax.res_typ
                                      in
                                   uu____4577.FStar_Syntax_Syntax.n  in
                                 (match uu____4576 with
                                  | FStar_Syntax_Syntax.Tm_type u -> u
                                  | uu____4581 ->
                                      let uu____4582 =
                                        FStar_Syntax_Util.type_u ()  in
                                      (match uu____4582 with
                                       | (t,u) ->
                                           let g_opt =
                                             FStar_TypeChecker_Rel.try_teq
                                               true env1
                                               c'.FStar_Syntax_Syntax.res_typ
                                               t
                                              in
                                           ((match g_opt with
                                             | FStar_Pervasives_Native.Some
                                                 g' ->
                                                 FStar_TypeChecker_Rel.force_trivial_guard
                                                   env1 g'
                                             | FStar_Pervasives_Native.None 
                                                 ->
                                                 let uu____4594 =
                                                   let uu____4595 =
                                                     FStar_Syntax_Print.lcomp_to_string
                                                       c'
                                                      in
                                                   let uu____4596 =
                                                     FStar_Syntax_Print.term_to_string
                                                       c.FStar_Syntax_Syntax.res_typ
                                                      in
                                                   let uu____4597 =
                                                     FStar_Syntax_Print.term_to_string
                                                       c'.FStar_Syntax_Syntax.res_typ
                                                      in
                                                   FStar_Util.format3
                                                     "Unexpected result type of computation. The computation type %s of the term %s should have type Type n for some level n but has type %s"
                                                     uu____4595 uu____4596
                                                     uu____4597
                                                    in
                                                 failwith uu____4594);
                                            u)))
                              in
                           let repr =
                             let uu____4599 =
                               FStar_Syntax_Syntax.lcomp_comp c  in
                             FStar_TypeChecker_Env.reify_comp env1 uu____4599
                               u_c
                              in
                           let e3 =
                             FStar_Syntax_Syntax.mk
                               (FStar_Syntax_Syntax.Tm_app
                                  (reify_op, [(e2, aqual)]))
                               FStar_Pervasives_Native.None
                               top.FStar_Syntax_Syntax.pos
                              in
                           let c1 =
                             let uu____4628 =
                               FStar_Syntax_Syntax.mk_Total repr  in
                             FStar_All.pipe_right uu____4628
                               FStar_Syntax_Util.lcomp_of_comp
                              in
                           let uu____4629 =
                             comp_check_expected_typ env1 e3 c1  in
                           (match uu____4629 with
                            | (e4,c2,g') ->
                                let uu____4645 =
                                  FStar_TypeChecker_Env.conj_guard g g'  in
                                (e4, c2, uu____4645))))))
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_reflect l);
              FStar_Syntax_Syntax.pos = uu____4647;
              FStar_Syntax_Syntax.vars = uu____4648;_},(e1,aqual)::[])
           ->
           (if FStar_Option.isSome aqual
            then
              FStar_Errors.log_issue e1.FStar_Syntax_Syntax.pos
                (FStar_Errors.Warning_IrrelevantQualifierOnArgumentToReflect,
                  "Qualifier on argument to reflect is irrelevant and will be ignored")
            else ();
            (let no_reflect uu____4692 =
               let uu____4693 =
                 let uu____4698 =
                   FStar_Util.format1 "Effect %s cannot be reified"
                     l.FStar_Ident.str
                    in
                 (FStar_Errors.Fatal_EffectCannotBeReified, uu____4698)  in
               FStar_Errors.raise_error uu____4693 e1.FStar_Syntax_Syntax.pos
                in
             let uu____4705 = FStar_Syntax_Util.head_and_args top  in
             match uu____4705 with
             | (reflect_op,uu____4727) ->
                 let uu____4748 =
                   FStar_TypeChecker_Env.effect_decl_opt env1 l  in
                 (match uu____4748 with
                  | FStar_Pervasives_Native.None  -> no_reflect ()
                  | FStar_Pervasives_Native.Some (ed,qualifiers) ->
                      let uu____4781 =
                        let uu____4782 =
                          FStar_All.pipe_right qualifiers
                            FStar_Syntax_Syntax.contains_reflectable
                           in
                        Prims.op_Negation uu____4782  in
                      if uu____4781
                      then no_reflect ()
                      else
                        (let uu____4792 =
                           FStar_TypeChecker_Env.clear_expected_typ env1  in
                         match uu____4792 with
                         | (env_no_ex,topt) ->
                             let uu____4811 =
                               let u = FStar_TypeChecker_Env.new_u_univ ()
                                  in
                               let repr =
                                 FStar_TypeChecker_Env.inst_effect_fun_with
                                   [u] env1 ed
                                   ([], (ed.FStar_Syntax_Syntax.repr))
                                  in
                               let t =
                                 let uu____4831 =
                                   let uu____4838 =
                                     let uu____4839 =
                                       let uu____4854 =
                                         let uu____4863 =
                                           FStar_Syntax_Syntax.as_arg
                                             FStar_Syntax_Syntax.tun
                                            in
                                         let uu____4870 =
                                           let uu____4879 =
                                             FStar_Syntax_Syntax.as_arg
                                               FStar_Syntax_Syntax.tun
                                              in
                                           [uu____4879]  in
                                         uu____4863 :: uu____4870  in
                                       (repr, uu____4854)  in
                                     FStar_Syntax_Syntax.Tm_app uu____4839
                                      in
                                   FStar_Syntax_Syntax.mk uu____4838  in
                                 uu____4831 FStar_Pervasives_Native.None
                                   top.FStar_Syntax_Syntax.pos
                                  in
                               let uu____4917 =
                                 let uu____4924 =
                                   let uu____4925 =
                                     FStar_TypeChecker_Env.clear_expected_typ
                                       env1
                                      in
                                   FStar_All.pipe_right uu____4925
                                     FStar_Pervasives_Native.fst
                                    in
                                 tc_tot_or_gtot_term uu____4924 t  in
                               match uu____4917 with
                               | (t1,uu____4951,g) ->
                                   let uu____4953 =
                                     let uu____4954 =
                                       FStar_Syntax_Subst.compress t1  in
                                     uu____4954.FStar_Syntax_Syntax.n  in
                                   (match uu____4953 with
                                    | FStar_Syntax_Syntax.Tm_app
                                        (uu____4967,(res,uu____4969)::
                                         (wp,uu____4971)::[])
                                        -> (t1, res, wp, g)
                                    | uu____5012 -> failwith "Impossible")
                                in
                             (match uu____4811 with
                              | (expected_repr_typ,res_typ,wp,g0) ->
                                  let uu____5037 =
                                    let uu____5044 =
                                      tc_tot_or_gtot_term env_no_ex e1  in
                                    match uu____5044 with
                                    | (e2,c,g) ->
                                        ((let uu____5061 =
                                            let uu____5062 =
                                              FStar_Syntax_Util.is_total_lcomp
                                                c
                                               in
                                            FStar_All.pipe_left
                                              Prims.op_Negation uu____5062
                                             in
                                          if uu____5061
                                          then
                                            FStar_TypeChecker_Err.add_errors
                                              env1
                                              [(FStar_Errors.Error_UnexpectedGTotComputation,
                                                 "Expected Tot, got a GTot computation",
                                                 (e2.FStar_Syntax_Syntax.pos))]
                                          else ());
                                         (let uu____5076 =
                                            FStar_TypeChecker_Rel.try_teq
                                              true env_no_ex
                                              c.FStar_Syntax_Syntax.res_typ
                                              expected_repr_typ
                                             in
                                          match uu____5076 with
                                          | FStar_Pervasives_Native.None  ->
                                              ((let uu____5086 =
                                                  let uu____5095 =
                                                    let uu____5102 =
                                                      let uu____5103 =
                                                        FStar_Syntax_Print.term_to_string
                                                          ed.FStar_Syntax_Syntax.repr
                                                         in
                                                      let uu____5104 =
                                                        FStar_Syntax_Print.term_to_string
                                                          c.FStar_Syntax_Syntax.res_typ
                                                         in
                                                      FStar_Util.format2
                                                        "Expected an instance of %s; got %s"
                                                        uu____5103 uu____5104
                                                       in
                                                    (FStar_Errors.Error_UnexpectedInstance,
                                                      uu____5102,
                                                      (e2.FStar_Syntax_Syntax.pos))
                                                     in
                                                  [uu____5095]  in
                                                FStar_TypeChecker_Err.add_errors
                                                  env1 uu____5086);
                                               (let uu____5117 =
                                                  FStar_TypeChecker_Env.conj_guard
                                                    g g0
                                                   in
                                                (e2, uu____5117)))
                                          | FStar_Pervasives_Native.Some g'
                                              ->
                                              let uu____5121 =
                                                let uu____5122 =
                                                  FStar_TypeChecker_Env.conj_guard
                                                    g g0
                                                   in
                                                FStar_TypeChecker_Env.conj_guard
                                                  g' uu____5122
                                                 in
                                              (e2, uu____5121)))
                                     in
                                  (match uu____5037 with
                                   | (e2,g) ->
                                       let c =
                                         let uu____5138 =
                                           let uu____5139 =
                                             let uu____5140 =
                                               let uu____5141 =
                                                 env1.FStar_TypeChecker_Env.universe_of
                                                   env1 res_typ
                                                  in
                                               [uu____5141]  in
                                             let uu____5142 =
                                               let uu____5151 =
                                                 FStar_Syntax_Syntax.as_arg
                                                   wp
                                                  in
                                               [uu____5151]  in
                                             {
                                               FStar_Syntax_Syntax.comp_univs
                                                 = uu____5140;
                                               FStar_Syntax_Syntax.effect_name
                                                 =
                                                 (ed.FStar_Syntax_Syntax.mname);
                                               FStar_Syntax_Syntax.result_typ
                                                 = res_typ;
                                               FStar_Syntax_Syntax.effect_args
                                                 = uu____5142;
                                               FStar_Syntax_Syntax.flags = []
                                             }  in
                                           FStar_Syntax_Syntax.mk_Comp
                                             uu____5139
                                            in
                                         FStar_All.pipe_right uu____5138
                                           FStar_Syntax_Util.lcomp_of_comp
                                          in
                                       let e3 =
                                         FStar_Syntax_Syntax.mk
                                           (FStar_Syntax_Syntax.Tm_app
                                              (reflect_op, [(e2, aqual)]))
                                           FStar_Pervasives_Native.None
                                           top.FStar_Syntax_Syntax.pos
                                          in
                                       let uu____5197 =
                                         comp_check_expected_typ env1 e3 c
                                          in
                                       (match uu____5197 with
                                        | (e4,c1,g') ->
                                            let uu____5213 =
                                              FStar_TypeChecker_Env.conj_guard
                                                g' g
                                               in
                                            (e4, c1, uu____5213))))))))
       | FStar_Syntax_Syntax.Tm_app
           (head1,(tau,FStar_Pervasives_Native.None )::[]) when
           (FStar_Syntax_Util.is_synth_by_tactic head1) &&
             (Prims.op_Negation env1.FStar_TypeChecker_Env.phase1)
           ->
           let uu____5244 = FStar_Syntax_Util.head_and_args top  in
           (match uu____5244 with
            | (head2,args) ->
                tc_synth head2 env1 args top.FStar_Syntax_Syntax.pos)
       | FStar_Syntax_Syntax.Tm_app
           (head1,(uu____5288,FStar_Pervasives_Native.Some
                   (FStar_Syntax_Syntax.Implicit uu____5289))::(tau,FStar_Pervasives_Native.None
                                                                )::[])
           when
           (FStar_Syntax_Util.is_synth_by_tactic head1) &&
             (Prims.op_Negation env1.FStar_TypeChecker_Env.phase1)
           ->
           let uu____5329 = FStar_Syntax_Util.head_and_args top  in
           (match uu____5329 with
            | (head2,args) ->
                tc_synth head2 env1 args top.FStar_Syntax_Syntax.pos)
       | FStar_Syntax_Syntax.Tm_app (head1,args) when
           (FStar_Syntax_Util.is_synth_by_tactic head1) &&
             (Prims.op_Negation env1.FStar_TypeChecker_Env.phase1)
           ->
           let uu____5394 =
             match args with
             | (tau,FStar_Pervasives_Native.None )::rest ->
                 ([(tau, FStar_Pervasives_Native.None)], rest)
             | (a,FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Implicit
                b))::(tau,FStar_Pervasives_Native.None )::rest ->
                 ([(a,
                     (FStar_Pervasives_Native.Some
                        (FStar_Syntax_Syntax.Implicit b)));
                  (tau, FStar_Pervasives_Native.None)], rest)
             | uu____5555 ->
                 FStar_Errors.raise_error
                   (FStar_Errors.Fatal_SynthByTacticError,
                     "synth_by_tactic: bad application")
                   top.FStar_Syntax_Syntax.pos
              in
           (match uu____5394 with
            | (args1,args2) ->
                let t1 = FStar_Syntax_Util.mk_app head1 args1  in
                let t2 = FStar_Syntax_Util.mk_app t1 args2  in
                tc_term env1 t2)
       | FStar_Syntax_Syntax.Tm_app (head1,args) ->
           let env0 = env1  in
           let env2 =
             let uu____5654 =
               let uu____5655 = FStar_TypeChecker_Env.clear_expected_typ env1
                  in
               FStar_All.pipe_right uu____5655 FStar_Pervasives_Native.fst
                in
             FStar_All.pipe_right uu____5654 instantiate_both  in
           ((let uu____5671 =
               FStar_TypeChecker_Env.debug env2 FStar_Options.High  in
             if uu____5671
             then
               let uu____5672 =
                 FStar_Range.string_of_range top.FStar_Syntax_Syntax.pos  in
               let uu____5673 = FStar_Syntax_Print.term_to_string top  in
               let uu____5674 =
                 let uu____5675 = FStar_TypeChecker_Env.expected_typ env0  in
                 FStar_All.pipe_right uu____5675
                   (fun uu___328_5681  ->
                      match uu___328_5681 with
                      | FStar_Pervasives_Native.None  -> "none"
                      | FStar_Pervasives_Native.Some t ->
                          FStar_Syntax_Print.term_to_string t)
                  in
               FStar_Util.print3
                 "(%s) Checking app %s, expected type is %s\n" uu____5672
                 uu____5673 uu____5674
             else ());
            (let uu____5686 = tc_term (no_inst env2) head1  in
             match uu____5686 with
             | (head2,chead,g_head) ->
                 let uu____5702 =
                   let uu____5709 =
                     ((Prims.op_Negation env2.FStar_TypeChecker_Env.lax) &&
                        (let uu____5711 = FStar_Options.lax ()  in
                         Prims.op_Negation uu____5711))
                       && (FStar_TypeChecker_Util.short_circuit_head head2)
                      in
                   if uu____5709
                   then
                     let uu____5718 =
                       let uu____5725 =
                         FStar_TypeChecker_Env.expected_typ env0  in
                       check_short_circuit_args env2 head2 chead g_head args
                         uu____5725
                        in
                     match uu____5718 with | (e1,c,g) -> (e1, c, g)
                   else
                     (let uu____5738 =
                        FStar_TypeChecker_Env.expected_typ env0  in
                      check_application_args env2 head2 chead g_head args
                        uu____5738)
                    in
                 (match uu____5702 with
                  | (e1,c,g) ->
                      ((let uu____5751 =
                          FStar_TypeChecker_Env.debug env2
                            FStar_Options.Extreme
                           in
                        if uu____5751
                        then
                          let uu____5752 =
                            FStar_TypeChecker_Rel.print_pending_implicits g
                             in
                          FStar_Util.print1
                            "Introduced {%s} implicits in application\n"
                            uu____5752
                        else ());
                       (let uu____5754 = comp_check_expected_typ env0 e1 c
                           in
                        match uu____5754 with
                        | (e2,c1,g') ->
                            let gres = FStar_TypeChecker_Env.conj_guard g g'
                               in
                            ((let uu____5772 =
                                FStar_TypeChecker_Env.debug env2
                                  FStar_Options.Extreme
                                 in
                              if uu____5772
                              then
                                let uu____5773 =
                                  FStar_Syntax_Print.term_to_string e2  in
                                let uu____5774 =
                                  FStar_TypeChecker_Rel.guard_to_string env2
                                    gres
                                   in
                                FStar_Util.print2
                                  "Guard from application node %s is %s\n"
                                  uu____5773 uu____5774
                              else ());
                             (e2, c1, gres)))))))
       | FStar_Syntax_Syntax.Tm_match (e1,eqns) ->
           let uu____5814 = FStar_TypeChecker_Env.clear_expected_typ env1  in
           (match uu____5814 with
            | (env11,topt) ->
                let env12 = instantiate_both env11  in
                let uu____5834 = tc_term env12 e1  in
                (match uu____5834 with
                 | (e11,c1,g1) ->
                     let uu____5850 =
                       match topt with
                       | FStar_Pervasives_Native.Some t -> (env1, t, g1)
                       | FStar_Pervasives_Native.None  ->
                           let uu____5864 = FStar_Syntax_Util.type_u ()  in
                           (match uu____5864 with
                            | (k,uu____5876) ->
                                let uu____5877 =
                                  FStar_TypeChecker_Util.new_implicit_var
                                    "match result" e.FStar_Syntax_Syntax.pos
                                    env1 k
                                   in
                                (match uu____5877 with
                                 | (res_t,uu____5897,g) ->
                                     let uu____5911 =
                                       FStar_TypeChecker_Env.set_expected_typ
                                         env1 res_t
                                        in
                                     let uu____5912 =
                                       FStar_TypeChecker_Env.conj_guard g1 g
                                        in
                                     (uu____5911, res_t, uu____5912)))
                        in
                     (match uu____5850 with
                      | (env_branches,res_t,g11) ->
                          ((let uu____5923 =
                              FStar_TypeChecker_Env.debug env1
                                FStar_Options.Extreme
                               in
                            if uu____5923
                            then
                              let uu____5924 =
                                FStar_Syntax_Print.term_to_string res_t  in
                              FStar_Util.print1
                                "Tm_match: expected type of branches is %s\n"
                                uu____5924
                            else ());
                           (let guard_x =
                              FStar_Syntax_Syntax.new_bv
                                (FStar_Pervasives_Native.Some
                                   (e11.FStar_Syntax_Syntax.pos))
                                c1.FStar_Syntax_Syntax.res_typ
                               in
                            let t_eqns =
                              FStar_All.pipe_right eqns
                                (FStar_List.map (tc_eqn guard_x env_branches))
                               in
                            let uu____6045 =
                              let uu____6050 =
                                FStar_List.fold_right
                                  (fun uu____6129  ->
                                     fun uu____6130  ->
                                       match (uu____6129, uu____6130) with
                                       | ((branch1,f,eff_label,cflags,c,g),
                                          (caccum,gaccum)) ->
                                           let uu____6364 =
                                             FStar_TypeChecker_Env.conj_guard
                                               g gaccum
                                              in
                                           (((f, eff_label, cflags, c) ::
                                             caccum), uu____6364)) t_eqns
                                  ([], FStar_TypeChecker_Env.trivial_guard)
                                 in
                              match uu____6050 with
                              | (cases,g) ->
                                  let uu____6462 =
                                    FStar_TypeChecker_Util.bind_cases env1
                                      res_t cases
                                     in
                                  (uu____6462, g)
                               in
                            match uu____6045 with
                            | (c_branches,g_branches) ->
                                let cres =
                                  FStar_TypeChecker_Util.bind
                                    e11.FStar_Syntax_Syntax.pos env1
                                    (FStar_Pervasives_Native.Some e11) c1
                                    ((FStar_Pervasives_Native.Some guard_x),
                                      c_branches)
                                   in
                                let e2 =
                                  let mk_match scrutinee =
                                    let branches =
                                      FStar_All.pipe_right t_eqns
                                        (FStar_List.map
                                           (fun uu____6602  ->
                                              match uu____6602 with
                                              | ((pat,wopt,br),uu____6646,eff_label,uu____6648,uu____6649,uu____6650)
                                                  ->
                                                  let uu____6685 =
                                                    FStar_TypeChecker_Util.maybe_lift
                                                      env1 br eff_label
                                                      cres.FStar_Syntax_Syntax.eff_name
                                                      res_t
                                                     in
                                                  (pat, wopt, uu____6685)))
                                       in
                                    let e2 =
                                      FStar_Syntax_Syntax.mk
                                        (FStar_Syntax_Syntax.Tm_match
                                           (scrutinee, branches))
                                        FStar_Pervasives_Native.None
                                        top.FStar_Syntax_Syntax.pos
                                       in
                                    let e3 =
                                      FStar_TypeChecker_Util.maybe_monadic
                                        env1 e2
                                        cres.FStar_Syntax_Syntax.eff_name
                                        cres.FStar_Syntax_Syntax.res_typ
                                       in
                                    FStar_Syntax_Syntax.mk
                                      (FStar_Syntax_Syntax.Tm_ascribed
                                         (e3,
                                           ((FStar_Util.Inl
                                               (cres.FStar_Syntax_Syntax.res_typ)),
                                             FStar_Pervasives_Native.None),
                                           (FStar_Pervasives_Native.Some
                                              (cres.FStar_Syntax_Syntax.eff_name))))
                                      FStar_Pervasives_Native.None
                                      e3.FStar_Syntax_Syntax.pos
                                     in
                                  let uu____6752 =
                                    FStar_TypeChecker_Util.is_pure_or_ghost_effect
                                      env1 c1.FStar_Syntax_Syntax.eff_name
                                     in
                                  if uu____6752
                                  then mk_match e11
                                  else
                                    (let e_match =
                                       let uu____6757 =
                                         FStar_Syntax_Syntax.bv_to_name
                                           guard_x
                                          in
                                       mk_match uu____6757  in
                                     let lb =
                                       let uu____6761 =
                                         FStar_TypeChecker_Env.norm_eff_name
                                           env1
                                           c1.FStar_Syntax_Syntax.eff_name
                                          in
                                       FStar_Syntax_Util.mk_letbinding
                                         (FStar_Util.Inl guard_x) []
                                         c1.FStar_Syntax_Syntax.res_typ
                                         uu____6761 e11 []
                                         e11.FStar_Syntax_Syntax.pos
                                        in
                                     let e2 =
                                       let uu____6767 =
                                         let uu____6774 =
                                           let uu____6775 =
                                             let uu____6788 =
                                               let uu____6791 =
                                                 let uu____6792 =
                                                   FStar_Syntax_Syntax.mk_binder
                                                     guard_x
                                                    in
                                                 [uu____6792]  in
                                               FStar_Syntax_Subst.close
                                                 uu____6791 e_match
                                                in
                                             ((false, [lb]), uu____6788)  in
                                           FStar_Syntax_Syntax.Tm_let
                                             uu____6775
                                            in
                                         FStar_Syntax_Syntax.mk uu____6774
                                          in
                                       uu____6767
                                         FStar_Pervasives_Native.None
                                         top.FStar_Syntax_Syntax.pos
                                        in
                                     FStar_TypeChecker_Util.maybe_monadic
                                       env1 e2
                                       cres.FStar_Syntax_Syntax.eff_name
                                       cres.FStar_Syntax_Syntax.res_typ)
                                   in
                                ((let uu____6819 =
                                    FStar_TypeChecker_Env.debug env1
                                      FStar_Options.Extreme
                                     in
                                  if uu____6819
                                  then
                                    let uu____6820 =
                                      FStar_Range.string_of_range
                                        top.FStar_Syntax_Syntax.pos
                                       in
                                    let uu____6821 =
                                      FStar_Syntax_Print.lcomp_to_string cres
                                       in
                                    FStar_Util.print2 "(%s) comp type = %s\n"
                                      uu____6820 uu____6821
                                  else ());
                                 (let uu____6823 =
                                    FStar_TypeChecker_Env.conj_guard g11
                                      g_branches
                                     in
                                  (e2, cres, uu____6823))))))))
       | FStar_Syntax_Syntax.Tm_let
           ((false
             ,{ FStar_Syntax_Syntax.lbname = FStar_Util.Inr uu____6824;
                FStar_Syntax_Syntax.lbunivs = uu____6825;
                FStar_Syntax_Syntax.lbtyp = uu____6826;
                FStar_Syntax_Syntax.lbeff = uu____6827;
                FStar_Syntax_Syntax.lbdef = uu____6828;
                FStar_Syntax_Syntax.lbattrs = uu____6829;
                FStar_Syntax_Syntax.lbpos = uu____6830;_}::[]),uu____6831)
           -> check_top_level_let env1 top
       | FStar_Syntax_Syntax.Tm_let ((false ,uu____6854),uu____6855) ->
           check_inner_let env1 top
       | FStar_Syntax_Syntax.Tm_let
           ((true
             ,{ FStar_Syntax_Syntax.lbname = FStar_Util.Inr uu____6870;
                FStar_Syntax_Syntax.lbunivs = uu____6871;
                FStar_Syntax_Syntax.lbtyp = uu____6872;
                FStar_Syntax_Syntax.lbeff = uu____6873;
                FStar_Syntax_Syntax.lbdef = uu____6874;
                FStar_Syntax_Syntax.lbattrs = uu____6875;
                FStar_Syntax_Syntax.lbpos = uu____6876;_}::uu____6877),uu____6878)
           -> check_top_level_let_rec env1 top
       | FStar_Syntax_Syntax.Tm_let ((true ,uu____6903),uu____6904) ->
           check_inner_let_rec env1 top)

and (tc_synth :
  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
    FStar_TypeChecker_Env.env ->
      (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
        FStar_Pervasives_Native.tuple2 Prims.list ->
        FStar_Range.range ->
          (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
            FStar_Pervasives_Native.tuple3)
  =
  fun head1  ->
    fun env  ->
      fun args  ->
        fun rng  ->
          let uu____6933 =
            match args with
            | (tau,FStar_Pervasives_Native.None )::[] ->
                (tau, FStar_Pervasives_Native.None)
            | (a,FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Implicit
               uu____6966))::(tau,FStar_Pervasives_Native.None )::[] ->
                (tau, (FStar_Pervasives_Native.Some a))
            | uu____6996 ->
                FStar_Errors.raise_error
                  (FStar_Errors.Fatal_SynthByTacticError,
                    "synth_by_tactic: bad application") rng
             in
          match uu____6933 with
          | (tau,atyp) ->
              let typ =
                match atyp with
                | FStar_Pervasives_Native.Some t -> t
                | FStar_Pervasives_Native.None  ->
                    let uu____7025 = FStar_TypeChecker_Env.expected_typ env
                       in
                    (match uu____7025 with
                     | FStar_Pervasives_Native.Some t -> t
                     | FStar_Pervasives_Native.None  ->
                         let uu____7029 = FStar_TypeChecker_Env.get_range env
                            in
                         FStar_Errors.raise_error
                           (FStar_Errors.Fatal_SynthByTacticError,
                             "synth_by_tactic: need a type annotation when no expected type is present")
                           uu____7029)
                 in
              let uu____7030 = FStar_TypeChecker_Env.clear_expected_typ env
                 in
              (match uu____7030 with
               | (env',uu____7044) ->
                   let uu____7049 = tc_term env' typ  in
                   (match uu____7049 with
                    | (typ1,uu____7063,g1) ->
                        (FStar_TypeChecker_Rel.force_trivial_guard env' g1;
                         (let uu____7066 = tc_tactic env' tau  in
                          match uu____7066 with
                          | (tau1,uu____7080,g2) ->
                              (FStar_TypeChecker_Rel.force_trivial_guard env'
                                 g2;
                               (let t =
                                  if env.FStar_TypeChecker_Env.nosynth
                                  then
                                    let uu____7088 =
                                      let uu____7093 =
                                        FStar_TypeChecker_Util.fvar_const env
                                          FStar_Parser_Const.magic_lid
                                         in
                                      let uu____7094 =
                                        let uu____7095 =
                                          FStar_Syntax_Syntax.as_arg
                                            FStar_Syntax_Util.exp_unit
                                           in
                                        [uu____7095]  in
                                      FStar_Syntax_Syntax.mk_Tm_app
                                        uu____7093 uu____7094
                                       in
                                    uu____7088 FStar_Pervasives_Native.None
                                      rng
                                  else
                                    (let t =
                                       env.FStar_TypeChecker_Env.synth_hook
                                         env' typ1
                                         (let uu___339_7119 = tau1  in
                                          {
                                            FStar_Syntax_Syntax.n =
                                              (uu___339_7119.FStar_Syntax_Syntax.n);
                                            FStar_Syntax_Syntax.pos = rng;
                                            FStar_Syntax_Syntax.vars =
                                              (uu___339_7119.FStar_Syntax_Syntax.vars)
                                          })
                                        in
                                     (let uu____7121 =
                                        FStar_All.pipe_left
                                          (FStar_TypeChecker_Env.debug env)
                                          (FStar_Options.Other "Tac")
                                         in
                                      if uu____7121
                                      then
                                        let uu____7122 =
                                          FStar_Syntax_Print.term_to_string t
                                           in
                                        FStar_Util.print1 "Got %s\n"
                                          uu____7122
                                      else ());
                                     t)
                                   in
                                FStar_TypeChecker_Util.check_uvars
                                  tau1.FStar_Syntax_Syntax.pos t;
                                (let uu____7125 =
                                   let uu____7126 =
                                     FStar_Syntax_Syntax.mk_Total typ1  in
                                   FStar_All.pipe_left
                                     FStar_Syntax_Util.lcomp_of_comp
                                     uu____7126
                                    in
                                 (t, uu____7125,
                                   FStar_TypeChecker_Env.trivial_guard))))))))

and (tc_tactic :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun tau  ->
      let env1 =
        let uu___340_7130 = env  in
        {
          FStar_TypeChecker_Env.solver =
            (uu___340_7130.FStar_TypeChecker_Env.solver);
          FStar_TypeChecker_Env.range =
            (uu___340_7130.FStar_TypeChecker_Env.range);
          FStar_TypeChecker_Env.curmodule =
            (uu___340_7130.FStar_TypeChecker_Env.curmodule);
          FStar_TypeChecker_Env.gamma =
            (uu___340_7130.FStar_TypeChecker_Env.gamma);
          FStar_TypeChecker_Env.gamma_sig =
            (uu___340_7130.FStar_TypeChecker_Env.gamma_sig);
          FStar_TypeChecker_Env.gamma_cache =
            (uu___340_7130.FStar_TypeChecker_Env.gamma_cache);
          FStar_TypeChecker_Env.modules =
            (uu___340_7130.FStar_TypeChecker_Env.modules);
          FStar_TypeChecker_Env.expected_typ =
            (uu___340_7130.FStar_TypeChecker_Env.expected_typ);
          FStar_TypeChecker_Env.sigtab =
            (uu___340_7130.FStar_TypeChecker_Env.sigtab);
          FStar_TypeChecker_Env.is_pattern =
            (uu___340_7130.FStar_TypeChecker_Env.is_pattern);
          FStar_TypeChecker_Env.instantiate_imp =
            (uu___340_7130.FStar_TypeChecker_Env.instantiate_imp);
          FStar_TypeChecker_Env.effects =
            (uu___340_7130.FStar_TypeChecker_Env.effects);
          FStar_TypeChecker_Env.generalize =
            (uu___340_7130.FStar_TypeChecker_Env.generalize);
          FStar_TypeChecker_Env.letrecs =
            (uu___340_7130.FStar_TypeChecker_Env.letrecs);
          FStar_TypeChecker_Env.top_level =
            (uu___340_7130.FStar_TypeChecker_Env.top_level);
          FStar_TypeChecker_Env.check_uvars =
            (uu___340_7130.FStar_TypeChecker_Env.check_uvars);
          FStar_TypeChecker_Env.use_eq =
            (uu___340_7130.FStar_TypeChecker_Env.use_eq);
          FStar_TypeChecker_Env.is_iface =
            (uu___340_7130.FStar_TypeChecker_Env.is_iface);
          FStar_TypeChecker_Env.admit =
            (uu___340_7130.FStar_TypeChecker_Env.admit);
          FStar_TypeChecker_Env.lax =
            (uu___340_7130.FStar_TypeChecker_Env.lax);
          FStar_TypeChecker_Env.lax_universes =
            (uu___340_7130.FStar_TypeChecker_Env.lax_universes);
          FStar_TypeChecker_Env.phase1 =
            (uu___340_7130.FStar_TypeChecker_Env.phase1);
          FStar_TypeChecker_Env.failhard = true;
          FStar_TypeChecker_Env.nosynth =
            (uu___340_7130.FStar_TypeChecker_Env.nosynth);
          FStar_TypeChecker_Env.uvar_subtyping =
            (uu___340_7130.FStar_TypeChecker_Env.uvar_subtyping);
          FStar_TypeChecker_Env.tc_term =
            (uu___340_7130.FStar_TypeChecker_Env.tc_term);
          FStar_TypeChecker_Env.type_of =
            (uu___340_7130.FStar_TypeChecker_Env.type_of);
          FStar_TypeChecker_Env.universe_of =
            (uu___340_7130.FStar_TypeChecker_Env.universe_of);
          FStar_TypeChecker_Env.check_type_of =
            (uu___340_7130.FStar_TypeChecker_Env.check_type_of);
          FStar_TypeChecker_Env.use_bv_sorts =
            (uu___340_7130.FStar_TypeChecker_Env.use_bv_sorts);
          FStar_TypeChecker_Env.qtbl_name_and_index =
            (uu___340_7130.FStar_TypeChecker_Env.qtbl_name_and_index);
          FStar_TypeChecker_Env.normalized_eff_names =
            (uu___340_7130.FStar_TypeChecker_Env.normalized_eff_names);
          FStar_TypeChecker_Env.proof_ns =
            (uu___340_7130.FStar_TypeChecker_Env.proof_ns);
          FStar_TypeChecker_Env.synth_hook =
            (uu___340_7130.FStar_TypeChecker_Env.synth_hook);
          FStar_TypeChecker_Env.splice =
            (uu___340_7130.FStar_TypeChecker_Env.splice);
          FStar_TypeChecker_Env.is_native_tactic =
            (uu___340_7130.FStar_TypeChecker_Env.is_native_tactic);
          FStar_TypeChecker_Env.identifier_info =
            (uu___340_7130.FStar_TypeChecker_Env.identifier_info);
          FStar_TypeChecker_Env.tc_hooks =
            (uu___340_7130.FStar_TypeChecker_Env.tc_hooks);
          FStar_TypeChecker_Env.dsenv =
            (uu___340_7130.FStar_TypeChecker_Env.dsenv);
          FStar_TypeChecker_Env.dep_graph =
            (uu___340_7130.FStar_TypeChecker_Env.dep_graph)
        }  in
      tc_check_tot_or_gtot_term env1 tau FStar_Syntax_Syntax.t_tactic_unit

and (tc_reified_tactic :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun tau  ->
      let env1 =
        let uu___341_7134 = env  in
        {
          FStar_TypeChecker_Env.solver =
            (uu___341_7134.FStar_TypeChecker_Env.solver);
          FStar_TypeChecker_Env.range =
            (uu___341_7134.FStar_TypeChecker_Env.range);
          FStar_TypeChecker_Env.curmodule =
            (uu___341_7134.FStar_TypeChecker_Env.curmodule);
          FStar_TypeChecker_Env.gamma =
            (uu___341_7134.FStar_TypeChecker_Env.gamma);
          FStar_TypeChecker_Env.gamma_sig =
            (uu___341_7134.FStar_TypeChecker_Env.gamma_sig);
          FStar_TypeChecker_Env.gamma_cache =
            (uu___341_7134.FStar_TypeChecker_Env.gamma_cache);
          FStar_TypeChecker_Env.modules =
            (uu___341_7134.FStar_TypeChecker_Env.modules);
          FStar_TypeChecker_Env.expected_typ =
            (uu___341_7134.FStar_TypeChecker_Env.expected_typ);
          FStar_TypeChecker_Env.sigtab =
            (uu___341_7134.FStar_TypeChecker_Env.sigtab);
          FStar_TypeChecker_Env.is_pattern =
            (uu___341_7134.FStar_TypeChecker_Env.is_pattern);
          FStar_TypeChecker_Env.instantiate_imp =
            (uu___341_7134.FStar_TypeChecker_Env.instantiate_imp);
          FStar_TypeChecker_Env.effects =
            (uu___341_7134.FStar_TypeChecker_Env.effects);
          FStar_TypeChecker_Env.generalize =
            (uu___341_7134.FStar_TypeChecker_Env.generalize);
          FStar_TypeChecker_Env.letrecs =
            (uu___341_7134.FStar_TypeChecker_Env.letrecs);
          FStar_TypeChecker_Env.top_level =
            (uu___341_7134.FStar_TypeChecker_Env.top_level);
          FStar_TypeChecker_Env.check_uvars =
            (uu___341_7134.FStar_TypeChecker_Env.check_uvars);
          FStar_TypeChecker_Env.use_eq =
            (uu___341_7134.FStar_TypeChecker_Env.use_eq);
          FStar_TypeChecker_Env.is_iface =
            (uu___341_7134.FStar_TypeChecker_Env.is_iface);
          FStar_TypeChecker_Env.admit =
            (uu___341_7134.FStar_TypeChecker_Env.admit);
          FStar_TypeChecker_Env.lax =
            (uu___341_7134.FStar_TypeChecker_Env.lax);
          FStar_TypeChecker_Env.lax_universes =
            (uu___341_7134.FStar_TypeChecker_Env.lax_universes);
          FStar_TypeChecker_Env.phase1 =
            (uu___341_7134.FStar_TypeChecker_Env.phase1);
          FStar_TypeChecker_Env.failhard = true;
          FStar_TypeChecker_Env.nosynth =
            (uu___341_7134.FStar_TypeChecker_Env.nosynth);
          FStar_TypeChecker_Env.uvar_subtyping =
            (uu___341_7134.FStar_TypeChecker_Env.uvar_subtyping);
          FStar_TypeChecker_Env.tc_term =
            (uu___341_7134.FStar_TypeChecker_Env.tc_term);
          FStar_TypeChecker_Env.type_of =
            (uu___341_7134.FStar_TypeChecker_Env.type_of);
          FStar_TypeChecker_Env.universe_of =
            (uu___341_7134.FStar_TypeChecker_Env.universe_of);
          FStar_TypeChecker_Env.check_type_of =
            (uu___341_7134.FStar_TypeChecker_Env.check_type_of);
          FStar_TypeChecker_Env.use_bv_sorts =
            (uu___341_7134.FStar_TypeChecker_Env.use_bv_sorts);
          FStar_TypeChecker_Env.qtbl_name_and_index =
            (uu___341_7134.FStar_TypeChecker_Env.qtbl_name_and_index);
          FStar_TypeChecker_Env.normalized_eff_names =
            (uu___341_7134.FStar_TypeChecker_Env.normalized_eff_names);
          FStar_TypeChecker_Env.proof_ns =
            (uu___341_7134.FStar_TypeChecker_Env.proof_ns);
          FStar_TypeChecker_Env.synth_hook =
            (uu___341_7134.FStar_TypeChecker_Env.synth_hook);
          FStar_TypeChecker_Env.splice =
            (uu___341_7134.FStar_TypeChecker_Env.splice);
          FStar_TypeChecker_Env.is_native_tactic =
            (uu___341_7134.FStar_TypeChecker_Env.is_native_tactic);
          FStar_TypeChecker_Env.identifier_info =
            (uu___341_7134.FStar_TypeChecker_Env.identifier_info);
          FStar_TypeChecker_Env.tc_hooks =
            (uu___341_7134.FStar_TypeChecker_Env.tc_hooks);
          FStar_TypeChecker_Env.dsenv =
            (uu___341_7134.FStar_TypeChecker_Env.dsenv);
          FStar_TypeChecker_Env.dep_graph =
            (uu___341_7134.FStar_TypeChecker_Env.dep_graph)
        }  in
      tc_check_tot_or_gtot_term env1 tau FStar_Syntax_Syntax.t_tac_unit

and (tc_tactic_opt :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax
      FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun topt  ->
      match topt with
      | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
      | FStar_Pervasives_Native.Some tactic ->
          let uu____7150 = tc_tactic env tactic  in
          (match uu____7150 with
           | (tactic1,uu____7160,uu____7161) ->
               FStar_Pervasives_Native.Some tactic1)

and (tc_value :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      let check_instantiated_fvar env1 v1 dc e1 t0 =
        let uu____7210 = FStar_TypeChecker_Util.maybe_instantiate env1 e1 t0
           in
        match uu____7210 with
        | (e2,t,implicits) ->
            let tc =
              let uu____7231 = FStar_TypeChecker_Env.should_verify env1  in
              if uu____7231
              then FStar_Util.Inl t
              else
                (let uu____7237 =
                   let uu____7238 = FStar_Syntax_Syntax.mk_Total t  in
                   FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp
                     uu____7238
                    in
                 FStar_Util.Inr uu____7237)
               in
            let is_data_ctor uu___329_7246 =
              match uu___329_7246 with
              | FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor )
                  -> true
              | FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_ctor
                  uu____7249) -> true
              | uu____7256 -> false  in
            let uu____7259 =
              (is_data_ctor dc) &&
                (let uu____7261 =
                   FStar_TypeChecker_Env.is_datacon env1
                     v1.FStar_Syntax_Syntax.v
                    in
                 Prims.op_Negation uu____7261)
               in
            if uu____7259
            then
              let uu____7268 =
                let uu____7273 =
                  FStar_Util.format1 "Expected a data constructor; got %s"
                    (v1.FStar_Syntax_Syntax.v).FStar_Ident.str
                   in
                (FStar_Errors.Fatal_MissingDataConstructor, uu____7273)  in
              let uu____7274 = FStar_TypeChecker_Env.get_range env1  in
              FStar_Errors.raise_error uu____7268 uu____7274
            else value_check_expected_typ env1 e2 tc implicits
         in
      let env1 =
        FStar_TypeChecker_Env.set_range env e.FStar_Syntax_Syntax.pos  in
      let top = FStar_Syntax_Subst.compress e  in
      match top.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_bvar x ->
          let uu____7291 =
            let uu____7292 = FStar_Syntax_Print.term_to_string top  in
            FStar_Util.format1
              "Impossible: Violation of locally nameless convention: %s"
              uu____7292
             in
          failwith uu____7291
      | FStar_Syntax_Syntax.Tm_uvar (u,s) ->
          let uu____7317 =
            let uu____7322 =
              FStar_Syntax_Subst.subst' s u.FStar_Syntax_Syntax.ctx_uvar_typ
               in
            FStar_Util.Inl uu____7322  in
          value_check_expected_typ env1 e uu____7317
            FStar_TypeChecker_Env.trivial_guard
      | FStar_Syntax_Syntax.Tm_unknown  ->
          let r = FStar_TypeChecker_Env.get_range env1  in
          let uu____7324 =
            let uu____7337 = FStar_TypeChecker_Env.expected_typ env1  in
            match uu____7337 with
            | FStar_Pervasives_Native.None  ->
                let uu____7352 = FStar_Syntax_Util.type_u ()  in
                (match uu____7352 with
                 | (k,u) ->
                     FStar_TypeChecker_Util.new_implicit_var
                       "type of user-provided implicit term" r env1 k)
            | FStar_Pervasives_Native.Some t ->
                (t, [], FStar_TypeChecker_Env.trivial_guard)
             in
          (match uu____7324 with
           | (t,uu____7389,g0) ->
               let uu____7403 =
                 FStar_TypeChecker_Util.new_implicit_var
                   "user-provided implicit term" r env1 t
                  in
               (match uu____7403 with
                | (e1,uu____7423,g1) ->
                    let uu____7437 =
                      let uu____7438 = FStar_Syntax_Syntax.mk_Total t  in
                      FStar_All.pipe_right uu____7438
                        FStar_Syntax_Util.lcomp_of_comp
                       in
                    let uu____7439 = FStar_TypeChecker_Env.conj_guard g0 g1
                       in
                    (e1, uu____7437, uu____7439)))
      | FStar_Syntax_Syntax.Tm_name x ->
          let uu____7441 =
            if env1.FStar_TypeChecker_Env.use_bv_sorts
            then
              let uu____7450 = FStar_Syntax_Syntax.range_of_bv x  in
              ((x.FStar_Syntax_Syntax.sort), uu____7450)
            else FStar_TypeChecker_Env.lookup_bv env1 x  in
          (match uu____7441 with
           | (t,rng) ->
               let x1 =
                 FStar_Syntax_Syntax.set_range_of_bv
                   (let uu___342_7463 = x  in
                    {
                      FStar_Syntax_Syntax.ppname =
                        (uu___342_7463.FStar_Syntax_Syntax.ppname);
                      FStar_Syntax_Syntax.index =
                        (uu___342_7463.FStar_Syntax_Syntax.index);
                      FStar_Syntax_Syntax.sort = t
                    }) rng
                  in
               (FStar_TypeChecker_Env.insert_bv_info env1 x1 t;
                (let e1 = FStar_Syntax_Syntax.bv_to_name x1  in
                 let uu____7466 =
                   FStar_TypeChecker_Util.maybe_instantiate env1 e1 t  in
                 match uu____7466 with
                 | (e2,t1,implicits) ->
                     let tc =
                       let uu____7487 =
                         FStar_TypeChecker_Env.should_verify env1  in
                       if uu____7487
                       then FStar_Util.Inl t1
                       else
                         (let uu____7493 =
                            let uu____7494 = FStar_Syntax_Syntax.mk_Total t1
                               in
                            FStar_All.pipe_left
                              FStar_Syntax_Util.lcomp_of_comp uu____7494
                             in
                          FStar_Util.Inr uu____7493)
                        in
                     value_check_expected_typ env1 e2 tc implicits)))
      | FStar_Syntax_Syntax.Tm_uinst
          ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
             FStar_Syntax_Syntax.pos = uu____7496;
             FStar_Syntax_Syntax.vars = uu____7497;_},uu____7498)
          when
          (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.synth_lid) &&
            (Prims.op_Negation env1.FStar_TypeChecker_Env.phase1)
          ->
          let uu____7503 = FStar_TypeChecker_Env.get_range env1  in
          FStar_Errors.raise_error
            (FStar_Errors.Fatal_BadlyInstantiatedSynthByTactic,
              "Badly instantiated synth_by_tactic") uu____7503
      | FStar_Syntax_Syntax.Tm_fvar fv when
          (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.synth_lid) &&
            (Prims.op_Negation env1.FStar_TypeChecker_Env.phase1)
          ->
          let uu____7511 = FStar_TypeChecker_Env.get_range env1  in
          FStar_Errors.raise_error
            (FStar_Errors.Fatal_BadlyInstantiatedSynthByTactic,
              "Badly instantiated synth_by_tactic") uu____7511
      | FStar_Syntax_Syntax.Tm_uinst
          ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
             FStar_Syntax_Syntax.pos = uu____7519;
             FStar_Syntax_Syntax.vars = uu____7520;_},us)
          ->
          let us1 = FStar_List.map (tc_universe env1) us  in
          let uu____7529 =
            FStar_TypeChecker_Env.lookup_lid env1
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          (match uu____7529 with
           | ((us',t),range) ->
               (if (FStar_List.length us1) <> (FStar_List.length us')
                then
                  (let uu____7552 =
                     let uu____7557 =
                       let uu____7558 = FStar_Syntax_Print.fv_to_string fv
                          in
                       let uu____7559 =
                         FStar_Util.string_of_int (FStar_List.length us1)  in
                       let uu____7560 =
                         FStar_Util.string_of_int (FStar_List.length us')  in
                       FStar_Util.format3
                         "Unexpected number of universe instantiations for \"%s\" (%s vs %s)"
                         uu____7558 uu____7559 uu____7560
                        in
                     (FStar_Errors.Fatal_UnexpectedNumberOfUniverse,
                       uu____7557)
                      in
                   let uu____7561 = FStar_TypeChecker_Env.get_range env1  in
                   FStar_Errors.raise_error uu____7552 uu____7561)
                else
                  FStar_List.iter2
                    (fun u'  ->
                       fun u  ->
                         match u' with
                         | FStar_Syntax_Syntax.U_unif u'' ->
                             FStar_Syntax_Unionfind.univ_change u'' u
                         | uu____7577 -> failwith "Impossible") us' us1;
                (let fv' = FStar_Syntax_Syntax.set_range_of_fv fv range  in
                 FStar_TypeChecker_Env.insert_fv_info env1 fv' t;
                 (let e1 =
                    let uu____7581 =
                      FStar_Syntax_Syntax.mk
                        (FStar_Syntax_Syntax.Tm_fvar fv')
                        FStar_Pervasives_Native.None
                        e.FStar_Syntax_Syntax.pos
                       in
                    FStar_Syntax_Syntax.mk_Tm_uinst uu____7581 us1  in
                  check_instantiated_fvar env1
                    fv'.FStar_Syntax_Syntax.fv_name
                    fv'.FStar_Syntax_Syntax.fv_qual e1 t))))
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let uu____7583 =
            FStar_TypeChecker_Env.lookup_lid env1
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          (match uu____7583 with
           | ((us,t),range) ->
               ((let uu____7606 =
                   FStar_All.pipe_left (FStar_TypeChecker_Env.debug env1)
                     (FStar_Options.Other "Range")
                    in
                 if uu____7606
                 then
                   let uu____7607 =
                     let uu____7608 = FStar_Syntax_Syntax.lid_of_fv fv  in
                     FStar_Syntax_Print.lid_to_string uu____7608  in
                   let uu____7609 =
                     FStar_Range.string_of_range e.FStar_Syntax_Syntax.pos
                      in
                   let uu____7610 = FStar_Range.string_of_range range  in
                   let uu____7611 = FStar_Range.string_of_use_range range  in
                   let uu____7612 = FStar_Syntax_Print.term_to_string t  in
                   FStar_Util.print5
                     "Lookup up fvar %s at location %s (lid range = defined at %s, used at %s); got universes type %s"
                     uu____7607 uu____7609 uu____7610 uu____7611 uu____7612
                 else ());
                (let fv' = FStar_Syntax_Syntax.set_range_of_fv fv range  in
                 FStar_TypeChecker_Env.insert_fv_info env1 fv' t;
                 (let e1 =
                    let uu____7617 =
                      FStar_Syntax_Syntax.mk
                        (FStar_Syntax_Syntax.Tm_fvar fv')
                        FStar_Pervasives_Native.None
                        e.FStar_Syntax_Syntax.pos
                       in
                    FStar_Syntax_Syntax.mk_Tm_uinst uu____7617 us  in
                  check_instantiated_fvar env1
                    fv'.FStar_Syntax_Syntax.fv_name
                    fv'.FStar_Syntax_Syntax.fv_qual e1 t))))
      | FStar_Syntax_Syntax.Tm_constant c ->
          let t = tc_constant env1 top.FStar_Syntax_Syntax.pos c  in
          let e1 =
            FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant c)
              FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos
             in
          value_check_expected_typ env1 e1 (FStar_Util.Inl t)
            FStar_TypeChecker_Env.trivial_guard
      | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
          let uu____7641 = FStar_Syntax_Subst.open_comp bs c  in
          (match uu____7641 with
           | (bs1,c1) ->
               let env0 = env1  in
               let uu____7655 = FStar_TypeChecker_Env.clear_expected_typ env1
                  in
               (match uu____7655 with
                | (env2,uu____7669) ->
                    let uu____7674 = tc_binders env2 bs1  in
                    (match uu____7674 with
                     | (bs2,env3,g,us) ->
                         let uu____7693 = tc_comp env3 c1  in
                         (match uu____7693 with
                          | (c2,uc,f) ->
                              let e1 =
                                let uu___343_7712 =
                                  FStar_Syntax_Util.arrow bs2 c2  in
                                {
                                  FStar_Syntax_Syntax.n =
                                    (uu___343_7712.FStar_Syntax_Syntax.n);
                                  FStar_Syntax_Syntax.pos =
                                    (top.FStar_Syntax_Syntax.pos);
                                  FStar_Syntax_Syntax.vars =
                                    (uu___343_7712.FStar_Syntax_Syntax.vars)
                                }  in
                              (check_smt_pat env3 e1 bs2 c2;
                               (let u = FStar_Syntax_Syntax.U_max (uc :: us)
                                   in
                                let t =
                                  FStar_Syntax_Syntax.mk
                                    (FStar_Syntax_Syntax.Tm_type u)
                                    FStar_Pervasives_Native.None
                                    top.FStar_Syntax_Syntax.pos
                                   in
                                let g1 =
                                  let uu____7721 =
                                    FStar_TypeChecker_Env.close_guard_univs
                                      us bs2 f
                                     in
                                  FStar_TypeChecker_Env.conj_guard g
                                    uu____7721
                                   in
                                let g2 =
                                  FStar_TypeChecker_Util.close_guard_implicits
                                    env3 bs2 g1
                                   in
                                value_check_expected_typ env0 e1
                                  (FStar_Util.Inl t) g2))))))
      | FStar_Syntax_Syntax.Tm_type u ->
          let u1 = tc_universe env1 u  in
          let t =
            FStar_Syntax_Syntax.mk
              (FStar_Syntax_Syntax.Tm_type (FStar_Syntax_Syntax.U_succ u1))
              FStar_Pervasives_Native.None top.FStar_Syntax_Syntax.pos
             in
          let e1 =
            FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type u1)
              FStar_Pervasives_Native.None top.FStar_Syntax_Syntax.pos
             in
          value_check_expected_typ env1 e1 (FStar_Util.Inl t)
            FStar_TypeChecker_Env.trivial_guard
      | FStar_Syntax_Syntax.Tm_refine (x,phi) ->
          let uu____7737 =
            let uu____7742 =
              let uu____7743 = FStar_Syntax_Syntax.mk_binder x  in
              [uu____7743]  in
            FStar_Syntax_Subst.open_term uu____7742 phi  in
          (match uu____7737 with
           | (x1,phi1) ->
               let env0 = env1  in
               let uu____7765 = FStar_TypeChecker_Env.clear_expected_typ env1
                  in
               (match uu____7765 with
                | (env2,uu____7779) ->
                    let uu____7784 =
                      let uu____7797 = FStar_List.hd x1  in
                      tc_binder env2 uu____7797  in
                    (match uu____7784 with
                     | (x2,env3,f1,u) ->
                         ((let uu____7825 =
                             FStar_TypeChecker_Env.debug env3
                               FStar_Options.High
                              in
                           if uu____7825
                           then
                             let uu____7826 =
                               FStar_Range.string_of_range
                                 top.FStar_Syntax_Syntax.pos
                                in
                             let uu____7827 =
                               FStar_Syntax_Print.term_to_string phi1  in
                             let uu____7828 =
                               FStar_Syntax_Print.bv_to_string
                                 (FStar_Pervasives_Native.fst x2)
                                in
                             FStar_Util.print3
                               "(%s) Checking refinement formula %s; binder is %s\n"
                               uu____7826 uu____7827 uu____7828
                           else ());
                          (let uu____7830 = FStar_Syntax_Util.type_u ()  in
                           match uu____7830 with
                           | (t_phi,uu____7842) ->
                               let uu____7843 =
                                 tc_check_tot_or_gtot_term env3 phi1 t_phi
                                  in
                               (match uu____7843 with
                                | (phi2,uu____7857,f2) ->
                                    let e1 =
                                      let uu___344_7862 =
                                        FStar_Syntax_Util.refine
                                          (FStar_Pervasives_Native.fst x2)
                                          phi2
                                         in
                                      {
                                        FStar_Syntax_Syntax.n =
                                          (uu___344_7862.FStar_Syntax_Syntax.n);
                                        FStar_Syntax_Syntax.pos =
                                          (top.FStar_Syntax_Syntax.pos);
                                        FStar_Syntax_Syntax.vars =
                                          (uu___344_7862.FStar_Syntax_Syntax.vars)
                                      }  in
                                    let t =
                                      FStar_Syntax_Syntax.mk
                                        (FStar_Syntax_Syntax.Tm_type u)
                                        FStar_Pervasives_Native.None
                                        top.FStar_Syntax_Syntax.pos
                                       in
                                    let g =
                                      let uu____7869 =
                                        FStar_TypeChecker_Env.close_guard_univs
                                          [u] [x2] f2
                                         in
                                      FStar_TypeChecker_Env.conj_guard f1
                                        uu____7869
                                       in
                                    let g1 =
                                      FStar_TypeChecker_Util.close_guard_implicits
                                        env3 [x2] g
                                       in
                                    value_check_expected_typ env0 e1
                                      (FStar_Util.Inl t) g1))))))
      | FStar_Syntax_Syntax.Tm_abs (bs,body,uu____7889) ->
          let bs1 = FStar_TypeChecker_Util.maybe_add_implicit_binders env1 bs
             in
          ((let uu____7912 =
              FStar_TypeChecker_Env.debug env1 FStar_Options.Low  in
            if uu____7912
            then
              let uu____7913 =
                FStar_Syntax_Print.term_to_string
                  (let uu___345_7916 = top  in
                   {
                     FStar_Syntax_Syntax.n =
                       (FStar_Syntax_Syntax.Tm_abs
                          (bs1, body, FStar_Pervasives_Native.None));
                     FStar_Syntax_Syntax.pos =
                       (uu___345_7916.FStar_Syntax_Syntax.pos);
                     FStar_Syntax_Syntax.vars =
                       (uu___345_7916.FStar_Syntax_Syntax.vars)
                   })
                 in
              FStar_Util.print1 "Abstraction is: %s\n" uu____7913
            else ());
           (let uu____7928 = FStar_Syntax_Subst.open_term bs1 body  in
            match uu____7928 with | (bs2,body1) -> tc_abs env1 top bs2 body1))
      | uu____7941 ->
          let uu____7942 =
            let uu____7943 = FStar_Syntax_Print.term_to_string top  in
            let uu____7944 = FStar_Syntax_Print.tag_of_term top  in
            FStar_Util.format2 "Unexpected value: %s (%s)" uu____7943
              uu____7944
             in
          failwith uu____7942

and (tc_constant :
  FStar_TypeChecker_Env.env ->
    FStar_Range.range -> FStar_Const.sconst -> FStar_Syntax_Syntax.typ)
  =
  fun env  ->
    fun r  ->
      fun c  ->
        match c with
        | FStar_Const.Const_unit  -> FStar_Syntax_Syntax.t_unit
        | FStar_Const.Const_bool uu____7954 -> FStar_Syntax_Util.t_bool
        | FStar_Const.Const_int (uu____7955,FStar_Pervasives_Native.None ) ->
            FStar_Syntax_Syntax.t_int
        | FStar_Const.Const_int
            (uu____7966,FStar_Pervasives_Native.Some msize) ->
            FStar_Syntax_Syntax.tconst
              (match msize with
               | (FStar_Const.Signed ,FStar_Const.Int8 ) ->
                   FStar_Parser_Const.int8_lid
               | (FStar_Const.Signed ,FStar_Const.Int16 ) ->
                   FStar_Parser_Const.int16_lid
               | (FStar_Const.Signed ,FStar_Const.Int32 ) ->
                   FStar_Parser_Const.int32_lid
               | (FStar_Const.Signed ,FStar_Const.Int64 ) ->
                   FStar_Parser_Const.int64_lid
               | (FStar_Const.Unsigned ,FStar_Const.Int8 ) ->
                   FStar_Parser_Const.uint8_lid
               | (FStar_Const.Unsigned ,FStar_Const.Int16 ) ->
                   FStar_Parser_Const.uint16_lid
               | (FStar_Const.Unsigned ,FStar_Const.Int32 ) ->
                   FStar_Parser_Const.uint32_lid
               | (FStar_Const.Unsigned ,FStar_Const.Int64 ) ->
                   FStar_Parser_Const.uint64_lid)
        | FStar_Const.Const_string uu____7982 -> FStar_Syntax_Syntax.t_string
        | FStar_Const.Const_float uu____7987 -> FStar_Syntax_Syntax.t_float
        | FStar_Const.Const_char uu____7988 ->
            let uu____7990 =
              let uu____7995 =
                FStar_Syntax_DsEnv.try_lookup_lid
                  env.FStar_TypeChecker_Env.dsenv FStar_Parser_Const.char_lid
                 in
              FStar_All.pipe_right uu____7995 FStar_Util.must  in
            FStar_All.pipe_right uu____7990 FStar_Pervasives_Native.fst
        | FStar_Const.Const_effect  -> FStar_Syntax_Util.ktype0
        | FStar_Const.Const_range uu____8020 -> FStar_Syntax_Syntax.t_range
        | FStar_Const.Const_range_of  ->
            let uu____8021 =
              let uu____8026 =
                let uu____8027 = FStar_Parser_Const.const_to_string c  in
                FStar_Util.format1
                  "Ill-typed %s: this constant must be fully applied"
                  uu____8027
                 in
              (FStar_Errors.Fatal_IllTyped, uu____8026)  in
            FStar_Errors.raise_error uu____8021 r
        | FStar_Const.Const_set_range_of  ->
            let uu____8028 =
              let uu____8033 =
                let uu____8034 = FStar_Parser_Const.const_to_string c  in
                FStar_Util.format1
                  "Ill-typed %s: this constant must be fully applied"
                  uu____8034
                 in
              (FStar_Errors.Fatal_IllTyped, uu____8033)  in
            FStar_Errors.raise_error uu____8028 r
        | FStar_Const.Const_reify  ->
            let uu____8035 =
              let uu____8040 =
                let uu____8041 = FStar_Parser_Const.const_to_string c  in
                FStar_Util.format1
                  "Ill-typed %s: this constant must be fully applied"
                  uu____8041
                 in
              (FStar_Errors.Fatal_IllTyped, uu____8040)  in
            FStar_Errors.raise_error uu____8035 r
        | FStar_Const.Const_reflect uu____8042 ->
            let uu____8043 =
              let uu____8048 =
                let uu____8049 = FStar_Parser_Const.const_to_string c  in
                FStar_Util.format1
                  "Ill-typed %s: this constant must be fully applied"
                  uu____8049
                 in
              (FStar_Errors.Fatal_IllTyped, uu____8048)  in
            FStar_Errors.raise_error uu____8043 r
        | uu____8050 ->
            FStar_Errors.raise_error
              (FStar_Errors.Fatal_UnsupportedConstant,
                "Unsupported constant") r

and (tc_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      (FStar_Syntax_Syntax.comp,FStar_Syntax_Syntax.universe,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun c  ->
      let c0 = c  in
      match c.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Total (t,uu____8067) ->
          let uu____8076 = FStar_Syntax_Util.type_u ()  in
          (match uu____8076 with
           | (k,u) ->
               let uu____8089 = tc_check_tot_or_gtot_term env t k  in
               (match uu____8089 with
                | (t1,uu____8103,g) ->
                    let uu____8105 =
                      FStar_Syntax_Syntax.mk_Total' t1
                        (FStar_Pervasives_Native.Some u)
                       in
                    (uu____8105, u, g)))
      | FStar_Syntax_Syntax.GTotal (t,uu____8107) ->
          let uu____8116 = FStar_Syntax_Util.type_u ()  in
          (match uu____8116 with
           | (k,u) ->
               let uu____8129 = tc_check_tot_or_gtot_term env t k  in
               (match uu____8129 with
                | (t1,uu____8143,g) ->
                    let uu____8145 =
                      FStar_Syntax_Syntax.mk_GTotal' t1
                        (FStar_Pervasives_Native.Some u)
                       in
                    (uu____8145, u, g)))
      | FStar_Syntax_Syntax.Comp c1 ->
          let head1 =
            FStar_Syntax_Syntax.fvar c1.FStar_Syntax_Syntax.effect_name
              FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
             in
          let head2 =
            match c1.FStar_Syntax_Syntax.comp_univs with
            | [] -> head1
            | us ->
                FStar_Syntax_Syntax.mk
                  (FStar_Syntax_Syntax.Tm_uinst (head1, us))
                  FStar_Pervasives_Native.None c0.FStar_Syntax_Syntax.pos
             in
          let tc =
            let uu____8155 =
              let uu____8160 =
                let uu____8161 =
                  FStar_Syntax_Syntax.as_arg
                    c1.FStar_Syntax_Syntax.result_typ
                   in
                uu____8161 :: (c1.FStar_Syntax_Syntax.effect_args)  in
              FStar_Syntax_Syntax.mk_Tm_app head2 uu____8160  in
            uu____8155 FStar_Pervasives_Native.None
              (c1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos
             in
          let uu____8176 =
            tc_check_tot_or_gtot_term env tc FStar_Syntax_Syntax.teff  in
          (match uu____8176 with
           | (tc1,uu____8190,f) ->
               let uu____8192 = FStar_Syntax_Util.head_and_args tc1  in
               (match uu____8192 with
                | (head3,args) ->
                    let comp_univs =
                      let uu____8236 =
                        let uu____8237 = FStar_Syntax_Subst.compress head3
                           in
                        uu____8237.FStar_Syntax_Syntax.n  in
                      match uu____8236 with
                      | FStar_Syntax_Syntax.Tm_uinst (uu____8240,us) -> us
                      | uu____8246 -> []  in
                    let uu____8247 = FStar_Syntax_Util.head_and_args tc1  in
                    (match uu____8247 with
                     | (uu____8268,args1) ->
                         let uu____8290 =
                           let uu____8309 = FStar_List.hd args1  in
                           let uu____8322 = FStar_List.tl args1  in
                           (uu____8309, uu____8322)  in
                         (match uu____8290 with
                          | (res,args2) ->
                              let uu____8387 =
                                let uu____8396 =
                                  FStar_All.pipe_right
                                    c1.FStar_Syntax_Syntax.flags
                                    (FStar_List.map
                                       (fun uu___330_8424  ->
                                          match uu___330_8424 with
                                          | FStar_Syntax_Syntax.DECREASES e
                                              ->
                                              let uu____8432 =
                                                FStar_TypeChecker_Env.clear_expected_typ
                                                  env
                                                 in
                                              (match uu____8432 with
                                               | (env1,uu____8444) ->
                                                   let uu____8449 =
                                                     tc_tot_or_gtot_term env1
                                                       e
                                                      in
                                                   (match uu____8449 with
                                                    | (e1,uu____8461,g) ->
                                                        ((FStar_Syntax_Syntax.DECREASES
                                                            e1), g)))
                                          | f1 ->
                                              (f1,
                                                FStar_TypeChecker_Env.trivial_guard)))
                                   in
                                FStar_All.pipe_right uu____8396
                                  FStar_List.unzip
                                 in
                              (match uu____8387 with
                               | (flags1,guards) ->
                                   let u =
                                     env.FStar_TypeChecker_Env.universe_of
                                       env (FStar_Pervasives_Native.fst res)
                                      in
                                   let c2 =
                                     FStar_Syntax_Syntax.mk_Comp
                                       (let uu___346_8500 = c1  in
                                        {
                                          FStar_Syntax_Syntax.comp_univs =
                                            comp_univs;
                                          FStar_Syntax_Syntax.effect_name =
                                            (uu___346_8500.FStar_Syntax_Syntax.effect_name);
                                          FStar_Syntax_Syntax.result_typ =
                                            (FStar_Pervasives_Native.fst res);
                                          FStar_Syntax_Syntax.effect_args =
                                            args2;
                                          FStar_Syntax_Syntax.flags =
                                            (uu___346_8500.FStar_Syntax_Syntax.flags)
                                        })
                                      in
                                   let u_c =
                                     let uu____8504 =
                                       FStar_TypeChecker_Env.effect_repr env
                                         c2 u
                                        in
                                     match uu____8504 with
                                     | FStar_Pervasives_Native.None  -> u
                                     | FStar_Pervasives_Native.Some tm ->
                                         env.FStar_TypeChecker_Env.universe_of
                                           env tm
                                      in
                                   let uu____8508 =
                                     FStar_List.fold_left
                                       FStar_TypeChecker_Env.conj_guard f
                                       guards
                                      in
                                   (c2, u_c, uu____8508))))))

and (tc_universe :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe)
  =
  fun env  ->
    fun u  ->
      let rec aux u1 =
        let u2 = FStar_Syntax_Subst.compress_univ u1  in
        match u2 with
        | FStar_Syntax_Syntax.U_bvar uu____8518 ->
            failwith "Impossible: locally nameless"
        | FStar_Syntax_Syntax.U_unknown  -> failwith "Unknown universe"
        | FStar_Syntax_Syntax.U_unif uu____8519 -> u2
        | FStar_Syntax_Syntax.U_zero  -> u2
        | FStar_Syntax_Syntax.U_succ u3 ->
            let uu____8529 = aux u3  in FStar_Syntax_Syntax.U_succ uu____8529
        | FStar_Syntax_Syntax.U_max us ->
            let uu____8533 = FStar_List.map aux us  in
            FStar_Syntax_Syntax.U_max uu____8533
        | FStar_Syntax_Syntax.U_name x ->
            let uu____8537 =
              env.FStar_TypeChecker_Env.use_bv_sorts ||
                (FStar_TypeChecker_Env.lookup_univ env x)
               in
            if uu____8537
            then u2
            else
              (let uu____8539 =
                 let uu____8540 =
                   let uu____8541 = FStar_Syntax_Print.univ_to_string u2  in
                   Prims.strcat uu____8541 " not found"  in
                 Prims.strcat "Universe variable " uu____8540  in
               failwith uu____8539)
         in
      if env.FStar_TypeChecker_Env.lax_universes
      then FStar_Syntax_Syntax.U_zero
      else
        (match u with
         | FStar_Syntax_Syntax.U_unknown  ->
             let uu____8543 = FStar_Syntax_Util.type_u ()  in
             FStar_All.pipe_right uu____8543 FStar_Pervasives_Native.snd
         | uu____8552 -> aux u)

and (tc_abs :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.binders ->
        FStar_Syntax_Syntax.term ->
          (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
            FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun top  ->
      fun bs  ->
        fun body  ->
          let fail1 msg t =
            let uu____8581 =
              FStar_TypeChecker_Err.expected_a_term_of_type_t_got_a_function
                env msg t top
               in
            FStar_Errors.raise_error uu____8581 top.FStar_Syntax_Syntax.pos
             in
          let check_binders env1 bs1 bs_expected =
            let rec aux uu____8699 bs2 bs_expected1 =
              match uu____8699 with
              | (env2,out,g,subst1) ->
                  (match (bs2, bs_expected1) with
                   | ([],[]) ->
                       (env2, (FStar_List.rev out),
                         FStar_Pervasives_Native.None, g, subst1)
                   | ((hd1,imp)::bs3,(hd_expected,imp')::bs_expected2) ->
                       ((match (imp, imp') with
                         | (FStar_Pervasives_Native.None
                            ,FStar_Pervasives_Native.Some
                            (FStar_Syntax_Syntax.Implicit uu____8931)) ->
                             let uu____8936 =
                               let uu____8941 =
                                 let uu____8942 =
                                   FStar_Syntax_Print.bv_to_string hd1  in
                                 FStar_Util.format1
                                   "Inconsistent implicit argument annotation on argument %s"
                                   uu____8942
                                  in
                               (FStar_Errors.Fatal_InconsistentImplicitArgumentAnnotation,
                                 uu____8941)
                                in
                             let uu____8943 =
                               FStar_Syntax_Syntax.range_of_bv hd1  in
                             FStar_Errors.raise_error uu____8936 uu____8943
                         | (FStar_Pervasives_Native.Some
                            (FStar_Syntax_Syntax.Implicit
                            uu____8944),FStar_Pervasives_Native.None ) ->
                             let uu____8949 =
                               let uu____8954 =
                                 let uu____8955 =
                                   FStar_Syntax_Print.bv_to_string hd1  in
                                 FStar_Util.format1
                                   "Inconsistent implicit argument annotation on argument %s"
                                   uu____8955
                                  in
                               (FStar_Errors.Fatal_InconsistentImplicitArgumentAnnotation,
                                 uu____8954)
                                in
                             let uu____8956 =
                               FStar_Syntax_Syntax.range_of_bv hd1  in
                             FStar_Errors.raise_error uu____8949 uu____8956
                         | uu____8957 -> ());
                        (let expected_t =
                           FStar_Syntax_Subst.subst subst1
                             hd_expected.FStar_Syntax_Syntax.sort
                            in
                         let uu____8967 =
                           let uu____8974 =
                             let uu____8975 =
                               FStar_Syntax_Util.unmeta
                                 hd1.FStar_Syntax_Syntax.sort
                                in
                             uu____8975.FStar_Syntax_Syntax.n  in
                           match uu____8974 with
                           | FStar_Syntax_Syntax.Tm_unknown  ->
                               (expected_t, g)
                           | uu____8986 ->
                               ((let uu____8988 =
                                   FStar_TypeChecker_Env.debug env2
                                     FStar_Options.High
                                    in
                                 if uu____8988
                                 then
                                   let uu____8989 =
                                     FStar_Syntax_Print.bv_to_string hd1  in
                                   FStar_Util.print1 "Checking binder %s\n"
                                     uu____8989
                                 else ());
                                (let uu____8991 =
                                   tc_tot_or_gtot_term env2
                                     hd1.FStar_Syntax_Syntax.sort
                                    in
                                 match uu____8991 with
                                 | (t,uu____9005,g1) ->
                                     let g2 =
                                       let uu____9008 =
                                         FStar_TypeChecker_Rel.teq_nosmt env2
                                           t expected_t
                                          in
                                       if uu____9008
                                       then
                                         FStar_TypeChecker_Env.trivial_guard
                                       else
                                         (let uu____9010 =
                                            FStar_TypeChecker_Rel.get_subtyping_prop
                                              env2 expected_t t
                                             in
                                          match uu____9010 with
                                          | FStar_Pervasives_Native.None  ->
                                              let uu____9013 =
                                                FStar_TypeChecker_Err.basic_type_error
                                                  env2
                                                  FStar_Pervasives_Native.None
                                                  expected_t t
                                                 in
                                              let uu____9018 =
                                                FStar_TypeChecker_Env.get_range
                                                  env2
                                                 in
                                              FStar_Errors.raise_error
                                                uu____9013 uu____9018
                                          | FStar_Pervasives_Native.Some g2
                                              ->
                                              let uu____9020 =
                                                FStar_TypeChecker_Env.get_range
                                                  env2
                                                 in
                                              FStar_TypeChecker_Util.label_guard
                                                uu____9020
                                                "Type annotation on parameter incompatible with the expected type"
                                                g2)
                                        in
                                     let g3 =
                                       let uu____9022 =
                                         FStar_TypeChecker_Env.conj_guard g1
                                           g2
                                          in
                                       FStar_TypeChecker_Env.conj_guard g
                                         uu____9022
                                        in
                                     (t, g3)))
                            in
                         match uu____8967 with
                         | (t,g1) ->
                             let hd2 =
                               let uu___347_9068 = hd1  in
                               {
                                 FStar_Syntax_Syntax.ppname =
                                   (uu___347_9068.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___347_9068.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = t
                               }  in
                             let b = (hd2, imp)  in
                             let b_expected = (hd_expected, imp')  in
                             let env3 = push_binding env2 b  in
                             let subst2 =
                               let uu____9081 =
                                 FStar_Syntax_Syntax.bv_to_name hd2  in
                               maybe_extend_subst subst1 b_expected
                                 uu____9081
                                in
                             aux (env3, (b :: out), g1, subst2) bs3
                               bs_expected2))
                   | (rest,[]) ->
                       (env2, (FStar_List.rev out),
                         (FStar_Pervasives_Native.Some (FStar_Util.Inl rest)),
                         g, subst1)
                   | ([],rest) ->
                       (env2, (FStar_List.rev out),
                         (FStar_Pervasives_Native.Some (FStar_Util.Inr rest)),
                         g, subst1))
               in
            aux (env1, [], FStar_TypeChecker_Env.trivial_guard, []) bs1
              bs_expected
             in
          let rec expected_function_typ1 env1 t0 body1 =
            match t0 with
            | FStar_Pervasives_Native.None  ->
                ((match env1.FStar_TypeChecker_Env.letrecs with
                  | [] -> ()
                  | uu____9333 ->
                      failwith
                        "Impossible: Can't have a let rec annotation but no expected type");
                 (let uu____9342 = tc_binders env1 bs  in
                  match uu____9342 with
                  | (bs1,envbody,g,uu____9372) ->
                      (FStar_Pervasives_Native.None, bs1, [],
                        FStar_Pervasives_Native.None, envbody, body1, g)))
            | FStar_Pervasives_Native.Some t ->
                let t1 = FStar_Syntax_Subst.compress t  in
                let rec as_function_typ norm1 t2 =
                  let uu____9422 =
                    let uu____9423 = FStar_Syntax_Subst.compress t2  in
                    uu____9423.FStar_Syntax_Syntax.n  in
                  match uu____9422 with
                  | FStar_Syntax_Syntax.Tm_uvar uu____9454 ->
                      ((match env1.FStar_TypeChecker_Env.letrecs with
                        | [] -> ()
                        | uu____9474 -> failwith "Impossible");
                       (let uu____9483 = tc_binders env1 bs  in
                        match uu____9483 with
                        | (bs1,envbody,g,uu____9523) ->
                            let uu____9524 =
                              FStar_TypeChecker_Env.clear_expected_typ
                                envbody
                               in
                            (match uu____9524 with
                             | (envbody1,uu____9560) ->
                                 ((FStar_Pervasives_Native.Some t2), bs1, [],
                                   FStar_Pervasives_Native.None, envbody1,
                                   body1, g))))
                  | FStar_Syntax_Syntax.Tm_app
                      ({
                         FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                           uu____9579;
                         FStar_Syntax_Syntax.pos = uu____9580;
                         FStar_Syntax_Syntax.vars = uu____9581;_},uu____9582)
                      ->
                      ((match env1.FStar_TypeChecker_Env.letrecs with
                        | [] -> ()
                        | uu____9622 -> failwith "Impossible");
                       (let uu____9631 = tc_binders env1 bs  in
                        match uu____9631 with
                        | (bs1,envbody,g,uu____9671) ->
                            let uu____9672 =
                              FStar_TypeChecker_Env.clear_expected_typ
                                envbody
                               in
                            (match uu____9672 with
                             | (envbody1,uu____9708) ->
                                 ((FStar_Pervasives_Native.Some t2), bs1, [],
                                   FStar_Pervasives_Native.None, envbody1,
                                   body1, g))))
                  | FStar_Syntax_Syntax.Tm_refine (b,uu____9728) ->
                      let uu____9733 =
                        as_function_typ norm1 b.FStar_Syntax_Syntax.sort  in
                      (match uu____9733 with
                       | (uu____9790,bs1,bs',copt,env2,body2,g) ->
                           ((FStar_Pervasives_Native.Some t2), bs1, bs',
                             copt, env2, body2, g))
                  | FStar_Syntax_Syntax.Tm_arrow (bs_expected,c_expected) ->
                      let uu____9857 =
                        FStar_Syntax_Subst.open_comp bs_expected c_expected
                         in
                      (match uu____9857 with
                       | (bs_expected1,c_expected1) ->
                           let check_actuals_against_formals env2 bs1
                             bs_expected2 body2 =
                             let rec handle_more uu____9994 c_expected2 body3
                               =
                               match uu____9994 with
                               | (env3,bs2,more,guard,subst1) ->
                                   (match more with
                                    | FStar_Pervasives_Native.None  ->
                                        let uu____10098 =
                                          FStar_Syntax_Subst.subst_comp
                                            subst1 c_expected2
                                           in
                                        (env3, bs2, guard, uu____10098,
                                          body3)
                                    | FStar_Pervasives_Native.Some
                                        (FStar_Util.Inr more_bs_expected) ->
                                        let c =
                                          let uu____10113 =
                                            FStar_Syntax_Util.arrow
                                              more_bs_expected c_expected2
                                             in
                                          FStar_Syntax_Syntax.mk_Total
                                            uu____10113
                                           in
                                        let uu____10114 =
                                          FStar_Syntax_Subst.subst_comp
                                            subst1 c
                                           in
                                        (env3, bs2, guard, uu____10114,
                                          body3)
                                    | FStar_Pervasives_Native.Some
                                        (FStar_Util.Inl more_bs) ->
                                        let c =
                                          FStar_Syntax_Subst.subst_comp
                                            subst1 c_expected2
                                           in
                                        let uu____10129 =
                                          (FStar_Options.ml_ish ()) ||
                                            (FStar_Syntax_Util.is_named_tot c)
                                           in
                                        if uu____10129
                                        then
                                          let t3 =
                                            FStar_TypeChecker_Normalize.unfold_whnf
                                              env3
                                              (FStar_Syntax_Util.comp_result
                                                 c)
                                             in
                                          (match t3.FStar_Syntax_Syntax.n
                                           with
                                           | FStar_Syntax_Syntax.Tm_arrow
                                               (bs_expected3,c_expected3) ->
                                               let uu____10185 =
                                                 FStar_Syntax_Subst.open_comp
                                                   bs_expected3 c_expected3
                                                  in
                                               (match uu____10185 with
                                                | (bs_expected4,c_expected4)
                                                    ->
                                                    let uu____10210 =
                                                      check_binders env3
                                                        more_bs bs_expected4
                                                       in
                                                    (match uu____10210 with
                                                     | (env4,bs',more1,guard',subst2)
                                                         ->
                                                         let uu____10262 =
                                                           let uu____10287 =
                                                             FStar_TypeChecker_Env.conj_guard
                                                               guard guard'
                                                              in
                                                           (env4,
                                                             (FStar_List.append
                                                                bs2 bs'),
                                                             more1,
                                                             uu____10287,
                                                             subst2)
                                                            in
                                                         handle_more
                                                           uu____10262
                                                           c_expected4 body3))
                                           | uu____10306 ->
                                               let body4 =
                                                 FStar_Syntax_Util.abs
                                                   more_bs body3
                                                   FStar_Pervasives_Native.None
                                                  in
                                               (env3, bs2, guard, c, body4))
                                        else
                                          (let body4 =
                                             FStar_Syntax_Util.abs more_bs
                                               body3
                                               FStar_Pervasives_Native.None
                                              in
                                           (env3, bs2, guard, c, body4)))
                                in
                             let uu____10330 =
                               check_binders env2 bs1 bs_expected2  in
                             handle_more uu____10330 c_expected1 body2  in
                           let mk_letrec_env envbody bs1 c =
                             let letrecs = guard_letrecs envbody bs1 c  in
                             let envbody1 =
                               let uu___348_10391 = envbody  in
                               {
                                 FStar_TypeChecker_Env.solver =
                                   (uu___348_10391.FStar_TypeChecker_Env.solver);
                                 FStar_TypeChecker_Env.range =
                                   (uu___348_10391.FStar_TypeChecker_Env.range);
                                 FStar_TypeChecker_Env.curmodule =
                                   (uu___348_10391.FStar_TypeChecker_Env.curmodule);
                                 FStar_TypeChecker_Env.gamma =
                                   (uu___348_10391.FStar_TypeChecker_Env.gamma);
                                 FStar_TypeChecker_Env.gamma_sig =
                                   (uu___348_10391.FStar_TypeChecker_Env.gamma_sig);
                                 FStar_TypeChecker_Env.gamma_cache =
                                   (uu___348_10391.FStar_TypeChecker_Env.gamma_cache);
                                 FStar_TypeChecker_Env.modules =
                                   (uu___348_10391.FStar_TypeChecker_Env.modules);
                                 FStar_TypeChecker_Env.expected_typ =
                                   (uu___348_10391.FStar_TypeChecker_Env.expected_typ);
                                 FStar_TypeChecker_Env.sigtab =
                                   (uu___348_10391.FStar_TypeChecker_Env.sigtab);
                                 FStar_TypeChecker_Env.is_pattern =
                                   (uu___348_10391.FStar_TypeChecker_Env.is_pattern);
                                 FStar_TypeChecker_Env.instantiate_imp =
                                   (uu___348_10391.FStar_TypeChecker_Env.instantiate_imp);
                                 FStar_TypeChecker_Env.effects =
                                   (uu___348_10391.FStar_TypeChecker_Env.effects);
                                 FStar_TypeChecker_Env.generalize =
                                   (uu___348_10391.FStar_TypeChecker_Env.generalize);
                                 FStar_TypeChecker_Env.letrecs = [];
                                 FStar_TypeChecker_Env.top_level =
                                   (uu___348_10391.FStar_TypeChecker_Env.top_level);
                                 FStar_TypeChecker_Env.check_uvars =
                                   (uu___348_10391.FStar_TypeChecker_Env.check_uvars);
                                 FStar_TypeChecker_Env.use_eq =
                                   (uu___348_10391.FStar_TypeChecker_Env.use_eq);
                                 FStar_TypeChecker_Env.is_iface =
                                   (uu___348_10391.FStar_TypeChecker_Env.is_iface);
                                 FStar_TypeChecker_Env.admit =
                                   (uu___348_10391.FStar_TypeChecker_Env.admit);
                                 FStar_TypeChecker_Env.lax =
                                   (uu___348_10391.FStar_TypeChecker_Env.lax);
                                 FStar_TypeChecker_Env.lax_universes =
                                   (uu___348_10391.FStar_TypeChecker_Env.lax_universes);
                                 FStar_TypeChecker_Env.phase1 =
                                   (uu___348_10391.FStar_TypeChecker_Env.phase1);
                                 FStar_TypeChecker_Env.failhard =
                                   (uu___348_10391.FStar_TypeChecker_Env.failhard);
                                 FStar_TypeChecker_Env.nosynth =
                                   (uu___348_10391.FStar_TypeChecker_Env.nosynth);
                                 FStar_TypeChecker_Env.uvar_subtyping =
                                   (uu___348_10391.FStar_TypeChecker_Env.uvar_subtyping);
                                 FStar_TypeChecker_Env.tc_term =
                                   (uu___348_10391.FStar_TypeChecker_Env.tc_term);
                                 FStar_TypeChecker_Env.type_of =
                                   (uu___348_10391.FStar_TypeChecker_Env.type_of);
                                 FStar_TypeChecker_Env.universe_of =
                                   (uu___348_10391.FStar_TypeChecker_Env.universe_of);
                                 FStar_TypeChecker_Env.check_type_of =
                                   (uu___348_10391.FStar_TypeChecker_Env.check_type_of);
                                 FStar_TypeChecker_Env.use_bv_sorts =
                                   (uu___348_10391.FStar_TypeChecker_Env.use_bv_sorts);
                                 FStar_TypeChecker_Env.qtbl_name_and_index =
                                   (uu___348_10391.FStar_TypeChecker_Env.qtbl_name_and_index);
                                 FStar_TypeChecker_Env.normalized_eff_names =
                                   (uu___348_10391.FStar_TypeChecker_Env.normalized_eff_names);
                                 FStar_TypeChecker_Env.proof_ns =
                                   (uu___348_10391.FStar_TypeChecker_Env.proof_ns);
                                 FStar_TypeChecker_Env.synth_hook =
                                   (uu___348_10391.FStar_TypeChecker_Env.synth_hook);
                                 FStar_TypeChecker_Env.splice =
                                   (uu___348_10391.FStar_TypeChecker_Env.splice);
                                 FStar_TypeChecker_Env.is_native_tactic =
                                   (uu___348_10391.FStar_TypeChecker_Env.is_native_tactic);
                                 FStar_TypeChecker_Env.identifier_info =
                                   (uu___348_10391.FStar_TypeChecker_Env.identifier_info);
                                 FStar_TypeChecker_Env.tc_hooks =
                                   (uu___348_10391.FStar_TypeChecker_Env.tc_hooks);
                                 FStar_TypeChecker_Env.dsenv =
                                   (uu___348_10391.FStar_TypeChecker_Env.dsenv);
                                 FStar_TypeChecker_Env.dep_graph =
                                   (uu___348_10391.FStar_TypeChecker_Env.dep_graph)
                               }  in
                             FStar_All.pipe_right letrecs
                               (FStar_List.fold_left
                                  (fun uu____10449  ->
                                     fun uu____10450  ->
                                       match (uu____10449, uu____10450) with
                                       | ((env2,letrec_binders),(l,t3,u_names))
                                           ->
                                           let uu____10532 =
                                             let uu____10539 =
                                               let uu____10540 =
                                                 FStar_TypeChecker_Env.clear_expected_typ
                                                   env2
                                                  in
                                               FStar_All.pipe_right
                                                 uu____10540
                                                 FStar_Pervasives_Native.fst
                                                in
                                             tc_term uu____10539 t3  in
                                           (match uu____10532 with
                                            | (t4,uu____10562,uu____10563) ->
                                                let env3 =
                                                  FStar_TypeChecker_Env.push_let_binding
                                                    env2 l (u_names, t4)
                                                   in
                                                let lb =
                                                  match l with
                                                  | FStar_Util.Inl x ->
                                                      let uu____10575 =
                                                        FStar_Syntax_Syntax.mk_binder
                                                          (let uu___349_10578
                                                             = x  in
                                                           {
                                                             FStar_Syntax_Syntax.ppname
                                                               =
                                                               (uu___349_10578.FStar_Syntax_Syntax.ppname);
                                                             FStar_Syntax_Syntax.index
                                                               =
                                                               (uu___349_10578.FStar_Syntax_Syntax.index);
                                                             FStar_Syntax_Syntax.sort
                                                               = t4
                                                           })
                                                         in
                                                      uu____10575 ::
                                                        letrec_binders
                                                  | uu____10579 ->
                                                      letrec_binders
                                                   in
                                                (env3, lb))) (envbody1, []))
                              in
                           let uu____10588 =
                             check_actuals_against_formals env1 bs
                               bs_expected1 body1
                              in
                           (match uu____10588 with
                            | (envbody,bs1,g,c,body2) ->
                                let uu____10656 = mk_letrec_env envbody bs1 c
                                   in
                                (match uu____10656 with
                                 | (envbody1,letrecs) ->
                                     let envbody2 =
                                       FStar_TypeChecker_Env.set_expected_typ
                                         envbody1
                                         (FStar_Syntax_Util.comp_result c)
                                        in
                                     ((FStar_Pervasives_Native.Some t2), bs1,
                                       letrecs,
                                       (FStar_Pervasives_Native.Some c),
                                       envbody2, body2, g))))
                  | uu____10712 ->
                      if Prims.op_Negation norm1
                      then
                        let uu____10741 =
                          FStar_TypeChecker_Normalize.unfold_whnf env1 t2  in
                        as_function_typ true uu____10741
                      else
                        (let uu____10743 =
                           expected_function_typ1 env1
                             FStar_Pervasives_Native.None body1
                            in
                         match uu____10743 with
                         | (uu____10790,bs1,uu____10792,c_opt,envbody,body2,g)
                             ->
                             ((FStar_Pervasives_Native.Some t2), bs1, [],
                               c_opt, envbody, body2, g))
                   in
                as_function_typ false t1
             in
          let use_eq = env.FStar_TypeChecker_Env.use_eq  in
          let uu____10820 = FStar_TypeChecker_Env.clear_expected_typ env  in
          match uu____10820 with
          | (env1,topt) ->
              ((let uu____10840 =
                  FStar_TypeChecker_Env.debug env1 FStar_Options.High  in
                if uu____10840
                then
                  let uu____10841 =
                    match topt with
                    | FStar_Pervasives_Native.None  -> "None"
                    | FStar_Pervasives_Native.Some t ->
                        FStar_Syntax_Print.term_to_string t
                     in
                  FStar_Util.print2
                    "!!!!!!!!!!!!!!!Expected type is %s, top_level=%s\n"
                    uu____10841
                    (if env1.FStar_TypeChecker_Env.top_level
                     then "true"
                     else "false")
                else ());
               (let uu____10845 = expected_function_typ1 env1 topt body  in
                match uu____10845 with
                | (tfun_opt,bs1,letrec_binders,c_opt,envbody,body1,g) ->
                    let envbody1 =
                      FStar_TypeChecker_Env.set_range envbody
                        body1.FStar_Syntax_Syntax.pos
                       in
                    let uu____10886 =
                      let should_check_expected_effect =
                        let uu____10898 =
                          let uu____10905 =
                            let uu____10906 =
                              FStar_Syntax_Subst.compress body1  in
                            uu____10906.FStar_Syntax_Syntax.n  in
                          (c_opt, uu____10905)  in
                        match uu____10898 with
                        | (FStar_Pervasives_Native.None
                           ,FStar_Syntax_Syntax.Tm_ascribed
                           (uu____10911,(FStar_Util.Inr
                                         expected_c,uu____10913),uu____10914))
                            -> false
                        | uu____10963 -> true  in
                      let uu____10970 =
                        tc_term
                          (let uu___350_10979 = envbody1  in
                           {
                             FStar_TypeChecker_Env.solver =
                               (uu___350_10979.FStar_TypeChecker_Env.solver);
                             FStar_TypeChecker_Env.range =
                               (uu___350_10979.FStar_TypeChecker_Env.range);
                             FStar_TypeChecker_Env.curmodule =
                               (uu___350_10979.FStar_TypeChecker_Env.curmodule);
                             FStar_TypeChecker_Env.gamma =
                               (uu___350_10979.FStar_TypeChecker_Env.gamma);
                             FStar_TypeChecker_Env.gamma_sig =
                               (uu___350_10979.FStar_TypeChecker_Env.gamma_sig);
                             FStar_TypeChecker_Env.gamma_cache =
                               (uu___350_10979.FStar_TypeChecker_Env.gamma_cache);
                             FStar_TypeChecker_Env.modules =
                               (uu___350_10979.FStar_TypeChecker_Env.modules);
                             FStar_TypeChecker_Env.expected_typ =
                               (uu___350_10979.FStar_TypeChecker_Env.expected_typ);
                             FStar_TypeChecker_Env.sigtab =
                               (uu___350_10979.FStar_TypeChecker_Env.sigtab);
                             FStar_TypeChecker_Env.is_pattern =
                               (uu___350_10979.FStar_TypeChecker_Env.is_pattern);
                             FStar_TypeChecker_Env.instantiate_imp =
                               (uu___350_10979.FStar_TypeChecker_Env.instantiate_imp);
                             FStar_TypeChecker_Env.effects =
                               (uu___350_10979.FStar_TypeChecker_Env.effects);
                             FStar_TypeChecker_Env.generalize =
                               (uu___350_10979.FStar_TypeChecker_Env.generalize);
                             FStar_TypeChecker_Env.letrecs =
                               (uu___350_10979.FStar_TypeChecker_Env.letrecs);
                             FStar_TypeChecker_Env.top_level = false;
                             FStar_TypeChecker_Env.check_uvars =
                               (uu___350_10979.FStar_TypeChecker_Env.check_uvars);
                             FStar_TypeChecker_Env.use_eq = use_eq;
                             FStar_TypeChecker_Env.is_iface =
                               (uu___350_10979.FStar_TypeChecker_Env.is_iface);
                             FStar_TypeChecker_Env.admit =
                               (uu___350_10979.FStar_TypeChecker_Env.admit);
                             FStar_TypeChecker_Env.lax =
                               (uu___350_10979.FStar_TypeChecker_Env.lax);
                             FStar_TypeChecker_Env.lax_universes =
                               (uu___350_10979.FStar_TypeChecker_Env.lax_universes);
                             FStar_TypeChecker_Env.phase1 =
                               (uu___350_10979.FStar_TypeChecker_Env.phase1);
                             FStar_TypeChecker_Env.failhard =
                               (uu___350_10979.FStar_TypeChecker_Env.failhard);
                             FStar_TypeChecker_Env.nosynth =
                               (uu___350_10979.FStar_TypeChecker_Env.nosynth);
                             FStar_TypeChecker_Env.uvar_subtyping =
                               (uu___350_10979.FStar_TypeChecker_Env.uvar_subtyping);
                             FStar_TypeChecker_Env.tc_term =
                               (uu___350_10979.FStar_TypeChecker_Env.tc_term);
                             FStar_TypeChecker_Env.type_of =
                               (uu___350_10979.FStar_TypeChecker_Env.type_of);
                             FStar_TypeChecker_Env.universe_of =
                               (uu___350_10979.FStar_TypeChecker_Env.universe_of);
                             FStar_TypeChecker_Env.check_type_of =
                               (uu___350_10979.FStar_TypeChecker_Env.check_type_of);
                             FStar_TypeChecker_Env.use_bv_sorts =
                               (uu___350_10979.FStar_TypeChecker_Env.use_bv_sorts);
                             FStar_TypeChecker_Env.qtbl_name_and_index =
                               (uu___350_10979.FStar_TypeChecker_Env.qtbl_name_and_index);
                             FStar_TypeChecker_Env.normalized_eff_names =
                               (uu___350_10979.FStar_TypeChecker_Env.normalized_eff_names);
                             FStar_TypeChecker_Env.proof_ns =
                               (uu___350_10979.FStar_TypeChecker_Env.proof_ns);
                             FStar_TypeChecker_Env.synth_hook =
                               (uu___350_10979.FStar_TypeChecker_Env.synth_hook);
                             FStar_TypeChecker_Env.splice =
                               (uu___350_10979.FStar_TypeChecker_Env.splice);
                             FStar_TypeChecker_Env.is_native_tactic =
                               (uu___350_10979.FStar_TypeChecker_Env.is_native_tactic);
                             FStar_TypeChecker_Env.identifier_info =
                               (uu___350_10979.FStar_TypeChecker_Env.identifier_info);
                             FStar_TypeChecker_Env.tc_hooks =
                               (uu___350_10979.FStar_TypeChecker_Env.tc_hooks);
                             FStar_TypeChecker_Env.dsenv =
                               (uu___350_10979.FStar_TypeChecker_Env.dsenv);
                             FStar_TypeChecker_Env.dep_graph =
                               (uu___350_10979.FStar_TypeChecker_Env.dep_graph)
                           }) body1
                         in
                      match uu____10970 with
                      | (body2,cbody,guard_body) ->
                          let guard_body1 =
                            FStar_TypeChecker_Rel.solve_deferred_constraints
                              envbody1 guard_body
                             in
                          if should_check_expected_effect
                          then
                            let uu____11004 =
                              let uu____11011 =
                                let uu____11016 =
                                  FStar_Syntax_Syntax.lcomp_comp cbody  in
                                (body2, uu____11016)  in
                              check_expected_effect
                                (let uu___351_11019 = envbody1  in
                                 {
                                   FStar_TypeChecker_Env.solver =
                                     (uu___351_11019.FStar_TypeChecker_Env.solver);
                                   FStar_TypeChecker_Env.range =
                                     (uu___351_11019.FStar_TypeChecker_Env.range);
                                   FStar_TypeChecker_Env.curmodule =
                                     (uu___351_11019.FStar_TypeChecker_Env.curmodule);
                                   FStar_TypeChecker_Env.gamma =
                                     (uu___351_11019.FStar_TypeChecker_Env.gamma);
                                   FStar_TypeChecker_Env.gamma_sig =
                                     (uu___351_11019.FStar_TypeChecker_Env.gamma_sig);
                                   FStar_TypeChecker_Env.gamma_cache =
                                     (uu___351_11019.FStar_TypeChecker_Env.gamma_cache);
                                   FStar_TypeChecker_Env.modules =
                                     (uu___351_11019.FStar_TypeChecker_Env.modules);
                                   FStar_TypeChecker_Env.expected_typ =
                                     (uu___351_11019.FStar_TypeChecker_Env.expected_typ);
                                   FStar_TypeChecker_Env.sigtab =
                                     (uu___351_11019.FStar_TypeChecker_Env.sigtab);
                                   FStar_TypeChecker_Env.is_pattern =
                                     (uu___351_11019.FStar_TypeChecker_Env.is_pattern);
                                   FStar_TypeChecker_Env.instantiate_imp =
                                     (uu___351_11019.FStar_TypeChecker_Env.instantiate_imp);
                                   FStar_TypeChecker_Env.effects =
                                     (uu___351_11019.FStar_TypeChecker_Env.effects);
                                   FStar_TypeChecker_Env.generalize =
                                     (uu___351_11019.FStar_TypeChecker_Env.generalize);
                                   FStar_TypeChecker_Env.letrecs =
                                     (uu___351_11019.FStar_TypeChecker_Env.letrecs);
                                   FStar_TypeChecker_Env.top_level =
                                     (uu___351_11019.FStar_TypeChecker_Env.top_level);
                                   FStar_TypeChecker_Env.check_uvars =
                                     (uu___351_11019.FStar_TypeChecker_Env.check_uvars);
                                   FStar_TypeChecker_Env.use_eq = use_eq;
                                   FStar_TypeChecker_Env.is_iface =
                                     (uu___351_11019.FStar_TypeChecker_Env.is_iface);
                                   FStar_TypeChecker_Env.admit =
                                     (uu___351_11019.FStar_TypeChecker_Env.admit);
                                   FStar_TypeChecker_Env.lax =
                                     (uu___351_11019.FStar_TypeChecker_Env.lax);
                                   FStar_TypeChecker_Env.lax_universes =
                                     (uu___351_11019.FStar_TypeChecker_Env.lax_universes);
                                   FStar_TypeChecker_Env.phase1 =
                                     (uu___351_11019.FStar_TypeChecker_Env.phase1);
                                   FStar_TypeChecker_Env.failhard =
                                     (uu___351_11019.FStar_TypeChecker_Env.failhard);
                                   FStar_TypeChecker_Env.nosynth =
                                     (uu___351_11019.FStar_TypeChecker_Env.nosynth);
                                   FStar_TypeChecker_Env.uvar_subtyping =
                                     (uu___351_11019.FStar_TypeChecker_Env.uvar_subtyping);
                                   FStar_TypeChecker_Env.tc_term =
                                     (uu___351_11019.FStar_TypeChecker_Env.tc_term);
                                   FStar_TypeChecker_Env.type_of =
                                     (uu___351_11019.FStar_TypeChecker_Env.type_of);
                                   FStar_TypeChecker_Env.universe_of =
                                     (uu___351_11019.FStar_TypeChecker_Env.universe_of);
                                   FStar_TypeChecker_Env.check_type_of =
                                     (uu___351_11019.FStar_TypeChecker_Env.check_type_of);
                                   FStar_TypeChecker_Env.use_bv_sorts =
                                     (uu___351_11019.FStar_TypeChecker_Env.use_bv_sorts);
                                   FStar_TypeChecker_Env.qtbl_name_and_index
                                     =
                                     (uu___351_11019.FStar_TypeChecker_Env.qtbl_name_and_index);
                                   FStar_TypeChecker_Env.normalized_eff_names
                                     =
                                     (uu___351_11019.FStar_TypeChecker_Env.normalized_eff_names);
                                   FStar_TypeChecker_Env.proof_ns =
                                     (uu___351_11019.FStar_TypeChecker_Env.proof_ns);
                                   FStar_TypeChecker_Env.synth_hook =
                                     (uu___351_11019.FStar_TypeChecker_Env.synth_hook);
                                   FStar_TypeChecker_Env.splice =
                                     (uu___351_11019.FStar_TypeChecker_Env.splice);
                                   FStar_TypeChecker_Env.is_native_tactic =
                                     (uu___351_11019.FStar_TypeChecker_Env.is_native_tactic);
                                   FStar_TypeChecker_Env.identifier_info =
                                     (uu___351_11019.FStar_TypeChecker_Env.identifier_info);
                                   FStar_TypeChecker_Env.tc_hooks =
                                     (uu___351_11019.FStar_TypeChecker_Env.tc_hooks);
                                   FStar_TypeChecker_Env.dsenv =
                                     (uu___351_11019.FStar_TypeChecker_Env.dsenv);
                                   FStar_TypeChecker_Env.dep_graph =
                                     (uu___351_11019.FStar_TypeChecker_Env.dep_graph)
                                 }) c_opt uu____11011
                               in
                            (match uu____11004 with
                             | (body3,cbody1,guard) ->
                                 let uu____11033 =
                                   FStar_TypeChecker_Env.conj_guard
                                     guard_body1 guard
                                    in
                                 (body3, cbody1, uu____11033))
                          else
                            (let uu____11039 =
                               FStar_Syntax_Syntax.lcomp_comp cbody  in
                             (body2, uu____11039, guard_body1))
                       in
                    (match uu____10886 with
                     | (body2,cbody,guard) ->
                         let guard1 =
                           let uu____11064 =
                             env1.FStar_TypeChecker_Env.top_level ||
                               (let uu____11066 =
                                  FStar_TypeChecker_Env.should_verify env1
                                   in
                                Prims.op_Negation uu____11066)
                              in
                           if uu____11064
                           then
                             let uu____11067 =
                               FStar_TypeChecker_Env.conj_guard g guard  in
                             FStar_TypeChecker_Rel.discharge_guard envbody1
                               uu____11067
                           else
                             (let guard1 =
                                let uu____11070 =
                                  FStar_TypeChecker_Env.conj_guard g guard
                                   in
                                FStar_TypeChecker_Env.close_guard env1
                                  (FStar_List.append bs1 letrec_binders)
                                  uu____11070
                                 in
                              guard1)
                            in
                         let guard2 =
                           FStar_TypeChecker_Util.close_guard_implicits env1
                             bs1 guard1
                            in
                         let tfun_computed =
                           FStar_Syntax_Util.arrow bs1 cbody  in
                         let e =
                           FStar_Syntax_Util.abs bs1 body2
                             (FStar_Pervasives_Native.Some
                                (FStar_Syntax_Util.residual_comp_of_comp
                                   (FStar_Util.dflt cbody c_opt)))
                            in
                         let uu____11082 =
                           match tfun_opt with
                           | FStar_Pervasives_Native.Some t ->
                               let t1 = FStar_Syntax_Subst.compress t  in
                               (match t1.FStar_Syntax_Syntax.n with
                                | FStar_Syntax_Syntax.Tm_arrow uu____11103 ->
                                    (e, t1, guard2)
                                | uu____11116 ->
                                    let uu____11117 =
                                      FStar_TypeChecker_Util.check_and_ascribe
                                        env1 e tfun_computed t1
                                       in
                                    (match uu____11117 with
                                     | (e1,guard') ->
                                         let uu____11130 =
                                           FStar_TypeChecker_Env.conj_guard
                                             guard2 guard'
                                            in
                                         (e1, t1, uu____11130)))
                           | FStar_Pervasives_Native.None  ->
                               (e, tfun_computed, guard2)
                            in
                         (match uu____11082 with
                          | (e1,tfun,guard3) ->
                              let c = FStar_Syntax_Syntax.mk_Total tfun  in
                              let uu____11141 =
                                let uu____11146 =
                                  FStar_Syntax_Util.lcomp_of_comp c  in
                                FStar_TypeChecker_Util.strengthen_precondition
                                  FStar_Pervasives_Native.None env1 e1
                                  uu____11146 guard3
                                 in
                              (match uu____11141 with
                               | (c1,g1) -> (e1, c1, g1))))))

and (check_application_args :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.lcomp ->
        FStar_TypeChecker_Env.guard_t ->
          (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
            FStar_Pervasives_Native.tuple2 Prims.list ->
            FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option ->
              (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
                FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun head1  ->
      fun chead  ->
        fun ghead  ->
          fun args  ->
            fun expected_topt  ->
              let n_args = FStar_List.length args  in
              let r = FStar_TypeChecker_Env.get_range env  in
              let thead = chead.FStar_Syntax_Syntax.res_typ  in
              (let uu____11190 =
                 FStar_TypeChecker_Env.debug env FStar_Options.High  in
               if uu____11190
               then
                 let uu____11191 =
                   FStar_Range.string_of_range head1.FStar_Syntax_Syntax.pos
                    in
                 let uu____11192 = FStar_Syntax_Print.term_to_string thead
                    in
                 FStar_Util.print2 "(%s) Type of head is %s\n" uu____11191
                   uu____11192
               else ());
              (let monadic_application uu____11265 subst1 arg_comps_rev
                 arg_rets_rev guard fvs bs =
                 match uu____11265 with
                 | (head2,chead1,ghead1,cres) ->
                     let uu____11328 =
                       check_no_escape (FStar_Pervasives_Native.Some head2)
                         env fvs cres.FStar_Syntax_Syntax.res_typ
                        in
                     (match uu____11328 with
                      | (rt,g0) ->
                          let cres1 =
                            let uu___352_11342 = cres  in
                            {
                              FStar_Syntax_Syntax.eff_name =
                                (uu___352_11342.FStar_Syntax_Syntax.eff_name);
                              FStar_Syntax_Syntax.res_typ = rt;
                              FStar_Syntax_Syntax.cflags =
                                (uu___352_11342.FStar_Syntax_Syntax.cflags);
                              FStar_Syntax_Syntax.comp_thunk =
                                (uu___352_11342.FStar_Syntax_Syntax.comp_thunk)
                            }  in
                          let uu____11343 =
                            match bs with
                            | [] ->
                                let g =
                                  let uu____11357 =
                                    FStar_TypeChecker_Env.conj_guard ghead1
                                      guard
                                     in
                                  FStar_All.pipe_left
                                    (FStar_TypeChecker_Env.conj_guard g0)
                                    uu____11357
                                   in
                                (cres1, g)
                            | uu____11358 ->
                                let g =
                                  let uu____11366 =
                                    let uu____11367 =
                                      FStar_TypeChecker_Env.conj_guard ghead1
                                        guard
                                       in
                                    FStar_All.pipe_right uu____11367
                                      (FStar_TypeChecker_Rel.solve_deferred_constraints
                                         env)
                                     in
                                  FStar_TypeChecker_Env.conj_guard g0
                                    uu____11366
                                   in
                                let uu____11368 =
                                  let uu____11369 =
                                    let uu____11370 =
                                      let uu____11371 =
                                        FStar_Syntax_Syntax.lcomp_comp cres1
                                         in
                                      FStar_Syntax_Util.arrow bs uu____11371
                                       in
                                    FStar_Syntax_Syntax.mk_Total uu____11370
                                     in
                                  FStar_All.pipe_left
                                    FStar_Syntax_Util.lcomp_of_comp
                                    uu____11369
                                   in
                                (uu____11368, g)
                             in
                          (match uu____11343 with
                           | (cres2,guard1) ->
                               ((let uu____11383 =
                                   FStar_TypeChecker_Env.debug env
                                     FStar_Options.Low
                                    in
                                 if uu____11383
                                 then
                                   let uu____11384 =
                                     FStar_Syntax_Print.lcomp_to_string cres2
                                      in
                                   FStar_Util.print1
                                     "\t Type of result cres is %s\n"
                                     uu____11384
                                 else ());
                                (let cres3 =
                                   let head_is_pure_and_some_arg_is_effectful
                                     =
                                     (FStar_Syntax_Util.is_pure_or_ghost_lcomp
                                        chead1)
                                       &&
                                       (FStar_Util.for_some
                                          (fun uu____11400  ->
                                             match uu____11400 with
                                             | (uu____11409,uu____11410,lc)
                                                 ->
                                                 (let uu____11418 =
                                                    FStar_Syntax_Util.is_pure_or_ghost_lcomp
                                                      lc
                                                     in
                                                  Prims.op_Negation
                                                    uu____11418)
                                                   ||
                                                   (FStar_TypeChecker_Util.should_not_inline_lc
                                                      lc)) arg_comps_rev)
                                      in
                                   let term =
                                     FStar_Syntax_Syntax.mk_Tm_app head2
                                       (FStar_List.rev arg_rets_rev)
                                       FStar_Pervasives_Native.None
                                       head2.FStar_Syntax_Syntax.pos
                                      in
                                   let uu____11428 =
                                     (FStar_Syntax_Util.is_pure_or_ghost_lcomp
                                        cres2)
                                       &&
                                       head_is_pure_and_some_arg_is_effectful
                                      in
                                   if uu____11428
                                   then
                                     ((let uu____11430 =
                                         FStar_TypeChecker_Env.debug env
                                           FStar_Options.Extreme
                                          in
                                       if uu____11430
                                       then
                                         let uu____11431 =
                                           FStar_Syntax_Print.term_to_string
                                             term
                                            in
                                         FStar_Util.print1
                                           "(a) Monadic app: Return inserted in monadic application: %s\n"
                                           uu____11431
                                       else ());
                                      FStar_TypeChecker_Util.maybe_assume_result_eq_pure_term
                                        env term cres2)
                                   else
                                     ((let uu____11435 =
                                         FStar_TypeChecker_Env.debug env
                                           FStar_Options.Extreme
                                          in
                                       if uu____11435
                                       then
                                         let uu____11436 =
                                           FStar_Syntax_Print.term_to_string
                                             term
                                            in
                                         FStar_Util.print1
                                           "(a) Monadic app: No return inserted in monadic application: %s\n"
                                           uu____11436
                                       else ());
                                      cres2)
                                    in
                                 let comp =
                                   FStar_List.fold_left
                                     (fun out_c  ->
                                        fun uu____11462  ->
                                          match uu____11462 with
                                          | ((e,q),x,c) ->
                                              ((let uu____11496 =
                                                  FStar_TypeChecker_Env.debug
                                                    env FStar_Options.Extreme
                                                   in
                                                if uu____11496
                                                then
                                                  let uu____11497 =
                                                    match x with
                                                    | FStar_Pervasives_Native.None
                                                         -> "_"
                                                    | FStar_Pervasives_Native.Some
                                                        x1 ->
                                                        FStar_Syntax_Print.bv_to_string
                                                          x1
                                                     in
                                                  let uu____11499 =
                                                    FStar_Syntax_Print.term_to_string
                                                      e
                                                     in
                                                  let uu____11500 =
                                                    FStar_Syntax_Print.lcomp_to_string
                                                      c
                                                     in
                                                  FStar_Util.print3
                                                    "(b) Monadic app: Binding argument %s : %s of type (%s)\n"
                                                    uu____11497 uu____11499
                                                    uu____11500
                                                else ());
                                               (let uu____11502 =
                                                  FStar_Syntax_Util.is_pure_or_ghost_lcomp
                                                    c
                                                   in
                                                if uu____11502
                                                then
                                                  FStar_TypeChecker_Util.bind
                                                    e.FStar_Syntax_Syntax.pos
                                                    env
                                                    (FStar_Pervasives_Native.Some
                                                       e) c (x, out_c)
                                                else
                                                  FStar_TypeChecker_Util.bind
                                                    e.FStar_Syntax_Syntax.pos
                                                    env
                                                    FStar_Pervasives_Native.None
                                                    c (x, out_c)))) cres3
                                     arg_comps_rev
                                    in
                                 let comp1 =
                                   (let uu____11510 =
                                      FStar_TypeChecker_Env.debug env
                                        FStar_Options.Extreme
                                       in
                                    if uu____11510
                                    then
                                      let uu____11511 =
                                        FStar_Syntax_Print.term_to_string
                                          head2
                                         in
                                      FStar_Util.print1
                                        "(c) Monadic app: Binding head %s\n"
                                        uu____11511
                                    else ());
                                   (let uu____11513 =
                                      FStar_Syntax_Util.is_pure_or_ghost_lcomp
                                        chead1
                                       in
                                    if uu____11513
                                    then
                                      FStar_TypeChecker_Util.bind
                                        head2.FStar_Syntax_Syntax.pos env
                                        (FStar_Pervasives_Native.Some head2)
                                        chead1
                                        (FStar_Pervasives_Native.None, comp)
                                    else
                                      FStar_TypeChecker_Util.bind
                                        head2.FStar_Syntax_Syntax.pos env
                                        FStar_Pervasives_Native.None chead1
                                        (FStar_Pervasives_Native.None, comp))
                                    in
                                 let comp2 =
                                   FStar_TypeChecker_Util.subst_lcomp subst1
                                     comp1
                                    in
                                 let shortcuts_evaluation_order =
                                   let uu____11521 =
                                     let uu____11522 =
                                       FStar_Syntax_Subst.compress head2  in
                                     uu____11522.FStar_Syntax_Syntax.n  in
                                   match uu____11521 with
                                   | FStar_Syntax_Syntax.Tm_fvar fv ->
                                       (FStar_Syntax_Syntax.fv_eq_lid fv
                                          FStar_Parser_Const.op_And)
                                         ||
                                         (FStar_Syntax_Syntax.fv_eq_lid fv
                                            FStar_Parser_Const.op_Or)
                                   | uu____11526 -> false  in
                                 let app =
                                   if shortcuts_evaluation_order
                                   then
                                     let args1 =
                                       FStar_List.fold_left
                                         (fun args1  ->
                                            fun uu____11547  ->
                                              match uu____11547 with
                                              | (arg,uu____11561,uu____11562)
                                                  -> arg :: args1) []
                                         arg_comps_rev
                                        in
                                     let app =
                                       FStar_Syntax_Syntax.mk_Tm_app head2
                                         args1 FStar_Pervasives_Native.None r
                                        in
                                     let app1 =
                                       FStar_TypeChecker_Util.maybe_lift env
                                         app
                                         cres3.FStar_Syntax_Syntax.eff_name
                                         comp2.FStar_Syntax_Syntax.eff_name
                                         comp2.FStar_Syntax_Syntax.res_typ
                                        in
                                     FStar_TypeChecker_Util.maybe_monadic env
                                       app1
                                       comp2.FStar_Syntax_Syntax.eff_name
                                       comp2.FStar_Syntax_Syntax.res_typ
                                   else
                                     (let uu____11572 =
                                        let map_fun uu____11630 =
                                          match uu____11630 with
                                          | ((e,q),uu____11663,c) ->
                                              ((let uu____11674 =
                                                  FStar_TypeChecker_Env.debug
                                                    env FStar_Options.Extreme
                                                   in
                                                if uu____11674
                                                then
                                                  let uu____11675 =
                                                    FStar_Syntax_Print.term_to_string
                                                      e
                                                     in
                                                  let uu____11676 =
                                                    FStar_Syntax_Print.lcomp_to_string
                                                      c
                                                     in
                                                  FStar_Util.print2
                                                    "For arg e=(%s) c=(%s)... "
                                                    uu____11675 uu____11676
                                                else ());
                                               (let uu____11678 =
                                                  FStar_Syntax_Util.is_pure_or_ghost_lcomp
                                                    c
                                                   in
                                                if uu____11678
                                                then
                                                  ((let uu____11698 =
                                                      FStar_TypeChecker_Env.debug
                                                        env
                                                        FStar_Options.Extreme
                                                       in
                                                    if uu____11698
                                                    then
                                                      FStar_Util.print_string
                                                        "... not lifting\n"
                                                    else ());
                                                   (FStar_Pervasives_Native.None,
                                                     (e, q)))
                                                else
                                                  ((let uu____11724 =
                                                      FStar_TypeChecker_Env.debug
                                                        env
                                                        FStar_Options.Extreme
                                                       in
                                                    if uu____11724
                                                    then
                                                      FStar_Util.print_string
                                                        "... lifting!\n"
                                                    else ());
                                                   (let x =
                                                      FStar_Syntax_Syntax.new_bv
                                                        FStar_Pervasives_Native.None
                                                        c.FStar_Syntax_Syntax.res_typ
                                                       in
                                                    let e1 =
                                                      FStar_TypeChecker_Util.maybe_lift
                                                        env e
                                                        c.FStar_Syntax_Syntax.eff_name
                                                        comp2.FStar_Syntax_Syntax.eff_name
                                                        c.FStar_Syntax_Syntax.res_typ
                                                       in
                                                    let uu____11728 =
                                                      let uu____11733 =
                                                        FStar_Syntax_Syntax.bv_to_name
                                                          x
                                                         in
                                                      (uu____11733, q)  in
                                                    ((FStar_Pervasives_Native.Some
                                                        (x,
                                                          (c.FStar_Syntax_Syntax.eff_name),
                                                          (c.FStar_Syntax_Syntax.res_typ),
                                                          e1)), uu____11728)))))
                                           in
                                        let uu____11756 =
                                          let uu____11783 =
                                            let uu____11808 =
                                              let uu____11819 =
                                                let uu____11828 =
                                                  FStar_Syntax_Syntax.as_arg
                                                    head2
                                                   in
                                                (uu____11828,
                                                  FStar_Pervasives_Native.None,
                                                  chead1)
                                                 in
                                              uu____11819 :: arg_comps_rev
                                               in
                                            FStar_List.map map_fun
                                              uu____11808
                                             in
                                          FStar_All.pipe_left
                                            FStar_List.split uu____11783
                                           in
                                        match uu____11756 with
                                        | (lifted_args,reverse_args) ->
                                            let uu____12005 =
                                              let uu____12006 =
                                                FStar_List.hd reverse_args
                                                 in
                                              FStar_Pervasives_Native.fst
                                                uu____12006
                                               in
                                            let uu____12015 =
                                              let uu____12016 =
                                                FStar_List.tl reverse_args
                                                 in
                                              FStar_List.rev uu____12016  in
                                            (lifted_args, uu____12005,
                                              uu____12015)
                                         in
                                      match uu____11572 with
                                      | (lifted_args,head3,args1) ->
                                          let app =
                                            FStar_Syntax_Syntax.mk_Tm_app
                                              head3 args1
                                              FStar_Pervasives_Native.None r
                                             in
                                          let app1 =
                                            FStar_TypeChecker_Util.maybe_lift
                                              env app
                                              cres3.FStar_Syntax_Syntax.eff_name
                                              comp2.FStar_Syntax_Syntax.eff_name
                                              comp2.FStar_Syntax_Syntax.res_typ
                                             in
                                          let app2 =
                                            FStar_TypeChecker_Util.maybe_monadic
                                              env app1
                                              comp2.FStar_Syntax_Syntax.eff_name
                                              comp2.FStar_Syntax_Syntax.res_typ
                                             in
                                          let bind_lifted_args e
                                            uu___331_12115 =
                                            match uu___331_12115 with
                                            | FStar_Pervasives_Native.None 
                                                -> e
                                            | FStar_Pervasives_Native.Some
                                                (x,m,t,e1) ->
                                                let lb =
                                                  FStar_Syntax_Util.mk_letbinding
                                                    (FStar_Util.Inl x) [] t m
                                                    e1 []
                                                    e1.FStar_Syntax_Syntax.pos
                                                   in
                                                let letbinding =
                                                  let uu____12176 =
                                                    let uu____12183 =
                                                      let uu____12184 =
                                                        let uu____12197 =
                                                          let uu____12200 =
                                                            let uu____12201 =
                                                              FStar_Syntax_Syntax.mk_binder
                                                                x
                                                               in
                                                            [uu____12201]  in
                                                          FStar_Syntax_Subst.close
                                                            uu____12200 e
                                                           in
                                                        ((false, [lb]),
                                                          uu____12197)
                                                         in
                                                      FStar_Syntax_Syntax.Tm_let
                                                        uu____12184
                                                       in
                                                    FStar_Syntax_Syntax.mk
                                                      uu____12183
                                                     in
                                                  uu____12176
                                                    FStar_Pervasives_Native.None
                                                    e.FStar_Syntax_Syntax.pos
                                                   in
                                                FStar_Syntax_Syntax.mk
                                                  (FStar_Syntax_Syntax.Tm_meta
                                                     (letbinding,
                                                       (FStar_Syntax_Syntax.Meta_monadic
                                                          (m,
                                                            (comp2.FStar_Syntax_Syntax.res_typ)))))
                                                  FStar_Pervasives_Native.None
                                                  e.FStar_Syntax_Syntax.pos
                                             in
                                          FStar_List.fold_left
                                            bind_lifted_args app2 lifted_args)
                                    in
                                 let uu____12247 =
                                   FStar_TypeChecker_Util.strengthen_precondition
                                     FStar_Pervasives_Native.None env app
                                     comp2 guard1
                                    in
                                 match uu____12247 with
                                 | (comp3,g) ->
                                     ((let uu____12264 =
                                         FStar_TypeChecker_Env.debug env
                                           FStar_Options.Extreme
                                          in
                                       if uu____12264
                                       then
                                         let uu____12265 =
                                           FStar_Syntax_Print.term_to_string
                                             app
                                            in
                                         let uu____12266 =
                                           FStar_Syntax_Print.lcomp_to_string
                                             comp3
                                            in
                                         FStar_Util.print2
                                           "(d) Monadic app: type of app\n\t(%s)\n\t: %s\n"
                                           uu____12265 uu____12266
                                       else ());
                                      (app, comp3, g))))))
                  in
               let rec tc_args head_info uu____12342 bs args1 =
                 match uu____12342 with
                 | (subst1,outargs,arg_rets,g,fvs) ->
                     (match (bs, args1) with
                      | ((x,FStar_Pervasives_Native.Some
                          (FStar_Syntax_Syntax.Implicit uu____12475))::rest,
                         (uu____12477,FStar_Pervasives_Native.None )::uu____12478)
                          ->
                          let t =
                            FStar_Syntax_Subst.subst subst1
                              x.FStar_Syntax_Syntax.sort
                             in
                          let uu____12538 =
                            check_no_escape
                              (FStar_Pervasives_Native.Some head1) env fvs t
                             in
                          (match uu____12538 with
                           | (t1,g_ex) ->
                               let uu____12551 =
                                 FStar_TypeChecker_Util.new_implicit_var
                                   "Instantiating implicit argument in application"
                                   head1.FStar_Syntax_Syntax.pos env t1
                                  in
                               (match uu____12551 with
                                | (varg,uu____12571,implicits) ->
                                    let subst2 =
                                      (FStar_Syntax_Syntax.NT (x, varg)) ::
                                      subst1  in
                                    let arg =
                                      let uu____12597 =
                                        FStar_Syntax_Syntax.as_implicit true
                                         in
                                      (varg, uu____12597)  in
                                    let uu____12600 =
                                      let uu____12633 =
                                        let uu____12644 =
                                          let uu____12653 =
                                            let uu____12654 =
                                              FStar_Syntax_Syntax.mk_Total t1
                                               in
                                            FStar_All.pipe_right uu____12654
                                              FStar_Syntax_Util.lcomp_of_comp
                                             in
                                          (arg, FStar_Pervasives_Native.None,
                                            uu____12653)
                                           in
                                        uu____12644 :: outargs  in
                                      let uu____12665 =
                                        let uu____12666 =
                                          FStar_TypeChecker_Env.conj_guard
                                            g_ex g
                                           in
                                        FStar_TypeChecker_Env.conj_guard
                                          implicits uu____12666
                                         in
                                      (subst2, uu____12633, (arg ::
                                        arg_rets), uu____12665, fvs)
                                       in
                                    tc_args head_info uu____12600 rest args1))
                      | ((x,aqual)::rest,(e,aq)::rest') ->
                          ((match (aqual, aq) with
                            | (FStar_Pervasives_Native.Some
                               (FStar_Syntax_Syntax.Implicit
                               uu____12768),FStar_Pervasives_Native.Some
                               (FStar_Syntax_Syntax.Implicit uu____12769)) ->
                                ()
                            | (FStar_Pervasives_Native.None
                               ,FStar_Pervasives_Native.None ) -> ()
                            | (FStar_Pervasives_Native.Some
                               (FStar_Syntax_Syntax.Equality
                               ),FStar_Pervasives_Native.None ) -> ()
                            | uu____12782 ->
                                let uu____12791 =
                                  let uu____12796 =
                                    let uu____12797 =
                                      FStar_Syntax_Print.aqual_to_string
                                        aqual
                                       in
                                    let uu____12798 =
                                      FStar_Syntax_Print.aqual_to_string aq
                                       in
                                    let uu____12799 =
                                      FStar_Syntax_Print.bv_to_string x  in
                                    let uu____12800 =
                                      FStar_Syntax_Print.term_to_string e  in
                                    FStar_Util.format4
                                      "Inconsistent implicit qualifier; %s vs %s\nfor bvar %s and term %s"
                                      uu____12797 uu____12798 uu____12799
                                      uu____12800
                                     in
                                  (FStar_Errors.Fatal_InconsistentImplicitQualifier,
                                    uu____12796)
                                   in
                                FStar_Errors.raise_error uu____12791
                                  e.FStar_Syntax_Syntax.pos);
                           (let targ =
                              FStar_Syntax_Subst.subst subst1
                                x.FStar_Syntax_Syntax.sort
                               in
                            let x1 =
                              let uu___353_12803 = x  in
                              {
                                FStar_Syntax_Syntax.ppname =
                                  (uu___353_12803.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index =
                                  (uu___353_12803.FStar_Syntax_Syntax.index);
                                FStar_Syntax_Syntax.sort = targ
                              }  in
                            (let uu____12805 =
                               FStar_TypeChecker_Env.debug env
                                 FStar_Options.Extreme
                                in
                             if uu____12805
                             then
                               let uu____12806 =
                                 FStar_Syntax_Print.bv_to_string x1  in
                               let uu____12807 =
                                 FStar_Syntax_Print.term_to_string
                                   x1.FStar_Syntax_Syntax.sort
                                  in
                               let uu____12808 =
                                 FStar_Syntax_Print.term_to_string e  in
                               let uu____12809 =
                                 FStar_Syntax_Print.subst_to_string subst1
                                  in
                               let uu____12810 =
                                 FStar_Syntax_Print.term_to_string targ  in
                               FStar_Util.print5
                                 "\tFormal is %s : %s\tType of arg %s (after subst %s) = %s\n"
                                 uu____12806 uu____12807 uu____12808
                                 uu____12809 uu____12810
                             else ());
                            (let uu____12812 =
                               check_no_escape
                                 (FStar_Pervasives_Native.Some head1) env fvs
                                 targ
                                in
                             match uu____12812 with
                             | (targ1,g_ex) ->
                                 let env1 =
                                   FStar_TypeChecker_Env.set_expected_typ env
                                     targ1
                                    in
                                 let env2 =
                                   let uu___354_12827 = env1  in
                                   {
                                     FStar_TypeChecker_Env.solver =
                                       (uu___354_12827.FStar_TypeChecker_Env.solver);
                                     FStar_TypeChecker_Env.range =
                                       (uu___354_12827.FStar_TypeChecker_Env.range);
                                     FStar_TypeChecker_Env.curmodule =
                                       (uu___354_12827.FStar_TypeChecker_Env.curmodule);
                                     FStar_TypeChecker_Env.gamma =
                                       (uu___354_12827.FStar_TypeChecker_Env.gamma);
                                     FStar_TypeChecker_Env.gamma_sig =
                                       (uu___354_12827.FStar_TypeChecker_Env.gamma_sig);
                                     FStar_TypeChecker_Env.gamma_cache =
                                       (uu___354_12827.FStar_TypeChecker_Env.gamma_cache);
                                     FStar_TypeChecker_Env.modules =
                                       (uu___354_12827.FStar_TypeChecker_Env.modules);
                                     FStar_TypeChecker_Env.expected_typ =
                                       (uu___354_12827.FStar_TypeChecker_Env.expected_typ);
                                     FStar_TypeChecker_Env.sigtab =
                                       (uu___354_12827.FStar_TypeChecker_Env.sigtab);
                                     FStar_TypeChecker_Env.is_pattern =
                                       (uu___354_12827.FStar_TypeChecker_Env.is_pattern);
                                     FStar_TypeChecker_Env.instantiate_imp =
                                       (uu___354_12827.FStar_TypeChecker_Env.instantiate_imp);
                                     FStar_TypeChecker_Env.effects =
                                       (uu___354_12827.FStar_TypeChecker_Env.effects);
                                     FStar_TypeChecker_Env.generalize =
                                       (uu___354_12827.FStar_TypeChecker_Env.generalize);
                                     FStar_TypeChecker_Env.letrecs =
                                       (uu___354_12827.FStar_TypeChecker_Env.letrecs);
                                     FStar_TypeChecker_Env.top_level =
                                       (uu___354_12827.FStar_TypeChecker_Env.top_level);
                                     FStar_TypeChecker_Env.check_uvars =
                                       (uu___354_12827.FStar_TypeChecker_Env.check_uvars);
                                     FStar_TypeChecker_Env.use_eq =
                                       (is_eq aqual);
                                     FStar_TypeChecker_Env.is_iface =
                                       (uu___354_12827.FStar_TypeChecker_Env.is_iface);
                                     FStar_TypeChecker_Env.admit =
                                       (uu___354_12827.FStar_TypeChecker_Env.admit);
                                     FStar_TypeChecker_Env.lax =
                                       (uu___354_12827.FStar_TypeChecker_Env.lax);
                                     FStar_TypeChecker_Env.lax_universes =
                                       (uu___354_12827.FStar_TypeChecker_Env.lax_universes);
                                     FStar_TypeChecker_Env.phase1 =
                                       (uu___354_12827.FStar_TypeChecker_Env.phase1);
                                     FStar_TypeChecker_Env.failhard =
                                       (uu___354_12827.FStar_TypeChecker_Env.failhard);
                                     FStar_TypeChecker_Env.nosynth =
                                       (uu___354_12827.FStar_TypeChecker_Env.nosynth);
                                     FStar_TypeChecker_Env.uvar_subtyping =
                                       (uu___354_12827.FStar_TypeChecker_Env.uvar_subtyping);
                                     FStar_TypeChecker_Env.tc_term =
                                       (uu___354_12827.FStar_TypeChecker_Env.tc_term);
                                     FStar_TypeChecker_Env.type_of =
                                       (uu___354_12827.FStar_TypeChecker_Env.type_of);
                                     FStar_TypeChecker_Env.universe_of =
                                       (uu___354_12827.FStar_TypeChecker_Env.universe_of);
                                     FStar_TypeChecker_Env.check_type_of =
                                       (uu___354_12827.FStar_TypeChecker_Env.check_type_of);
                                     FStar_TypeChecker_Env.use_bv_sorts =
                                       (uu___354_12827.FStar_TypeChecker_Env.use_bv_sorts);
                                     FStar_TypeChecker_Env.qtbl_name_and_index
                                       =
                                       (uu___354_12827.FStar_TypeChecker_Env.qtbl_name_and_index);
                                     FStar_TypeChecker_Env.normalized_eff_names
                                       =
                                       (uu___354_12827.FStar_TypeChecker_Env.normalized_eff_names);
                                     FStar_TypeChecker_Env.proof_ns =
                                       (uu___354_12827.FStar_TypeChecker_Env.proof_ns);
                                     FStar_TypeChecker_Env.synth_hook =
                                       (uu___354_12827.FStar_TypeChecker_Env.synth_hook);
                                     FStar_TypeChecker_Env.splice =
                                       (uu___354_12827.FStar_TypeChecker_Env.splice);
                                     FStar_TypeChecker_Env.is_native_tactic =
                                       (uu___354_12827.FStar_TypeChecker_Env.is_native_tactic);
                                     FStar_TypeChecker_Env.identifier_info =
                                       (uu___354_12827.FStar_TypeChecker_Env.identifier_info);
                                     FStar_TypeChecker_Env.tc_hooks =
                                       (uu___354_12827.FStar_TypeChecker_Env.tc_hooks);
                                     FStar_TypeChecker_Env.dsenv =
                                       (uu___354_12827.FStar_TypeChecker_Env.dsenv);
                                     FStar_TypeChecker_Env.dep_graph =
                                       (uu___354_12827.FStar_TypeChecker_Env.dep_graph)
                                   }  in
                                 ((let uu____12829 =
                                     FStar_TypeChecker_Env.debug env2
                                       FStar_Options.High
                                      in
                                   if uu____12829
                                   then
                                     let uu____12830 =
                                       FStar_Syntax_Print.tag_of_term e  in
                                     let uu____12831 =
                                       FStar_Syntax_Print.term_to_string e
                                        in
                                     let uu____12832 =
                                       FStar_Syntax_Print.term_to_string
                                         targ1
                                        in
                                     FStar_Util.print3
                                       "Checking arg (%s) %s at type %s\n"
                                       uu____12830 uu____12831 uu____12832
                                   else ());
                                  (let uu____12834 = tc_term env2 e  in
                                   match uu____12834 with
                                   | (e1,c,g_e) ->
                                       let g1 =
                                         let uu____12851 =
                                           FStar_TypeChecker_Env.conj_guard g
                                             g_e
                                            in
                                         FStar_All.pipe_left
                                           (FStar_TypeChecker_Env.conj_guard
                                              g_ex) uu____12851
                                          in
                                       let arg = (e1, aq)  in
                                       let xterm =
                                         let uu____12868 =
                                           let uu____12871 =
                                             let uu____12878 =
                                               FStar_Syntax_Syntax.bv_to_name
                                                 x1
                                                in
                                             FStar_Syntax_Syntax.as_arg
                                               uu____12878
                                              in
                                           FStar_Pervasives_Native.fst
                                             uu____12871
                                            in
                                         (uu____12868, aq)  in
                                       let uu____12883 =
                                         (FStar_Syntax_Util.is_tot_or_gtot_lcomp
                                            c)
                                           ||
                                           (FStar_TypeChecker_Util.is_pure_or_ghost_effect
                                              env2
                                              c.FStar_Syntax_Syntax.eff_name)
                                          in
                                       if uu____12883
                                       then
                                         let subst2 =
                                           let uu____12891 = FStar_List.hd bs
                                              in
                                           maybe_extend_subst subst1
                                             uu____12891 e1
                                            in
                                         tc_args head_info
                                           (subst2,
                                             ((arg,
                                                (FStar_Pervasives_Native.Some
                                                   x1), c) :: outargs),
                                             (xterm :: arg_rets), g1, fvs)
                                           rest rest'
                                       else
                                         tc_args head_info
                                           (subst1,
                                             ((arg,
                                                (FStar_Pervasives_Native.Some
                                                   x1), c) :: outargs),
                                             (xterm :: arg_rets), g1, (x1 ::
                                             fvs)) rest rest')))))
                      | (uu____12977,[]) ->
                          monadic_application head_info subst1 outargs
                            arg_rets g fvs bs
                      | ([],arg::uu____13013) ->
                          let uu____13064 =
                            monadic_application head_info subst1 outargs
                              arg_rets g fvs []
                             in
                          (match uu____13064 with
                           | (head2,chead1,ghead1) ->
                               let rec aux norm1 solve ghead2 tres =
                                 let tres1 =
                                   let uu____13114 =
                                     FStar_Syntax_Subst.compress tres  in
                                   FStar_All.pipe_right uu____13114
                                     FStar_Syntax_Util.unrefine
                                    in
                                 match tres1.FStar_Syntax_Syntax.n with
                                 | FStar_Syntax_Syntax.Tm_arrow (bs1,cres')
                                     ->
                                     let uu____13141 =
                                       FStar_Syntax_Subst.open_comp bs1 cres'
                                        in
                                     (match uu____13141 with
                                      | (bs2,cres'1) ->
                                          let head_info1 =
                                            let uu____13163 =
                                              FStar_Syntax_Util.lcomp_of_comp
                                                cres'1
                                               in
                                            (head2, chead1, ghead2,
                                              uu____13163)
                                             in
                                          ((let uu____13165 =
                                              FStar_TypeChecker_Env.debug env
                                                FStar_Options.Low
                                               in
                                            if uu____13165
                                            then
                                              FStar_Errors.log_issue
                                                tres1.FStar_Syntax_Syntax.pos
                                                (FStar_Errors.Warning_RedundantExplicitCurrying,
                                                  "Potentially redundant explicit currying of a function type")
                                            else ());
                                           tc_args head_info1
                                             ([], [], [],
                                               FStar_TypeChecker_Env.trivial_guard,
                                               []) bs2 args1))
                                 | uu____13203 when Prims.op_Negation norm1
                                     ->
                                     let rec norm_tres tres2 =
                                       let tres3 =
                                         FStar_TypeChecker_Normalize.unfold_whnf
                                           env tres2
                                          in
                                       let uu____13211 =
                                         let uu____13212 =
                                           FStar_Syntax_Subst.compress tres3
                                            in
                                         uu____13212.FStar_Syntax_Syntax.n
                                          in
                                       match uu____13211 with
                                       | FStar_Syntax_Syntax.Tm_refine
                                           ({
                                              FStar_Syntax_Syntax.ppname =
                                                uu____13215;
                                              FStar_Syntax_Syntax.index =
                                                uu____13216;
                                              FStar_Syntax_Syntax.sort =
                                                tres4;_},uu____13218)
                                           -> norm_tres tres4
                                       | uu____13225 -> tres3  in
                                     let uu____13226 = norm_tres tres1  in
                                     aux true solve ghead2 uu____13226
                                 | uu____13227 when Prims.op_Negation solve
                                     ->
                                     let ghead3 =
                                       FStar_TypeChecker_Rel.solve_deferred_constraints
                                         env ghead2
                                        in
                                     aux norm1 true ghead3 tres1
                                 | uu____13229 ->
                                     let uu____13230 =
                                       let uu____13235 =
                                         let uu____13236 =
                                           FStar_TypeChecker_Normalize.term_to_string
                                             env thead
                                            in
                                         let uu____13237 =
                                           FStar_Util.string_of_int n_args
                                            in
                                         let uu____13244 =
                                           FStar_Syntax_Print.term_to_string
                                             tres1
                                            in
                                         FStar_Util.format3
                                           "Too many arguments to function of type %s; got %s arguments, remaining type is %s"
                                           uu____13236 uu____13237
                                           uu____13244
                                          in
                                       (FStar_Errors.Fatal_ToManyArgumentToFunction,
                                         uu____13235)
                                        in
                                     let uu____13245 =
                                       FStar_Syntax_Syntax.argpos arg  in
                                     FStar_Errors.raise_error uu____13230
                                       uu____13245
                                  in
                               aux false false ghead1
                                 chead1.FStar_Syntax_Syntax.res_typ))
                  in
               let rec check_function_app tf guard =
                 let uu____13273 =
                   let uu____13274 =
                     FStar_TypeChecker_Normalize.unfold_whnf env tf  in
                   uu____13274.FStar_Syntax_Syntax.n  in
                 match uu____13273 with
                 | FStar_Syntax_Syntax.Tm_uvar uu____13283 ->
                     let uu____13296 =
                       FStar_List.fold_right
                         (fun uu____13325  ->
                            fun uu____13326  ->
                              match uu____13326 with
                              | (bs,guard1) ->
                                  let uu____13351 =
                                    let uu____13364 =
                                      let uu____13365 =
                                        FStar_Syntax_Util.type_u ()  in
                                      FStar_All.pipe_right uu____13365
                                        FStar_Pervasives_Native.fst
                                       in
                                    FStar_TypeChecker_Util.new_implicit_var
                                      "formal parameter"
                                      tf.FStar_Syntax_Syntax.pos env
                                      uu____13364
                                     in
                                  (match uu____13351 with
                                   | (t,uu____13381,g) ->
                                       let uu____13395 =
                                         let uu____13398 =
                                           FStar_Syntax_Syntax.null_binder t
                                            in
                                         uu____13398 :: bs  in
                                       let uu____13399 =
                                         FStar_TypeChecker_Env.conj_guard g
                                           guard1
                                          in
                                       (uu____13395, uu____13399))) args
                         ([], guard)
                        in
                     (match uu____13296 with
                      | (bs,guard1) ->
                          let uu____13416 =
                            let uu____13423 =
                              let uu____13436 =
                                let uu____13437 = FStar_Syntax_Util.type_u ()
                                   in
                                FStar_All.pipe_right uu____13437
                                  FStar_Pervasives_Native.fst
                                 in
                              FStar_TypeChecker_Util.new_implicit_var
                                "result type" tf.FStar_Syntax_Syntax.pos env
                                uu____13436
                               in
                            match uu____13423 with
                            | (t,uu____13453,g) ->
                                let uu____13467 = FStar_Options.ml_ish ()  in
                                if uu____13467
                                then
                                  let uu____13474 =
                                    FStar_Syntax_Util.ml_comp t r  in
                                  let uu____13477 =
                                    FStar_TypeChecker_Env.conj_guard guard1 g
                                     in
                                  (uu____13474, uu____13477)
                                else
                                  (let uu____13481 =
                                     FStar_Syntax_Syntax.mk_Total t  in
                                   let uu____13484 =
                                     FStar_TypeChecker_Env.conj_guard guard1
                                       g
                                      in
                                   (uu____13481, uu____13484))
                             in
                          (match uu____13416 with
                           | (cres,guard2) ->
                               let bs_cres = FStar_Syntax_Util.arrow bs cres
                                  in
                               ((let uu____13503 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env)
                                     FStar_Options.Extreme
                                    in
                                 if uu____13503
                                 then
                                   let uu____13504 =
                                     FStar_Syntax_Print.term_to_string head1
                                      in
                                   let uu____13505 =
                                     FStar_Syntax_Print.term_to_string tf  in
                                   let uu____13506 =
                                     FStar_Syntax_Print.term_to_string
                                       bs_cres
                                      in
                                   FStar_Util.print3
                                     "Forcing the type of %s from %s to %s\n"
                                     uu____13504 uu____13505 uu____13506
                                 else ());
                                (let g =
                                   let uu____13509 =
                                     FStar_TypeChecker_Rel.teq env tf bs_cres
                                      in
                                   FStar_TypeChecker_Rel.solve_deferred_constraints
                                     env uu____13509
                                    in
                                 let uu____13510 =
                                   FStar_TypeChecker_Env.conj_guard g guard2
                                    in
                                 check_function_app bs_cres uu____13510))))
                 | FStar_Syntax_Syntax.Tm_app
                     ({
                        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                          uu____13511;
                        FStar_Syntax_Syntax.pos = uu____13512;
                        FStar_Syntax_Syntax.vars = uu____13513;_},uu____13514)
                     ->
                     let uu____13547 =
                       FStar_List.fold_right
                         (fun uu____13576  ->
                            fun uu____13577  ->
                              match uu____13577 with
                              | (bs,guard1) ->
                                  let uu____13602 =
                                    let uu____13615 =
                                      let uu____13616 =
                                        FStar_Syntax_Util.type_u ()  in
                                      FStar_All.pipe_right uu____13616
                                        FStar_Pervasives_Native.fst
                                       in
                                    FStar_TypeChecker_Util.new_implicit_var
                                      "formal parameter"
                                      tf.FStar_Syntax_Syntax.pos env
                                      uu____13615
                                     in
                                  (match uu____13602 with
                                   | (t,uu____13632,g) ->
                                       let uu____13646 =
                                         let uu____13649 =
                                           FStar_Syntax_Syntax.null_binder t
                                            in
                                         uu____13649 :: bs  in
                                       let uu____13650 =
                                         FStar_TypeChecker_Env.conj_guard g
                                           guard1
                                          in
                                       (uu____13646, uu____13650))) args
                         ([], guard)
                        in
                     (match uu____13547 with
                      | (bs,guard1) ->
                          let uu____13667 =
                            let uu____13674 =
                              let uu____13687 =
                                let uu____13688 = FStar_Syntax_Util.type_u ()
                                   in
                                FStar_All.pipe_right uu____13688
                                  FStar_Pervasives_Native.fst
                                 in
                              FStar_TypeChecker_Util.new_implicit_var
                                "result type" tf.FStar_Syntax_Syntax.pos env
                                uu____13687
                               in
                            match uu____13674 with
                            | (t,uu____13704,g) ->
                                let uu____13718 = FStar_Options.ml_ish ()  in
                                if uu____13718
                                then
                                  let uu____13725 =
                                    FStar_Syntax_Util.ml_comp t r  in
                                  let uu____13728 =
                                    FStar_TypeChecker_Env.conj_guard guard1 g
                                     in
                                  (uu____13725, uu____13728)
                                else
                                  (let uu____13732 =
                                     FStar_Syntax_Syntax.mk_Total t  in
                                   let uu____13735 =
                                     FStar_TypeChecker_Env.conj_guard guard1
                                       g
                                      in
                                   (uu____13732, uu____13735))
                             in
                          (match uu____13667 with
                           | (cres,guard2) ->
                               let bs_cres = FStar_Syntax_Util.arrow bs cres
                                  in
                               ((let uu____13754 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env)
                                     FStar_Options.Extreme
                                    in
                                 if uu____13754
                                 then
                                   let uu____13755 =
                                     FStar_Syntax_Print.term_to_string head1
                                      in
                                   let uu____13756 =
                                     FStar_Syntax_Print.term_to_string tf  in
                                   let uu____13757 =
                                     FStar_Syntax_Print.term_to_string
                                       bs_cres
                                      in
                                   FStar_Util.print3
                                     "Forcing the type of %s from %s to %s\n"
                                     uu____13755 uu____13756 uu____13757
                                 else ());
                                (let g =
                                   let uu____13760 =
                                     FStar_TypeChecker_Rel.teq env tf bs_cres
                                      in
                                   FStar_TypeChecker_Rel.solve_deferred_constraints
                                     env uu____13760
                                    in
                                 let uu____13761 =
                                   FStar_TypeChecker_Env.conj_guard g guard2
                                    in
                                 check_function_app bs_cres uu____13761))))
                 | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
                     let uu____13780 = FStar_Syntax_Subst.open_comp bs c  in
                     (match uu____13780 with
                      | (bs1,c1) ->
                          let head_info =
                            let uu____13802 =
                              FStar_Syntax_Util.lcomp_of_comp c1  in
                            (head1, chead, ghead, uu____13802)  in
                          tc_args head_info ([], [], [], guard, []) bs1 args)
                 | FStar_Syntax_Syntax.Tm_refine (bv,uu____13840) ->
                     check_function_app bv.FStar_Syntax_Syntax.sort guard
                 | FStar_Syntax_Syntax.Tm_ascribed
                     (t,uu____13846,uu____13847) ->
                     check_function_app t guard
                 | uu____13888 ->
                     let uu____13889 =
                       FStar_TypeChecker_Err.expected_function_typ env tf  in
                     FStar_Errors.raise_error uu____13889
                       head1.FStar_Syntax_Syntax.pos
                  in
               check_function_app thead FStar_TypeChecker_Env.trivial_guard)

and (check_short_circuit_args :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.lcomp ->
        FStar_TypeChecker_Env.guard_t ->
          (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
            FStar_Pervasives_Native.tuple2 Prims.list ->
            FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option ->
              (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
                FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun head1  ->
      fun chead  ->
        fun g_head  ->
          fun args  ->
            fun expected_topt  ->
              let r = FStar_TypeChecker_Env.get_range env  in
              let tf =
                FStar_Syntax_Subst.compress chead.FStar_Syntax_Syntax.res_typ
                 in
              match tf.FStar_Syntax_Syntax.n with
              | FStar_Syntax_Syntax.Tm_arrow (bs,c) when
                  (FStar_Syntax_Util.is_total_comp c) &&
                    ((FStar_List.length bs) = (FStar_List.length args))
                  ->
                  let res_t = FStar_Syntax_Util.comp_result c  in
                  let uu____13961 =
                    FStar_List.fold_left2
                      (fun uu____14020  ->
                         fun uu____14021  ->
                           fun uu____14022  ->
                             match (uu____14020, uu____14021, uu____14022)
                             with
                             | ((seen,guard,ghost),(e,aq),(b,aq')) ->
                                 (if aq <> aq'
                                  then
                                    FStar_Errors.raise_error
                                      (FStar_Errors.Fatal_InconsistentImplicitQualifier,
                                        "Inconsistent implicit qualifiers")
                                      e.FStar_Syntax_Syntax.pos
                                  else ();
                                  (let uu____14138 =
                                     tc_check_tot_or_gtot_term env e
                                       b.FStar_Syntax_Syntax.sort
                                      in
                                   match uu____14138 with
                                   | (e1,c1,g) ->
                                       let short =
                                         FStar_TypeChecker_Util.short_circuit
                                           head1 seen
                                          in
                                       let g1 =
                                         let uu____14164 =
                                           FStar_TypeChecker_Env.guard_of_guard_formula
                                             short
                                            in
                                         FStar_TypeChecker_Env.imp_guard
                                           uu____14164 g
                                          in
                                       let ghost1 =
                                         ghost ||
                                           ((let uu____14168 =
                                               FStar_Syntax_Util.is_total_lcomp
                                                 c1
                                                in
                                             Prims.op_Negation uu____14168)
                                              &&
                                              (let uu____14170 =
                                                 FStar_TypeChecker_Util.is_pure_effect
                                                   env
                                                   c1.FStar_Syntax_Syntax.eff_name
                                                  in
                                               Prims.op_Negation uu____14170))
                                          in
                                       let uu____14171 =
                                         let uu____14180 =
                                           let uu____14189 =
                                             FStar_Syntax_Syntax.as_arg e1
                                              in
                                           [uu____14189]  in
                                         FStar_List.append seen uu____14180
                                          in
                                       let uu____14214 =
                                         FStar_TypeChecker_Env.conj_guard
                                           guard g1
                                          in
                                       (uu____14171, uu____14214, ghost1))))
                      ([], g_head, false) args bs
                     in
                  (match uu____13961 with
                   | (args1,guard,ghost) ->
                       let e =
                         FStar_Syntax_Syntax.mk_Tm_app head1 args1
                           FStar_Pervasives_Native.None r
                          in
                       let c1 =
                         if ghost
                         then
                           let uu____14266 =
                             FStar_Syntax_Syntax.mk_GTotal res_t  in
                           FStar_All.pipe_right uu____14266
                             FStar_Syntax_Util.lcomp_of_comp
                         else FStar_Syntax_Util.lcomp_of_comp c  in
                       let uu____14268 =
                         FStar_TypeChecker_Util.strengthen_precondition
                           FStar_Pervasives_Native.None env e c1 guard
                          in
                       (match uu____14268 with | (c2,g) -> (e, c2, g)))
              | uu____14284 ->
                  check_application_args env head1 chead g_head args
                    expected_topt

and (tc_eqn :
  FStar_Syntax_Syntax.bv ->
    FStar_TypeChecker_Env.env ->
      (FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t,FStar_Syntax_Syntax.term'
                                                                 FStar_Syntax_Syntax.syntax
                                                                 FStar_Pervasives_Native.option,
        FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
        FStar_Pervasives_Native.tuple3 ->
        ((FStar_Syntax_Syntax.pat,FStar_Syntax_Syntax.term
                                    FStar_Pervasives_Native.option,FStar_Syntax_Syntax.term)
           FStar_Pervasives_Native.tuple3,FStar_Syntax_Syntax.term,FStar_Ident.lident,
          FStar_Syntax_Syntax.cflags Prims.list,Prims.bool ->
                                                  FStar_Syntax_Syntax.lcomp,
          FStar_TypeChecker_Env.guard_t) FStar_Pervasives_Native.tuple6)
  =
  fun scrutinee  ->
    fun env  ->
      fun branch1  ->
        let uu____14327 = FStar_Syntax_Subst.open_branch branch1  in
        match uu____14327 with
        | (pattern,when_clause,branch_exp) ->
            let uu____14372 = branch1  in
            (match uu____14372 with
             | (cpat,uu____14413,cbr) ->
                 let tc_pat allow_implicits pat_t p0 =
                   let tc_annot env1 t =
                     let uu____14490 = FStar_Syntax_Util.type_u ()  in
                     match uu____14490 with
                     | (tu,u) ->
                         let uu____14501 =
                           tc_check_tot_or_gtot_term env1 t tu  in
                         (match uu____14501 with
                          | (t1,uu____14513,g) -> (t1, g))
                      in
                   let uu____14515 =
                     FStar_TypeChecker_PatternUtils.pat_as_exp
                       allow_implicits env p0 tc_annot
                      in
                   match uu____14515 with
                   | (pat_bvs1,exp,guard_pat_annots,p) ->
                       ((let uu____14549 =
                           FStar_TypeChecker_Env.debug env FStar_Options.High
                            in
                         if uu____14549
                         then
                           ((let uu____14551 =
                               FStar_Syntax_Print.pat_to_string p0  in
                             let uu____14552 =
                               FStar_Syntax_Print.pat_to_string p  in
                             FStar_Util.print2
                               "Pattern %s elaborated to %s\n" uu____14551
                               uu____14552);
                            (let uu____14553 =
                               FStar_Syntax_Print.bvs_to_string ", " pat_bvs1
                                in
                             FStar_Util.print1 "pat_bvs = [%s]\n" uu____14553))
                         else ());
                        (let pat_env =
                           FStar_List.fold_left FStar_TypeChecker_Env.push_bv
                             env pat_bvs1
                            in
                         let uu____14556 =
                           FStar_TypeChecker_Env.clear_expected_typ pat_env
                            in
                         match uu____14556 with
                         | (env1,uu____14578) ->
                             let env11 =
                               let uu___355_14584 = env1  in
                               {
                                 FStar_TypeChecker_Env.solver =
                                   (uu___355_14584.FStar_TypeChecker_Env.solver);
                                 FStar_TypeChecker_Env.range =
                                   (uu___355_14584.FStar_TypeChecker_Env.range);
                                 FStar_TypeChecker_Env.curmodule =
                                   (uu___355_14584.FStar_TypeChecker_Env.curmodule);
                                 FStar_TypeChecker_Env.gamma =
                                   (uu___355_14584.FStar_TypeChecker_Env.gamma);
                                 FStar_TypeChecker_Env.gamma_sig =
                                   (uu___355_14584.FStar_TypeChecker_Env.gamma_sig);
                                 FStar_TypeChecker_Env.gamma_cache =
                                   (uu___355_14584.FStar_TypeChecker_Env.gamma_cache);
                                 FStar_TypeChecker_Env.modules =
                                   (uu___355_14584.FStar_TypeChecker_Env.modules);
                                 FStar_TypeChecker_Env.expected_typ =
                                   (uu___355_14584.FStar_TypeChecker_Env.expected_typ);
                                 FStar_TypeChecker_Env.sigtab =
                                   (uu___355_14584.FStar_TypeChecker_Env.sigtab);
                                 FStar_TypeChecker_Env.is_pattern = true;
                                 FStar_TypeChecker_Env.instantiate_imp =
                                   (uu___355_14584.FStar_TypeChecker_Env.instantiate_imp);
                                 FStar_TypeChecker_Env.effects =
                                   (uu___355_14584.FStar_TypeChecker_Env.effects);
                                 FStar_TypeChecker_Env.generalize =
                                   (uu___355_14584.FStar_TypeChecker_Env.generalize);
                                 FStar_TypeChecker_Env.letrecs =
                                   (uu___355_14584.FStar_TypeChecker_Env.letrecs);
                                 FStar_TypeChecker_Env.top_level =
                                   (uu___355_14584.FStar_TypeChecker_Env.top_level);
                                 FStar_TypeChecker_Env.check_uvars =
                                   (uu___355_14584.FStar_TypeChecker_Env.check_uvars);
                                 FStar_TypeChecker_Env.use_eq =
                                   (uu___355_14584.FStar_TypeChecker_Env.use_eq);
                                 FStar_TypeChecker_Env.is_iface =
                                   (uu___355_14584.FStar_TypeChecker_Env.is_iface);
                                 FStar_TypeChecker_Env.admit =
                                   (uu___355_14584.FStar_TypeChecker_Env.admit);
                                 FStar_TypeChecker_Env.lax =
                                   (uu___355_14584.FStar_TypeChecker_Env.lax);
                                 FStar_TypeChecker_Env.lax_universes =
                                   (uu___355_14584.FStar_TypeChecker_Env.lax_universes);
                                 FStar_TypeChecker_Env.phase1 =
                                   (uu___355_14584.FStar_TypeChecker_Env.phase1);
                                 FStar_TypeChecker_Env.failhard =
                                   (uu___355_14584.FStar_TypeChecker_Env.failhard);
                                 FStar_TypeChecker_Env.nosynth =
                                   (uu___355_14584.FStar_TypeChecker_Env.nosynth);
                                 FStar_TypeChecker_Env.uvar_subtyping =
                                   (uu___355_14584.FStar_TypeChecker_Env.uvar_subtyping);
                                 FStar_TypeChecker_Env.tc_term =
                                   (uu___355_14584.FStar_TypeChecker_Env.tc_term);
                                 FStar_TypeChecker_Env.type_of =
                                   (uu___355_14584.FStar_TypeChecker_Env.type_of);
                                 FStar_TypeChecker_Env.universe_of =
                                   (uu___355_14584.FStar_TypeChecker_Env.universe_of);
                                 FStar_TypeChecker_Env.check_type_of =
                                   (uu___355_14584.FStar_TypeChecker_Env.check_type_of);
                                 FStar_TypeChecker_Env.use_bv_sorts =
                                   (uu___355_14584.FStar_TypeChecker_Env.use_bv_sorts);
                                 FStar_TypeChecker_Env.qtbl_name_and_index =
                                   (uu___355_14584.FStar_TypeChecker_Env.qtbl_name_and_index);
                                 FStar_TypeChecker_Env.normalized_eff_names =
                                   (uu___355_14584.FStar_TypeChecker_Env.normalized_eff_names);
                                 FStar_TypeChecker_Env.proof_ns =
                                   (uu___355_14584.FStar_TypeChecker_Env.proof_ns);
                                 FStar_TypeChecker_Env.synth_hook =
                                   (uu___355_14584.FStar_TypeChecker_Env.synth_hook);
                                 FStar_TypeChecker_Env.splice =
                                   (uu___355_14584.FStar_TypeChecker_Env.splice);
                                 FStar_TypeChecker_Env.is_native_tactic =
                                   (uu___355_14584.FStar_TypeChecker_Env.is_native_tactic);
                                 FStar_TypeChecker_Env.identifier_info =
                                   (uu___355_14584.FStar_TypeChecker_Env.identifier_info);
                                 FStar_TypeChecker_Env.tc_hooks =
                                   (uu___355_14584.FStar_TypeChecker_Env.tc_hooks);
                                 FStar_TypeChecker_Env.dsenv =
                                   (uu___355_14584.FStar_TypeChecker_Env.dsenv);
                                 FStar_TypeChecker_Env.dep_graph =
                                   (uu___355_14584.FStar_TypeChecker_Env.dep_graph)
                               }  in
                             let expected_pat_t =
                               FStar_TypeChecker_Rel.unrefine env pat_t  in
                             ((let uu____14587 =
                                 FStar_TypeChecker_Env.debug env
                                   FStar_Options.High
                                  in
                               if uu____14587
                               then
                                 let uu____14588 =
                                   FStar_Syntax_Print.term_to_string exp  in
                                 let uu____14589 =
                                   FStar_Syntax_Print.term_to_string pat_t
                                    in
                                 FStar_Util.print2
                                   "Checking pattern expression %s against expected type %s\n"
                                   uu____14588 uu____14589
                               else ());
                              (let env12 =
                                 FStar_TypeChecker_Env.set_expected_typ env11
                                   expected_pat_t
                                  in
                               let uu____14592 =
                                 tc_tot_or_gtot_term env12 exp  in
                               match uu____14592 with
                               | (exp1,lc,g) ->
                                   let g1 =
                                     let uu___356_14617 = g  in
                                     {
                                       FStar_TypeChecker_Env.guard_f =
                                         FStar_TypeChecker_Common.Trivial;
                                       FStar_TypeChecker_Env.deferred =
                                         (uu___356_14617.FStar_TypeChecker_Env.deferred);
                                       FStar_TypeChecker_Env.univ_ineqs =
                                         (uu___356_14617.FStar_TypeChecker_Env.univ_ineqs);
                                       FStar_TypeChecker_Env.implicits =
                                         (uu___356_14617.FStar_TypeChecker_Env.implicits)
                                     }  in
                                   let uu____14618 =
                                     let uu____14619 =
                                       FStar_TypeChecker_Rel.teq_nosmt env12
                                         lc.FStar_Syntax_Syntax.res_typ
                                         expected_pat_t
                                        in
                                     if uu____14619
                                     then
                                       let env13 =
                                         FStar_TypeChecker_Env.set_range
                                           env12 exp1.FStar_Syntax_Syntax.pos
                                          in
                                       let uu____14621 =
                                         FStar_TypeChecker_Rel.discharge_guard_no_smt
                                           env13 g1
                                          in
                                       FStar_All.pipe_right uu____14621
                                         (FStar_TypeChecker_Rel.resolve_implicits
                                            env13)
                                     else
                                       (let uu____14623 =
                                          let uu____14628 =
                                            let uu____14629 =
                                              FStar_Syntax_Print.term_to_string
                                                lc.FStar_Syntax_Syntax.res_typ
                                               in
                                            let uu____14630 =
                                              FStar_Syntax_Print.term_to_string
                                                expected_pat_t
                                               in
                                            FStar_Util.format2
                                              "Inferred type of pattern (%s) is incompatible with the type of the scrutinee (%s)"
                                              uu____14629 uu____14630
                                             in
                                          (FStar_Errors.Fatal_MismatchedPatternType,
                                            uu____14628)
                                           in
                                        FStar_Errors.raise_error uu____14623
                                          exp1.FStar_Syntax_Syntax.pos)
                                      in
                                   let norm_exp =
                                     FStar_TypeChecker_Normalize.normalize
                                       [FStar_TypeChecker_Normalize.Beta]
                                       env12 exp1
                                      in
                                   let uvs_to_string uvs =
                                     let uu____14642 =
                                       let uu____14645 =
                                         FStar_Util.set_elements uvs  in
                                       FStar_All.pipe_right uu____14645
                                         (FStar_List.map
                                            (fun u  ->
                                               FStar_Syntax_Print.uvar_to_string
                                                 u.FStar_Syntax_Syntax.ctx_uvar_head))
                                        in
                                     FStar_All.pipe_right uu____14642
                                       (FStar_String.concat ", ")
                                      in
                                   let uvs1 =
                                     FStar_Syntax_Free.uvars norm_exp  in
                                   let uvs2 =
                                     FStar_Syntax_Free.uvars expected_pat_t
                                      in
                                   ((let uu____14663 =
                                       FStar_TypeChecker_Env.debug env
                                         (FStar_Options.Other "Free")
                                        in
                                     if uu____14663
                                     then
                                       ((let uu____14665 =
                                           FStar_Syntax_Print.term_to_string
                                             norm_exp
                                            in
                                         let uu____14666 = uvs_to_string uvs1
                                            in
                                         FStar_Util.print2
                                           ">> free_1(%s) = %s\n" uu____14665
                                           uu____14666);
                                        (let uu____14667 =
                                           FStar_Syntax_Print.term_to_string
                                             expected_pat_t
                                            in
                                         let uu____14668 = uvs_to_string uvs2
                                            in
                                         FStar_Util.print2
                                           ">> free_2(%s) = %s\n" uu____14667
                                           uu____14668))
                                     else ());
                                    (let uu____14671 =
                                       let uu____14672 =
                                         FStar_Util.set_is_subset_of uvs1
                                           uvs2
                                          in
                                       FStar_All.pipe_left Prims.op_Negation
                                         uu____14672
                                        in
                                     if uu____14671
                                     then
                                       let unresolved =
                                         FStar_Util.set_difference uvs1 uvs2
                                          in
                                       let uu____14676 =
                                         let uu____14681 =
                                           let uu____14682 =
                                             FStar_TypeChecker_Normalize.term_to_string
                                               env norm_exp
                                              in
                                           let uu____14683 =
                                             FStar_TypeChecker_Normalize.term_to_string
                                               env expected_pat_t
                                              in
                                           let uu____14684 =
                                             uvs_to_string unresolved  in
                                           FStar_Util.format3
                                             "Implicit pattern variables in %s could not be resolved against expected type %s;Variables {%s} were unresolved; please bind them explicitly"
                                             uu____14682 uu____14683
                                             uu____14684
                                            in
                                         (FStar_Errors.Fatal_UnresolvedPatternVar,
                                           uu____14681)
                                          in
                                       FStar_Errors.raise_error uu____14676
                                         p.FStar_Syntax_Syntax.p
                                     else ());
                                    (let uu____14687 =
                                       FStar_TypeChecker_Env.debug env
                                         FStar_Options.High
                                        in
                                     if uu____14687
                                     then
                                       let uu____14688 =
                                         FStar_TypeChecker_Normalize.term_to_string
                                           env exp1
                                          in
                                       FStar_Util.print1
                                         "Done checking pattern expression %s\n"
                                         uu____14688
                                     else ());
                                    (let p1 =
                                       FStar_TypeChecker_Util.decorate_pattern
                                         env p exp1
                                        in
                                     (p1, pat_bvs1, pat_env, exp1,
                                       guard_pat_annots, norm_exp)))))))
                    in
                 let pat_t = scrutinee.FStar_Syntax_Syntax.sort  in
                 let scrutinee_tm = FStar_Syntax_Syntax.bv_to_name scrutinee
                    in
                 let uu____14697 =
                   let uu____14704 =
                     FStar_TypeChecker_Env.push_bv env scrutinee  in
                   FStar_All.pipe_right uu____14704
                     FStar_TypeChecker_Env.clear_expected_typ
                    in
                 (match uu____14697 with
                  | (scrutinee_env,uu____14737) ->
                      let uu____14742 = tc_pat true pat_t pattern  in
                      (match uu____14742 with
                       | (pattern1,pat_bvs1,pat_env,pat_exp,guard_pat_annots,norm_pat_exp)
                           ->
                           let uu____14792 =
                             match when_clause with
                             | FStar_Pervasives_Native.None  ->
                                 (FStar_Pervasives_Native.None,
                                   FStar_TypeChecker_Env.trivial_guard)
                             | FStar_Pervasives_Native.Some e ->
                                 let uu____14822 =
                                   FStar_TypeChecker_Env.should_verify env
                                    in
                                 if uu____14822
                                 then
                                   FStar_Errors.raise_error
                                     (FStar_Errors.Fatal_WhenClauseNotSupported,
                                       "When clauses are not yet supported in --verify mode; they will be some day")
                                     e.FStar_Syntax_Syntax.pos
                                 else
                                   (let uu____14840 =
                                      let uu____14847 =
                                        FStar_TypeChecker_Env.set_expected_typ
                                          pat_env FStar_Syntax_Util.t_bool
                                         in
                                      tc_term uu____14847 e  in
                                    match uu____14840 with
                                    | (e1,c,g) ->
                                        ((FStar_Pervasives_Native.Some e1),
                                          g))
                              in
                           (match uu____14792 with
                            | (when_clause1,g_when) ->
                                let uu____14900 = tc_term pat_env branch_exp
                                   in
                                (match uu____14900 with
                                 | (branch_exp1,c,g_branch) ->
                                     let g_branch1 =
                                       FStar_TypeChecker_Env.conj_guard
                                         guard_pat_annots g_branch
                                        in
                                     (FStar_TypeChecker_Env.def_check_guard_wf
                                        cbr.FStar_Syntax_Syntax.pos
                                        "tc_eqn.1" pat_env g_branch1;
                                      (let when_condition =
                                         match when_clause1 with
                                         | FStar_Pervasives_Native.None  ->
                                             FStar_Pervasives_Native.None
                                         | FStar_Pervasives_Native.Some w ->
                                             let uu____14955 =
                                               FStar_Syntax_Util.mk_eq2
                                                 FStar_Syntax_Syntax.U_zero
                                                 FStar_Syntax_Util.t_bool w
                                                 FStar_Syntax_Util.exp_true_bool
                                                in
                                             FStar_All.pipe_left
                                               (fun _0_17  ->
                                                  FStar_Pervasives_Native.Some
                                                    _0_17) uu____14955
                                          in
                                       let uu____14966 =
                                         let eqs =
                                           let uu____14987 =
                                             let uu____14988 =
                                               FStar_TypeChecker_Env.should_verify
                                                 env
                                                in
                                             Prims.op_Negation uu____14988
                                              in
                                           if uu____14987
                                           then FStar_Pervasives_Native.None
                                           else
                                             (let e =
                                                FStar_Syntax_Subst.compress
                                                  pat_exp
                                                 in
                                              match e.FStar_Syntax_Syntax.n
                                              with
                                              | FStar_Syntax_Syntax.Tm_uvar
                                                  uu____15001 ->
                                                  FStar_Pervasives_Native.None
                                              | FStar_Syntax_Syntax.Tm_constant
                                                  uu____15016 ->
                                                  FStar_Pervasives_Native.None
                                              | FStar_Syntax_Syntax.Tm_fvar
                                                  uu____15019 ->
                                                  FStar_Pervasives_Native.None
                                              | uu____15022 ->
                                                  let uu____15023 =
                                                    let uu____15026 =
                                                      env.FStar_TypeChecker_Env.universe_of
                                                        env pat_t
                                                       in
                                                    FStar_Syntax_Util.mk_eq2
                                                      uu____15026 pat_t
                                                      scrutinee_tm e
                                                     in
                                                  FStar_Pervasives_Native.Some
                                                    uu____15023)
                                            in
                                         let uu____15029 =
                                           FStar_TypeChecker_Util.strengthen_precondition
                                             FStar_Pervasives_Native.None env
                                             branch_exp1 c g_branch1
                                            in
                                         match uu____15029 with
                                         | (c1,g_branch2) ->
                                             let uu____15054 =
                                               match (eqs, when_condition)
                                               with
                                               | uu____15071 when
                                                   let uu____15084 =
                                                     FStar_TypeChecker_Env.should_verify
                                                       env
                                                      in
                                                   Prims.op_Negation
                                                     uu____15084
                                                   -> (c1, g_when)
                                               | (FStar_Pervasives_Native.None
                                                  ,FStar_Pervasives_Native.None
                                                  ) -> (c1, g_when)
                                               | (FStar_Pervasives_Native.Some
                                                  f,FStar_Pervasives_Native.None
                                                  ) ->
                                                   let gf =
                                                     FStar_TypeChecker_Common.NonTrivial
                                                       f
                                                      in
                                                   let g =
                                                     FStar_TypeChecker_Env.guard_of_guard_formula
                                                       gf
                                                      in
                                                   let uu____15114 =
                                                     FStar_TypeChecker_Util.weaken_precondition
                                                       env c1 gf
                                                      in
                                                   let uu____15115 =
                                                     FStar_TypeChecker_Env.imp_guard
                                                       g g_when
                                                      in
                                                   (uu____15114, uu____15115)
                                               | (FStar_Pervasives_Native.Some
                                                  f,FStar_Pervasives_Native.Some
                                                  w) ->
                                                   let g_f =
                                                     FStar_TypeChecker_Common.NonTrivial
                                                       f
                                                      in
                                                   let g_fw =
                                                     let uu____15136 =
                                                       FStar_Syntax_Util.mk_conj
                                                         f w
                                                        in
                                                     FStar_TypeChecker_Common.NonTrivial
                                                       uu____15136
                                                      in
                                                   let uu____15137 =
                                                     FStar_TypeChecker_Util.weaken_precondition
                                                       env c1 g_fw
                                                      in
                                                   let uu____15138 =
                                                     let uu____15139 =
                                                       FStar_TypeChecker_Env.guard_of_guard_formula
                                                         g_f
                                                        in
                                                     FStar_TypeChecker_Env.imp_guard
                                                       uu____15139 g_when
                                                      in
                                                   (uu____15137, uu____15138)
                                               | (FStar_Pervasives_Native.None
                                                  ,FStar_Pervasives_Native.Some
                                                  w) ->
                                                   let g_w =
                                                     FStar_TypeChecker_Common.NonTrivial
                                                       w
                                                      in
                                                   let g =
                                                     FStar_TypeChecker_Env.guard_of_guard_formula
                                                       g_w
                                                      in
                                                   let uu____15157 =
                                                     FStar_TypeChecker_Util.weaken_precondition
                                                       env c1 g_w
                                                      in
                                                   (uu____15157, g_when)
                                                in
                                             (match uu____15054 with
                                              | (c_weak,g_when_weak) ->
                                                  let binders =
                                                    FStar_List.map
                                                      FStar_Syntax_Syntax.mk_binder
                                                      pat_bvs1
                                                     in
                                                  let maybe_return_c_weak
                                                    should_return =
                                                    let c_weak1 =
                                                      let uu____15193 =
                                                        should_return &&
                                                          (FStar_Syntax_Util.is_pure_or_ghost_lcomp
                                                             c_weak)
                                                         in
                                                      if uu____15193
                                                      then
                                                        FStar_TypeChecker_Util.maybe_assume_result_eq_pure_term
                                                          env branch_exp1
                                                          c_weak
                                                      else c_weak  in
                                                    FStar_TypeChecker_Util.close_lcomp
                                                      env pat_bvs1 c_weak1
                                                     in
                                                  let uu____15195 =
                                                    FStar_TypeChecker_Env.close_guard
                                                      env binders g_when_weak
                                                     in
                                                  ((c_weak.FStar_Syntax_Syntax.eff_name),
                                                    (c_weak.FStar_Syntax_Syntax.cflags),
                                                    maybe_return_c_weak,
                                                    uu____15195, g_branch2))
                                          in
                                       match uu____14966 with
                                       | (effect_label,cflags,maybe_return_c,g_when1,g_branch2)
                                           ->
                                           let branch_guard =
                                             let uu____15242 =
                                               let uu____15243 =
                                                 FStar_TypeChecker_Env.should_verify
                                                   env
                                                  in
                                               Prims.op_Negation uu____15243
                                                in
                                             if uu____15242
                                             then FStar_Syntax_Util.t_true
                                             else
                                               (let rec build_branch_guard
                                                  scrutinee_tm1 pat_exp1 =
                                                  let discriminate
                                                    scrutinee_tm2 f =
                                                    let uu____15285 =
                                                      let uu____15286 =
                                                        let uu____15287 =
                                                          let uu____15290 =
                                                            let uu____15297 =
                                                              FStar_TypeChecker_Env.typ_of_datacon
                                                                env
                                                                f.FStar_Syntax_Syntax.v
                                                               in
                                                            FStar_TypeChecker_Env.datacons_of_typ
                                                              env uu____15297
                                                             in
                                                          FStar_Pervasives_Native.snd
                                                            uu____15290
                                                           in
                                                        FStar_List.length
                                                          uu____15287
                                                         in
                                                      uu____15286 >
                                                        (Prims.parse_int "1")
                                                       in
                                                    if uu____15285
                                                    then
                                                      let discriminator =
                                                        FStar_Syntax_Util.mk_discriminator
                                                          f.FStar_Syntax_Syntax.v
                                                         in
                                                      let uu____15303 =
                                                        FStar_TypeChecker_Env.try_lookup_lid
                                                          env discriminator
                                                         in
                                                      match uu____15303 with
                                                      | FStar_Pervasives_Native.None
                                                           -> []
                                                      | uu____15324 ->
                                                          let disc =
                                                            FStar_Syntax_Syntax.fvar
                                                              discriminator
                                                              (FStar_Syntax_Syntax.Delta_equational_at_level
                                                                 (Prims.parse_int "1"))
                                                              FStar_Pervasives_Native.None
                                                             in
                                                          let disc1 =
                                                            let uu____15339 =
                                                              let uu____15344
                                                                =
                                                                let uu____15345
                                                                  =
                                                                  FStar_Syntax_Syntax.as_arg
                                                                    scrutinee_tm2
                                                                   in
                                                                [uu____15345]
                                                                 in
                                                              FStar_Syntax_Syntax.mk_Tm_app
                                                                disc
                                                                uu____15344
                                                               in
                                                            uu____15339
                                                              FStar_Pervasives_Native.None
                                                              scrutinee_tm2.FStar_Syntax_Syntax.pos
                                                             in
                                                          let uu____15366 =
                                                            FStar_Syntax_Util.mk_eq2
                                                              FStar_Syntax_Syntax.U_zero
                                                              FStar_Syntax_Util.t_bool
                                                              disc1
                                                              FStar_Syntax_Util.exp_true_bool
                                                             in
                                                          [uu____15366]
                                                    else []  in
                                                  let fail1 uu____15373 =
                                                    let uu____15374 =
                                                      let uu____15375 =
                                                        FStar_Range.string_of_range
                                                          pat_exp1.FStar_Syntax_Syntax.pos
                                                         in
                                                      let uu____15376 =
                                                        FStar_Syntax_Print.term_to_string
                                                          pat_exp1
                                                         in
                                                      let uu____15377 =
                                                        FStar_Syntax_Print.tag_of_term
                                                          pat_exp1
                                                         in
                                                      FStar_Util.format3
                                                        "tc_eqn: Impossible (%s) %s (%s)"
                                                        uu____15375
                                                        uu____15376
                                                        uu____15377
                                                       in
                                                    failwith uu____15374  in
                                                  let rec head_constructor t
                                                    =
                                                    match t.FStar_Syntax_Syntax.n
                                                    with
                                                    | FStar_Syntax_Syntax.Tm_fvar
                                                        fv ->
                                                        fv.FStar_Syntax_Syntax.fv_name
                                                    | FStar_Syntax_Syntax.Tm_uinst
                                                        (t1,uu____15390) ->
                                                        head_constructor t1
                                                    | uu____15395 -> fail1 ()
                                                     in
                                                  let pat_exp2 =
                                                    let uu____15399 =
                                                      FStar_Syntax_Subst.compress
                                                        pat_exp1
                                                       in
                                                    FStar_All.pipe_right
                                                      uu____15399
                                                      FStar_Syntax_Util.unmeta
                                                     in
                                                  match pat_exp2.FStar_Syntax_Syntax.n
                                                  with
                                                  | FStar_Syntax_Syntax.Tm_uvar
                                                      uu____15404 -> []
                                                  | FStar_Syntax_Syntax.Tm_app
                                                      ({
                                                         FStar_Syntax_Syntax.n
                                                           =
                                                           FStar_Syntax_Syntax.Tm_uvar
                                                           uu____15417;
                                                         FStar_Syntax_Syntax.pos
                                                           = uu____15418;
                                                         FStar_Syntax_Syntax.vars
                                                           = uu____15419;_},uu____15420)
                                                      -> []
                                                  | FStar_Syntax_Syntax.Tm_name
                                                      uu____15453 -> []
                                                  | FStar_Syntax_Syntax.Tm_constant
                                                      (FStar_Const.Const_unit
                                                      ) -> []
                                                  | FStar_Syntax_Syntax.Tm_constant
                                                      c1 ->
                                                      let uu____15455 =
                                                        let uu____15456 =
                                                          tc_constant env
                                                            pat_exp2.FStar_Syntax_Syntax.pos
                                                            c1
                                                           in
                                                        FStar_Syntax_Util.mk_eq2
                                                          FStar_Syntax_Syntax.U_zero
                                                          uu____15456
                                                          scrutinee_tm1
                                                          pat_exp2
                                                         in
                                                      [uu____15455]
                                                  | FStar_Syntax_Syntax.Tm_uinst
                                                      uu____15457 ->
                                                      let f =
                                                        head_constructor
                                                          pat_exp2
                                                         in
                                                      let uu____15465 =
                                                        let uu____15466 =
                                                          FStar_TypeChecker_Env.is_datacon
                                                            env
                                                            f.FStar_Syntax_Syntax.v
                                                           in
                                                        Prims.op_Negation
                                                          uu____15466
                                                         in
                                                      if uu____15465
                                                      then []
                                                      else
                                                        (let uu____15470 =
                                                           head_constructor
                                                             pat_exp2
                                                            in
                                                         discriminate
                                                           scrutinee_tm1
                                                           uu____15470)
                                                  | FStar_Syntax_Syntax.Tm_fvar
                                                      uu____15473 ->
                                                      let f =
                                                        head_constructor
                                                          pat_exp2
                                                         in
                                                      let uu____15475 =
                                                        let uu____15476 =
                                                          FStar_TypeChecker_Env.is_datacon
                                                            env
                                                            f.FStar_Syntax_Syntax.v
                                                           in
                                                        Prims.op_Negation
                                                          uu____15476
                                                         in
                                                      if uu____15475
                                                      then []
                                                      else
                                                        (let uu____15480 =
                                                           head_constructor
                                                             pat_exp2
                                                            in
                                                         discriminate
                                                           scrutinee_tm1
                                                           uu____15480)
                                                  | FStar_Syntax_Syntax.Tm_app
                                                      (head1,args) ->
                                                      let f =
                                                        head_constructor
                                                          head1
                                                         in
                                                      let uu____15506 =
                                                        let uu____15507 =
                                                          FStar_TypeChecker_Env.is_datacon
                                                            env
                                                            f.FStar_Syntax_Syntax.v
                                                           in
                                                        Prims.op_Negation
                                                          uu____15507
                                                         in
                                                      if uu____15506
                                                      then []
                                                      else
                                                        (let sub_term_guards
                                                           =
                                                           let uu____15514 =
                                                             FStar_All.pipe_right
                                                               args
                                                               (FStar_List.mapi
                                                                  (fun i  ->
                                                                    fun
                                                                    uu____15546
                                                                     ->
                                                                    match uu____15546
                                                                    with
                                                                    | 
                                                                    (ei,uu____15556)
                                                                    ->
                                                                    let projector
                                                                    =
                                                                    FStar_TypeChecker_Env.lookup_projector
                                                                    env
                                                                    f.FStar_Syntax_Syntax.v
                                                                    i  in
                                                                    let uu____15562
                                                                    =
                                                                    FStar_TypeChecker_Env.try_lookup_lid
                                                                    env
                                                                    projector
                                                                     in
                                                                    (match uu____15562
                                                                    with
                                                                    | 
                                                                    FStar_Pervasives_Native.None
                                                                     -> []
                                                                    | 
                                                                    uu____15583
                                                                    ->
                                                                    let sub_term
                                                                    =
                                                                    let uu____15597
                                                                    =
                                                                    let uu____15602
                                                                    =
                                                                    let uu____15603
                                                                    =
                                                                    FStar_Ident.set_lid_range
                                                                    projector
                                                                    f.FStar_Syntax_Syntax.p
                                                                     in
                                                                    FStar_Syntax_Syntax.fvar
                                                                    uu____15603
                                                                    (FStar_Syntax_Syntax.Delta_equational_at_level
                                                                    (Prims.parse_int "1"))
                                                                    FStar_Pervasives_Native.None
                                                                     in
                                                                    let uu____15604
                                                                    =
                                                                    let uu____15605
                                                                    =
                                                                    FStar_Syntax_Syntax.as_arg
                                                                    scrutinee_tm1
                                                                     in
                                                                    [uu____15605]
                                                                     in
                                                                    FStar_Syntax_Syntax.mk_Tm_app
                                                                    uu____15602
                                                                    uu____15604
                                                                     in
                                                                    uu____15597
                                                                    FStar_Pervasives_Native.None
                                                                    f.FStar_Syntax_Syntax.p
                                                                     in
                                                                    build_branch_guard
                                                                    sub_term
                                                                    ei)))
                                                              in
                                                           FStar_All.pipe_right
                                                             uu____15514
                                                             FStar_List.flatten
                                                            in
                                                         let uu____15632 =
                                                           discriminate
                                                             scrutinee_tm1 f
                                                            in
                                                         FStar_List.append
                                                           uu____15632
                                                           sub_term_guards)
                                                  | uu____15635 -> []  in
                                                let build_and_check_branch_guard
                                                  scrutinee_tm1 pat =
                                                  let uu____15651 =
                                                    let uu____15652 =
                                                      FStar_TypeChecker_Env.should_verify
                                                        env
                                                       in
                                                    Prims.op_Negation
                                                      uu____15652
                                                     in
                                                  if uu____15651
                                                  then
                                                    FStar_TypeChecker_Util.fvar_const
                                                      env
                                                      FStar_Parser_Const.true_lid
                                                  else
                                                    (let t =
                                                       let uu____15655 =
                                                         build_branch_guard
                                                           scrutinee_tm1 pat
                                                          in
                                                       FStar_All.pipe_left
                                                         FStar_Syntax_Util.mk_conj_l
                                                         uu____15655
                                                        in
                                                     let uu____15664 =
                                                       FStar_Syntax_Util.type_u
                                                         ()
                                                        in
                                                     match uu____15664 with
                                                     | (k,uu____15670) ->
                                                         let uu____15671 =
                                                           tc_check_tot_or_gtot_term
                                                             scrutinee_env t
                                                             k
                                                            in
                                                         (match uu____15671
                                                          with
                                                          | (t1,uu____15679,uu____15680)
                                                              -> t1))
                                                   in
                                                let branch_guard =
                                                  build_and_check_branch_guard
                                                    scrutinee_tm norm_pat_exp
                                                   in
                                                let branch_guard1 =
                                                  match when_condition with
                                                  | FStar_Pervasives_Native.None
                                                       -> branch_guard
                                                  | FStar_Pervasives_Native.Some
                                                      w ->
                                                      FStar_Syntax_Util.mk_conj
                                                        branch_guard w
                                                   in
                                                branch_guard1)
                                              in
                                           let guard =
                                             FStar_TypeChecker_Env.conj_guard
                                               g_when1 g_branch2
                                              in
                                           ((let uu____15692 =
                                               FStar_TypeChecker_Env.debug
                                                 env FStar_Options.High
                                                in
                                             if uu____15692
                                             then
                                               let uu____15693 =
                                                 FStar_TypeChecker_Rel.guard_to_string
                                                   env guard
                                                  in
                                               FStar_All.pipe_left
                                                 (FStar_Util.print1
                                                    "Carrying guard from match: %s\n")
                                                 uu____15693
                                             else ());
                                            (let uu____15695 =
                                               FStar_Syntax_Subst.close_branch
                                                 (pattern1, when_clause1,
                                                   branch_exp1)
                                                in
                                             let uu____15712 =
                                               let uu____15713 =
                                                 FStar_List.map
                                                   FStar_Syntax_Syntax.mk_binder
                                                   pat_bvs1
                                                  in
                                               FStar_TypeChecker_Util.close_guard_implicits
                                                 env uu____15713 guard
                                                in
                                             (uu____15695, branch_guard,
                                               effect_label, cflags,
                                               maybe_return_c, uu____15712))))))))))

and (check_top_level_let :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      let env1 = instantiate_both env  in
      match e.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),e2) ->
          let uu____15754 = check_let_bound_def true env1 lb  in
          (match uu____15754 with
           | (e1,univ_vars1,c1,g1,annotated) ->
               let uu____15776 =
                 if
                   annotated &&
                     (Prims.op_Negation env1.FStar_TypeChecker_Env.generalize)
                 then
                   let uu____15797 =
                     FStar_TypeChecker_Normalize.reduce_uvar_solutions env1
                       e1
                      in
                   (g1, uu____15797, univ_vars1, c1)
                 else
                   (let g11 =
                      let uu____15802 =
                        FStar_TypeChecker_Rel.solve_deferred_constraints env1
                          g1
                         in
                      FStar_All.pipe_right uu____15802
                        (FStar_TypeChecker_Rel.resolve_implicits env1)
                       in
                    let uu____15804 =
                      let uu____15817 =
                        let uu____15832 =
                          let uu____15841 =
                            let uu____15848 =
                              FStar_Syntax_Syntax.lcomp_comp c1  in
                            ((lb.FStar_Syntax_Syntax.lbname), e1,
                              uu____15848)
                             in
                          [uu____15841]  in
                        FStar_TypeChecker_Util.generalize env1 false
                          uu____15832
                         in
                      FStar_List.hd uu____15817  in
                    match uu____15804 with
                    | (uu____15883,univs1,e11,c11,gvs) ->
                        let g12 =
                          FStar_All.pipe_left
                            (FStar_TypeChecker_Env.map_guard g11)
                            (FStar_TypeChecker_Normalize.normalize
                               [FStar_TypeChecker_Normalize.Beta;
                               FStar_TypeChecker_Normalize.DoNotUnfoldPureLets;
                               FStar_TypeChecker_Normalize.CompressUvars;
                               FStar_TypeChecker_Normalize.NoFullNorm;
                               FStar_TypeChecker_Normalize.Exclude
                                 FStar_TypeChecker_Normalize.Zeta] env1)
                           in
                        let g13 =
                          FStar_TypeChecker_Env.abstract_guard_n gvs g12  in
                        let uu____15897 = FStar_Syntax_Util.lcomp_of_comp c11
                           in
                        (g13, e11, univs1, uu____15897))
                  in
               (match uu____15776 with
                | (g11,e11,univ_vars2,c11) ->
                    let uu____15914 =
                      let uu____15923 =
                        FStar_TypeChecker_Env.should_verify env1  in
                      if uu____15923
                      then
                        let uu____15932 =
                          FStar_TypeChecker_Util.check_top_level env1 g11 c11
                           in
                        match uu____15932 with
                        | (ok,c12) ->
                            (if ok
                             then (e2, c12)
                             else
                               ((let uu____15961 =
                                   FStar_TypeChecker_Env.get_range env1  in
                                 FStar_Errors.log_issue uu____15961
                                   FStar_TypeChecker_Err.top_level_effect);
                                (let uu____15962 =
                                   FStar_Syntax_Syntax.mk
                                     (FStar_Syntax_Syntax.Tm_meta
                                        (e2,
                                          (FStar_Syntax_Syntax.Meta_desugared
                                             FStar_Syntax_Syntax.Masked_effect)))
                                     FStar_Pervasives_Native.None
                                     e2.FStar_Syntax_Syntax.pos
                                    in
                                 (uu____15962, c12))))
                      else
                        (FStar_TypeChecker_Rel.force_trivial_guard env1 g11;
                         (let c =
                            let uu____15976 =
                              FStar_Syntax_Syntax.lcomp_comp c11  in
                            FStar_All.pipe_right uu____15976
                              (FStar_TypeChecker_Normalize.normalize_comp
                                 [FStar_TypeChecker_Normalize.Beta;
                                 FStar_TypeChecker_Normalize.NoFullNorm;
                                 FStar_TypeChecker_Normalize.DoNotUnfoldPureLets]
                                 env1)
                             in
                          let e21 =
                            let uu____15982 =
                              FStar_Syntax_Util.is_pure_comp c  in
                            if uu____15982
                            then e2
                            else
                              ((let uu____15987 =
                                  FStar_TypeChecker_Env.get_range env1  in
                                FStar_Errors.log_issue uu____15987
                                  FStar_TypeChecker_Err.top_level_effect);
                               FStar_Syntax_Syntax.mk
                                 (FStar_Syntax_Syntax.Tm_meta
                                    (e2,
                                      (FStar_Syntax_Syntax.Meta_desugared
                                         FStar_Syntax_Syntax.Masked_effect)))
                                 FStar_Pervasives_Native.None
                                 e2.FStar_Syntax_Syntax.pos)
                             in
                          (e21, c)))
                       in
                    (match uu____15914 with
                     | (e21,c12) ->
                         let cres =
                           FStar_TypeChecker_Env.null_wp_for_eff env1
                             (FStar_Syntax_Util.comp_effect_name c12)
                             FStar_Syntax_Syntax.U_zero
                             FStar_Syntax_Syntax.t_unit
                            in
                         let lb1 =
                           FStar_Syntax_Util.close_univs_and_mk_letbinding
                             FStar_Pervasives_Native.None
                             lb.FStar_Syntax_Syntax.lbname univ_vars2
                             (FStar_Syntax_Util.comp_result c12)
                             (FStar_Syntax_Util.comp_effect_name c12) e11
                             lb.FStar_Syntax_Syntax.lbattrs
                             lb.FStar_Syntax_Syntax.lbpos
                            in
                         let uu____16014 =
                           FStar_Syntax_Syntax.mk
                             (FStar_Syntax_Syntax.Tm_let
                                ((false, [lb1]), e21))
                             FStar_Pervasives_Native.None
                             e.FStar_Syntax_Syntax.pos
                            in
                         let uu____16025 =
                           FStar_Syntax_Util.lcomp_of_comp cres  in
                         (uu____16014, uu____16025,
                           FStar_TypeChecker_Env.trivial_guard))))
      | uu____16026 -> failwith "Impossible"

and (check_inner_let :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      let env1 = instantiate_both env  in
      match e.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),e2) ->
          let env2 =
            let uu___357_16057 = env1  in
            {
              FStar_TypeChecker_Env.solver =
                (uu___357_16057.FStar_TypeChecker_Env.solver);
              FStar_TypeChecker_Env.range =
                (uu___357_16057.FStar_TypeChecker_Env.range);
              FStar_TypeChecker_Env.curmodule =
                (uu___357_16057.FStar_TypeChecker_Env.curmodule);
              FStar_TypeChecker_Env.gamma =
                (uu___357_16057.FStar_TypeChecker_Env.gamma);
              FStar_TypeChecker_Env.gamma_sig =
                (uu___357_16057.FStar_TypeChecker_Env.gamma_sig);
              FStar_TypeChecker_Env.gamma_cache =
                (uu___357_16057.FStar_TypeChecker_Env.gamma_cache);
              FStar_TypeChecker_Env.modules =
                (uu___357_16057.FStar_TypeChecker_Env.modules);
              FStar_TypeChecker_Env.expected_typ =
                (uu___357_16057.FStar_TypeChecker_Env.expected_typ);
              FStar_TypeChecker_Env.sigtab =
                (uu___357_16057.FStar_TypeChecker_Env.sigtab);
              FStar_TypeChecker_Env.is_pattern =
                (uu___357_16057.FStar_TypeChecker_Env.is_pattern);
              FStar_TypeChecker_Env.instantiate_imp =
                (uu___357_16057.FStar_TypeChecker_Env.instantiate_imp);
              FStar_TypeChecker_Env.effects =
                (uu___357_16057.FStar_TypeChecker_Env.effects);
              FStar_TypeChecker_Env.generalize =
                (uu___357_16057.FStar_TypeChecker_Env.generalize);
              FStar_TypeChecker_Env.letrecs =
                (uu___357_16057.FStar_TypeChecker_Env.letrecs);
              FStar_TypeChecker_Env.top_level = false;
              FStar_TypeChecker_Env.check_uvars =
                (uu___357_16057.FStar_TypeChecker_Env.check_uvars);
              FStar_TypeChecker_Env.use_eq =
                (uu___357_16057.FStar_TypeChecker_Env.use_eq);
              FStar_TypeChecker_Env.is_iface =
                (uu___357_16057.FStar_TypeChecker_Env.is_iface);
              FStar_TypeChecker_Env.admit =
                (uu___357_16057.FStar_TypeChecker_Env.admit);
              FStar_TypeChecker_Env.lax =
                (uu___357_16057.FStar_TypeChecker_Env.lax);
              FStar_TypeChecker_Env.lax_universes =
                (uu___357_16057.FStar_TypeChecker_Env.lax_universes);
              FStar_TypeChecker_Env.phase1 =
                (uu___357_16057.FStar_TypeChecker_Env.phase1);
              FStar_TypeChecker_Env.failhard =
                (uu___357_16057.FStar_TypeChecker_Env.failhard);
              FStar_TypeChecker_Env.nosynth =
                (uu___357_16057.FStar_TypeChecker_Env.nosynth);
              FStar_TypeChecker_Env.uvar_subtyping =
                (uu___357_16057.FStar_TypeChecker_Env.uvar_subtyping);
              FStar_TypeChecker_Env.tc_term =
                (uu___357_16057.FStar_TypeChecker_Env.tc_term);
              FStar_TypeChecker_Env.type_of =
                (uu___357_16057.FStar_TypeChecker_Env.type_of);
              FStar_TypeChecker_Env.universe_of =
                (uu___357_16057.FStar_TypeChecker_Env.universe_of);
              FStar_TypeChecker_Env.check_type_of =
                (uu___357_16057.FStar_TypeChecker_Env.check_type_of);
              FStar_TypeChecker_Env.use_bv_sorts =
                (uu___357_16057.FStar_TypeChecker_Env.use_bv_sorts);
              FStar_TypeChecker_Env.qtbl_name_and_index =
                (uu___357_16057.FStar_TypeChecker_Env.qtbl_name_and_index);
              FStar_TypeChecker_Env.normalized_eff_names =
                (uu___357_16057.FStar_TypeChecker_Env.normalized_eff_names);
              FStar_TypeChecker_Env.proof_ns =
                (uu___357_16057.FStar_TypeChecker_Env.proof_ns);
              FStar_TypeChecker_Env.synth_hook =
                (uu___357_16057.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.splice =
                (uu___357_16057.FStar_TypeChecker_Env.splice);
              FStar_TypeChecker_Env.is_native_tactic =
                (uu___357_16057.FStar_TypeChecker_Env.is_native_tactic);
              FStar_TypeChecker_Env.identifier_info =
                (uu___357_16057.FStar_TypeChecker_Env.identifier_info);
              FStar_TypeChecker_Env.tc_hooks =
                (uu___357_16057.FStar_TypeChecker_Env.tc_hooks);
              FStar_TypeChecker_Env.dsenv =
                (uu___357_16057.FStar_TypeChecker_Env.dsenv);
              FStar_TypeChecker_Env.dep_graph =
                (uu___357_16057.FStar_TypeChecker_Env.dep_graph)
            }  in
          let uu____16058 =
            let uu____16069 =
              let uu____16070 = FStar_TypeChecker_Env.clear_expected_typ env2
                 in
              FStar_All.pipe_right uu____16070 FStar_Pervasives_Native.fst
               in
            check_let_bound_def false uu____16069 lb  in
          (match uu____16058 with
           | (e1,uu____16092,c1,g1,annotated) ->
               ((let uu____16097 =
                   (FStar_Util.for_some
                      (FStar_Syntax_Util.is_fvar
                         FStar_Parser_Const.inline_let_attr)
                      lb.FStar_Syntax_Syntax.lbattrs)
                     &&
                     (let uu____16101 =
                        FStar_Syntax_Util.is_pure_or_ghost_lcomp c1  in
                      Prims.op_Negation uu____16101)
                    in
                 if uu____16097
                 then
                   let uu____16102 =
                     let uu____16107 =
                       let uu____16108 = FStar_Syntax_Print.term_to_string e1
                          in
                       let uu____16109 =
                         FStar_Syntax_Print.lid_to_string
                           c1.FStar_Syntax_Syntax.eff_name
                          in
                       FStar_Util.format2
                         "Definitions marked @inline_let are expected to be pure or ghost; got an expression \"%s\" with effect \"%s\""
                         uu____16108 uu____16109
                        in
                     (FStar_Errors.Fatal_ExpectedPureExpression, uu____16107)
                      in
                   FStar_Errors.raise_error uu____16102
                     e1.FStar_Syntax_Syntax.pos
                 else ());
                (let x =
                   let uu___358_16112 =
                     FStar_Util.left lb.FStar_Syntax_Syntax.lbname  in
                   {
                     FStar_Syntax_Syntax.ppname =
                       (uu___358_16112.FStar_Syntax_Syntax.ppname);
                     FStar_Syntax_Syntax.index =
                       (uu___358_16112.FStar_Syntax_Syntax.index);
                     FStar_Syntax_Syntax.sort =
                       (c1.FStar_Syntax_Syntax.res_typ)
                   }  in
                 let uu____16113 =
                   let uu____16118 =
                     let uu____16119 = FStar_Syntax_Syntax.mk_binder x  in
                     [uu____16119]  in
                   FStar_Syntax_Subst.open_term uu____16118 e2  in
                 match uu____16113 with
                 | (xb,e21) ->
                     let xbinder = FStar_List.hd xb  in
                     let x1 = FStar_Pervasives_Native.fst xbinder  in
                     let env_x = FStar_TypeChecker_Env.push_bv env2 x1  in
                     let uu____16151 = tc_term env_x e21  in
                     (match uu____16151 with
                      | (e22,c2,g2) ->
                          let cres =
                            FStar_TypeChecker_Util.maybe_return_e2_and_bind
                              e1.FStar_Syntax_Syntax.pos env2
                              (FStar_Pervasives_Native.Some e1) c1 e22
                              ((FStar_Pervasives_Native.Some x1), c2)
                             in
                          let e11 =
                            FStar_TypeChecker_Util.maybe_lift env2 e1
                              c1.FStar_Syntax_Syntax.eff_name
                              cres.FStar_Syntax_Syntax.eff_name
                              c1.FStar_Syntax_Syntax.res_typ
                             in
                          let e23 =
                            FStar_TypeChecker_Util.maybe_lift env2 e22
                              c2.FStar_Syntax_Syntax.eff_name
                              cres.FStar_Syntax_Syntax.eff_name
                              c2.FStar_Syntax_Syntax.res_typ
                             in
                          let lb1 =
                            FStar_Syntax_Util.mk_letbinding
                              (FStar_Util.Inl x1) []
                              c1.FStar_Syntax_Syntax.res_typ
                              cres.FStar_Syntax_Syntax.eff_name e11
                              lb.FStar_Syntax_Syntax.lbattrs
                              lb.FStar_Syntax_Syntax.lbpos
                             in
                          let e3 =
                            let uu____16176 =
                              let uu____16183 =
                                let uu____16184 =
                                  let uu____16197 =
                                    FStar_Syntax_Subst.close xb e23  in
                                  ((false, [lb1]), uu____16197)  in
                                FStar_Syntax_Syntax.Tm_let uu____16184  in
                              FStar_Syntax_Syntax.mk uu____16183  in
                            uu____16176 FStar_Pervasives_Native.None
                              e.FStar_Syntax_Syntax.pos
                             in
                          let e4 =
                            FStar_TypeChecker_Util.maybe_monadic env2 e3
                              cres.FStar_Syntax_Syntax.eff_name
                              cres.FStar_Syntax_Syntax.res_typ
                             in
                          let x_eq_e1 =
                            let uu____16215 =
                              let uu____16216 =
                                env2.FStar_TypeChecker_Env.universe_of env2
                                  c1.FStar_Syntax_Syntax.res_typ
                                 in
                              let uu____16217 =
                                FStar_Syntax_Syntax.bv_to_name x1  in
                              FStar_Syntax_Util.mk_eq2 uu____16216
                                c1.FStar_Syntax_Syntax.res_typ uu____16217
                                e11
                               in
                            FStar_All.pipe_left
                              (fun _0_18  ->
                                 FStar_TypeChecker_Common.NonTrivial _0_18)
                              uu____16215
                             in
                          let g21 =
                            let uu____16219 =
                              let uu____16220 =
                                FStar_TypeChecker_Env.guard_of_guard_formula
                                  x_eq_e1
                                 in
                              FStar_TypeChecker_Env.imp_guard uu____16220 g2
                               in
                            FStar_TypeChecker_Env.close_guard env2 xb
                              uu____16219
                             in
                          let g22 =
                            FStar_TypeChecker_Util.close_guard_implicits env2
                              xb g21
                             in
                          let guard = FStar_TypeChecker_Env.conj_guard g1 g22
                             in
                          let uu____16223 =
                            let uu____16224 =
                              FStar_TypeChecker_Env.expected_typ env2  in
                            FStar_Option.isSome uu____16224  in
                          if uu____16223
                          then
                            let tt =
                              let uu____16234 =
                                FStar_TypeChecker_Env.expected_typ env2  in
                              FStar_All.pipe_right uu____16234
                                FStar_Option.get
                               in
                            ((let uu____16240 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env2)
                                  (FStar_Options.Other "Exports")
                                 in
                              if uu____16240
                              then
                                let uu____16241 =
                                  FStar_Syntax_Print.term_to_string tt  in
                                let uu____16242 =
                                  FStar_Syntax_Print.term_to_string
                                    cres.FStar_Syntax_Syntax.res_typ
                                   in
                                FStar_Util.print2
                                  "Got expected type from env %s\ncres.res_typ=%s\n"
                                  uu____16241 uu____16242
                              else ());
                             (e4, cres, guard))
                          else
                            (let uu____16245 =
                               check_no_escape FStar_Pervasives_Native.None
                                 env2 [x1] cres.FStar_Syntax_Syntax.res_typ
                                in
                             match uu____16245 with
                             | (t,g_ex) ->
                                 ((let uu____16259 =
                                     FStar_All.pipe_left
                                       (FStar_TypeChecker_Env.debug env2)
                                       (FStar_Options.Other "Exports")
                                      in
                                   if uu____16259
                                   then
                                     let uu____16260 =
                                       FStar_Syntax_Print.term_to_string
                                         cres.FStar_Syntax_Syntax.res_typ
                                        in
                                     let uu____16261 =
                                       FStar_Syntax_Print.term_to_string t
                                        in
                                     FStar_Util.print2
                                       "Checked %s has no escaping types; normalized to %s\n"
                                       uu____16260 uu____16261
                                   else ());
                                  (let uu____16263 =
                                     FStar_TypeChecker_Env.conj_guard g_ex
                                       guard
                                      in
                                   (e4,
                                     (let uu___359_16265 = cres  in
                                      {
                                        FStar_Syntax_Syntax.eff_name =
                                          (uu___359_16265.FStar_Syntax_Syntax.eff_name);
                                        FStar_Syntax_Syntax.res_typ = t;
                                        FStar_Syntax_Syntax.cflags =
                                          (uu___359_16265.FStar_Syntax_Syntax.cflags);
                                        FStar_Syntax_Syntax.comp_thunk =
                                          (uu___359_16265.FStar_Syntax_Syntax.comp_thunk)
                                      }), uu____16263))))))))
      | uu____16266 -> failwith "Impossible"

and (check_top_level_let_rec :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun top  ->
      let env1 = instantiate_both env  in
      match top.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_let ((true ,lbs),e2) ->
          let uu____16298 = FStar_Syntax_Subst.open_let_rec lbs e2  in
          (match uu____16298 with
           | (lbs1,e21) ->
               let uu____16317 =
                 FStar_TypeChecker_Env.clear_expected_typ env1  in
               (match uu____16317 with
                | (env0,topt) ->
                    let uu____16336 = build_let_rec_env true env0 lbs1  in
                    (match uu____16336 with
                     | (lbs2,rec_env,g_t) ->
                         let uu____16358 = check_let_recs rec_env lbs2  in
                         (match uu____16358 with
                          | (lbs3,g_lbs) ->
                              let g_lbs1 =
                                let uu____16378 =
                                  let uu____16379 =
                                    FStar_TypeChecker_Env.conj_guard g_t
                                      g_lbs
                                     in
                                  FStar_All.pipe_right uu____16379
                                    (FStar_TypeChecker_Rel.solve_deferred_constraints
                                       env1)
                                   in
                                FStar_All.pipe_right uu____16378
                                  (FStar_TypeChecker_Rel.resolve_implicits
                                     env1)
                                 in
                              let all_lb_names =
                                let uu____16385 =
                                  FStar_All.pipe_right lbs3
                                    (FStar_List.map
                                       (fun lb  ->
                                          FStar_Util.right
                                            lb.FStar_Syntax_Syntax.lbname))
                                   in
                                FStar_All.pipe_right uu____16385
                                  (fun _0_19  ->
                                     FStar_Pervasives_Native.Some _0_19)
                                 in
                              let lbs4 =
                                if
                                  Prims.op_Negation
                                    env1.FStar_TypeChecker_Env.generalize
                                then
                                  FStar_All.pipe_right lbs3
                                    (FStar_List.map
                                       (fun lb  ->
                                          let lbdef =
                                            FStar_TypeChecker_Normalize.reduce_uvar_solutions
                                              env1
                                              lb.FStar_Syntax_Syntax.lbdef
                                             in
                                          if
                                            lb.FStar_Syntax_Syntax.lbunivs =
                                              []
                                          then lb
                                          else
                                            FStar_Syntax_Util.close_univs_and_mk_letbinding
                                              all_lb_names
                                              lb.FStar_Syntax_Syntax.lbname
                                              lb.FStar_Syntax_Syntax.lbunivs
                                              lb.FStar_Syntax_Syntax.lbtyp
                                              lb.FStar_Syntax_Syntax.lbeff
                                              lbdef
                                              lb.FStar_Syntax_Syntax.lbattrs
                                              lb.FStar_Syntax_Syntax.lbpos))
                                else
                                  (let ecs =
                                     let uu____16434 =
                                       FStar_All.pipe_right lbs3
                                         (FStar_List.map
                                            (fun lb  ->
                                               let uu____16468 =
                                                 FStar_Syntax_Syntax.mk_Total
                                                   lb.FStar_Syntax_Syntax.lbtyp
                                                  in
                                               ((lb.FStar_Syntax_Syntax.lbname),
                                                 (lb.FStar_Syntax_Syntax.lbdef),
                                                 uu____16468)))
                                        in
                                     FStar_TypeChecker_Util.generalize env1
                                       true uu____16434
                                      in
                                   FStar_List.map2
                                     (fun uu____16502  ->
                                        fun lb  ->
                                          match uu____16502 with
                                          | (x,uvs,e,c,gvs) ->
                                              FStar_Syntax_Util.close_univs_and_mk_letbinding
                                                all_lb_names x uvs
                                                (FStar_Syntax_Util.comp_result
                                                   c)
                                                (FStar_Syntax_Util.comp_effect_name
                                                   c) e
                                                lb.FStar_Syntax_Syntax.lbattrs
                                                lb.FStar_Syntax_Syntax.lbpos)
                                     ecs lbs3)
                                 in
                              let cres =
                                let uu____16550 =
                                  FStar_Syntax_Syntax.mk_Total
                                    FStar_Syntax_Syntax.t_unit
                                   in
                                FStar_All.pipe_left
                                  FStar_Syntax_Util.lcomp_of_comp uu____16550
                                 in
                              let uu____16551 =
                                FStar_Syntax_Subst.close_let_rec lbs4 e21  in
                              (match uu____16551 with
                               | (lbs5,e22) ->
                                   ((let uu____16571 =
                                       FStar_TypeChecker_Rel.discharge_guard
                                         env1 g_lbs1
                                        in
                                     FStar_All.pipe_right uu____16571
                                       (FStar_TypeChecker_Rel.force_trivial_guard
                                          env1));
                                    (let uu____16572 =
                                       FStar_Syntax_Syntax.mk
                                         (FStar_Syntax_Syntax.Tm_let
                                            ((true, lbs5), e22))
                                         FStar_Pervasives_Native.None
                                         top.FStar_Syntax_Syntax.pos
                                        in
                                     (uu____16572, cres,
                                       FStar_TypeChecker_Env.trivial_guard))))))))
      | uu____16583 -> failwith "Impossible"

and (check_inner_let_rec :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun top  ->
      let env1 = instantiate_both env  in
      match top.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_let ((true ,lbs),e2) ->
          let uu____16615 = FStar_Syntax_Subst.open_let_rec lbs e2  in
          (match uu____16615 with
           | (lbs1,e21) ->
               let uu____16634 =
                 FStar_TypeChecker_Env.clear_expected_typ env1  in
               (match uu____16634 with
                | (env0,topt) ->
                    let uu____16653 = build_let_rec_env false env0 lbs1  in
                    (match uu____16653 with
                     | (lbs2,rec_env,g_t) ->
                         let uu____16675 =
                           let uu____16682 = check_let_recs rec_env lbs2  in
                           FStar_All.pipe_right uu____16682
                             (fun uu____16705  ->
                                match uu____16705 with
                                | (lbs3,g) ->
                                    let uu____16724 =
                                      FStar_TypeChecker_Env.conj_guard g_t g
                                       in
                                    (lbs3, uu____16724))
                            in
                         (match uu____16675 with
                          | (lbs3,g_lbs) ->
                              let uu____16739 =
                                FStar_All.pipe_right lbs3
                                  (FStar_Util.fold_map
                                     (fun env2  ->
                                        fun lb  ->
                                          let x =
                                            let uu___360_16762 =
                                              FStar_Util.left
                                                lb.FStar_Syntax_Syntax.lbname
                                               in
                                            {
                                              FStar_Syntax_Syntax.ppname =
                                                (uu___360_16762.FStar_Syntax_Syntax.ppname);
                                              FStar_Syntax_Syntax.index =
                                                (uu___360_16762.FStar_Syntax_Syntax.index);
                                              FStar_Syntax_Syntax.sort =
                                                (lb.FStar_Syntax_Syntax.lbtyp)
                                            }  in
                                          let lb1 =
                                            let uu___361_16764 = lb  in
                                            {
                                              FStar_Syntax_Syntax.lbname =
                                                (FStar_Util.Inl x);
                                              FStar_Syntax_Syntax.lbunivs =
                                                (uu___361_16764.FStar_Syntax_Syntax.lbunivs);
                                              FStar_Syntax_Syntax.lbtyp =
                                                (uu___361_16764.FStar_Syntax_Syntax.lbtyp);
                                              FStar_Syntax_Syntax.lbeff =
                                                (uu___361_16764.FStar_Syntax_Syntax.lbeff);
                                              FStar_Syntax_Syntax.lbdef =
                                                (uu___361_16764.FStar_Syntax_Syntax.lbdef);
                                              FStar_Syntax_Syntax.lbattrs =
                                                (uu___361_16764.FStar_Syntax_Syntax.lbattrs);
                                              FStar_Syntax_Syntax.lbpos =
                                                (uu___361_16764.FStar_Syntax_Syntax.lbpos)
                                            }  in
                                          let env3 =
                                            FStar_TypeChecker_Env.push_let_binding
                                              env2
                                              lb1.FStar_Syntax_Syntax.lbname
                                              ([],
                                                (lb1.FStar_Syntax_Syntax.lbtyp))
                                             in
                                          (env3, lb1)) env1)
                                 in
                              (match uu____16739 with
                               | (env2,lbs4) ->
                                   let bvs =
                                     FStar_All.pipe_right lbs4
                                       (FStar_List.map
                                          (fun lb  ->
                                             FStar_Util.left
                                               lb.FStar_Syntax_Syntax.lbname))
                                      in
                                   let uu____16791 = tc_term env2 e21  in
                                   (match uu____16791 with
                                    | (e22,cres,g2) ->
                                        let cres1 =
                                          FStar_TypeChecker_Util.maybe_assume_result_eq_pure_term
                                            env2 e22 cres
                                           in
                                        let cres2 =
                                          FStar_Syntax_Util.lcomp_set_flags
                                            cres1
                                            [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
                                           in
                                        let guard =
                                          let uu____16810 =
                                            let uu____16811 =
                                              FStar_List.map
                                                FStar_Syntax_Syntax.mk_binder
                                                bvs
                                               in
                                            FStar_TypeChecker_Env.close_guard
                                              env2 uu____16811 g2
                                             in
                                          FStar_TypeChecker_Env.conj_guard
                                            g_lbs uu____16810
                                           in
                                        let cres3 =
                                          FStar_TypeChecker_Util.close_lcomp
                                            env2 bvs cres2
                                           in
                                        let tres =
                                          norm env2
                                            cres3.FStar_Syntax_Syntax.res_typ
                                           in
                                        let cres4 =
                                          let uu___362_16819 = cres3  in
                                          {
                                            FStar_Syntax_Syntax.eff_name =
                                              (uu___362_16819.FStar_Syntax_Syntax.eff_name);
                                            FStar_Syntax_Syntax.res_typ =
                                              tres;
                                            FStar_Syntax_Syntax.cflags =
                                              (uu___362_16819.FStar_Syntax_Syntax.cflags);
                                            FStar_Syntax_Syntax.comp_thunk =
                                              (uu___362_16819.FStar_Syntax_Syntax.comp_thunk)
                                          }  in
                                        let guard1 =
                                          let bs =
                                            FStar_All.pipe_right lbs4
                                              (FStar_List.map
                                                 (fun lb  ->
                                                    let uu____16827 =
                                                      FStar_Util.left
                                                        lb.FStar_Syntax_Syntax.lbname
                                                       in
                                                    FStar_Syntax_Syntax.mk_binder
                                                      uu____16827))
                                             in
                                          FStar_TypeChecker_Util.close_guard_implicits
                                            env2 bs guard
                                           in
                                        let uu____16828 =
                                          FStar_Syntax_Subst.close_let_rec
                                            lbs4 e22
                                           in
                                        (match uu____16828 with
                                         | (lbs5,e23) ->
                                             let e =
                                               FStar_Syntax_Syntax.mk
                                                 (FStar_Syntax_Syntax.Tm_let
                                                    ((true, lbs5), e23))
                                                 FStar_Pervasives_Native.None
                                                 top.FStar_Syntax_Syntax.pos
                                                in
                                             (match topt with
                                              | FStar_Pervasives_Native.Some
                                                  uu____16866 ->
                                                  (e, cres4, guard1)
                                              | FStar_Pervasives_Native.None 
                                                  ->
                                                  let uu____16867 =
                                                    check_no_escape
                                                      FStar_Pervasives_Native.None
                                                      env2 bvs tres
                                                     in
                                                  (match uu____16867 with
                                                   | (tres1,g_ex) ->
                                                       let cres5 =
                                                         let uu___363_16881 =
                                                           cres4  in
                                                         {
                                                           FStar_Syntax_Syntax.eff_name
                                                             =
                                                             (uu___363_16881.FStar_Syntax_Syntax.eff_name);
                                                           FStar_Syntax_Syntax.res_typ
                                                             = tres1;
                                                           FStar_Syntax_Syntax.cflags
                                                             =
                                                             (uu___363_16881.FStar_Syntax_Syntax.cflags);
                                                           FStar_Syntax_Syntax.comp_thunk
                                                             =
                                                             (uu___363_16881.FStar_Syntax_Syntax.comp_thunk)
                                                         }  in
                                                       let uu____16882 =
                                                         FStar_TypeChecker_Env.conj_guard
                                                           g_ex guard1
                                                          in
                                                       (e, cres5,
                                                         uu____16882))))))))))
      | uu____16883 -> failwith "Impossible"

and (build_let_rec_env :
  Prims.bool ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.letbinding Prims.list ->
        (FStar_Syntax_Syntax.letbinding Prims.list,FStar_TypeChecker_Env.env_t,
          FStar_TypeChecker_Env.guard_t) FStar_Pervasives_Native.tuple3)
  =
  fun top_level  ->
    fun env  ->
      fun lbs  ->
        let env0 = env  in
        let termination_check_enabled lbname lbdef lbtyp =
          let uu____16928 = FStar_Options.ml_ish ()  in
          if uu____16928
          then false
          else
            (let t = FStar_TypeChecker_Normalize.unfold_whnf env lbtyp  in
             let uu____16931 = FStar_Syntax_Util.arrow_formals_comp t  in
             match uu____16931 with
             | (formals,c) ->
                 let uu____16956 = FStar_Syntax_Util.abs_formals lbdef  in
                 (match uu____16956 with
                  | (actuals,uu____16966,uu____16967) ->
                      if
                        ((FStar_List.length formals) < (Prims.parse_int "1"))
                          ||
                          ((FStar_List.length actuals) <
                             (Prims.parse_int "1"))
                      then
                        let uu____16980 =
                          let uu____16985 =
                            let uu____16986 =
                              FStar_Syntax_Print.term_to_string lbdef  in
                            let uu____16987 =
                              FStar_Syntax_Print.term_to_string lbtyp  in
                            FStar_Util.format2
                              "Only function literals with arrow types can be defined recursively; got %s : %s"
                              uu____16986 uu____16987
                             in
                          (FStar_Errors.Fatal_RecursiveFunctionLiteral,
                            uu____16985)
                           in
                        FStar_Errors.raise_error uu____16980
                          lbtyp.FStar_Syntax_Syntax.pos
                      else
                        (let actuals1 =
                           let uu____16990 =
                             FStar_TypeChecker_Env.set_expected_typ env lbtyp
                              in
                           FStar_TypeChecker_Util.maybe_add_implicit_binders
                             uu____16990 actuals
                            in
                         if
                           (FStar_List.length formals) <>
                             (FStar_List.length actuals1)
                         then
                           (let actuals_msg =
                              let n1 = FStar_List.length actuals1  in
                              if n1 = (Prims.parse_int "1")
                              then "1 argument was found"
                              else
                                (let uu____17011 =
                                   FStar_Util.string_of_int n1  in
                                 FStar_Util.format1 "%s arguments were found"
                                   uu____17011)
                               in
                            let formals_msg =
                              let n1 = FStar_List.length formals  in
                              if n1 = (Prims.parse_int "1")
                              then "1 argument"
                              else
                                (let uu____17029 =
                                   FStar_Util.string_of_int n1  in
                                 FStar_Util.format1 "%s arguments"
                                   uu____17029)
                               in
                            let msg =
                              let uu____17037 =
                                FStar_Syntax_Print.term_to_string lbtyp  in
                              let uu____17038 =
                                FStar_Syntax_Print.lbname_to_string lbname
                                 in
                              FStar_Util.format4
                                "From its type %s, the definition of `let rec %s` expects a function with %s, but %s"
                                uu____17037 uu____17038 formals_msg
                                actuals_msg
                               in
                            FStar_Errors.raise_error
                              (FStar_Errors.Fatal_LetRecArgumentMismatch,
                                msg) lbdef.FStar_Syntax_Syntax.pos)
                         else ();
                         (let quals =
                            FStar_TypeChecker_Env.lookup_effect_quals env
                              (FStar_Syntax_Util.comp_effect_name c)
                             in
                          FStar_All.pipe_right quals
                            (FStar_List.contains
                               FStar_Syntax_Syntax.TotalEffect)))))
           in
        let uu____17045 =
          FStar_List.fold_left
            (fun uu____17078  ->
               fun lb  ->
                 match uu____17078 with
                 | (lbs1,env1,g_acc) ->
                     let uu____17103 =
                       FStar_TypeChecker_Util.extract_let_rec_annotation env1
                         lb
                        in
                     (match uu____17103 with
                      | (univ_vars1,t,check_t) ->
                          let env2 =
                            FStar_TypeChecker_Env.push_univ_vars env1
                              univ_vars1
                             in
                          let e =
                            FStar_Syntax_Util.unascribe
                              lb.FStar_Syntax_Syntax.lbdef
                             in
                          let uu____17123 =
                            if Prims.op_Negation check_t
                            then (g_acc, t)
                            else
                              (let env01 =
                                 FStar_TypeChecker_Env.push_univ_vars env0
                                   univ_vars1
                                  in
                               let uu____17140 =
                                 let uu____17147 =
                                   let uu____17148 =
                                     FStar_Syntax_Util.type_u ()  in
                                   FStar_All.pipe_left
                                     FStar_Pervasives_Native.fst uu____17148
                                    in
                                 tc_check_tot_or_gtot_term
                                   (let uu___364_17159 = env01  in
                                    {
                                      FStar_TypeChecker_Env.solver =
                                        (uu___364_17159.FStar_TypeChecker_Env.solver);
                                      FStar_TypeChecker_Env.range =
                                        (uu___364_17159.FStar_TypeChecker_Env.range);
                                      FStar_TypeChecker_Env.curmodule =
                                        (uu___364_17159.FStar_TypeChecker_Env.curmodule);
                                      FStar_TypeChecker_Env.gamma =
                                        (uu___364_17159.FStar_TypeChecker_Env.gamma);
                                      FStar_TypeChecker_Env.gamma_sig =
                                        (uu___364_17159.FStar_TypeChecker_Env.gamma_sig);
                                      FStar_TypeChecker_Env.gamma_cache =
                                        (uu___364_17159.FStar_TypeChecker_Env.gamma_cache);
                                      FStar_TypeChecker_Env.modules =
                                        (uu___364_17159.FStar_TypeChecker_Env.modules);
                                      FStar_TypeChecker_Env.expected_typ =
                                        (uu___364_17159.FStar_TypeChecker_Env.expected_typ);
                                      FStar_TypeChecker_Env.sigtab =
                                        (uu___364_17159.FStar_TypeChecker_Env.sigtab);
                                      FStar_TypeChecker_Env.is_pattern =
                                        (uu___364_17159.FStar_TypeChecker_Env.is_pattern);
                                      FStar_TypeChecker_Env.instantiate_imp =
                                        (uu___364_17159.FStar_TypeChecker_Env.instantiate_imp);
                                      FStar_TypeChecker_Env.effects =
                                        (uu___364_17159.FStar_TypeChecker_Env.effects);
                                      FStar_TypeChecker_Env.generalize =
                                        (uu___364_17159.FStar_TypeChecker_Env.generalize);
                                      FStar_TypeChecker_Env.letrecs =
                                        (uu___364_17159.FStar_TypeChecker_Env.letrecs);
                                      FStar_TypeChecker_Env.top_level =
                                        (uu___364_17159.FStar_TypeChecker_Env.top_level);
                                      FStar_TypeChecker_Env.check_uvars =
                                        true;
                                      FStar_TypeChecker_Env.use_eq =
                                        (uu___364_17159.FStar_TypeChecker_Env.use_eq);
                                      FStar_TypeChecker_Env.is_iface =
                                        (uu___364_17159.FStar_TypeChecker_Env.is_iface);
                                      FStar_TypeChecker_Env.admit =
                                        (uu___364_17159.FStar_TypeChecker_Env.admit);
                                      FStar_TypeChecker_Env.lax =
                                        (uu___364_17159.FStar_TypeChecker_Env.lax);
                                      FStar_TypeChecker_Env.lax_universes =
                                        (uu___364_17159.FStar_TypeChecker_Env.lax_universes);
                                      FStar_TypeChecker_Env.phase1 =
                                        (uu___364_17159.FStar_TypeChecker_Env.phase1);
                                      FStar_TypeChecker_Env.failhard =
                                        (uu___364_17159.FStar_TypeChecker_Env.failhard);
                                      FStar_TypeChecker_Env.nosynth =
                                        (uu___364_17159.FStar_TypeChecker_Env.nosynth);
                                      FStar_TypeChecker_Env.uvar_subtyping =
                                        (uu___364_17159.FStar_TypeChecker_Env.uvar_subtyping);
                                      FStar_TypeChecker_Env.tc_term =
                                        (uu___364_17159.FStar_TypeChecker_Env.tc_term);
                                      FStar_TypeChecker_Env.type_of =
                                        (uu___364_17159.FStar_TypeChecker_Env.type_of);
                                      FStar_TypeChecker_Env.universe_of =
                                        (uu___364_17159.FStar_TypeChecker_Env.universe_of);
                                      FStar_TypeChecker_Env.check_type_of =
                                        (uu___364_17159.FStar_TypeChecker_Env.check_type_of);
                                      FStar_TypeChecker_Env.use_bv_sorts =
                                        (uu___364_17159.FStar_TypeChecker_Env.use_bv_sorts);
                                      FStar_TypeChecker_Env.qtbl_name_and_index
                                        =
                                        (uu___364_17159.FStar_TypeChecker_Env.qtbl_name_and_index);
                                      FStar_TypeChecker_Env.normalized_eff_names
                                        =
                                        (uu___364_17159.FStar_TypeChecker_Env.normalized_eff_names);
                                      FStar_TypeChecker_Env.proof_ns =
                                        (uu___364_17159.FStar_TypeChecker_Env.proof_ns);
                                      FStar_TypeChecker_Env.synth_hook =
                                        (uu___364_17159.FStar_TypeChecker_Env.synth_hook);
                                      FStar_TypeChecker_Env.splice =
                                        (uu___364_17159.FStar_TypeChecker_Env.splice);
                                      FStar_TypeChecker_Env.is_native_tactic
                                        =
                                        (uu___364_17159.FStar_TypeChecker_Env.is_native_tactic);
                                      FStar_TypeChecker_Env.identifier_info =
                                        (uu___364_17159.FStar_TypeChecker_Env.identifier_info);
                                      FStar_TypeChecker_Env.tc_hooks =
                                        (uu___364_17159.FStar_TypeChecker_Env.tc_hooks);
                                      FStar_TypeChecker_Env.dsenv =
                                        (uu___364_17159.FStar_TypeChecker_Env.dsenv);
                                      FStar_TypeChecker_Env.dep_graph =
                                        (uu___364_17159.FStar_TypeChecker_Env.dep_graph)
                                    }) t uu____17147
                                  in
                               match uu____17140 with
                               | (t1,uu____17167,g) ->
                                   let uu____17169 =
                                     let uu____17170 =
                                       let uu____17171 =
                                         FStar_All.pipe_right g
                                           (FStar_TypeChecker_Rel.resolve_implicits
                                              env2)
                                          in
                                       FStar_All.pipe_right uu____17171
                                         (FStar_TypeChecker_Rel.discharge_guard
                                            env2)
                                        in
                                     FStar_TypeChecker_Env.conj_guard g_acc
                                       uu____17170
                                      in
                                   let uu____17172 = norm env01 t1  in
                                   (uu____17169, uu____17172))
                             in
                          (match uu____17123 with
                           | (g,t1) ->
                               let env3 =
                                 let uu____17192 =
                                   termination_check_enabled
                                     lb.FStar_Syntax_Syntax.lbname e t1
                                    in
                                 if uu____17192
                                 then
                                   let uu___365_17193 = env2  in
                                   {
                                     FStar_TypeChecker_Env.solver =
                                       (uu___365_17193.FStar_TypeChecker_Env.solver);
                                     FStar_TypeChecker_Env.range =
                                       (uu___365_17193.FStar_TypeChecker_Env.range);
                                     FStar_TypeChecker_Env.curmodule =
                                       (uu___365_17193.FStar_TypeChecker_Env.curmodule);
                                     FStar_TypeChecker_Env.gamma =
                                       (uu___365_17193.FStar_TypeChecker_Env.gamma);
                                     FStar_TypeChecker_Env.gamma_sig =
                                       (uu___365_17193.FStar_TypeChecker_Env.gamma_sig);
                                     FStar_TypeChecker_Env.gamma_cache =
                                       (uu___365_17193.FStar_TypeChecker_Env.gamma_cache);
                                     FStar_TypeChecker_Env.modules =
                                       (uu___365_17193.FStar_TypeChecker_Env.modules);
                                     FStar_TypeChecker_Env.expected_typ =
                                       (uu___365_17193.FStar_TypeChecker_Env.expected_typ);
                                     FStar_TypeChecker_Env.sigtab =
                                       (uu___365_17193.FStar_TypeChecker_Env.sigtab);
                                     FStar_TypeChecker_Env.is_pattern =
                                       (uu___365_17193.FStar_TypeChecker_Env.is_pattern);
                                     FStar_TypeChecker_Env.instantiate_imp =
                                       (uu___365_17193.FStar_TypeChecker_Env.instantiate_imp);
                                     FStar_TypeChecker_Env.effects =
                                       (uu___365_17193.FStar_TypeChecker_Env.effects);
                                     FStar_TypeChecker_Env.generalize =
                                       (uu___365_17193.FStar_TypeChecker_Env.generalize);
                                     FStar_TypeChecker_Env.letrecs =
                                       (((lb.FStar_Syntax_Syntax.lbname), t1,
                                          univ_vars1) ::
                                       (env2.FStar_TypeChecker_Env.letrecs));
                                     FStar_TypeChecker_Env.top_level =
                                       (uu___365_17193.FStar_TypeChecker_Env.top_level);
                                     FStar_TypeChecker_Env.check_uvars =
                                       (uu___365_17193.FStar_TypeChecker_Env.check_uvars);
                                     FStar_TypeChecker_Env.use_eq =
                                       (uu___365_17193.FStar_TypeChecker_Env.use_eq);
                                     FStar_TypeChecker_Env.is_iface =
                                       (uu___365_17193.FStar_TypeChecker_Env.is_iface);
                                     FStar_TypeChecker_Env.admit =
                                       (uu___365_17193.FStar_TypeChecker_Env.admit);
                                     FStar_TypeChecker_Env.lax =
                                       (uu___365_17193.FStar_TypeChecker_Env.lax);
                                     FStar_TypeChecker_Env.lax_universes =
                                       (uu___365_17193.FStar_TypeChecker_Env.lax_universes);
                                     FStar_TypeChecker_Env.phase1 =
                                       (uu___365_17193.FStar_TypeChecker_Env.phase1);
                                     FStar_TypeChecker_Env.failhard =
                                       (uu___365_17193.FStar_TypeChecker_Env.failhard);
                                     FStar_TypeChecker_Env.nosynth =
                                       (uu___365_17193.FStar_TypeChecker_Env.nosynth);
                                     FStar_TypeChecker_Env.uvar_subtyping =
                                       (uu___365_17193.FStar_TypeChecker_Env.uvar_subtyping);
                                     FStar_TypeChecker_Env.tc_term =
                                       (uu___365_17193.FStar_TypeChecker_Env.tc_term);
                                     FStar_TypeChecker_Env.type_of =
                                       (uu___365_17193.FStar_TypeChecker_Env.type_of);
                                     FStar_TypeChecker_Env.universe_of =
                                       (uu___365_17193.FStar_TypeChecker_Env.universe_of);
                                     FStar_TypeChecker_Env.check_type_of =
                                       (uu___365_17193.FStar_TypeChecker_Env.check_type_of);
                                     FStar_TypeChecker_Env.use_bv_sorts =
                                       (uu___365_17193.FStar_TypeChecker_Env.use_bv_sorts);
                                     FStar_TypeChecker_Env.qtbl_name_and_index
                                       =
                                       (uu___365_17193.FStar_TypeChecker_Env.qtbl_name_and_index);
                                     FStar_TypeChecker_Env.normalized_eff_names
                                       =
                                       (uu___365_17193.FStar_TypeChecker_Env.normalized_eff_names);
                                     FStar_TypeChecker_Env.proof_ns =
                                       (uu___365_17193.FStar_TypeChecker_Env.proof_ns);
                                     FStar_TypeChecker_Env.synth_hook =
                                       (uu___365_17193.FStar_TypeChecker_Env.synth_hook);
                                     FStar_TypeChecker_Env.splice =
                                       (uu___365_17193.FStar_TypeChecker_Env.splice);
                                     FStar_TypeChecker_Env.is_native_tactic =
                                       (uu___365_17193.FStar_TypeChecker_Env.is_native_tactic);
                                     FStar_TypeChecker_Env.identifier_info =
                                       (uu___365_17193.FStar_TypeChecker_Env.identifier_info);
                                     FStar_TypeChecker_Env.tc_hooks =
                                       (uu___365_17193.FStar_TypeChecker_Env.tc_hooks);
                                     FStar_TypeChecker_Env.dsenv =
                                       (uu___365_17193.FStar_TypeChecker_Env.dsenv);
                                     FStar_TypeChecker_Env.dep_graph =
                                       (uu___365_17193.FStar_TypeChecker_Env.dep_graph)
                                   }
                                 else
                                   FStar_TypeChecker_Env.push_let_binding
                                     env2 lb.FStar_Syntax_Syntax.lbname
                                     (univ_vars1, t1)
                                  in
                               let lb1 =
                                 let uu___366_17206 = lb  in
                                 {
                                   FStar_Syntax_Syntax.lbname =
                                     (uu___366_17206.FStar_Syntax_Syntax.lbname);
                                   FStar_Syntax_Syntax.lbunivs = univ_vars1;
                                   FStar_Syntax_Syntax.lbtyp = t1;
                                   FStar_Syntax_Syntax.lbeff =
                                     (uu___366_17206.FStar_Syntax_Syntax.lbeff);
                                   FStar_Syntax_Syntax.lbdef = e;
                                   FStar_Syntax_Syntax.lbattrs =
                                     (uu___366_17206.FStar_Syntax_Syntax.lbattrs);
                                   FStar_Syntax_Syntax.lbpos =
                                     (uu___366_17206.FStar_Syntax_Syntax.lbpos)
                                 }  in
                               ((lb1 :: lbs1), env3, g))))
            ([], env, FStar_TypeChecker_Env.trivial_guard) lbs
           in
        match uu____17045 with
        | (lbs1,env1,g) -> ((FStar_List.rev lbs1), env1, g)

and (check_let_recs :
  FStar_TypeChecker_Env.env_t ->
    FStar_Syntax_Syntax.letbinding Prims.list ->
      (FStar_Syntax_Syntax.letbinding Prims.list,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun lbs  ->
      let uu____17232 =
        let uu____17241 =
          FStar_All.pipe_right lbs
            (FStar_List.map
               (fun lb  ->
                  let uu____17267 =
                    FStar_Syntax_Util.abs_formals
                      lb.FStar_Syntax_Syntax.lbdef
                     in
                  match uu____17267 with
                  | (bs,t,lcomp) ->
                      (match bs with
                       | [] ->
                           let uu____17295 =
                             FStar_Syntax_Syntax.range_of_lbname
                               lb.FStar_Syntax_Syntax.lbname
                              in
                           FStar_Errors.raise_error
                             (FStar_Errors.Fatal_RecursiveFunctionLiteral,
                               "Only function literals may be defined recursively")
                             uu____17295
                       | uu____17300 ->
                           let lb1 =
                             let uu___367_17303 = lb  in
                             let uu____17304 =
                               FStar_Syntax_Util.abs bs t lcomp  in
                             {
                               FStar_Syntax_Syntax.lbname =
                                 (uu___367_17303.FStar_Syntax_Syntax.lbname);
                               FStar_Syntax_Syntax.lbunivs =
                                 (uu___367_17303.FStar_Syntax_Syntax.lbunivs);
                               FStar_Syntax_Syntax.lbtyp =
                                 (uu___367_17303.FStar_Syntax_Syntax.lbtyp);
                               FStar_Syntax_Syntax.lbeff =
                                 (uu___367_17303.FStar_Syntax_Syntax.lbeff);
                               FStar_Syntax_Syntax.lbdef = uu____17304;
                               FStar_Syntax_Syntax.lbattrs =
                                 (uu___367_17303.FStar_Syntax_Syntax.lbattrs);
                               FStar_Syntax_Syntax.lbpos =
                                 (uu___367_17303.FStar_Syntax_Syntax.lbpos)
                             }  in
                           let uu____17307 =
                             let uu____17314 =
                               FStar_TypeChecker_Env.set_expected_typ env
                                 lb1.FStar_Syntax_Syntax.lbtyp
                                in
                             tc_tot_or_gtot_term uu____17314
                               lb1.FStar_Syntax_Syntax.lbdef
                              in
                           (match uu____17307 with
                            | (e,c,g) ->
                                ((let uu____17323 =
                                    let uu____17324 =
                                      FStar_Syntax_Util.is_total_lcomp c  in
                                    Prims.op_Negation uu____17324  in
                                  if uu____17323
                                  then
                                    FStar_Errors.raise_error
                                      (FStar_Errors.Fatal_UnexpectedGTotForLetRec,
                                        "Expected let rec to be a Tot term; got effect GTot")
                                      e.FStar_Syntax_Syntax.pos
                                  else ());
                                 (let lb2 =
                                    FStar_Syntax_Util.mk_letbinding
                                      lb1.FStar_Syntax_Syntax.lbname
                                      lb1.FStar_Syntax_Syntax.lbunivs
                                      lb1.FStar_Syntax_Syntax.lbtyp
                                      FStar_Parser_Const.effect_Tot_lid e
                                      lb1.FStar_Syntax_Syntax.lbattrs
                                      lb1.FStar_Syntax_Syntax.lbpos
                                     in
                                  (lb2, g)))))))
           in
        FStar_All.pipe_right uu____17241 FStar_List.unzip  in
      match uu____17232 with
      | (lbs1,gs) ->
          let g_lbs =
            FStar_List.fold_right FStar_TypeChecker_Env.conj_guard gs
              FStar_TypeChecker_Env.trivial_guard
             in
          (lbs1, g_lbs)

and (check_let_bound_def :
  Prims.bool ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.letbinding ->
        (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.univ_names,FStar_Syntax_Syntax.lcomp,
          FStar_TypeChecker_Env.guard_t,Prims.bool)
          FStar_Pervasives_Native.tuple5)
  =
  fun top_level  ->
    fun env  ->
      fun lb  ->
        let uu____17373 = FStar_TypeChecker_Env.clear_expected_typ env  in
        match uu____17373 with
        | (env1,uu____17391) ->
            let e1 = lb.FStar_Syntax_Syntax.lbdef  in
            let uu____17399 = check_lbtyp top_level env lb  in
            (match uu____17399 with
             | (topt,wf_annot,univ_vars1,univ_opening,env11) ->
                 (if (Prims.op_Negation top_level) && (univ_vars1 <> [])
                  then
                    FStar_Errors.raise_error
                      (FStar_Errors.Fatal_UniversePolymorphicInnerLetBound,
                        "Inner let-bound definitions cannot be universe polymorphic")
                      e1.FStar_Syntax_Syntax.pos
                  else ();
                  (let e11 = FStar_Syntax_Subst.subst univ_opening e1  in
                   let uu____17443 =
                     tc_maybe_toplevel_term
                       (let uu___368_17452 = env11  in
                        {
                          FStar_TypeChecker_Env.solver =
                            (uu___368_17452.FStar_TypeChecker_Env.solver);
                          FStar_TypeChecker_Env.range =
                            (uu___368_17452.FStar_TypeChecker_Env.range);
                          FStar_TypeChecker_Env.curmodule =
                            (uu___368_17452.FStar_TypeChecker_Env.curmodule);
                          FStar_TypeChecker_Env.gamma =
                            (uu___368_17452.FStar_TypeChecker_Env.gamma);
                          FStar_TypeChecker_Env.gamma_sig =
                            (uu___368_17452.FStar_TypeChecker_Env.gamma_sig);
                          FStar_TypeChecker_Env.gamma_cache =
                            (uu___368_17452.FStar_TypeChecker_Env.gamma_cache);
                          FStar_TypeChecker_Env.modules =
                            (uu___368_17452.FStar_TypeChecker_Env.modules);
                          FStar_TypeChecker_Env.expected_typ =
                            (uu___368_17452.FStar_TypeChecker_Env.expected_typ);
                          FStar_TypeChecker_Env.sigtab =
                            (uu___368_17452.FStar_TypeChecker_Env.sigtab);
                          FStar_TypeChecker_Env.is_pattern =
                            (uu___368_17452.FStar_TypeChecker_Env.is_pattern);
                          FStar_TypeChecker_Env.instantiate_imp =
                            (uu___368_17452.FStar_TypeChecker_Env.instantiate_imp);
                          FStar_TypeChecker_Env.effects =
                            (uu___368_17452.FStar_TypeChecker_Env.effects);
                          FStar_TypeChecker_Env.generalize =
                            (uu___368_17452.FStar_TypeChecker_Env.generalize);
                          FStar_TypeChecker_Env.letrecs =
                            (uu___368_17452.FStar_TypeChecker_Env.letrecs);
                          FStar_TypeChecker_Env.top_level = top_level;
                          FStar_TypeChecker_Env.check_uvars =
                            (uu___368_17452.FStar_TypeChecker_Env.check_uvars);
                          FStar_TypeChecker_Env.use_eq =
                            (uu___368_17452.FStar_TypeChecker_Env.use_eq);
                          FStar_TypeChecker_Env.is_iface =
                            (uu___368_17452.FStar_TypeChecker_Env.is_iface);
                          FStar_TypeChecker_Env.admit =
                            (uu___368_17452.FStar_TypeChecker_Env.admit);
                          FStar_TypeChecker_Env.lax =
                            (uu___368_17452.FStar_TypeChecker_Env.lax);
                          FStar_TypeChecker_Env.lax_universes =
                            (uu___368_17452.FStar_TypeChecker_Env.lax_universes);
                          FStar_TypeChecker_Env.phase1 =
                            (uu___368_17452.FStar_TypeChecker_Env.phase1);
                          FStar_TypeChecker_Env.failhard =
                            (uu___368_17452.FStar_TypeChecker_Env.failhard);
                          FStar_TypeChecker_Env.nosynth =
                            (uu___368_17452.FStar_TypeChecker_Env.nosynth);
                          FStar_TypeChecker_Env.uvar_subtyping =
                            (uu___368_17452.FStar_TypeChecker_Env.uvar_subtyping);
                          FStar_TypeChecker_Env.tc_term =
                            (uu___368_17452.FStar_TypeChecker_Env.tc_term);
                          FStar_TypeChecker_Env.type_of =
                            (uu___368_17452.FStar_TypeChecker_Env.type_of);
                          FStar_TypeChecker_Env.universe_of =
                            (uu___368_17452.FStar_TypeChecker_Env.universe_of);
                          FStar_TypeChecker_Env.check_type_of =
                            (uu___368_17452.FStar_TypeChecker_Env.check_type_of);
                          FStar_TypeChecker_Env.use_bv_sorts =
                            (uu___368_17452.FStar_TypeChecker_Env.use_bv_sorts);
                          FStar_TypeChecker_Env.qtbl_name_and_index =
                            (uu___368_17452.FStar_TypeChecker_Env.qtbl_name_and_index);
                          FStar_TypeChecker_Env.normalized_eff_names =
                            (uu___368_17452.FStar_TypeChecker_Env.normalized_eff_names);
                          FStar_TypeChecker_Env.proof_ns =
                            (uu___368_17452.FStar_TypeChecker_Env.proof_ns);
                          FStar_TypeChecker_Env.synth_hook =
                            (uu___368_17452.FStar_TypeChecker_Env.synth_hook);
                          FStar_TypeChecker_Env.splice =
                            (uu___368_17452.FStar_TypeChecker_Env.splice);
                          FStar_TypeChecker_Env.is_native_tactic =
                            (uu___368_17452.FStar_TypeChecker_Env.is_native_tactic);
                          FStar_TypeChecker_Env.identifier_info =
                            (uu___368_17452.FStar_TypeChecker_Env.identifier_info);
                          FStar_TypeChecker_Env.tc_hooks =
                            (uu___368_17452.FStar_TypeChecker_Env.tc_hooks);
                          FStar_TypeChecker_Env.dsenv =
                            (uu___368_17452.FStar_TypeChecker_Env.dsenv);
                          FStar_TypeChecker_Env.dep_graph =
                            (uu___368_17452.FStar_TypeChecker_Env.dep_graph)
                        }) e11
                      in
                   match uu____17443 with
                   | (e12,c1,g1) ->
                       let uu____17466 =
                         let uu____17471 =
                           FStar_TypeChecker_Env.set_range env11
                             e12.FStar_Syntax_Syntax.pos
                            in
                         FStar_TypeChecker_Util.strengthen_precondition
                           (FStar_Pervasives_Native.Some
                              (fun uu____17476  ->
                                 FStar_Util.return_all
                                   FStar_TypeChecker_Err.ill_kinded_type))
                           uu____17471 e12 c1 wf_annot
                          in
                       (match uu____17466 with
                        | (c11,guard_f) ->
                            let g11 =
                              FStar_TypeChecker_Env.conj_guard g1 guard_f  in
                            ((let uu____17491 =
                                FStar_TypeChecker_Env.debug env
                                  FStar_Options.Extreme
                                 in
                              if uu____17491
                              then
                                let uu____17492 =
                                  FStar_Syntax_Print.lbname_to_string
                                    lb.FStar_Syntax_Syntax.lbname
                                   in
                                let uu____17493 =
                                  FStar_Syntax_Print.lcomp_to_string c11  in
                                let uu____17494 =
                                  FStar_TypeChecker_Rel.guard_to_string env
                                    g11
                                   in
                                FStar_Util.print3
                                  "checked let-bound def %s : %s guard is %s\n"
                                  uu____17492 uu____17493 uu____17494
                              else ());
                             (e12, univ_vars1, c11, g11,
                               (FStar_Option.isSome topt)))))))

and (check_lbtyp :
  Prims.bool ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.letbinding ->
        (FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option,FStar_TypeChecker_Env.guard_t,
          FStar_Syntax_Syntax.univ_names,FStar_Syntax_Syntax.subst_elt
                                           Prims.list,FStar_TypeChecker_Env.env)
          FStar_Pervasives_Native.tuple5)
  =
  fun top_level  ->
    fun env  ->
      fun lb  ->
        let t = FStar_Syntax_Subst.compress lb.FStar_Syntax_Syntax.lbtyp  in
        match t.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Tm_unknown  ->
            let uu____17528 =
              FStar_Syntax_Subst.univ_var_opening
                lb.FStar_Syntax_Syntax.lbunivs
               in
            (match uu____17528 with
             | (univ_opening,univ_vars1) ->
                 let uu____17561 =
                   FStar_TypeChecker_Env.push_univ_vars env univ_vars1  in
                 (FStar_Pervasives_Native.None,
                   FStar_TypeChecker_Env.trivial_guard, univ_vars1,
                   univ_opening, uu____17561))
        | uu____17566 ->
            let uu____17567 =
              FStar_Syntax_Subst.univ_var_opening
                lb.FStar_Syntax_Syntax.lbunivs
               in
            (match uu____17567 with
             | (univ_opening,univ_vars1) ->
                 let t1 = FStar_Syntax_Subst.subst univ_opening t  in
                 let env1 =
                   FStar_TypeChecker_Env.push_univ_vars env univ_vars1  in
                 if
                   top_level &&
                     (Prims.op_Negation env.FStar_TypeChecker_Env.generalize)
                 then
                   let uu____17616 =
                     FStar_TypeChecker_Env.set_expected_typ env1 t1  in
                   ((FStar_Pervasives_Native.Some t1),
                     FStar_TypeChecker_Env.trivial_guard, univ_vars1,
                     univ_opening, uu____17616)
                 else
                   (let uu____17622 = FStar_Syntax_Util.type_u ()  in
                    match uu____17622 with
                    | (k,uu____17642) ->
                        let uu____17643 = tc_check_tot_or_gtot_term env1 t1 k
                           in
                        (match uu____17643 with
                         | (t2,uu____17665,g) ->
                             ((let uu____17668 =
                                 FStar_TypeChecker_Env.debug env
                                   FStar_Options.Medium
                                  in
                               if uu____17668
                               then
                                 let uu____17669 =
                                   let uu____17670 =
                                     FStar_Syntax_Util.range_of_lbname
                                       lb.FStar_Syntax_Syntax.lbname
                                      in
                                   FStar_Range.string_of_range uu____17670
                                    in
                                 let uu____17671 =
                                   FStar_Syntax_Print.term_to_string t2  in
                                 FStar_Util.print2
                                   "(%s) Checked type annotation %s\n"
                                   uu____17669 uu____17671
                               else ());
                              (let t3 = norm env1 t2  in
                               let uu____17674 =
                                 FStar_TypeChecker_Env.set_expected_typ env1
                                   t3
                                  in
                               ((FStar_Pervasives_Native.Some t3), g,
                                 univ_vars1, univ_opening, uu____17674))))))

and (tc_binder :
  FStar_TypeChecker_Env.env ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 ->
      ((FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
         FStar_Pervasives_Native.tuple2,FStar_TypeChecker_Env.env,FStar_TypeChecker_Env.guard_t,
        FStar_Syntax_Syntax.universe) FStar_Pervasives_Native.tuple4)
  =
  fun env  ->
    fun uu____17680  ->
      match uu____17680 with
      | (x,imp) ->
          let uu____17699 = FStar_Syntax_Util.type_u ()  in
          (match uu____17699 with
           | (tu,u) ->
               ((let uu____17719 =
                   FStar_TypeChecker_Env.debug env FStar_Options.Extreme  in
                 if uu____17719
                 then
                   let uu____17720 = FStar_Syntax_Print.bv_to_string x  in
                   let uu____17721 =
                     FStar_Syntax_Print.term_to_string
                       x.FStar_Syntax_Syntax.sort
                      in
                   let uu____17722 = FStar_Syntax_Print.term_to_string tu  in
                   FStar_Util.print3 "Checking binder %s:%s at type %s\n"
                     uu____17720 uu____17721 uu____17722
                 else ());
                (let uu____17724 =
                   tc_check_tot_or_gtot_term env x.FStar_Syntax_Syntax.sort
                     tu
                    in
                 match uu____17724 with
                 | (t,uu____17744,g) ->
                     let x1 =
                       ((let uu___369_17752 = x  in
                         {
                           FStar_Syntax_Syntax.ppname =
                             (uu___369_17752.FStar_Syntax_Syntax.ppname);
                           FStar_Syntax_Syntax.index =
                             (uu___369_17752.FStar_Syntax_Syntax.index);
                           FStar_Syntax_Syntax.sort = t
                         }), imp)
                        in
                     ((let uu____17754 =
                         FStar_TypeChecker_Env.debug env FStar_Options.High
                          in
                       if uu____17754
                       then
                         let uu____17755 =
                           FStar_Syntax_Print.bv_to_string
                             (FStar_Pervasives_Native.fst x1)
                            in
                         let uu____17756 =
                           FStar_Syntax_Print.term_to_string t  in
                         FStar_Util.print2 "Pushing binder %s at type %s\n"
                           uu____17755 uu____17756
                       else ());
                      (let uu____17758 = push_binding env x1  in
                       (x1, uu____17758, g, u))))))

and (tc_binders :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders ->
      (FStar_Syntax_Syntax.binders,FStar_TypeChecker_Env.env,FStar_TypeChecker_Env.guard_t,
        FStar_Syntax_Syntax.universes) FStar_Pervasives_Native.tuple4)
  =
  fun env  ->
    fun bs  ->
      (let uu____17766 =
         FStar_TypeChecker_Env.debug env FStar_Options.Extreme  in
       if uu____17766
       then
         let uu____17767 = FStar_Syntax_Print.binders_to_string ", " bs  in
         FStar_Util.print1 "Checking binders %s\n" uu____17767
       else ());
      (let rec aux env1 bs1 =
         match bs1 with
         | [] -> ([], env1, FStar_TypeChecker_Env.trivial_guard, [])
         | b::bs2 ->
             let uu____17856 = tc_binder env1 b  in
             (match uu____17856 with
              | (b1,env',g,u) ->
                  let uu____17897 = aux env' bs2  in
                  (match uu____17897 with
                   | (bs3,env'1,g',us) ->
                       let uu____17950 =
                         let uu____17951 =
                           FStar_TypeChecker_Env.close_guard_univs [u] 
                             [b1] g'
                            in
                         FStar_TypeChecker_Env.conj_guard g uu____17951  in
                       ((b1 :: bs3), env'1, uu____17950, (u :: us))))
          in
       aux env bs)

and (tc_pats :
  FStar_TypeChecker_Env.env ->
    (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 Prims.list Prims.list ->
      ((FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
         FStar_Pervasives_Native.tuple2 Prims.list Prims.list,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun pats  ->
      let tc_args env1 args =
        FStar_List.fold_right
          (fun uu____18040  ->
             fun uu____18041  ->
               match (uu____18040, uu____18041) with
               | ((t,imp),(args1,g)) ->
                   let uu____18110 = tc_term env1 t  in
                   (match uu____18110 with
                    | (t1,uu____18128,g') ->
                        let uu____18130 =
                          FStar_TypeChecker_Env.conj_guard g g'  in
                        (((t1, imp) :: args1), uu____18130))) args
          ([], FStar_TypeChecker_Env.trivial_guard)
         in
      FStar_List.fold_right
        (fun p  ->
           fun uu____18172  ->
             match uu____18172 with
             | (pats1,g) ->
                 let uu____18197 = tc_args env p  in
                 (match uu____18197 with
                  | (args,g') ->
                      let uu____18210 = FStar_TypeChecker_Env.conj_guard g g'
                         in
                      ((args :: pats1), uu____18210))) pats
        ([], FStar_TypeChecker_Env.trivial_guard)

and (tc_tot_or_gtot_term :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      let uu____18223 = tc_maybe_toplevel_term env e  in
      match uu____18223 with
      | (e1,c,g) ->
          let uu____18239 = FStar_Syntax_Util.is_tot_or_gtot_lcomp c  in
          if uu____18239
          then (e1, c, g)
          else
            (let g1 = FStar_TypeChecker_Rel.solve_deferred_constraints env g
                in
             let c1 = FStar_Syntax_Syntax.lcomp_comp c  in
             let c2 = norm_c env c1  in
             let uu____18250 =
               let uu____18255 =
                 FStar_TypeChecker_Util.is_pure_effect env
                   (FStar_Syntax_Util.comp_effect_name c2)
                  in
               if uu____18255
               then
                 let uu____18260 =
                   FStar_Syntax_Syntax.mk_Total
                     (FStar_Syntax_Util.comp_result c2)
                    in
                 (uu____18260, false)
               else
                 (let uu____18262 =
                    FStar_Syntax_Syntax.mk_GTotal
                      (FStar_Syntax_Util.comp_result c2)
                     in
                  (uu____18262, true))
                in
             match uu____18250 with
             | (target_comp,allow_ghost) ->
                 let uu____18271 =
                   FStar_TypeChecker_Rel.sub_comp env c2 target_comp  in
                 (match uu____18271 with
                  | FStar_Pervasives_Native.Some g' ->
                      let uu____18281 =
                        FStar_Syntax_Util.lcomp_of_comp target_comp  in
                      let uu____18282 =
                        FStar_TypeChecker_Env.conj_guard g1 g'  in
                      (e1, uu____18281, uu____18282)
                  | uu____18283 ->
                      if allow_ghost
                      then
                        let uu____18292 =
                          FStar_TypeChecker_Err.expected_ghost_expression e1
                            c2
                           in
                        FStar_Errors.raise_error uu____18292
                          e1.FStar_Syntax_Syntax.pos
                      else
                        (let uu____18304 =
                           FStar_TypeChecker_Err.expected_pure_expression e1
                             c2
                            in
                         FStar_Errors.raise_error uu____18304
                           e1.FStar_Syntax_Syntax.pos)))

and (tc_check_tot_or_gtot_term :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ ->
        (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
          FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      fun t  ->
        let env1 = FStar_TypeChecker_Env.set_expected_typ env t  in
        tc_tot_or_gtot_term env1 e

and (tc_trivial_guard :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp)
        FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun t  ->
      let uu____18327 = tc_tot_or_gtot_term env t  in
      match uu____18327 with
      | (t1,c,g) ->
          (FStar_TypeChecker_Rel.force_trivial_guard env g; (t1, c))

let (type_of_tot_term :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.typ,FStar_TypeChecker_Env.guard_t)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      (let uu____18359 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "RelCheck")
          in
       if uu____18359
       then
         let uu____18360 = FStar_Syntax_Print.term_to_string e  in
         FStar_Util.print1 "Checking term %s\n" uu____18360
       else ());
      (let env1 =
         let uu___370_18363 = env  in
         {
           FStar_TypeChecker_Env.solver =
             (uu___370_18363.FStar_TypeChecker_Env.solver);
           FStar_TypeChecker_Env.range =
             (uu___370_18363.FStar_TypeChecker_Env.range);
           FStar_TypeChecker_Env.curmodule =
             (uu___370_18363.FStar_TypeChecker_Env.curmodule);
           FStar_TypeChecker_Env.gamma =
             (uu___370_18363.FStar_TypeChecker_Env.gamma);
           FStar_TypeChecker_Env.gamma_sig =
             (uu___370_18363.FStar_TypeChecker_Env.gamma_sig);
           FStar_TypeChecker_Env.gamma_cache =
             (uu___370_18363.FStar_TypeChecker_Env.gamma_cache);
           FStar_TypeChecker_Env.modules =
             (uu___370_18363.FStar_TypeChecker_Env.modules);
           FStar_TypeChecker_Env.expected_typ =
             (uu___370_18363.FStar_TypeChecker_Env.expected_typ);
           FStar_TypeChecker_Env.sigtab =
             (uu___370_18363.FStar_TypeChecker_Env.sigtab);
           FStar_TypeChecker_Env.is_pattern =
             (uu___370_18363.FStar_TypeChecker_Env.is_pattern);
           FStar_TypeChecker_Env.instantiate_imp =
             (uu___370_18363.FStar_TypeChecker_Env.instantiate_imp);
           FStar_TypeChecker_Env.effects =
             (uu___370_18363.FStar_TypeChecker_Env.effects);
           FStar_TypeChecker_Env.generalize =
             (uu___370_18363.FStar_TypeChecker_Env.generalize);
           FStar_TypeChecker_Env.letrecs = [];
           FStar_TypeChecker_Env.top_level = false;
           FStar_TypeChecker_Env.check_uvars =
             (uu___370_18363.FStar_TypeChecker_Env.check_uvars);
           FStar_TypeChecker_Env.use_eq =
             (uu___370_18363.FStar_TypeChecker_Env.use_eq);
           FStar_TypeChecker_Env.is_iface =
             (uu___370_18363.FStar_TypeChecker_Env.is_iface);
           FStar_TypeChecker_Env.admit =
             (uu___370_18363.FStar_TypeChecker_Env.admit);
           FStar_TypeChecker_Env.lax =
             (uu___370_18363.FStar_TypeChecker_Env.lax);
           FStar_TypeChecker_Env.lax_universes =
             (uu___370_18363.FStar_TypeChecker_Env.lax_universes);
           FStar_TypeChecker_Env.phase1 =
             (uu___370_18363.FStar_TypeChecker_Env.phase1);
           FStar_TypeChecker_Env.failhard =
             (uu___370_18363.FStar_TypeChecker_Env.failhard);
           FStar_TypeChecker_Env.nosynth =
             (uu___370_18363.FStar_TypeChecker_Env.nosynth);
           FStar_TypeChecker_Env.uvar_subtyping =
             (uu___370_18363.FStar_TypeChecker_Env.uvar_subtyping);
           FStar_TypeChecker_Env.tc_term =
             (uu___370_18363.FStar_TypeChecker_Env.tc_term);
           FStar_TypeChecker_Env.type_of =
             (uu___370_18363.FStar_TypeChecker_Env.type_of);
           FStar_TypeChecker_Env.universe_of =
             (uu___370_18363.FStar_TypeChecker_Env.universe_of);
           FStar_TypeChecker_Env.check_type_of =
             (uu___370_18363.FStar_TypeChecker_Env.check_type_of);
           FStar_TypeChecker_Env.use_bv_sorts =
             (uu___370_18363.FStar_TypeChecker_Env.use_bv_sorts);
           FStar_TypeChecker_Env.qtbl_name_and_index =
             (uu___370_18363.FStar_TypeChecker_Env.qtbl_name_and_index);
           FStar_TypeChecker_Env.normalized_eff_names =
             (uu___370_18363.FStar_TypeChecker_Env.normalized_eff_names);
           FStar_TypeChecker_Env.proof_ns =
             (uu___370_18363.FStar_TypeChecker_Env.proof_ns);
           FStar_TypeChecker_Env.synth_hook =
             (uu___370_18363.FStar_TypeChecker_Env.synth_hook);
           FStar_TypeChecker_Env.splice =
             (uu___370_18363.FStar_TypeChecker_Env.splice);
           FStar_TypeChecker_Env.is_native_tactic =
             (uu___370_18363.FStar_TypeChecker_Env.is_native_tactic);
           FStar_TypeChecker_Env.identifier_info =
             (uu___370_18363.FStar_TypeChecker_Env.identifier_info);
           FStar_TypeChecker_Env.tc_hooks =
             (uu___370_18363.FStar_TypeChecker_Env.tc_hooks);
           FStar_TypeChecker_Env.dsenv =
             (uu___370_18363.FStar_TypeChecker_Env.dsenv);
           FStar_TypeChecker_Env.dep_graph =
             (uu___370_18363.FStar_TypeChecker_Env.dep_graph)
         }  in
       let uu____18370 =
         try tc_tot_or_gtot_term env1 e
         with
         | FStar_Errors.Error (e1,msg,uu____18405) ->
             let uu____18406 = FStar_TypeChecker_Env.get_range env1  in
             FStar_Errors.raise_error (e1, msg) uu____18406
          in
       match uu____18370 with
       | (t,c,g) ->
           let uu____18422 = FStar_Syntax_Util.is_total_lcomp c  in
           if uu____18422
           then (t, (c.FStar_Syntax_Syntax.res_typ), g)
           else
             (let uu____18430 =
                let uu____18435 =
                  let uu____18436 = FStar_Syntax_Print.term_to_string e  in
                  FStar_Util.format1
                    "Implicit argument: Expected a total term; got a ghost term: %s"
                    uu____18436
                   in
                (FStar_Errors.Fatal_UnexpectedImplictArgument, uu____18435)
                 in
              let uu____18437 = FStar_TypeChecker_Env.get_range env1  in
              FStar_Errors.raise_error uu____18430 uu____18437))
  
let level_of_type_fail :
  'Auu____18452 .
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term -> Prims.string -> 'Auu____18452
  =
  fun env  ->
    fun e  ->
      fun t  ->
        let uu____18468 =
          let uu____18473 =
            let uu____18474 = FStar_Syntax_Print.term_to_string e  in
            FStar_Util.format2 "Expected a term of type 'Type'; got %s : %s"
              uu____18474 t
             in
          (FStar_Errors.Fatal_UnexpectedTermType, uu____18473)  in
        let uu____18475 = FStar_TypeChecker_Env.get_range env  in
        FStar_Errors.raise_error uu____18468 uu____18475
  
let (level_of_type :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.universe)
  =
  fun env  ->
    fun e  ->
      fun t  ->
        let rec aux retry t1 =
          let uu____18510 =
            let uu____18511 = FStar_Syntax_Util.unrefine t1  in
            uu____18511.FStar_Syntax_Syntax.n  in
          match uu____18510 with
          | FStar_Syntax_Syntax.Tm_type u -> u
          | uu____18515 ->
              if retry
              then
                let t2 =
                  FStar_TypeChecker_Normalize.normalize
                    [FStar_TypeChecker_Normalize.UnfoldUntil
                       FStar_Syntax_Syntax.delta_constant] env t1
                   in
                aux false t2
              else
                (let uu____18518 = FStar_Syntax_Util.type_u ()  in
                 match uu____18518 with
                 | (t_u,u) ->
                     let env1 =
                       let uu___373_18526 = env  in
                       {
                         FStar_TypeChecker_Env.solver =
                           (uu___373_18526.FStar_TypeChecker_Env.solver);
                         FStar_TypeChecker_Env.range =
                           (uu___373_18526.FStar_TypeChecker_Env.range);
                         FStar_TypeChecker_Env.curmodule =
                           (uu___373_18526.FStar_TypeChecker_Env.curmodule);
                         FStar_TypeChecker_Env.gamma =
                           (uu___373_18526.FStar_TypeChecker_Env.gamma);
                         FStar_TypeChecker_Env.gamma_sig =
                           (uu___373_18526.FStar_TypeChecker_Env.gamma_sig);
                         FStar_TypeChecker_Env.gamma_cache =
                           (uu___373_18526.FStar_TypeChecker_Env.gamma_cache);
                         FStar_TypeChecker_Env.modules =
                           (uu___373_18526.FStar_TypeChecker_Env.modules);
                         FStar_TypeChecker_Env.expected_typ =
                           (uu___373_18526.FStar_TypeChecker_Env.expected_typ);
                         FStar_TypeChecker_Env.sigtab =
                           (uu___373_18526.FStar_TypeChecker_Env.sigtab);
                         FStar_TypeChecker_Env.is_pattern =
                           (uu___373_18526.FStar_TypeChecker_Env.is_pattern);
                         FStar_TypeChecker_Env.instantiate_imp =
                           (uu___373_18526.FStar_TypeChecker_Env.instantiate_imp);
                         FStar_TypeChecker_Env.effects =
                           (uu___373_18526.FStar_TypeChecker_Env.effects);
                         FStar_TypeChecker_Env.generalize =
                           (uu___373_18526.FStar_TypeChecker_Env.generalize);
                         FStar_TypeChecker_Env.letrecs =
                           (uu___373_18526.FStar_TypeChecker_Env.letrecs);
                         FStar_TypeChecker_Env.top_level =
                           (uu___373_18526.FStar_TypeChecker_Env.top_level);
                         FStar_TypeChecker_Env.check_uvars =
                           (uu___373_18526.FStar_TypeChecker_Env.check_uvars);
                         FStar_TypeChecker_Env.use_eq =
                           (uu___373_18526.FStar_TypeChecker_Env.use_eq);
                         FStar_TypeChecker_Env.is_iface =
                           (uu___373_18526.FStar_TypeChecker_Env.is_iface);
                         FStar_TypeChecker_Env.admit =
                           (uu___373_18526.FStar_TypeChecker_Env.admit);
                         FStar_TypeChecker_Env.lax = true;
                         FStar_TypeChecker_Env.lax_universes =
                           (uu___373_18526.FStar_TypeChecker_Env.lax_universes);
                         FStar_TypeChecker_Env.phase1 =
                           (uu___373_18526.FStar_TypeChecker_Env.phase1);
                         FStar_TypeChecker_Env.failhard =
                           (uu___373_18526.FStar_TypeChecker_Env.failhard);
                         FStar_TypeChecker_Env.nosynth =
                           (uu___373_18526.FStar_TypeChecker_Env.nosynth);
                         FStar_TypeChecker_Env.uvar_subtyping =
                           (uu___373_18526.FStar_TypeChecker_Env.uvar_subtyping);
                         FStar_TypeChecker_Env.tc_term =
                           (uu___373_18526.FStar_TypeChecker_Env.tc_term);
                         FStar_TypeChecker_Env.type_of =
                           (uu___373_18526.FStar_TypeChecker_Env.type_of);
                         FStar_TypeChecker_Env.universe_of =
                           (uu___373_18526.FStar_TypeChecker_Env.universe_of);
                         FStar_TypeChecker_Env.check_type_of =
                           (uu___373_18526.FStar_TypeChecker_Env.check_type_of);
                         FStar_TypeChecker_Env.use_bv_sorts =
                           (uu___373_18526.FStar_TypeChecker_Env.use_bv_sorts);
                         FStar_TypeChecker_Env.qtbl_name_and_index =
                           (uu___373_18526.FStar_TypeChecker_Env.qtbl_name_and_index);
                         FStar_TypeChecker_Env.normalized_eff_names =
                           (uu___373_18526.FStar_TypeChecker_Env.normalized_eff_names);
                         FStar_TypeChecker_Env.proof_ns =
                           (uu___373_18526.FStar_TypeChecker_Env.proof_ns);
                         FStar_TypeChecker_Env.synth_hook =
                           (uu___373_18526.FStar_TypeChecker_Env.synth_hook);
                         FStar_TypeChecker_Env.splice =
                           (uu___373_18526.FStar_TypeChecker_Env.splice);
                         FStar_TypeChecker_Env.is_native_tactic =
                           (uu___373_18526.FStar_TypeChecker_Env.is_native_tactic);
                         FStar_TypeChecker_Env.identifier_info =
                           (uu___373_18526.FStar_TypeChecker_Env.identifier_info);
                         FStar_TypeChecker_Env.tc_hooks =
                           (uu___373_18526.FStar_TypeChecker_Env.tc_hooks);
                         FStar_TypeChecker_Env.dsenv =
                           (uu___373_18526.FStar_TypeChecker_Env.dsenv);
                         FStar_TypeChecker_Env.dep_graph =
                           (uu___373_18526.FStar_TypeChecker_Env.dep_graph)
                       }  in
                     let g = FStar_TypeChecker_Rel.teq env1 t1 t_u  in
                     ((match g.FStar_TypeChecker_Env.guard_f with
                       | FStar_TypeChecker_Common.NonTrivial f ->
                           let uu____18530 =
                             FStar_Syntax_Print.term_to_string t1  in
                           level_of_type_fail env1 e uu____18530
                       | uu____18531 ->
                           FStar_TypeChecker_Rel.force_trivial_guard env1 g);
                      u))
           in
        aux true t
  
let rec (universe_of_aux :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun env  ->
    fun e  ->
      let uu____18548 =
        let uu____18549 = FStar_Syntax_Subst.compress e  in
        uu____18549.FStar_Syntax_Syntax.n  in
      match uu____18548 with
      | FStar_Syntax_Syntax.Tm_bvar uu____18554 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_unknown  -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_delayed uu____18559 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_let uu____18584 ->
          let e1 = FStar_TypeChecker_Normalize.normalize [] env e  in
          universe_of_aux env e1
      | FStar_Syntax_Syntax.Tm_abs (bs,t,uu____18600) ->
          level_of_type_fail env e "arrow type"
      | FStar_Syntax_Syntax.Tm_uvar (u,s) ->
          FStar_Syntax_Subst.subst' s u.FStar_Syntax_Syntax.ctx_uvar_typ
      | FStar_Syntax_Syntax.Tm_meta (t,uu____18642) -> universe_of_aux env t
      | FStar_Syntax_Syntax.Tm_name n1 -> n1.FStar_Syntax_Syntax.sort
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let uu____18649 =
            FStar_TypeChecker_Env.lookup_lid env
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          (match uu____18649 with | ((uu____18660,t),uu____18662) -> t)
      | FStar_Syntax_Syntax.Tm_lazy i ->
          let uu____18668 = FStar_Syntax_Util.unfold_lazy i  in
          universe_of_aux env uu____18668
      | FStar_Syntax_Syntax.Tm_ascribed
          (uu____18671,(FStar_Util.Inl t,uu____18673),uu____18674) -> t
      | FStar_Syntax_Syntax.Tm_ascribed
          (uu____18721,(FStar_Util.Inr c,uu____18723),uu____18724) ->
          FStar_Syntax_Util.comp_result c
      | FStar_Syntax_Syntax.Tm_type u ->
          FStar_Syntax_Syntax.mk
            (FStar_Syntax_Syntax.Tm_type (FStar_Syntax_Syntax.U_succ u))
            FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos
      | FStar_Syntax_Syntax.Tm_quoted uu____18772 -> FStar_Syntax_Util.ktype0
      | FStar_Syntax_Syntax.Tm_constant sc ->
          tc_constant env e.FStar_Syntax_Syntax.pos sc
      | FStar_Syntax_Syntax.Tm_uinst
          ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
             FStar_Syntax_Syntax.pos = uu____18781;
             FStar_Syntax_Syntax.vars = uu____18782;_},us)
          ->
          let uu____18788 =
            FStar_TypeChecker_Env.lookup_lid env
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          (match uu____18788 with
           | ((us',t),uu____18801) ->
               (if (FStar_List.length us) <> (FStar_List.length us')
                then
                  (let uu____18807 = FStar_TypeChecker_Env.get_range env  in
                   FStar_Errors.raise_error
                     (FStar_Errors.Fatal_UnexpectedNumberOfUniverse,
                       "Unexpected number of universe instantiations")
                     uu____18807)
                else
                  FStar_List.iter2
                    (fun u'  ->
                       fun u  ->
                         match u' with
                         | FStar_Syntax_Syntax.U_unif u'' ->
                             FStar_Syntax_Unionfind.univ_change u'' u
                         | uu____18823 -> failwith "Impossible") us' us;
                t))
      | FStar_Syntax_Syntax.Tm_uinst uu____18824 ->
          failwith "Impossible: Tm_uinst's head must be an fvar"
      | FStar_Syntax_Syntax.Tm_refine (x,uu____18834) ->
          universe_of_aux env x.FStar_Syntax_Syntax.sort
      | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
          let uu____18857 = FStar_Syntax_Subst.open_comp bs c  in
          (match uu____18857 with
           | (bs1,c1) ->
               let us =
                 FStar_List.map
                   (fun uu____18877  ->
                      match uu____18877 with
                      | (b,uu____18883) ->
                          let uu____18884 =
                            universe_of_aux env b.FStar_Syntax_Syntax.sort
                             in
                          level_of_type env b.FStar_Syntax_Syntax.sort
                            uu____18884) bs1
                  in
               let u_res =
                 let res = FStar_Syntax_Util.comp_result c1  in
                 let uu____18891 = universe_of_aux env res  in
                 level_of_type env res uu____18891  in
               let u_c =
                 let uu____18895 =
                   FStar_TypeChecker_Env.effect_repr env c1 u_res  in
                 match uu____18895 with
                 | FStar_Pervasives_Native.None  -> u_res
                 | FStar_Pervasives_Native.Some trepr ->
                     let uu____18899 = universe_of_aux env trepr  in
                     level_of_type env trepr uu____18899
                  in
               let u =
                 FStar_TypeChecker_Normalize.normalize_universe env
                   (FStar_Syntax_Syntax.U_max (u_c :: us))
                  in
               FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type u)
                 FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos)
      | FStar_Syntax_Syntax.Tm_app (hd1,args) ->
          let rec type_of_head retry hd2 args1 =
            let hd3 = FStar_Syntax_Subst.compress hd2  in
            match hd3.FStar_Syntax_Syntax.n with
            | FStar_Syntax_Syntax.Tm_unknown  -> failwith "Impossible"
            | FStar_Syntax_Syntax.Tm_bvar uu____19000 ->
                failwith "Impossible"
            | FStar_Syntax_Syntax.Tm_delayed uu____19015 ->
                failwith "Impossible"
            | FStar_Syntax_Syntax.Tm_fvar uu____19052 ->
                let uu____19053 = universe_of_aux env hd3  in
                (uu____19053, args1)
            | FStar_Syntax_Syntax.Tm_name uu____19066 ->
                let uu____19067 = universe_of_aux env hd3  in
                (uu____19067, args1)
            | FStar_Syntax_Syntax.Tm_uvar uu____19080 ->
                let uu____19093 = universe_of_aux env hd3  in
                (uu____19093, args1)
            | FStar_Syntax_Syntax.Tm_uinst uu____19106 ->
                let uu____19113 = universe_of_aux env hd3  in
                (uu____19113, args1)
            | FStar_Syntax_Syntax.Tm_ascribed uu____19126 ->
                let uu____19153 = universe_of_aux env hd3  in
                (uu____19153, args1)
            | FStar_Syntax_Syntax.Tm_refine uu____19166 ->
                let uu____19173 = universe_of_aux env hd3  in
                (uu____19173, args1)
            | FStar_Syntax_Syntax.Tm_constant uu____19186 ->
                let uu____19187 = universe_of_aux env hd3  in
                (uu____19187, args1)
            | FStar_Syntax_Syntax.Tm_arrow uu____19200 ->
                let uu____19213 = universe_of_aux env hd3  in
                (uu____19213, args1)
            | FStar_Syntax_Syntax.Tm_meta uu____19226 ->
                let uu____19233 = universe_of_aux env hd3  in
                (uu____19233, args1)
            | FStar_Syntax_Syntax.Tm_type uu____19246 ->
                let uu____19247 = universe_of_aux env hd3  in
                (uu____19247, args1)
            | FStar_Syntax_Syntax.Tm_match (uu____19260,hd4::uu____19262) ->
                let uu____19327 = FStar_Syntax_Subst.open_branch hd4  in
                (match uu____19327 with
                 | (uu____19342,uu____19343,hd5) ->
                     let uu____19361 = FStar_Syntax_Util.head_and_args hd5
                        in
                     (match uu____19361 with
                      | (hd6,args2) -> type_of_head retry hd6 args2))
            | uu____19412 when retry ->
                let e1 =
                  FStar_TypeChecker_Normalize.normalize
                    [FStar_TypeChecker_Normalize.Beta;
                    FStar_TypeChecker_Normalize.DoNotUnfoldPureLets] env e
                   in
                let uu____19414 = FStar_Syntax_Util.head_and_args e1  in
                (match uu____19414 with
                 | (hd4,args2) -> type_of_head false hd4 args2)
            | uu____19465 ->
                let uu____19466 =
                  FStar_TypeChecker_Env.clear_expected_typ env  in
                (match uu____19466 with
                 | (env1,uu____19488) ->
                     let env2 =
                       let uu___374_19494 = env1  in
                       {
                         FStar_TypeChecker_Env.solver =
                           (uu___374_19494.FStar_TypeChecker_Env.solver);
                         FStar_TypeChecker_Env.range =
                           (uu___374_19494.FStar_TypeChecker_Env.range);
                         FStar_TypeChecker_Env.curmodule =
                           (uu___374_19494.FStar_TypeChecker_Env.curmodule);
                         FStar_TypeChecker_Env.gamma =
                           (uu___374_19494.FStar_TypeChecker_Env.gamma);
                         FStar_TypeChecker_Env.gamma_sig =
                           (uu___374_19494.FStar_TypeChecker_Env.gamma_sig);
                         FStar_TypeChecker_Env.gamma_cache =
                           (uu___374_19494.FStar_TypeChecker_Env.gamma_cache);
                         FStar_TypeChecker_Env.modules =
                           (uu___374_19494.FStar_TypeChecker_Env.modules);
                         FStar_TypeChecker_Env.expected_typ =
                           (uu___374_19494.FStar_TypeChecker_Env.expected_typ);
                         FStar_TypeChecker_Env.sigtab =
                           (uu___374_19494.FStar_TypeChecker_Env.sigtab);
                         FStar_TypeChecker_Env.is_pattern =
                           (uu___374_19494.FStar_TypeChecker_Env.is_pattern);
                         FStar_TypeChecker_Env.instantiate_imp =
                           (uu___374_19494.FStar_TypeChecker_Env.instantiate_imp);
                         FStar_TypeChecker_Env.effects =
                           (uu___374_19494.FStar_TypeChecker_Env.effects);
                         FStar_TypeChecker_Env.generalize =
                           (uu___374_19494.FStar_TypeChecker_Env.generalize);
                         FStar_TypeChecker_Env.letrecs =
                           (uu___374_19494.FStar_TypeChecker_Env.letrecs);
                         FStar_TypeChecker_Env.top_level = false;
                         FStar_TypeChecker_Env.check_uvars =
                           (uu___374_19494.FStar_TypeChecker_Env.check_uvars);
                         FStar_TypeChecker_Env.use_eq =
                           (uu___374_19494.FStar_TypeChecker_Env.use_eq);
                         FStar_TypeChecker_Env.is_iface =
                           (uu___374_19494.FStar_TypeChecker_Env.is_iface);
                         FStar_TypeChecker_Env.admit =
                           (uu___374_19494.FStar_TypeChecker_Env.admit);
                         FStar_TypeChecker_Env.lax = true;
                         FStar_TypeChecker_Env.lax_universes =
                           (uu___374_19494.FStar_TypeChecker_Env.lax_universes);
                         FStar_TypeChecker_Env.phase1 =
                           (uu___374_19494.FStar_TypeChecker_Env.phase1);
                         FStar_TypeChecker_Env.failhard =
                           (uu___374_19494.FStar_TypeChecker_Env.failhard);
                         FStar_TypeChecker_Env.nosynth =
                           (uu___374_19494.FStar_TypeChecker_Env.nosynth);
                         FStar_TypeChecker_Env.uvar_subtyping =
                           (uu___374_19494.FStar_TypeChecker_Env.uvar_subtyping);
                         FStar_TypeChecker_Env.tc_term =
                           (uu___374_19494.FStar_TypeChecker_Env.tc_term);
                         FStar_TypeChecker_Env.type_of =
                           (uu___374_19494.FStar_TypeChecker_Env.type_of);
                         FStar_TypeChecker_Env.universe_of =
                           (uu___374_19494.FStar_TypeChecker_Env.universe_of);
                         FStar_TypeChecker_Env.check_type_of =
                           (uu___374_19494.FStar_TypeChecker_Env.check_type_of);
                         FStar_TypeChecker_Env.use_bv_sorts = true;
                         FStar_TypeChecker_Env.qtbl_name_and_index =
                           (uu___374_19494.FStar_TypeChecker_Env.qtbl_name_and_index);
                         FStar_TypeChecker_Env.normalized_eff_names =
                           (uu___374_19494.FStar_TypeChecker_Env.normalized_eff_names);
                         FStar_TypeChecker_Env.proof_ns =
                           (uu___374_19494.FStar_TypeChecker_Env.proof_ns);
                         FStar_TypeChecker_Env.synth_hook =
                           (uu___374_19494.FStar_TypeChecker_Env.synth_hook);
                         FStar_TypeChecker_Env.splice =
                           (uu___374_19494.FStar_TypeChecker_Env.splice);
                         FStar_TypeChecker_Env.is_native_tactic =
                           (uu___374_19494.FStar_TypeChecker_Env.is_native_tactic);
                         FStar_TypeChecker_Env.identifier_info =
                           (uu___374_19494.FStar_TypeChecker_Env.identifier_info);
                         FStar_TypeChecker_Env.tc_hooks =
                           (uu___374_19494.FStar_TypeChecker_Env.tc_hooks);
                         FStar_TypeChecker_Env.dsenv =
                           (uu___374_19494.FStar_TypeChecker_Env.dsenv);
                         FStar_TypeChecker_Env.dep_graph =
                           (uu___374_19494.FStar_TypeChecker_Env.dep_graph)
                       }  in
                     ((let uu____19496 =
                         FStar_All.pipe_left
                           (FStar_TypeChecker_Env.debug env2)
                           (FStar_Options.Other "UniverseOf")
                          in
                       if uu____19496
                       then
                         let uu____19497 =
                           let uu____19498 =
                             FStar_TypeChecker_Env.get_range env2  in
                           FStar_Range.string_of_range uu____19498  in
                         let uu____19499 =
                           FStar_Syntax_Print.term_to_string hd3  in
                         FStar_Util.print2 "%s: About to type-check %s\n"
                           uu____19497 uu____19499
                       else ());
                      (let uu____19501 = tc_term env2 hd3  in
                       match uu____19501 with
                       | (uu____19522,{
                                        FStar_Syntax_Syntax.eff_name =
                                          uu____19523;
                                        FStar_Syntax_Syntax.res_typ = t;
                                        FStar_Syntax_Syntax.cflags =
                                          uu____19525;
                                        FStar_Syntax_Syntax.comp_thunk =
                                          uu____19526;_},g)
                           ->
                           ((let uu____19540 =
                               FStar_TypeChecker_Rel.solve_deferred_constraints
                                 env2 g
                                in
                             FStar_All.pipe_right uu____19540
                               (fun a237  -> ()));
                            (t, args1)))))
             in
          let uu____19551 = type_of_head true hd1 args  in
          (match uu____19551 with
           | (t,args1) ->
               let t1 =
                 FStar_TypeChecker_Normalize.normalize
                   [FStar_TypeChecker_Normalize.UnfoldUntil
                      FStar_Syntax_Syntax.delta_constant] env t
                  in
               let uu____19591 = FStar_Syntax_Util.arrow_formals_comp t1  in
               (match uu____19591 with
                | (bs,res) ->
                    let res1 = FStar_Syntax_Util.comp_result res  in
                    if (FStar_List.length bs) = (FStar_List.length args1)
                    then
                      let subst1 = FStar_Syntax_Util.subst_of_list bs args1
                         in
                      FStar_Syntax_Subst.subst subst1 res1
                    else
                      (let uu____19635 =
                         FStar_Syntax_Print.term_to_string res1  in
                       level_of_type_fail env e uu____19635)))
      | FStar_Syntax_Syntax.Tm_match (uu____19638,hd1::uu____19640) ->
          let uu____19705 = FStar_Syntax_Subst.open_branch hd1  in
          (match uu____19705 with
           | (uu____19708,uu____19709,hd2) -> universe_of_aux env hd2)
      | FStar_Syntax_Syntax.Tm_match (uu____19727,[]) ->
          level_of_type_fail env e "empty match cases"
  
let (universe_of :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.universe)
  =
  fun env  ->
    fun e  ->
      let uu____19774 = universe_of_aux env e  in
      level_of_type env e uu____19774
  
let (tc_tparams :
  FStar_TypeChecker_Env.env_t ->
    FStar_Syntax_Syntax.binders ->
      (FStar_Syntax_Syntax.binders,FStar_TypeChecker_Env.env,FStar_Syntax_Syntax.universes)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun tps  ->
      let uu____19799 = tc_binders env tps  in
      match uu____19799 with
      | (tps1,env1,g,us) ->
          (FStar_TypeChecker_Rel.force_trivial_guard env1 g; (tps1, env1, us))
  
let rec (type_of_well_typed_term :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun t  ->
      let mk_tm_type u =
        FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type u)
          FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos
         in
      let uu____19853 =
        let uu____19854 = FStar_Syntax_Subst.compress t  in
        uu____19854.FStar_Syntax_Syntax.n  in
      match uu____19853 with
      | FStar_Syntax_Syntax.Tm_delayed uu____19859 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_bvar uu____19884 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_name x ->
          FStar_Pervasives_Native.Some (x.FStar_Syntax_Syntax.sort)
      | FStar_Syntax_Syntax.Tm_lazy i ->
          let uu____19889 = FStar_Syntax_Util.unfold_lazy i  in
          type_of_well_typed_term env uu____19889
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let uu____19891 =
            FStar_TypeChecker_Env.try_lookup_and_inst_lid env []
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          FStar_Util.bind_opt uu____19891
            (fun uu____19905  ->
               match uu____19905 with
               | (t1,uu____19913) -> FStar_Pervasives_Native.Some t1)
      | FStar_Syntax_Syntax.Tm_uinst
          ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
             FStar_Syntax_Syntax.pos = uu____19915;
             FStar_Syntax_Syntax.vars = uu____19916;_},us)
          ->
          let uu____19922 =
            FStar_TypeChecker_Env.try_lookup_and_inst_lid env us
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          FStar_Util.bind_opt uu____19922
            (fun uu____19936  ->
               match uu____19936 with
               | (t1,uu____19944) -> FStar_Pervasives_Native.Some t1)
      | FStar_Syntax_Syntax.Tm_constant sc ->
          let uu____19946 = tc_constant env t.FStar_Syntax_Syntax.pos sc  in
          FStar_Pervasives_Native.Some uu____19946
      | FStar_Syntax_Syntax.Tm_type u ->
          let uu____19948 = mk_tm_type (FStar_Syntax_Syntax.U_succ u)  in
          FStar_Pervasives_Native.Some uu____19948
      | FStar_Syntax_Syntax.Tm_abs
          (bs,body,FStar_Pervasives_Native.Some
           { FStar_Syntax_Syntax.residual_effect = eff;
             FStar_Syntax_Syntax.residual_typ = FStar_Pervasives_Native.Some
               tbody;
             FStar_Syntax_Syntax.residual_flags = uu____19953;_})
          ->
          let mk_comp =
            let uu____19993 =
              FStar_Ident.lid_equals eff FStar_Parser_Const.effect_Tot_lid
               in
            if uu____19993
            then FStar_Pervasives_Native.Some FStar_Syntax_Syntax.mk_Total'
            else
              (let uu____20021 =
                 FStar_Ident.lid_equals eff
                   FStar_Parser_Const.effect_GTot_lid
                  in
               if uu____20021
               then
                 FStar_Pervasives_Native.Some FStar_Syntax_Syntax.mk_GTotal'
               else FStar_Pervasives_Native.None)
             in
          FStar_Util.bind_opt mk_comp
            (fun f  ->
               let uu____20088 = universe_of_well_typed_term env tbody  in
               FStar_Util.bind_opt uu____20088
                 (fun u  ->
                    let uu____20096 =
                      let uu____20099 =
                        let uu____20106 =
                          let uu____20107 =
                            let uu____20120 =
                              f tbody (FStar_Pervasives_Native.Some u)  in
                            (bs, uu____20120)  in
                          FStar_Syntax_Syntax.Tm_arrow uu____20107  in
                        FStar_Syntax_Syntax.mk uu____20106  in
                      uu____20099 FStar_Pervasives_Native.None
                        t.FStar_Syntax_Syntax.pos
                       in
                    FStar_Pervasives_Native.Some uu____20096))
      | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
          let uu____20154 = FStar_Syntax_Subst.open_comp bs c  in
          (match uu____20154 with
           | (bs1,c1) ->
               let rec aux env1 us bs2 =
                 match bs2 with
                 | [] ->
                     let uu____20207 =
                       universe_of_well_typed_term env1
                         (FStar_Syntax_Util.comp_result c1)
                        in
                     FStar_Util.bind_opt uu____20207
                       (fun uc  ->
                          let uu____20215 =
                            mk_tm_type (FStar_Syntax_Syntax.U_max (uc :: us))
                             in
                          FStar_Pervasives_Native.Some uu____20215)
                 | (x,imp)::bs3 ->
                     let uu____20233 =
                       universe_of_well_typed_term env1
                         x.FStar_Syntax_Syntax.sort
                        in
                     FStar_Util.bind_opt uu____20233
                       (fun u_x  ->
                          let env2 = FStar_TypeChecker_Env.push_bv env1 x  in
                          aux env2 (u_x :: us) bs3)
                  in
               aux env [] bs1)
      | FStar_Syntax_Syntax.Tm_abs uu____20242 ->
          FStar_Pervasives_Native.None
      | FStar_Syntax_Syntax.Tm_refine (x,uu____20260) ->
          let uu____20265 =
            universe_of_well_typed_term env x.FStar_Syntax_Syntax.sort  in
          FStar_Util.bind_opt uu____20265
            (fun u_x  ->
               let uu____20273 = mk_tm_type u_x  in
               FStar_Pervasives_Native.Some uu____20273)
      | FStar_Syntax_Syntax.Tm_app (hd1,args) ->
          let t_hd = type_of_well_typed_term env hd1  in
          let rec aux t_hd1 =
            let uu____20315 =
              let uu____20316 =
                FStar_TypeChecker_Normalize.unfold_whnf env t_hd1  in
              uu____20316.FStar_Syntax_Syntax.n  in
            match uu____20315 with
            | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
                let n_args = FStar_List.length args  in
                let n_bs = FStar_List.length bs  in
                let bs_t_opt =
                  if n_args < n_bs
                  then
                    let uu____20386 = FStar_Util.first_N n_args bs  in
                    match uu____20386 with
                    | (bs1,rest) ->
                        let t1 =
                          FStar_Syntax_Syntax.mk
                            (FStar_Syntax_Syntax.Tm_arrow (rest, c))
                            FStar_Pervasives_Native.None
                            t_hd1.FStar_Syntax_Syntax.pos
                           in
                        let uu____20460 =
                          let uu____20465 = FStar_Syntax_Syntax.mk_Total t1
                             in
                          FStar_Syntax_Subst.open_comp bs1 uu____20465  in
                        (match uu____20460 with
                         | (bs2,c1) ->
                             FStar_Pervasives_Native.Some
                               (bs2, (FStar_Syntax_Util.comp_result c1)))
                  else
                    if n_args = n_bs
                    then
                      (let uu____20517 = FStar_Syntax_Subst.open_comp bs c
                          in
                       match uu____20517 with
                       | (bs1,c1) ->
                           let uu____20536 =
                             FStar_Syntax_Util.is_tot_or_gtot_comp c1  in
                           if uu____20536
                           then
                             FStar_Pervasives_Native.Some
                               (bs1, (FStar_Syntax_Util.comp_result c1))
                           else FStar_Pervasives_Native.None)
                    else FStar_Pervasives_Native.None
                   in
                FStar_Util.bind_opt bs_t_opt
                  (fun uu____20602  ->
                     match uu____20602 with
                     | (bs1,t1) ->
                         let subst1 =
                           FStar_List.map2
                             (fun b  ->
                                fun a  ->
                                  FStar_Syntax_Syntax.NT
                                    ((FStar_Pervasives_Native.fst b),
                                      (FStar_Pervasives_Native.fst a))) bs1
                             args
                            in
                         let uu____20660 = FStar_Syntax_Subst.subst subst1 t1
                            in
                         FStar_Pervasives_Native.Some uu____20660)
            | FStar_Syntax_Syntax.Tm_refine (x,uu____20662) ->
                aux x.FStar_Syntax_Syntax.sort
            | FStar_Syntax_Syntax.Tm_ascribed (t1,uu____20668,uu____20669) ->
                aux t1
            | uu____20710 -> FStar_Pervasives_Native.None  in
          FStar_Util.bind_opt t_hd aux
      | FStar_Syntax_Syntax.Tm_ascribed
          (uu____20711,(FStar_Util.Inl t1,uu____20713),uu____20714) ->
          FStar_Pervasives_Native.Some t1
      | FStar_Syntax_Syntax.Tm_ascribed
          (uu____20761,(FStar_Util.Inr c,uu____20763),uu____20764) ->
          FStar_Pervasives_Native.Some (FStar_Syntax_Util.comp_result c)
      | FStar_Syntax_Syntax.Tm_uvar (u,s) ->
          let uu____20829 =
            FStar_Syntax_Subst.subst' s u.FStar_Syntax_Syntax.ctx_uvar_typ
             in
          FStar_Pervasives_Native.Some uu____20829
      | FStar_Syntax_Syntax.Tm_quoted (tm,qi) ->
          FStar_Pervasives_Native.Some FStar_Syntax_Syntax.t_term
      | FStar_Syntax_Syntax.Tm_meta (t1,uu____20837) ->
          type_of_well_typed_term env t1
      | FStar_Syntax_Syntax.Tm_match uu____20842 ->
          FStar_Pervasives_Native.None
      | FStar_Syntax_Syntax.Tm_let uu____20865 ->
          FStar_Pervasives_Native.None
      | FStar_Syntax_Syntax.Tm_unknown  -> FStar_Pervasives_Native.None
      | FStar_Syntax_Syntax.Tm_uinst uu____20878 ->
          FStar_Pervasives_Native.None

and (universe_of_well_typed_term :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun t  ->
      let uu____20889 = type_of_well_typed_term env t  in
      match uu____20889 with
      | FStar_Pervasives_Native.Some
          { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_type u;
            FStar_Syntax_Syntax.pos = uu____20895;
            FStar_Syntax_Syntax.vars = uu____20896;_}
          -> FStar_Pervasives_Native.Some u
      | uu____20899 -> FStar_Pervasives_Native.None

let (check_type_of_well_typed_term :
  Prims.bool ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.typ -> FStar_TypeChecker_Env.guard_t)
  =
  fun must_total  ->
    fun env  ->
      fun t  ->
        fun k  ->
          let env1 = FStar_TypeChecker_Env.set_expected_typ env k  in
          let env2 =
            let uu___375_20924 = env1  in
            {
              FStar_TypeChecker_Env.solver =
                (uu___375_20924.FStar_TypeChecker_Env.solver);
              FStar_TypeChecker_Env.range =
                (uu___375_20924.FStar_TypeChecker_Env.range);
              FStar_TypeChecker_Env.curmodule =
                (uu___375_20924.FStar_TypeChecker_Env.curmodule);
              FStar_TypeChecker_Env.gamma =
                (uu___375_20924.FStar_TypeChecker_Env.gamma);
              FStar_TypeChecker_Env.gamma_sig =
                (uu___375_20924.FStar_TypeChecker_Env.gamma_sig);
              FStar_TypeChecker_Env.gamma_cache =
                (uu___375_20924.FStar_TypeChecker_Env.gamma_cache);
              FStar_TypeChecker_Env.modules =
                (uu___375_20924.FStar_TypeChecker_Env.modules);
              FStar_TypeChecker_Env.expected_typ =
                (uu___375_20924.FStar_TypeChecker_Env.expected_typ);
              FStar_TypeChecker_Env.sigtab =
                (uu___375_20924.FStar_TypeChecker_Env.sigtab);
              FStar_TypeChecker_Env.is_pattern =
                (uu___375_20924.FStar_TypeChecker_Env.is_pattern);
              FStar_TypeChecker_Env.instantiate_imp =
                (uu___375_20924.FStar_TypeChecker_Env.instantiate_imp);
              FStar_TypeChecker_Env.effects =
                (uu___375_20924.FStar_TypeChecker_Env.effects);
              FStar_TypeChecker_Env.generalize =
                (uu___375_20924.FStar_TypeChecker_Env.generalize);
              FStar_TypeChecker_Env.letrecs =
                (uu___375_20924.FStar_TypeChecker_Env.letrecs);
              FStar_TypeChecker_Env.top_level =
                (uu___375_20924.FStar_TypeChecker_Env.top_level);
              FStar_TypeChecker_Env.check_uvars =
                (uu___375_20924.FStar_TypeChecker_Env.check_uvars);
              FStar_TypeChecker_Env.use_eq =
                (uu___375_20924.FStar_TypeChecker_Env.use_eq);
              FStar_TypeChecker_Env.is_iface =
                (uu___375_20924.FStar_TypeChecker_Env.is_iface);
              FStar_TypeChecker_Env.admit =
                (uu___375_20924.FStar_TypeChecker_Env.admit);
              FStar_TypeChecker_Env.lax =
                (uu___375_20924.FStar_TypeChecker_Env.lax);
              FStar_TypeChecker_Env.lax_universes =
                (uu___375_20924.FStar_TypeChecker_Env.lax_universes);
              FStar_TypeChecker_Env.phase1 =
                (uu___375_20924.FStar_TypeChecker_Env.phase1);
              FStar_TypeChecker_Env.failhard =
                (uu___375_20924.FStar_TypeChecker_Env.failhard);
              FStar_TypeChecker_Env.nosynth =
                (uu___375_20924.FStar_TypeChecker_Env.nosynth);
              FStar_TypeChecker_Env.uvar_subtyping =
                (uu___375_20924.FStar_TypeChecker_Env.uvar_subtyping);
              FStar_TypeChecker_Env.tc_term =
                (uu___375_20924.FStar_TypeChecker_Env.tc_term);
              FStar_TypeChecker_Env.type_of =
                (uu___375_20924.FStar_TypeChecker_Env.type_of);
              FStar_TypeChecker_Env.universe_of =
                (uu___375_20924.FStar_TypeChecker_Env.universe_of);
              FStar_TypeChecker_Env.check_type_of =
                (uu___375_20924.FStar_TypeChecker_Env.check_type_of);
              FStar_TypeChecker_Env.use_bv_sorts = true;
              FStar_TypeChecker_Env.qtbl_name_and_index =
                (uu___375_20924.FStar_TypeChecker_Env.qtbl_name_and_index);
              FStar_TypeChecker_Env.normalized_eff_names =
                (uu___375_20924.FStar_TypeChecker_Env.normalized_eff_names);
              FStar_TypeChecker_Env.proof_ns =
                (uu___375_20924.FStar_TypeChecker_Env.proof_ns);
              FStar_TypeChecker_Env.synth_hook =
                (uu___375_20924.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.splice =
                (uu___375_20924.FStar_TypeChecker_Env.splice);
              FStar_TypeChecker_Env.is_native_tactic =
                (uu___375_20924.FStar_TypeChecker_Env.is_native_tactic);
              FStar_TypeChecker_Env.identifier_info =
                (uu___375_20924.FStar_TypeChecker_Env.identifier_info);
              FStar_TypeChecker_Env.tc_hooks =
                (uu___375_20924.FStar_TypeChecker_Env.tc_hooks);
              FStar_TypeChecker_Env.dsenv =
                (uu___375_20924.FStar_TypeChecker_Env.dsenv);
              FStar_TypeChecker_Env.dep_graph =
                (uu___375_20924.FStar_TypeChecker_Env.dep_graph)
            }  in
          let slow_check uu____20930 =
            if must_total
            then
              let uu____20931 = env2.FStar_TypeChecker_Env.type_of env2 t  in
              match uu____20931 with | (uu____20938,uu____20939,g) -> g
            else
              (let uu____20942 = env2.FStar_TypeChecker_Env.tc_term env2 t
                  in
               match uu____20942 with | (uu____20949,uu____20950,g) -> g)
             in
          let uu____20952 =
            let uu____20953 = FStar_Options.__temp_fast_implicits ()  in
            FStar_All.pipe_left Prims.op_Negation uu____20953  in
          if uu____20952
          then slow_check ()
          else
            (let uu____20955 = type_of_well_typed_term env2 t  in
             match uu____20955 with
             | FStar_Pervasives_Native.None  -> slow_check ()
             | FStar_Pervasives_Native.Some k' ->
                 ((let uu____20960 =
                     FStar_All.pipe_left (FStar_TypeChecker_Env.debug env2)
                       (FStar_Options.Other "FastImplicits")
                      in
                   if uu____20960
                   then
                     let uu____20961 =
                       FStar_Range.string_of_range t.FStar_Syntax_Syntax.pos
                        in
                     let uu____20962 = FStar_Syntax_Print.term_to_string t
                        in
                     let uu____20963 = FStar_Syntax_Print.term_to_string k'
                        in
                     let uu____20964 = FStar_Syntax_Print.term_to_string k
                        in
                     FStar_Util.print4 "(%s) Fast check  %s : %s <:? %s\n"
                       uu____20961 uu____20962 uu____20963 uu____20964
                   else ());
                  (let b = FStar_TypeChecker_Rel.subtype_nosmt env2 k' k  in
                   (let uu____20968 =
                      FStar_All.pipe_left (FStar_TypeChecker_Env.debug env2)
                        (FStar_Options.Other "FastImplicits")
                       in
                    if uu____20968
                    then
                      let uu____20969 =
                        FStar_Range.string_of_range t.FStar_Syntax_Syntax.pos
                         in
                      let uu____20970 = FStar_Syntax_Print.term_to_string t
                         in
                      let uu____20971 = FStar_Syntax_Print.term_to_string k'
                         in
                      let uu____20972 = FStar_Syntax_Print.term_to_string k
                         in
                      FStar_Util.print5 "(%s) Fast check %s: %s : %s <: %s\n"
                        uu____20969 (if b then "succeeded" else "failed")
                        uu____20970 uu____20971 uu____20972
                    else ());
                   if b
                   then FStar_TypeChecker_Env.trivial_guard
                   else slow_check ())))
  