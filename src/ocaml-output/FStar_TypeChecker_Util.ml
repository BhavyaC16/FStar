open Prims
type lcomp_with_binder =
  (FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option *
    FStar_TypeChecker_Common.lcomp)
let (report : FStar_TypeChecker_Env.env -> Prims.string Prims.list -> unit) =
  fun env ->
    fun errs ->
      let uu____22 = FStar_TypeChecker_Env.get_range env in
      let uu____23 = FStar_TypeChecker_Err.failed_to_prove_specification errs in
      FStar_Errors.log_issue uu____22 uu____23
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
          let uu____87 = (FStar_Options.eager_subtyping ()) || solve_deferred in
          if uu____87
          then
            let uu____90 =
              FStar_All.pipe_right g.FStar_TypeChecker_Common.deferred
                (FStar_List.partition
                   (fun uu____142 ->
                      match uu____142 with
                      | (uu____149, p) ->
                          FStar_TypeChecker_Rel.flex_prob_closing env xs p)) in
            match uu____90 with
            | (solve_now, defer) ->
                ((let uu____184 =
                    FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                      (FStar_Options.Other "Rel") in
                  if uu____184
                  then
                    (FStar_Util.print_string "SOLVE BEFORE CLOSING:\n";
                     FStar_List.iter
                       (fun uu____201 ->
                          match uu____201 with
                          | (s, p) ->
                              let uu____211 =
                                FStar_TypeChecker_Rel.prob_to_string env p in
                              FStar_Util.print2 "%s: %s\n" s uu____211)
                       solve_now;
                     FStar_Util.print_string " ...DEFERRED THE REST:\n";
                     FStar_List.iter
                       (fun uu____226 ->
                          match uu____226 with
                          | (s, p) ->
                              let uu____236 =
                                FStar_TypeChecker_Rel.prob_to_string env p in
                              FStar_Util.print2 "%s: %s\n" s uu____236) defer;
                     FStar_Util.print_string "END\n")
                  else ());
                 (let g1 =
                    FStar_TypeChecker_Rel.solve_deferred_constraints env
                      (let uu___49_244 = g in
                       {
                         FStar_TypeChecker_Common.guard_f =
                           (uu___49_244.FStar_TypeChecker_Common.guard_f);
                         FStar_TypeChecker_Common.deferred_to_tac =
                           (uu___49_244.FStar_TypeChecker_Common.deferred_to_tac);
                         FStar_TypeChecker_Common.deferred = solve_now;
                         FStar_TypeChecker_Common.univ_ineqs =
                           (uu___49_244.FStar_TypeChecker_Common.univ_ineqs);
                         FStar_TypeChecker_Common.implicits =
                           (uu___49_244.FStar_TypeChecker_Common.implicits)
                       }) in
                  let g2 =
                    let uu___52_246 = g1 in
                    {
                      FStar_TypeChecker_Common.guard_f =
                        (uu___52_246.FStar_TypeChecker_Common.guard_f);
                      FStar_TypeChecker_Common.deferred_to_tac =
                        (uu___52_246.FStar_TypeChecker_Common.deferred_to_tac);
                      FStar_TypeChecker_Common.deferred = defer;
                      FStar_TypeChecker_Common.univ_ineqs =
                        (uu___52_246.FStar_TypeChecker_Common.univ_ineqs);
                      FStar_TypeChecker_Common.implicits =
                        (uu___52_246.FStar_TypeChecker_Common.implicits)
                    } in
                  g2))
          else g
let (check_uvars : FStar_Range.range -> FStar_Syntax_Syntax.typ -> unit) =
  fun r ->
    fun t ->
      let uvs = FStar_Syntax_Free.uvars t in
      let uu____263 =
        let uu____265 = FStar_Util.set_is_empty uvs in
        Prims.op_Negation uu____265 in
      if uu____263
      then
        let us =
          let uu____270 =
            let uu____274 = FStar_Util.set_elements uvs in
            FStar_List.map
              (fun u ->
                 FStar_Syntax_Print.uvar_to_string
                   u.FStar_Syntax_Syntax.ctx_uvar_head) uu____274 in
          FStar_All.pipe_right uu____270 (FStar_String.concat ", ") in
        (FStar_Options.push ();
         FStar_Options.set_option "hide_uvar_nums" (FStar_Options.Bool false);
         FStar_Options.set_option "print_implicits" (FStar_Options.Bool true);
         (let uu____293 =
            let uu____299 =
              let uu____301 = FStar_Syntax_Print.term_to_string t in
              FStar_Util.format2
                "Unconstrained unification variables %s in type signature %s; please add an annotation"
                us uu____301 in
            (FStar_Errors.Error_UncontrainedUnificationVar, uu____299) in
          FStar_Errors.log_issue r uu____293);
         FStar_Options.pop ())
      else ()
let (extract_let_rec_annotation :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.letbinding ->
      (FStar_Syntax_Syntax.univ_names * FStar_Syntax_Syntax.typ * Prims.bool))
  =
  fun env ->
    fun uu____324 ->
      match uu____324 with
      | { FStar_Syntax_Syntax.lbname = lbname;
          FStar_Syntax_Syntax.lbunivs = univ_vars;
          FStar_Syntax_Syntax.lbtyp = t;
          FStar_Syntax_Syntax.lbeff = uu____335;
          FStar_Syntax_Syntax.lbdef = e;
          FStar_Syntax_Syntax.lbattrs = uu____337;
          FStar_Syntax_Syntax.lbpos = uu____338;_} ->
          let rng = FStar_Syntax_Syntax.range_of_lbname lbname in
          let t1 = FStar_Syntax_Subst.compress t in
          (match t1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_unknown ->
               let uu____373 = FStar_Syntax_Subst.open_univ_vars univ_vars e in
               (match uu____373 with
                | (univ_vars1, e1) ->
                    let env1 =
                      FStar_TypeChecker_Env.push_univ_vars env univ_vars1 in
                    let r = FStar_TypeChecker_Env.get_range env1 in
                    let rec aux e2 =
                      let e3 = FStar_Syntax_Subst.compress e2 in
                      match e3.FStar_Syntax_Syntax.n with
                      | FStar_Syntax_Syntax.Tm_meta (e4, uu____411) -> aux e4
                      | FStar_Syntax_Syntax.Tm_ascribed (e4, t2, uu____418)
                          -> FStar_Pervasives_Native.fst t2
                      | FStar_Syntax_Syntax.Tm_abs (bs, body, uu____473) ->
                          let res = aux body in
                          let c =
                            match res with
                            | FStar_Util.Inl t2 ->
                                let uu____509 = FStar_Options.ml_ish () in
                                if uu____509
                                then FStar_Syntax_Util.ml_comp t2 r
                                else FStar_Syntax_Syntax.mk_Total t2
                            | FStar_Util.Inr c -> c in
                          let t2 =
                            FStar_Syntax_Syntax.mk
                              (FStar_Syntax_Syntax.Tm_arrow (bs, c))
                              c.FStar_Syntax_Syntax.pos in
                          ((let uu____531 =
                              FStar_TypeChecker_Env.debug env1
                                FStar_Options.High in
                            if uu____531
                            then
                              let uu____534 = FStar_Range.string_of_range r in
                              let uu____536 =
                                FStar_Syntax_Print.term_to_string t2 in
                              FStar_Util.print2 "(%s) Using type %s\n"
                                uu____534 uu____536
                            else ());
                           FStar_Util.Inl t2)
                      | uu____541 -> FStar_Util.Inl FStar_Syntax_Syntax.tun in
                    let t2 =
                      let uu____543 = aux e1 in
                      match uu____543 with
                      | FStar_Util.Inr c ->
                          let uu____549 =
                            FStar_Syntax_Util.is_tot_or_gtot_comp c in
                          if uu____549
                          then FStar_Syntax_Util.comp_result c
                          else
                            (let uu____554 =
                               let uu____560 =
                                 let uu____562 =
                                   FStar_Syntax_Print.comp_to_string c in
                                 FStar_Util.format1
                                   "Expected a 'let rec' to be annotated with a value type; got a computation type %s"
                                   uu____562 in
                               (FStar_Errors.Fatal_UnexpectedComputationTypeForLetRec,
                                 uu____560) in
                             FStar_Errors.raise_error uu____554 rng)
                      | FStar_Util.Inl t2 -> t2 in
                    (univ_vars1, t2, true))
           | uu____571 ->
               let uu____572 = FStar_Syntax_Subst.open_univ_vars univ_vars t1 in
               (match uu____572 with
                | (univ_vars1, t2) -> (univ_vars1, t2, false)))
let rec (decorated_pattern_as_term :
  FStar_Syntax_Syntax.pat ->
    (FStar_Syntax_Syntax.bv Prims.list * FStar_Syntax_Syntax.term))
  =
  fun pat ->
    let mk f = FStar_Syntax_Syntax.mk f pat.FStar_Syntax_Syntax.p in
    let pat_as_arg uu____636 =
      match uu____636 with
      | (p, i) ->
          let uu____656 = decorated_pattern_as_term p in
          (match uu____656 with
           | (vars, te) ->
               let uu____679 =
                 let uu____684 = FStar_Syntax_Syntax.as_implicit i in
                 (te, uu____684) in
               (vars, uu____679)) in
    match pat.FStar_Syntax_Syntax.v with
    | FStar_Syntax_Syntax.Pat_constant c ->
        let uu____698 = mk (FStar_Syntax_Syntax.Tm_constant c) in
        ([], uu____698)
    | FStar_Syntax_Syntax.Pat_wild x ->
        let uu____702 = mk (FStar_Syntax_Syntax.Tm_name x) in
        ([x], uu____702)
    | FStar_Syntax_Syntax.Pat_var x ->
        let uu____706 = mk (FStar_Syntax_Syntax.Tm_name x) in
        ([x], uu____706)
    | FStar_Syntax_Syntax.Pat_cons (fv, pats) ->
        let uu____729 =
          let uu____748 =
            FStar_All.pipe_right pats (FStar_List.map pat_as_arg) in
          FStar_All.pipe_right uu____748 FStar_List.unzip in
        (match uu____729 with
         | (vars, args) ->
             let vars1 = FStar_List.flatten vars in
             let uu____886 =
               let uu____887 =
                 let uu____888 =
                   let uu____905 = FStar_Syntax_Syntax.fv_to_tm fv in
                   (uu____905, args) in
                 FStar_Syntax_Syntax.Tm_app uu____888 in
               mk uu____887 in
             (vars1, uu____886))
    | FStar_Syntax_Syntax.Pat_dot_term (x, e) -> ([], e)
let (comp_univ_opt :
  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option)
  =
  fun c ->
    match c.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Total (uu____944, uopt) -> uopt
    | FStar_Syntax_Syntax.GTotal (uu____954, uopt) -> uopt
    | FStar_Syntax_Syntax.Comp c1 ->
        (match c1.FStar_Syntax_Syntax.comp_univs with
         | [] -> FStar_Pervasives_Native.None
         | hd::uu____968 -> FStar_Pervasives_Native.Some hd)
