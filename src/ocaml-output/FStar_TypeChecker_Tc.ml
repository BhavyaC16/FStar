open Prims
let (set_hint_correlator :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sigelt -> FStar_TypeChecker_Env.env)
  =
  fun env  ->
    fun se  ->
      let tbl =
        FStar_All.pipe_right env.FStar_TypeChecker_Env.qtbl_name_and_index
          FStar_Pervasives_Native.fst
         in
      let get_n lid =
        let n_opt = FStar_Util.smap_try_find tbl lid.FStar_Ident.str  in
        if FStar_Util.is_some n_opt
        then FStar_All.pipe_right n_opt FStar_Util.must
        else (Prims.parse_int "0")  in
      let uu____48 = FStar_Options.reuse_hint_for ()  in
      match uu____48 with
      | FStar_Pervasives_Native.Some l ->
          let lid =
            let uu____53 = FStar_TypeChecker_Env.current_module env  in
            FStar_Ident.lid_add_suffix uu____53 l  in
          let uu___372_54 = env  in
          let uu____55 =
            let uu____68 =
              let uu____75 = let uu____80 = get_n lid  in (lid, uu____80)  in
              FStar_Pervasives_Native.Some uu____75  in
            (tbl, uu____68)  in
          {
            FStar_TypeChecker_Env.solver =
              (uu___372_54.FStar_TypeChecker_Env.solver);
            FStar_TypeChecker_Env.range =
              (uu___372_54.FStar_TypeChecker_Env.range);
            FStar_TypeChecker_Env.curmodule =
              (uu___372_54.FStar_TypeChecker_Env.curmodule);
            FStar_TypeChecker_Env.gamma =
              (uu___372_54.FStar_TypeChecker_Env.gamma);
            FStar_TypeChecker_Env.gamma_sig =
              (uu___372_54.FStar_TypeChecker_Env.gamma_sig);
            FStar_TypeChecker_Env.gamma_cache =
              (uu___372_54.FStar_TypeChecker_Env.gamma_cache);
            FStar_TypeChecker_Env.modules =
              (uu___372_54.FStar_TypeChecker_Env.modules);
            FStar_TypeChecker_Env.expected_typ =
              (uu___372_54.FStar_TypeChecker_Env.expected_typ);
            FStar_TypeChecker_Env.sigtab =
              (uu___372_54.FStar_TypeChecker_Env.sigtab);
            FStar_TypeChecker_Env.attrtab =
              (uu___372_54.FStar_TypeChecker_Env.attrtab);
            FStar_TypeChecker_Env.is_pattern =
              (uu___372_54.FStar_TypeChecker_Env.is_pattern);
            FStar_TypeChecker_Env.instantiate_imp =
              (uu___372_54.FStar_TypeChecker_Env.instantiate_imp);
            FStar_TypeChecker_Env.effects =
              (uu___372_54.FStar_TypeChecker_Env.effects);
            FStar_TypeChecker_Env.generalize =
              (uu___372_54.FStar_TypeChecker_Env.generalize);
            FStar_TypeChecker_Env.letrecs =
              (uu___372_54.FStar_TypeChecker_Env.letrecs);
            FStar_TypeChecker_Env.top_level =
              (uu___372_54.FStar_TypeChecker_Env.top_level);
            FStar_TypeChecker_Env.check_uvars =
              (uu___372_54.FStar_TypeChecker_Env.check_uvars);
            FStar_TypeChecker_Env.use_eq =
              (uu___372_54.FStar_TypeChecker_Env.use_eq);
            FStar_TypeChecker_Env.is_iface =
              (uu___372_54.FStar_TypeChecker_Env.is_iface);
            FStar_TypeChecker_Env.admit =
              (uu___372_54.FStar_TypeChecker_Env.admit);
            FStar_TypeChecker_Env.lax =
              (uu___372_54.FStar_TypeChecker_Env.lax);
            FStar_TypeChecker_Env.lax_universes =
              (uu___372_54.FStar_TypeChecker_Env.lax_universes);
            FStar_TypeChecker_Env.phase1 =
              (uu___372_54.FStar_TypeChecker_Env.phase1);
            FStar_TypeChecker_Env.failhard =
              (uu___372_54.FStar_TypeChecker_Env.failhard);
            FStar_TypeChecker_Env.nosynth =
              (uu___372_54.FStar_TypeChecker_Env.nosynth);
            FStar_TypeChecker_Env.uvar_subtyping =
              (uu___372_54.FStar_TypeChecker_Env.uvar_subtyping);
            FStar_TypeChecker_Env.tc_term =
              (uu___372_54.FStar_TypeChecker_Env.tc_term);
            FStar_TypeChecker_Env.type_of =
              (uu___372_54.FStar_TypeChecker_Env.type_of);
            FStar_TypeChecker_Env.universe_of =
              (uu___372_54.FStar_TypeChecker_Env.universe_of);
            FStar_TypeChecker_Env.check_type_of =
              (uu___372_54.FStar_TypeChecker_Env.check_type_of);
            FStar_TypeChecker_Env.use_bv_sorts =
              (uu___372_54.FStar_TypeChecker_Env.use_bv_sorts);
            FStar_TypeChecker_Env.qtbl_name_and_index = uu____55;
            FStar_TypeChecker_Env.normalized_eff_names =
              (uu___372_54.FStar_TypeChecker_Env.normalized_eff_names);
            FStar_TypeChecker_Env.fv_delta_depths =
              (uu___372_54.FStar_TypeChecker_Env.fv_delta_depths);
            FStar_TypeChecker_Env.proof_ns =
              (uu___372_54.FStar_TypeChecker_Env.proof_ns);
            FStar_TypeChecker_Env.synth_hook =
              (uu___372_54.FStar_TypeChecker_Env.synth_hook);
            FStar_TypeChecker_Env.splice =
              (uu___372_54.FStar_TypeChecker_Env.splice);
            FStar_TypeChecker_Env.postprocess =
              (uu___372_54.FStar_TypeChecker_Env.postprocess);
            FStar_TypeChecker_Env.is_native_tactic =
              (uu___372_54.FStar_TypeChecker_Env.is_native_tactic);
            FStar_TypeChecker_Env.identifier_info =
              (uu___372_54.FStar_TypeChecker_Env.identifier_info);
            FStar_TypeChecker_Env.tc_hooks =
              (uu___372_54.FStar_TypeChecker_Env.tc_hooks);
            FStar_TypeChecker_Env.dsenv =
              (uu___372_54.FStar_TypeChecker_Env.dsenv);
            FStar_TypeChecker_Env.nbe =
              (uu___372_54.FStar_TypeChecker_Env.nbe)
          }
      | FStar_Pervasives_Native.None  ->
          let lids = FStar_Syntax_Util.lids_of_sigelt se  in
          let lid =
            match lids with
            | [] ->
                let uu____97 = FStar_TypeChecker_Env.current_module env  in
                let uu____98 =
                  let uu____99 = FStar_Syntax_Syntax.next_id ()  in
                  FStar_All.pipe_right uu____99 FStar_Util.string_of_int  in
                FStar_Ident.lid_add_suffix uu____97 uu____98
            | l::uu____101 -> l  in
          let uu___373_104 = env  in
          let uu____105 =
            let uu____118 =
              let uu____125 = let uu____130 = get_n lid  in (lid, uu____130)
                 in
              FStar_Pervasives_Native.Some uu____125  in
            (tbl, uu____118)  in
          {
            FStar_TypeChecker_Env.solver =
              (uu___373_104.FStar_TypeChecker_Env.solver);
            FStar_TypeChecker_Env.range =
              (uu___373_104.FStar_TypeChecker_Env.range);
            FStar_TypeChecker_Env.curmodule =
              (uu___373_104.FStar_TypeChecker_Env.curmodule);
            FStar_TypeChecker_Env.gamma =
              (uu___373_104.FStar_TypeChecker_Env.gamma);
            FStar_TypeChecker_Env.gamma_sig =
              (uu___373_104.FStar_TypeChecker_Env.gamma_sig);
            FStar_TypeChecker_Env.gamma_cache =
              (uu___373_104.FStar_TypeChecker_Env.gamma_cache);
            FStar_TypeChecker_Env.modules =
              (uu___373_104.FStar_TypeChecker_Env.modules);
            FStar_TypeChecker_Env.expected_typ =
              (uu___373_104.FStar_TypeChecker_Env.expected_typ);
            FStar_TypeChecker_Env.sigtab =
              (uu___373_104.FStar_TypeChecker_Env.sigtab);
            FStar_TypeChecker_Env.attrtab =
              (uu___373_104.FStar_TypeChecker_Env.attrtab);
            FStar_TypeChecker_Env.is_pattern =
              (uu___373_104.FStar_TypeChecker_Env.is_pattern);
            FStar_TypeChecker_Env.instantiate_imp =
              (uu___373_104.FStar_TypeChecker_Env.instantiate_imp);
            FStar_TypeChecker_Env.effects =
              (uu___373_104.FStar_TypeChecker_Env.effects);
            FStar_TypeChecker_Env.generalize =
              (uu___373_104.FStar_TypeChecker_Env.generalize);
            FStar_TypeChecker_Env.letrecs =
              (uu___373_104.FStar_TypeChecker_Env.letrecs);
            FStar_TypeChecker_Env.top_level =
              (uu___373_104.FStar_TypeChecker_Env.top_level);
            FStar_TypeChecker_Env.check_uvars =
              (uu___373_104.FStar_TypeChecker_Env.check_uvars);
            FStar_TypeChecker_Env.use_eq =
              (uu___373_104.FStar_TypeChecker_Env.use_eq);
            FStar_TypeChecker_Env.is_iface =
              (uu___373_104.FStar_TypeChecker_Env.is_iface);
            FStar_TypeChecker_Env.admit =
              (uu___373_104.FStar_TypeChecker_Env.admit);
            FStar_TypeChecker_Env.lax =
              (uu___373_104.FStar_TypeChecker_Env.lax);
            FStar_TypeChecker_Env.lax_universes =
              (uu___373_104.FStar_TypeChecker_Env.lax_universes);
            FStar_TypeChecker_Env.phase1 =
              (uu___373_104.FStar_TypeChecker_Env.phase1);
            FStar_TypeChecker_Env.failhard =
              (uu___373_104.FStar_TypeChecker_Env.failhard);
            FStar_TypeChecker_Env.nosynth =
              (uu___373_104.FStar_TypeChecker_Env.nosynth);
            FStar_TypeChecker_Env.uvar_subtyping =
              (uu___373_104.FStar_TypeChecker_Env.uvar_subtyping);
            FStar_TypeChecker_Env.tc_term =
              (uu___373_104.FStar_TypeChecker_Env.tc_term);
            FStar_TypeChecker_Env.type_of =
              (uu___373_104.FStar_TypeChecker_Env.type_of);
            FStar_TypeChecker_Env.universe_of =
              (uu___373_104.FStar_TypeChecker_Env.universe_of);
            FStar_TypeChecker_Env.check_type_of =
              (uu___373_104.FStar_TypeChecker_Env.check_type_of);
            FStar_TypeChecker_Env.use_bv_sorts =
              (uu___373_104.FStar_TypeChecker_Env.use_bv_sorts);
            FStar_TypeChecker_Env.qtbl_name_and_index = uu____105;
            FStar_TypeChecker_Env.normalized_eff_names =
              (uu___373_104.FStar_TypeChecker_Env.normalized_eff_names);
            FStar_TypeChecker_Env.fv_delta_depths =
              (uu___373_104.FStar_TypeChecker_Env.fv_delta_depths);
            FStar_TypeChecker_Env.proof_ns =
              (uu___373_104.FStar_TypeChecker_Env.proof_ns);
            FStar_TypeChecker_Env.synth_hook =
              (uu___373_104.FStar_TypeChecker_Env.synth_hook);
            FStar_TypeChecker_Env.splice =
              (uu___373_104.FStar_TypeChecker_Env.splice);
            FStar_TypeChecker_Env.postprocess =
              (uu___373_104.FStar_TypeChecker_Env.postprocess);
            FStar_TypeChecker_Env.is_native_tactic =
              (uu___373_104.FStar_TypeChecker_Env.is_native_tactic);
            FStar_TypeChecker_Env.identifier_info =
              (uu___373_104.FStar_TypeChecker_Env.identifier_info);
            FStar_TypeChecker_Env.tc_hooks =
              (uu___373_104.FStar_TypeChecker_Env.tc_hooks);
            FStar_TypeChecker_Env.dsenv =
              (uu___373_104.FStar_TypeChecker_Env.dsenv);
            FStar_TypeChecker_Env.nbe =
              (uu___373_104.FStar_TypeChecker_Env.nbe)
          }
  
let (log : FStar_TypeChecker_Env.env -> Prims.bool) =
  fun env  ->
    (FStar_Options.log_types ()) &&
      (let uu____149 =
         let uu____150 = FStar_TypeChecker_Env.current_module env  in
         FStar_Ident.lid_equals FStar_Parser_Const.prims_lid uu____150  in
       Prims.op_Negation uu____149)
  
let (tc_check_trivial_guard :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  ->
      fun k  ->
        let uu____166 =
          FStar_TypeChecker_TcTerm.tc_check_tot_or_gtot_term env t k  in
        match uu____166 with
        | (t1,c,g) -> (FStar_TypeChecker_Rel.force_trivial_guard env g; t1)
  
let (recheck_debug :
  Prims.string ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun s  ->
    fun env  ->
      fun t  ->
        (let uu____193 =
           FStar_TypeChecker_Env.debug env (FStar_Options.Other "ED")  in
         if uu____193
         then
           let uu____194 = FStar_Syntax_Print.term_to_string t  in
           FStar_Util.print2
             "Term has been %s-transformed to:\n%s\n----------\n" s uu____194
         else ());
        (let uu____196 = FStar_TypeChecker_TcTerm.tc_term env t  in
         match uu____196 with
         | (t',uu____204,uu____205) ->
             ((let uu____207 =
                 FStar_TypeChecker_Env.debug env (FStar_Options.Other "ED")
                  in
               if uu____207
               then
                 let uu____208 = FStar_Syntax_Print.term_to_string t'  in
                 FStar_Util.print1 "Re-checked; got:\n%s\n----------\n"
                   uu____208
               else ());
              t'))
  
let (check_and_gen :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.tscheme)
  =
  fun env  ->
    fun t  ->
      fun k  ->
        let uu____225 = tc_check_trivial_guard env t k  in
        FStar_TypeChecker_Util.generalize_universes env uu____225
  
let check_nogen :
  'Auu____234 .
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.typ ->
          ('Auu____234 Prims.list,FStar_Syntax_Syntax.term)
            FStar_Pervasives_Native.tuple2
  =
  fun env  ->
    fun t  ->
      fun k  ->
        let t1 = tc_check_trivial_guard env t k  in
        let uu____257 =
          FStar_TypeChecker_Normalize.normalize [FStar_TypeChecker_Env.Beta]
            env t1
           in
        ([], uu____257)
  
let (monad_signature :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.term ->
        (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.term'
                                  FStar_Syntax_Syntax.syntax)
          FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun m  ->
      fun s  ->
        let fail1 uu____292 =
          let uu____293 =
            FStar_TypeChecker_Err.unexpected_signature_for_monad env m s  in
          let uu____298 = FStar_Ident.range_of_lid m  in
          FStar_Errors.raise_error uu____293 uu____298  in
        let s1 = FStar_Syntax_Subst.compress s  in
        match s1.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
            let bs1 = FStar_Syntax_Subst.open_binders bs  in
            (match bs1 with
             | (a,uu____342)::(wp,uu____344)::[] ->
                 (a, (wp.FStar_Syntax_Syntax.sort))
             | uu____373 -> fail1 ())
        | uu____374 -> fail1 ()
  
let (tc_eff_decl :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.eff_decl -> FStar_Syntax_Syntax.eff_decl)
  =
  fun env0  ->
    fun ed  ->
      let uu____385 =
        FStar_Syntax_Subst.univ_var_opening ed.FStar_Syntax_Syntax.univs  in
      match uu____385 with
      | (open_annotated_univs,annotated_univ_names) ->
          let open_univs n_binders t =
            let uu____415 =
              FStar_Syntax_Subst.shift_subst n_binders open_annotated_univs
               in
            FStar_Syntax_Subst.subst uu____415 t  in
          let open_univs_binders n_binders bs =
            let uu____429 =
              FStar_Syntax_Subst.shift_subst n_binders open_annotated_univs
               in
            FStar_Syntax_Subst.subst_binders uu____429 bs  in
          let n_effect_params =
            FStar_List.length ed.FStar_Syntax_Syntax.binders  in
          let uu____439 =
            let uu____446 =
              open_univs_binders (Prims.parse_int "0")
                ed.FStar_Syntax_Syntax.binders
               in
            let uu____447 =
              open_univs n_effect_params ed.FStar_Syntax_Syntax.signature  in
            FStar_Syntax_Subst.open_term' uu____446 uu____447  in
          (match uu____439 with
           | (effect_params_un,signature_un,opening) ->
               let env =
                 FStar_TypeChecker_Env.push_univ_vars env0
                   annotated_univ_names
                  in
               let uu____458 =
                 FStar_TypeChecker_TcTerm.tc_tparams env effect_params_un  in
               (match uu____458 with
                | (effect_params,env1,uu____467) ->
                    let uu____468 =
                      FStar_TypeChecker_TcTerm.tc_trivial_guard env1
                        signature_un
                       in
                    (match uu____468 with
                     | (signature,uu____474) ->
                         let ed1 =
                           let uu___374_476 = ed  in
                           {
                             FStar_Syntax_Syntax.cattributes =
                               (uu___374_476.FStar_Syntax_Syntax.cattributes);
                             FStar_Syntax_Syntax.mname =
                               (uu___374_476.FStar_Syntax_Syntax.mname);
                             FStar_Syntax_Syntax.univs =
                               (uu___374_476.FStar_Syntax_Syntax.univs);
                             FStar_Syntax_Syntax.binders = effect_params;
                             FStar_Syntax_Syntax.signature = signature;
                             FStar_Syntax_Syntax.ret_wp =
                               (uu___374_476.FStar_Syntax_Syntax.ret_wp);
                             FStar_Syntax_Syntax.bind_wp =
                               (uu___374_476.FStar_Syntax_Syntax.bind_wp);
                             FStar_Syntax_Syntax.if_then_else =
                               (uu___374_476.FStar_Syntax_Syntax.if_then_else);
                             FStar_Syntax_Syntax.ite_wp =
                               (uu___374_476.FStar_Syntax_Syntax.ite_wp);
                             FStar_Syntax_Syntax.stronger =
                               (uu___374_476.FStar_Syntax_Syntax.stronger);
                             FStar_Syntax_Syntax.close_wp =
                               (uu___374_476.FStar_Syntax_Syntax.close_wp);
                             FStar_Syntax_Syntax.assert_p =
                               (uu___374_476.FStar_Syntax_Syntax.assert_p);
                             FStar_Syntax_Syntax.assume_p =
                               (uu___374_476.FStar_Syntax_Syntax.assume_p);
                             FStar_Syntax_Syntax.null_wp =
                               (uu___374_476.FStar_Syntax_Syntax.null_wp);
                             FStar_Syntax_Syntax.trivial =
                               (uu___374_476.FStar_Syntax_Syntax.trivial);
                             FStar_Syntax_Syntax.repr =
                               (uu___374_476.FStar_Syntax_Syntax.repr);
                             FStar_Syntax_Syntax.return_repr =
                               (uu___374_476.FStar_Syntax_Syntax.return_repr);
                             FStar_Syntax_Syntax.bind_repr =
                               (uu___374_476.FStar_Syntax_Syntax.bind_repr);
                             FStar_Syntax_Syntax.actions =
                               (uu___374_476.FStar_Syntax_Syntax.actions);
                             FStar_Syntax_Syntax.eff_attrs =
                               (uu___374_476.FStar_Syntax_Syntax.eff_attrs)
                           }  in
                         let ed2 =
                           match (effect_params, annotated_univ_names) with
                           | ([],[]) -> ed1
                           | uu____504 ->
                               let op uu____536 =
                                 match uu____536 with
                                 | (us,t) ->
                                     let n_us = FStar_List.length us  in
                                     let uu____556 =
                                       let uu____557 =
                                         FStar_Syntax_Subst.shift_subst n_us
                                           opening
                                          in
                                       let uu____566 = open_univs n_us t  in
                                       FStar_Syntax_Subst.subst uu____557
                                         uu____566
                                        in
                                     (us, uu____556)
                                  in
                               let uu___375_575 = ed1  in
                               let uu____576 =
                                 op ed1.FStar_Syntax_Syntax.ret_wp  in
                               let uu____577 =
                                 op ed1.FStar_Syntax_Syntax.bind_wp  in
                               let uu____578 =
                                 op ed1.FStar_Syntax_Syntax.if_then_else  in
                               let uu____579 =
                                 op ed1.FStar_Syntax_Syntax.ite_wp  in
                               let uu____580 =
                                 op ed1.FStar_Syntax_Syntax.stronger  in
                               let uu____581 =
                                 op ed1.FStar_Syntax_Syntax.close_wp  in
                               let uu____582 =
                                 op ed1.FStar_Syntax_Syntax.assert_p  in
                               let uu____583 =
                                 op ed1.FStar_Syntax_Syntax.assume_p  in
                               let uu____584 =
                                 op ed1.FStar_Syntax_Syntax.null_wp  in
                               let uu____585 =
                                 op ed1.FStar_Syntax_Syntax.trivial  in
                               let uu____586 =
                                 let uu____587 =
                                   op ([], (ed1.FStar_Syntax_Syntax.repr))
                                    in
                                 FStar_Pervasives_Native.snd uu____587  in
                               let uu____598 =
                                 op ed1.FStar_Syntax_Syntax.return_repr  in
                               let uu____599 =
                                 op ed1.FStar_Syntax_Syntax.bind_repr  in
                               let uu____600 =
                                 FStar_List.map
                                   (fun a  ->
                                      let uu___376_608 = a  in
                                      let uu____609 =
                                        let uu____610 =
                                          op
                                            ((a.FStar_Syntax_Syntax.action_univs),
                                              (a.FStar_Syntax_Syntax.action_defn))
                                           in
                                        FStar_Pervasives_Native.snd uu____610
                                         in
                                      let uu____621 =
                                        let uu____622 =
                                          op
                                            ((a.FStar_Syntax_Syntax.action_univs),
                                              (a.FStar_Syntax_Syntax.action_typ))
                                           in
                                        FStar_Pervasives_Native.snd uu____622
                                         in
                                      {
                                        FStar_Syntax_Syntax.action_name =
                                          (uu___376_608.FStar_Syntax_Syntax.action_name);
                                        FStar_Syntax_Syntax.action_unqualified_name
                                          =
                                          (uu___376_608.FStar_Syntax_Syntax.action_unqualified_name);
                                        FStar_Syntax_Syntax.action_univs =
                                          (uu___376_608.FStar_Syntax_Syntax.action_univs);
                                        FStar_Syntax_Syntax.action_params =
                                          (uu___376_608.FStar_Syntax_Syntax.action_params);
                                        FStar_Syntax_Syntax.action_defn =
                                          uu____609;
                                        FStar_Syntax_Syntax.action_typ =
                                          uu____621
                                      }) ed1.FStar_Syntax_Syntax.actions
                                  in
                               {
                                 FStar_Syntax_Syntax.cattributes =
                                   (uu___375_575.FStar_Syntax_Syntax.cattributes);
                                 FStar_Syntax_Syntax.mname =
                                   (uu___375_575.FStar_Syntax_Syntax.mname);
                                 FStar_Syntax_Syntax.univs =
                                   annotated_univ_names;
                                 FStar_Syntax_Syntax.binders =
                                   (uu___375_575.FStar_Syntax_Syntax.binders);
                                 FStar_Syntax_Syntax.signature =
                                   (uu___375_575.FStar_Syntax_Syntax.signature);
                                 FStar_Syntax_Syntax.ret_wp = uu____576;
                                 FStar_Syntax_Syntax.bind_wp = uu____577;
                                 FStar_Syntax_Syntax.if_then_else = uu____578;
                                 FStar_Syntax_Syntax.ite_wp = uu____579;
                                 FStar_Syntax_Syntax.stronger = uu____580;
                                 FStar_Syntax_Syntax.close_wp = uu____581;
                                 FStar_Syntax_Syntax.assert_p = uu____582;
                                 FStar_Syntax_Syntax.assume_p = uu____583;
                                 FStar_Syntax_Syntax.null_wp = uu____584;
                                 FStar_Syntax_Syntax.trivial = uu____585;
                                 FStar_Syntax_Syntax.repr = uu____586;
                                 FStar_Syntax_Syntax.return_repr = uu____598;
                                 FStar_Syntax_Syntax.bind_repr = uu____599;
                                 FStar_Syntax_Syntax.actions = uu____600;
                                 FStar_Syntax_Syntax.eff_attrs =
                                   (uu___375_575.FStar_Syntax_Syntax.eff_attrs)
                               }
                            in
                         let wp_with_fresh_result_type env2 mname signature1
                           =
                           let fail1 t =
                             let uu____667 =
                               FStar_TypeChecker_Err.unexpected_signature_for_monad
                                 env2 mname t
                                in
                             let uu____672 = FStar_Ident.range_of_lid mname
                                in
                             FStar_Errors.raise_error uu____667 uu____672  in
                           let uu____679 =
                             let uu____680 =
                               FStar_Syntax_Subst.compress signature1  in
                             uu____680.FStar_Syntax_Syntax.n  in
                           match uu____679 with
                           | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
                               let bs1 = FStar_Syntax_Subst.open_binders bs
                                  in
                               (match bs1 with
                                | (a,uu____719)::(wp,uu____721)::[] ->
                                    (a, (wp.FStar_Syntax_Syntax.sort))
                                | uu____750 -> fail1 signature1)
                           | uu____751 -> fail1 signature1  in
                         let uu____752 =
                           wp_with_fresh_result_type env1
                             ed2.FStar_Syntax_Syntax.mname
                             ed2.FStar_Syntax_Syntax.signature
                            in
                         (match uu____752 with
                          | (a,wp_a) ->
                              let fresh_effect_signature uu____776 =
                                match annotated_univ_names with
                                | [] ->
                                    let uu____783 =
                                      FStar_TypeChecker_TcTerm.tc_trivial_guard
                                        env1 signature_un
                                       in
                                    (match uu____783 with
                                     | (signature1,uu____795) ->
                                         wp_with_fresh_result_type env1
                                           ed2.FStar_Syntax_Syntax.mname
                                           signature1)
                                | uu____796 ->
                                    let uu____799 =
                                      let uu____804 =
                                        let uu____805 =
                                          FStar_Syntax_Subst.close_univ_vars
                                            annotated_univ_names signature
                                           in
                                        (annotated_univ_names, uu____805)  in
                                      FStar_TypeChecker_Env.inst_tscheme
                                        uu____804
                                       in
                                    (match uu____799 with
                                     | (uu____818,signature1) ->
                                         wp_with_fresh_result_type env1
                                           ed2.FStar_Syntax_Syntax.mname
                                           signature1)
                                 in
                              let env2 =
                                let uu____821 =
                                  FStar_Syntax_Syntax.new_bv
                                    FStar_Pervasives_Native.None
                                    ed2.FStar_Syntax_Syntax.signature
                                   in
                                FStar_TypeChecker_Env.push_bv env1 uu____821
                                 in
                              ((let uu____823 =
                                  FStar_All.pipe_left
                                    (FStar_TypeChecker_Env.debug env0)
                                    (FStar_Options.Other "ED")
                                   in
                                if uu____823
                                then
                                  let uu____824 =
                                    FStar_Syntax_Print.lid_to_string
                                      ed2.FStar_Syntax_Syntax.mname
                                     in
                                  let uu____825 =
                                    FStar_Syntax_Print.binders_to_string " "
                                      ed2.FStar_Syntax_Syntax.binders
                                     in
                                  let uu____826 =
                                    FStar_Syntax_Print.term_to_string
                                      ed2.FStar_Syntax_Syntax.signature
                                     in
                                  let uu____827 =
                                    let uu____828 =
                                      FStar_Syntax_Syntax.bv_to_name a  in
                                    FStar_Syntax_Print.term_to_string
                                      uu____828
                                     in
                                  let uu____829 =
                                    FStar_Syntax_Print.term_to_string
                                      a.FStar_Syntax_Syntax.sort
                                     in
                                  FStar_Util.print5
                                    "Checking effect signature: %s %s : %s\n(a is %s:%s)\n"
                                    uu____824 uu____825 uu____826 uu____827
                                    uu____829
                                else ());
                               (let check_and_gen' env3 uu____861 k =
                                  match uu____861 with
                                  | (us,t) ->
                                      (match annotated_univ_names with
                                       | [] -> check_and_gen env3 t k
                                       | uu____897::uu____898 ->
                                           let uu____901 =
                                             FStar_Syntax_Subst.subst_tscheme
                                               open_annotated_univs (us, t)
                                              in
                                           (match uu____901 with
                                            | (us1,t1) ->
                                                let uu____924 =
                                                  FStar_Syntax_Subst.open_univ_vars
                                                    us1 t1
                                                   in
                                                (match uu____924 with
                                                 | (us2,t2) ->
                                                     let uu____939 =
                                                       let uu____940 =
                                                         FStar_TypeChecker_Env.push_univ_vars
                                                           env3 us2
                                                          in
                                                       tc_check_trivial_guard
                                                         uu____940 t2 k
                                                        in
                                                     let uu____941 =
                                                       FStar_Syntax_Subst.close_univ_vars
                                                         us2 t2
                                                        in
                                                     (us2, uu____941))))
                                   in
                                let return_wp =
                                  let expected_k =
                                    let uu____960 =
                                      let uu____969 =
                                        FStar_Syntax_Syntax.mk_binder a  in
                                      let uu____976 =
                                        let uu____985 =
                                          let uu____992 =
                                            FStar_Syntax_Syntax.bv_to_name a
                                             in
                                          FStar_Syntax_Syntax.null_binder
                                            uu____992
                                           in
                                        [uu____985]  in
                                      uu____969 :: uu____976  in
                                    let uu____1011 =
                                      FStar_Syntax_Syntax.mk_GTotal wp_a  in
                                    FStar_Syntax_Util.arrow uu____960
                                      uu____1011
                                     in
                                  check_and_gen' env2
                                    ed2.FStar_Syntax_Syntax.ret_wp expected_k
                                   in
                                let bind_wp =
                                  let uu____1015 = fresh_effect_signature ()
                                     in
                                  match uu____1015 with
                                  | (b,wp_b) ->
                                      let a_wp_b =
                                        let uu____1031 =
                                          let uu____1040 =
                                            let uu____1047 =
                                              FStar_Syntax_Syntax.bv_to_name
                                                a
                                               in
                                            FStar_Syntax_Syntax.null_binder
                                              uu____1047
                                             in
                                          [uu____1040]  in
                                        let uu____1060 =
                                          FStar_Syntax_Syntax.mk_Total wp_b
                                           in
                                        FStar_Syntax_Util.arrow uu____1031
                                          uu____1060
                                         in
                                      let expected_k =
                                        let uu____1066 =
                                          let uu____1075 =
                                            FStar_Syntax_Syntax.null_binder
                                              FStar_Syntax_Syntax.t_range
                                             in
                                          let uu____1082 =
                                            let uu____1091 =
                                              FStar_Syntax_Syntax.mk_binder a
                                               in
                                            let uu____1098 =
                                              let uu____1107 =
                                                FStar_Syntax_Syntax.mk_binder
                                                  b
                                                 in
                                              let uu____1114 =
                                                let uu____1123 =
                                                  FStar_Syntax_Syntax.null_binder
                                                    wp_a
                                                   in
                                                let uu____1130 =
                                                  let uu____1139 =
                                                    FStar_Syntax_Syntax.null_binder
                                                      a_wp_b
                                                     in
                                                  [uu____1139]  in
                                                uu____1123 :: uu____1130  in
                                              uu____1107 :: uu____1114  in
                                            uu____1091 :: uu____1098  in
                                          uu____1075 :: uu____1082  in
                                        let uu____1182 =
                                          FStar_Syntax_Syntax.mk_Total wp_b
                                           in
                                        FStar_Syntax_Util.arrow uu____1066
                                          uu____1182
                                         in
                                      check_and_gen' env2
                                        ed2.FStar_Syntax_Syntax.bind_wp
                                        expected_k
                                   in
                                let if_then_else1 =
                                  let p =
                                    let uu____1195 =
                                      let uu____1198 =
                                        FStar_Ident.range_of_lid
                                          ed2.FStar_Syntax_Syntax.mname
                                         in
                                      FStar_Pervasives_Native.Some uu____1198
                                       in
                                    let uu____1199 =
                                      let uu____1200 =
                                        FStar_Syntax_Util.type_u ()  in
                                      FStar_All.pipe_right uu____1200
                                        FStar_Pervasives_Native.fst
                                       in
                                    FStar_Syntax_Syntax.new_bv uu____1195
                                      uu____1199
                                     in
                                  let expected_k =
                                    let uu____1212 =
                                      let uu____1221 =
                                        FStar_Syntax_Syntax.mk_binder a  in
                                      let uu____1228 =
                                        let uu____1237 =
                                          FStar_Syntax_Syntax.mk_binder p  in
                                        let uu____1244 =
                                          let uu____1253 =
                                            FStar_Syntax_Syntax.null_binder
                                              wp_a
                                             in
                                          let uu____1260 =
                                            let uu____1269 =
                                              FStar_Syntax_Syntax.null_binder
                                                wp_a
                                               in
                                            [uu____1269]  in
                                          uu____1253 :: uu____1260  in
                                        uu____1237 :: uu____1244  in
                                      uu____1221 :: uu____1228  in
                                    let uu____1306 =
                                      FStar_Syntax_Syntax.mk_Total wp_a  in
                                    FStar_Syntax_Util.arrow uu____1212
                                      uu____1306
                                     in
                                  check_and_gen' env2
                                    ed2.FStar_Syntax_Syntax.if_then_else
                                    expected_k
                                   in
                                let ite_wp =
                                  let expected_k =
                                    let uu____1321 =
                                      let uu____1330 =
                                        FStar_Syntax_Syntax.mk_binder a  in
                                      let uu____1337 =
                                        let uu____1346 =
                                          FStar_Syntax_Syntax.null_binder
                                            wp_a
                                           in
                                        [uu____1346]  in
                                      uu____1330 :: uu____1337  in
                                    let uu____1371 =
                                      FStar_Syntax_Syntax.mk_Total wp_a  in
                                    FStar_Syntax_Util.arrow uu____1321
                                      uu____1371
                                     in
                                  check_and_gen' env2
                                    ed2.FStar_Syntax_Syntax.ite_wp expected_k
                                   in
                                let stronger =
                                  let uu____1375 =
                                    FStar_Syntax_Util.type_u ()  in
                                  match uu____1375 with
                                  | (t,uu____1381) ->
                                      let expected_k =
                                        let uu____1385 =
                                          let uu____1394 =
                                            FStar_Syntax_Syntax.mk_binder a
                                             in
                                          let uu____1401 =
                                            let uu____1410 =
                                              FStar_Syntax_Syntax.null_binder
                                                wp_a
                                               in
                                            let uu____1417 =
                                              let uu____1426 =
                                                FStar_Syntax_Syntax.null_binder
                                                  wp_a
                                                 in
                                              [uu____1426]  in
                                            uu____1410 :: uu____1417  in
                                          uu____1394 :: uu____1401  in
                                        let uu____1457 =
                                          FStar_Syntax_Syntax.mk_Total t  in
                                        FStar_Syntax_Util.arrow uu____1385
                                          uu____1457
                                         in
                                      check_and_gen' env2
                                        ed2.FStar_Syntax_Syntax.stronger
                                        expected_k
                                   in
                                let close_wp =
                                  let b =
                                    let uu____1470 =
                                      let uu____1473 =
                                        FStar_Ident.range_of_lid
                                          ed2.FStar_Syntax_Syntax.mname
                                         in
                                      FStar_Pervasives_Native.Some uu____1473
                                       in
                                    let uu____1474 =
                                      let uu____1475 =
                                        FStar_Syntax_Util.type_u ()  in
                                      FStar_All.pipe_right uu____1475
                                        FStar_Pervasives_Native.fst
                                       in
                                    FStar_Syntax_Syntax.new_bv uu____1470
                                      uu____1474
                                     in
                                  let b_wp_a =
                                    let uu____1487 =
                                      let uu____1496 =
                                        let uu____1503 =
                                          FStar_Syntax_Syntax.bv_to_name b
                                           in
                                        FStar_Syntax_Syntax.null_binder
                                          uu____1503
                                         in
                                      [uu____1496]  in
                                    let uu____1516 =
                                      FStar_Syntax_Syntax.mk_Total wp_a  in
                                    FStar_Syntax_Util.arrow uu____1487
                                      uu____1516
                                     in
                                  let expected_k =
                                    let uu____1522 =
                                      let uu____1531 =
                                        FStar_Syntax_Syntax.mk_binder a  in
                                      let uu____1538 =
                                        let uu____1547 =
                                          FStar_Syntax_Syntax.mk_binder b  in
                                        let uu____1554 =
                                          let uu____1563 =
                                            FStar_Syntax_Syntax.null_binder
                                              b_wp_a
                                             in
                                          [uu____1563]  in
                                        uu____1547 :: uu____1554  in
                                      uu____1531 :: uu____1538  in
                                    let uu____1594 =
                                      FStar_Syntax_Syntax.mk_Total wp_a  in
                                    FStar_Syntax_Util.arrow uu____1522
                                      uu____1594
                                     in
                                  check_and_gen' env2
                                    ed2.FStar_Syntax_Syntax.close_wp
                                    expected_k
                                   in
                                let assert_p =
                                  let expected_k =
                                    let uu____1609 =
                                      let uu____1618 =
                                        FStar_Syntax_Syntax.mk_binder a  in
                                      let uu____1625 =
                                        let uu____1634 =
                                          let uu____1641 =
                                            let uu____1642 =
                                              FStar_Syntax_Util.type_u ()  in
                                            FStar_All.pipe_right uu____1642
                                              FStar_Pervasives_Native.fst
                                             in
                                          FStar_Syntax_Syntax.null_binder
                                            uu____1641
                                           in
                                        let uu____1651 =
                                          let uu____1660 =
                                            FStar_Syntax_Syntax.null_binder
                                              wp_a
                                             in
                                          [uu____1660]  in
                                        uu____1634 :: uu____1651  in
                                      uu____1618 :: uu____1625  in
                                    let uu____1691 =
                                      FStar_Syntax_Syntax.mk_Total wp_a  in
                                    FStar_Syntax_Util.arrow uu____1609
                                      uu____1691
                                     in
                                  check_and_gen' env2
                                    ed2.FStar_Syntax_Syntax.assert_p
                                    expected_k
                                   in
                                let assume_p =
                                  let expected_k =
                                    let uu____1706 =
                                      let uu____1715 =
                                        FStar_Syntax_Syntax.mk_binder a  in
                                      let uu____1722 =
                                        let uu____1731 =
                                          let uu____1738 =
                                            let uu____1739 =
                                              FStar_Syntax_Util.type_u ()  in
                                            FStar_All.pipe_right uu____1739
                                              FStar_Pervasives_Native.fst
                                             in
                                          FStar_Syntax_Syntax.null_binder
                                            uu____1738
                                           in
                                        let uu____1748 =
                                          let uu____1757 =
                                            FStar_Syntax_Syntax.null_binder
                                              wp_a
                                             in
                                          [uu____1757]  in
                                        uu____1731 :: uu____1748  in
                                      uu____1715 :: uu____1722  in
                                    let uu____1788 =
                                      FStar_Syntax_Syntax.mk_Total wp_a  in
                                    FStar_Syntax_Util.arrow uu____1706
                                      uu____1788
                                     in
                                  check_and_gen' env2
                                    ed2.FStar_Syntax_Syntax.assume_p
                                    expected_k
                                   in
                                let null_wp =
                                  let expected_k =
                                    let uu____1803 =
                                      let uu____1812 =
                                        FStar_Syntax_Syntax.mk_binder a  in
                                      [uu____1812]  in
                                    let uu____1831 =
                                      FStar_Syntax_Syntax.mk_Total wp_a  in
                                    FStar_Syntax_Util.arrow uu____1803
                                      uu____1831
                                     in
                                  check_and_gen' env2
                                    ed2.FStar_Syntax_Syntax.null_wp
                                    expected_k
                                   in
                                let trivial_wp =
                                  let uu____1835 =
                                    FStar_Syntax_Util.type_u ()  in
                                  match uu____1835 with
                                  | (t,uu____1841) ->
                                      let expected_k =
                                        let uu____1845 =
                                          let uu____1854 =
                                            FStar_Syntax_Syntax.mk_binder a
                                             in
                                          let uu____1861 =
                                            let uu____1870 =
                                              FStar_Syntax_Syntax.null_binder
                                                wp_a
                                               in
                                            [uu____1870]  in
                                          uu____1854 :: uu____1861  in
                                        let uu____1895 =
                                          FStar_Syntax_Syntax.mk_GTotal t  in
                                        FStar_Syntax_Util.arrow uu____1845
                                          uu____1895
                                         in
                                      check_and_gen' env2
                                        ed2.FStar_Syntax_Syntax.trivial
                                        expected_k
                                   in
                                let uu____1898 =
                                  let uu____1911 =
                                    let uu____1912 =
                                      FStar_Syntax_Subst.compress
                                        ed2.FStar_Syntax_Syntax.repr
                                       in
                                    uu____1912.FStar_Syntax_Syntax.n  in
                                  match uu____1911 with
                                  | FStar_Syntax_Syntax.Tm_unknown  ->
                                      ((ed2.FStar_Syntax_Syntax.repr),
                                        (ed2.FStar_Syntax_Syntax.bind_repr),
                                        (ed2.FStar_Syntax_Syntax.return_repr),
                                        (ed2.FStar_Syntax_Syntax.actions))
                                  | uu____1931 ->
                                      let repr =
                                        let uu____1933 =
                                          FStar_Syntax_Util.type_u ()  in
                                        match uu____1933 with
                                        | (t,uu____1939) ->
                                            let expected_k =
                                              let uu____1943 =
                                                let uu____1952 =
                                                  FStar_Syntax_Syntax.mk_binder
                                                    a
                                                   in
                                                let uu____1959 =
                                                  let uu____1968 =
                                                    FStar_Syntax_Syntax.null_binder
                                                      wp_a
                                                     in
                                                  [uu____1968]  in
                                                uu____1952 :: uu____1959  in
                                              let uu____1993 =
                                                FStar_Syntax_Syntax.mk_GTotal
                                                  t
                                                 in
                                              FStar_Syntax_Util.arrow
                                                uu____1943 uu____1993
                                               in
                                            tc_check_trivial_guard env2
                                              ed2.FStar_Syntax_Syntax.repr
                                              expected_k
                                         in
                                      let mk_repr' t wp =
                                        let repr1 =
                                          FStar_TypeChecker_Normalize.normalize
                                            [FStar_TypeChecker_Env.EraseUniverses;
                                            FStar_TypeChecker_Env.AllowUnboundUniverses]
                                            env2 repr
                                           in
                                        let uu____2010 =
                                          let uu____2017 =
                                            let uu____2018 =
                                              let uu____2035 =
                                                let uu____2046 =
                                                  FStar_Syntax_Syntax.as_arg
                                                    t
                                                   in
                                                let uu____2055 =
                                                  let uu____2066 =
                                                    FStar_Syntax_Syntax.as_arg
                                                      wp
                                                     in
                                                  [uu____2066]  in
                                                uu____2046 :: uu____2055  in
                                              (repr1, uu____2035)  in
                                            FStar_Syntax_Syntax.Tm_app
                                              uu____2018
                                             in
                                          FStar_Syntax_Syntax.mk uu____2017
                                           in
                                        uu____2010
                                          FStar_Pervasives_Native.None
                                          FStar_Range.dummyRange
                                         in
                                      let mk_repr a1 wp =
                                        let uu____2127 =
                                          FStar_Syntax_Syntax.bv_to_name a1
                                           in
                                        mk_repr' uu____2127 wp  in
                                      let destruct_repr t =
                                        let uu____2142 =
                                          let uu____2143 =
                                            FStar_Syntax_Subst.compress t  in
                                          uu____2143.FStar_Syntax_Syntax.n
                                           in
                                        match uu____2142 with
                                        | FStar_Syntax_Syntax.Tm_app
                                            (uu____2154,(t1,uu____2156)::
                                             (wp,uu____2158)::[])
                                            -> (t1, wp)
                                        | uu____2217 ->
                                            failwith "Unexpected repr type"
                                         in
                                      let bind_repr =
                                        let r =
                                          let uu____2228 =
                                            FStar_Syntax_Syntax.lid_as_fv
                                              FStar_Parser_Const.range_0
                                              FStar_Syntax_Syntax.delta_constant
                                              FStar_Pervasives_Native.None
                                             in
                                          FStar_All.pipe_right uu____2228
                                            FStar_Syntax_Syntax.fv_to_tm
                                           in
                                        let uu____2229 =
                                          fresh_effect_signature ()  in
                                        match uu____2229 with
                                        | (b,wp_b) ->
                                            let a_wp_b =
                                              let uu____2245 =
                                                let uu____2254 =
                                                  let uu____2261 =
                                                    FStar_Syntax_Syntax.bv_to_name
                                                      a
                                                     in
                                                  FStar_Syntax_Syntax.null_binder
                                                    uu____2261
                                                   in
                                                [uu____2254]  in
                                              let uu____2274 =
                                                FStar_Syntax_Syntax.mk_Total
                                                  wp_b
                                                 in
                                              FStar_Syntax_Util.arrow
                                                uu____2245 uu____2274
                                               in
                                            let wp_f =
                                              FStar_Syntax_Syntax.gen_bv
                                                "wp_f"
                                                FStar_Pervasives_Native.None
                                                wp_a
                                               in
                                            let wp_g =
                                              FStar_Syntax_Syntax.gen_bv
                                                "wp_g"
                                                FStar_Pervasives_Native.None
                                                a_wp_b
                                               in
                                            let x_a =
                                              let uu____2280 =
                                                FStar_Syntax_Syntax.bv_to_name
                                                  a
                                                 in
                                              FStar_Syntax_Syntax.gen_bv
                                                "x_a"
                                                FStar_Pervasives_Native.None
                                                uu____2280
                                               in
                                            let wp_g_x =
                                              let uu____2284 =
                                                let uu____2289 =
                                                  FStar_Syntax_Syntax.bv_to_name
                                                    wp_g
                                                   in
                                                let uu____2290 =
                                                  let uu____2291 =
                                                    let uu____2300 =
                                                      FStar_Syntax_Syntax.bv_to_name
                                                        x_a
                                                       in
                                                    FStar_All.pipe_left
                                                      FStar_Syntax_Syntax.as_arg
                                                      uu____2300
                                                     in
                                                  [uu____2291]  in
                                                FStar_Syntax_Syntax.mk_Tm_app
                                                  uu____2289 uu____2290
                                                 in
                                              uu____2284
                                                FStar_Pervasives_Native.None
                                                FStar_Range.dummyRange
                                               in
                                            let res =
                                              let wp =
                                                let uu____2333 =
                                                  let uu____2338 =
                                                    let uu____2339 =
                                                      FStar_TypeChecker_Env.inst_tscheme
                                                        bind_wp
                                                       in
                                                    FStar_All.pipe_right
                                                      uu____2339
                                                      FStar_Pervasives_Native.snd
                                                     in
                                                  let uu____2348 =
                                                    let uu____2349 =
                                                      let uu____2352 =
                                                        let uu____2355 =
                                                          FStar_Syntax_Syntax.bv_to_name
                                                            a
                                                           in
                                                        let uu____2356 =
                                                          let uu____2359 =
                                                            FStar_Syntax_Syntax.bv_to_name
                                                              b
                                                             in
                                                          let uu____2360 =
                                                            let uu____2363 =
                                                              FStar_Syntax_Syntax.bv_to_name
                                                                wp_f
                                                               in
                                                            let uu____2364 =
                                                              let uu____2367
                                                                =
                                                                FStar_Syntax_Syntax.bv_to_name
                                                                  wp_g
                                                                 in
                                                              [uu____2367]
                                                               in
                                                            uu____2363 ::
                                                              uu____2364
                                                             in
                                                          uu____2359 ::
                                                            uu____2360
                                                           in
                                                        uu____2355 ::
                                                          uu____2356
                                                         in
                                                      r :: uu____2352  in
                                                    FStar_List.map
                                                      FStar_Syntax_Syntax.as_arg
                                                      uu____2349
                                                     in
                                                  FStar_Syntax_Syntax.mk_Tm_app
                                                    uu____2338 uu____2348
                                                   in
                                                uu____2333
                                                  FStar_Pervasives_Native.None
                                                  FStar_Range.dummyRange
                                                 in
                                              mk_repr b wp  in
                                            let maybe_range_arg =
                                              let uu____2387 =
                                                FStar_Util.for_some
                                                  (FStar_Syntax_Util.attr_eq
                                                     FStar_Syntax_Util.dm4f_bind_range_attr)
                                                  ed2.FStar_Syntax_Syntax.eff_attrs
                                                 in
                                              if uu____2387
                                              then
                                                let uu____2396 =
                                                  FStar_Syntax_Syntax.null_binder
                                                    FStar_Syntax_Syntax.t_range
                                                   in
                                                let uu____2403 =
                                                  let uu____2412 =
                                                    FStar_Syntax_Syntax.null_binder
                                                      FStar_Syntax_Syntax.t_range
                                                     in
                                                  [uu____2412]  in
                                                uu____2396 :: uu____2403
                                              else []  in
                                            let expected_k =
                                              let uu____2447 =
                                                let uu____2456 =
                                                  let uu____2465 =
                                                    FStar_Syntax_Syntax.mk_binder
                                                      a
                                                     in
                                                  let uu____2472 =
                                                    let uu____2481 =
                                                      FStar_Syntax_Syntax.mk_binder
                                                        b
                                                       in
                                                    [uu____2481]  in
                                                  uu____2465 :: uu____2472
                                                   in
                                                let uu____2506 =
                                                  let uu____2515 =
                                                    let uu____2524 =
                                                      FStar_Syntax_Syntax.mk_binder
                                                        wp_f
                                                       in
                                                    let uu____2531 =
                                                      let uu____2540 =
                                                        let uu____2547 =
                                                          let uu____2548 =
                                                            FStar_Syntax_Syntax.bv_to_name
                                                              wp_f
                                                             in
                                                          mk_repr a
                                                            uu____2548
                                                           in
                                                        FStar_Syntax_Syntax.null_binder
                                                          uu____2547
                                                         in
                                                      let uu____2549 =
                                                        let uu____2558 =
                                                          FStar_Syntax_Syntax.mk_binder
                                                            wp_g
                                                           in
                                                        let uu____2565 =
                                                          let uu____2574 =
                                                            let uu____2581 =
                                                              let uu____2582
                                                                =
                                                                let uu____2591
                                                                  =
                                                                  FStar_Syntax_Syntax.mk_binder
                                                                    x_a
                                                                   in
                                                                [uu____2591]
                                                                 in
                                                              let uu____2610
                                                                =
                                                                let uu____2613
                                                                  =
                                                                  mk_repr b
                                                                    wp_g_x
                                                                   in
                                                                FStar_All.pipe_left
                                                                  FStar_Syntax_Syntax.mk_Total
                                                                  uu____2613
                                                                 in
                                                              FStar_Syntax_Util.arrow
                                                                uu____2582
                                                                uu____2610
                                                               in
                                                            FStar_Syntax_Syntax.null_binder
                                                              uu____2581
                                                             in
                                                          [uu____2574]  in
                                                        uu____2558 ::
                                                          uu____2565
                                                         in
                                                      uu____2540 ::
                                                        uu____2549
                                                       in
                                                    uu____2524 :: uu____2531
                                                     in
                                                  FStar_List.append
                                                    maybe_range_arg
                                                    uu____2515
                                                   in
                                                FStar_List.append uu____2456
                                                  uu____2506
                                                 in
                                              let uu____2658 =
                                                FStar_Syntax_Syntax.mk_Total
                                                  res
                                                 in
                                              FStar_Syntax_Util.arrow
                                                uu____2447 uu____2658
                                               in
                                            let uu____2661 =
                                              FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term
                                                env2 expected_k
                                               in
                                            (match uu____2661 with
                                             | (expected_k1,uu____2669,uu____2670)
                                                 ->
                                                 let env3 =
                                                   FStar_TypeChecker_Env.set_range
                                                     env2
                                                     (FStar_Pervasives_Native.snd
                                                        ed2.FStar_Syntax_Syntax.bind_repr).FStar_Syntax_Syntax.pos
                                                    in
                                                 let env4 =
                                                   let uu___377_2677 = env3
                                                      in
                                                   {
                                                     FStar_TypeChecker_Env.solver
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.solver);
                                                     FStar_TypeChecker_Env.range
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.range);
                                                     FStar_TypeChecker_Env.curmodule
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.curmodule);
                                                     FStar_TypeChecker_Env.gamma
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.gamma);
                                                     FStar_TypeChecker_Env.gamma_sig
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.gamma_sig);
                                                     FStar_TypeChecker_Env.gamma_cache
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.gamma_cache);
                                                     FStar_TypeChecker_Env.modules
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.modules);
                                                     FStar_TypeChecker_Env.expected_typ
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.expected_typ);
                                                     FStar_TypeChecker_Env.sigtab
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.sigtab);
                                                     FStar_TypeChecker_Env.attrtab
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.attrtab);
                                                     FStar_TypeChecker_Env.is_pattern
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.is_pattern);
                                                     FStar_TypeChecker_Env.instantiate_imp
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.instantiate_imp);
                                                     FStar_TypeChecker_Env.effects
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.effects);
                                                     FStar_TypeChecker_Env.generalize
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.generalize);
                                                     FStar_TypeChecker_Env.letrecs
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.letrecs);
                                                     FStar_TypeChecker_Env.top_level
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.top_level);
                                                     FStar_TypeChecker_Env.check_uvars
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.check_uvars);
                                                     FStar_TypeChecker_Env.use_eq
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.use_eq);
                                                     FStar_TypeChecker_Env.is_iface
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.is_iface);
                                                     FStar_TypeChecker_Env.admit
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.admit);
                                                     FStar_TypeChecker_Env.lax
                                                       = true;
                                                     FStar_TypeChecker_Env.lax_universes
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.lax_universes);
                                                     FStar_TypeChecker_Env.phase1
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.phase1);
                                                     FStar_TypeChecker_Env.failhard
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.failhard);
                                                     FStar_TypeChecker_Env.nosynth
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.nosynth);
                                                     FStar_TypeChecker_Env.uvar_subtyping
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.uvar_subtyping);
                                                     FStar_TypeChecker_Env.tc_term
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.tc_term);
                                                     FStar_TypeChecker_Env.type_of
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.type_of);
                                                     FStar_TypeChecker_Env.universe_of
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.universe_of);
                                                     FStar_TypeChecker_Env.check_type_of
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.check_type_of);
                                                     FStar_TypeChecker_Env.use_bv_sorts
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.use_bv_sorts);
                                                     FStar_TypeChecker_Env.qtbl_name_and_index
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.qtbl_name_and_index);
                                                     FStar_TypeChecker_Env.normalized_eff_names
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.normalized_eff_names);
                                                     FStar_TypeChecker_Env.fv_delta_depths
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.fv_delta_depths);
                                                     FStar_TypeChecker_Env.proof_ns
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.proof_ns);
                                                     FStar_TypeChecker_Env.synth_hook
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.synth_hook);
                                                     FStar_TypeChecker_Env.splice
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.splice);
                                                     FStar_TypeChecker_Env.postprocess
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.postprocess);
                                                     FStar_TypeChecker_Env.is_native_tactic
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.is_native_tactic);
                                                     FStar_TypeChecker_Env.identifier_info
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.identifier_info);
                                                     FStar_TypeChecker_Env.tc_hooks
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.tc_hooks);
                                                     FStar_TypeChecker_Env.dsenv
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.dsenv);
                                                     FStar_TypeChecker_Env.nbe
                                                       =
                                                       (uu___377_2677.FStar_TypeChecker_Env.nbe)
                                                   }  in
                                                 let br =
                                                   check_and_gen' env4
                                                     ed2.FStar_Syntax_Syntax.bind_repr
                                                     expected_k1
                                                    in
                                                 br)
                                         in
                                      let return_repr =
                                        let x_a =
                                          let uu____2689 =
                                            FStar_Syntax_Syntax.bv_to_name a
                                             in
                                          FStar_Syntax_Syntax.gen_bv "x_a"
                                            FStar_Pervasives_Native.None
                                            uu____2689
                                           in
                                        let res =
                                          let wp =
                                            let uu____2696 =
                                              let uu____2701 =
                                                let uu____2702 =
                                                  FStar_TypeChecker_Env.inst_tscheme
                                                    return_wp
                                                   in
                                                FStar_All.pipe_right
                                                  uu____2702
                                                  FStar_Pervasives_Native.snd
                                                 in
                                              let uu____2711 =
                                                let uu____2712 =
                                                  let uu____2715 =
                                                    FStar_Syntax_Syntax.bv_to_name
                                                      a
                                                     in
                                                  let uu____2716 =
                                                    let uu____2719 =
                                                      FStar_Syntax_Syntax.bv_to_name
                                                        x_a
                                                       in
                                                    [uu____2719]  in
                                                  uu____2715 :: uu____2716
                                                   in
                                                FStar_List.map
                                                  FStar_Syntax_Syntax.as_arg
                                                  uu____2712
                                                 in
                                              FStar_Syntax_Syntax.mk_Tm_app
                                                uu____2701 uu____2711
                                               in
                                            uu____2696
                                              FStar_Pervasives_Native.None
                                              FStar_Range.dummyRange
                                             in
                                          mk_repr a wp  in
                                        let expected_k =
                                          let uu____2733 =
                                            let uu____2742 =
                                              FStar_Syntax_Syntax.mk_binder a
                                               in
                                            let uu____2749 =
                                              let uu____2758 =
                                                FStar_Syntax_Syntax.mk_binder
                                                  x_a
                                                 in
                                              [uu____2758]  in
                                            uu____2742 :: uu____2749  in
                                          let uu____2783 =
                                            FStar_Syntax_Syntax.mk_Total res
                                             in
                                          FStar_Syntax_Util.arrow uu____2733
                                            uu____2783
                                           in
                                        let uu____2786 =
                                          FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term
                                            env2 expected_k
                                           in
                                        match uu____2786 with
                                        | (expected_k1,uu____2794,uu____2795)
                                            ->
                                            let env3 =
                                              FStar_TypeChecker_Env.set_range
                                                env2
                                                (FStar_Pervasives_Native.snd
                                                   ed2.FStar_Syntax_Syntax.return_repr).FStar_Syntax_Syntax.pos
                                               in
                                            let uu____2801 =
                                              check_and_gen' env3
                                                ed2.FStar_Syntax_Syntax.return_repr
                                                expected_k1
                                               in
                                            (match uu____2801 with
                                             | (univs1,repr1) ->
                                                 (match univs1 with
                                                  | [] -> ([], repr1)
                                                  | uu____2824 ->
                                                      FStar_Errors.raise_error
                                                        (FStar_Errors.Fatal_UnexpectedUniversePolymorphicReturn,
                                                          "Unexpected universe-polymorphic return for effect")
                                                        repr1.FStar_Syntax_Syntax.pos))
                                         in
                                      let actions =
                                        let check_action act =
                                          let uu____2837 =
                                            if
                                              act.FStar_Syntax_Syntax.action_univs
                                                = []
                                            then (env2, act)
                                            else
                                              (let uu____2849 =
                                                 FStar_Syntax_Subst.univ_var_opening
                                                   act.FStar_Syntax_Syntax.action_univs
                                                  in
                                               match uu____2849 with
                                               | (usubst,uvs) ->
                                                   let uu____2872 =
                                                     FStar_TypeChecker_Env.push_univ_vars
                                                       env2 uvs
                                                      in
                                                   let uu____2873 =
                                                     let uu___378_2874 = act
                                                        in
                                                     let uu____2875 =
                                                       FStar_Syntax_Subst.subst_binders
                                                         usubst
                                                         act.FStar_Syntax_Syntax.action_params
                                                        in
                                                     let uu____2876 =
                                                       FStar_Syntax_Subst.subst
                                                         usubst
                                                         act.FStar_Syntax_Syntax.action_defn
                                                        in
                                                     let uu____2877 =
                                                       FStar_Syntax_Subst.subst
                                                         usubst
                                                         act.FStar_Syntax_Syntax.action_typ
                                                        in
                                                     {
                                                       FStar_Syntax_Syntax.action_name
                                                         =
                                                         (uu___378_2874.FStar_Syntax_Syntax.action_name);
                                                       FStar_Syntax_Syntax.action_unqualified_name
                                                         =
                                                         (uu___378_2874.FStar_Syntax_Syntax.action_unqualified_name);
                                                       FStar_Syntax_Syntax.action_univs
                                                         = uvs;
                                                       FStar_Syntax_Syntax.action_params
                                                         = uu____2875;
                                                       FStar_Syntax_Syntax.action_defn
                                                         = uu____2876;
                                                       FStar_Syntax_Syntax.action_typ
                                                         = uu____2877
                                                     }  in
                                                   (uu____2872, uu____2873))
                                             in
                                          match uu____2837 with
                                          | (env3,act1) ->
                                              let act_typ =
                                                let uu____2881 =
                                                  let uu____2882 =
                                                    FStar_Syntax_Subst.compress
                                                      act1.FStar_Syntax_Syntax.action_typ
                                                     in
                                                  uu____2882.FStar_Syntax_Syntax.n
                                                   in
                                                match uu____2881 with
                                                | FStar_Syntax_Syntax.Tm_arrow
                                                    (bs,c) ->
                                                    let c1 =
                                                      FStar_Syntax_Util.comp_to_comp_typ
                                                        c
                                                       in
                                                    let uu____2908 =
                                                      FStar_Ident.lid_equals
                                                        c1.FStar_Syntax_Syntax.effect_name
                                                        ed2.FStar_Syntax_Syntax.mname
                                                       in
                                                    if uu____2908
                                                    then
                                                      let uu____2909 =
                                                        let uu____2912 =
                                                          let uu____2913 =
                                                            let uu____2914 =
                                                              FStar_List.hd
                                                                c1.FStar_Syntax_Syntax.effect_args
                                                               in
                                                            FStar_Pervasives_Native.fst
                                                              uu____2914
                                                             in
                                                          mk_repr'
                                                            c1.FStar_Syntax_Syntax.result_typ
                                                            uu____2913
                                                           in
                                                        FStar_Syntax_Syntax.mk_Total
                                                          uu____2912
                                                         in
                                                      FStar_Syntax_Util.arrow
                                                        bs uu____2909
                                                    else
                                                      act1.FStar_Syntax_Syntax.action_typ
                                                | uu____2936 ->
                                                    act1.FStar_Syntax_Syntax.action_typ
                                                 in
                                              let uu____2937 =
                                                FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term
                                                  env3 act_typ
                                                 in
                                              (match uu____2937 with
                                               | (act_typ1,uu____2945,g_t) ->
                                                   let env' =
                                                     let uu___379_2948 =
                                                       FStar_TypeChecker_Env.set_expected_typ
                                                         env3 act_typ1
                                                        in
                                                     {
                                                       FStar_TypeChecker_Env.solver
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.solver);
                                                       FStar_TypeChecker_Env.range
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.range);
                                                       FStar_TypeChecker_Env.curmodule
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.curmodule);
                                                       FStar_TypeChecker_Env.gamma
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.gamma);
                                                       FStar_TypeChecker_Env.gamma_sig
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.gamma_sig);
                                                       FStar_TypeChecker_Env.gamma_cache
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.gamma_cache);
                                                       FStar_TypeChecker_Env.modules
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.modules);
                                                       FStar_TypeChecker_Env.expected_typ
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.expected_typ);
                                                       FStar_TypeChecker_Env.sigtab
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.sigtab);
                                                       FStar_TypeChecker_Env.attrtab
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.attrtab);
                                                       FStar_TypeChecker_Env.is_pattern
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.is_pattern);
                                                       FStar_TypeChecker_Env.instantiate_imp
                                                         = false;
                                                       FStar_TypeChecker_Env.effects
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.effects);
                                                       FStar_TypeChecker_Env.generalize
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.generalize);
                                                       FStar_TypeChecker_Env.letrecs
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.letrecs);
                                                       FStar_TypeChecker_Env.top_level
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.top_level);
                                                       FStar_TypeChecker_Env.check_uvars
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.check_uvars);
                                                       FStar_TypeChecker_Env.use_eq
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.use_eq);
                                                       FStar_TypeChecker_Env.is_iface
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.is_iface);
                                                       FStar_TypeChecker_Env.admit
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.admit);
                                                       FStar_TypeChecker_Env.lax
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.lax);
                                                       FStar_TypeChecker_Env.lax_universes
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.lax_universes);
                                                       FStar_TypeChecker_Env.phase1
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.phase1);
                                                       FStar_TypeChecker_Env.failhard
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.failhard);
                                                       FStar_TypeChecker_Env.nosynth
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.nosynth);
                                                       FStar_TypeChecker_Env.uvar_subtyping
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.uvar_subtyping);
                                                       FStar_TypeChecker_Env.tc_term
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.tc_term);
                                                       FStar_TypeChecker_Env.type_of
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.type_of);
                                                       FStar_TypeChecker_Env.universe_of
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.universe_of);
                                                       FStar_TypeChecker_Env.check_type_of
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.check_type_of);
                                                       FStar_TypeChecker_Env.use_bv_sorts
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.use_bv_sorts);
                                                       FStar_TypeChecker_Env.qtbl_name_and_index
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.qtbl_name_and_index);
                                                       FStar_TypeChecker_Env.normalized_eff_names
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.normalized_eff_names);
                                                       FStar_TypeChecker_Env.fv_delta_depths
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.fv_delta_depths);
                                                       FStar_TypeChecker_Env.proof_ns
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.proof_ns);
                                                       FStar_TypeChecker_Env.synth_hook
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.synth_hook);
                                                       FStar_TypeChecker_Env.splice
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.splice);
                                                       FStar_TypeChecker_Env.postprocess
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.postprocess);
                                                       FStar_TypeChecker_Env.is_native_tactic
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.is_native_tactic);
                                                       FStar_TypeChecker_Env.identifier_info
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.identifier_info);
                                                       FStar_TypeChecker_Env.tc_hooks
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.tc_hooks);
                                                       FStar_TypeChecker_Env.dsenv
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.dsenv);
                                                       FStar_TypeChecker_Env.nbe
                                                         =
                                                         (uu___379_2948.FStar_TypeChecker_Env.nbe)
                                                     }  in
                                                   ((let uu____2950 =
                                                       FStar_TypeChecker_Env.debug
                                                         env3
                                                         (FStar_Options.Other
                                                            "ED")
                                                        in
                                                     if uu____2950
                                                     then
                                                       let uu____2951 =
                                                         FStar_Ident.text_of_lid
                                                           act1.FStar_Syntax_Syntax.action_name
                                                          in
                                                       let uu____2952 =
                                                         FStar_Syntax_Print.term_to_string
                                                           act1.FStar_Syntax_Syntax.action_defn
                                                          in
                                                       let uu____2953 =
                                                         FStar_Syntax_Print.term_to_string
                                                           act_typ1
                                                          in
                                                       FStar_Util.print3
                                                         "Checking action %s:\n[definition]: %s\n[cps'd type]: %s\n"
                                                         uu____2951
                                                         uu____2952
                                                         uu____2953
                                                     else ());
                                                    (let uu____2955 =
                                                       FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term
                                                         env'
                                                         act1.FStar_Syntax_Syntax.action_defn
                                                        in
                                                     match uu____2955 with
                                                     | (act_defn,uu____2963,g_a)
                                                         ->
                                                         let act_defn1 =
                                                           FStar_TypeChecker_Normalize.normalize
                                                             [FStar_TypeChecker_Env.UnfoldUntil
                                                                FStar_Syntax_Syntax.delta_constant]
                                                             env3 act_defn
                                                            in
                                                         let act_typ2 =
                                                           FStar_TypeChecker_Normalize.normalize
                                                             [FStar_TypeChecker_Env.UnfoldUntil
                                                                FStar_Syntax_Syntax.delta_constant;
                                                             FStar_TypeChecker_Env.Eager_unfolding;
                                                             FStar_TypeChecker_Env.Beta]
                                                             env3 act_typ1
                                                            in
                                                         let uu____2967 =
                                                           let act_typ3 =
                                                             FStar_Syntax_Subst.compress
                                                               act_typ2
                                                              in
                                                           match act_typ3.FStar_Syntax_Syntax.n
                                                           with
                                                           | FStar_Syntax_Syntax.Tm_arrow
                                                               (bs,c) ->
                                                               let uu____3003
                                                                 =
                                                                 FStar_Syntax_Subst.open_comp
                                                                   bs c
                                                                  in
                                                               (match uu____3003
                                                                with
                                                                | (bs1,uu____3015)
                                                                    ->
                                                                    let res =
                                                                    mk_repr'
                                                                    FStar_Syntax_Syntax.tun
                                                                    FStar_Syntax_Syntax.tun
                                                                     in
                                                                    let k =
                                                                    let uu____3022
                                                                    =
                                                                    FStar_Syntax_Syntax.mk_Total
                                                                    res  in
                                                                    FStar_Syntax_Util.arrow
                                                                    bs1
                                                                    uu____3022
                                                                     in
                                                                    let uu____3025
                                                                    =
                                                                    FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term
                                                                    env3 k
                                                                     in
                                                                    (match uu____3025
                                                                    with
                                                                    | 
                                                                    (k1,uu____3039,g)
                                                                    ->
                                                                    (k1, g)))
                                                           | uu____3043 ->
                                                               let uu____3044
                                                                 =
                                                                 let uu____3049
                                                                   =
                                                                   let uu____3050
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    act_typ3
                                                                     in
                                                                   let uu____3051
                                                                    =
                                                                    FStar_Syntax_Print.tag_of_term
                                                                    act_typ3
                                                                     in
                                                                   FStar_Util.format2
                                                                    "Actions must have function types (not: %s, a.k.a. %s)"
                                                                    uu____3050
                                                                    uu____3051
                                                                    in
                                                                 (FStar_Errors.Fatal_ActionMustHaveFunctionType,
                                                                   uu____3049)
                                                                  in
                                                               FStar_Errors.raise_error
                                                                 uu____3044
                                                                 act_defn1.FStar_Syntax_Syntax.pos
                                                            in
                                                         (match uu____2967
                                                          with
                                                          | (expected_k,g_k)
                                                              ->
                                                              let g =
                                                                FStar_TypeChecker_Rel.teq
                                                                  env3
                                                                  act_typ2
                                                                  expected_k
                                                                 in
                                                              ((let uu____3066
                                                                  =
                                                                  let uu____3067
                                                                    =
                                                                    let uu____3068
                                                                    =
                                                                    FStar_TypeChecker_Env.conj_guard
                                                                    g_t g  in
                                                                    FStar_TypeChecker_Env.conj_guard
                                                                    g_k
                                                                    uu____3068
                                                                     in
                                                                  FStar_TypeChecker_Env.conj_guard
                                                                    g_a
                                                                    uu____3067
                                                                   in
                                                                FStar_TypeChecker_Rel.force_trivial_guard
                                                                  env3
                                                                  uu____3066);
                                                               (let act_typ3
                                                                  =
                                                                  let uu____3070
                                                                    =
                                                                    let uu____3071
                                                                    =
                                                                    FStar_Syntax_Subst.compress
                                                                    expected_k
                                                                     in
                                                                    uu____3071.FStar_Syntax_Syntax.n
                                                                     in
                                                                  match uu____3070
                                                                  with
                                                                  | FStar_Syntax_Syntax.Tm_arrow
                                                                    (bs,c) ->
                                                                    let uu____3096
                                                                    =
                                                                    FStar_Syntax_Subst.open_comp
                                                                    bs c  in
                                                                    (match uu____3096
                                                                    with
                                                                    | 
                                                                    (bs1,c1)
                                                                    ->
                                                                    let uu____3103
                                                                    =
                                                                    destruct_repr
                                                                    (FStar_Syntax_Util.comp_result
                                                                    c1)  in
                                                                    (match uu____3103
                                                                    with
                                                                    | 
                                                                    (a1,wp)
                                                                    ->
                                                                    let c2 =
                                                                    let uu____3123
                                                                    =
                                                                    let uu____3124
                                                                    =
                                                                    env3.FStar_TypeChecker_Env.universe_of
                                                                    env3 a1
                                                                     in
                                                                    [uu____3124]
                                                                     in
                                                                    let uu____3125
                                                                    =
                                                                    let uu____3136
                                                                    =
                                                                    FStar_Syntax_Syntax.as_arg
                                                                    wp  in
                                                                    [uu____3136]
                                                                     in
                                                                    {
                                                                    FStar_Syntax_Syntax.comp_univs
                                                                    =
                                                                    uu____3123;
                                                                    FStar_Syntax_Syntax.effect_name
                                                                    =
                                                                    (ed2.FStar_Syntax_Syntax.mname);
                                                                    FStar_Syntax_Syntax.result_typ
                                                                    = a1;
                                                                    FStar_Syntax_Syntax.effect_args
                                                                    =
                                                                    uu____3125;
                                                                    FStar_Syntax_Syntax.flags
                                                                    = []
                                                                    }  in
                                                                    let uu____3161
                                                                    =
                                                                    FStar_Syntax_Syntax.mk_Comp
                                                                    c2  in
                                                                    FStar_Syntax_Util.arrow
                                                                    bs1
                                                                    uu____3161))
                                                                  | uu____3164
                                                                    ->
                                                                    failwith
                                                                    "Impossible (expected_k is an arrow)"
                                                                   in
                                                                let uu____3165
                                                                  =
                                                                  if
                                                                    act1.FStar_Syntax_Syntax.action_univs
                                                                    = []
                                                                  then
                                                                    FStar_TypeChecker_Util.generalize_universes
                                                                    env3
                                                                    act_defn1
                                                                  else
                                                                    (
                                                                    let uu____3185
                                                                    =
                                                                    FStar_Syntax_Subst.close_univ_vars
                                                                    act1.FStar_Syntax_Syntax.action_univs
                                                                    act_defn1
                                                                     in
                                                                    ((act1.FStar_Syntax_Syntax.action_univs),
                                                                    uu____3185))
                                                                   in
                                                                match uu____3165
                                                                with
                                                                | (univs1,act_defn2)
                                                                    ->
                                                                    let act_typ4
                                                                    =
                                                                    FStar_TypeChecker_Normalize.normalize
                                                                    [FStar_TypeChecker_Env.Beta]
                                                                    env3
                                                                    act_typ3
                                                                     in
                                                                    let act_typ5
                                                                    =
                                                                    FStar_Syntax_Subst.close_univ_vars
                                                                    univs1
                                                                    act_typ4
                                                                     in
                                                                    let uu___380_3204
                                                                    = act1
                                                                     in
                                                                    {
                                                                    FStar_Syntax_Syntax.action_name
                                                                    =
                                                                    (uu___380_3204.FStar_Syntax_Syntax.action_name);
                                                                    FStar_Syntax_Syntax.action_unqualified_name
                                                                    =
                                                                    (uu___380_3204.FStar_Syntax_Syntax.action_unqualified_name);
                                                                    FStar_Syntax_Syntax.action_univs
                                                                    = univs1;
                                                                    FStar_Syntax_Syntax.action_params
                                                                    =
                                                                    (uu___380_3204.FStar_Syntax_Syntax.action_params);
                                                                    FStar_Syntax_Syntax.action_defn
                                                                    =
                                                                    act_defn2;
                                                                    FStar_Syntax_Syntax.action_typ
                                                                    =
                                                                    act_typ5
                                                                    }))))))
                                           in
                                        FStar_All.pipe_right
                                          ed2.FStar_Syntax_Syntax.actions
                                          (FStar_List.map check_action)
                                         in
                                      (repr, bind_repr, return_repr, actions)
                                   in
                                match uu____1898 with
                                | (repr,bind_repr,return_repr,actions) ->
                                    let t0 =
                                      let uu____3228 =
                                        FStar_Syntax_Syntax.mk_Total
                                          ed2.FStar_Syntax_Syntax.signature
                                         in
                                      FStar_Syntax_Util.arrow
                                        ed2.FStar_Syntax_Syntax.binders
                                        uu____3228
                                       in
                                    let uu____3231 =
                                      let uu____3236 =
                                        FStar_TypeChecker_Util.generalize_universes
                                          env0 t0
                                         in
                                      match uu____3236 with
                                      | (gen_univs,t) ->
                                          (match annotated_univ_names with
                                           | [] -> (gen_univs, t)
                                           | uu____3255 ->
                                               let uu____3258 =
                                                 ((FStar_List.length
                                                     gen_univs)
                                                    =
                                                    (FStar_List.length
                                                       annotated_univ_names))
                                                   &&
                                                   (FStar_List.forall2
                                                      (fun u1  ->
                                                         fun u2  ->
                                                           let uu____3264 =
                                                             FStar_Syntax_Syntax.order_univ_name
                                                               u1 u2
                                                              in
                                                           uu____3264 =
                                                             (Prims.parse_int "0"))
                                                      gen_univs
                                                      annotated_univ_names)
                                                  in
                                               if uu____3258
                                               then (gen_univs, t)
                                               else
                                                 (let uu____3270 =
                                                    let uu____3275 =
                                                      let uu____3276 =
                                                        FStar_Util.string_of_int
                                                          (FStar_List.length
                                                             annotated_univ_names)
                                                         in
                                                      let uu____3277 =
                                                        FStar_Util.string_of_int
                                                          (FStar_List.length
                                                             gen_univs)
                                                         in
                                                      FStar_Util.format2
                                                        "Expected an effect definition with %s universes; but found %s"
                                                        uu____3276 uu____3277
                                                       in
                                                    (FStar_Errors.Fatal_UnexpectedNumberOfUniverse,
                                                      uu____3275)
                                                     in
                                                  FStar_Errors.raise_error
                                                    uu____3270
                                                    (ed2.FStar_Syntax_Syntax.signature).FStar_Syntax_Syntax.pos))
                                       in
                                    (match uu____3231 with
                                     | (univs1,t) ->
                                         let signature1 =
                                           let uu____3285 =
                                             let uu____3298 =
                                               let uu____3299 =
                                                 FStar_Syntax_Subst.compress
                                                   t
                                                  in
                                               uu____3299.FStar_Syntax_Syntax.n
                                                in
                                             (effect_params, uu____3298)  in
                                           match uu____3285 with
                                           | ([],uu____3310) -> t
                                           | (uu____3325,FStar_Syntax_Syntax.Tm_arrow
                                              (uu____3326,c)) ->
                                               FStar_Syntax_Util.comp_result
                                                 c
                                           | uu____3364 ->
                                               failwith
                                                 "Impossible : t is an arrow"
                                            in
                                         let close1 n1 ts =
                                           let ts1 =
                                             let uu____3389 =
                                               FStar_Syntax_Subst.close_tscheme
                                                 effect_params ts
                                                in
                                             FStar_Syntax_Subst.close_univ_vars_tscheme
                                               univs1 uu____3389
                                              in
                                           let m =
                                             FStar_List.length
                                               (FStar_Pervasives_Native.fst
                                                  ts1)
                                              in
                                           (let uu____3396 =
                                              ((n1 >= (Prims.parse_int "0"))
                                                 &&
                                                 (let uu____3398 =
                                                    FStar_Syntax_Util.is_unknown
                                                      (FStar_Pervasives_Native.snd
                                                         ts1)
                                                     in
                                                  Prims.op_Negation
                                                    uu____3398))
                                                && (m <> n1)
                                               in
                                            if uu____3396
                                            then
                                              let error =
                                                if m < n1
                                                then
                                                  "not universe-polymorphic enough"
                                                else
                                                  "too universe-polymorphic"
                                                 in
                                              let err_msg =
                                                let uu____3416 =
                                                  FStar_Util.string_of_int m
                                                   in
                                                let uu____3423 =
                                                  FStar_Util.string_of_int n1
                                                   in
                                                let uu____3424 =
                                                  FStar_Syntax_Print.tscheme_to_string
                                                    ts1
                                                   in
                                                FStar_Util.format4
                                                  "The effect combinator is %s (m,n=%s,%s) (%s)"
                                                  error uu____3416 uu____3423
                                                  uu____3424
                                                 in
                                              FStar_Errors.raise_error
                                                (FStar_Errors.Fatal_MismatchUniversePolymorphic,
                                                  err_msg)
                                                (FStar_Pervasives_Native.snd
                                                   ts1).FStar_Syntax_Syntax.pos
                                            else ());
                                           ts1  in
                                         let close_action act =
                                           let uu____3436 =
                                             close1
                                               (~- (Prims.parse_int "1"))
                                               ((act.FStar_Syntax_Syntax.action_univs),
                                                 (act.FStar_Syntax_Syntax.action_defn))
                                              in
                                           match uu____3436 with
                                           | (univs2,defn) ->
                                               let uu____3451 =
                                                 close1
                                                   (~- (Prims.parse_int "1"))
                                                   ((act.FStar_Syntax_Syntax.action_univs),
                                                     (act.FStar_Syntax_Syntax.action_typ))
                                                  in
                                               (match uu____3451 with
                                                | (univs',typ) ->
                                                    let uu___381_3467 = act
                                                       in
                                                    {
                                                      FStar_Syntax_Syntax.action_name
                                                        =
                                                        (uu___381_3467.FStar_Syntax_Syntax.action_name);
                                                      FStar_Syntax_Syntax.action_unqualified_name
                                                        =
                                                        (uu___381_3467.FStar_Syntax_Syntax.action_unqualified_name);
                                                      FStar_Syntax_Syntax.action_univs
                                                        = univs2;
                                                      FStar_Syntax_Syntax.action_params
                                                        =
                                                        (uu___381_3467.FStar_Syntax_Syntax.action_params);
                                                      FStar_Syntax_Syntax.action_defn
                                                        = defn;
                                                      FStar_Syntax_Syntax.action_typ
                                                        = typ
                                                    })
                                            in
                                         let ed3 =
                                           let uu___382_3470 = ed2  in
                                           let uu____3471 =
                                             close1 (Prims.parse_int "0")
                                               return_wp
                                              in
                                           let uu____3472 =
                                             close1 (Prims.parse_int "1")
                                               bind_wp
                                              in
                                           let uu____3473 =
                                             close1 (Prims.parse_int "0")
                                               if_then_else1
                                              in
                                           let uu____3474 =
                                             close1 (Prims.parse_int "0")
                                               ite_wp
                                              in
                                           let uu____3475 =
                                             close1 (Prims.parse_int "0")
                                               stronger
                                              in
                                           let uu____3476 =
                                             close1 (Prims.parse_int "1")
                                               close_wp
                                              in
                                           let uu____3477 =
                                             close1 (Prims.parse_int "0")
                                               assert_p
                                              in
                                           let uu____3478 =
                                             close1 (Prims.parse_int "0")
                                               assume_p
                                              in
                                           let uu____3479 =
                                             close1 (Prims.parse_int "0")
                                               null_wp
                                              in
                                           let uu____3480 =
                                             close1 (Prims.parse_int "0")
                                               trivial_wp
                                              in
                                           let uu____3481 =
                                             let uu____3482 =
                                               close1 (Prims.parse_int "0")
                                                 ([], repr)
                                                in
                                             FStar_Pervasives_Native.snd
                                               uu____3482
                                              in
                                           let uu____3499 =
                                             close1 (Prims.parse_int "0")
                                               return_repr
                                              in
                                           let uu____3500 =
                                             close1 (Prims.parse_int "1")
                                               bind_repr
                                              in
                                           let uu____3501 =
                                             FStar_List.map close_action
                                               actions
                                              in
                                           {
                                             FStar_Syntax_Syntax.cattributes
                                               =
                                               (uu___382_3470.FStar_Syntax_Syntax.cattributes);
                                             FStar_Syntax_Syntax.mname =
                                               (uu___382_3470.FStar_Syntax_Syntax.mname);
                                             FStar_Syntax_Syntax.univs =
                                               univs1;
                                             FStar_Syntax_Syntax.binders =
                                               effect_params;
                                             FStar_Syntax_Syntax.signature =
                                               signature1;
                                             FStar_Syntax_Syntax.ret_wp =
                                               uu____3471;
                                             FStar_Syntax_Syntax.bind_wp =
                                               uu____3472;
                                             FStar_Syntax_Syntax.if_then_else
                                               = uu____3473;
                                             FStar_Syntax_Syntax.ite_wp =
                                               uu____3474;
                                             FStar_Syntax_Syntax.stronger =
                                               uu____3475;
                                             FStar_Syntax_Syntax.close_wp =
                                               uu____3476;
                                             FStar_Syntax_Syntax.assert_p =
                                               uu____3477;
                                             FStar_Syntax_Syntax.assume_p =
                                               uu____3478;
                                             FStar_Syntax_Syntax.null_wp =
                                               uu____3479;
                                             FStar_Syntax_Syntax.trivial =
                                               uu____3480;
                                             FStar_Syntax_Syntax.repr =
                                               uu____3481;
                                             FStar_Syntax_Syntax.return_repr
                                               = uu____3499;
                                             FStar_Syntax_Syntax.bind_repr =
                                               uu____3500;
                                             FStar_Syntax_Syntax.actions =
                                               uu____3501;
                                             FStar_Syntax_Syntax.eff_attrs =
                                               (uu___382_3470.FStar_Syntax_Syntax.eff_attrs)
                                           }  in
                                         ((let uu____3505 =
                                             (FStar_TypeChecker_Env.debug
                                                env2 FStar_Options.Low)
                                               ||
                                               (FStar_All.pipe_left
                                                  (FStar_TypeChecker_Env.debug
                                                     env2)
                                                  (FStar_Options.Other "ED"))
                                              in
                                           if uu____3505
                                           then
                                             let uu____3506 =
                                               FStar_Syntax_Print.eff_decl_to_string
                                                 false ed3
                                                in
                                             FStar_Util.print_string
                                               uu____3506
                                           else ());
                                          ed3))))))))
  
let (cps_and_elaborate :
  FStar_TypeChecker_Env.env_t ->
    FStar_Syntax_Syntax.eff_decl ->
      (FStar_Syntax_Syntax.sigelt Prims.list,FStar_Syntax_Syntax.eff_decl,
        FStar_Syntax_Syntax.sigelt FStar_Pervasives_Native.option)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun ed  ->
      let uu____3528 =
        FStar_Syntax_Subst.open_term ed.FStar_Syntax_Syntax.binders
          ed.FStar_Syntax_Syntax.signature
         in
      match uu____3528 with
      | (effect_binders_un,signature_un) ->
          let uu____3545 =
            FStar_TypeChecker_TcTerm.tc_tparams env effect_binders_un  in
          (match uu____3545 with
           | (effect_binders,env1,uu____3564) ->
               let uu____3565 =
                 FStar_TypeChecker_TcTerm.tc_trivial_guard env1 signature_un
                  in
               (match uu____3565 with
                | (signature,uu____3581) ->
                    let raise_error1 uu____3596 =
                      match uu____3596 with
                      | (e,err_msg) ->
                          FStar_Errors.raise_error (e, err_msg)
                            signature.FStar_Syntax_Syntax.pos
                       in
                    let effect_binders1 =
                      FStar_List.map
                        (fun uu____3628  ->
                           match uu____3628 with
                           | (bv,qual) ->
                               let uu____3647 =
                                 let uu___383_3648 = bv  in
                                 let uu____3649 =
                                   FStar_TypeChecker_Normalize.normalize
                                     [FStar_TypeChecker_Env.EraseUniverses]
                                     env1 bv.FStar_Syntax_Syntax.sort
                                    in
                                 {
                                   FStar_Syntax_Syntax.ppname =
                                     (uu___383_3648.FStar_Syntax_Syntax.ppname);
                                   FStar_Syntax_Syntax.index =
                                     (uu___383_3648.FStar_Syntax_Syntax.index);
                                   FStar_Syntax_Syntax.sort = uu____3649
                                 }  in
                               (uu____3647, qual)) effect_binders
                       in
                    let uu____3654 =
                      let uu____3661 =
                        let uu____3662 =
                          FStar_Syntax_Subst.compress signature_un  in
                        uu____3662.FStar_Syntax_Syntax.n  in
                      match uu____3661 with
                      | FStar_Syntax_Syntax.Tm_arrow
                          ((a,uu____3672)::[],effect_marker) ->
                          (a, effect_marker)
                      | uu____3704 ->
                          raise_error1
                            (FStar_Errors.Fatal_BadSignatureShape,
                              "bad shape for effect-for-free signature")
                       in
                    (match uu____3654 with
                     | (a,effect_marker) ->
                         let a1 =
                           let uu____3728 = FStar_Syntax_Syntax.is_null_bv a
                              in
                           if uu____3728
                           then
                             let uu____3729 =
                               let uu____3732 =
                                 FStar_Syntax_Syntax.range_of_bv a  in
                               FStar_Pervasives_Native.Some uu____3732  in
                             FStar_Syntax_Syntax.gen_bv "a" uu____3729
                               a.FStar_Syntax_Syntax.sort
                           else a  in
                         let open_and_check env2 other_binders t =
                           let subst1 =
                             FStar_Syntax_Subst.opening_of_binders
                               (FStar_List.append effect_binders1
                                  other_binders)
                              in
                           let t1 = FStar_Syntax_Subst.subst subst1 t  in
                           let uu____3778 =
                             FStar_TypeChecker_TcTerm.tc_term env2 t1  in
                           match uu____3778 with
                           | (t2,comp,uu____3791) -> (t2, comp)  in
                         let mk1 x =
                           FStar_Syntax_Syntax.mk x
                             FStar_Pervasives_Native.None
                             signature.FStar_Syntax_Syntax.pos
                            in
                         let uu____3800 =
                           open_and_check env1 [] ed.FStar_Syntax_Syntax.repr
                            in
                         (match uu____3800 with
                          | (repr,_comp) ->
                              ((let uu____3824 =
                                  FStar_TypeChecker_Env.debug env1
                                    (FStar_Options.Other "ED")
                                   in
                                if uu____3824
                                then
                                  let uu____3825 =
                                    FStar_Syntax_Print.term_to_string repr
                                     in
                                  FStar_Util.print1 "Representation is: %s\n"
                                    uu____3825
                                else ());
                               (let dmff_env =
                                  FStar_TypeChecker_DMFF.empty env1
                                    (FStar_TypeChecker_TcTerm.tc_constant
                                       env1 FStar_Range.dummyRange)
                                   in
                                let wp_type =
                                  FStar_TypeChecker_DMFF.star_type dmff_env
                                    repr
                                   in
                                let uu____3829 =
                                  recheck_debug "*" env1 wp_type  in
                                let wp_a =
                                  let uu____3831 =
                                    let uu____3832 =
                                      let uu____3833 =
                                        let uu____3850 =
                                          let uu____3861 =
                                            let uu____3870 =
                                              FStar_Syntax_Syntax.bv_to_name
                                                a1
                                               in
                                            let uu____3873 =
                                              FStar_Syntax_Syntax.as_implicit
                                                false
                                               in
                                            (uu____3870, uu____3873)  in
                                          [uu____3861]  in
                                        (wp_type, uu____3850)  in
                                      FStar_Syntax_Syntax.Tm_app uu____3833
                                       in
                                    mk1 uu____3832  in
                                  FStar_TypeChecker_Normalize.normalize
                                    [FStar_TypeChecker_Env.Beta] env1
                                    uu____3831
                                   in
                                let effect_signature =
                                  let binders =
                                    let uu____3920 =
                                      let uu____3927 =
                                        FStar_Syntax_Syntax.as_implicit false
                                         in
                                      (a1, uu____3927)  in
                                    let uu____3932 =
                                      let uu____3941 =
                                        let uu____3948 =
                                          FStar_Syntax_Syntax.gen_bv
                                            "dijkstra_wp"
                                            FStar_Pervasives_Native.None wp_a
                                           in
                                        FStar_All.pipe_right uu____3948
                                          FStar_Syntax_Syntax.mk_binder
                                         in
                                      [uu____3941]  in
                                    uu____3920 :: uu____3932  in
                                  let binders1 =
                                    FStar_Syntax_Subst.close_binders binders
                                     in
                                  mk1
                                    (FStar_Syntax_Syntax.Tm_arrow
                                       (binders1, effect_marker))
                                   in
                                let uu____3984 =
                                  recheck_debug
                                    "turned into the effect signature" env1
                                    effect_signature
                                   in
                                let sigelts = FStar_Util.mk_ref []  in
                                let mk_lid name =
                                  FStar_Syntax_Util.dm4f_lid ed name  in
                                let elaborate_and_star dmff_env1
                                  other_binders item =
                                  let env2 =
                                    FStar_TypeChecker_DMFF.get_env dmff_env1
                                     in
                                  let uu____4047 = item  in
                                  match uu____4047 with
                                  | (u_item,item1) ->
                                      let uu____4062 =
                                        open_and_check env2 other_binders
                                          item1
                                         in
                                      (match uu____4062 with
                                       | (item2,item_comp) ->
                                           ((let uu____4078 =
                                               let uu____4079 =
                                                 FStar_Syntax_Util.is_total_lcomp
                                                   item_comp
                                                  in
                                               Prims.op_Negation uu____4079
                                                in
                                             if uu____4078
                                             then
                                               let uu____4080 =
                                                 let uu____4085 =
                                                   let uu____4086 =
                                                     FStar_Syntax_Print.term_to_string
                                                       item2
                                                      in
                                                   let uu____4087 =
                                                     FStar_Syntax_Print.lcomp_to_string
                                                       item_comp
                                                      in
                                                   FStar_Util.format2
                                                     "Computation for [%s] is not total : %s !"
                                                     uu____4086 uu____4087
                                                    in
                                                 (FStar_Errors.Fatal_ComputationNotTotal,
                                                   uu____4085)
                                                  in
                                               FStar_Errors.raise_err
                                                 uu____4080
                                             else ());
                                            (let uu____4089 =
                                               FStar_TypeChecker_DMFF.star_expr
                                                 dmff_env1 item2
                                                in
                                             match uu____4089 with
                                             | (item_t,item_wp,item_elab) ->
                                                 let uu____4107 =
                                                   recheck_debug "*" env2
                                                     item_wp
                                                    in
                                                 let uu____4108 =
                                                   recheck_debug "_" env2
                                                     item_elab
                                                    in
                                                 (dmff_env1, item_t, item_wp,
                                                   item_elab))))
                                   in
                                let uu____4109 =
                                  elaborate_and_star dmff_env []
                                    ed.FStar_Syntax_Syntax.bind_repr
                                   in
                                match uu____4109 with
                                | (dmff_env1,uu____4135,bind_wp,bind_elab) ->
                                    let uu____4138 =
                                      elaborate_and_star dmff_env1 []
                                        ed.FStar_Syntax_Syntax.return_repr
                                       in
                                    (match uu____4138 with
                                     | (dmff_env2,uu____4164,return_wp,return_elab)
                                         ->
                                         let rc_gtot =
                                           {
                                             FStar_Syntax_Syntax.residual_effect
                                               =
                                               FStar_Parser_Const.effect_GTot_lid;
                                             FStar_Syntax_Syntax.residual_typ
                                               = FStar_Pervasives_Native.None;
                                             FStar_Syntax_Syntax.residual_flags
                                               = []
                                           }  in
                                         let lift_from_pure_wp =
                                           let uu____4173 =
                                             let uu____4174 =
                                               FStar_Syntax_Subst.compress
                                                 return_wp
                                                in
                                             uu____4174.FStar_Syntax_Syntax.n
                                              in
                                           match uu____4173 with
                                           | FStar_Syntax_Syntax.Tm_abs
                                               (b1::b2::bs,body,what) ->
                                               let uu____4232 =
                                                 let uu____4251 =
                                                   let uu____4256 =
                                                     FStar_Syntax_Util.abs bs
                                                       body
                                                       FStar_Pervasives_Native.None
                                                      in
                                                   FStar_Syntax_Subst.open_term
                                                     [b1; b2] uu____4256
                                                    in
                                                 match uu____4251 with
                                                 | (b11::b21::[],body1) ->
                                                     (b11, b21, body1)
                                                 | uu____4338 ->
                                                     failwith
                                                       "Impossible : open_term not preserving binders arity"
                                                  in
                                               (match uu____4232 with
                                                | (b11,b21,body1) ->
                                                    let env0 =
                                                      let uu____4391 =
                                                        FStar_TypeChecker_DMFF.get_env
                                                          dmff_env2
                                                         in
                                                      FStar_TypeChecker_Env.push_binders
                                                        uu____4391 [b11; b21]
                                                       in
                                                    let wp_b1 =
                                                      let raw_wp_b1 =
                                                        let uu____4414 =
                                                          let uu____4415 =
                                                            let uu____4432 =
                                                              let uu____4443
                                                                =
                                                                let uu____4452
                                                                  =
                                                                  FStar_Syntax_Syntax.bv_to_name
                                                                    (
                                                                    FStar_Pervasives_Native.fst
                                                                    b11)
                                                                   in
                                                                let uu____4457
                                                                  =
                                                                  FStar_Syntax_Syntax.as_implicit
                                                                    false
                                                                   in
                                                                (uu____4452,
                                                                  uu____4457)
                                                                 in
                                                              [uu____4443]
                                                               in
                                                            (wp_type,
                                                              uu____4432)
                                                             in
                                                          FStar_Syntax_Syntax.Tm_app
                                                            uu____4415
                                                           in
                                                        mk1 uu____4414  in
                                                      FStar_TypeChecker_Normalize.normalize
                                                        [FStar_TypeChecker_Env.Beta]
                                                        env0 raw_wp_b1
                                                       in
                                                    let uu____4492 =
                                                      let uu____4501 =
                                                        let uu____4502 =
                                                          FStar_Syntax_Util.unascribe
                                                            wp_b1
                                                           in
                                                        FStar_TypeChecker_Normalize.eta_expand_with_type
                                                          env0 body1
                                                          uu____4502
                                                         in
                                                      FStar_All.pipe_left
                                                        FStar_Syntax_Util.abs_formals
                                                        uu____4501
                                                       in
                                                    (match uu____4492 with
                                                     | (bs1,body2,what') ->
                                                         let fail1 uu____4525
                                                           =
                                                           let error_msg =
                                                             let uu____4527 =
                                                               FStar_Syntax_Print.term_to_string
                                                                 body2
                                                                in
                                                             let uu____4528 =
                                                               match what'
                                                               with
                                                               | FStar_Pervasives_Native.None
                                                                    -> "None"
                                                               | FStar_Pervasives_Native.Some
                                                                   rc ->
                                                                   FStar_Ident.text_of_lid
                                                                    rc.FStar_Syntax_Syntax.residual_effect
                                                                in
                                                             FStar_Util.format2
                                                               "The body of return_wp (%s) should be of type Type0 but is of type %s"
                                                               uu____4527
                                                               uu____4528
                                                              in
                                                           raise_error1
                                                             (FStar_Errors.Fatal_WrongBodyTypeForReturnWP,
                                                               error_msg)
                                                            in
                                                         ((match what' with
                                                           | FStar_Pervasives_Native.None
                                                                -> fail1 ()
                                                           | FStar_Pervasives_Native.Some
                                                               rc ->
                                                               ((let uu____4533
                                                                   =
                                                                   let uu____4534
                                                                    =
                                                                    FStar_Syntax_Util.is_pure_effect
                                                                    rc.FStar_Syntax_Syntax.residual_effect
                                                                     in
                                                                   Prims.op_Negation
                                                                    uu____4534
                                                                    in
                                                                 if
                                                                   uu____4533
                                                                 then
                                                                   fail1 ()
                                                                 else ());
                                                                (let uu____4536
                                                                   =
                                                                   FStar_Util.map_opt
                                                                    rc.FStar_Syntax_Syntax.residual_typ
                                                                    (fun rt 
                                                                    ->
                                                                    let g_opt
                                                                    =
                                                                    FStar_TypeChecker_Rel.try_teq
                                                                    true env1
                                                                    rt
                                                                    FStar_Syntax_Util.ktype0
                                                                     in
                                                                    match g_opt
                                                                    with
                                                                    | 
                                                                    FStar_Pervasives_Native.Some
                                                                    g' ->
                                                                    FStar_TypeChecker_Rel.force_trivial_guard
                                                                    env1 g'
                                                                    | 
                                                                    FStar_Pervasives_Native.None
                                                                     ->
                                                                    fail1 ())
                                                                    in
                                                                 FStar_All.pipe_right
                                                                   uu____4536
                                                                   (fun a229 
                                                                    -> ()))));
                                                          (let wp =
                                                             let t2 =
                                                               (FStar_Pervasives_Native.fst
                                                                  b21).FStar_Syntax_Syntax.sort
                                                                in
                                                             let pure_wp_type
                                                               =
                                                               FStar_TypeChecker_DMFF.double_star
                                                                 t2
                                                                in
                                                             FStar_Syntax_Syntax.gen_bv
                                                               "wp"
                                                               FStar_Pervasives_Native.None
                                                               pure_wp_type
                                                              in
                                                           let body3 =
                                                             let uu____4563 =
                                                               let uu____4568
                                                                 =
                                                                 FStar_Syntax_Syntax.bv_to_name
                                                                   wp
                                                                  in
                                                               let uu____4569
                                                                 =
                                                                 let uu____4570
                                                                   =
                                                                   let uu____4579
                                                                    =
                                                                    FStar_Syntax_Util.abs
                                                                    [b21]
                                                                    body2
                                                                    what'  in
                                                                   (uu____4579,
                                                                    FStar_Pervasives_Native.None)
                                                                    in
                                                                 [uu____4570]
                                                                  in
                                                               FStar_Syntax_Syntax.mk_Tm_app
                                                                 uu____4568
                                                                 uu____4569
                                                                in
                                                             uu____4563
                                                               FStar_Pervasives_Native.None
                                                               FStar_Range.dummyRange
                                                              in
                                                           let uu____4616 =
                                                             let uu____4617 =
                                                               let uu____4626
                                                                 =
                                                                 FStar_Syntax_Syntax.mk_binder
                                                                   wp
                                                                  in
                                                               [uu____4626]
                                                                in
                                                             b11 ::
                                                               uu____4617
                                                              in
                                                           let uu____4651 =
                                                             FStar_Syntax_Util.abs
                                                               bs1 body3 what
                                                              in
                                                           FStar_Syntax_Util.abs
                                                             uu____4616
                                                             uu____4651
                                                             (FStar_Pervasives_Native.Some
                                                                rc_gtot)))))
                                           | uu____4654 ->
                                               raise_error1
                                                 (FStar_Errors.Fatal_UnexpectedReturnShape,
                                                   "unexpected shape for return")
                                            in
                                         let return_wp1 =
                                           let uu____4660 =
                                             let uu____4661 =
                                               FStar_Syntax_Subst.compress
                                                 return_wp
                                                in
                                             uu____4661.FStar_Syntax_Syntax.n
                                              in
                                           match uu____4660 with
                                           | FStar_Syntax_Syntax.Tm_abs
                                               (b1::b2::bs,body,what) ->
                                               let uu____4719 =
                                                 FStar_Syntax_Util.abs bs
                                                   body what
                                                  in
                                               FStar_Syntax_Util.abs 
                                                 [b1; b2] uu____4719
                                                 (FStar_Pervasives_Native.Some
                                                    rc_gtot)
                                           | uu____4740 ->
                                               raise_error1
                                                 (FStar_Errors.Fatal_UnexpectedReturnShape,
                                                   "unexpected shape for return")
                                            in
                                         let bind_wp1 =
                                           let uu____4746 =
                                             let uu____4747 =
                                               FStar_Syntax_Subst.compress
                                                 bind_wp
                                                in
                                             uu____4747.FStar_Syntax_Syntax.n
                                              in
                                           match uu____4746 with
                                           | FStar_Syntax_Syntax.Tm_abs
                                               (binders,body,what) ->
                                               let r =
                                                 FStar_Syntax_Syntax.lid_as_fv
                                                   FStar_Parser_Const.range_lid
                                                   (FStar_Syntax_Syntax.Delta_constant_at_level
                                                      (Prims.parse_int "1"))
                                                   FStar_Pervasives_Native.None
                                                  in
                                               let uu____4780 =
                                                 let uu____4781 =
                                                   let uu____4790 =
                                                     let uu____4797 =
                                                       mk1
                                                         (FStar_Syntax_Syntax.Tm_fvar
                                                            r)
                                                        in
                                                     FStar_Syntax_Syntax.null_binder
                                                       uu____4797
                                                      in
                                                   [uu____4790]  in
                                                 FStar_List.append uu____4781
                                                   binders
                                                  in
                                               FStar_Syntax_Util.abs
                                                 uu____4780 body what
                                           | uu____4816 ->
                                               raise_error1
                                                 (FStar_Errors.Fatal_UnexpectedBindShape,
                                                   "unexpected shape for bind")
                                            in
                                         let apply_close t =
                                           if
                                             (FStar_List.length
                                                effect_binders1)
                                               = (Prims.parse_int "0")
                                           then t
                                           else
                                             (let uu____4840 =
                                                let uu____4841 =
                                                  let uu____4842 =
                                                    let uu____4859 =
                                                      let uu____4870 =
                                                        FStar_Syntax_Util.args_of_binders
                                                          effect_binders1
                                                         in
                                                      FStar_Pervasives_Native.snd
                                                        uu____4870
                                                       in
                                                    (t, uu____4859)  in
                                                  FStar_Syntax_Syntax.Tm_app
                                                    uu____4842
                                                   in
                                                mk1 uu____4841  in
                                              FStar_Syntax_Subst.close
                                                effect_binders1 uu____4840)
                                            in
                                         let rec apply_last1 f l =
                                           match l with
                                           | [] -> failwith "empty path.."
                                           | a2::[] ->
                                               let uu____4914 = f a2  in
                                               [uu____4914]
                                           | x::xs ->
                                               let uu____4919 =
                                                 apply_last1 f xs  in
                                               x :: uu____4919
                                            in
                                         let register name item =
                                           let p =
                                             FStar_Ident.path_of_lid
                                               ed.FStar_Syntax_Syntax.mname
                                              in
                                           let p' =
                                             apply_last1
                                               (fun s  ->
                                                  Prims.strcat "__"
                                                    (Prims.strcat s
                                                       (Prims.strcat
                                                          "_eff_override_"
                                                          name))) p
                                              in
                                           let l' =
                                             FStar_Ident.lid_of_path p'
                                               FStar_Range.dummyRange
                                              in
                                           let uu____4945 =
                                             FStar_TypeChecker_Env.try_lookup_lid
                                               env1 l'
                                              in
                                           match uu____4945 with
                                           | FStar_Pervasives_Native.Some
                                               (_us,_t) ->
                                               ((let uu____4975 =
                                                   FStar_Options.debug_any ()
                                                    in
                                                 if uu____4975
                                                 then
                                                   let uu____4976 =
                                                     FStar_Ident.string_of_lid
                                                       l'
                                                      in
                                                   FStar_Util.print1
                                                     "DM4F: Applying override %s\n"
                                                     uu____4976
                                                 else ());
                                                (let uu____4978 =
                                                   FStar_Syntax_Syntax.lid_as_fv
                                                     l'
                                                     FStar_Syntax_Syntax.delta_equational
                                                     FStar_Pervasives_Native.None
                                                    in
                                                 FStar_Syntax_Syntax.fv_to_tm
                                                   uu____4978))
                                           | FStar_Pervasives_Native.None  ->
                                               let uu____4987 =
                                                 let uu____4992 = mk_lid name
                                                    in
                                                 let uu____4993 =
                                                   FStar_Syntax_Util.abs
                                                     effect_binders1 item
                                                     FStar_Pervasives_Native.None
                                                    in
                                                 FStar_TypeChecker_Util.mk_toplevel_definition
                                                   env1 uu____4992 uu____4993
                                                  in
                                               (match uu____4987 with
                                                | (sigelt,fv) ->
                                                    ((let uu____4997 =
                                                        let uu____5000 =
                                                          FStar_ST.op_Bang
                                                            sigelts
                                                           in
                                                        sigelt :: uu____5000
                                                         in
                                                      FStar_ST.op_Colon_Equals
                                                        sigelts uu____4997);
                                                     fv))
                                            in
                                         let lift_from_pure_wp1 =
                                           register "lift_from_pure"
                                             lift_from_pure_wp
                                            in
                                         let return_wp2 =
                                           register "return_wp" return_wp1
                                            in
                                         ((let uu____5096 =
                                             let uu____5099 =
                                               FStar_Syntax_Syntax.mk_sigelt
                                                 (FStar_Syntax_Syntax.Sig_pragma
                                                    (FStar_Syntax_Syntax.PushOptions
                                                       (FStar_Pervasives_Native.Some
                                                          "--admit_smt_queries true")))
                                                in
                                             let uu____5100 =
                                               FStar_ST.op_Bang sigelts  in
                                             uu____5099 :: uu____5100  in
                                           FStar_ST.op_Colon_Equals sigelts
                                             uu____5096);
                                          (let return_elab1 =
                                             register "return_elab"
                                               return_elab
                                              in
                                           (let uu____5195 =
                                              let uu____5198 =
                                                FStar_Syntax_Syntax.mk_sigelt
                                                  (FStar_Syntax_Syntax.Sig_pragma
                                                     FStar_Syntax_Syntax.PopOptions)
                                                 in
                                              let uu____5199 =
                                                FStar_ST.op_Bang sigelts  in
                                              uu____5198 :: uu____5199  in
                                            FStar_ST.op_Colon_Equals sigelts
                                              uu____5195);
                                           (let bind_wp2 =
                                              register "bind_wp" bind_wp1  in
                                            (let uu____5294 =
                                               let uu____5297 =
                                                 FStar_Syntax_Syntax.mk_sigelt
                                                   (FStar_Syntax_Syntax.Sig_pragma
                                                      (FStar_Syntax_Syntax.PushOptions
                                                         (FStar_Pervasives_Native.Some
                                                            "--admit_smt_queries true")))
                                                  in
                                               let uu____5298 =
                                                 FStar_ST.op_Bang sigelts  in
                                               uu____5297 :: uu____5298  in
                                             FStar_ST.op_Colon_Equals sigelts
                                               uu____5294);
                                            (let bind_elab1 =
                                               register "bind_elab" bind_elab
                                                in
                                             (let uu____5393 =
                                                let uu____5396 =
                                                  FStar_Syntax_Syntax.mk_sigelt
                                                    (FStar_Syntax_Syntax.Sig_pragma
                                                       FStar_Syntax_Syntax.PopOptions)
                                                   in
                                                let uu____5397 =
                                                  FStar_ST.op_Bang sigelts
                                                   in
                                                uu____5396 :: uu____5397  in
                                              FStar_ST.op_Colon_Equals
                                                sigelts uu____5393);
                                             (let uu____5490 =
                                                FStar_List.fold_left
                                                  (fun uu____5530  ->
                                                     fun action  ->
                                                       match uu____5530 with
                                                       | (dmff_env3,actions)
                                                           ->
                                                           let params_un =
                                                             FStar_Syntax_Subst.open_binders
                                                               action.FStar_Syntax_Syntax.action_params
                                                              in
                                                           let uu____5551 =
                                                             let uu____5558 =
                                                               FStar_TypeChecker_DMFF.get_env
                                                                 dmff_env3
                                                                in
                                                             FStar_TypeChecker_TcTerm.tc_tparams
                                                               uu____5558
                                                               params_un
                                                              in
                                                           (match uu____5551
                                                            with
                                                            | (action_params,env',uu____5567)
                                                                ->
                                                                let action_params1
                                                                  =
                                                                  FStar_List.map
                                                                    (
                                                                    fun
                                                                    uu____5593
                                                                     ->
                                                                    match uu____5593
                                                                    with
                                                                    | 
                                                                    (bv,qual)
                                                                    ->
                                                                    let uu____5612
                                                                    =
                                                                    let uu___384_5613
                                                                    = bv  in
                                                                    let uu____5614
                                                                    =
                                                                    FStar_TypeChecker_Normalize.normalize
                                                                    [FStar_TypeChecker_Env.EraseUniverses]
                                                                    env'
                                                                    bv.FStar_Syntax_Syntax.sort
                                                                     in
                                                                    {
                                                                    FStar_Syntax_Syntax.ppname
                                                                    =
                                                                    (uu___384_5613.FStar_Syntax_Syntax.ppname);
                                                                    FStar_Syntax_Syntax.index
                                                                    =
                                                                    (uu___384_5613.FStar_Syntax_Syntax.index);
                                                                    FStar_Syntax_Syntax.sort
                                                                    =
                                                                    uu____5614
                                                                    }  in
                                                                    (uu____5612,
                                                                    qual))
                                                                    action_params
                                                                   in
                                                                let dmff_env'
                                                                  =
                                                                  FStar_TypeChecker_DMFF.set_env
                                                                    dmff_env3
                                                                    env'
                                                                   in
                                                                let uu____5620
                                                                  =
                                                                  elaborate_and_star
                                                                    dmff_env'
                                                                    action_params1
                                                                    ((action.FStar_Syntax_Syntax.action_univs),
                                                                    (action.FStar_Syntax_Syntax.action_defn))
                                                                   in
                                                                (match uu____5620
                                                                 with
                                                                 | (dmff_env4,action_t,action_wp,action_elab)
                                                                    ->
                                                                    let name
                                                                    =
                                                                    ((action.FStar_Syntax_Syntax.action_name).FStar_Ident.ident).FStar_Ident.idText
                                                                     in
                                                                    let action_typ_with_wp
                                                                    =
                                                                    FStar_TypeChecker_DMFF.trans_F
                                                                    dmff_env'
                                                                    action_t
                                                                    action_wp
                                                                     in
                                                                    let action_params2
                                                                    =
                                                                    FStar_Syntax_Subst.close_binders
                                                                    action_params1
                                                                     in
                                                                    let action_elab1
                                                                    =
                                                                    FStar_Syntax_Subst.close
                                                                    action_params2
                                                                    action_elab
                                                                     in
                                                                    let action_typ_with_wp1
                                                                    =
                                                                    FStar_Syntax_Subst.close
                                                                    action_params2
                                                                    action_typ_with_wp
                                                                     in
                                                                    let action_elab2
                                                                    =
                                                                    FStar_Syntax_Util.abs
                                                                    action_params2
                                                                    action_elab1
                                                                    FStar_Pervasives_Native.None
                                                                     in
                                                                    let action_typ_with_wp2
                                                                    =
                                                                    match action_params2
                                                                    with
                                                                    | 
                                                                    [] ->
                                                                    action_typ_with_wp1
                                                                    | 
                                                                    uu____5658
                                                                    ->
                                                                    let uu____5659
                                                                    =
                                                                    FStar_Syntax_Syntax.mk_Total
                                                                    action_typ_with_wp1
                                                                     in
                                                                    FStar_Syntax_Util.flat_arrow
                                                                    action_params2
                                                                    uu____5659
                                                                     in
                                                                    ((
                                                                    let uu____5663
                                                                    =
                                                                    FStar_All.pipe_left
                                                                    (FStar_TypeChecker_Env.debug
                                                                    env1)
                                                                    (FStar_Options.Other
                                                                    "ED")  in
                                                                    if
                                                                    uu____5663
                                                                    then
                                                                    let uu____5664
                                                                    =
                                                                    FStar_Syntax_Print.binders_to_string
                                                                    ","
                                                                    params_un
                                                                     in
                                                                    let uu____5665
                                                                    =
                                                                    FStar_Syntax_Print.binders_to_string
                                                                    ","
                                                                    action_params2
                                                                     in
                                                                    let uu____5666
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    action_typ_with_wp2
                                                                     in
                                                                    let uu____5667
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    action_elab2
                                                                     in
                                                                    FStar_Util.print4
                                                                    "original action_params %s, end action_params %s, type %s, term %s\n"
                                                                    uu____5664
                                                                    uu____5665
                                                                    uu____5666
                                                                    uu____5667
                                                                    else ());
                                                                    (let action_elab3
                                                                    =
                                                                    register
                                                                    (Prims.strcat
                                                                    name
                                                                    "_elab")
                                                                    action_elab2
                                                                     in
                                                                    let action_typ_with_wp3
                                                                    =
                                                                    register
                                                                    (Prims.strcat
                                                                    name
                                                                    "_complete_type")
                                                                    action_typ_with_wp2
                                                                     in
                                                                    let uu____5671
                                                                    =
                                                                    let uu____5674
                                                                    =
                                                                    let uu___385_5675
                                                                    = action
                                                                     in
                                                                    let uu____5676
                                                                    =
                                                                    apply_close
                                                                    action_elab3
                                                                     in
                                                                    let uu____5677
                                                                    =
                                                                    apply_close
                                                                    action_typ_with_wp3
                                                                     in
                                                                    {
                                                                    FStar_Syntax_Syntax.action_name
                                                                    =
                                                                    (uu___385_5675.FStar_Syntax_Syntax.action_name);
                                                                    FStar_Syntax_Syntax.action_unqualified_name
                                                                    =
                                                                    (uu___385_5675.FStar_Syntax_Syntax.action_unqualified_name);
                                                                    FStar_Syntax_Syntax.action_univs
                                                                    =
                                                                    (uu___385_5675.FStar_Syntax_Syntax.action_univs);
                                                                    FStar_Syntax_Syntax.action_params
                                                                    = [];
                                                                    FStar_Syntax_Syntax.action_defn
                                                                    =
                                                                    uu____5676;
                                                                    FStar_Syntax_Syntax.action_typ
                                                                    =
                                                                    uu____5677
                                                                    }  in
                                                                    uu____5674
                                                                    ::
                                                                    actions
                                                                     in
                                                                    (dmff_env4,
                                                                    uu____5671))))))
                                                  (dmff_env2, [])
                                                  ed.FStar_Syntax_Syntax.actions
                                                 in
                                              match uu____5490 with
                                              | (dmff_env3,actions) ->
                                                  let actions1 =
                                                    FStar_List.rev actions
                                                     in
                                                  let repr1 =
                                                    let wp =
                                                      FStar_Syntax_Syntax.gen_bv
                                                        "wp_a"
                                                        FStar_Pervasives_Native.None
                                                        wp_a
                                                       in
                                                    let binders =
                                                      let uu____5720 =
                                                        FStar_Syntax_Syntax.mk_binder
                                                          a1
                                                         in
                                                      let uu____5727 =
                                                        let uu____5736 =
                                                          FStar_Syntax_Syntax.mk_binder
                                                            wp
                                                           in
                                                        [uu____5736]  in
                                                      uu____5720 ::
                                                        uu____5727
                                                       in
                                                    let uu____5761 =
                                                      let uu____5764 =
                                                        let uu____5765 =
                                                          let uu____5766 =
                                                            let uu____5783 =
                                                              let uu____5794
                                                                =
                                                                let uu____5803
                                                                  =
                                                                  FStar_Syntax_Syntax.bv_to_name
                                                                    a1
                                                                   in
                                                                let uu____5806
                                                                  =
                                                                  FStar_Syntax_Syntax.as_implicit
                                                                    false
                                                                   in
                                                                (uu____5803,
                                                                  uu____5806)
                                                                 in
                                                              [uu____5794]
                                                               in
                                                            (repr,
                                                              uu____5783)
                                                             in
                                                          FStar_Syntax_Syntax.Tm_app
                                                            uu____5766
                                                           in
                                                        mk1 uu____5765  in
                                                      let uu____5841 =
                                                        FStar_Syntax_Syntax.bv_to_name
                                                          wp
                                                         in
                                                      FStar_TypeChecker_DMFF.trans_F
                                                        dmff_env3 uu____5764
                                                        uu____5841
                                                       in
                                                    FStar_Syntax_Util.abs
                                                      binders uu____5761
                                                      FStar_Pervasives_Native.None
                                                     in
                                                  let uu____5842 =
                                                    recheck_debug "FC" env1
                                                      repr1
                                                     in
                                                  let repr2 =
                                                    register "repr" repr1  in
                                                  let uu____5844 =
                                                    let uu____5853 =
                                                      let uu____5854 =
                                                        let uu____5857 =
                                                          FStar_Syntax_Subst.compress
                                                            wp_type
                                                           in
                                                        FStar_All.pipe_left
                                                          FStar_Syntax_Util.unascribe
                                                          uu____5857
                                                         in
                                                      uu____5854.FStar_Syntax_Syntax.n
                                                       in
                                                    match uu____5853 with
                                                    | FStar_Syntax_Syntax.Tm_abs
                                                        (type_param::effect_param,arrow1,uu____5871)
                                                        ->
                                                        let uu____5908 =
                                                          let uu____5929 =
                                                            FStar_Syntax_Subst.open_term
                                                              (type_param ::
                                                              effect_param)
                                                              arrow1
                                                             in
                                                          match uu____5929
                                                          with
                                                          | (b::bs,body) ->
                                                              (b, bs, body)
                                                          | uu____5997 ->
                                                              failwith
                                                                "Impossible : open_term nt preserving binders arity"
                                                           in
                                                        (match uu____5908
                                                         with
                                                         | (type_param1,effect_param1,arrow2)
                                                             ->
                                                             let uu____6061 =
                                                               let uu____6062
                                                                 =
                                                                 let uu____6065
                                                                   =
                                                                   FStar_Syntax_Subst.compress
                                                                    arrow2
                                                                    in
                                                                 FStar_All.pipe_left
                                                                   FStar_Syntax_Util.unascribe
                                                                   uu____6065
                                                                  in
                                                               uu____6062.FStar_Syntax_Syntax.n
                                                                in
                                                             (match uu____6061
                                                              with
                                                              | FStar_Syntax_Syntax.Tm_arrow
                                                                  (wp_binders,c)
                                                                  ->
                                                                  let uu____6098
                                                                    =
                                                                    FStar_Syntax_Subst.open_comp
                                                                    wp_binders
                                                                    c  in
                                                                  (match uu____6098
                                                                   with
                                                                   | 
                                                                   (wp_binders1,c1)
                                                                    ->
                                                                    let uu____6113
                                                                    =
                                                                    FStar_List.partition
                                                                    (fun
                                                                    uu____6144
                                                                     ->
                                                                    match uu____6144
                                                                    with
                                                                    | 
                                                                    (bv,uu____6152)
                                                                    ->
                                                                    let uu____6157
                                                                    =
                                                                    let uu____6158
                                                                    =
                                                                    FStar_Syntax_Free.names
                                                                    bv.FStar_Syntax_Syntax.sort
                                                                     in
                                                                    FStar_All.pipe_right
                                                                    uu____6158
                                                                    (FStar_Util.set_mem
                                                                    (FStar_Pervasives_Native.fst
                                                                    type_param1))
                                                                     in
                                                                    FStar_All.pipe_right
                                                                    uu____6157
                                                                    Prims.op_Negation)
                                                                    wp_binders1
                                                                     in
                                                                    (match uu____6113
                                                                    with
                                                                    | 
                                                                    (pre_args,post_args)
                                                                    ->
                                                                    let post
                                                                    =
                                                                    match post_args
                                                                    with
                                                                    | 
                                                                    post::[]
                                                                    -> post
                                                                    | 
                                                                    [] ->
                                                                    let err_msg
                                                                    =
                                                                    let uu____6246
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    arrow2
                                                                     in
                                                                    FStar_Util.format1
                                                                    "Impossible to generate DM effect: no post candidate %s (Type variable does not appear)"
                                                                    uu____6246
                                                                     in
                                                                    FStar_Errors.raise_err
                                                                    (FStar_Errors.Fatal_ImpossibleToGenerateDMEffect,
                                                                    err_msg)
                                                                    | 
                                                                    uu____6253
                                                                    ->
                                                                    let err_msg
                                                                    =
                                                                    let uu____6263
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    arrow2
                                                                     in
                                                                    FStar_Util.format1
                                                                    "Impossible to generate DM effect: multiple post candidates %s"
                                                                    uu____6263
                                                                     in
                                                                    FStar_Errors.raise_err
                                                                    (FStar_Errors.Fatal_ImpossibleToGenerateDMEffect,
                                                                    err_msg)
                                                                     in
                                                                    let uu____6270
                                                                    =
                                                                    FStar_Syntax_Util.arrow
                                                                    pre_args
                                                                    c1  in
                                                                    let uu____6273
                                                                    =
                                                                    FStar_Syntax_Util.abs
                                                                    (type_param1
                                                                    ::
                                                                    effect_param1)
                                                                    (FStar_Pervasives_Native.fst
                                                                    post).FStar_Syntax_Syntax.sort
                                                                    FStar_Pervasives_Native.None
                                                                     in
                                                                    (uu____6270,
                                                                    uu____6273)))
                                                              | uu____6288 ->
                                                                  let uu____6289
                                                                    =
                                                                    let uu____6294
                                                                    =
                                                                    let uu____6295
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    arrow2
                                                                     in
                                                                    FStar_Util.format1
                                                                    "Impossible: pre/post arrow %s"
                                                                    uu____6295
                                                                     in
                                                                    (FStar_Errors.Fatal_ImpossiblePrePostArrow,
                                                                    uu____6294)
                                                                     in
                                                                  raise_error1
                                                                    uu____6289))
                                                    | uu____6304 ->
                                                        let uu____6305 =
                                                          let uu____6310 =
                                                            let uu____6311 =
                                                              FStar_Syntax_Print.term_to_string
                                                                wp_type
                                                               in
                                                            FStar_Util.format1
                                                              "Impossible: pre/post abs %s"
                                                              uu____6311
                                                             in
                                                          (FStar_Errors.Fatal_ImpossiblePrePostAbs,
                                                            uu____6310)
                                                           in
                                                        raise_error1
                                                          uu____6305
                                                     in
                                                  (match uu____5844 with
                                                   | (pre,post) ->
                                                       ((let uu____6341 =
                                                           register "pre" pre
                                                            in
                                                         ());
                                                        (let uu____6343 =
                                                           register "post"
                                                             post
                                                            in
                                                         ());
                                                        (let uu____6345 =
                                                           register "wp"
                                                             wp_type
                                                            in
                                                         ());
                                                        (let ed1 =
                                                           let uu___386_6347
                                                             = ed  in
                                                           let uu____6348 =
                                                             FStar_Syntax_Subst.close_binders
                                                               effect_binders1
                                                              in
                                                           let uu____6349 =
                                                             FStar_Syntax_Subst.close
                                                               effect_binders1
                                                               effect_signature
                                                              in
                                                           let uu____6350 =
                                                             let uu____6351 =
                                                               apply_close
                                                                 return_wp2
                                                                in
                                                             ([], uu____6351)
                                                              in
                                                           let uu____6358 =
                                                             let uu____6359 =
                                                               apply_close
                                                                 bind_wp2
                                                                in
                                                             ([], uu____6359)
                                                              in
                                                           let uu____6366 =
                                                             apply_close
                                                               repr2
                                                              in
                                                           let uu____6367 =
                                                             let uu____6368 =
                                                               apply_close
                                                                 return_elab1
                                                                in
                                                             ([], uu____6368)
                                                              in
                                                           let uu____6375 =
                                                             let uu____6376 =
                                                               apply_close
                                                                 bind_elab1
                                                                in
                                                             ([], uu____6376)
                                                              in
                                                           {
                                                             FStar_Syntax_Syntax.cattributes
                                                               =
                                                               (uu___386_6347.FStar_Syntax_Syntax.cattributes);
                                                             FStar_Syntax_Syntax.mname
                                                               =
                                                               (uu___386_6347.FStar_Syntax_Syntax.mname);
                                                             FStar_Syntax_Syntax.univs
                                                               =
                                                               (uu___386_6347.FStar_Syntax_Syntax.univs);
                                                             FStar_Syntax_Syntax.binders
                                                               = uu____6348;
                                                             FStar_Syntax_Syntax.signature
                                                               = uu____6349;
                                                             FStar_Syntax_Syntax.ret_wp
                                                               = uu____6350;
                                                             FStar_Syntax_Syntax.bind_wp
                                                               = uu____6358;
                                                             FStar_Syntax_Syntax.if_then_else
                                                               =
                                                               (uu___386_6347.FStar_Syntax_Syntax.if_then_else);
                                                             FStar_Syntax_Syntax.ite_wp
                                                               =
                                                               (uu___386_6347.FStar_Syntax_Syntax.ite_wp);
                                                             FStar_Syntax_Syntax.stronger
                                                               =
                                                               (uu___386_6347.FStar_Syntax_Syntax.stronger);
                                                             FStar_Syntax_Syntax.close_wp
                                                               =
                                                               (uu___386_6347.FStar_Syntax_Syntax.close_wp);
                                                             FStar_Syntax_Syntax.assert_p
                                                               =
                                                               (uu___386_6347.FStar_Syntax_Syntax.assert_p);
                                                             FStar_Syntax_Syntax.assume_p
                                                               =
                                                               (uu___386_6347.FStar_Syntax_Syntax.assume_p);
                                                             FStar_Syntax_Syntax.null_wp
                                                               =
                                                               (uu___386_6347.FStar_Syntax_Syntax.null_wp);
                                                             FStar_Syntax_Syntax.trivial
                                                               =
                                                               (uu___386_6347.FStar_Syntax_Syntax.trivial);
                                                             FStar_Syntax_Syntax.repr
                                                               = uu____6366;
                                                             FStar_Syntax_Syntax.return_repr
                                                               = uu____6367;
                                                             FStar_Syntax_Syntax.bind_repr
                                                               = uu____6375;
                                                             FStar_Syntax_Syntax.actions
                                                               = actions1;
                                                             FStar_Syntax_Syntax.eff_attrs
                                                               =
                                                               (uu___386_6347.FStar_Syntax_Syntax.eff_attrs)
                                                           }  in
                                                         let uu____6383 =
                                                           FStar_TypeChecker_DMFF.gen_wps_for_free
                                                             env1
                                                             effect_binders1
                                                             a1 wp_a ed1
                                                            in
                                                         match uu____6383
                                                         with
                                                         | (sigelts',ed2) ->
                                                             ((let uu____6401
                                                                 =
                                                                 FStar_TypeChecker_Env.debug
                                                                   env1
                                                                   (FStar_Options.Other
                                                                    "ED")
                                                                  in
                                                               if uu____6401
                                                               then
                                                                 let uu____6402
                                                                   =
                                                                   FStar_Syntax_Print.eff_decl_to_string
                                                                    true ed2
                                                                    in
                                                                 FStar_Util.print_string
                                                                   uu____6402
                                                               else ());
                                                              (let lift_from_pure_opt
                                                                 =
                                                                 if
                                                                   (FStar_List.length
                                                                    effect_binders1)
                                                                    =
                                                                    (Prims.parse_int "0")
                                                                 then
                                                                   let lift_from_pure
                                                                    =
                                                                    let uu____6416
                                                                    =
                                                                    let uu____6419
                                                                    =
                                                                    let uu____6420
                                                                    =
                                                                    apply_close
                                                                    lift_from_pure_wp1
                                                                     in
                                                                    ([],
                                                                    uu____6420)
                                                                     in
                                                                    FStar_Pervasives_Native.Some
                                                                    uu____6419
                                                                     in
                                                                    {
                                                                    FStar_Syntax_Syntax.source
                                                                    =
                                                                    FStar_Parser_Const.effect_PURE_lid;
                                                                    FStar_Syntax_Syntax.target
                                                                    =
                                                                    (ed2.FStar_Syntax_Syntax.mname);
                                                                    FStar_Syntax_Syntax.lift_wp
                                                                    =
                                                                    uu____6416;
                                                                    FStar_Syntax_Syntax.lift
                                                                    =
                                                                    FStar_Pervasives_Native.None
                                                                    }  in
                                                                   let uu____6427
                                                                    =
                                                                    FStar_Syntax_Syntax.mk_sigelt
                                                                    (FStar_Syntax_Syntax.Sig_sub_effect
                                                                    lift_from_pure)
                                                                     in
                                                                   FStar_Pervasives_Native.Some
                                                                    uu____6427
                                                                 else
                                                                   FStar_Pervasives_Native.None
                                                                  in
                                                               let uu____6429
                                                                 =
                                                                 let uu____6432
                                                                   =
                                                                   let uu____6435
                                                                    =
                                                                    FStar_ST.op_Bang
                                                                    sigelts
                                                                     in
                                                                   FStar_List.rev
                                                                    uu____6435
                                                                    in
                                                                 FStar_List.append
                                                                   uu____6432
                                                                   sigelts'
                                                                  in
                                                               (uu____6429,
                                                                 ed2,
                                                                 lift_from_pure_opt))))))))))))))))))
  
let tc_lex_t :
  'Auu____6497 .
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.sigelt Prims.list ->
        'Auu____6497 Prims.list ->
          FStar_Ident.lident Prims.list -> FStar_Syntax_Syntax.sigelt
  =
  fun env  ->
    fun ses  ->
      fun quals  ->
        fun lids  ->
          let err_range =
            let uu____6532 = FStar_List.hd ses  in
            uu____6532.FStar_Syntax_Syntax.sigrng  in
          (match lids with
           | lex_t1::lex_top1::lex_cons::[] when
               ((FStar_Ident.lid_equals lex_t1 FStar_Parser_Const.lex_t_lid)
                  &&
                  (FStar_Ident.lid_equals lex_top1
                     FStar_Parser_Const.lextop_lid))
                 &&
                 (FStar_Ident.lid_equals lex_cons
                    FStar_Parser_Const.lexcons_lid)
               -> ()
           | uu____6537 ->
               FStar_Errors.raise_error
                 (FStar_Errors.Fatal_InvalidRedefinitionOfLexT,
                   "Invalid (partial) redefinition of lex_t") err_range);
          (match ses with
           | {
               FStar_Syntax_Syntax.sigel =
                 FStar_Syntax_Syntax.Sig_inductive_typ
                 (lex_t1,uu____6541,[],t,uu____6543,uu____6544);
               FStar_Syntax_Syntax.sigrng = r;
               FStar_Syntax_Syntax.sigquals = [];
               FStar_Syntax_Syntax.sigmeta = uu____6546;
               FStar_Syntax_Syntax.sigattrs = uu____6547;_}::{
                                                               FStar_Syntax_Syntax.sigel
                                                                 =
                                                                 FStar_Syntax_Syntax.Sig_datacon
                                                                 (lex_top1,uu____6549,_t_top,_lex_t_top,_0_16,uu____6552);
                                                               FStar_Syntax_Syntax.sigrng
                                                                 = r1;
                                                               FStar_Syntax_Syntax.sigquals
                                                                 = [];
                                                               FStar_Syntax_Syntax.sigmeta
                                                                 = uu____6554;
                                                               FStar_Syntax_Syntax.sigattrs
                                                                 = uu____6555;_}::
               {
                 FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_datacon
                   (lex_cons,uu____6557,_t_cons,_lex_t_cons,_0_17,uu____6560);
                 FStar_Syntax_Syntax.sigrng = r2;
                 FStar_Syntax_Syntax.sigquals = [];
                 FStar_Syntax_Syntax.sigmeta = uu____6562;
                 FStar_Syntax_Syntax.sigattrs = uu____6563;_}::[]
               when
               ((_0_16 = (Prims.parse_int "0")) &&
                  (_0_17 = (Prims.parse_int "0")))
                 &&
                 (((FStar_Ident.lid_equals lex_t1
                      FStar_Parser_Const.lex_t_lid)
                     &&
                     (FStar_Ident.lid_equals lex_top1
                        FStar_Parser_Const.lextop_lid))
                    &&
                    (FStar_Ident.lid_equals lex_cons
                       FStar_Parser_Const.lexcons_lid))
               ->
               let u =
                 FStar_Syntax_Syntax.new_univ_name
                   (FStar_Pervasives_Native.Some r)
                  in
               let t1 =
                 FStar_Syntax_Syntax.mk
                   (FStar_Syntax_Syntax.Tm_type
                      (FStar_Syntax_Syntax.U_name u))
                   FStar_Pervasives_Native.None r
                  in
               let t2 = FStar_Syntax_Subst.close_univ_vars [u] t1  in
               let tc =
                 {
                   FStar_Syntax_Syntax.sigel =
                     (FStar_Syntax_Syntax.Sig_inductive_typ
                        (lex_t1, [u], [], t2, [],
                          [FStar_Parser_Const.lextop_lid;
                          FStar_Parser_Const.lexcons_lid]));
                   FStar_Syntax_Syntax.sigrng = r;
                   FStar_Syntax_Syntax.sigquals = [];
                   FStar_Syntax_Syntax.sigmeta =
                     FStar_Syntax_Syntax.default_sigmeta;
                   FStar_Syntax_Syntax.sigattrs = []
                 }  in
               let utop =
                 FStar_Syntax_Syntax.new_univ_name
                   (FStar_Pervasives_Native.Some r1)
                  in
               let lex_top_t =
                 let uu____6612 =
                   let uu____6619 =
                     let uu____6620 =
                       let uu____6627 =
                         let uu____6630 =
                           FStar_Ident.set_lid_range
                             FStar_Parser_Const.lex_t_lid r1
                            in
                         FStar_Syntax_Syntax.fvar uu____6630
                           FStar_Syntax_Syntax.delta_constant
                           FStar_Pervasives_Native.None
                          in
                       (uu____6627, [FStar_Syntax_Syntax.U_name utop])  in
                     FStar_Syntax_Syntax.Tm_uinst uu____6620  in
                   FStar_Syntax_Syntax.mk uu____6619  in
                 uu____6612 FStar_Pervasives_Native.None r1  in
               let lex_top_t1 =
                 FStar_Syntax_Subst.close_univ_vars [utop] lex_top_t  in
               let dc_lextop =
                 {
                   FStar_Syntax_Syntax.sigel =
                     (FStar_Syntax_Syntax.Sig_datacon
                        (lex_top1, [utop], lex_top_t1,
                          FStar_Parser_Const.lex_t_lid,
                          (Prims.parse_int "0"), []));
                   FStar_Syntax_Syntax.sigrng = r1;
                   FStar_Syntax_Syntax.sigquals = [];
                   FStar_Syntax_Syntax.sigmeta =
                     FStar_Syntax_Syntax.default_sigmeta;
                   FStar_Syntax_Syntax.sigattrs = []
                 }  in
               let ucons1 =
                 FStar_Syntax_Syntax.new_univ_name
                   (FStar_Pervasives_Native.Some r2)
                  in
               let ucons2 =
                 FStar_Syntax_Syntax.new_univ_name
                   (FStar_Pervasives_Native.Some r2)
                  in
               let lex_cons_t =
                 let a =
                   let uu____6646 =
                     FStar_Syntax_Syntax.mk
                       (FStar_Syntax_Syntax.Tm_type
                          (FStar_Syntax_Syntax.U_name ucons1))
                       FStar_Pervasives_Native.None r2
                      in
                   FStar_Syntax_Syntax.new_bv
                     (FStar_Pervasives_Native.Some r2) uu____6646
                    in
                 let hd1 =
                   let uu____6648 = FStar_Syntax_Syntax.bv_to_name a  in
                   FStar_Syntax_Syntax.new_bv
                     (FStar_Pervasives_Native.Some r2) uu____6648
                    in
                 let tl1 =
                   let uu____6650 =
                     let uu____6651 =
                       let uu____6658 =
                         let uu____6659 =
                           let uu____6666 =
                             let uu____6669 =
                               FStar_Ident.set_lid_range
                                 FStar_Parser_Const.lex_t_lid r2
                                in
                             FStar_Syntax_Syntax.fvar uu____6669
                               FStar_Syntax_Syntax.delta_constant
                               FStar_Pervasives_Native.None
                              in
                           (uu____6666, [FStar_Syntax_Syntax.U_name ucons2])
                            in
                         FStar_Syntax_Syntax.Tm_uinst uu____6659  in
                       FStar_Syntax_Syntax.mk uu____6658  in
                     uu____6651 FStar_Pervasives_Native.None r2  in
                   FStar_Syntax_Syntax.new_bv
                     (FStar_Pervasives_Native.Some r2) uu____6650
                    in
                 let res =
                   let uu____6678 =
                     let uu____6685 =
                       let uu____6686 =
                         let uu____6693 =
                           let uu____6696 =
                             FStar_Ident.set_lid_range
                               FStar_Parser_Const.lex_t_lid r2
                              in
                           FStar_Syntax_Syntax.fvar uu____6696
                             FStar_Syntax_Syntax.delta_constant
                             FStar_Pervasives_Native.None
                            in
                         (uu____6693,
                           [FStar_Syntax_Syntax.U_max
                              [FStar_Syntax_Syntax.U_name ucons1;
                              FStar_Syntax_Syntax.U_name ucons2]])
                          in
                       FStar_Syntax_Syntax.Tm_uinst uu____6686  in
                     FStar_Syntax_Syntax.mk uu____6685  in
                   uu____6678 FStar_Pervasives_Native.None r2  in
                 let uu____6702 = FStar_Syntax_Syntax.mk_Total res  in
                 FStar_Syntax_Util.arrow
                   [(a,
                      (FStar_Pervasives_Native.Some
                         FStar_Syntax_Syntax.imp_tag));
                   (hd1, FStar_Pervasives_Native.None);
                   (tl1, FStar_Pervasives_Native.None)] uu____6702
                  in
               let lex_cons_t1 =
                 FStar_Syntax_Subst.close_univ_vars [ucons1; ucons2]
                   lex_cons_t
                  in
               let dc_lexcons =
                 {
                   FStar_Syntax_Syntax.sigel =
                     (FStar_Syntax_Syntax.Sig_datacon
                        (lex_cons, [ucons1; ucons2], lex_cons_t1,
                          FStar_Parser_Const.lex_t_lid,
                          (Prims.parse_int "0"), []));
                   FStar_Syntax_Syntax.sigrng = r2;
                   FStar_Syntax_Syntax.sigquals = [];
                   FStar_Syntax_Syntax.sigmeta =
                     FStar_Syntax_Syntax.default_sigmeta;
                   FStar_Syntax_Syntax.sigattrs = []
                 }  in
               let uu____6739 = FStar_TypeChecker_Env.get_range env  in
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_bundle
                      ([tc; dc_lextop; dc_lexcons], lids));
                 FStar_Syntax_Syntax.sigrng = uu____6739;
                 FStar_Syntax_Syntax.sigquals = [];
                 FStar_Syntax_Syntax.sigmeta =
                   FStar_Syntax_Syntax.default_sigmeta;
                 FStar_Syntax_Syntax.sigattrs = []
               }
           | uu____6744 ->
               let err_msg =
                 let uu____6748 =
                   let uu____6749 =
                     FStar_Syntax_Syntax.mk_sigelt
                       (FStar_Syntax_Syntax.Sig_bundle (ses, lids))
                      in
                   FStar_Syntax_Print.sigelt_to_string uu____6749  in
                 FStar_Util.format1 "Invalid (re)definition of lex_t: %s\n"
                   uu____6748
                  in
               FStar_Errors.raise_error
                 (FStar_Errors.Fatal_InvalidRedefinitionOfLexT, err_msg)
                 err_range)
  
let (tc_type_common :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.tscheme ->
      FStar_Syntax_Syntax.typ ->
        FStar_Range.range -> FStar_Syntax_Syntax.tscheme)
  =
  fun env  ->
    fun uu____6771  ->
      fun expected_typ1  ->
        fun r  ->
          match uu____6771 with
          | (uvs,t) ->
              let uu____6784 = FStar_Syntax_Subst.open_univ_vars uvs t  in
              (match uu____6784 with
               | (uvs1,t1) ->
                   let env1 = FStar_TypeChecker_Env.push_univ_vars env uvs1
                      in
                   let t2 = tc_check_trivial_guard env1 t1 expected_typ1  in
                   if uvs1 = []
                   then
                     let uu____6795 =
                       FStar_TypeChecker_Util.generalize_universes env1 t2
                        in
                     (match uu____6795 with
                      | (uvs2,t3) ->
                          (FStar_TypeChecker_Util.check_uvars r t3;
                           (uvs2, t3)))
                   else
                     (let uu____6812 =
                        let uu____6815 =
                          FStar_All.pipe_right t2
                            (FStar_TypeChecker_Normalize.remove_uvar_solutions
                               env1)
                           in
                        FStar_All.pipe_right uu____6815
                          (FStar_Syntax_Subst.close_univ_vars uvs1)
                         in
                      (uvs1, uu____6812)))
  
let (tc_declare_typ :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.tscheme ->
      FStar_Range.range -> FStar_Syntax_Syntax.tscheme)
  =
  fun env  ->
    fun ts  ->
      fun r  ->
        let uu____6837 =
          let uu____6838 = FStar_Syntax_Util.type_u ()  in
          FStar_All.pipe_right uu____6838 FStar_Pervasives_Native.fst  in
        tc_type_common env ts uu____6837 r
  
let (tc_assume :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.tscheme ->
      FStar_Range.range -> FStar_Syntax_Syntax.tscheme)
  =
  fun env  ->
    fun ts  ->
      fun r  ->
        let uu____6862 =
          let uu____6863 = FStar_Syntax_Util.type_u ()  in
          FStar_All.pipe_right uu____6863 FStar_Pervasives_Native.fst  in
        tc_type_common env ts uu____6862 r
  
let (tc_inductive' :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sigelt Prims.list ->
      FStar_Syntax_Syntax.qualifier Prims.list ->
        FStar_Ident.lident Prims.list ->
          (FStar_Syntax_Syntax.sigelt,FStar_Syntax_Syntax.sigelt Prims.list)
            FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun ses  ->
      fun quals  ->
        fun lids  ->
          (let uu____6911 = FStar_TypeChecker_Env.debug env FStar_Options.Low
              in
           if uu____6911
           then
             let uu____6912 =
               FStar_Common.string_of_list
                 FStar_Syntax_Print.sigelt_to_string ses
                in
             FStar_Util.print1 ">>>>>>>>>>>>>>tc_inductive %s\n" uu____6912
           else ());
          (let uu____6914 =
             FStar_TypeChecker_TcInductive.check_inductive_well_typedness env
               ses quals lids
              in
           match uu____6914 with
           | (sig_bndle,tcs,datas) ->
               let data_ops_ses =
                 let uu____6945 =
                   FStar_List.map
                     (FStar_TypeChecker_TcInductive.mk_data_operations quals
                        env tcs) datas
                    in
                 FStar_All.pipe_right uu____6945 FStar_List.flatten  in
               ((let uu____6959 =
                   (FStar_Options.no_positivity ()) ||
                     (let uu____6961 =
                        FStar_TypeChecker_Env.should_verify env  in
                      Prims.op_Negation uu____6961)
                    in
                 if uu____6959
                 then ()
                 else
                   (let env1 =
                      FStar_TypeChecker_Env.push_sigelt env sig_bndle  in
                    FStar_List.iter
                      (fun ty  ->
                         let b =
                           FStar_TypeChecker_TcInductive.check_positivity ty
                             env1
                            in
                         if Prims.op_Negation b
                         then
                           let uu____6972 =
                             match ty.FStar_Syntax_Syntax.sigel with
                             | FStar_Syntax_Syntax.Sig_inductive_typ
                                 (lid,uu____6982,uu____6983,uu____6984,uu____6985,uu____6986)
                                 -> (lid, (ty.FStar_Syntax_Syntax.sigrng))
                             | uu____6995 -> failwith "Impossible!"  in
                           match uu____6972 with
                           | (lid,r) ->
                               FStar_Errors.log_issue r
                                 (FStar_Errors.Error_InductiveTypeNotSatisfyPositivityCondition,
                                   (Prims.strcat "Inductive type "
                                      (Prims.strcat lid.FStar_Ident.str
                                         " does not satisfy the positivity condition")))
                         else ()) tcs));
                (let skip_prims_type uu____7008 =
                   let lid =
                     let ty = FStar_List.hd tcs  in
                     match ty.FStar_Syntax_Syntax.sigel with
                     | FStar_Syntax_Syntax.Sig_inductive_typ
                         (lid,uu____7012,uu____7013,uu____7014,uu____7015,uu____7016)
                         -> lid
                     | uu____7025 -> failwith "Impossible"  in
                   FStar_List.existsb
                     (fun s  ->
                        s = (lid.FStar_Ident.ident).FStar_Ident.idText)
                     FStar_TypeChecker_TcInductive.early_prims_inductives
                    in
                 let is_noeq =
                   FStar_List.existsb
                     (fun q  -> q = FStar_Syntax_Syntax.Noeq) quals
                    in
                 let res =
                   let uu____7038 =
                     (((FStar_List.length tcs) = (Prims.parse_int "0")) ||
                        ((FStar_Ident.lid_equals
                            env.FStar_TypeChecker_Env.curmodule
                            FStar_Parser_Const.prims_lid)
                           && (skip_prims_type ())))
                       || is_noeq
                      in
                   if uu____7038
                   then (sig_bndle, data_ops_ses)
                   else
                     (let is_unopteq =
                        FStar_List.existsb
                          (fun q  -> q = FStar_Syntax_Syntax.Unopteq) quals
                         in
                      let ses1 =
                        if is_unopteq
                        then
                          FStar_TypeChecker_TcInductive.unoptimized_haseq_scheme
                            sig_bndle tcs datas env
                        else
                          FStar_TypeChecker_TcInductive.optimized_haseq_scheme
                            sig_bndle tcs datas env
                         in
                      (sig_bndle, (FStar_List.append ses1 data_ops_ses)))
                    in
                 res)))
  
let (tc_inductive :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sigelt Prims.list ->
      FStar_Syntax_Syntax.qualifier Prims.list ->
        FStar_Ident.lident Prims.list ->
          (FStar_Syntax_Syntax.sigelt,FStar_Syntax_Syntax.sigelt Prims.list)
            FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun ses  ->
      fun quals  ->
        fun lids  ->
          let env1 = FStar_TypeChecker_Env.push env "tc_inductive"  in
          let pop1 uu____7103 =
            let uu____7104 = FStar_TypeChecker_Env.pop env1 "tc_inductive"
               in
            ()  in
          try
            (fun uu___388_7113  ->
               match () with
               | () ->
                   let uu____7120 = tc_inductive' env1 ses quals lids  in
                   FStar_All.pipe_right uu____7120 (fun r  -> pop1 (); r)) ()
          with | uu___387_7151 -> (pop1 (); FStar_Exn.raise uu___387_7151)
  
let (z3_reset_options :
  FStar_TypeChecker_Env.env -> FStar_TypeChecker_Env.env) =
  fun en  ->
    let env =
      let uu____7171 = FStar_Options.using_facts_from ()  in
      FStar_TypeChecker_Env.set_proof_ns uu____7171 en  in
    (env.FStar_TypeChecker_Env.solver).FStar_TypeChecker_Env.refresh (); env
  
let (get_fail_se :
  FStar_Syntax_Syntax.sigelt ->
    (Prims.int Prims.list,Prims.bool) FStar_Pervasives_Native.tuple2
      FStar_Pervasives_Native.option)
  =
  fun se  ->
    let comb f1 f2 =
      match (f1, f2) with
      | (FStar_Pervasives_Native.Some (e1,l1),FStar_Pervasives_Native.Some
         (e2,l2)) ->
          FStar_Pervasives_Native.Some
            ((FStar_List.append e1 e2), (l1 || l2))
      | (FStar_Pervasives_Native.Some (e,l),FStar_Pervasives_Native.None ) ->
          FStar_Pervasives_Native.Some (e, l)
      | (FStar_Pervasives_Native.None ,FStar_Pervasives_Native.Some (e,l)) ->
          FStar_Pervasives_Native.Some (e, l)
      | uu____7401 -> FStar_Pervasives_Native.None  in
    FStar_List.fold_right
      (fun at  ->
         fun acc  ->
           let uu____7449 = FStar_ToSyntax_ToSyntax.get_fail_attr true at  in
           comb uu____7449 acc) se.FStar_Syntax_Syntax.sigattrs
      FStar_Pervasives_Native.None
  
let list_of_option :
  'Auu____7468 .
    'Auu____7468 FStar_Pervasives_Native.option -> 'Auu____7468 Prims.list
  =
  fun uu___366_7477  ->
    match uu___366_7477 with
    | FStar_Pervasives_Native.None  -> []
    | FStar_Pervasives_Native.Some x -> [x]
  
let (check_multi_contained :
  Prims.int Prims.list ->
    Prims.int Prims.list ->
      (Prims.int,Prims.int,Prims.int) FStar_Pervasives_Native.tuple3
        FStar_Pervasives_Native.option)
  =
  fun l1  ->
    fun l2  ->
      let rec collect1 l =
        match l with
        | [] -> []
        | hd1::tl1 ->
            let uu____7544 = collect1 tl1  in
            (match uu____7544 with
             | [] -> [(hd1, (Prims.parse_int "1"))]
             | (h,n1)::t ->
                 if h = hd1
                 then (h, (n1 + (Prims.parse_int "1"))) :: t
                 else (hd1, (Prims.parse_int "1")) :: (h, n1) :: t)
         in
      let summ l = collect1 l  in
      let l11 = summ l1  in
      let l21 = summ l2  in
      let rec aux l12 l22 =
        match (l12, l22) with
        | ([],[]) -> FStar_Pervasives_Native.None
        | ((e,n1)::uu____7722,[]) ->
            FStar_Pervasives_Native.Some (e, n1, (Prims.parse_int "0"))
        | ([],(e,n1)::uu____7757) ->
            FStar_Pervasives_Native.Some (e, (Prims.parse_int "0"), n1)
        | ((hd1,n1)::tl1,(hd2,n2)::tl2) when hd1 <> hd2 ->
            FStar_Pervasives_Native.Some (hd1, n1, (Prims.parse_int "0"))
        | ((hd1,n1)::tl1,(hd2,n2)::tl2) ->
            if n1 <> n2
            then FStar_Pervasives_Native.Some (hd1, n1, n2)
            else aux tl1 tl2
         in
      aux l11 l21
  
let (tc_decl' :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sigelt ->
      (FStar_Syntax_Syntax.sigelt Prims.list,FStar_Syntax_Syntax.sigelt
                                               Prims.list,FStar_TypeChecker_Env.env)
        FStar_Pervasives_Native.tuple3)
  =
  fun env0  ->
    fun se  ->
      let env = env0  in
      FStar_TypeChecker_Util.check_sigelt_quals env se;
      (let r = se.FStar_Syntax_Syntax.sigrng  in
       match se.FStar_Syntax_Syntax.sigel with
       | FStar_Syntax_Syntax.Sig_inductive_typ uu____7930 ->
           failwith "Impossible bare data-constructor"
       | FStar_Syntax_Syntax.Sig_datacon uu____7957 ->
           failwith "Impossible bare data-constructor"
       | FStar_Syntax_Syntax.Sig_bundle (ses,lids) when
           FStar_All.pipe_right lids
             (FStar_Util.for_some
                (FStar_Ident.lid_equals FStar_Parser_Const.lex_t_lid))
           ->
           let env1 = FStar_TypeChecker_Env.set_range env r  in
           let se1 = tc_lex_t env1 ses se.FStar_Syntax_Syntax.sigquals lids
              in
           ([se1], [], env0)
       | FStar_Syntax_Syntax.Sig_bundle (ses,lids) ->
           let env1 = FStar_TypeChecker_Env.set_range env r  in
           let ses1 =
             let uu____8014 =
               (FStar_Options.use_two_phase_tc ()) &&
                 (FStar_TypeChecker_Env.should_verify env1)
                in
             if uu____8014
             then
               let ses1 =
                 let uu____8020 =
                   let uu____8021 =
                     let uu____8022 =
                       tc_inductive
                         (let uu___389_8031 = env1  in
                          {
                            FStar_TypeChecker_Env.solver =
                              (uu___389_8031.FStar_TypeChecker_Env.solver);
                            FStar_TypeChecker_Env.range =
                              (uu___389_8031.FStar_TypeChecker_Env.range);
                            FStar_TypeChecker_Env.curmodule =
                              (uu___389_8031.FStar_TypeChecker_Env.curmodule);
                            FStar_TypeChecker_Env.gamma =
                              (uu___389_8031.FStar_TypeChecker_Env.gamma);
                            FStar_TypeChecker_Env.gamma_sig =
                              (uu___389_8031.FStar_TypeChecker_Env.gamma_sig);
                            FStar_TypeChecker_Env.gamma_cache =
                              (uu___389_8031.FStar_TypeChecker_Env.gamma_cache);
                            FStar_TypeChecker_Env.modules =
                              (uu___389_8031.FStar_TypeChecker_Env.modules);
                            FStar_TypeChecker_Env.expected_typ =
                              (uu___389_8031.FStar_TypeChecker_Env.expected_typ);
                            FStar_TypeChecker_Env.sigtab =
                              (uu___389_8031.FStar_TypeChecker_Env.sigtab);
                            FStar_TypeChecker_Env.attrtab =
                              (uu___389_8031.FStar_TypeChecker_Env.attrtab);
                            FStar_TypeChecker_Env.is_pattern =
                              (uu___389_8031.FStar_TypeChecker_Env.is_pattern);
                            FStar_TypeChecker_Env.instantiate_imp =
                              (uu___389_8031.FStar_TypeChecker_Env.instantiate_imp);
                            FStar_TypeChecker_Env.effects =
                              (uu___389_8031.FStar_TypeChecker_Env.effects);
                            FStar_TypeChecker_Env.generalize =
                              (uu___389_8031.FStar_TypeChecker_Env.generalize);
                            FStar_TypeChecker_Env.letrecs =
                              (uu___389_8031.FStar_TypeChecker_Env.letrecs);
                            FStar_TypeChecker_Env.top_level =
                              (uu___389_8031.FStar_TypeChecker_Env.top_level);
                            FStar_TypeChecker_Env.check_uvars =
                              (uu___389_8031.FStar_TypeChecker_Env.check_uvars);
                            FStar_TypeChecker_Env.use_eq =
                              (uu___389_8031.FStar_TypeChecker_Env.use_eq);
                            FStar_TypeChecker_Env.is_iface =
                              (uu___389_8031.FStar_TypeChecker_Env.is_iface);
                            FStar_TypeChecker_Env.admit =
                              (uu___389_8031.FStar_TypeChecker_Env.admit);
                            FStar_TypeChecker_Env.lax = true;
                            FStar_TypeChecker_Env.lax_universes =
                              (uu___389_8031.FStar_TypeChecker_Env.lax_universes);
                            FStar_TypeChecker_Env.phase1 = true;
                            FStar_TypeChecker_Env.failhard =
                              (uu___389_8031.FStar_TypeChecker_Env.failhard);
                            FStar_TypeChecker_Env.nosynth =
                              (uu___389_8031.FStar_TypeChecker_Env.nosynth);
                            FStar_TypeChecker_Env.uvar_subtyping =
                              (uu___389_8031.FStar_TypeChecker_Env.uvar_subtyping);
                            FStar_TypeChecker_Env.tc_term =
                              (uu___389_8031.FStar_TypeChecker_Env.tc_term);
                            FStar_TypeChecker_Env.type_of =
                              (uu___389_8031.FStar_TypeChecker_Env.type_of);
                            FStar_TypeChecker_Env.universe_of =
                              (uu___389_8031.FStar_TypeChecker_Env.universe_of);
                            FStar_TypeChecker_Env.check_type_of =
                              (uu___389_8031.FStar_TypeChecker_Env.check_type_of);
                            FStar_TypeChecker_Env.use_bv_sorts =
                              (uu___389_8031.FStar_TypeChecker_Env.use_bv_sorts);
                            FStar_TypeChecker_Env.qtbl_name_and_index =
                              (uu___389_8031.FStar_TypeChecker_Env.qtbl_name_and_index);
                            FStar_TypeChecker_Env.normalized_eff_names =
                              (uu___389_8031.FStar_TypeChecker_Env.normalized_eff_names);
                            FStar_TypeChecker_Env.fv_delta_depths =
                              (uu___389_8031.FStar_TypeChecker_Env.fv_delta_depths);
                            FStar_TypeChecker_Env.proof_ns =
                              (uu___389_8031.FStar_TypeChecker_Env.proof_ns);
                            FStar_TypeChecker_Env.synth_hook =
                              (uu___389_8031.FStar_TypeChecker_Env.synth_hook);
                            FStar_TypeChecker_Env.splice =
                              (uu___389_8031.FStar_TypeChecker_Env.splice);
                            FStar_TypeChecker_Env.postprocess =
                              (uu___389_8031.FStar_TypeChecker_Env.postprocess);
                            FStar_TypeChecker_Env.is_native_tactic =
                              (uu___389_8031.FStar_TypeChecker_Env.is_native_tactic);
                            FStar_TypeChecker_Env.identifier_info =
                              (uu___389_8031.FStar_TypeChecker_Env.identifier_info);
                            FStar_TypeChecker_Env.tc_hooks =
                              (uu___389_8031.FStar_TypeChecker_Env.tc_hooks);
                            FStar_TypeChecker_Env.dsenv =
                              (uu___389_8031.FStar_TypeChecker_Env.dsenv);
                            FStar_TypeChecker_Env.nbe =
                              (uu___389_8031.FStar_TypeChecker_Env.nbe)
                          }) ses se.FStar_Syntax_Syntax.sigquals lids
                        in
                     FStar_All.pipe_right uu____8022
                       FStar_Pervasives_Native.fst
                      in
                   FStar_All.pipe_right uu____8021
                     (FStar_TypeChecker_Normalize.elim_uvars env1)
                    in
                 FStar_All.pipe_right uu____8020
                   FStar_Syntax_Util.ses_of_sigbundle
                  in
               ((let uu____8043 =
                   FStar_All.pipe_left (FStar_TypeChecker_Env.debug env1)
                     (FStar_Options.Other "TwoPhases")
                    in
                 if uu____8043
                 then
                   let uu____8044 =
                     FStar_Syntax_Print.sigelt_to_string
                       (let uu___390_8047 = se  in
                        {
                          FStar_Syntax_Syntax.sigel =
                            (FStar_Syntax_Syntax.Sig_bundle (ses1, lids));
                          FStar_Syntax_Syntax.sigrng =
                            (uu___390_8047.FStar_Syntax_Syntax.sigrng);
                          FStar_Syntax_Syntax.sigquals =
                            (uu___390_8047.FStar_Syntax_Syntax.sigquals);
                          FStar_Syntax_Syntax.sigmeta =
                            (uu___390_8047.FStar_Syntax_Syntax.sigmeta);
                          FStar_Syntax_Syntax.sigattrs =
                            (uu___390_8047.FStar_Syntax_Syntax.sigattrs)
                        })
                      in
                   FStar_Util.print1 "Inductive after phase 1: %s\n"
                     uu____8044
                 else ());
                ses1)
             else ses  in
           let uu____8054 =
             tc_inductive env1 ses1 se.FStar_Syntax_Syntax.sigquals lids  in
           (match uu____8054 with
            | (sigbndle,projectors_ses) ->
                let sigbndle1 =
                  let uu___391_8078 = sigbndle  in
                  {
                    FStar_Syntax_Syntax.sigel =
                      (uu___391_8078.FStar_Syntax_Syntax.sigel);
                    FStar_Syntax_Syntax.sigrng =
                      (uu___391_8078.FStar_Syntax_Syntax.sigrng);
                    FStar_Syntax_Syntax.sigquals =
                      (uu___391_8078.FStar_Syntax_Syntax.sigquals);
                    FStar_Syntax_Syntax.sigmeta =
                      (uu___391_8078.FStar_Syntax_Syntax.sigmeta);
                    FStar_Syntax_Syntax.sigattrs =
                      (se.FStar_Syntax_Syntax.sigattrs)
                  }  in
                ([sigbndle1], projectors_ses, env0))
       | FStar_Syntax_Syntax.Sig_pragma p ->
           (FStar_Syntax_Util.process_pragma p r; ([se], [], env0))
       | FStar_Syntax_Syntax.Sig_new_effect_for_free ne ->
           let uu____8090 = cps_and_elaborate env ne  in
           (match uu____8090 with
            | (ses,ne1,lift_from_pure_opt) ->
                let effect_and_lift_ses =
                  match lift_from_pure_opt with
                  | FStar_Pervasives_Native.Some lift ->
                      [(let uu___392_8129 = se  in
                        {
                          FStar_Syntax_Syntax.sigel =
                            (FStar_Syntax_Syntax.Sig_new_effect ne1);
                          FStar_Syntax_Syntax.sigrng =
                            (uu___392_8129.FStar_Syntax_Syntax.sigrng);
                          FStar_Syntax_Syntax.sigquals =
                            (uu___392_8129.FStar_Syntax_Syntax.sigquals);
                          FStar_Syntax_Syntax.sigmeta =
                            (uu___392_8129.FStar_Syntax_Syntax.sigmeta);
                          FStar_Syntax_Syntax.sigattrs =
                            (uu___392_8129.FStar_Syntax_Syntax.sigattrs)
                        });
                      lift]
                  | FStar_Pervasives_Native.None  ->
                      [(let uu___393_8131 = se  in
                        {
                          FStar_Syntax_Syntax.sigel =
                            (FStar_Syntax_Syntax.Sig_new_effect ne1);
                          FStar_Syntax_Syntax.sigrng =
                            (uu___393_8131.FStar_Syntax_Syntax.sigrng);
                          FStar_Syntax_Syntax.sigquals =
                            (uu___393_8131.FStar_Syntax_Syntax.sigquals);
                          FStar_Syntax_Syntax.sigmeta =
                            (uu___393_8131.FStar_Syntax_Syntax.sigmeta);
                          FStar_Syntax_Syntax.sigattrs =
                            (uu___393_8131.FStar_Syntax_Syntax.sigattrs)
                        })]
                   in
                ([], (FStar_List.append ses effect_and_lift_ses), env0))
       | FStar_Syntax_Syntax.Sig_new_effect ne ->
           let ne1 =
             let uu____8138 =
               (FStar_Options.use_two_phase_tc ()) &&
                 (FStar_TypeChecker_Env.should_verify env)
                in
             if uu____8138
             then
               let ne1 =
                 let uu____8140 =
                   let uu____8141 =
                     let uu____8142 =
                       tc_eff_decl
                         (let uu___394_8145 = env  in
                          {
                            FStar_TypeChecker_Env.solver =
                              (uu___394_8145.FStar_TypeChecker_Env.solver);
                            FStar_TypeChecker_Env.range =
                              (uu___394_8145.FStar_TypeChecker_Env.range);
                            FStar_TypeChecker_Env.curmodule =
                              (uu___394_8145.FStar_TypeChecker_Env.curmodule);
                            FStar_TypeChecker_Env.gamma =
                              (uu___394_8145.FStar_TypeChecker_Env.gamma);
                            FStar_TypeChecker_Env.gamma_sig =
                              (uu___394_8145.FStar_TypeChecker_Env.gamma_sig);
                            FStar_TypeChecker_Env.gamma_cache =
                              (uu___394_8145.FStar_TypeChecker_Env.gamma_cache);
                            FStar_TypeChecker_Env.modules =
                              (uu___394_8145.FStar_TypeChecker_Env.modules);
                            FStar_TypeChecker_Env.expected_typ =
                              (uu___394_8145.FStar_TypeChecker_Env.expected_typ);
                            FStar_TypeChecker_Env.sigtab =
                              (uu___394_8145.FStar_TypeChecker_Env.sigtab);
                            FStar_TypeChecker_Env.attrtab =
                              (uu___394_8145.FStar_TypeChecker_Env.attrtab);
                            FStar_TypeChecker_Env.is_pattern =
                              (uu___394_8145.FStar_TypeChecker_Env.is_pattern);
                            FStar_TypeChecker_Env.instantiate_imp =
                              (uu___394_8145.FStar_TypeChecker_Env.instantiate_imp);
                            FStar_TypeChecker_Env.effects =
                              (uu___394_8145.FStar_TypeChecker_Env.effects);
                            FStar_TypeChecker_Env.generalize =
                              (uu___394_8145.FStar_TypeChecker_Env.generalize);
                            FStar_TypeChecker_Env.letrecs =
                              (uu___394_8145.FStar_TypeChecker_Env.letrecs);
                            FStar_TypeChecker_Env.top_level =
                              (uu___394_8145.FStar_TypeChecker_Env.top_level);
                            FStar_TypeChecker_Env.check_uvars =
                              (uu___394_8145.FStar_TypeChecker_Env.check_uvars);
                            FStar_TypeChecker_Env.use_eq =
                              (uu___394_8145.FStar_TypeChecker_Env.use_eq);
                            FStar_TypeChecker_Env.is_iface =
                              (uu___394_8145.FStar_TypeChecker_Env.is_iface);
                            FStar_TypeChecker_Env.admit =
                              (uu___394_8145.FStar_TypeChecker_Env.admit);
                            FStar_TypeChecker_Env.lax = true;
                            FStar_TypeChecker_Env.lax_universes =
                              (uu___394_8145.FStar_TypeChecker_Env.lax_universes);
                            FStar_TypeChecker_Env.phase1 = true;
                            FStar_TypeChecker_Env.failhard =
                              (uu___394_8145.FStar_TypeChecker_Env.failhard);
                            FStar_TypeChecker_Env.nosynth =
                              (uu___394_8145.FStar_TypeChecker_Env.nosynth);
                            FStar_TypeChecker_Env.uvar_subtyping =
                              (uu___394_8145.FStar_TypeChecker_Env.uvar_subtyping);
                            FStar_TypeChecker_Env.tc_term =
                              (uu___394_8145.FStar_TypeChecker_Env.tc_term);
                            FStar_TypeChecker_Env.type_of =
                              (uu___394_8145.FStar_TypeChecker_Env.type_of);
                            FStar_TypeChecker_Env.universe_of =
                              (uu___394_8145.FStar_TypeChecker_Env.universe_of);
                            FStar_TypeChecker_Env.check_type_of =
                              (uu___394_8145.FStar_TypeChecker_Env.check_type_of);
                            FStar_TypeChecker_Env.use_bv_sorts =
                              (uu___394_8145.FStar_TypeChecker_Env.use_bv_sorts);
                            FStar_TypeChecker_Env.qtbl_name_and_index =
                              (uu___394_8145.FStar_TypeChecker_Env.qtbl_name_and_index);
                            FStar_TypeChecker_Env.normalized_eff_names =
                              (uu___394_8145.FStar_TypeChecker_Env.normalized_eff_names);
                            FStar_TypeChecker_Env.fv_delta_depths =
                              (uu___394_8145.FStar_TypeChecker_Env.fv_delta_depths);
                            FStar_TypeChecker_Env.proof_ns =
                              (uu___394_8145.FStar_TypeChecker_Env.proof_ns);
                            FStar_TypeChecker_Env.synth_hook =
                              (uu___394_8145.FStar_TypeChecker_Env.synth_hook);
                            FStar_TypeChecker_Env.splice =
                              (uu___394_8145.FStar_TypeChecker_Env.splice);
                            FStar_TypeChecker_Env.postprocess =
                              (uu___394_8145.FStar_TypeChecker_Env.postprocess);
                            FStar_TypeChecker_Env.is_native_tactic =
                              (uu___394_8145.FStar_TypeChecker_Env.is_native_tactic);
                            FStar_TypeChecker_Env.identifier_info =
                              (uu___394_8145.FStar_TypeChecker_Env.identifier_info);
                            FStar_TypeChecker_Env.tc_hooks =
                              (uu___394_8145.FStar_TypeChecker_Env.tc_hooks);
                            FStar_TypeChecker_Env.dsenv =
                              (uu___394_8145.FStar_TypeChecker_Env.dsenv);
                            FStar_TypeChecker_Env.nbe =
                              (uu___394_8145.FStar_TypeChecker_Env.nbe)
                          }) ne
                        in
                     FStar_All.pipe_right uu____8142
                       (fun ne1  ->
                          let uu___395_8149 = se  in
                          {
                            FStar_Syntax_Syntax.sigel =
                              (FStar_Syntax_Syntax.Sig_new_effect ne1);
                            FStar_Syntax_Syntax.sigrng =
                              (uu___395_8149.FStar_Syntax_Syntax.sigrng);
                            FStar_Syntax_Syntax.sigquals =
                              (uu___395_8149.FStar_Syntax_Syntax.sigquals);
                            FStar_Syntax_Syntax.sigmeta =
                              (uu___395_8149.FStar_Syntax_Syntax.sigmeta);
                            FStar_Syntax_Syntax.sigattrs =
                              (uu___395_8149.FStar_Syntax_Syntax.sigattrs)
                          })
                      in
                   FStar_All.pipe_right uu____8141
                     (FStar_TypeChecker_Normalize.elim_uvars env)
                    in
                 FStar_All.pipe_right uu____8140
                   FStar_Syntax_Util.eff_decl_of_new_effect
                  in
               ((let uu____8151 =
                   FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                     (FStar_Options.Other "TwoPhases")
                    in
                 if uu____8151
                 then
                   let uu____8152 =
                     FStar_Syntax_Print.sigelt_to_string
                       (let uu___396_8155 = se  in
                        {
                          FStar_Syntax_Syntax.sigel =
                            (FStar_Syntax_Syntax.Sig_new_effect ne1);
                          FStar_Syntax_Syntax.sigrng =
                            (uu___396_8155.FStar_Syntax_Syntax.sigrng);
                          FStar_Syntax_Syntax.sigquals =
                            (uu___396_8155.FStar_Syntax_Syntax.sigquals);
                          FStar_Syntax_Syntax.sigmeta =
                            (uu___396_8155.FStar_Syntax_Syntax.sigmeta);
                          FStar_Syntax_Syntax.sigattrs =
                            (uu___396_8155.FStar_Syntax_Syntax.sigattrs)
                        })
                      in
                   FStar_Util.print1 "Effect decl after phase 1: %s\n"
                     uu____8152
                 else ());
                ne1)
             else ne  in
           let ne2 = tc_eff_decl env ne1  in
           let se1 =
             let uu___397_8160 = se  in
             {
               FStar_Syntax_Syntax.sigel =
                 (FStar_Syntax_Syntax.Sig_new_effect ne2);
               FStar_Syntax_Syntax.sigrng =
                 (uu___397_8160.FStar_Syntax_Syntax.sigrng);
               FStar_Syntax_Syntax.sigquals =
                 (uu___397_8160.FStar_Syntax_Syntax.sigquals);
               FStar_Syntax_Syntax.sigmeta =
                 (uu___397_8160.FStar_Syntax_Syntax.sigmeta);
               FStar_Syntax_Syntax.sigattrs =
                 (uu___397_8160.FStar_Syntax_Syntax.sigattrs)
             }  in
           ([se1], [], env0)
       | FStar_Syntax_Syntax.Sig_sub_effect sub1 ->
           let ed_src =
             FStar_TypeChecker_Env.get_effect_decl env
               sub1.FStar_Syntax_Syntax.source
              in
           let ed_tgt =
             FStar_TypeChecker_Env.get_effect_decl env
               sub1.FStar_Syntax_Syntax.target
              in
           let uu____8168 =
             let uu____8175 =
               FStar_TypeChecker_Env.lookup_effect_lid env
                 sub1.FStar_Syntax_Syntax.source
                in
             monad_signature env sub1.FStar_Syntax_Syntax.source uu____8175
              in
           (match uu____8168 with
            | (a,wp_a_src) ->
                let uu____8192 =
                  let uu____8199 =
                    FStar_TypeChecker_Env.lookup_effect_lid env
                      sub1.FStar_Syntax_Syntax.target
                     in
                  monad_signature env sub1.FStar_Syntax_Syntax.target
                    uu____8199
                   in
                (match uu____8192 with
                 | (b,wp_b_tgt) ->
                     let wp_a_tgt =
                       let uu____8217 =
                         let uu____8220 =
                           let uu____8221 =
                             let uu____8228 =
                               FStar_Syntax_Syntax.bv_to_name a  in
                             (b, uu____8228)  in
                           FStar_Syntax_Syntax.NT uu____8221  in
                         [uu____8220]  in
                       FStar_Syntax_Subst.subst uu____8217 wp_b_tgt  in
                     let expected_k =
                       let uu____8236 =
                         let uu____8245 = FStar_Syntax_Syntax.mk_binder a  in
                         let uu____8252 =
                           let uu____8261 =
                             FStar_Syntax_Syntax.null_binder wp_a_src  in
                           [uu____8261]  in
                         uu____8245 :: uu____8252  in
                       let uu____8286 = FStar_Syntax_Syntax.mk_Total wp_a_tgt
                          in
                       FStar_Syntax_Util.arrow uu____8236 uu____8286  in
                     let repr_type eff_name a1 wp =
                       (let uu____8308 =
                          let uu____8309 =
                            FStar_TypeChecker_Env.is_reifiable_effect env
                              eff_name
                             in
                          Prims.op_Negation uu____8309  in
                        if uu____8308
                        then
                          let uu____8310 =
                            let uu____8315 =
                              FStar_Util.format1
                                "Effect %s cannot be reified"
                                eff_name.FStar_Ident.str
                               in
                            (FStar_Errors.Fatal_EffectCannotBeReified,
                              uu____8315)
                             in
                          let uu____8316 =
                            FStar_TypeChecker_Env.get_range env  in
                          FStar_Errors.raise_error uu____8310 uu____8316
                        else ());
                       (let uu____8318 =
                          FStar_TypeChecker_Env.effect_decl_opt env eff_name
                           in
                        match uu____8318 with
                        | FStar_Pervasives_Native.None  ->
                            failwith
                              "internal error: reifiable effect has no decl?"
                        | FStar_Pervasives_Native.Some (ed,qualifiers) ->
                            let repr =
                              FStar_TypeChecker_Env.inst_effect_fun_with
                                [FStar_Syntax_Syntax.U_unknown] env ed
                                ([], (ed.FStar_Syntax_Syntax.repr))
                               in
                            let uu____8354 =
                              FStar_TypeChecker_Env.get_range env  in
                            let uu____8355 =
                              let uu____8362 =
                                let uu____8363 =
                                  let uu____8380 =
                                    let uu____8391 =
                                      FStar_Syntax_Syntax.as_arg a1  in
                                    let uu____8400 =
                                      let uu____8411 =
                                        FStar_Syntax_Syntax.as_arg wp  in
                                      [uu____8411]  in
                                    uu____8391 :: uu____8400  in
                                  (repr, uu____8380)  in
                                FStar_Syntax_Syntax.Tm_app uu____8363  in
                              FStar_Syntax_Syntax.mk uu____8362  in
                            uu____8355 FStar_Pervasives_Native.None
                              uu____8354)
                        in
                     let uu____8459 =
                       match ((sub1.FStar_Syntax_Syntax.lift),
                               (sub1.FStar_Syntax_Syntax.lift_wp))
                       with
                       | (FStar_Pervasives_Native.None
                          ,FStar_Pervasives_Native.None ) ->
                           failwith "Impossible (parser)"
                       | (lift,FStar_Pervasives_Native.Some (uvs,lift_wp)) ->
                           let uu____8631 =
                             if
                               (FStar_List.length uvs) >
                                 (Prims.parse_int "0")
                             then
                               let uu____8640 =
                                 FStar_Syntax_Subst.univ_var_opening uvs  in
                               match uu____8640 with
                               | (usubst,uvs1) ->
                                   let uu____8663 =
                                     FStar_TypeChecker_Env.push_univ_vars env
                                       uvs1
                                      in
                                   let uu____8664 =
                                     FStar_Syntax_Subst.subst usubst lift_wp
                                      in
                                   (uu____8663, uu____8664)
                             else (env, lift_wp)  in
                           (match uu____8631 with
                            | (env1,lift_wp1) ->
                                let lift_wp2 =
                                  if
                                    (FStar_List.length uvs) =
                                      (Prims.parse_int "0")
                                  then check_and_gen env1 lift_wp1 expected_k
                                  else
                                    (let lift_wp2 =
                                       tc_check_trivial_guard env1 lift_wp1
                                         expected_k
                                        in
                                     let uu____8709 =
                                       FStar_Syntax_Subst.close_univ_vars uvs
                                         lift_wp2
                                        in
                                     (uvs, uu____8709))
                                   in
                                (lift, lift_wp2))
                       | (FStar_Pervasives_Native.Some
                          (what,lift),FStar_Pervasives_Native.None ) ->
                           let uu____8780 =
                             if
                               (FStar_List.length what) >
                                 (Prims.parse_int "0")
                             then
                               let uu____8793 =
                                 FStar_Syntax_Subst.univ_var_opening what  in
                               match uu____8793 with
                               | (usubst,uvs) ->
                                   let uu____8818 =
                                     FStar_Syntax_Subst.subst usubst lift  in
                                   (uvs, uu____8818)
                             else ([], lift)  in
                           (match uu____8780 with
                            | (uvs,lift1) ->
                                ((let uu____8853 =
                                    FStar_TypeChecker_Env.debug env
                                      (FStar_Options.Other "ED")
                                     in
                                  if uu____8853
                                  then
                                    let uu____8854 =
                                      FStar_Syntax_Print.term_to_string lift1
                                       in
                                    FStar_Util.print1 "Lift for free : %s\n"
                                      uu____8854
                                  else ());
                                 (let dmff_env =
                                    FStar_TypeChecker_DMFF.empty env
                                      (FStar_TypeChecker_TcTerm.tc_constant
                                         env FStar_Range.dummyRange)
                                     in
                                  let uu____8857 =
                                    let uu____8864 =
                                      FStar_TypeChecker_Env.push_univ_vars
                                        env uvs
                                       in
                                    FStar_TypeChecker_TcTerm.tc_term
                                      uu____8864 lift1
                                     in
                                  match uu____8857 with
                                  | (lift2,comp,uu____8889) ->
                                      let uu____8890 =
                                        FStar_TypeChecker_DMFF.star_expr
                                          dmff_env lift2
                                         in
                                      (match uu____8890 with
                                       | (uu____8919,lift_wp,lift_elab) ->
                                           let lift_wp1 =
                                             recheck_debug "lift-wp" env
                                               lift_wp
                                              in
                                           let lift_elab1 =
                                             recheck_debug "lift-elab" env
                                               lift_elab
                                              in
                                           if
                                             (FStar_List.length uvs) =
                                               (Prims.parse_int "0")
                                           then
                                             let uu____8946 =
                                               let uu____8957 =
                                                 FStar_TypeChecker_Util.generalize_universes
                                                   env lift_elab1
                                                  in
                                               FStar_Pervasives_Native.Some
                                                 uu____8957
                                                in
                                             let uu____8974 =
                                               FStar_TypeChecker_Util.generalize_universes
                                                 env lift_wp1
                                                in
                                             (uu____8946, uu____8974)
                                           else
                                             (let uu____9002 =
                                                let uu____9013 =
                                                  let uu____9022 =
                                                    FStar_Syntax_Subst.close_univ_vars
                                                      uvs lift_elab1
                                                     in
                                                  (uvs, uu____9022)  in
                                                FStar_Pervasives_Native.Some
                                                  uu____9013
                                                 in
                                              let uu____9037 =
                                                let uu____9046 =
                                                  FStar_Syntax_Subst.close_univ_vars
                                                    uvs lift_wp1
                                                   in
                                                (uvs, uu____9046)  in
                                              (uu____9002, uu____9037))))))
                        in
                     (match uu____8459 with
                      | (lift,lift_wp) ->
                          let env1 =
                            let uu___398_9120 = env  in
                            {
                              FStar_TypeChecker_Env.solver =
                                (uu___398_9120.FStar_TypeChecker_Env.solver);
                              FStar_TypeChecker_Env.range =
                                (uu___398_9120.FStar_TypeChecker_Env.range);
                              FStar_TypeChecker_Env.curmodule =
                                (uu___398_9120.FStar_TypeChecker_Env.curmodule);
                              FStar_TypeChecker_Env.gamma =
                                (uu___398_9120.FStar_TypeChecker_Env.gamma);
                              FStar_TypeChecker_Env.gamma_sig =
                                (uu___398_9120.FStar_TypeChecker_Env.gamma_sig);
                              FStar_TypeChecker_Env.gamma_cache =
                                (uu___398_9120.FStar_TypeChecker_Env.gamma_cache);
                              FStar_TypeChecker_Env.modules =
                                (uu___398_9120.FStar_TypeChecker_Env.modules);
                              FStar_TypeChecker_Env.expected_typ =
                                (uu___398_9120.FStar_TypeChecker_Env.expected_typ);
                              FStar_TypeChecker_Env.sigtab =
                                (uu___398_9120.FStar_TypeChecker_Env.sigtab);
                              FStar_TypeChecker_Env.attrtab =
                                (uu___398_9120.FStar_TypeChecker_Env.attrtab);
                              FStar_TypeChecker_Env.is_pattern =
                                (uu___398_9120.FStar_TypeChecker_Env.is_pattern);
                              FStar_TypeChecker_Env.instantiate_imp =
                                (uu___398_9120.FStar_TypeChecker_Env.instantiate_imp);
                              FStar_TypeChecker_Env.effects =
                                (uu___398_9120.FStar_TypeChecker_Env.effects);
                              FStar_TypeChecker_Env.generalize =
                                (uu___398_9120.FStar_TypeChecker_Env.generalize);
                              FStar_TypeChecker_Env.letrecs =
                                (uu___398_9120.FStar_TypeChecker_Env.letrecs);
                              FStar_TypeChecker_Env.top_level =
                                (uu___398_9120.FStar_TypeChecker_Env.top_level);
                              FStar_TypeChecker_Env.check_uvars =
                                (uu___398_9120.FStar_TypeChecker_Env.check_uvars);
                              FStar_TypeChecker_Env.use_eq =
                                (uu___398_9120.FStar_TypeChecker_Env.use_eq);
                              FStar_TypeChecker_Env.is_iface =
                                (uu___398_9120.FStar_TypeChecker_Env.is_iface);
                              FStar_TypeChecker_Env.admit =
                                (uu___398_9120.FStar_TypeChecker_Env.admit);
                              FStar_TypeChecker_Env.lax = true;
                              FStar_TypeChecker_Env.lax_universes =
                                (uu___398_9120.FStar_TypeChecker_Env.lax_universes);
                              FStar_TypeChecker_Env.phase1 =
                                (uu___398_9120.FStar_TypeChecker_Env.phase1);
                              FStar_TypeChecker_Env.failhard =
                                (uu___398_9120.FStar_TypeChecker_Env.failhard);
                              FStar_TypeChecker_Env.nosynth =
                                (uu___398_9120.FStar_TypeChecker_Env.nosynth);
                              FStar_TypeChecker_Env.uvar_subtyping =
                                (uu___398_9120.FStar_TypeChecker_Env.uvar_subtyping);
                              FStar_TypeChecker_Env.tc_term =
                                (uu___398_9120.FStar_TypeChecker_Env.tc_term);
                              FStar_TypeChecker_Env.type_of =
                                (uu___398_9120.FStar_TypeChecker_Env.type_of);
                              FStar_TypeChecker_Env.universe_of =
                                (uu___398_9120.FStar_TypeChecker_Env.universe_of);
                              FStar_TypeChecker_Env.check_type_of =
                                (uu___398_9120.FStar_TypeChecker_Env.check_type_of);
                              FStar_TypeChecker_Env.use_bv_sorts =
                                (uu___398_9120.FStar_TypeChecker_Env.use_bv_sorts);
                              FStar_TypeChecker_Env.qtbl_name_and_index =
                                (uu___398_9120.FStar_TypeChecker_Env.qtbl_name_and_index);
                              FStar_TypeChecker_Env.normalized_eff_names =
                                (uu___398_9120.FStar_TypeChecker_Env.normalized_eff_names);
                              FStar_TypeChecker_Env.fv_delta_depths =
                                (uu___398_9120.FStar_TypeChecker_Env.fv_delta_depths);
                              FStar_TypeChecker_Env.proof_ns =
                                (uu___398_9120.FStar_TypeChecker_Env.proof_ns);
                              FStar_TypeChecker_Env.synth_hook =
                                (uu___398_9120.FStar_TypeChecker_Env.synth_hook);
                              FStar_TypeChecker_Env.splice =
                                (uu___398_9120.FStar_TypeChecker_Env.splice);
                              FStar_TypeChecker_Env.postprocess =
                                (uu___398_9120.FStar_TypeChecker_Env.postprocess);
                              FStar_TypeChecker_Env.is_native_tactic =
                                (uu___398_9120.FStar_TypeChecker_Env.is_native_tactic);
                              FStar_TypeChecker_Env.identifier_info =
                                (uu___398_9120.FStar_TypeChecker_Env.identifier_info);
                              FStar_TypeChecker_Env.tc_hooks =
                                (uu___398_9120.FStar_TypeChecker_Env.tc_hooks);
                              FStar_TypeChecker_Env.dsenv =
                                (uu___398_9120.FStar_TypeChecker_Env.dsenv);
                              FStar_TypeChecker_Env.nbe =
                                (uu___398_9120.FStar_TypeChecker_Env.nbe)
                            }  in
                          let lift1 =
                            match lift with
                            | FStar_Pervasives_Native.None  ->
                                FStar_Pervasives_Native.None
                            | FStar_Pervasives_Native.Some (uvs,lift1) ->
                                let uu____9152 =
                                  let uu____9157 =
                                    FStar_Syntax_Subst.univ_var_opening uvs
                                     in
                                  match uu____9157 with
                                  | (usubst,uvs1) ->
                                      let uu____9180 =
                                        FStar_TypeChecker_Env.push_univ_vars
                                          env1 uvs1
                                         in
                                      let uu____9181 =
                                        FStar_Syntax_Subst.subst usubst lift1
                                         in
                                      (uu____9180, uu____9181)
                                   in
                                (match uu____9152 with
                                 | (env2,lift2) ->
                                     let uu____9186 =
                                       let uu____9193 =
                                         FStar_TypeChecker_Env.lookup_effect_lid
                                           env2
                                           sub1.FStar_Syntax_Syntax.source
                                          in
                                       monad_signature env2
                                         sub1.FStar_Syntax_Syntax.source
                                         uu____9193
                                        in
                                     (match uu____9186 with
                                      | (a1,wp_a_src1) ->
                                          let wp_a =
                                            FStar_Syntax_Syntax.new_bv
                                              FStar_Pervasives_Native.None
                                              wp_a_src1
                                             in
                                          let a_typ =
                                            FStar_Syntax_Syntax.bv_to_name a1
                                             in
                                          let wp_a_typ =
                                            FStar_Syntax_Syntax.bv_to_name
                                              wp_a
                                             in
                                          let repr_f =
                                            repr_type
                                              sub1.FStar_Syntax_Syntax.source
                                              a_typ wp_a_typ
                                             in
                                          let repr_result =
                                            let lift_wp1 =
                                              FStar_TypeChecker_Normalize.normalize
                                                [FStar_TypeChecker_Env.EraseUniverses;
                                                FStar_TypeChecker_Env.AllowUnboundUniverses]
                                                env2
                                                (FStar_Pervasives_Native.snd
                                                   lift_wp)
                                               in
                                            let lift_wp_a =
                                              let uu____9219 =
                                                FStar_TypeChecker_Env.get_range
                                                  env2
                                                 in
                                              let uu____9220 =
                                                let uu____9227 =
                                                  let uu____9228 =
                                                    let uu____9245 =
                                                      let uu____9256 =
                                                        FStar_Syntax_Syntax.as_arg
                                                          a_typ
                                                         in
                                                      let uu____9265 =
                                                        let uu____9276 =
                                                          FStar_Syntax_Syntax.as_arg
                                                            wp_a_typ
                                                           in
                                                        [uu____9276]  in
                                                      uu____9256 ::
                                                        uu____9265
                                                       in
                                                    (lift_wp1, uu____9245)
                                                     in
                                                  FStar_Syntax_Syntax.Tm_app
                                                    uu____9228
                                                   in
                                                FStar_Syntax_Syntax.mk
                                                  uu____9227
                                                 in
                                              uu____9220
                                                FStar_Pervasives_Native.None
                                                uu____9219
                                               in
                                            repr_type
                                              sub1.FStar_Syntax_Syntax.target
                                              a_typ lift_wp_a
                                             in
                                          let expected_k1 =
                                            let uu____9327 =
                                              let uu____9336 =
                                                FStar_Syntax_Syntax.mk_binder
                                                  a1
                                                 in
                                              let uu____9343 =
                                                let uu____9352 =
                                                  FStar_Syntax_Syntax.mk_binder
                                                    wp_a
                                                   in
                                                let uu____9359 =
                                                  let uu____9368 =
                                                    FStar_Syntax_Syntax.null_binder
                                                      repr_f
                                                     in
                                                  [uu____9368]  in
                                                uu____9352 :: uu____9359  in
                                              uu____9336 :: uu____9343  in
                                            let uu____9399 =
                                              FStar_Syntax_Syntax.mk_Total
                                                repr_result
                                               in
                                            FStar_Syntax_Util.arrow
                                              uu____9327 uu____9399
                                             in
                                          let uu____9402 =
                                            FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term
                                              env2 expected_k1
                                             in
                                          (match uu____9402 with
                                           | (expected_k2,uu____9412,uu____9413)
                                               ->
                                               let lift3 =
                                                 if
                                                   (FStar_List.length uvs) =
                                                     (Prims.parse_int "0")
                                                 then
                                                   check_and_gen env2 lift2
                                                     expected_k2
                                                 else
                                                   (let lift3 =
                                                      tc_check_trivial_guard
                                                        env2 lift2
                                                        expected_k2
                                                       in
                                                    let uu____9417 =
                                                      FStar_Syntax_Subst.close_univ_vars
                                                        uvs lift3
                                                       in
                                                    (uvs, uu____9417))
                                                  in
                                               FStar_Pervasives_Native.Some
                                                 lift3)))
                             in
                          ((let uu____9425 =
                              let uu____9426 =
                                let uu____9427 =
                                  FStar_All.pipe_right lift_wp
                                    FStar_Pervasives_Native.fst
                                   in
                                FStar_All.pipe_right uu____9427
                                  FStar_List.length
                                 in
                              uu____9426 <> (Prims.parse_int "1")  in
                            if uu____9425
                            then
                              let uu____9446 =
                                let uu____9451 =
                                  let uu____9452 =
                                    FStar_Syntax_Print.lid_to_string
                                      sub1.FStar_Syntax_Syntax.source
                                     in
                                  let uu____9453 =
                                    FStar_Syntax_Print.lid_to_string
                                      sub1.FStar_Syntax_Syntax.target
                                     in
                                  let uu____9454 =
                                    let uu____9455 =
                                      let uu____9456 =
                                        FStar_All.pipe_right lift_wp
                                          FStar_Pervasives_Native.fst
                                         in
                                      FStar_All.pipe_right uu____9456
                                        FStar_List.length
                                       in
                                    FStar_All.pipe_right uu____9455
                                      FStar_Util.string_of_int
                                     in
                                  FStar_Util.format3
                                    "Sub effect wp must be polymorphic in exactly 1 universe; %s ~> %s has %s universes"
                                    uu____9452 uu____9453 uu____9454
                                   in
                                (FStar_Errors.Fatal_TooManyUniverse,
                                  uu____9451)
                                 in
                              FStar_Errors.raise_error uu____9446 r
                            else ());
                           (let uu____9477 =
                              (FStar_Util.is_some lift1) &&
                                (let uu____9479 =
                                   let uu____9480 =
                                     let uu____9483 =
                                       FStar_All.pipe_right lift1
                                         FStar_Util.must
                                        in
                                     FStar_All.pipe_right uu____9483
                                       FStar_Pervasives_Native.fst
                                      in
                                   FStar_All.pipe_right uu____9480
                                     FStar_List.length
                                    in
                                 uu____9479 <> (Prims.parse_int "1"))
                               in
                            if uu____9477
                            then
                              let uu____9518 =
                                let uu____9523 =
                                  let uu____9524 =
                                    FStar_Syntax_Print.lid_to_string
                                      sub1.FStar_Syntax_Syntax.source
                                     in
                                  let uu____9525 =
                                    FStar_Syntax_Print.lid_to_string
                                      sub1.FStar_Syntax_Syntax.target
                                     in
                                  let uu____9526 =
                                    let uu____9527 =
                                      let uu____9528 =
                                        let uu____9531 =
                                          FStar_All.pipe_right lift1
                                            FStar_Util.must
                                           in
                                        FStar_All.pipe_right uu____9531
                                          FStar_Pervasives_Native.fst
                                         in
                                      FStar_All.pipe_right uu____9528
                                        FStar_List.length
                                       in
                                    FStar_All.pipe_right uu____9527
                                      FStar_Util.string_of_int
                                     in
                                  FStar_Util.format3
                                    "Sub effect lift must be polymorphic in exactly 1 universe; %s ~> %s has %s universes"
                                    uu____9524 uu____9525 uu____9526
                                   in
                                (FStar_Errors.Fatal_TooManyUniverse,
                                  uu____9523)
                                 in
                              FStar_Errors.raise_error uu____9518 r
                            else ());
                           (let sub2 =
                              let uu___399_9568 = sub1  in
                              {
                                FStar_Syntax_Syntax.source =
                                  (uu___399_9568.FStar_Syntax_Syntax.source);
                                FStar_Syntax_Syntax.target =
                                  (uu___399_9568.FStar_Syntax_Syntax.target);
                                FStar_Syntax_Syntax.lift_wp =
                                  (FStar_Pervasives_Native.Some lift_wp);
                                FStar_Syntax_Syntax.lift = lift1
                              }  in
                            let se1 =
                              let uu___400_9570 = se  in
                              {
                                FStar_Syntax_Syntax.sigel =
                                  (FStar_Syntax_Syntax.Sig_sub_effect sub2);
                                FStar_Syntax_Syntax.sigrng =
                                  (uu___400_9570.FStar_Syntax_Syntax.sigrng);
                                FStar_Syntax_Syntax.sigquals =
                                  (uu___400_9570.FStar_Syntax_Syntax.sigquals);
                                FStar_Syntax_Syntax.sigmeta =
                                  (uu___400_9570.FStar_Syntax_Syntax.sigmeta);
                                FStar_Syntax_Syntax.sigattrs =
                                  (uu___400_9570.FStar_Syntax_Syntax.sigattrs)
                              }  in
                            ([se1], [], env0))))))
       | FStar_Syntax_Syntax.Sig_effect_abbrev (lid,uvs,tps,c,flags1) ->
           let uu____9584 =
             if (FStar_List.length uvs) = (Prims.parse_int "0")
             then (env, uvs, tps, c)
             else
               (let uu____9608 = FStar_Syntax_Subst.univ_var_opening uvs  in
                match uu____9608 with
                | (usubst,uvs1) ->
                    let tps1 = FStar_Syntax_Subst.subst_binders usubst tps
                       in
                    let c1 =
                      let uu____9639 =
                        FStar_Syntax_Subst.shift_subst
                          (FStar_List.length tps1) usubst
                         in
                      FStar_Syntax_Subst.subst_comp uu____9639 c  in
                    let uu____9648 =
                      FStar_TypeChecker_Env.push_univ_vars env uvs1  in
                    (uu____9648, uvs1, tps1, c1))
              in
           (match uu____9584 with
            | (env1,uvs1,tps1,c1) ->
                let env2 = FStar_TypeChecker_Env.set_range env1 r  in
                let uu____9670 = FStar_Syntax_Subst.open_comp tps1 c1  in
                (match uu____9670 with
                 | (tps2,c2) ->
                     let uu____9687 =
                       FStar_TypeChecker_TcTerm.tc_tparams env2 tps2  in
                     (match uu____9687 with
                      | (tps3,env3,us) ->
                          let uu____9707 =
                            FStar_TypeChecker_TcTerm.tc_comp env3 c2  in
                          (match uu____9707 with
                           | (c3,u,g) ->
                               (FStar_TypeChecker_Rel.force_trivial_guard
                                  env3 g;
                                (let tps4 =
                                   FStar_Syntax_Subst.close_binders tps3  in
                                 let c4 =
                                   FStar_Syntax_Subst.close_comp tps4 c3  in
                                 let uu____9730 =
                                   let uu____9731 =
                                     FStar_Syntax_Syntax.mk
                                       (FStar_Syntax_Syntax.Tm_arrow
                                          (tps4, c4))
                                       FStar_Pervasives_Native.None r
                                      in
                                   FStar_TypeChecker_Util.generalize_universes
                                     env0 uu____9731
                                    in
                                 match uu____9730 with
                                 | (uvs2,t) ->
                                     let uu____9762 =
                                       let uu____9767 =
                                         let uu____9780 =
                                           let uu____9781 =
                                             FStar_Syntax_Subst.compress t
                                              in
                                           uu____9781.FStar_Syntax_Syntax.n
                                            in
                                         (tps4, uu____9780)  in
                                       match uu____9767 with
                                       | ([],FStar_Syntax_Syntax.Tm_arrow
                                          (uu____9796,c5)) -> ([], c5)
                                       | (uu____9838,FStar_Syntax_Syntax.Tm_arrow
                                          (tps5,c5)) -> (tps5, c5)
                                       | uu____9877 ->
                                           failwith
                                             "Impossible (t is an arrow)"
                                        in
                                     (match uu____9762 with
                                      | (tps5,c5) ->
                                          (if
                                             (FStar_List.length uvs2) <>
                                               (Prims.parse_int "1")
                                           then
                                             (let uu____9907 =
                                                FStar_Syntax_Subst.open_univ_vars
                                                  uvs2 t
                                                 in
                                              match uu____9907 with
                                              | (uu____9912,t1) ->
                                                  let uu____9914 =
                                                    let uu____9919 =
                                                      let uu____9920 =
                                                        FStar_Syntax_Print.lid_to_string
                                                          lid
                                                         in
                                                      let uu____9921 =
                                                        FStar_All.pipe_right
                                                          (FStar_List.length
                                                             uvs2)
                                                          FStar_Util.string_of_int
                                                         in
                                                      let uu____9922 =
                                                        FStar_Syntax_Print.term_to_string
                                                          t1
                                                         in
                                                      FStar_Util.format3
                                                        "Effect abbreviations must be polymorphic in exactly 1 universe; %s has %s universes (%s)"
                                                        uu____9920 uu____9921
                                                        uu____9922
                                                       in
                                                    (FStar_Errors.Fatal_TooManyUniverse,
                                                      uu____9919)
                                                     in
                                                  FStar_Errors.raise_error
                                                    uu____9914 r)
                                           else ();
                                           (let se1 =
                                              let uu___401_9925 = se  in
                                              {
                                                FStar_Syntax_Syntax.sigel =
                                                  (FStar_Syntax_Syntax.Sig_effect_abbrev
                                                     (lid, uvs2, tps5, c5,
                                                       flags1));
                                                FStar_Syntax_Syntax.sigrng =
                                                  (uu___401_9925.FStar_Syntax_Syntax.sigrng);
                                                FStar_Syntax_Syntax.sigquals
                                                  =
                                                  (uu___401_9925.FStar_Syntax_Syntax.sigquals);
                                                FStar_Syntax_Syntax.sigmeta =
                                                  (uu___401_9925.FStar_Syntax_Syntax.sigmeta);
                                                FStar_Syntax_Syntax.sigattrs
                                                  =
                                                  (uu___401_9925.FStar_Syntax_Syntax.sigattrs)
                                              }  in
                                            ([se1], [], env0))))))))))
       | FStar_Syntax_Syntax.Sig_declare_typ
           (uu____9932,uu____9933,uu____9934) when
           FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
             (FStar_Util.for_some
                (fun uu___367_9938  ->
                   match uu___367_9938 with
                   | FStar_Syntax_Syntax.OnlyName  -> true
                   | uu____9939 -> false))
           -> ([], [], env0)
       | FStar_Syntax_Syntax.Sig_let (uu____9944,uu____9945) when
           FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
             (FStar_Util.for_some
                (fun uu___367_9953  ->
                   match uu___367_9953 with
                   | FStar_Syntax_Syntax.OnlyName  -> true
                   | uu____9954 -> false))
           -> ([], [], env0)
       | FStar_Syntax_Syntax.Sig_declare_typ (lid,uvs,t) ->
           let env1 = FStar_TypeChecker_Env.set_range env r  in
           ((let uu____9964 = FStar_TypeChecker_Env.lid_exists env1 lid  in
             if uu____9964
             then
               let uu____9965 =
                 let uu____9970 =
                   let uu____9971 = FStar_Ident.text_of_lid lid  in
                   FStar_Util.format1
                     "Top-level declaration %s for a name that is already used in this module; top-level declarations must be unique in their module"
                     uu____9971
                    in
                 (FStar_Errors.Fatal_AlreadyDefinedTopLevelDeclaration,
                   uu____9970)
                  in
               FStar_Errors.raise_error uu____9965 r
             else ());
            (let uu____9973 =
               let uu____9982 =
                 (FStar_Options.use_two_phase_tc ()) &&
                   (FStar_TypeChecker_Env.should_verify env1)
                  in
               if uu____9982
               then
                 let uu____9991 =
                   tc_declare_typ
                     (let uu___402_9994 = env1  in
                      {
                        FStar_TypeChecker_Env.solver =
                          (uu___402_9994.FStar_TypeChecker_Env.solver);
                        FStar_TypeChecker_Env.range =
                          (uu___402_9994.FStar_TypeChecker_Env.range);
                        FStar_TypeChecker_Env.curmodule =
                          (uu___402_9994.FStar_TypeChecker_Env.curmodule);
                        FStar_TypeChecker_Env.gamma =
                          (uu___402_9994.FStar_TypeChecker_Env.gamma);
                        FStar_TypeChecker_Env.gamma_sig =
                          (uu___402_9994.FStar_TypeChecker_Env.gamma_sig);
                        FStar_TypeChecker_Env.gamma_cache =
                          (uu___402_9994.FStar_TypeChecker_Env.gamma_cache);
                        FStar_TypeChecker_Env.modules =
                          (uu___402_9994.FStar_TypeChecker_Env.modules);
                        FStar_TypeChecker_Env.expected_typ =
                          (uu___402_9994.FStar_TypeChecker_Env.expected_typ);
                        FStar_TypeChecker_Env.sigtab =
                          (uu___402_9994.FStar_TypeChecker_Env.sigtab);
                        FStar_TypeChecker_Env.attrtab =
                          (uu___402_9994.FStar_TypeChecker_Env.attrtab);
                        FStar_TypeChecker_Env.is_pattern =
                          (uu___402_9994.FStar_TypeChecker_Env.is_pattern);
                        FStar_TypeChecker_Env.instantiate_imp =
                          (uu___402_9994.FStar_TypeChecker_Env.instantiate_imp);
                        FStar_TypeChecker_Env.effects =
                          (uu___402_9994.FStar_TypeChecker_Env.effects);
                        FStar_TypeChecker_Env.generalize =
                          (uu___402_9994.FStar_TypeChecker_Env.generalize);
                        FStar_TypeChecker_Env.letrecs =
                          (uu___402_9994.FStar_TypeChecker_Env.letrecs);
                        FStar_TypeChecker_Env.top_level =
                          (uu___402_9994.FStar_TypeChecker_Env.top_level);
                        FStar_TypeChecker_Env.check_uvars =
                          (uu___402_9994.FStar_TypeChecker_Env.check_uvars);
                        FStar_TypeChecker_Env.use_eq =
                          (uu___402_9994.FStar_TypeChecker_Env.use_eq);
                        FStar_TypeChecker_Env.is_iface =
                          (uu___402_9994.FStar_TypeChecker_Env.is_iface);
                        FStar_TypeChecker_Env.admit =
                          (uu___402_9994.FStar_TypeChecker_Env.admit);
                        FStar_TypeChecker_Env.lax = true;
                        FStar_TypeChecker_Env.lax_universes =
                          (uu___402_9994.FStar_TypeChecker_Env.lax_universes);
                        FStar_TypeChecker_Env.phase1 =
                          (uu___402_9994.FStar_TypeChecker_Env.phase1);
                        FStar_TypeChecker_Env.failhard =
                          (uu___402_9994.FStar_TypeChecker_Env.failhard);
                        FStar_TypeChecker_Env.nosynth =
                          (uu___402_9994.FStar_TypeChecker_Env.nosynth);
                        FStar_TypeChecker_Env.uvar_subtyping =
                          (uu___402_9994.FStar_TypeChecker_Env.uvar_subtyping);
                        FStar_TypeChecker_Env.tc_term =
                          (uu___402_9994.FStar_TypeChecker_Env.tc_term);
                        FStar_TypeChecker_Env.type_of =
                          (uu___402_9994.FStar_TypeChecker_Env.type_of);
                        FStar_TypeChecker_Env.universe_of =
                          (uu___402_9994.FStar_TypeChecker_Env.universe_of);
                        FStar_TypeChecker_Env.check_type_of =
                          (uu___402_9994.FStar_TypeChecker_Env.check_type_of);
                        FStar_TypeChecker_Env.use_bv_sorts =
                          (uu___402_9994.FStar_TypeChecker_Env.use_bv_sorts);
                        FStar_TypeChecker_Env.qtbl_name_and_index =
                          (uu___402_9994.FStar_TypeChecker_Env.qtbl_name_and_index);
                        FStar_TypeChecker_Env.normalized_eff_names =
                          (uu___402_9994.FStar_TypeChecker_Env.normalized_eff_names);
                        FStar_TypeChecker_Env.fv_delta_depths =
                          (uu___402_9994.FStar_TypeChecker_Env.fv_delta_depths);
                        FStar_TypeChecker_Env.proof_ns =
                          (uu___402_9994.FStar_TypeChecker_Env.proof_ns);
                        FStar_TypeChecker_Env.synth_hook =
                          (uu___402_9994.FStar_TypeChecker_Env.synth_hook);
                        FStar_TypeChecker_Env.splice =
                          (uu___402_9994.FStar_TypeChecker_Env.splice);
                        FStar_TypeChecker_Env.postprocess =
                          (uu___402_9994.FStar_TypeChecker_Env.postprocess);
                        FStar_TypeChecker_Env.is_native_tactic =
                          (uu___402_9994.FStar_TypeChecker_Env.is_native_tactic);
                        FStar_TypeChecker_Env.identifier_info =
                          (uu___402_9994.FStar_TypeChecker_Env.identifier_info);
                        FStar_TypeChecker_Env.tc_hooks =
                          (uu___402_9994.FStar_TypeChecker_Env.tc_hooks);
                        FStar_TypeChecker_Env.dsenv =
                          (uu___402_9994.FStar_TypeChecker_Env.dsenv);
                        FStar_TypeChecker_Env.nbe =
                          (uu___402_9994.FStar_TypeChecker_Env.nbe)
                      }) (uvs, t) se.FStar_Syntax_Syntax.sigrng
                    in
                 match uu____9991 with
                 | (uvs1,t1) ->
                     ((let uu____10018 =
                         FStar_All.pipe_left
                           (FStar_TypeChecker_Env.debug env1)
                           (FStar_Options.Other "TwoPhases")
                          in
                       if uu____10018
                       then
                         let uu____10019 =
                           FStar_Syntax_Print.term_to_string t1  in
                         let uu____10020 =
                           FStar_Syntax_Print.univ_names_to_string uvs1  in
                         FStar_Util.print2
                           "Val declaration after phase 1: %s and uvs: %s\n"
                           uu____10019 uu____10020
                       else ());
                      (uvs1, t1))
               else (uvs, t)  in
             match uu____9973 with
             | (uvs1,t1) ->
                 let uu____10051 =
                   tc_declare_typ env1 (uvs1, t1)
                     se.FStar_Syntax_Syntax.sigrng
                    in
                 (match uu____10051 with
                  | (uvs2,t2) ->
                      ([(let uu___403_10081 = se  in
                         {
                           FStar_Syntax_Syntax.sigel =
                             (FStar_Syntax_Syntax.Sig_declare_typ
                                (lid, uvs2, t2));
                           FStar_Syntax_Syntax.sigrng =
                             (uu___403_10081.FStar_Syntax_Syntax.sigrng);
                           FStar_Syntax_Syntax.sigquals =
                             (uu___403_10081.FStar_Syntax_Syntax.sigquals);
                           FStar_Syntax_Syntax.sigmeta =
                             (uu___403_10081.FStar_Syntax_Syntax.sigmeta);
                           FStar_Syntax_Syntax.sigattrs =
                             (uu___403_10081.FStar_Syntax_Syntax.sigattrs)
                         })], [], env0))))
       | FStar_Syntax_Syntax.Sig_assume (lid,uvs,t) ->
           let env1 = FStar_TypeChecker_Env.set_range env r  in
           let uu____10086 =
             let uu____10095 =
               (FStar_Options.use_two_phase_tc ()) &&
                 (FStar_TypeChecker_Env.should_verify env1)
                in
             if uu____10095
             then
               let uu____10104 =
                 tc_assume
                   (let uu___404_10107 = env1  in
                    {
                      FStar_TypeChecker_Env.solver =
                        (uu___404_10107.FStar_TypeChecker_Env.solver);
                      FStar_TypeChecker_Env.range =
                        (uu___404_10107.FStar_TypeChecker_Env.range);
                      FStar_TypeChecker_Env.curmodule =
                        (uu___404_10107.FStar_TypeChecker_Env.curmodule);
                      FStar_TypeChecker_Env.gamma =
                        (uu___404_10107.FStar_TypeChecker_Env.gamma);
                      FStar_TypeChecker_Env.gamma_sig =
                        (uu___404_10107.FStar_TypeChecker_Env.gamma_sig);
                      FStar_TypeChecker_Env.gamma_cache =
                        (uu___404_10107.FStar_TypeChecker_Env.gamma_cache);
                      FStar_TypeChecker_Env.modules =
                        (uu___404_10107.FStar_TypeChecker_Env.modules);
                      FStar_TypeChecker_Env.expected_typ =
                        (uu___404_10107.FStar_TypeChecker_Env.expected_typ);
                      FStar_TypeChecker_Env.sigtab =
                        (uu___404_10107.FStar_TypeChecker_Env.sigtab);
                      FStar_TypeChecker_Env.attrtab =
                        (uu___404_10107.FStar_TypeChecker_Env.attrtab);
                      FStar_TypeChecker_Env.is_pattern =
                        (uu___404_10107.FStar_TypeChecker_Env.is_pattern);
                      FStar_TypeChecker_Env.instantiate_imp =
                        (uu___404_10107.FStar_TypeChecker_Env.instantiate_imp);
                      FStar_TypeChecker_Env.effects =
                        (uu___404_10107.FStar_TypeChecker_Env.effects);
                      FStar_TypeChecker_Env.generalize =
                        (uu___404_10107.FStar_TypeChecker_Env.generalize);
                      FStar_TypeChecker_Env.letrecs =
                        (uu___404_10107.FStar_TypeChecker_Env.letrecs);
                      FStar_TypeChecker_Env.top_level =
                        (uu___404_10107.FStar_TypeChecker_Env.top_level);
                      FStar_TypeChecker_Env.check_uvars =
                        (uu___404_10107.FStar_TypeChecker_Env.check_uvars);
                      FStar_TypeChecker_Env.use_eq =
                        (uu___404_10107.FStar_TypeChecker_Env.use_eq);
                      FStar_TypeChecker_Env.is_iface =
                        (uu___404_10107.FStar_TypeChecker_Env.is_iface);
                      FStar_TypeChecker_Env.admit =
                        (uu___404_10107.FStar_TypeChecker_Env.admit);
                      FStar_TypeChecker_Env.lax = true;
                      FStar_TypeChecker_Env.lax_universes =
                        (uu___404_10107.FStar_TypeChecker_Env.lax_universes);
                      FStar_TypeChecker_Env.phase1 = true;
                      FStar_TypeChecker_Env.failhard =
                        (uu___404_10107.FStar_TypeChecker_Env.failhard);
                      FStar_TypeChecker_Env.nosynth =
                        (uu___404_10107.FStar_TypeChecker_Env.nosynth);
                      FStar_TypeChecker_Env.uvar_subtyping =
                        (uu___404_10107.FStar_TypeChecker_Env.uvar_subtyping);
                      FStar_TypeChecker_Env.tc_term =
                        (uu___404_10107.FStar_TypeChecker_Env.tc_term);
                      FStar_TypeChecker_Env.type_of =
                        (uu___404_10107.FStar_TypeChecker_Env.type_of);
                      FStar_TypeChecker_Env.universe_of =
                        (uu___404_10107.FStar_TypeChecker_Env.universe_of);
                      FStar_TypeChecker_Env.check_type_of =
                        (uu___404_10107.FStar_TypeChecker_Env.check_type_of);
                      FStar_TypeChecker_Env.use_bv_sorts =
                        (uu___404_10107.FStar_TypeChecker_Env.use_bv_sorts);
                      FStar_TypeChecker_Env.qtbl_name_and_index =
                        (uu___404_10107.FStar_TypeChecker_Env.qtbl_name_and_index);
                      FStar_TypeChecker_Env.normalized_eff_names =
                        (uu___404_10107.FStar_TypeChecker_Env.normalized_eff_names);
                      FStar_TypeChecker_Env.fv_delta_depths =
                        (uu___404_10107.FStar_TypeChecker_Env.fv_delta_depths);
                      FStar_TypeChecker_Env.proof_ns =
                        (uu___404_10107.FStar_TypeChecker_Env.proof_ns);
                      FStar_TypeChecker_Env.synth_hook =
                        (uu___404_10107.FStar_TypeChecker_Env.synth_hook);
                      FStar_TypeChecker_Env.splice =
                        (uu___404_10107.FStar_TypeChecker_Env.splice);
                      FStar_TypeChecker_Env.postprocess =
                        (uu___404_10107.FStar_TypeChecker_Env.postprocess);
                      FStar_TypeChecker_Env.is_native_tactic =
                        (uu___404_10107.FStar_TypeChecker_Env.is_native_tactic);
                      FStar_TypeChecker_Env.identifier_info =
                        (uu___404_10107.FStar_TypeChecker_Env.identifier_info);
                      FStar_TypeChecker_Env.tc_hooks =
                        (uu___404_10107.FStar_TypeChecker_Env.tc_hooks);
                      FStar_TypeChecker_Env.dsenv =
                        (uu___404_10107.FStar_TypeChecker_Env.dsenv);
                      FStar_TypeChecker_Env.nbe =
                        (uu___404_10107.FStar_TypeChecker_Env.nbe)
                    }) (uvs, t) se.FStar_Syntax_Syntax.sigrng
                  in
               match uu____10104 with
               | (uvs1,t1) ->
                   ((let uu____10131 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env1)
                         (FStar_Options.Other "TwoPhases")
                        in
                     if uu____10131
                     then
                       let uu____10132 = FStar_Syntax_Print.term_to_string t1
                          in
                       let uu____10133 =
                         FStar_Syntax_Print.univ_names_to_string uvs1  in
                       FStar_Util.print2
                         "Assume after phase 1: %s and uvs: %s\n" uu____10132
                         uu____10133
                     else ());
                    (uvs1, t1))
             else (uvs, t)  in
           (match uu____10086 with
            | (uvs1,t1) ->
                let uu____10164 =
                  tc_assume env1 (uvs1, t1) se.FStar_Syntax_Syntax.sigrng  in
                (match uu____10164 with
                 | (uvs2,t2) ->
                     ([(let uu___405_10194 = se  in
                        {
                          FStar_Syntax_Syntax.sigel =
                            (FStar_Syntax_Syntax.Sig_assume (lid, uvs2, t2));
                          FStar_Syntax_Syntax.sigrng =
                            (uu___405_10194.FStar_Syntax_Syntax.sigrng);
                          FStar_Syntax_Syntax.sigquals =
                            (uu___405_10194.FStar_Syntax_Syntax.sigquals);
                          FStar_Syntax_Syntax.sigmeta =
                            (uu___405_10194.FStar_Syntax_Syntax.sigmeta);
                          FStar_Syntax_Syntax.sigattrs =
                            (uu___405_10194.FStar_Syntax_Syntax.sigattrs)
                        })], [], env0)))
       | FStar_Syntax_Syntax.Sig_main e ->
           let env1 = FStar_TypeChecker_Env.set_range env r  in
           let env2 =
             FStar_TypeChecker_Env.set_expected_typ env1
               FStar_Syntax_Syntax.t_unit
              in
           let uu____10198 = FStar_TypeChecker_TcTerm.tc_term env2 e  in
           (match uu____10198 with
            | (e1,c,g1) ->
                let uu____10218 =
                  let uu____10225 =
                    let uu____10228 =
                      FStar_Syntax_Util.ml_comp FStar_Syntax_Syntax.t_unit r
                       in
                    FStar_Pervasives_Native.Some uu____10228  in
                  let uu____10229 =
                    let uu____10234 = FStar_Syntax_Syntax.lcomp_comp c  in
                    (e1, uu____10234)  in
                  FStar_TypeChecker_TcTerm.check_expected_effect env2
                    uu____10225 uu____10229
                   in
                (match uu____10218 with
                 | (e2,uu____10246,g) ->
                     ((let uu____10249 =
                         FStar_TypeChecker_Env.conj_guard g1 g  in
                       FStar_TypeChecker_Rel.force_trivial_guard env2
                         uu____10249);
                      (let se1 =
                         let uu___406_10251 = se  in
                         {
                           FStar_Syntax_Syntax.sigel =
                             (FStar_Syntax_Syntax.Sig_main e2);
                           FStar_Syntax_Syntax.sigrng =
                             (uu___406_10251.FStar_Syntax_Syntax.sigrng);
                           FStar_Syntax_Syntax.sigquals =
                             (uu___406_10251.FStar_Syntax_Syntax.sigquals);
                           FStar_Syntax_Syntax.sigmeta =
                             (uu___406_10251.FStar_Syntax_Syntax.sigmeta);
                           FStar_Syntax_Syntax.sigattrs =
                             (uu___406_10251.FStar_Syntax_Syntax.sigattrs)
                         }  in
                       ([se1], [], env0)))))
       | FStar_Syntax_Syntax.Sig_splice (lids,t) ->
           ((let uu____10263 = FStar_Options.debug_any ()  in
             if uu____10263
             then
               let uu____10264 =
                 FStar_Ident.string_of_lid
                   env.FStar_TypeChecker_Env.curmodule
                  in
               let uu____10265 = FStar_Syntax_Print.term_to_string t  in
               FStar_Util.print2 "%s: Found splice of (%s)\n" uu____10264
                 uu____10265
             else ());
            (let uu____10267 = FStar_TypeChecker_TcTerm.tc_tactic env t  in
             match uu____10267 with
             | (t1,uu____10285,g) ->
                 (FStar_TypeChecker_Rel.force_trivial_guard env g;
                  (let ses = env.FStar_TypeChecker_Env.splice env t1  in
                   let lids' =
                     FStar_List.collect FStar_Syntax_Util.lids_of_sigelt ses
                      in
                   FStar_List.iter
                     (fun lid  ->
                        let uu____10299 =
                          FStar_List.tryFind (FStar_Ident.lid_equals lid)
                            lids'
                           in
                        match uu____10299 with
                        | FStar_Pervasives_Native.Some uu____10302 -> ()
                        | FStar_Pervasives_Native.None  ->
                            let uu____10303 =
                              let uu____10308 =
                                let uu____10309 =
                                  FStar_Ident.string_of_lid lid  in
                                let uu____10310 =
                                  let uu____10311 =
                                    FStar_List.map FStar_Ident.string_of_lid
                                      lids'
                                     in
                                  FStar_All.pipe_left
                                    (FStar_String.concat ", ") uu____10311
                                   in
                                FStar_Util.format2
                                  "Splice declared the name %s but it was not defined.\nThose defined were: %s"
                                  uu____10309 uu____10310
                                 in
                              (FStar_Errors.Fatal_SplicedUndef, uu____10308)
                               in
                            FStar_Errors.raise_error uu____10303 r) lids;
                   (let dsenv1 =
                      FStar_List.fold_left
                        FStar_Syntax_DsEnv.push_sigelt_force
                        env.FStar_TypeChecker_Env.dsenv ses
                       in
                    let env1 =
                      let uu___407_10318 = env  in
                      {
                        FStar_TypeChecker_Env.solver =
                          (uu___407_10318.FStar_TypeChecker_Env.solver);
                        FStar_TypeChecker_Env.range =
                          (uu___407_10318.FStar_TypeChecker_Env.range);
                        FStar_TypeChecker_Env.curmodule =
                          (uu___407_10318.FStar_TypeChecker_Env.curmodule);
                        FStar_TypeChecker_Env.gamma =
                          (uu___407_10318.FStar_TypeChecker_Env.gamma);
                        FStar_TypeChecker_Env.gamma_sig =
                          (uu___407_10318.FStar_TypeChecker_Env.gamma_sig);
                        FStar_TypeChecker_Env.gamma_cache =
                          (uu___407_10318.FStar_TypeChecker_Env.gamma_cache);
                        FStar_TypeChecker_Env.modules =
                          (uu___407_10318.FStar_TypeChecker_Env.modules);
                        FStar_TypeChecker_Env.expected_typ =
                          (uu___407_10318.FStar_TypeChecker_Env.expected_typ);
                        FStar_TypeChecker_Env.sigtab =
                          (uu___407_10318.FStar_TypeChecker_Env.sigtab);
                        FStar_TypeChecker_Env.attrtab =
                          (uu___407_10318.FStar_TypeChecker_Env.attrtab);
                        FStar_TypeChecker_Env.is_pattern =
                          (uu___407_10318.FStar_TypeChecker_Env.is_pattern);
                        FStar_TypeChecker_Env.instantiate_imp =
                          (uu___407_10318.FStar_TypeChecker_Env.instantiate_imp);
                        FStar_TypeChecker_Env.effects =
                          (uu___407_10318.FStar_TypeChecker_Env.effects);
                        FStar_TypeChecker_Env.generalize =
                          (uu___407_10318.FStar_TypeChecker_Env.generalize);
                        FStar_TypeChecker_Env.letrecs =
                          (uu___407_10318.FStar_TypeChecker_Env.letrecs);
                        FStar_TypeChecker_Env.top_level =
                          (uu___407_10318.FStar_TypeChecker_Env.top_level);
                        FStar_TypeChecker_Env.check_uvars =
                          (uu___407_10318.FStar_TypeChecker_Env.check_uvars);
                        FStar_TypeChecker_Env.use_eq =
                          (uu___407_10318.FStar_TypeChecker_Env.use_eq);
                        FStar_TypeChecker_Env.is_iface =
                          (uu___407_10318.FStar_TypeChecker_Env.is_iface);
                        FStar_TypeChecker_Env.admit =
                          (uu___407_10318.FStar_TypeChecker_Env.admit);
                        FStar_TypeChecker_Env.lax =
                          (uu___407_10318.FStar_TypeChecker_Env.lax);
                        FStar_TypeChecker_Env.lax_universes =
                          (uu___407_10318.FStar_TypeChecker_Env.lax_universes);
                        FStar_TypeChecker_Env.phase1 =
                          (uu___407_10318.FStar_TypeChecker_Env.phase1);
                        FStar_TypeChecker_Env.failhard =
                          (uu___407_10318.FStar_TypeChecker_Env.failhard);
                        FStar_TypeChecker_Env.nosynth =
                          (uu___407_10318.FStar_TypeChecker_Env.nosynth);
                        FStar_TypeChecker_Env.uvar_subtyping =
                          (uu___407_10318.FStar_TypeChecker_Env.uvar_subtyping);
                        FStar_TypeChecker_Env.tc_term =
                          (uu___407_10318.FStar_TypeChecker_Env.tc_term);
                        FStar_TypeChecker_Env.type_of =
                          (uu___407_10318.FStar_TypeChecker_Env.type_of);
                        FStar_TypeChecker_Env.universe_of =
                          (uu___407_10318.FStar_TypeChecker_Env.universe_of);
                        FStar_TypeChecker_Env.check_type_of =
                          (uu___407_10318.FStar_TypeChecker_Env.check_type_of);
                        FStar_TypeChecker_Env.use_bv_sorts =
                          (uu___407_10318.FStar_TypeChecker_Env.use_bv_sorts);
                        FStar_TypeChecker_Env.qtbl_name_and_index =
                          (uu___407_10318.FStar_TypeChecker_Env.qtbl_name_and_index);
                        FStar_TypeChecker_Env.normalized_eff_names =
                          (uu___407_10318.FStar_TypeChecker_Env.normalized_eff_names);
                        FStar_TypeChecker_Env.fv_delta_depths =
                          (uu___407_10318.FStar_TypeChecker_Env.fv_delta_depths);
                        FStar_TypeChecker_Env.proof_ns =
                          (uu___407_10318.FStar_TypeChecker_Env.proof_ns);
                        FStar_TypeChecker_Env.synth_hook =
                          (uu___407_10318.FStar_TypeChecker_Env.synth_hook);
                        FStar_TypeChecker_Env.splice =
                          (uu___407_10318.FStar_TypeChecker_Env.splice);
                        FStar_TypeChecker_Env.postprocess =
                          (uu___407_10318.FStar_TypeChecker_Env.postprocess);
                        FStar_TypeChecker_Env.is_native_tactic =
                          (uu___407_10318.FStar_TypeChecker_Env.is_native_tactic);
                        FStar_TypeChecker_Env.identifier_info =
                          (uu___407_10318.FStar_TypeChecker_Env.identifier_info);
                        FStar_TypeChecker_Env.tc_hooks =
                          (uu___407_10318.FStar_TypeChecker_Env.tc_hooks);
                        FStar_TypeChecker_Env.dsenv = dsenv1;
                        FStar_TypeChecker_Env.nbe =
                          (uu___407_10318.FStar_TypeChecker_Env.nbe)
                      }  in
                    ([], ses, env1))))))
       | FStar_Syntax_Syntax.Sig_let (lbs,lids) ->
           let env1 = FStar_TypeChecker_Env.set_range env r  in
           let check_quals_eq l qopt q =
             match qopt with
             | FStar_Pervasives_Native.None  ->
                 FStar_Pervasives_Native.Some q
             | FStar_Pervasives_Native.Some q' ->
                 let drop_logic =
                   FStar_List.filter
                     (fun x  ->
                        Prims.op_Negation (x = FStar_Syntax_Syntax.Logic))
                    in
                 let uu____10386 =
                   let uu____10395 = drop_logic q  in
                   let uu____10398 = drop_logic q'  in
                   (uu____10395, uu____10398)  in
                 (match uu____10386 with
                  | (q1,q'1) ->
                      let uu____10419 =
                        ((FStar_List.length q1) = (FStar_List.length q'1)) &&
                          (FStar_List.forall2
                             FStar_Syntax_Util.qualifier_equal q1 q'1)
                         in
                      if uu____10419
                      then FStar_Pervasives_Native.Some q1
                      else
                        (let uu____10427 =
                           let uu____10432 =
                             let uu____10433 =
                               FStar_Syntax_Print.lid_to_string l  in
                             let uu____10434 =
                               FStar_Syntax_Print.quals_to_string q1  in
                             let uu____10435 =
                               FStar_Syntax_Print.quals_to_string q'1  in
                             FStar_Util.format3
                               "Inconsistent qualifier annotations on %s; Expected {%s}, got {%s}"
                               uu____10433 uu____10434 uu____10435
                              in
                           (FStar_Errors.Fatal_InconsistentQualifierAnnotation,
                             uu____10432)
                            in
                         FStar_Errors.raise_error uu____10427 r))
              in
           let rename_parameters lb =
             let rename_in_typ def typ =
               let typ1 = FStar_Syntax_Subst.compress typ  in
               let def_bs =
                 let uu____10469 =
                   let uu____10470 = FStar_Syntax_Subst.compress def  in
                   uu____10470.FStar_Syntax_Syntax.n  in
                 match uu____10469 with
                 | FStar_Syntax_Syntax.Tm_abs
                     (binders,uu____10482,uu____10483) -> binders
                 | uu____10508 -> []  in
               match typ1 with
               | {
                   FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_arrow
                     (val_bs,c);
                   FStar_Syntax_Syntax.pos = r1;
                   FStar_Syntax_Syntax.vars = uu____10520;_} ->
                   let has_auto_name bv =
                     FStar_Util.starts_with
                       (bv.FStar_Syntax_Syntax.ppname).FStar_Ident.idText
                       FStar_Ident.reserved_prefix
                      in
                   let rec rename_binders1 def_bs1 val_bs1 =
                     match (def_bs1, val_bs1) with
                     | ([],uu____10624) -> val_bs1
                     | (uu____10655,[]) -> val_bs1
                     | ((body_bv,uu____10687)::bt,(val_bv,aqual)::vt) ->
                         let uu____10744 = rename_binders1 bt vt  in
                         ((match ((has_auto_name body_bv),
                                   (has_auto_name val_bv))
                           with
                           | (true ,uu____10766) -> (val_bv, aqual)
                           | (false ,true ) ->
                               ((let uu___408_10772 = val_bv  in
                                 {
                                   FStar_Syntax_Syntax.ppname =
                                     (let uu___409_10775 =
                                        val_bv.FStar_Syntax_Syntax.ppname  in
                                      {
                                        FStar_Ident.idText =
                                          ((body_bv.FStar_Syntax_Syntax.ppname).FStar_Ident.idText);
                                        FStar_Ident.idRange =
                                          (uu___409_10775.FStar_Ident.idRange)
                                      });
                                   FStar_Syntax_Syntax.index =
                                     (uu___408_10772.FStar_Syntax_Syntax.index);
                                   FStar_Syntax_Syntax.sort =
                                     (uu___408_10772.FStar_Syntax_Syntax.sort)
                                 }), aqual)
                           | (false ,false ) -> (val_bv, aqual))) ::
                           uu____10744
                      in
                   let uu____10778 =
                     let uu____10785 =
                       let uu____10786 =
                         let uu____10801 = rename_binders1 def_bs val_bs  in
                         (uu____10801, c)  in
                       FStar_Syntax_Syntax.Tm_arrow uu____10786  in
                     FStar_Syntax_Syntax.mk uu____10785  in
                   uu____10778 FStar_Pervasives_Native.None r1
               | uu____10823 -> typ1  in
             let uu___410_10824 = lb  in
             let uu____10825 =
               rename_in_typ lb.FStar_Syntax_Syntax.lbdef
                 lb.FStar_Syntax_Syntax.lbtyp
                in
             {
               FStar_Syntax_Syntax.lbname =
                 (uu___410_10824.FStar_Syntax_Syntax.lbname);
               FStar_Syntax_Syntax.lbunivs =
                 (uu___410_10824.FStar_Syntax_Syntax.lbunivs);
               FStar_Syntax_Syntax.lbtyp = uu____10825;
               FStar_Syntax_Syntax.lbeff =
                 (uu___410_10824.FStar_Syntax_Syntax.lbeff);
               FStar_Syntax_Syntax.lbdef =
                 (uu___410_10824.FStar_Syntax_Syntax.lbdef);
               FStar_Syntax_Syntax.lbattrs =
                 (uu___410_10824.FStar_Syntax_Syntax.lbattrs);
               FStar_Syntax_Syntax.lbpos =
                 (uu___410_10824.FStar_Syntax_Syntax.lbpos)
             }  in
           let uu____10828 =
             FStar_All.pipe_right (FStar_Pervasives_Native.snd lbs)
               (FStar_List.fold_left
                  (fun uu____10879  ->
                     fun lb  ->
                       match uu____10879 with
                       | (gen1,lbs1,quals_opt) ->
                           let lbname =
                             FStar_Util.right lb.FStar_Syntax_Syntax.lbname
                              in
                           let uu____10921 =
                             let uu____10932 =
                               FStar_TypeChecker_Env.try_lookup_val_decl env1
                                 (lbname.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                                in
                             match uu____10932 with
                             | FStar_Pervasives_Native.None  ->
                                 if lb.FStar_Syntax_Syntax.lbunivs <> []
                                 then (false, lb, quals_opt)
                                 else (gen1, lb, quals_opt)
                             | FStar_Pervasives_Native.Some
                                 ((uvs,tval),quals) ->
                                 let quals_opt1 =
                                   check_quals_eq
                                     (lbname.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                                     quals_opt quals
                                    in
                                 let def =
                                   match (lb.FStar_Syntax_Syntax.lbtyp).FStar_Syntax_Syntax.n
                                   with
                                   | FStar_Syntax_Syntax.Tm_unknown  ->
                                       lb.FStar_Syntax_Syntax.lbdef
                                   | uu____11005 ->
                                       FStar_Syntax_Syntax.mk
                                         (FStar_Syntax_Syntax.Tm_ascribed
                                            ((lb.FStar_Syntax_Syntax.lbdef),
                                              ((FStar_Util.Inl
                                                  (lb.FStar_Syntax_Syntax.lbtyp)),
                                                FStar_Pervasives_Native.None),
                                              FStar_Pervasives_Native.None))
                                         FStar_Pervasives_Native.None
                                         (lb.FStar_Syntax_Syntax.lbdef).FStar_Syntax_Syntax.pos
                                    in
                                 (if
                                    (lb.FStar_Syntax_Syntax.lbunivs <> []) &&
                                      ((FStar_List.length
                                          lb.FStar_Syntax_Syntax.lbunivs)
                                         <> (FStar_List.length uvs))
                                  then
                                    FStar_Errors.raise_error
                                      (FStar_Errors.Fatal_IncoherentInlineUniverse,
                                        "Inline universes are incoherent with annotation from val declaration")
                                      r
                                  else ();
                                  (let uu____11048 =
                                     FStar_Syntax_Syntax.mk_lb
                                       ((FStar_Util.Inr lbname), uvs,
                                         FStar_Parser_Const.effect_ALL_lid,
                                         tval, def,
                                         (lb.FStar_Syntax_Syntax.lbpos))
                                      in
                                   (false, uu____11048, quals_opt1)))
                              in
                           (match uu____10921 with
                            | (gen2,lb1,quals_opt1) ->
                                (gen2, (lb1 :: lbs1), quals_opt1)))
                  (true, [],
                    (if se.FStar_Syntax_Syntax.sigquals = []
                     then FStar_Pervasives_Native.None
                     else
                       FStar_Pervasives_Native.Some
                         (se.FStar_Syntax_Syntax.sigquals))))
              in
           (match uu____10828 with
            | (should_generalize,lbs',quals_opt) ->
                let quals =
                  match quals_opt with
                  | FStar_Pervasives_Native.None  ->
                      [FStar_Syntax_Syntax.Visible_default]
                  | FStar_Pervasives_Native.Some q ->
                      let uu____11138 =
                        FStar_All.pipe_right q
                          (FStar_Util.for_some
                             (fun uu___368_11142  ->
                                match uu___368_11142 with
                                | FStar_Syntax_Syntax.Irreducible  -> true
                                | FStar_Syntax_Syntax.Visible_default  ->
                                    true
                                | FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen
                                     -> true
                                | uu____11143 -> false))
                         in
                      if uu____11138
                      then q
                      else FStar_Syntax_Syntax.Visible_default :: q
                   in
                let lbs'1 = FStar_List.rev lbs'  in
                let e =
                  let uu____11153 =
                    let uu____11160 =
                      let uu____11161 =
                        let uu____11174 =
                          FStar_Syntax_Syntax.mk
                            (FStar_Syntax_Syntax.Tm_constant
                               FStar_Const.Const_unit)
                            FStar_Pervasives_Native.None r
                           in
                        (((FStar_Pervasives_Native.fst lbs), lbs'1),
                          uu____11174)
                         in
                      FStar_Syntax_Syntax.Tm_let uu____11161  in
                    FStar_Syntax_Syntax.mk uu____11160  in
                  uu____11153 FStar_Pervasives_Native.None r  in
                let env' =
                  let uu___411_11193 = env1  in
                  {
                    FStar_TypeChecker_Env.solver =
                      (uu___411_11193.FStar_TypeChecker_Env.solver);
                    FStar_TypeChecker_Env.range =
                      (uu___411_11193.FStar_TypeChecker_Env.range);
                    FStar_TypeChecker_Env.curmodule =
                      (uu___411_11193.FStar_TypeChecker_Env.curmodule);
                    FStar_TypeChecker_Env.gamma =
                      (uu___411_11193.FStar_TypeChecker_Env.gamma);
                    FStar_TypeChecker_Env.gamma_sig =
                      (uu___411_11193.FStar_TypeChecker_Env.gamma_sig);
                    FStar_TypeChecker_Env.gamma_cache =
                      (uu___411_11193.FStar_TypeChecker_Env.gamma_cache);
                    FStar_TypeChecker_Env.modules =
                      (uu___411_11193.FStar_TypeChecker_Env.modules);
                    FStar_TypeChecker_Env.expected_typ =
                      (uu___411_11193.FStar_TypeChecker_Env.expected_typ);
                    FStar_TypeChecker_Env.sigtab =
                      (uu___411_11193.FStar_TypeChecker_Env.sigtab);
                    FStar_TypeChecker_Env.attrtab =
                      (uu___411_11193.FStar_TypeChecker_Env.attrtab);
                    FStar_TypeChecker_Env.is_pattern =
                      (uu___411_11193.FStar_TypeChecker_Env.is_pattern);
                    FStar_TypeChecker_Env.instantiate_imp =
                      (uu___411_11193.FStar_TypeChecker_Env.instantiate_imp);
                    FStar_TypeChecker_Env.effects =
                      (uu___411_11193.FStar_TypeChecker_Env.effects);
                    FStar_TypeChecker_Env.generalize = should_generalize;
                    FStar_TypeChecker_Env.letrecs =
                      (uu___411_11193.FStar_TypeChecker_Env.letrecs);
                    FStar_TypeChecker_Env.top_level = true;
                    FStar_TypeChecker_Env.check_uvars =
                      (uu___411_11193.FStar_TypeChecker_Env.check_uvars);
                    FStar_TypeChecker_Env.use_eq =
                      (uu___411_11193.FStar_TypeChecker_Env.use_eq);
                    FStar_TypeChecker_Env.is_iface =
                      (uu___411_11193.FStar_TypeChecker_Env.is_iface);
                    FStar_TypeChecker_Env.admit =
                      (uu___411_11193.FStar_TypeChecker_Env.admit);
                    FStar_TypeChecker_Env.lax =
                      (uu___411_11193.FStar_TypeChecker_Env.lax);
                    FStar_TypeChecker_Env.lax_universes =
                      (uu___411_11193.FStar_TypeChecker_Env.lax_universes);
                    FStar_TypeChecker_Env.phase1 =
                      (uu___411_11193.FStar_TypeChecker_Env.phase1);
                    FStar_TypeChecker_Env.failhard =
                      (uu___411_11193.FStar_TypeChecker_Env.failhard);
                    FStar_TypeChecker_Env.nosynth =
                      (uu___411_11193.FStar_TypeChecker_Env.nosynth);
                    FStar_TypeChecker_Env.uvar_subtyping =
                      (uu___411_11193.FStar_TypeChecker_Env.uvar_subtyping);
                    FStar_TypeChecker_Env.tc_term =
                      (uu___411_11193.FStar_TypeChecker_Env.tc_term);
                    FStar_TypeChecker_Env.type_of =
                      (uu___411_11193.FStar_TypeChecker_Env.type_of);
                    FStar_TypeChecker_Env.universe_of =
                      (uu___411_11193.FStar_TypeChecker_Env.universe_of);
                    FStar_TypeChecker_Env.check_type_of =
                      (uu___411_11193.FStar_TypeChecker_Env.check_type_of);
                    FStar_TypeChecker_Env.use_bv_sorts =
                      (uu___411_11193.FStar_TypeChecker_Env.use_bv_sorts);
                    FStar_TypeChecker_Env.qtbl_name_and_index =
                      (uu___411_11193.FStar_TypeChecker_Env.qtbl_name_and_index);
                    FStar_TypeChecker_Env.normalized_eff_names =
                      (uu___411_11193.FStar_TypeChecker_Env.normalized_eff_names);
                    FStar_TypeChecker_Env.fv_delta_depths =
                      (uu___411_11193.FStar_TypeChecker_Env.fv_delta_depths);
                    FStar_TypeChecker_Env.proof_ns =
                      (uu___411_11193.FStar_TypeChecker_Env.proof_ns);
                    FStar_TypeChecker_Env.synth_hook =
                      (uu___411_11193.FStar_TypeChecker_Env.synth_hook);
                    FStar_TypeChecker_Env.splice =
                      (uu___411_11193.FStar_TypeChecker_Env.splice);
                    FStar_TypeChecker_Env.postprocess =
                      (uu___411_11193.FStar_TypeChecker_Env.postprocess);
                    FStar_TypeChecker_Env.is_native_tactic =
                      (uu___411_11193.FStar_TypeChecker_Env.is_native_tactic);
                    FStar_TypeChecker_Env.identifier_info =
                      (uu___411_11193.FStar_TypeChecker_Env.identifier_info);
                    FStar_TypeChecker_Env.tc_hooks =
                      (uu___411_11193.FStar_TypeChecker_Env.tc_hooks);
                    FStar_TypeChecker_Env.dsenv =
                      (uu___411_11193.FStar_TypeChecker_Env.dsenv);
                    FStar_TypeChecker_Env.nbe =
                      (uu___411_11193.FStar_TypeChecker_Env.nbe)
                  }  in
                let e1 =
                  let uu____11195 =
                    (FStar_Options.use_two_phase_tc ()) &&
                      (FStar_TypeChecker_Env.should_verify env')
                     in
                  if uu____11195
                  then
                    let drop_lbtyp e_lax =
                      let uu____11202 =
                        let uu____11203 = FStar_Syntax_Subst.compress e_lax
                           in
                        uu____11203.FStar_Syntax_Syntax.n  in
                      match uu____11202 with
                      | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),e2) ->
                          let lb_unannotated =
                            let uu____11221 =
                              let uu____11222 = FStar_Syntax_Subst.compress e
                                 in
                              uu____11222.FStar_Syntax_Syntax.n  in
                            match uu____11221 with
                            | FStar_Syntax_Syntax.Tm_let
                                ((uu____11225,lb1::[]),uu____11227) ->
                                let uu____11240 =
                                  let uu____11241 =
                                    FStar_Syntax_Subst.compress
                                      lb1.FStar_Syntax_Syntax.lbtyp
                                     in
                                  uu____11241.FStar_Syntax_Syntax.n  in
                                (match uu____11240 with
                                 | FStar_Syntax_Syntax.Tm_unknown  -> true
                                 | uu____11244 -> false)
                            | uu____11245 ->
                                failwith
                                  "Impossible: first phase lb and second phase lb differ in structure!"
                             in
                          if lb_unannotated
                          then
                            let uu___412_11246 = e_lax  in
                            {
                              FStar_Syntax_Syntax.n =
                                (FStar_Syntax_Syntax.Tm_let
                                   ((false,
                                      [(let uu___413_11258 = lb  in
                                        {
                                          FStar_Syntax_Syntax.lbname =
                                            (uu___413_11258.FStar_Syntax_Syntax.lbname);
                                          FStar_Syntax_Syntax.lbunivs =
                                            (uu___413_11258.FStar_Syntax_Syntax.lbunivs);
                                          FStar_Syntax_Syntax.lbtyp =
                                            FStar_Syntax_Syntax.tun;
                                          FStar_Syntax_Syntax.lbeff =
                                            (uu___413_11258.FStar_Syntax_Syntax.lbeff);
                                          FStar_Syntax_Syntax.lbdef =
                                            (uu___413_11258.FStar_Syntax_Syntax.lbdef);
                                          FStar_Syntax_Syntax.lbattrs =
                                            (uu___413_11258.FStar_Syntax_Syntax.lbattrs);
                                          FStar_Syntax_Syntax.lbpos =
                                            (uu___413_11258.FStar_Syntax_Syntax.lbpos)
                                        })]), e2));
                              FStar_Syntax_Syntax.pos =
                                (uu___412_11246.FStar_Syntax_Syntax.pos);
                              FStar_Syntax_Syntax.vars =
                                (uu___412_11246.FStar_Syntax_Syntax.vars)
                            }
                          else e_lax
                      | uu____11260 -> e_lax  in
                    let e1 =
                      let uu____11262 =
                        let uu____11263 =
                          let uu____11264 =
                            FStar_TypeChecker_TcTerm.tc_maybe_toplevel_term
                              (let uu___414_11273 = env'  in
                               {
                                 FStar_TypeChecker_Env.solver =
                                   (uu___414_11273.FStar_TypeChecker_Env.solver);
                                 FStar_TypeChecker_Env.range =
                                   (uu___414_11273.FStar_TypeChecker_Env.range);
                                 FStar_TypeChecker_Env.curmodule =
                                   (uu___414_11273.FStar_TypeChecker_Env.curmodule);
                                 FStar_TypeChecker_Env.gamma =
                                   (uu___414_11273.FStar_TypeChecker_Env.gamma);
                                 FStar_TypeChecker_Env.gamma_sig =
                                   (uu___414_11273.FStar_TypeChecker_Env.gamma_sig);
                                 FStar_TypeChecker_Env.gamma_cache =
                                   (uu___414_11273.FStar_TypeChecker_Env.gamma_cache);
                                 FStar_TypeChecker_Env.modules =
                                   (uu___414_11273.FStar_TypeChecker_Env.modules);
                                 FStar_TypeChecker_Env.expected_typ =
                                   (uu___414_11273.FStar_TypeChecker_Env.expected_typ);
                                 FStar_TypeChecker_Env.sigtab =
                                   (uu___414_11273.FStar_TypeChecker_Env.sigtab);
                                 FStar_TypeChecker_Env.attrtab =
                                   (uu___414_11273.FStar_TypeChecker_Env.attrtab);
                                 FStar_TypeChecker_Env.is_pattern =
                                   (uu___414_11273.FStar_TypeChecker_Env.is_pattern);
                                 FStar_TypeChecker_Env.instantiate_imp =
                                   (uu___414_11273.FStar_TypeChecker_Env.instantiate_imp);
                                 FStar_TypeChecker_Env.effects =
                                   (uu___414_11273.FStar_TypeChecker_Env.effects);
                                 FStar_TypeChecker_Env.generalize =
                                   (uu___414_11273.FStar_TypeChecker_Env.generalize);
                                 FStar_TypeChecker_Env.letrecs =
                                   (uu___414_11273.FStar_TypeChecker_Env.letrecs);
                                 FStar_TypeChecker_Env.top_level =
                                   (uu___414_11273.FStar_TypeChecker_Env.top_level);
                                 FStar_TypeChecker_Env.check_uvars =
                                   (uu___414_11273.FStar_TypeChecker_Env.check_uvars);
                                 FStar_TypeChecker_Env.use_eq =
                                   (uu___414_11273.FStar_TypeChecker_Env.use_eq);
                                 FStar_TypeChecker_Env.is_iface =
                                   (uu___414_11273.FStar_TypeChecker_Env.is_iface);
                                 FStar_TypeChecker_Env.admit =
                                   (uu___414_11273.FStar_TypeChecker_Env.admit);
                                 FStar_TypeChecker_Env.lax = true;
                                 FStar_TypeChecker_Env.lax_universes =
                                   (uu___414_11273.FStar_TypeChecker_Env.lax_universes);
                                 FStar_TypeChecker_Env.phase1 = true;
                                 FStar_TypeChecker_Env.failhard =
                                   (uu___414_11273.FStar_TypeChecker_Env.failhard);
                                 FStar_TypeChecker_Env.nosynth =
                                   (uu___414_11273.FStar_TypeChecker_Env.nosynth);
                                 FStar_TypeChecker_Env.uvar_subtyping =
                                   (uu___414_11273.FStar_TypeChecker_Env.uvar_subtyping);
                                 FStar_TypeChecker_Env.tc_term =
                                   (uu___414_11273.FStar_TypeChecker_Env.tc_term);
                                 FStar_TypeChecker_Env.type_of =
                                   (uu___414_11273.FStar_TypeChecker_Env.type_of);
                                 FStar_TypeChecker_Env.universe_of =
                                   (uu___414_11273.FStar_TypeChecker_Env.universe_of);
                                 FStar_TypeChecker_Env.check_type_of =
                                   (uu___414_11273.FStar_TypeChecker_Env.check_type_of);
                                 FStar_TypeChecker_Env.use_bv_sorts =
                                   (uu___414_11273.FStar_TypeChecker_Env.use_bv_sorts);
                                 FStar_TypeChecker_Env.qtbl_name_and_index =
                                   (uu___414_11273.FStar_TypeChecker_Env.qtbl_name_and_index);
                                 FStar_TypeChecker_Env.normalized_eff_names =
                                   (uu___414_11273.FStar_TypeChecker_Env.normalized_eff_names);
                                 FStar_TypeChecker_Env.fv_delta_depths =
                                   (uu___414_11273.FStar_TypeChecker_Env.fv_delta_depths);
                                 FStar_TypeChecker_Env.proof_ns =
                                   (uu___414_11273.FStar_TypeChecker_Env.proof_ns);
                                 FStar_TypeChecker_Env.synth_hook =
                                   (uu___414_11273.FStar_TypeChecker_Env.synth_hook);
                                 FStar_TypeChecker_Env.splice =
                                   (uu___414_11273.FStar_TypeChecker_Env.splice);
                                 FStar_TypeChecker_Env.postprocess =
                                   (uu___414_11273.FStar_TypeChecker_Env.postprocess);
                                 FStar_TypeChecker_Env.is_native_tactic =
                                   (uu___414_11273.FStar_TypeChecker_Env.is_native_tactic);
                                 FStar_TypeChecker_Env.identifier_info =
                                   (uu___414_11273.FStar_TypeChecker_Env.identifier_info);
                                 FStar_TypeChecker_Env.tc_hooks =
                                   (uu___414_11273.FStar_TypeChecker_Env.tc_hooks);
                                 FStar_TypeChecker_Env.dsenv =
                                   (uu___414_11273.FStar_TypeChecker_Env.dsenv);
                                 FStar_TypeChecker_Env.nbe =
                                   (uu___414_11273.FStar_TypeChecker_Env.nbe)
                               }) e
                             in
                          FStar_All.pipe_right uu____11264
                            (fun uu____11284  ->
                               match uu____11284 with
                               | (e1,uu____11292,uu____11293) -> e1)
                           in
                        FStar_All.pipe_right uu____11263
                          (FStar_TypeChecker_Normalize.remove_uvar_solutions
                             env')
                         in
                      FStar_All.pipe_right uu____11262 drop_lbtyp  in
                    ((let uu____11295 =
                        FStar_All.pipe_left
                          (FStar_TypeChecker_Env.debug env1)
                          (FStar_Options.Other "TwoPhases")
                         in
                      if uu____11295
                      then
                        let uu____11296 =
                          FStar_Syntax_Print.term_to_string e1  in
                        FStar_Util.print1 "Let binding after phase 1: %s\n"
                          uu____11296
                      else ());
                     e1)
                  else e  in
                let uu____11299 =
                  let uu____11308 =
                    FStar_Syntax_Util.extract_attr'
                      FStar_Parser_Const.postprocess_with
                      se.FStar_Syntax_Syntax.sigattrs
                     in
                  match uu____11308 with
                  | FStar_Pervasives_Native.None  ->
                      ((se.FStar_Syntax_Syntax.sigattrs),
                        FStar_Pervasives_Native.None)
                  | FStar_Pervasives_Native.Some
                      (ats,(tau,FStar_Pervasives_Native.None )::[]) ->
                      (ats, (FStar_Pervasives_Native.Some tau))
                  | FStar_Pervasives_Native.Some (ats,args) ->
                      (FStar_Errors.log_issue r
                         (FStar_Errors.Warning_UnrecognizedAttribute,
                           "Ill-formed application of `postprocess_with`");
                       ((se.FStar_Syntax_Syntax.sigattrs),
                         FStar_Pervasives_Native.None))
                   in
                (match uu____11299 with
                 | (attrs,post_tau) ->
                     let se1 =
                       let uu___415_11411 = se  in
                       {
                         FStar_Syntax_Syntax.sigel =
                           (uu___415_11411.FStar_Syntax_Syntax.sigel);
                         FStar_Syntax_Syntax.sigrng =
                           (uu___415_11411.FStar_Syntax_Syntax.sigrng);
                         FStar_Syntax_Syntax.sigquals =
                           (uu___415_11411.FStar_Syntax_Syntax.sigquals);
                         FStar_Syntax_Syntax.sigmeta =
                           (uu___415_11411.FStar_Syntax_Syntax.sigmeta);
                         FStar_Syntax_Syntax.sigattrs = attrs
                       }  in
                     let postprocess_lb tau lb =
                       let lbdef =
                         env1.FStar_TypeChecker_Env.postprocess env1 tau
                           lb.FStar_Syntax_Syntax.lbtyp
                           lb.FStar_Syntax_Syntax.lbdef
                          in
                       let uu___416_11424 = lb  in
                       {
                         FStar_Syntax_Syntax.lbname =
                           (uu___416_11424.FStar_Syntax_Syntax.lbname);
                         FStar_Syntax_Syntax.lbunivs =
                           (uu___416_11424.FStar_Syntax_Syntax.lbunivs);
                         FStar_Syntax_Syntax.lbtyp =
                           (uu___416_11424.FStar_Syntax_Syntax.lbtyp);
                         FStar_Syntax_Syntax.lbeff =
                           (uu___416_11424.FStar_Syntax_Syntax.lbeff);
                         FStar_Syntax_Syntax.lbdef = lbdef;
                         FStar_Syntax_Syntax.lbattrs =
                           (uu___416_11424.FStar_Syntax_Syntax.lbattrs);
                         FStar_Syntax_Syntax.lbpos =
                           (uu___416_11424.FStar_Syntax_Syntax.lbpos)
                       }  in
                     let uu____11425 =
                       let uu____11436 =
                         FStar_TypeChecker_TcTerm.tc_maybe_toplevel_term env'
                           e1
                          in
                       match uu____11436 with
                       | ({
                            FStar_Syntax_Syntax.n =
                              FStar_Syntax_Syntax.Tm_let (lbs1,e2);
                            FStar_Syntax_Syntax.pos = uu____11455;
                            FStar_Syntax_Syntax.vars = uu____11456;_},uu____11457,g)
                           when FStar_TypeChecker_Env.is_trivial g ->
                           let lbs2 =
                             let uu____11484 =
                               FStar_All.pipe_right
                                 (FStar_Pervasives_Native.snd lbs1)
                                 (FStar_List.map rename_parameters)
                                in
                             ((FStar_Pervasives_Native.fst lbs1),
                               uu____11484)
                              in
                           let lbs3 =
                             let uu____11504 =
                               match post_tau with
                               | FStar_Pervasives_Native.Some tau ->
                                   FStar_List.map (postprocess_lb tau)
                                     (FStar_Pervasives_Native.snd lbs2)
                               | FStar_Pervasives_Native.None  ->
                                   FStar_Pervasives_Native.snd lbs2
                                in
                             ((FStar_Pervasives_Native.fst lbs2),
                               uu____11504)
                              in
                           let quals1 =
                             match e2.FStar_Syntax_Syntax.n with
                             | FStar_Syntax_Syntax.Tm_meta
                                 (uu____11523,FStar_Syntax_Syntax.Meta_desugared
                                  (FStar_Syntax_Syntax.Masked_effect ))
                                 -> FStar_Syntax_Syntax.HasMaskedEffect ::
                                 quals
                             | uu____11528 -> quals  in
                           ((let uu___417_11536 = se1  in
                             {
                               FStar_Syntax_Syntax.sigel =
                                 (FStar_Syntax_Syntax.Sig_let (lbs3, lids));
                               FStar_Syntax_Syntax.sigrng =
                                 (uu___417_11536.FStar_Syntax_Syntax.sigrng);
                               FStar_Syntax_Syntax.sigquals = quals1;
                               FStar_Syntax_Syntax.sigmeta =
                                 (uu___417_11536.FStar_Syntax_Syntax.sigmeta);
                               FStar_Syntax_Syntax.sigattrs =
                                 (uu___417_11536.FStar_Syntax_Syntax.sigattrs)
                             }), lbs3)
                       | uu____11539 ->
                           failwith
                             "impossible (typechecking should preserve Tm_let)"
                        in
                     (match uu____11425 with
                      | (se2,lbs1) ->
                          (FStar_All.pipe_right
                             (FStar_Pervasives_Native.snd lbs1)
                             (FStar_List.iter
                                (fun lb  ->
                                   let fv =
                                     FStar_Util.right
                                       lb.FStar_Syntax_Syntax.lbname
                                      in
                                   FStar_TypeChecker_Env.insert_fv_info env1
                                     fv lb.FStar_Syntax_Syntax.lbtyp));
                           (let uu____11590 = log env1  in
                            if uu____11590
                            then
                              let uu____11591 =
                                let uu____11592 =
                                  FStar_All.pipe_right
                                    (FStar_Pervasives_Native.snd lbs1)
                                    (FStar_List.map
                                       (fun lb  ->
                                          let should_log =
                                            let uu____11607 =
                                              let uu____11616 =
                                                let uu____11617 =
                                                  let uu____11620 =
                                                    FStar_Util.right
                                                      lb.FStar_Syntax_Syntax.lbname
                                                     in
                                                  uu____11620.FStar_Syntax_Syntax.fv_name
                                                   in
                                                uu____11617.FStar_Syntax_Syntax.v
                                                 in
                                              FStar_TypeChecker_Env.try_lookup_val_decl
                                                env1 uu____11616
                                               in
                                            match uu____11607 with
                                            | FStar_Pervasives_Native.None 
                                                -> true
                                            | uu____11627 -> false  in
                                          if should_log
                                          then
                                            let uu____11636 =
                                              FStar_Syntax_Print.lbname_to_string
                                                lb.FStar_Syntax_Syntax.lbname
                                               in
                                            let uu____11637 =
                                              FStar_Syntax_Print.term_to_string
                                                lb.FStar_Syntax_Syntax.lbtyp
                                               in
                                            FStar_Util.format2 "let %s : %s"
                                              uu____11636 uu____11637
                                          else ""))
                                   in
                                FStar_All.pipe_right uu____11592
                                  (FStar_String.concat "\n")
                                 in
                              FStar_Util.print1 "%s\n" uu____11591
                            else ());
                           ([se2], [], env0))))))
  
let (tc_decl :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sigelt ->
      (FStar_Syntax_Syntax.sigelt Prims.list,FStar_Syntax_Syntax.sigelt
                                               Prims.list,FStar_TypeChecker_Env.env)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun se  ->
      let env1 = set_hint_correlator env se  in
      (let uu____11678 = FStar_TypeChecker_Env.debug env1 FStar_Options.Low
          in
       if uu____11678
       then
         let uu____11679 = FStar_Syntax_Print.sigelt_to_string se  in
         FStar_Util.print1 ">>>>>>>>>>>>>>tc_decl %s\n" uu____11679
       else ());
      (let uu____11681 = get_fail_se se  in
       match uu____11681 with
       | FStar_Pervasives_Native.Some (uu____11700,false ) when
           let uu____11711 = FStar_TypeChecker_Env.should_verify env1  in
           Prims.op_Negation uu____11711 -> ([], [], env1)
       | FStar_Pervasives_Native.Some (errnos,lax1) ->
           let env' =
             if lax1
             then
               let uu___418_11729 = env1  in
               {
                 FStar_TypeChecker_Env.solver =
                   (uu___418_11729.FStar_TypeChecker_Env.solver);
                 FStar_TypeChecker_Env.range =
                   (uu___418_11729.FStar_TypeChecker_Env.range);
                 FStar_TypeChecker_Env.curmodule =
                   (uu___418_11729.FStar_TypeChecker_Env.curmodule);
                 FStar_TypeChecker_Env.gamma =
                   (uu___418_11729.FStar_TypeChecker_Env.gamma);
                 FStar_TypeChecker_Env.gamma_sig =
                   (uu___418_11729.FStar_TypeChecker_Env.gamma_sig);
                 FStar_TypeChecker_Env.gamma_cache =
                   (uu___418_11729.FStar_TypeChecker_Env.gamma_cache);
                 FStar_TypeChecker_Env.modules =
                   (uu___418_11729.FStar_TypeChecker_Env.modules);
                 FStar_TypeChecker_Env.expected_typ =
                   (uu___418_11729.FStar_TypeChecker_Env.expected_typ);
                 FStar_TypeChecker_Env.sigtab =
                   (uu___418_11729.FStar_TypeChecker_Env.sigtab);
                 FStar_TypeChecker_Env.attrtab =
                   (uu___418_11729.FStar_TypeChecker_Env.attrtab);
                 FStar_TypeChecker_Env.is_pattern =
                   (uu___418_11729.FStar_TypeChecker_Env.is_pattern);
                 FStar_TypeChecker_Env.instantiate_imp =
                   (uu___418_11729.FStar_TypeChecker_Env.instantiate_imp);
                 FStar_TypeChecker_Env.effects =
                   (uu___418_11729.FStar_TypeChecker_Env.effects);
                 FStar_TypeChecker_Env.generalize =
                   (uu___418_11729.FStar_TypeChecker_Env.generalize);
                 FStar_TypeChecker_Env.letrecs =
                   (uu___418_11729.FStar_TypeChecker_Env.letrecs);
                 FStar_TypeChecker_Env.top_level =
                   (uu___418_11729.FStar_TypeChecker_Env.top_level);
                 FStar_TypeChecker_Env.check_uvars =
                   (uu___418_11729.FStar_TypeChecker_Env.check_uvars);
                 FStar_TypeChecker_Env.use_eq =
                   (uu___418_11729.FStar_TypeChecker_Env.use_eq);
                 FStar_TypeChecker_Env.is_iface =
                   (uu___418_11729.FStar_TypeChecker_Env.is_iface);
                 FStar_TypeChecker_Env.admit =
                   (uu___418_11729.FStar_TypeChecker_Env.admit);
                 FStar_TypeChecker_Env.lax = true;
                 FStar_TypeChecker_Env.lax_universes =
                   (uu___418_11729.FStar_TypeChecker_Env.lax_universes);
                 FStar_TypeChecker_Env.phase1 =
                   (uu___418_11729.FStar_TypeChecker_Env.phase1);
                 FStar_TypeChecker_Env.failhard =
                   (uu___418_11729.FStar_TypeChecker_Env.failhard);
                 FStar_TypeChecker_Env.nosynth =
                   (uu___418_11729.FStar_TypeChecker_Env.nosynth);
                 FStar_TypeChecker_Env.uvar_subtyping =
                   (uu___418_11729.FStar_TypeChecker_Env.uvar_subtyping);
                 FStar_TypeChecker_Env.tc_term =
                   (uu___418_11729.FStar_TypeChecker_Env.tc_term);
                 FStar_TypeChecker_Env.type_of =
                   (uu___418_11729.FStar_TypeChecker_Env.type_of);
                 FStar_TypeChecker_Env.universe_of =
                   (uu___418_11729.FStar_TypeChecker_Env.universe_of);
                 FStar_TypeChecker_Env.check_type_of =
                   (uu___418_11729.FStar_TypeChecker_Env.check_type_of);
                 FStar_TypeChecker_Env.use_bv_sorts =
                   (uu___418_11729.FStar_TypeChecker_Env.use_bv_sorts);
                 FStar_TypeChecker_Env.qtbl_name_and_index =
                   (uu___418_11729.FStar_TypeChecker_Env.qtbl_name_and_index);
                 FStar_TypeChecker_Env.normalized_eff_names =
                   (uu___418_11729.FStar_TypeChecker_Env.normalized_eff_names);
                 FStar_TypeChecker_Env.fv_delta_depths =
                   (uu___418_11729.FStar_TypeChecker_Env.fv_delta_depths);
                 FStar_TypeChecker_Env.proof_ns =
                   (uu___418_11729.FStar_TypeChecker_Env.proof_ns);
                 FStar_TypeChecker_Env.synth_hook =
                   (uu___418_11729.FStar_TypeChecker_Env.synth_hook);
                 FStar_TypeChecker_Env.splice =
                   (uu___418_11729.FStar_TypeChecker_Env.splice);
                 FStar_TypeChecker_Env.postprocess =
                   (uu___418_11729.FStar_TypeChecker_Env.postprocess);
                 FStar_TypeChecker_Env.is_native_tactic =
                   (uu___418_11729.FStar_TypeChecker_Env.is_native_tactic);
                 FStar_TypeChecker_Env.identifier_info =
                   (uu___418_11729.FStar_TypeChecker_Env.identifier_info);
                 FStar_TypeChecker_Env.tc_hooks =
                   (uu___418_11729.FStar_TypeChecker_Env.tc_hooks);
                 FStar_TypeChecker_Env.dsenv =
                   (uu___418_11729.FStar_TypeChecker_Env.dsenv);
                 FStar_TypeChecker_Env.nbe =
                   (uu___418_11729.FStar_TypeChecker_Env.nbe)
               }
             else env1  in
           ((let uu____11732 =
               FStar_TypeChecker_Env.debug env1 FStar_Options.Low  in
             if uu____11732
             then
               let uu____11733 =
                 let uu____11734 =
                   FStar_List.map FStar_Util.string_of_int errnos  in
                 FStar_All.pipe_left (FStar_String.concat "; ") uu____11734
                  in
               FStar_Util.print1 ">> Expecting errors: [%s]\n" uu____11733
             else ());
            (let uu____11740 =
               FStar_Errors.catch_errors
                 (fun uu____11770  ->
                    FStar_Options.with_saved_options
                      (fun uu____11782  -> tc_decl' env' se))
                in
             match uu____11740 with
             | (errs,uu____11794) ->
                 ((let uu____11824 =
                     FStar_TypeChecker_Env.debug env1 FStar_Options.Low  in
                   if uu____11824
                   then
                     (FStar_Util.print_string ">> Got issues: [\n";
                      FStar_List.iter FStar_Errors.print_issue errs;
                      FStar_Util.print_string ">>]\n")
                   else ());
                  (let sort = FStar_List.sortWith (fun x  -> fun y  -> x - y)
                      in
                   let errnos1 = sort errnos  in
                   let actual =
                     let uu____11847 =
                       FStar_List.concatMap
                         (fun i  ->
                            list_of_option i.FStar_Errors.issue_number) errs
                        in
                     sort uu____11847  in
                   (match errs with
                    | [] ->
                        (FStar_List.iter FStar_Errors.print_issue errs;
                         FStar_Errors.log_issue se.FStar_Syntax_Syntax.sigrng
                           (FStar_Errors.Error_DidNotFail,
                             "This top-level definition was expected to fail, but it succeeded"))
                    | uu____11854 ->
                        if (errnos1 <> []) && (errnos1 <> actual)
                        then
                          let uu____11861 =
                            let uu____11868 =
                              check_multi_contained errnos1 actual  in
                            match uu____11868 with
                            | FStar_Pervasives_Native.Some r -> r
                            | FStar_Pervasives_Native.None  ->
                                ((~- (Prims.parse_int "1")),
                                  (~- (Prims.parse_int "1")),
                                  (~- (Prims.parse_int "1")))
                             in
                          (match uu____11861 with
                           | (e,n1,n2) ->
                               (FStar_List.iter FStar_Errors.print_issue errs;
                                (let uu____11906 =
                                   let uu____11911 =
                                     let uu____11912 =
                                       FStar_Common.string_of_list
                                         FStar_Util.string_of_int errnos1
                                        in
                                     let uu____11913 =
                                       FStar_Common.string_of_list
                                         FStar_Util.string_of_int actual
                                        in
                                     let uu____11914 =
                                       FStar_Util.string_of_int e  in
                                     let uu____11915 =
                                       FStar_Util.string_of_int n2  in
                                     let uu____11916 =
                                       FStar_Util.string_of_int n1  in
                                     FStar_Util.format5
                                       "This top-level definition was expected to raise error codes %s, but it raised %s. Error #%s was raised %s times, instead of %s."
                                       uu____11912 uu____11913 uu____11914
                                       uu____11915 uu____11916
                                      in
                                   (FStar_Errors.Error_DidNotFail,
                                     uu____11911)
                                    in
                                 FStar_Errors.log_issue
                                   se.FStar_Syntax_Syntax.sigrng uu____11906)))
                        else ());
                   ([], [], env1)))))
       | FStar_Pervasives_Native.None  -> tc_decl' env1 se)
  
let (for_export :
  FStar_Ident.lident Prims.list ->
    FStar_Syntax_Syntax.sigelt ->
      (FStar_Syntax_Syntax.sigelt Prims.list,FStar_Ident.lident Prims.list)
        FStar_Pervasives_Native.tuple2)
  =
  fun hidden  ->
    fun se  ->
      let is_abstract quals =
        FStar_All.pipe_right quals
          (FStar_Util.for_some
             (fun uu___369_11971  ->
                match uu___369_11971 with
                | FStar_Syntax_Syntax.Abstract  -> true
                | uu____11972 -> false))
         in
      let is_hidden_proj_or_disc q =
        match q with
        | FStar_Syntax_Syntax.Projector (l,uu____11980) ->
            FStar_All.pipe_right hidden
              (FStar_Util.for_some (FStar_Ident.lid_equals l))
        | FStar_Syntax_Syntax.Discriminator l ->
            FStar_All.pipe_right hidden
              (FStar_Util.for_some (FStar_Ident.lid_equals l))
        | uu____11986 -> false  in
      match se.FStar_Syntax_Syntax.sigel with
      | FStar_Syntax_Syntax.Sig_pragma uu____11995 -> ([], hidden)
      | FStar_Syntax_Syntax.Sig_splice uu____12000 ->
          failwith "Impossible (Already handled)"
      | FStar_Syntax_Syntax.Sig_inductive_typ uu____12015 ->
          failwith "Impossible (Already handled)"
      | FStar_Syntax_Syntax.Sig_datacon uu____12040 ->
          failwith "Impossible (Already handled)"
      | FStar_Syntax_Syntax.Sig_bundle (ses,uu____12064) ->
          let uu____12073 = is_abstract se.FStar_Syntax_Syntax.sigquals  in
          if uu____12073
          then
            let for_export_bundle se1 uu____12108 =
              match uu____12108 with
              | (out,hidden1) ->
                  (match se1.FStar_Syntax_Syntax.sigel with
                   | FStar_Syntax_Syntax.Sig_inductive_typ
                       (l,us,bs,t,uu____12147,uu____12148) ->
                       let dec =
                         let uu___419_12158 = se1  in
                         let uu____12159 =
                           let uu____12160 =
                             let uu____12167 =
                               let uu____12168 =
                                 FStar_Syntax_Syntax.mk_Total t  in
                               FStar_Syntax_Util.arrow bs uu____12168  in
                             (l, us, uu____12167)  in
                           FStar_Syntax_Syntax.Sig_declare_typ uu____12160
                            in
                         {
                           FStar_Syntax_Syntax.sigel = uu____12159;
                           FStar_Syntax_Syntax.sigrng =
                             (uu___419_12158.FStar_Syntax_Syntax.sigrng);
                           FStar_Syntax_Syntax.sigquals =
                             (FStar_Syntax_Syntax.Assumption ::
                             FStar_Syntax_Syntax.New ::
                             (se1.FStar_Syntax_Syntax.sigquals));
                           FStar_Syntax_Syntax.sigmeta =
                             (uu___419_12158.FStar_Syntax_Syntax.sigmeta);
                           FStar_Syntax_Syntax.sigattrs =
                             (uu___419_12158.FStar_Syntax_Syntax.sigattrs)
                         }  in
                       ((dec :: out), hidden1)
                   | FStar_Syntax_Syntax.Sig_datacon
                       (l,us,t,uu____12178,uu____12179,uu____12180) ->
                       let dec =
                         let uu___420_12186 = se1  in
                         {
                           FStar_Syntax_Syntax.sigel =
                             (FStar_Syntax_Syntax.Sig_declare_typ (l, us, t));
                           FStar_Syntax_Syntax.sigrng =
                             (uu___420_12186.FStar_Syntax_Syntax.sigrng);
                           FStar_Syntax_Syntax.sigquals =
                             [FStar_Syntax_Syntax.Assumption];
                           FStar_Syntax_Syntax.sigmeta =
                             (uu___420_12186.FStar_Syntax_Syntax.sigmeta);
                           FStar_Syntax_Syntax.sigattrs =
                             (uu___420_12186.FStar_Syntax_Syntax.sigattrs)
                         }  in
                       ((dec :: out), (l :: hidden1))
                   | uu____12191 -> (out, hidden1))
               in
            FStar_List.fold_right for_export_bundle ses ([], hidden)
          else ([se], hidden)
      | FStar_Syntax_Syntax.Sig_assume (uu____12213,uu____12214,uu____12215)
          ->
          let uu____12216 = is_abstract se.FStar_Syntax_Syntax.sigquals  in
          if uu____12216 then ([], hidden) else ([se], hidden)
      | FStar_Syntax_Syntax.Sig_declare_typ (l,us,t) ->
          let uu____12237 =
            FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
              (FStar_Util.for_some is_hidden_proj_or_disc)
             in
          if uu____12237
          then
            ([(let uu___421_12253 = se  in
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_declare_typ (l, us, t));
                 FStar_Syntax_Syntax.sigrng =
                   (uu___421_12253.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   [FStar_Syntax_Syntax.Assumption];
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___421_12253.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___421_12253.FStar_Syntax_Syntax.sigattrs)
               })], (l :: hidden))
          else
            (let uu____12255 =
               FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
                 (FStar_Util.for_some
                    (fun uu___370_12259  ->
                       match uu___370_12259 with
                       | FStar_Syntax_Syntax.Assumption  -> true
                       | FStar_Syntax_Syntax.Projector uu____12260 -> true
                       | FStar_Syntax_Syntax.Discriminator uu____12265 ->
                           true
                       | uu____12266 -> false))
                in
             if uu____12255 then ([se], hidden) else ([], hidden))
      | FStar_Syntax_Syntax.Sig_main uu____12284 -> ([], hidden)
      | FStar_Syntax_Syntax.Sig_new_effect uu____12289 -> ([se], hidden)
      | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____12294 ->
          ([se], hidden)
      | FStar_Syntax_Syntax.Sig_sub_effect uu____12299 -> ([se], hidden)
      | FStar_Syntax_Syntax.Sig_effect_abbrev uu____12304 -> ([se], hidden)
      | FStar_Syntax_Syntax.Sig_let ((false ,lb::[]),uu____12322) when
          FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
            (FStar_Util.for_some is_hidden_proj_or_disc)
          ->
          let fv = FStar_Util.right lb.FStar_Syntax_Syntax.lbname  in
          let lid = (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          let uu____12333 =
            FStar_All.pipe_right hidden
              (FStar_Util.for_some (FStar_Syntax_Syntax.fv_eq_lid fv))
             in
          if uu____12333
          then ([], hidden)
          else
            (let dec =
               let uu____12350 = FStar_Ident.range_of_lid lid  in
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_declare_typ
                      (((fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v),
                        (lb.FStar_Syntax_Syntax.lbunivs),
                        (lb.FStar_Syntax_Syntax.lbtyp)));
                 FStar_Syntax_Syntax.sigrng = uu____12350;
                 FStar_Syntax_Syntax.sigquals =
                   [FStar_Syntax_Syntax.Assumption];
                 FStar_Syntax_Syntax.sigmeta =
                   FStar_Syntax_Syntax.default_sigmeta;
                 FStar_Syntax_Syntax.sigattrs = []
               }  in
             ([dec], (lid :: hidden)))
      | FStar_Syntax_Syntax.Sig_let (lbs,l) ->
          let uu____12361 = is_abstract se.FStar_Syntax_Syntax.sigquals  in
          if uu____12361
          then
            let uu____12370 =
              FStar_All.pipe_right (FStar_Pervasives_Native.snd lbs)
                (FStar_List.map
                   (fun lb  ->
                      let uu___422_12383 = se  in
                      let uu____12384 =
                        let uu____12385 =
                          let uu____12392 =
                            let uu____12393 =
                              let uu____12396 =
                                FStar_Util.right
                                  lb.FStar_Syntax_Syntax.lbname
                                 in
                              uu____12396.FStar_Syntax_Syntax.fv_name  in
                            uu____12393.FStar_Syntax_Syntax.v  in
                          (uu____12392, (lb.FStar_Syntax_Syntax.lbunivs),
                            (lb.FStar_Syntax_Syntax.lbtyp))
                           in
                        FStar_Syntax_Syntax.Sig_declare_typ uu____12385  in
                      {
                        FStar_Syntax_Syntax.sigel = uu____12384;
                        FStar_Syntax_Syntax.sigrng =
                          (uu___422_12383.FStar_Syntax_Syntax.sigrng);
                        FStar_Syntax_Syntax.sigquals =
                          (FStar_Syntax_Syntax.Assumption ::
                          (se.FStar_Syntax_Syntax.sigquals));
                        FStar_Syntax_Syntax.sigmeta =
                          (uu___422_12383.FStar_Syntax_Syntax.sigmeta);
                        FStar_Syntax_Syntax.sigattrs =
                          (uu___422_12383.FStar_Syntax_Syntax.sigattrs)
                      }))
               in
            (uu____12370, hidden)
          else ([se], hidden)
  
let (add_sigelt_to_env :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sigelt -> FStar_TypeChecker_Env.env)
  =
  fun env  ->
    fun se  ->
      (let uu____12417 = FStar_TypeChecker_Env.debug env FStar_Options.Low
          in
       if uu____12417
       then
         let uu____12418 = FStar_Syntax_Print.sigelt_to_string se  in
         FStar_Util.print1
           ">>>>>>>>>>>>>>Adding top-level decl to environment: %s\n"
           uu____12418
       else ());
      (match se.FStar_Syntax_Syntax.sigel with
       | FStar_Syntax_Syntax.Sig_inductive_typ uu____12420 ->
           failwith "add_sigelt_to_env: Impossible, bare data constructor"
       | FStar_Syntax_Syntax.Sig_datacon uu____12437 ->
           failwith "add_sigelt_to_env: Impossible, bare data constructor"
       | FStar_Syntax_Syntax.Sig_pragma (FStar_Syntax_Syntax.ResetOptions
           uu____12452) -> z3_reset_options env
       | FStar_Syntax_Syntax.Sig_pragma uu____12455 -> env
       | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____12456 -> env
       | FStar_Syntax_Syntax.Sig_new_effect ne ->
           let env1 = FStar_TypeChecker_Env.push_sigelt env se  in
           FStar_All.pipe_right ne.FStar_Syntax_Syntax.actions
             (FStar_List.fold_left
                (fun env2  ->
                   fun a  ->
                     let uu____12466 =
                       FStar_Syntax_Util.action_as_lb
                         ne.FStar_Syntax_Syntax.mname a
                         (a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos
                        in
                     FStar_TypeChecker_Env.push_sigelt env2 uu____12466) env1)
       | FStar_Syntax_Syntax.Sig_declare_typ
           (uu____12467,uu____12468,uu____12469) when
           FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
             (FStar_Util.for_some
                (fun uu___371_12473  ->
                   match uu___371_12473 with
                   | FStar_Syntax_Syntax.OnlyName  -> true
                   | uu____12474 -> false))
           -> env
       | FStar_Syntax_Syntax.Sig_let (uu____12475,uu____12476) when
           FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
             (FStar_Util.for_some
                (fun uu___371_12484  ->
                   match uu___371_12484 with
                   | FStar_Syntax_Syntax.OnlyName  -> true
                   | uu____12485 -> false))
           -> env
       | uu____12486 -> FStar_TypeChecker_Env.push_sigelt env se)
  
let (tc_decls :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sigelt Prims.list ->
      (FStar_Syntax_Syntax.sigelt Prims.list,FStar_Syntax_Syntax.sigelt
                                               Prims.list,FStar_TypeChecker_Env.env)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun ses  ->
      let rec process_one_decl uu____12554 se =
        match uu____12554 with
        | (ses1,exports,env1,hidden) ->
            ((let uu____12607 =
                FStar_TypeChecker_Env.debug env1 FStar_Options.Low  in
              if uu____12607
              then
                let uu____12608 = FStar_Syntax_Print.sigelt_to_string se  in
                FStar_Util.print1
                  ">>>>>>>>>>>>>>Checking top-level decl %s\n" uu____12608
              else ());
             (let uu____12610 = tc_decl env1 se  in
              match uu____12610 with
              | (ses',ses_elaborated,env2) ->
                  let ses'1 =
                    FStar_All.pipe_right ses'
                      (FStar_List.map
                         (fun se1  ->
                            (let uu____12663 =
                               FStar_TypeChecker_Env.debug env2
                                 (FStar_Options.Other "UF")
                                in
                             if uu____12663
                             then
                               let uu____12664 =
                                 FStar_Syntax_Print.sigelt_to_string se1  in
                               FStar_Util.print1
                                 "About to elim vars from %s\n" uu____12664
                             else ());
                            FStar_TypeChecker_Normalize.elim_uvars env2 se1))
                     in
                  let ses_elaborated1 =
                    FStar_All.pipe_right ses_elaborated
                      (FStar_List.map
                         (fun se1  ->
                            (let uu____12677 =
                               FStar_TypeChecker_Env.debug env2
                                 (FStar_Options.Other "UF")
                                in
                             if uu____12677
                             then
                               let uu____12678 =
                                 FStar_Syntax_Print.sigelt_to_string se1  in
                               FStar_Util.print1
                                 "About to elim vars from (elaborated) %s\\m"
                                 uu____12678
                             else ());
                            FStar_TypeChecker_Normalize.elim_uvars env2 se1))
                     in
                  (FStar_TypeChecker_Env.promote_id_info env2
                     (fun t  ->
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Env.AllowUnboundUniverses;
                          FStar_TypeChecker_Env.CheckNoUvars;
                          FStar_TypeChecker_Env.Beta;
                          FStar_TypeChecker_Env.DoNotUnfoldPureLets;
                          FStar_TypeChecker_Env.CompressUvars;
                          FStar_TypeChecker_Env.Exclude
                            FStar_TypeChecker_Env.Zeta;
                          FStar_TypeChecker_Env.Exclude
                            FStar_TypeChecker_Env.Iota;
                          FStar_TypeChecker_Env.NoFullNorm] env2 t);
                   (let env3 =
                      FStar_All.pipe_right ses'1
                        (FStar_List.fold_left
                           (fun env3  ->
                              fun se1  -> add_sigelt_to_env env3 se1) env2)
                       in
                    FStar_Syntax_Unionfind.reset ();
                    (let uu____12692 =
                       (FStar_Options.log_types ()) ||
                         (FStar_All.pipe_left
                            (FStar_TypeChecker_Env.debug env3)
                            (FStar_Options.Other "LogTypes"))
                        in
                     if uu____12692
                     then
                       let uu____12693 =
                         FStar_List.fold_left
                           (fun s  ->
                              fun se1  ->
                                let uu____12699 =
                                  let uu____12700 =
                                    FStar_Syntax_Print.sigelt_to_string se1
                                     in
                                  Prims.strcat uu____12700 "\n"  in
                                Prims.strcat s uu____12699) "" ses'1
                          in
                       FStar_Util.print1 "Checked: %s\n" uu____12693
                     else ());
                    FStar_List.iter
                      (fun se1  ->
                         (env3.FStar_TypeChecker_Env.solver).FStar_TypeChecker_Env.encode_sig
                           env3 se1) ses'1;
                    (let uu____12705 =
                       let uu____12714 =
                         FStar_Options.use_extracted_interfaces ()  in
                       if uu____12714
                       then ([], [])
                       else
                         (let accum_exports_hidden uu____12753 se1 =
                            match uu____12753 with
                            | (exports1,hidden1) ->
                                let uu____12781 = for_export hidden1 se1  in
                                (match uu____12781 with
                                 | (se_exported,hidden2) ->
                                     ((FStar_List.rev_append se_exported
                                         exports1), hidden2))
                             in
                          FStar_List.fold_left accum_exports_hidden
                            (exports, hidden) ses'1)
                        in
                     match uu____12705 with
                     | (exports1,hidden1) ->
                         (((FStar_List.rev_append ses'1 ses1), exports1,
                            env3, hidden1), ses_elaborated1))))))
         in
      let process_one_decl_timed acc se =
        let uu____12935 = acc  in
        match uu____12935 with
        | (uu____12970,uu____12971,env1,uu____12973) ->
            let uu____12986 =
              FStar_Util.record_time
                (fun uu____13032  -> process_one_decl acc se)
               in
            (match uu____12986 with
             | (r,ms_elapsed) ->
                 ((let uu____13096 =
                     (FStar_TypeChecker_Env.debug env1
                        (FStar_Options.Other "TCDeclTime"))
                       ||
                       (FStar_Util.for_some
                          (FStar_Syntax_Util.attr_eq
                             FStar_Syntax_Util.tcdecltime_attr)
                          se.FStar_Syntax_Syntax.sigattrs)
                      in
                   if uu____13096
                   then
                     let uu____13097 =
                       FStar_Syntax_Print.sigelt_to_string_short se  in
                     let uu____13098 = FStar_Util.string_of_int ms_elapsed
                        in
                     FStar_Util.print2 "Checked %s in %s milliseconds\n"
                       uu____13097 uu____13098
                   else ());
                  r))
         in
      let uu____13100 =
        FStar_Util.fold_flatten process_one_decl_timed ([], [], env, []) ses
         in
      match uu____13100 with
      | (ses1,exports,env1,uu____13148) ->
          ((FStar_List.rev_append ses1 []),
            (FStar_List.rev_append exports []), env1)
  
let (check_exports :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.modul ->
      FStar_Syntax_Syntax.sigelt Prims.list -> unit)
  =
  fun env  ->
    fun modul  ->
      fun exports  ->
        let env1 =
          let uu___423_13185 = env  in
          {
            FStar_TypeChecker_Env.solver =
              (uu___423_13185.FStar_TypeChecker_Env.solver);
            FStar_TypeChecker_Env.range =
              (uu___423_13185.FStar_TypeChecker_Env.range);
            FStar_TypeChecker_Env.curmodule =
              (uu___423_13185.FStar_TypeChecker_Env.curmodule);
            FStar_TypeChecker_Env.gamma =
              (uu___423_13185.FStar_TypeChecker_Env.gamma);
            FStar_TypeChecker_Env.gamma_sig =
              (uu___423_13185.FStar_TypeChecker_Env.gamma_sig);
            FStar_TypeChecker_Env.gamma_cache =
              (uu___423_13185.FStar_TypeChecker_Env.gamma_cache);
            FStar_TypeChecker_Env.modules =
              (uu___423_13185.FStar_TypeChecker_Env.modules);
            FStar_TypeChecker_Env.expected_typ =
              (uu___423_13185.FStar_TypeChecker_Env.expected_typ);
            FStar_TypeChecker_Env.sigtab =
              (uu___423_13185.FStar_TypeChecker_Env.sigtab);
            FStar_TypeChecker_Env.attrtab =
              (uu___423_13185.FStar_TypeChecker_Env.attrtab);
            FStar_TypeChecker_Env.is_pattern =
              (uu___423_13185.FStar_TypeChecker_Env.is_pattern);
            FStar_TypeChecker_Env.instantiate_imp =
              (uu___423_13185.FStar_TypeChecker_Env.instantiate_imp);
            FStar_TypeChecker_Env.effects =
              (uu___423_13185.FStar_TypeChecker_Env.effects);
            FStar_TypeChecker_Env.generalize =
              (uu___423_13185.FStar_TypeChecker_Env.generalize);
            FStar_TypeChecker_Env.letrecs =
              (uu___423_13185.FStar_TypeChecker_Env.letrecs);
            FStar_TypeChecker_Env.top_level = true;
            FStar_TypeChecker_Env.check_uvars =
              (uu___423_13185.FStar_TypeChecker_Env.check_uvars);
            FStar_TypeChecker_Env.use_eq =
              (uu___423_13185.FStar_TypeChecker_Env.use_eq);
            FStar_TypeChecker_Env.is_iface =
              (uu___423_13185.FStar_TypeChecker_Env.is_iface);
            FStar_TypeChecker_Env.admit =
              (uu___423_13185.FStar_TypeChecker_Env.admit);
            FStar_TypeChecker_Env.lax = true;
            FStar_TypeChecker_Env.lax_universes = true;
            FStar_TypeChecker_Env.phase1 =
              (uu___423_13185.FStar_TypeChecker_Env.phase1);
            FStar_TypeChecker_Env.failhard =
              (uu___423_13185.FStar_TypeChecker_Env.failhard);
            FStar_TypeChecker_Env.nosynth =
              (uu___423_13185.FStar_TypeChecker_Env.nosynth);
            FStar_TypeChecker_Env.uvar_subtyping =
              (uu___423_13185.FStar_TypeChecker_Env.uvar_subtyping);
            FStar_TypeChecker_Env.tc_term =
              (uu___423_13185.FStar_TypeChecker_Env.tc_term);
            FStar_TypeChecker_Env.type_of =
              (uu___423_13185.FStar_TypeChecker_Env.type_of);
            FStar_TypeChecker_Env.universe_of =
              (uu___423_13185.FStar_TypeChecker_Env.universe_of);
            FStar_TypeChecker_Env.check_type_of =
              (uu___423_13185.FStar_TypeChecker_Env.check_type_of);
            FStar_TypeChecker_Env.use_bv_sorts =
              (uu___423_13185.FStar_TypeChecker_Env.use_bv_sorts);
            FStar_TypeChecker_Env.qtbl_name_and_index =
              (uu___423_13185.FStar_TypeChecker_Env.qtbl_name_and_index);
            FStar_TypeChecker_Env.normalized_eff_names =
              (uu___423_13185.FStar_TypeChecker_Env.normalized_eff_names);
            FStar_TypeChecker_Env.fv_delta_depths =
              (uu___423_13185.FStar_TypeChecker_Env.fv_delta_depths);
            FStar_TypeChecker_Env.proof_ns =
              (uu___423_13185.FStar_TypeChecker_Env.proof_ns);
            FStar_TypeChecker_Env.synth_hook =
              (uu___423_13185.FStar_TypeChecker_Env.synth_hook);
            FStar_TypeChecker_Env.splice =
              (uu___423_13185.FStar_TypeChecker_Env.splice);
            FStar_TypeChecker_Env.postprocess =
              (uu___423_13185.FStar_TypeChecker_Env.postprocess);
            FStar_TypeChecker_Env.is_native_tactic =
              (uu___423_13185.FStar_TypeChecker_Env.is_native_tactic);
            FStar_TypeChecker_Env.identifier_info =
              (uu___423_13185.FStar_TypeChecker_Env.identifier_info);
            FStar_TypeChecker_Env.tc_hooks =
              (uu___423_13185.FStar_TypeChecker_Env.tc_hooks);
            FStar_TypeChecker_Env.dsenv =
              (uu___423_13185.FStar_TypeChecker_Env.dsenv);
            FStar_TypeChecker_Env.nbe =
              (uu___423_13185.FStar_TypeChecker_Env.nbe)
          }  in
        let check_term lid univs1 t =
          let uu____13202 = FStar_Syntax_Subst.open_univ_vars univs1 t  in
          match uu____13202 with
          | (univs2,t1) ->
              ((let uu____13210 =
                  let uu____13211 =
                    let uu____13216 =
                      FStar_TypeChecker_Env.set_current_module env1
                        modul.FStar_Syntax_Syntax.name
                       in
                    FStar_TypeChecker_Env.debug uu____13216  in
                  FStar_All.pipe_left uu____13211
                    (FStar_Options.Other "Exports")
                   in
                if uu____13210
                then
                  let uu____13217 = FStar_Syntax_Print.lid_to_string lid  in
                  let uu____13218 =
                    let uu____13219 =
                      FStar_All.pipe_right univs2
                        (FStar_List.map
                           (fun x  ->
                              FStar_Syntax_Print.univ_to_string
                                (FStar_Syntax_Syntax.U_name x)))
                       in
                    FStar_All.pipe_right uu____13219
                      (FStar_String.concat ", ")
                     in
                  let uu____13230 = FStar_Syntax_Print.term_to_string t1  in
                  FStar_Util.print3 "Checking for export %s <%s> : %s\n"
                    uu____13217 uu____13218 uu____13230
                else ());
               (let env2 = FStar_TypeChecker_Env.push_univ_vars env1 univs2
                   in
                let uu____13233 =
                  FStar_TypeChecker_TcTerm.tc_trivial_guard env2 t1  in
                FStar_All.pipe_right uu____13233 (fun a230  -> ())))
           in
        let check_term1 lid univs1 t =
          (let uu____13259 =
             let uu____13260 =
               FStar_Syntax_Print.lid_to_string
                 modul.FStar_Syntax_Syntax.name
                in
             let uu____13261 = FStar_Syntax_Print.lid_to_string lid  in
             FStar_Util.format2
               "Interface of %s violates its abstraction (add a 'private' qualifier to '%s'?)"
               uu____13260 uu____13261
              in
           FStar_Errors.message_prefix.FStar_Errors.set_prefix uu____13259);
          check_term lid univs1 t;
          FStar_Errors.message_prefix.FStar_Errors.clear_prefix ()  in
        let rec check_sigelt se =
          match se.FStar_Syntax_Syntax.sigel with
          | FStar_Syntax_Syntax.Sig_bundle (ses,uu____13270) ->
              let uu____13279 =
                let uu____13280 =
                  FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
                    (FStar_List.contains FStar_Syntax_Syntax.Private)
                   in
                Prims.op_Negation uu____13280  in
              if uu____13279
              then FStar_All.pipe_right ses (FStar_List.iter check_sigelt)
              else ()
          | FStar_Syntax_Syntax.Sig_inductive_typ
              (l,univs1,binders,typ,uu____13290,uu____13291) ->
              let t =
                let uu____13303 =
                  let uu____13310 =
                    let uu____13311 =
                      let uu____13326 = FStar_Syntax_Syntax.mk_Total typ  in
                      (binders, uu____13326)  in
                    FStar_Syntax_Syntax.Tm_arrow uu____13311  in
                  FStar_Syntax_Syntax.mk uu____13310  in
                uu____13303 FStar_Pervasives_Native.None
                  se.FStar_Syntax_Syntax.sigrng
                 in
              check_term1 l univs1 t
          | FStar_Syntax_Syntax.Sig_datacon
              (l,univs1,t,uu____13345,uu____13346,uu____13347) ->
              check_term1 l univs1 t
          | FStar_Syntax_Syntax.Sig_declare_typ (l,univs1,t) ->
              let uu____13355 =
                let uu____13356 =
                  FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
                    (FStar_List.contains FStar_Syntax_Syntax.Private)
                   in
                Prims.op_Negation uu____13356  in
              if uu____13355 then check_term1 l univs1 t else ()
          | FStar_Syntax_Syntax.Sig_let ((uu____13360,lbs),uu____13362) ->
              let uu____13371 =
                let uu____13372 =
                  FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
                    (FStar_List.contains FStar_Syntax_Syntax.Private)
                   in
                Prims.op_Negation uu____13372  in
              if uu____13371
              then
                FStar_All.pipe_right lbs
                  (FStar_List.iter
                     (fun lb  ->
                        let fv =
                          FStar_Util.right lb.FStar_Syntax_Syntax.lbname  in
                        check_term1
                          (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                          lb.FStar_Syntax_Syntax.lbunivs
                          lb.FStar_Syntax_Syntax.lbtyp))
              else ()
          | FStar_Syntax_Syntax.Sig_effect_abbrev
              (l,univs1,binders,comp,flags1) ->
              let uu____13391 =
                let uu____13392 =
                  FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
                    (FStar_List.contains FStar_Syntax_Syntax.Private)
                   in
                Prims.op_Negation uu____13392  in
              if uu____13391
              then
                let arrow1 =
                  FStar_Syntax_Syntax.mk
                    (FStar_Syntax_Syntax.Tm_arrow (binders, comp))
                    FStar_Pervasives_Native.None
                    se.FStar_Syntax_Syntax.sigrng
                   in
                check_term1 l univs1 arrow1
              else ()
          | FStar_Syntax_Syntax.Sig_main uu____13409 -> ()
          | FStar_Syntax_Syntax.Sig_assume uu____13410 -> ()
          | FStar_Syntax_Syntax.Sig_new_effect uu____13417 -> ()
          | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____13418 -> ()
          | FStar_Syntax_Syntax.Sig_sub_effect uu____13419 -> ()
          | FStar_Syntax_Syntax.Sig_splice uu____13420 -> ()
          | FStar_Syntax_Syntax.Sig_pragma uu____13427 -> ()  in
        let uu____13428 =
          FStar_Ident.lid_equals modul.FStar_Syntax_Syntax.name
            FStar_Parser_Const.prims_lid
           in
        if uu____13428 then () else FStar_List.iter check_sigelt exports
  
let (extract_interface :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.modul -> FStar_Syntax_Syntax.modul)
  =
  fun en  ->
    fun m  ->
      let is_abstract = FStar_List.contains FStar_Syntax_Syntax.Abstract  in
      let is_irreducible1 =
        FStar_List.contains FStar_Syntax_Syntax.Irreducible  in
      let is_assume = FStar_List.contains FStar_Syntax_Syntax.Assumption  in
      let filter_out_abstract =
        FStar_List.filter
          (fun q  ->
             Prims.op_Negation
               (((q = FStar_Syntax_Syntax.Abstract) ||
                   (q = FStar_Syntax_Syntax.Irreducible))
                  || (q = FStar_Syntax_Syntax.Visible_default)))
         in
      let filter_out_abstract_and_noeq =
        FStar_List.filter
          (fun q  ->
             Prims.op_Negation
               (((((q = FStar_Syntax_Syntax.Abstract) ||
                     (q = FStar_Syntax_Syntax.Noeq))
                    || (q = FStar_Syntax_Syntax.Unopteq))
                   || (q = FStar_Syntax_Syntax.Irreducible))
                  || (q = FStar_Syntax_Syntax.Visible_default)))
         in
      let filter_out_abstract_and_inline =
        FStar_List.filter
          (fun q  ->
             Prims.op_Negation
               (((((q = FStar_Syntax_Syntax.Abstract) ||
                     (q = FStar_Syntax_Syntax.Irreducible))
                    || (q = FStar_Syntax_Syntax.Visible_default))
                   || (q = FStar_Syntax_Syntax.Inline_for_extraction))
                  ||
                  (q = FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen)))
         in
      let abstract_inductive_tycons = FStar_Util.mk_ref []  in
      let abstract_inductive_datacons = FStar_Util.mk_ref []  in
      let is_projector_or_discriminator_of_an_abstract_inductive quals =
        FStar_List.existsML
          (fun q  ->
             match q with
             | FStar_Syntax_Syntax.Discriminator l -> true
             | FStar_Syntax_Syntax.Projector (l,uu____13523) -> true
             | uu____13524 -> false) quals
         in
      let vals_of_abstract_inductive s =
        let mk_typ_for_abstract_inductive bs t r =
          match bs with
          | [] -> t
          | uu____13553 ->
              (match t.FStar_Syntax_Syntax.n with
               | FStar_Syntax_Syntax.Tm_arrow (bs',c) ->
                   FStar_Syntax_Syntax.mk
                     (FStar_Syntax_Syntax.Tm_arrow
                        ((FStar_List.append bs bs'), c))
                     FStar_Pervasives_Native.None r
               | uu____13592 ->
                   let uu____13593 =
                     let uu____13600 =
                       let uu____13601 =
                         let uu____13616 = FStar_Syntax_Syntax.mk_Total t  in
                         (bs, uu____13616)  in
                       FStar_Syntax_Syntax.Tm_arrow uu____13601  in
                     FStar_Syntax_Syntax.mk uu____13600  in
                   uu____13593 FStar_Pervasives_Native.None r)
           in
        match s.FStar_Syntax_Syntax.sigel with
        | FStar_Syntax_Syntax.Sig_inductive_typ
            (lid,uvs,bs,t,uu____13636,uu____13637) ->
            let s1 =
              let uu___424_13647 = s  in
              let uu____13648 =
                let uu____13649 =
                  let uu____13656 =
                    mk_typ_for_abstract_inductive bs t
                      s.FStar_Syntax_Syntax.sigrng
                     in
                  (lid, uvs, uu____13656)  in
                FStar_Syntax_Syntax.Sig_declare_typ uu____13649  in
              let uu____13657 =
                let uu____13660 =
                  let uu____13663 =
                    filter_out_abstract_and_noeq
                      s.FStar_Syntax_Syntax.sigquals
                     in
                  FStar_Syntax_Syntax.New :: uu____13663  in
                FStar_Syntax_Syntax.Assumption :: uu____13660  in
              {
                FStar_Syntax_Syntax.sigel = uu____13648;
                FStar_Syntax_Syntax.sigrng =
                  (uu___424_13647.FStar_Syntax_Syntax.sigrng);
                FStar_Syntax_Syntax.sigquals = uu____13657;
                FStar_Syntax_Syntax.sigmeta =
                  (uu___424_13647.FStar_Syntax_Syntax.sigmeta);
                FStar_Syntax_Syntax.sigattrs =
                  (uu___424_13647.FStar_Syntax_Syntax.sigattrs)
              }  in
            [s1]
        | uu____13666 -> failwith "Impossible!"  in
      let val_of_lb s lid uu____13690 lbdef =
        match uu____13690 with
        | (uvs,t) ->
            let attrs =
              let uu____13701 =
                FStar_TypeChecker_Util.must_erase_for_extraction en lbdef  in
              if uu____13701
              then
                let uu____13704 =
                  let uu____13705 =
                    FStar_Syntax_Syntax.lid_as_fv
                      FStar_Parser_Const.must_erase_for_extraction_attr
                      FStar_Syntax_Syntax.delta_constant
                      FStar_Pervasives_Native.None
                     in
                  FStar_All.pipe_right uu____13705
                    FStar_Syntax_Syntax.fv_to_tm
                   in
                uu____13704 :: (s.FStar_Syntax_Syntax.sigattrs)
              else s.FStar_Syntax_Syntax.sigattrs  in
            let uu___425_13707 = s  in
            let uu____13708 =
              let uu____13711 =
                filter_out_abstract_and_inline s.FStar_Syntax_Syntax.sigquals
                 in
              FStar_Syntax_Syntax.Assumption :: uu____13711  in
            {
              FStar_Syntax_Syntax.sigel =
                (FStar_Syntax_Syntax.Sig_declare_typ (lid, uvs, t));
              FStar_Syntax_Syntax.sigrng =
                (uu___425_13707.FStar_Syntax_Syntax.sigrng);
              FStar_Syntax_Syntax.sigquals = uu____13708;
              FStar_Syntax_Syntax.sigmeta =
                (uu___425_13707.FStar_Syntax_Syntax.sigmeta);
              FStar_Syntax_Syntax.sigattrs = attrs
            }
         in
      let should_keep_lbdef t =
        let comp_effect_name1 c =
          match c.FStar_Syntax_Syntax.n with
          | FStar_Syntax_Syntax.Comp c1 -> c1.FStar_Syntax_Syntax.effect_name
          | uu____13727 -> failwith "Impossible!"  in
        let c_opt =
          let uu____13733 = FStar_Syntax_Util.is_unit t  in
          if uu____13733
          then
            let uu____13738 = FStar_Syntax_Syntax.mk_Total t  in
            FStar_Pervasives_Native.Some uu____13738
          else
            (let uu____13744 =
               let uu____13745 = FStar_Syntax_Subst.compress t  in
               uu____13745.FStar_Syntax_Syntax.n  in
             match uu____13744 with
             | FStar_Syntax_Syntax.Tm_arrow (uu____13752,c) ->
                 FStar_Pervasives_Native.Some c
             | uu____13776 -> FStar_Pervasives_Native.None)
           in
        match c_opt with
        | FStar_Pervasives_Native.None  -> true
        | FStar_Pervasives_Native.Some c ->
            let uu____13786 = FStar_Syntax_Util.is_lemma_comp c  in
            if uu____13786
            then false
            else
              (let uu____13788 = FStar_Syntax_Util.is_pure_or_ghost_comp c
                  in
               if uu____13788
               then true
               else
                 (let uu____13790 = comp_effect_name1 c  in
                  FStar_TypeChecker_Env.is_reifiable_effect en uu____13790))
         in
      let extract_sigelt s =
        (let uu____13802 =
           FStar_TypeChecker_Env.debug en FStar_Options.Extreme  in
         if uu____13802
         then
           let uu____13803 = FStar_Syntax_Print.sigelt_to_string s  in
           FStar_Util.print1 "Extracting interface for %s\n" uu____13803
         else ());
        (match s.FStar_Syntax_Syntax.sigel with
         | FStar_Syntax_Syntax.Sig_inductive_typ uu____13807 ->
             failwith "Impossible! extract_interface: bare data constructor"
         | FStar_Syntax_Syntax.Sig_datacon uu____13826 ->
             failwith "Impossible! extract_interface: bare data constructor"
         | FStar_Syntax_Syntax.Sig_splice uu____13843 ->
             failwith
               "Impossible! extract_interface: trying to extract splice"
         | FStar_Syntax_Syntax.Sig_bundle (sigelts,lidents1) ->
             if is_abstract s.FStar_Syntax_Syntax.sigquals
             then
               FStar_All.pipe_right sigelts
                 (FStar_List.fold_left
                    (fun sigelts1  ->
                       fun s1  ->
                         match s1.FStar_Syntax_Syntax.sigel with
                         | FStar_Syntax_Syntax.Sig_inductive_typ
                             (lid,uu____13887,uu____13888,uu____13889,uu____13890,uu____13891)
                             ->
                             ((let uu____13901 =
                                 let uu____13904 =
                                   FStar_ST.op_Bang abstract_inductive_tycons
                                    in
                                 lid :: uu____13904  in
                               FStar_ST.op_Colon_Equals
                                 abstract_inductive_tycons uu____13901);
                              (let uu____13997 =
                                 vals_of_abstract_inductive s1  in
                               FStar_List.append uu____13997 sigelts1))
                         | FStar_Syntax_Syntax.Sig_datacon
                             (lid,uu____14001,uu____14002,uu____14003,uu____14004,uu____14005)
                             ->
                             ((let uu____14011 =
                                 let uu____14014 =
                                   FStar_ST.op_Bang
                                     abstract_inductive_datacons
                                    in
                                 lid :: uu____14014  in
                               FStar_ST.op_Colon_Equals
                                 abstract_inductive_datacons uu____14011);
                              sigelts1)
                         | uu____14107 ->
                             failwith
                               "Impossible! extract_interface: Sig_bundle can't have anything other than Sig_inductive_typ and Sig_datacon")
                    [])
             else [s]
         | FStar_Syntax_Syntax.Sig_declare_typ (lid,uvs,t) ->
             let uu____14114 =
               is_projector_or_discriminator_of_an_abstract_inductive
                 s.FStar_Syntax_Syntax.sigquals
                in
             if uu____14114
             then []
             else
               if is_assume s.FStar_Syntax_Syntax.sigquals
               then
                 (let uu____14120 =
                    let uu___426_14121 = s  in
                    let uu____14122 =
                      filter_out_abstract s.FStar_Syntax_Syntax.sigquals  in
                    {
                      FStar_Syntax_Syntax.sigel =
                        (uu___426_14121.FStar_Syntax_Syntax.sigel);
                      FStar_Syntax_Syntax.sigrng =
                        (uu___426_14121.FStar_Syntax_Syntax.sigrng);
                      FStar_Syntax_Syntax.sigquals = uu____14122;
                      FStar_Syntax_Syntax.sigmeta =
                        (uu___426_14121.FStar_Syntax_Syntax.sigmeta);
                      FStar_Syntax_Syntax.sigattrs =
                        (uu___426_14121.FStar_Syntax_Syntax.sigattrs)
                    }  in
                  [uu____14120])
               else []
         | FStar_Syntax_Syntax.Sig_let (lbs,lids) ->
             let uu____14132 =
               is_projector_or_discriminator_of_an_abstract_inductive
                 s.FStar_Syntax_Syntax.sigquals
                in
             if uu____14132
             then []
             else
               (let uu____14136 = lbs  in
                match uu____14136 with
                | (flbs,slbs) ->
                    let typs_and_defs =
                      FStar_All.pipe_right slbs
                        (FStar_List.map
                           (fun lb  ->
                              ((lb.FStar_Syntax_Syntax.lbunivs),
                                (lb.FStar_Syntax_Syntax.lbtyp),
                                (lb.FStar_Syntax_Syntax.lbdef))))
                       in
                    let is_lemma1 =
                      FStar_List.existsML
                        (fun uu____14195  ->
                           match uu____14195 with
                           | (uu____14202,t,uu____14204) ->
                               FStar_All.pipe_right t
                                 FStar_Syntax_Util.is_lemma) typs_and_defs
                       in
                    let vals =
                      FStar_List.map2
                        (fun lid  ->
                           fun uu____14220  ->
                             match uu____14220 with
                             | (u,t,d) -> val_of_lb s lid (u, t) d) lids
                        typs_and_defs
                       in
                    if
                      ((is_abstract s.FStar_Syntax_Syntax.sigquals) ||
                         (is_irreducible1 s.FStar_Syntax_Syntax.sigquals))
                        || is_lemma1
                    then vals
                    else
                      (let should_keep_defs =
                         FStar_List.existsML
                           (fun uu____14244  ->
                              match uu____14244 with
                              | (uu____14251,t,uu____14253) ->
                                  FStar_All.pipe_right t should_keep_lbdef)
                           typs_and_defs
                          in
                       if should_keep_defs then [s] else vals))
         | FStar_Syntax_Syntax.Sig_main t ->
             failwith
               "Did not anticipate main would arise when extracting interfaces!"
         | FStar_Syntax_Syntax.Sig_assume (lid,uu____14261,uu____14262) ->
             let is_haseq = FStar_TypeChecker_TcInductive.is_haseq_lid lid
                in
             if is_haseq
             then
               let is_haseq_of_abstract_inductive =
                 let uu____14267 = FStar_ST.op_Bang abstract_inductive_tycons
                    in
                 FStar_List.existsML
                   (fun l  ->
                      let uu____14318 =
                        FStar_TypeChecker_TcInductive.get_haseq_axiom_lid l
                         in
                      FStar_Ident.lid_equals lid uu____14318) uu____14267
                  in
               (if is_haseq_of_abstract_inductive
                then
                  let uu____14321 =
                    let uu___427_14322 = s  in
                    let uu____14323 =
                      filter_out_abstract s.FStar_Syntax_Syntax.sigquals  in
                    {
                      FStar_Syntax_Syntax.sigel =
                        (uu___427_14322.FStar_Syntax_Syntax.sigel);
                      FStar_Syntax_Syntax.sigrng =
                        (uu___427_14322.FStar_Syntax_Syntax.sigrng);
                      FStar_Syntax_Syntax.sigquals = uu____14323;
                      FStar_Syntax_Syntax.sigmeta =
                        (uu___427_14322.FStar_Syntax_Syntax.sigmeta);
                      FStar_Syntax_Syntax.sigattrs =
                        (uu___427_14322.FStar_Syntax_Syntax.sigattrs)
                    }  in
                  [uu____14321]
                else [])
             else
               (let uu____14328 =
                  let uu___428_14329 = s  in
                  let uu____14330 =
                    filter_out_abstract s.FStar_Syntax_Syntax.sigquals  in
                  {
                    FStar_Syntax_Syntax.sigel =
                      (uu___428_14329.FStar_Syntax_Syntax.sigel);
                    FStar_Syntax_Syntax.sigrng =
                      (uu___428_14329.FStar_Syntax_Syntax.sigrng);
                    FStar_Syntax_Syntax.sigquals = uu____14330;
                    FStar_Syntax_Syntax.sigmeta =
                      (uu___428_14329.FStar_Syntax_Syntax.sigmeta);
                    FStar_Syntax_Syntax.sigattrs =
                      (uu___428_14329.FStar_Syntax_Syntax.sigattrs)
                  }  in
                [uu____14328])
         | FStar_Syntax_Syntax.Sig_new_effect uu____14333 -> [s]
         | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____14334 -> [s]
         | FStar_Syntax_Syntax.Sig_sub_effect uu____14335 -> [s]
         | FStar_Syntax_Syntax.Sig_effect_abbrev uu____14336 -> [s]
         | FStar_Syntax_Syntax.Sig_pragma uu____14349 -> [s])
         in
      let uu___429_14350 = m  in
      let uu____14351 =
        let uu____14352 =
          FStar_All.pipe_right m.FStar_Syntax_Syntax.declarations
            (FStar_List.map extract_sigelt)
           in
        FStar_All.pipe_right uu____14352 FStar_List.flatten  in
      {
        FStar_Syntax_Syntax.name = (uu___429_14350.FStar_Syntax_Syntax.name);
        FStar_Syntax_Syntax.declarations = uu____14351;
        FStar_Syntax_Syntax.exports =
          (uu___429_14350.FStar_Syntax_Syntax.exports);
        FStar_Syntax_Syntax.is_interface = true
      }
  
let (snapshot_context :
  FStar_TypeChecker_Env.env ->
    Prims.string ->
      ((Prims.int,Prims.int,FStar_TypeChecker_Env.solver_depth_t,Prims.int)
         FStar_Pervasives_Native.tuple4,FStar_TypeChecker_Env.env)
        FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun msg  ->
      FStar_Util.atomically
        (fun uu____14396  -> FStar_TypeChecker_Env.snapshot env msg)
  
let (rollback_context :
  FStar_TypeChecker_Env.solver_t ->
    Prims.string ->
      (Prims.int,Prims.int,FStar_TypeChecker_Env.solver_depth_t,Prims.int)
        FStar_Pervasives_Native.tuple4 FStar_Pervasives_Native.option ->
        FStar_TypeChecker_Env.env)
  =
  fun solver  ->
    fun msg  ->
      fun depth  ->
        FStar_Util.atomically
          (fun uu____14435  ->
             let env = FStar_TypeChecker_Env.rollback solver msg depth  in
             solver.FStar_TypeChecker_Env.refresh (); env)
  
let (push_context :
  FStar_TypeChecker_Env.env -> Prims.string -> FStar_TypeChecker_Env.env) =
  fun env  ->
    fun msg  ->
      let uu____14448 = snapshot_context env msg  in
      FStar_Pervasives_Native.snd uu____14448
  
let (pop_context :
  FStar_TypeChecker_Env.env -> Prims.string -> FStar_TypeChecker_Env.env) =
  fun env  ->
    fun msg  ->
      rollback_context env.FStar_TypeChecker_Env.solver msg
        FStar_Pervasives_Native.None
  
let (tc_partial_modul :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.modul ->
      (FStar_Syntax_Syntax.modul,FStar_Syntax_Syntax.sigelt Prims.list,
        FStar_TypeChecker_Env.env) FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun modul  ->
      let verify =
        FStar_Options.should_verify
          (modul.FStar_Syntax_Syntax.name).FStar_Ident.str
         in
      let action = if verify then "Verifying" else "Lax-checking"  in
      let label1 =
        if modul.FStar_Syntax_Syntax.is_interface
        then "interface"
        else "implementation"  in
      (let uu____14511 = FStar_Options.debug_any ()  in
       if uu____14511
       then
         FStar_Util.print3 "%s %s of %s\n" action label1
           (modul.FStar_Syntax_Syntax.name).FStar_Ident.str
       else ());
      (let name =
         FStar_Util.format2 "%s %s"
           (if modul.FStar_Syntax_Syntax.is_interface
            then "interface"
            else "module") (modul.FStar_Syntax_Syntax.name).FStar_Ident.str
          in
       let env1 =
         let uu___430_14516 = env  in
         {
           FStar_TypeChecker_Env.solver =
             (uu___430_14516.FStar_TypeChecker_Env.solver);
           FStar_TypeChecker_Env.range =
             (uu___430_14516.FStar_TypeChecker_Env.range);
           FStar_TypeChecker_Env.curmodule =
             (uu___430_14516.FStar_TypeChecker_Env.curmodule);
           FStar_TypeChecker_Env.gamma =
             (uu___430_14516.FStar_TypeChecker_Env.gamma);
           FStar_TypeChecker_Env.gamma_sig =
             (uu___430_14516.FStar_TypeChecker_Env.gamma_sig);
           FStar_TypeChecker_Env.gamma_cache =
             (uu___430_14516.FStar_TypeChecker_Env.gamma_cache);
           FStar_TypeChecker_Env.modules =
             (uu___430_14516.FStar_TypeChecker_Env.modules);
           FStar_TypeChecker_Env.expected_typ =
             (uu___430_14516.FStar_TypeChecker_Env.expected_typ);
           FStar_TypeChecker_Env.sigtab =
             (uu___430_14516.FStar_TypeChecker_Env.sigtab);
           FStar_TypeChecker_Env.attrtab =
             (uu___430_14516.FStar_TypeChecker_Env.attrtab);
           FStar_TypeChecker_Env.is_pattern =
             (uu___430_14516.FStar_TypeChecker_Env.is_pattern);
           FStar_TypeChecker_Env.instantiate_imp =
             (uu___430_14516.FStar_TypeChecker_Env.instantiate_imp);
           FStar_TypeChecker_Env.effects =
             (uu___430_14516.FStar_TypeChecker_Env.effects);
           FStar_TypeChecker_Env.generalize =
             (uu___430_14516.FStar_TypeChecker_Env.generalize);
           FStar_TypeChecker_Env.letrecs =
             (uu___430_14516.FStar_TypeChecker_Env.letrecs);
           FStar_TypeChecker_Env.top_level =
             (uu___430_14516.FStar_TypeChecker_Env.top_level);
           FStar_TypeChecker_Env.check_uvars =
             (uu___430_14516.FStar_TypeChecker_Env.check_uvars);
           FStar_TypeChecker_Env.use_eq =
             (uu___430_14516.FStar_TypeChecker_Env.use_eq);
           FStar_TypeChecker_Env.is_iface =
             (modul.FStar_Syntax_Syntax.is_interface);
           FStar_TypeChecker_Env.admit = (Prims.op_Negation verify);
           FStar_TypeChecker_Env.lax =
             (uu___430_14516.FStar_TypeChecker_Env.lax);
           FStar_TypeChecker_Env.lax_universes =
             (uu___430_14516.FStar_TypeChecker_Env.lax_universes);
           FStar_TypeChecker_Env.phase1 =
             (uu___430_14516.FStar_TypeChecker_Env.phase1);
           FStar_TypeChecker_Env.failhard =
             (uu___430_14516.FStar_TypeChecker_Env.failhard);
           FStar_TypeChecker_Env.nosynth =
             (uu___430_14516.FStar_TypeChecker_Env.nosynth);
           FStar_TypeChecker_Env.uvar_subtyping =
             (uu___430_14516.FStar_TypeChecker_Env.uvar_subtyping);
           FStar_TypeChecker_Env.tc_term =
             (uu___430_14516.FStar_TypeChecker_Env.tc_term);
           FStar_TypeChecker_Env.type_of =
             (uu___430_14516.FStar_TypeChecker_Env.type_of);
           FStar_TypeChecker_Env.universe_of =
             (uu___430_14516.FStar_TypeChecker_Env.universe_of);
           FStar_TypeChecker_Env.check_type_of =
             (uu___430_14516.FStar_TypeChecker_Env.check_type_of);
           FStar_TypeChecker_Env.use_bv_sorts =
             (uu___430_14516.FStar_TypeChecker_Env.use_bv_sorts);
           FStar_TypeChecker_Env.qtbl_name_and_index =
             (uu___430_14516.FStar_TypeChecker_Env.qtbl_name_and_index);
           FStar_TypeChecker_Env.normalized_eff_names =
             (uu___430_14516.FStar_TypeChecker_Env.normalized_eff_names);
           FStar_TypeChecker_Env.fv_delta_depths =
             (uu___430_14516.FStar_TypeChecker_Env.fv_delta_depths);
           FStar_TypeChecker_Env.proof_ns =
             (uu___430_14516.FStar_TypeChecker_Env.proof_ns);
           FStar_TypeChecker_Env.synth_hook =
             (uu___430_14516.FStar_TypeChecker_Env.synth_hook);
           FStar_TypeChecker_Env.splice =
             (uu___430_14516.FStar_TypeChecker_Env.splice);
           FStar_TypeChecker_Env.postprocess =
             (uu___430_14516.FStar_TypeChecker_Env.postprocess);
           FStar_TypeChecker_Env.is_native_tactic =
             (uu___430_14516.FStar_TypeChecker_Env.is_native_tactic);
           FStar_TypeChecker_Env.identifier_info =
             (uu___430_14516.FStar_TypeChecker_Env.identifier_info);
           FStar_TypeChecker_Env.tc_hooks =
             (uu___430_14516.FStar_TypeChecker_Env.tc_hooks);
           FStar_TypeChecker_Env.dsenv =
             (uu___430_14516.FStar_TypeChecker_Env.dsenv);
           FStar_TypeChecker_Env.nbe =
             (uu___430_14516.FStar_TypeChecker_Env.nbe)
         }  in
       let env2 =
         FStar_TypeChecker_Env.set_current_module env1
           modul.FStar_Syntax_Syntax.name
          in
       let uu____14518 = tc_decls env2 modul.FStar_Syntax_Syntax.declarations
          in
       match uu____14518 with
       | (ses,exports,env3) ->
           ((let uu___431_14551 = modul  in
             {
               FStar_Syntax_Syntax.name =
                 (uu___431_14551.FStar_Syntax_Syntax.name);
               FStar_Syntax_Syntax.declarations = ses;
               FStar_Syntax_Syntax.exports =
                 (uu___431_14551.FStar_Syntax_Syntax.exports);
               FStar_Syntax_Syntax.is_interface =
                 (uu___431_14551.FStar_Syntax_Syntax.is_interface)
             }), exports, env3))
  
let (tc_more_partial_modul :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.modul ->
      FStar_Syntax_Syntax.sigelt Prims.list ->
        (FStar_Syntax_Syntax.modul,FStar_Syntax_Syntax.sigelt Prims.list,
          FStar_TypeChecker_Env.env) FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun modul  ->
      fun decls  ->
        let uu____14579 = tc_decls env decls  in
        match uu____14579 with
        | (ses,exports,env1) ->
            let modul1 =
              let uu___432_14610 = modul  in
              {
                FStar_Syntax_Syntax.name =
                  (uu___432_14610.FStar_Syntax_Syntax.name);
                FStar_Syntax_Syntax.declarations =
                  (FStar_List.append modul.FStar_Syntax_Syntax.declarations
                     ses);
                FStar_Syntax_Syntax.exports =
                  (uu___432_14610.FStar_Syntax_Syntax.exports);
                FStar_Syntax_Syntax.is_interface =
                  (uu___432_14610.FStar_Syntax_Syntax.is_interface)
              }  in
            (modul1, exports, env1)
  
let rec (tc_modul :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.modul ->
      Prims.bool ->
        (FStar_Syntax_Syntax.modul,FStar_Syntax_Syntax.modul
                                     FStar_Pervasives_Native.option,FStar_TypeChecker_Env.env)
          FStar_Pervasives_Native.tuple3)
  =
  fun env0  ->
    fun m  ->
      fun iface_exists  ->
        let msg =
          Prims.strcat "Internals for "
            (m.FStar_Syntax_Syntax.name).FStar_Ident.str
           in
        let env01 = push_context env0 msg  in
        let uu____14676 = tc_partial_modul env01 m  in
        match uu____14676 with
        | (modul,non_private_decls,env) ->
            finish_partial_modul false iface_exists env modul
              non_private_decls

and (finish_partial_modul :
  Prims.bool ->
    Prims.bool ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.modul ->
          FStar_Syntax_Syntax.sigelt Prims.list ->
            (FStar_Syntax_Syntax.modul,FStar_Syntax_Syntax.modul
                                         FStar_Pervasives_Native.option,
              FStar_TypeChecker_Env.env) FStar_Pervasives_Native.tuple3)
  =
  fun loading_from_cache  ->
    fun iface_exists  ->
      fun en  ->
        fun m  ->
          fun exports  ->
            let should_extract_interface =
              ((((Prims.op_Negation loading_from_cache) &&
                   (Prims.op_Negation iface_exists))
                  && (FStar_Options.use_extracted_interfaces ()))
                 && (Prims.op_Negation m.FStar_Syntax_Syntax.is_interface))
                &&
                (let uu____14717 = FStar_Errors.get_err_count ()  in
                 uu____14717 = (Prims.parse_int "0"))
               in
            if should_extract_interface
            then
              let modul_iface = extract_interface en m  in
              ((let uu____14728 =
                  FStar_All.pipe_left (FStar_TypeChecker_Env.debug en)
                    FStar_Options.Low
                   in
                if uu____14728
                then
                  let uu____14729 =
                    let uu____14730 =
                      FStar_Options.should_verify
                        (m.FStar_Syntax_Syntax.name).FStar_Ident.str
                       in
                    if uu____14730 then "" else " (in lax mode) "  in
                  let uu____14732 =
                    let uu____14733 =
                      FStar_Options.dump_module
                        (m.FStar_Syntax_Syntax.name).FStar_Ident.str
                       in
                    if uu____14733
                    then
                      let uu____14734 =
                        let uu____14735 =
                          FStar_Syntax_Print.modul_to_string m  in
                        Prims.strcat uu____14735 "\n"  in
                      Prims.strcat "\nfrom: " uu____14734
                    else ""  in
                  let uu____14737 =
                    let uu____14738 =
                      FStar_Options.dump_module
                        (m.FStar_Syntax_Syntax.name).FStar_Ident.str
                       in
                    if uu____14738
                    then
                      let uu____14739 =
                        let uu____14740 =
                          FStar_Syntax_Print.modul_to_string modul_iface  in
                        Prims.strcat uu____14740 "\n"  in
                      Prims.strcat "\nto: " uu____14739
                    else ""  in
                  FStar_Util.print4
                    "Extracting and type checking module %s interface%s%s%s\n"
                    (m.FStar_Syntax_Syntax.name).FStar_Ident.str uu____14729
                    uu____14732 uu____14737
                else ());
               (let en0 =
                  let en0 =
                    pop_context en
                      (Prims.strcat "Ending modul "
                         (m.FStar_Syntax_Syntax.name).FStar_Ident.str)
                     in
                  let en01 =
                    let uu___433_14746 = en0  in
                    let uu____14747 =
                      let uu____14760 =
                        FStar_All.pipe_right
                          en.FStar_TypeChecker_Env.qtbl_name_and_index
                          FStar_Pervasives_Native.fst
                         in
                      (uu____14760, FStar_Pervasives_Native.None)  in
                    {
                      FStar_TypeChecker_Env.solver =
                        (uu___433_14746.FStar_TypeChecker_Env.solver);
                      FStar_TypeChecker_Env.range =
                        (uu___433_14746.FStar_TypeChecker_Env.range);
                      FStar_TypeChecker_Env.curmodule =
                        (uu___433_14746.FStar_TypeChecker_Env.curmodule);
                      FStar_TypeChecker_Env.gamma =
                        (uu___433_14746.FStar_TypeChecker_Env.gamma);
                      FStar_TypeChecker_Env.gamma_sig =
                        (uu___433_14746.FStar_TypeChecker_Env.gamma_sig);
                      FStar_TypeChecker_Env.gamma_cache =
                        (uu___433_14746.FStar_TypeChecker_Env.gamma_cache);
                      FStar_TypeChecker_Env.modules =
                        (uu___433_14746.FStar_TypeChecker_Env.modules);
                      FStar_TypeChecker_Env.expected_typ =
                        (uu___433_14746.FStar_TypeChecker_Env.expected_typ);
                      FStar_TypeChecker_Env.sigtab =
                        (uu___433_14746.FStar_TypeChecker_Env.sigtab);
                      FStar_TypeChecker_Env.attrtab =
                        (uu___433_14746.FStar_TypeChecker_Env.attrtab);
                      FStar_TypeChecker_Env.is_pattern =
                        (uu___433_14746.FStar_TypeChecker_Env.is_pattern);
                      FStar_TypeChecker_Env.instantiate_imp =
                        (uu___433_14746.FStar_TypeChecker_Env.instantiate_imp);
                      FStar_TypeChecker_Env.effects =
                        (uu___433_14746.FStar_TypeChecker_Env.effects);
                      FStar_TypeChecker_Env.generalize =
                        (uu___433_14746.FStar_TypeChecker_Env.generalize);
                      FStar_TypeChecker_Env.letrecs =
                        (uu___433_14746.FStar_TypeChecker_Env.letrecs);
                      FStar_TypeChecker_Env.top_level =
                        (uu___433_14746.FStar_TypeChecker_Env.top_level);
                      FStar_TypeChecker_Env.check_uvars =
                        (uu___433_14746.FStar_TypeChecker_Env.check_uvars);
                      FStar_TypeChecker_Env.use_eq =
                        (uu___433_14746.FStar_TypeChecker_Env.use_eq);
                      FStar_TypeChecker_Env.is_iface =
                        (uu___433_14746.FStar_TypeChecker_Env.is_iface);
                      FStar_TypeChecker_Env.admit =
                        (uu___433_14746.FStar_TypeChecker_Env.admit);
                      FStar_TypeChecker_Env.lax =
                        (uu___433_14746.FStar_TypeChecker_Env.lax);
                      FStar_TypeChecker_Env.lax_universes =
                        (uu___433_14746.FStar_TypeChecker_Env.lax_universes);
                      FStar_TypeChecker_Env.phase1 =
                        (uu___433_14746.FStar_TypeChecker_Env.phase1);
                      FStar_TypeChecker_Env.failhard =
                        (uu___433_14746.FStar_TypeChecker_Env.failhard);
                      FStar_TypeChecker_Env.nosynth =
                        (uu___433_14746.FStar_TypeChecker_Env.nosynth);
                      FStar_TypeChecker_Env.uvar_subtyping =
                        (uu___433_14746.FStar_TypeChecker_Env.uvar_subtyping);
                      FStar_TypeChecker_Env.tc_term =
                        (uu___433_14746.FStar_TypeChecker_Env.tc_term);
                      FStar_TypeChecker_Env.type_of =
                        (uu___433_14746.FStar_TypeChecker_Env.type_of);
                      FStar_TypeChecker_Env.universe_of =
                        (uu___433_14746.FStar_TypeChecker_Env.universe_of);
                      FStar_TypeChecker_Env.check_type_of =
                        (uu___433_14746.FStar_TypeChecker_Env.check_type_of);
                      FStar_TypeChecker_Env.use_bv_sorts =
                        (uu___433_14746.FStar_TypeChecker_Env.use_bv_sorts);
                      FStar_TypeChecker_Env.qtbl_name_and_index = uu____14747;
                      FStar_TypeChecker_Env.normalized_eff_names =
                        (uu___433_14746.FStar_TypeChecker_Env.normalized_eff_names);
                      FStar_TypeChecker_Env.fv_delta_depths =
                        (uu___433_14746.FStar_TypeChecker_Env.fv_delta_depths);
                      FStar_TypeChecker_Env.proof_ns =
                        (uu___433_14746.FStar_TypeChecker_Env.proof_ns);
                      FStar_TypeChecker_Env.synth_hook =
                        (uu___433_14746.FStar_TypeChecker_Env.synth_hook);
                      FStar_TypeChecker_Env.splice =
                        (uu___433_14746.FStar_TypeChecker_Env.splice);
                      FStar_TypeChecker_Env.postprocess =
                        (uu___433_14746.FStar_TypeChecker_Env.postprocess);
                      FStar_TypeChecker_Env.is_native_tactic =
                        (uu___433_14746.FStar_TypeChecker_Env.is_native_tactic);
                      FStar_TypeChecker_Env.identifier_info =
                        (uu___433_14746.FStar_TypeChecker_Env.identifier_info);
                      FStar_TypeChecker_Env.tc_hooks =
                        (uu___433_14746.FStar_TypeChecker_Env.tc_hooks);
                      FStar_TypeChecker_Env.dsenv =
                        (uu___433_14746.FStar_TypeChecker_Env.dsenv);
                      FStar_TypeChecker_Env.nbe =
                        (uu___433_14746.FStar_TypeChecker_Env.nbe)
                    }  in
                  let uu____14797 =
                    let uu____14798 = FStar_Options.interactive ()  in
                    Prims.op_Negation uu____14798  in
                  if uu____14797
                  then
                    ((let uu____14800 =
                        FStar_Options.restore_cmd_line_options true  in
                      FStar_All.pipe_right uu____14800 (fun a231  -> ()));
                     z3_reset_options en01)
                  else en01  in
                let uu____14802 = tc_modul en0 modul_iface true  in
                match uu____14802 with
                | (modul_iface1,must_be_none,env) ->
                    if FStar_Option.isSome must_be_none
                    then
                      failwith
                        "Impossible! finish_partial_module: expected the second component to be None"
                    else
                      (((let uu___434_14846 = m  in
                         {
                           FStar_Syntax_Syntax.name =
                             (uu___434_14846.FStar_Syntax_Syntax.name);
                           FStar_Syntax_Syntax.declarations =
                             (uu___434_14846.FStar_Syntax_Syntax.declarations);
                           FStar_Syntax_Syntax.exports =
                             (modul_iface1.FStar_Syntax_Syntax.exports);
                           FStar_Syntax_Syntax.is_interface =
                             (uu___434_14846.FStar_Syntax_Syntax.is_interface)
                         })), (FStar_Pervasives_Native.Some modul_iface1),
                        env)))
            else
              (let modul =
                 let uu____14849 = FStar_Options.use_extracted_interfaces ()
                    in
                 if uu____14849
                 then
                   let uu___435_14850 = m  in
                   {
                     FStar_Syntax_Syntax.name =
                       (uu___435_14850.FStar_Syntax_Syntax.name);
                     FStar_Syntax_Syntax.declarations =
                       (uu___435_14850.FStar_Syntax_Syntax.declarations);
                     FStar_Syntax_Syntax.exports =
                       (m.FStar_Syntax_Syntax.declarations);
                     FStar_Syntax_Syntax.is_interface =
                       (uu___435_14850.FStar_Syntax_Syntax.is_interface)
                   }
                 else
                   (let uu___436_14852 = m  in
                    {
                      FStar_Syntax_Syntax.name =
                        (uu___436_14852.FStar_Syntax_Syntax.name);
                      FStar_Syntax_Syntax.declarations =
                        (uu___436_14852.FStar_Syntax_Syntax.declarations);
                      FStar_Syntax_Syntax.exports = exports;
                      FStar_Syntax_Syntax.is_interface =
                        (uu___436_14852.FStar_Syntax_Syntax.is_interface)
                    })
                  in
               let env = FStar_TypeChecker_Env.finish_module en modul  in
               (let uu____14855 =
                  FStar_All.pipe_right
                    env.FStar_TypeChecker_Env.qtbl_name_and_index
                    FStar_Pervasives_Native.fst
                   in
                FStar_All.pipe_right uu____14855 FStar_Util.smap_clear);
               (let uu____14883 =
                  ((let uu____14886 = FStar_Options.lax ()  in
                    Prims.op_Negation uu____14886) &&
                     (let uu____14888 =
                        FStar_Options.use_extracted_interfaces ()  in
                      Prims.op_Negation uu____14888))
                    && (Prims.op_Negation loading_from_cache)
                   in
                if uu____14883 then check_exports env modul exports else ());
               (let uu____14891 =
                  pop_context env
                    (Prims.strcat "Ending modul "
                       (modul.FStar_Syntax_Syntax.name).FStar_Ident.str)
                   in
                FStar_All.pipe_right uu____14891 (fun a232  -> ()));
               (env.FStar_TypeChecker_Env.solver).FStar_TypeChecker_Env.encode_modul
                 env modul;
               (env.FStar_TypeChecker_Env.solver).FStar_TypeChecker_Env.refresh
                 ();
               (let uu____14895 =
                  let uu____14896 = FStar_Options.interactive ()  in
                  Prims.op_Negation uu____14896  in
                if uu____14895
                then
                  let uu____14897 =
                    FStar_Options.restore_cmd_line_options true  in
                  FStar_All.pipe_right uu____14897 (fun a233  -> ())
                else ());
               (modul, FStar_Pervasives_Native.None, env))

let (load_checked_module :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.modul -> FStar_TypeChecker_Env.env)
  =
  fun en  ->
    fun m  ->
      let env =
        FStar_TypeChecker_Env.set_current_module en
          m.FStar_Syntax_Syntax.name
         in
      let env1 =
        let uu____14913 =
          let uu____14914 =
            FStar_Ident.string_of_lid m.FStar_Syntax_Syntax.name  in
          Prims.strcat "Internals for " uu____14914  in
        push_context env uu____14913  in
      let env2 =
        FStar_List.fold_left
          (fun env2  ->
             fun se  ->
               let env3 = FStar_TypeChecker_Env.push_sigelt env2 se  in
               let lids = FStar_Syntax_Util.lids_of_sigelt se  in
               FStar_All.pipe_right lids
                 (FStar_List.iter
                    (fun lid  ->
                       let uu____14933 =
                         FStar_TypeChecker_Env.try_lookup_lid env3 lid  in
                       ()));
               env3) env1 m.FStar_Syntax_Syntax.declarations
         in
      let uu____14944 =
        finish_partial_modul true true env2 m m.FStar_Syntax_Syntax.exports
         in
      match uu____14944 with | (uu____14953,uu____14954,env3) -> env3
  
let (check_module :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.modul ->
      Prims.bool ->
        (FStar_Syntax_Syntax.modul,FStar_Syntax_Syntax.modul
                                     FStar_Pervasives_Native.option,FStar_TypeChecker_Env.env)
          FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun m  ->
      fun b  ->
        (let uu____14984 = FStar_Options.debug_any ()  in
         if uu____14984
         then
           let uu____14985 =
             FStar_Syntax_Print.lid_to_string m.FStar_Syntax_Syntax.name  in
           FStar_Util.print2 "Checking %s: %s\n"
             (if m.FStar_Syntax_Syntax.is_interface
              then "i'face"
              else "module") uu____14985
         else ());
        (let uu____14989 =
           FStar_Options.dump_module
             (m.FStar_Syntax_Syntax.name).FStar_Ident.str
            in
         if uu____14989
         then
           let uu____14990 = FStar_Syntax_Print.modul_to_string m  in
           FStar_Util.print1 "Module before type checking:\n%s\n" uu____14990
         else ());
        (let env1 =
           let uu___437_14993 = env  in
           let uu____14994 =
             let uu____14995 =
               FStar_Options.should_verify
                 (m.FStar_Syntax_Syntax.name).FStar_Ident.str
                in
             Prims.op_Negation uu____14995  in
           {
             FStar_TypeChecker_Env.solver =
               (uu___437_14993.FStar_TypeChecker_Env.solver);
             FStar_TypeChecker_Env.range =
               (uu___437_14993.FStar_TypeChecker_Env.range);
             FStar_TypeChecker_Env.curmodule =
               (uu___437_14993.FStar_TypeChecker_Env.curmodule);
             FStar_TypeChecker_Env.gamma =
               (uu___437_14993.FStar_TypeChecker_Env.gamma);
             FStar_TypeChecker_Env.gamma_sig =
               (uu___437_14993.FStar_TypeChecker_Env.gamma_sig);
             FStar_TypeChecker_Env.gamma_cache =
               (uu___437_14993.FStar_TypeChecker_Env.gamma_cache);
             FStar_TypeChecker_Env.modules =
               (uu___437_14993.FStar_TypeChecker_Env.modules);
             FStar_TypeChecker_Env.expected_typ =
               (uu___437_14993.FStar_TypeChecker_Env.expected_typ);
             FStar_TypeChecker_Env.sigtab =
               (uu___437_14993.FStar_TypeChecker_Env.sigtab);
             FStar_TypeChecker_Env.attrtab =
               (uu___437_14993.FStar_TypeChecker_Env.attrtab);
             FStar_TypeChecker_Env.is_pattern =
               (uu___437_14993.FStar_TypeChecker_Env.is_pattern);
             FStar_TypeChecker_Env.instantiate_imp =
               (uu___437_14993.FStar_TypeChecker_Env.instantiate_imp);
             FStar_TypeChecker_Env.effects =
               (uu___437_14993.FStar_TypeChecker_Env.effects);
             FStar_TypeChecker_Env.generalize =
               (uu___437_14993.FStar_TypeChecker_Env.generalize);
             FStar_TypeChecker_Env.letrecs =
               (uu___437_14993.FStar_TypeChecker_Env.letrecs);
             FStar_TypeChecker_Env.top_level =
               (uu___437_14993.FStar_TypeChecker_Env.top_level);
             FStar_TypeChecker_Env.check_uvars =
               (uu___437_14993.FStar_TypeChecker_Env.check_uvars);
             FStar_TypeChecker_Env.use_eq =
               (uu___437_14993.FStar_TypeChecker_Env.use_eq);
             FStar_TypeChecker_Env.is_iface =
               (uu___437_14993.FStar_TypeChecker_Env.is_iface);
             FStar_TypeChecker_Env.admit =
               (uu___437_14993.FStar_TypeChecker_Env.admit);
             FStar_TypeChecker_Env.lax = uu____14994;
             FStar_TypeChecker_Env.lax_universes =
               (uu___437_14993.FStar_TypeChecker_Env.lax_universes);
             FStar_TypeChecker_Env.phase1 =
               (uu___437_14993.FStar_TypeChecker_Env.phase1);
             FStar_TypeChecker_Env.failhard =
               (uu___437_14993.FStar_TypeChecker_Env.failhard);
             FStar_TypeChecker_Env.nosynth =
               (uu___437_14993.FStar_TypeChecker_Env.nosynth);
             FStar_TypeChecker_Env.uvar_subtyping =
               (uu___437_14993.FStar_TypeChecker_Env.uvar_subtyping);
             FStar_TypeChecker_Env.tc_term =
               (uu___437_14993.FStar_TypeChecker_Env.tc_term);
             FStar_TypeChecker_Env.type_of =
               (uu___437_14993.FStar_TypeChecker_Env.type_of);
             FStar_TypeChecker_Env.universe_of =
               (uu___437_14993.FStar_TypeChecker_Env.universe_of);
             FStar_TypeChecker_Env.check_type_of =
               (uu___437_14993.FStar_TypeChecker_Env.check_type_of);
             FStar_TypeChecker_Env.use_bv_sorts =
               (uu___437_14993.FStar_TypeChecker_Env.use_bv_sorts);
             FStar_TypeChecker_Env.qtbl_name_and_index =
               (uu___437_14993.FStar_TypeChecker_Env.qtbl_name_and_index);
             FStar_TypeChecker_Env.normalized_eff_names =
               (uu___437_14993.FStar_TypeChecker_Env.normalized_eff_names);
             FStar_TypeChecker_Env.fv_delta_depths =
               (uu___437_14993.FStar_TypeChecker_Env.fv_delta_depths);
             FStar_TypeChecker_Env.proof_ns =
               (uu___437_14993.FStar_TypeChecker_Env.proof_ns);
             FStar_TypeChecker_Env.synth_hook =
               (uu___437_14993.FStar_TypeChecker_Env.synth_hook);
             FStar_TypeChecker_Env.splice =
               (uu___437_14993.FStar_TypeChecker_Env.splice);
             FStar_TypeChecker_Env.postprocess =
               (uu___437_14993.FStar_TypeChecker_Env.postprocess);
             FStar_TypeChecker_Env.is_native_tactic =
               (uu___437_14993.FStar_TypeChecker_Env.is_native_tactic);
             FStar_TypeChecker_Env.identifier_info =
               (uu___437_14993.FStar_TypeChecker_Env.identifier_info);
             FStar_TypeChecker_Env.tc_hooks =
               (uu___437_14993.FStar_TypeChecker_Env.tc_hooks);
             FStar_TypeChecker_Env.dsenv =
               (uu___437_14993.FStar_TypeChecker_Env.dsenv);
             FStar_TypeChecker_Env.nbe =
               (uu___437_14993.FStar_TypeChecker_Env.nbe)
           }  in
         let uu____14996 = tc_modul env1 m b  in
         match uu____14996 with
         | (m1,m_iface_opt,env2) ->
             ((let uu____15021 =
                 FStar_Options.dump_module
                   (m1.FStar_Syntax_Syntax.name).FStar_Ident.str
                  in
               if uu____15021
               then
                 let uu____15022 = FStar_Syntax_Print.modul_to_string m1  in
                 FStar_Util.print1 "Module after type checking:\n%s\n"
                   uu____15022
               else ());
              (let uu____15025 =
                 (FStar_Options.dump_module
                    (m1.FStar_Syntax_Syntax.name).FStar_Ident.str)
                   &&
                   (FStar_Options.debug_at_level
                      (m1.FStar_Syntax_Syntax.name).FStar_Ident.str
                      (FStar_Options.Other "Normalize"))
                  in
               if uu____15025
               then
                 let normalize_toplevel_lets se =
                   match se.FStar_Syntax_Syntax.sigel with
                   | FStar_Syntax_Syntax.Sig_let ((b1,lbs),ids) ->
                       let n1 =
                         FStar_TypeChecker_Normalize.normalize
                           [FStar_TypeChecker_Env.Beta;
                           FStar_TypeChecker_Env.Eager_unfolding;
                           FStar_TypeChecker_Env.Reify;
                           FStar_TypeChecker_Env.Inlining;
                           FStar_TypeChecker_Env.Primops;
                           FStar_TypeChecker_Env.UnfoldUntil
                             FStar_Syntax_Syntax.delta_constant;
                           FStar_TypeChecker_Env.AllowUnboundUniverses]
                          in
                       let update lb =
                         let uu____15058 =
                           FStar_Syntax_Subst.open_univ_vars
                             lb.FStar_Syntax_Syntax.lbunivs
                             lb.FStar_Syntax_Syntax.lbdef
                            in
                         match uu____15058 with
                         | (univnames1,e) ->
                             let uu___438_15065 = lb  in
                             let uu____15066 =
                               let uu____15069 =
                                 FStar_TypeChecker_Env.push_univ_vars env2
                                   univnames1
                                  in
                               n1 uu____15069 e  in
                             {
                               FStar_Syntax_Syntax.lbname =
                                 (uu___438_15065.FStar_Syntax_Syntax.lbname);
                               FStar_Syntax_Syntax.lbunivs =
                                 (uu___438_15065.FStar_Syntax_Syntax.lbunivs);
                               FStar_Syntax_Syntax.lbtyp =
                                 (uu___438_15065.FStar_Syntax_Syntax.lbtyp);
                               FStar_Syntax_Syntax.lbeff =
                                 (uu___438_15065.FStar_Syntax_Syntax.lbeff);
                               FStar_Syntax_Syntax.lbdef = uu____15066;
                               FStar_Syntax_Syntax.lbattrs =
                                 (uu___438_15065.FStar_Syntax_Syntax.lbattrs);
                               FStar_Syntax_Syntax.lbpos =
                                 (uu___438_15065.FStar_Syntax_Syntax.lbpos)
                             }
                          in
                       let uu___439_15070 = se  in
                       let uu____15071 =
                         let uu____15072 =
                           let uu____15079 =
                             let uu____15080 = FStar_List.map update lbs  in
                             (b1, uu____15080)  in
                           (uu____15079, ids)  in
                         FStar_Syntax_Syntax.Sig_let uu____15072  in
                       {
                         FStar_Syntax_Syntax.sigel = uu____15071;
                         FStar_Syntax_Syntax.sigrng =
                           (uu___439_15070.FStar_Syntax_Syntax.sigrng);
                         FStar_Syntax_Syntax.sigquals =
                           (uu___439_15070.FStar_Syntax_Syntax.sigquals);
                         FStar_Syntax_Syntax.sigmeta =
                           (uu___439_15070.FStar_Syntax_Syntax.sigmeta);
                         FStar_Syntax_Syntax.sigattrs =
                           (uu___439_15070.FStar_Syntax_Syntax.sigattrs)
                       }
                   | uu____15087 -> se  in
                 let normalized_module =
                   let uu___440_15089 = m1  in
                   let uu____15090 =
                     FStar_List.map normalize_toplevel_lets
                       m1.FStar_Syntax_Syntax.declarations
                      in
                   {
                     FStar_Syntax_Syntax.name =
                       (uu___440_15089.FStar_Syntax_Syntax.name);
                     FStar_Syntax_Syntax.declarations = uu____15090;
                     FStar_Syntax_Syntax.exports =
                       (uu___440_15089.FStar_Syntax_Syntax.exports);
                     FStar_Syntax_Syntax.is_interface =
                       (uu___440_15089.FStar_Syntax_Syntax.is_interface)
                   }  in
                 let uu____15091 =
                   FStar_Syntax_Print.modul_to_string normalized_module  in
                 FStar_Util.print1 "%s\n" uu____15091
               else ());
              (m1, m_iface_opt, env2)))
  