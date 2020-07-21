open Prims
type lcomp_with_binder =
  (FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option *
    FStar_TypeChecker_Common.lcomp)
let (report : FStar_TypeChecker_Env.env -> Prims.string Prims.list -> unit) =
  fun env ->
    fun errs ->
      let uu____20 = FStar_TypeChecker_Env.get_range env in
      let uu____21 = FStar_TypeChecker_Err.failed_to_prove_specification errs in
      FStar_Errors.log_issue uu____20 uu____21
let (new_implicit_var :
  Prims.string ->
    FStar_Range.range ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term * (FStar_Syntax_Syntax.ctx_uvar *
            FStar_Range.range) Prims.list * FStar_TypeChecker_Common.guard_t))
  =
  fun reason ->
    fun r ->
      fun env ->
        fun k ->
          FStar_TypeChecker_Env.new_implicit_var_aux reason r env k
            FStar_Syntax_Syntax.Strict FStar_Pervasives_Native.None
let (close_guard_implicits :
  FStar_TypeChecker_Env.env ->
    Prims.bool ->
      FStar_Syntax_Syntax.binders ->
        FStar_TypeChecker_Common.guard_t -> FStar_TypeChecker_Common.guard_t)
  =
  fun env ->
    fun solve_deferred ->
      fun xs ->
        fun g ->
          let uu____78 = (FStar_Options.eager_subtyping ()) || solve_deferred in
          if uu____78
          then
            let uu____79 =
              FStar_All.pipe_right g.FStar_TypeChecker_Common.deferred
                (FStar_List.partition
                   (fun uu____125 ->
                      match uu____125 with
                      | (uu____130, p) ->
                          FStar_TypeChecker_Rel.flex_prob_closing env xs p)) in
            match uu____79 with
            | (solve_now, defer) ->
                ((let uu____159 =
                    FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                      (FStar_Options.Other "Rel") in
                  if uu____159
                  then
                    (FStar_Util.print_string "SOLVE BEFORE CLOSING:\n";
                     FStar_List.iter
                       (fun uu____170 ->
                          match uu____170 with
                          | (s, p) ->
                              let uu____177 =
                                FStar_TypeChecker_Rel.prob_to_string env p in
                              FStar_Util.print2 "%s: %s\n" s uu____177)
                       solve_now;
                     FStar_Util.print_string " ...DEFERRED THE REST:\n";
                     FStar_List.iter
                       (fun uu____188 ->
                          match uu____188 with
                          | (s, p) ->
                              let uu____195 =
                                FStar_TypeChecker_Rel.prob_to_string env p in
                              FStar_Util.print2 "%s: %s\n" s uu____195) defer;
                     FStar_Util.print_string "END\n")
                  else ());
                 (let g1 =
                    FStar_TypeChecker_Rel.solve_deferred_constraints env
                      (let uu___49_199 = g in
                       {
                         FStar_TypeChecker_Common.guard_f =
                           (uu___49_199.FStar_TypeChecker_Common.guard_f);
                         FStar_TypeChecker_Common.deferred_to_tac =
                           (uu___49_199.FStar_TypeChecker_Common.deferred_to_tac);
                         FStar_TypeChecker_Common.deferred = solve_now;
                         FStar_TypeChecker_Common.univ_ineqs =
                           (uu___49_199.FStar_TypeChecker_Common.univ_ineqs);
                         FStar_TypeChecker_Common.implicits =
                           (uu___49_199.FStar_TypeChecker_Common.implicits)
                       }) in
                  let g2 =
                    let uu___52_201 = g1 in
                    {
                      FStar_TypeChecker_Common.guard_f =
                        (uu___52_201.FStar_TypeChecker_Common.guard_f);
                      FStar_TypeChecker_Common.deferred_to_tac =
                        (uu___52_201.FStar_TypeChecker_Common.deferred_to_tac);
                      FStar_TypeChecker_Common.deferred = defer;
                      FStar_TypeChecker_Common.univ_ineqs =
                        (uu___52_201.FStar_TypeChecker_Common.univ_ineqs);
                      FStar_TypeChecker_Common.implicits =
                        (uu___52_201.FStar_TypeChecker_Common.implicits)
                    } in
                  g2))
          else g
let (check_uvars : FStar_Range.range -> FStar_Syntax_Syntax.typ -> unit) =
  fun r ->
    fun t ->
      let uvs = FStar_Syntax_Free.uvars t in
      let uu____216 =
        let uu____217 = FStar_Util.set_is_empty uvs in
        Prims.op_Negation uu____217 in
      if uu____216
      then
        let us =
          let uu____219 =
            let uu____222 = FStar_Util.set_elements uvs in
            FStar_List.map
              (fun u ->
                 FStar_Syntax_Print.uvar_to_string
                   u.FStar_Syntax_Syntax.ctx_uvar_head) uu____222 in
          FStar_All.pipe_right uu____219 (FStar_String.concat ", ") in
        (FStar_Options.push ();
         FStar_Options.set_option "hide_uvar_nums" (FStar_Options.Bool false);
         FStar_Options.set_option "print_implicits" (FStar_Options.Bool true);
         (let uu____233 =
            let uu____238 =
              let uu____239 = FStar_Syntax_Print.term_to_string t in
              FStar_Util.format2
                "Unconstrained unification variables %s in type signature %s; please add an annotation"
                us uu____239 in
            (FStar_Errors.Error_UncontrainedUnificationVar, uu____238) in
          FStar_Errors.log_issue r uu____233);
         FStar_Options.pop ())
      else ()
let (extract_let_rec_annotation :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.letbinding ->
      (FStar_Syntax_Syntax.univ_names * FStar_Syntax_Syntax.typ * Prims.bool))
  =
  fun env ->
    fun uu____256 ->
      match uu____256 with
      | { FStar_Syntax_Syntax.lbname = lbname;
          FStar_Syntax_Syntax.lbunivs = univ_vars;
          FStar_Syntax_Syntax.lbtyp = t;
          FStar_Syntax_Syntax.lbeff = uu____266;
          FStar_Syntax_Syntax.lbdef = e;
          FStar_Syntax_Syntax.lbattrs = uu____268;
          FStar_Syntax_Syntax.lbpos = uu____269;_} ->
          let rng = FStar_Syntax_Syntax.range_of_lbname lbname in
          let t1 = FStar_Syntax_Subst.compress t in
          (match t1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_unknown ->
               let uu____302 = FStar_Syntax_Subst.open_univ_vars univ_vars e in
               (match uu____302 with
                | (univ_vars1, e1) ->
                    let env1 =
                      FStar_TypeChecker_Env.push_univ_vars env univ_vars1 in
                    let r = FStar_TypeChecker_Env.get_range env1 in
                    let rec aux e2 =
                      let e3 = FStar_Syntax_Subst.compress e2 in
                      match e3.FStar_Syntax_Syntax.n with
                      | FStar_Syntax_Syntax.Tm_meta (e4, uu____339) -> aux e4
                      | FStar_Syntax_Syntax.Tm_ascribed (e4, t2, uu____346)
                          -> FStar_Pervasives_Native.fst t2
                      | FStar_Syntax_Syntax.Tm_abs (bs, body, uu____401) ->
                          let res = aux body in
                          let c =
                            match res with
                            | FStar_Util.Inl t2 ->
                                let uu____437 = FStar_Options.ml_ish () in
                                if uu____437
                                then FStar_Syntax_Util.ml_comp t2 r
                                else FStar_Syntax_Syntax.mk_Total t2
                            | FStar_Util.Inr c -> c in
                          let t2 =
                            FStar_Syntax_Syntax.mk
                              (FStar_Syntax_Syntax.Tm_arrow (bs, c))
                              c.FStar_Syntax_Syntax.pos in
                          ((let uu____456 =
                              FStar_TypeChecker_Env.debug env1
                                FStar_Options.High in
                            if uu____456
                            then
                              let uu____457 = FStar_Range.string_of_range r in
                              let uu____458 =
                                FStar_Syntax_Print.term_to_string t2 in
                              FStar_Util.print2 "(%s) Using type %s\n"
                                uu____457 uu____458
                            else ());
                           FStar_Util.Inl t2)
                      | uu____460 -> FStar_Util.Inl FStar_Syntax_Syntax.tun in
                    let t2 =
                      let uu____462 = aux e1 in
                      match uu____462 with
                      | FStar_Util.Inr c ->
                          let uu____468 =
                            FStar_Syntax_Util.is_tot_or_gtot_comp c in
                          if uu____468
                          then FStar_Syntax_Util.comp_result c
                          else
                            (let uu____470 =
                               let uu____475 =
                                 let uu____476 =
                                   FStar_Syntax_Print.comp_to_string c in
                                 FStar_Util.format1
                                   "Expected a 'let rec' to be annotated with a value type; got a computation type %s"
                                   uu____476 in
                               (FStar_Errors.Fatal_UnexpectedComputationTypeForLetRec,
                                 uu____475) in
                             FStar_Errors.raise_error uu____470 rng)
                      | FStar_Util.Inl t2 -> t2 in
                    (univ_vars1, t2, true))
           | uu____480 ->
               let uu____481 = FStar_Syntax_Subst.open_univ_vars univ_vars t1 in
               (match uu____481 with
                | (univ_vars1, t2) -> (univ_vars1, t2, false)))
let rec (decorated_pattern_as_term :
  FStar_Syntax_Syntax.pat ->
    (FStar_Syntax_Syntax.bv Prims.list * FStar_Syntax_Syntax.term))
  =
  fun pat ->
    let mk f = FStar_Syntax_Syntax.mk f pat.FStar_Syntax_Syntax.p in
    let pat_as_arg uu____540 =
      match uu____540 with
      | (p, i) ->
          let uu____557 = decorated_pattern_as_term p in
          (match uu____557 with
           | (vars, te) ->
               let uu____580 =
                 let uu____585 = FStar_Syntax_Syntax.as_implicit i in
                 (te, uu____585) in
               (vars, uu____580)) in
    match pat.FStar_Syntax_Syntax.v with
    | FStar_Syntax_Syntax.Pat_constant c ->
        let uu____599 = mk (FStar_Syntax_Syntax.Tm_constant c) in
        ([], uu____599)
    | FStar_Syntax_Syntax.Pat_wild x ->
        let uu____603 = mk (FStar_Syntax_Syntax.Tm_name x) in
        ([x], uu____603)
    | FStar_Syntax_Syntax.Pat_var x ->
        let uu____607 = mk (FStar_Syntax_Syntax.Tm_name x) in
        ([x], uu____607)
    | FStar_Syntax_Syntax.Pat_cons (fv, pats) ->
        let uu____628 =
          let uu____647 =
            FStar_All.pipe_right pats (FStar_List.map pat_as_arg) in
          FStar_All.pipe_right uu____647 FStar_List.unzip in
        (match uu____628 with
         | (vars, args) ->
             let vars1 = FStar_List.flatten vars in
             let uu____783 =
               let uu____784 =
                 let uu____785 =
                   let uu____802 = FStar_Syntax_Syntax.fv_to_tm fv in
                   (uu____802, args) in
                 FStar_Syntax_Syntax.Tm_app uu____785 in
               mk uu____784 in
             (vars1, uu____783))
    | FStar_Syntax_Syntax.Pat_dot_term (x, e) -> ([], e)
let (comp_univ_opt :
  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option)
  =
  fun c ->
    match c.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Total (uu____840, uopt) -> uopt
    | FStar_Syntax_Syntax.GTotal (uu____850, uopt) -> uopt
    | FStar_Syntax_Syntax.Comp c1 ->
        (match c1.FStar_Syntax_Syntax.comp_univs with
         | [] -> FStar_Pervasives_Native.None
         | hd::uu____864 -> FStar_Pervasives_Native.Some hd)
let (lcomp_univ_opt :
  FStar_TypeChecker_Common.lcomp ->
    (FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option *
      FStar_TypeChecker_Common.guard_t))
  =
  fun lc ->
    let uu____878 =
      FStar_All.pipe_right lc FStar_TypeChecker_Common.lcomp_comp in
    FStar_All.pipe_right uu____878
      (fun uu____906 ->
         match uu____906 with | (c, g) -> ((comp_univ_opt c), g))
let (destruct_wp_comp :
  FStar_Syntax_Syntax.comp_typ ->
    (FStar_Syntax_Syntax.universe * FStar_Syntax_Syntax.typ *
      FStar_Syntax_Syntax.typ))
  = fun c -> FStar_Syntax_Util.destruct_comp c
let (mk_comp_l :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.cflag Prims.list -> FStar_Syntax_Syntax.comp)
  =
  fun mname ->
    fun u_result ->
      fun result ->
        fun wp ->
          fun flags ->
            let uu____977 =
              let uu____978 =
                let uu____989 = FStar_Syntax_Syntax.as_arg wp in [uu____989] in
              {
                FStar_Syntax_Syntax.comp_univs = [u_result];
                FStar_Syntax_Syntax.effect_name = mname;
                FStar_Syntax_Syntax.result_typ = result;
                FStar_Syntax_Syntax.effect_args = uu____978;
                FStar_Syntax_Syntax.flags = flags
              } in
            FStar_Syntax_Syntax.mk_Comp uu____977
let (mk_comp :
  FStar_Syntax_Syntax.eff_decl ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.cflag Prims.list -> FStar_Syntax_Syntax.comp)
  = fun md -> mk_comp_l md.FStar_Syntax_Syntax.mname
let (effect_args_from_repr :
  FStar_Syntax_Syntax.term ->
    Prims.bool -> FStar_Range.range -> FStar_Syntax_Syntax.term Prims.list)
  =
  fun repr ->
    fun is_layered ->
      fun r ->
        let err uu____1069 =
          let uu____1070 =
            let uu____1075 =
              let uu____1076 = FStar_Syntax_Print.term_to_string repr in
              let uu____1077 = FStar_Util.string_of_bool is_layered in
              FStar_Util.format2
                "Could not get effect args from repr %s with is_layered %s"
                uu____1076 uu____1077 in
            (FStar_Errors.Fatal_UnexpectedEffect, uu____1075) in
          FStar_Errors.raise_error uu____1070 r in
        let repr1 = FStar_Syntax_Subst.compress repr in
        if is_layered
        then
          match repr1.FStar_Syntax_Syntax.n with
          | FStar_Syntax_Syntax.Tm_app (uu____1085, uu____1086::is) ->
              FStar_All.pipe_right is
                (FStar_List.map FStar_Pervasives_Native.fst)
          | uu____1154 -> err ()
        else
          (match repr1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_arrow (uu____1158, c) ->
               let uu____1180 =
                 FStar_All.pipe_right c FStar_Syntax_Util.comp_to_comp_typ in
               FStar_All.pipe_right uu____1180
                 (fun ct ->
                    FStar_All.pipe_right ct.FStar_Syntax_Syntax.effect_args
                      (FStar_List.map FStar_Pervasives_Native.fst))
           | uu____1215 -> err ())
let (mk_wp_return :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.eff_decl ->
      FStar_Syntax_Syntax.universe ->
        FStar_Syntax_Syntax.typ ->
          FStar_Syntax_Syntax.term ->
            FStar_Range.range -> FStar_Syntax_Syntax.comp)
  =
  fun env ->
    fun ed ->
      fun u_a ->
        fun a ->
          fun e ->
            fun r ->
              let c =
                let uu____1247 =
                  let uu____1248 =
                    FStar_TypeChecker_Env.lid_exists env
                      FStar_Parser_Const.effect_GTot_lid in
                  FStar_All.pipe_left Prims.op_Negation uu____1248 in
                if uu____1247
                then FStar_Syntax_Syntax.mk_Total a
                else
                  (let uu____1250 = FStar_Syntax_Util.is_unit a in
                   if uu____1250
                   then
                     FStar_Syntax_Syntax.mk_Total' a
                       (FStar_Pervasives_Native.Some
                          FStar_Syntax_Syntax.U_zero)
                   else
                     (let wp =
                        let uu____1253 =
                          env.FStar_TypeChecker_Env.lax &&
                            (FStar_Options.ml_ish ()) in
                        if uu____1253
                        then FStar_Syntax_Syntax.tun
                        else
                          (let ret_wp =
                             FStar_All.pipe_right ed
                               FStar_Syntax_Util.get_return_vc_combinator in
                           let uu____1256 =
                             let uu____1257 =
                               FStar_TypeChecker_Env.inst_effect_fun_with
                                 [u_a] env ed ret_wp in
                             let uu____1258 =
                               let uu____1259 = FStar_Syntax_Syntax.as_arg a in
                               let uu____1268 =
                                 let uu____1279 =
                                   FStar_Syntax_Syntax.as_arg e in
                                 [uu____1279] in
                               uu____1259 :: uu____1268 in
                             FStar_Syntax_Syntax.mk_Tm_app uu____1257
                               uu____1258 e.FStar_Syntax_Syntax.pos in
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Env.Beta;
                             FStar_TypeChecker_Env.NoFullNorm] env uu____1256) in
                      mk_comp ed u_a a wp [FStar_Syntax_Syntax.RETURN])) in
              (let uu____1313 =
                 FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                   (FStar_Options.Other "Return") in
               if uu____1313
               then
                 let uu____1314 =
                   FStar_Range.string_of_range e.FStar_Syntax_Syntax.pos in
                 let uu____1315 = FStar_Syntax_Print.term_to_string e in
                 let uu____1316 =
                   FStar_TypeChecker_Normalize.comp_to_string env c in
                 FStar_Util.print3 "(%s) returning %s at comp type %s\n"
                   uu____1314 uu____1315 uu____1316
               else ());
              c