let (lcomp_univ_opt :
  FStar_TypeChecker_Common.lcomp ->
    (FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option *
      FStar_TypeChecker_Common.guard_t))
  =
  fun lc ->
    let uu____983 =
      FStar_All.pipe_right lc FStar_TypeChecker_Common.lcomp_comp in
    FStar_All.pipe_right uu____983
      (fun uu____1011 ->
         match uu____1011 with | (c, g) -> ((comp_univ_opt c), g))
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
            let uu____1084 =
              let uu____1085 =
                let uu____1096 = FStar_Syntax_Syntax.as_arg wp in
                [uu____1096] in
              {
                FStar_Syntax_Syntax.comp_univs = [u_result];
                FStar_Syntax_Syntax.effect_name = mname;
                FStar_Syntax_Syntax.result_typ = result;
                FStar_Syntax_Syntax.effect_args = uu____1085;
                FStar_Syntax_Syntax.flags = flags
              } in
            FStar_Syntax_Syntax.mk_Comp uu____1084
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
        let err uu____1180 =
          let uu____1181 =
            let uu____1187 =
              let uu____1189 = FStar_Syntax_Print.term_to_string repr in
              let uu____1191 = FStar_Util.string_of_bool is_layered in
              FStar_Util.format2
                "Could not get effect args from repr %s with is_layered %s"
                uu____1189 uu____1191 in
            (FStar_Errors.Fatal_UnexpectedEffect, uu____1187) in
          FStar_Errors.raise_error uu____1181 r in
        let repr1 = FStar_Syntax_Subst.compress repr in
        if is_layered
        then
          match repr1.FStar_Syntax_Syntax.n with
          | FStar_Syntax_Syntax.Tm_app (uu____1203, uu____1204::is) ->
              FStar_All.pipe_right is
                (FStar_List.map FStar_Pervasives_Native.fst)
          | uu____1272 -> err ()
        else
          (match repr1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_arrow (uu____1277, c) ->
               let uu____1299 =
                 FStar_All.pipe_right c FStar_Syntax_Util.comp_to_comp_typ in
               FStar_All.pipe_right uu____1299
                 (fun ct ->
                    FStar_All.pipe_right ct.FStar_Syntax_Syntax.effect_args
                      (FStar_List.map FStar_Pervasives_Native.fst))
           | uu____1334 -> err ())
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
                let uu____1367 =
                  let uu____1369 =
                    FStar_TypeChecker_Env.lid_exists env
                      FStar_Parser_Const.effect_GTot_lid in
                  FStar_All.pipe_left Prims.op_Negation uu____1369 in
                if uu____1367
                then FStar_Syntax_Syntax.mk_Total a
                else
                  (let uu____1376 = FStar_Syntax_Util.is_unit a in
                   if uu____1376
                   then
                     FStar_Syntax_Syntax.mk_Total' a
                       (FStar_Pervasives_Native.Some
                          FStar_Syntax_Syntax.U_zero)
                   else
                     (let wp =
                        let uu____1382 =
                          env.FStar_TypeChecker_Env.lax &&
                            (FStar_Options.ml_ish ()) in
                        if uu____1382
                        then FStar_Syntax_Syntax.tun
                        else
                          (let ret_wp =
                             FStar_All.pipe_right ed
                               FStar_Syntax_Util.get_return_vc_combinator in
                           let uu____1388 =
                             let uu____1389 =
                               FStar_TypeChecker_Env.inst_effect_fun_with
                                 [u_a] env ed ret_wp in
                             let uu____1390 =
                               let uu____1391 = FStar_Syntax_Syntax.as_arg a in
                               let uu____1400 =
                                 let uu____1411 =
                                   FStar_Syntax_Syntax.as_arg e in
                                 [uu____1411] in
                               uu____1391 :: uu____1400 in
                             FStar_Syntax_Syntax.mk_Tm_app uu____1389
                               uu____1390 e.FStar_Syntax_Syntax.pos in
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Env.Beta;
                             FStar_TypeChecker_Env.NoFullNorm] env uu____1388) in
                      mk_comp ed u_a a wp [FStar_Syntax_Syntax.RETURN])) in
              (let uu____1445 =
                 FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                   (FStar_Options.Other "Return") in
               if uu____1445
               then
                 let uu____1450 =
                   FStar_Range.string_of_range e.FStar_Syntax_Syntax.pos in
                 let uu____1452 = FStar_Syntax_Print.term_to_string e in
                 let uu____1454 =
                   FStar_TypeChecker_Normalize.comp_to_string env c in
                 FStar_Util.print3 "(%s) returning %s at comp type %s\n"
                   uu____1450 uu____1452 uu____1454
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
              (let uu____1499 =
                 FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                   (FStar_Options.Other "LayeredEffects") in
               if uu____1499
               then
                 let uu____1504 =
                   FStar_Ident.string_of_lid ed.FStar_Syntax_Syntax.mname in
                 let uu____1506 = FStar_Syntax_Print.univ_to_string u_a in
                 let uu____1508 = FStar_Syntax_Print.term_to_string a in
                 let uu____1510 = FStar_Syntax_Print.term_to_string e in
                 FStar_Util.print4
                   "Computing %s.return for u_a:%s, a:%s, and e:%s{\n"
                   uu____1504 uu____1506 uu____1508 uu____1510
               else ());
              (let uu____1515 =
                 let uu____1520 =
                   FStar_All.pipe_right ed
                     FStar_Syntax_Util.get_return_vc_combinator in
                 FStar_TypeChecker_Env.inst_tscheme_with uu____1520 [u_a] in
               match uu____1515 with
               | (uu____1525, return_t) ->
                   let return_t_shape_error s =
                     let uu____1540 =
                       let uu____1542 =
                         FStar_Ident.string_of_lid
                           ed.FStar_Syntax_Syntax.mname in
                       let uu____1544 =
                         FStar_Syntax_Print.term_to_string return_t in
                       FStar_Util.format3
                         "%s.return %s does not have proper shape (reason:%s)"
                         uu____1542 uu____1544 s in
                     (FStar_Errors.Fatal_UnexpectedEffect, uu____1540) in
                   let uu____1548 =
                     let uu____1577 =
                       let uu____1578 = FStar_Syntax_Subst.compress return_t in
                       uu____1578.FStar_Syntax_Syntax.n in
                     match uu____1577 with
                     | FStar_Syntax_Syntax.Tm_arrow (bs, c) when
                         (FStar_List.length bs) >= (Prims.of_int (2)) ->
                         let uu____1638 = FStar_Syntax_Subst.open_comp bs c in
                         (match uu____1638 with
                          | (a_b::x_b::bs1, c1) ->
                              let uu____1707 =
                                FStar_Syntax_Util.comp_to_comp_typ c1 in
                              (a_b, x_b, bs1, uu____1707))
                     | uu____1728 ->
                         let uu____1729 =
                           return_t_shape_error
                             "Either not an arrow or not enough binders" in
                         FStar_Errors.raise_error uu____1729 r in
                   (match uu____1548 with
                    | (a_b, x_b, rest_bs, return_ct) ->
                        let uu____1812 =
                          let uu____1819 =
                            let uu____1820 =
                              let uu____1821 =
                                let uu____1828 =
                                  FStar_All.pipe_right a_b
                                    FStar_Pervasives_Native.fst in
                                (uu____1828, a) in
                              FStar_Syntax_Syntax.NT uu____1821 in
                            let uu____1839 =
                              let uu____1842 =
                                let uu____1843 =
                                  let uu____1850 =
                                    FStar_All.pipe_right x_b
                                      FStar_Pervasives_Native.fst in
                                  (uu____1850, e) in
                                FStar_Syntax_Syntax.NT uu____1843 in
                              [uu____1842] in
                            uu____1820 :: uu____1839 in
                          FStar_TypeChecker_Env.uvars_for_binders env rest_bs
                            uu____1819
                            (fun b ->
                               let uu____1866 =
                                 FStar_Syntax_Print.binder_to_string b in
                               let uu____1868 =
                                 let uu____1870 =
                                   FStar_Ident.string_of_lid
                                     ed.FStar_Syntax_Syntax.mname in
                                 FStar_Util.format1 "%s.return" uu____1870 in
                               let uu____1873 = FStar_Range.string_of_range r in
                               FStar_Util.format3
                                 "implicit var for binder %s of %s at %s"
                                 uu____1866 uu____1868 uu____1873) r in
                        (match uu____1812 with
                         | (rest_bs_uvars, g_uvars) ->
                             let subst =
                               FStar_List.map2
                                 (fun b ->
                                    fun t ->
                                      let uu____1910 =
                                        let uu____1917 =
                                          FStar_All.pipe_right b
                                            FStar_Pervasives_Native.fst in
                                        (uu____1917, t) in
                                      FStar_Syntax_Syntax.NT uu____1910) (a_b
                                 :: x_b :: rest_bs) (a :: e :: rest_bs_uvars) in
                             let is =
                               let uu____1943 =
                                 let uu____1946 =
                                   FStar_Syntax_Subst.compress
                                     return_ct.FStar_Syntax_Syntax.result_typ in
                                 let uu____1947 =
                                   FStar_Syntax_Util.is_layered ed in
                                 effect_args_from_repr uu____1946 uu____1947
                                   r in
                               FStar_All.pipe_right uu____1943
                                 (FStar_List.map
                                    (FStar_Syntax_Subst.subst subst)) in
                             let c =
                               let uu____1954 =
                                 let uu____1955 =
                                   FStar_All.pipe_right is
                                     (FStar_List.map
                                        FStar_Syntax_Syntax.as_arg) in
                                 {
                                   FStar_Syntax_Syntax.comp_univs = [u_a];
                                   FStar_Syntax_Syntax.effect_name =
                                     (ed.FStar_Syntax_Syntax.mname);
                                   FStar_Syntax_Syntax.result_typ = a;
                                   FStar_Syntax_Syntax.effect_args =
                                     uu____1955;
                                   FStar_Syntax_Syntax.flags = []
                                 } in
                               FStar_Syntax_Syntax.mk_Comp uu____1954 in
                             ((let uu____1979 =
                                 FStar_All.pipe_left
                                   (FStar_TypeChecker_Env.debug env)
                                   (FStar_Options.Other "LayeredEffects") in
                               if uu____1979
                               then
                                 let uu____1984 =
                                   FStar_Syntax_Print.comp_to_string c in
                                 FStar_Util.print1 "} c after return %s\n"
                                   uu____1984
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
              let uu____2028 =
                FStar_All.pipe_right ed FStar_Syntax_Util.is_layered in
              if uu____2028
              then mk_indexed_return env ed u_a a e r
              else
                (let uu____2038 = mk_wp_return env ed u_a a e r in
                 (uu____2038, FStar_TypeChecker_Env.trivial_guard))
let (lift_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp_typ ->
      FStar_TypeChecker_Env.mlift ->
        (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun c ->
      fun lift ->
        let uu____2063 =
          FStar_All.pipe_right
            (let uu___257_2065 = c in
             {
               FStar_Syntax_Syntax.comp_univs =
                 (uu___257_2065.FStar_Syntax_Syntax.comp_univs);
               FStar_Syntax_Syntax.effect_name =
                 (uu___257_2065.FStar_Syntax_Syntax.effect_name);
               FStar_Syntax_Syntax.result_typ =
                 (uu___257_2065.FStar_Syntax_Syntax.result_typ);
               FStar_Syntax_Syntax.effect_args =
                 (uu___257_2065.FStar_Syntax_Syntax.effect_args);
               FStar_Syntax_Syntax.flags = []
             }) FStar_Syntax_Syntax.mk_Comp in
        FStar_All.pipe_right uu____2063
          (lift.FStar_TypeChecker_Env.mlift_wp env)
let (join_effects :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident -> FStar_Ident.lident -> FStar_Ident.lident)
  =
  fun env ->
    fun l1_in ->
      fun l2_in ->
        let uu____2086 =
          let uu____2091 = FStar_TypeChecker_Env.norm_eff_name env l1_in in
          let uu____2092 = FStar_TypeChecker_Env.norm_eff_name env l2_in in
          (uu____2091, uu____2092) in
        match uu____2086 with
        | (l1, l2) ->
            let uu____2095 = FStar_TypeChecker_Env.join_opt env l1 l2 in
            (match uu____2095 with
             | FStar_Pervasives_Native.Some (m, uu____2105, uu____2106) -> m
             | FStar_Pervasives_Native.None ->
                 let uu____2119 =
                   FStar_TypeChecker_Env.exists_polymonadic_bind env l1 l2 in
                 (match uu____2119 with
                  | FStar_Pervasives_Native.Some (m, uu____2133) -> m
                  | FStar_Pervasives_Native.None ->
                      let uu____2166 =
                        let uu____2172 =
                          let uu____2174 =
                            FStar_Syntax_Print.lid_to_string l1_in in
                          let uu____2176 =
                            FStar_Syntax_Print.lid_to_string l2_in in
                          FStar_Util.format2
                            "Effects %s and %s cannot be composed" uu____2174
                            uu____2176 in
                        (FStar_Errors.Fatal_EffectsCannotBeComposed,
                          uu____2172) in
                      FStar_Errors.raise_error uu____2166
                        env.FStar_TypeChecker_Env.range))
let (join_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.lcomp ->
      FStar_TypeChecker_Common.lcomp -> FStar_Ident.lident)
  =
  fun env ->
    fun c1 ->
      fun c2 ->
        let uu____2196 =
          (FStar_TypeChecker_Common.is_total_lcomp c1) &&
            (FStar_TypeChecker_Common.is_total_lcomp c2) in
        if uu____2196
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
            let uu____2255 =
              FStar_TypeChecker_Env.join_opt env
                c11.FStar_Syntax_Syntax.effect_name
                c21.FStar_Syntax_Syntax.effect_name in
            match uu____2255 with
            | FStar_Pervasives_Native.Some (m, lift1, lift2) ->
                let uu____2283 = lift_comp env c11 lift1 in
                (match uu____2283 with
                 | (c12, g1) ->
                     let uu____2300 =
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
                          let uu____2339 = lift_comp env_x c21 lift2 in
                          match uu____2339 with
                          | (c22, g2) ->
                              let uu____2350 =
                                FStar_TypeChecker_Env.close_guard env 
                                  [x_a] g2 in
                              (c22, uu____2350)) in
                     (match uu____2300 with
                      | (c22, g2) -> (m, c12, c22, g1, g2)))
            | FStar_Pervasives_Native.None ->
                let uu____2381 =
                  let uu____2387 =
                    let uu____2389 =
                      FStar_Syntax_Print.lid_to_string
                        c11.FStar_Syntax_Syntax.effect_name in
                    let uu____2391 =
                      FStar_Syntax_Print.lid_to_string
                        c21.FStar_Syntax_Syntax.effect_name in
                    FStar_Util.format2 "Effects %s and %s cannot be composed"
                      uu____2389 uu____2391 in
                  (FStar_Errors.Fatal_EffectsCannotBeComposed, uu____2387) in
                FStar_Errors.raise_error uu____2381
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
            let uu____2453 = lift_comps_sep_guards env c1 c2 b for_bind in
            match uu____2453 with
            | (l, c11, c21, g1, g2) ->
                let uu____2477 = FStar_TypeChecker_Env.conj_guard g1 g2 in
                (l, c11, c21, uu____2477)
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
          let uu____2546 =
            FStar_Ident.lid_equals mname FStar_Parser_Const.effect_Tot_lid in
          if uu____2546
          then
            FStar_Syntax_Syntax.mk_Total' result
              (FStar_Pervasives_Native.Some u_result)
          else mk_comp_l mname u_result result FStar_Syntax_Syntax.tun flags
let (is_function : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t ->
    let uu____2558 =
      let uu____2559 = FStar_Syntax_Subst.compress t in
      uu____2559.FStar_Syntax_Syntax.n in
    match uu____2558 with
    | FStar_Syntax_Syntax.Tm_arrow uu____2563 -> true
    | uu____2579 -> false
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
              let uu____2649 =
                let uu____2651 = FStar_TypeChecker_Env.should_verify env in
                FStar_All.pipe_left Prims.op_Negation uu____2651 in
              if uu____2649
              then f
              else (let uu____2658 = reason1 () in label uu____2658 r f)
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
            let uu___354_2679 = g in
            let uu____2680 =
              let uu____2681 = label reason r f in
              FStar_TypeChecker_Common.NonTrivial uu____2681 in
            {
              FStar_TypeChecker_Common.guard_f = uu____2680;
              FStar_TypeChecker_Common.deferred_to_tac =
                (uu___354_2679.FStar_TypeChecker_Common.deferred_to_tac);
              FStar_TypeChecker_Common.deferred =
                (uu___354_2679.FStar_TypeChecker_Common.deferred);
              FStar_TypeChecker_Common.univ_ineqs =
                (uu___354_2679.FStar_TypeChecker_Common.univ_ineqs);
              FStar_TypeChecker_Common.implicits =
                (uu___354_2679.FStar_TypeChecker_Common.implicits)
            }
let (close_wp_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list ->
      FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun env ->
    fun bvs ->
      fun c ->
        let uu____2702 = FStar_Syntax_Util.is_ml_comp c in
        if uu____2702
        then c
        else
          (let uu____2707 =
             env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ()) in
           if uu____2707
           then c
           else
             (let close_wp u_res md res_t bvs1 wp0 =
                let close =
                  let uu____2749 =
                    FStar_All.pipe_right md
                      FStar_Syntax_Util.get_wp_close_combinator in
                  FStar_All.pipe_right uu____2749 FStar_Util.must in
                FStar_List.fold_right
                  (fun x ->
                     fun wp ->
                       let bs =
                         let uu____2778 = FStar_Syntax_Syntax.mk_binder x in
                         [uu____2778] in
                       let us =
                         let uu____2800 =
                           let uu____2803 =
                             env.FStar_TypeChecker_Env.universe_of env
                               x.FStar_Syntax_Syntax.sort in
                           [uu____2803] in
                         u_res :: uu____2800 in
                       let wp1 =
                         FStar_Syntax_Util.abs bs wp
                           (FStar_Pervasives_Native.Some
                              (FStar_Syntax_Util.mk_residual_comp
                                 FStar_Parser_Const.effect_Tot_lid
                                 FStar_Pervasives_Native.None
                                 [FStar_Syntax_Syntax.TOTAL])) in
                       let uu____2809 =
                         FStar_TypeChecker_Env.inst_effect_fun_with us env md
                           close in
                       let uu____2810 =
                         let uu____2811 = FStar_Syntax_Syntax.as_arg res_t in
                         let uu____2820 =
                           let uu____2831 =
                             FStar_Syntax_Syntax.as_arg
                               x.FStar_Syntax_Syntax.sort in
                           let uu____2840 =
                             let uu____2851 = FStar_Syntax_Syntax.as_arg wp1 in
                             [uu____2851] in
                           uu____2831 :: uu____2840 in
                         uu____2811 :: uu____2820 in
                       FStar_Syntax_Syntax.mk_Tm_app uu____2809 uu____2810
                         wp0.FStar_Syntax_Syntax.pos) bvs1 wp0 in
              let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c in
              let uu____2893 = destruct_wp_comp c1 in
              match uu____2893 with
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
                let uu____2933 =
                  FStar_All.pipe_right g
                    (FStar_TypeChecker_Env.close_guard env bs) in
                FStar_All.pipe_right uu____2933
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
                  let uu____2983 =
                    FStar_All.pipe_right g
                      (FStar_TypeChecker_Env.close_guard env bs) in
                  FStar_All.pipe_right uu____2983
                    (close_guard_implicits env false bs)))
let (should_not_inline_lc : FStar_TypeChecker_Common.lcomp -> Prims.bool) =
  fun lc ->
    FStar_All.pipe_right lc.FStar_TypeChecker_Common.cflags
      (FStar_Util.for_some
         (fun uu___0_2996 ->
            match uu___0_2996 with
            | FStar_Syntax_Syntax.SHOULD_NOT_INLINE -> true
            | uu____2999 -> false))
let (should_return :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
      FStar_TypeChecker_Common.lcomp -> Prims.bool)
  =
  fun env ->
    fun eopt ->
      fun lc ->
        let lc_is_unit_or_effectful =
          let uu____3024 =
            let uu____3027 =
              FStar_All.pipe_right lc.FStar_TypeChecker_Common.res_typ
                FStar_Syntax_Util.arrow_formals_comp in
            FStar_All.pipe_right uu____3027 FStar_Pervasives_Native.snd in
          FStar_All.pipe_right uu____3024
            (fun c ->
               (let uu____3051 =
                  FStar_TypeChecker_Env.is_reifiable_comp env c in
                Prims.op_Negation uu____3051) &&
                 ((FStar_All.pipe_right (FStar_Syntax_Util.comp_result c)
                     FStar_Syntax_Util.is_unit)
                    ||
                    (let uu____3055 =
                       FStar_Syntax_Util.is_pure_or_ghost_comp c in
                     Prims.op_Negation uu____3055))) in
        match eopt with
        | FStar_Pervasives_Native.None -> false
        | FStar_Pervasives_Native.Some e ->
            (((FStar_TypeChecker_Common.is_pure_or_ghost_lcomp lc) &&
                (Prims.op_Negation lc_is_unit_or_effectful))
               &&
               (let uu____3066 = FStar_Syntax_Util.head_and_args' e in
                match uu____3066 with
                | (head, uu____3083) ->
                    let uu____3104 =
                      let uu____3105 = FStar_Syntax_Util.un_uinst head in
                      uu____3105.FStar_Syntax_Syntax.n in
                    (match uu____3104 with
                     | FStar_Syntax_Syntax.Tm_fvar fv ->
                         let uu____3110 =
                           let uu____3112 = FStar_Syntax_Syntax.lid_of_fv fv in
                           FStar_TypeChecker_Env.is_irreducible env
                             uu____3112 in
                         Prims.op_Negation uu____3110
                     | uu____3113 -> true)))
              &&
              (let uu____3116 = should_not_inline_lc lc in
               Prims.op_Negation uu____3116)
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
            let uu____3162 =
              FStar_TypeChecker_Env.get_effect_decl env eff_lid in
            mk_return env uu____3162 u t v v.FStar_Syntax_Syntax.pos
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
                        let uu____3232 =
                          let uu____3234 =
                            FStar_All.pipe_right m FStar_Ident.ident_of_lid in
                          FStar_All.pipe_right uu____3234
                            FStar_Ident.string_of_id in
                        let uu____3236 =
                          let uu____3238 =
                            FStar_All.pipe_right n FStar_Ident.ident_of_lid in
                          FStar_All.pipe_right uu____3238
                            FStar_Ident.string_of_id in
                        let uu____3240 =
                          let uu____3242 =
                            FStar_All.pipe_right p FStar_Ident.ident_of_lid in
                          FStar_All.pipe_right uu____3242
                            FStar_Ident.string_of_id in
                        FStar_Util.format3 "(%s, %s) |> %s" uu____3232
                          uu____3236 uu____3240 in
                      (let uu____3246 =
                         FStar_All.pipe_left
                           (FStar_TypeChecker_Env.debug env)
                           (FStar_Options.Other "LayeredEffects") in
                       if uu____3246
                       then
                         let uu____3251 =
                           let uu____3253 = FStar_Syntax_Syntax.mk_Comp ct1 in
                           FStar_Syntax_Print.comp_to_string uu____3253 in
                         let uu____3254 =
                           let uu____3256 = FStar_Syntax_Syntax.mk_Comp ct2 in
                           FStar_Syntax_Print.comp_to_string uu____3256 in
                         FStar_Util.print2 "Binding c1:%s and c2:%s {\n"
                           uu____3251 uu____3254
                       else ());
                      (let uu____3261 =
                         FStar_All.pipe_left
                           (FStar_TypeChecker_Env.debug env)
                           (FStar_Options.Other "ResolveImplicitsHook") in
                       if uu____3261
                       then
                         let uu____3266 =
                           let uu____3268 =
                             FStar_TypeChecker_Env.get_range env in
                           FStar_Range.string_of_range uu____3268 in
                         let uu____3269 =
                           FStar_Syntax_Print.tscheme_to_string bind_t in
                         FStar_Util.print2
                           "///////////////////////////////Bind at %s/////////////////////\nwith bind_t = %s\n"
                           uu____3266 uu____3269
                       else ());
                      (let uu____3274 =
                         let uu____3281 =
                           FStar_TypeChecker_Env.get_effect_decl env m in
                         let uu____3282 =
                           FStar_TypeChecker_Env.get_effect_decl env n in
                         let uu____3283 =
                           FStar_TypeChecker_Env.get_effect_decl env p in
                         (uu____3281, uu____3282, uu____3283) in
                       match uu____3274 with
                       | (m_ed, n_ed, p_ed) ->
                           let uu____3291 =
                             let uu____3304 =
                               FStar_List.hd
                                 ct1.FStar_Syntax_Syntax.comp_univs in
                             let uu____3305 =
                               FStar_List.map FStar_Pervasives_Native.fst
                                 ct1.FStar_Syntax_Syntax.effect_args in
                             (uu____3304,
                               (ct1.FStar_Syntax_Syntax.result_typ),
                               uu____3305) in
                           (match uu____3291 with
                            | (u1, t1, is1) ->
                                let uu____3349 =
                                  let uu____3362 =
                                    FStar_List.hd
                                      ct2.FStar_Syntax_Syntax.comp_univs in
                                  let uu____3363 =
                                    FStar_List.map
                                      FStar_Pervasives_Native.fst
                                      ct2.FStar_Syntax_Syntax.effect_args in
                                  (uu____3362,
                                    (ct2.FStar_Syntax_Syntax.result_typ),
                                    uu____3363) in
                                (match uu____3349 with
                                 | (u2, t2, is2) ->
                                     let uu____3407 =
                                       FStar_TypeChecker_Env.inst_tscheme_with
                                         bind_t [u1; u2] in
                                     (match uu____3407 with
                                      | (uu____3416, bind_t1) ->
                                          let bind_t_shape_error s =
                                            let uu____3431 =
                                              let uu____3433 =
                                                FStar_Syntax_Print.term_to_string
                                                  bind_t1 in
                                              FStar_Util.format3
                                                "bind %s (%s) does not have proper shape (reason:%s)"
                                                uu____3433 bind_name s in
                                            (FStar_Errors.Fatal_UnexpectedEffect,
                                              uu____3431) in
                                          let uu____3437 =
                                            let uu____3482 =
                                              let uu____3483 =
                                                FStar_Syntax_Subst.compress
                                                  bind_t1 in
                                              uu____3483.FStar_Syntax_Syntax.n in
                                            match uu____3482 with
                                            | FStar_Syntax_Syntax.Tm_arrow
                                                (bs, c) when
                                                (FStar_List.length bs) >=
                                                  (Prims.of_int (4))
                                                ->
                                                let uu____3559 =
                                                  FStar_Syntax_Subst.open_comp
                                                    bs c in
                                                (match uu____3559 with
                                                 | (a_b::b_b::bs1, c1) ->
                                                     let uu____3644 =
                                                       let uu____3671 =
                                                         FStar_List.splitAt
                                                           ((FStar_List.length
                                                               bs1)
                                                              -
                                                              (Prims.of_int (2)))
                                                           bs1 in
                                                       FStar_All.pipe_right
                                                         uu____3671
                                                         (fun uu____3756 ->
                                                            match uu____3756
                                                            with
                                                            | (l1, l2) ->
                                                                let uu____3837
                                                                  =
                                                                  FStar_List.hd
                                                                    l2 in
                                                                let uu____3850
                                                                  =
                                                                  let uu____3857
                                                                    =
                                                                    FStar_List.tl
                                                                    l2 in
                                                                  FStar_List.hd
                                                                    uu____3857 in
                                                                (l1,
                                                                  uu____3837,
                                                                  uu____3850)) in
                                                     (match uu____3644 with
                                                      | (rest_bs, f_b, g_b)
                                                          ->
                                                          (a_b, b_b, rest_bs,
                                                            f_b, g_b, c1)))
                                            | uu____4017 ->
                                                let uu____4018 =
                                                  bind_t_shape_error
                                                    "Either not an arrow or not enough binders" in
                                                FStar_Errors.raise_error
                                                  uu____4018 r1 in
                                          (match uu____3437 with
                                           | (a_b, b_b, rest_bs, f_b, g_b,
                                              bind_c) ->
                                               let uu____4143 =
                                                 let uu____4150 =
                                                   let uu____4151 =
                                                     let uu____4152 =
                                                       let uu____4159 =
                                                         FStar_All.pipe_right
                                                           a_b
                                                           FStar_Pervasives_Native.fst in
                                                       (uu____4159, t1) in
                                                     FStar_Syntax_Syntax.NT
                                                       uu____4152 in
                                                   let uu____4170 =
                                                     let uu____4173 =
                                                       let uu____4174 =
                                                         let uu____4181 =
                                                           FStar_All.pipe_right
                                                             b_b
                                                             FStar_Pervasives_Native.fst in
                                                         (uu____4181, t2) in
                                                       FStar_Syntax_Syntax.NT
                                                         uu____4174 in
                                                     [uu____4173] in
                                                   uu____4151 :: uu____4170 in
                                                 FStar_TypeChecker_Env.uvars_for_binders
                                                   env rest_bs uu____4150
                                                   (fun b1 ->
                                                      let uu____4196 =
                                                        FStar_Syntax_Print.binder_to_string
                                                          b1 in
                                                      let uu____4198 =
                                                        FStar_Range.string_of_range
                                                          r1 in
                                                      FStar_Util.format3
                                                        "implicit var for binder %s of %s at %s"
                                                        uu____4196 bind_name
                                                        uu____4198) r1 in
                                               (match uu____4143 with
                                                | (rest_bs_uvars, g_uvars) ->
                                                    ((let uu____4212 =
                                                        FStar_All.pipe_left
                                                          (FStar_TypeChecker_Env.debug
                                                             env)
                                                          (FStar_Options.Other
                                                             "ResolveImplicitsHook") in
                                                      if uu____4212
                                                      then
                                                        FStar_All.pipe_right
                                                          rest_bs_uvars
                                                          (FStar_List.iter
                                                             (fun t ->
                                                                let uu____4226
                                                                  =
                                                                  let uu____4227
                                                                    =
                                                                    FStar_Syntax_Subst.compress
                                                                    t in
                                                                  uu____4227.FStar_Syntax_Syntax.n in
                                                                match uu____4226
                                                                with
                                                                | FStar_Syntax_Syntax.Tm_uvar
                                                                    (u,
                                                                    uu____4231)
                                                                    ->
                                                                    let uu____4248
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    t in
                                                                    let uu____4250
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
                                                                    uu____4256
                                                                    ->
                                                                    "<no attr>" in
                                                                    FStar_Util.print2
                                                                    "Generated uvar %s with attribute %s\n"
                                                                    uu____4248
                                                                    uu____4250))
                                                      else ());
                                                     (let subst =
                                                        FStar_List.map2
                                                          (fun b1 ->
                                                             fun t ->
                                                               let uu____4287
                                                                 =
                                                                 let uu____4294
                                                                   =
                                                                   FStar_All.pipe_right
                                                                    b1
                                                                    FStar_Pervasives_Native.fst in
                                                                 (uu____4294,
                                                                   t) in
                                                               FStar_Syntax_Syntax.NT
                                                                 uu____4287)
                                                          (a_b :: b_b ::
                                                          rest_bs) (t1 :: t2
                                                          :: rest_bs_uvars) in
                                                      let f_guard =
                                                        let f_sort_is =
                                                          let uu____4323 =
                                                            let uu____4326 =
                                                              let uu____4327
                                                                =
                                                                let uu____4328
                                                                  =
                                                                  FStar_All.pipe_right
                                                                    f_b
                                                                    FStar_Pervasives_Native.fst in
                                                                uu____4328.FStar_Syntax_Syntax.sort in
                                                              FStar_Syntax_Subst.compress
                                                                uu____4327 in
                                                            let uu____4337 =
                                                              FStar_Syntax_Util.is_layered
                                                                m_ed in
                                                            effect_args_from_repr
                                                              uu____4326
                                                              uu____4337 r1 in
                                                          FStar_All.pipe_right
                                                            uu____4323
                                                            (FStar_List.map
                                                               (FStar_Syntax_Subst.subst
                                                                  subst)) in
                                                        FStar_List.fold_left2
                                                          (fun g ->
                                                             fun i1 ->
                                                               fun f_i1 ->
                                                                 (let uu____4362
                                                                    =
                                                                    FStar_All.pipe_left
                                                                    (FStar_TypeChecker_Env.debug
                                                                    env)
                                                                    (FStar_Options.Other
                                                                    "ResolveImplicitsHook") in
                                                                  if
                                                                    uu____4362
                                                                  then
                                                                    let uu____4367
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    i1 in
                                                                    let uu____4369
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    f_i1 in
                                                                    FStar_Util.print2
                                                                    "Generating constraint %s = %s\n"
                                                                    uu____4367
                                                                    uu____4369
                                                                  else ());
                                                                 (let uu____4374
                                                                    =
                                                                    FStar_TypeChecker_Rel.layered_effect_teq
                                                                    env i1
                                                                    f_i1
                                                                    (FStar_Pervasives_Native.Some
                                                                    bind_name) in
                                                                  FStar_TypeChecker_Env.conj_guard
                                                                    g
                                                                    uu____4374))
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
                                                          let uu____4394 =
                                                            let uu____4395 =
                                                              let uu____4398
                                                                =
                                                                let uu____4399
                                                                  =
                                                                  FStar_All.pipe_right
                                                                    g_b
                                                                    FStar_Pervasives_Native.fst in
                                                                uu____4399.FStar_Syntax_Syntax.sort in
                                                              FStar_Syntax_Subst.compress
                                                                uu____4398 in
                                                            uu____4395.FStar_Syntax_Syntax.n in
                                                          match uu____4394
                                                          with
                                                          | FStar_Syntax_Syntax.Tm_arrow
                                                              (bs, c) ->
                                                              let uu____4432
                                                                =
                                                                FStar_Syntax_Subst.open_comp
                                                                  bs c in
                                                              (match uu____4432
                                                               with
                                                               | (bs1, c1) ->
                                                                   let bs_subst
                                                                    =
                                                                    let uu____4442
                                                                    =
                                                                    let uu____4449
                                                                    =
                                                                    let uu____4450
                                                                    =
                                                                    FStar_List.hd
                                                                    bs1 in
                                                                    FStar_All.pipe_right
                                                                    uu____4450
                                                                    FStar_Pervasives_Native.fst in
                                                                    let uu____4471
                                                                    =
                                                                    let uu____4474
                                                                    =
                                                                    FStar_All.pipe_right
                                                                    x_a
                                                                    FStar_Pervasives_Native.fst in
                                                                    FStar_All.pipe_right
                                                                    uu____4474
                                                                    FStar_Syntax_Syntax.bv_to_name in
                                                                    (uu____4449,
                                                                    uu____4471) in
                                                                    FStar_Syntax_Syntax.NT
                                                                    uu____4442 in
                                                                   let c2 =
                                                                    FStar_Syntax_Subst.subst_comp
                                                                    [bs_subst]
                                                                    c1 in
                                                                   let uu____4488
                                                                    =
                                                                    let uu____4491
                                                                    =
                                                                    FStar_Syntax_Subst.compress
                                                                    (FStar_Syntax_Util.comp_result
                                                                    c2) in
                                                                    let uu____4492
                                                                    =
                                                                    FStar_Syntax_Util.is_layered
                                                                    n_ed in
                                                                    effect_args_from_repr
                                                                    uu____4491
                                                                    uu____4492
                                                                    r1 in
                                                                   FStar_All.pipe_right
                                                                    uu____4488
                                                                    (FStar_List.map
                                                                    (FStar_Syntax_Subst.subst
                                                                    subst)))
                                                          | uu____4498 ->
                                                              failwith
                                                                "impossible: mk_indexed_bind" in
                                                        let env_g =
                                                          FStar_TypeChecker_Env.push_binders
                                                            env [x_a] in
                                                        let uu____4515 =
                                                          FStar_List.fold_left2
                                                            (fun g ->
                                                               fun i1 ->
                                                                 fun g_i1 ->
                                                                   (let uu____4533
                                                                    =
                                                                    FStar_All.pipe_left
                                                                    (FStar_TypeChecker_Env.debug
                                                                    env)
                                                                    (FStar_Options.Other
                                                                    "ResolveImplicitsHook") in
                                                                    if
                                                                    uu____4533
                                                                    then
                                                                    let uu____4538
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    i1 in
                                                                    let uu____4540
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    g_i1 in
                                                                    FStar_Util.print2
                                                                    "Generating constraint %s = %s\n"
                                                                    uu____4538
                                                                    uu____4540
                                                                    else ());
                                                                   (let uu____4545
                                                                    =
                                                                    FStar_TypeChecker_Rel.layered_effect_teq
                                                                    env_g i1
                                                                    g_i1
                                                                    (FStar_Pervasives_Native.Some
                                                                    bind_name) in
                                                                    FStar_TypeChecker_Env.conj_guard
                                                                    g
                                                                    uu____4545))
                                                            FStar_TypeChecker_Env.trivial_guard
                                                            is2 g_sort_is in
                                                        FStar_All.pipe_right
                                                          uu____4515
                                                          (FStar_TypeChecker_Env.close_guard
                                                             env [x_a]) in
                                                      let bind_ct =
                                                        let uu____4560 =
                                                          FStar_All.pipe_right
                                                            bind_c
                                                            (FStar_Syntax_Subst.subst_comp
                                                               subst) in
                                                        FStar_All.pipe_right
                                                          uu____4560
                                                          FStar_Syntax_Util.comp_to_comp_typ in
                                                      let fml =
                                                        let uu____4562 =
                                                          let uu____4567 =
                                                            FStar_List.hd
                                                              bind_ct.FStar_Syntax_Syntax.comp_univs in
                                                          let uu____4568 =
                                                            let uu____4569 =
                                                              FStar_List.hd
                                                                bind_ct.FStar_Syntax_Syntax.effect_args in
                                                            FStar_Pervasives_Native.fst
                                                              uu____4569 in
                                                          (uu____4567,
                                                            uu____4568) in
                                                        match uu____4562 with
                                                        | (u, wp) ->
                                                            FStar_TypeChecker_Env.pure_precondition_for_trivial_post
                                                              env u
                                                              bind_ct.FStar_Syntax_Syntax.result_typ
                                                              wp
                                                              FStar_Range.dummyRange in
                                                      let is =
                                                        let uu____4595 =
                                                          FStar_Syntax_Subst.compress
                                                            bind_ct.FStar_Syntax_Syntax.result_typ in
                                                        let uu____4596 =
                                                          FStar_Syntax_Util.is_layered
                                                            p_ed in
                                                        effect_args_from_repr
                                                          uu____4595
                                                          uu____4596 r1 in
                                                      let c =
                                                        let uu____4599 =
                                                          let uu____4600 =
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
                                                              = uu____4600;
                                                            FStar_Syntax_Syntax.flags
                                                              = flags
                                                          } in
                                                        FStar_Syntax_Syntax.mk_Comp
                                                          uu____4599 in
                                                      (let uu____4620 =
                                                         FStar_All.pipe_left
                                                           (FStar_TypeChecker_Env.debug
                                                              env)
                                                           (FStar_Options.Other
                                                              "LayeredEffects") in
                                                       if uu____4620
                                                       then
                                                         let uu____4625 =
                                                           FStar_Syntax_Print.comp_to_string
                                                             c in
                                                         FStar_Util.print1
                                                           "} c after bind: %s\n"
                                                           uu____4625
                                                       else ());
                                                      (let guard =
                                                         let uu____4631 =
                                                           let uu____4634 =
                                                             let uu____4637 =
                                                               let uu____4640
                                                                 =
                                                                 let uu____4643
                                                                   =
                                                                   FStar_TypeChecker_Env.guard_of_guard_formula
                                                                    (FStar_TypeChecker_Common.NonTrivial
                                                                    fml) in
                                                                 [uu____4643] in
                                                               g_guard ::
                                                                 uu____4640 in
                                                             f_guard ::
                                                               uu____4637 in
                                                           g_uvars ::
                                                             uu____4634 in
                                                         FStar_TypeChecker_Env.conj_guards
                                                           uu____4631 in
                                                       (let uu____4645 =
                                                          FStar_All.pipe_left
                                                            (FStar_TypeChecker_Env.debug
                                                               env)
                                                            (FStar_Options.Other
                                                               "ResolveImplicitsHook") in
                                                        if uu____4645
                                                        then
                                                          let uu____4650 =
                                                            let uu____4652 =
                                                              FStar_TypeChecker_Env.get_range
                                                                env in
                                                            FStar_Range.string_of_range
                                                              uu____4652 in
                                                          let uu____4653 =
                                                            FStar_TypeChecker_Rel.guard_to_string
                                                              env guard in
                                                          FStar_Util.print2
                                                            "///////////////////////////////EndBind at %s/////////////////////\nguard = %s\n"
                                                            uu____4650
                                                            uu____4653
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
                let uu____4702 =
                  let md = FStar_TypeChecker_Env.get_effect_decl env m in
                  let uu____4728 = FStar_TypeChecker_Env.wp_signature env m in
                  match uu____4728 with
                  | (a, kwp) ->
                      let uu____4759 = destruct_wp_comp ct1 in
                      let uu____4766 = destruct_wp_comp ct2 in
                      ((md, a, kwp), uu____4759, uu____4766) in
                match uu____4702 with
                | ((md, a, kwp), (u_t1, t1, wp1), (u_t2, t2, wp2)) ->
                    let bs =
                      match b with
                      | FStar_Pervasives_Native.None ->
                          let uu____4819 = FStar_Syntax_Syntax.null_binder t1 in
                          [uu____4819]
                      | FStar_Pervasives_Native.Some x ->
                          let uu____4839 = FStar_Syntax_Syntax.mk_binder x in
                          [uu____4839] in
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
                      let uu____4886 = FStar_Syntax_Syntax.as_arg r11 in
                      let uu____4895 =
                        let uu____4906 = FStar_Syntax_Syntax.as_arg t1 in
                        let uu____4915 =
                          let uu____4926 = FStar_Syntax_Syntax.as_arg t2 in
                          let uu____4935 =
                            let uu____4946 = FStar_Syntax_Syntax.as_arg wp1 in
                            let uu____4955 =
                              let uu____4966 =
                                let uu____4975 = mk_lam wp2 in
                                FStar_Syntax_Syntax.as_arg uu____4975 in
                              [uu____4966] in
                            uu____4946 :: uu____4955 in
                          uu____4926 :: uu____4935 in
                        uu____4906 :: uu____4915 in
                      uu____4886 :: uu____4895 in
                    let bind_wp =
                      FStar_All.pipe_right md
                        FStar_Syntax_Util.get_bind_vc_combinator in
                    let wp =
                      let uu____5026 =
                        FStar_TypeChecker_Env.inst_effect_fun_with
                          [u_t1; u_t2] env md bind_wp in
                      FStar_Syntax_Syntax.mk_Tm_app uu____5026 wp_args
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
              let uu____5074 =
                let uu____5079 =
                  FStar_TypeChecker_Env.unfold_effect_abbrev env c1 in
                let uu____5080 =
                  FStar_TypeChecker_Env.unfold_effect_abbrev env c2 in
                (uu____5079, uu____5080) in
              match uu____5074 with
              | (ct1, ct2) ->
                  let uu____5087 =
                    FStar_TypeChecker_Env.exists_polymonadic_bind env
                      ct1.FStar_Syntax_Syntax.effect_name
                      ct2.FStar_Syntax_Syntax.effect_name in
                  (match uu____5087 with
                   | FStar_Pervasives_Native.Some (p, f_bind) ->
                       f_bind env ct1 b ct2 flags r1
                   | FStar_Pervasives_Native.None ->
                       let uu____5138 = lift_comps env c1 c2 b true in
                       (match uu____5138 with
                        | (m, c11, c21, g_lift) ->
                            let uu____5156 =
                              let uu____5161 =
                                FStar_Syntax_Util.comp_to_comp_typ c11 in
                              let uu____5162 =
                                FStar_Syntax_Util.comp_to_comp_typ c21 in
                              (uu____5161, uu____5162) in
                            (match uu____5156 with
                             | (ct11, ct21) ->
                                 let uu____5169 =
                                   let uu____5174 =
                                     FStar_TypeChecker_Env.is_layered_effect
                                       env m in
                                   if uu____5174
                                   then
                                     let bind_t =
                                       let uu____5182 =
                                         FStar_All.pipe_right m
                                           (FStar_TypeChecker_Env.get_effect_decl
                                              env) in
                                       FStar_All.pipe_right uu____5182
                                         FStar_Syntax_Util.get_bind_vc_combinator in
                                     mk_indexed_bind env m m m bind_t ct11 b
                                       ct21 flags r1
                                   else
                                     (let uu____5185 =
                                        mk_wp_bind env m ct11 b ct21 flags r1 in
                                      (uu____5185,
                                        FStar_TypeChecker_Env.trivial_guard)) in
                                 (match uu____5169 with
                                  | (c, g_bind) ->
                                      let uu____5192 =
                                        FStar_TypeChecker_Env.conj_guard
                                          g_lift g_bind in
                                      (c, uu____5192)))))
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
            let uu____5228 =
              let uu____5229 =
                let uu____5240 =
                  FStar_All.pipe_right wp1 FStar_Syntax_Syntax.as_arg in
                [uu____5240] in
              {
                FStar_Syntax_Syntax.comp_univs = [FStar_Syntax_Syntax.U_zero];
                FStar_Syntax_Syntax.effect_name =
                  FStar_Parser_Const.effect_PURE_lid;
                FStar_Syntax_Syntax.result_typ = FStar_Syntax_Syntax.t_unit;
                FStar_Syntax_Syntax.effect_args = uu____5229;
                FStar_Syntax_Syntax.flags = []
              } in
            FStar_Syntax_Syntax.mk_Comp uu____5228 in
          mk_bind env pure_c FStar_Pervasives_Native.None c flags r
let (weaken_flags :
  FStar_Syntax_Syntax.cflag Prims.list ->
    FStar_Syntax_Syntax.cflag Prims.list)
  =
  fun flags ->
    let uu____5285 =
      FStar_All.pipe_right flags
        (FStar_Util.for_some
           (fun uu___1_5291 ->
              match uu___1_5291 with
              | FStar_Syntax_Syntax.SHOULD_NOT_INLINE -> true
              | uu____5294 -> false)) in
    if uu____5285
    then [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
    else
      FStar_All.pipe_right flags
        (FStar_List.collect
           (fun uu___2_5306 ->
              match uu___2_5306 with
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
        let uu____5334 = FStar_Syntax_Util.is_ml_comp c in
        if uu____5334
        then (c, FStar_TypeChecker_Env.trivial_guard)
        else
          (let ct = FStar_TypeChecker_Env.unfold_effect_abbrev env c in
           let pure_assume_wp =
             let uu____5345 =
               FStar_Syntax_Syntax.lid_as_fv
                 FStar_Parser_Const.pure_assume_wp_lid
                 (FStar_Syntax_Syntax.Delta_constant_at_level Prims.int_one)
                 FStar_Pervasives_Native.None in
             FStar_Syntax_Syntax.fv_to_tm uu____5345 in
           let pure_assume_wp1 =
             let uu____5348 =
               let uu____5349 =
                 FStar_All.pipe_left FStar_Syntax_Syntax.as_arg formula in
               [uu____5349] in
             let uu____5382 = FStar_TypeChecker_Env.get_range env in
             FStar_Syntax_Syntax.mk_Tm_app pure_assume_wp uu____5348
               uu____5382 in
           let uu____5383 = weaken_flags ct.FStar_Syntax_Syntax.flags in
           bind_pure_wp_with env pure_assume_wp1 c uu____5383)
let (weaken_precondition :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.lcomp ->
      FStar_TypeChecker_Common.guard_formula ->
        FStar_TypeChecker_Common.lcomp)
  =
  fun env ->
    fun lc ->
      fun f ->
        let weaken uu____5411 =
          let uu____5412 = FStar_TypeChecker_Common.lcomp_comp lc in
          match uu____5412 with
          | (c, g_c) ->
              let uu____5423 =
                env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ()) in
              if uu____5423
              then (c, g_c)
              else
                (match f with
                 | FStar_TypeChecker_Common.Trivial -> (c, g_c)
                 | FStar_TypeChecker_Common.NonTrivial f1 ->
                     let uu____5437 = weaken_comp env c f1 in
                     (match uu____5437 with
                      | (c1, g_w) ->
                          let uu____5448 =
                            FStar_TypeChecker_Env.conj_guard g_c g_w in
                          (c1, uu____5448))) in
        let uu____5449 = weaken_flags lc.FStar_TypeChecker_Common.cflags in
        FStar_TypeChecker_Common.mk_lcomp
          lc.FStar_TypeChecker_Common.eff_name
          lc.FStar_TypeChecker_Common.res_typ uu____5449 weaken
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
                 let uu____5506 =
                   FStar_Syntax_Syntax.lid_as_fv
                     FStar_Parser_Const.pure_assert_wp_lid
                     (FStar_Syntax_Syntax.Delta_constant_at_level
                        Prims.int_one) FStar_Pervasives_Native.None in
                 FStar_Syntax_Syntax.fv_to_tm uu____5506 in
               let pure_assert_wp1 =
                 let uu____5509 =
                   let uu____5510 =
                     let uu____5519 = label_opt env reason r f in
                     FStar_All.pipe_left FStar_Syntax_Syntax.as_arg
                       uu____5519 in
                   [uu____5510] in
                 FStar_Syntax_Syntax.mk_Tm_app pure_assert_wp uu____5509 r in
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
            let uu____5589 =
              FStar_TypeChecker_Env.is_trivial_guard_formula g0 in
            if uu____5589
            then (lc, g0)
            else
              (let flags =
                 let uu____5601 =
                   let uu____5609 =
                     FStar_TypeChecker_Common.is_tot_or_gtot_lcomp lc in
                   if uu____5609
                   then (true, [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION])
                   else (false, []) in
                 match uu____5601 with
                 | (maybe_trivial_post, flags) ->
                     let uu____5639 =
                       FStar_All.pipe_right
                         lc.FStar_TypeChecker_Common.cflags
                         (FStar_List.collect
                            (fun uu___3_5647 ->
                               match uu___3_5647 with
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
                               | uu____5650 -> [])) in
                     FStar_List.append flags uu____5639 in
               let strengthen uu____5660 =
                 let uu____5661 = FStar_TypeChecker_Common.lcomp_comp lc in
                 match uu____5661 with
                 | (c, g_c) ->
                     if env.FStar_TypeChecker_Env.lax
                     then (c, g_c)
                     else
                       (let g01 = FStar_TypeChecker_Rel.simplify_guard env g0 in
                        let uu____5680 = FStar_TypeChecker_Env.guard_form g01 in
                        match uu____5680 with
                        | FStar_TypeChecker_Common.Trivial -> (c, g_c)
                        | FStar_TypeChecker_Common.NonTrivial f ->
                            ((let uu____5687 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  FStar_Options.Extreme in
                              if uu____5687
                              then
                                let uu____5691 =
                                  FStar_TypeChecker_Normalize.term_to_string
                                    env e_for_debugging_only in
                                let uu____5693 =
                                  FStar_TypeChecker_Normalize.term_to_string
                                    env f in
                                FStar_Util.print2
                                  "-------------Strengthening pre-condition of term %s with guard %s\n"
                                  uu____5691 uu____5693
                              else ());
                             (let uu____5698 =
                                strengthen_comp env reason c f flags in
                              match uu____5698 with
                              | (c1, g_s) ->
                                  let uu____5709 =
                                    FStar_TypeChecker_Env.conj_guard g_c g_s in
                                  (c1, uu____5709)))) in
               let uu____5710 =
                 let uu____5711 =
                   FStar_TypeChecker_Env.norm_eff_name env
                     lc.FStar_TypeChecker_Common.eff_name in
                 FStar_TypeChecker_Common.mk_lcomp uu____5711
                   lc.FStar_TypeChecker_Common.res_typ flags strengthen in
               (uu____5710,
                 (let uu___678_5713 = g0 in
                  {
                    FStar_TypeChecker_Common.guard_f =
                      FStar_TypeChecker_Common.Trivial;
                    FStar_TypeChecker_Common.deferred_to_tac =
                      (uu___678_5713.FStar_TypeChecker_Common.deferred_to_tac);
                    FStar_TypeChecker_Common.deferred =
                      (uu___678_5713.FStar_TypeChecker_Common.deferred);
                    FStar_TypeChecker_Common.univ_ineqs =
                      (uu___678_5713.FStar_TypeChecker_Common.univ_ineqs);
                    FStar_TypeChecker_Common.implicits =
                      (uu___678_5713.FStar_TypeChecker_Common.implicits)
                  })))
let (lcomp_has_trivial_postcondition :
  FStar_TypeChecker_Common.lcomp -> Prims.bool) =
  fun lc ->
    (FStar_TypeChecker_Common.is_tot_or_gtot_lcomp lc) ||
      (FStar_Util.for_some
         (fun uu___4_5722 ->
            match uu___4_5722 with
            | FStar_Syntax_Syntax.SOMETRIVIAL -> true
            | FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION -> true
            | uu____5726 -> false) lc.FStar_TypeChecker_Common.cflags)
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
          let uu____5755 =
            (FStar_TypeChecker_Common.is_lcomp_partial_return lc) ||
              env.FStar_TypeChecker_Env.lax in
          if uu____5755
          then e
          else
            (let uu____5762 =
               (lcomp_has_trivial_postcondition lc) &&
                 (let uu____5765 =
                    FStar_TypeChecker_Env.try_lookup_lid env
                      FStar_Parser_Const.with_type_lid in
                  FStar_Option.isSome uu____5765) in
             if uu____5762
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
                | uu____5835 -> false in
              if is_unit
              then
                let uu____5842 =
                  let uu____5844 =
                    let uu____5845 =
                      FStar_All.pipe_right c
                        FStar_Syntax_Util.comp_effect_name in
                    FStar_All.pipe_right uu____5845
                      (FStar_TypeChecker_Env.norm_eff_name env) in
                  FStar_All.pipe_right uu____5844
                    (FStar_TypeChecker_Env.is_layered_effect env) in
                (if uu____5842
                 then
                   let uu____5854 = FStar_Syntax_Subst.open_term_bv b phi in
                   match uu____5854 with
                   | (b1, phi1) ->
                       let phi2 =
                         FStar_Syntax_Subst.subst
                           [FStar_Syntax_Syntax.NT
                              (b1, FStar_Syntax_Syntax.unit_const)] phi1 in
                       weaken_comp env c phi2
                 else
                   (let uu____5870 = close_wp_comp env [x] c in
                    (uu____5870, FStar_TypeChecker_Env.trivial_guard)))
              else (c, FStar_TypeChecker_Env.trivial_guard)
          | uu____5873 -> (c, FStar_TypeChecker_Env.trivial_guard)
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
          fun uu____5901 ->
            match uu____5901 with
            | (b, lc2) ->
                let debug f =
                  let uu____5921 =
                    (FStar_TypeChecker_Env.debug env FStar_Options.Extreme)
                      ||
                      (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "bind")) in
                  if uu____5921 then f () else () in
                let lc11 =
                  FStar_TypeChecker_Normalize.ghost_to_pure_lcomp env lc1 in
                let lc21 =
                  FStar_TypeChecker_Normalize.ghost_to_pure_lcomp env lc2 in
                let joined_eff = join_lcomp env lc11 lc21 in
                let bind_flags =
                  let uu____5934 =
                    (should_not_inline_lc lc11) ||
                      (should_not_inline_lc lc21) in
                  if uu____5934
                  then [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
                  else
                    (let flags =
                       let uu____5944 =
                         FStar_TypeChecker_Common.is_total_lcomp lc11 in
                       if uu____5944
                       then
                         let uu____5949 =
                           FStar_TypeChecker_Common.is_total_lcomp lc21 in
                         (if uu____5949
                          then [FStar_Syntax_Syntax.TOTAL]
                          else
                            (let uu____5956 =
                               FStar_TypeChecker_Common.is_tot_or_gtot_lcomp
                                 lc21 in
                             if uu____5956
                             then [FStar_Syntax_Syntax.SOMETRIVIAL]
                             else []))
                       else
                         (let uu____5965 =
                            (FStar_TypeChecker_Common.is_tot_or_gtot_lcomp
                               lc11)
                              &&
                              (FStar_TypeChecker_Common.is_tot_or_gtot_lcomp
                                 lc21) in
                          if uu____5965
                          then [FStar_Syntax_Syntax.SOMETRIVIAL]
                          else []) in
                     let uu____5972 = lcomp_has_trivial_postcondition lc21 in
                     if uu____5972
                     then FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION :: flags
                     else flags) in
                let bind_it uu____5988 =
                  let uu____5989 =
                    env.FStar_TypeChecker_Env.lax &&
                      (FStar_Options.ml_ish ()) in
                  if uu____5989
                  then
                    let u_t =
                      env.FStar_TypeChecker_Env.universe_of env
                        lc21.FStar_TypeChecker_Common.res_typ in
                    let uu____5997 =
                      lax_mk_tot_or_comp_l joined_eff u_t
                        lc21.FStar_TypeChecker_Common.res_typ [] in
                    (uu____5997, FStar_TypeChecker_Env.trivial_guard)
                  else
                    (let uu____6000 =
                       FStar_TypeChecker_Common.lcomp_comp lc11 in
                     match uu____6000 with
                     | (c1, g_c1) ->
                         let uu____6011 =
                           FStar_TypeChecker_Common.lcomp_comp lc21 in
                         (match uu____6011 with
                          | (c2, g_c2) ->
                              let trivial_guard =
                                let uu____6023 =
                                  match b with
                                  | FStar_Pervasives_Native.Some x ->
                                      let b1 =
                                        FStar_Syntax_Syntax.mk_binder x in
                                      let uu____6026 =
                                        FStar_Syntax_Syntax.is_null_binder b1 in
                                      if uu____6026
                                      then g_c2
                                      else
                                        FStar_TypeChecker_Env.close_guard env
                                          [b1] g_c2
                                  | FStar_Pervasives_Native.None -> g_c2 in
                                FStar_TypeChecker_Env.conj_guard g_c1
                                  uu____6023 in
                              (debug
                                 (fun uu____6052 ->
                                    let uu____6053 =
                                      FStar_Syntax_Print.comp_to_string c1 in
                                    let uu____6055 =
                                      match b with
                                      | FStar_Pervasives_Native.None ->
                                          "none"
                                      | FStar_Pervasives_Native.Some x ->
                                          FStar_Syntax_Print.bv_to_string x in
                                    let uu____6060 =
                                      FStar_Syntax_Print.comp_to_string c2 in
                                    FStar_Util.print3
                                      "(1) bind: \n\tc1=%s\n\tx=%s\n\tc2=%s\n(1. end bind)\n"
                                      uu____6053 uu____6055 uu____6060);
                               (let aux uu____6078 =
                                  let uu____6079 =
                                    FStar_Syntax_Util.is_trivial_wp c1 in
                                  if uu____6079
                                  then
                                    match b with
                                    | FStar_Pervasives_Native.None ->
                                        FStar_Util.Inl
                                          (c2, "trivial no binder")
                                    | FStar_Pervasives_Native.Some uu____6110
                                        ->
                                        let uu____6111 =
                                          FStar_Syntax_Util.is_ml_comp c2 in
                                        (if uu____6111
                                         then
                                           FStar_Util.Inl (c2, "trivial ml")
                                         else
                                           FStar_Util.Inr
                                             "c1 trivial; but c2 is not ML")
                                  else
                                    (let uu____6143 =
                                       (FStar_Syntax_Util.is_ml_comp c1) &&
                                         (FStar_Syntax_Util.is_ml_comp c2) in
                                     if uu____6143
                                     then FStar_Util.Inl (c2, "both ml")
                                     else
                                       FStar_Util.Inr
                                         "c1 not trivial, and both are not ML") in
                                let try_simplify uu____6190 =
                                  let aux_with_trivial_guard uu____6220 =
                                    let uu____6221 = aux () in
                                    match uu____6221 with
                                    | FStar_Util.Inl (c, reason) ->
                                        FStar_Util.Inl
                                          (c, trivial_guard, reason)
                                    | FStar_Util.Inr reason ->
                                        FStar_Util.Inr reason in
                                  let uu____6279 =
                                    let uu____6281 =
                                      FStar_TypeChecker_Env.try_lookup_effect_lid
                                        env
                                        FStar_Parser_Const.effect_GTot_lid in
                                    FStar_Option.isNone uu____6281 in
                                  if uu____6279
                                  then
                                    let uu____6297 =
                                      (FStar_Syntax_Util.is_tot_or_gtot_comp
                                         c1)
                                        &&
                                        (FStar_Syntax_Util.is_tot_or_gtot_comp
                                           c2) in
                                    (if uu____6297
                                     then
                                       FStar_Util.Inl
                                         (c2, trivial_guard,
                                           "Early in prims; we don't have bind yet")
                                     else
                                       (let uu____6324 =
                                          FStar_TypeChecker_Env.get_range env in
                                        FStar_Errors.raise_error
                                          (FStar_Errors.Fatal_NonTrivialPreConditionInPrims,
                                            "Non-trivial pre-conditions very early in prims, even before we have defined the PURE monad")
                                          uu____6324))
                                  else
                                    (let uu____6341 =
                                       FStar_Syntax_Util.is_total_comp c1 in
                                     if uu____6341
                                     then
                                       let close_with_type_of_x x c =
                                         let x1 =
                                           let uu___781_6372 = x in
                                           {
                                             FStar_Syntax_Syntax.ppname =
                                               (uu___781_6372.FStar_Syntax_Syntax.ppname);
                                             FStar_Syntax_Syntax.index =
                                               (uu___781_6372.FStar_Syntax_Syntax.index);
                                             FStar_Syntax_Syntax.sort =
                                               (FStar_Syntax_Util.comp_result
                                                  c1)
                                           } in
                                         maybe_capture_unit_refinement env
                                           x1.FStar_Syntax_Syntax.sort x1 c in
                                       match (e1opt, b) with
                                       | (FStar_Pervasives_Native.Some e,
                                          FStar_Pervasives_Native.Some x) ->
                                           let uu____6403 =
                                             let uu____6408 =
                                               FStar_All.pipe_right c2
                                                 (FStar_Syntax_Subst.subst_comp
                                                    [FStar_Syntax_Syntax.NT
                                                       (x, e)]) in
                                             FStar_All.pipe_right uu____6408
                                               (close_with_type_of_x x) in
                                           (match uu____6403 with
                                            | (c21, g_close) ->
                                                let uu____6429 =
                                                  let uu____6437 =
                                                    let uu____6438 =
                                                      let uu____6441 =
                                                        let uu____6444 =
                                                          FStar_TypeChecker_Env.map_guard
                                                            g_c2
                                                            (FStar_Syntax_Subst.subst
                                                               [FStar_Syntax_Syntax.NT
                                                                  (x, e)]) in
                                                        [uu____6444; g_close] in
                                                      g_c1 :: uu____6441 in
                                                    FStar_TypeChecker_Env.conj_guards
                                                      uu____6438 in
                                                  (c21, uu____6437, "c1 Tot") in
                                                FStar_Util.Inl uu____6429)
                                       | (uu____6457,
                                          FStar_Pervasives_Native.Some x) ->
                                           let uu____6469 =
                                             FStar_All.pipe_right c2
                                               (close_with_type_of_x x) in
                                           (match uu____6469 with
                                            | (c21, g_close) ->
                                                let uu____6492 =
                                                  let uu____6500 =
                                                    let uu____6501 =
                                                      let uu____6504 =
                                                        let uu____6507 =
                                                          let uu____6508 =
                                                            let uu____6509 =
                                                              FStar_Syntax_Syntax.mk_binder
                                                                x in
                                                            [uu____6509] in
                                                          FStar_TypeChecker_Env.close_guard
                                                            env uu____6508
                                                            g_c2 in
                                                        [uu____6507; g_close] in
                                                      g_c1 :: uu____6504 in
                                                    FStar_TypeChecker_Env.conj_guards
                                                      uu____6501 in
                                                  (c21, uu____6500,
                                                    "c1 Tot only close") in
                                                FStar_Util.Inl uu____6492)
                                       | (uu____6538, uu____6539) ->
                                           aux_with_trivial_guard ()
                                     else
                                       (let uu____6554 =
                                          (FStar_Syntax_Util.is_tot_or_gtot_comp
                                             c1)
                                            &&
                                            (FStar_Syntax_Util.is_tot_or_gtot_comp
                                               c2) in
                                        if uu____6554
                                        then
                                          let uu____6569 =
                                            let uu____6577 =
                                              FStar_Syntax_Syntax.mk_GTotal
                                                (FStar_Syntax_Util.comp_result
                                                   c2) in
                                            (uu____6577, trivial_guard,
                                              "both GTot") in
                                          FStar_Util.Inl uu____6569
                                        else aux_with_trivial_guard ())) in
                                let uu____6590 = try_simplify () in
                                match uu____6590 with
                                | FStar_Util.Inl (c, g, reason) ->
                                    (debug
                                       (fun uu____6625 ->
                                          let uu____6626 =
                                            FStar_Syntax_Print.comp_to_string
                                              c in
                                          FStar_Util.print2
                                            "(2) bind: Simplified (because %s) to\n\t%s\n"
                                            reason uu____6626);
                                     (c, g))
                                | FStar_Util.Inr reason ->
                                    (debug
                                       (fun uu____6642 ->
                                          FStar_Util.print1
                                            "(2) bind: Not simplified because %s\n"
                                            reason);
                                     (let mk_bind1 c11 b1 c21 g =
                                        let uu____6673 =
                                          mk_bind env c11 b1 c21 bind_flags
                                            r1 in
                                        match uu____6673 with
                                        | (c, g_bind) ->
                                            let uu____6684 =
                                              FStar_TypeChecker_Env.conj_guard
                                                g g_bind in
                                            (c, uu____6684) in
                                      let mk_seq c11 b1 c21 =
                                        let c12 =
                                          FStar_TypeChecker_Env.unfold_effect_abbrev
                                            env c11 in
                                        let c22 =
                                          FStar_TypeChecker_Env.unfold_effect_abbrev
                                            env c21 in
                                        let uu____6711 =
                                          FStar_TypeChecker_Env.join env
                                            c12.FStar_Syntax_Syntax.effect_name
                                            c22.FStar_Syntax_Syntax.effect_name in
                                        match uu____6711 with
                                        | (m, uu____6723, lift2) ->
                                            let uu____6725 =
                                              lift_comp env c22 lift2 in
                                            (match uu____6725 with
                                             | (c23, g2) ->
                                                 let uu____6736 =
                                                   destruct_wp_comp c12 in
                                                 (match uu____6736 with
                                                  | (u1, t1, wp1) ->
                                                      let md_pure_or_ghost =
                                                        FStar_TypeChecker_Env.get_effect_decl
                                                          env
                                                          c12.FStar_Syntax_Syntax.effect_name in
                                                      let trivial =
                                                        let uu____6752 =
                                                          FStar_All.pipe_right
                                                            md_pure_or_ghost
                                                            FStar_Syntax_Util.get_wp_trivial_combinator in
                                                        FStar_All.pipe_right
                                                          uu____6752
                                                          FStar_Util.must in
                                                      let vc1 =
                                                        let uu____6760 =
                                                          FStar_TypeChecker_Env.inst_effect_fun_with
                                                            [u1] env
                                                            md_pure_or_ghost
                                                            trivial in
                                                        let uu____6761 =
                                                          let uu____6762 =
                                                            FStar_Syntax_Syntax.as_arg
                                                              t1 in
                                                          let uu____6771 =
                                                            let uu____6782 =
                                                              FStar_Syntax_Syntax.as_arg
                                                                wp1 in
                                                            [uu____6782] in
                                                          uu____6762 ::
                                                            uu____6771 in
                                                        FStar_Syntax_Syntax.mk_Tm_app
                                                          uu____6760
                                                          uu____6761 r1 in
                                                      let uu____6815 =
                                                        strengthen_comp env
                                                          FStar_Pervasives_Native.None
                                                          c23 vc1 bind_flags in
                                                      (match uu____6815 with
                                                       | (c, g_s) ->
                                                           let uu____6830 =
                                                             FStar_TypeChecker_Env.conj_guards
                                                               [g_c1;
                                                               g_c2;
                                                               g2;
                                                               g_s] in
                                                           (c, uu____6830)))) in
                                      let uu____6831 =
                                        let t =
                                          FStar_Syntax_Util.comp_result c1 in
                                        match comp_univ_opt c1 with
                                        | FStar_Pervasives_Native.None ->
                                            let uu____6847 =
                                              env.FStar_TypeChecker_Env.universe_of
                                                env t in
                                            (uu____6847, t)
                                        | FStar_Pervasives_Native.Some u ->
                                            (u, t) in
                                      match uu____6831 with
                                      | (u_res_t1, res_t1) ->
                                          let uu____6863 =
                                            (FStar_Option.isSome b) &&
                                              (should_return env e1opt lc11) in
                                          if uu____6863
                                          then
                                            let e1 = FStar_Option.get e1opt in
                                            let x = FStar_Option.get b in
                                            let uu____6872 =
                                              FStar_Syntax_Util.is_partial_return
                                                c1 in
                                            (if uu____6872
                                             then
                                               (debug
                                                  (fun uu____6886 ->
                                                     let uu____6887 =
                                                       FStar_TypeChecker_Normalize.term_to_string
                                                         env e1 in
                                                     let uu____6889 =
                                                       FStar_Syntax_Print.bv_to_string
                                                         x in
                                                     FStar_Util.print2
                                                       "(3) bind (case a): Substituting %s for %s"
                                                       uu____6887 uu____6889);
                                                (let c21 =
                                                   FStar_Syntax_Subst.subst_comp
                                                     [FStar_Syntax_Syntax.NT
                                                        (x, e1)] c2 in
                                                 let g =
                                                   let uu____6896 =
                                                     FStar_TypeChecker_Env.map_guard
                                                       g_c2
                                                       (FStar_Syntax_Subst.subst
                                                          [FStar_Syntax_Syntax.NT
                                                             (x, e1)]) in
                                                   FStar_TypeChecker_Env.conj_guard
                                                     g_c1 uu____6896 in
                                                 mk_bind1 c1 b c21 g))
                                             else
                                               (let uu____6901 =
                                                  ((FStar_Options.vcgen_optimize_bind_as_seq
                                                      ())
                                                     &&
                                                     (lcomp_has_trivial_postcondition
                                                        lc11))
                                                    &&
                                                    (let uu____6904 =
                                                       FStar_TypeChecker_Env.try_lookup_lid
                                                         env
                                                         FStar_Parser_Const.with_type_lid in
                                                     FStar_Option.isSome
                                                       uu____6904) in
                                                if uu____6901
                                                then
                                                  let e1' =
                                                    let uu____6929 =
                                                      FStar_Options.vcgen_decorate_with_type
                                                        () in
                                                    if uu____6929
                                                    then
                                                      FStar_Syntax_Util.mk_with_type
                                                        u_res_t1 res_t1 e1
                                                    else e1 in
                                                  (debug
                                                     (fun uu____6941 ->
                                                        let uu____6942 =
                                                          FStar_TypeChecker_Normalize.term_to_string
                                                            env e1' in
                                                        let uu____6944 =
                                                          FStar_Syntax_Print.bv_to_string
                                                            x in
                                                        FStar_Util.print2
                                                          "(3) bind (case b): Substituting %s for %s"
                                                          uu____6942
                                                          uu____6944);
                                                   (let c21 =
                                                      FStar_Syntax_Subst.subst_comp
                                                        [FStar_Syntax_Syntax.NT
                                                           (x, e1')] c2 in
                                                    mk_seq c1 b c21))
                                                else
                                                  (debug
                                                     (fun uu____6959 ->
                                                        let uu____6960 =
                                                          FStar_TypeChecker_Normalize.term_to_string
                                                            env e1 in
                                                        let uu____6962 =
                                                          FStar_Syntax_Print.bv_to_string
                                                            x in
                                                        FStar_Util.print2
                                                          "(3) bind (case c): Adding equality %s = %s"
                                                          uu____6960
                                                          uu____6962);
                                                   (let c21 =
                                                      FStar_Syntax_Subst.subst_comp
                                                        [FStar_Syntax_Syntax.NT
                                                           (x, e1)] c2 in
                                                    let x_eq_e =
                                                      let uu____6969 =
                                                        FStar_Syntax_Syntax.bv_to_name
                                                          x in
                                                      FStar_Syntax_Util.mk_eq2
                                                        u_res_t1 res_t1 e1
                                                        uu____6969 in
                                                    let uu____6970 =
                                                      let uu____6975 =
                                                        let uu____6976 =
                                                          let uu____6977 =
                                                            FStar_Syntax_Syntax.mk_binder
                                                              x in
                                                          [uu____6977] in
                                                        FStar_TypeChecker_Env.push_binders
                                                          env uu____6976 in
                                                      weaken_comp uu____6975
                                                        c21 x_eq_e in
                                                    match uu____6970 with
                                                    | (c22, g_w) ->
                                                        let g =
                                                          let uu____7003 =
                                                            let uu____7004 =
                                                              let uu____7005
                                                                =
                                                                FStar_Syntax_Syntax.mk_binder
                                                                  x in
                                                              [uu____7005] in
                                                            let uu____7024 =
                                                              FStar_TypeChecker_Common.weaken_guard_formula
                                                                g_c2 x_eq_e in
                                                            FStar_TypeChecker_Env.close_guard
                                                              env uu____7004
                                                              uu____7024 in
                                                          FStar_TypeChecker_Env.conj_guard
                                                            g_c1 uu____7003 in
                                                        let uu____7025 =
                                                          mk_bind1 c1 b c22 g in
                                                        (match uu____7025
                                                         with
                                                         | (c, g_bind) ->
                                                             let uu____7036 =
                                                               FStar_TypeChecker_Env.conj_guard
                                                                 g_w g_bind in
                                                             (c, uu____7036))))))
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
      | uu____7053 -> g2
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
            let uu____7084 =
              (FStar_All.pipe_right m_opt FStar_Util.is_none) ||
                (is_ghost_effect env lc.FStar_TypeChecker_Common.eff_name) in
            if uu____7084
            then FStar_Parser_Const.effect_PURE_lid
            else FStar_All.pipe_right m_opt FStar_Util.must in
          let flags =
            let uu____7097 = FStar_TypeChecker_Common.is_total_lcomp lc in
            if uu____7097
            then FStar_Syntax_Syntax.RETURN ::
              (lc.FStar_TypeChecker_Common.cflags)
            else FStar_Syntax_Syntax.PARTIAL_RETURN ::
              (lc.FStar_TypeChecker_Common.cflags) in
          let refine uu____7113 =
            let uu____7118 = FStar_TypeChecker_Common.lcomp_comp lc in
            match uu____7118 with
            | (c, g_c) ->
                let u_t =
                  match comp_univ_opt c with
                  | FStar_Pervasives_Native.Some u_t -> u_t
                  | FStar_Pervasives_Native.None ->
                      env.FStar_TypeChecker_Env.universe_of env
                        (FStar_Syntax_Util.comp_result c) in
                let uu____7131 = FStar_Syntax_Util.is_tot_or_gtot_comp c in
                if uu____7131
                then
                  let uu____7138 =
                    return_value env m (FStar_Pervasives_Native.Some u_t)
                      (FStar_Syntax_Util.comp_result c) e in
                  (match uu____7138 with
                   | (retc, g_retc) ->
                       let g_c1 = FStar_TypeChecker_Env.conj_guard g_c g_retc in
                       let uu____7150 =
                         let uu____7152 = FStar_Syntax_Util.is_pure_comp c in
                         Prims.op_Negation uu____7152 in
                       if uu____7150
                       then
                         let retc1 = FStar_Syntax_Util.comp_to_comp_typ retc in
                         let retc2 =
                           let uu___910_7161 = retc1 in
                           {
                             FStar_Syntax_Syntax.comp_univs =
                               (uu___910_7161.FStar_Syntax_Syntax.comp_univs);
                             FStar_Syntax_Syntax.effect_name =
                               FStar_Parser_Const.effect_GHOST_lid;
                             FStar_Syntax_Syntax.result_typ =
                               (uu___910_7161.FStar_Syntax_Syntax.result_typ);
                             FStar_Syntax_Syntax.effect_args =
                               (uu___910_7161.FStar_Syntax_Syntax.effect_args);
                             FStar_Syntax_Syntax.flags = flags
                           } in
                         let uu____7162 = FStar_Syntax_Syntax.mk_Comp retc2 in
                         (uu____7162, g_c1)
                       else
                         (let uu____7165 =
                            FStar_Syntax_Util.comp_set_flags retc flags in
                          (uu____7165, g_c1)))
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
                   let uu____7176 =
                     return_value env_x m (FStar_Pervasives_Native.Some u_t)
                       t xexp in
                   match uu____7176 with
                   | (ret, g_ret) ->
                       let ret1 =
                         let uu____7188 =
                           FStar_Syntax_Util.comp_set_flags ret
                             [FStar_Syntax_Syntax.PARTIAL_RETURN] in
                         FStar_All.pipe_left
                           FStar_TypeChecker_Common.lcomp_of_comp uu____7188 in
                       let eq = FStar_Syntax_Util.mk_eq2 u_t t xexp e in
                       let eq_ret =
                         weaken_precondition env_x ret1
                           (FStar_TypeChecker_Common.NonTrivial eq) in
                       let uu____7191 =
                         let uu____7196 =
                           let uu____7197 =
                             FStar_TypeChecker_Common.lcomp_of_comp c2 in
                           bind e.FStar_Syntax_Syntax.pos env
                             FStar_Pervasives_Native.None uu____7197
                             ((FStar_Pervasives_Native.Some x), eq_ret) in
                         FStar_TypeChecker_Common.lcomp_comp uu____7196 in
                       (match uu____7191 with
                        | (bind_c, g_bind) ->
                            let uu____7206 =
                              FStar_Syntax_Util.comp_set_flags bind_c flags in
                            let uu____7207 =
                              FStar_TypeChecker_Env.conj_guards
                                [g_c; g_ret; g_bind] in
                            (uu____7206, uu____7207))) in
          let uu____7208 = should_not_inline_lc lc in
          if uu____7208
          then
            let uu____7211 =
              let uu____7217 =
                let uu____7219 = FStar_Syntax_Print.term_to_string e in
                FStar_Util.format1
                  "assume_result_eq_pure_term cannot inline an non-inlineable lc : %s"
                  uu____7219 in
              (FStar_Errors.Fatal_UnexpectedTerm, uu____7217) in
            FStar_Errors.raise_error uu____7211 e.FStar_Syntax_Syntax.pos
          else
            (let uu____7225 = refine () in
             match uu____7225 with
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
              (let uu____7260 =
                 FStar_TypeChecker_Common.is_lcomp_partial_return lc in
               Prims.op_Negation uu____7260) in
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
            fun uu____7313 ->
              match uu____7313 with
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
                    let uu____7327 =
                      ((FStar_Ident.lid_equals eff2
                          FStar_Parser_Const.effect_PURE_lid)
                         &&
                         (let uu____7330 =
                            FStar_TypeChecker_Env.join_opt env eff1 eff2 in
                          FStar_All.pipe_right uu____7330 FStar_Util.is_none))
                        &&
                        (let uu____7355 =
                           FStar_TypeChecker_Env.exists_polymonadic_bind env
                             eff1 eff2 in
                         FStar_All.pipe_right uu____7355 FStar_Util.is_none) in
                    if uu____7327
                    then
                      let uu____7392 =
                        FStar_All.pipe_right eff1
                          (fun uu____7397 ->
                             FStar_Pervasives_Native.Some uu____7397) in
                      assume_result_eq_pure_term_in_m env_x uu____7392 e2 lc2
                    else
                      (let uu____7400 =
                         ((let uu____7404 = is_pure_or_ghost_effect env eff1 in
                           Prims.op_Negation uu____7404) ||
                            (should_not_inline_lc lc1))
                           && (is_pure_or_ghost_effect env eff2) in
                       if uu____7400
                       then
                         let uu____7407 =
                           FStar_All.pipe_right eff1
                             (fun uu____7412 ->
                                FStar_Pervasives_Native.Some uu____7412) in
                         maybe_assume_result_eq_pure_term_in_m env_x
                           uu____7407 e2 lc2
                       else lc2) in
                  bind r env e1opt lc1 (x, lc21)
let (fvar_const :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> FStar_Syntax_Syntax.term)
  =
  fun env ->
    fun lid ->
      let uu____7428 =
        let uu____7429 = FStar_TypeChecker_Env.get_range env in
        FStar_Ident.set_lid_range lid uu____7429 in
      FStar_Syntax_Syntax.fvar uu____7428 FStar_Syntax_Syntax.delta_constant
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
                    let uu____7481 =
                      FStar_Ident.string_of_lid ed.FStar_Syntax_Syntax.mname in
                    FStar_Util.format1 "%s.conjunction" uu____7481 in
                  let uu____7484 =
                    let uu____7489 =
                      let uu____7490 =
                        FStar_All.pipe_right ed
                          FStar_Syntax_Util.get_layered_if_then_else_combinator in
                      FStar_All.pipe_right uu____7490 FStar_Util.must in
                    FStar_TypeChecker_Env.inst_tscheme_with uu____7489 [u_a] in
                  match uu____7484 with
                  | (uu____7501, conjunction) ->
                      let uu____7503 =
                        let uu____7512 =
                          FStar_List.map FStar_Pervasives_Native.fst
                            ct1.FStar_Syntax_Syntax.effect_args in
                        let uu____7527 =
                          FStar_List.map FStar_Pervasives_Native.fst
                            ct2.FStar_Syntax_Syntax.effect_args in
                        (uu____7512, uu____7527) in
                      (match uu____7503 with
                       | (is1, is2) ->
                           let conjunction_t_error s =
                             let uu____7573 =
                               let uu____7575 =
                                 FStar_Syntax_Print.term_to_string
                                   conjunction in
                               FStar_Util.format3
                                 "conjunction %s (%s) does not have proper shape (reason:%s)"
                                 uu____7575 conjunction_name s in
                             (FStar_Errors.Fatal_UnexpectedEffect,
                               uu____7573) in
                           let uu____7579 =
                             let uu____7624 =
                               let uu____7625 =
                                 FStar_Syntax_Subst.compress conjunction in
                               uu____7625.FStar_Syntax_Syntax.n in
                             match uu____7624 with
                             | FStar_Syntax_Syntax.Tm_abs
                                 (bs, body, uu____7674) when
                                 (FStar_List.length bs) >= (Prims.of_int (4))
                                 ->
                                 let uu____7706 =
                                   FStar_Syntax_Subst.open_term bs body in
                                 (match uu____7706 with
                                  | (a_b::bs1, body1) ->
                                      let uu____7778 =
                                        FStar_List.splitAt
                                          ((FStar_List.length bs1) -
                                             (Prims.of_int (3))) bs1 in
                                      (match uu____7778 with
                                       | (rest_bs, f_b::g_b::p_b::[]) ->
                                           let uu____7926 =
                                             FStar_All.pipe_right body1
                                               FStar_Syntax_Util.unascribe in
                                           (a_b, rest_bs, f_b, g_b, p_b,
                                             uu____7926)))
                             | uu____7959 ->
                                 let uu____7960 =
                                   conjunction_t_error
                                     "Either not an abstraction or not enough binders" in
                                 FStar_Errors.raise_error uu____7960 r in
                           (match uu____7579 with
                            | (a_b, rest_bs, f_b, g_b, p_b, body) ->
                                let uu____8085 =
                                  let uu____8092 =
                                    let uu____8093 =
                                      let uu____8094 =
                                        let uu____8101 =
                                          FStar_All.pipe_right a_b
                                            FStar_Pervasives_Native.fst in
                                        (uu____8101, a) in
                                      FStar_Syntax_Syntax.NT uu____8094 in
                                    [uu____8093] in
                                  FStar_TypeChecker_Env.uvars_for_binders env
                                    rest_bs uu____8092
                                    (fun b ->
                                       let uu____8117 =
                                         FStar_Syntax_Print.binder_to_string
                                           b in
                                       let uu____8119 =
                                         FStar_Ident.string_of_lid
                                           ed.FStar_Syntax_Syntax.mname in
                                       let uu____8121 =
                                         FStar_All.pipe_right r
                                           FStar_Range.string_of_range in
                                       FStar_Util.format3
                                         "implicit var for binder %s of %s:conjunction at %s"
                                         uu____8117 uu____8119 uu____8121) r in
                                (match uu____8085 with
                                 | (rest_bs_uvars, g_uvars) ->
                                     let substs =
                                       FStar_List.map2
                                         (fun b ->
                                            fun t ->
                                              let uu____8159 =
                                                let uu____8166 =
                                                  FStar_All.pipe_right b
                                                    FStar_Pervasives_Native.fst in
                                                (uu____8166, t) in
                                              FStar_Syntax_Syntax.NT
                                                uu____8159) (a_b ::
                                         (FStar_List.append rest_bs [p_b]))
                                         (a ::
                                         (FStar_List.append rest_bs_uvars [p])) in
                                     let f_guard =
                                       let f_sort_is =
                                         let uu____8205 =
                                           let uu____8206 =
                                             let uu____8209 =
                                               let uu____8210 =
                                                 FStar_All.pipe_right f_b
                                                   FStar_Pervasives_Native.fst in
                                               uu____8210.FStar_Syntax_Syntax.sort in
                                             FStar_Syntax_Subst.compress
                                               uu____8209 in
                                           uu____8206.FStar_Syntax_Syntax.n in
                                         match uu____8205 with
                                         | FStar_Syntax_Syntax.Tm_app
                                             (uu____8221, uu____8222::is) ->
                                             let uu____8264 =
                                               FStar_All.pipe_right is
                                                 (FStar_List.map
                                                    FStar_Pervasives_Native.fst) in
                                             FStar_All.pipe_right uu____8264
                                               (FStar_List.map
                                                  (FStar_Syntax_Subst.subst
                                                     substs))
                                         | uu____8297 ->
                                             let uu____8298 =
                                               conjunction_t_error
                                                 "f's type is not a repr type" in
                                             FStar_Errors.raise_error
                                               uu____8298 r in
                                       FStar_List.fold_left2
                                         (fun g ->
                                            fun i1 ->
                                              fun f_i ->
                                                let uu____8314 =
                                                  FStar_TypeChecker_Rel.layered_effect_teq
                                                    env i1 f_i
                                                    (FStar_Pervasives_Native.Some
                                                       conjunction_name) in
                                                FStar_TypeChecker_Env.conj_guard
                                                  g uu____8314)
                                         FStar_TypeChecker_Env.trivial_guard
                                         is1 f_sort_is in
                                     let g_guard =
                                       let g_sort_is =
                                         let uu____8320 =
                                           let uu____8321 =
                                             let uu____8324 =
                                               let uu____8325 =
                                                 FStar_All.pipe_right g_b
                                                   FStar_Pervasives_Native.fst in
                                               uu____8325.FStar_Syntax_Syntax.sort in
                                             FStar_Syntax_Subst.compress
                                               uu____8324 in
                                           uu____8321.FStar_Syntax_Syntax.n in
                                         match uu____8320 with
                                         | FStar_Syntax_Syntax.Tm_app
                                             (uu____8336, uu____8337::is) ->
                                             let uu____8379 =
                                               FStar_All.pipe_right is
                                                 (FStar_List.map
                                                    FStar_Pervasives_Native.fst) in
                                             FStar_All.pipe_right uu____8379
                                               (FStar_List.map
                                                  (FStar_Syntax_Subst.subst
                                                     substs))
                                         | uu____8412 ->
                                             let uu____8413 =
                                               conjunction_t_error
                                                 "g's type is not a repr type" in
                                             FStar_Errors.raise_error
                                               uu____8413 r in
                                       FStar_List.fold_left2
                                         (fun g ->
                                            fun i2 ->
                                              fun g_i ->
                                                let uu____8429 =
                                                  FStar_TypeChecker_Rel.layered_effect_teq
                                                    env i2 g_i
                                                    (FStar_Pervasives_Native.Some
                                                       conjunction_name) in
                                                FStar_TypeChecker_Env.conj_guard
                                                  g uu____8429)
                                         FStar_TypeChecker_Env.trivial_guard
                                         is2 g_sort_is in
                                     let body1 =
                                       FStar_Syntax_Subst.subst substs body in
                                     let is =
                                       let uu____8435 =
                                         let uu____8436 =
                                           FStar_Syntax_Subst.compress body1 in
                                         uu____8436.FStar_Syntax_Syntax.n in
                                       match uu____8435 with
                                       | FStar_Syntax_Syntax.Tm_app
                                           (uu____8441, a1::args) ->
                                           FStar_List.map
                                             FStar_Pervasives_Native.fst args
                                       | uu____8496 ->
                                           let uu____8497 =
                                             conjunction_t_error
                                               "body is not a repr type" in
                                           FStar_Errors.raise_error
                                             uu____8497 r in
                                     let uu____8506 =
                                       let uu____8507 =
                                         let uu____8508 =
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
                                             uu____8508;
                                           FStar_Syntax_Syntax.flags = []
                                         } in
                                       FStar_Syntax_Syntax.mk_Comp uu____8507 in
                                     let uu____8531 =
                                       let uu____8532 =
                                         FStar_TypeChecker_Env.conj_guard
                                           g_uvars f_guard in
                                       FStar_TypeChecker_Env.conj_guard
                                         uu____8532 g_guard in
                                     (uu____8506, uu____8531))))
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
                fun uu____8577 ->
                  let if_then_else =
                    let uu____8583 =
                      FStar_All.pipe_right ed
                        FStar_Syntax_Util.get_wp_if_then_else_combinator in
                    FStar_All.pipe_right uu____8583 FStar_Util.must in
                  let uu____8590 = destruct_wp_comp ct1 in
                  match uu____8590 with
                  | (uu____8601, uu____8602, wp_t) ->
                      let uu____8604 = destruct_wp_comp ct2 in
                      (match uu____8604 with
                       | (uu____8615, uu____8616, wp_e) ->
                           let wp =
                             let uu____8619 =
                               FStar_TypeChecker_Env.inst_effect_fun_with
                                 [u_a] env ed if_then_else in
                             let uu____8620 =
                               let uu____8621 = FStar_Syntax_Syntax.as_arg a in
                               let uu____8630 =
                                 let uu____8641 =
                                   FStar_Syntax_Syntax.as_arg p in
                                 let uu____8650 =
                                   let uu____8661 =
                                     FStar_Syntax_Syntax.as_arg wp_t in
                                   let uu____8670 =
                                     let uu____8681 =
                                       FStar_Syntax_Syntax.as_arg wp_e in
                                     [uu____8681] in
                                   uu____8661 :: uu____8670 in
                                 uu____8641 :: uu____8650 in
                               uu____8621 :: uu____8630 in
                             let uu____8730 =
                               FStar_Range.union_ranges
                                 wp_t.FStar_Syntax_Syntax.pos
                                 wp_e.FStar_Syntax_Syntax.pos in
                             FStar_Syntax_Syntax.mk_Tm_app uu____8619
                               uu____8620 uu____8730 in
                           let uu____8731 = mk_comp ed u_a a wp [] in
                           (uu____8731, FStar_TypeChecker_Env.trivial_guard))
let (comp_pure_wp_false :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.comp)
  =
  fun env ->
    fun u ->
      fun t ->
        let post_k =
          let uu____8751 =
            let uu____8760 = FStar_Syntax_Syntax.null_binder t in
            [uu____8760] in
          let uu____8779 =
            FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0 in
          FStar_Syntax_Util.arrow uu____8751 uu____8779 in
        let kwp =
          let uu____8785 =
            let uu____8794 = FStar_Syntax_Syntax.null_binder post_k in
            [uu____8794] in
          let uu____8813 =
            FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0 in
          FStar_Syntax_Util.arrow uu____8785 uu____8813 in
        let post =
          FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None post_k in
        let wp =
          let uu____8820 =
            let uu____8821 = FStar_Syntax_Syntax.mk_binder post in
            [uu____8821] in
          let uu____8840 = fvar_const env FStar_Parser_Const.false_lid in
          FStar_Syntax_Util.abs uu____8820 uu____8840
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
            let uu____8899 =
              let uu____8900 =
                FStar_All.pipe_right scrutinee FStar_Syntax_Syntax.mk_binder in
              [uu____8900] in
            FStar_TypeChecker_Env.push_binders env0 uu____8899 in
          let eff =
            FStar_List.fold_left
              (fun eff ->
                 fun uu____8947 ->
                   match uu____8947 with
                   | (uu____8961, eff_label, uu____8963, uu____8964) ->
                       join_effects env eff eff_label)
              FStar_Parser_Const.effect_PURE_lid lcases in
          let uu____8977 =
            let uu____8985 =
              FStar_All.pipe_right lcases
                (FStar_Util.for_some
                   (fun uu____9023 ->
                      match uu____9023 with
                      | (uu____9038, uu____9039, flags, uu____9041) ->
                          FStar_All.pipe_right flags
                            (FStar_Util.for_some
                               (fun uu___5_9058 ->
                                  match uu___5_9058 with
                                  | FStar_Syntax_Syntax.SHOULD_NOT_INLINE ->
                                      true
                                  | uu____9061 -> false)))) in
            if uu____8985
            then (true, [FStar_Syntax_Syntax.SHOULD_NOT_INLINE])
            else (false, []) in
          match uu____8977 with
          | (should_not_inline_whole_match, bind_cases_flags) ->
              let bind_cases uu____9098 =
                let u_res_t = env.FStar_TypeChecker_Env.universe_of env res_t in
                let uu____9100 =
                  env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ()) in
                if uu____9100
                then
                  let uu____9107 = lax_mk_tot_or_comp_l eff u_res_t res_t [] in
                  (uu____9107, FStar_TypeChecker_Env.trivial_guard)
                else
                  (let maybe_return eff_label_then cthen =
                     let uu____9128 =
                       should_not_inline_whole_match ||
                         (let uu____9131 = is_pure_or_ghost_effect env eff in
                          Prims.op_Negation uu____9131) in
                     if uu____9128 then cthen true else cthen false in
                   let uu____9138 =
                     let uu____9149 =
                       let uu____9162 =
                         let uu____9167 =
                           let uu____9178 =
                             FStar_All.pipe_right lcases
                               (FStar_List.map
                                  (fun uu____9228 ->
                                     match uu____9228 with
                                     | (g, uu____9247, uu____9248,
                                        uu____9249) -> g)) in
                           FStar_All.pipe_right uu____9178
                             (FStar_List.fold_left
                                (fun uu____9297 ->
                                   fun g ->
                                     match uu____9297 with
                                     | (conds, acc) ->
                                         let cond =
                                           let uu____9338 =
                                             FStar_Syntax_Util.mk_neg g in
                                           FStar_Syntax_Util.mk_conj acc
                                             uu____9338 in
                                         ((FStar_List.append conds [cond]),
                                           cond))
                                ([FStar_Syntax_Util.t_true],
                                  FStar_Syntax_Util.t_true)) in
                         FStar_All.pipe_right uu____9167
                           FStar_Pervasives_Native.fst in
                       FStar_All.pipe_right uu____9162
                         (fun l ->
                            FStar_List.splitAt
                              ((FStar_List.length l) - Prims.int_one) l) in
                     FStar_All.pipe_right uu____9149
                       (fun uu____9436 ->
                          match uu____9436 with
                          | (l1, l2) ->
                              let uu____9477 = FStar_List.hd l2 in
                              (l1, uu____9477)) in
                   match uu____9138 with
                   | (neg_branch_conds, exhaustiveness_branch_cond) ->
                       let uu____9506 =
                         match lcases with
                         | [] ->
                             let uu____9537 =
                               comp_pure_wp_false env u_res_t res_t in
                             (FStar_Pervasives_Native.None, uu____9537,
                               FStar_TypeChecker_Env.trivial_guard)
                         | uu____9540 ->
                             let uu____9557 =
                               let uu____9590 =
                                 let uu____9601 =
                                   FStar_All.pipe_right neg_branch_conds
                                     (FStar_List.splitAt
                                        ((FStar_List.length lcases) -
                                           Prims.int_one)) in
                                 FStar_All.pipe_right uu____9601
                                   (fun uu____9673 ->
                                      match uu____9673 with
                                      | (l1, l2) ->
                                          let uu____9714 = FStar_List.hd l2 in
                                          (l1, uu____9714)) in
                               match uu____9590 with
                               | (neg_branch_conds1, neg_last) ->
                                   let uu____9771 =
                                     let uu____9810 =
                                       FStar_All.pipe_right lcases
                                         (FStar_List.splitAt
                                            ((FStar_List.length lcases) -
                                               Prims.int_one)) in
                                     FStar_All.pipe_right uu____9810
                                       (fun uu____10022 ->
                                          match uu____10022 with
                                          | (l1, l2) ->
                                              let uu____10173 =
                                                FStar_List.hd l2 in
                                              (l1, uu____10173)) in
                                   (match uu____9771 with
                                    | (lcases1,
                                       (g_last, eff_last, uu____10275,
                                        c_last)) ->
                                        let uu____10345 =
                                          let lc =
                                            maybe_return eff_last c_last in
                                          let uu____10351 =
                                            FStar_TypeChecker_Common.lcomp_comp
                                              lc in
                                          match uu____10351 with
                                          | (c, g) ->
                                              let uu____10362 =
                                                let uu____10363 =
                                                  FStar_Syntax_Util.mk_conj
                                                    g_last neg_last in
                                                FStar_TypeChecker_Common.weaken_guard_formula
                                                  g uu____10363 in
                                              (c, uu____10362) in
                                        (match uu____10345 with
                                         | (c, g) ->
                                             let uu____10398 =
                                               let uu____10399 =
                                                 FStar_All.pipe_right
                                                   eff_last
                                                   (FStar_TypeChecker_Env.norm_eff_name
                                                      env) in
                                               FStar_All.pipe_right
                                                 uu____10399
                                                 (FStar_TypeChecker_Env.get_effect_decl
                                                    env) in
                                             (lcases1, neg_branch_conds1,
                                               uu____10398, c, g))) in
                             (match uu____9557 with
                              | (lcases1, neg_branch_conds1, md, comp,
                                 g_comp) ->
                                  FStar_List.fold_right2
                                    (fun uu____10531 ->
                                       fun neg_cond ->
                                         fun uu____10533 ->
                                           match (uu____10531, uu____10533)
                                           with
                                           | ((g, eff_label, uu____10593,
                                               cthen),
                                              (uu____10595, celse, g_comp1))
                                               ->
                                               let uu____10642 =
                                                 let uu____10647 =
                                                   maybe_return eff_label
                                                     cthen in
                                                 FStar_TypeChecker_Common.lcomp_comp
                                                   uu____10647 in
                                               (match uu____10642 with
                                                | (cthen1, g_then) ->
                                                    let uu____10658 =
                                                      let uu____10669 =
                                                        lift_comps_sep_guards
                                                          env cthen1 celse
                                                          FStar_Pervasives_Native.None
                                                          false in
                                                      match uu____10669 with
                                                      | (m, cthen2, celse1,
                                                         g_lift_then,
                                                         g_lift_else) ->
                                                          let md1 =
                                                            FStar_TypeChecker_Env.get_effect_decl
                                                              env m in
                                                          let uu____10697 =
                                                            FStar_All.pipe_right
                                                              cthen2
                                                              FStar_Syntax_Util.comp_to_comp_typ in
                                                          let uu____10698 =
                                                            FStar_All.pipe_right
                                                              celse1
                                                              FStar_Syntax_Util.comp_to_comp_typ in
                                                          (md1, uu____10697,
                                                            uu____10698,
                                                            g_lift_then,
                                                            g_lift_else) in
                                                    (match uu____10658 with
                                                     | (md1, ct_then,
                                                        ct_else, g_lift_then,
                                                        g_lift_else) ->
                                                         let fn =
                                                           let uu____10749 =
                                                             FStar_All.pipe_right
                                                               md1
                                                               FStar_Syntax_Util.is_layered in
                                                           if uu____10749
                                                           then
                                                             mk_layered_conjunction
                                                           else
                                                             mk_non_layered_conjunction in
                                                         let uu____10783 =
                                                           let uu____10788 =
                                                             FStar_TypeChecker_Env.get_range
                                                               env in
                                                           fn env md1 u_res_t
                                                             res_t g ct_then
                                                             ct_else
                                                             uu____10788 in
                                                         (match uu____10783
                                                          with
                                                          | (c,
                                                             g_conjunction)
                                                              ->
                                                              let g_then1 =
                                                                let uu____10800
                                                                  =
                                                                  FStar_TypeChecker_Env.conj_guard
                                                                    g_then
                                                                    g_lift_then in
                                                                let uu____10801
                                                                  =
                                                                  FStar_Syntax_Util.mk_conj
                                                                    neg_cond
                                                                    g in
                                                                FStar_TypeChecker_Common.weaken_guard_formula
                                                                  uu____10800
                                                                  uu____10801 in
                                                              let g_else =
                                                                let uu____10803
                                                                  =
                                                                  let uu____10804
                                                                    =
                                                                    FStar_Syntax_Util.mk_neg
                                                                    g in
                                                                  FStar_Syntax_Util.mk_conj
                                                                    neg_cond
                                                                    uu____10804 in
                                                                FStar_TypeChecker_Common.weaken_guard_formula
                                                                  g_lift_else
                                                                  uu____10803 in
                                                              let uu____10807
                                                                =
                                                                FStar_TypeChecker_Env.conj_guards
                                                                  [g_comp1;
                                                                  g_then1;
                                                                  g_else;
                                                                  g_conjunction] in
                                                              ((FStar_Pervasives_Native.Some
                                                                  md1), c,
                                                                uu____10807)))))
                                    lcases1 neg_branch_conds1
                                    ((FStar_Pervasives_Native.Some md), comp,
                                      g_comp)) in
                       (match uu____9506 with
                        | (md, comp, g_comp) ->
                            let uu____10823 =
                              let uu____10828 =
                                let check =
                                  FStar_Syntax_Util.mk_imp
                                    exhaustiveness_branch_cond
                                    FStar_Syntax_Util.t_false in
                                let check1 =
                                  let uu____10835 =
                                    FStar_TypeChecker_Env.get_range env in
                                  label
                                    FStar_TypeChecker_Err.exhaustiveness_check
                                    uu____10835 check in
                                strengthen_comp env
                                  FStar_Pervasives_Native.None comp check1
                                  bind_cases_flags in
                              match uu____10828 with
                              | (c, g) ->
                                  let uu____10846 =
                                    FStar_TypeChecker_Env.conj_guard g_comp g in
                                  (c, uu____10846) in
                            (match uu____10823 with
                             | (comp1, g_comp1) ->
                                 let g_comp2 =
                                   let uu____10854 =
                                     let uu____10855 =
                                       FStar_All.pipe_right scrutinee
                                         FStar_Syntax_Syntax.mk_binder in
                                     [uu____10855] in
                                   FStar_TypeChecker_Env.close_guard env0
                                     uu____10854 g_comp1 in
                                 (match lcases with
                                  | [] -> (comp1, g_comp2)
                                  | uu____10898::[] -> (comp1, g_comp2)
                                  | uu____10941 ->
                                      let uu____10958 =
                                        let uu____10960 =
                                          FStar_All.pipe_right md
                                            FStar_Util.must in
                                        FStar_All.pipe_right uu____10960
                                          FStar_Syntax_Util.is_layered in
                                      if uu____10958
                                      then (comp1, g_comp2)
                                      else
                                        (let comp2 =
                                           FStar_TypeChecker_Env.comp_to_comp_typ
                                             env comp1 in
                                         let md1 =
                                           FStar_TypeChecker_Env.get_effect_decl
                                             env
                                             comp2.FStar_Syntax_Syntax.effect_name in
                                         let uu____10973 =
                                           destruct_wp_comp comp2 in
                                         match uu____10973 with
                                         | (uu____10984, uu____10985, wp) ->
                                             let ite_wp =
                                               let uu____10988 =
                                                 FStar_All.pipe_right md1
                                                   FStar_Syntax_Util.get_wp_ite_combinator in
                                               FStar_All.pipe_right
                                                 uu____10988 FStar_Util.must in
                                             let wp1 =
                                               let uu____10996 =
                                                 FStar_TypeChecker_Env.inst_effect_fun_with
                                                   [u_res_t] env md1 ite_wp in
                                               let uu____10997 =
                                                 let uu____10998 =
                                                   FStar_Syntax_Syntax.as_arg
                                                     res_t in
                                                 let uu____11007 =
                                                   let uu____11018 =
                                                     FStar_Syntax_Syntax.as_arg
                                                       wp in
                                                   [uu____11018] in
                                                 uu____10998 :: uu____11007 in
                                               FStar_Syntax_Syntax.mk_Tm_app
                                                 uu____10996 uu____10997
                                                 wp.FStar_Syntax_Syntax.pos in
                                             let uu____11051 =
                                               mk_comp md1 u_res_t res_t wp1
                                                 bind_cases_flags in
                                             (uu____11051, g_comp2)))))) in
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
          let uu____11086 = FStar_TypeChecker_Rel.sub_comp env c c' in
          match uu____11086 with
          | FStar_Pervasives_Native.None ->
              if env.FStar_TypeChecker_Env.use_eq
              then
                let uu____11102 =
                  FStar_TypeChecker_Err.computed_computation_type_does_not_match_annotation_eq
                    env e c c' in
                let uu____11108 = FStar_TypeChecker_Env.get_range env in
                FStar_Errors.raise_error uu____11102 uu____11108
              else
                (let uu____11117 =
                   FStar_TypeChecker_Err.computed_computation_type_does_not_match_annotation
                     env e c c' in
                 let uu____11123 = FStar_TypeChecker_Env.get_range env in
                 FStar_Errors.raise_error uu____11117 uu____11123)
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
          let uu____11148 =
            FStar_All.pipe_right c FStar_Syntax_Util.comp_effect_name in
          FStar_All.pipe_right uu____11148
            (FStar_TypeChecker_Env.norm_eff_name env) in
        let uu____11151 = FStar_Syntax_Util.is_pure_or_ghost_effect c_lid in
        if uu____11151
        then u_res
        else
          (let is_total =
             let uu____11158 =
               FStar_TypeChecker_Env.lookup_effect_quals env c_lid in
             FStar_All.pipe_right uu____11158
               (FStar_List.existsb
                  (fun q -> q = FStar_Syntax_Syntax.TotalEffect)) in
           if Prims.op_Negation is_total
           then FStar_Syntax_Syntax.U_zero
           else
             (let uu____11169 = FStar_TypeChecker_Env.effect_repr env c u_res in
              match uu____11169 with
              | FStar_Pervasives_Native.None ->
                  let uu____11172 =
                    let uu____11178 =
                      let uu____11180 =
                        FStar_Syntax_Print.lid_to_string c_lid in
                      FStar_Util.format1
                        "Effect %s is marked total but does not have a repr"
                        uu____11180 in
                    (FStar_Errors.Fatal_EffectCannotBeReified, uu____11178) in
                  FStar_Errors.raise_error uu____11172
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
      let uu____11204 = destruct_wp_comp ct in
      match uu____11204 with
      | (u_t, t, wp) ->
          let vc =
            let uu____11221 =
              let uu____11222 =
                let uu____11223 =
                  FStar_All.pipe_right md
                    FStar_Syntax_Util.get_wp_trivial_combinator in
                FStar_All.pipe_right uu____11223 FStar_Util.must in
              FStar_TypeChecker_Env.inst_effect_fun_with [u_t] env md
                uu____11222 in
            let uu____11230 =
              let uu____11231 = FStar_Syntax_Syntax.as_arg t in
              let uu____11240 =
                let uu____11251 = FStar_Syntax_Syntax.as_arg wp in
                [uu____11251] in
              uu____11231 :: uu____11240 in
            let uu____11284 = FStar_TypeChecker_Env.get_range env in
            FStar_Syntax_Syntax.mk_Tm_app uu____11221 uu____11230 uu____11284 in
          let uu____11285 =
            FStar_All.pipe_left FStar_TypeChecker_Env.guard_of_guard_formula
              (FStar_TypeChecker_Common.NonTrivial vc) in
          (ct, vc, uu____11285)
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
                  let uu____11340 =
                    FStar_TypeChecker_Env.try_lookup_lid env f in
                  match uu____11340 with
                  | FStar_Pervasives_Native.Some uu____11355 ->
                      ((let uu____11373 =
                          FStar_TypeChecker_Env.debug env
                            (FStar_Options.Other "Coercions") in
                        if uu____11373
                        then
                          let uu____11377 = FStar_Ident.string_of_lid f in
                          FStar_Util.print1 "Coercing with %s!\n" uu____11377
                        else ());
                       (let coercion =
                          let uu____11383 =
                            FStar_Ident.set_lid_range f
                              e.FStar_Syntax_Syntax.pos in
                          FStar_Syntax_Syntax.fvar uu____11383
                            (FStar_Syntax_Syntax.Delta_constant_at_level
                               Prims.int_one) FStar_Pervasives_Native.None in
                        let coercion1 =
                          FStar_Syntax_Syntax.mk_Tm_uinst coercion us in
                        let coercion2 =
                          FStar_Syntax_Util.mk_app coercion1 eargs in
                        let lc1 =
                          let uu____11390 =
                            let uu____11391 =
                              let uu____11392 = mkcomp ty in
                              FStar_All.pipe_left
                                FStar_TypeChecker_Common.lcomp_of_comp
                                uu____11392 in
                            (FStar_Pervasives_Native.None, uu____11391) in
                          bind e.FStar_Syntax_Syntax.pos env
                            (FStar_Pervasives_Native.Some e) lc uu____11390 in
                        let e1 =
                          let uu____11396 =
                            let uu____11397 = FStar_Syntax_Syntax.as_arg e in
                            [uu____11397] in
                          FStar_Syntax_Syntax.mk_Tm_app coercion2 uu____11396
                            e.FStar_Syntax_Syntax.pos in
                        (e1, lc1)))
                  | FStar_Pervasives_Native.None ->
                      ((let uu____11431 =
                          let uu____11437 =
                            let uu____11439 = FStar_Ident.string_of_lid f in
                            FStar_Util.format1
                              "Coercion %s was not found in the environment, not coercing."
                              uu____11439 in
                          (FStar_Errors.Warning_CoercionNotFound,
                            uu____11437) in
                        FStar_Errors.log_issue e.FStar_Syntax_Syntax.pos
                          uu____11431);
                       (e, lc))
type isErased =
  | Yes of FStar_Syntax_Syntax.term 
  | Maybe 
  | No 
let (uu___is_Yes : isErased -> Prims.bool) =
  fun projectee ->
    match projectee with | Yes _0 -> true | uu____11458 -> false
let (__proj__Yes__item___0 : isErased -> FStar_Syntax_Syntax.term) =
  fun projectee -> match projectee with | Yes _0 -> _0
let (uu___is_Maybe : isErased -> Prims.bool) =
  fun projectee ->
    match projectee with | Maybe -> true | uu____11476 -> false
let (uu___is_No : isErased -> Prims.bool) =
  fun projectee -> match projectee with | No -> true | uu____11487 -> false
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
      let uu____11511 = FStar_Syntax_Util.head_and_args t2 in
      match uu____11511 with
      | (h, args) ->
          let h1 = FStar_Syntax_Util.un_uinst h in
          let r =
            let uu____11556 =
              let uu____11571 =
                let uu____11572 = FStar_Syntax_Subst.compress h1 in
                uu____11572.FStar_Syntax_Syntax.n in
              (uu____11571, args) in
            match uu____11556 with
            | (FStar_Syntax_Syntax.Tm_fvar fv,
               (a, FStar_Pervasives_Native.None)::[]) when
                FStar_Syntax_Syntax.fv_eq_lid fv
                  FStar_Parser_Const.erased_lid
                -> Yes a
            | (FStar_Syntax_Syntax.Tm_uvar uu____11619, uu____11620) -> Maybe
            | (FStar_Syntax_Syntax.Tm_unknown, uu____11653) -> Maybe
            | (FStar_Syntax_Syntax.Tm_match (uu____11674, branches),
               uu____11676) ->
                FStar_All.pipe_right branches
                  (FStar_List.fold_left
                     (fun acc ->
                        fun br ->
                          match acc with
                          | Yes uu____11740 -> Maybe
                          | Maybe -> Maybe
                          | No ->
                              let uu____11741 =
                                FStar_Syntax_Subst.open_branch br in
                              (match uu____11741 with
                               | (uu____11742, uu____11743, br_body) ->
                                   let uu____11761 =
                                     let uu____11762 =
                                       let uu____11767 =
                                         let uu____11768 =
                                           let uu____11771 =
                                             FStar_All.pipe_right br_body
                                               FStar_Syntax_Free.names in
                                           FStar_All.pipe_right uu____11771
                                             FStar_Util.set_elements in
                                         FStar_All.pipe_right uu____11768
                                           (FStar_TypeChecker_Env.push_bvs
                                              env) in
                                       check_erased uu____11767 in
                                     FStar_All.pipe_right br_body uu____11762 in
                                   (match uu____11761 with
                                    | No -> No
                                    | uu____11782 -> Maybe))) No)
            | uu____11783 -> No in
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
            (((let uu____11835 = FStar_Options.use_two_phase_tc () in
               Prims.op_Negation uu____11835) ||
                env.FStar_TypeChecker_Env.phase1)
               || env.FStar_TypeChecker_Env.lax)
              || (FStar_Options.lax ()) in
          if Prims.op_Negation should_coerce
          then (e, lc, FStar_TypeChecker_Env.trivial_guard)
          else
            (let is_t_term t =
               let t1 = FStar_TypeChecker_Normalize.unfold_whnf env t in
               let uu____11854 =
                 let uu____11855 = FStar_Syntax_Subst.compress t1 in
                 uu____11855.FStar_Syntax_Syntax.n in
               match uu____11854 with
               | FStar_Syntax_Syntax.Tm_fvar fv ->
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.term_lid
               | uu____11860 -> false in
             let is_t_term_view t =
               let t1 = FStar_TypeChecker_Normalize.unfold_whnf env t in
               let uu____11870 =
                 let uu____11871 = FStar_Syntax_Subst.compress t1 in
                 uu____11871.FStar_Syntax_Syntax.n in
               match uu____11870 with
               | FStar_Syntax_Syntax.Tm_fvar fv ->
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.term_view_lid
               | uu____11876 -> false in
             let is_type t =
               let t1 = FStar_TypeChecker_Normalize.unfold_whnf env t in
               let t2 = FStar_Syntax_Util.unrefine t1 in
               let uu____11887 =
                 let uu____11888 = FStar_Syntax_Subst.compress t2 in
                 uu____11888.FStar_Syntax_Syntax.n in
               match uu____11887 with
               | FStar_Syntax_Syntax.Tm_type uu____11892 -> true
               | uu____11894 -> false in
             let res_typ =
               FStar_Syntax_Util.unrefine lc.FStar_TypeChecker_Common.res_typ in
             let uu____11897 = FStar_Syntax_Util.head_and_args res_typ in
             match uu____11897 with
             | (head, args) ->
                 ((let uu____11947 =
                     FStar_TypeChecker_Env.debug env
                       (FStar_Options.Other "Coercions") in
                   if uu____11947
                   then
                     let uu____11951 =
                       FStar_Range.string_of_range e.FStar_Syntax_Syntax.pos in
                     let uu____11953 = FStar_Syntax_Print.term_to_string e in
                     let uu____11955 =
                       FStar_Syntax_Print.term_to_string res_typ in
                     let uu____11957 =
                       FStar_Syntax_Print.term_to_string exp_t in
                     FStar_Util.print4
                       "(%s) Trying to coerce %s from type (%s) to type (%s)\n"
                       uu____11951 uu____11953 uu____11955 uu____11957
                   else ());
                  (let mk_erased u t =
                     let uu____11975 =
                       let uu____11978 =
                         fvar_const env FStar_Parser_Const.erased_lid in
                       FStar_Syntax_Syntax.mk_Tm_uinst uu____11978 [u] in
                     let uu____11979 =
                       let uu____11990 = FStar_Syntax_Syntax.as_arg t in
                       [uu____11990] in
                     FStar_Syntax_Util.mk_app uu____11975 uu____11979 in
                   let uu____12015 =
                     let uu____12030 =
                       let uu____12031 = FStar_Syntax_Util.un_uinst head in
                       uu____12031.FStar_Syntax_Syntax.n in
                     (uu____12030, args) in
                   match uu____12015 with
                   | (FStar_Syntax_Syntax.Tm_fvar fv, []) when
                       (FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.bool_lid)
                         && (is_type exp_t)
                       ->
                       let uu____12069 =
                         coerce_with env e lc FStar_Syntax_Util.ktype0
                           FStar_Parser_Const.b2t_lid [] []
                           FStar_Syntax_Syntax.mk_Total in
                       (match uu____12069 with
                        | (e1, lc1) ->
                            (e1, lc1, FStar_TypeChecker_Env.trivial_guard))
                   | (FStar_Syntax_Syntax.Tm_fvar fv, []) when
                       (FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.term_lid)
                         && (is_t_term_view exp_t)
                       ->
                       let uu____12109 =
                         coerce_with env e lc FStar_Syntax_Syntax.t_term_view
                           FStar_Parser_Const.inspect [] []
                           FStar_Syntax_Syntax.mk_Tac in
                       (match uu____12109 with
                        | (e1, lc1) ->
                            (e1, lc1, FStar_TypeChecker_Env.trivial_guard))
                   | (FStar_Syntax_Syntax.Tm_fvar fv, []) when
                       (FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.term_view_lid)
                         && (is_t_term exp_t)
                       ->
                       let uu____12149 =
                         coerce_with env e lc FStar_Syntax_Syntax.t_term
                           FStar_Parser_Const.pack [] []
                           FStar_Syntax_Syntax.mk_Tac in
                       (match uu____12149 with
                        | (e1, lc1) ->
                            (e1, lc1, FStar_TypeChecker_Env.trivial_guard))
                   | (FStar_Syntax_Syntax.Tm_fvar fv, []) when
                       (FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.binder_lid)
                         && (is_t_term exp_t)
                       ->
                       let uu____12189 =
                         coerce_with env e lc FStar_Syntax_Syntax.t_term
                           FStar_Parser_Const.binder_to_term [] []
                           FStar_Syntax_Syntax.mk_Tac in
                       (match uu____12189 with
                        | (e1, lc1) ->
                            (e1, lc1, FStar_TypeChecker_Env.trivial_guard))
                   | uu____12210 ->
                       let uu____12225 =
                         let uu____12230 = check_erased env res_typ in
                         let uu____12231 = check_erased env exp_t in
                         (uu____12230, uu____12231) in
                       (match uu____12225 with
                        | (No, Yes ty) ->
                            let u =
                              env.FStar_TypeChecker_Env.universe_of env ty in
                            let uu____12240 =
                              FStar_TypeChecker_Rel.get_subtyping_predicate
                                env res_typ ty in
                            (match uu____12240 with
                             | FStar_Pervasives_Native.None ->
                                 (e, lc, FStar_TypeChecker_Env.trivial_guard)
                             | FStar_Pervasives_Native.Some g ->
                                 let g1 =
                                   FStar_TypeChecker_Env.apply_guard g e in
                                 let uu____12251 =
                                   let uu____12256 =
                                     let uu____12257 =
                                       FStar_Syntax_Syntax.iarg ty in
                                     [uu____12257] in
                                   coerce_with env e lc exp_t
                                     FStar_Parser_Const.hide [u] uu____12256
                                     FStar_Syntax_Syntax.mk_Total in
                                 (match uu____12251 with
                                  | (e1, lc1) -> (e1, lc1, g1)))
                        | (Yes ty, No) ->
                            let u =
                              env.FStar_TypeChecker_Env.universe_of env ty in
                            let uu____12292 =
                              let uu____12297 =
                                let uu____12298 = FStar_Syntax_Syntax.iarg ty in
                                [uu____12298] in
                              coerce_with env e lc ty
                                FStar_Parser_Const.reveal [u] uu____12297
                                FStar_Syntax_Syntax.mk_GTotal in
                            (match uu____12292 with
                             | (e1, lc1) ->
                                 (e1, lc1,
                                   FStar_TypeChecker_Env.trivial_guard))
                        | uu____12331 ->
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
        let uu____12366 = FStar_Syntax_Util.head_and_args rt1 in
        match uu____12366 with
        | (hd, args) ->
            let uu____12415 =
              let uu____12430 =
                let uu____12431 = FStar_Syntax_Subst.compress hd in
                uu____12431.FStar_Syntax_Syntax.n in
              (uu____12430, args) in
            (match uu____12415 with
             | (FStar_Syntax_Syntax.Tm_fvar fv, []) when
                 FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.term_lid
                 ->
                 let uu____12469 =
                   coerce_with env e lc FStar_Syntax_Syntax.t_term_view
                     FStar_Parser_Const.inspect [] []
                     FStar_Syntax_Syntax.mk_Tac in
                 FStar_All.pipe_left
                   (fun uu____12496 ->
                      FStar_Pervasives_Native.Some uu____12496) uu____12469
             | uu____12497 -> FStar_Pervasives_Native.None)
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
          (let uu____12550 =
             FStar_TypeChecker_Env.debug env FStar_Options.High in
           if uu____12550
           then
             let uu____12553 = FStar_Syntax_Print.term_to_string e in
             let uu____12555 = FStar_TypeChecker_Common.lcomp_to_string lc in
             let uu____12557 = FStar_Syntax_Print.term_to_string t in
             FStar_Util.print3 "weaken_result_typ e=(%s) lc=(%s) t=(%s)\n"
               uu____12553 uu____12555 uu____12557
           else ());
          (let use_eq =
             (env.FStar_TypeChecker_Env.use_eq_strict ||
                env.FStar_TypeChecker_Env.use_eq)
               ||
               (let uu____12567 =
                  FStar_TypeChecker_Env.effect_decl_opt env
                    lc.FStar_TypeChecker_Common.eff_name in
                match uu____12567 with
                | FStar_Pervasives_Native.Some (ed, qualifiers) ->
                    FStar_All.pipe_right qualifiers
                      (FStar_List.contains FStar_Syntax_Syntax.Reifiable)
                | uu____12592 -> false) in
           let gopt =
             if use_eq
             then
               let uu____12618 =
                 FStar_TypeChecker_Rel.try_teq true env
                   lc.FStar_TypeChecker_Common.res_typ t in
               (uu____12618, false)
             else
               (let uu____12628 =
                  FStar_TypeChecker_Rel.get_subtyping_predicate env
                    lc.FStar_TypeChecker_Common.res_typ t in
                (uu____12628, true)) in
           match gopt with
           | (FStar_Pervasives_Native.None, uu____12641) ->
               if env.FStar_TypeChecker_Env.failhard
               then
                 let uu____12653 =
                   FStar_TypeChecker_Err.basic_type_error env
                     (FStar_Pervasives_Native.Some e) t
                     lc.FStar_TypeChecker_Common.res_typ in
                 FStar_Errors.raise_error uu____12653
                   e.FStar_Syntax_Syntax.pos
               else
                 (FStar_TypeChecker_Rel.subtype_fail env e
                    lc.FStar_TypeChecker_Common.res_typ t;
                  (e,
                    ((let uu___1419_12669 = lc in
                      {
                        FStar_TypeChecker_Common.eff_name =
                          (uu___1419_12669.FStar_TypeChecker_Common.eff_name);
                        FStar_TypeChecker_Common.res_typ = t;
                        FStar_TypeChecker_Common.cflags =
                          (uu___1419_12669.FStar_TypeChecker_Common.cflags);
                        FStar_TypeChecker_Common.comp_thunk =
                          (uu___1419_12669.FStar_TypeChecker_Common.comp_thunk)
                      })), FStar_TypeChecker_Env.trivial_guard))
           | (FStar_Pervasives_Native.Some g, apply_guard) ->
               let uu____12676 = FStar_TypeChecker_Env.guard_form g in
               (match uu____12676 with
                | FStar_TypeChecker_Common.Trivial ->
                    let strengthen_trivial uu____12692 =
                      let uu____12693 =
                        FStar_TypeChecker_Common.lcomp_comp lc in
                      match uu____12693 with
                      | (c, g_c) ->
                          let res_t = FStar_Syntax_Util.comp_result c in
                          let set_result_typ c1 =
                            FStar_Syntax_Util.set_result_typ c1 t in
                          let uu____12713 =
                            let uu____12715 = FStar_Syntax_Util.eq_tm t res_t in
                            uu____12715 = FStar_Syntax_Util.Equal in
                          if uu____12713
                          then
                            ((let uu____12722 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  FStar_Options.Extreme in
                              if uu____12722
                              then
                                let uu____12726 =
                                  FStar_Syntax_Print.term_to_string res_t in
                                let uu____12728 =
                                  FStar_Syntax_Print.term_to_string t in
                                FStar_Util.print2
                                  "weaken_result_type::strengthen_trivial: res_t:%s is same as t:%s\n"
                                  uu____12726 uu____12728
                              else ());
                             (let uu____12733 = set_result_typ c in
                              (uu____12733, g_c)))
                          else
                            (let is_res_t_refinement =
                               let res_t1 =
                                 FStar_TypeChecker_Normalize.normalize_refinement
                                   FStar_TypeChecker_Normalize.whnf_steps env
                                   res_t in
                               match res_t1.FStar_Syntax_Syntax.n with
                               | FStar_Syntax_Syntax.Tm_refine uu____12740 ->
                                   true
                               | uu____12748 -> false in
                             if is_res_t_refinement
                             then
                               let x =
                                 FStar_Syntax_Syntax.new_bv
                                   (FStar_Pervasives_Native.Some
                                      (res_t.FStar_Syntax_Syntax.pos)) res_t in
                               let uu____12756 =
                                 let uu____12761 =
                                   let uu____12762 =
                                     FStar_All.pipe_right c
                                       FStar_Syntax_Util.comp_effect_name in
                                   FStar_All.pipe_right uu____12762
                                     (FStar_TypeChecker_Env.norm_eff_name env) in
                                 let uu____12765 =
                                   FStar_Syntax_Syntax.bv_to_name x in
                                 return_value env uu____12761
                                   (comp_univ_opt c) res_t uu____12765 in
                               match uu____12756 with
                               | (cret, gret) ->
                                   let lc1 =
                                     let uu____12775 =
                                       FStar_TypeChecker_Common.lcomp_of_comp
                                         c in
                                     let uu____12776 =
                                       let uu____12777 =
                                         FStar_TypeChecker_Common.lcomp_of_comp
                                           cret in
                                       ((FStar_Pervasives_Native.Some x),
                                         uu____12777) in
                                     bind e.FStar_Syntax_Syntax.pos env
                                       (FStar_Pervasives_Native.Some e)
                                       uu____12775 uu____12776 in
                                   ((let uu____12781 =
                                       FStar_All.pipe_left
                                         (FStar_TypeChecker_Env.debug env)
                                         FStar_Options.Extreme in
                                     if uu____12781
                                     then
                                       let uu____12785 =
                                         FStar_Syntax_Print.term_to_string e in
                                       let uu____12787 =
                                         FStar_Syntax_Print.comp_to_string c in
                                       let uu____12789 =
                                         FStar_Syntax_Print.term_to_string t in
                                       let uu____12791 =
                                         FStar_TypeChecker_Common.lcomp_to_string
                                           lc1 in
                                       FStar_Util.print4
                                         "weaken_result_type::strengthen_trivial: inserting a return for e: %s, c: %s, t: %s, and then post return lc: %s\n"
                                         uu____12785 uu____12787 uu____12789
                                         uu____12791
                                     else ());
                                    (let uu____12796 =
                                       FStar_TypeChecker_Common.lcomp_comp
                                         lc1 in
                                     match uu____12796 with
                                     | (c1, g_lc) ->
                                         let uu____12807 = set_result_typ c1 in
                                         let uu____12808 =
                                           FStar_TypeChecker_Env.conj_guards
                                             [g_c; gret; g_lc] in
                                         (uu____12807, uu____12808)))
                             else
                               ((let uu____12812 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env)
                                     FStar_Options.Extreme in
                                 if uu____12812
                                 then
                                   let uu____12816 =
                                     FStar_Syntax_Print.term_to_string res_t in
                                   let uu____12818 =
                                     FStar_Syntax_Print.comp_to_string c in
                                   FStar_Util.print2
                                     "weaken_result_type::strengthen_trivial: res_t:%s is not a refinement, leaving c:%s as is\n"
                                     uu____12816 uu____12818
                                 else ());
                                (let uu____12823 = set_result_typ c in
                                 (uu____12823, g_c)))) in
                    let lc1 =
                      FStar_TypeChecker_Common.mk_lcomp
                        lc.FStar_TypeChecker_Common.eff_name t
                        lc.FStar_TypeChecker_Common.cflags strengthen_trivial in
                    (e, lc1, g)
                | FStar_TypeChecker_Common.NonTrivial f ->
                    let g1 =
                      let uu___1458_12827 = g in
                      {
                        FStar_TypeChecker_Common.guard_f =
                          FStar_TypeChecker_Common.Trivial;
                        FStar_TypeChecker_Common.deferred_to_tac =
                          (uu___1458_12827.FStar_TypeChecker_Common.deferred_to_tac);
                        FStar_TypeChecker_Common.deferred =
                          (uu___1458_12827.FStar_TypeChecker_Common.deferred);
                        FStar_TypeChecker_Common.univ_ineqs =
                          (uu___1458_12827.FStar_TypeChecker_Common.univ_ineqs);
                        FStar_TypeChecker_Common.implicits =
                          (uu___1458_12827.FStar_TypeChecker_Common.implicits)
                      } in
                    let strengthen uu____12837 =
                      let uu____12838 =
                        env.FStar_TypeChecker_Env.lax &&
                          (FStar_Options.ml_ish ()) in
                      if uu____12838
                      then FStar_TypeChecker_Common.lcomp_comp lc
                      else
                        (let f1 =
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Env.Beta;
                             FStar_TypeChecker_Env.Eager_unfolding;
                             FStar_TypeChecker_Env.Simplify;
                             FStar_TypeChecker_Env.Primops] env f in
                         let uu____12848 =
                           let uu____12849 = FStar_Syntax_Subst.compress f1 in
                           uu____12849.FStar_Syntax_Syntax.n in
                         match uu____12848 with
                         | FStar_Syntax_Syntax.Tm_abs
                             (uu____12856,
                              {
                                FStar_Syntax_Syntax.n =
                                  FStar_Syntax_Syntax.Tm_fvar fv;
                                FStar_Syntax_Syntax.pos = uu____12858;
                                FStar_Syntax_Syntax.vars = uu____12859;_},
                              uu____12860)
                             when
                             FStar_Syntax_Syntax.fv_eq_lid fv
                               FStar_Parser_Const.true_lid
                             ->
                             let lc1 =
                               let uu___1474_12886 = lc in
                               {
                                 FStar_TypeChecker_Common.eff_name =
                                   (uu___1474_12886.FStar_TypeChecker_Common.eff_name);
                                 FStar_TypeChecker_Common.res_typ = t;
                                 FStar_TypeChecker_Common.cflags =
                                   (uu___1474_12886.FStar_TypeChecker_Common.cflags);
                                 FStar_TypeChecker_Common.comp_thunk =
                                   (uu___1474_12886.FStar_TypeChecker_Common.comp_thunk)
                               } in
                             FStar_TypeChecker_Common.lcomp_comp lc1
                         | uu____12887 ->
                             let uu____12888 =
                               FStar_TypeChecker_Common.lcomp_comp lc in
                             (match uu____12888 with
                              | (c, g_c) ->
                                  ((let uu____12900 =
                                      FStar_All.pipe_left
                                        (FStar_TypeChecker_Env.debug env)
                                        FStar_Options.Extreme in
                                    if uu____12900
                                    then
                                      let uu____12904 =
                                        FStar_TypeChecker_Normalize.term_to_string
                                          env
                                          lc.FStar_TypeChecker_Common.res_typ in
                                      let uu____12906 =
                                        FStar_TypeChecker_Normalize.term_to_string
                                          env t in
                                      let uu____12908 =
                                        FStar_TypeChecker_Normalize.comp_to_string
                                          env c in
                                      let uu____12910 =
                                        FStar_TypeChecker_Normalize.term_to_string
                                          env f1 in
                                      FStar_Util.print4
                                        "Weakened from %s to %s\nStrengthening %s with guard %s\n"
                                        uu____12904 uu____12906 uu____12908
                                        uu____12910
                                    else ());
                                   (let u_t_opt = comp_univ_opt c in
                                    let x =
                                      FStar_Syntax_Syntax.new_bv
                                        (FStar_Pervasives_Native.Some
                                           (t.FStar_Syntax_Syntax.pos)) t in
                                    let xexp =
                                      FStar_Syntax_Syntax.bv_to_name x in
                                    let uu____12920 =
                                      let uu____12925 =
                                        let uu____12926 =
                                          FStar_All.pipe_right c
                                            FStar_Syntax_Util.comp_effect_name in
                                        FStar_All.pipe_right uu____12926
                                          (FStar_TypeChecker_Env.norm_eff_name
                                             env) in
                                      return_value env uu____12925 u_t_opt t
                                        xexp in
                                    match uu____12920 with
                                    | (cret, gret) ->
                                        let guard =
                                          if apply_guard
                                          then
                                            let uu____12937 =
                                              let uu____12938 =
                                                FStar_Syntax_Syntax.as_arg
                                                  xexp in
                                              [uu____12938] in
                                            FStar_Syntax_Syntax.mk_Tm_app f1
                                              uu____12937
                                              f1.FStar_Syntax_Syntax.pos
                                          else f1 in
                                        let uu____12965 =
                                          let uu____12970 =
                                            FStar_All.pipe_left
                                              (fun uu____12991 ->
                                                 FStar_Pervasives_Native.Some
                                                   uu____12991)
                                              (FStar_TypeChecker_Err.subtyping_failed
                                                 env
                                                 lc.FStar_TypeChecker_Common.res_typ
                                                 t) in
                                          let uu____12992 =
                                            let uu____12993 =
                                              FStar_TypeChecker_Env.push_bvs
                                                env [x] in
                                            FStar_TypeChecker_Env.set_range
                                              uu____12993
                                              e.FStar_Syntax_Syntax.pos in
                                          let uu____12994 =
                                            FStar_TypeChecker_Common.lcomp_of_comp
                                              cret in
                                          let uu____12995 =
                                            FStar_All.pipe_left
                                              FStar_TypeChecker_Env.guard_of_guard_formula
                                              (FStar_TypeChecker_Common.NonTrivial
                                                 guard) in
                                          strengthen_precondition uu____12970
                                            uu____12992 e uu____12994
                                            uu____12995 in
                                        (match uu____12965 with
                                         | (eq_ret,
                                            _trivial_so_ok_to_discard) ->
                                             let x1 =
                                               let uu___1494_13003 = x in
                                               {
                                                 FStar_Syntax_Syntax.ppname =
                                                   (uu___1494_13003.FStar_Syntax_Syntax.ppname);
                                                 FStar_Syntax_Syntax.index =
                                                   (uu___1494_13003.FStar_Syntax_Syntax.index);
                                                 FStar_Syntax_Syntax.sort =
                                                   (lc.FStar_TypeChecker_Common.res_typ)
                                               } in
                                             let c1 =
                                               let uu____13005 =
                                                 FStar_TypeChecker_Common.lcomp_of_comp
                                                   c in
                                               bind e.FStar_Syntax_Syntax.pos
                                                 env
                                                 (FStar_Pervasives_Native.Some
                                                    e) uu____13005
                                                 ((FStar_Pervasives_Native.Some
                                                     x1), eq_ret) in
                                             let uu____13008 =
                                               FStar_TypeChecker_Common.lcomp_comp
                                                 c1 in
                                             (match uu____13008 with
                                              | (c2, g_lc) ->
                                                  ((let uu____13020 =
                                                      FStar_All.pipe_left
                                                        (FStar_TypeChecker_Env.debug
                                                           env)
                                                        FStar_Options.Extreme in
                                                    if uu____13020
                                                    then
                                                      let uu____13024 =
                                                        FStar_TypeChecker_Normalize.comp_to_string
                                                          env c2 in
                                                      FStar_Util.print1
                                                        "Strengthened to %s\n"
                                                        uu____13024
                                                    else ());
                                                   (let uu____13029 =
                                                      FStar_TypeChecker_Env.conj_guards
                                                        [g_c; gret; g_lc] in
                                                    (c2, uu____13029))))))))) in
                    let flags =
                      FStar_All.pipe_right lc.FStar_TypeChecker_Common.cflags
                        (FStar_List.collect
                           (fun uu___6_13038 ->
                              match uu___6_13038 with
                              | FStar_Syntax_Syntax.RETURN ->
                                  [FStar_Syntax_Syntax.PARTIAL_RETURN]
                              | FStar_Syntax_Syntax.PARTIAL_RETURN ->
                                  [FStar_Syntax_Syntax.PARTIAL_RETURN]
                              | FStar_Syntax_Syntax.CPS ->
                                  [FStar_Syntax_Syntax.CPS]
                              | uu____13041 -> [])) in
                    let lc1 =
                      let uu____13043 =
                        FStar_TypeChecker_Env.norm_eff_name env
                          lc.FStar_TypeChecker_Common.eff_name in
                      FStar_TypeChecker_Common.mk_lcomp uu____13043 t flags
                        strengthen in
                    let g2 =
                      let uu___1510_13045 = g1 in
                      {
                        FStar_TypeChecker_Common.guard_f =
                          FStar_TypeChecker_Common.Trivial;
                        FStar_TypeChecker_Common.deferred_to_tac =
                          (uu___1510_13045.FStar_TypeChecker_Common.deferred_to_tac);
                        FStar_TypeChecker_Common.deferred =
                          (uu___1510_13045.FStar_TypeChecker_Common.deferred);
                        FStar_TypeChecker_Common.univ_ineqs =
                          (uu___1510_13045.FStar_TypeChecker_Common.univ_ineqs);
                        FStar_TypeChecker_Common.implicits =
                          (uu___1510_13045.FStar_TypeChecker_Common.implicits)
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
        let uu____13081 =
          let uu____13084 =
            let uu____13085 =
              let uu____13094 = FStar_Syntax_Syntax.bv_to_name x in
              FStar_Syntax_Syntax.as_arg uu____13094 in
            [uu____13085] in
          FStar_Syntax_Syntax.mk_Tm_app ens uu____13084
            res_t.FStar_Syntax_Syntax.pos in
        FStar_Syntax_Util.refine x uu____13081 in
      let norm t =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.Eager_unfolding;
          FStar_TypeChecker_Env.EraseUniverses] env t in
      let uu____13117 = FStar_Syntax_Util.is_tot_or_gtot_comp comp in
      if uu____13117
      then
        (FStar_Pervasives_Native.None, (FStar_Syntax_Util.comp_result comp))
      else
        (match comp.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.GTotal uu____13136 -> failwith "Impossible"
         | FStar_Syntax_Syntax.Total uu____13152 -> failwith "Impossible"
         | FStar_Syntax_Syntax.Comp ct ->
             let uu____13169 =
               (FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
                  FStar_Parser_Const.effect_Pure_lid)
                 ||
                 (FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
                    FStar_Parser_Const.effect_Ghost_lid) in
             if uu____13169
             then
               (match ct.FStar_Syntax_Syntax.effect_args with
                | (req, uu____13185)::(ens, uu____13187)::uu____13188 ->
                    let uu____13231 =
                      let uu____13234 = norm req in
                      FStar_Pervasives_Native.Some uu____13234 in
                    let uu____13235 =
                      let uu____13236 =
                        mk_post_type ct.FStar_Syntax_Syntax.result_typ ens in
                      FStar_All.pipe_left norm uu____13236 in
                    (uu____13231, uu____13235)
                | uu____13239 ->
                    let uu____13250 =
                      let uu____13256 =
                        let uu____13258 =
                          FStar_Syntax_Print.comp_to_string comp in
                        FStar_Util.format1
                          "Effect constructor is not fully applied; got %s"
                          uu____13258 in
                      (FStar_Errors.Fatal_EffectConstructorNotFullyApplied,
                        uu____13256) in
                    FStar_Errors.raise_error uu____13250
                      comp.FStar_Syntax_Syntax.pos)
             else
               (let ct1 = FStar_TypeChecker_Env.unfold_effect_abbrev env comp in
                match ct1.FStar_Syntax_Syntax.effect_args with
                | (wp, uu____13278)::uu____13279 ->
                    let uu____13306 =
                      let uu____13311 =
                        FStar_TypeChecker_Env.lookup_lid env
                          FStar_Parser_Const.as_requires in
                      FStar_All.pipe_left FStar_Pervasives_Native.fst
                        uu____13311 in
                    (match uu____13306 with
                     | (us_r, uu____13343) ->
                         let uu____13344 =
                           let uu____13349 =
                             FStar_TypeChecker_Env.lookup_lid env
                               FStar_Parser_Const.as_ensures in
                           FStar_All.pipe_left FStar_Pervasives_Native.fst
                             uu____13349 in
                         (match uu____13344 with
                          | (us_e, uu____13381) ->
                              let r =
                                (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos in
                              let as_req =
                                let uu____13384 =
                                  let uu____13385 =
                                    FStar_Ident.set_lid_range
                                      FStar_Parser_Const.as_requires r in
                                  FStar_Syntax_Syntax.fvar uu____13385
                                    FStar_Syntax_Syntax.delta_equational
                                    FStar_Pervasives_Native.None in
                                FStar_Syntax_Syntax.mk_Tm_uinst uu____13384
                                  us_r in
                              let as_ens =
                                let uu____13387 =
                                  let uu____13388 =
                                    FStar_Ident.set_lid_range
                                      FStar_Parser_Const.as_ensures r in
                                  FStar_Syntax_Syntax.fvar uu____13388
                                    FStar_Syntax_Syntax.delta_equational
                                    FStar_Pervasives_Native.None in
                                FStar_Syntax_Syntax.mk_Tm_uinst uu____13387
                                  us_e in
                              let req =
                                let uu____13390 =
                                  let uu____13391 =
                                    let uu____13402 =
                                      FStar_Syntax_Syntax.as_arg wp in
                                    [uu____13402] in
                                  ((ct1.FStar_Syntax_Syntax.result_typ),
                                    (FStar_Pervasives_Native.Some
                                       FStar_Syntax_Syntax.imp_tag))
                                    :: uu____13391 in
                                FStar_Syntax_Syntax.mk_Tm_app as_req
                                  uu____13390
                                  (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos in
                              let ens =
                                let uu____13440 =
                                  let uu____13441 =
                                    let uu____13452 =
                                      FStar_Syntax_Syntax.as_arg wp in
                                    [uu____13452] in
                                  ((ct1.FStar_Syntax_Syntax.result_typ),
                                    (FStar_Pervasives_Native.Some
                                       FStar_Syntax_Syntax.imp_tag))
                                    :: uu____13441 in
                                FStar_Syntax_Syntax.mk_Tm_app as_ens
                                  uu____13440
                                  (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos in
                              let uu____13489 =
                                let uu____13492 = norm req in
                                FStar_Pervasives_Native.Some uu____13492 in
                              let uu____13493 =
                                let uu____13494 =
                                  mk_post_type
                                    ct1.FStar_Syntax_Syntax.result_typ ens in
                                norm uu____13494 in
                              (uu____13489, uu____13493)))
                | uu____13497 -> failwith "Impossible"))
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
        (let uu____13536 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "SMTEncodingReify") in
         if uu____13536
         then
           let uu____13541 = FStar_Syntax_Print.term_to_string tm in
           let uu____13543 = FStar_Syntax_Print.term_to_string tm' in
           FStar_Util.print2 "Reified body %s \nto %s\n" uu____13541
             uu____13543
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
          (let uu____13602 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "SMTEncodingReify") in
           if uu____13602
           then
             let uu____13607 = FStar_Syntax_Print.term_to_string tm in
             let uu____13609 = FStar_Syntax_Print.term_to_string tm' in
             FStar_Util.print2 "Reified body %s \nto %s\n" uu____13607
               uu____13609
           else ());
          tm'
let (remove_reify : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t ->
    let uu____13620 =
      let uu____13622 =
        let uu____13623 = FStar_Syntax_Subst.compress t in
        uu____13623.FStar_Syntax_Syntax.n in
      match uu____13622 with
      | FStar_Syntax_Syntax.Tm_app uu____13627 -> false
      | uu____13645 -> true in
    if uu____13620
    then t
    else
      (let uu____13650 = FStar_Syntax_Util.head_and_args t in
       match uu____13650 with
       | (head, args) ->
           let uu____13693 =
             let uu____13695 =
               let uu____13696 = FStar_Syntax_Subst.compress head in
               uu____13696.FStar_Syntax_Syntax.n in
             match uu____13695 with
             | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify) ->
                 true
             | uu____13701 -> false in
           if uu____13693
           then
             (match args with
              | x::[] -> FStar_Pervasives_Native.fst x
              | uu____13733 ->
                  failwith
                    "Impossible : Reify applied to multiple arguments after normalization.")
           else t)
let (maybe_instantiate :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ ->
        (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.typ *
          FStar_TypeChecker_Common.guard_t))
  =
  fun env ->
    fun e ->
      fun t ->
        let torig = FStar_Syntax_Subst.compress t in
        if Prims.op_Negation env.FStar_TypeChecker_Env.instantiate_imp
        then (e, torig, FStar_TypeChecker_Env.trivial_guard)
        else
          ((let uu____13780 =
              FStar_TypeChecker_Env.debug env FStar_Options.High in
            if uu____13780
            then
              let uu____13783 = FStar_Syntax_Print.term_to_string e in
              let uu____13785 = FStar_Syntax_Print.term_to_string t in
              let uu____13787 =
                let uu____13789 = FStar_TypeChecker_Env.expected_typ env in
                FStar_Common.string_of_option
                  FStar_Syntax_Print.term_to_string uu____13789 in
              FStar_Util.print3
                "maybe_instantiate: starting check for (%s) of type (%s), expected type is %s\n"
                uu____13783 uu____13785 uu____13787
            else ());
           (let unfolded_arrow_formals t1 =
              let rec aux bs t2 =
                let t3 = FStar_TypeChecker_Normalize.unfold_whnf env t2 in
                let uu____13825 = FStar_Syntax_Util.arrow_formals t3 in
                match uu____13825 with
                | (bs', t4) ->
                    (match bs' with
                     | [] -> bs
                     | bs'1 -> aux (FStar_List.append bs bs'1) t4) in
              aux [] t1 in
            let number_of_implicits t1 =
              let formals = unfolded_arrow_formals t1 in
              let n_implicits =
                let uu____13859 =
                  FStar_All.pipe_right formals
                    (FStar_Util.prefix_until
                       (fun uu____13937 ->
                          match uu____13937 with
                          | (uu____13945, imp) ->
                              (FStar_Option.isNone imp) ||
                                (let uu____13952 =
                                   FStar_Syntax_Util.eq_aqual imp
                                     (FStar_Pervasives_Native.Some
                                        FStar_Syntax_Syntax.Equality) in
                                 uu____13952 = FStar_Syntax_Util.Equal))) in
                match uu____13859 with
                | FStar_Pervasives_Native.None -> FStar_List.length formals
                | FStar_Pervasives_Native.Some
                    (implicits, _first_explicit, _rest) ->
                    FStar_List.length implicits in
              n_implicits in
            let inst_n_binders t1 =
              let uu____14071 = FStar_TypeChecker_Env.expected_typ env in
              match uu____14071 with
              | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
              | FStar_Pervasives_Native.Some expected_t ->
                  let n_expected = number_of_implicits expected_t in
                  let n_available = number_of_implicits t1 in
                  if n_available < n_expected
                  then
                    let uu____14085 =
                      let uu____14091 =
                        let uu____14093 = FStar_Util.string_of_int n_expected in
                        let uu____14095 = FStar_Syntax_Print.term_to_string e in
                        let uu____14097 =
                          FStar_Util.string_of_int n_available in
                        FStar_Util.format3
                          "Expected a term with %s implicit arguments, but %s has only %s"
                          uu____14093 uu____14095 uu____14097 in
                      (FStar_Errors.Fatal_MissingImplicitArguments,
                        uu____14091) in
                    let uu____14101 = FStar_TypeChecker_Env.get_range env in
                    FStar_Errors.raise_error uu____14085 uu____14101
                  else
                    FStar_Pervasives_Native.Some (n_available - n_expected) in
            let decr_inst uu___7_14119 =
              match uu___7_14119 with
              | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
              | FStar_Pervasives_Native.Some i ->
                  FStar_Pervasives_Native.Some (i - Prims.int_one) in
            let t1 = FStar_TypeChecker_Normalize.unfold_whnf env t in
            match t1.FStar_Syntax_Syntax.n with
            | FStar_Syntax_Syntax.Tm_arrow (bs, c) ->
                let uu____14162 = FStar_Syntax_Subst.open_comp bs c in
                (match uu____14162 with
                 | (bs1, c1) ->
                     let rec aux subst inst_n bs2 =
                       match (inst_n, bs2) with
                       | (FStar_Pervasives_Native.Some uu____14293,
                          uu____14280) when uu____14293 = Prims.int_zero ->
                           ([], bs2, subst,
                             FStar_TypeChecker_Env.trivial_guard)
                       | (uu____14326,
                          (x, FStar_Pervasives_Native.Some
                           (FStar_Syntax_Syntax.Implicit uu____14328))::rest)
                           ->
                           let t2 =
                             FStar_Syntax_Subst.subst subst
                               x.FStar_Syntax_Syntax.sort in
                           let uu____14362 =
                             new_implicit_var
                               "Instantiation of implicit argument"
                               e.FStar_Syntax_Syntax.pos env t2 in
                           (match uu____14362 with
                            | (v, uu____14403, g) ->
                                ((let uu____14418 =
                                    FStar_TypeChecker_Env.debug env
                                      FStar_Options.High in
                                  if uu____14418
                                  then
                                    let uu____14421 =
                                      FStar_Syntax_Print.term_to_string v in
                                    FStar_Util.print1
                                      "maybe_instantiate: Instantiating implicit with %s\n"
                                      uu____14421
                                  else ());
                                 (let subst1 =
                                    (FStar_Syntax_Syntax.NT (x, v)) :: subst in
                                  let uu____14431 =
                                    aux subst1 (decr_inst inst_n) rest in
                                  match uu____14431 with
                                  | (args, bs3, subst2, g') ->
                                      let uu____14524 =
                                        FStar_TypeChecker_Env.conj_guard g g' in
                                      (((v,
                                          (FStar_Pervasives_Native.Some
                                             FStar_Syntax_Syntax.imp_tag)) ::
                                        args), bs3, subst2, uu____14524))))
                       | (uu____14551,
                          (x, FStar_Pervasives_Native.Some
                           (FStar_Syntax_Syntax.Meta tac_or_attr))::rest) ->
                           let t2 =
                             FStar_Syntax_Subst.subst subst
                               x.FStar_Syntax_Syntax.sort in
                           let meta_t =
                             match tac_or_attr with
                             | FStar_Syntax_Syntax.Arg_qualifier_meta_tac tau
                                 ->
                                 let uu____14590 =
                                   let uu____14597 = FStar_Dyn.mkdyn env in
                                   (uu____14597, tau) in
                                 FStar_Syntax_Syntax.Ctx_uvar_meta_tac
                                   uu____14590
                             | FStar_Syntax_Syntax.Arg_qualifier_meta_attr
                                 attr ->
                                 FStar_Syntax_Syntax.Ctx_uvar_meta_attr attr in
                           let uu____14603 =
                             FStar_TypeChecker_Env.new_implicit_var_aux
                               "Instantiation of meta argument"
                               e.FStar_Syntax_Syntax.pos env t2
                               FStar_Syntax_Syntax.Strict
                               (FStar_Pervasives_Native.Some meta_t) in
                           (match uu____14603 with
                            | (v, uu____14644, g) ->
                                ((let uu____14659 =
                                    FStar_TypeChecker_Env.debug env
                                      FStar_Options.High in
                                  if uu____14659
                                  then
                                    let uu____14662 =
                                      FStar_Syntax_Print.term_to_string v in
                                    FStar_Util.print1
                                      "maybe_instantiate: Instantiating meta argument with %s\n"
                                      uu____14662
                                  else ());
                                 (let subst1 =
                                    (FStar_Syntax_Syntax.NT (x, v)) :: subst in
                                  let uu____14672 =
                                    aux subst1 (decr_inst inst_n) rest in
                                  match uu____14672 with
                                  | (args, bs3, subst2, g') ->
                                      let uu____14765 =
                                        FStar_TypeChecker_Env.conj_guard g g' in
                                      (((v,
                                          (FStar_Pervasives_Native.Some
                                             FStar_Syntax_Syntax.imp_tag)) ::
                                        args), bs3, subst2, uu____14765))))
                       | (uu____14792, bs3) ->
                           ([], bs3, subst,
                             FStar_TypeChecker_Env.trivial_guard) in
                     let uu____14840 =
                       let uu____14867 = inst_n_binders t1 in
                       aux [] uu____14867 bs1 in
                     (match uu____14840 with
                      | (args, bs2, subst, guard) ->
                          (match (args, bs2) with
                           | ([], uu____14939) -> (e, torig, guard)
                           | (uu____14970, []) when
                               let uu____15001 =
                                 FStar_Syntax_Util.is_total_comp c1 in
                               Prims.op_Negation uu____15001 ->
                               (e, torig,
                                 FStar_TypeChecker_Env.trivial_guard)
                           | uu____15003 ->
                               let t2 =
                                 match bs2 with
                                 | [] -> FStar_Syntax_Util.comp_result c1
                                 | uu____15031 ->
                                     FStar_Syntax_Util.arrow bs2 c1 in
                               let t3 = FStar_Syntax_Subst.subst subst t2 in
                               let e1 =
                                 FStar_Syntax_Syntax.mk_Tm_app e args
                                   e.FStar_Syntax_Syntax.pos in
                               (e1, t3, guard))))
            | uu____15042 -> (e, torig, FStar_TypeChecker_Env.trivial_guard)))
let (string_of_univs :
  FStar_Syntax_Syntax.universe_uvar FStar_Util.set -> Prims.string) =
  fun univs ->
    let uu____15054 =
      let uu____15058 = FStar_Util.set_elements univs in
      FStar_All.pipe_right uu____15058
        (FStar_List.map
           (fun u ->
              let uu____15070 = FStar_Syntax_Unionfind.univ_uvar_id u in
              FStar_All.pipe_right uu____15070 FStar_Util.string_of_int)) in
    FStar_All.pipe_right uu____15054 (FStar_String.concat ", ")
let (gen_univs :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe_uvar FStar_Util.set ->
      FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun env ->
    fun x ->
      let uu____15098 = FStar_Util.set_is_empty x in
      if uu____15098
      then []
      else
        (let s =
           let uu____15118 =
             let uu____15121 = FStar_TypeChecker_Env.univ_vars env in
             FStar_Util.set_difference x uu____15121 in
           FStar_All.pipe_right uu____15118 FStar_Util.set_elements in
         (let uu____15139 =
            FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
              (FStar_Options.Other "Gen") in
          if uu____15139
          then
            let uu____15144 =
              let uu____15146 = FStar_TypeChecker_Env.univ_vars env in
              string_of_univs uu____15146 in
            FStar_Util.print1 "univ_vars in env: %s\n" uu____15144
          else ());
         (let r =
            let uu____15155 = FStar_TypeChecker_Env.get_range env in
            FStar_Pervasives_Native.Some uu____15155 in
          let u_names =
            FStar_All.pipe_right s
              (FStar_List.map
                 (fun u ->
                    let u_name = FStar_Syntax_Syntax.new_univ_name r in
                    (let uu____15200 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "Gen") in
                     if uu____15200
                     then
                       let uu____15205 =
                         let uu____15207 =
                           FStar_Syntax_Unionfind.univ_uvar_id u in
                         FStar_All.pipe_left FStar_Util.string_of_int
                           uu____15207 in
                       let uu____15211 =
                         FStar_Syntax_Print.univ_to_string
                           (FStar_Syntax_Syntax.U_unif u) in
                       let uu____15213 =
                         FStar_Syntax_Print.univ_to_string
                           (FStar_Syntax_Syntax.U_name u_name) in
                       FStar_Util.print3 "Setting ?%s (%s) to %s\n"
                         uu____15205 uu____15211 uu____15213
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
        let uu____15243 =
          FStar_Util.set_difference tm_univnames ctx_univnames in
        FStar_All.pipe_right uu____15243 FStar_Util.set_elements in
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
        | ([], uu____15282) -> generalized_univ_names
        | (uu____15289, []) -> explicit_univ_names
        | uu____15296 ->
            let uu____15305 =
              let uu____15311 =
                let uu____15313 = FStar_Syntax_Print.term_to_string t in
                Prims.op_Hat
                  "Generalized universe in a term containing explicit universe annotation : "
                  uu____15313 in
              (FStar_Errors.Fatal_UnexpectedGeneralizedUniverse, uu____15311) in
            FStar_Errors.raise_error uu____15305 t.FStar_Syntax_Syntax.pos
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
      (let uu____15335 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "Gen") in
       if uu____15335
       then
         let uu____15340 = FStar_Syntax_Print.term_to_string t in
         let uu____15342 = FStar_Syntax_Print.univ_names_to_string univnames in
         FStar_Util.print2
           "generalizing universes in the term (post norm): %s with univnames: %s\n"
           uu____15340 uu____15342
       else ());
      (let univs = FStar_Syntax_Free.univs t in
       (let uu____15351 =
          FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
            (FStar_Options.Other "Gen") in
        if uu____15351
        then
          let uu____15356 = string_of_univs univs in
          FStar_Util.print1 "univs to gen : %s\n" uu____15356
        else ());
       (let gen = gen_univs env univs in
        (let uu____15365 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Gen") in
         if uu____15365
         then
           let uu____15370 = FStar_Syntax_Print.term_to_string t in
           let uu____15372 = FStar_Syntax_Print.univ_names_to_string gen in
           FStar_Util.print2 "After generalization, t: %s and univs: %s\n"
             uu____15370 uu____15372
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
        let uu____15456 =
          let uu____15458 =
            FStar_Util.for_all
              (fun uu____15472 ->
                 match uu____15472 with
                 | (uu____15482, uu____15483, c) ->
                     FStar_Syntax_Util.is_pure_or_ghost_comp c) lecs in
          FStar_All.pipe_left Prims.op_Negation uu____15458 in
        if uu____15456
        then FStar_Pervasives_Native.None
        else
          (let norm c =
             (let uu____15535 =
                FStar_TypeChecker_Env.debug env FStar_Options.Medium in
              if uu____15535
              then
                let uu____15538 = FStar_Syntax_Print.comp_to_string c in
                FStar_Util.print1 "Normalizing before generalizing:\n\t %s\n"
                  uu____15538
              else ());
             (let c1 =
                FStar_TypeChecker_Normalize.normalize_comp
                  [FStar_TypeChecker_Env.Beta;
                  FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta;
                  FStar_TypeChecker_Env.NoFullNorm;
                  FStar_TypeChecker_Env.DoNotUnfoldPureLets] env c in
              (let uu____15545 =
                 FStar_TypeChecker_Env.debug env FStar_Options.Medium in
               if uu____15545
               then
                 let uu____15548 = FStar_Syntax_Print.comp_to_string c1 in
                 FStar_Util.print1 "Normalized to:\n\t %s\n" uu____15548
               else ());
              c1) in
           let env_uvars = FStar_TypeChecker_Env.uvars_in_env env in
           let gen_uvars uvs =
             let uu____15566 = FStar_Util.set_difference uvs env_uvars in
             FStar_All.pipe_right uu____15566 FStar_Util.set_elements in
           let univs_and_uvars_of_lec uu____15600 =
             match uu____15600 with
             | (lbname, e, c) ->
                 let c1 = norm c in
                 let t = FStar_Syntax_Util.comp_result c1 in
                 let univs = FStar_Syntax_Free.univs t in
                 let uvt = FStar_Syntax_Free.uvars t in
                 ((let uu____15637 =
                     FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                       (FStar_Options.Other "Gen") in
                   if uu____15637
                   then
                     let uu____15642 =
                       let uu____15644 =
                         let uu____15648 = FStar_Util.set_elements univs in
                         FStar_All.pipe_right uu____15648
                           (FStar_List.map
                              (fun u ->
                                 FStar_Syntax_Print.univ_to_string
                                   (FStar_Syntax_Syntax.U_unif u))) in
                       FStar_All.pipe_right uu____15644
                         (FStar_String.concat ", ") in
                     let uu____15704 =
                       let uu____15706 =
                         let uu____15710 = FStar_Util.set_elements uvt in
                         FStar_All.pipe_right uu____15710
                           (FStar_List.map
                              (fun u ->
                                 let uu____15723 =
                                   FStar_Syntax_Print.uvar_to_string
                                     u.FStar_Syntax_Syntax.ctx_uvar_head in
                                 let uu____15725 =
                                   FStar_Syntax_Print.term_to_string
                                     u.FStar_Syntax_Syntax.ctx_uvar_typ in
                                 FStar_Util.format2 "(%s : %s)" uu____15723
                                   uu____15725)) in
                       FStar_All.pipe_right uu____15706
                         (FStar_String.concat ", ") in
                     FStar_Util.print2
                       "^^^^\n\tFree univs = %s\n\tFree uvt=%s\n" uu____15642
                       uu____15704
                   else ());
                  (let univs1 =
                     let uu____15739 = FStar_Util.set_elements uvt in
                     FStar_List.fold_left
                       (fun univs1 ->
                          fun uv ->
                            let uu____15751 =
                              FStar_Syntax_Free.univs
                                uv.FStar_Syntax_Syntax.ctx_uvar_typ in
                            FStar_Util.set_union univs1 uu____15751) univs
                       uu____15739 in
                   let uvs = gen_uvars uvt in
                   (let uu____15758 =
                      FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                        (FStar_Options.Other "Gen") in
                    if uu____15758
                    then
                      let uu____15763 =
                        let uu____15765 =
                          let uu____15769 = FStar_Util.set_elements univs1 in
                          FStar_All.pipe_right uu____15769
                            (FStar_List.map
                               (fun u ->
                                  FStar_Syntax_Print.univ_to_string
                                    (FStar_Syntax_Syntax.U_unif u))) in
                        FStar_All.pipe_right uu____15765
                          (FStar_String.concat ", ") in
                      let uu____15825 =
                        let uu____15827 =
                          FStar_All.pipe_right uvs
                            (FStar_List.map
                               (fun u ->
                                  let uu____15841 =
                                    FStar_Syntax_Print.uvar_to_string
                                      u.FStar_Syntax_Syntax.ctx_uvar_head in
                                  let uu____15843 =
                                    FStar_TypeChecker_Normalize.term_to_string
                                      env u.FStar_Syntax_Syntax.ctx_uvar_typ in
                                  FStar_Util.format2 "(%s : %s)" uu____15841
                                    uu____15843)) in
                        FStar_All.pipe_right uu____15827
                          (FStar_String.concat ", ") in
                      FStar_Util.print2
                        "^^^^\n\tFree univs = %s\n\tgen_uvars =%s"
                        uu____15763 uu____15825
                    else ());
                   (univs1, uvs, (lbname, e, c1)))) in
           let uu____15864 =
             let uu____15881 = FStar_List.hd lecs in
             univs_and_uvars_of_lec uu____15881 in
           match uu____15864 with
           | (univs, uvs, lec_hd) ->
               let force_univs_eq lec2 u1 u2 =
                 let uu____15971 =
                   (FStar_Util.set_is_subset_of u1 u2) &&
                     (FStar_Util.set_is_subset_of u2 u1) in
                 if uu____15971
                 then ()
                 else
                   (let uu____15976 = lec_hd in
                    match uu____15976 with
                    | (lb1, uu____15984, uu____15985) ->
                        let uu____15986 = lec2 in
                        (match uu____15986 with
                         | (lb2, uu____15994, uu____15995) ->
                             let msg =
                               let uu____15998 =
                                 FStar_Syntax_Print.lbname_to_string lb1 in
                               let uu____16000 =
                                 FStar_Syntax_Print.lbname_to_string lb2 in
                               FStar_Util.format2
                                 "Generalizing the types of these mutually recursive definitions requires an incompatible set of universes for %s and %s"
                                 uu____15998 uu____16000 in
                             let uu____16003 =
                               FStar_TypeChecker_Env.get_range env in
                             FStar_Errors.raise_error
                               (FStar_Errors.Fatal_IncompatibleSetOfUniverse,
                                 msg) uu____16003)) in
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
                 let uu____16071 =
                   (uvars_subseteq u1 u2) && (uvars_subseteq u2 u1) in
                 if uu____16071
                 then ()
                 else
                   (let uu____16076 = lec_hd in
                    match uu____16076 with
                    | (lb1, uu____16084, uu____16085) ->
                        let uu____16086 = lec2 in
                        (match uu____16086 with
                         | (lb2, uu____16094, uu____16095) ->
                             let msg =
                               let uu____16098 =
                                 FStar_Syntax_Print.lbname_to_string lb1 in
                               let uu____16100 =
                                 FStar_Syntax_Print.lbname_to_string lb2 in
                               FStar_Util.format2
                                 "Generalizing the types of these mutually recursive definitions requires an incompatible number of types for %s and %s"
                                 uu____16098 uu____16100 in
                             let uu____16103 =
                               FStar_TypeChecker_Env.get_range env in
                             FStar_Errors.raise_error
                               (FStar_Errors.Fatal_IncompatibleNumberOfTypes,
                                 msg) uu____16103)) in
               let lecs1 =
                 let uu____16114 = FStar_List.tl lecs in
                 FStar_List.fold_right
                   (fun this_lec ->
                      fun lecs1 ->
                        let uu____16167 = univs_and_uvars_of_lec this_lec in
                        match uu____16167 with
                        | (this_univs, this_uvs, this_lec1) ->
                            (force_univs_eq this_lec1 univs this_univs;
                             force_uvars_eq this_lec1 uvs this_uvs;
                             this_lec1
                             ::
                             lecs1)) uu____16114 [] in
               let lecs2 = lec_hd :: lecs1 in
               let gen_types uvs1 =
                 let fail rng k =
                   let uu____16277 = lec_hd in
                   match uu____16277 with
                   | (lbname, e, c) ->
                       let uu____16287 =
                         let uu____16293 =
                           let uu____16295 =
                             FStar_Syntax_Print.term_to_string k in
                           let uu____16297 =
                             FStar_Syntax_Print.lbname_to_string lbname in
                           let uu____16299 =
                             FStar_Syntax_Print.term_to_string
                               (FStar_Syntax_Util.comp_result c) in
                           FStar_Util.format3
                             "Failed to resolve implicit argument of type '%s' in the type of %s (%s)"
                             uu____16295 uu____16297 uu____16299 in
                         (FStar_Errors.Fatal_FailToResolveImplicitArgument,
                           uu____16293) in
                       FStar_Errors.raise_error uu____16287 rng in
                 FStar_All.pipe_right uvs1
                   (FStar_List.map
                      (fun u ->
                         let uu____16321 =
                           FStar_Syntax_Unionfind.find
                             u.FStar_Syntax_Syntax.ctx_uvar_head in
                         match uu____16321 with
                         | FStar_Pervasives_Native.Some uu____16330 ->
                             failwith
                               "Unexpected instantiation of mutually recursive uvar"
                         | uu____16338 ->
                             let k =
                               FStar_TypeChecker_Normalize.normalize
                                 [FStar_TypeChecker_Env.Beta;
                                 FStar_TypeChecker_Env.Exclude
                                   FStar_TypeChecker_Env.Zeta] env
                                 u.FStar_Syntax_Syntax.ctx_uvar_typ in
                             let uu____16342 =
                               FStar_Syntax_Util.arrow_formals k in
                             (match uu____16342 with
                              | (bs, kres) ->
                                  ((let uu____16362 =
                                      let uu____16363 =
                                        let uu____16366 =
                                          FStar_TypeChecker_Normalize.unfold_whnf
                                            env kres in
                                        FStar_Syntax_Util.unrefine
                                          uu____16366 in
                                      uu____16363.FStar_Syntax_Syntax.n in
                                    match uu____16362 with
                                    | FStar_Syntax_Syntax.Tm_type uu____16367
                                        ->
                                        let free =
                                          FStar_Syntax_Free.names kres in
                                        let uu____16371 =
                                          let uu____16373 =
                                            FStar_Util.set_is_empty free in
                                          Prims.op_Negation uu____16373 in
                                        if uu____16371
                                        then
                                          fail
                                            u.FStar_Syntax_Syntax.ctx_uvar_range
                                            kres
                                        else ()
                                    | uu____16378 ->
                                        fail
                                          u.FStar_Syntax_Syntax.ctx_uvar_range
                                          kres);
                                   (let a =
                                      let uu____16380 =
                                        let uu____16383 =
                                          FStar_TypeChecker_Env.get_range env in
                                        FStar_All.pipe_left
                                          (fun uu____16386 ->
                                             FStar_Pervasives_Native.Some
                                               uu____16386) uu____16383 in
                                      FStar_Syntax_Syntax.new_bv uu____16380
                                        kres in
                                    let t =
                                      match bs with
                                      | [] ->
                                          FStar_Syntax_Syntax.bv_to_name a
                                      | uu____16394 ->
                                          let uu____16395 =
                                            FStar_Syntax_Syntax.bv_to_name a in
                                          FStar_Syntax_Util.abs bs
                                            uu____16395
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
                      (fun uu____16498 ->
                         match uu____16498 with
                         | (lbname, e, c) ->
                             let uu____16544 =
                               match (gen_tvars, gen_univs1) with
                               | ([], []) -> (e, c, [])
                               | uu____16605 ->
                                   let uu____16618 = (e, c) in
                                   (match uu____16618 with
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
                                                (fun uu____16658 ->
                                                   match uu____16658 with
                                                   | (x, uu____16664) ->
                                                       let uu____16665 =
                                                         FStar_Syntax_Syntax.bv_to_name
                                                           x in
                                                       FStar_Syntax_Syntax.iarg
                                                         uu____16665)
                                                gen_tvars in
                                            let instantiate_lbname_with_app
                                              tm fv =
                                              let uu____16683 =
                                                let uu____16685 =
                                                  FStar_Util.right lbname in
                                                FStar_Syntax_Syntax.fv_eq fv
                                                  uu____16685 in
                                              if uu____16683
                                              then
                                                FStar_Syntax_Syntax.mk_Tm_app
                                                  tm tvar_args
                                                  tm.FStar_Syntax_Syntax.pos
                                              else tm in
                                            FStar_Syntax_InstFV.inst
                                              instantiate_lbname_with_app e1
                                          else e1 in
                                        let t =
                                          let uu____16694 =
                                            let uu____16695 =
                                              FStar_Syntax_Subst.compress
                                                (FStar_Syntax_Util.comp_result
                                                   c1) in
                                            uu____16695.FStar_Syntax_Syntax.n in
                                          match uu____16694 with
                                          | FStar_Syntax_Syntax.Tm_arrow
                                              (bs, cod) ->
                                              let uu____16720 =
                                                FStar_Syntax_Subst.open_comp
                                                  bs cod in
                                              (match uu____16720 with
                                               | (bs1, cod1) ->
                                                   FStar_Syntax_Util.arrow
                                                     (FStar_List.append
                                                        gen_tvars bs1) cod1)
                                          | uu____16731 ->
                                              FStar_Syntax_Util.arrow
                                                gen_tvars c1 in
                                        let e' =
                                          FStar_Syntax_Util.abs gen_tvars e2
                                            (FStar_Pervasives_Native.Some
                                               (FStar_Syntax_Util.residual_comp_of_comp
                                                  c1)) in
                                        let uu____16735 =
                                          FStar_Syntax_Syntax.mk_Total t in
                                        (e', uu____16735, gen_tvars)) in
                             (match uu____16544 with
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
        (let uu____16882 = FStar_TypeChecker_Env.debug env FStar_Options.Low in
         if uu____16882
         then
           let uu____16885 =
             let uu____16887 =
               FStar_List.map
                 (fun uu____16902 ->
                    match uu____16902 with
                    | (lb, uu____16911, uu____16912) ->
                        FStar_Syntax_Print.lbname_to_string lb) lecs in
             FStar_All.pipe_right uu____16887 (FStar_String.concat ", ") in
           FStar_Util.print1 "Generalizing: %s\n" uu____16885
         else ());
        (let univnames_lecs =
           FStar_List.map
             (fun uu____16938 ->
                match uu____16938 with
                | (l, t, c) -> gather_free_univnames env t) lecs in
         let generalized_lecs =
           let uu____16967 = gen env is_rec lecs in
           match uu____16967 with
           | FStar_Pervasives_Native.None ->
               FStar_All.pipe_right lecs
                 (FStar_List.map
                    (fun uu____17066 ->
                       match uu____17066 with
                       | (l, t, c) -> (l, [], t, c, [])))
           | FStar_Pervasives_Native.Some luecs ->
               ((let uu____17128 =
                   FStar_TypeChecker_Env.debug env FStar_Options.Medium in
                 if uu____17128
                 then
                   FStar_All.pipe_right luecs
                     (FStar_List.iter
                        (fun uu____17176 ->
                           match uu____17176 with
                           | (l, us, e, c, gvs) ->
                               let uu____17210 =
                                 FStar_Range.string_of_range
                                   e.FStar_Syntax_Syntax.pos in
                               let uu____17212 =
                                 FStar_Syntax_Print.lbname_to_string l in
                               let uu____17214 =
                                 FStar_Syntax_Print.term_to_string
                                   (FStar_Syntax_Util.comp_result c) in
                               let uu____17216 =
                                 FStar_Syntax_Print.term_to_string e in
                               let uu____17218 =
                                 FStar_Syntax_Print.binders_to_string ", "
                                   gvs in
                               FStar_Util.print5
                                 "(%s) Generalized %s at type %s\n%s\nVars = (%s)\n"
                                 uu____17210 uu____17212 uu____17214
                                 uu____17216 uu____17218))
                 else ());
                luecs) in
         FStar_List.map2
           (fun univnames ->
              fun uu____17263 ->
                match uu____17263 with
                | (l, generalized_univs, t, c, gvs) ->
                    let uu____17307 =
                      check_universe_generalization univnames
                        generalized_univs t in
                    (l, uu____17307, t, c, gvs)) univnames_lecs
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
        let uu____17362 =
          let uu____17366 =
            let uu____17368 = FStar_TypeChecker_Env.current_module env in
            FStar_Ident.string_of_lid uu____17368 in
          FStar_Pervasives_Native.Some uu____17366 in
        FStar_Profiling.profile
          (fun uu____17385 -> generalize' env is_rec lecs) uu____17362
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
              let uu____17442 =
                FStar_TypeChecker_Rel.get_teq_predicate env2 t1 t21 in
              match uu____17442 with
              | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
              | FStar_Pervasives_Native.Some f ->
                  let uu____17448 = FStar_TypeChecker_Env.apply_guard f e in
                  FStar_All.pipe_right uu____17448
                    (fun uu____17451 ->
                       FStar_Pervasives_Native.Some uu____17451)
            else
              if env2.FStar_TypeChecker_Env.use_eq
              then FStar_TypeChecker_Rel.try_teq true env2 t1 t21
              else
                (let uu____17460 =
                   FStar_TypeChecker_Rel.get_subtyping_predicate env2 t1 t21 in
                 match uu____17460 with
                 | FStar_Pervasives_Native.None ->
                     FStar_Pervasives_Native.None
                 | FStar_Pervasives_Native.Some f ->
                     let uu____17466 = FStar_TypeChecker_Env.apply_guard f e in
                     FStar_All.pipe_left
                       (fun uu____17469 ->
                          FStar_Pervasives_Native.Some uu____17469)
                       uu____17466) in
          let uu____17470 = maybe_coerce_lc env1 e lc t2 in
          match uu____17470 with
          | (e1, lc1, g_c) ->
              let uu____17486 =
                check env1 lc1.FStar_TypeChecker_Common.res_typ t2 in
              (match uu____17486 with
               | FStar_Pervasives_Native.None ->
                   let uu____17495 =
                     FStar_TypeChecker_Err.expected_expression_of_type env1
                       t2 e1 lc1.FStar_TypeChecker_Common.res_typ in
                   let uu____17501 = FStar_TypeChecker_Env.get_range env1 in
                   FStar_Errors.raise_error uu____17495 uu____17501
               | FStar_Pervasives_Native.Some g ->
                   ((let uu____17510 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env1)
                         (FStar_Options.Other "Rel") in
                     if uu____17510
                     then
                       let uu____17515 =
                         FStar_TypeChecker_Rel.guard_to_string env1 g in
                       FStar_All.pipe_left
                         (FStar_Util.print1 "Applied guard is %s\n")
                         uu____17515
                     else ());
                    (let uu____17521 = FStar_TypeChecker_Env.conj_guard g g_c in
                     (e1, lc1, uu____17521))))
let (check_top_level :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.guard_t ->
      FStar_TypeChecker_Common.lcomp ->
        (Prims.bool * FStar_Syntax_Syntax.comp))
  =
  fun env ->
    fun g ->
      fun lc ->
        (let uu____17549 =
           FStar_TypeChecker_Env.debug env FStar_Options.Medium in
         if uu____17549
         then
           let uu____17552 = FStar_TypeChecker_Common.lcomp_to_string lc in
           FStar_Util.print1 "check_top_level, lc = %s\n" uu____17552
         else ());
        (let discharge g1 =
           FStar_TypeChecker_Rel.force_trivial_guard env g1;
           FStar_TypeChecker_Common.is_pure_lcomp lc in
         let g1 = FStar_TypeChecker_Rel.solve_deferred_constraints env g in
         let uu____17566 = FStar_TypeChecker_Common.lcomp_comp lc in
         match uu____17566 with
         | (c, g_c) ->
             let uu____17578 = FStar_TypeChecker_Common.is_total_lcomp lc in
             if uu____17578
             then
               let uu____17586 =
                 let uu____17588 = FStar_TypeChecker_Env.conj_guard g1 g_c in
                 discharge uu____17588 in
               (uu____17586, c)
             else
               (let steps =
                  [FStar_TypeChecker_Env.Beta;
                  FStar_TypeChecker_Env.NoFullNorm;
                  FStar_TypeChecker_Env.DoNotUnfoldPureLets] in
                let c1 =
                  let uu____17596 =
                    let uu____17597 =
                      FStar_TypeChecker_Env.unfold_effect_abbrev env c in
                    FStar_All.pipe_right uu____17597
                      FStar_Syntax_Syntax.mk_Comp in
                  FStar_All.pipe_right uu____17596
                    (FStar_TypeChecker_Normalize.normalize_comp steps env) in
                let uu____17598 = check_trivial_precondition env c1 in
                match uu____17598 with
                | (ct, vc, g_pre) ->
                    ((let uu____17614 =
                        FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                          (FStar_Options.Other "Simplification") in
                      if uu____17614
                      then
                        let uu____17619 =
                          FStar_Syntax_Print.term_to_string vc in
                        FStar_Util.print1 "top-level VC: %s\n" uu____17619
                      else ());
                     (let uu____17624 =
                        let uu____17626 =
                          let uu____17627 =
                            FStar_TypeChecker_Env.conj_guard g_c g_pre in
                          FStar_TypeChecker_Env.conj_guard g1 uu____17627 in
                        discharge uu____17626 in
                      let uu____17628 =
                        FStar_All.pipe_right ct FStar_Syntax_Syntax.mk_Comp in
                      (uu____17624, uu____17628)))))
let (short_circuit :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.args -> FStar_TypeChecker_Common.guard_formula)
  =
  fun head ->
    fun seen_args ->
      let short_bin_op f uu___8_17662 =
        match uu___8_17662 with
        | [] -> FStar_TypeChecker_Common.Trivial
        | (fst, uu____17672)::[] -> f fst
        | uu____17697 -> failwith "Unexpexted args to binary operator" in
      let op_and_e e =
        let uu____17709 = FStar_Syntax_Util.b2t e in
        FStar_All.pipe_right uu____17709
          (fun uu____17710 -> FStar_TypeChecker_Common.NonTrivial uu____17710) in
      let op_or_e e =
        let uu____17721 =
          let uu____17722 = FStar_Syntax_Util.b2t e in
          FStar_Syntax_Util.mk_neg uu____17722 in
        FStar_All.pipe_right uu____17721
          (fun uu____17725 -> FStar_TypeChecker_Common.NonTrivial uu____17725) in
      let op_and_t t =
        FStar_All.pipe_right t
          (fun uu____17732 -> FStar_TypeChecker_Common.NonTrivial uu____17732) in
      let op_or_t t =
        let uu____17743 = FStar_All.pipe_right t FStar_Syntax_Util.mk_neg in
        FStar_All.pipe_right uu____17743
          (fun uu____17746 -> FStar_TypeChecker_Common.NonTrivial uu____17746) in
      let op_imp_t t =
        FStar_All.pipe_right t
          (fun uu____17753 -> FStar_TypeChecker_Common.NonTrivial uu____17753) in
      let short_op_ite uu___9_17759 =
        match uu___9_17759 with
        | [] -> FStar_TypeChecker_Common.Trivial
        | (guard, uu____17769)::[] ->
            FStar_TypeChecker_Common.NonTrivial guard
        | _then::(guard, uu____17796)::[] ->
            let uu____17837 = FStar_Syntax_Util.mk_neg guard in
            FStar_All.pipe_right uu____17837
              (fun uu____17838 ->
                 FStar_TypeChecker_Common.NonTrivial uu____17838)
        | uu____17839 -> failwith "Unexpected args to ITE" in
      let table =
        let uu____17851 =
          let uu____17859 = short_bin_op op_and_e in
          (FStar_Parser_Const.op_And, uu____17859) in
        let uu____17867 =
          let uu____17877 =
            let uu____17885 = short_bin_op op_or_e in
            (FStar_Parser_Const.op_Or, uu____17885) in
          let uu____17893 =
            let uu____17903 =
              let uu____17911 = short_bin_op op_and_t in
              (FStar_Parser_Const.and_lid, uu____17911) in
            let uu____17919 =
              let uu____17929 =
                let uu____17937 = short_bin_op op_or_t in
                (FStar_Parser_Const.or_lid, uu____17937) in
              let uu____17945 =
                let uu____17955 =
                  let uu____17963 = short_bin_op op_imp_t in
                  (FStar_Parser_Const.imp_lid, uu____17963) in
                [uu____17955; (FStar_Parser_Const.ite_lid, short_op_ite)] in
              uu____17929 :: uu____17945 in
            uu____17903 :: uu____17919 in
          uu____17877 :: uu____17893 in
        uu____17851 :: uu____17867 in
      match head.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let lid = (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
          let uu____18025 =
            FStar_Util.find_map table
              (fun uu____18040 ->
                 match uu____18040 with
                 | (x, mk) ->
                     let uu____18057 = FStar_Ident.lid_equals x lid in
                     if uu____18057
                     then
                       let uu____18062 = mk seen_args in
                       FStar_Pervasives_Native.Some uu____18062
                     else FStar_Pervasives_Native.None) in
          (match uu____18025 with
           | FStar_Pervasives_Native.None -> FStar_TypeChecker_Common.Trivial
           | FStar_Pervasives_Native.Some g -> g)
      | uu____18066 -> FStar_TypeChecker_Common.Trivial
let (short_circuit_head : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun l ->
    let uu____18074 =
      let uu____18075 = FStar_Syntax_Util.un_uinst l in
      uu____18075.FStar_Syntax_Syntax.n in
    match uu____18074 with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        FStar_Util.for_some (FStar_Syntax_Syntax.fv_eq_lid fv)
          [FStar_Parser_Const.op_And;
          FStar_Parser_Const.op_Or;
          FStar_Parser_Const.and_lid;
          FStar_Parser_Const.or_lid;
          FStar_Parser_Const.imp_lid;
          FStar_Parser_Const.ite_lid]
    | uu____18080 -> false
let (maybe_add_implicit_binders :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.binders)
  =
  fun env ->
    fun bs ->
      let pos bs1 =
        match bs1 with
        | (hd, uu____18116)::uu____18117 ->
            FStar_Syntax_Syntax.range_of_bv hd
        | uu____18136 -> FStar_TypeChecker_Env.get_range env in
      match bs with
      | (uu____18145, FStar_Pervasives_Native.Some
         (FStar_Syntax_Syntax.Implicit uu____18146))::uu____18147 -> bs
      | uu____18165 ->
          let uu____18166 = FStar_TypeChecker_Env.expected_typ env in
          (match uu____18166 with
           | FStar_Pervasives_Native.None -> bs
           | FStar_Pervasives_Native.Some t ->
               let uu____18170 =
                 let uu____18171 = FStar_Syntax_Subst.compress t in
                 uu____18171.FStar_Syntax_Syntax.n in
               (match uu____18170 with
                | FStar_Syntax_Syntax.Tm_arrow (bs', uu____18175) ->
                    let uu____18196 =
                      FStar_Util.prefix_until
                        (fun uu___10_18236 ->
                           match uu___10_18236 with
                           | (uu____18244, FStar_Pervasives_Native.Some
                              (FStar_Syntax_Syntax.Implicit uu____18245)) ->
                               false
                           | uu____18250 -> true) bs' in
                    (match uu____18196 with
                     | FStar_Pervasives_Native.None -> bs
                     | FStar_Pervasives_Native.Some
                         ([], uu____18286, uu____18287) -> bs
                     | FStar_Pervasives_Native.Some
                         (imps, uu____18359, uu____18360) ->
                         let uu____18433 =
                           FStar_All.pipe_right imps
                             (FStar_Util.for_all
                                (fun uu____18454 ->
                                   match uu____18454 with
                                   | (x, uu____18463) ->
                                       let uu____18468 =
                                         FStar_Ident.string_of_id
                                           x.FStar_Syntax_Syntax.ppname in
                                       FStar_Util.starts_with uu____18468 "'")) in
                         if uu____18433
                         then
                           let r = pos bs in
                           let imps1 =
                             FStar_All.pipe_right imps
                               (FStar_List.map
                                  (fun uu____18514 ->
                                     match uu____18514 with
                                     | (x, i) ->
                                         let uu____18533 =
                                           FStar_Syntax_Syntax.set_range_of_bv
                                             x r in
                                         (uu____18533, i))) in
                           FStar_List.append imps1 bs
                         else bs)
                | uu____18544 -> bs))
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
            let uu____18573 =
              ((FStar_Ident.lid_equals m1 m2) ||
                 ((FStar_Syntax_Util.is_pure_effect c1) &&
                    (FStar_Syntax_Util.is_ghost_effect c2)))
                ||
                ((FStar_Syntax_Util.is_pure_effect c2) &&
                   (FStar_Syntax_Util.is_ghost_effect c1)) in
            if uu____18573
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
          let uu____18604 =
            ((is_pure_or_ghost_effect env m) ||
               (FStar_Ident.lid_equals m FStar_Parser_Const.effect_Tot_lid))
              ||
              (FStar_Ident.lid_equals m FStar_Parser_Const.effect_GTot_lid) in
          if uu____18604
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
        (let uu____18647 =
           FStar_TypeChecker_Env.debug env (FStar_Options.Other "ED") in
         if uu____18647
         then
           ((let uu____18652 = FStar_Ident.string_of_lid lident in
             d uu____18652);
            (let uu____18654 = FStar_Ident.string_of_lid lident in
             let uu____18656 = FStar_Syntax_Print.term_to_string def in
             FStar_Util.print2 "Registering top-level definition: %s\n%s\n"
               uu____18654 uu____18656))
         else ());
        (let fv =
           let uu____18662 = FStar_Syntax_Util.incr_delta_qualifier def in
           FStar_Syntax_Syntax.lid_as_fv lident uu____18662
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
         let uu____18674 =
           FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_fvar fv)
             FStar_Range.dummyRange in
         ((let uu___2137_18676 = sig_ctx in
           {
             FStar_Syntax_Syntax.sigel =
               (uu___2137_18676.FStar_Syntax_Syntax.sigel);
             FStar_Syntax_Syntax.sigrng =
               (uu___2137_18676.FStar_Syntax_Syntax.sigrng);
             FStar_Syntax_Syntax.sigquals =
               [FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen];
             FStar_Syntax_Syntax.sigmeta =
               (uu___2137_18676.FStar_Syntax_Syntax.sigmeta);
             FStar_Syntax_Syntax.sigattrs =
               (uu___2137_18676.FStar_Syntax_Syntax.sigattrs);
             FStar_Syntax_Syntax.sigopts =
               (uu___2137_18676.FStar_Syntax_Syntax.sigopts)
           }), uu____18674))
let (check_sigelt_quals :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.sigelt -> unit) =
  fun env ->
    fun se ->
      let visibility uu___11_18694 =
        match uu___11_18694 with
        | FStar_Syntax_Syntax.Private -> true
        | uu____18697 -> false in
      let reducibility uu___12_18705 =
        match uu___12_18705 with
        | FStar_Syntax_Syntax.Abstract -> true
        | FStar_Syntax_Syntax.Irreducible -> true
        | FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen -> true
        | FStar_Syntax_Syntax.Visible_default -> true
        | FStar_Syntax_Syntax.Inline_for_extraction -> true
        | uu____18712 -> false in
      let assumption uu___13_18720 =
        match uu___13_18720 with
        | FStar_Syntax_Syntax.Assumption -> true
        | FStar_Syntax_Syntax.New -> true
        | uu____18724 -> false in
      let reification uu___14_18732 =
        match uu___14_18732 with
        | FStar_Syntax_Syntax.Reifiable -> true
        | FStar_Syntax_Syntax.Reflectable uu____18735 -> true
        | uu____18737 -> false in
      let inferred uu___15_18745 =
        match uu___15_18745 with
        | FStar_Syntax_Syntax.Discriminator uu____18747 -> true
        | FStar_Syntax_Syntax.Projector uu____18749 -> true
        | FStar_Syntax_Syntax.RecordType uu____18755 -> true
        | FStar_Syntax_Syntax.RecordConstructor uu____18765 -> true
        | FStar_Syntax_Syntax.ExceptionConstructor -> true
        | FStar_Syntax_Syntax.HasMaskedEffect -> true
        | FStar_Syntax_Syntax.Effect -> true
        | uu____18778 -> false in
      let has_eq uu___16_18786 =
        match uu___16_18786 with
        | FStar_Syntax_Syntax.Noeq -> true
        | FStar_Syntax_Syntax.Unopteq -> true
        | uu____18790 -> false in
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
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Visible_default ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Irreducible ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Abstract ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Noeq ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Unopteq ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
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
        | FStar_Syntax_Syntax.Reflectable uu____18869 ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x ->
                    ((((reification x) || (inferred x)) || (visibility x)) ||
                       (x = FStar_Syntax_Syntax.TotalEffect))
                      || (x = FStar_Syntax_Syntax.Visible_default)))
        | FStar_Syntax_Syntax.Private -> true
        | uu____18876 -> true in
      let check_erasable quals se1 r =
        let lids = FStar_Syntax_Util.lids_of_sigelt se1 in
        let val_exists =
          FStar_All.pipe_right lids
            (FStar_Util.for_some
               (fun l ->
                  let uu____18909 =
                    FStar_TypeChecker_Env.try_lookup_val_decl env l in
                  FStar_Option.isSome uu____18909)) in
        let val_has_erasable_attr =
          FStar_All.pipe_right lids
            (FStar_Util.for_some
               (fun l ->
                  let attrs_opt =
                    FStar_TypeChecker_Env.lookup_attrs_of_lid env l in
                  (FStar_Option.isSome attrs_opt) &&
                    (let uu____18940 = FStar_Option.get attrs_opt in
                     FStar_Syntax_Util.has_attribute uu____18940
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
           | FStar_Syntax_Syntax.Sig_bundle uu____18960 ->
               let uu____18969 =
                 let uu____18971 =
                   FStar_All.pipe_right quals
                     (FStar_Util.for_some
                        (fun uu___17_18977 ->
                           match uu___17_18977 with
                           | FStar_Syntax_Syntax.Noeq -> true
                           | uu____18980 -> false)) in
                 Prims.op_Negation uu____18971 in
               if uu____18969
               then
                 FStar_Errors.raise_error
                   (FStar_Errors.Fatal_QulifierListNotPermitted,
                     "Incompatible attributes and qualifiers: erasable types do not support decidable equality and must be marked `noeq`")
                   r
               else ()
           | FStar_Syntax_Syntax.Sig_declare_typ uu____18987 -> ()
           | FStar_Syntax_Syntax.Sig_fail uu____18994 -> ()
           | FStar_Syntax_Syntax.Sig_let ((false, lb::[]), uu____19008) ->
               let uu____19017 =
                 FStar_Syntax_Util.abs_formals lb.FStar_Syntax_Syntax.lbdef in
               (match uu____19017 with
                | (uu____19026, body, uu____19028) ->
                    let uu____19033 =
                      let uu____19035 =
                        FStar_TypeChecker_Normalize.non_info_norm env body in
                      Prims.op_Negation uu____19035 in
                    if uu____19033
                    then
                      let uu____19038 =
                        let uu____19044 =
                          let uu____19046 =
                            FStar_Syntax_Print.term_to_string body in
                          FStar_Util.format1
                            "Illegal attribute: the `erasable` attribute is only permitted on inductive type definitions and abbreviations for non-informative types. %s is considered informative."
                            uu____19046 in
                        (FStar_Errors.Fatal_QulifierListNotPermitted,
                          uu____19044) in
                      FStar_Errors.raise_error uu____19038
                        body.FStar_Syntax_Syntax.pos
                    else ())
           | uu____19052 ->
               FStar_Errors.raise_error
                 (FStar_Errors.Fatal_QulifierListNotPermitted,
                   "Illegal attribute: the `erasable` attribute is only permitted on inductive type definitions and abbreviations for non-informative types")
                 r)
        else () in
      let quals =
        FStar_All.pipe_right (FStar_Syntax_Util.quals_of_sigelt se)
          (FStar_List.filter
             (fun x -> Prims.op_Negation (x = FStar_Syntax_Syntax.Logic))) in
      let uu____19066 =
        let uu____19068 =
          FStar_All.pipe_right quals
            (FStar_Util.for_some
               (fun uu___18_19074 ->
                  match uu___18_19074 with
                  | FStar_Syntax_Syntax.OnlyName -> true
                  | uu____19077 -> false)) in
        FStar_All.pipe_right uu____19068 Prims.op_Negation in
      if uu____19066
      then
        let r = FStar_Syntax_Util.range_of_sigelt se in
        let no_dup_quals =
          FStar_Util.remove_dups (fun x -> fun y -> x = y) quals in
        let err' msg =
          let uu____19098 =
            let uu____19104 =
              let uu____19106 = FStar_Syntax_Print.quals_to_string quals in
              FStar_Util.format2
                "The qualifier list \"[%s]\" is not permissible for this element%s"
                uu____19106 msg in
            (FStar_Errors.Fatal_QulifierListNotPermitted, uu____19104) in
          FStar_Errors.raise_error uu____19098 r in
        let err msg = err' (Prims.op_Hat ": " msg) in
        let err'1 uu____19124 = err' "" in
        (if (FStar_List.length quals) <> (FStar_List.length no_dup_quals)
         then err "duplicate qualifiers"
         else ();
         (let uu____19132 =
            let uu____19134 =
              FStar_All.pipe_right quals
                (FStar_List.for_all (quals_combo_ok quals)) in
            Prims.op_Negation uu____19134 in
          if uu____19132 then err "ill-formed combination" else ());
         check_erasable quals se r;
         (match se.FStar_Syntax_Syntax.sigel with
          | FStar_Syntax_Syntax.Sig_let ((is_rec, uu____19145), uu____19146)
              ->
              ((let uu____19158 =
                  is_rec &&
                    (FStar_All.pipe_right quals
                       (FStar_List.contains
                          FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen)) in
                if uu____19158
                then err "recursive definitions cannot be marked inline"
                else ());
               (let uu____19167 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_some
                       (fun x -> (assumption x) || (has_eq x))) in
                if uu____19167
                then
                  err
                    "definitions cannot be assumed or marked with equality qualifiers"
                else ()))
          | FStar_Syntax_Syntax.Sig_bundle uu____19178 ->
              ((let uu____19188 =
                  let uu____19190 =
                    FStar_All.pipe_right quals
                      (FStar_Util.for_all
                         (fun x ->
                            (((((x = FStar_Syntax_Syntax.Abstract) ||
                                  (x =
                                     FStar_Syntax_Syntax.Inline_for_extraction))
                                 || (x = FStar_Syntax_Syntax.NoExtract))
                                || (inferred x))
                               || (visibility x))
                              || (has_eq x))) in
                  Prims.op_Negation uu____19190 in
                if uu____19188 then err'1 () else ());
               (let uu____19200 =
                  (FStar_All.pipe_right quals
                     (FStar_List.existsb
                        (fun uu___19_19206 ->
                           match uu___19_19206 with
                           | FStar_Syntax_Syntax.Unopteq -> true
                           | uu____19209 -> false)))
                    &&
                    (FStar_Syntax_Util.has_attribute
                       se.FStar_Syntax_Syntax.sigattrs
                       FStar_Parser_Const.erasable_attr) in
                if uu____19200
                then
                  err
                    "unopteq is not allowed on an erasable inductives since they don't have decidable equality"
                else ()))
          | FStar_Syntax_Syntax.Sig_declare_typ uu____19215 ->
              let uu____19222 =
                FStar_All.pipe_right quals (FStar_Util.for_some has_eq) in
              if uu____19222 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_assume uu____19230 ->
              let uu____19237 =
                let uu____19239 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x ->
                          (visibility x) ||
                            (x = FStar_Syntax_Syntax.Assumption))) in
                Prims.op_Negation uu____19239 in
              if uu____19237 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect uu____19249 ->
              let uu____19250 =
                let uu____19252 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x ->
                          (((x = FStar_Syntax_Syntax.TotalEffect) ||
                              (inferred x))
                             || (visibility x))
                            || (reification x))) in
                Prims.op_Negation uu____19252 in
              if uu____19250 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_effect_abbrev uu____19262 ->
              let uu____19275 =
                let uu____19277 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x -> (inferred x) || (visibility x))) in
                Prims.op_Negation uu____19277 in
              if uu____19275 then err'1 () else ()
          | uu____19287 -> ()))
      else ()
let (must_erase_for_extraction :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun g ->
    fun t ->
      let rec descend env t1 =
        let uu____19326 =
          let uu____19327 = FStar_Syntax_Subst.compress t1 in
          uu____19327.FStar_Syntax_Syntax.n in
        match uu____19326 with
        | FStar_Syntax_Syntax.Tm_arrow uu____19331 ->
            let uu____19346 = FStar_Syntax_Util.arrow_formals_comp t1 in
            (match uu____19346 with
             | (bs, c) ->
                 let env1 = FStar_TypeChecker_Env.push_binders env bs in
                 (FStar_Syntax_Util.is_ghost_effect
                    (FStar_Syntax_Util.comp_effect_name c))
                   ||
                   ((FStar_Syntax_Util.is_pure_or_ghost_comp c) &&
                      (aux env1 (FStar_Syntax_Util.comp_result c))))
        | FStar_Syntax_Syntax.Tm_refine
            ({ FStar_Syntax_Syntax.ppname = uu____19355;
               FStar_Syntax_Syntax.index = uu____19356;
               FStar_Syntax_Syntax.sort = t2;_},
             uu____19358)
            -> aux env t2
        | FStar_Syntax_Syntax.Tm_app (head, uu____19367) -> descend env head
        | FStar_Syntax_Syntax.Tm_uinst (head, uu____19393) ->
            descend env head
        | FStar_Syntax_Syntax.Tm_fvar fv ->
            FStar_TypeChecker_Env.fv_has_attr env fv
              FStar_Parser_Const.must_erase_for_extraction_attr
        | uu____19399 -> false
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
        (let uu____19409 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Extraction") in
         if uu____19409
         then
           let uu____19414 = FStar_Syntax_Print.term_to_string t2 in
           FStar_Util.print2 "must_erase=%s: %s\n"
             (if res then "true" else "false") uu____19414
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
                  let uu____19479 =
                    FStar_TypeChecker_Err.unexpected_signature_for_monad env
                      eff_name t in
                  FStar_Errors.raise_error uu____19479 r in
                let uu____19489 =
                  FStar_TypeChecker_Env.inst_tscheme signature_ts in
                match uu____19489 with
                | (uu____19498, signature) ->
                    let uu____19500 =
                      let uu____19501 = FStar_Syntax_Subst.compress signature in
                      uu____19501.FStar_Syntax_Syntax.n in
                    (match uu____19500 with
                     | FStar_Syntax_Syntax.Tm_arrow (bs, uu____19509) ->
                         let bs1 = FStar_Syntax_Subst.open_binders bs in
                         (match bs1 with
                          | a::bs2 ->
                              let uu____19557 =
                                FStar_TypeChecker_Env.uvars_for_binders env
                                  bs2
                                  [FStar_Syntax_Syntax.NT
                                     ((FStar_Pervasives_Native.fst a), a_tm)]
                                  (fun b ->
                                     let uu____19573 =
                                       FStar_Syntax_Print.binder_to_string b in
                                     let uu____19575 =
                                       FStar_Ident.string_of_lid eff_name in
                                     let uu____19577 =
                                       FStar_Range.string_of_range r in
                                     FStar_Util.format3
                                       "uvar for binder %s when creating a fresh repr for %s at %s"
                                       uu____19573 uu____19575 uu____19577) r in
                              (match uu____19557 with
                               | (is, g) ->
                                   let uu____19590 =
                                     match repr_ts_opt with
                                     | FStar_Pervasives_Native.None ->
                                         let eff_c =
                                           let uu____19592 =
                                             let uu____19593 =
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
                                                 = uu____19593;
                                               FStar_Syntax_Syntax.flags = []
                                             } in
                                           FStar_Syntax_Syntax.mk_Comp
                                             uu____19592 in
                                         let uu____19612 =
                                           let uu____19613 =
                                             let uu____19628 =
                                               let uu____19637 =
                                                 FStar_Syntax_Syntax.null_binder
                                                   FStar_Syntax_Syntax.t_unit in
                                               [uu____19637] in
                                             (uu____19628, eff_c) in
                                           FStar_Syntax_Syntax.Tm_arrow
                                             uu____19613 in
                                         FStar_Syntax_Syntax.mk uu____19612 r
                                     | FStar_Pervasives_Native.Some repr_ts
                                         ->
                                         let repr =
                                           let uu____19668 =
                                             FStar_TypeChecker_Env.inst_tscheme_with
                                               repr_ts [u] in
                                           FStar_All.pipe_right uu____19668
                                             FStar_Pervasives_Native.snd in
                                         let uu____19677 =
                                           FStar_List.map
                                             FStar_Syntax_Syntax.as_arg (a_tm
                                             :: is) in
                                         FStar_Syntax_Syntax.mk_Tm_app repr
                                           uu____19677 r in
                                   (uu____19590, g))
                          | uu____19686 -> fail signature)
                     | uu____19687 -> fail signature)
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
            let uu____19718 =
              FStar_All.pipe_right eff_name
                (FStar_TypeChecker_Env.get_effect_decl env) in
            FStar_All.pipe_right uu____19718
              (fun ed ->
                 let uu____19726 =
                   FStar_All.pipe_right ed FStar_Syntax_Util.get_eff_repr in
                 fresh_effect_repr env r eff_name
                   ed.FStar_Syntax_Syntax.signature uu____19726 u a_tm)
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
              let uu____19762 =
                FStar_TypeChecker_Env.inst_tscheme_with sig_ts [u] in
              match uu____19762 with
              | (uu____19767, sig_tm) ->
                  let fail t =
                    let uu____19775 =
                      FStar_TypeChecker_Err.unexpected_signature_for_monad
                        env eff_name t in
                    FStar_Errors.raise_error uu____19775 r in
                  let uu____19781 =
                    let uu____19782 = FStar_Syntax_Subst.compress sig_tm in
                    uu____19782.FStar_Syntax_Syntax.n in
                  (match uu____19781 with
                   | FStar_Syntax_Syntax.Tm_arrow (bs, uu____19786) ->
                       let bs1 = FStar_Syntax_Subst.open_binders bs in
                       (match bs1 with
                        | (a', uu____19809)::bs2 ->
                            FStar_All.pipe_right bs2
                              (FStar_Syntax_Subst.subst_binders
                                 [FStar_Syntax_Syntax.NT (a', a_tm)])
                        | uu____19831 -> fail sig_tm)
                   | uu____19832 -> fail sig_tm)
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
          (let uu____19863 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "LayeredEffects") in
           if uu____19863
           then
             let uu____19868 = FStar_Syntax_Print.comp_to_string c in
             let uu____19870 = FStar_Syntax_Print.lid_to_string tgt in
             FStar_Util.print2 "Lifting comp %s to layered effect %s {\n"
               uu____19868 uu____19870
           else ());
          (let r = FStar_TypeChecker_Env.get_range env in
           let ct = FStar_Syntax_Util.comp_to_comp_typ c in
           let lift_name =
             let uu____19879 =
               FStar_Ident.string_of_lid ct.FStar_Syntax_Syntax.effect_name in
             let uu____19881 = FStar_Ident.string_of_lid tgt in
             FStar_Util.format2 "%s ~> %s" uu____19879 uu____19881 in
           let uu____19884 =
             let uu____19895 =
               FStar_List.hd ct.FStar_Syntax_Syntax.comp_univs in
             let uu____19896 =
               FStar_All.pipe_right ct.FStar_Syntax_Syntax.effect_args
                 (FStar_List.map FStar_Pervasives_Native.fst) in
             (uu____19895, (ct.FStar_Syntax_Syntax.result_typ), uu____19896) in
           match uu____19884 with
           | (u, a, c_is) ->
               let uu____19944 =
                 FStar_TypeChecker_Env.inst_tscheme_with lift_ts [u] in
               (match uu____19944 with
                | (uu____19953, lift_t) ->
                    let lift_t_shape_error s =
                      let uu____19964 =
                        FStar_Ident.string_of_lid
                          ct.FStar_Syntax_Syntax.effect_name in
                      let uu____19966 = FStar_Ident.string_of_lid tgt in
                      let uu____19968 =
                        FStar_Syntax_Print.term_to_string lift_t in
                      FStar_Util.format4
                        "Lift from %s to %s has unexpected shape, reason: %s (lift:%s)"
                        uu____19964 uu____19966 s uu____19968 in
                    let uu____19971 =
                      let uu____20004 =
                        let uu____20005 = FStar_Syntax_Subst.compress lift_t in
                        uu____20005.FStar_Syntax_Syntax.n in
                      match uu____20004 with
                      | FStar_Syntax_Syntax.Tm_arrow (bs, c1) when
                          (FStar_List.length bs) >= (Prims.of_int (2)) ->
                          let uu____20069 =
                            FStar_Syntax_Subst.open_comp bs c1 in
                          (match uu____20069 with
                           | (a_b::bs1, c2) ->
                               let uu____20129 =
                                 FStar_All.pipe_right bs1
                                   (FStar_List.splitAt
                                      ((FStar_List.length bs1) -
                                         Prims.int_one)) in
                               (a_b, uu____20129, c2))
                      | uu____20217 ->
                          let uu____20218 =
                            let uu____20224 =
                              lift_t_shape_error
                                "either not an arrow or not enough binders" in
                            (FStar_Errors.Fatal_UnexpectedEffect,
                              uu____20224) in
                          FStar_Errors.raise_error uu____20218 r in
                    (match uu____19971 with
                     | (a_b, (rest_bs, f_b::[]), lift_c) ->
                         let uu____20342 =
                           let uu____20349 =
                             let uu____20350 =
                               let uu____20351 =
                                 let uu____20358 =
                                   FStar_All.pipe_right a_b
                                     FStar_Pervasives_Native.fst in
                                 (uu____20358, a) in
                               FStar_Syntax_Syntax.NT uu____20351 in
                             [uu____20350] in
                           FStar_TypeChecker_Env.uvars_for_binders env
                             rest_bs uu____20349
                             (fun b ->
                                let uu____20375 =
                                  FStar_Syntax_Print.binder_to_string b in
                                let uu____20377 =
                                  FStar_Ident.string_of_lid
                                    ct.FStar_Syntax_Syntax.effect_name in
                                let uu____20379 =
                                  FStar_Ident.string_of_lid tgt in
                                let uu____20381 =
                                  FStar_Range.string_of_range r in
                                FStar_Util.format4
                                  "implicit var for binder %s of %s~>%s at %s"
                                  uu____20375 uu____20377 uu____20379
                                  uu____20381) r in
                         (match uu____20342 with
                          | (rest_bs_uvars, g) ->
                              ((let uu____20395 =
                                  FStar_All.pipe_left
                                    (FStar_TypeChecker_Env.debug env)
                                    (FStar_Options.Other "LayeredEffects") in
                                if uu____20395
                                then
                                  let uu____20400 =
                                    FStar_List.fold_left
                                      (fun s ->
                                         fun u1 ->
                                           let uu____20409 =
                                             let uu____20411 =
                                               FStar_Syntax_Print.term_to_string
                                                 u1 in
                                             Prims.op_Hat ";;;;" uu____20411 in
                                           Prims.op_Hat s uu____20409) ""
                                      rest_bs_uvars in
                                  FStar_Util.print1 "Introduced uvars: %s\n"
                                    uu____20400
                                else ());
                               (let substs =
                                  FStar_List.map2
                                    (fun b ->
                                       fun t ->
                                         let uu____20442 =
                                           let uu____20449 =
                                             FStar_All.pipe_right b
                                               FStar_Pervasives_Native.fst in
                                           (uu____20449, t) in
                                         FStar_Syntax_Syntax.NT uu____20442)
                                    (a_b :: rest_bs) (a :: rest_bs_uvars) in
                                let guard_f =
                                  let f_sort =
                                    let uu____20468 =
                                      FStar_All.pipe_right
                                        (FStar_Pervasives_Native.fst f_b).FStar_Syntax_Syntax.sort
                                        (FStar_Syntax_Subst.subst substs) in
                                    FStar_All.pipe_right uu____20468
                                      FStar_Syntax_Subst.compress in
                                  let f_sort_is =
                                    let uu____20474 =
                                      FStar_TypeChecker_Env.is_layered_effect
                                        env
                                        ct.FStar_Syntax_Syntax.effect_name in
                                    effect_args_from_repr f_sort uu____20474
                                      r in
                                  FStar_List.fold_left2
                                    (fun g1 ->
                                       fun i1 ->
                                         fun i2 ->
                                           let uu____20483 =
                                             FStar_TypeChecker_Rel.layered_effect_teq
                                               env i1 i2
                                               (FStar_Pervasives_Native.Some
                                                  lift_name) in
                                           FStar_TypeChecker_Env.conj_guard
                                             g1 uu____20483)
                                    FStar_TypeChecker_Env.trivial_guard c_is
                                    f_sort_is in
                                let lift_ct =
                                  let uu____20486 =
                                    FStar_All.pipe_right lift_c
                                      (FStar_Syntax_Subst.subst_comp substs) in
                                  FStar_All.pipe_right uu____20486
                                    FStar_Syntax_Util.comp_to_comp_typ in
                                let is =
                                  let uu____20490 =
                                    FStar_TypeChecker_Env.is_layered_effect
                                      env tgt in
                                  effect_args_from_repr
                                    lift_ct.FStar_Syntax_Syntax.result_typ
                                    uu____20490 r in
                                let fml =
                                  let uu____20495 =
                                    let uu____20500 =
                                      FStar_List.hd
                                        lift_ct.FStar_Syntax_Syntax.comp_univs in
                                    let uu____20501 =
                                      let uu____20502 =
                                        FStar_List.hd
                                          lift_ct.FStar_Syntax_Syntax.effect_args in
                                      FStar_Pervasives_Native.fst uu____20502 in
                                    (uu____20500, uu____20501) in
                                  match uu____20495 with
                                  | (u1, wp) ->
                                      FStar_TypeChecker_Env.pure_precondition_for_trivial_post
                                        env u1
                                        lift_ct.FStar_Syntax_Syntax.result_typ
                                        wp FStar_Range.dummyRange in
                                (let uu____20528 =
                                   (FStar_All.pipe_left
                                      (FStar_TypeChecker_Env.debug env)
                                      (FStar_Options.Other "LayeredEffects"))
                                     &&
                                     (FStar_All.pipe_left
                                        (FStar_TypeChecker_Env.debug env)
                                        FStar_Options.Extreme) in
                                 if uu____20528
                                 then
                                   let uu____20534 =
                                     FStar_Syntax_Print.term_to_string fml in
                                   FStar_Util.print1 "Guard for lift is: %s"
                                     uu____20534
                                 else ());
                                (let c1 =
                                   let uu____20540 =
                                     let uu____20541 =
                                       FStar_All.pipe_right is
                                         (FStar_List.map
                                            FStar_Syntax_Syntax.as_arg) in
                                     {
                                       FStar_Syntax_Syntax.comp_univs =
                                         (lift_ct.FStar_Syntax_Syntax.comp_univs);
                                       FStar_Syntax_Syntax.effect_name = tgt;
                                       FStar_Syntax_Syntax.result_typ = a;
                                       FStar_Syntax_Syntax.effect_args =
                                         uu____20541;
                                       FStar_Syntax_Syntax.flags = []
                                     } in
                                   FStar_Syntax_Syntax.mk_Comp uu____20540 in
                                 (let uu____20565 =
                                    FStar_All.pipe_left
                                      (FStar_TypeChecker_Env.debug env)
                                      (FStar_Options.Other "LayeredEffects") in
                                  if uu____20565
                                  then
                                    let uu____20570 =
                                      FStar_Syntax_Print.comp_to_string c1 in
                                    FStar_Util.print1 "} Lifted comp: %s\n"
                                      uu____20570
                                  else ());
                                 (let uu____20575 =
                                    let uu____20576 =
                                      FStar_TypeChecker_Env.conj_guard g
                                        guard_f in
                                    let uu____20577 =
                                      FStar_TypeChecker_Env.guard_of_guard_formula
                                        (FStar_TypeChecker_Common.NonTrivial
                                           fml) in
                                    FStar_TypeChecker_Env.conj_guard
                                      uu____20576 uu____20577 in
                                  (c1, uu____20575)))))))))
let lift_tf_layered_effect_term :
  'uuuuuu20591 .
    'uuuuuu20591 ->
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
              let uu____20620 =
                let uu____20625 =
                  FStar_All.pipe_right sub.FStar_Syntax_Syntax.lift
                    FStar_Util.must in
                FStar_All.pipe_right uu____20625
                  (fun ts -> FStar_TypeChecker_Env.inst_tscheme_with ts [u]) in
              FStar_All.pipe_right uu____20620 FStar_Pervasives_Native.snd in
            let rest_bs =
              let lift_t =
                FStar_All.pipe_right sub.FStar_Syntax_Syntax.lift_wp
                  FStar_Util.must in
              let uu____20668 =
                let uu____20669 =
                  let uu____20672 =
                    FStar_All.pipe_right lift_t FStar_Pervasives_Native.snd in
                  FStar_All.pipe_right uu____20672
                    FStar_Syntax_Subst.compress in
                uu____20669.FStar_Syntax_Syntax.n in
              match uu____20668 with
              | FStar_Syntax_Syntax.Tm_arrow (uu____20695::bs, uu____20697)
                  when (FStar_List.length bs) >= Prims.int_one ->
                  let uu____20737 =
                    FStar_All.pipe_right bs
                      (FStar_List.splitAt
                         ((FStar_List.length bs) - Prims.int_one)) in
                  FStar_All.pipe_right uu____20737
                    FStar_Pervasives_Native.fst
              | uu____20843 ->
                  let uu____20844 =
                    let uu____20850 =
                      let uu____20852 =
                        FStar_Syntax_Print.tscheme_to_string lift_t in
                      FStar_Util.format1
                        "lift_t tscheme %s is not an arrow with enough binders"
                        uu____20852 in
                    (FStar_Errors.Fatal_UnexpectedEffect, uu____20850) in
                  FStar_Errors.raise_error uu____20844
                    (FStar_Pervasives_Native.snd lift_t).FStar_Syntax_Syntax.pos in
            let args =
              let uu____20879 = FStar_Syntax_Syntax.as_arg a in
              let uu____20888 =
                let uu____20899 =
                  FStar_All.pipe_right rest_bs
                    (FStar_List.map
                       (fun uu____20935 ->
                          FStar_Syntax_Syntax.as_arg
                            FStar_Syntax_Syntax.unit_const)) in
                let uu____20942 =
                  let uu____20953 = FStar_Syntax_Syntax.as_arg e in
                  [uu____20953] in
                FStar_List.append uu____20899 uu____20942 in
              uu____20879 :: uu____20888 in
            FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (lift, args))
              e.FStar_Syntax_Syntax.pos
let (get_field_projector_name :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident -> Prims.int -> FStar_Ident.lident)
  =
  fun env ->
    fun datacon ->
      fun index ->
        let uu____21024 = FStar_TypeChecker_Env.lookup_datacon env datacon in
        match uu____21024 with
        | (uu____21029, t) ->
            let err n =
              let uu____21039 =
                let uu____21045 =
                  let uu____21047 = FStar_Ident.string_of_lid datacon in
                  let uu____21049 = FStar_Util.string_of_int n in
                  let uu____21051 = FStar_Util.string_of_int index in
                  FStar_Util.format3
                    "Data constructor %s does not have enough binders (has %s, tried %s)"
                    uu____21047 uu____21049 uu____21051 in
                (FStar_Errors.Fatal_UnexpectedDataConstructor, uu____21045) in
              let uu____21055 = FStar_TypeChecker_Env.get_range env in
              FStar_Errors.raise_error uu____21039 uu____21055 in
            let uu____21056 =
              let uu____21057 = FStar_Syntax_Subst.compress t in
              uu____21057.FStar_Syntax_Syntax.n in
            (match uu____21056 with
             | FStar_Syntax_Syntax.Tm_arrow (bs, uu____21061) ->
                 let bs1 =
                   FStar_All.pipe_right bs
                     (FStar_List.filter
                        (fun uu____21116 ->
                           match uu____21116 with
                           | (uu____21124, q) ->
                               (match q with
                                | FStar_Pervasives_Native.Some
                                    (FStar_Syntax_Syntax.Implicit (true)) ->
                                    false
                                | uu____21133 -> true))) in
                 if (FStar_List.length bs1) <= index
                 then err (FStar_List.length bs1)
                 else
                   (let b = FStar_List.nth bs1 index in
                    FStar_Syntax_Util.mk_field_projector_name datacon
                      (FStar_Pervasives_Native.fst b) index)
             | uu____21167 -> err Prims.int_zero)
let (get_mlift_for_subeff :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sub_eff -> FStar_TypeChecker_Env.mlift)
  =
  fun env ->
    fun sub ->
      let uu____21180 =
        (FStar_TypeChecker_Env.is_layered_effect env
           sub.FStar_Syntax_Syntax.source)
          ||
          (FStar_TypeChecker_Env.is_layered_effect env
             sub.FStar_Syntax_Syntax.target) in
      if uu____21180
      then
        let uu____21183 =
          let uu____21196 =
            FStar_All.pipe_right sub.FStar_Syntax_Syntax.lift_wp
              FStar_Util.must in
          lift_tf_layered_effect sub.FStar_Syntax_Syntax.target uu____21196 in
        {
          FStar_TypeChecker_Env.mlift_wp = uu____21183;
          FStar_TypeChecker_Env.mlift_term =
            (FStar_Pervasives_Native.Some
               (lift_tf_layered_effect_term env sub))
        }
      else
        (let mk_mlift_wp ts env1 c =
           let ct = FStar_Syntax_Util.comp_to_comp_typ c in
           let uu____21231 =
             FStar_TypeChecker_Env.inst_tscheme_with ts
               ct.FStar_Syntax_Syntax.comp_univs in
           match uu____21231 with
           | (uu____21240, lift_t) ->
               let wp = FStar_List.hd ct.FStar_Syntax_Syntax.effect_args in
               let uu____21259 =
                 let uu____21260 =
                   let uu___2526_21261 = ct in
                   let uu____21262 =
                     let uu____21273 =
                       let uu____21282 =
                         let uu____21283 =
                           let uu____21284 =
                             let uu____21301 =
                               let uu____21312 =
                                 FStar_Syntax_Syntax.as_arg
                                   ct.FStar_Syntax_Syntax.result_typ in
                               [uu____21312; wp] in
                             (lift_t, uu____21301) in
                           FStar_Syntax_Syntax.Tm_app uu____21284 in
                         FStar_Syntax_Syntax.mk uu____21283
                           (FStar_Pervasives_Native.fst wp).FStar_Syntax_Syntax.pos in
                       FStar_All.pipe_right uu____21282
                         FStar_Syntax_Syntax.as_arg in
                     [uu____21273] in
                   {
                     FStar_Syntax_Syntax.comp_univs =
                       (uu___2526_21261.FStar_Syntax_Syntax.comp_univs);
                     FStar_Syntax_Syntax.effect_name =
                       (sub.FStar_Syntax_Syntax.target);
                     FStar_Syntax_Syntax.result_typ =
                       (uu___2526_21261.FStar_Syntax_Syntax.result_typ);
                     FStar_Syntax_Syntax.effect_args = uu____21262;
                     FStar_Syntax_Syntax.flags =
                       (uu___2526_21261.FStar_Syntax_Syntax.flags)
                   } in
                 FStar_Syntax_Syntax.mk_Comp uu____21260 in
               (uu____21259, FStar_TypeChecker_Common.trivial_guard) in
         let mk_mlift_term ts u r e =
           let uu____21412 = FStar_TypeChecker_Env.inst_tscheme_with ts [u] in
           match uu____21412 with
           | (uu____21419, lift_t) ->
               let uu____21421 =
                 let uu____21422 =
                   let uu____21439 =
                     let uu____21450 = FStar_Syntax_Syntax.as_arg r in
                     let uu____21459 =
                       let uu____21470 =
                         FStar_Syntax_Syntax.as_arg FStar_Syntax_Syntax.tun in
                       let uu____21479 =
                         let uu____21490 = FStar_Syntax_Syntax.as_arg e in
                         [uu____21490] in
                       uu____21470 :: uu____21479 in
                     uu____21450 :: uu____21459 in
                   (lift_t, uu____21439) in
                 FStar_Syntax_Syntax.Tm_app uu____21422 in
               FStar_Syntax_Syntax.mk uu____21421 e.FStar_Syntax_Syntax.pos in
         let uu____21543 =
           let uu____21556 =
             FStar_All.pipe_right sub.FStar_Syntax_Syntax.lift_wp
               FStar_Util.must in
           FStar_All.pipe_right uu____21556 mk_mlift_wp in
         {
           FStar_TypeChecker_Env.mlift_wp = uu____21543;
           FStar_TypeChecker_Env.mlift_term =
             (match sub.FStar_Syntax_Syntax.lift with
              | FStar_Pervasives_Native.None ->
                  FStar_Pervasives_Native.Some
                    ((fun uu____21592 ->
                        fun uu____21593 -> fun e -> FStar_Util.return_all e))
              | FStar_Pervasives_Native.Some ts ->
                  FStar_Pervasives_Native.Some (mk_mlift_term ts))
         })
let (update_env_sub_eff :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sub_eff -> FStar_TypeChecker_Env.env)
  =
  fun env ->
    fun sub ->
      let uu____21616 = get_mlift_for_subeff env sub in
      FStar_TypeChecker_Env.update_effect_lattice env
        sub.FStar_Syntax_Syntax.source sub.FStar_Syntax_Syntax.target
        uu____21616
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