let (mk_indexed_return :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.eff_decl ->
      FStar_Syntax_Syntax.universe ->
        FStar_Syntax_Syntax.typ ->
          FStar_Syntax_Syntax.term ->
            FStar_Range.range ->
              (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun ed ->
      fun u_a ->
        fun a ->
          fun e ->
            fun r ->
              (let uu____1357 =
                 FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                   (FStar_Options.Other "LayeredEffects") in
               if uu____1357
               then
                 let uu____1358 =
                   FStar_Ident.string_of_lid ed.FStar_Syntax_Syntax.mname in
                 let uu____1359 = FStar_Syntax_Print.univ_to_string u_a in
                 let uu____1360 = FStar_Syntax_Print.term_to_string a in
                 let uu____1361 = FStar_Syntax_Print.term_to_string e in
                 FStar_Util.print4
                   "Computing %s.return for u_a:%s, a:%s, and e:%s{\n"
                   uu____1358 uu____1359 uu____1360 uu____1361
               else ());
              (let uu____1363 =
                 let uu____1368 =
                   FStar_All.pipe_right ed
                     FStar_Syntax_Util.get_return_vc_combinator in
                 FStar_TypeChecker_Env.inst_tscheme_with uu____1368 [u_a] in
               match uu____1363 with
               | (uu____1373, return_t) ->
                   let return_t_shape_error s =
                     let uu____1385 =
                       let uu____1386 =
                         FStar_Ident.string_of_lid
                           ed.FStar_Syntax_Syntax.mname in
                       let uu____1387 =
                         FStar_Syntax_Print.term_to_string return_t in
                       FStar_Util.format3
                         "%s.return %s does not have proper shape (reason:%s)"
                         uu____1386 uu____1387 s in
                     (FStar_Errors.Fatal_UnexpectedEffect, uu____1385) in
                   let uu____1388 =
                     let uu____1417 =
                       let uu____1418 = FStar_Syntax_Subst.compress return_t in
                       uu____1418.FStar_Syntax_Syntax.n in
                     match uu____1417 with
                     | FStar_Syntax_Syntax.Tm_arrow (bs, c) when
                         (FStar_List.length bs) >= (Prims.of_int (2)) ->
                         let uu____1477 = FStar_Syntax_Subst.open_comp bs c in
                         (match uu____1477 with
                          | (a_b::x_b::bs1, c1) ->
                              let uu____1546 =
                                FStar_Syntax_Util.comp_to_comp_typ c1 in
                              (a_b, x_b, bs1, uu____1546))
                     | uu____1567 ->
                         let uu____1568 =
                           return_t_shape_error
                             "Either not an arrow or not enough binders" in
                         FStar_Errors.raise_error uu____1568 r in
                   (match uu____1388 with
                    | (a_b, x_b, rest_bs, return_ct) ->
                        let uu____1649 =
                          let uu____1656 =
                            let uu____1657 =
                              let uu____1658 =
                                let uu____1665 =
                                  FStar_All.pipe_right a_b
                                    FStar_Pervasives_Native.fst in
                                (uu____1665, a) in
                              FStar_Syntax_Syntax.NT uu____1658 in
                            let uu____1676 =
                              let uu____1679 =
                                let uu____1680 =
                                  let uu____1687 =
                                    FStar_All.pipe_right x_b
                                      FStar_Pervasives_Native.fst in
                                  (uu____1687, e) in
                                FStar_Syntax_Syntax.NT uu____1680 in
                              [uu____1679] in
                            uu____1657 :: uu____1676 in
                          FStar_TypeChecker_Env.uvars_for_binders env rest_bs
                            uu____1656
                            (fun b ->
                               let uu____1703 =
                                 FStar_Syntax_Print.binder_to_string b in
                               let uu____1704 =
                                 let uu____1705 =
                                   FStar_Ident.string_of_lid
                                     ed.FStar_Syntax_Syntax.mname in
                                 FStar_Util.format1 "%s.return" uu____1705 in
                               let uu____1706 = FStar_Range.string_of_range r in
                               FStar_Util.format3
                                 "implicit var for binder %s of %s at %s"
                                 uu____1703 uu____1704 uu____1706) r in
                        (match uu____1649 with
                         | (rest_bs_uvars, g_uvars) ->
                             let subst =
                               FStar_List.map2
                                 (fun b ->
                                    fun t ->
                                      let uu____1741 =
                                        let uu____1748 =
                                          FStar_All.pipe_right b
                                            FStar_Pervasives_Native.fst in
                                        (uu____1748, t) in
                                      FStar_Syntax_Syntax.NT uu____1741) (a_b
                                 :: x_b :: rest_bs) (a :: e :: rest_bs_uvars) in
                             let is =
                               let uu____1774 =
                                 let uu____1777 =
                                   FStar_Syntax_Subst.compress
                                     return_ct.FStar_Syntax_Syntax.result_typ in
                                 let uu____1778 =
                                   FStar_Syntax_Util.is_layered ed in
                                 effect_args_from_repr uu____1777 uu____1778
                                   r in
                               FStar_All.pipe_right uu____1774
                                 (FStar_List.map
                                    (FStar_Syntax_Subst.subst subst)) in
                             let c =
                               let uu____1784 =
                                 let uu____1785 =
                                   FStar_All.pipe_right is
                                     (FStar_List.map
                                        FStar_Syntax_Syntax.as_arg) in
                                 {
                                   FStar_Syntax_Syntax.comp_univs = [u_a];
                                   FStar_Syntax_Syntax.effect_name =
                                     (ed.FStar_Syntax_Syntax.mname);
                                   FStar_Syntax_Syntax.result_typ = a;
                                   FStar_Syntax_Syntax.effect_args =
                                     uu____1785;
                                   FStar_Syntax_Syntax.flags = []
                                 } in
                               FStar_Syntax_Syntax.mk_Comp uu____1784 in
                             ((let uu____1809 =
                                 FStar_All.pipe_left
                                   (FStar_TypeChecker_Env.debug env)
                                   (FStar_Options.Other "LayeredEffects") in
                               if uu____1809
                               then
                                 let uu____1810 =
                                   FStar_Syntax_Print.comp_to_string c in
                                 FStar_Util.print1 "} c after return %s\n"
                                   uu____1810
                               else ());
                              (c, g_uvars)))))
let (mk_return :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.eff_decl ->
      FStar_Syntax_Syntax.universe ->
        FStar_Syntax_Syntax.typ ->
          FStar_Syntax_Syntax.term ->
            FStar_Range.range ->
              (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun ed ->
      fun u_a ->
        fun a ->
          fun e ->
            fun r ->
              let uu____1850 =
                FStar_All.pipe_right ed FStar_Syntax_Util.is_layered in
              if uu____1850
              then mk_indexed_return env ed u_a a e r
              else
                (let uu____1856 = mk_wp_return env ed u_a a e r in
                 (uu____1856, FStar_TypeChecker_Env.trivial_guard))
let (lift_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp_typ ->
      FStar_TypeChecker_Env.mlift ->
        (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun c ->
      fun lift ->
        let uu____1880 =
          FStar_All.pipe_right
            (let uu___257_1882 = c in
             {
               FStar_Syntax_Syntax.comp_univs =
                 (uu___257_1882.FStar_Syntax_Syntax.comp_univs);
               FStar_Syntax_Syntax.effect_name =
                 (uu___257_1882.FStar_Syntax_Syntax.effect_name);
               FStar_Syntax_Syntax.result_typ =
                 (uu___257_1882.FStar_Syntax_Syntax.result_typ);
               FStar_Syntax_Syntax.effect_args =
                 (uu___257_1882.FStar_Syntax_Syntax.effect_args);
               FStar_Syntax_Syntax.flags = []
             }) FStar_Syntax_Syntax.mk_Comp in
        FStar_All.pipe_right uu____1880
          (lift.FStar_TypeChecker_Env.mlift_wp env)
let (join_effects :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident -> FStar_Ident.lident -> FStar_Ident.lident)
  =
  fun env ->
    fun l1_in ->
      fun l2_in ->
        let uu____1902 =
          let uu____1907 = FStar_TypeChecker_Env.norm_eff_name env l1_in in
          let uu____1908 = FStar_TypeChecker_Env.norm_eff_name env l2_in in
          (uu____1907, uu____1908) in
        match uu____1902 with
        | (l1, l2) ->
            let uu____1911 = FStar_TypeChecker_Env.join_opt env l1 l2 in
            (match uu____1911 with
             | FStar_Pervasives_Native.Some (m, uu____1921, uu____1922) -> m
             | FStar_Pervasives_Native.None ->
                 let uu____1935 =
                   FStar_TypeChecker_Env.exists_polymonadic_bind env l1 l2 in
                 (match uu____1935 with
                  | FStar_Pervasives_Native.Some (m, uu____1949) -> m
                  | FStar_Pervasives_Native.None ->
                      let uu____1982 =
                        let uu____1987 =
                          let uu____1988 =
                            FStar_Syntax_Print.lid_to_string l1_in in
                          let uu____1989 =
                            FStar_Syntax_Print.lid_to_string l2_in in
                          FStar_Util.format2
                            "Effects %s and %s cannot be composed" uu____1988
                            uu____1989 in
                        (FStar_Errors.Fatal_EffectsCannotBeComposed,
                          uu____1987) in
                      FStar_Errors.raise_error uu____1982
                        env.FStar_TypeChecker_Env.range))
let (join_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.lcomp ->
      FStar_TypeChecker_Common.lcomp -> FStar_Ident.lident)
  =
  fun env ->
    fun c1 ->
      fun c2 ->
        let uu____2005 =
          (FStar_TypeChecker_Common.is_total_lcomp c1) &&
            (FStar_TypeChecker_Common.is_total_lcomp c2) in
        if uu____2005
        then FStar_Parser_Const.effect_Tot_lid
        else
          join_effects env c1.FStar_TypeChecker_Common.eff_name
            c2.FStar_TypeChecker_Common.eff_name
let (lift_comps_sep_guards :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
          Prims.bool ->
            (FStar_Ident.lident * FStar_Syntax_Syntax.comp *
              FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t *
              FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun c1 ->
      fun c2 ->
        fun b ->
          fun for_bind ->
            let c11 = FStar_TypeChecker_Env.unfold_effect_abbrev env c1 in
            let c21 = FStar_TypeChecker_Env.unfold_effect_abbrev env c2 in
            let uu____2058 =
              FStar_TypeChecker_Env.join_opt env
                c11.FStar_Syntax_Syntax.effect_name
                c21.FStar_Syntax_Syntax.effect_name in
            match uu____2058 with
            | FStar_Pervasives_Native.Some (m, lift1, lift2) ->
                let uu____2086 = lift_comp env c11 lift1 in
                (match uu____2086 with
                 | (c12, g1) ->
                     let uu____2103 =
                       if Prims.op_Negation for_bind
                       then lift_comp env c21 lift2
                       else
                         (let x_a =
                            match b with
                            | FStar_Pervasives_Native.None ->
                                FStar_Syntax_Syntax.null_binder
                                  (FStar_Syntax_Util.comp_result c12)
                            | FStar_Pervasives_Native.Some x ->
                                FStar_Syntax_Syntax.mk_binder x in
                          let env_x =
                            FStar_TypeChecker_Env.push_binders env [x_a] in
                          let uu____2140 = lift_comp env_x c21 lift2 in
                          match uu____2140 with
                          | (c22, g2) ->
                              let uu____2151 =
                                FStar_TypeChecker_Env.close_guard env 
                                  [x_a] g2 in
                              (c22, uu____2151)) in
                     (match uu____2103 with
                      | (c22, g2) -> (m, c12, c22, g1, g2)))
            | FStar_Pervasives_Native.None ->
                let uu____2182 =
                  let uu____2187 =
                    let uu____2188 =
                      FStar_Syntax_Print.lid_to_string
                        c11.FStar_Syntax_Syntax.effect_name in
                    let uu____2189 =
                      FStar_Syntax_Print.lid_to_string
                        c21.FStar_Syntax_Syntax.effect_name in
                    FStar_Util.format2 "Effects %s and %s cannot be composed"
                      uu____2188 uu____2189 in
                  (FStar_Errors.Fatal_EffectsCannotBeComposed, uu____2187) in
                FStar_Errors.raise_error uu____2182
                  env.FStar_TypeChecker_Env.range
let (lift_comps :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
          Prims.bool ->
            (FStar_Ident.lident * FStar_Syntax_Syntax.comp *
              FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun c1 ->
      fun c2 ->
        fun b ->
          fun for_bind ->
            let uu____2245 = lift_comps_sep_guards env c1 c2 b for_bind in
            match uu____2245 with
            | (l, c11, c21, g1, g2) ->
                let uu____2269 = FStar_TypeChecker_Env.conj_guard g1 g2 in
                (l, c11, c21, uu____2269)
let (is_pure_effect :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> Prims.bool) =
  fun env ->
    fun l ->
      let l1 = FStar_TypeChecker_Env.norm_eff_name env l in
      FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_PURE_lid
let (is_ghost_effect :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> Prims.bool) =
  fun env ->
    fun l ->
      let l1 = FStar_TypeChecker_Env.norm_eff_name env l in
      FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_GHOST_lid
let (is_pure_or_ghost_effect :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> Prims.bool) =
  fun env ->
    fun l ->
      let l1 = FStar_TypeChecker_Env.norm_eff_name env l in
      (FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_PURE_lid) ||
        (FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_GHOST_lid)
let (lax_mk_tot_or_comp_l :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.cflag Prims.list -> FStar_Syntax_Syntax.comp)
  =
  fun mname ->
    fun u_result ->
      fun result ->
        fun flags ->
          let uu____2331 =
            FStar_Ident.lid_equals mname FStar_Parser_Const.effect_Tot_lid in
          if uu____2331
          then
            FStar_Syntax_Syntax.mk_Total' result
              (FStar_Pervasives_Native.Some u_result)
          else mk_comp_l mname u_result result FStar_Syntax_Syntax.tun flags
let (is_function : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t ->
    let uu____2338 =
      let uu____2339 = FStar_Syntax_Subst.compress t in
      uu____2339.FStar_Syntax_Syntax.n in
    match uu____2338 with
    | FStar_Syntax_Syntax.Tm_arrow uu____2342 -> true
    | uu____2357 -> false
let (label :
  Prims.string ->
    FStar_Range.range -> FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ)
  =
  fun reason ->
    fun r ->
      fun f ->
        FStar_Syntax_Syntax.mk
          (FStar_Syntax_Syntax.Tm_meta
             (f, (FStar_Syntax_Syntax.Meta_labeled (reason, r, false))))
          f.FStar_Syntax_Syntax.pos
let (label_opt :
  FStar_TypeChecker_Env.env ->
    (unit -> Prims.string) FStar_Pervasives_Native.option ->
      FStar_Range.range -> FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ)
  =
  fun env ->
    fun reason ->
      fun r ->
        fun f ->
          match reason with
          | FStar_Pervasives_Native.None -> f
          | FStar_Pervasives_Native.Some reason1 ->
              let uu____2414 =
                let uu____2415 = FStar_TypeChecker_Env.should_verify env in
                FStar_All.pipe_left Prims.op_Negation uu____2415 in
              if uu____2414
              then f
              else (let uu____2417 = reason1 () in label uu____2417 r f)
let (label_guard :
  FStar_Range.range ->
    Prims.string ->
      FStar_TypeChecker_Common.guard_t -> FStar_TypeChecker_Common.guard_t)
  =
  fun r ->
    fun reason ->
      fun g ->
        match g.FStar_TypeChecker_Common.guard_f with
        | FStar_TypeChecker_Common.Trivial -> g
        | FStar_TypeChecker_Common.NonTrivial f ->
            let uu___354_2434 = g in
            let uu____2435 =
              let uu____2436 = label reason r f in
              FStar_TypeChecker_Common.NonTrivial uu____2436 in
            {
              FStar_TypeChecker_Common.guard_f = uu____2435;
              FStar_TypeChecker_Common.deferred_to_tac =
                (uu___354_2434.FStar_TypeChecker_Common.deferred_to_tac);
              FStar_TypeChecker_Common.deferred =
                (uu___354_2434.FStar_TypeChecker_Common.deferred);
              FStar_TypeChecker_Common.univ_ineqs =
                (uu___354_2434.FStar_TypeChecker_Common.univ_ineqs);
              FStar_TypeChecker_Common.implicits =
                (uu___354_2434.FStar_TypeChecker_Common.implicits)
            }
let (close_wp_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list ->
      FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun env ->
    fun bvs ->
      fun c ->
        let uu____2456 = FStar_Syntax_Util.is_ml_comp c in
        if uu____2456
        then c
        else
          (let uu____2458 =
             env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ()) in
           if uu____2458
           then c
           else
             (let close_wp u_res md res_t bvs1 wp0 =
                let close =
                  let uu____2497 =
                    FStar_All.pipe_right md
                      FStar_Syntax_Util.get_wp_close_combinator in
                  FStar_All.pipe_right uu____2497 FStar_Util.must in
                FStar_List.fold_right
                  (fun x ->
                     fun wp ->
                       let bs =
                         let uu____2526 = FStar_Syntax_Syntax.mk_binder x in
                         [uu____2526] in
                       let us =
                         let uu____2548 =
                           let uu____2551 =
                             env.FStar_TypeChecker_Env.universe_of env
                               x.FStar_Syntax_Syntax.sort in
                           [uu____2551] in
                         u_res :: uu____2548 in
                       let wp1 =
                         FStar_Syntax_Util.abs bs wp
                           (FStar_Pervasives_Native.Some
                              (FStar_Syntax_Util.mk_residual_comp
                                 FStar_Parser_Const.effect_Tot_lid
                                 FStar_Pervasives_Native.None
                                 [FStar_Syntax_Syntax.TOTAL])) in
                       let uu____2557 =
                         FStar_TypeChecker_Env.inst_effect_fun_with us env md
                           close in
                       let uu____2558 =
                         let uu____2559 = FStar_Syntax_Syntax.as_arg res_t in
                         let uu____2568 =
                           let uu____2579 =
                             FStar_Syntax_Syntax.as_arg
                               x.FStar_Syntax_Syntax.sort in
                           let uu____2588 =
                             let uu____2599 = FStar_Syntax_Syntax.as_arg wp1 in
                             [uu____2599] in
                           uu____2579 :: uu____2588 in
                         uu____2559 :: uu____2568 in
                       FStar_Syntax_Syntax.mk_Tm_app uu____2557 uu____2558
                         wp0.FStar_Syntax_Syntax.pos) bvs1 wp0 in
              let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c in
              let uu____2641 = destruct_wp_comp c1 in
              match uu____2641 with
              | (u_res_t, res_t, wp) ->
                  let md =
                    FStar_TypeChecker_Env.get_effect_decl env
                      c1.FStar_Syntax_Syntax.effect_name in
                  let wp1 = close_wp u_res_t md res_t bvs wp in
                  mk_comp md u_res_t c1.FStar_Syntax_Syntax.result_typ wp1
                    c1.FStar_Syntax_Syntax.flags))
let (close_wp_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list ->
      FStar_TypeChecker_Common.lcomp -> FStar_TypeChecker_Common.lcomp)
  =
  fun env ->
    fun bvs ->
      fun lc ->
        let bs =
          FStar_All.pipe_right bvs
            (FStar_List.map FStar_Syntax_Syntax.mk_binder) in
        FStar_All.pipe_right lc
          (FStar_TypeChecker_Common.apply_lcomp (close_wp_comp env bvs)
             (fun g ->
                let uu____2680 =
                  FStar_All.pipe_right g
                    (FStar_TypeChecker_Env.close_guard env bs) in
                FStar_All.pipe_right uu____2680
                  (close_guard_implicits env false bs)))
let (close_layered_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list ->
      FStar_Syntax_Syntax.term Prims.list ->
        FStar_TypeChecker_Common.lcomp -> FStar_TypeChecker_Common.lcomp)
  =
  fun env ->
    fun bvs ->
      fun tms ->
        fun lc ->
          let bs =
            FStar_All.pipe_right bvs
              (FStar_List.map FStar_Syntax_Syntax.mk_binder) in
          let substs =
            FStar_List.map2
              (fun bv -> fun tm -> FStar_Syntax_Syntax.NT (bv, tm)) bvs tms in
          FStar_All.pipe_right lc
            (FStar_TypeChecker_Common.apply_lcomp
               (FStar_Syntax_Subst.subst_comp substs)
               (fun g ->
                  let uu____2728 =
                    FStar_All.pipe_right g
                      (FStar_TypeChecker_Env.close_guard env bs) in
                  FStar_All.pipe_right uu____2728
                    (close_guard_implicits env false bs)))
let (should_not_inline_lc : FStar_TypeChecker_Common.lcomp -> Prims.bool) =
  fun lc ->
    FStar_All.pipe_right lc.FStar_TypeChecker_Common.cflags
      (FStar_Util.for_some
         (fun uu___0_2737 ->
            match uu___0_2737 with
            | FStar_Syntax_Syntax.SHOULD_NOT_INLINE -> true
            | uu____2738 -> false))
let (should_return :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
      FStar_TypeChecker_Common.lcomp -> Prims.bool)
  =
  fun env ->
    fun eopt ->
      fun lc ->
        let lc_is_unit_or_effectful =
          let uu____2759 =
            let uu____2762 =
              FStar_All.pipe_right lc.FStar_TypeChecker_Common.res_typ
                FStar_Syntax_Util.arrow_formals_comp in
            FStar_All.pipe_right uu____2762 FStar_Pervasives_Native.snd in
          FStar_All.pipe_right uu____2759
            (fun c ->
               (let uu____2785 =
                  FStar_TypeChecker_Env.is_reifiable_comp env c in
                Prims.op_Negation uu____2785) &&
                 ((FStar_All.pipe_right (FStar_Syntax_Util.comp_result c)
                     FStar_Syntax_Util.is_unit)
                    ||
                    (let uu____2787 =
                       FStar_Syntax_Util.is_pure_or_ghost_comp c in
                     Prims.op_Negation uu____2787))) in
        match eopt with
        | FStar_Pervasives_Native.None -> false
        | FStar_Pervasives_Native.Some e ->
            (((FStar_TypeChecker_Common.is_pure_or_ghost_lcomp lc) &&
                (Prims.op_Negation lc_is_unit_or_effectful))
               &&
               (let uu____2795 = FStar_Syntax_Util.head_and_args' e in
                match uu____2795 with
                | (head, uu____2811) ->
                    let uu____2832 =
                      let uu____2833 = FStar_Syntax_Util.un_uinst head in
                      uu____2833.FStar_Syntax_Syntax.n in
                    (match uu____2832 with
                     | FStar_Syntax_Syntax.Tm_fvar fv ->
                         let uu____2837 =
                           let uu____2838 = FStar_Syntax_Syntax.lid_of_fv fv in
                           FStar_TypeChecker_Env.is_irreducible env
                             uu____2838 in
                         Prims.op_Negation uu____2837
                     | uu____2839 -> true)))
              &&
              (let uu____2841 = should_not_inline_lc lc in
               Prims.op_Negation uu____2841)
let (return_value :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
            (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun eff_lid ->
      fun u_t_opt ->
        fun t ->
          fun v ->
            let u =
              match u_t_opt with
              | FStar_Pervasives_Native.None ->
                  env.FStar_TypeChecker_Env.universe_of env t
              | FStar_Pervasives_Native.Some u -> u in
            let uu____2885 =
              FStar_TypeChecker_Env.get_effect_decl env eff_lid in
            mk_return env uu____2885 u t v v.FStar_Syntax_Syntax.pos
let (mk_indexed_bind :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      FStar_Ident.lident ->
        FStar_Ident.lident ->
          FStar_Syntax_Syntax.tscheme ->
            FStar_Syntax_Syntax.comp_typ ->
              FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
                FStar_Syntax_Syntax.comp_typ ->
                  FStar_Syntax_Syntax.cflag Prims.list ->
                    FStar_Range.range ->
                      (FStar_Syntax_Syntax.comp *
                        FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun m ->
      fun n ->
        fun p ->
          fun bind_t ->
            fun ct1 ->
              fun b ->
                fun ct2 ->
                  fun flags ->
                    fun r1 ->
                      let bind_name =
                        let uu____2953 =
                          let uu____2954 =
                            FStar_All.pipe_right m FStar_Ident.ident_of_lid in
                          FStar_All.pipe_right uu____2954
                            FStar_Ident.string_of_id in
                        let uu____2955 =
                          let uu____2956 =
                            FStar_All.pipe_right n FStar_Ident.ident_of_lid in
                          FStar_All.pipe_right uu____2956
                            FStar_Ident.string_of_id in
                        let uu____2957 =
                          let uu____2958 =
                            FStar_All.pipe_right p FStar_Ident.ident_of_lid in
                          FStar_All.pipe_right uu____2958
                            FStar_Ident.string_of_id in
                        FStar_Util.format3 "(%s, %s) |> %s" uu____2953
                          uu____2955 uu____2957 in
                      (let uu____2960 =
                         FStar_All.pipe_left
                           (FStar_TypeChecker_Env.debug env)
                           (FStar_Options.Other "LayeredEffects") in
                       if uu____2960
                       then
                         let uu____2961 =
                           let uu____2962 = FStar_Syntax_Syntax.mk_Comp ct1 in
                           FStar_Syntax_Print.comp_to_string uu____2962 in
                         let uu____2963 =
                           let uu____2964 = FStar_Syntax_Syntax.mk_Comp ct2 in
                           FStar_Syntax_Print.comp_to_string uu____2964 in
                         FStar_Util.print2 "Binding c1:%s and c2:%s {\n"
                           uu____2961 uu____2963
                       else ());
                      (let uu____2967 =
                         FStar_All.pipe_left
                           (FStar_TypeChecker_Env.debug env)
                           (FStar_Options.Other "ResolveImplicitsHook") in
                       if uu____2967
                       then
                         let uu____2968 =
                           let uu____2969 =
                             FStar_TypeChecker_Env.get_range env in
                           FStar_Range.string_of_range uu____2969 in
                         let uu____2970 =
                           FStar_Syntax_Print.tscheme_to_string bind_t in
                         FStar_Util.print2
                           "///////////////////////////////Bind at %s/////////////////////\nwith bind_t = %s\n"
                           uu____2968 uu____2970
                       else ());
                      (let uu____2972 =
                         let uu____2979 =
                           FStar_TypeChecker_Env.get_effect_decl env m in
                         let uu____2980 =
                           FStar_TypeChecker_Env.get_effect_decl env n in
                         let uu____2981 =
                           FStar_TypeChecker_Env.get_effect_decl env p in
                         (uu____2979, uu____2980, uu____2981) in
                       match uu____2972 with
                       | (m_ed, n_ed, p_ed) ->
                           let uu____2989 =
                             let uu____3002 =
                               FStar_List.hd
                                 ct1.FStar_Syntax_Syntax.comp_univs in
                             let uu____3003 =
                               FStar_List.map FStar_Pervasives_Native.fst
                                 ct1.FStar_Syntax_Syntax.effect_args in
                             (uu____3002,
                               (ct1.FStar_Syntax_Syntax.result_typ),
                               uu____3003) in
                           (match uu____2989 with
                            | (u1, t1, is1) ->
                                let uu____3047 =
                                  let uu____3060 =
                                    FStar_List.hd
                                      ct2.FStar_Syntax_Syntax.comp_univs in
                                  let uu____3061 =
                                    FStar_List.map
                                      FStar_Pervasives_Native.fst
                                      ct2.FStar_Syntax_Syntax.effect_args in
                                  (uu____3060,
                                    (ct2.FStar_Syntax_Syntax.result_typ),
                                    uu____3061) in
                                (match uu____3047 with
                                 | (u2, t2, is2) ->
                                     let uu____3105 =
                                       FStar_TypeChecker_Env.inst_tscheme_with
                                         bind_t [u1; u2] in
                                     (match uu____3105 with
                                      | (uu____3114, bind_t1) ->
                                          let bind_t_shape_error s =
                                            let uu____3126 =
                                              let uu____3127 =
                                                FStar_Syntax_Print.term_to_string
                                                  bind_t1 in
                                              FStar_Util.format3
                                                "bind %s (%s) does not have proper shape (reason:%s)"
                                                uu____3127 bind_name s in
                                            (FStar_Errors.Fatal_UnexpectedEffect,
                                              uu____3126) in
                                          let uu____3128 =
                                            let uu____3173 =
                                              let uu____3174 =
                                                FStar_Syntax_Subst.compress
                                                  bind_t1 in
                                              uu____3174.FStar_Syntax_Syntax.n in
                                            match uu____3173 with
                                            | FStar_Syntax_Syntax.Tm_arrow
                                                (bs, c) when
                                                (FStar_List.length bs) >=
                                                  (Prims.of_int (4))
                                                ->
                                                let uu____3249 =
                                                  FStar_Syntax_Subst.open_comp
                                                    bs c in
                                                (match uu____3249 with
                                                 | (a_b::b_b::bs1, c1) ->
                                                     let uu____3334 =
                                                       let uu____3361 =
                                                         FStar_List.splitAt
                                                           ((FStar_List.length
                                                               bs1)
                                                              -
                                                              (Prims.of_int (2)))
                                                           bs1 in
                                                       FStar_All.pipe_right
                                                         uu____3361
                                                         (fun uu____3445 ->
                                                            match uu____3445
                                                            with
                                                            | (l1, l2) ->
                                                                let uu____3526
                                                                  =
                                                                  FStar_List.hd
                                                                    l2 in
                                                                let uu____3539
                                                                  =
                                                                  let uu____3546
                                                                    =
                                                                    FStar_List.tl
                                                                    l2 in
                                                                  FStar_List.hd
                                                                    uu____3546 in
                                                                (l1,
                                                                  uu____3526,
                                                                  uu____3539)) in
                                                     (match uu____3334 with
                                                      | (rest_bs, f_b, g_b)
                                                          ->
                                                          (a_b, b_b, rest_bs,
                                                            f_b, g_b, c1)))
                                            | uu____3706 ->
                                                let uu____3707 =
                                                  bind_t_shape_error
                                                    "Either not an arrow or not enough binders" in
                                                FStar_Errors.raise_error
                                                  uu____3707 r1 in
                                          (match uu____3128 with
                                           | (a_b, b_b, rest_bs, f_b, g_b,
                                              bind_c) ->
                                               let uu____3830 =
                                                 let uu____3837 =
                                                   let uu____3838 =
                                                     let uu____3839 =
                                                       let uu____3846 =
                                                         FStar_All.pipe_right
                                                           a_b
                                                           FStar_Pervasives_Native.fst in
                                                       (uu____3846, t1) in
                                                     FStar_Syntax_Syntax.NT
                                                       uu____3839 in
                                                   let uu____3857 =
                                                     let uu____3860 =
                                                       let uu____3861 =
                                                         let uu____3868 =
                                                           FStar_All.pipe_right
                                                             b_b
                                                             FStar_Pervasives_Native.fst in
                                                         (uu____3868, t2) in
                                                       FStar_Syntax_Syntax.NT
                                                         uu____3861 in
                                                     [uu____3860] in
                                                   uu____3838 :: uu____3857 in
                                                 FStar_TypeChecker_Env.uvars_for_binders
                                                   env rest_bs uu____3837
                                                   (fun b1 ->
                                                      let uu____3883 =
                                                        FStar_Syntax_Print.binder_to_string
                                                          b1 in
                                                      let uu____3884 =
                                                        FStar_Range.string_of_range
                                                          r1 in
                                                      FStar_Util.format3
                                                        "implicit var for binder %s of %s at %s"
                                                        uu____3883 bind_name
                                                        uu____3884) r1 in
                                               (match uu____3830 with
                                                | (rest_bs_uvars, g_uvars) ->
                                                    ((let uu____3896 =
                                                        FStar_All.pipe_left
                                                          (FStar_TypeChecker_Env.debug
                                                             env)
                                                          (FStar_Options.Other
                                                             "ResolveImplicitsHook") in
                                                      if uu____3896
                                                      then
                                                        FStar_All.pipe_right
                                                          rest_bs_uvars
                                                          (FStar_List.iter
                                                             (fun t ->
                                                                let uu____3906
                                                                  =
                                                                  let uu____3907
                                                                    =
                                                                    FStar_Syntax_Subst.compress
                                                                    t in
                                                                  uu____3907.FStar_Syntax_Syntax.n in
                                                                match uu____3906
                                                                with
                                                                | FStar_Syntax_Syntax.Tm_uvar
                                                                    (u,
                                                                    uu____3911)
                                                                    ->
                                                                    let uu____3928
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    t in
                                                                    let uu____3929
                                                                    =
                                                                    match 
                                                                    u.FStar_Syntax_Syntax.ctx_uvar_meta
                                                                    with
                                                                    | 
                                                                    FStar_Pervasives_Native.Some
                                                                    (FStar_Syntax_Syntax.Ctx_uvar_meta_attr
                                                                    a) ->
                                                                    FStar_Syntax_Print.term_to_string
                                                                    a
                                                                    | 
                                                                    uu____3933
                                                                    ->
                                                                    "<no attr>" in
                                                                    FStar_Util.print2
                                                                    "Generated uvar %s with attribute %s\n"
                                                                    uu____3928
                                                                    uu____3929))
                                                      else ());
                                                     (let subst =
                                                        FStar_List.map2
                                                          (fun b1 ->
                                                             fun t ->
                                                               let uu____3961
                                                                 =
                                                                 let uu____3968
                                                                   =
                                                                   FStar_All.pipe_right
                                                                    b1
                                                                    FStar_Pervasives_Native.fst in
                                                                 (uu____3968,
                                                                   t) in
                                                               FStar_Syntax_Syntax.NT
                                                                 uu____3961)
                                                          (a_b :: b_b ::
                                                          rest_bs) (t1 :: t2
                                                          :: rest_bs_uvars) in
                                                      let f_guard =
                                                        let f_sort_is =
                                                          let uu____3997 =
                                                            let uu____4000 =
                                                              let uu____4001
                                                                =
                                                                let uu____4002
                                                                  =
                                                                  FStar_All.pipe_right
                                                                    f_b
                                                                    FStar_Pervasives_Native.fst in
                                                                uu____4002.FStar_Syntax_Syntax.sort in
                                                              FStar_Syntax_Subst.compress
                                                                uu____4001 in
                                                            let uu____4011 =
                                                              FStar_Syntax_Util.is_layered
                                                                m_ed in
                                                            effect_args_from_repr
                                                              uu____4000
                                                              uu____4011 r1 in
                                                          FStar_All.pipe_right
                                                            uu____3997
                                                            (FStar_List.map
                                                               (FStar_Syntax_Subst.subst
                                                                  subst)) in
                                                        FStar_List.fold_left2
                                                          (fun g ->
                                                             fun i1 ->
                                                               fun f_i1 ->
                                                                 (let uu____4035
                                                                    =
                                                                    FStar_All.pipe_left
                                                                    (FStar_TypeChecker_Env.debug
                                                                    env)
                                                                    (FStar_Options.Other
                                                                    "ResolveImplicitsHook") in
                                                                  if
                                                                    uu____4035
                                                                  then
                                                                    let uu____4036
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    i1 in
                                                                    let uu____4037
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    f_i1 in
                                                                    FStar_Util.print2
                                                                    "Generating constraint %s = %s\n"
                                                                    uu____4036
                                                                    uu____4037
                                                                  else ());
                                                                 (let uu____4039
                                                                    =
                                                                    FStar_TypeChecker_Rel.layered_effect_teq
                                                                    env i1
                                                                    f_i1
                                                                    (FStar_Pervasives_Native.Some
                                                                    bind_name) in
                                                                  FStar_TypeChecker_Env.conj_guard
                                                                    g
                                                                    uu____4039))
                                                          FStar_TypeChecker_Env.trivial_guard
                                                          is1 f_sort_is in
                                                      let g_guard =
                                                        let x_a =
                                                          match b with
                                                          | FStar_Pervasives_Native.None
                                                              ->
                                                              FStar_Syntax_Syntax.null_binder
                                                                ct1.FStar_Syntax_Syntax.result_typ
                                                          | FStar_Pervasives_Native.Some
                                                              x ->
                                                              FStar_Syntax_Syntax.mk_binder
                                                                x in
                                                        let g_sort_is =
                                                          let uu____4058 =
                                                            let uu____4059 =
                                                              let uu____4062
                                                                =
                                                                let uu____4063
                                                                  =
                                                                  FStar_All.pipe_right
                                                                    g_b
                                                                    FStar_Pervasives_Native.fst in
                                                                uu____4063.FStar_Syntax_Syntax.sort in
                                                              FStar_Syntax_Subst.compress
                                                                uu____4062 in
                                                            uu____4059.FStar_Syntax_Syntax.n in
                                                          match uu____4058
                                                          with
                                                          | FStar_Syntax_Syntax.Tm_arrow
                                                              (bs, c) ->
                                                              let uu____4096
                                                                =
                                                                FStar_Syntax_Subst.open_comp
                                                                  bs c in
                                                              (match uu____4096
                                                               with
                                                               | (bs1, c1) ->
                                                                   let bs_subst
                                                                    =
                                                                    let uu____4106
                                                                    =
                                                                    let uu____4113
                                                                    =
                                                                    let uu____4114
                                                                    =
                                                                    FStar_List.hd
                                                                    bs1 in
                                                                    FStar_All.pipe_right
                                                                    uu____4114
                                                                    FStar_Pervasives_Native.fst in
                                                                    let uu____4135
                                                                    =
                                                                    let uu____4138
                                                                    =
                                                                    FStar_All.pipe_right
                                                                    x_a
                                                                    FStar_Pervasives_Native.fst in
                                                                    FStar_All.pipe_right
                                                                    uu____4138
                                                                    FStar_Syntax_Syntax.bv_to_name in
                                                                    (uu____4113,
                                                                    uu____4135) in
                                                                    FStar_Syntax_Syntax.NT
                                                                    uu____4106 in
                                                                   let c2 =
                                                                    FStar_Syntax_Subst.subst_comp
                                                                    [bs_subst]
                                                                    c1 in
                                                                   let uu____4152
                                                                    =
                                                                    let uu____4155
                                                                    =
                                                                    FStar_Syntax_Subst.compress
                                                                    (FStar_Syntax_Util.comp_result
                                                                    c2) in
                                                                    let uu____4156
                                                                    =
                                                                    FStar_Syntax_Util.is_layered
                                                                    n_ed in
                                                                    effect_args_from_repr
                                                                    uu____4155
                                                                    uu____4156
                                                                    r1 in
                                                                   FStar_All.pipe_right
                                                                    uu____4152
                                                                    (FStar_List.map
                                                                    (FStar_Syntax_Subst.subst
                                                                    subst)))
                                                          | uu____4161 ->
                                                              failwith
                                                                "impossible: mk_indexed_bind" in
                                                        let env_g =
                                                          FStar_TypeChecker_Env.push_binders
                                                            env [x_a] in
                                                        let uu____4177 =
                                                          FStar_List.fold_left2
                                                            (fun g ->
                                                               fun i1 ->
                                                                 fun g_i1 ->
                                                                   (let uu____4195
                                                                    =
                                                                    FStar_All.pipe_left
                                                                    (FStar_TypeChecker_Env.debug
                                                                    env)
                                                                    (FStar_Options.Other
                                                                    "ResolveImplicitsHook") in
                                                                    if
                                                                    uu____4195
                                                                    then
                                                                    let uu____4196
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    i1 in
                                                                    let uu____4197
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    g_i1 in
                                                                    FStar_Util.print2
                                                                    "Generating constraint %s = %s\n"
                                                                    uu____4196
                                                                    uu____4197
                                                                    else ());
                                                                   (let uu____4199
                                                                    =
                                                                    FStar_TypeChecker_Rel.layered_effect_teq
                                                                    env_g i1
                                                                    g_i1
                                                                    (FStar_Pervasives_Native.Some
                                                                    bind_name) in
                                                                    FStar_TypeChecker_Env.conj_guard
                                                                    g
                                                                    uu____4199))
                                                            FStar_TypeChecker_Env.trivial_guard
                                                            is2 g_sort_is in
                                                        FStar_All.pipe_right
                                                          uu____4177
                                                          (FStar_TypeChecker_Env.close_guard
                                                             env [x_a]) in
                                                      let bind_ct =
                                                        let uu____4213 =
                                                          FStar_All.pipe_right
                                                            bind_c
                                                            (FStar_Syntax_Subst.subst_comp
                                                               subst) in
                                                        FStar_All.pipe_right
                                                          uu____4213
                                                          FStar_Syntax_Util.comp_to_comp_typ in
                                                      let fml =
                                                        let uu____4215 =
                                                          let uu____4220 =
                                                            FStar_List.hd
                                                              bind_ct.FStar_Syntax_Syntax.comp_univs in
                                                          let uu____4221 =
                                                            let uu____4222 =
                                                              FStar_List.hd
                                                                bind_ct.FStar_Syntax_Syntax.effect_args in
                                                            FStar_Pervasives_Native.fst
                                                              uu____4222 in
                                                          (uu____4220,
                                                            uu____4221) in
                                                        match uu____4215 with
                                                        | (u, wp) ->
                                                            FStar_TypeChecker_Env.pure_precondition_for_trivial_post
                                                              env u
                                                              bind_ct.FStar_Syntax_Syntax.result_typ
                                                              wp
                                                              FStar_Range.dummyRange in
                                                      let is =
                                                        let uu____4248 =
                                                          FStar_Syntax_Subst.compress
                                                            bind_ct.FStar_Syntax_Syntax.result_typ in
                                                        let uu____4249 =
                                                          FStar_Syntax_Util.is_layered
                                                            p_ed in
                                                        effect_args_from_repr
                                                          uu____4248
                                                          uu____4249 r1 in
                                                      let c =
                                                        let uu____4251 =
                                                          let uu____4252 =
                                                            FStar_List.map
                                                              FStar_Syntax_Syntax.as_arg
                                                              is in
                                                          {
                                                            FStar_Syntax_Syntax.comp_univs
                                                              =
                                                              (ct2.FStar_Syntax_Syntax.comp_univs);
                                                            FStar_Syntax_Syntax.effect_name
                                                              =
                                                              (p_ed.FStar_Syntax_Syntax.mname);
                                                            FStar_Syntax_Syntax.result_typ
                                                              = t2;
                                                            FStar_Syntax_Syntax.effect_args
                                                              = uu____4252;
                                                            FStar_Syntax_Syntax.flags
                                                              = flags
                                                          } in
                                                        FStar_Syntax_Syntax.mk_Comp
                                                          uu____4251 in
                                                      (let uu____4272 =
                                                         FStar_All.pipe_left
                                                           (FStar_TypeChecker_Env.debug
                                                              env)
                                                           (FStar_Options.Other
                                                              "LayeredEffects") in
                                                       if uu____4272
                                                       then
                                                         let uu____4273 =
                                                           FStar_Syntax_Print.comp_to_string
                                                             c in
                                                         FStar_Util.print1
                                                           "} c after bind: %s\n"
                                                           uu____4273
                                                       else ());
                                                      (let guard =
                                                         let uu____4276 =
                                                           let uu____4279 =
                                                             let uu____4282 =
                                                               let uu____4285
                                                                 =
                                                                 let uu____4288
                                                                   =
                                                                   FStar_TypeChecker_Env.guard_of_guard_formula
                                                                    (FStar_TypeChecker_Common.NonTrivial
                                                                    fml) in
                                                                 [uu____4288] in
                                                               g_guard ::
                                                                 uu____4285 in
                                                             f_guard ::
                                                               uu____4282 in
                                                           g_uvars ::
                                                             uu____4279 in
                                                         FStar_TypeChecker_Env.conj_guards
                                                           uu____4276 in
                                                       (let uu____4290 =
                                                          FStar_All.pipe_left
                                                            (FStar_TypeChecker_Env.debug
                                                               env)
                                                            (FStar_Options.Other
                                                               "ResolveImplicitsHook") in
                                                        if uu____4290
                                                        then
                                                          let uu____4291 =
                                                            let uu____4292 =
                                                              FStar_TypeChecker_Env.get_range
                                                                env in
                                                            FStar_Range.string_of_range
                                                              uu____4292 in
                                                          let uu____4293 =
                                                            FStar_TypeChecker_Rel.guard_to_string
                                                              env guard in
                                                          FStar_Util.print2
                                                            "///////////////////////////////EndBind at %s/////////////////////\nguard = %s\n"
                                                            uu____4291
                                                            uu____4293
                                                        else ());
                                                       (c, guard))))))))))
let (mk_wp_bind :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.comp_typ ->
        FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
          FStar_Syntax_Syntax.comp_typ ->
            FStar_Syntax_Syntax.cflag Prims.list ->
              FStar_Range.range -> FStar_Syntax_Syntax.comp)
  =
  fun env ->
    fun m ->
      fun ct1 ->
        fun b ->
          fun ct2 ->
            fun flags ->
              fun r1 ->
                let uu____4338 =
                  let md = FStar_TypeChecker_Env.get_effect_decl env m in
                  let uu____4364 = FStar_TypeChecker_Env.wp_signature env m in
                  match uu____4364 with
                  | (a, kwp) ->
                      let uu____4395 = destruct_wp_comp ct1 in
                      let uu____4402 = destruct_wp_comp ct2 in
                      ((md, a, kwp), uu____4395, uu____4402) in
                match uu____4338 with
                | ((md, a, kwp), (u_t1, t1, wp1), (u_t2, t2, wp2)) ->
                    let bs =
                      match b with
                      | FStar_Pervasives_Native.None ->
                          let uu____4455 = FStar_Syntax_Syntax.null_binder t1 in
                          [uu____4455]
                      | FStar_Pervasives_Native.Some x ->
                          let uu____4475 = FStar_Syntax_Syntax.mk_binder x in
                          [uu____4475] in
                    let mk_lam wp =
                      FStar_Syntax_Util.abs bs wp
                        (FStar_Pervasives_Native.Some
                           (FStar_Syntax_Util.mk_residual_comp
                              FStar_Parser_Const.effect_Tot_lid
                              FStar_Pervasives_Native.None
                              [FStar_Syntax_Syntax.TOTAL])) in
                    let r11 =
                      FStar_Syntax_Syntax.mk
                        (FStar_Syntax_Syntax.Tm_constant
                           (FStar_Const.Const_range r1)) r1 in
                    let wp_args =
                      let uu____4522 = FStar_Syntax_Syntax.as_arg r11 in
                      let uu____4531 =
                        let uu____4542 = FStar_Syntax_Syntax.as_arg t1 in
                        let uu____4551 =
                          let uu____4562 = FStar_Syntax_Syntax.as_arg t2 in
                          let uu____4571 =
                            let uu____4582 = FStar_Syntax_Syntax.as_arg wp1 in
                            let uu____4591 =
                              let uu____4602 =
                                let uu____4611 = mk_lam wp2 in
                                FStar_Syntax_Syntax.as_arg uu____4611 in
                              [uu____4602] in
                            uu____4582 :: uu____4591 in
                          uu____4562 :: uu____4571 in
                        uu____4542 :: uu____4551 in
                      uu____4522 :: uu____4531 in
                    let bind_wp =
                      FStar_All.pipe_right md
                        FStar_Syntax_Util.get_bind_vc_combinator in
                    let wp =
                      let uu____4662 =
                        FStar_TypeChecker_Env.inst_effect_fun_with
                          [u_t1; u_t2] env md bind_wp in
                      FStar_Syntax_Syntax.mk_Tm_app uu____4662 wp_args
                        t2.FStar_Syntax_Syntax.pos in
                    mk_comp md u_t2 t2 wp flags
let (mk_bind :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.comp ->
          FStar_Syntax_Syntax.cflag Prims.list ->
            FStar_Range.range ->
              (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun c1 ->
      fun b ->
        fun c2 ->
          fun flags ->
            fun r1 ->
              let uu____4709 =
                let uu____4714 =
                  FStar_TypeChecker_Env.unfold_effect_abbrev env c1 in
                let uu____4715 =
                  FStar_TypeChecker_Env.unfold_effect_abbrev env c2 in
                (uu____4714, uu____4715) in
              match uu____4709 with
              | (ct1, ct2) ->
                  let uu____4722 =
                    FStar_TypeChecker_Env.exists_polymonadic_bind env
                      ct1.FStar_Syntax_Syntax.effect_name
                      ct2.FStar_Syntax_Syntax.effect_name in
                  (match uu____4722 with
                   | FStar_Pervasives_Native.Some (p, f_bind) ->
                       f_bind env ct1 b ct2 flags r1
                   | FStar_Pervasives_Native.None ->
                       let uu____4773 = lift_comps env c1 c2 b true in
                       (match uu____4773 with
                        | (m, c11, c21, g_lift) ->
                            let uu____4790 =
                              let uu____4795 =
                                FStar_Syntax_Util.comp_to_comp_typ c11 in
                              let uu____4796 =
                                FStar_Syntax_Util.comp_to_comp_typ c21 in
                              (uu____4795, uu____4796) in
                            (match uu____4790 with
                             | (ct11, ct21) ->
                                 let uu____4803 =
                                   let uu____4808 =
                                     FStar_TypeChecker_Env.is_layered_effect
                                       env m in
                                   if uu____4808
                                   then
                                     let bind_t =
                                       let uu____4814 =
                                         FStar_All.pipe_right m
                                           (FStar_TypeChecker_Env.get_effect_decl
                                              env) in
                                       FStar_All.pipe_right uu____4814
                                         FStar_Syntax_Util.get_bind_vc_combinator in
                                     mk_indexed_bind env m m m bind_t ct11 b
                                       ct21 flags r1
                                   else
                                     (let uu____4816 =
                                        mk_wp_bind env m ct11 b ct21 flags r1 in
                                      (uu____4816,
                                        FStar_TypeChecker_Env.trivial_guard)) in
                                 (match uu____4803 with
                                  | (c, g_bind) ->
                                      let uu____4823 =
                                        FStar_TypeChecker_Env.conj_guard
                                          g_lift g_bind in
                                      (c, uu____4823)))))
let (bind_pure_wp_with :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.cflag Prims.list ->
          (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun wp1 ->
      fun c ->
        fun flags ->
          let r = FStar_TypeChecker_Env.get_range env in
          let pure_c =
            let uu____4858 =
              let uu____4859 =
                let uu____4870 =
                  FStar_All.pipe_right wp1 FStar_Syntax_Syntax.as_arg in
                [uu____4870] in
              {
                FStar_Syntax_Syntax.comp_univs = [FStar_Syntax_Syntax.U_zero];
                FStar_Syntax_Syntax.effect_name =
                  FStar_Parser_Const.effect_PURE_lid;
                FStar_Syntax_Syntax.result_typ = FStar_Syntax_Syntax.t_unit;
                FStar_Syntax_Syntax.effect_args = uu____4859;
                FStar_Syntax_Syntax.flags = []
              } in
            FStar_Syntax_Syntax.mk_Comp uu____4858 in
          mk_bind env pure_c FStar_Pervasives_Native.None c flags r
let (weaken_flags :
  FStar_Syntax_Syntax.cflag Prims.list ->
    FStar_Syntax_Syntax.cflag Prims.list)
  =
  fun flags ->
    let uu____4914 =
      FStar_All.pipe_right flags
        (FStar_Util.for_some
           (fun uu___1_4918 ->
              match uu___1_4918 with
              | FStar_Syntax_Syntax.SHOULD_NOT_INLINE -> true
              | uu____4919 -> false)) in
    if uu____4914
    then [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
    else
      FStar_All.pipe_right flags
        (FStar_List.collect
           (fun uu___2_4928 ->
              match uu___2_4928 with
              | FStar_Syntax_Syntax.TOTAL ->
                  [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
              | FStar_Syntax_Syntax.RETURN ->
                  [FStar_Syntax_Syntax.PARTIAL_RETURN;
                  FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
              | f -> [f]))
let (weaken_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.term ->
        (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun c ->
      fun formula ->
        let uu____4955 = FStar_Syntax_Util.is_ml_comp c in
        if uu____4955
        then (c, FStar_TypeChecker_Env.trivial_guard)
        else
          (let ct = FStar_TypeChecker_Env.unfold_effect_abbrev env c in
           let pure_assume_wp =
             let uu____4963 =
               FStar_Syntax_Syntax.lid_as_fv
                 FStar_Parser_Const.pure_assume_wp_lid
                 (FStar_Syntax_Syntax.Delta_constant_at_level Prims.int_one)
                 FStar_Pervasives_Native.None in
             FStar_Syntax_Syntax.fv_to_tm uu____4963 in
           let pure_assume_wp1 =
             let uu____4965 =
               let uu____4966 =
                 FStar_All.pipe_left FStar_Syntax_Syntax.as_arg formula in
               [uu____4966] in
             let uu____4999 = FStar_TypeChecker_Env.get_range env in
             FStar_Syntax_Syntax.mk_Tm_app pure_assume_wp uu____4965
               uu____4999 in
           let uu____5000 = weaken_flags ct.FStar_Syntax_Syntax.flags in
           bind_pure_wp_with env pure_assume_wp1 c uu____5000)
let (weaken_precondition :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.lcomp ->
      FStar_TypeChecker_Common.guard_formula ->
        FStar_TypeChecker_Common.lcomp)
  =
  fun env ->
    fun lc ->
      fun f ->
        let weaken uu____5027 =
          let uu____5028 = FStar_TypeChecker_Common.lcomp_comp lc in
          match uu____5028 with
          | (c, g_c) ->
              let uu____5039 =
                env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ()) in
              if uu____5039
              then (c, g_c)
              else
                (match f with
                 | FStar_TypeChecker_Common.Trivial -> (c, g_c)
                 | FStar_TypeChecker_Common.NonTrivial f1 ->
                     let uu____5050 = weaken_comp env c f1 in
                     (match uu____5050 with
                      | (c1, g_w) ->
                          let uu____5061 =
                            FStar_TypeChecker_Env.conj_guard g_c g_w in
                          (c1, uu____5061))) in
        let uu____5062 = weaken_flags lc.FStar_TypeChecker_Common.cflags in
        FStar_TypeChecker_Common.mk_lcomp
          lc.FStar_TypeChecker_Common.eff_name
          lc.FStar_TypeChecker_Common.res_typ uu____5062 weaken
let (strengthen_comp :
  FStar_TypeChecker_Env.env ->
    (unit -> Prims.string) FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.formula ->
          FStar_Syntax_Syntax.cflag Prims.list ->
            (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun reason ->
      fun c ->
        fun f ->
          fun flags ->
            if env.FStar_TypeChecker_Env.lax
            then (c, FStar_TypeChecker_Env.trivial_guard)
            else
              (let r = FStar_TypeChecker_Env.get_range env in
               let pure_assert_wp =
                 let uu____5114 =
                   FStar_Syntax_Syntax.lid_as_fv
                     FStar_Parser_Const.pure_assert_wp_lid
                     (FStar_Syntax_Syntax.Delta_constant_at_level
                        Prims.int_one) FStar_Pervasives_Native.None in
                 FStar_Syntax_Syntax.fv_to_tm uu____5114 in
               let pure_assert_wp1 =
                 let uu____5116 =
                   let uu____5117 =
                     let uu____5126 = label_opt env reason r f in
                     FStar_All.pipe_left FStar_Syntax_Syntax.as_arg
                       uu____5126 in
                   [uu____5117] in
                 FStar_Syntax_Syntax.mk_Tm_app pure_assert_wp uu____5116 r in
               bind_pure_wp_with env pure_assert_wp1 c flags)
let (strengthen_precondition :
  (unit -> Prims.string) FStar_Pervasives_Native.option ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term ->
        FStar_TypeChecker_Common.lcomp ->
          FStar_TypeChecker_Common.guard_t ->
            (FStar_TypeChecker_Common.lcomp *
              FStar_TypeChecker_Common.guard_t))
  =
  fun reason ->
    fun env ->
      fun e_for_debugging_only ->
        fun lc ->
          fun g0 ->
            let uu____5193 =
              FStar_TypeChecker_Env.is_trivial_guard_formula g0 in
            if uu____5193
            then (lc, g0)
            else
              (let flags =
                 let uu____5202 =
                   let uu____5209 =
                     FStar_TypeChecker_Common.is_tot_or_gtot_lcomp lc in
                   if uu____5209
                   then (true, [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION])
                   else (false, []) in
                 match uu____5202 with
                 | (maybe_trivial_post, flags) ->
                     let uu____5229 =
                       FStar_All.pipe_right
                         lc.FStar_TypeChecker_Common.cflags
                         (FStar_List.collect
                            (fun uu___3_5237 ->
                               match uu___3_5237 with
                               | FStar_Syntax_Syntax.RETURN ->
                                   [FStar_Syntax_Syntax.PARTIAL_RETURN]
                               | FStar_Syntax_Syntax.PARTIAL_RETURN ->
                                   [FStar_Syntax_Syntax.PARTIAL_RETURN]
                               | FStar_Syntax_Syntax.SOMETRIVIAL when
                                   Prims.op_Negation maybe_trivial_post ->
                                   [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
                               | FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION
                                   when Prims.op_Negation maybe_trivial_post
                                   ->
                                   [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
                               | FStar_Syntax_Syntax.SHOULD_NOT_INLINE ->
                                   [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
                               | uu____5240 -> [])) in
                     FStar_List.append flags uu____5229 in
               let strengthen uu____5250 =
                 let uu____5251 = FStar_TypeChecker_Common.lcomp_comp lc in
                 match uu____5251 with
                 | (c, g_c) ->
                     if env.FStar_TypeChecker_Env.lax
                     then (c, g_c)
                     else
                       (let g01 = FStar_TypeChecker_Rel.simplify_guard env g0 in
                        let uu____5268 = FStar_TypeChecker_Env.guard_form g01 in
                        match uu____5268 with
                        | FStar_TypeChecker_Common.Trivial -> (c, g_c)
                        | FStar_TypeChecker_Common.NonTrivial f ->
                            ((let uu____5275 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  FStar_Options.Extreme in
                              if uu____5275
                              then
                                let uu____5276 =
                                  FStar_TypeChecker_Normalize.term_to_string
                                    env e_for_debugging_only in
                                let uu____5277 =
                                  FStar_TypeChecker_Normalize.term_to_string
                                    env f in
                                FStar_Util.print2
                                  "-------------Strengthening pre-condition of term %s with guard %s\n"
                                  uu____5276 uu____5277
                              else ());
                             (let uu____5279 =
                                strengthen_comp env reason c f flags in
                              match uu____5279 with
                              | (c1, g_s) ->
                                  let uu____5290 =
                                    FStar_TypeChecker_Env.conj_guard g_c g_s in
                                  (c1, uu____5290)))) in
               let uu____5291 =
                 let uu____5292 =
                   FStar_TypeChecker_Env.norm_eff_name env
                     lc.FStar_TypeChecker_Common.eff_name in
                 FStar_TypeChecker_Common.mk_lcomp uu____5292
                   lc.FStar_TypeChecker_Common.res_typ flags strengthen in
               (uu____5291,
                 (let uu___678_5294 = g0 in
                  {
                    FStar_TypeChecker_Common.guard_f =
                      FStar_TypeChecker_Common.Trivial;
                    FStar_TypeChecker_Common.deferred_to_tac =
                      (uu___678_5294.FStar_TypeChecker_Common.deferred_to_tac);
                    FStar_TypeChecker_Common.deferred =
                      (uu___678_5294.FStar_TypeChecker_Common.deferred);
                    FStar_TypeChecker_Common.univ_ineqs =
                      (uu___678_5294.FStar_TypeChecker_Common.univ_ineqs);
                    FStar_TypeChecker_Common.implicits =
                      (uu___678_5294.FStar_TypeChecker_Common.implicits)
                  })))
let (lcomp_has_trivial_postcondition :
  FStar_TypeChecker_Common.lcomp -> Prims.bool) =
  fun lc ->
    (FStar_TypeChecker_Common.is_tot_or_gtot_lcomp lc) ||
      (FStar_Util.for_some
         (fun uu___4_5301 ->
            match uu___4_5301 with
            | FStar_Syntax_Syntax.SOMETRIVIAL -> true
            | FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION -> true
            | uu____5302 -> false) lc.FStar_TypeChecker_Common.cflags)
let (maybe_add_with_type :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option ->
      FStar_TypeChecker_Common.lcomp ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun env ->
    fun uopt ->
      fun lc ->
        fun e ->
          let uu____5329 =
            (FStar_TypeChecker_Common.is_lcomp_partial_return lc) ||
              env.FStar_TypeChecker_Env.lax in
          if uu____5329
          then e
          else
            (let uu____5333 =
               (lcomp_has_trivial_postcondition lc) &&
                 (let uu____5335 =
                    FStar_TypeChecker_Env.try_lookup_lid env
                      FStar_Parser_Const.with_type_lid in
                  FStar_Option.isSome uu____5335) in
             if uu____5333
             then
               let u =
                 match uopt with
                 | FStar_Pervasives_Native.Some u -> u
                 | FStar_Pervasives_Native.None ->
                     env.FStar_TypeChecker_Env.universe_of env
                       lc.FStar_TypeChecker_Common.res_typ in
               FStar_Syntax_Util.mk_with_type u
                 lc.FStar_TypeChecker_Common.res_typ e
             else e)
let (maybe_capture_unit_refinement :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.bv ->
        FStar_Syntax_Syntax.comp ->
          (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun t ->
      fun x ->
        fun c ->
          let t1 =
            FStar_TypeChecker_Normalize.normalize_refinement
              FStar_TypeChecker_Normalize.whnf_steps env t in
          match t1.FStar_Syntax_Syntax.n with
          | FStar_Syntax_Syntax.Tm_refine (b, phi) ->
              let is_unit =
                match (b.FStar_Syntax_Syntax.sort).FStar_Syntax_Syntax.n with
                | FStar_Syntax_Syntax.Tm_fvar fv ->
                    FStar_Syntax_Syntax.fv_eq_lid fv
                      FStar_Parser_Const.unit_lid
                | uu____5400 -> false in
              if is_unit
              then
                let uu____5405 =
                  let uu____5406 =
                    let uu____5407 =
                      FStar_All.pipe_right c
                        FStar_Syntax_Util.comp_effect_name in
                    FStar_All.pipe_right uu____5407
                      (FStar_TypeChecker_Env.norm_eff_name env) in
                  FStar_All.pipe_right uu____5406
                    (FStar_TypeChecker_Env.is_layered_effect env) in
                (if uu____5405
                 then
                   let uu____5414 = FStar_Syntax_Subst.open_term_bv b phi in
                   match uu____5414 with
                   | (b1, phi1) ->
                       let phi2 =
                         FStar_Syntax_Subst.subst
                           [FStar_Syntax_Syntax.NT
                              (b1, FStar_Syntax_Syntax.unit_const)] phi1 in
                       weaken_comp env c phi2
                 else
                   (let uu____5429 = close_wp_comp env [x] c in
                    (uu____5429, FStar_TypeChecker_Env.trivial_guard)))
              else (c, FStar_TypeChecker_Env.trivial_guard)
          | uu____5431 -> (c, FStar_TypeChecker_Env.trivial_guard)
let (bind :
  FStar_Range.range ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
        FStar_TypeChecker_Common.lcomp ->
          lcomp_with_binder -> FStar_TypeChecker_Common.lcomp)
  =
  fun r1 ->
    fun env ->
      fun e1opt ->
        fun lc1 ->
          fun uu____5458 ->
            match uu____5458 with
            | (b, lc2) ->
                let debug f =
                  let uu____5478 =
                    (FStar_TypeChecker_Env.debug env FStar_Options.Extreme)
                      ||
                      (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "bind")) in
                  if uu____5478 then f () else () in
                let lc11 =
                  FStar_TypeChecker_Normalize.ghost_to_pure_lcomp env lc1 in
                let lc21 =
                  FStar_TypeChecker_Normalize.ghost_to_pure_lcomp env lc2 in
                let joined_eff = join_lcomp env lc11 lc21 in
                let bind_flags =
                  let uu____5486 =
                    (should_not_inline_lc lc11) ||
                      (should_not_inline_lc lc21) in
                  if uu____5486
                  then [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
                  else
                    (let flags =
                       let uu____5493 =
                         FStar_TypeChecker_Common.is_total_lcomp lc11 in
                       if uu____5493
                       then
                         let uu____5496 =
                           FStar_TypeChecker_Common.is_total_lcomp lc21 in
                         (if uu____5496
                          then [FStar_Syntax_Syntax.TOTAL]
                          else
                            (let uu____5500 =
                               FStar_TypeChecker_Common.is_tot_or_gtot_lcomp
                                 lc21 in
                             if uu____5500
                             then [FStar_Syntax_Syntax.SOMETRIVIAL]
                             else []))
                       else
                         (let uu____5505 =
                            (FStar_TypeChecker_Common.is_tot_or_gtot_lcomp
                               lc11)
                              &&
                              (FStar_TypeChecker_Common.is_tot_or_gtot_lcomp
                                 lc21) in
                          if uu____5505
                          then [FStar_Syntax_Syntax.SOMETRIVIAL]
                          else []) in
                     let uu____5509 = lcomp_has_trivial_postcondition lc21 in
                     if uu____5509
                     then FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION :: flags
                     else flags) in
                let bind_it uu____5522 =
                  let uu____5523 =
                    env.FStar_TypeChecker_Env.lax &&
                      (FStar_Options.ml_ish ()) in
                  if uu____5523
                  then
                    let u_t =
                      env.FStar_TypeChecker_Env.universe_of env
                        lc21.FStar_TypeChecker_Common.res_typ in
                    let uu____5529 =
                      lax_mk_tot_or_comp_l joined_eff u_t
                        lc21.FStar_TypeChecker_Common.res_typ [] in
                    (uu____5529, FStar_TypeChecker_Env.trivial_guard)
                  else
                    (let uu____5531 =
                       FStar_TypeChecker_Common.lcomp_comp lc11 in
                     match uu____5531 with
                     | (c1, g_c1) ->
                         let uu____5542 =
                           FStar_TypeChecker_Common.lcomp_comp lc21 in
                         (match uu____5542 with
                          | (c2, g_c2) ->
                              let trivial_guard =
                                let uu____5554 =
                                  match b with
                                  | FStar_Pervasives_Native.Some x ->
                                      let b1 =
                                        FStar_Syntax_Syntax.mk_binder x in
                                      let uu____5557 =
                                        FStar_Syntax_Syntax.is_null_binder b1 in
                                      if uu____5557
                                      then g_c2
                                      else
                                        FStar_TypeChecker_Env.close_guard env
                                          [b1] g_c2
                                  | FStar_Pervasives_Native.None -> g_c2 in
                                FStar_TypeChecker_Env.conj_guard g_c1
                                  uu____5554 in
                              (debug
                                 (fun uu____5580 ->
                                    let uu____5581 =
                                      FStar_Syntax_Print.comp_to_string c1 in
                                    let uu____5582 =
                                      match b with
                                      | FStar_Pervasives_Native.None ->
                                          "none"
                                      | FStar_Pervasives_Native.Some x ->
                                          FStar_Syntax_Print.bv_to_string x in
                                    let uu____5584 =
                                      FStar_Syntax_Print.comp_to_string c2 in
                                    FStar_Util.print3
                                      "(1) bind: \n\tc1=%s\n\tx=%s\n\tc2=%s\n(1. end bind)\n"
                                      uu____5581 uu____5582 uu____5584);
                               (let aux uu____5598 =
                                  let uu____5599 =
                                    FStar_Syntax_Util.is_trivial_wp c1 in
                                  if uu____5599
                                  then
                                    match b with
                                    | FStar_Pervasives_Native.None ->
                                        FStar_Util.Inl
                                          (c2, "trivial no binder")
                                    | FStar_Pervasives_Native.Some uu____5620
                                        ->
                                        let uu____5621 =
                                          FStar_Syntax_Util.is_ml_comp c2 in
                                        (if uu____5621
                                         then
                                           FStar_Util.Inl (c2, "trivial ml")
                                         else
                                           FStar_Util.Inr
                                             "c1 trivial; but c2 is not ML")
                                  else
                                    (let uu____5640 =
                                       (FStar_Syntax_Util.is_ml_comp c1) &&
                                         (FStar_Syntax_Util.is_ml_comp c2) in
                                     if uu____5640
                                     then FStar_Util.Inl (c2, "both ml")
                                     else
                                       FStar_Util.Inr
                                         "c1 not trivial, and both are not ML") in
                                let try_simplify uu____5673 =
                                  let aux_with_trivial_guard uu____5699 =
                                    let uu____5700 = aux () in
                                    match uu____5700 with
                                    | FStar_Util.Inl (c, reason) ->
                                        FStar_Util.Inl
                                          (c, trivial_guard, reason)
                                    | FStar_Util.Inr reason ->
                                        FStar_Util.Inr reason in
                                  let uu____5742 =
                                    let uu____5743 =
                                      FStar_TypeChecker_Env.try_lookup_effect_lid
                                        env
                                        FStar_Parser_Const.effect_GTot_lid in
                                    FStar_Option.isNone uu____5743 in
                                  if uu____5742
                                  then
                                    let uu____5756 =
                                      (FStar_Syntax_Util.is_tot_or_gtot_comp
                                         c1)
                                        &&
                                        (FStar_Syntax_Util.is_tot_or_gtot_comp
                                           c2) in
                                    (if uu____5756
                                     then
                                       FStar_Util.Inl
                                         (c2, trivial_guard,
                                           "Early in prims; we don't have bind yet")
                                     else
                                       (let uu____5774 =
                                          FStar_TypeChecker_Env.get_range env in
                                        FStar_Errors.raise_error
                                          (FStar_Errors.Fatal_NonTrivialPreConditionInPrims,
                                            "Non-trivial pre-conditions very early in prims, even before we have defined the PURE monad")
                                          uu____5774))
                                  else
                                    (let uu____5786 =
                                       FStar_Syntax_Util.is_total_comp c1 in
                                     if uu____5786
                                     then
                                       let close_with_type_of_x x c =
                                         let x1 =
                                           let uu___781_5813 = x in
                                           {
                                             FStar_Syntax_Syntax.ppname =
                                               (uu___781_5813.FStar_Syntax_Syntax.ppname);
                                             FStar_Syntax_Syntax.index =
                                               (uu___781_5813.FStar_Syntax_Syntax.index);
                                             FStar_Syntax_Syntax.sort =
                                               (FStar_Syntax_Util.comp_result
                                                  c1)
                                           } in
                                         maybe_capture_unit_refinement env
                                           x1.FStar_Syntax_Syntax.sort x1 c in
                                       match (e1opt, b) with
                                       | (FStar_Pervasives_Native.Some e,
                                          FStar_Pervasives_Native.Some x) ->
                                           let uu____5842 =
                                             let uu____5847 =
                                               FStar_All.pipe_right c2
                                                 (FStar_Syntax_Subst.subst_comp
                                                    [FStar_Syntax_Syntax.NT
                                                       (x, e)]) in
                                             FStar_All.pipe_right uu____5847
                                               (close_with_type_of_x x) in
                                           (match uu____5842 with
                                            | (c21, g_close) ->
                                                let uu____5866 =
                                                  let uu____5873 =
                                                    let uu____5874 =
                                                      let uu____5877 =
                                                        let uu____5880 =
                                                          FStar_TypeChecker_Env.map_guard
                                                            g_c2
                                                            (FStar_Syntax_Subst.subst
                                                               [FStar_Syntax_Syntax.NT
                                                                  (x, e)]) in
                                                        [uu____5880; g_close] in
                                                      g_c1 :: uu____5877 in
                                                    FStar_TypeChecker_Env.conj_guards
                                                      uu____5874 in
                                                  (c21, uu____5873, "c1 Tot") in
                                                FStar_Util.Inl uu____5866)
                                       | (uu____5889,
                                          FStar_Pervasives_Native.Some x) ->
                                           let uu____5901 =
                                             FStar_All.pipe_right c2
                                               (close_with_type_of_x x) in
                                           (match uu____5901 with
                                            | (c21, g_close) ->
                                                let uu____5922 =
                                                  let uu____5929 =
                                                    let uu____5930 =
                                                      let uu____5933 =
                                                        let uu____5936 =
                                                          let uu____5937 =
                                                            let uu____5938 =
                                                              FStar_Syntax_Syntax.mk_binder
                                                                x in
                                                            [uu____5938] in
                                                          FStar_TypeChecker_Env.close_guard
                                                            env uu____5937
                                                            g_c2 in
                                                        [uu____5936; g_close] in
                                                      g_c1 :: uu____5933 in
                                                    FStar_TypeChecker_Env.conj_guards
                                                      uu____5930 in
                                                  (c21, uu____5929,
                                                    "c1 Tot only close") in
                                                FStar_Util.Inl uu____5922)
                                       | (uu____5963, uu____5964) ->
                                           aux_with_trivial_guard ()
                                     else
                                       (let uu____5978 =
                                          (FStar_Syntax_Util.is_tot_or_gtot_comp
                                             c1)
                                            &&
                                            (FStar_Syntax_Util.is_tot_or_gtot_comp
                                               c2) in
                                        if uu____5978
                                        then
                                          let uu____5989 =
                                            let uu____5996 =
                                              FStar_Syntax_Syntax.mk_GTotal
                                                (FStar_Syntax_Util.comp_result
                                                   c2) in
                                            (uu____5996, trivial_guard,
                                              "both GTot") in
                                          FStar_Util.Inl uu____5989
                                        else aux_with_trivial_guard ())) in
                                let uu____6004 = try_simplify () in
                                match uu____6004 with
                                | FStar_Util.Inl (c, g, reason) ->
                                    (debug
                                       (fun uu____6033 ->
                                          let uu____6034 =
                                            FStar_Syntax_Print.comp_to_string
                                              c in
                                          FStar_Util.print2
                                            "(2) bind: Simplified (because %s) to\n\t%s\n"
                                            reason uu____6034);
                                     (c, g))
                                | FStar_Util.Inr reason ->
                                    (debug
                                       (fun uu____6045 ->
                                          FStar_Util.print1
                                            "(2) bind: Not simplified because %s\n"
                                            reason);
                                     (let mk_bind1 c11 b1 c21 g =
                                        let uu____6075 =
                                          mk_bind env c11 b1 c21 bind_flags
                                            r1 in
                                        match uu____6075 with
                                        | (c, g_bind) ->
                                            let uu____6086 =
                                              FStar_TypeChecker_Env.conj_guard
                                                g g_bind in
                                            (c, uu____6086) in
                                      let mk_seq c11 b1 c21 =
                                        let c12 =
                                          FStar_TypeChecker_Env.unfold_effect_abbrev
                                            env c11 in
                                        let c22 =
                                          FStar_TypeChecker_Env.unfold_effect_abbrev
                                            env c21 in
                                        let uu____6113 =
                                          FStar_TypeChecker_Env.join env
                                            c12.FStar_Syntax_Syntax.effect_name
                                            c22.FStar_Syntax_Syntax.effect_name in
                                        match uu____6113 with
                                        | (m, uu____6125, lift2) ->
                                            let uu____6127 =
                                              lift_comp env c22 lift2 in
                                            (match uu____6127 with
                                             | (c23, g2) ->
                                                 let uu____6138 =
                                                   destruct_wp_comp c12 in
                                                 (match uu____6138 with
                                                  | (u1, t1, wp1) ->
                                                      let md_pure_or_ghost =
                                                        FStar_TypeChecker_Env.get_effect_decl
                                                          env
                                                          c12.FStar_Syntax_Syntax.effect_name in
                                                      let trivial =
                                                        let uu____6154 =
                                                          FStar_All.pipe_right
                                                            md_pure_or_ghost
                                                            FStar_Syntax_Util.get_wp_trivial_combinator in
                                                        FStar_All.pipe_right
                                                          uu____6154
                                                          FStar_Util.must in
                                                      let vc1 =
                                                        let uu____6162 =
                                                          FStar_TypeChecker_Env.inst_effect_fun_with
                                                            [u1] env
                                                            md_pure_or_ghost
                                                            trivial in
                                                        let uu____6163 =
                                                          let uu____6164 =
                                                            FStar_Syntax_Syntax.as_arg
                                                              t1 in
                                                          let uu____6173 =
                                                            let uu____6184 =
                                                              FStar_Syntax_Syntax.as_arg
                                                                wp1 in
                                                            [uu____6184] in
                                                          uu____6164 ::
                                                            uu____6173 in
                                                        FStar_Syntax_Syntax.mk_Tm_app
                                                          uu____6162
                                                          uu____6163 r1 in
                                                      let uu____6217 =
                                                        strengthen_comp env
                                                          FStar_Pervasives_Native.None
                                                          c23 vc1 bind_flags in
                                                      (match uu____6217 with
                                                       | (c, g_s) ->
                                                           let uu____6231 =
                                                             FStar_TypeChecker_Env.conj_guards
                                                               [g_c1;
                                                               g_c2;
                                                               g2;
                                                               g_s] in
                                                           (c, uu____6231)))) in
                                      let uu____6232 =
                                        let t =
                                          FStar_Syntax_Util.comp_result c1 in
                                        match comp_univ_opt c1 with
                                        | FStar_Pervasives_Native.None ->
                                            let uu____6248 =
                                              env.FStar_TypeChecker_Env.universe_of
                                                env t in
                                            (uu____6248, t)
                                        | FStar_Pervasives_Native.Some u ->
                                            (u, t) in
                                      match uu____6232 with
                                      | (u_res_t1, res_t1) ->
                                          let uu____6264 =
                                            (FStar_Option.isSome b) &&
                                              (should_return env e1opt lc11) in
                                          if uu____6264
                                          then
                                            let e1 = FStar_Option.get e1opt in
                                            let x = FStar_Option.get b in
                                            let uu____6271 =
                                              FStar_Syntax_Util.is_partial_return
                                                c1 in
                                            (if uu____6271
                                             then
                                               (debug
                                                  (fun uu____6283 ->
                                                     let uu____6284 =
                                                       FStar_TypeChecker_Normalize.term_to_string
                                                         env e1 in
                                                     let uu____6285 =
                                                       FStar_Syntax_Print.bv_to_string
                                                         x in
                                                     FStar_Util.print2
                                                       "(3) bind (case a): Substituting %s for %s"
                                                       uu____6284 uu____6285);
                                                (let c21 =
                                                   FStar_Syntax_Subst.subst_comp
                                                     [FStar_Syntax_Syntax.NT
                                                        (x, e1)] c2 in
                                                 let g =
                                                   let uu____6290 =
                                                     FStar_TypeChecker_Env.map_guard
                                                       g_c2
                                                       (FStar_Syntax_Subst.subst
                                                          [FStar_Syntax_Syntax.NT
                                                             (x, e1)]) in
                                                   FStar_TypeChecker_Env.conj_guard
                                                     g_c1 uu____6290 in
                                                 mk_bind1 c1 b c21 g))
                                             else
                                               (let uu____6294 =
                                                  ((FStar_Options.vcgen_optimize_bind_as_seq
                                                      ())
                                                     &&
                                                     (lcomp_has_trivial_postcondition
                                                        lc11))
                                                    &&
                                                    (let uu____6296 =
                                                       FStar_TypeChecker_Env.try_lookup_lid
                                                         env
                                                         FStar_Parser_Const.with_type_lid in
                                                     FStar_Option.isSome
                                                       uu____6296) in
                                                if uu____6294
                                                then
                                                  let e1' =
                                                    let uu____6320 =
                                                      FStar_Options.vcgen_decorate_with_type
                                                        () in
                                                    if uu____6320
                                                    then
                                                      FStar_Syntax_Util.mk_with_type
                                                        u_res_t1 res_t1 e1
                                                    else e1 in
                                                  (debug
                                                     (fun uu____6329 ->
                                                        let uu____6330 =
                                                          FStar_TypeChecker_Normalize.term_to_string
                                                            env e1' in
                                                        let uu____6331 =
                                                          FStar_Syntax_Print.bv_to_string
                                                            x in
                                                        FStar_Util.print2
                                                          "(3) bind (case b): Substituting %s for %s"
                                                          uu____6330
                                                          uu____6331);
                                                   (let c21 =
                                                      FStar_Syntax_Subst.subst_comp
                                                        [FStar_Syntax_Syntax.NT
                                                           (x, e1')] c2 in
                                                    mk_seq c1 b c21))
                                                else
                                                  (debug
                                                     (fun uu____6343 ->
                                                        let uu____6344 =
                                                          FStar_TypeChecker_Normalize.term_to_string
                                                            env e1 in
                                                        let uu____6345 =
                                                          FStar_Syntax_Print.bv_to_string
                                                            x in
                                                        FStar_Util.print2
                                                          "(3) bind (case c): Adding equality %s = %s"
                                                          uu____6344
                                                          uu____6345);
                                                   (let c21 =
                                                      FStar_Syntax_Subst.subst_comp
                                                        [FStar_Syntax_Syntax.NT
                                                           (x, e1)] c2 in
                                                    let x_eq_e =
                                                      let uu____6350 =
                                                        FStar_Syntax_Syntax.bv_to_name
                                                          x in
                                                      FStar_Syntax_Util.mk_eq2
                                                        u_res_t1 res_t1 e1
                                                        uu____6350 in
                                                    let uu____6351 =
                                                      let uu____6356 =
                                                        let uu____6357 =
                                                          let uu____6358 =
                                                            FStar_Syntax_Syntax.mk_binder
                                                              x in
                                                          [uu____6358] in
                                                        FStar_TypeChecker_Env.push_binders
                                                          env uu____6357 in
                                                      weaken_comp uu____6356
                                                        c21 x_eq_e in
                                                    match uu____6351 with
                                                    | (c22, g_w) ->
                                                        let g =
                                                          let uu____6384 =
                                                            let uu____6387 =
                                                              let uu____6390
                                                                =
                                                                let uu____6391
                                                                  =
                                                                  let uu____6392
                                                                    =
                                                                    FStar_Syntax_Syntax.mk_binder
                                                                    x in
                                                                  [uu____6392] in
                                                                FStar_TypeChecker_Env.close_guard
                                                                  env
                                                                  uu____6391
                                                                  g_w in
                                                              let uu____6411
                                                                =
                                                                let uu____6414
                                                                  =
                                                                  let uu____6415
                                                                    =
                                                                    let uu____6416
                                                                    =
                                                                    FStar_Syntax_Syntax.mk_binder
                                                                    x in
                                                                    [uu____6416] in
                                                                  let uu____6435
                                                                    =
                                                                    FStar_TypeChecker_Common.weaken_guard_formula
                                                                    g_c2
                                                                    x_eq_e in
                                                                  FStar_TypeChecker_Env.close_guard
                                                                    env
                                                                    uu____6415
                                                                    uu____6435 in
                                                                [uu____6414] in
                                                              uu____6390 ::
                                                                uu____6411 in
                                                            g_c1 ::
                                                              uu____6387 in
                                                          FStar_TypeChecker_Env.conj_guards
                                                            uu____6384 in
                                                        mk_bind1 c1 b c22 g))))
                                          else mk_bind1 c1 b c2 trivial_guard)))))) in
                FStar_TypeChecker_Common.mk_lcomp joined_eff
                  lc21.FStar_TypeChecker_Common.res_typ bind_flags bind_it
let (weaken_guard :
  FStar_TypeChecker_Common.guard_formula ->
    FStar_TypeChecker_Common.guard_formula ->
      FStar_TypeChecker_Common.guard_formula)
  =
  fun g1 ->
    fun g2 ->
      match (g1, g2) with
      | (FStar_TypeChecker_Common.NonTrivial f1,
         FStar_TypeChecker_Common.NonTrivial f2) ->
          let g = FStar_Syntax_Util.mk_imp f1 f2 in
          FStar_TypeChecker_Common.NonTrivial g
      | uu____6450 -> g2
let (assume_result_eq_pure_term_in_m :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.term ->
        FStar_TypeChecker_Common.lcomp -> FStar_TypeChecker_Common.lcomp)
  =
  fun env ->
    fun m_opt ->
      fun e ->
        fun lc ->
          let m =
            let uu____6480 =
              (FStar_All.pipe_right m_opt FStar_Util.is_none) ||
                (is_ghost_effect env lc.FStar_TypeChecker_Common.eff_name) in
            if uu____6480
            then FStar_Parser_Const.effect_PURE_lid
            else FStar_All.pipe_right m_opt FStar_Util.must in
          let flags =
            let uu____6489 = FStar_TypeChecker_Common.is_total_lcomp lc in
            if uu____6489
            then FStar_Syntax_Syntax.RETURN ::
              (lc.FStar_TypeChecker_Common.cflags)
            else FStar_Syntax_Syntax.PARTIAL_RETURN ::
              (lc.FStar_TypeChecker_Common.cflags) in
          let refine uu____6502 =
            let uu____6507 = FStar_TypeChecker_Common.lcomp_comp lc in
            match uu____6507 with
            | (c, g_c) ->
                let u_t =
                  match comp_univ_opt c with
                  | FStar_Pervasives_Native.Some u_t -> u_t
                  | FStar_Pervasives_Native.None ->
                      env.FStar_TypeChecker_Env.universe_of env
                        (FStar_Syntax_Util.comp_result c) in
                let uu____6520 = FStar_Syntax_Util.is_tot_or_gtot_comp c in
                if uu____6520
                then
                  let uu____6525 =
                    return_value env m (FStar_Pervasives_Native.Some u_t)
                      (FStar_Syntax_Util.comp_result c) e in
                  (match uu____6525 with
                   | (retc, g_retc) ->
                       let g_c1 = FStar_TypeChecker_Env.conj_guard g_c g_retc in
                       let uu____6537 =
                         let uu____6538 = FStar_Syntax_Util.is_pure_comp c in
                         Prims.op_Negation uu____6538 in
                       if uu____6537
                       then
                         let retc1 = FStar_Syntax_Util.comp_to_comp_typ retc in
                         let retc2 =
                           let uu___907_6545 = retc1 in
                           {
                             FStar_Syntax_Syntax.comp_univs =
                               (uu___907_6545.FStar_Syntax_Syntax.comp_univs);
                             FStar_Syntax_Syntax.effect_name =
                               FStar_Parser_Const.effect_GHOST_lid;
                             FStar_Syntax_Syntax.result_typ =
                               (uu___907_6545.FStar_Syntax_Syntax.result_typ);
                             FStar_Syntax_Syntax.effect_args =
                               (uu___907_6545.FStar_Syntax_Syntax.effect_args);
                             FStar_Syntax_Syntax.flags = flags
                           } in
                         let uu____6546 = FStar_Syntax_Syntax.mk_Comp retc2 in
                         (uu____6546, g_c1)
                       else
                         (let uu____6548 =
                            FStar_Syntax_Util.comp_set_flags retc flags in
                          (uu____6548, g_c1)))
                else
                  (let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c in
                   let t = c1.FStar_Syntax_Syntax.result_typ in
                   let c2 = FStar_Syntax_Syntax.mk_Comp c1 in
                   let x =
                     FStar_Syntax_Syntax.new_bv
                       (FStar_Pervasives_Native.Some
                          (t.FStar_Syntax_Syntax.pos)) t in
                   let xexp = FStar_Syntax_Syntax.bv_to_name x in
                   let env_x = FStar_TypeChecker_Env.push_bv env x in
                   let uu____6558 =
                     return_value env_x m (FStar_Pervasives_Native.Some u_t)
                       t xexp in
                   match uu____6558 with
                   | (ret, g_ret) ->
                       let ret1 =
                         let uu____6570 =
                           FStar_Syntax_Util.comp_set_flags ret
                             [FStar_Syntax_Syntax.PARTIAL_RETURN] in
                         FStar_All.pipe_left
                           FStar_TypeChecker_Common.lcomp_of_comp uu____6570 in
                       let eq = FStar_Syntax_Util.mk_eq2 u_t t xexp e in
                       let eq_ret =
                         weaken_precondition env_x ret1
                           (FStar_TypeChecker_Common.NonTrivial eq) in
                       let uu____6573 =
                         let uu____6578 =
                           let uu____6579 =
                             FStar_TypeChecker_Common.lcomp_of_comp c2 in
                           bind e.FStar_Syntax_Syntax.pos env
                             FStar_Pervasives_Native.None uu____6579
                             ((FStar_Pervasives_Native.Some x), eq_ret) in
                         FStar_TypeChecker_Common.lcomp_comp uu____6578 in
                       (match uu____6573 with
                        | (bind_c, g_bind) ->
                            let uu____6588 =
                              FStar_Syntax_Util.comp_set_flags bind_c flags in
                            let uu____6589 =
                              FStar_TypeChecker_Env.conj_guards
                                [g_c; g_ret; g_bind] in
                            (uu____6588, uu____6589))) in
          let uu____6590 = should_not_inline_lc lc in
          if uu____6590
          then
            let uu____6591 =
              let uu____6596 =
                let uu____6597 = FStar_Syntax_Print.term_to_string e in
                FStar_Util.format1
                  "assume_result_eq_pure_term cannot inline an non-inlineable lc : %s"
                  uu____6597 in
              (FStar_Errors.Fatal_UnexpectedTerm, uu____6596) in
            FStar_Errors.raise_error uu____6591 e.FStar_Syntax_Syntax.pos
          else
            (let uu____6599 = refine () in
             match uu____6599 with
             | (c, g) -> FStar_TypeChecker_Common.lcomp_of_comp_guard c g)
let (maybe_assume_result_eq_pure_term_in_m :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.term ->
        FStar_TypeChecker_Common.lcomp -> FStar_TypeChecker_Common.lcomp)
  =
  fun env ->
    fun m_opt ->
      fun e ->
        fun lc ->
          let should_return1 =
            (((Prims.op_Negation env.FStar_TypeChecker_Env.lax) &&
                (FStar_TypeChecker_Env.lid_exists env
                   FStar_Parser_Const.effect_GTot_lid))
               && (should_return env (FStar_Pervasives_Native.Some e) lc))
              &&
              (let uu____6632 =
                 FStar_TypeChecker_Common.is_lcomp_partial_return lc in
               Prims.op_Negation uu____6632) in
          if Prims.op_Negation should_return1
          then lc
          else assume_result_eq_pure_term_in_m env m_opt e lc
let (maybe_assume_result_eq_pure_term :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp -> FStar_TypeChecker_Common.lcomp)
  =
  fun env ->
    fun e ->
      fun lc ->
        maybe_assume_result_eq_pure_term_in_m env
          FStar_Pervasives_Native.None e lc
let (maybe_return_e2_and_bind :
  FStar_Range.range ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
        FStar_TypeChecker_Common.lcomp ->
          FStar_Syntax_Syntax.term ->
            lcomp_with_binder -> FStar_TypeChecker_Common.lcomp)
  =
  fun r ->
    fun env ->
      fun e1opt ->
        fun lc1 ->
          fun e2 ->
            fun uu____6680 ->
              match uu____6680 with
              | (x, lc2) ->
                  let env_x =
                    match x with
                    | FStar_Pervasives_Native.None -> env
                    | FStar_Pervasives_Native.Some x1 ->
                        FStar_TypeChecker_Env.push_bv env x1 in
                  let lc21 =
                    let eff1 =
                      FStar_TypeChecker_Env.norm_eff_name env
                        lc1.FStar_TypeChecker_Common.eff_name in
                    let eff2 =
                      FStar_TypeChecker_Env.norm_eff_name env
                        lc2.FStar_TypeChecker_Common.eff_name in
                    let uu____6694 =
                      ((FStar_Ident.lid_equals eff2
                          FStar_Parser_Const.effect_PURE_lid)
                         &&
                         (let uu____6696 =
                            FStar_TypeChecker_Env.join_opt env eff1 eff2 in
                          FStar_All.pipe_right uu____6696 FStar_Util.is_none))
                        &&
                        (let uu____6720 =
                           FStar_TypeChecker_Env.exists_polymonadic_bind env
                             eff1 eff2 in
                         FStar_All.pipe_right uu____6720 FStar_Util.is_none) in
                    if uu____6694
                    then
                      let uu____6755 =
                        FStar_All.pipe_right eff1
                          (fun uu____6760 ->
                             FStar_Pervasives_Native.Some uu____6760) in
                      assume_result_eq_pure_term_in_m env_x uu____6755 e2 lc2
                    else
                      (let uu____6762 =
                         ((let uu____6765 = is_pure_or_ghost_effect env eff1 in
                           Prims.op_Negation uu____6765) ||
                            (should_not_inline_lc lc1))
                           && (is_pure_or_ghost_effect env eff2) in
                       if uu____6762
                       then
                         let uu____6766 =
                           FStar_All.pipe_right eff1
                             (fun uu____6771 ->
                                FStar_Pervasives_Native.Some uu____6771) in
                         maybe_assume_result_eq_pure_term_in_m env_x
                           uu____6766 e2 lc2
                       else lc2) in
                  bind r env e1opt lc1 (x, lc21)
let (fvar_const :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> FStar_Syntax_Syntax.term)
  =
  fun env ->
    fun lid ->
      let uu____6785 =
        let uu____6786 = FStar_TypeChecker_Env.get_range env in
        FStar_Ident.set_lid_range lid uu____6786 in
      FStar_Syntax_Syntax.fvar uu____6785 FStar_Syntax_Syntax.delta_constant
        FStar_Pervasives_Native.None
let (mk_layered_conjunction :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.eff_decl ->
      FStar_Syntax_Syntax.universe ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.typ ->
            FStar_Syntax_Syntax.comp_typ ->
              FStar_Syntax_Syntax.comp_typ ->
                FStar_Range.range ->
                  (FStar_Syntax_Syntax.comp *
                    FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun ed ->
      fun u_a ->
        fun a ->
          fun p ->
            fun ct1 ->
              fun ct2 ->
                fun r ->
                  let conjunction_name =
                    let uu____6836 =
                      FStar_Ident.string_of_lid ed.FStar_Syntax_Syntax.mname in
                    FStar_Util.format1 "%s.conjunction" uu____6836 in
                  let uu____6837 =
                    let uu____6842 =
                      let uu____6843 =
                        FStar_All.pipe_right ed
                          FStar_Syntax_Util.get_layered_if_then_else_combinator in
                      FStar_All.pipe_right uu____6843 FStar_Util.must in
                    FStar_TypeChecker_Env.inst_tscheme_with uu____6842 [u_a] in
                  match uu____6837 with
                  | (uu____6854, conjunction) ->
                      let uu____6856 =
                        let uu____6865 =
                          FStar_List.map FStar_Pervasives_Native.fst
                            ct1.FStar_Syntax_Syntax.effect_args in
                        let uu____6880 =
                          FStar_List.map FStar_Pervasives_Native.fst
                            ct2.FStar_Syntax_Syntax.effect_args in
                        (uu____6865, uu____6880) in
                      (match uu____6856 with
                       | (is1, is2) ->
                           let conjunction_t_error s =
                             let uu____6923 =
                               let uu____6924 =
                                 FStar_Syntax_Print.term_to_string
                                   conjunction in
                               FStar_Util.format3
                                 "conjunction %s (%s) does not have proper shape (reason:%s)"
                                 uu____6924 conjunction_name s in
                             (FStar_Errors.Fatal_UnexpectedEffect,
                               uu____6923) in
                           let uu____6925 =
                             let uu____6970 =
                               let uu____6971 =
                                 FStar_Syntax_Subst.compress conjunction in
                               uu____6971.FStar_Syntax_Syntax.n in
                             match uu____6970 with
                             | FStar_Syntax_Syntax.Tm_abs
                                 (bs, body, uu____7020) when
                                 (FStar_List.length bs) >= (Prims.of_int (4))
                                 ->
                                 let uu____7051 =
                                   FStar_Syntax_Subst.open_term bs body in
                                 (match uu____7051 with
                                  | (a_b::bs1, body1) ->
                                      let uu____7123 =
                                        FStar_List.splitAt
                                          ((FStar_List.length bs1) -
                                             (Prims.of_int (3))) bs1 in
                                      (match uu____7123 with
                                       | (rest_bs, f_b::g_b::p_b::[]) ->
                                           let uu____7270 =
                                             FStar_All.pipe_right body1
                                               FStar_Syntax_Util.unascribe in
                                           (a_b, rest_bs, f_b, g_b, p_b,
                                             uu____7270)))
                             | uu____7303 ->
                                 let uu____7304 =
                                   conjunction_t_error
                                     "Either not an abstraction or not enough binders" in
                                 FStar_Errors.raise_error uu____7304 r in
                           (match uu____6925 with
                            | (a_b, rest_bs, f_b, g_b, p_b, body) ->
                                let uu____7427 =
                                  let uu____7434 =
                                    let uu____7435 =
                                      let uu____7436 =
                                        let uu____7443 =
                                          FStar_All.pipe_right a_b
                                            FStar_Pervasives_Native.fst in
                                        (uu____7443, a) in
                                      FStar_Syntax_Syntax.NT uu____7436 in
                                    [uu____7435] in
                                  FStar_TypeChecker_Env.uvars_for_binders env
                                    rest_bs uu____7434
                                    (fun b ->
                                       let uu____7459 =
                                         FStar_Syntax_Print.binder_to_string
                                           b in
                                       let uu____7460 =
                                         FStar_Ident.string_of_lid
                                           ed.FStar_Syntax_Syntax.mname in
                                       let uu____7461 =
                                         FStar_All.pipe_right r
                                           FStar_Range.string_of_range in
                                       FStar_Util.format3
                                         "implicit var for binder %s of %s:conjunction at %s"
                                         uu____7459 uu____7460 uu____7461) r in
                                (match uu____7427 with
                                 | (rest_bs_uvars, g_uvars) ->
                                     let substs =
                                       FStar_List.map2
                                         (fun b ->
                                            fun t ->
                                              let uu____7496 =
                                                let uu____7503 =
                                                  FStar_All.pipe_right b
                                                    FStar_Pervasives_Native.fst in
                                                (uu____7503, t) in
                                              FStar_Syntax_Syntax.NT
                                                uu____7496) (a_b ::
                                         (FStar_List.append rest_bs [p_b]))
                                         (a ::
                                         (FStar_List.append rest_bs_uvars [p])) in
                                     let f_guard =
                                       let f_sort_is =
                                         let uu____7542 =
                                           let uu____7543 =
                                             let uu____7546 =
                                               let uu____7547 =
                                                 FStar_All.pipe_right f_b
                                                   FStar_Pervasives_Native.fst in
                                               uu____7547.FStar_Syntax_Syntax.sort in
                                             FStar_Syntax_Subst.compress
                                               uu____7546 in
                                           uu____7543.FStar_Syntax_Syntax.n in
                                         match uu____7542 with
                                         | FStar_Syntax_Syntax.Tm_app
                                             (uu____7558, uu____7559::is) ->
                                             let uu____7601 =
                                               FStar_All.pipe_right is
                                                 (FStar_List.map
                                                    FStar_Pervasives_Native.fst) in
                                             FStar_All.pipe_right uu____7601
                                               (FStar_List.map
                                                  (FStar_Syntax_Subst.subst
                                                     substs))
                                         | uu____7634 ->
                                             let uu____7635 =
                                               conjunction_t_error
                                                 "f's type is not a repr type" in
                                             FStar_Errors.raise_error
                                               uu____7635 r in
                                       FStar_List.fold_left2
                                         (fun g ->
                                            fun i1 ->
                                              fun f_i ->
                                                let uu____7649 =
                                                  FStar_TypeChecker_Rel.layered_effect_teq
                                                    env i1 f_i
                                                    (FStar_Pervasives_Native.Some
                                                       conjunction_name) in
                                                FStar_TypeChecker_Env.conj_guard
                                                  g uu____7649)
                                         FStar_TypeChecker_Env.trivial_guard
                                         is1 f_sort_is in
                                     let g_guard =
                                       let g_sort_is =
                                         let uu____7654 =
                                           let uu____7655 =
                                             let uu____7658 =
                                               let uu____7659 =
                                                 FStar_All.pipe_right g_b
                                                   FStar_Pervasives_Native.fst in
                                               uu____7659.FStar_Syntax_Syntax.sort in
                                             FStar_Syntax_Subst.compress
                                               uu____7658 in
                                           uu____7655.FStar_Syntax_Syntax.n in
                                         match uu____7654 with
                                         | FStar_Syntax_Syntax.Tm_app
                                             (uu____7670, uu____7671::is) ->
                                             let uu____7713 =
                                               FStar_All.pipe_right is
                                                 (FStar_List.map
                                                    FStar_Pervasives_Native.fst) in
                                             FStar_All.pipe_right uu____7713
                                               (FStar_List.map
                                                  (FStar_Syntax_Subst.subst
                                                     substs))
                                         | uu____7746 ->
                                             let uu____7747 =
                                               conjunction_t_error
                                                 "g's type is not a repr type" in
                                             FStar_Errors.raise_error
                                               uu____7747 r in
                                       FStar_List.fold_left2
                                         (fun g ->
                                            fun i2 ->
                                              fun g_i ->
                                                let uu____7761 =
                                                  FStar_TypeChecker_Rel.layered_effect_teq
                                                    env i2 g_i
                                                    (FStar_Pervasives_Native.Some
                                                       conjunction_name) in
                                                FStar_TypeChecker_Env.conj_guard
                                                  g uu____7761)
                                         FStar_TypeChecker_Env.trivial_guard
                                         is2 g_sort_is in
                                     let body1 =
                                       FStar_Syntax_Subst.subst substs body in
                                     let is =
                                       let uu____7766 =
                                         let uu____7767 =
                                           FStar_Syntax_Subst.compress body1 in
                                         uu____7767.FStar_Syntax_Syntax.n in
                                       match uu____7766 with
                                       | FStar_Syntax_Syntax.Tm_app
                                           (uu____7772, a1::args) ->
                                           FStar_List.map
                                             FStar_Pervasives_Native.fst args
                                       | uu____7827 ->
                                           let uu____7828 =
                                             conjunction_t_error
                                               "body is not a repr type" in
                                           FStar_Errors.raise_error
                                             uu____7828 r in
                                     let uu____7835 =
                                       let uu____7836 =
                                         let uu____7837 =
                                           FStar_All.pipe_right is
                                             (FStar_List.map
                                                FStar_Syntax_Syntax.as_arg) in
                                         {
                                           FStar_Syntax_Syntax.comp_univs =
                                             [u_a];
                                           FStar_Syntax_Syntax.effect_name =
                                             (ed.FStar_Syntax_Syntax.mname);
                                           FStar_Syntax_Syntax.result_typ = a;
                                           FStar_Syntax_Syntax.effect_args =
                                             uu____7837;
                                           FStar_Syntax_Syntax.flags = []
                                         } in
                                       FStar_Syntax_Syntax.mk_Comp uu____7836 in
                                     let uu____7860 =
                                       let uu____7861 =
                                         FStar_TypeChecker_Env.conj_guard
                                           g_uvars f_guard in
                                       FStar_TypeChecker_Env.conj_guard
                                         uu____7861 g_guard in
                                     (uu____7835, uu____7860))))
let (mk_non_layered_conjunction :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.eff_decl ->
      FStar_Syntax_Syntax.universe ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.typ ->
            FStar_Syntax_Syntax.comp_typ ->
              FStar_Syntax_Syntax.comp_typ ->
                FStar_Range.range ->
                  (FStar_Syntax_Syntax.comp *
                    FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun ed ->
      fun u_a ->
        fun a ->
          fun p ->
            fun ct1 ->
              fun ct2 ->
                fun uu____7905 ->
                  let p1 = FStar_Syntax_Util.b2t p in
                  let if_then_else =
                    let uu____7914 =
                      FStar_All.pipe_right ed
                        FStar_Syntax_Util.get_wp_if_then_else_combinator in
                    FStar_All.pipe_right uu____7914 FStar_Util.must in
                  let uu____7921 = destruct_wp_comp ct1 in
                  match uu____7921 with
                  | (uu____7932, uu____7933, wp_t) ->
                      let uu____7935 = destruct_wp_comp ct2 in
                      (match uu____7935 with
                       | (uu____7946, uu____7947, wp_e) ->
                           let wp =
                             let uu____7950 =
                               FStar_TypeChecker_Env.inst_effect_fun_with
                                 [u_a] env ed if_then_else in
                             let uu____7951 =
                               let uu____7952 = FStar_Syntax_Syntax.as_arg a in
                               let uu____7961 =
                                 let uu____7972 =
                                   FStar_Syntax_Syntax.as_arg p1 in
                                 let uu____7981 =
                                   let uu____7992 =
                                     FStar_Syntax_Syntax.as_arg wp_t in
                                   let uu____8001 =
                                     let uu____8012 =
                                       FStar_Syntax_Syntax.as_arg wp_e in
                                     [uu____8012] in
                                   uu____7992 :: uu____8001 in
                                 uu____7972 :: uu____7981 in
                               uu____7952 :: uu____7961 in
                             let uu____8061 =
                               FStar_Range.union_ranges
                                 wp_t.FStar_Syntax_Syntax.pos
                                 wp_e.FStar_Syntax_Syntax.pos in
                             FStar_Syntax_Syntax.mk_Tm_app uu____7950
                               uu____7951 uu____8061 in
                           let uu____8062 = mk_comp ed u_a a wp [] in
                           (uu____8062, FStar_TypeChecker_Env.trivial_guard))
let (comp_pure_wp_false :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.comp)
  =
  fun env ->
    fun u ->
      fun t ->
        let post_k =
          let uu____8081 =
            let uu____8090 = FStar_Syntax_Syntax.null_binder t in
            [uu____8090] in
          let uu____8109 =
            FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0 in
          FStar_Syntax_Util.arrow uu____8081 uu____8109 in
        let kwp =
          let uu____8115 =
            let uu____8124 = FStar_Syntax_Syntax.null_binder post_k in
            [uu____8124] in
          let uu____8143 =
            FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0 in
          FStar_Syntax_Util.arrow uu____8115 uu____8143 in
        let post =
          FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None post_k in
        let wp =
          let uu____8150 =
            let uu____8151 = FStar_Syntax_Syntax.mk_binder post in
            [uu____8151] in
          let uu____8170 = fvar_const env FStar_Parser_Const.false_lid in
          FStar_Syntax_Util.abs uu____8150 uu____8170
            (FStar_Pervasives_Native.Some
               (FStar_Syntax_Util.mk_residual_comp
                  FStar_Parser_Const.effect_Tot_lid
                  FStar_Pervasives_Native.None [FStar_Syntax_Syntax.TOTAL])) in
        let md =
          FStar_TypeChecker_Env.get_effect_decl env
            FStar_Parser_Const.effect_PURE_lid in
        mk_comp md u t wp []
let (bind_cases :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      (FStar_Syntax_Syntax.typ * FStar_Ident.lident *
        FStar_Syntax_Syntax.cflag Prims.list *
        (Prims.bool -> FStar_TypeChecker_Common.lcomp)) Prims.list ->
        FStar_Syntax_Syntax.bv -> FStar_TypeChecker_Common.lcomp)
  =
  fun env0 ->
    fun res_t ->
      fun lcases ->
        fun scrutinee ->
          let env =
            let uu____8226 =
              let uu____8227 =
                FStar_All.pipe_right scrutinee FStar_Syntax_Syntax.mk_binder in
              [uu____8227] in
            FStar_TypeChecker_Env.push_binders env0 uu____8226 in
          let eff =
            FStar_List.fold_left
              (fun eff ->
                 fun uu____8273 ->
                   match uu____8273 with
                   | (uu____8286, eff_label, uu____8288, uu____8289) ->
                       join_effects env eff eff_label)
              FStar_Parser_Const.effect_PURE_lid lcases in
          let uu____8300 =
            let uu____8307 =
              FStar_All.pipe_right lcases
                (FStar_Util.for_some
                   (fun uu____8341 ->
                      match uu____8341 with
                      | (uu____8354, uu____8355, flags, uu____8357) ->
                          FStar_All.pipe_right flags
                            (FStar_Util.for_some
                               (fun uu___5_8371 ->
                                  match uu___5_8371 with
                                  | FStar_Syntax_Syntax.SHOULD_NOT_INLINE ->
                                      true
                                  | uu____8372 -> false)))) in
            if uu____8307
            then (true, [FStar_Syntax_Syntax.SHOULD_NOT_INLINE])
            else (false, []) in
          match uu____8300 with
          | (should_not_inline_whole_match, bind_cases_flags) ->
              let bind_cases uu____8399 =
                let u_res_t = env.FStar_TypeChecker_Env.universe_of env res_t in
                let uu____8401 =
                  env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ()) in
                if uu____8401
                then
                  let uu____8406 = lax_mk_tot_or_comp_l eff u_res_t res_t [] in
                  (uu____8406, FStar_TypeChecker_Env.trivial_guard)
                else
                  (let maybe_return eff_label_then cthen =
                     let uu____8424 =
                       should_not_inline_whole_match ||
                         (let uu____8426 = is_pure_or_ghost_effect env eff in
                          Prims.op_Negation uu____8426) in
                     if uu____8424 then cthen true else cthen false in
                   let uu____8428 =
                     let uu____8439 =
                       let uu____8452 =
                         let uu____8457 =
                           let uu____8468 =
                             FStar_All.pipe_right lcases
                               (FStar_List.map
                                  (fun uu____8516 ->
                                     match uu____8516 with
                                     | (g, uu____8534, uu____8535,
                                        uu____8536) -> g)) in
                           FStar_All.pipe_right uu____8468
                             (FStar_List.fold_left
                                (fun uu____8582 ->
                                   fun g ->
                                     match uu____8582 with
                                     | (conds, acc) ->
                                         let cond =
                                           let uu____8623 =
                                             let uu____8626 =
                                               FStar_All.pipe_right g
                                                 FStar_Syntax_Util.b2t in
                                             FStar_All.pipe_right uu____8626
                                               FStar_Syntax_Util.mk_neg in
                                           FStar_Syntax_Util.mk_conj acc
                                             uu____8623 in
                                         ((FStar_List.append conds [cond]),
                                           cond))
                                ([FStar_Syntax_Util.t_true],
                                  FStar_Syntax_Util.t_true)) in
                         FStar_All.pipe_right uu____8457
                           FStar_Pervasives_Native.fst in
                       FStar_All.pipe_right uu____8452
                         (fun l ->
                            FStar_List.splitAt
                              ((FStar_List.length l) - Prims.int_one) l) in
                     FStar_All.pipe_right uu____8439
                       (fun uu____8731 ->
                          match uu____8731 with
                          | (l1, l2) ->
                              let uu____8772 = FStar_List.hd l2 in
                              (l1, uu____8772)) in
                   match uu____8428 with
                   | (neg_branch_conds, exhaustiveness_branch_cond) ->
                       let uu____8801 =
                         match lcases with
                         | [] ->
                             let uu____8831 =
                               comp_pure_wp_false env u_res_t res_t in
                             (FStar_Pervasives_Native.None, uu____8831,
                               FStar_TypeChecker_Env.trivial_guard)
                         | uu____8834 ->
                             let uu____8850 =
                               let uu____8882 =
                                 let uu____8893 =
                                   FStar_All.pipe_right neg_branch_conds
                                     (FStar_List.splitAt
                                        ((FStar_List.length lcases) -
                                           Prims.int_one)) in
                                 FStar_All.pipe_right uu____8893
                                   (fun uu____8963 ->
                                      match uu____8963 with
                                      | (l1, l2) ->
                                          let uu____9004 = FStar_List.hd l2 in
                                          (l1, uu____9004)) in
                               match uu____8882 with
                               | (neg_branch_conds1, neg_last) ->
                                   let uu____9060 =
                                     let uu____9097 =
                                       FStar_All.pipe_right lcases
                                         (FStar_List.splitAt
                                            ((FStar_List.length lcases) -
                                               Prims.int_one)) in
                                     FStar_All.pipe_right uu____9097
                                       (fun uu____9297 ->
                                          match uu____9297 with
                                          | (l1, l2) ->
                                              let uu____9440 =
                                                FStar_List.hd l2 in
                                              (l1, uu____9440)) in
                                   (match uu____9060 with
                                    | (lcases1,
                                       (g_last, eff_last, uu____9537, c_last))
                                        ->
                                        let uu____9602 =
                                          let lc =
                                            maybe_return eff_last c_last in
                                          let uu____9608 =
                                            FStar_TypeChecker_Common.lcomp_comp
                                              lc in
                                          match uu____9608 with
                                          | (c, g) ->
                                              let uu____9619 =
                                                let uu____9620 =
                                                  let uu____9621 =
                                                    FStar_Syntax_Util.b2t
                                                      g_last in
                                                  FStar_Syntax_Util.mk_conj
                                                    uu____9621 neg_last in
                                                FStar_TypeChecker_Common.weaken_guard_formula
                                                  g uu____9620 in
                                              (c, uu____9619) in
                                        (match uu____9602 with
                                         | (c, g) ->
                                             let uu____9657 =
                                               let uu____9658 =
                                                 FStar_All.pipe_right
                                                   eff_last
                                                   (FStar_TypeChecker_Env.norm_eff_name
                                                      env) in
                                               FStar_All.pipe_right
                                                 uu____9658
                                                 (FStar_TypeChecker_Env.get_effect_decl
                                                    env) in
                                             (lcases1, neg_branch_conds1,
                                               uu____9657, c, g))) in
                             (match uu____8850 with
                              | (lcases1, neg_branch_conds1, md, comp,
                                 g_comp) ->
                                  FStar_List.fold_right2
                                    (fun uu____9787 ->
                                       fun neg_cond ->
                                         fun uu____9789 ->
                                           match (uu____9787, uu____9789)
                                           with
                                           | ((g, eff_label, uu____9847,
                                               cthen),
                                              (uu____9849, celse, g_comp1))
                                               ->
                                               let uu____9893 =
                                                 let uu____9898 =
                                                   maybe_return eff_label
                                                     cthen in
                                                 FStar_TypeChecker_Common.lcomp_comp
                                                   uu____9898 in
                                               (match uu____9893 with
                                                | (cthen1, g_then) ->
                                                    let uu____9909 =
                                                      let uu____9920 =
                                                        lift_comps_sep_guards
                                                          env cthen1 celse
                                                          FStar_Pervasives_Native.None
                                                          false in
                                                      match uu____9920 with
                                                      | (m, cthen2, celse1,
                                                         g_lift_then,
                                                         g_lift_else) ->
                                                          let md1 =
                                                            FStar_TypeChecker_Env.get_effect_decl
                                                              env m in
                                                          let uu____9947 =
                                                            FStar_All.pipe_right
                                                              cthen2
                                                              FStar_Syntax_Util.comp_to_comp_typ in
                                                          let uu____9948 =
                                                            FStar_All.pipe_right
                                                              celse1
                                                              FStar_Syntax_Util.comp_to_comp_typ in
                                                          (md1, uu____9947,
                                                            uu____9948,
                                                            g_lift_then,
                                                            g_lift_else) in
                                                    (match uu____9909 with
                                                     | (md1, ct_then,
                                                        ct_else, g_lift_then,
                                                        g_lift_else) ->
                                                         let fn =
                                                           let uu____9999 =
                                                             FStar_All.pipe_right
                                                               md1
                                                               FStar_Syntax_Util.is_layered in
                                                           if uu____9999
                                                           then
                                                             mk_layered_conjunction
                                                           else
                                                             mk_non_layered_conjunction in
                                                         let uu____10029 =
                                                           let uu____10034 =
                                                             FStar_TypeChecker_Env.get_range
                                                               env in
                                                           fn env md1 u_res_t
                                                             res_t g ct_then
                                                             ct_else
                                                             uu____10034 in
                                                         (match uu____10029
                                                          with
                                                          | (c,
                                                             g_conjunction)
                                                              ->
                                                              let uu____10045
                                                                =
                                                                let g1 =
                                                                  FStar_Syntax_Util.b2t
                                                                    g in
                                                                let uu____10053
                                                                  =
                                                                  let uu____10054
                                                                    =
                                                                    FStar_TypeChecker_Env.conj_guard
                                                                    g_then
                                                                    g_lift_then in
                                                                  let uu____10055
                                                                    =
                                                                    FStar_Syntax_Util.mk_conj
                                                                    neg_cond
                                                                    g1 in
                                                                  FStar_TypeChecker_Common.weaken_guard_formula
                                                                    uu____10054
                                                                    uu____10055 in
                                                                let uu____10056
                                                                  =
                                                                  let uu____10057
                                                                    =
                                                                    let uu____10058
                                                                    =
                                                                    FStar_Syntax_Util.mk_neg
                                                                    g1 in
                                                                    FStar_Syntax_Util.mk_conj
                                                                    neg_cond
                                                                    uu____10058 in
                                                                  FStar_TypeChecker_Common.weaken_guard_formula
                                                                    g_lift_else
                                                                    uu____10057 in
                                                                (uu____10053,
                                                                  uu____10056) in
                                                              (match uu____10045
                                                               with
                                                               | (g_then1,
                                                                  g_else) ->
                                                                   let uu____10071
                                                                    =
                                                                    FStar_TypeChecker_Env.conj_guards
                                                                    [g_comp1;
                                                                    g_then1;
                                                                    g_else;
                                                                    g_conjunction] in
                                                                   ((FStar_Pervasives_Native.Some
                                                                    md1), c,
                                                                    uu____10071))))))
                                    lcases1 neg_branch_conds1
                                    ((FStar_Pervasives_Native.Some md), comp,
                                      g_comp)) in
                       (match uu____8801 with
                        | (md, comp, g_comp) ->
                            let uu____10087 =
                              let uu____10092 =
                                let check =
                                  FStar_Syntax_Util.mk_imp
                                    exhaustiveness_branch_cond
                                    FStar_Syntax_Util.t_false in
                                let check1 =
                                  let uu____10099 =
                                    FStar_TypeChecker_Env.get_range env in
                                  label
                                    FStar_TypeChecker_Err.exhaustiveness_check
                                    uu____10099 check in
                                strengthen_comp env
                                  FStar_Pervasives_Native.None comp check1
                                  bind_cases_flags in
                              match uu____10092 with
                              | (c, g) ->
                                  let uu____10109 =
                                    FStar_TypeChecker_Env.conj_guard g_comp g in
                                  (c, uu____10109) in
                            (match uu____10087 with
                             | (comp1, g_comp1) ->
                                 let g_comp2 =
                                   let uu____10117 =
                                     let uu____10118 =
                                       FStar_All.pipe_right scrutinee
                                         FStar_Syntax_Syntax.mk_binder in
                                     [uu____10118] in
                                   FStar_TypeChecker_Env.close_guard env0
                                     uu____10117 g_comp1 in
                                 (match lcases with
                                  | [] -> (comp1, g_comp2)
                                  | uu____10160::[] -> (comp1, g_comp2)
                                  | uu____10200 ->
                                      let uu____10216 =
                                        let uu____10217 =
                                          FStar_All.pipe_right md
                                            FStar_Util.must in
                                        FStar_All.pipe_right uu____10217
                                          FStar_Syntax_Util.is_layered in
                                      if uu____10216
                                      then (comp1, g_comp2)
                                      else
                                        (let comp2 =
                                           FStar_TypeChecker_Env.comp_to_comp_typ
                                             env comp1 in
                                         let md1 =
                                           FStar_TypeChecker_Env.get_effect_decl
                                             env
                                             comp2.FStar_Syntax_Syntax.effect_name in
                                         let uu____10227 =
                                           destruct_wp_comp comp2 in
                                         match uu____10227 with
                                         | (uu____10238, uu____10239, wp) ->
                                             let ite_wp =
                                               let uu____10242 =
                                                 FStar_All.pipe_right md1
                                                   FStar_Syntax_Util.get_wp_ite_combinator in
                                               FStar_All.pipe_right
                                                 uu____10242 FStar_Util.must in
                                             let wp1 =
                                               let uu____10250 =
                                                 FStar_TypeChecker_Env.inst_effect_fun_with
                                                   [u_res_t] env md1 ite_wp in
                                               let uu____10251 =
                                                 let uu____10252 =
                                                   FStar_Syntax_Syntax.as_arg
                                                     res_t in
                                                 let uu____10261 =
                                                   let uu____10272 =
                                                     FStar_Syntax_Syntax.as_arg
                                                       wp in
                                                   [uu____10272] in
                                                 uu____10252 :: uu____10261 in
                                               FStar_Syntax_Syntax.mk_Tm_app
                                                 uu____10250 uu____10251
                                                 wp.FStar_Syntax_Syntax.pos in
                                             let uu____10305 =
                                               mk_comp md1 u_res_t res_t wp1
                                                 bind_cases_flags in
                                             (uu____10305, g_comp2)))))) in
              FStar_TypeChecker_Common.mk_lcomp eff res_t bind_cases_flags
                bind_cases
let (check_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.comp ->
          (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.comp *
            FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun e ->
      fun c ->
        fun c' ->
          let uu____10339 = FStar_TypeChecker_Rel.sub_comp env c c' in
          match uu____10339 with
          | FStar_Pervasives_Native.None ->
              if env.FStar_TypeChecker_Env.use_eq
              then
                let uu____10354 =
                  FStar_TypeChecker_Err.computed_computation_type_does_not_match_annotation_eq
                    env e c c' in
                let uu____10359 = FStar_TypeChecker_Env.get_range env in
                FStar_Errors.raise_error uu____10354 uu____10359
              else
                (let uu____10367 =
                   FStar_TypeChecker_Err.computed_computation_type_does_not_match_annotation
                     env e c c' in
                 let uu____10372 = FStar_TypeChecker_Env.get_range env in
                 FStar_Errors.raise_error uu____10367 uu____10372)
          | FStar_Pervasives_Native.Some g -> (e, c', g)
let (universe_of_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.universe)
  =
  fun env ->
    fun u_res ->
      fun c ->
        let c_lid =
          let uu____10396 =
            FStar_All.pipe_right c FStar_Syntax_Util.comp_effect_name in
          FStar_All.pipe_right uu____10396
            (FStar_TypeChecker_Env.norm_eff_name env) in
        let uu____10399 = FStar_Syntax_Util.is_pure_or_ghost_effect c_lid in
        if uu____10399
        then u_res
        else
          (let is_total =
             let uu____10402 =
               FStar_TypeChecker_Env.lookup_effect_quals env c_lid in
             FStar_All.pipe_right uu____10402
               (FStar_List.existsb
                  (fun q -> q = FStar_Syntax_Syntax.TotalEffect)) in
           if Prims.op_Negation is_total
           then FStar_Syntax_Syntax.U_zero
           else
             (let uu____10410 = FStar_TypeChecker_Env.effect_repr env c u_res in
              match uu____10410 with
              | FStar_Pervasives_Native.None ->
                  let uu____10413 =
                    let uu____10418 =
                      let uu____10419 =
                        FStar_Syntax_Print.lid_to_string c_lid in
                      FStar_Util.format1
                        "Effect %s is marked total but does not have a repr"
                        uu____10419 in
                    (FStar_Errors.Fatal_EffectCannotBeReified, uu____10418) in
                  FStar_Errors.raise_error uu____10413
                    c.FStar_Syntax_Syntax.pos
              | FStar_Pervasives_Native.Some tm ->
                  env.FStar_TypeChecker_Env.universe_of env tm))
let (check_trivial_precondition :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      (FStar_Syntax_Syntax.comp_typ * FStar_Syntax_Syntax.formula *
        FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun c ->
      let ct =
        FStar_All.pipe_right c
          (FStar_TypeChecker_Env.unfold_effect_abbrev env) in
      let md =
        FStar_TypeChecker_Env.get_effect_decl env
          ct.FStar_Syntax_Syntax.effect_name in
      let uu____10439 = destruct_wp_comp ct in
      match uu____10439 with
      | (u_t, t, wp) ->
          let vc =
            let uu____10456 =
              let uu____10457 =
                let uu____10458 =
                  FStar_All.pipe_right md
                    FStar_Syntax_Util.get_wp_trivial_combinator in
                FStar_All.pipe_right uu____10458 FStar_Util.must in
              FStar_TypeChecker_Env.inst_effect_fun_with [u_t] env md
                uu____10457 in
            let uu____10465 =
              let uu____10466 = FStar_Syntax_Syntax.as_arg t in
              let uu____10475 =
                let uu____10486 = FStar_Syntax_Syntax.as_arg wp in
                [uu____10486] in
              uu____10466 :: uu____10475 in
            let uu____10519 = FStar_TypeChecker_Env.get_range env in
            FStar_Syntax_Syntax.mk_Tm_app uu____10456 uu____10465 uu____10519 in
          let uu____10520 =
            FStar_All.pipe_left FStar_TypeChecker_Env.guard_of_guard_formula
              (FStar_TypeChecker_Common.NonTrivial vc) in
          (ct, vc, uu____10520)
let (coerce_with :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp ->
        FStar_Syntax_Syntax.typ ->
          FStar_Ident.lident ->
            FStar_Syntax_Syntax.universes ->
              FStar_Syntax_Syntax.args ->
                (FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.comp) ->
                  (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.lcomp))
  =
  fun env ->
    fun e ->
      fun lc ->
        fun ty ->
          fun f ->
            fun us ->
              fun eargs ->
                fun mkcomp ->
                  let uu____10574 =
                    FStar_TypeChecker_Env.try_lookup_lid env f in
                  match uu____10574 with
                  | FStar_Pervasives_Native.Some uu____10589 ->
                      ((let uu____10607 =
                          FStar_TypeChecker_Env.debug env
                            (FStar_Options.Other "Coercions") in
                        if uu____10607
                        then
                          let uu____10608 = FStar_Ident.string_of_lid f in
                          FStar_Util.print1 "Coercing with %s!\n" uu____10608
                        else ());
                       (let coercion =
                          let uu____10611 =
                            FStar_Ident.set_lid_range f
                              e.FStar_Syntax_Syntax.pos in
                          FStar_Syntax_Syntax.fvar uu____10611
                            (FStar_Syntax_Syntax.Delta_constant_at_level
                               Prims.int_one) FStar_Pervasives_Native.None in
                        let coercion1 =
                          FStar_Syntax_Syntax.mk_Tm_uinst coercion us in
                        let coercion2 =
                          FStar_Syntax_Util.mk_app coercion1 eargs in
                        let lc1 =
                          let uu____10617 =
                            let uu____10618 =
                              let uu____10619 = mkcomp ty in
                              FStar_All.pipe_left
                                FStar_TypeChecker_Common.lcomp_of_comp
                                uu____10619 in
                            (FStar_Pervasives_Native.None, uu____10618) in
                          bind e.FStar_Syntax_Syntax.pos env
                            (FStar_Pervasives_Native.Some e) lc uu____10617 in
                        let e1 =
                          let uu____10623 =
                            let uu____10624 = FStar_Syntax_Syntax.as_arg e in
                            [uu____10624] in
                          FStar_Syntax_Syntax.mk_Tm_app coercion2 uu____10623
                            e.FStar_Syntax_Syntax.pos in
                        (e1, lc1)))
                  | FStar_Pervasives_Native.None ->
                      ((let uu____10658 =
                          let uu____10663 =
                            let uu____10664 = FStar_Ident.string_of_lid f in
                            FStar_Util.format1
                              "Coercion %s was not found in the environment, not coercing."
                              uu____10664 in
                          (FStar_Errors.Warning_CoercionNotFound,
                            uu____10663) in
                        FStar_Errors.log_issue e.FStar_Syntax_Syntax.pos
                          uu____10658);
                       (e, lc))
type isErased =
  | Yes of FStar_Syntax_Syntax.term 
  | Maybe 
  | No 
let (uu___is_Yes : isErased -> Prims.bool) =
  fun projectee ->
    match projectee with | Yes _0 -> true | uu____10676 -> false
let (__proj__Yes__item___0 : isErased -> FStar_Syntax_Syntax.term) =
  fun projectee -> match projectee with | Yes _0 -> _0
let (uu___is_Maybe : isErased -> Prims.bool) =
  fun projectee ->
    match projectee with | Maybe -> true | uu____10688 -> false
let (uu___is_No : isErased -> Prims.bool) =
  fun projectee -> match projectee with | No -> true | uu____10694 -> false
let rec (check_erased :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> isErased) =
  fun env ->
    fun t ->
      let norm' =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.Eager_unfolding;
          FStar_TypeChecker_Env.UnfoldUntil
            FStar_Syntax_Syntax.delta_constant;
          FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta;
          FStar_TypeChecker_Env.Primops;
          FStar_TypeChecker_Env.Weak;
          FStar_TypeChecker_Env.HNF;
          FStar_TypeChecker_Env.Iota] in
      let t1 = norm' env t in
      let t2 = FStar_Syntax_Util.unrefine t1 in
      let uu____10716 = FStar_Syntax_Util.head_and_args t2 in
      match uu____10716 with
      | (h, args) ->
          let h1 = FStar_Syntax_Util.un_uinst h in
          let r =
            let uu____10761 =
              let uu____10776 =
                let uu____10777 = FStar_Syntax_Subst.compress h1 in
                uu____10777.FStar_Syntax_Syntax.n in
              (uu____10776, args) in
            match uu____10761 with
            | (FStar_Syntax_Syntax.Tm_fvar fv,
               (a, FStar_Pervasives_Native.None)::[]) when
                FStar_Syntax_Syntax.fv_eq_lid fv
                  FStar_Parser_Const.erased_lid
                -> Yes a
            | (FStar_Syntax_Syntax.Tm_uvar uu____10824, uu____10825) -> Maybe
            | (FStar_Syntax_Syntax.Tm_unknown, uu____10858) -> Maybe
            | (FStar_Syntax_Syntax.Tm_match (uu____10879, branches),
               uu____10881) ->
                FStar_All.pipe_right branches
                  (FStar_List.fold_left
                     (fun acc ->
                        fun br ->
                          match acc with
                          | Yes uu____10945 -> Maybe
                          | Maybe -> Maybe
                          | No ->
                              let uu____10946 =
                                FStar_Syntax_Subst.open_branch br in
                              (match uu____10946 with
                               | (uu____10947, uu____10948, br_body) ->
                                   let uu____10966 =
                                     let uu____10967 =
                                       let uu____10972 =
                                         let uu____10973 =
                                           let uu____10976 =
                                             FStar_All.pipe_right br_body
                                               FStar_Syntax_Free.names in
                                           FStar_All.pipe_right uu____10976
                                             FStar_Util.set_elements in
                                         FStar_All.pipe_right uu____10973
                                           (FStar_TypeChecker_Env.push_bvs
                                              env) in
                                       check_erased uu____10972 in
                                     FStar_All.pipe_right br_body uu____10967 in
                                   (match uu____10966 with
                                    | No -> No
                                    | uu____10987 -> Maybe))) No)
            | uu____10988 -> No in
          r
let (maybe_coerce_lc :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.lcomp *
            FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun e ->
      fun lc ->
        fun exp_t ->
          let should_coerce =
            (((let uu____11038 = FStar_Options.use_two_phase_tc () in
               Prims.op_Negation uu____11038) ||
                env.FStar_TypeChecker_Env.phase1)
               || env.FStar_TypeChecker_Env.lax)
              || (FStar_Options.lax ()) in
          if Prims.op_Negation should_coerce
          then (e, lc, FStar_TypeChecker_Env.trivial_guard)
          else
            (let is_t_term t =
               let t1 = FStar_TypeChecker_Normalize.unfold_whnf env t in
               let uu____11053 =
                 let uu____11054 = FStar_Syntax_Subst.compress t1 in
                 uu____11054.FStar_Syntax_Syntax.n in
               match uu____11053 with
               | FStar_Syntax_Syntax.Tm_fvar fv ->
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.term_lid
               | uu____11058 -> false in
             let is_t_term_view t =
               let t1 = FStar_TypeChecker_Normalize.unfold_whnf env t in
               let uu____11066 =
                 let uu____11067 = FStar_Syntax_Subst.compress t1 in
                 uu____11067.FStar_Syntax_Syntax.n in
               match uu____11066 with
               | FStar_Syntax_Syntax.Tm_fvar fv ->
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.term_view_lid
               | uu____11071 -> false in
             let is_type t =
               let t1 = FStar_TypeChecker_Normalize.unfold_whnf env t in
               let t2 = FStar_Syntax_Util.unrefine t1 in
               let uu____11080 =
                 let uu____11081 = FStar_Syntax_Subst.compress t2 in
                 uu____11081.FStar_Syntax_Syntax.n in
               match uu____11080 with
               | FStar_Syntax_Syntax.Tm_type uu____11084 -> true
               | uu____11085 -> false in
             let res_typ =
               FStar_Syntax_Util.unrefine lc.FStar_TypeChecker_Common.res_typ in
             let uu____11087 = FStar_Syntax_Util.head_and_args res_typ in
             match uu____11087 with
             | (head, args) ->
                 ((let uu____11137 =
                     FStar_TypeChecker_Env.debug env
                       (FStar_Options.Other "Coercions") in
                   if uu____11137
                   then
                     let uu____11138 =
                       FStar_Range.string_of_range e.FStar_Syntax_Syntax.pos in
                     let uu____11139 = FStar_Syntax_Print.term_to_string e in
                     let uu____11140 =
                       FStar_Syntax_Print.term_to_string res_typ in
                     let uu____11141 =
                       FStar_Syntax_Print.term_to_string exp_t in
                     FStar_Util.print4
                       "(%s) Trying to coerce %s from type (%s) to type (%s)\n"
                       uu____11138 uu____11139 uu____11140 uu____11141
                   else ());
                  (let mk_erased u t =
                     let uu____11156 =
                       let uu____11159 =
                         fvar_const env FStar_Parser_Const.erased_lid in
                       FStar_Syntax_Syntax.mk_Tm_uinst uu____11159 [u] in
                     let uu____11160 =
                       let uu____11171 = FStar_Syntax_Syntax.as_arg t in
                       [uu____11171] in
                     FStar_Syntax_Util.mk_app uu____11156 uu____11160 in
                   let uu____11196 =
                     let uu____11211 =
                       let uu____11212 = FStar_Syntax_Util.un_uinst head in
                       uu____11212.FStar_Syntax_Syntax.n in
                     (uu____11211, args) in
                   match uu____11196 with
                   | (FStar_Syntax_Syntax.Tm_fvar fv, []) when
                       (FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.bool_lid)
                         && (is_type exp_t)
                       ->
                       let uu____11250 =
                         coerce_with env e lc FStar_Syntax_Util.ktype0
                           FStar_Parser_Const.b2t_lid [] []
                           FStar_Syntax_Syntax.mk_Total in
                       (match uu____11250 with
                        | (e1, lc1) ->
                            (e1, lc1, FStar_TypeChecker_Env.trivial_guard))
                   | (FStar_Syntax_Syntax.Tm_fvar fv, []) when
                       (FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.term_lid)
                         && (is_t_term_view exp_t)
                       ->
                       let uu____11290 =
                         coerce_with env e lc FStar_Syntax_Syntax.t_term_view
                           FStar_Parser_Const.inspect [] []
                           FStar_Syntax_Syntax.mk_Tac in
                       (match uu____11290 with
                        | (e1, lc1) ->
                            (e1, lc1, FStar_TypeChecker_Env.trivial_guard))
                   | (FStar_Syntax_Syntax.Tm_fvar fv, []) when
                       (FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.term_view_lid)
                         && (is_t_term exp_t)
                       ->
                       let uu____11330 =
                         coerce_with env e lc FStar_Syntax_Syntax.t_term
                           FStar_Parser_Const.pack [] []
                           FStar_Syntax_Syntax.mk_Tac in
                       (match uu____11330 with
                        | (e1, lc1) ->
                            (e1, lc1, FStar_TypeChecker_Env.trivial_guard))
                   | (FStar_Syntax_Syntax.Tm_fvar fv, []) when
                       (FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.binder_lid)
                         && (is_t_term exp_t)
                       ->
                       let uu____11370 =
                         coerce_with env e lc FStar_Syntax_Syntax.t_term
                           FStar_Parser_Const.binder_to_term [] []
                           FStar_Syntax_Syntax.mk_Tac in
                       (match uu____11370 with
                        | (e1, lc1) ->
                            (e1, lc1, FStar_TypeChecker_Env.trivial_guard))
                   | uu____11391 ->
                       let uu____11406 =
                         let uu____11411 = check_erased env res_typ in
                         let uu____11412 = check_erased env exp_t in
                         (uu____11411, uu____11412) in
                       (match uu____11406 with
                        | (No, Yes ty) ->
                            let u =
                              env.FStar_TypeChecker_Env.universe_of env ty in
                            let uu____11421 =
                              FStar_TypeChecker_Rel.get_subtyping_predicate
                                env res_typ ty in
                            (match uu____11421 with
                             | FStar_Pervasives_Native.None ->
                                 (e, lc, FStar_TypeChecker_Env.trivial_guard)
                             | FStar_Pervasives_Native.Some g ->
                                 let g1 =
                                   FStar_TypeChecker_Env.apply_guard g e in
                                 let uu____11432 =
                                   let uu____11437 =
                                     let uu____11438 =
                                       FStar_Syntax_Syntax.iarg ty in
                                     [uu____11438] in
                                   coerce_with env e lc exp_t
                                     FStar_Parser_Const.hide [u] uu____11437
                                     FStar_Syntax_Syntax.mk_Total in
                                 (match uu____11432 with
                                  | (e1, lc1) -> (e1, lc1, g1)))
                        | (Yes ty, No) ->
                            let u =
                              env.FStar_TypeChecker_Env.universe_of env ty in
                            let uu____11473 =
                              let uu____11478 =
                                let uu____11479 = FStar_Syntax_Syntax.iarg ty in
                                [uu____11479] in
                              coerce_with env e lc ty
                                FStar_Parser_Const.reveal [u] uu____11478
                                FStar_Syntax_Syntax.mk_GTotal in
                            (match uu____11473 with
                             | (e1, lc1) ->
                                 (e1, lc1,
                                   FStar_TypeChecker_Env.trivial_guard))
                        | uu____11512 ->
                            (e, lc, FStar_TypeChecker_Env.trivial_guard)))))
let (coerce_views :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp ->
        (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.lcomp)
          FStar_Pervasives_Native.option)
  =
  fun env ->
    fun e ->
      fun lc ->
        let rt = lc.FStar_TypeChecker_Common.res_typ in
        let rt1 = FStar_Syntax_Util.unrefine rt in
        let uu____11546 = FStar_Syntax_Util.head_and_args rt1 in
        match uu____11546 with
        | (hd, args) ->
            let uu____11595 =
              let uu____11610 =
                let uu____11611 = FStar_Syntax_Subst.compress hd in
                uu____11611.FStar_Syntax_Syntax.n in
              (uu____11610, args) in
            (match uu____11595 with
             | (FStar_Syntax_Syntax.Tm_fvar fv, []) when
                 FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.term_lid
                 ->
                 let uu____11649 =
                   coerce_with env e lc FStar_Syntax_Syntax.t_term_view
                     FStar_Parser_Const.inspect [] []
                     FStar_Syntax_Syntax.mk_Tac in
                 FStar_All.pipe_left
                   (fun uu____11676 ->
                      FStar_Pervasives_Native.Some uu____11676) uu____11649
             | uu____11677 -> FStar_Pervasives_Native.None)
let (weaken_result_typ :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.lcomp *
            FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun e ->
      fun lc ->
        fun t ->
          (let uu____11729 =
             FStar_TypeChecker_Env.debug env FStar_Options.High in
           if uu____11729
           then
             let uu____11730 = FStar_Syntax_Print.term_to_string e in
             let uu____11731 = FStar_TypeChecker_Common.lcomp_to_string lc in
             let uu____11732 = FStar_Syntax_Print.term_to_string t in
             FStar_Util.print3 "weaken_result_typ e=(%s) lc=(%s) t=(%s)\n"
               uu____11730 uu____11731 uu____11732
           else ());
          (let use_eq =
             (env.FStar_TypeChecker_Env.use_eq_strict ||
                env.FStar_TypeChecker_Env.use_eq)
               ||
               (let uu____11738 =
                  FStar_TypeChecker_Env.effect_decl_opt env
                    lc.FStar_TypeChecker_Common.eff_name in
                match uu____11738 with
                | FStar_Pervasives_Native.Some (ed, qualifiers) ->
                    FStar_All.pipe_right qualifiers
                      (FStar_List.contains FStar_Syntax_Syntax.Reifiable)
                | uu____11761 -> false) in
           let gopt =
             if use_eq
             then
               let uu____11783 =
                 FStar_TypeChecker_Rel.try_teq true env
                   lc.FStar_TypeChecker_Common.res_typ t in
               (uu____11783, false)
             else
               (let uu____11789 =
                  FStar_TypeChecker_Rel.get_subtyping_predicate env
                    lc.FStar_TypeChecker_Common.res_typ t in
                (uu____11789, true)) in
           match gopt with
           | (FStar_Pervasives_Native.None, uu____11800) ->
               if env.FStar_TypeChecker_Env.failhard
               then
                 let uu____11809 =
                   FStar_TypeChecker_Err.basic_type_error env
                     (FStar_Pervasives_Native.Some e) t
                     lc.FStar_TypeChecker_Common.res_typ in
                 FStar_Errors.raise_error uu____11809
                   e.FStar_Syntax_Syntax.pos
               else
                 (FStar_TypeChecker_Rel.subtype_fail env e
                    lc.FStar_TypeChecker_Common.res_typ t;
                  (e,
                    ((let uu___1419_11823 = lc in
                      {
                        FStar_TypeChecker_Common.eff_name =
                          (uu___1419_11823.FStar_TypeChecker_Common.eff_name);
                        FStar_TypeChecker_Common.res_typ = t;
                        FStar_TypeChecker_Common.cflags =
                          (uu___1419_11823.FStar_TypeChecker_Common.cflags);
                        FStar_TypeChecker_Common.comp_thunk =
                          (uu___1419_11823.FStar_TypeChecker_Common.comp_thunk)
                      })), FStar_TypeChecker_Env.trivial_guard))
           | (FStar_Pervasives_Native.Some g, apply_guard) ->
               let uu____11828 = FStar_TypeChecker_Env.guard_form g in
               (match uu____11828 with
                | FStar_TypeChecker_Common.Trivial ->
                    let strengthen_trivial uu____11844 =
                      let uu____11845 =
                        FStar_TypeChecker_Common.lcomp_comp lc in
                      match uu____11845 with
                      | (c, g_c) ->
                          let res_t = FStar_Syntax_Util.comp_result c in
                          let set_result_typ c1 =
                            FStar_Syntax_Util.set_result_typ c1 t in
                          let uu____11865 =
                            let uu____11866 = FStar_Syntax_Util.eq_tm t res_t in
                            uu____11866 = FStar_Syntax_Util.Equal in
                          if uu____11865
                          then
                            ((let uu____11872 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  FStar_Options.Extreme in
                              if uu____11872
                              then
                                let uu____11873 =
                                  FStar_Syntax_Print.term_to_string res_t in
                                let uu____11874 =
                                  FStar_Syntax_Print.term_to_string t in
                                FStar_Util.print2
                                  "weaken_result_type::strengthen_trivial: res_t:%s is same as t:%s\n"
                                  uu____11873 uu____11874
                              else ());
                             (let uu____11876 = set_result_typ c in
                              (uu____11876, g_c)))
                          else
                            (let is_res_t_refinement =
                               let res_t1 =
                                 FStar_TypeChecker_Normalize.normalize_refinement
                                   FStar_TypeChecker_Normalize.whnf_steps env
                                   res_t in
                               match res_t1.FStar_Syntax_Syntax.n with
                               | FStar_Syntax_Syntax.Tm_refine uu____11880 ->
                                   true
                               | uu____11887 -> false in
                             if is_res_t_refinement
                             then
                               let x =
                                 FStar_Syntax_Syntax.new_bv
                                   (FStar_Pervasives_Native.Some
                                      (res_t.FStar_Syntax_Syntax.pos)) res_t in
                               let uu____11893 =
                                 let uu____11898 =
                                   let uu____11899 =
                                     FStar_All.pipe_right c
                                       FStar_Syntax_Util.comp_effect_name in
                                   FStar_All.pipe_right uu____11899
                                     (FStar_TypeChecker_Env.norm_eff_name env) in
                                 let uu____11902 =
                                   FStar_Syntax_Syntax.bv_to_name x in
                                 return_value env uu____11898
                                   (comp_univ_opt c) res_t uu____11902 in
                               match uu____11893 with
                               | (cret, gret) ->
                                   let lc1 =
                                     let uu____11912 =
                                       FStar_TypeChecker_Common.lcomp_of_comp
                                         c in
                                     let uu____11913 =
                                       let uu____11914 =
                                         FStar_TypeChecker_Common.lcomp_of_comp
                                           cret in
                                       ((FStar_Pervasives_Native.Some x),
                                         uu____11914) in
                                     bind e.FStar_Syntax_Syntax.pos env
                                       (FStar_Pervasives_Native.Some e)
                                       uu____11912 uu____11913 in
                                   ((let uu____11918 =
                                       FStar_All.pipe_left
                                         (FStar_TypeChecker_Env.debug env)
                                         FStar_Options.Extreme in
                                     if uu____11918
                                     then
                                       let uu____11919 =
                                         FStar_Syntax_Print.term_to_string e in
                                       let uu____11920 =
                                         FStar_Syntax_Print.comp_to_string c in
                                       let uu____11921 =
                                         FStar_Syntax_Print.term_to_string t in
                                       let uu____11922 =
                                         FStar_TypeChecker_Common.lcomp_to_string
                                           lc1 in
                                       FStar_Util.print4
                                         "weaken_result_type::strengthen_trivial: inserting a return for e: %s, c: %s, t: %s, and then post return lc: %s\n"
                                         uu____11919 uu____11920 uu____11921
                                         uu____11922
                                     else ());
                                    (let uu____11924 =
                                       FStar_TypeChecker_Common.lcomp_comp
                                         lc1 in
                                     match uu____11924 with
                                     | (c1, g_lc) ->
                                         let uu____11935 = set_result_typ c1 in
                                         let uu____11936 =
                                           FStar_TypeChecker_Env.conj_guards
                                             [g_c; gret; g_lc] in
                                         (uu____11935, uu____11936)))
                             else
                               ((let uu____11939 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env)
                                     FStar_Options.Extreme in
                                 if uu____11939
                                 then
                                   let uu____11940 =
                                     FStar_Syntax_Print.term_to_string res_t in
                                   let uu____11941 =
                                     FStar_Syntax_Print.comp_to_string c in
                                   FStar_Util.print2
                                     "weaken_result_type::strengthen_trivial: res_t:%s is not a refinement, leaving c:%s as is\n"
                                     uu____11940 uu____11941
                                 else ());
                                (let uu____11943 = set_result_typ c in
                                 (uu____11943, g_c)))) in
                    let lc1 =
                      FStar_TypeChecker_Common.mk_lcomp
                        lc.FStar_TypeChecker_Common.eff_name t
                        lc.FStar_TypeChecker_Common.cflags strengthen_trivial in
                    (e, lc1, g)
                | FStar_TypeChecker_Common.NonTrivial f ->
                    let g1 =
                      let uu___1458_11947 = g in
                      {
                        FStar_TypeChecker_Common.guard_f =
                          FStar_TypeChecker_Common.Trivial;
                        FStar_TypeChecker_Common.deferred_to_tac =
                          (uu___1458_11947.FStar_TypeChecker_Common.deferred_to_tac);
                        FStar_TypeChecker_Common.deferred =
                          (uu___1458_11947.FStar_TypeChecker_Common.deferred);
                        FStar_TypeChecker_Common.univ_ineqs =
                          (uu___1458_11947.FStar_TypeChecker_Common.univ_ineqs);
                        FStar_TypeChecker_Common.implicits =
                          (uu___1458_11947.FStar_TypeChecker_Common.implicits)
                      } in
                    let strengthen uu____11957 =
                      let uu____11958 =
                        env.FStar_TypeChecker_Env.lax &&
                          (FStar_Options.ml_ish ()) in
                      if uu____11958
                      then FStar_TypeChecker_Common.lcomp_comp lc
                      else
                        (let f1 =
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Env.Beta;
                             FStar_TypeChecker_Env.Eager_unfolding;
                             FStar_TypeChecker_Env.Simplify;
                             FStar_TypeChecker_Env.Primops] env f in
                         let uu____11965 =
                           let uu____11966 = FStar_Syntax_Subst.compress f1 in
                           uu____11966.FStar_Syntax_Syntax.n in
                         match uu____11965 with
                         | FStar_Syntax_Syntax.Tm_abs
                             (uu____11973,
                              {
                                FStar_Syntax_Syntax.n =
                                  FStar_Syntax_Syntax.Tm_fvar fv;
                                FStar_Syntax_Syntax.pos = uu____11975;
                                FStar_Syntax_Syntax.vars = uu____11976;_},
                              uu____11977)
                             when
                             FStar_Syntax_Syntax.fv_eq_lid fv
                               FStar_Parser_Const.true_lid
                             ->
                             let lc1 =
                               let uu___1474_12003 = lc in
                               {
                                 FStar_TypeChecker_Common.eff_name =
                                   (uu___1474_12003.FStar_TypeChecker_Common.eff_name);
                                 FStar_TypeChecker_Common.res_typ = t;
                                 FStar_TypeChecker_Common.cflags =
                                   (uu___1474_12003.FStar_TypeChecker_Common.cflags);
                                 FStar_TypeChecker_Common.comp_thunk =
                                   (uu___1474_12003.FStar_TypeChecker_Common.comp_thunk)
                               } in
                             FStar_TypeChecker_Common.lcomp_comp lc1
                         | uu____12004 ->
                             let uu____12005 =
                               FStar_TypeChecker_Common.lcomp_comp lc in
                             (match uu____12005 with
                              | (c, g_c) ->
                                  ((let uu____12017 =
                                      FStar_All.pipe_left
                                        (FStar_TypeChecker_Env.debug env)
                                        FStar_Options.Extreme in
                                    if uu____12017
                                    then
                                      let uu____12018 =
                                        FStar_TypeChecker_Normalize.term_to_string
                                          env
                                          lc.FStar_TypeChecker_Common.res_typ in
                                      let uu____12019 =
                                        FStar_TypeChecker_Normalize.term_to_string
                                          env t in
                                      let uu____12020 =
                                        FStar_TypeChecker_Normalize.comp_to_string
                                          env c in
                                      let uu____12021 =
                                        FStar_TypeChecker_Normalize.term_to_string
                                          env f1 in
                                      FStar_Util.print4
                                        "Weakened from %s to %s\nStrengthening %s with guard %s\n"
                                        uu____12018 uu____12019 uu____12020
                                        uu____12021
                                    else ());
                                   (let u_t_opt = comp_univ_opt c in
                                    let x =
                                      FStar_Syntax_Syntax.new_bv
                                        (FStar_Pervasives_Native.Some
                                           (t.FStar_Syntax_Syntax.pos)) t in
                                    let xexp =
                                      FStar_Syntax_Syntax.bv_to_name x in
                                    let uu____12028 =
                                      let uu____12033 =
                                        let uu____12034 =
                                          FStar_All.pipe_right c
                                            FStar_Syntax_Util.comp_effect_name in
                                        FStar_All.pipe_right uu____12034
                                          (FStar_TypeChecker_Env.norm_eff_name
                                             env) in
                                      return_value env uu____12033 u_t_opt t
                                        xexp in
                                    match uu____12028 with
                                    | (cret, gret) ->
                                        let guard =
                                          if apply_guard
                                          then
                                            let uu____12044 =
                                              let uu____12045 =
                                                FStar_Syntax_Syntax.as_arg
                                                  xexp in
                                              [uu____12045] in
                                            FStar_Syntax_Syntax.mk_Tm_app f1
                                              uu____12044
                                              f1.FStar_Syntax_Syntax.pos
                                          else f1 in
                                        let uu____12071 =
                                          let uu____12076 =
                                            FStar_All.pipe_left
                                              (fun uu____12093 ->
                                                 FStar_Pervasives_Native.Some
                                                   uu____12093)
                                              (FStar_TypeChecker_Err.subtyping_failed
                                                 env
                                                 lc.FStar_TypeChecker_Common.res_typ
                                                 t) in
                                          let uu____12094 =
                                            let uu____12095 =
                                              FStar_TypeChecker_Env.push_bvs
                                                env [x] in
                                            FStar_TypeChecker_Env.set_range
                                              uu____12095
                                              e.FStar_Syntax_Syntax.pos in
                                          let uu____12096 =
                                            FStar_TypeChecker_Common.lcomp_of_comp
                                              cret in
                                          let uu____12097 =
                                            FStar_All.pipe_left
                                              FStar_TypeChecker_Env.guard_of_guard_formula
                                              (FStar_TypeChecker_Common.NonTrivial
                                                 guard) in
                                          strengthen_precondition uu____12076
                                            uu____12094 e uu____12096
                                            uu____12097 in
                                        (match uu____12071 with
                                         | (eq_ret,
                                            _trivial_so_ok_to_discard) ->
                                             let x1 =
                                               let uu___1494_12105 = x in
                                               {
                                                 FStar_Syntax_Syntax.ppname =
                                                   (uu___1494_12105.FStar_Syntax_Syntax.ppname);
                                                 FStar_Syntax_Syntax.index =
                                                   (uu___1494_12105.FStar_Syntax_Syntax.index);
                                                 FStar_Syntax_Syntax.sort =
                                                   (lc.FStar_TypeChecker_Common.res_typ)
                                               } in
                                             let c1 =
                                               let uu____12107 =
                                                 FStar_TypeChecker_Common.lcomp_of_comp
                                                   c in
                                               bind e.FStar_Syntax_Syntax.pos
                                                 env
                                                 (FStar_Pervasives_Native.Some
                                                    e) uu____12107
                                                 ((FStar_Pervasives_Native.Some
                                                     x1), eq_ret) in
                                             let uu____12110 =
                                               FStar_TypeChecker_Common.lcomp_comp
                                                 c1 in
                                             (match uu____12110 with
                                              | (c2, g_lc) ->
                                                  ((let uu____12122 =
                                                      FStar_All.pipe_left
                                                        (FStar_TypeChecker_Env.debug
                                                           env)
                                                        FStar_Options.Extreme in
                                                    if uu____12122
                                                    then
                                                      let uu____12123 =
                                                        FStar_TypeChecker_Normalize.comp_to_string
                                                          env c2 in
                                                      FStar_Util.print1
                                                        "Strengthened to %s\n"
                                                        uu____12123
                                                    else ());
                                                   (let uu____12125 =
                                                      FStar_TypeChecker_Env.conj_guards
                                                        [g_c; gret; g_lc] in
                                                    (c2, uu____12125))))))))) in
                    let flags =
                      FStar_All.pipe_right lc.FStar_TypeChecker_Common.cflags
                        (FStar_List.collect
                           (fun uu___6_12134 ->
                              match uu___6_12134 with
                              | FStar_Syntax_Syntax.RETURN ->
                                  [FStar_Syntax_Syntax.PARTIAL_RETURN]
                              | FStar_Syntax_Syntax.PARTIAL_RETURN ->
                                  [FStar_Syntax_Syntax.PARTIAL_RETURN]
                              | FStar_Syntax_Syntax.CPS ->
                                  [FStar_Syntax_Syntax.CPS]
                              | uu____12137 -> [])) in
                    let lc1 =
                      let uu____12139 =
                        FStar_TypeChecker_Env.norm_eff_name env
                          lc.FStar_TypeChecker_Common.eff_name in
                      FStar_TypeChecker_Common.mk_lcomp uu____12139 t flags
                        strengthen in
                    let g2 =
                      let uu___1510_12141 = g1 in
                      {
                        FStar_TypeChecker_Common.guard_f =
                          FStar_TypeChecker_Common.Trivial;
                        FStar_TypeChecker_Common.deferred_to_tac =
                          (uu___1510_12141.FStar_TypeChecker_Common.deferred_to_tac);
                        FStar_TypeChecker_Common.deferred =
                          (uu___1510_12141.FStar_TypeChecker_Common.deferred);
                        FStar_TypeChecker_Common.univ_ineqs =
                          (uu___1510_12141.FStar_TypeChecker_Common.univ_ineqs);
                        FStar_TypeChecker_Common.implicits =
                          (uu___1510_12141.FStar_TypeChecker_Common.implicits)
                      } in
                    (e, lc1, g2)))
let (pure_or_ghost_pre_and_post :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      (FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option *
        FStar_Syntax_Syntax.typ))
  =
  fun env ->
    fun comp ->
      let mk_post_type res_t ens =
        let x = FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None res_t in
        let uu____12176 =
          let uu____12179 =
            let uu____12180 =
              let uu____12189 = FStar_Syntax_Syntax.bv_to_name x in
              FStar_Syntax_Syntax.as_arg uu____12189 in
            [uu____12180] in
          FStar_Syntax_Syntax.mk_Tm_app ens uu____12179
            res_t.FStar_Syntax_Syntax.pos in
        FStar_Syntax_Util.refine x uu____12176 in
      let norm t =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.Eager_unfolding;
          FStar_TypeChecker_Env.EraseUniverses] env t in
      let uu____12212 = FStar_Syntax_Util.is_tot_or_gtot_comp comp in
      if uu____12212
      then
        (FStar_Pervasives_Native.None, (FStar_Syntax_Util.comp_result comp))
      else
        (match comp.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.GTotal uu____12228 -> failwith "Impossible"
         | FStar_Syntax_Syntax.Total uu____12243 -> failwith "Impossible"
         | FStar_Syntax_Syntax.Comp ct ->
             let uu____12259 =
               (FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
                  FStar_Parser_Const.effect_Pure_lid)
                 ||
                 (FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
                    FStar_Parser_Const.effect_Ghost_lid) in
             if uu____12259
             then
               (match ct.FStar_Syntax_Syntax.effect_args with
                | (req, uu____12273)::(ens, uu____12275)::uu____12276 ->
                    let uu____12319 =
                      let uu____12322 = norm req in
                      FStar_Pervasives_Native.Some uu____12322 in
                    let uu____12323 =
                      let uu____12324 =
                        mk_post_type ct.FStar_Syntax_Syntax.result_typ ens in
                      FStar_All.pipe_left norm uu____12324 in
                    (uu____12319, uu____12323)
                | uu____12327 ->
                    let uu____12338 =
                      let uu____12343 =
                        let uu____12344 =
                          FStar_Syntax_Print.comp_to_string comp in
                        FStar_Util.format1
                          "Effect constructor is not fully applied; got %s"
                          uu____12344 in
                      (FStar_Errors.Fatal_EffectConstructorNotFullyApplied,
                        uu____12343) in
                    FStar_Errors.raise_error uu____12338
                      comp.FStar_Syntax_Syntax.pos)
             else
               (let ct1 = FStar_TypeChecker_Env.unfold_effect_abbrev env comp in
                match ct1.FStar_Syntax_Syntax.effect_args with
                | (wp, uu____12360)::uu____12361 ->
                    let uu____12388 =
                      let uu____12393 =
                        FStar_TypeChecker_Env.lookup_lid env
                          FStar_Parser_Const.as_requires in
                      FStar_All.pipe_left FStar_Pervasives_Native.fst
                        uu____12393 in
                    (match uu____12388 with
                     | (us_r, uu____12425) ->
                         let uu____12426 =
                           let uu____12431 =
                             FStar_TypeChecker_Env.lookup_lid env
                               FStar_Parser_Const.as_ensures in
                           FStar_All.pipe_left FStar_Pervasives_Native.fst
                             uu____12431 in
                         (match uu____12426 with
                          | (us_e, uu____12463) ->
                              let r =
                                (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos in
                              let as_req =
                                let uu____12466 =
                                  let uu____12467 =
                                    FStar_Ident.set_lid_range
                                      FStar_Parser_Const.as_requires r in
                                  FStar_Syntax_Syntax.fvar uu____12467
                                    FStar_Syntax_Syntax.delta_equational
                                    FStar_Pervasives_Native.None in
                                FStar_Syntax_Syntax.mk_Tm_uinst uu____12466
                                  us_r in
                              let as_ens =
                                let uu____12469 =
                                  let uu____12470 =
                                    FStar_Ident.set_lid_range
                                      FStar_Parser_Const.as_ensures r in
                                  FStar_Syntax_Syntax.fvar uu____12470
                                    FStar_Syntax_Syntax.delta_equational
                                    FStar_Pervasives_Native.None in
                                FStar_Syntax_Syntax.mk_Tm_uinst uu____12469
                                  us_e in
                              let req =
                                let uu____12472 =
                                  let uu____12473 =
                                    let uu____12484 =
                                      FStar_Syntax_Syntax.as_arg wp in
                                    [uu____12484] in
                                  ((ct1.FStar_Syntax_Syntax.result_typ),
                                    (FStar_Pervasives_Native.Some
                                       FStar_Syntax_Syntax.imp_tag))
                                    :: uu____12473 in
                                FStar_Syntax_Syntax.mk_Tm_app as_req
                                  uu____12472
                                  (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos in
                              let ens =
                                let uu____12522 =
                                  let uu____12523 =
                                    let uu____12534 =
                                      FStar_Syntax_Syntax.as_arg wp in
                                    [uu____12534] in
                                  ((ct1.FStar_Syntax_Syntax.result_typ),
                                    (FStar_Pervasives_Native.Some
                                       FStar_Syntax_Syntax.imp_tag))
                                    :: uu____12523 in
                                FStar_Syntax_Syntax.mk_Tm_app as_ens
                                  uu____12522
                                  (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos in
                              let uu____12571 =
                                let uu____12574 = norm req in
                                FStar_Pervasives_Native.Some uu____12574 in
                              let uu____12575 =
                                let uu____12576 =
                                  mk_post_type
                                    ct1.FStar_Syntax_Syntax.result_typ ens in
                                norm uu____12576 in
                              (uu____12571, uu____12575)))
                | uu____12579 -> failwith "Impossible"))
let (reify_body :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.steps ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env ->
    fun steps ->
      fun t ->
        let tm = FStar_Syntax_Util.mk_reify t in
        let tm' =
          FStar_TypeChecker_Normalize.normalize
            (FStar_List.append
               [FStar_TypeChecker_Env.Beta;
               FStar_TypeChecker_Env.Reify;
               FStar_TypeChecker_Env.Eager_unfolding;
               FStar_TypeChecker_Env.EraseUniverses;
               FStar_TypeChecker_Env.AllowUnboundUniverses;
               FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta]
               steps) env tm in
        (let uu____12616 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "SMTEncodingReify") in
         if uu____12616
         then
           let uu____12617 = FStar_Syntax_Print.term_to_string tm in
           let uu____12618 = FStar_Syntax_Print.term_to_string tm' in
           FStar_Util.print2 "Reified body %s \nto %s\n" uu____12617
             uu____12618
         else ());
        tm'
let (reify_body_with_arg :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.steps ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.arg -> FStar_Syntax_Syntax.term)
  =
  fun env ->
    fun steps ->
      fun head ->
        fun arg ->
          let tm =
            FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (head, [arg]))
              head.FStar_Syntax_Syntax.pos in
          let tm' =
            FStar_TypeChecker_Normalize.normalize
              (FStar_List.append
                 [FStar_TypeChecker_Env.Beta;
                 FStar_TypeChecker_Env.Reify;
                 FStar_TypeChecker_Env.Eager_unfolding;
                 FStar_TypeChecker_Env.EraseUniverses;
                 FStar_TypeChecker_Env.AllowUnboundUniverses;
                 FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta]
                 steps) env tm in
          (let uu____12673 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "SMTEncodingReify") in
           if uu____12673
           then
             let uu____12674 = FStar_Syntax_Print.term_to_string tm in
             let uu____12675 = FStar_Syntax_Print.term_to_string tm' in
             FStar_Util.print2 "Reified body %s \nto %s\n" uu____12674
               uu____12675
           else ());
          tm'
let (remove_reify : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t ->
    let uu____12682 =
      let uu____12683 =
        let uu____12684 = FStar_Syntax_Subst.compress t in
        uu____12684.FStar_Syntax_Syntax.n in
      match uu____12683 with
      | FStar_Syntax_Syntax.Tm_app uu____12687 -> false
      | uu____12704 -> true in
    if uu____12682
    then t
    else
      (let uu____12706 = FStar_Syntax_Util.head_and_args t in
       match uu____12706 with
       | (head, args) ->
           let uu____12749 =
             let uu____12750 =
               let uu____12751 = FStar_Syntax_Subst.compress head in
               uu____12751.FStar_Syntax_Syntax.n in
             match uu____12750 with
             | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify) ->
                 true
             | uu____12754 -> false in
           if uu____12749
           then
             (match args with
              | x::[] -> FStar_Pervasives_Native.fst x
              | uu____12784 ->
                  failwith
                    "Impossible : Reify applied to multiple arguments after normalization.")
           else t)
let (maybe_instantiate :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp ->
        (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.lcomp *
          FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun e ->
      fun corig ->
        if Prims.op_Negation env.FStar_TypeChecker_Env.instantiate_imp
        then (e, corig, FStar_TypeChecker_Env.trivial_guard)
        else
          (let uu____12824 =
             let uu____12825 =
               FStar_TypeChecker_Common.is_tot_or_gtot_lcomp corig in
             Prims.op_Negation uu____12825 in
           if uu____12824
           then (e, corig, FStar_TypeChecker_Env.trivial_guard)
           else
             (let t = corig.FStar_TypeChecker_Common.res_typ in
              (let uu____12835 =
                 FStar_TypeChecker_Env.debug env FStar_Options.High in
               if uu____12835
               then
                 let uu____12836 = FStar_Syntax_Print.term_to_string e in
                 let uu____12837 =
                   FStar_TypeChecker_Common.lcomp_to_string corig in
                 let uu____12838 =
                   let uu____12839 = FStar_TypeChecker_Env.expected_typ env in
                   FStar_Common.string_of_option
                     FStar_Syntax_Print.term_to_string uu____12839 in
                 FStar_Util.print3
                   "maybe_instantiate: starting check for (%s) of type (%s), expected type is %s\n"
                   uu____12836 uu____12837 uu____12838
               else ());
              (let unfolded_arrow_formals t1 =
                 let rec aux bs t2 =
                   let t3 = FStar_TypeChecker_Normalize.unfold_whnf env t2 in
                   let uu____12873 = FStar_Syntax_Util.arrow_formals t3 in
                   match uu____12873 with
                   | (bs', t4) ->
                       (match bs' with
                        | [] -> bs
                        | bs'1 -> aux (FStar_List.append bs bs'1) t4) in
                 aux [] t1 in
               let number_of_implicits t1 =
                 let formals = unfolded_arrow_formals t1 in
                 let n_implicits =
                   let uu____12907 =
                     FStar_All.pipe_right formals
                       (FStar_Util.prefix_until
                          (fun uu____12985 ->
                             match uu____12985 with
                             | (uu____12992, imp) ->
                                 (FStar_Option.isNone imp) ||
                                   (let uu____12999 =
                                      FStar_Syntax_Util.eq_aqual imp
                                        (FStar_Pervasives_Native.Some
                                           FStar_Syntax_Syntax.Equality) in
                                    uu____12999 = FStar_Syntax_Util.Equal))) in
                   match uu____12907 with
                   | FStar_Pervasives_Native.None ->
                       FStar_List.length formals
                   | FStar_Pervasives_Native.Some
                       (implicits, _first_explicit, _rest) ->
                       FStar_List.length implicits in
                 n_implicits in
               let inst_n_binders t1 =
                 let uu____13117 = FStar_TypeChecker_Env.expected_typ env in
                 match uu____13117 with
                 | FStar_Pervasives_Native.None ->
                     FStar_Pervasives_Native.None
                 | FStar_Pervasives_Native.Some expected_t ->
                     let n_expected = number_of_implicits expected_t in
                     let n_available = number_of_implicits t1 in
                     if n_available < n_expected
                     then
                       let uu____13127 =
                         let uu____13132 =
                           let uu____13133 =
                             FStar_Util.string_of_int n_expected in
                           let uu____13134 =
                             FStar_Syntax_Print.term_to_string e in
                           let uu____13135 =
                             FStar_Util.string_of_int n_available in
                           FStar_Util.format3
                             "Expected a term with %s implicit arguments, but %s has only %s"
                             uu____13133 uu____13134 uu____13135 in
                         (FStar_Errors.Fatal_MissingImplicitArguments,
                           uu____13132) in
                       let uu____13136 = FStar_TypeChecker_Env.get_range env in
                       FStar_Errors.raise_error uu____13127 uu____13136
                     else
                       FStar_Pervasives_Native.Some
                         (n_available - n_expected) in
               let decr_inst uu___7_13149 =
                 match uu___7_13149 with
                 | FStar_Pervasives_Native.None ->
                     FStar_Pervasives_Native.None
                 | FStar_Pervasives_Native.Some i ->
                     FStar_Pervasives_Native.Some (i - Prims.int_one) in
               let t1 = FStar_TypeChecker_Normalize.unfold_whnf env t in
               match t1.FStar_Syntax_Syntax.n with
               | FStar_Syntax_Syntax.Tm_arrow (bs, c) ->
                   let uu____13184 = FStar_Syntax_Subst.open_comp bs c in
                   (match uu____13184 with
                    | (bs1, c1) ->
                        let rec aux subst inst_n bs2 =
                          match (inst_n, bs2) with
                          | (FStar_Pervasives_Native.Some uu____13310,
                             uu____13299) when uu____13310 = Prims.int_zero
                              ->
                              ([], bs2, subst,
                                FStar_TypeChecker_Env.trivial_guard)
                          | (uu____13343,
                             (x, FStar_Pervasives_Native.Some
                              (FStar_Syntax_Syntax.Implicit uu____13345))::rest)
                              ->
                              let t2 =
                                FStar_Syntax_Subst.subst subst
                                  x.FStar_Syntax_Syntax.sort in
                              let uu____13376 =
                                new_implicit_var
                                  "Instantiation of implicit argument"
                                  e.FStar_Syntax_Syntax.pos env t2 in
                              (match uu____13376 with
                               | (v, uu____13416, g) ->
                                   ((let uu____13431 =
                                       FStar_TypeChecker_Env.debug env
                                         FStar_Options.High in
                                     if uu____13431
                                     then
                                       let uu____13432 =
                                         FStar_Syntax_Print.term_to_string v in
                                       FStar_Util.print1
                                         "maybe_instantiate: Instantiating implicit with %s\n"
                                         uu____13432
                                     else ());
                                    (let subst1 =
                                       (FStar_Syntax_Syntax.NT (x, v)) ::
                                       subst in
                                     let uu____13439 =
                                       aux subst1 (decr_inst inst_n) rest in
                                     match uu____13439 with
                                     | (args, bs3, subst2, g') ->
                                         let uu____13532 =
                                           FStar_TypeChecker_Env.conj_guard g
                                             g' in
                                         (((v,
                                             (FStar_Pervasives_Native.Some
                                                FStar_Syntax_Syntax.imp_tag))
                                           :: args), bs3, subst2,
                                           uu____13532))))
                          | (uu____13559,
                             (x, FStar_Pervasives_Native.Some
                              (FStar_Syntax_Syntax.Meta tac_or_attr))::rest)
                              ->
                              let t2 =
                                FStar_Syntax_Subst.subst subst
                                  x.FStar_Syntax_Syntax.sort in
                              let meta_t =
                                match tac_or_attr with
                                | FStar_Syntax_Syntax.Arg_qualifier_meta_tac
                                    tau ->
                                    let uu____13596 =
                                      let uu____13603 = FStar_Dyn.mkdyn env in
                                      (uu____13603, tau) in
                                    FStar_Syntax_Syntax.Ctx_uvar_meta_tac
                                      uu____13596
                                | FStar_Syntax_Syntax.Arg_qualifier_meta_attr
                                    attr ->
                                    FStar_Syntax_Syntax.Ctx_uvar_meta_attr
                                      attr in
                              let uu____13609 =
                                FStar_TypeChecker_Env.new_implicit_var_aux
                                  "Instantiation of meta argument"
                                  e.FStar_Syntax_Syntax.pos env t2
                                  FStar_Syntax_Syntax.Strict
                                  (FStar_Pervasives_Native.Some meta_t) in
                              (match uu____13609 with
                               | (v, uu____13649, g) ->
                                   ((let uu____13664 =
                                       FStar_TypeChecker_Env.debug env
                                         FStar_Options.High in
                                     if uu____13664
                                     then
                                       let uu____13665 =
                                         FStar_Syntax_Print.term_to_string v in
                                       FStar_Util.print1
                                         "maybe_instantiate: Instantiating meta argument with %s\n"
                                         uu____13665
                                     else ());
                                    (let subst1 =
                                       (FStar_Syntax_Syntax.NT (x, v)) ::
                                       subst in
                                     let uu____13672 =
                                       aux subst1 (decr_inst inst_n) rest in
                                     match uu____13672 with
                                     | (args, bs3, subst2, g') ->
                                         let uu____13765 =
                                           FStar_TypeChecker_Env.conj_guard g
                                             g' in
                                         (((v,
                                             (FStar_Pervasives_Native.Some
                                                FStar_Syntax_Syntax.imp_tag))
                                           :: args), bs3, subst2,
                                           uu____13765))))
                          | (uu____13792, bs3) ->
                              ([], bs3, subst,
                                FStar_TypeChecker_Env.trivial_guard) in
                        let uu____13838 =
                          let uu____13865 = inst_n_binders t1 in
                          aux [] uu____13865 bs1 in
                        (match uu____13838 with
                         | (args, bs2, subst, guard) ->
                             (match (args, bs2) with
                              | ([], uu____13936) -> (e, corig, guard)
                              | uu____13967 ->
                                  let c2 =
                                    match bs2 with
                                    | [] -> c1
                                    | uu____13995 ->
                                        let uu____14004 =
                                          FStar_Syntax_Util.arrow bs2 c1 in
                                        FStar_Syntax_Syntax.mk_Total
                                          uu____14004 in
                                  let c3 =
                                    FStar_Syntax_Subst.subst_comp subst c2 in
                                  let e1 =
                                    FStar_Syntax_Syntax.mk_Tm_app e args
                                      e.FStar_Syntax_Syntax.pos in
                                  let uu____14007 =
                                    FStar_TypeChecker_Common.lcomp_of_comp c3 in
                                  (e1, uu____14007, guard))))
               | uu____14008 ->
                   (e, corig, FStar_TypeChecker_Env.trivial_guard))))
let (string_of_univs :
  FStar_Syntax_Syntax.universe_uvar FStar_Util.set -> Prims.string) =
  fun univs ->
    let uu____14018 =
      let uu____14021 = FStar_Util.set_elements univs in
      FStar_All.pipe_right uu____14021
        (FStar_List.map
           (fun u ->
              let uu____14031 = FStar_Syntax_Unionfind.univ_uvar_id u in
              FStar_All.pipe_right uu____14031 FStar_Util.string_of_int)) in
    FStar_All.pipe_right uu____14018 (FStar_String.concat ", ")
let (gen_univs :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe_uvar FStar_Util.set ->
      FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun env ->
    fun x ->
      let uu____14052 = FStar_Util.set_is_empty x in
      if uu____14052
      then []
      else
        (let s =
           let uu____14069 =
             let uu____14072 = FStar_TypeChecker_Env.univ_vars env in
             FStar_Util.set_difference x uu____14072 in
           FStar_All.pipe_right uu____14069 FStar_Util.set_elements in
         (let uu____14090 =
            FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
              (FStar_Options.Other "Gen") in
          if uu____14090
          then
            let uu____14091 =
              let uu____14092 = FStar_TypeChecker_Env.univ_vars env in
              string_of_univs uu____14092 in
            FStar_Util.print1 "univ_vars in env: %s\n" uu____14091
          else ());
         (let r =
            let uu____14099 = FStar_TypeChecker_Env.get_range env in
            FStar_Pervasives_Native.Some uu____14099 in
          let u_names =
            FStar_All.pipe_right s
              (FStar_List.map
                 (fun u ->
                    let u_name = FStar_Syntax_Syntax.new_univ_name r in
                    (let uu____14144 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "Gen") in
                     if uu____14144
                     then
                       let uu____14145 =
                         let uu____14146 =
                           FStar_Syntax_Unionfind.univ_uvar_id u in
                         FStar_All.pipe_left FStar_Util.string_of_int
                           uu____14146 in
                       let uu____14147 =
                         FStar_Syntax_Print.univ_to_string
                           (FStar_Syntax_Syntax.U_unif u) in
                       let uu____14148 =
                         FStar_Syntax_Print.univ_to_string
                           (FStar_Syntax_Syntax.U_name u_name) in
                       FStar_Util.print3 "Setting ?%s (%s) to %s\n"
                         uu____14145 uu____14147 uu____14148
                     else ());
                    FStar_Syntax_Unionfind.univ_change u
                      (FStar_Syntax_Syntax.U_name u_name);
                    u_name)) in
          u_names))
let (gather_free_univnames :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun env ->
    fun t ->
      let ctx_univnames = FStar_TypeChecker_Env.univnames env in
      let tm_univnames = FStar_Syntax_Free.univnames t in
      let univnames =
        let uu____14174 =
          FStar_Util.set_difference tm_univnames ctx_univnames in
        FStar_All.pipe_right uu____14174 FStar_Util.set_elements in
      univnames
let (check_universe_generalization :
  FStar_Syntax_Syntax.univ_name Prims.list ->
    FStar_Syntax_Syntax.univ_name Prims.list ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun explicit_univ_names ->
    fun generalized_univ_names ->
      fun t ->
        match (explicit_univ_names, generalized_univ_names) with
        | ([], uu____14212) -> generalized_univ_names
        | (uu____14219, []) -> explicit_univ_names
        | uu____14226 ->
            let uu____14235 =
              let uu____14240 =
                let uu____14241 = FStar_Syntax_Print.term_to_string t in
                Prims.op_Hat
                  "Generalized universe in a term containing explicit universe annotation : "
                  uu____14241 in
              (FStar_Errors.Fatal_UnexpectedGeneralizedUniverse, uu____14240) in
            FStar_Errors.raise_error uu____14235 t.FStar_Syntax_Syntax.pos
let (generalize_universes :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.tscheme)
  =
  fun env ->
    fun t0 ->
      let t =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.NoFullNorm;
          FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.DoNotUnfoldPureLets] env t0 in
      let univnames = gather_free_univnames env t in
      (let uu____14259 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "Gen") in
       if uu____14259
       then
         let uu____14260 = FStar_Syntax_Print.term_to_string t in
         let uu____14261 = FStar_Syntax_Print.univ_names_to_string univnames in
         FStar_Util.print2
           "generalizing universes in the term (post norm): %s with univnames: %s\n"
           uu____14260 uu____14261
       else ());
      (let univs = FStar_Syntax_Free.univs t in
       (let uu____14267 =
          FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
            (FStar_Options.Other "Gen") in
        if uu____14267
        then
          let uu____14268 = string_of_univs univs in
          FStar_Util.print1 "univs to gen : %s\n" uu____14268
        else ());
       (let gen = gen_univs env univs in
        (let uu____14274 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Gen") in
         if uu____14274
         then
           let uu____14275 = FStar_Syntax_Print.term_to_string t in
           let uu____14276 = FStar_Syntax_Print.univ_names_to_string gen in
           FStar_Util.print2 "After generalization, t: %s and univs: %s\n"
             uu____14275 uu____14276
         else ());
        (let univs1 = check_universe_generalization univnames gen t0 in
         let t1 = FStar_TypeChecker_Normalize.reduce_uvar_solutions env t in
         let ts = FStar_Syntax_Subst.close_univ_vars univs1 t1 in
         (univs1, ts))))
let (gen :
  FStar_TypeChecker_Env.env ->
    Prims.bool ->
      (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.term *
        FStar_Syntax_Syntax.comp) Prims.list ->
        (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.univ_name
          Prims.list * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.comp *
          FStar_Syntax_Syntax.binder Prims.list) Prims.list
          FStar_Pervasives_Native.option)
  =
  fun env ->
    fun is_rec ->
      fun lecs ->
        let uu____14354 =
          let uu____14355 =
            FStar_Util.for_all
              (fun uu____14368 ->
                 match uu____14368 with
                 | (uu____14377, uu____14378, c) ->
                     FStar_Syntax_Util.is_pure_or_ghost_comp c) lecs in
          FStar_All.pipe_left Prims.op_Negation uu____14355 in
        if uu____14354
        then FStar_Pervasives_Native.None
        else
          (let norm c =
             (let uu____14426 =
                FStar_TypeChecker_Env.debug env FStar_Options.Medium in
              if uu____14426
              then
                let uu____14427 = FStar_Syntax_Print.comp_to_string c in
                FStar_Util.print1 "Normalizing before generalizing:\n\t %s\n"
                  uu____14427
              else ());
             (let c1 =
                FStar_TypeChecker_Normalize.normalize_comp
                  [FStar_TypeChecker_Env.Beta;
                  FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta;
                  FStar_TypeChecker_Env.NoFullNorm;
                  FStar_TypeChecker_Env.DoNotUnfoldPureLets] env c in
              (let uu____14431 =
                 FStar_TypeChecker_Env.debug env FStar_Options.Medium in
               if uu____14431
               then
                 let uu____14432 = FStar_Syntax_Print.comp_to_string c1 in
                 FStar_Util.print1 "Normalized to:\n\t %s\n" uu____14432
               else ());
              c1) in
           let env_uvars = FStar_TypeChecker_Env.uvars_in_env env in
           let gen_uvars uvs =
             let uu____14447 = FStar_Util.set_difference uvs env_uvars in
             FStar_All.pipe_right uu____14447 FStar_Util.set_elements in
           let univs_and_uvars_of_lec uu____14481 =
             match uu____14481 with
             | (lbname, e, c) ->
                 let c1 = norm c in
                 let t = FStar_Syntax_Util.comp_result c1 in
                 let univs = FStar_Syntax_Free.univs t in
                 let uvt = FStar_Syntax_Free.uvars t in
                 ((let uu____14518 =
                     FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                       (FStar_Options.Other "Gen") in
                   if uu____14518
                   then
                     let uu____14519 =
                       let uu____14520 =
                         let uu____14523 = FStar_Util.set_elements univs in
                         FStar_All.pipe_right uu____14523
                           (FStar_List.map
                              (fun u ->
                                 FStar_Syntax_Print.univ_to_string
                                   (FStar_Syntax_Syntax.U_unif u))) in
                       FStar_All.pipe_right uu____14520
                         (FStar_String.concat ", ") in
                     let uu____14574 =
                       let uu____14575 =
                         let uu____14578 = FStar_Util.set_elements uvt in
                         FStar_All.pipe_right uu____14578
                           (FStar_List.map
                              (fun u ->
                                 let uu____14589 =
                                   FStar_Syntax_Print.uvar_to_string
                                     u.FStar_Syntax_Syntax.ctx_uvar_head in
                                 let uu____14590 =
                                   FStar_Syntax_Print.term_to_string
                                     u.FStar_Syntax_Syntax.ctx_uvar_typ in
                                 FStar_Util.format2 "(%s : %s)" uu____14589
                                   uu____14590)) in
                       FStar_All.pipe_right uu____14575
                         (FStar_String.concat ", ") in
                     FStar_Util.print2
                       "^^^^\n\tFree univs = %s\n\tFree uvt=%s\n" uu____14519
                       uu____14574
                   else ());
                  (let univs1 =
                     let uu____14597 = FStar_Util.set_elements uvt in
                     FStar_List.fold_left
                       (fun univs1 ->
                          fun uv ->
                            let uu____14609 =
                              FStar_Syntax_Free.univs
                                uv.FStar_Syntax_Syntax.ctx_uvar_typ in
                            FStar_Util.set_union univs1 uu____14609) univs
                       uu____14597 in
                   let uvs = gen_uvars uvt in
                   (let uu____14616 =
                      FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                        (FStar_Options.Other "Gen") in
                    if uu____14616
                    then
                      let uu____14617 =
                        let uu____14618 =
                          let uu____14621 = FStar_Util.set_elements univs1 in
                          FStar_All.pipe_right uu____14621
                            (FStar_List.map
                               (fun u ->
                                  FStar_Syntax_Print.univ_to_string
                                    (FStar_Syntax_Syntax.U_unif u))) in
                        FStar_All.pipe_right uu____14618
                          (FStar_String.concat ", ") in
                      let uu____14672 =
                        let uu____14673 =
                          FStar_All.pipe_right uvs
                            (FStar_List.map
                               (fun u ->
                                  let uu____14684 =
                                    FStar_Syntax_Print.uvar_to_string
                                      u.FStar_Syntax_Syntax.ctx_uvar_head in
                                  let uu____14685 =
                                    FStar_TypeChecker_Normalize.term_to_string
                                      env u.FStar_Syntax_Syntax.ctx_uvar_typ in
                                  FStar_Util.format2 "(%s : %s)" uu____14684
                                    uu____14685)) in
                        FStar_All.pipe_right uu____14673
                          (FStar_String.concat ", ") in
                      FStar_Util.print2
                        "^^^^\n\tFree univs = %s\n\tgen_uvars =%s"
                        uu____14617 uu____14672
                    else ());
                   (univs1, uvs, (lbname, e, c1)))) in
           let uu____14699 =
             let uu____14716 = FStar_List.hd lecs in
             univs_and_uvars_of_lec uu____14716 in
           match uu____14699 with
           | (univs, uvs, lec_hd) ->
               let force_univs_eq lec2 u1 u2 =
                 let uu____14806 =
                   (FStar_Util.set_is_subset_of u1 u2) &&
                     (FStar_Util.set_is_subset_of u2 u1) in
                 if uu____14806
                 then ()
                 else
                   (let uu____14808 = lec_hd in
                    match uu____14808 with
                    | (lb1, uu____14816, uu____14817) ->
                        let uu____14818 = lec2 in
                        (match uu____14818 with
                         | (lb2, uu____14826, uu____14827) ->
                             let msg =
                               let uu____14829 =
                                 FStar_Syntax_Print.lbname_to_string lb1 in
                               let uu____14830 =
                                 FStar_Syntax_Print.lbname_to_string lb2 in
                               FStar_Util.format2
                                 "Generalizing the types of these mutually recursive definitions requires an incompatible set of universes for %s and %s"
                                 uu____14829 uu____14830 in
                             let uu____14831 =
                               FStar_TypeChecker_Env.get_range env in
                             FStar_Errors.raise_error
                               (FStar_Errors.Fatal_IncompatibleSetOfUniverse,
                                 msg) uu____14831)) in
               let force_uvars_eq lec2 u1 u2 =
                 let uvars_subseteq u11 u21 =
                   FStar_All.pipe_right u11
                     (FStar_Util.for_all
                        (fun u ->
                           FStar_All.pipe_right u21
                             (FStar_Util.for_some
                                (fun u' ->
                                   FStar_Syntax_Unionfind.equiv
                                     u.FStar_Syntax_Syntax.ctx_uvar_head
                                     u'.FStar_Syntax_Syntax.ctx_uvar_head)))) in
                 let uu____14895 =
                   (uvars_subseteq u1 u2) && (uvars_subseteq u2 u1) in
                 if uu____14895
                 then ()
                 else
                   (let uu____14897 = lec_hd in
                    match uu____14897 with
                    | (lb1, uu____14905, uu____14906) ->
                        let uu____14907 = lec2 in
                        (match uu____14907 with
                         | (lb2, uu____14915, uu____14916) ->
                             let msg =
                               let uu____14918 =
                                 FStar_Syntax_Print.lbname_to_string lb1 in
                               let uu____14919 =
                                 FStar_Syntax_Print.lbname_to_string lb2 in
                               FStar_Util.format2
                                 "Generalizing the types of these mutually recursive definitions requires an incompatible number of types for %s and %s"
                                 uu____14918 uu____14919 in
                             let uu____14920 =
                               FStar_TypeChecker_Env.get_range env in
                             FStar_Errors.raise_error
                               (FStar_Errors.Fatal_IncompatibleNumberOfTypes,
                                 msg) uu____14920)) in
               let lecs1 =
                 let uu____14930 = FStar_List.tl lecs in
                 FStar_List.fold_right
                   (fun this_lec ->
                      fun lecs1 ->
                        let uu____14983 = univs_and_uvars_of_lec this_lec in
                        match uu____14983 with
                        | (this_univs, this_uvs, this_lec1) ->
                            (force_univs_eq this_lec1 univs this_univs;
                             force_uvars_eq this_lec1 uvs this_uvs;
                             this_lec1
                             ::
                             lecs1)) uu____14930 [] in
               let lecs2 = lec_hd :: lecs1 in
               let gen_types uvs1 =
                 let fail rng k =
                   let uu____15093 = lec_hd in
                   match uu____15093 with
                   | (lbname, e, c) ->
                       let uu____15103 =
                         let uu____15108 =
                           let uu____15109 =
                             FStar_Syntax_Print.term_to_string k in
                           let uu____15110 =
                             FStar_Syntax_Print.lbname_to_string lbname in
                           let uu____15111 =
                             FStar_Syntax_Print.term_to_string
                               (FStar_Syntax_Util.comp_result c) in
                           FStar_Util.format3
                             "Failed to resolve implicit argument of type '%s' in the type of %s (%s)"
                             uu____15109 uu____15110 uu____15111 in
                         (FStar_Errors.Fatal_FailToResolveImplicitArgument,
                           uu____15108) in
                       FStar_Errors.raise_error uu____15103 rng in
                 FStar_All.pipe_right uvs1
                   (FStar_List.map
                      (fun u ->
                         let uu____15130 =
                           FStar_Syntax_Unionfind.find
                             u.FStar_Syntax_Syntax.ctx_uvar_head in
                         match uu____15130 with
                         | FStar_Pervasives_Native.Some uu____15139 ->
                             failwith
                               "Unexpected instantiation of mutually recursive uvar"
                         | uu____15146 ->
                             let k =
                               FStar_TypeChecker_Normalize.normalize
                                 [FStar_TypeChecker_Env.Beta;
                                 FStar_TypeChecker_Env.Exclude
                                   FStar_TypeChecker_Env.Zeta] env
                                 u.FStar_Syntax_Syntax.ctx_uvar_typ in
                             let uu____15150 =
                               FStar_Syntax_Util.arrow_formals k in
                             (match uu____15150 with
                              | (bs, kres) ->
                                  ((let uu____15170 =
                                      let uu____15171 =
                                        let uu____15174 =
                                          FStar_TypeChecker_Normalize.unfold_whnf
                                            env kres in
                                        FStar_Syntax_Util.unrefine
                                          uu____15174 in
                                      uu____15171.FStar_Syntax_Syntax.n in
                                    match uu____15170 with
                                    | FStar_Syntax_Syntax.Tm_type uu____15175
                                        ->
                                        let free =
                                          FStar_Syntax_Free.names kres in
                                        let uu____15179 =
                                          let uu____15180 =
                                            FStar_Util.set_is_empty free in
                                          Prims.op_Negation uu____15180 in
                                        if uu____15179
                                        then
                                          fail
                                            u.FStar_Syntax_Syntax.ctx_uvar_range
                                            kres
                                        else ()
                                    | uu____15182 ->
                                        fail
                                          u.FStar_Syntax_Syntax.ctx_uvar_range
                                          kres);
                                   (let a =
                                      let uu____15184 =
                                        let uu____15187 =
                                          FStar_TypeChecker_Env.get_range env in
                                        FStar_All.pipe_left
                                          (fun uu____15190 ->
                                             FStar_Pervasives_Native.Some
                                               uu____15190) uu____15187 in
                                      FStar_Syntax_Syntax.new_bv uu____15184
                                        kres in
                                    let t =
                                      match bs with
                                      | [] ->
                                          FStar_Syntax_Syntax.bv_to_name a
                                      | uu____15198 ->
                                          let uu____15199 =
                                            FStar_Syntax_Syntax.bv_to_name a in
                                          FStar_Syntax_Util.abs bs
                                            uu____15199
                                            (FStar_Pervasives_Native.Some
                                               (FStar_Syntax_Util.residual_tot
                                                  kres)) in
                                    FStar_Syntax_Util.set_uvar
                                      u.FStar_Syntax_Syntax.ctx_uvar_head t;
                                    (a,
                                      (FStar_Pervasives_Native.Some
                                         FStar_Syntax_Syntax.imp_tag))))))) in
               let gen_univs1 = gen_univs env univs in
               let gen_tvars = gen_types uvs in
               let ecs =
                 FStar_All.pipe_right lecs2
                   (FStar_List.map
                      (fun uu____15302 ->
                         match uu____15302 with
                         | (lbname, e, c) ->
                             let uu____15348 =
                               match (gen_tvars, gen_univs1) with
                               | ([], []) -> (e, c, [])
                               | uu____15409 ->
                                   let uu____15422 = (e, c) in
                                   (match uu____15422 with
                                    | (e0, c0) ->
                                        let c1 =
                                          FStar_TypeChecker_Normalize.normalize_comp
                                            [FStar_TypeChecker_Env.Beta;
                                            FStar_TypeChecker_Env.DoNotUnfoldPureLets;
                                            FStar_TypeChecker_Env.CompressUvars;
                                            FStar_TypeChecker_Env.NoFullNorm;
                                            FStar_TypeChecker_Env.Exclude
                                              FStar_TypeChecker_Env.Zeta] env
                                            c in
                                        let e1 =
                                          FStar_TypeChecker_Normalize.reduce_uvar_solutions
                                            env e in
                                        let e2 =
                                          if is_rec
                                          then
                                            let tvar_args =
                                              FStar_List.map
                                                (fun uu____15461 ->
                                                   match uu____15461 with
                                                   | (x, uu____15467) ->
                                                       let uu____15468 =
                                                         FStar_Syntax_Syntax.bv_to_name
                                                           x in
                                                       FStar_Syntax_Syntax.iarg
                                                         uu____15468)
                                                gen_tvars in
                                            let instantiate_lbname_with_app
                                              tm fv =
                                              let uu____15486 =
                                                let uu____15487 =
                                                  FStar_Util.right lbname in
                                                FStar_Syntax_Syntax.fv_eq fv
                                                  uu____15487 in
                                              if uu____15486
                                              then
                                                FStar_Syntax_Syntax.mk_Tm_app
                                                  tm tvar_args
                                                  tm.FStar_Syntax_Syntax.pos
                                              else tm in
                                            FStar_Syntax_InstFV.inst
                                              instantiate_lbname_with_app e1
                                          else e1 in
                                        let t =
                                          let uu____15493 =
                                            let uu____15494 =
                                              FStar_Syntax_Subst.compress
                                                (FStar_Syntax_Util.comp_result
                                                   c1) in
                                            uu____15494.FStar_Syntax_Syntax.n in
                                          match uu____15493 with
                                          | FStar_Syntax_Syntax.Tm_arrow
                                              (bs, cod) ->
                                              let uu____15519 =
                                                FStar_Syntax_Subst.open_comp
                                                  bs cod in
                                              (match uu____15519 with
                                               | (bs1, cod1) ->
                                                   FStar_Syntax_Util.arrow
                                                     (FStar_List.append
                                                        gen_tvars bs1) cod1)
                                          | uu____15530 ->
                                              FStar_Syntax_Util.arrow
                                                gen_tvars c1 in
                                        let e' =
                                          FStar_Syntax_Util.abs gen_tvars e2
                                            (FStar_Pervasives_Native.Some
                                               (FStar_Syntax_Util.residual_comp_of_comp
                                                  c1)) in
                                        let uu____15534 =
                                          FStar_Syntax_Syntax.mk_Total t in
                                        (e', uu____15534, gen_tvars)) in
                             (match uu____15348 with
                              | (e1, c1, gvs) ->
                                  (lbname, gen_univs1, e1, c1, gvs)))) in
               FStar_Pervasives_Native.Some ecs)
let (generalize' :
  FStar_TypeChecker_Env.env ->
    Prims.bool ->
      (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.term *
        FStar_Syntax_Syntax.comp) Prims.list ->
        (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.univ_names *
          FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.comp *
          FStar_Syntax_Syntax.binder Prims.list) Prims.list)
  =
  fun env ->
    fun is_rec ->
      fun lecs ->
        (let uu____15678 = FStar_TypeChecker_Env.debug env FStar_Options.Low in
         if uu____15678
         then
           let uu____15679 =
             let uu____15680 =
               FStar_List.map
                 (fun uu____15693 ->
                    match uu____15693 with
                    | (lb, uu____15701, uu____15702) ->
                        FStar_Syntax_Print.lbname_to_string lb) lecs in
             FStar_All.pipe_right uu____15680 (FStar_String.concat ", ") in
           FStar_Util.print1 "Generalizing: %s\n" uu____15679
         else ());
        (let univnames_lecs =
           FStar_List.map
             (fun uu____15723 ->
                match uu____15723 with
                | (l, t, c) -> gather_free_univnames env t) lecs in
         let generalized_lecs =
           let uu____15752 = gen env is_rec lecs in
           match uu____15752 with
           | FStar_Pervasives_Native.None ->
               FStar_All.pipe_right lecs
                 (FStar_List.map
                    (fun uu____15851 ->
                       match uu____15851 with
                       | (l, t, c) -> (l, [], t, c, [])))
           | FStar_Pervasives_Native.Some luecs ->
               ((let uu____15913 =
                   FStar_TypeChecker_Env.debug env FStar_Options.Medium in
                 if uu____15913
                 then
                   FStar_All.pipe_right luecs
                     (FStar_List.iter
                        (fun uu____15959 ->
                           match uu____15959 with
                           | (l, us, e, c, gvs) ->
                               let uu____15993 =
                                 FStar_Range.string_of_range
                                   e.FStar_Syntax_Syntax.pos in
                               let uu____15994 =
                                 FStar_Syntax_Print.lbname_to_string l in
                               let uu____15995 =
                                 FStar_Syntax_Print.term_to_string
                                   (FStar_Syntax_Util.comp_result c) in
                               let uu____15996 =
                                 FStar_Syntax_Print.term_to_string e in
                               let uu____15997 =
                                 FStar_Syntax_Print.binders_to_string ", "
                                   gvs in
                               FStar_Util.print5
                                 "(%s) Generalized %s at type %s\n%s\nVars = (%s)\n"
                                 uu____15993 uu____15994 uu____15995
                                 uu____15996 uu____15997))
                 else ());
                luecs) in
         FStar_List.map2
           (fun univnames ->
              fun uu____16038 ->
                match uu____16038 with
                | (l, generalized_univs, t, c, gvs) ->
                    let uu____16082 =
                      check_universe_generalization univnames
                        generalized_univs t in
                    (l, uu____16082, t, c, gvs)) univnames_lecs
           generalized_lecs)
let (generalize :
  FStar_TypeChecker_Env.env ->
    Prims.bool ->
      (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.term *
        FStar_Syntax_Syntax.comp) Prims.list ->
        (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.univ_names *
          FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.comp *
          FStar_Syntax_Syntax.binder Prims.list) Prims.list)
  =
  fun env ->
    fun is_rec ->
      fun lecs ->
        let uu____16134 =
          let uu____16137 =
            let uu____16138 = FStar_TypeChecker_Env.current_module env in
            FStar_Ident.string_of_lid uu____16138 in
          FStar_Pervasives_Native.Some uu____16137 in
        FStar_Profiling.profile
          (fun uu____16154 -> generalize' env is_rec lecs) uu____16134
          "FStar.TypeChecker.Util.generalize"
let (check_has_type :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.lcomp *
            FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun e ->
      fun lc ->
        fun t2 ->
          let env1 =
            FStar_TypeChecker_Env.set_range env e.FStar_Syntax_Syntax.pos in
          let check env2 t1 t21 =
            if env2.FStar_TypeChecker_Env.use_eq_strict
            then
              let uu____16208 =
                FStar_TypeChecker_Rel.teq_nosmt_force env2 t1 t21 in
              (if uu____16208
               then
                 FStar_All.pipe_right FStar_TypeChecker_Env.trivial_guard
                   (fun uu____16213 ->
                      FStar_Pervasives_Native.Some uu____16213)
               else FStar_Pervasives_Native.None)
            else
              if env2.FStar_TypeChecker_Env.use_eq
              then FStar_TypeChecker_Rel.try_teq true env2 t1 t21
              else
                (let uu____16218 =
                   FStar_TypeChecker_Rel.get_subtyping_predicate env2 t1 t21 in
                 match uu____16218 with
                 | FStar_Pervasives_Native.None ->
                     FStar_Pervasives_Native.None
                 | FStar_Pervasives_Native.Some f ->
                     let uu____16224 = FStar_TypeChecker_Env.apply_guard f e in
                     FStar_All.pipe_left
                       (fun uu____16227 ->
                          FStar_Pervasives_Native.Some uu____16227)
                       uu____16224) in
          let uu____16228 = maybe_coerce_lc env1 e lc t2 in
          match uu____16228 with
          | (e1, lc1, g_c) ->
              let uu____16244 =
                check env1 lc1.FStar_TypeChecker_Common.res_typ t2 in
              (match uu____16244 with
               | FStar_Pervasives_Native.None ->
                   let uu____16253 =
                     FStar_TypeChecker_Err.expected_expression_of_type env1
                       t2 e1 lc1.FStar_TypeChecker_Common.res_typ in
                   let uu____16258 = FStar_TypeChecker_Env.get_range env1 in
                   FStar_Errors.raise_error uu____16253 uu____16258
               | FStar_Pervasives_Native.Some g ->
                   ((let uu____16267 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env1)
                         (FStar_Options.Other "Rel") in
                     if uu____16267
                     then
                       let uu____16268 =
                         FStar_TypeChecker_Rel.guard_to_string env1 g in
                       FStar_All.pipe_left
                         (FStar_Util.print1 "Applied guard is %s\n")
                         uu____16268
                     else ());
                    (let uu____16270 = FStar_TypeChecker_Env.conj_guard g g_c in
                     (e1, lc1, uu____16270))))
let (check_top_level :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.guard_t ->
      FStar_TypeChecker_Common.lcomp ->
        (Prims.bool * FStar_Syntax_Syntax.comp))
  =
  fun env ->
    fun g ->
      fun lc ->
        (let uu____16295 =
           FStar_TypeChecker_Env.debug env FStar_Options.Medium in
         if uu____16295
         then
           let uu____16296 = FStar_TypeChecker_Common.lcomp_to_string lc in
           FStar_Util.print1 "check_top_level, lc = %s\n" uu____16296
         else ());
        (let discharge g1 =
           FStar_TypeChecker_Rel.force_trivial_guard env g1;
           FStar_TypeChecker_Common.is_pure_lcomp lc in
         let g1 = FStar_TypeChecker_Rel.solve_deferred_constraints env g in
         let uu____16306 = FStar_TypeChecker_Common.lcomp_comp lc in
         match uu____16306 with
         | (c, g_c) ->
             let uu____16317 = FStar_TypeChecker_Common.is_total_lcomp lc in
             if uu____16317
             then
               let uu____16322 =
                 let uu____16323 = FStar_TypeChecker_Env.conj_guard g1 g_c in
                 discharge uu____16323 in
               (uu____16322, c)
             else
               (let steps =
                  [FStar_TypeChecker_Env.Beta;
                  FStar_TypeChecker_Env.NoFullNorm;
                  FStar_TypeChecker_Env.DoNotUnfoldPureLets] in
                let c1 =
                  let uu____16329 =
                    let uu____16330 =
                      FStar_TypeChecker_Env.unfold_effect_abbrev env c in
                    FStar_All.pipe_right uu____16330
                      FStar_Syntax_Syntax.mk_Comp in
                  FStar_All.pipe_right uu____16329
                    (FStar_TypeChecker_Normalize.normalize_comp steps env) in
                let uu____16331 = check_trivial_precondition env c1 in
                match uu____16331 with
                | (ct, vc, g_pre) ->
                    ((let uu____16346 =
                        FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                          (FStar_Options.Other "Simplification") in
                      if uu____16346
                      then
                        let uu____16347 =
                          FStar_Syntax_Print.term_to_string vc in
                        FStar_Util.print1 "top-level VC: %s\n" uu____16347
                      else ());
                     (let uu____16349 =
                        let uu____16350 =
                          let uu____16351 =
                            FStar_TypeChecker_Env.conj_guard g_c g_pre in
                          FStar_TypeChecker_Env.conj_guard g1 uu____16351 in
                        discharge uu____16350 in
                      let uu____16352 =
                        FStar_All.pipe_right ct FStar_Syntax_Syntax.mk_Comp in
                      (uu____16349, uu____16352)))))
let (short_circuit :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.args -> FStar_TypeChecker_Common.guard_formula)
  =
  fun head ->
    fun seen_args ->
      let short_bin_op f uu___8_16384 =
        match uu___8_16384 with
        | [] -> FStar_TypeChecker_Common.Trivial
        | (fst, uu____16394)::[] -> f fst
        | uu____16419 -> failwith "Unexpexted args to binary operator" in
      let op_and_e e =
        let uu____16430 = FStar_Syntax_Util.b2t e in
        FStar_All.pipe_right uu____16430
          (fun uu____16431 -> FStar_TypeChecker_Common.NonTrivial uu____16431) in
      let op_or_e e =
        let uu____16442 =
          let uu____16443 = FStar_Syntax_Util.b2t e in
          FStar_Syntax_Util.mk_neg uu____16443 in
        FStar_All.pipe_right uu____16442
          (fun uu____16446 -> FStar_TypeChecker_Common.NonTrivial uu____16446) in
      let op_and_t t =
        FStar_All.pipe_right t
          (fun uu____16453 -> FStar_TypeChecker_Common.NonTrivial uu____16453) in
      let op_or_t t =
        let uu____16464 = FStar_All.pipe_right t FStar_Syntax_Util.mk_neg in
        FStar_All.pipe_right uu____16464
          (fun uu____16467 -> FStar_TypeChecker_Common.NonTrivial uu____16467) in
      let op_imp_t t =
        FStar_All.pipe_right t
          (fun uu____16474 -> FStar_TypeChecker_Common.NonTrivial uu____16474) in
      let short_op_ite uu___9_16480 =
        match uu___9_16480 with
        | [] -> FStar_TypeChecker_Common.Trivial
        | (guard, uu____16490)::[] ->
            FStar_TypeChecker_Common.NonTrivial guard
        | _then::(guard, uu____16517)::[] ->
            let uu____16558 = FStar_Syntax_Util.mk_neg guard in
            FStar_All.pipe_right uu____16558
              (fun uu____16559 ->
                 FStar_TypeChecker_Common.NonTrivial uu____16559)
        | uu____16560 -> failwith "Unexpected args to ITE" in
      let table =
        let uu____16571 =
          let uu____16579 = short_bin_op op_and_e in
          (FStar_Parser_Const.op_And, uu____16579) in
        let uu____16587 =
          let uu____16597 =
            let uu____16605 = short_bin_op op_or_e in
            (FStar_Parser_Const.op_Or, uu____16605) in
          let uu____16613 =
            let uu____16623 =
              let uu____16631 = short_bin_op op_and_t in
              (FStar_Parser_Const.and_lid, uu____16631) in
            let uu____16639 =
              let uu____16649 =
                let uu____16657 = short_bin_op op_or_t in
                (FStar_Parser_Const.or_lid, uu____16657) in
              let uu____16665 =
                let uu____16675 =
                  let uu____16683 = short_bin_op op_imp_t in
                  (FStar_Parser_Const.imp_lid, uu____16683) in
                [uu____16675; (FStar_Parser_Const.ite_lid, short_op_ite)] in
              uu____16649 :: uu____16665 in
            uu____16623 :: uu____16639 in
          uu____16597 :: uu____16613 in
        uu____16571 :: uu____16587 in
      match head.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let lid = (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
          let uu____16745 =
            FStar_Util.find_map table
              (fun uu____16760 ->
                 match uu____16760 with
                 | (x, mk) ->
                     let uu____16777 = FStar_Ident.lid_equals x lid in
                     if uu____16777
                     then
                       let uu____16780 = mk seen_args in
                       FStar_Pervasives_Native.Some uu____16780
                     else FStar_Pervasives_Native.None) in
          (match uu____16745 with
           | FStar_Pervasives_Native.None -> FStar_TypeChecker_Common.Trivial
           | FStar_Pervasives_Native.Some g -> g)
      | uu____16783 -> FStar_TypeChecker_Common.Trivial
let (short_circuit_head : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun l ->
    let uu____16789 =
      let uu____16790 = FStar_Syntax_Util.un_uinst l in
      uu____16790.FStar_Syntax_Syntax.n in
    match uu____16789 with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        FStar_Util.for_some (FStar_Syntax_Syntax.fv_eq_lid fv)
          [FStar_Parser_Const.op_And;
          FStar_Parser_Const.op_Or;
          FStar_Parser_Const.and_lid;
          FStar_Parser_Const.or_lid;
          FStar_Parser_Const.imp_lid;
          FStar_Parser_Const.ite_lid]
    | uu____16794 -> false
let (maybe_add_implicit_binders :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.binders)
  =
  fun env ->
    fun bs ->
      let pos bs1 =
        match bs1 with
        | (hd, uu____16828)::uu____16829 ->
            FStar_Syntax_Syntax.range_of_bv hd
        | uu____16848 -> FStar_TypeChecker_Env.get_range env in
      match bs with
      | (uu____16857, FStar_Pervasives_Native.Some
         (FStar_Syntax_Syntax.Implicit uu____16858))::uu____16859 -> bs
      | uu____16876 ->
          let uu____16877 = FStar_TypeChecker_Env.expected_typ env in
          (match uu____16877 with
           | FStar_Pervasives_Native.None -> bs
           | FStar_Pervasives_Native.Some t ->
               let uu____16881 =
                 let uu____16882 = FStar_Syntax_Subst.compress t in
                 uu____16882.FStar_Syntax_Syntax.n in
               (match uu____16881 with
                | FStar_Syntax_Syntax.Tm_arrow (bs', uu____16886) ->
                    let uu____16907 =
                      FStar_Util.prefix_until
                        (fun uu___10_16947 ->
                           match uu___10_16947 with
                           | (uu____16954, FStar_Pervasives_Native.Some
                              (FStar_Syntax_Syntax.Implicit uu____16955)) ->
                               false
                           | uu____16958 -> true) bs' in
                    (match uu____16907 with
                     | FStar_Pervasives_Native.None -> bs
                     | FStar_Pervasives_Native.Some
                         ([], uu____16993, uu____16994) -> bs
                     | FStar_Pervasives_Native.Some
                         (imps, uu____17066, uu____17067) ->
                         let uu____17140 =
                           FStar_All.pipe_right imps
                             (FStar_Util.for_all
                                (fun uu____17159 ->
                                   match uu____17159 with
                                   | (x, uu____17167) ->
                                       let uu____17172 =
                                         FStar_Ident.string_of_id
                                           x.FStar_Syntax_Syntax.ppname in
                                       FStar_Util.starts_with uu____17172 "'")) in
                         if uu____17140
                         then
                           let r = pos bs in
                           let imps1 =
                             FStar_All.pipe_right imps
                               (FStar_List.map
                                  (fun uu____17215 ->
                                     match uu____17215 with
                                     | (x, i) ->
                                         let uu____17234 =
                                           FStar_Syntax_Syntax.set_range_of_bv
                                             x r in
                                         (uu____17234, i))) in
                           FStar_List.append imps1 bs
                         else bs)
                | uu____17244 -> bs))
let (maybe_lift :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Ident.lident ->
        FStar_Ident.lident ->
          FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun env ->
    fun e ->
      fun c1 ->
        fun c2 ->
          fun t ->
            let m1 = FStar_TypeChecker_Env.norm_eff_name env c1 in
            let m2 = FStar_TypeChecker_Env.norm_eff_name env c2 in
            let uu____17272 =
              ((FStar_Ident.lid_equals m1 m2) ||
                 ((FStar_Syntax_Util.is_pure_effect c1) &&
                    (FStar_Syntax_Util.is_ghost_effect c2)))
                ||
                ((FStar_Syntax_Util.is_pure_effect c2) &&
                   (FStar_Syntax_Util.is_ghost_effect c1)) in
            if uu____17272
            then e
            else
              FStar_Syntax_Syntax.mk
                (FStar_Syntax_Syntax.Tm_meta
                   (e, (FStar_Syntax_Syntax.Meta_monadic_lift (m1, m2, t))))
                e.FStar_Syntax_Syntax.pos
let (maybe_monadic :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun env ->
    fun e ->
      fun c ->
        fun t ->
          let m = FStar_TypeChecker_Env.norm_eff_name env c in
          let uu____17299 =
            ((is_pure_or_ghost_effect env m) ||
               (FStar_Ident.lid_equals m FStar_Parser_Const.effect_Tot_lid))
              ||
              (FStar_Ident.lid_equals m FStar_Parser_Const.effect_GTot_lid) in
          if uu____17299
          then e
          else
            FStar_Syntax_Syntax.mk
              (FStar_Syntax_Syntax.Tm_meta
                 (e, (FStar_Syntax_Syntax.Meta_monadic (m, t))))
              e.FStar_Syntax_Syntax.pos
let (d : Prims.string -> unit) =
  fun s -> FStar_Util.print1 "\027[01;36m%s\027[00m\n" s
let (mk_toplevel_definition :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.term ->
        (FStar_Syntax_Syntax.sigelt * FStar_Syntax_Syntax.term))
  =
  fun env ->
    fun lident ->
      fun def ->
        (let uu____17334 =
           FStar_TypeChecker_Env.debug env (FStar_Options.Other "ED") in
         if uu____17334
         then
           ((let uu____17336 = FStar_Ident.string_of_lid lident in
             d uu____17336);
            (let uu____17337 = FStar_Ident.string_of_lid lident in
             let uu____17338 = FStar_Syntax_Print.term_to_string def in
             FStar_Util.print2 "Registering top-level definition: %s\n%s\n"
               uu____17337 uu____17338))
         else ());
        (let fv =
           let uu____17341 = FStar_Syntax_Util.incr_delta_qualifier def in
           FStar_Syntax_Syntax.lid_as_fv lident uu____17341
             FStar_Pervasives_Native.None in
         let lbname = FStar_Util.Inr fv in
         let lb =
           (false,
             [FStar_Syntax_Util.mk_letbinding lbname []
                FStar_Syntax_Syntax.tun FStar_Parser_Const.effect_Tot_lid def
                [] FStar_Range.dummyRange]) in
         let sig_ctx =
           FStar_Syntax_Syntax.mk_sigelt
             (FStar_Syntax_Syntax.Sig_let (lb, [lident])) in
         let uu____17351 =
           FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_fvar fv)
             FStar_Range.dummyRange in
         ((let uu___2134_17353 = sig_ctx in
           {
             FStar_Syntax_Syntax.sigel =
               (uu___2134_17353.FStar_Syntax_Syntax.sigel);
             FStar_Syntax_Syntax.sigrng =
               (uu___2134_17353.FStar_Syntax_Syntax.sigrng);
             FStar_Syntax_Syntax.sigquals =
               [FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen];
             FStar_Syntax_Syntax.sigmeta =
               (uu___2134_17353.FStar_Syntax_Syntax.sigmeta);
             FStar_Syntax_Syntax.sigattrs =
               (uu___2134_17353.FStar_Syntax_Syntax.sigattrs);
             FStar_Syntax_Syntax.sigopts =
               (uu___2134_17353.FStar_Syntax_Syntax.sigopts)
           }), uu____17351))
let (check_sigelt_quals :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.sigelt -> unit) =
  fun env ->
    fun se ->
      let visibility uu___11_17369 =
        match uu___11_17369 with
        | FStar_Syntax_Syntax.Private -> true
        | uu____17370 -> false in
      let reducibility uu___12_17376 =
        match uu___12_17376 with
        | FStar_Syntax_Syntax.Irreducible -> true
        | FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen -> true
        | FStar_Syntax_Syntax.Visible_default -> true
        | FStar_Syntax_Syntax.Inline_for_extraction -> true
        | uu____17377 -> false in
      let assumption uu___13_17383 =
        match uu___13_17383 with
        | FStar_Syntax_Syntax.Assumption -> true
        | FStar_Syntax_Syntax.New -> true
        | uu____17384 -> false in
      let reification uu___14_17390 =
        match uu___14_17390 with
        | FStar_Syntax_Syntax.Reifiable -> true
        | FStar_Syntax_Syntax.Reflectable uu____17391 -> true
        | uu____17392 -> false in
      let inferred uu___15_17398 =
        match uu___15_17398 with
        | FStar_Syntax_Syntax.Discriminator uu____17399 -> true
        | FStar_Syntax_Syntax.Projector uu____17400 -> true
        | FStar_Syntax_Syntax.RecordType uu____17405 -> true
        | FStar_Syntax_Syntax.RecordConstructor uu____17414 -> true
        | FStar_Syntax_Syntax.ExceptionConstructor -> true
        | FStar_Syntax_Syntax.HasMaskedEffect -> true
        | FStar_Syntax_Syntax.Effect -> true
        | uu____17423 -> false in
      let has_eq uu___16_17429 =
        match uu___16_17429 with
        | FStar_Syntax_Syntax.Noeq -> true
        | FStar_Syntax_Syntax.Unopteq -> true
        | uu____17430 -> false in
      let quals_combo_ok quals q =
        match q with
        | FStar_Syntax_Syntax.Assumption ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    ((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                          (inferred x))
                         || (visibility x))
                        || (assumption x))
                       ||
                       (env.FStar_TypeChecker_Env.is_iface &&
                          (x = FStar_Syntax_Syntax.Inline_for_extraction)))
                      || (x = FStar_Syntax_Syntax.NoExtract)))
        | FStar_Syntax_Syntax.New ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    (((x = q) || (inferred x)) || (visibility x)) ||
                      (assumption x)))
        | FStar_Syntax_Syntax.Inline_for_extraction ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (visibility x))
                           || (reducibility x))
                          || (reification x))
                         || (inferred x))
                        || (has_eq x))
                       ||
                       (env.FStar_TypeChecker_Env.is_iface &&
                          (x = FStar_Syntax_Syntax.Assumption)))
                      || (x = FStar_Syntax_Syntax.NoExtract)))
        | FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    (((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                           (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Visible_default ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    (((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                           (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Irreducible ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    (((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                           (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Noeq ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    (((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                           (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Unopteq ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    (((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                           (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.TotalEffect ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    (((x = q) || (inferred x)) || (visibility x)) ||
                      (reification x)))
        | FStar_Syntax_Syntax.Logic ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    ((((x = q) || (x = FStar_Syntax_Syntax.Assumption)) ||
                        (inferred x))
                       || (visibility x))
                      || (reducibility x)))
        | FStar_Syntax_Syntax.Reifiable ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    ((((reification x) || (inferred x)) || (visibility x)) ||
                       (x = FStar_Syntax_Syntax.TotalEffect))
                      || (x = FStar_Syntax_Syntax.Visible_default)))
        | FStar_Syntax_Syntax.Reflectable uu____17490 ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    ((((reification x) || (inferred x)) || (visibility x)) ||
                       (x = FStar_Syntax_Syntax.TotalEffect))
                      || (x = FStar_Syntax_Syntax.Visible_default)))
        | FStar_Syntax_Syntax.Private -> true
        | uu____17495 -> true in
      let check_erasable quals se1 r =
        let lids = FStar_Syntax_Util.lids_of_sigelt se1 in
        let val_exists =
          FStar_All.pipe_right lids
            (FStar_Util.for_some
               (fun l ->
                  let uu____17525 =
                    FStar_TypeChecker_Env.try_lookup_val_decl env l in
                  FStar_Option.isSome uu____17525)) in
        let val_has_erasable_attr =
          FStar_All.pipe_right lids
            (FStar_Util.for_some
               (fun l ->
                  let attrs_opt =
                    FStar_TypeChecker_Env.lookup_attrs_of_lid env l in
                  (FStar_Option.isSome attrs_opt) &&
                    (let uu____17554 = FStar_Option.get attrs_opt in
                     FStar_Syntax_Util.has_attribute uu____17554
                       FStar_Parser_Const.erasable_attr))) in
        let se_has_erasable_attr =
          FStar_Syntax_Util.has_attribute se1.FStar_Syntax_Syntax.sigattrs
            FStar_Parser_Const.erasable_attr in
        if
          (val_exists && val_has_erasable_attr) &&
            (Prims.op_Negation se_has_erasable_attr)
        then
          FStar_Errors.raise_error
            (FStar_Errors.Fatal_QulifierListNotPermitted,
              "Mismatch of attributes between declaration and definition: Declaration is marked `erasable` but the definition is not")
            r
        else ();
        if
          (val_exists && (Prims.op_Negation val_has_erasable_attr)) &&
            se_has_erasable_attr
        then
          FStar_Errors.raise_error
            (FStar_Errors.Fatal_QulifierListNotPermitted,
              "Mismatch of attributed between declaration and definition: Definition is marked `erasable` but the declaration is not")
            r
        else ();
        if se_has_erasable_attr
        then
          (match se1.FStar_Syntax_Syntax.sigel with
           | FStar_Syntax_Syntax.Sig_bundle uu____17564 ->
               let uu____17573 =
                 let uu____17574 =
                   FStar_All.pipe_right quals
                     (FStar_Util.for_some
                        (fun uu___17_17578 ->
                           match uu___17_17578 with
                           | FStar_Syntax_Syntax.Noeq -> true
                           | uu____17579 -> false)) in
                 Prims.op_Negation uu____17574 in
               if uu____17573
               then
                 FStar_Errors.raise_error
                   (FStar_Errors.Fatal_QulifierListNotPermitted,
                     "Incompatible attributes and qualifiers: erasable types do not support decidable equality and must be marked `noeq`")
                   r
               else ()
           | FStar_Syntax_Syntax.Sig_declare_typ uu____17581 -> ()
           | FStar_Syntax_Syntax.Sig_fail uu____17588 -> ()
           | FStar_Syntax_Syntax.Sig_let ((false, lb::[]), uu____17600) ->
               let uu____17607 =
                 FStar_Syntax_Util.abs_formals lb.FStar_Syntax_Syntax.lbdef in
               (match uu____17607 with
                | (uu____17616, body, uu____17618) ->
                    let uu____17623 =
                      let uu____17624 =
                        FStar_TypeChecker_Normalize.non_info_norm env body in
                      Prims.op_Negation uu____17624 in
                    if uu____17623
                    then
                      let uu____17625 =
                        let uu____17630 =
                          let uu____17631 =
                            FStar_Syntax_Print.term_to_string body in
                          FStar_Util.format1
                            "Illegal attribute: the `erasable` attribute is only permitted on inductive type definitions and abbreviations for non-informative types. %s is considered informative."
                            uu____17631 in
                        (FStar_Errors.Fatal_QulifierListNotPermitted,
                          uu____17630) in
                      FStar_Errors.raise_error uu____17625
                        body.FStar_Syntax_Syntax.pos
                    else ())
           | uu____17633 ->
               FStar_Errors.raise_error
                 (FStar_Errors.Fatal_QulifierListNotPermitted,
                   "Illegal attribute: the `erasable` attribute is only permitted on inductive type definitions and abbreviations for non-informative types")
                 r)
        else () in
      let quals =
        FStar_All.pipe_right (FStar_Syntax_Util.quals_of_sigelt se)
          (FStar_List.filter
             (fun x -> Prims.op_Negation (x = FStar_Syntax_Syntax.Logic))) in
      let uu____17644 =
        let uu____17645 =
          FStar_All.pipe_right quals
            (FStar_Util.for_some
               (fun uu___18_17649 ->
                  match uu___18_17649 with
                  | FStar_Syntax_Syntax.OnlyName -> true
                  | uu____17650 -> false)) in
        FStar_All.pipe_right uu____17645 Prims.op_Negation in
      if uu____17644
      then
        let r = FStar_Syntax_Util.range_of_sigelt se in
        let no_dup_quals =
          FStar_Util.remove_dups (fun x -> fun y -> x = y) quals in
        let err' msg =
          let uu____17665 =
            let uu____17670 =
              let uu____17671 = FStar_Syntax_Print.quals_to_string quals in
              FStar_Util.format2
                "The qualifier list \"[%s]\" is not permissible for this element%s"
                uu____17671 msg in
            (FStar_Errors.Fatal_QulifierListNotPermitted, uu____17670) in
          FStar_Errors.raise_error uu____17665 r in
        let err msg = err' (Prims.op_Hat ": " msg) in
        let err'1 uu____17683 = err' "" in
        (if (FStar_List.length quals) <> (FStar_List.length no_dup_quals)
         then err "duplicate qualifiers"
         else ();
         (let uu____17687 =
            let uu____17688 =
              FStar_All.pipe_right quals
                (FStar_List.for_all (quals_combo_ok quals)) in
            Prims.op_Negation uu____17688 in
          if uu____17687 then err "ill-formed combination" else ());
         check_erasable quals se r;
         (match se.FStar_Syntax_Syntax.sigel with
          | FStar_Syntax_Syntax.Sig_let ((is_rec, uu____17694), uu____17695)
              ->
              ((let uu____17705 =
                  is_rec &&
                    (FStar_All.pipe_right quals
                       (FStar_List.contains
                          FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen)) in
                if uu____17705
                then err "recursive definitions cannot be marked inline"
                else ());
               (let uu____17709 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_some
                       (fun x -> (assumption x) || (has_eq x))) in
                if uu____17709
                then
                  err
                    "definitions cannot be assumed or marked with equality qualifiers"
                else ()))
          | FStar_Syntax_Syntax.Sig_bundle uu____17715 ->
              ((let uu____17725 =
                  let uu____17726 =
                    FStar_All.pipe_right quals
                      (FStar_Util.for_all
                         (fun x ->
                            ((((x = FStar_Syntax_Syntax.Inline_for_extraction)
                                 || (x = FStar_Syntax_Syntax.NoExtract))
                                || (inferred x))
                               || (visibility x))
                              || (has_eq x))) in
                  Prims.op_Negation uu____17726 in
                if uu____17725 then err'1 () else ());
               (let uu____17732 =
                  (FStar_All.pipe_right quals
                     (FStar_List.existsb
                        (fun uu___19_17736 ->
                           match uu___19_17736 with
                           | FStar_Syntax_Syntax.Unopteq -> true
                           | uu____17737 -> false)))
                    &&
                    (FStar_Syntax_Util.has_attribute
                       se.FStar_Syntax_Syntax.sigattrs
                       FStar_Parser_Const.erasable_attr) in
                if uu____17732
                then
                  err
                    "unopteq is not allowed on an erasable inductives since they don't have decidable equality"
                else ()))
          | FStar_Syntax_Syntax.Sig_declare_typ uu____17739 ->
              let uu____17746 =
                FStar_All.pipe_right quals (FStar_Util.for_some has_eq) in
              if uu____17746 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_assume uu____17750 ->
              let uu____17757 =
                let uu____17758 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x ->
                          (visibility x) ||
                            (x = FStar_Syntax_Syntax.Assumption))) in
                Prims.op_Negation uu____17758 in
              if uu____17757 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect uu____17764 ->
              let uu____17765 =
                let uu____17766 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x ->
                          (((x = FStar_Syntax_Syntax.TotalEffect) ||
                              (inferred x))
                             || (visibility x))
                            || (reification x))) in
                Prims.op_Negation uu____17766 in
              if uu____17765 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_effect_abbrev uu____17772 ->
              let uu____17785 =
                let uu____17786 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x -> (inferred x) || (visibility x))) in
                Prims.op_Negation uu____17786 in
              if uu____17785 then err'1 () else ()
          | uu____17792 -> ()))
      else ()
let (must_erase_for_extraction :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun g ->
    fun t ->
      let rec descend env t1 =
        let uu____17826 =
          let uu____17827 = FStar_Syntax_Subst.compress t1 in
          uu____17827.FStar_Syntax_Syntax.n in
        match uu____17826 with
        | FStar_Syntax_Syntax.Tm_arrow uu____17830 ->
            let uu____17845 = FStar_Syntax_Util.arrow_formals_comp t1 in
            (match uu____17845 with
             | (bs, c) ->
                 let env1 = FStar_TypeChecker_Env.push_binders env bs in
                 (FStar_Syntax_Util.is_ghost_effect
                    (FStar_Syntax_Util.comp_effect_name c))
                   ||
                   ((FStar_Syntax_Util.is_pure_or_ghost_comp c) &&
                      (aux env1 (FStar_Syntax_Util.comp_result c))))
        | FStar_Syntax_Syntax.Tm_refine
            ({ FStar_Syntax_Syntax.ppname = uu____17853;
               FStar_Syntax_Syntax.index = uu____17854;
               FStar_Syntax_Syntax.sort = t2;_},
             uu____17856)
            -> aux env t2
        | FStar_Syntax_Syntax.Tm_app (head, uu____17864) -> descend env head
        | FStar_Syntax_Syntax.Tm_uinst (head, uu____17890) ->
            descend env head
        | FStar_Syntax_Syntax.Tm_fvar fv ->
            FStar_TypeChecker_Env.fv_has_attr env fv
              FStar_Parser_Const.must_erase_for_extraction_attr
        | uu____17896 -> false
      and aux env t1 =
        let t2 =
          FStar_TypeChecker_Normalize.normalize
            [FStar_TypeChecker_Env.Primops;
            FStar_TypeChecker_Env.Weak;
            FStar_TypeChecker_Env.HNF;
            FStar_TypeChecker_Env.UnfoldUntil
              FStar_Syntax_Syntax.delta_constant;
            FStar_TypeChecker_Env.Beta;
            FStar_TypeChecker_Env.AllowUnboundUniverses;
            FStar_TypeChecker_Env.Zeta;
            FStar_TypeChecker_Env.Iota;
            FStar_TypeChecker_Env.Unascribe] env t1 in
        let res =
          (FStar_TypeChecker_Env.non_informative env t2) || (descend env t2) in
        (let uu____17904 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Extraction") in
         if uu____17904
         then
           let uu____17905 = FStar_Syntax_Print.term_to_string t2 in
           FStar_Util.print2 "must_erase=%s: %s\n"
             (if res then "true" else "false") uu____17905
         else ());
        res in
      aux g t
let (fresh_effect_repr :
  FStar_TypeChecker_Env.env ->
    FStar_Range.range ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.tscheme ->
          FStar_Syntax_Syntax.tscheme FStar_Pervasives_Native.option ->
            FStar_Syntax_Syntax.universe ->
              FStar_Syntax_Syntax.term ->
                (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun r ->
      fun eff_name ->
        fun signature_ts ->
          fun repr_ts_opt ->
            fun u ->
              fun a_tm ->
                let fail t =
                  let uu____17961 =
                    FStar_TypeChecker_Err.unexpected_signature_for_monad env
                      eff_name t in
                  FStar_Errors.raise_error uu____17961 r in
                let uu____17970 =
                  FStar_TypeChecker_Env.inst_tscheme signature_ts in
                match uu____17970 with
                | (uu____17979, signature) ->
                    let uu____17981 =
                      let uu____17982 = FStar_Syntax_Subst.compress signature in
                      uu____17982.FStar_Syntax_Syntax.n in
                    (match uu____17981 with
                     | FStar_Syntax_Syntax.Tm_arrow (bs, uu____17990) ->
                         let bs1 = FStar_Syntax_Subst.open_binders bs in
                         (match bs1 with
                          | a::bs2 ->
                              let uu____18038 =
                                FStar_TypeChecker_Env.uvars_for_binders env
                                  bs2
                                  [FStar_Syntax_Syntax.NT
                                     ((FStar_Pervasives_Native.fst a), a_tm)]
                                  (fun b ->
                                     let uu____18054 =
                                       FStar_Syntax_Print.binder_to_string b in
                                     let uu____18055 =
                                       FStar_Ident.string_of_lid eff_name in
                                     let uu____18056 =
                                       FStar_Range.string_of_range r in
                                     FStar_Util.format3
                                       "uvar for binder %s when creating a fresh repr for %s at %s"
                                       uu____18054 uu____18055 uu____18056) r in
                              (match uu____18038 with
                               | (is, g) ->
                                   let uu____18067 =
                                     match repr_ts_opt with
                                     | FStar_Pervasives_Native.None ->
                                         let eff_c =
                                           let uu____18069 =
                                             let uu____18070 =
                                               FStar_List.map
                                                 FStar_Syntax_Syntax.as_arg
                                                 is in
                                             {
                                               FStar_Syntax_Syntax.comp_univs
                                                 = [u];
                                               FStar_Syntax_Syntax.effect_name
                                                 = eff_name;
                                               FStar_Syntax_Syntax.result_typ
                                                 = a_tm;
                                               FStar_Syntax_Syntax.effect_args
                                                 = uu____18070;
                                               FStar_Syntax_Syntax.flags = []
                                             } in
                                           FStar_Syntax_Syntax.mk_Comp
                                             uu____18069 in
                                         let uu____18089 =
                                           let uu____18090 =
                                             let uu____18105 =
                                               let uu____18114 =
                                                 FStar_Syntax_Syntax.null_binder
                                                   FStar_Syntax_Syntax.t_unit in
                                               [uu____18114] in
                                             (uu____18105, eff_c) in
                                           FStar_Syntax_Syntax.Tm_arrow
                                             uu____18090 in
                                         FStar_Syntax_Syntax.mk uu____18089 r
                                     | FStar_Pervasives_Native.Some repr_ts
                                         ->
                                         let repr =
                                           let uu____18145 =
                                             FStar_TypeChecker_Env.inst_tscheme_with
                                               repr_ts [u] in
                                           FStar_All.pipe_right uu____18145
                                             FStar_Pervasives_Native.snd in
                                         let is_args =
                                           FStar_List.map2
                                             (fun i ->
                                                fun uu____18180 ->
                                                  match uu____18180 with
                                                  | (uu____18193, aqual) ->
                                                      (i, aqual)) is bs2 in
                                         let uu____18201 =
                                           let uu____18202 =
                                             FStar_Syntax_Syntax.as_arg a_tm in
                                           uu____18202 :: is_args in
                                         FStar_Syntax_Syntax.mk_Tm_app repr
                                           uu____18201 r in
                                   (uu____18067, g))
                          | uu____18215 -> fail signature)
                     | uu____18216 -> fail signature)
let (fresh_effect_repr_en :
  FStar_TypeChecker_Env.env ->
    FStar_Range.range ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.universe ->
          FStar_Syntax_Syntax.term ->
            (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun r ->
      fun eff_name ->
        fun u ->
          fun a_tm ->
            let uu____18246 =
              FStar_All.pipe_right eff_name
                (FStar_TypeChecker_Env.get_effect_decl env) in
            FStar_All.pipe_right uu____18246
              (fun ed ->
                 let uu____18254 =
                   FStar_All.pipe_right ed FStar_Syntax_Util.get_eff_repr in
                 fresh_effect_repr env r eff_name
                   ed.FStar_Syntax_Syntax.signature uu____18254 u a_tm)
let (layered_effect_indices_as_binders :
  FStar_TypeChecker_Env.env ->
    FStar_Range.range ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.tscheme ->
          FStar_Syntax_Syntax.universe ->
            FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.binders)
  =
  fun env ->
    fun r ->
      fun eff_name ->
        fun sig_ts ->
          fun u ->
            fun a_tm ->
              let uu____18289 =
                FStar_TypeChecker_Env.inst_tscheme_with sig_ts [u] in
              match uu____18289 with
              | (uu____18294, sig_tm) ->
                  let fail t =
                    let uu____18302 =
                      FStar_TypeChecker_Err.unexpected_signature_for_monad
                        env eff_name t in
                    FStar_Errors.raise_error uu____18302 r in
                  let uu____18307 =
                    let uu____18308 = FStar_Syntax_Subst.compress sig_tm in
                    uu____18308.FStar_Syntax_Syntax.n in
                  (match uu____18307 with
                   | FStar_Syntax_Syntax.Tm_arrow (bs, uu____18312) ->
                       let bs1 = FStar_Syntax_Subst.open_binders bs in
                       (match bs1 with
                        | (a', uu____18335)::bs2 ->
                            FStar_All.pipe_right bs2
                              (FStar_Syntax_Subst.subst_binders
                                 [FStar_Syntax_Syntax.NT (a', a_tm)])
                        | uu____18357 -> fail sig_tm)
                   | uu____18358 -> fail sig_tm)
let (lift_tf_layered_effect :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.tscheme ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.comp ->
          (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun tgt ->
    fun lift_ts ->
      fun env ->
        fun c ->
          (let uu____18388 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "LayeredEffects") in
           if uu____18388
           then
             let uu____18389 = FStar_Syntax_Print.comp_to_string c in
             let uu____18390 = FStar_Syntax_Print.lid_to_string tgt in
             FStar_Util.print2 "Lifting comp %s to layered effect %s {\n"
               uu____18389 uu____18390
           else ());
          (let r = FStar_TypeChecker_Env.get_range env in
           let ct = FStar_Syntax_Util.comp_to_comp_typ c in
           let lift_name =
             let uu____18395 =
               FStar_Ident.string_of_lid ct.FStar_Syntax_Syntax.effect_name in
             let uu____18396 = FStar_Ident.string_of_lid tgt in
             FStar_Util.format2 "%s ~> %s" uu____18395 uu____18396 in
           let uu____18397 =
             let uu____18408 =
               FStar_List.hd ct.FStar_Syntax_Syntax.comp_univs in
             let uu____18409 =
               FStar_All.pipe_right ct.FStar_Syntax_Syntax.effect_args
                 (FStar_List.map FStar_Pervasives_Native.fst) in
             (uu____18408, (ct.FStar_Syntax_Syntax.result_typ), uu____18409) in
           match uu____18397 with
           | (u, a, c_is) ->
               let uu____18457 =
                 FStar_TypeChecker_Env.inst_tscheme_with lift_ts [u] in
               (match uu____18457 with
                | (uu____18466, lift_t) ->
                    let lift_t_shape_error s =
                      let uu____18474 =
                        FStar_Ident.string_of_lid
                          ct.FStar_Syntax_Syntax.effect_name in
                      let uu____18475 = FStar_Ident.string_of_lid tgt in
                      let uu____18476 =
                        FStar_Syntax_Print.term_to_string lift_t in
                      FStar_Util.format4
                        "Lift from %s to %s has unexpected shape, reason: %s (lift:%s)"
                        uu____18474 uu____18475 s uu____18476 in
                    let uu____18477 =
                      let uu____18510 =
                        let uu____18511 = FStar_Syntax_Subst.compress lift_t in
                        uu____18511.FStar_Syntax_Syntax.n in
                      match uu____18510 with
                      | FStar_Syntax_Syntax.Tm_arrow (bs, c1) when
                          (FStar_List.length bs) >= (Prims.of_int (2)) ->
                          let uu____18574 =
                            FStar_Syntax_Subst.open_comp bs c1 in
                          (match uu____18574 with
                           | (a_b::bs1, c2) ->
                               let uu____18634 =
                                 FStar_All.pipe_right bs1
                                   (FStar_List.splitAt
                                      ((FStar_List.length bs1) -
                                         Prims.int_one)) in
                               (a_b, uu____18634, c2))
                      | uu____18721 ->
                          let uu____18722 =
                            let uu____18727 =
                              lift_t_shape_error
                                "either not an arrow or not enough binders" in
                            (FStar_Errors.Fatal_UnexpectedEffect,
                              uu____18727) in
                          FStar_Errors.raise_error uu____18722 r in
                    (match uu____18477 with
                     | (a_b, (rest_bs, f_b::[]), lift_c) ->
                         let uu____18842 =
                           let uu____18849 =
                             let uu____18850 =
                               let uu____18851 =
                                 let uu____18858 =
                                   FStar_All.pipe_right a_b
                                     FStar_Pervasives_Native.fst in
                                 (uu____18858, a) in
                               FStar_Syntax_Syntax.NT uu____18851 in
                             [uu____18850] in
                           FStar_TypeChecker_Env.uvars_for_binders env
                             rest_bs uu____18849
                             (fun b ->
                                let uu____18875 =
                                  FStar_Syntax_Print.binder_to_string b in
                                let uu____18876 =
                                  FStar_Ident.string_of_lid
                                    ct.FStar_Syntax_Syntax.effect_name in
                                let uu____18877 =
                                  FStar_Ident.string_of_lid tgt in
                                let uu____18878 =
                                  FStar_Range.string_of_range r in
                                FStar_Util.format4
                                  "implicit var for binder %s of %s~>%s at %s"
                                  uu____18875 uu____18876 uu____18877
                                  uu____18878) r in
                         (match uu____18842 with
                          | (rest_bs_uvars, g) ->
                              ((let uu____18890 =
                                  FStar_All.pipe_left
                                    (FStar_TypeChecker_Env.debug env)
                                    (FStar_Options.Other "LayeredEffects") in
                                if uu____18890
                                then
                                  let uu____18891 =
                                    FStar_List.fold_left
                                      (fun s ->
                                         fun u1 ->
                                           let uu____18897 =
                                             let uu____18898 =
                                               FStar_Syntax_Print.term_to_string
                                                 u1 in
                                             Prims.op_Hat ";;;;" uu____18898 in
                                           Prims.op_Hat s uu____18897) ""
                                      rest_bs_uvars in
                                  FStar_Util.print1 "Introduced uvars: %s\n"
                                    uu____18891
                                else ());
                               (let substs =
                                  FStar_List.map2
                                    (fun b ->
                                       fun t ->
                                         let uu____18924 =
                                           let uu____18931 =
                                             FStar_All.pipe_right b
                                               FStar_Pervasives_Native.fst in
                                           (uu____18931, t) in
                                         FStar_Syntax_Syntax.NT uu____18924)
                                    (a_b :: rest_bs) (a :: rest_bs_uvars) in
                                let guard_f =
                                  let f_sort =
                                    let uu____18950 =
                                      FStar_All.pipe_right
                                        (FStar_Pervasives_Native.fst f_b).FStar_Syntax_Syntax.sort
                                        (FStar_Syntax_Subst.subst substs) in
                                    FStar_All.pipe_right uu____18950
                                      FStar_Syntax_Subst.compress in
                                  let f_sort_is =
                                    let uu____18956 =
                                      FStar_TypeChecker_Env.is_layered_effect
                                        env
                                        ct.FStar_Syntax_Syntax.effect_name in
                                    effect_args_from_repr f_sort uu____18956
                                      r in
                                  FStar_List.fold_left2
                                    (fun g1 ->
                                       fun i1 ->
                                         fun i2 ->
                                           let uu____18964 =
                                             FStar_TypeChecker_Rel.layered_effect_teq
                                               env i1 i2
                                               (FStar_Pervasives_Native.Some
                                                  lift_name) in
                                           FStar_TypeChecker_Env.conj_guard
                                             g1 uu____18964)
                                    FStar_TypeChecker_Env.trivial_guard c_is
                                    f_sort_is in
                                let lift_ct =
                                  let uu____18966 =
                                    FStar_All.pipe_right lift_c
                                      (FStar_Syntax_Subst.subst_comp substs) in
                                  FStar_All.pipe_right uu____18966
                                    FStar_Syntax_Util.comp_to_comp_typ in
                                let is =
                                  let uu____18970 =
                                    FStar_TypeChecker_Env.is_layered_effect
                                      env tgt in
                                  effect_args_from_repr
                                    lift_ct.FStar_Syntax_Syntax.result_typ
                                    uu____18970 r in
                                let fml =
                                  let uu____18974 =
                                    let uu____18979 =
                                      FStar_List.hd
                                        lift_ct.FStar_Syntax_Syntax.comp_univs in
                                    let uu____18980 =
                                      let uu____18981 =
                                        FStar_List.hd
                                          lift_ct.FStar_Syntax_Syntax.effect_args in
                                      FStar_Pervasives_Native.fst uu____18981 in
                                    (uu____18979, uu____18980) in
                                  match uu____18974 with
                                  | (u1, wp) ->
                                      FStar_TypeChecker_Env.pure_precondition_for_trivial_post
                                        env u1
                                        lift_ct.FStar_Syntax_Syntax.result_typ
                                        wp FStar_Range.dummyRange in
                                (let uu____19007 =
                                   (FStar_All.pipe_left
                                      (FStar_TypeChecker_Env.debug env)
                                      (FStar_Options.Other "LayeredEffects"))
                                     &&
                                     (FStar_All.pipe_left
                                        (FStar_TypeChecker_Env.debug env)
                                        FStar_Options.Extreme) in
                                 if uu____19007
                                 then
                                   let uu____19008 =
                                     FStar_Syntax_Print.term_to_string fml in
                                   FStar_Util.print1 "Guard for lift is: %s"
                                     uu____19008
                                 else ());
                                (let c1 =
                                   let uu____19011 =
                                     let uu____19012 =
                                       FStar_All.pipe_right is
                                         (FStar_List.map
                                            FStar_Syntax_Syntax.as_arg) in
                                     {
                                       FStar_Syntax_Syntax.comp_univs =
                                         (lift_ct.FStar_Syntax_Syntax.comp_univs);
                                       FStar_Syntax_Syntax.effect_name = tgt;
                                       FStar_Syntax_Syntax.result_typ = a;
                                       FStar_Syntax_Syntax.effect_args =
                                         uu____19012;
                                       FStar_Syntax_Syntax.flags = []
                                     } in
                                   FStar_Syntax_Syntax.mk_Comp uu____19011 in
                                 (let uu____19036 =
                                    FStar_All.pipe_left
                                      (FStar_TypeChecker_Env.debug env)
                                      (FStar_Options.Other "LayeredEffects") in
                                  if uu____19036
                                  then
                                    let uu____19037 =
                                      FStar_Syntax_Print.comp_to_string c1 in
                                    FStar_Util.print1 "} Lifted comp: %s\n"
                                      uu____19037
                                  else ());
                                 (let uu____19039 =
                                    let uu____19040 =
                                      FStar_TypeChecker_Env.conj_guard g
                                        guard_f in
                                    let uu____19041 =
                                      FStar_TypeChecker_Env.guard_of_guard_formula
                                        (FStar_TypeChecker_Common.NonTrivial
                                           fml) in
                                    FStar_TypeChecker_Env.conj_guard
                                      uu____19040 uu____19041 in
                                  (c1, uu____19039)))))))))
let lift_tf_layered_effect_term :
  'uuuuuu19054 .
    'uuuuuu19054 ->
      FStar_Syntax_Syntax.sub_eff ->
        FStar_Syntax_Syntax.universe ->
          FStar_Syntax_Syntax.typ ->
            FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun env ->
    fun sub ->
      fun u ->
        fun a ->
          fun e ->
            let lift =
              let uu____19083 =
                let uu____19088 =
                  FStar_All.pipe_right sub.FStar_Syntax_Syntax.lift
                    FStar_Util.must in
                FStar_All.pipe_right uu____19088
                  (fun ts -> FStar_TypeChecker_Env.inst_tscheme_with ts [u]) in
              FStar_All.pipe_right uu____19083 FStar_Pervasives_Native.snd in
            let rest_bs =
              let lift_t =
                FStar_All.pipe_right sub.FStar_Syntax_Syntax.lift_wp
                  FStar_Util.must in
              let uu____19131 =
                let uu____19132 =
                  let uu____19135 =
                    FStar_All.pipe_right lift_t FStar_Pervasives_Native.snd in
                  FStar_All.pipe_right uu____19135
                    FStar_Syntax_Subst.compress in
                uu____19132.FStar_Syntax_Syntax.n in
              match uu____19131 with
              | FStar_Syntax_Syntax.Tm_arrow (uu____19158::bs, uu____19160)
                  when (FStar_List.length bs) >= Prims.int_one ->
                  let uu____19199 =
                    FStar_All.pipe_right bs
                      (FStar_List.splitAt
                         ((FStar_List.length bs) - Prims.int_one)) in
                  FStar_All.pipe_right uu____19199
                    FStar_Pervasives_Native.fst
              | uu____19304 ->
                  let uu____19305 =
                    let uu____19310 =
                      let uu____19311 =
                        FStar_Syntax_Print.tscheme_to_string lift_t in
                      FStar_Util.format1
                        "lift_t tscheme %s is not an arrow with enough binders"
                        uu____19311 in
                    (FStar_Errors.Fatal_UnexpectedEffect, uu____19310) in
                  FStar_Errors.raise_error uu____19305
                    (FStar_Pervasives_Native.snd lift_t).FStar_Syntax_Syntax.pos in
            let args =
              let uu____19335 = FStar_Syntax_Syntax.as_arg a in
              let uu____19344 =
                let uu____19355 =
                  FStar_All.pipe_right rest_bs
                    (FStar_List.map
                       (fun uu____19391 ->
                          FStar_Syntax_Syntax.as_arg
                            FStar_Syntax_Syntax.unit_const)) in
                let uu____19398 =
                  let uu____19409 = FStar_Syntax_Syntax.as_arg e in
                  [uu____19409] in
                FStar_List.append uu____19355 uu____19398 in
              uu____19335 :: uu____19344 in
            FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (lift, args))
              e.FStar_Syntax_Syntax.pos
let (get_field_projector_name :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident -> Prims.int -> FStar_Ident.lident)
  =
  fun env ->
    fun datacon ->
      fun index ->
        let uu____19477 = FStar_TypeChecker_Env.lookup_datacon env datacon in
        match uu____19477 with
        | (uu____19482, t) ->
            let err n =
              let uu____19490 =
                let uu____19495 =
                  let uu____19496 = FStar_Ident.string_of_lid datacon in
                  let uu____19497 = FStar_Util.string_of_int n in
                  let uu____19498 = FStar_Util.string_of_int index in
                  FStar_Util.format3
                    "Data constructor %s does not have enough binders (has %s, tried %s)"
                    uu____19496 uu____19497 uu____19498 in
                (FStar_Errors.Fatal_UnexpectedDataConstructor, uu____19495) in
              let uu____19499 = FStar_TypeChecker_Env.get_range env in
              FStar_Errors.raise_error uu____19490 uu____19499 in
            let uu____19500 =
              let uu____19501 = FStar_Syntax_Subst.compress t in
              uu____19501.FStar_Syntax_Syntax.n in
            (match uu____19500 with
             | FStar_Syntax_Syntax.Tm_arrow (bs, uu____19505) ->
                 let bs1 =
                   FStar_All.pipe_right bs
                     (FStar_List.filter
                        (fun uu____19560 ->
                           match uu____19560 with
                           | (uu____19567, q) ->
                               (match q with
                                | FStar_Pervasives_Native.Some
                                    (FStar_Syntax_Syntax.Implicit (true)) ->
                                    false
                                | uu____19573 -> true))) in
                 if (FStar_List.length bs1) <= index
                 then err (FStar_List.length bs1)
                 else
                   (let b = FStar_List.nth bs1 index in
                    FStar_Syntax_Util.mk_field_projector_name datacon
                      (FStar_Pervasives_Native.fst b) index)
             | uu____19604 -> err Prims.int_zero)
let (get_mlift_for_subeff :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sub_eff -> FStar_TypeChecker_Env.mlift)
  =
  fun env ->
    fun sub ->
      let uu____19615 =
        (FStar_TypeChecker_Env.is_layered_effect env
           sub.FStar_Syntax_Syntax.source)
          ||
          (FStar_TypeChecker_Env.is_layered_effect env
             sub.FStar_Syntax_Syntax.target) in
      if uu____19615
      then
        let uu____19616 =
          let uu____19629 =
            FStar_All.pipe_right sub.FStar_Syntax_Syntax.lift_wp
              FStar_Util.must in
          lift_tf_layered_effect sub.FStar_Syntax_Syntax.target uu____19629 in
        {
          FStar_TypeChecker_Env.mlift_wp = uu____19616;
          FStar_TypeChecker_Env.mlift_term =
            (FStar_Pervasives_Native.Some
               (lift_tf_layered_effect_term env sub))
        }
      else
        (let mk_mlift_wp ts env1 c =
           let ct = FStar_Syntax_Util.comp_to_comp_typ c in
           let uu____19663 =
             FStar_TypeChecker_Env.inst_tscheme_with ts
               ct.FStar_Syntax_Syntax.comp_univs in
           match uu____19663 with
           | (uu____19672, lift_t) ->
               let wp = FStar_List.hd ct.FStar_Syntax_Syntax.effect_args in
               let uu____19691 =
                 let uu____19692 =
                   let uu___2526_19693 = ct in
                   let uu____19694 =
                     let uu____19705 =
                       let uu____19714 =
                         let uu____19715 =
                           let uu____19716 =
                             let uu____19733 =
                               let uu____19744 =
                                 FStar_Syntax_Syntax.as_arg
                                   ct.FStar_Syntax_Syntax.result_typ in
                               [uu____19744; wp] in
                             (lift_t, uu____19733) in
                           FStar_Syntax_Syntax.Tm_app uu____19716 in
                         FStar_Syntax_Syntax.mk uu____19715
                           (FStar_Pervasives_Native.fst wp).FStar_Syntax_Syntax.pos in
                       FStar_All.pipe_right uu____19714
                         FStar_Syntax_Syntax.as_arg in
                     [uu____19705] in
                   {
                     FStar_Syntax_Syntax.comp_univs =
                       (uu___2526_19693.FStar_Syntax_Syntax.comp_univs);
                     FStar_Syntax_Syntax.effect_name =
                       (sub.FStar_Syntax_Syntax.target);
                     FStar_Syntax_Syntax.result_typ =
                       (uu___2526_19693.FStar_Syntax_Syntax.result_typ);
                     FStar_Syntax_Syntax.effect_args = uu____19694;
                     FStar_Syntax_Syntax.flags =
                       (uu___2526_19693.FStar_Syntax_Syntax.flags)
                   } in
                 FStar_Syntax_Syntax.mk_Comp uu____19692 in
               (uu____19691, FStar_TypeChecker_Common.trivial_guard) in
         let mk_mlift_term ts u r e =
           let uu____19844 = FStar_TypeChecker_Env.inst_tscheme_with ts [u] in
           match uu____19844 with
           | (uu____19851, lift_t) ->
               let uu____19853 =
                 let uu____19854 =
                   let uu____19871 =
                     let uu____19882 = FStar_Syntax_Syntax.as_arg r in
                     let uu____19891 =
                       let uu____19902 =
                         FStar_Syntax_Syntax.as_arg FStar_Syntax_Syntax.tun in
                       let uu____19911 =
                         let uu____19922 = FStar_Syntax_Syntax.as_arg e in
                         [uu____19922] in
                       uu____19902 :: uu____19911 in
                     uu____19882 :: uu____19891 in
                   (lift_t, uu____19871) in
                 FStar_Syntax_Syntax.Tm_app uu____19854 in
               FStar_Syntax_Syntax.mk uu____19853 e.FStar_Syntax_Syntax.pos in
         let uu____19975 =
           let uu____19988 =
             FStar_All.pipe_right sub.FStar_Syntax_Syntax.lift_wp
               FStar_Util.must in
           FStar_All.pipe_right uu____19988 mk_mlift_wp in
         {
           FStar_TypeChecker_Env.mlift_wp = uu____19975;
           FStar_TypeChecker_Env.mlift_term =
             (match sub.FStar_Syntax_Syntax.lift with
              | FStar_Pervasives_Native.None ->
                  FStar_Pervasives_Native.Some
                    ((fun uu____20024 ->
                        fun uu____20025 -> fun e -> FStar_Util.return_all e))
              | FStar_Pervasives_Native.Some ts ->
                  FStar_Pervasives_Native.Some (mk_mlift_term ts))
         })
let (update_env_sub_eff :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sub_eff ->
      FStar_Range.range -> FStar_TypeChecker_Env.env)
  =
  fun env ->
    fun sub ->
      fun r ->
        let r0 = env.FStar_TypeChecker_Env.range in
        let env1 =
          let uu____20054 = get_mlift_for_subeff env sub in
          FStar_TypeChecker_Env.update_effect_lattice
            (let uu___2546_20057 = env in
             {
               FStar_TypeChecker_Env.solver =
                 (uu___2546_20057.FStar_TypeChecker_Env.solver);
               FStar_TypeChecker_Env.range = r;
               FStar_TypeChecker_Env.curmodule =
                 (uu___2546_20057.FStar_TypeChecker_Env.curmodule);
               FStar_TypeChecker_Env.gamma =
                 (uu___2546_20057.FStar_TypeChecker_Env.gamma);
               FStar_TypeChecker_Env.gamma_sig =
                 (uu___2546_20057.FStar_TypeChecker_Env.gamma_sig);
               FStar_TypeChecker_Env.gamma_cache =
                 (uu___2546_20057.FStar_TypeChecker_Env.gamma_cache);
               FStar_TypeChecker_Env.modules =
                 (uu___2546_20057.FStar_TypeChecker_Env.modules);
               FStar_TypeChecker_Env.expected_typ =
                 (uu___2546_20057.FStar_TypeChecker_Env.expected_typ);
               FStar_TypeChecker_Env.sigtab =
                 (uu___2546_20057.FStar_TypeChecker_Env.sigtab);
               FStar_TypeChecker_Env.attrtab =
                 (uu___2546_20057.FStar_TypeChecker_Env.attrtab);
               FStar_TypeChecker_Env.instantiate_imp =
                 (uu___2546_20057.FStar_TypeChecker_Env.instantiate_imp);
               FStar_TypeChecker_Env.effects =
                 (uu___2546_20057.FStar_TypeChecker_Env.effects);
               FStar_TypeChecker_Env.generalize =
                 (uu___2546_20057.FStar_TypeChecker_Env.generalize);
               FStar_TypeChecker_Env.letrecs =
                 (uu___2546_20057.FStar_TypeChecker_Env.letrecs);
               FStar_TypeChecker_Env.top_level =
                 (uu___2546_20057.FStar_TypeChecker_Env.top_level);
               FStar_TypeChecker_Env.check_uvars =
                 (uu___2546_20057.FStar_TypeChecker_Env.check_uvars);
               FStar_TypeChecker_Env.use_eq =
                 (uu___2546_20057.FStar_TypeChecker_Env.use_eq);
               FStar_TypeChecker_Env.use_eq_strict =
                 (uu___2546_20057.FStar_TypeChecker_Env.use_eq_strict);
               FStar_TypeChecker_Env.is_iface =
                 (uu___2546_20057.FStar_TypeChecker_Env.is_iface);
               FStar_TypeChecker_Env.admit =
                 (uu___2546_20057.FStar_TypeChecker_Env.admit);
               FStar_TypeChecker_Env.lax =
                 (uu___2546_20057.FStar_TypeChecker_Env.lax);
               FStar_TypeChecker_Env.lax_universes =
                 (uu___2546_20057.FStar_TypeChecker_Env.lax_universes);
               FStar_TypeChecker_Env.phase1 =
                 (uu___2546_20057.FStar_TypeChecker_Env.phase1);
               FStar_TypeChecker_Env.failhard =
                 (uu___2546_20057.FStar_TypeChecker_Env.failhard);
               FStar_TypeChecker_Env.nosynth =
                 (uu___2546_20057.FStar_TypeChecker_Env.nosynth);
               FStar_TypeChecker_Env.uvar_subtyping =
                 (uu___2546_20057.FStar_TypeChecker_Env.uvar_subtyping);
               FStar_TypeChecker_Env.tc_term =
                 (uu___2546_20057.FStar_TypeChecker_Env.tc_term);
               FStar_TypeChecker_Env.type_of =
                 (uu___2546_20057.FStar_TypeChecker_Env.type_of);
               FStar_TypeChecker_Env.universe_of =
                 (uu___2546_20057.FStar_TypeChecker_Env.universe_of);
               FStar_TypeChecker_Env.check_type_of =
                 (uu___2546_20057.FStar_TypeChecker_Env.check_type_of);
               FStar_TypeChecker_Env.use_bv_sorts =
                 (uu___2546_20057.FStar_TypeChecker_Env.use_bv_sorts);
               FStar_TypeChecker_Env.qtbl_name_and_index =
                 (uu___2546_20057.FStar_TypeChecker_Env.qtbl_name_and_index);
               FStar_TypeChecker_Env.normalized_eff_names =
                 (uu___2546_20057.FStar_TypeChecker_Env.normalized_eff_names);
               FStar_TypeChecker_Env.fv_delta_depths =
                 (uu___2546_20057.FStar_TypeChecker_Env.fv_delta_depths);
               FStar_TypeChecker_Env.proof_ns =
                 (uu___2546_20057.FStar_TypeChecker_Env.proof_ns);
               FStar_TypeChecker_Env.synth_hook =
                 (uu___2546_20057.FStar_TypeChecker_Env.synth_hook);
               FStar_TypeChecker_Env.try_solve_implicits_hook =
                 (uu___2546_20057.FStar_TypeChecker_Env.try_solve_implicits_hook);
               FStar_TypeChecker_Env.splice =
                 (uu___2546_20057.FStar_TypeChecker_Env.splice);
               FStar_TypeChecker_Env.mpreprocess =
                 (uu___2546_20057.FStar_TypeChecker_Env.mpreprocess);
               FStar_TypeChecker_Env.postprocess =
                 (uu___2546_20057.FStar_TypeChecker_Env.postprocess);
               FStar_TypeChecker_Env.identifier_info =
                 (uu___2546_20057.FStar_TypeChecker_Env.identifier_info);
               FStar_TypeChecker_Env.tc_hooks =
                 (uu___2546_20057.FStar_TypeChecker_Env.tc_hooks);
               FStar_TypeChecker_Env.dsenv =
                 (uu___2546_20057.FStar_TypeChecker_Env.dsenv);
               FStar_TypeChecker_Env.nbe =
                 (uu___2546_20057.FStar_TypeChecker_Env.nbe);
               FStar_TypeChecker_Env.strict_args_tab =
                 (uu___2546_20057.FStar_TypeChecker_Env.strict_args_tab);
               FStar_TypeChecker_Env.erasable_types_tab =
                 (uu___2546_20057.FStar_TypeChecker_Env.erasable_types_tab);
               FStar_TypeChecker_Env.enable_defer_to_tac =
                 (uu___2546_20057.FStar_TypeChecker_Env.enable_defer_to_tac)
             }) sub.FStar_Syntax_Syntax.source sub.FStar_Syntax_Syntax.target
            uu____20054 in
        let uu___2549_20058 = env1 in
        {
          FStar_TypeChecker_Env.solver =
            (uu___2549_20058.FStar_TypeChecker_Env.solver);
          FStar_TypeChecker_Env.range = r0;
          FStar_TypeChecker_Env.curmodule =
            (uu___2549_20058.FStar_TypeChecker_Env.curmodule);
          FStar_TypeChecker_Env.gamma =
            (uu___2549_20058.FStar_TypeChecker_Env.gamma);
          FStar_TypeChecker_Env.gamma_sig =
            (uu___2549_20058.FStar_TypeChecker_Env.gamma_sig);
          FStar_TypeChecker_Env.gamma_cache =
            (uu___2549_20058.FStar_TypeChecker_Env.gamma_cache);
          FStar_TypeChecker_Env.modules =
            (uu___2549_20058.FStar_TypeChecker_Env.modules);
          FStar_TypeChecker_Env.expected_typ =
            (uu___2549_20058.FStar_TypeChecker_Env.expected_typ);
          FStar_TypeChecker_Env.sigtab =
            (uu___2549_20058.FStar_TypeChecker_Env.sigtab);
          FStar_TypeChecker_Env.attrtab =
            (uu___2549_20058.FStar_TypeChecker_Env.attrtab);
          FStar_TypeChecker_Env.instantiate_imp =
            (uu___2549_20058.FStar_TypeChecker_Env.instantiate_imp);
          FStar_TypeChecker_Env.effects =
            (uu___2549_20058.FStar_TypeChecker_Env.effects);
          FStar_TypeChecker_Env.generalize =
            (uu___2549_20058.FStar_TypeChecker_Env.generalize);
          FStar_TypeChecker_Env.letrecs =
            (uu___2549_20058.FStar_TypeChecker_Env.letrecs);
          FStar_TypeChecker_Env.top_level =
            (uu___2549_20058.FStar_TypeChecker_Env.top_level);
          FStar_TypeChecker_Env.check_uvars =
            (uu___2549_20058.FStar_TypeChecker_Env.check_uvars);
          FStar_TypeChecker_Env.use_eq =
            (uu___2549_20058.FStar_TypeChecker_Env.use_eq);
          FStar_TypeChecker_Env.use_eq_strict =
            (uu___2549_20058.FStar_TypeChecker_Env.use_eq_strict);
          FStar_TypeChecker_Env.is_iface =
            (uu___2549_20058.FStar_TypeChecker_Env.is_iface);
          FStar_TypeChecker_Env.admit =
            (uu___2549_20058.FStar_TypeChecker_Env.admit);
          FStar_TypeChecker_Env.lax =
            (uu___2549_20058.FStar_TypeChecker_Env.lax);
          FStar_TypeChecker_Env.lax_universes =
            (uu___2549_20058.FStar_TypeChecker_Env.lax_universes);
          FStar_TypeChecker_Env.phase1 =
            (uu___2549_20058.FStar_TypeChecker_Env.phase1);
          FStar_TypeChecker_Env.failhard =
            (uu___2549_20058.FStar_TypeChecker_Env.failhard);
          FStar_TypeChecker_Env.nosynth =
            (uu___2549_20058.FStar_TypeChecker_Env.nosynth);
          FStar_TypeChecker_Env.uvar_subtyping =
            (uu___2549_20058.FStar_TypeChecker_Env.uvar_subtyping);
          FStar_TypeChecker_Env.tc_term =
            (uu___2549_20058.FStar_TypeChecker_Env.tc_term);
          FStar_TypeChecker_Env.type_of =
            (uu___2549_20058.FStar_TypeChecker_Env.type_of);
          FStar_TypeChecker_Env.universe_of =
            (uu___2549_20058.FStar_TypeChecker_Env.universe_of);
          FStar_TypeChecker_Env.check_type_of =
            (uu___2549_20058.FStar_TypeChecker_Env.check_type_of);
          FStar_TypeChecker_Env.use_bv_sorts =
            (uu___2549_20058.FStar_TypeChecker_Env.use_bv_sorts);
          FStar_TypeChecker_Env.qtbl_name_and_index =
            (uu___2549_20058.FStar_TypeChecker_Env.qtbl_name_and_index);
          FStar_TypeChecker_Env.normalized_eff_names =
            (uu___2549_20058.FStar_TypeChecker_Env.normalized_eff_names);
          FStar_TypeChecker_Env.fv_delta_depths =
            (uu___2549_20058.FStar_TypeChecker_Env.fv_delta_depths);
          FStar_TypeChecker_Env.proof_ns =
            (uu___2549_20058.FStar_TypeChecker_Env.proof_ns);
          FStar_TypeChecker_Env.synth_hook =
            (uu___2549_20058.FStar_TypeChecker_Env.synth_hook);
          FStar_TypeChecker_Env.try_solve_implicits_hook =
            (uu___2549_20058.FStar_TypeChecker_Env.try_solve_implicits_hook);
          FStar_TypeChecker_Env.splice =
            (uu___2549_20058.FStar_TypeChecker_Env.splice);
          FStar_TypeChecker_Env.mpreprocess =
            (uu___2549_20058.FStar_TypeChecker_Env.mpreprocess);
          FStar_TypeChecker_Env.postprocess =
            (uu___2549_20058.FStar_TypeChecker_Env.postprocess);
          FStar_TypeChecker_Env.identifier_info =
            (uu___2549_20058.FStar_TypeChecker_Env.identifier_info);
          FStar_TypeChecker_Env.tc_hooks =
            (uu___2549_20058.FStar_TypeChecker_Env.tc_hooks);
          FStar_TypeChecker_Env.dsenv =
            (uu___2549_20058.FStar_TypeChecker_Env.dsenv);
          FStar_TypeChecker_Env.nbe =
            (uu___2549_20058.FStar_TypeChecker_Env.nbe);
          FStar_TypeChecker_Env.strict_args_tab =
            (uu___2549_20058.FStar_TypeChecker_Env.strict_args_tab);
          FStar_TypeChecker_Env.erasable_types_tab =
            (uu___2549_20058.FStar_TypeChecker_Env.erasable_types_tab);
          FStar_TypeChecker_Env.enable_defer_to_tac =
            (uu___2549_20058.FStar_TypeChecker_Env.enable_defer_to_tac)
        }
let (update_env_polymonadic_bind :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      FStar_Ident.lident ->
        FStar_Ident.lident ->
          FStar_Syntax_Syntax.tscheme -> FStar_TypeChecker_Env.env)
  =
  fun env ->
    fun m ->
      fun n ->
        fun p ->
          fun ty ->
            FStar_TypeChecker_Env.add_polymonadic_bind env m n p
              (fun env1 ->
                 fun c1 ->
                   fun bv_opt ->
                     fun c2 ->
                       fun flags ->
                         fun r ->
                           mk_indexed_bind env1 m n p ty c1 bv_opt c2 flags r)