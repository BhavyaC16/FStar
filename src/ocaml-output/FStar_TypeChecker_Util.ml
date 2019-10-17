open Prims
type lcomp_with_binder =
  (FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option *
    FStar_TypeChecker_Common.lcomp)
let (report : FStar_TypeChecker_Env.env -> Prims.string Prims.list -> unit) =
  fun env  ->
    fun errs  ->
      let uu____22 = FStar_TypeChecker_Env.get_range env  in
      let uu____23 = FStar_TypeChecker_Err.failed_to_prove_specification errs
         in
      FStar_Errors.log_issue uu____22 uu____23
  
let (new_implicit_var :
  Prims.string ->
    FStar_Range.range ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term * (FStar_Syntax_Syntax.ctx_uvar *
            FStar_Range.range) Prims.list * FStar_TypeChecker_Common.guard_t))
  =
  fun reason  ->
    fun r  ->
      fun env  ->
        fun k  ->
          FStar_TypeChecker_Env.new_implicit_var_aux reason r env k
            FStar_Syntax_Syntax.Strict FStar_Pervasives_Native.None
  
let (close_guard_implicits :
  FStar_TypeChecker_Env.env ->
    Prims.bool ->
      FStar_Syntax_Syntax.binders ->
        FStar_TypeChecker_Common.guard_t -> FStar_TypeChecker_Common.guard_t)
  =
  fun env  ->
    fun solve_deferred  ->
      fun xs  ->
        fun g  ->
          let uu____91 = (FStar_Options.eager_subtyping ()) || solve_deferred
             in
          if uu____91
          then
            let uu____94 =
              FStar_All.pipe_right g.FStar_TypeChecker_Common.deferred
                (FStar_List.partition
                   (fun uu____146  ->
                      match uu____146 with
                      | (uu____153,p) ->
                          FStar_TypeChecker_Rel.flex_prob_closing env xs p))
               in
            match uu____94 with
            | (solve_now,defer) ->
                ((let uu____188 =
                    FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                      (FStar_Options.Other "Rel")
                     in
                  if uu____188
                  then
                    (FStar_Util.print_string "SOLVE BEFORE CLOSING:\n";
                     FStar_List.iter
                       (fun uu____205  ->
                          match uu____205 with
                          | (s,p) ->
                              let uu____215 =
                                FStar_TypeChecker_Rel.prob_to_string env p
                                 in
                              FStar_Util.print2 "%s: %s\n" s uu____215)
                       solve_now;
                     FStar_Util.print_string " ...DEFERRED THE REST:\n";
                     FStar_List.iter
                       (fun uu____230  ->
                          match uu____230 with
                          | (s,p) ->
                              let uu____240 =
                                FStar_TypeChecker_Rel.prob_to_string env p
                                 in
                              FStar_Util.print2 "%s: %s\n" s uu____240) defer;
                     FStar_Util.print_string "END\n")
                  else ());
                 (let g1 =
                    FStar_TypeChecker_Rel.solve_deferred_constraints env
                      (let uu___49_248 = g  in
                       {
                         FStar_TypeChecker_Common.guard_f =
                           (uu___49_248.FStar_TypeChecker_Common.guard_f);
                         FStar_TypeChecker_Common.deferred = solve_now;
                         FStar_TypeChecker_Common.univ_ineqs =
                           (uu___49_248.FStar_TypeChecker_Common.univ_ineqs);
                         FStar_TypeChecker_Common.implicits =
                           (uu___49_248.FStar_TypeChecker_Common.implicits)
                       })
                     in
                  let g2 =
                    let uu___52_250 = g1  in
                    {
                      FStar_TypeChecker_Common.guard_f =
                        (uu___52_250.FStar_TypeChecker_Common.guard_f);
                      FStar_TypeChecker_Common.deferred = defer;
                      FStar_TypeChecker_Common.univ_ineqs =
                        (uu___52_250.FStar_TypeChecker_Common.univ_ineqs);
                      FStar_TypeChecker_Common.implicits =
                        (uu___52_250.FStar_TypeChecker_Common.implicits)
                    }  in
                  g2))
          else g
  
let (check_uvars : FStar_Range.range -> FStar_Syntax_Syntax.typ -> unit) =
  fun r  ->
    fun t  ->
      let uvs = FStar_Syntax_Free.uvars t  in
      let uu____267 =
        let uu____269 = FStar_Util.set_is_empty uvs  in
        Prims.op_Negation uu____269  in
      if uu____267
      then
        let us =
          let uu____274 =
            let uu____278 = FStar_Util.set_elements uvs  in
            FStar_List.map
              (fun u  ->
                 FStar_Syntax_Print.uvar_to_string
                   u.FStar_Syntax_Syntax.ctx_uvar_head) uu____278
             in
          FStar_All.pipe_right uu____274 (FStar_String.concat ", ")  in
        (FStar_Options.push ();
         FStar_Options.set_option "hide_uvar_nums" (FStar_Options.Bool false);
         FStar_Options.set_option "print_implicits" (FStar_Options.Bool true);
         (let uu____297 =
            let uu____303 =
              let uu____305 = FStar_Syntax_Print.term_to_string t  in
              FStar_Util.format2
                "Unconstrained unification variables %s in type signature %s; please add an annotation"
                us uu____305
               in
            (FStar_Errors.Error_UncontrainedUnificationVar, uu____303)  in
          FStar_Errors.log_issue r uu____297);
         FStar_Options.pop ())
      else ()
  
let (extract_let_rec_annotation :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.letbinding ->
      (FStar_Syntax_Syntax.univ_names * FStar_Syntax_Syntax.typ * Prims.bool))
  =
  fun env  ->
    fun uu____328  ->
      match uu____328 with
      | { FStar_Syntax_Syntax.lbname = lbname;
          FStar_Syntax_Syntax.lbunivs = univ_vars1;
          FStar_Syntax_Syntax.lbtyp = t;
          FStar_Syntax_Syntax.lbeff = uu____339;
          FStar_Syntax_Syntax.lbdef = e;
          FStar_Syntax_Syntax.lbattrs = uu____341;
          FStar_Syntax_Syntax.lbpos = uu____342;_} ->
          let rng = FStar_Syntax_Syntax.range_of_lbname lbname  in
          let t1 = FStar_Syntax_Subst.compress t  in
          (match t1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_unknown  ->
               let uu____377 = FStar_Syntax_Subst.open_univ_vars univ_vars1 e
                  in
               (match uu____377 with
                | (univ_vars2,e1) ->
                    let env1 =
                      FStar_TypeChecker_Env.push_univ_vars env univ_vars2  in
                    let r = FStar_TypeChecker_Env.get_range env1  in
                    let rec aux e2 =
                      let e3 = FStar_Syntax_Subst.compress e2  in
                      match e3.FStar_Syntax_Syntax.n with
                      | FStar_Syntax_Syntax.Tm_meta (e4,uu____415) -> aux e4
                      | FStar_Syntax_Syntax.Tm_ascribed (e4,t2,uu____422) ->
                          FStar_Pervasives_Native.fst t2
                      | FStar_Syntax_Syntax.Tm_abs (bs,body,uu____477) ->
                          let res = aux body  in
                          let c =
                            match res with
                            | FStar_Util.Inl t2 ->
                                let uu____513 = FStar_Options.ml_ish ()  in
                                if uu____513
                                then FStar_Syntax_Util.ml_comp t2 r
                                else FStar_Syntax_Syntax.mk_Total t2
                            | FStar_Util.Inr c -> c  in
                          let t2 =
                            FStar_Syntax_Syntax.mk
                              (FStar_Syntax_Syntax.Tm_arrow (bs, c))
                              FStar_Pervasives_Native.None
                              c.FStar_Syntax_Syntax.pos
                             in
                          ((let uu____535 =
                              FStar_TypeChecker_Env.debug env1
                                FStar_Options.High
                               in
                            if uu____535
                            then
                              let uu____538 = FStar_Range.string_of_range r
                                 in
                              let uu____540 =
                                FStar_Syntax_Print.term_to_string t2  in
                              FStar_Util.print2 "(%s) Using type %s\n"
                                uu____538 uu____540
                            else ());
                           FStar_Util.Inl t2)
                      | uu____545 -> FStar_Util.Inl FStar_Syntax_Syntax.tun
                       in
                    let t2 =
                      let uu____547 = aux e1  in
                      match uu____547 with
                      | FStar_Util.Inr c ->
                          let uu____553 =
                            FStar_Syntax_Util.is_tot_or_gtot_comp c  in
                          if uu____553
                          then FStar_Syntax_Util.comp_result c
                          else
                            (let uu____558 =
                               let uu____564 =
                                 let uu____566 =
                                   FStar_Syntax_Print.comp_to_string c  in
                                 FStar_Util.format1
                                   "Expected a 'let rec' to be annotated with a value type; got a computation type %s"
                                   uu____566
                                  in
                               (FStar_Errors.Fatal_UnexpectedComputationTypeForLetRec,
                                 uu____564)
                                in
                             FStar_Errors.raise_error uu____558 rng)
                      | FStar_Util.Inl t2 -> t2  in
                    (univ_vars2, t2, true))
           | uu____575 ->
               let uu____576 =
                 FStar_Syntax_Subst.open_univ_vars univ_vars1 t1  in
               (match uu____576 with
                | (univ_vars2,t2) -> (univ_vars2, t2, false)))
  
let rec (decorated_pattern_as_term :
  FStar_Syntax_Syntax.pat ->
    (FStar_Syntax_Syntax.bv Prims.list * FStar_Syntax_Syntax.term))
  =
  fun pat  ->
    let mk1 f =
      FStar_Syntax_Syntax.mk f FStar_Pervasives_Native.None
        pat.FStar_Syntax_Syntax.p
       in
    let pat_as_arg uu____640 =
      match uu____640 with
      | (p,i) ->
          let uu____660 = decorated_pattern_as_term p  in
          (match uu____660 with
           | (vars,te) ->
               let uu____683 =
                 let uu____688 = FStar_Syntax_Syntax.as_implicit i  in
                 (te, uu____688)  in
               (vars, uu____683))
       in
    match pat.FStar_Syntax_Syntax.v with
    | FStar_Syntax_Syntax.Pat_constant c ->
        let uu____702 = mk1 (FStar_Syntax_Syntax.Tm_constant c)  in
        ([], uu____702)
    | FStar_Syntax_Syntax.Pat_wild x ->
        let uu____706 = mk1 (FStar_Syntax_Syntax.Tm_name x)  in
        ([x], uu____706)
    | FStar_Syntax_Syntax.Pat_var x ->
        let uu____710 = mk1 (FStar_Syntax_Syntax.Tm_name x)  in
        ([x], uu____710)
    | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
        let uu____733 =
          let uu____752 =
            FStar_All.pipe_right pats (FStar_List.map pat_as_arg)  in
          FStar_All.pipe_right uu____752 FStar_List.unzip  in
        (match uu____733 with
         | (vars,args) ->
             let vars1 = FStar_List.flatten vars  in
             let uu____890 =
               let uu____891 =
                 let uu____892 =
                   let uu____909 = FStar_Syntax_Syntax.fv_to_tm fv  in
                   (uu____909, args)  in
                 FStar_Syntax_Syntax.Tm_app uu____892  in
               mk1 uu____891  in
             (vars1, uu____890))
    | FStar_Syntax_Syntax.Pat_dot_term (x,e) -> ([], e)
  
let (comp_univ_opt :
  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option)
  =
  fun c  ->
    match c.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Total (uu____948,uopt) -> uopt
    | FStar_Syntax_Syntax.GTotal (uu____958,uopt) -> uopt
    | FStar_Syntax_Syntax.Comp c1 ->
        (match c1.FStar_Syntax_Syntax.comp_univs with
         | [] -> FStar_Pervasives_Native.None
         | hd1::uu____972 -> FStar_Pervasives_Native.Some hd1)
  
let (lcomp_univ_opt :
  FStar_TypeChecker_Common.lcomp ->
    (FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option *
      FStar_TypeChecker_Common.guard_t))
  =
  fun lc  ->
    let uu____987 =
      FStar_All.pipe_right lc FStar_TypeChecker_Common.lcomp_comp  in
    FStar_All.pipe_right uu____987
      (fun uu____1015  ->
         match uu____1015 with | (c,g) -> ((comp_univ_opt c), g))
  
let (destruct_wp_comp :
  FStar_Syntax_Syntax.comp_typ ->
    (FStar_Syntax_Syntax.universe * FStar_Syntax_Syntax.typ *
      FStar_Syntax_Syntax.typ))
  = fun c  -> FStar_Syntax_Util.destruct_comp c 
let (lift_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp_typ ->
      FStar_TypeChecker_Env.mlift ->
        (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun c  ->
      fun lift  ->
        let uu____1078 =
          FStar_All.pipe_right
            (let uu___169_1080 = c  in
             {
               FStar_Syntax_Syntax.comp_univs =
                 (uu___169_1080.FStar_Syntax_Syntax.comp_univs);
               FStar_Syntax_Syntax.effect_name =
                 (uu___169_1080.FStar_Syntax_Syntax.effect_name);
               FStar_Syntax_Syntax.result_typ =
                 (uu___169_1080.FStar_Syntax_Syntax.result_typ);
               FStar_Syntax_Syntax.effect_args =
                 (uu___169_1080.FStar_Syntax_Syntax.effect_args);
               FStar_Syntax_Syntax.flags = []
             }) FStar_Syntax_Syntax.mk_Comp
           in
        FStar_All.pipe_right uu____1078
          (lift.FStar_TypeChecker_Env.mlift_wp env)
  
let (join_effects :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident -> FStar_Ident.lident -> FStar_Ident.lident)
  =
  fun env  ->
    fun l1  ->
      fun l2  ->
        let uu____1101 =
          let uu____1108 = FStar_TypeChecker_Env.norm_eff_name env l1  in
          let uu____1109 = FStar_TypeChecker_Env.norm_eff_name env l2  in
          FStar_TypeChecker_Env.join env uu____1108 uu____1109  in
        match uu____1101 with | (m,uu____1111,uu____1112) -> m
  
let (join_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.lcomp ->
      FStar_TypeChecker_Common.lcomp -> FStar_Ident.lident)
  =
  fun env  ->
    fun c1  ->
      fun c2  ->
        let uu____1129 =
          (FStar_TypeChecker_Common.is_total_lcomp c1) &&
            (FStar_TypeChecker_Common.is_total_lcomp c2)
           in
        if uu____1129
        then FStar_Parser_Const.effect_Tot_lid
        else
          join_effects env c1.FStar_TypeChecker_Common.eff_name
            c2.FStar_TypeChecker_Common.eff_name
  
let (lift_comps :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
          Prims.bool ->
            (FStar_Ident.lident * FStar_Syntax_Syntax.comp *
              FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun c1  ->
      fun c2  ->
        fun b  ->
          fun b_maybe_free_in_c2  ->
            let c11 = FStar_TypeChecker_Env.unfold_effect_abbrev env c1  in
            let c21 = FStar_TypeChecker_Env.unfold_effect_abbrev env c2  in
            let uu____1184 =
              FStar_TypeChecker_Env.join env
                c11.FStar_Syntax_Syntax.effect_name
                c21.FStar_Syntax_Syntax.effect_name
               in
            match uu____1184 with
            | (m,lift1,lift2) ->
                let uu____1202 = lift_comp env c11 lift1  in
                (match uu____1202 with
                 | (c12,g1) ->
                     let uu____1217 =
                       if Prims.op_Negation b_maybe_free_in_c2
                       then lift_comp env c21 lift2
                       else
                         (let x_a =
                            match b with
                            | FStar_Pervasives_Native.None  ->
                                FStar_Syntax_Syntax.null_binder
                                  (FStar_Syntax_Util.comp_result c12)
                            | FStar_Pervasives_Native.Some x ->
                                FStar_Syntax_Syntax.mk_binder x
                             in
                          let env_x =
                            FStar_TypeChecker_Env.push_binders env [x_a]  in
                          let uu____1256 = lift_comp env_x c21 lift2  in
                          match uu____1256 with
                          | (c22,g2) ->
                              let uu____1267 =
                                FStar_TypeChecker_Env.close_guard env 
                                  [x_a] g2
                                 in
                              (c22, uu____1267))
                        in
                     (match uu____1217 with
                      | (c22,g2) ->
                          let uu____1290 =
                            FStar_TypeChecker_Env.conj_guard g1 g2  in
                          (m, c12, c22, uu____1290)))
  
let (is_pure_effect :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> Prims.bool) =
  fun env  ->
    fun l  ->
      let l1 = FStar_TypeChecker_Env.norm_eff_name env l  in
      FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_PURE_lid
  
let (is_pure_or_ghost_effect :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> Prims.bool) =
  fun env  ->
    fun l  ->
      let l1 = FStar_TypeChecker_Env.norm_eff_name env l  in
      (FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_PURE_lid) ||
        (FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_GHOST_lid)
  
let (mk_comp_l :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.cflag Prims.list -> FStar_Syntax_Syntax.comp)
  =
  fun mname  ->
    fun u_result  ->
      fun result  ->
        fun wp  ->
          fun flags  ->
            let uu____1351 =
              let uu____1352 =
                let uu____1363 = FStar_Syntax_Syntax.as_arg wp  in
                [uu____1363]  in
              {
                FStar_Syntax_Syntax.comp_univs = [u_result];
                FStar_Syntax_Syntax.effect_name = mname;
                FStar_Syntax_Syntax.result_typ = result;
                FStar_Syntax_Syntax.effect_args = uu____1352;
                FStar_Syntax_Syntax.flags = flags
              }  in
            FStar_Syntax_Syntax.mk_Comp uu____1351
  
let (mk_comp :
  FStar_Syntax_Syntax.eff_decl ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.cflag Prims.list -> FStar_Syntax_Syntax.comp)
  = fun md  -> mk_comp_l md.FStar_Syntax_Syntax.mname 
let (lax_mk_tot_or_comp_l :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.cflag Prims.list -> FStar_Syntax_Syntax.comp)
  =
  fun mname  ->
    fun u_result  ->
      fun result  ->
        fun flags  ->
          let uu____1447 =
            FStar_Ident.lid_equals mname FStar_Parser_Const.effect_Tot_lid
             in
          if uu____1447
          then
            FStar_Syntax_Syntax.mk_Total' result
              (FStar_Pervasives_Native.Some u_result)
          else mk_comp_l mname u_result result FStar_Syntax_Syntax.tun flags
  
let (is_function : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t  ->
    let uu____1459 =
      let uu____1460 = FStar_Syntax_Subst.compress t  in
      uu____1460.FStar_Syntax_Syntax.n  in
    match uu____1459 with
    | FStar_Syntax_Syntax.Tm_arrow uu____1464 -> true
    | uu____1480 -> false
  
let (label :
  Prims.string ->
    FStar_Range.range -> FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ)
  =
  fun reason  ->
    fun r  ->
      fun f  ->
        FStar_Syntax_Syntax.mk
          (FStar_Syntax_Syntax.Tm_meta
             (f, (FStar_Syntax_Syntax.Meta_labeled (reason, r, false))))
          FStar_Pervasives_Native.None f.FStar_Syntax_Syntax.pos
  
let (label_opt :
  FStar_TypeChecker_Env.env ->
    (unit -> Prims.string) FStar_Pervasives_Native.option ->
      FStar_Range.range -> FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ)
  =
  fun env  ->
    fun reason  ->
      fun r  ->
        fun f  ->
          match reason with
          | FStar_Pervasives_Native.None  -> f
          | FStar_Pervasives_Native.Some reason1 ->
              let uu____1550 =
                let uu____1552 = FStar_TypeChecker_Env.should_verify env  in
                FStar_All.pipe_left Prims.op_Negation uu____1552  in
              if uu____1550
              then f
              else (let uu____1559 = reason1 ()  in label uu____1559 r f)
  
let (label_guard :
  FStar_Range.range ->
    Prims.string ->
      FStar_TypeChecker_Common.guard_t -> FStar_TypeChecker_Common.guard_t)
  =
  fun r  ->
    fun reason  ->
      fun g  ->
        match g.FStar_TypeChecker_Common.guard_f with
        | FStar_TypeChecker_Common.Trivial  -> g
        | FStar_TypeChecker_Common.NonTrivial f ->
            let uu___246_1580 = g  in
            let uu____1581 =
              let uu____1582 = label reason r f  in
              FStar_TypeChecker_Common.NonTrivial uu____1582  in
            {
              FStar_TypeChecker_Common.guard_f = uu____1581;
              FStar_TypeChecker_Common.deferred =
                (uu___246_1580.FStar_TypeChecker_Common.deferred);
              FStar_TypeChecker_Common.univ_ineqs =
                (uu___246_1580.FStar_TypeChecker_Common.univ_ineqs);
              FStar_TypeChecker_Common.implicits =
                (uu___246_1580.FStar_TypeChecker_Common.implicits)
            }
  
let (close_wp_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list ->
      FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun bvs  ->
      fun c  ->
        let uu____1603 = FStar_Syntax_Util.is_ml_comp c  in
        if uu____1603
        then c
        else
          (let uu____1608 =
             env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ())  in
           if uu____1608
           then c
           else
             (let close_wp u_res md res_t bvs1 wp0 =
                let uu____1649 =
                  FStar_Syntax_Util.get_match_with_close_wps
                    md.FStar_Syntax_Syntax.match_wps
                   in
                match uu____1649 with
                | (uu____1658,uu____1659,close1) ->
                    FStar_List.fold_right
                      (fun x  ->
                         fun wp  ->
                           let bs =
                             let uu____1682 = FStar_Syntax_Syntax.mk_binder x
                                in
                             [uu____1682]  in
                           let us =
                             let uu____1704 =
                               let uu____1707 =
                                 env.FStar_TypeChecker_Env.universe_of env
                                   x.FStar_Syntax_Syntax.sort
                                  in
                               [uu____1707]  in
                             u_res :: uu____1704  in
                           let wp1 =
                             FStar_Syntax_Util.abs bs wp
                               (FStar_Pervasives_Native.Some
                                  (FStar_Syntax_Util.mk_residual_comp
                                     FStar_Parser_Const.effect_Tot_lid
                                     FStar_Pervasives_Native.None
                                     [FStar_Syntax_Syntax.TOTAL]))
                              in
                           let uu____1713 =
                             let uu____1718 =
                               FStar_TypeChecker_Env.inst_effect_fun_with us
                                 env md close1
                                in
                             let uu____1719 =
                               let uu____1720 =
                                 FStar_Syntax_Syntax.as_arg res_t  in
                               let uu____1729 =
                                 let uu____1740 =
                                   FStar_Syntax_Syntax.as_arg
                                     x.FStar_Syntax_Syntax.sort
                                    in
                                 let uu____1749 =
                                   let uu____1760 =
                                     FStar_Syntax_Syntax.as_arg wp1  in
                                   [uu____1760]  in
                                 uu____1740 :: uu____1749  in
                               uu____1720 :: uu____1729  in
                             FStar_Syntax_Syntax.mk_Tm_app uu____1718
                               uu____1719
                              in
                           uu____1713 FStar_Pervasives_Native.None
                             wp0.FStar_Syntax_Syntax.pos) bvs1 wp0
                 in
              let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
              let uu____1802 = destruct_wp_comp c1  in
              match uu____1802 with
              | (u_res_t,res_t,wp) ->
                  let md =
                    FStar_TypeChecker_Env.get_effect_decl env
                      c1.FStar_Syntax_Syntax.effect_name
                     in
                  let wp1 = close_wp u_res_t md res_t bvs wp  in
                  mk_comp md u_res_t c1.FStar_Syntax_Syntax.result_typ wp1
                    c1.FStar_Syntax_Syntax.flags))
  
let (close_wp_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list ->
      FStar_TypeChecker_Common.lcomp -> FStar_TypeChecker_Common.lcomp)
  =
  fun env  ->
    fun bvs  ->
      fun lc  ->
        let bs =
          FStar_All.pipe_right bvs
            (FStar_List.map FStar_Syntax_Syntax.mk_binder)
           in
        FStar_All.pipe_right lc
          (FStar_TypeChecker_Common.apply_lcomp (close_wp_comp env bvs)
             (fun g  ->
                let uu____1842 =
                  FStar_All.pipe_right g
                    (FStar_TypeChecker_Env.close_guard env bs)
                   in
                FStar_All.pipe_right uu____1842
                  (close_guard_implicits env false bs)))
  
let (close_layered_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list ->
      FStar_Syntax_Syntax.term Prims.list ->
        FStar_TypeChecker_Common.lcomp -> FStar_TypeChecker_Common.lcomp)
  =
  fun env  ->
    fun bvs  ->
      fun tms  ->
        fun lc  ->
          let bs =
            FStar_All.pipe_right bvs
              (FStar_List.map FStar_Syntax_Syntax.mk_binder)
             in
          let substs =
            FStar_List.map2
              (fun bv  -> fun tm  -> FStar_Syntax_Syntax.NT (bv, tm)) bvs tms
             in
          FStar_All.pipe_right lc
            (FStar_TypeChecker_Common.apply_lcomp
               (FStar_Syntax_Subst.subst_comp substs)
               (fun g  ->
                  let uu____1892 =
                    FStar_All.pipe_right g
                      (FStar_TypeChecker_Env.close_guard env bs)
                     in
                  FStar_All.pipe_right uu____1892
                    (close_guard_implicits env false bs)))
  
let (close_wp_comp_if_refinement_t :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.bv ->
        FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun t  ->
      fun x  ->
        fun c  ->
          let t1 =
            FStar_TypeChecker_Normalize.normalize_refinement
              FStar_TypeChecker_Normalize.whnf_steps env t
             in
          match t1.FStar_Syntax_Syntax.n with
          | FStar_Syntax_Syntax.Tm_refine
              ({ FStar_Syntax_Syntax.ppname = uu____1916;
                 FStar_Syntax_Syntax.index = uu____1917;
                 FStar_Syntax_Syntax.sort =
                   { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
                     FStar_Syntax_Syntax.pos = uu____1919;
                     FStar_Syntax_Syntax.vars = uu____1920;_};_},uu____1921)
              when
              FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.unit_lid ->
              close_wp_comp env [x] c
          | uu____1929 -> c
  
let (should_not_inline_lc : FStar_TypeChecker_Common.lcomp -> Prims.bool) =
  fun lc  ->
    FStar_All.pipe_right lc.FStar_TypeChecker_Common.cflags
      (FStar_Util.for_some
         (fun uu___0_1941  ->
            match uu___0_1941 with
            | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  -> true
            | uu____1944 -> false))
  
let (should_return :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
      FStar_TypeChecker_Common.lcomp -> Prims.bool)
  =
  fun env  ->
    fun eopt  ->
      fun lc  ->
        let lc_is_unit_or_effectful =
          let uu____1969 =
            let uu____1972 =
              FStar_All.pipe_right lc.FStar_TypeChecker_Common.res_typ
                FStar_Syntax_Util.arrow_formals_comp
               in
            FStar_All.pipe_right uu____1972 FStar_Pervasives_Native.snd  in
          FStar_All.pipe_right uu____1969
            (fun c  ->
               (let uu____2028 =
                  FStar_TypeChecker_Env.is_reifiable_comp env c  in
                Prims.op_Negation uu____2028) &&
                 ((FStar_All.pipe_right (FStar_Syntax_Util.comp_result c)
                     FStar_Syntax_Util.is_unit)
                    ||
                    (let uu____2032 =
                       FStar_Syntax_Util.is_pure_or_ghost_comp c  in
                     Prims.op_Negation uu____2032)))
           in
        match eopt with
        | FStar_Pervasives_Native.None  -> false
        | FStar_Pervasives_Native.Some e ->
            (((FStar_TypeChecker_Common.is_pure_or_ghost_lcomp lc) &&
                (Prims.op_Negation lc_is_unit_or_effectful))
               &&
               (let uu____2043 = FStar_Syntax_Util.head_and_args' e  in
                match uu____2043 with
                | (head1,uu____2060) ->
                    let uu____2081 =
                      let uu____2082 = FStar_Syntax_Util.un_uinst head1  in
                      uu____2082.FStar_Syntax_Syntax.n  in
                    (match uu____2081 with
                     | FStar_Syntax_Syntax.Tm_fvar fv ->
                         let uu____2087 =
                           let uu____2089 = FStar_Syntax_Syntax.lid_of_fv fv
                              in
                           FStar_TypeChecker_Env.is_irreducible env
                             uu____2089
                            in
                         Prims.op_Negation uu____2087
                     | uu____2090 -> true)))
              &&
              (let uu____2093 = should_not_inline_lc lc  in
               Prims.op_Negation uu____2093)
  
let (return_value :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.typ ->
        FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun u_t_opt  ->
      fun t  ->
        fun v1  ->
          let c =
            let uu____2121 =
              let uu____2123 =
                FStar_TypeChecker_Env.lid_exists env
                  FStar_Parser_Const.effect_GTot_lid
                 in
              FStar_All.pipe_left Prims.op_Negation uu____2123  in
            if uu____2121
            then FStar_Syntax_Syntax.mk_Total t
            else
              (let uu____2130 = FStar_Syntax_Util.is_unit t  in
               if uu____2130
               then
                 FStar_Syntax_Syntax.mk_Total' t
                   (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.U_zero)
               else
                 (let m =
                    FStar_TypeChecker_Env.get_effect_decl env
                      FStar_Parser_Const.effect_PURE_lid
                     in
                  let u_t =
                    match u_t_opt with
                    | FStar_Pervasives_Native.None  ->
                        env.FStar_TypeChecker_Env.universe_of env t
                    | FStar_Pervasives_Native.Some u_t -> u_t  in
                  let wp =
                    let uu____2139 =
                      env.FStar_TypeChecker_Env.lax &&
                        (FStar_Options.ml_ish ())
                       in
                    if uu____2139
                    then FStar_Syntax_Syntax.tun
                    else
                      (let uu____2144 =
                         FStar_TypeChecker_Env.wp_signature env
                           FStar_Parser_Const.effect_PURE_lid
                          in
                       match uu____2144 with
                       | (a,kwp) ->
                           let k =
                             FStar_Syntax_Subst.subst
                               [FStar_Syntax_Syntax.NT (a, t)] kwp
                              in
                           let uu____2154 =
                             let uu____2155 =
                               let uu____2160 =
                                 FStar_TypeChecker_Env.inst_effect_fun_with
                                   [u_t] env m m.FStar_Syntax_Syntax.ret_wp
                                  in
                               let uu____2161 =
                                 let uu____2162 =
                                   FStar_Syntax_Syntax.as_arg t  in
                                 let uu____2171 =
                                   let uu____2182 =
                                     FStar_Syntax_Syntax.as_arg v1  in
                                   [uu____2182]  in
                                 uu____2162 :: uu____2171  in
                               FStar_Syntax_Syntax.mk_Tm_app uu____2160
                                 uu____2161
                                in
                             uu____2155 FStar_Pervasives_Native.None
                               v1.FStar_Syntax_Syntax.pos
                              in
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Env.Beta;
                             FStar_TypeChecker_Env.NoFullNorm] env uu____2154)
                     in
                  mk_comp m u_t t wp [FStar_Syntax_Syntax.RETURN]))
             in
          (let uu____2216 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "Return")
              in
           if uu____2216
           then
             let uu____2221 =
               FStar_Range.string_of_range v1.FStar_Syntax_Syntax.pos  in
             let uu____2223 = FStar_Syntax_Print.term_to_string v1  in
             let uu____2225 =
               FStar_TypeChecker_Normalize.comp_to_string env c  in
             FStar_Util.print3 "(%s) returning %s at comp type %s\n"
               uu____2221 uu____2223 uu____2225
           else ());
          c
  
let (mk_layered_bind :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.comp_typ ->
        FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
          FStar_Syntax_Syntax.comp_typ ->
            FStar_Syntax_Syntax.cflag Prims.list ->
              FStar_Range.range ->
                (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun m  ->
      fun ct1  ->
        fun b  ->
          fun ct2  ->
            fun flags  ->
              fun r1  ->
                (let uu____2283 =
                   FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                     (FStar_Options.Other "LayeredEffects")
                    in
                 if uu____2283
                 then
                   let uu____2288 =
                     let uu____2290 = FStar_Syntax_Syntax.mk_Comp ct1  in
                     FStar_Syntax_Print.comp_to_string uu____2290  in
                   let uu____2291 =
                     let uu____2293 = FStar_Syntax_Syntax.mk_Comp ct2  in
                     FStar_Syntax_Print.comp_to_string uu____2293  in
                   FStar_Util.print2 "Binding c1:%s and c2:%s {\n" uu____2288
                     uu____2291
                 else ());
                (let ed = FStar_TypeChecker_Env.get_effect_decl env m  in
                 let uu____2298 =
                   let uu____2309 =
                     FStar_List.hd ct1.FStar_Syntax_Syntax.comp_univs  in
                   let uu____2310 =
                     FStar_List.map FStar_Pervasives_Native.fst
                       ct1.FStar_Syntax_Syntax.effect_args
                      in
                   (uu____2309, (ct1.FStar_Syntax_Syntax.result_typ),
                     uu____2310)
                    in
                 match uu____2298 with
                 | (u1,t1,is1) ->
                     let uu____2344 =
                       let uu____2355 =
                         FStar_List.hd ct2.FStar_Syntax_Syntax.comp_univs  in
                       let uu____2356 =
                         FStar_List.map FStar_Pervasives_Native.fst
                           ct2.FStar_Syntax_Syntax.effect_args
                          in
                       (uu____2355, (ct2.FStar_Syntax_Syntax.result_typ),
                         uu____2356)
                        in
                     (match uu____2344 with
                      | (u2,t2,is2) ->
                          let uu____2390 =
                            FStar_TypeChecker_Env.inst_tscheme_with
                              ed.FStar_Syntax_Syntax.bind_wp [u1; u2]
                             in
                          (match uu____2390 with
                           | (uu____2399,bind_t) ->
                               let bind_t_shape_error s =
                                 let uu____2414 =
                                   let uu____2416 =
                                     FStar_Syntax_Print.term_to_string bind_t
                                      in
                                   FStar_Util.format2
                                     "bind %s does not have proper shape (reason:%s)"
                                     uu____2416 s
                                    in
                                 (FStar_Errors.Fatal_UnexpectedEffect,
                                   uu____2414)
                                  in
                               let uu____2420 =
                                 let uu____2465 =
                                   let uu____2466 =
                                     FStar_Syntax_Subst.compress bind_t  in
                                   uu____2466.FStar_Syntax_Syntax.n  in
                                 match uu____2465 with
                                 | FStar_Syntax_Syntax.Tm_arrow (bs,c) when
                                     (FStar_List.length bs) >=
                                       (Prims.of_int (4))
                                     ->
                                     let uu____2542 =
                                       FStar_Syntax_Subst.open_comp bs c  in
                                     (match uu____2542 with
                                      | (a_b::b_b::bs1,c1) ->
                                          let uu____2627 =
                                            let uu____2654 =
                                              FStar_List.splitAt
                                                ((FStar_List.length bs1) -
                                                   (Prims.of_int (2))) bs1
                                               in
                                            FStar_All.pipe_right uu____2654
                                              (fun uu____2739  ->
                                                 match uu____2739 with
                                                 | (l1,l2) ->
                                                     let uu____2820 =
                                                       FStar_List.hd l2  in
                                                     let uu____2833 =
                                                       let uu____2840 =
                                                         FStar_List.tl l2  in
                                                       FStar_List.hd
                                                         uu____2840
                                                        in
                                                     (l1, uu____2820,
                                                       uu____2833))
                                             in
                                          (match uu____2627 with
                                           | (rest_bs,f_b,g_b) ->
                                               let uu____2968 =
                                                 FStar_Syntax_Util.comp_to_comp_typ
                                                   c1
                                                  in
                                               (a_b, b_b, rest_bs, f_b, g_b,
                                                 uu____2968)))
                                 | uu____3001 ->
                                     let uu____3002 =
                                       bind_t_shape_error
                                         "Either not an arrow or not enough binders"
                                        in
                                     FStar_Errors.raise_error uu____3002 r1
                                  in
                               (match uu____2420 with
                                | (a_b,b_b,rest_bs,f_b,g_b,bind_ct) ->
                                    let uu____3127 =
                                      let uu____3134 =
                                        let uu____3135 =
                                          let uu____3136 =
                                            let uu____3143 =
                                              FStar_All.pipe_right a_b
                                                FStar_Pervasives_Native.fst
                                               in
                                            (uu____3143, t1)  in
                                          FStar_Syntax_Syntax.NT uu____3136
                                           in
                                        let uu____3154 =
                                          let uu____3157 =
                                            let uu____3158 =
                                              let uu____3165 =
                                                FStar_All.pipe_right b_b
                                                  FStar_Pervasives_Native.fst
                                                 in
                                              (uu____3165, t2)  in
                                            FStar_Syntax_Syntax.NT uu____3158
                                             in
                                          [uu____3157]  in
                                        uu____3135 :: uu____3154  in
                                      FStar_TypeChecker_Env.uvars_for_binders
                                        env rest_bs uu____3134
                                        (fun b1  ->
                                           let uu____3180 =
                                             FStar_Syntax_Print.binder_to_string
                                               b1
                                              in
                                           let uu____3182 =
                                             FStar_Range.string_of_range r1
                                              in
                                           FStar_Util.format3
                                             "implicit var for binder %s of %s:bind at %s"
                                             uu____3180
                                             (ed.FStar_Syntax_Syntax.mname).FStar_Ident.str
                                             uu____3182) r1
                                       in
                                    (match uu____3127 with
                                     | (rest_bs_uvars,g_uvars) ->
                                         let subst1 =
                                           FStar_List.map2
                                             (fun b1  ->
                                                fun t  ->
                                                  let uu____3219 =
                                                    let uu____3226 =
                                                      FStar_All.pipe_right b1
                                                        FStar_Pervasives_Native.fst
                                                       in
                                                    (uu____3226, t)  in
                                                  FStar_Syntax_Syntax.NT
                                                    uu____3219) (a_b :: b_b
                                             :: rest_bs) (t1 :: t2 ::
                                             rest_bs_uvars)
                                            in
                                         let f_guard =
                                           let f_sort_is =
                                             let uu____3253 =
                                               let uu____3254 =
                                                 let uu____3257 =
                                                   let uu____3258 =
                                                     FStar_All.pipe_right f_b
                                                       FStar_Pervasives_Native.fst
                                                      in
                                                   uu____3258.FStar_Syntax_Syntax.sort
                                                    in
                                                 FStar_Syntax_Subst.compress
                                                   uu____3257
                                                  in
                                               uu____3254.FStar_Syntax_Syntax.n
                                                in
                                             match uu____3253 with
                                             | FStar_Syntax_Syntax.Tm_app
                                                 (uu____3269,uu____3270::is)
                                                 ->
                                                 let uu____3312 =
                                                   FStar_All.pipe_right is
                                                     (FStar_List.map
                                                        FStar_Pervasives_Native.fst)
                                                    in
                                                 FStar_All.pipe_right
                                                   uu____3312
                                                   (FStar_List.map
                                                      (FStar_Syntax_Subst.subst
                                                         subst1))
                                             | uu____3345 ->
                                                 let uu____3346 =
                                                   bind_t_shape_error
                                                     "f's type is not a repr type"
                                                    in
                                                 FStar_Errors.raise_error
                                                   uu____3346 r1
                                              in
                                           FStar_List.fold_left2
                                             (fun g  ->
                                                fun i1  ->
                                                  fun f_i1  ->
                                                    let uu____3362 =
                                                      FStar_TypeChecker_Rel.teq
                                                        env i1 f_i1
                                                       in
                                                    FStar_TypeChecker_Env.conj_guard
                                                      g uu____3362)
                                             FStar_TypeChecker_Env.trivial_guard
                                             is1 f_sort_is
                                            in
                                         let g_guard =
                                           let x_a =
                                             match b with
                                             | FStar_Pervasives_Native.None 
                                                 ->
                                                 FStar_Syntax_Syntax.null_binder
                                                   ct1.FStar_Syntax_Syntax.result_typ
                                             | FStar_Pervasives_Native.Some x
                                                 ->
                                                 FStar_Syntax_Syntax.mk_binder
                                                   x
                                              in
                                           let g_sort_is =
                                             let uu____3381 =
                                               let uu____3382 =
                                                 let uu____3385 =
                                                   let uu____3386 =
                                                     FStar_All.pipe_right g_b
                                                       FStar_Pervasives_Native.fst
                                                      in
                                                   uu____3386.FStar_Syntax_Syntax.sort
                                                    in
                                                 FStar_Syntax_Subst.compress
                                                   uu____3385
                                                  in
                                               uu____3382.FStar_Syntax_Syntax.n
                                                in
                                             match uu____3381 with
                                             | FStar_Syntax_Syntax.Tm_arrow
                                                 (bs,c) ->
                                                 let uu____3419 =
                                                   FStar_Syntax_Subst.open_comp
                                                     bs c
                                                    in
                                                 (match uu____3419 with
                                                  | (bs1,c1) ->
                                                      let bs_subst =
                                                        let uu____3429 =
                                                          let uu____3436 =
                                                            let uu____3437 =
                                                              FStar_List.hd
                                                                bs1
                                                               in
                                                            FStar_All.pipe_right
                                                              uu____3437
                                                              FStar_Pervasives_Native.fst
                                                             in
                                                          let uu____3458 =
                                                            let uu____3461 =
                                                              FStar_All.pipe_right
                                                                x_a
                                                                FStar_Pervasives_Native.fst
                                                               in
                                                            FStar_All.pipe_right
                                                              uu____3461
                                                              FStar_Syntax_Syntax.bv_to_name
                                                             in
                                                          (uu____3436,
                                                            uu____3458)
                                                           in
                                                        FStar_Syntax_Syntax.NT
                                                          uu____3429
                                                         in
                                                      let c2 =
                                                        FStar_Syntax_Subst.subst_comp
                                                          [bs_subst] c1
                                                         in
                                                      let uu____3475 =
                                                        let uu____3476 =
                                                          FStar_Syntax_Subst.compress
                                                            (FStar_Syntax_Util.comp_result
                                                               c2)
                                                           in
                                                        uu____3476.FStar_Syntax_Syntax.n
                                                         in
                                                      (match uu____3475 with
                                                       | FStar_Syntax_Syntax.Tm_app
                                                           (uu____3481,uu____3482::is)
                                                           ->
                                                           let uu____3524 =
                                                             FStar_All.pipe_right
                                                               is
                                                               (FStar_List.map
                                                                  FStar_Pervasives_Native.fst)
                                                              in
                                                           FStar_All.pipe_right
                                                             uu____3524
                                                             (FStar_List.map
                                                                (FStar_Syntax_Subst.subst
                                                                   subst1))
                                                       | uu____3557 ->
                                                           let uu____3558 =
                                                             bind_t_shape_error
                                                               "g's type is not a repr type"
                                                              in
                                                           FStar_Errors.raise_error
                                                             uu____3558 r1))
                                             | uu____3567 ->
                                                 let uu____3568 =
                                                   bind_t_shape_error
                                                     "g's type is not an arrow"
                                                    in
                                                 FStar_Errors.raise_error
                                                   uu____3568 r1
                                              in
                                           let env_g =
                                             FStar_TypeChecker_Env.push_binders
                                               env [x_a]
                                              in
                                           let uu____3590 =
                                             FStar_List.fold_left2
                                               (fun g  ->
                                                  fun i1  ->
                                                    fun g_i1  ->
                                                      let uu____3598 =
                                                        FStar_TypeChecker_Rel.teq
                                                          env_g i1 g_i1
                                                         in
                                                      FStar_TypeChecker_Env.conj_guard
                                                        g uu____3598)
                                               FStar_TypeChecker_Env.trivial_guard
                                               is2 g_sort_is
                                              in
                                           FStar_All.pipe_right uu____3590
                                             (FStar_TypeChecker_Env.close_guard
                                                env [x_a])
                                            in
                                         let is =
                                           let uu____3614 =
                                             let uu____3615 =
                                               FStar_Syntax_Subst.compress
                                                 bind_ct.FStar_Syntax_Syntax.result_typ
                                                in
                                             uu____3615.FStar_Syntax_Syntax.n
                                              in
                                           match uu____3614 with
                                           | FStar_Syntax_Syntax.Tm_app
                                               (uu____3620,uu____3621::is) ->
                                               let uu____3663 =
                                                 FStar_All.pipe_right is
                                                   (FStar_List.map
                                                      FStar_Pervasives_Native.fst)
                                                  in
                                               FStar_All.pipe_right
                                                 uu____3663
                                                 (FStar_List.map
                                                    (FStar_Syntax_Subst.subst
                                                       subst1))
                                           | uu____3696 ->
                                               let uu____3697 =
                                                 bind_t_shape_error
                                                   "return type is not a repr type"
                                                  in
                                               FStar_Errors.raise_error
                                                 uu____3697 r1
                                            in
                                         let c =
                                           let uu____3707 =
                                             let uu____3708 =
                                               FStar_List.map
                                                 FStar_Syntax_Syntax.as_arg
                                                 is
                                                in
                                             {
                                               FStar_Syntax_Syntax.comp_univs
                                                 =
                                                 (ct2.FStar_Syntax_Syntax.comp_univs);
                                               FStar_Syntax_Syntax.effect_name
                                                 =
                                                 (ed.FStar_Syntax_Syntax.mname);
                                               FStar_Syntax_Syntax.result_typ
                                                 = t2;
                                               FStar_Syntax_Syntax.effect_args
                                                 = uu____3708;
                                               FStar_Syntax_Syntax.flags =
                                                 flags
                                             }  in
                                           FStar_Syntax_Syntax.mk_Comp
                                             uu____3707
                                            in
                                         ((let uu____3728 =
                                             FStar_All.pipe_left
                                               (FStar_TypeChecker_Env.debug
                                                  env)
                                               (FStar_Options.Other
                                                  "LayeredEffects")
                                              in
                                           if uu____3728
                                           then
                                             let uu____3733 =
                                               FStar_Syntax_Print.comp_to_string
                                                 c
                                                in
                                             FStar_Util.print1
                                               "} c after bind: %s\n"
                                               uu____3733
                                           else ());
                                          (let uu____3738 =
                                             FStar_TypeChecker_Env.conj_guards
                                               [g_uvars; f_guard; g_guard]
                                              in
                                           (c, uu____3738))))))))
  
let (mk_non_layered_bind :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.comp_typ ->
        FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
          FStar_Syntax_Syntax.comp_typ ->
            FStar_Syntax_Syntax.cflag Prims.list ->
              FStar_Range.range -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun m  ->
      fun ct1  ->
        fun b  ->
          fun ct2  ->
            fun flags  ->
              fun r1  ->
                let uu____3783 =
                  let md = FStar_TypeChecker_Env.get_effect_decl env m  in
                  let uu____3809 = FStar_TypeChecker_Env.wp_signature env m
                     in
                  match uu____3809 with
                  | (a,kwp) ->
                      let uu____3840 = destruct_wp_comp ct1  in
                      let uu____3847 = destruct_wp_comp ct2  in
                      ((md, a, kwp), uu____3840, uu____3847)
                   in
                match uu____3783 with
                | ((md,a,kwp),(u_t1,t1,wp1),(u_t2,t2,wp2)) ->
                    let bs =
                      match b with
                      | FStar_Pervasives_Native.None  ->
                          let uu____3900 = FStar_Syntax_Syntax.null_binder t1
                             in
                          [uu____3900]
                      | FStar_Pervasives_Native.Some x ->
                          let uu____3920 = FStar_Syntax_Syntax.mk_binder x
                             in
                          [uu____3920]
                       in
                    let mk_lam wp =
                      FStar_Syntax_Util.abs bs wp
                        (FStar_Pervasives_Native.Some
                           (FStar_Syntax_Util.mk_residual_comp
                              FStar_Parser_Const.effect_Tot_lid
                              FStar_Pervasives_Native.None
                              [FStar_Syntax_Syntax.TOTAL]))
                       in
                    let r11 =
                      FStar_Syntax_Syntax.mk
                        (FStar_Syntax_Syntax.Tm_constant
                           (FStar_Const.Const_range r1))
                        FStar_Pervasives_Native.None r1
                       in
                    let wp_args =
                      let uu____3967 = FStar_Syntax_Syntax.as_arg r11  in
                      let uu____3976 =
                        let uu____3987 = FStar_Syntax_Syntax.as_arg t1  in
                        let uu____3996 =
                          let uu____4007 = FStar_Syntax_Syntax.as_arg t2  in
                          let uu____4016 =
                            let uu____4027 = FStar_Syntax_Syntax.as_arg wp1
                               in
                            let uu____4036 =
                              let uu____4047 =
                                let uu____4056 = mk_lam wp2  in
                                FStar_Syntax_Syntax.as_arg uu____4056  in
                              [uu____4047]  in
                            uu____4027 :: uu____4036  in
                          uu____4007 :: uu____4016  in
                        uu____3987 :: uu____3996  in
                      uu____3967 :: uu____3976  in
                    let wp =
                      let uu____4108 =
                        let uu____4113 =
                          FStar_TypeChecker_Env.inst_effect_fun_with
                            [u_t1; u_t2] env md
                            md.FStar_Syntax_Syntax.bind_wp
                           in
                        FStar_Syntax_Syntax.mk_Tm_app uu____4113 wp_args  in
                      uu____4108 FStar_Pervasives_Native.None
                        t2.FStar_Syntax_Syntax.pos
                       in
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
  fun env  ->
    fun c1  ->
      fun b  ->
        fun c2  ->
          fun flags  ->
            fun r1  ->
              let uu____4161 = lift_comps env c1 c2 b true  in
              match uu____4161 with
              | (m,c11,c21,g_lift) ->
                  let uu____4179 =
                    let uu____4184 = FStar_Syntax_Util.comp_to_comp_typ c11
                       in
                    let uu____4185 = FStar_Syntax_Util.comp_to_comp_typ c21
                       in
                    (uu____4184, uu____4185)  in
                  (match uu____4179 with
                   | (ct1,ct2) ->
                       let uu____4192 =
                         let uu____4197 =
                           FStar_TypeChecker_Env.is_layered_effect env m  in
                         if uu____4197
                         then mk_layered_bind env m ct1 b ct2 flags r1
                         else
                           (let uu____4206 =
                              mk_non_layered_bind env m ct1 b ct2 flags r1
                               in
                            (uu____4206, FStar_TypeChecker_Env.trivial_guard))
                          in
                       (match uu____4192 with
                        | (c,g_bind) ->
                            let uu____4213 =
                              FStar_TypeChecker_Env.conj_guard g_lift g_bind
                               in
                            (c, uu____4213)))
  
let (bind_pure_wp_with :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.cflag Prims.list ->
          (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun wp1  ->
      fun c  ->
        fun flags  ->
          let r = FStar_TypeChecker_Env.get_range env  in
          let pure_c =
            let uu____4249 =
              let uu____4250 =
                let uu____4261 =
                  FStar_All.pipe_right wp1 FStar_Syntax_Syntax.as_arg  in
                [uu____4261]  in
              {
                FStar_Syntax_Syntax.comp_univs = [FStar_Syntax_Syntax.U_zero];
                FStar_Syntax_Syntax.effect_name =
                  FStar_Parser_Const.effect_PURE_lid;
                FStar_Syntax_Syntax.result_typ = FStar_Syntax_Syntax.t_unit;
                FStar_Syntax_Syntax.effect_args = uu____4250;
                FStar_Syntax_Syntax.flags = []
              }  in
            FStar_Syntax_Syntax.mk_Comp uu____4249  in
          mk_bind env pure_c FStar_Pervasives_Native.None c flags r
  
let (weaken_flags :
  FStar_Syntax_Syntax.cflag Prims.list ->
    FStar_Syntax_Syntax.cflag Prims.list)
  =
  fun flags  ->
    let uu____4306 =
      FStar_All.pipe_right flags
        (FStar_Util.for_some
           (fun uu___1_4312  ->
              match uu___1_4312 with
              | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  -> true
              | uu____4315 -> false))
       in
    if uu____4306
    then [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
    else
      FStar_All.pipe_right flags
        (FStar_List.collect
           (fun uu___2_4327  ->
              match uu___2_4327 with
              | FStar_Syntax_Syntax.TOTAL  ->
                  [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
              | FStar_Syntax_Syntax.RETURN  ->
                  [FStar_Syntax_Syntax.PARTIAL_RETURN;
                  FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
              | f -> [f]))
  
let (weaken_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.term ->
        (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun c  ->
      fun formula  ->
        let uu____4355 = FStar_Syntax_Util.is_ml_comp c  in
        if uu____4355
        then (c, FStar_TypeChecker_Env.trivial_guard)
        else
          (let ct = FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
           let pure_assume_wp =
             let uu____4366 =
               FStar_Syntax_Syntax.lid_as_fv
                 FStar_Parser_Const.pure_assume_wp_lid
                 (FStar_Syntax_Syntax.Delta_constant_at_level Prims.int_one)
                 FStar_Pervasives_Native.None
                in
             FStar_Syntax_Syntax.fv_to_tm uu____4366  in
           let pure_assume_wp1 =
             let uu____4371 = FStar_TypeChecker_Env.get_range env  in
             let uu____4372 =
               let uu____4377 =
                 let uu____4378 =
                   FStar_All.pipe_left FStar_Syntax_Syntax.as_arg formula  in
                 [uu____4378]  in
               FStar_Syntax_Syntax.mk_Tm_app pure_assume_wp uu____4377  in
             uu____4372 FStar_Pervasives_Native.None uu____4371  in
           let uu____4411 = weaken_flags ct.FStar_Syntax_Syntax.flags  in
           bind_pure_wp_with env pure_assume_wp1 c uu____4411)
  
let (weaken_precondition :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.lcomp ->
      FStar_TypeChecker_Common.guard_formula ->
        FStar_TypeChecker_Common.lcomp)
  =
  fun env  ->
    fun lc  ->
      fun f  ->
        let weaken uu____4439 =
          let uu____4440 = FStar_TypeChecker_Common.lcomp_comp lc  in
          match uu____4440 with
          | (c,g_c) ->
              let uu____4451 =
                env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ())
                 in
              if uu____4451
              then (c, g_c)
              else
                (match f with
                 | FStar_TypeChecker_Common.Trivial  -> (c, g_c)
                 | FStar_TypeChecker_Common.NonTrivial f1 ->
                     let uu____4465 = weaken_comp env c f1  in
                     (match uu____4465 with
                      | (c1,g_w) ->
                          let uu____4476 =
                            FStar_TypeChecker_Env.conj_guard g_c g_w  in
                          (c1, uu____4476)))
           in
        let uu____4477 = weaken_flags lc.FStar_TypeChecker_Common.cflags  in
        FStar_TypeChecker_Common.mk_lcomp
          lc.FStar_TypeChecker_Common.eff_name
          lc.FStar_TypeChecker_Common.res_typ uu____4477 weaken
  
let (strengthen_comp :
  FStar_TypeChecker_Env.env ->
    (unit -> Prims.string) FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.formula ->
          FStar_Syntax_Syntax.cflag Prims.list ->
            (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun reason  ->
      fun c  ->
        fun f  ->
          fun flags  ->
            if env.FStar_TypeChecker_Env.lax
            then (c, FStar_TypeChecker_Env.trivial_guard)
            else
              (let r = FStar_TypeChecker_Env.get_range env  in
               let pure_assert_wp =
                 let uu____4534 =
                   FStar_Syntax_Syntax.lid_as_fv
                     FStar_Parser_Const.pure_assert_wp_lid
                     (FStar_Syntax_Syntax.Delta_constant_at_level
                        Prims.int_one) FStar_Pervasives_Native.None
                    in
                 FStar_Syntax_Syntax.fv_to_tm uu____4534  in
               let pure_assert_wp1 =
                 let uu____4539 =
                   let uu____4544 =
                     let uu____4545 =
                       let uu____4554 = label_opt env reason r f  in
                       FStar_All.pipe_left FStar_Syntax_Syntax.as_arg
                         uu____4554
                        in
                     [uu____4545]  in
                   FStar_Syntax_Syntax.mk_Tm_app pure_assert_wp uu____4544
                    in
                 uu____4539 FStar_Pervasives_Native.None r  in
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
  fun reason  ->
    fun env  ->
      fun e_for_debugging_only  ->
        fun lc  ->
          fun g0  ->
            let uu____4624 =
              FStar_TypeChecker_Env.is_trivial_guard_formula g0  in
            if uu____4624
            then (lc, g0)
            else
              (let flags =
                 let uu____4636 =
                   let uu____4644 =
                     FStar_TypeChecker_Common.is_tot_or_gtot_lcomp lc  in
                   if uu____4644
                   then (true, [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION])
                   else (false, [])  in
                 match uu____4636 with
                 | (maybe_trivial_post,flags) ->
                     let uu____4674 =
                       FStar_All.pipe_right
                         lc.FStar_TypeChecker_Common.cflags
                         (FStar_List.collect
                            (fun uu___3_4682  ->
                               match uu___3_4682 with
                               | FStar_Syntax_Syntax.RETURN  ->
                                   [FStar_Syntax_Syntax.PARTIAL_RETURN]
                               | FStar_Syntax_Syntax.PARTIAL_RETURN  ->
                                   [FStar_Syntax_Syntax.PARTIAL_RETURN]
                               | FStar_Syntax_Syntax.SOMETRIVIAL  when
                                   Prims.op_Negation maybe_trivial_post ->
                                   [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
                               | FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION 
                                   when Prims.op_Negation maybe_trivial_post
                                   ->
                                   [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
                               | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  ->
                                   [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
                               | uu____4685 -> []))
                        in
                     FStar_List.append flags uu____4674
                  in
               let strengthen uu____4695 =
                 let uu____4696 = FStar_TypeChecker_Common.lcomp_comp lc  in
                 match uu____4696 with
                 | (c,g_c) ->
                     if env.FStar_TypeChecker_Env.lax
                     then (c, g_c)
                     else
                       (let g01 = FStar_TypeChecker_Rel.simplify_guard env g0
                           in
                        let uu____4715 = FStar_TypeChecker_Env.guard_form g01
                           in
                        match uu____4715 with
                        | FStar_TypeChecker_Common.Trivial  -> (c, g_c)
                        | FStar_TypeChecker_Common.NonTrivial f ->
                            ((let uu____4722 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  FStar_Options.Extreme
                                 in
                              if uu____4722
                              then
                                let uu____4726 =
                                  FStar_TypeChecker_Normalize.term_to_string
                                    env e_for_debugging_only
                                   in
                                let uu____4728 =
                                  FStar_TypeChecker_Normalize.term_to_string
                                    env f
                                   in
                                FStar_Util.print2
                                  "-------------Strengthening pre-condition of term %s with guard %s\n"
                                  uu____4726 uu____4728
                              else ());
                             (let uu____4733 =
                                strengthen_comp env reason c f flags  in
                              match uu____4733 with
                              | (c1,g_s) ->
                                  let uu____4744 =
                                    FStar_TypeChecker_Env.conj_guard g_c g_s
                                     in
                                  (c1, uu____4744))))
                  in
               let uu____4745 =
                 let uu____4746 =
                   FStar_TypeChecker_Env.norm_eff_name env
                     lc.FStar_TypeChecker_Common.eff_name
                    in
                 FStar_TypeChecker_Common.mk_lcomp uu____4746
                   lc.FStar_TypeChecker_Common.res_typ flags strengthen
                  in
               (uu____4745,
                 (let uu___580_4748 = g0  in
                  {
                    FStar_TypeChecker_Common.guard_f =
                      FStar_TypeChecker_Common.Trivial;
                    FStar_TypeChecker_Common.deferred =
                      (uu___580_4748.FStar_TypeChecker_Common.deferred);
                    FStar_TypeChecker_Common.univ_ineqs =
                      (uu___580_4748.FStar_TypeChecker_Common.univ_ineqs);
                    FStar_TypeChecker_Common.implicits =
                      (uu___580_4748.FStar_TypeChecker_Common.implicits)
                  })))
  
let (lcomp_has_trivial_postcondition :
  FStar_TypeChecker_Common.lcomp -> Prims.bool) =
  fun lc  ->
    (FStar_TypeChecker_Common.is_tot_or_gtot_lcomp lc) ||
      (FStar_Util.for_some
         (fun uu___4_4757  ->
            match uu___4_4757 with
            | FStar_Syntax_Syntax.SOMETRIVIAL  -> true
            | FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION  -> true
            | uu____4761 -> false) lc.FStar_TypeChecker_Common.cflags)
  
let (maybe_add_with_type :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option ->
      FStar_TypeChecker_Common.lcomp ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun env  ->
    fun uopt  ->
      fun lc  ->
        fun e  ->
          let uu____4790 =
            (FStar_TypeChecker_Common.is_lcomp_partial_return lc) ||
              env.FStar_TypeChecker_Env.lax
             in
          if uu____4790
          then e
          else
            (let uu____4797 =
               (lcomp_has_trivial_postcondition lc) &&
                 (let uu____4800 =
                    FStar_TypeChecker_Env.try_lookup_lid env
                      FStar_Parser_Const.with_type_lid
                     in
                  FStar_Option.isSome uu____4800)
                in
             if uu____4797
             then
               let u =
                 match uopt with
                 | FStar_Pervasives_Native.Some u -> u
                 | FStar_Pervasives_Native.None  ->
                     env.FStar_TypeChecker_Env.universe_of env
                       lc.FStar_TypeChecker_Common.res_typ
                  in
               FStar_Syntax_Util.mk_with_type u
                 lc.FStar_TypeChecker_Common.res_typ e
             else e)
  
let (bind :
  FStar_Range.range ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
        FStar_TypeChecker_Common.lcomp ->
          lcomp_with_binder -> FStar_TypeChecker_Common.lcomp)
  =
  fun r1  ->
    fun env  ->
      fun e1opt  ->
        fun lc1  ->
          fun uu____4853  ->
            match uu____4853 with
            | (b,lc2) ->
                let debug1 f =
                  let uu____4873 =
                    (FStar_TypeChecker_Env.debug env FStar_Options.Extreme)
                      ||
                      (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "bind"))
                     in
                  if uu____4873 then f () else ()  in
                let lc11 =
                  FStar_TypeChecker_Normalize.ghost_to_pure_lcomp env lc1  in
                let lc21 =
                  FStar_TypeChecker_Normalize.ghost_to_pure_lcomp env lc2  in
                let joined_eff = join_lcomp env lc11 lc21  in
                let bind_flags =
                  let uu____4886 =
                    (should_not_inline_lc lc11) ||
                      (should_not_inline_lc lc21)
                     in
                  if uu____4886
                  then [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
                  else
                    (let flags =
                       let uu____4896 =
                         FStar_TypeChecker_Common.is_total_lcomp lc11  in
                       if uu____4896
                       then
                         let uu____4901 =
                           FStar_TypeChecker_Common.is_total_lcomp lc21  in
                         (if uu____4901
                          then [FStar_Syntax_Syntax.TOTAL]
                          else
                            (let uu____4908 =
                               FStar_TypeChecker_Common.is_tot_or_gtot_lcomp
                                 lc21
                                in
                             if uu____4908
                             then [FStar_Syntax_Syntax.SOMETRIVIAL]
                             else []))
                       else
                         (let uu____4917 =
                            (FStar_TypeChecker_Common.is_tot_or_gtot_lcomp
                               lc11)
                              &&
                              (FStar_TypeChecker_Common.is_tot_or_gtot_lcomp
                                 lc21)
                             in
                          if uu____4917
                          then [FStar_Syntax_Syntax.SOMETRIVIAL]
                          else [])
                        in
                     let uu____4924 = lcomp_has_trivial_postcondition lc21
                        in
                     if uu____4924
                     then FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION :: flags
                     else flags)
                   in
                let bind_it uu____4940 =
                  let uu____4941 =
                    env.FStar_TypeChecker_Env.lax &&
                      (FStar_Options.ml_ish ())
                     in
                  if uu____4941
                  then
                    let u_t =
                      env.FStar_TypeChecker_Env.universe_of env
                        lc21.FStar_TypeChecker_Common.res_typ
                       in
                    let uu____4949 =
                      lax_mk_tot_or_comp_l joined_eff u_t
                        lc21.FStar_TypeChecker_Common.res_typ []
                       in
                    (uu____4949, FStar_TypeChecker_Env.trivial_guard)
                  else
                    (let uu____4952 =
                       FStar_TypeChecker_Common.lcomp_comp lc11  in
                     match uu____4952 with
                     | (c1,g_c1) ->
                         let uu____4963 =
                           FStar_TypeChecker_Common.lcomp_comp lc21  in
                         (match uu____4963 with
                          | (c2,g_c2) ->
                              (debug1
                                 (fun uu____4983  ->
                                    let uu____4984 =
                                      FStar_Syntax_Print.comp_to_string c1
                                       in
                                    let uu____4986 =
                                      match b with
                                      | FStar_Pervasives_Native.None  ->
                                          "none"
                                      | FStar_Pervasives_Native.Some x ->
                                          FStar_Syntax_Print.bv_to_string x
                                       in
                                    let uu____4991 =
                                      FStar_Syntax_Print.comp_to_string c2
                                       in
                                    FStar_Util.print3
                                      "(1) bind: \n\tc1=%s\n\tx=%s\n\tc2=%s\n(1. end bind)\n"
                                      uu____4984 uu____4986 uu____4991);
                               (let aux uu____5009 =
                                  let uu____5010 =
                                    FStar_Syntax_Util.is_trivial_wp c1  in
                                  if uu____5010
                                  then
                                    match b with
                                    | FStar_Pervasives_Native.None  ->
                                        FStar_Util.Inl
                                          (c2, "trivial no binder")
                                    | FStar_Pervasives_Native.Some uu____5041
                                        ->
                                        let uu____5042 =
                                          FStar_Syntax_Util.is_ml_comp c2  in
                                        (if uu____5042
                                         then
                                           FStar_Util.Inl (c2, "trivial ml")
                                         else
                                           FStar_Util.Inr
                                             "c1 trivial; but c2 is not ML")
                                  else
                                    (let uu____5074 =
                                       (FStar_Syntax_Util.is_ml_comp c1) &&
                                         (FStar_Syntax_Util.is_ml_comp c2)
                                        in
                                     if uu____5074
                                     then FStar_Util.Inl (c2, "both ml")
                                     else
                                       FStar_Util.Inr
                                         "c1 not trivial, and both are not ML")
                                   in
                                let try_simplify uu____5119 =
                                  let uu____5120 =
                                    let uu____5122 =
                                      FStar_TypeChecker_Env.try_lookup_effect_lid
                                        env
                                        FStar_Parser_Const.effect_GTot_lid
                                       in
                                    FStar_Option.isNone uu____5122  in
                                  if uu____5120
                                  then
                                    let uu____5136 =
                                      (FStar_Syntax_Util.is_tot_or_gtot_comp
                                         c1)
                                        &&
                                        (FStar_Syntax_Util.is_tot_or_gtot_comp
                                           c2)
                                       in
                                    (if uu____5136
                                     then
                                       FStar_Util.Inl
                                         (c2,
                                           "Early in prims; we don't have bind yet")
                                     else
                                       (let uu____5159 =
                                          FStar_TypeChecker_Env.get_range env
                                           in
                                        FStar_Errors.raise_error
                                          (FStar_Errors.Fatal_NonTrivialPreConditionInPrims,
                                            "Non-trivial pre-conditions very early in prims, even before we have defined the PURE monad")
                                          uu____5159))
                                  else
                                    (let uu____5174 =
                                       FStar_Syntax_Util.is_total_comp c1  in
                                     if uu____5174
                                     then
                                       let close1 x reason c =
                                         let uu____5215 =
                                           let uu____5217 =
                                             let uu____5218 =
                                               FStar_All.pipe_right c
                                                 FStar_Syntax_Util.comp_effect_name
                                                in
                                             FStar_All.pipe_right uu____5218
                                               (FStar_TypeChecker_Env.norm_eff_name
                                                  env)
                                              in
                                           FStar_All.pipe_right uu____5217
                                             (FStar_TypeChecker_Env.is_layered_effect
                                                env)
                                            in
                                         if uu____5215
                                         then FStar_Util.Inl (c, reason)
                                         else
                                           (let x1 =
                                              let uu___651_5243 = x  in
                                              {
                                                FStar_Syntax_Syntax.ppname =
                                                  (uu___651_5243.FStar_Syntax_Syntax.ppname);
                                                FStar_Syntax_Syntax.index =
                                                  (uu___651_5243.FStar_Syntax_Syntax.index);
                                                FStar_Syntax_Syntax.sort =
                                                  (FStar_Syntax_Util.comp_result
                                                     c1)
                                              }  in
                                            let uu____5244 =
                                              let uu____5250 =
                                                close_wp_comp_if_refinement_t
                                                  env
                                                  x1.FStar_Syntax_Syntax.sort
                                                  x1 c
                                                 in
                                              (uu____5250, reason)  in
                                            FStar_Util.Inl uu____5244)
                                          in
                                       match (e1opt, b) with
                                       | (FStar_Pervasives_Native.Some
                                          e,FStar_Pervasives_Native.Some x)
                                           ->
                                           let uu____5286 =
                                             FStar_All.pipe_right c2
                                               (FStar_Syntax_Subst.subst_comp
                                                  [FStar_Syntax_Syntax.NT
                                                     (x, e)])
                                              in
                                           FStar_All.pipe_right uu____5286
                                             (close1 x "c1 Tot")
                                       | (uu____5300,FStar_Pervasives_Native.Some
                                          x) ->
                                           FStar_All.pipe_right c2
                                             (close1 x "c1 Tot only close")
                                       | (uu____5323,uu____5324) -> aux ()
                                     else
                                       (let uu____5339 =
                                          (FStar_Syntax_Util.is_tot_or_gtot_comp
                                             c1)
                                            &&
                                            (FStar_Syntax_Util.is_tot_or_gtot_comp
                                               c2)
                                           in
                                        if uu____5339
                                        then
                                          let uu____5352 =
                                            let uu____5358 =
                                              FStar_Syntax_Syntax.mk_GTotal
                                                (FStar_Syntax_Util.comp_result
                                                   c2)
                                               in
                                            (uu____5358, "both GTot")  in
                                          FStar_Util.Inl uu____5352
                                        else aux ()))
                                   in
                                let uu____5369 = try_simplify ()  in
                                match uu____5369 with
                                | FStar_Util.Inl (c,reason) ->
                                    (debug1
                                       (fun uu____5399  ->
                                          let uu____5400 =
                                            FStar_Syntax_Print.comp_to_string
                                              c
                                             in
                                          FStar_Util.print2
                                            "(2) bind: Simplified (because %s) to\n\t%s\n"
                                            reason uu____5400);
                                     (let uu____5403 =
                                        FStar_TypeChecker_Env.conj_guard g_c1
                                          g_c2
                                         in
                                      (c, uu____5403)))
                                | FStar_Util.Inr reason ->
                                    (debug1
                                       (fun uu____5415  ->
                                          FStar_Util.print1
                                            "(2) bind: Not simplified because %s\n"
                                            reason);
                                     (let mk_bind1 c11 b1 c21 =
                                        let uu____5441 =
                                          mk_bind env c11 b1 c21 bind_flags
                                            r1
                                           in
                                        match uu____5441 with
                                        | (c,g_bind) ->
                                            let uu____5452 =
                                              let uu____5453 =
                                                FStar_TypeChecker_Env.conj_guard
                                                  g_c1 g_c2
                                                 in
                                              FStar_TypeChecker_Env.conj_guard
                                                uu____5453 g_bind
                                               in
                                            (c, uu____5452)
                                         in
                                      let mk_seq c11 b1 c21 =
                                        let c12 =
                                          FStar_TypeChecker_Env.unfold_effect_abbrev
                                            env c11
                                           in
                                        let c22 =
                                          FStar_TypeChecker_Env.unfold_effect_abbrev
                                            env c21
                                           in
                                        let uu____5480 =
                                          FStar_TypeChecker_Env.join env
                                            c12.FStar_Syntax_Syntax.effect_name
                                            c22.FStar_Syntax_Syntax.effect_name
                                           in
                                        match uu____5480 with
                                        | (m,uu____5492,lift2) ->
                                            let uu____5494 =
                                              lift_comp env c22 lift2  in
                                            (match uu____5494 with
                                             | (c23,g2) ->
                                                 let uu____5505 =
                                                   destruct_wp_comp c12  in
                                                 (match uu____5505 with
                                                  | (u1,t1,wp1) ->
                                                      let md_pure_or_ghost =
                                                        FStar_TypeChecker_Env.get_effect_decl
                                                          env
                                                          c12.FStar_Syntax_Syntax.effect_name
                                                         in
                                                      let vc1 =
                                                        let uu____5523 =
                                                          let uu____5528 =
                                                            let uu____5529 =
                                                              FStar_All.pipe_right
                                                                md_pure_or_ghost.FStar_Syntax_Syntax.trivial
                                                                FStar_Util.must
                                                               in
                                                            FStar_TypeChecker_Env.inst_effect_fun_with
                                                              [u1] env
                                                              md_pure_or_ghost
                                                              uu____5529
                                                             in
                                                          let uu____5532 =
                                                            let uu____5533 =
                                                              FStar_Syntax_Syntax.as_arg
                                                                t1
                                                               in
                                                            let uu____5542 =
                                                              let uu____5553
                                                                =
                                                                FStar_Syntax_Syntax.as_arg
                                                                  wp1
                                                                 in
                                                              [uu____5553]
                                                               in
                                                            uu____5533 ::
                                                              uu____5542
                                                             in
                                                          FStar_Syntax_Syntax.mk_Tm_app
                                                            uu____5528
                                                            uu____5532
                                                           in
                                                        uu____5523
                                                          FStar_Pervasives_Native.None
                                                          r1
                                                         in
                                                      let uu____5586 =
                                                        strengthen_comp env
                                                          FStar_Pervasives_Native.None
                                                          c23 vc1 bind_flags
                                                         in
                                                      (match uu____5586 with
                                                       | (c,g_s) ->
                                                           let uu____5601 =
                                                             FStar_TypeChecker_Env.conj_guards
                                                               [g_c1;
                                                               g_c2;
                                                               g2;
                                                               g_s]
                                                              in
                                                           (c, uu____5601))))
                                         in
                                      let uu____5602 =
                                        let t =
                                          FStar_Syntax_Util.comp_result c1
                                           in
                                        match comp_univ_opt c1 with
                                        | FStar_Pervasives_Native.None  ->
                                            let uu____5618 =
                                              env.FStar_TypeChecker_Env.universe_of
                                                env t
                                               in
                                            (uu____5618, t)
                                        | FStar_Pervasives_Native.Some u ->
                                            (u, t)
                                         in
                                      match uu____5602 with
                                      | (u_res_t1,res_t1) ->
                                          let uu____5634 =
                                            (FStar_Option.isSome b) &&
                                              (should_return env e1opt lc11)
                                             in
                                          if uu____5634
                                          then
                                            let e1 = FStar_Option.get e1opt
                                               in
                                            let x = FStar_Option.get b  in
                                            let uu____5643 =
                                              FStar_Syntax_Util.is_partial_return
                                                c1
                                               in
                                            (if uu____5643
                                             then
                                               (debug1
                                                  (fun uu____5657  ->
                                                     let uu____5658 =
                                                       FStar_TypeChecker_Normalize.term_to_string
                                                         env e1
                                                        in
                                                     let uu____5660 =
                                                       FStar_Syntax_Print.bv_to_string
                                                         x
                                                        in
                                                     FStar_Util.print2
                                                       "(3) bind (case a): Substituting %s for %s"
                                                       uu____5658 uu____5660);
                                                (let c21 =
                                                   FStar_Syntax_Subst.subst_comp
                                                     [FStar_Syntax_Syntax.NT
                                                        (x, e1)] c2
                                                    in
                                                 mk_bind1 c1 b c21))
                                             else
                                               (let uu____5668 =
                                                  ((FStar_Options.vcgen_optimize_bind_as_seq
                                                      ())
                                                     &&
                                                     (lcomp_has_trivial_postcondition
                                                        lc11))
                                                    &&
                                                    (let uu____5671 =
                                                       FStar_TypeChecker_Env.try_lookup_lid
                                                         env
                                                         FStar_Parser_Const.with_type_lid
                                                        in
                                                     FStar_Option.isSome
                                                       uu____5671)
                                                   in
                                                if uu____5668
                                                then
                                                  let e1' =
                                                    let uu____5696 =
                                                      FStar_Options.vcgen_decorate_with_type
                                                        ()
                                                       in
                                                    if uu____5696
                                                    then
                                                      FStar_Syntax_Util.mk_with_type
                                                        u_res_t1 res_t1 e1
                                                    else e1  in
                                                  (debug1
                                                     (fun uu____5708  ->
                                                        let uu____5709 =
                                                          FStar_TypeChecker_Normalize.term_to_string
                                                            env e1'
                                                           in
                                                        let uu____5711 =
                                                          FStar_Syntax_Print.bv_to_string
                                                            x
                                                           in
                                                        FStar_Util.print2
                                                          "(3) bind (case b): Substituting %s for %s"
                                                          uu____5709
                                                          uu____5711);
                                                   (let c21 =
                                                      FStar_Syntax_Subst.subst_comp
                                                        [FStar_Syntax_Syntax.NT
                                                           (x, e1')] c2
                                                       in
                                                    mk_seq c1 b c21))
                                                else
                                                  (debug1
                                                     (fun uu____5726  ->
                                                        let uu____5727 =
                                                          FStar_TypeChecker_Normalize.term_to_string
                                                            env e1
                                                           in
                                                        let uu____5729 =
                                                          FStar_Syntax_Print.bv_to_string
                                                            x
                                                           in
                                                        FStar_Util.print2
                                                          "(3) bind (case c): Adding equality %s = %s"
                                                          uu____5727
                                                          uu____5729);
                                                   (let c21 =
                                                      FStar_Syntax_Subst.subst_comp
                                                        [FStar_Syntax_Syntax.NT
                                                           (x, e1)] c2
                                                       in
                                                    let x_eq_e =
                                                      let uu____5736 =
                                                        FStar_Syntax_Syntax.bv_to_name
                                                          x
                                                         in
                                                      FStar_Syntax_Util.mk_eq2
                                                        u_res_t1 res_t1 e1
                                                        uu____5736
                                                       in
                                                    let uu____5737 =
                                                      let uu____5742 =
                                                        let uu____5743 =
                                                          let uu____5744 =
                                                            FStar_Syntax_Syntax.mk_binder
                                                              x
                                                             in
                                                          [uu____5744]  in
                                                        FStar_TypeChecker_Env.push_binders
                                                          env uu____5743
                                                         in
                                                      weaken_comp uu____5742
                                                        c21 x_eq_e
                                                       in
                                                    match uu____5737 with
                                                    | (c22,g_w) ->
                                                        let uu____5769 =
                                                          mk_bind1 c1 b c22
                                                           in
                                                        (match uu____5769
                                                         with
                                                         | (c,g_bind) ->
                                                             let uu____5780 =
                                                               FStar_TypeChecker_Env.conj_guard
                                                                 g_w g_bind
                                                                in
                                                             (c, uu____5780))))))
                                          else mk_bind1 c1 b c2))))))
                   in
                FStar_TypeChecker_Common.mk_lcomp joined_eff
                  lc21.FStar_TypeChecker_Common.res_typ bind_flags bind_it
  
let (weaken_guard :
  FStar_TypeChecker_Common.guard_formula ->
    FStar_TypeChecker_Common.guard_formula ->
      FStar_TypeChecker_Common.guard_formula)
  =
  fun g1  ->
    fun g2  ->
      match (g1, g2) with
      | (FStar_TypeChecker_Common.NonTrivial
         f1,FStar_TypeChecker_Common.NonTrivial f2) ->
          let g = FStar_Syntax_Util.mk_imp f1 f2  in
          FStar_TypeChecker_Common.NonTrivial g
      | uu____5797 -> g2
  
let (maybe_assume_result_eq_pure_term :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp -> FStar_TypeChecker_Common.lcomp)
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        let should_return1 =
          (((Prims.op_Negation env.FStar_TypeChecker_Env.lax) &&
              (FStar_TypeChecker_Env.lid_exists env
                 FStar_Parser_Const.effect_GTot_lid))
             && (should_return env (FStar_Pervasives_Native.Some e) lc))
            &&
            (let uu____5821 =
               FStar_TypeChecker_Common.is_lcomp_partial_return lc  in
             Prims.op_Negation uu____5821)
           in
        let flags =
          if should_return1
          then
            let uu____5829 = FStar_TypeChecker_Common.is_total_lcomp lc  in
            (if uu____5829
             then FStar_Syntax_Syntax.RETURN ::
               (lc.FStar_TypeChecker_Common.cflags)
             else FStar_Syntax_Syntax.PARTIAL_RETURN ::
               (lc.FStar_TypeChecker_Common.cflags))
          else lc.FStar_TypeChecker_Common.cflags  in
        let refine1 uu____5847 =
          let uu____5848 = FStar_TypeChecker_Common.lcomp_comp lc  in
          match uu____5848 with
          | (c,g_c) ->
              let u_t =
                match comp_univ_opt c with
                | FStar_Pervasives_Native.Some u_t -> u_t
                | FStar_Pervasives_Native.None  ->
                    env.FStar_TypeChecker_Env.universe_of env
                      (FStar_Syntax_Util.comp_result c)
                 in
              let uu____5861 = FStar_Syntax_Util.is_tot_or_gtot_comp c  in
              if uu____5861
              then
                let retc =
                  return_value env (FStar_Pervasives_Native.Some u_t)
                    (FStar_Syntax_Util.comp_result c) e
                   in
                let uu____5869 =
                  let uu____5871 = FStar_Syntax_Util.is_pure_comp c  in
                  Prims.op_Negation uu____5871  in
                (if uu____5869
                 then
                   let retc1 = FStar_Syntax_Util.comp_to_comp_typ retc  in
                   let retc2 =
                     let uu___765_5880 = retc1  in
                     {
                       FStar_Syntax_Syntax.comp_univs =
                         (uu___765_5880.FStar_Syntax_Syntax.comp_univs);
                       FStar_Syntax_Syntax.effect_name =
                         FStar_Parser_Const.effect_GHOST_lid;
                       FStar_Syntax_Syntax.result_typ =
                         (uu___765_5880.FStar_Syntax_Syntax.result_typ);
                       FStar_Syntax_Syntax.effect_args =
                         (uu___765_5880.FStar_Syntax_Syntax.effect_args);
                       FStar_Syntax_Syntax.flags = flags
                     }  in
                   let uu____5881 = FStar_Syntax_Syntax.mk_Comp retc2  in
                   (uu____5881, g_c)
                 else
                   (let uu____5884 =
                      FStar_Syntax_Util.comp_set_flags retc flags  in
                    (uu____5884, g_c)))
              else
                (let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c
                    in
                 let t = c1.FStar_Syntax_Syntax.result_typ  in
                 let c2 = FStar_Syntax_Syntax.mk_Comp c1  in
                 let x =
                   FStar_Syntax_Syntax.new_bv
                     (FStar_Pervasives_Native.Some
                        (t.FStar_Syntax_Syntax.pos)) t
                    in
                 let xexp = FStar_Syntax_Syntax.bv_to_name x  in
                 let ret1 =
                   let uu____5895 =
                     let uu____5896 =
                       return_value env (FStar_Pervasives_Native.Some u_t) t
                         xexp
                        in
                     FStar_Syntax_Util.comp_set_flags uu____5896
                       [FStar_Syntax_Syntax.PARTIAL_RETURN]
                      in
                   FStar_All.pipe_left FStar_TypeChecker_Common.lcomp_of_comp
                     uu____5895
                    in
                 let eq1 = FStar_Syntax_Util.mk_eq2 u_t t xexp e  in
                 let eq_ret =
                   weaken_precondition env ret1
                     (FStar_TypeChecker_Common.NonTrivial eq1)
                    in
                 let uu____5899 =
                   let uu____5904 =
                     let uu____5905 =
                       FStar_TypeChecker_Common.lcomp_of_comp c2  in
                     bind e.FStar_Syntax_Syntax.pos env
                       FStar_Pervasives_Native.None uu____5905
                       ((FStar_Pervasives_Native.Some x), eq_ret)
                      in
                   FStar_TypeChecker_Common.lcomp_comp uu____5904  in
                 match uu____5899 with
                 | (bind_c,g_bind) ->
                     let uu____5914 =
                       FStar_Syntax_Util.comp_set_flags bind_c flags  in
                     let uu____5915 =
                       FStar_TypeChecker_Env.conj_guard g_c g_bind  in
                     (uu____5914, uu____5915))
           in
        if Prims.op_Negation should_return1
        then lc
        else
          FStar_TypeChecker_Common.mk_lcomp
            lc.FStar_TypeChecker_Common.eff_name
            lc.FStar_TypeChecker_Common.res_typ flags refine1
  
let (maybe_return_e2_and_bind :
  FStar_Range.range ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
        FStar_TypeChecker_Common.lcomp ->
          FStar_Syntax_Syntax.term ->
            lcomp_with_binder -> FStar_TypeChecker_Common.lcomp)
  =
  fun r  ->
    fun env  ->
      fun e1opt  ->
        fun lc1  ->
          fun e2  ->
            fun uu____5951  ->
              match uu____5951 with
              | (x,lc2) ->
                  let lc21 =
                    let eff1 =
                      FStar_TypeChecker_Env.norm_eff_name env
                        lc1.FStar_TypeChecker_Common.eff_name
                       in
                    let eff2 =
                      FStar_TypeChecker_Env.norm_eff_name env
                        lc2.FStar_TypeChecker_Common.eff_name
                       in
                    let uu____5963 =
                      ((let uu____5967 = is_pure_or_ghost_effect env eff1  in
                        Prims.op_Negation uu____5967) ||
                         (should_not_inline_lc lc1))
                        && (is_pure_or_ghost_effect env eff2)
                       in
                    if uu____5963
                    then maybe_assume_result_eq_pure_term env e2 lc2
                    else lc2  in
                  bind r env e1opt lc1 (x, lc21)
  
let (fvar_const :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun lid  ->
      let uu____5985 =
        let uu____5986 = FStar_TypeChecker_Env.get_range env  in
        FStar_Ident.set_lid_range lid uu____5986  in
      FStar_Syntax_Syntax.fvar uu____5985 FStar_Syntax_Syntax.delta_constant
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
  fun env  ->
    fun ed  ->
      fun u_a  ->
        fun a  ->
          fun p  ->
            fun ct1  ->
              fun ct2  ->
                fun r  ->
                  let uu____6036 =
                    let uu____6041 =
                      let uu____6042 =
                        FStar_All.pipe_right ed.FStar_Syntax_Syntax.match_wps
                          FStar_Util.right
                         in
                      uu____6042.FStar_Syntax_Syntax.conjunction  in
                    FStar_TypeChecker_Env.inst_tscheme_with uu____6041 [u_a]
                     in
                  match uu____6036 with
                  | (uu____6051,conjunction) ->
                      let uu____6053 =
                        let uu____6062 =
                          FStar_List.map FStar_Pervasives_Native.fst
                            ct1.FStar_Syntax_Syntax.effect_args
                           in
                        let uu____6077 =
                          FStar_List.map FStar_Pervasives_Native.fst
                            ct2.FStar_Syntax_Syntax.effect_args
                           in
                        (uu____6062, uu____6077)  in
                      (match uu____6053 with
                       | (is1,is2) ->
                           let conjunction_t_error s =
                             let uu____6123 =
                               let uu____6125 =
                                 FStar_Syntax_Print.term_to_string
                                   conjunction
                                  in
                               FStar_Util.format2
                                 "conjunction %s does not have proper shape (reason:%s)"
                                 uu____6125 s
                                in
                             (FStar_Errors.Fatal_UnexpectedEffect,
                               uu____6123)
                              in
                           let uu____6129 =
                             let uu____6174 =
                               let uu____6175 =
                                 FStar_Syntax_Subst.compress conjunction  in
                               uu____6175.FStar_Syntax_Syntax.n  in
                             match uu____6174 with
                             | FStar_Syntax_Syntax.Tm_abs
                                 (bs,body,uu____6224) when
                                 (FStar_List.length bs) >= (Prims.of_int (4))
                                 ->
                                 let uu____6256 =
                                   FStar_Syntax_Subst.open_term bs body  in
                                 (match uu____6256 with
                                  | (a_b::bs1,body1) ->
                                      let uu____6328 =
                                        FStar_List.splitAt
                                          ((FStar_List.length bs1) -
                                             (Prims.of_int (3))) bs1
                                         in
                                      (match uu____6328 with
                                       | (rest_bs,f_b::g_b::p_b::[]) ->
                                           let uu____6476 =
                                             FStar_All.pipe_right body1
                                               FStar_Syntax_Util.unascribe
                                              in
                                           (a_b, rest_bs, f_b, g_b, p_b,
                                             uu____6476)))
                             | uu____6509 ->
                                 let uu____6510 =
                                   conjunction_t_error
                                     "Either not an abstraction or not enough binders"
                                    in
                                 FStar_Errors.raise_error uu____6510 r
                              in
                           (match uu____6129 with
                            | (a_b,rest_bs,f_b,g_b,p_b,body) ->
                                let uu____6635 =
                                  let uu____6642 =
                                    let uu____6643 =
                                      let uu____6644 =
                                        let uu____6651 =
                                          FStar_All.pipe_right a_b
                                            FStar_Pervasives_Native.fst
                                           in
                                        (uu____6651, a)  in
                                      FStar_Syntax_Syntax.NT uu____6644  in
                                    [uu____6643]  in
                                  FStar_TypeChecker_Env.uvars_for_binders env
                                    rest_bs uu____6642
                                    (fun b  ->
                                       let uu____6667 =
                                         FStar_Syntax_Print.binder_to_string
                                           b
                                          in
                                       let uu____6669 =
                                         FStar_Ident.string_of_lid
                                           ed.FStar_Syntax_Syntax.mname
                                          in
                                       let uu____6671 =
                                         FStar_All.pipe_right r
                                           FStar_Range.string_of_range
                                          in
                                       FStar_Util.format3
                                         "implicit var for binder %s of %s:conjunction at %s"
                                         uu____6667 uu____6669 uu____6671) r
                                   in
                                (match uu____6635 with
                                 | (rest_bs_uvars,g_uvars) ->
                                     let substs =
                                       FStar_List.map2
                                         (fun b  ->
                                            fun t  ->
                                              let uu____6709 =
                                                let uu____6716 =
                                                  FStar_All.pipe_right b
                                                    FStar_Pervasives_Native.fst
                                                   in
                                                (uu____6716, t)  in
                                              FStar_Syntax_Syntax.NT
                                                uu____6709) (a_b ::
                                         (FStar_List.append rest_bs [p_b]))
                                         (a ::
                                         (FStar_List.append rest_bs_uvars [p]))
                                        in
                                     let f_guard =
                                       let f_sort_is =
                                         let uu____6755 =
                                           let uu____6756 =
                                             let uu____6759 =
                                               let uu____6760 =
                                                 FStar_All.pipe_right f_b
                                                   FStar_Pervasives_Native.fst
                                                  in
                                               uu____6760.FStar_Syntax_Syntax.sort
                                                in
                                             FStar_Syntax_Subst.compress
                                               uu____6759
                                              in
                                           uu____6756.FStar_Syntax_Syntax.n
                                            in
                                         match uu____6755 with
                                         | FStar_Syntax_Syntax.Tm_app
                                             (uu____6771,uu____6772::is) ->
                                             let uu____6814 =
                                               FStar_All.pipe_right is
                                                 (FStar_List.map
                                                    FStar_Pervasives_Native.fst)
                                                in
                                             FStar_All.pipe_right uu____6814
                                               (FStar_List.map
                                                  (FStar_Syntax_Subst.subst
                                                     substs))
                                         | uu____6847 ->
                                             let uu____6848 =
                                               conjunction_t_error
                                                 "f's type is not a repr type"
                                                in
                                             FStar_Errors.raise_error
                                               uu____6848 r
                                          in
                                       FStar_List.fold_left2
                                         (fun g  ->
                                            fun i1  ->
                                              fun f_i  ->
                                                let uu____6864 =
                                                  FStar_TypeChecker_Rel.teq
                                                    env i1 f_i
                                                   in
                                                FStar_TypeChecker_Env.conj_guard
                                                  g uu____6864)
                                         FStar_TypeChecker_Env.trivial_guard
                                         is1 f_sort_is
                                        in
                                     let g_guard =
                                       let g_sort_is =
                                         let uu____6869 =
                                           let uu____6870 =
                                             let uu____6873 =
                                               let uu____6874 =
                                                 FStar_All.pipe_right g_b
                                                   FStar_Pervasives_Native.fst
                                                  in
                                               uu____6874.FStar_Syntax_Syntax.sort
                                                in
                                             FStar_Syntax_Subst.compress
                                               uu____6873
                                              in
                                           uu____6870.FStar_Syntax_Syntax.n
                                            in
                                         match uu____6869 with
                                         | FStar_Syntax_Syntax.Tm_app
                                             (uu____6885,uu____6886::is) ->
                                             let uu____6928 =
                                               FStar_All.pipe_right is
                                                 (FStar_List.map
                                                    FStar_Pervasives_Native.fst)
                                                in
                                             FStar_All.pipe_right uu____6928
                                               (FStar_List.map
                                                  (FStar_Syntax_Subst.subst
                                                     substs))
                                         | uu____6961 ->
                                             let uu____6962 =
                                               conjunction_t_error
                                                 "g's type is not a repr type"
                                                in
                                             FStar_Errors.raise_error
                                               uu____6962 r
                                          in
                                       FStar_List.fold_left2
                                         (fun g  ->
                                            fun i2  ->
                                              fun g_i  ->
                                                let uu____6978 =
                                                  FStar_TypeChecker_Rel.teq
                                                    env i2 g_i
                                                   in
                                                FStar_TypeChecker_Env.conj_guard
                                                  g uu____6978)
                                         FStar_TypeChecker_Env.trivial_guard
                                         is2 g_sort_is
                                        in
                                     let body1 =
                                       FStar_Syntax_Subst.subst substs body
                                        in
                                     let is =
                                       let uu____6983 =
                                         let uu____6984 =
                                           FStar_Syntax_Subst.compress body1
                                            in
                                         uu____6984.FStar_Syntax_Syntax.n  in
                                       match uu____6983 with
                                       | FStar_Syntax_Syntax.Tm_app
                                           (uu____6989,a1::args) ->
                                           FStar_List.map
                                             FStar_Pervasives_Native.fst args
                                       | uu____7044 ->
                                           let uu____7045 =
                                             conjunction_t_error
                                               "body is not a repr type"
                                              in
                                           FStar_Errors.raise_error
                                             uu____7045 r
                                        in
                                     let uu____7054 =
                                       let uu____7055 =
                                         let uu____7056 =
                                           FStar_All.pipe_right is
                                             (FStar_List.map
                                                FStar_Syntax_Syntax.as_arg)
                                            in
                                         {
                                           FStar_Syntax_Syntax.comp_univs =
                                             [u_a];
                                           FStar_Syntax_Syntax.effect_name =
                                             (ed.FStar_Syntax_Syntax.mname);
                                           FStar_Syntax_Syntax.result_typ = a;
                                           FStar_Syntax_Syntax.effect_args =
                                             uu____7056;
                                           FStar_Syntax_Syntax.flags = []
                                         }  in
                                       FStar_Syntax_Syntax.mk_Comp uu____7055
                                        in
                                     let uu____7079 =
                                       let uu____7080 =
                                         FStar_TypeChecker_Env.conj_guard
                                           g_uvars f_guard
                                          in
                                       FStar_TypeChecker_Env.conj_guard
                                         uu____7080 g_guard
                                        in
                                     (uu____7054, uu____7079))))
  
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
  fun env  ->
    fun ed  ->
      fun u_a  ->
        fun a  ->
          fun p  ->
            fun ct1  ->
              fun ct2  ->
                fun uu____7125  ->
                  let uu____7130 =
                    FStar_Syntax_Util.get_match_with_close_wps
                      ed.FStar_Syntax_Syntax.match_wps
                     in
                  match uu____7130 with
                  | (if_then_else1,uu____7142,uu____7143) ->
                      let uu____7144 = destruct_wp_comp ct1  in
                      (match uu____7144 with
                       | (uu____7155,uu____7156,wp_t) ->
                           let uu____7158 = destruct_wp_comp ct2  in
                           (match uu____7158 with
                            | (uu____7169,uu____7170,wp_e) ->
                                let wp =
                                  let uu____7175 =
                                    FStar_Range.union_ranges
                                      wp_t.FStar_Syntax_Syntax.pos
                                      wp_e.FStar_Syntax_Syntax.pos
                                     in
                                  let uu____7176 =
                                    let uu____7181 =
                                      FStar_TypeChecker_Env.inst_effect_fun_with
                                        [u_a] env ed if_then_else1
                                       in
                                    let uu____7182 =
                                      let uu____7183 =
                                        FStar_Syntax_Syntax.as_arg a  in
                                      let uu____7192 =
                                        let uu____7203 =
                                          FStar_Syntax_Syntax.as_arg p  in
                                        let uu____7212 =
                                          let uu____7223 =
                                            FStar_Syntax_Syntax.as_arg wp_t
                                             in
                                          let uu____7232 =
                                            let uu____7243 =
                                              FStar_Syntax_Syntax.as_arg wp_e
                                               in
                                            [uu____7243]  in
                                          uu____7223 :: uu____7232  in
                                        uu____7203 :: uu____7212  in
                                      uu____7183 :: uu____7192  in
                                    FStar_Syntax_Syntax.mk_Tm_app uu____7181
                                      uu____7182
                                     in
                                  uu____7176 FStar_Pervasives_Native.None
                                    uu____7175
                                   in
                                let uu____7292 = mk_comp ed u_a a wp []  in
                                (uu____7292,
                                  FStar_TypeChecker_Env.trivial_guard)))
  
let (bind_cases :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      (FStar_Syntax_Syntax.typ * FStar_Ident.lident *
        FStar_Syntax_Syntax.cflag Prims.list *
        (Prims.bool -> FStar_TypeChecker_Common.lcomp)) Prims.list ->
        FStar_TypeChecker_Common.lcomp)
  =
  fun env  ->
    fun res_t  ->
      fun lcases  ->
        let eff =
          FStar_List.fold_left
            (fun eff  ->
               fun uu____7362  ->
                 match uu____7362 with
                 | (uu____7376,eff_label,uu____7378,uu____7379) ->
                     join_effects env eff eff_label)
            FStar_Parser_Const.effect_PURE_lid lcases
           in
        let uu____7392 =
          let uu____7400 =
            FStar_All.pipe_right lcases
              (FStar_Util.for_some
                 (fun uu____7438  ->
                    match uu____7438 with
                    | (uu____7453,uu____7454,flags,uu____7456) ->
                        FStar_All.pipe_right flags
                          (FStar_Util.for_some
                             (fun uu___5_7473  ->
                                match uu___5_7473 with
                                | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  ->
                                    true
                                | uu____7476 -> false))))
             in
          if uu____7400
          then (true, [FStar_Syntax_Syntax.SHOULD_NOT_INLINE])
          else (false, [])  in
        match uu____7392 with
        | (should_not_inline_whole_match,bind_cases_flags) ->
            let bind_cases uu____7513 =
              let u_res_t = env.FStar_TypeChecker_Env.universe_of env res_t
                 in
              let uu____7515 =
                env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ())
                 in
              if uu____7515
              then
                let uu____7522 = lax_mk_tot_or_comp_l eff u_res_t res_t []
                   in
                (uu____7522, FStar_TypeChecker_Env.trivial_guard)
              else
                (let default_case =
                   let post_k =
                     let uu____7529 =
                       let uu____7538 = FStar_Syntax_Syntax.null_binder res_t
                          in
                       [uu____7538]  in
                     let uu____7557 =
                       FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0
                        in
                     FStar_Syntax_Util.arrow uu____7529 uu____7557  in
                   let kwp =
                     let uu____7563 =
                       let uu____7572 =
                         FStar_Syntax_Syntax.null_binder post_k  in
                       [uu____7572]  in
                     let uu____7591 =
                       FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0
                        in
                     FStar_Syntax_Util.arrow uu____7563 uu____7591  in
                   let post =
                     FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
                       post_k
                      in
                   let wp =
                     let uu____7598 =
                       let uu____7599 = FStar_Syntax_Syntax.mk_binder post
                          in
                       [uu____7599]  in
                     let uu____7618 =
                       let uu____7621 =
                         let uu____7628 = FStar_TypeChecker_Env.get_range env
                            in
                         label FStar_TypeChecker_Err.exhaustiveness_check
                           uu____7628
                          in
                       let uu____7629 =
                         fvar_const env FStar_Parser_Const.false_lid  in
                       FStar_All.pipe_left uu____7621 uu____7629  in
                     FStar_Syntax_Util.abs uu____7598 uu____7618
                       (FStar_Pervasives_Native.Some
                          (FStar_Syntax_Util.mk_residual_comp
                             FStar_Parser_Const.effect_Tot_lid
                             FStar_Pervasives_Native.None
                             [FStar_Syntax_Syntax.TOTAL]))
                      in
                   let md =
                     FStar_TypeChecker_Env.get_effect_decl env
                       FStar_Parser_Const.effect_PURE_lid
                      in
                   mk_comp md u_res_t res_t wp []  in
                 let maybe_return eff_label_then cthen =
                   let uu____7653 =
                     should_not_inline_whole_match ||
                       (let uu____7656 = is_pure_or_ghost_effect env eff  in
                        Prims.op_Negation uu____7656)
                      in
                   if uu____7653 then cthen true else cthen false  in
                 let uu____7663 =
                   FStar_List.fold_right
                     (fun uu____7716  ->
                        fun uu____7717  ->
                          match (uu____7716, uu____7717) with
                          | ((g,eff_label,uu____7771,cthen),(uu____7773,celse,g_comp))
                              ->
                              let uu____7814 =
                                let uu____7819 = maybe_return eff_label cthen
                                   in
                                FStar_TypeChecker_Common.lcomp_comp
                                  uu____7819
                                 in
                              (match uu____7814 with
                               | (cthen1,gthen) ->
                                   let uu____7830 =
                                     let uu____7839 =
                                       lift_comps env cthen1 celse
                                         FStar_Pervasives_Native.None false
                                        in
                                     match uu____7839 with
                                     | (m,cthen2,celse1,g_lift) ->
                                         let md =
                                           FStar_TypeChecker_Env.get_effect_decl
                                             env m
                                            in
                                         let uu____7862 =
                                           FStar_All.pipe_right cthen2
                                             FStar_Syntax_Util.comp_to_comp_typ
                                            in
                                         let uu____7863 =
                                           FStar_All.pipe_right celse1
                                             FStar_Syntax_Util.comp_to_comp_typ
                                            in
                                         (md, uu____7862, uu____7863, g_lift)
                                      in
                                   (match uu____7830 with
                                    | (md,ct_then,ct_else,g_lift) ->
                                        let fn =
                                          if
                                            FStar_Pervasives_Native.fst
                                              md.FStar_Syntax_Syntax.is_layered
                                          then mk_layered_conjunction
                                          else mk_non_layered_conjunction  in
                                        let uu____7947 =
                                          let uu____7952 =
                                            FStar_TypeChecker_Env.get_range
                                              env
                                             in
                                          fn env md u_res_t res_t g ct_then
                                            ct_else uu____7952
                                           in
                                        (match uu____7947 with
                                         | (c,g_conjunction) ->
                                             let uu____7963 =
                                               let uu____7964 =
                                                 let uu____7965 =
                                                   FStar_TypeChecker_Env.conj_guard
                                                     g_comp gthen
                                                    in
                                                 FStar_TypeChecker_Env.conj_guard
                                                   uu____7965 g_lift
                                                  in
                                               FStar_TypeChecker_Env.conj_guard
                                                 uu____7964 g_conjunction
                                                in
                                             ((FStar_Pervasives_Native.Some
                                                 md), c, uu____7963)))))
                     lcases
                     (FStar_Pervasives_Native.None, default_case,
                       FStar_TypeChecker_Env.trivial_guard)
                    in
                 match uu____7663 with
                 | (md,comp,g_comp) ->
                     (match lcases with
                      | [] -> (comp, g_comp)
                      | uu____7999::[] -> (comp, g_comp)
                      | uu____8042 ->
                          let uu____8059 =
                            let uu____8061 =
                              let uu____8069 =
                                FStar_All.pipe_right md FStar_Util.must  in
                              uu____8069.FStar_Syntax_Syntax.is_layered  in
                            FStar_Pervasives_Native.fst uu____8061  in
                          if uu____8059
                          then (comp, g_comp)
                          else
                            (let comp1 =
                               FStar_TypeChecker_Env.comp_to_comp_typ env
                                 comp
                                in
                             let md1 =
                               FStar_TypeChecker_Env.get_effect_decl env
                                 comp1.FStar_Syntax_Syntax.effect_name
                                in
                             let uu____8084 = destruct_wp_comp comp1  in
                             match uu____8084 with
                             | (uu____8095,uu____8096,wp) ->
                                 let uu____8098 =
                                   FStar_Syntax_Util.get_match_with_close_wps
                                     md1.FStar_Syntax_Syntax.match_wps
                                    in
                                 (match uu____8098 with
                                  | (uu____8109,ite_wp,uu____8111) ->
                                      let wp1 =
                                        let uu____8115 =
                                          let uu____8120 =
                                            FStar_TypeChecker_Env.inst_effect_fun_with
                                              [u_res_t] env md1 ite_wp
                                             in
                                          let uu____8121 =
                                            let uu____8122 =
                                              FStar_Syntax_Syntax.as_arg
                                                res_t
                                               in
                                            let uu____8131 =
                                              let uu____8142 =
                                                FStar_Syntax_Syntax.as_arg wp
                                                 in
                                              [uu____8142]  in
                                            uu____8122 :: uu____8131  in
                                          FStar_Syntax_Syntax.mk_Tm_app
                                            uu____8120 uu____8121
                                           in
                                        uu____8115
                                          FStar_Pervasives_Native.None
                                          wp.FStar_Syntax_Syntax.pos
                                         in
                                      let uu____8175 =
                                        mk_comp md1 u_res_t res_t wp1
                                          bind_cases_flags
                                         in
                                      (uu____8175, g_comp)))))
               in
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
  fun env  ->
    fun e  ->
      fun c  ->
        fun c'  ->
          let uu____8209 = FStar_TypeChecker_Rel.sub_comp env c c'  in
          match uu____8209 with
          | FStar_Pervasives_Native.None  ->
              if env.FStar_TypeChecker_Env.use_eq
              then
                let uu____8225 =
                  FStar_TypeChecker_Err.computed_computation_type_does_not_match_annotation_eq
                    env e c c'
                   in
                let uu____8231 = FStar_TypeChecker_Env.get_range env  in
                FStar_Errors.raise_error uu____8225 uu____8231
              else
                (let uu____8240 =
                   FStar_TypeChecker_Err.computed_computation_type_does_not_match_annotation
                     env e c c'
                    in
                 let uu____8246 = FStar_TypeChecker_Env.get_range env  in
                 FStar_Errors.raise_error uu____8240 uu____8246)
          | FStar_Pervasives_Native.Some g -> (e, c', g)
  
let (universe_of_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.universe)
  =
  fun env  ->
    fun u_res  ->
      fun c  ->
        let c_lid =
          let uu____8271 =
            FStar_All.pipe_right c FStar_Syntax_Util.comp_effect_name  in
          FStar_All.pipe_right uu____8271
            (FStar_TypeChecker_Env.norm_eff_name env)
           in
        let uu____8274 = FStar_Syntax_Util.is_pure_or_ghost_effect c_lid  in
        if uu____8274
        then u_res
        else
          (let is_total =
             let uu____8281 =
               FStar_TypeChecker_Env.lookup_effect_quals env c_lid  in
             FStar_All.pipe_right uu____8281
               (FStar_List.existsb
                  (fun q  -> q = FStar_Syntax_Syntax.TotalEffect))
              in
           if Prims.op_Negation is_total
           then FStar_Syntax_Syntax.U_zero
           else
             (let uu____8292 = FStar_TypeChecker_Env.effect_repr env c u_res
                 in
              match uu____8292 with
              | FStar_Pervasives_Native.None  ->
                  let uu____8295 =
                    let uu____8301 =
                      let uu____8303 = FStar_Syntax_Print.lid_to_string c_lid
                         in
                      FStar_Util.format1
                        "Effect %s is marked total but does not have a repr"
                        uu____8303
                       in
                    (FStar_Errors.Fatal_EffectCannotBeReified, uu____8301)
                     in
                  FStar_Errors.raise_error uu____8295
                    c.FStar_Syntax_Syntax.pos
              | FStar_Pervasives_Native.Some tm ->
                  env.FStar_TypeChecker_Env.universe_of env tm))
  
let (check_trivial_precondition :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      (FStar_Syntax_Syntax.comp_typ * FStar_Syntax_Syntax.formula *
        FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun c  ->
      let ct =
        FStar_All.pipe_right c
          (FStar_TypeChecker_Env.unfold_effect_abbrev env)
         in
      let md =
        FStar_TypeChecker_Env.get_effect_decl env
          ct.FStar_Syntax_Syntax.effect_name
         in
      let uu____8327 = destruct_wp_comp ct  in
      match uu____8327 with
      | (u_t,t,wp) ->
          let vc =
            let uu____8346 = FStar_TypeChecker_Env.get_range env  in
            let uu____8347 =
              let uu____8352 =
                let uu____8353 =
                  FStar_All.pipe_right md.FStar_Syntax_Syntax.trivial
                    FStar_Util.must
                   in
                FStar_TypeChecker_Env.inst_effect_fun_with [u_t] env md
                  uu____8353
                 in
              let uu____8356 =
                let uu____8357 = FStar_Syntax_Syntax.as_arg t  in
                let uu____8366 =
                  let uu____8377 = FStar_Syntax_Syntax.as_arg wp  in
                  [uu____8377]  in
                uu____8357 :: uu____8366  in
              FStar_Syntax_Syntax.mk_Tm_app uu____8352 uu____8356  in
            uu____8347 FStar_Pervasives_Native.None uu____8346  in
          let uu____8410 =
            FStar_All.pipe_left FStar_TypeChecker_Env.guard_of_guard_formula
              (FStar_TypeChecker_Common.NonTrivial vc)
             in
          (ct, vc, uu____8410)
  
let (coerce_with :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp ->
        FStar_Syntax_Syntax.typ ->
          FStar_Ident.lident ->
            FStar_Syntax_Syntax.universes ->
              FStar_Syntax_Syntax.args ->
                (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.lcomp))
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        fun ty  ->
          fun f  ->
            fun us  ->
              fun eargs  ->
                let uu____8455 = FStar_TypeChecker_Env.try_lookup_lid env f
                   in
                match uu____8455 with
                | FStar_Pervasives_Native.Some uu____8470 ->
                    ((let uu____8488 =
                        FStar_TypeChecker_Env.debug env
                          (FStar_Options.Other "Coercions")
                         in
                      if uu____8488
                      then
                        let uu____8492 = FStar_Ident.string_of_lid f  in
                        FStar_Util.print1 "Coercing with %s!\n" uu____8492
                      else ());
                     (let coercion =
                        let uu____8498 =
                          FStar_Ident.set_lid_range f
                            e.FStar_Syntax_Syntax.pos
                           in
                        FStar_Syntax_Syntax.fvar uu____8498
                          (FStar_Syntax_Syntax.Delta_constant_at_level
                             Prims.int_one) FStar_Pervasives_Native.None
                         in
                      let coercion1 =
                        FStar_Syntax_Syntax.mk_Tm_uinst coercion us  in
                      let coercion2 =
                        FStar_Syntax_Util.mk_app coercion1 eargs  in
                      let lc1 =
                        let uu____8505 =
                          let uu____8506 =
                            let uu____8507 = FStar_Syntax_Syntax.mk_Total ty
                               in
                            FStar_All.pipe_left
                              FStar_TypeChecker_Common.lcomp_of_comp
                              uu____8507
                             in
                          (FStar_Pervasives_Native.None, uu____8506)  in
                        bind e.FStar_Syntax_Syntax.pos env
                          (FStar_Pervasives_Native.Some e) lc uu____8505
                         in
                      let e1 =
                        let uu____8513 =
                          let uu____8518 =
                            let uu____8519 = FStar_Syntax_Syntax.as_arg e  in
                            [uu____8519]  in
                          FStar_Syntax_Syntax.mk_Tm_app coercion2 uu____8518
                           in
                        uu____8513 FStar_Pervasives_Native.None
                          e.FStar_Syntax_Syntax.pos
                         in
                      (e1, lc1)))
                | FStar_Pervasives_Native.None  ->
                    ((let uu____8553 =
                        let uu____8559 =
                          let uu____8561 = FStar_Ident.string_of_lid f  in
                          FStar_Util.format1
                            "Coercion %s was not found in the environment, not coercing."
                            uu____8561
                           in
                        (FStar_Errors.Warning_CoercionNotFound, uu____8559)
                         in
                      FStar_Errors.log_issue e.FStar_Syntax_Syntax.pos
                        uu____8553);
                     (e, lc))
  
let (maybe_coerce_lc :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.lcomp))
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        fun t  ->
          let should_coerce =
            (((let uu____8598 = FStar_Options.use_two_phase_tc ()  in
               Prims.op_Negation uu____8598) ||
                env.FStar_TypeChecker_Env.phase1)
               || env.FStar_TypeChecker_Env.lax)
              || (FStar_Options.lax ())
             in
          if Prims.op_Negation should_coerce
          then (e, lc)
          else
            (let is_t_term t1 =
               let t2 = FStar_TypeChecker_Normalize.unfold_whnf env t1  in
               let uu____8615 =
                 let uu____8616 = FStar_Syntax_Subst.compress t2  in
                 uu____8616.FStar_Syntax_Syntax.n  in
               match uu____8615 with
               | FStar_Syntax_Syntax.Tm_fvar fv ->
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.term_lid
               | uu____8621 -> false  in
             let is_t_term_view t1 =
               let t2 = FStar_TypeChecker_Normalize.unfold_whnf env t1  in
               let uu____8631 =
                 let uu____8632 = FStar_Syntax_Subst.compress t2  in
                 uu____8632.FStar_Syntax_Syntax.n  in
               match uu____8631 with
               | FStar_Syntax_Syntax.Tm_fvar fv ->
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.term_view_lid
               | uu____8637 -> false  in
             let is_type1 t1 =
               let t2 = FStar_TypeChecker_Normalize.unfold_whnf env t1  in
               let uu____8647 =
                 let uu____8648 = FStar_Syntax_Subst.compress t2  in
                 uu____8648.FStar_Syntax_Syntax.n  in
               match uu____8647 with
               | FStar_Syntax_Syntax.Tm_type uu____8652 -> true
               | uu____8654 -> false  in
             let res_typ =
               FStar_Syntax_Util.unrefine lc.FStar_TypeChecker_Common.res_typ
                in
             let uu____8657 = FStar_Syntax_Util.head_and_args res_typ  in
             match uu____8657 with
             | (head1,args) ->
                 ((let uu____8705 =
                     FStar_TypeChecker_Env.debug env
                       (FStar_Options.Other "Coercions")
                      in
                   if uu____8705
                   then
                     let uu____8709 =
                       FStar_Range.string_of_range e.FStar_Syntax_Syntax.pos
                        in
                     let uu____8711 = FStar_Syntax_Print.term_to_string e  in
                     let uu____8713 =
                       FStar_Syntax_Print.term_to_string res_typ  in
                     let uu____8715 = FStar_Syntax_Print.term_to_string t  in
                     FStar_Util.print4
                       "(%s) Trying to coerce %s from type (%s) to type (%s)\n"
                       uu____8709 uu____8711 uu____8713 uu____8715
                   else ());
                  (let is_erased env1 t1 t2 =
                     let uu____8737 = FStar_Syntax_Util.head_and_args t2  in
                     match uu____8737 with
                     | (head2,args1) ->
                         let uu____8781 =
                           let uu____8796 =
                             let uu____8797 =
                               FStar_Syntax_Util.un_uinst head2  in
                             uu____8797.FStar_Syntax_Syntax.n  in
                           (uu____8796, args1)  in
                         (match uu____8781 with
                          | (FStar_Syntax_Syntax.Tm_fvar
                             fv,(x,FStar_Pervasives_Native.None )::[]) ->
                              (FStar_Syntax_Syntax.fv_eq_lid fv
                                 FStar_Parser_Const.erased_lid)
                                && (FStar_Syntax_Util.term_eq x t1)
                          | uu____8845 -> false)
                      in
                   let uu____8861 =
                     let uu____8876 =
                       let uu____8877 = FStar_Syntax_Util.un_uinst head1  in
                       uu____8877.FStar_Syntax_Syntax.n  in
                     (uu____8876, args)  in
                   match uu____8861 with
                   | (FStar_Syntax_Syntax.Tm_fvar fv,[]) when
                       (FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.bool_lid)
                         && (is_type1 t)
                       ->
                       coerce_with env e lc FStar_Syntax_Util.ktype0
                         FStar_Parser_Const.b2t_lid [] []
                   | (FStar_Syntax_Syntax.Tm_fvar fv,[]) when
                       (FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.term_lid)
                         && (is_t_term_view t)
                       ->
                       coerce_with env e lc FStar_Syntax_Syntax.t_term_view
                         FStar_Parser_Const.inspect [] []
                   | (FStar_Syntax_Syntax.Tm_fvar fv,[]) when
                       (FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.term_view_lid)
                         && (is_t_term t)
                       ->
                       coerce_with env e lc FStar_Syntax_Syntax.t_term
                         FStar_Parser_Const.pack [] []
                   | (FStar_Syntax_Syntax.Tm_fvar fv,[]) when
                       (FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.binder_lid)
                         && (is_t_term t)
                       ->
                       coerce_with env e lc FStar_Syntax_Syntax.t_term
                         FStar_Parser_Const.binder_to_term [] []
                   | uu____9002 when is_erased env t res_typ ->
                       let uu____9017 =
                         let uu____9018 =
                           env.FStar_TypeChecker_Env.universe_of env t  in
                         [uu____9018]  in
                       let uu____9019 =
                         let uu____9020 = FStar_Syntax_Syntax.iarg t  in
                         [uu____9020]  in
                       coerce_with env e lc t FStar_Parser_Const.reveal
                         uu____9017 uu____9019
                   | uu____9045 when is_erased env res_typ t ->
                       let uu____9060 =
                         let uu____9061 =
                           env.FStar_TypeChecker_Env.universe_of env res_typ
                            in
                         [uu____9061]  in
                       let uu____9062 =
                         let uu____9063 = FStar_Syntax_Syntax.iarg res_typ
                            in
                         [uu____9063]  in
                       coerce_with env e lc t FStar_Parser_Const.hide
                         uu____9060 uu____9062
                   | uu____9088 -> (e, lc))))
  
let (maybe_coerce :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.typ))
  =
  fun env  ->
    fun e  ->
      fun t1  ->
        fun t2  ->
          let lc =
            let uu____9133 = FStar_Syntax_Syntax.mk_Total t1  in
            FStar_TypeChecker_Common.lcomp_of_comp uu____9133  in
          let uu____9134 = maybe_coerce_lc env e lc t2  in
          match uu____9134 with
          | (e1,lc1) -> (e1, (lc1.FStar_TypeChecker_Common.res_typ))
  
let (coerce_views :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp ->
        (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.lcomp)
          FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        let rt = lc.FStar_TypeChecker_Common.res_typ  in
        let rt1 = FStar_Syntax_Util.unrefine rt  in
        let uu____9175 = FStar_Syntax_Util.head_and_args rt1  in
        match uu____9175 with
        | (hd1,args) ->
            let uu____9224 =
              let uu____9239 =
                let uu____9240 = FStar_Syntax_Subst.compress hd1  in
                uu____9240.FStar_Syntax_Syntax.n  in
              (uu____9239, args)  in
            (match uu____9224 with
             | (FStar_Syntax_Syntax.Tm_fvar fv,[]) when
                 FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.term_lid
                 ->
                 let uu____9278 =
                   coerce_with env e lc FStar_Syntax_Syntax.t_term_view
                     FStar_Parser_Const.inspect [] []
                    in
                 FStar_All.pipe_left
                   (fun _9305  -> FStar_Pervasives_Native.Some _9305)
                   uu____9278
             | uu____9306 -> FStar_Pervasives_Native.None)
  
let (weaken_result_typ :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.lcomp *
            FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        fun t  ->
          (let uu____9359 =
             FStar_TypeChecker_Env.debug env FStar_Options.High  in
           if uu____9359
           then
             let uu____9362 = FStar_Syntax_Print.term_to_string e  in
             let uu____9364 = FStar_TypeChecker_Common.lcomp_to_string lc  in
             let uu____9366 = FStar_Syntax_Print.term_to_string t  in
             FStar_Util.print3 "weaken_result_typ e=(%s) lc=(%s) t=(%s)\n"
               uu____9362 uu____9364 uu____9366
           else ());
          (let use_eq =
             env.FStar_TypeChecker_Env.use_eq ||
               (let uu____9376 =
                  FStar_TypeChecker_Env.effect_decl_opt env
                    lc.FStar_TypeChecker_Common.eff_name
                   in
                match uu____9376 with
                | FStar_Pervasives_Native.Some (ed,qualifiers) ->
                    FStar_All.pipe_right qualifiers
                      (FStar_List.contains FStar_Syntax_Syntax.Reifiable)
                | uu____9401 -> false)
              in
           let gopt =
             if use_eq
             then
               let uu____9427 =
                 FStar_TypeChecker_Rel.try_teq true env
                   lc.FStar_TypeChecker_Common.res_typ t
                  in
               (uu____9427, false)
             else
               (let uu____9437 =
                  FStar_TypeChecker_Rel.get_subtyping_predicate env
                    lc.FStar_TypeChecker_Common.res_typ t
                   in
                (uu____9437, true))
              in
           match gopt with
           | (FStar_Pervasives_Native.None ,uu____9450) ->
               if env.FStar_TypeChecker_Env.failhard
               then
                 let uu____9462 =
                   FStar_TypeChecker_Err.basic_type_error env
                     (FStar_Pervasives_Native.Some e) t
                     lc.FStar_TypeChecker_Common.res_typ
                    in
                 FStar_Errors.raise_error uu____9462
                   e.FStar_Syntax_Syntax.pos
               else
                 (FStar_TypeChecker_Rel.subtype_fail env e
                    lc.FStar_TypeChecker_Common.res_typ t;
                  (e,
                    ((let uu___1133_9478 = lc  in
                      {
                        FStar_TypeChecker_Common.eff_name =
                          (uu___1133_9478.FStar_TypeChecker_Common.eff_name);
                        FStar_TypeChecker_Common.res_typ = t;
                        FStar_TypeChecker_Common.cflags =
                          (uu___1133_9478.FStar_TypeChecker_Common.cflags);
                        FStar_TypeChecker_Common.comp_thunk =
                          (uu___1133_9478.FStar_TypeChecker_Common.comp_thunk)
                      })), FStar_TypeChecker_Env.trivial_guard))
           | (FStar_Pervasives_Native.Some g,apply_guard1) ->
               let uu____9485 = FStar_TypeChecker_Env.guard_form g  in
               (match uu____9485 with
                | FStar_TypeChecker_Common.Trivial  ->
                    let strengthen_trivial uu____9501 =
                      let uu____9502 = FStar_TypeChecker_Common.lcomp_comp lc
                         in
                      match uu____9502 with
                      | (c,g_c) ->
                          let res_t = FStar_Syntax_Util.comp_result c  in
                          let set_result_typ1 c1 =
                            FStar_Syntax_Util.set_result_typ c1 t  in
                          let uu____9522 =
                            let uu____9524 = FStar_Syntax_Util.eq_tm t res_t
                               in
                            uu____9524 = FStar_Syntax_Util.Equal  in
                          if uu____9522
                          then
                            ((let uu____9531 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  FStar_Options.Extreme
                                 in
                              if uu____9531
                              then
                                let uu____9535 =
                                  FStar_Syntax_Print.term_to_string res_t  in
                                let uu____9537 =
                                  FStar_Syntax_Print.term_to_string t  in
                                FStar_Util.print2
                                  "weaken_result_type::strengthen_trivial: res_t:%s is same as t:%s\n"
                                  uu____9535 uu____9537
                              else ());
                             (let uu____9542 = set_result_typ1 c  in
                              (uu____9542, g_c)))
                          else
                            (let is_res_t_refinement =
                               let res_t1 =
                                 FStar_TypeChecker_Normalize.normalize_refinement
                                   FStar_TypeChecker_Normalize.whnf_steps env
                                   res_t
                                  in
                               match res_t1.FStar_Syntax_Syntax.n with
                               | FStar_Syntax_Syntax.Tm_refine uu____9549 ->
                                   true
                               | uu____9557 -> false  in
                             if is_res_t_refinement
                             then
                               let x =
                                 FStar_Syntax_Syntax.new_bv
                                   (FStar_Pervasives_Native.Some
                                      (res_t.FStar_Syntax_Syntax.pos)) res_t
                                  in
                               let cret =
                                 let uu____9566 =
                                   FStar_Syntax_Syntax.bv_to_name x  in
                                 return_value env (comp_univ_opt c) res_t
                                   uu____9566
                                  in
                               let lc1 =
                                 let uu____9568 =
                                   FStar_TypeChecker_Common.lcomp_of_comp c
                                    in
                                 let uu____9569 =
                                   let uu____9570 =
                                     FStar_TypeChecker_Common.lcomp_of_comp
                                       cret
                                      in
                                   ((FStar_Pervasives_Native.Some x),
                                     uu____9570)
                                    in
                                 bind e.FStar_Syntax_Syntax.pos env
                                   (FStar_Pervasives_Native.Some e)
                                   uu____9568 uu____9569
                                  in
                               ((let uu____9574 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env)
                                     FStar_Options.Extreme
                                    in
                                 if uu____9574
                                 then
                                   let uu____9578 =
                                     FStar_Syntax_Print.term_to_string e  in
                                   let uu____9580 =
                                     FStar_Syntax_Print.comp_to_string c  in
                                   let uu____9582 =
                                     FStar_Syntax_Print.term_to_string t  in
                                   let uu____9584 =
                                     FStar_TypeChecker_Common.lcomp_to_string
                                       lc1
                                      in
                                   FStar_Util.print4
                                     "weaken_result_type::strengthen_trivial: inserting a return for e: %s, c: %s, t: %s, and then post return lc: %s\n"
                                     uu____9578 uu____9580 uu____9582
                                     uu____9584
                                 else ());
                                (let uu____9589 =
                                   FStar_TypeChecker_Common.lcomp_comp lc1
                                    in
                                 match uu____9589 with
                                 | (c1,g_lc) ->
                                     let uu____9600 = set_result_typ1 c1  in
                                     let uu____9601 =
                                       FStar_TypeChecker_Env.conj_guard g_c
                                         g_lc
                                        in
                                     (uu____9600, uu____9601)))
                             else
                               ((let uu____9605 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env)
                                     FStar_Options.Extreme
                                    in
                                 if uu____9605
                                 then
                                   let uu____9609 =
                                     FStar_Syntax_Print.term_to_string res_t
                                      in
                                   let uu____9611 =
                                     FStar_Syntax_Print.comp_to_string c  in
                                   FStar_Util.print2
                                     "weaken_result_type::strengthen_trivial: res_t:%s is not a refinement, leaving c:%s as is\n"
                                     uu____9609 uu____9611
                                 else ());
                                (let uu____9616 = set_result_typ1 c  in
                                 (uu____9616, g_c))))
                       in
                    let lc1 =
                      FStar_TypeChecker_Common.mk_lcomp
                        lc.FStar_TypeChecker_Common.eff_name t
                        lc.FStar_TypeChecker_Common.cflags strengthen_trivial
                       in
                    (e, lc1, g)
                | FStar_TypeChecker_Common.NonTrivial f ->
                    let g1 =
                      let uu___1170_9620 = g  in
                      {
                        FStar_TypeChecker_Common.guard_f =
                          FStar_TypeChecker_Common.Trivial;
                        FStar_TypeChecker_Common.deferred =
                          (uu___1170_9620.FStar_TypeChecker_Common.deferred);
                        FStar_TypeChecker_Common.univ_ineqs =
                          (uu___1170_9620.FStar_TypeChecker_Common.univ_ineqs);
                        FStar_TypeChecker_Common.implicits =
                          (uu___1170_9620.FStar_TypeChecker_Common.implicits)
                      }  in
                    let strengthen uu____9630 =
                      let uu____9631 =
                        env.FStar_TypeChecker_Env.lax &&
                          (FStar_Options.ml_ish ())
                         in
                      if uu____9631
                      then FStar_TypeChecker_Common.lcomp_comp lc
                      else
                        (let f1 =
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Env.Beta;
                             FStar_TypeChecker_Env.Eager_unfolding;
                             FStar_TypeChecker_Env.Simplify;
                             FStar_TypeChecker_Env.Primops] env f
                            in
                         let uu____9641 =
                           let uu____9642 = FStar_Syntax_Subst.compress f1
                              in
                           uu____9642.FStar_Syntax_Syntax.n  in
                         match uu____9641 with
                         | FStar_Syntax_Syntax.Tm_abs
                             (uu____9649,{
                                           FStar_Syntax_Syntax.n =
                                             FStar_Syntax_Syntax.Tm_fvar fv;
                                           FStar_Syntax_Syntax.pos =
                                             uu____9651;
                                           FStar_Syntax_Syntax.vars =
                                             uu____9652;_},uu____9653)
                             when
                             FStar_Syntax_Syntax.fv_eq_lid fv
                               FStar_Parser_Const.true_lid
                             ->
                             let lc1 =
                               let uu___1186_9679 = lc  in
                               {
                                 FStar_TypeChecker_Common.eff_name =
                                   (uu___1186_9679.FStar_TypeChecker_Common.eff_name);
                                 FStar_TypeChecker_Common.res_typ = t;
                                 FStar_TypeChecker_Common.cflags =
                                   (uu___1186_9679.FStar_TypeChecker_Common.cflags);
                                 FStar_TypeChecker_Common.comp_thunk =
                                   (uu___1186_9679.FStar_TypeChecker_Common.comp_thunk)
                               }  in
                             FStar_TypeChecker_Common.lcomp_comp lc1
                         | uu____9680 ->
                             let uu____9681 =
                               FStar_TypeChecker_Common.lcomp_comp lc  in
                             (match uu____9681 with
                              | (c,g_c) ->
                                  ((let uu____9693 =
                                      FStar_All.pipe_left
                                        (FStar_TypeChecker_Env.debug env)
                                        FStar_Options.Extreme
                                       in
                                    if uu____9693
                                    then
                                      let uu____9697 =
                                        FStar_TypeChecker_Normalize.term_to_string
                                          env
                                          lc.FStar_TypeChecker_Common.res_typ
                                         in
                                      let uu____9699 =
                                        FStar_TypeChecker_Normalize.term_to_string
                                          env t
                                         in
                                      let uu____9701 =
                                        FStar_TypeChecker_Normalize.comp_to_string
                                          env c
                                         in
                                      let uu____9703 =
                                        FStar_TypeChecker_Normalize.term_to_string
                                          env f1
                                         in
                                      FStar_Util.print4
                                        "Weakened from %s to %s\nStrengthening %s with guard %s\n"
                                        uu____9697 uu____9699 uu____9701
                                        uu____9703
                                    else ());
                                   (let u_t_opt = comp_univ_opt c  in
                                    let x =
                                      FStar_Syntax_Syntax.new_bv
                                        (FStar_Pervasives_Native.Some
                                           (t.FStar_Syntax_Syntax.pos)) t
                                       in
                                    let xexp =
                                      FStar_Syntax_Syntax.bv_to_name x  in
                                    let cret =
                                      return_value env u_t_opt t xexp  in
                                    let guard =
                                      if apply_guard1
                                      then
                                        let uu____9716 =
                                          let uu____9721 =
                                            let uu____9722 =
                                              FStar_Syntax_Syntax.as_arg xexp
                                               in
                                            [uu____9722]  in
                                          FStar_Syntax_Syntax.mk_Tm_app f1
                                            uu____9721
                                           in
                                        uu____9716
                                          FStar_Pervasives_Native.None
                                          f1.FStar_Syntax_Syntax.pos
                                      else f1  in
                                    let uu____9749 =
                                      let uu____9754 =
                                        FStar_All.pipe_left
                                          (fun _9775  ->
                                             FStar_Pervasives_Native.Some
                                               _9775)
                                          (FStar_TypeChecker_Err.subtyping_failed
                                             env
                                             lc.FStar_TypeChecker_Common.res_typ
                                             t)
                                         in
                                      let uu____9776 =
                                        FStar_TypeChecker_Env.set_range env
                                          e.FStar_Syntax_Syntax.pos
                                         in
                                      let uu____9777 =
                                        FStar_TypeChecker_Common.lcomp_of_comp
                                          cret
                                         in
                                      let uu____9778 =
                                        FStar_All.pipe_left
                                          FStar_TypeChecker_Env.guard_of_guard_formula
                                          (FStar_TypeChecker_Common.NonTrivial
                                             guard)
                                         in
                                      strengthen_precondition uu____9754
                                        uu____9776 e uu____9777 uu____9778
                                       in
                                    match uu____9749 with
                                    | (eq_ret,_trivial_so_ok_to_discard) ->
                                        let x1 =
                                          let uu___1204_9786 = x  in
                                          {
                                            FStar_Syntax_Syntax.ppname =
                                              (uu___1204_9786.FStar_Syntax_Syntax.ppname);
                                            FStar_Syntax_Syntax.index =
                                              (uu___1204_9786.FStar_Syntax_Syntax.index);
                                            FStar_Syntax_Syntax.sort =
                                              (lc.FStar_TypeChecker_Common.res_typ)
                                          }  in
                                        let c1 =
                                          let uu____9788 =
                                            FStar_TypeChecker_Common.lcomp_of_comp
                                              c
                                             in
                                          bind e.FStar_Syntax_Syntax.pos env
                                            (FStar_Pervasives_Native.Some e)
                                            uu____9788
                                            ((FStar_Pervasives_Native.Some x1),
                                              eq_ret)
                                           in
                                        let uu____9791 =
                                          FStar_TypeChecker_Common.lcomp_comp
                                            c1
                                           in
                                        (match uu____9791 with
                                         | (c2,g_lc) ->
                                             ((let uu____9803 =
                                                 FStar_All.pipe_left
                                                   (FStar_TypeChecker_Env.debug
                                                      env)
                                                   FStar_Options.Extreme
                                                  in
                                               if uu____9803
                                               then
                                                 let uu____9807 =
                                                   FStar_TypeChecker_Normalize.comp_to_string
                                                     env c2
                                                    in
                                                 FStar_Util.print1
                                                   "Strengthened to %s\n"
                                                   uu____9807
                                               else ());
                                              (let uu____9812 =
                                                 FStar_TypeChecker_Env.conj_guard
                                                   g_c g_lc
                                                  in
                                               (c2, uu____9812))))))))
                       in
                    let flags =
                      FStar_All.pipe_right lc.FStar_TypeChecker_Common.cflags
                        (FStar_List.collect
                           (fun uu___6_9821  ->
                              match uu___6_9821 with
                              | FStar_Syntax_Syntax.RETURN  ->
                                  [FStar_Syntax_Syntax.PARTIAL_RETURN]
                              | FStar_Syntax_Syntax.PARTIAL_RETURN  ->
                                  [FStar_Syntax_Syntax.PARTIAL_RETURN]
                              | FStar_Syntax_Syntax.CPS  ->
                                  [FStar_Syntax_Syntax.CPS]
                              | uu____9824 -> []))
                       in
                    let lc1 =
                      let uu____9826 =
                        FStar_TypeChecker_Env.norm_eff_name env
                          lc.FStar_TypeChecker_Common.eff_name
                         in
                      FStar_TypeChecker_Common.mk_lcomp uu____9826 t flags
                        strengthen
                       in
                    let g2 =
                      let uu___1220_9828 = g1  in
                      {
                        FStar_TypeChecker_Common.guard_f =
                          FStar_TypeChecker_Common.Trivial;
                        FStar_TypeChecker_Common.deferred =
                          (uu___1220_9828.FStar_TypeChecker_Common.deferred);
                        FStar_TypeChecker_Common.univ_ineqs =
                          (uu___1220_9828.FStar_TypeChecker_Common.univ_ineqs);
                        FStar_TypeChecker_Common.implicits =
                          (uu___1220_9828.FStar_TypeChecker_Common.implicits)
                      }  in
                    (e, lc1, g2)))
  
let (pure_or_ghost_pre_and_post :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      (FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option *
        FStar_Syntax_Syntax.typ))
  =
  fun env  ->
    fun comp  ->
      let mk_post_type res_t ens =
        let x = FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None res_t
           in
        let uu____9864 =
          let uu____9867 =
            let uu____9872 =
              let uu____9873 =
                let uu____9882 = FStar_Syntax_Syntax.bv_to_name x  in
                FStar_Syntax_Syntax.as_arg uu____9882  in
              [uu____9873]  in
            FStar_Syntax_Syntax.mk_Tm_app ens uu____9872  in
          uu____9867 FStar_Pervasives_Native.None
            res_t.FStar_Syntax_Syntax.pos
           in
        FStar_Syntax_Util.refine x uu____9864  in
      let norm1 t =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.Eager_unfolding;
          FStar_TypeChecker_Env.EraseUniverses] env t
         in
      let uu____9905 = FStar_Syntax_Util.is_tot_or_gtot_comp comp  in
      if uu____9905
      then
        (FStar_Pervasives_Native.None, (FStar_Syntax_Util.comp_result comp))
      else
        (match comp.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.GTotal uu____9924 -> failwith "Impossible"
         | FStar_Syntax_Syntax.Total uu____9940 -> failwith "Impossible"
         | FStar_Syntax_Syntax.Comp ct ->
             let uu____9957 =
               (FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
                  FStar_Parser_Const.effect_Pure_lid)
                 ||
                 (FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
                    FStar_Parser_Const.effect_Ghost_lid)
                in
             if uu____9957
             then
               (match ct.FStar_Syntax_Syntax.effect_args with
                | (req,uu____9973)::(ens,uu____9975)::uu____9976 ->
                    let uu____10019 =
                      let uu____10022 = norm1 req  in
                      FStar_Pervasives_Native.Some uu____10022  in
                    let uu____10023 =
                      let uu____10024 =
                        mk_post_type ct.FStar_Syntax_Syntax.result_typ ens
                         in
                      FStar_All.pipe_left norm1 uu____10024  in
                    (uu____10019, uu____10023)
                | uu____10027 ->
                    let uu____10038 =
                      let uu____10044 =
                        let uu____10046 =
                          FStar_Syntax_Print.comp_to_string comp  in
                        FStar_Util.format1
                          "Effect constructor is not fully applied; got %s"
                          uu____10046
                         in
                      (FStar_Errors.Fatal_EffectConstructorNotFullyApplied,
                        uu____10044)
                       in
                    FStar_Errors.raise_error uu____10038
                      comp.FStar_Syntax_Syntax.pos)
             else
               (let ct1 = FStar_TypeChecker_Env.unfold_effect_abbrev env comp
                   in
                match ct1.FStar_Syntax_Syntax.effect_args with
                | (wp,uu____10066)::uu____10067 ->
                    let uu____10094 =
                      let uu____10099 =
                        FStar_TypeChecker_Env.lookup_lid env
                          FStar_Parser_Const.as_requires
                         in
                      FStar_All.pipe_left FStar_Pervasives_Native.fst
                        uu____10099
                       in
                    (match uu____10094 with
                     | (us_r,uu____10131) ->
                         let uu____10132 =
                           let uu____10137 =
                             FStar_TypeChecker_Env.lookup_lid env
                               FStar_Parser_Const.as_ensures
                              in
                           FStar_All.pipe_left FStar_Pervasives_Native.fst
                             uu____10137
                            in
                         (match uu____10132 with
                          | (us_e,uu____10169) ->
                              let r =
                                (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos
                                 in
                              let as_req =
                                let uu____10172 =
                                  let uu____10173 =
                                    FStar_Ident.set_lid_range
                                      FStar_Parser_Const.as_requires r
                                     in
                                  FStar_Syntax_Syntax.fvar uu____10173
                                    FStar_Syntax_Syntax.delta_equational
                                    FStar_Pervasives_Native.None
                                   in
                                FStar_Syntax_Syntax.mk_Tm_uinst uu____10172
                                  us_r
                                 in
                              let as_ens =
                                let uu____10175 =
                                  let uu____10176 =
                                    FStar_Ident.set_lid_range
                                      FStar_Parser_Const.as_ensures r
                                     in
                                  FStar_Syntax_Syntax.fvar uu____10176
                                    FStar_Syntax_Syntax.delta_equational
                                    FStar_Pervasives_Native.None
                                   in
                                FStar_Syntax_Syntax.mk_Tm_uinst uu____10175
                                  us_e
                                 in
                              let req =
                                let uu____10180 =
                                  let uu____10185 =
                                    let uu____10186 =
                                      let uu____10197 =
                                        FStar_Syntax_Syntax.as_arg wp  in
                                      [uu____10197]  in
                                    ((ct1.FStar_Syntax_Syntax.result_typ),
                                      (FStar_Pervasives_Native.Some
                                         FStar_Syntax_Syntax.imp_tag))
                                      :: uu____10186
                                     in
                                  FStar_Syntax_Syntax.mk_Tm_app as_req
                                    uu____10185
                                   in
                                uu____10180 FStar_Pervasives_Native.None
                                  (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos
                                 in
                              let ens =
                                let uu____10237 =
                                  let uu____10242 =
                                    let uu____10243 =
                                      let uu____10254 =
                                        FStar_Syntax_Syntax.as_arg wp  in
                                      [uu____10254]  in
                                    ((ct1.FStar_Syntax_Syntax.result_typ),
                                      (FStar_Pervasives_Native.Some
                                         FStar_Syntax_Syntax.imp_tag))
                                      :: uu____10243
                                     in
                                  FStar_Syntax_Syntax.mk_Tm_app as_ens
                                    uu____10242
                                   in
                                uu____10237 FStar_Pervasives_Native.None
                                  (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos
                                 in
                              let uu____10291 =
                                let uu____10294 = norm1 req  in
                                FStar_Pervasives_Native.Some uu____10294  in
                              let uu____10295 =
                                let uu____10296 =
                                  mk_post_type
                                    ct1.FStar_Syntax_Syntax.result_typ ens
                                   in
                                norm1 uu____10296  in
                              (uu____10291, uu____10295)))
                | uu____10299 -> failwith "Impossible"))
  
let (reify_body :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.steps ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun steps  ->
      fun t  ->
        let tm = FStar_Syntax_Util.mk_reify t  in
        let tm' =
          FStar_TypeChecker_Normalize.normalize
            (FStar_List.append
               [FStar_TypeChecker_Env.Beta;
               FStar_TypeChecker_Env.Reify;
               FStar_TypeChecker_Env.Eager_unfolding;
               FStar_TypeChecker_Env.EraseUniverses;
               FStar_TypeChecker_Env.AllowUnboundUniverses;
               FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta]
               steps) env tm
           in
        (let uu____10338 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "SMTEncodingReify")
            in
         if uu____10338
         then
           let uu____10343 = FStar_Syntax_Print.term_to_string tm  in
           let uu____10345 = FStar_Syntax_Print.term_to_string tm'  in
           FStar_Util.print2 "Reified body %s \nto %s\n" uu____10343
             uu____10345
         else ());
        tm'
  
let (reify_body_with_arg :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.steps ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.arg -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun steps  ->
      fun head1  ->
        fun arg  ->
          let tm =
            FStar_Syntax_Syntax.mk
              (FStar_Syntax_Syntax.Tm_app (head1, [arg]))
              FStar_Pervasives_Native.None head1.FStar_Syntax_Syntax.pos
             in
          let tm' =
            FStar_TypeChecker_Normalize.normalize
              (FStar_List.append
                 [FStar_TypeChecker_Env.Beta;
                 FStar_TypeChecker_Env.Reify;
                 FStar_TypeChecker_Env.Eager_unfolding;
                 FStar_TypeChecker_Env.EraseUniverses;
                 FStar_TypeChecker_Env.AllowUnboundUniverses;
                 FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta]
                 steps) env tm
             in
          (let uu____10404 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "SMTEncodingReify")
              in
           if uu____10404
           then
             let uu____10409 = FStar_Syntax_Print.term_to_string tm  in
             let uu____10411 = FStar_Syntax_Print.term_to_string tm'  in
             FStar_Util.print2 "Reified body %s \nto %s\n" uu____10409
               uu____10411
           else ());
          tm'
  
let (remove_reify : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t  ->
    let uu____10422 =
      let uu____10424 =
        let uu____10425 = FStar_Syntax_Subst.compress t  in
        uu____10425.FStar_Syntax_Syntax.n  in
      match uu____10424 with
      | FStar_Syntax_Syntax.Tm_app uu____10429 -> false
      | uu____10447 -> true  in
    if uu____10422
    then t
    else
      (let uu____10452 = FStar_Syntax_Util.head_and_args t  in
       match uu____10452 with
       | (head1,args) ->
           let uu____10495 =
             let uu____10497 =
               let uu____10498 = FStar_Syntax_Subst.compress head1  in
               uu____10498.FStar_Syntax_Syntax.n  in
             match uu____10497 with
             | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify ) ->
                 true
             | uu____10503 -> false  in
           if uu____10495
           then
             (match args with
              | x::[] -> FStar_Pervasives_Native.fst x
              | uu____10535 ->
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
  fun env  ->
    fun e  ->
      fun t  ->
        let torig = FStar_Syntax_Subst.compress t  in
        if Prims.op_Negation env.FStar_TypeChecker_Env.instantiate_imp
        then (e, torig, FStar_TypeChecker_Env.trivial_guard)
        else
          ((let uu____10582 =
              FStar_TypeChecker_Env.debug env FStar_Options.High  in
            if uu____10582
            then
              let uu____10585 = FStar_Syntax_Print.term_to_string e  in
              let uu____10587 = FStar_Syntax_Print.term_to_string t  in
              let uu____10589 =
                let uu____10591 = FStar_TypeChecker_Env.expected_typ env  in
                FStar_Common.string_of_option
                  FStar_Syntax_Print.term_to_string uu____10591
                 in
              FStar_Util.print3
                "maybe_instantiate: starting check for (%s) of type (%s), expected type is %s\n"
                uu____10585 uu____10587 uu____10589
            else ());
           (let number_of_implicits t1 =
              let t2 = FStar_TypeChecker_Normalize.unfold_whnf env t1  in
              let uu____10604 = FStar_Syntax_Util.arrow_formals t2  in
              match uu____10604 with
              | (formals,uu____10620) ->
                  let n_implicits =
                    let uu____10642 =
                      FStar_All.pipe_right formals
                        (FStar_Util.prefix_until
                           (fun uu____10720  ->
                              match uu____10720 with
                              | (uu____10728,imp) ->
                                  (FStar_Option.isNone imp) ||
                                    (let uu____10735 =
                                       FStar_Syntax_Util.eq_aqual imp
                                         (FStar_Pervasives_Native.Some
                                            FStar_Syntax_Syntax.Equality)
                                        in
                                     uu____10735 = FStar_Syntax_Util.Equal)))
                       in
                    match uu____10642 with
                    | FStar_Pervasives_Native.None  ->
                        FStar_List.length formals
                    | FStar_Pervasives_Native.Some
                        (implicits,_first_explicit,_rest) ->
                        FStar_List.length implicits
                     in
                  n_implicits
               in
            let inst_n_binders t1 =
              let uu____10860 = FStar_TypeChecker_Env.expected_typ env  in
              match uu____10860 with
              | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
              | FStar_Pervasives_Native.Some expected_t ->
                  let n_expected = number_of_implicits expected_t  in
                  let n_available = number_of_implicits t1  in
                  if n_available < n_expected
                  then
                    let uu____10874 =
                      let uu____10880 =
                        let uu____10882 = FStar_Util.string_of_int n_expected
                           in
                        let uu____10884 = FStar_Syntax_Print.term_to_string e
                           in
                        let uu____10886 =
                          FStar_Util.string_of_int n_available  in
                        FStar_Util.format3
                          "Expected a term with %s implicit arguments, but %s has only %s"
                          uu____10882 uu____10884 uu____10886
                         in
                      (FStar_Errors.Fatal_MissingImplicitArguments,
                        uu____10880)
                       in
                    let uu____10890 = FStar_TypeChecker_Env.get_range env  in
                    FStar_Errors.raise_error uu____10874 uu____10890
                  else
                    FStar_Pervasives_Native.Some (n_available - n_expected)
               in
            let decr_inst uu___7_10908 =
              match uu___7_10908 with
              | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
              | FStar_Pervasives_Native.Some i ->
                  FStar_Pervasives_Native.Some (i - Prims.int_one)
               in
            let t1 = FStar_TypeChecker_Normalize.unfold_whnf env t  in
            match t1.FStar_Syntax_Syntax.n with
            | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
                let uu____10951 = FStar_Syntax_Subst.open_comp bs c  in
                (match uu____10951 with
                 | (bs1,c1) ->
                     let rec aux subst1 inst_n bs2 =
                       match (inst_n, bs2) with
                       | (FStar_Pervasives_Native.Some _11082,uu____11069)
                           when _11082 = Prims.int_zero ->
                           ([], bs2, subst1,
                             FStar_TypeChecker_Env.trivial_guard)
                       | (uu____11115,(x,FStar_Pervasives_Native.Some
                                       (FStar_Syntax_Syntax.Implicit
                                       uu____11117))::rest)
                           ->
                           let t2 =
                             FStar_Syntax_Subst.subst subst1
                               x.FStar_Syntax_Syntax.sort
                              in
                           let uu____11151 =
                             new_implicit_var
                               "Instantiation of implicit argument"
                               e.FStar_Syntax_Syntax.pos env t2
                              in
                           (match uu____11151 with
                            | (v1,uu____11192,g) ->
                                ((let uu____11207 =
                                    FStar_TypeChecker_Env.debug env
                                      FStar_Options.High
                                     in
                                  if uu____11207
                                  then
                                    let uu____11210 =
                                      FStar_Syntax_Print.term_to_string v1
                                       in
                                    FStar_Util.print1
                                      "maybe_instantiate: Instantiating implicit with %s\n"
                                      uu____11210
                                  else ());
                                 (let subst2 =
                                    (FStar_Syntax_Syntax.NT (x, v1)) ::
                                    subst1  in
                                  let uu____11220 =
                                    aux subst2 (decr_inst inst_n) rest  in
                                  match uu____11220 with
                                  | (args,bs3,subst3,g') ->
                                      let uu____11313 =
                                        FStar_TypeChecker_Env.conj_guard g g'
                                         in
                                      (((v1,
                                          (FStar_Pervasives_Native.Some
                                             FStar_Syntax_Syntax.imp_tag)) ::
                                        args), bs3, subst3, uu____11313))))
                       | (uu____11340,(x,FStar_Pervasives_Native.Some
                                       (FStar_Syntax_Syntax.Meta tau))::rest)
                           ->
                           let t2 =
                             FStar_Syntax_Subst.subst subst1
                               x.FStar_Syntax_Syntax.sort
                              in
                           let uu____11377 =
                             let uu____11390 =
                               let uu____11397 =
                                 let uu____11402 = FStar_Dyn.mkdyn env  in
                                 (uu____11402, tau)  in
                               FStar_Pervasives_Native.Some uu____11397  in
                             FStar_TypeChecker_Env.new_implicit_var_aux
                               "Instantiation of meta argument"
                               e.FStar_Syntax_Syntax.pos env t2
                               FStar_Syntax_Syntax.Strict uu____11390
                              in
                           (match uu____11377 with
                            | (v1,uu____11435,g) ->
                                ((let uu____11450 =
                                    FStar_TypeChecker_Env.debug env
                                      FStar_Options.High
                                     in
                                  if uu____11450
                                  then
                                    let uu____11453 =
                                      FStar_Syntax_Print.term_to_string v1
                                       in
                                    FStar_Util.print1
                                      "maybe_instantiate: Instantiating meta argument with %s\n"
                                      uu____11453
                                  else ());
                                 (let subst2 =
                                    (FStar_Syntax_Syntax.NT (x, v1)) ::
                                    subst1  in
                                  let uu____11463 =
                                    aux subst2 (decr_inst inst_n) rest  in
                                  match uu____11463 with
                                  | (args,bs3,subst3,g') ->
                                      let uu____11556 =
                                        FStar_TypeChecker_Env.conj_guard g g'
                                         in
                                      (((v1,
                                          (FStar_Pervasives_Native.Some
                                             FStar_Syntax_Syntax.imp_tag)) ::
                                        args), bs3, subst3, uu____11556))))
                       | (uu____11583,bs3) ->
                           ([], bs3, subst1,
                             FStar_TypeChecker_Env.trivial_guard)
                        in
                     let uu____11631 =
                       let uu____11658 = inst_n_binders t1  in
                       aux [] uu____11658 bs1  in
                     (match uu____11631 with
                      | (args,bs2,subst1,guard) ->
                          (match (args, bs2) with
                           | ([],uu____11730) -> (e, torig, guard)
                           | (uu____11761,[]) when
                               let uu____11792 =
                                 FStar_Syntax_Util.is_total_comp c1  in
                               Prims.op_Negation uu____11792 ->
                               (e, torig,
                                 FStar_TypeChecker_Env.trivial_guard)
                           | uu____11794 ->
                               let t2 =
                                 match bs2 with
                                 | [] -> FStar_Syntax_Util.comp_result c1
                                 | uu____11822 ->
                                     FStar_Syntax_Util.arrow bs2 c1
                                  in
                               let t3 = FStar_Syntax_Subst.subst subst1 t2
                                  in
                               let e1 =
                                 FStar_Syntax_Syntax.mk_Tm_app e args
                                   FStar_Pervasives_Native.None
                                   e.FStar_Syntax_Syntax.pos
                                  in
                               (e1, t3, guard))))
            | uu____11835 -> (e, torig, FStar_TypeChecker_Env.trivial_guard)))
  
let (string_of_univs :
  FStar_Syntax_Syntax.universe_uvar FStar_Util.set -> Prims.string) =
  fun univs1  ->
    let uu____11847 =
      let uu____11851 = FStar_Util.set_elements univs1  in
      FStar_All.pipe_right uu____11851
        (FStar_List.map
           (fun u  ->
              let uu____11863 = FStar_Syntax_Unionfind.univ_uvar_id u  in
              FStar_All.pipe_right uu____11863 FStar_Util.string_of_int))
       in
    FStar_All.pipe_right uu____11847 (FStar_String.concat ", ")
  
let (gen_univs :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe_uvar FStar_Util.set ->
      FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun env  ->
    fun x  ->
      let uu____11891 = FStar_Util.set_is_empty x  in
      if uu____11891
      then []
      else
        (let s =
           let uu____11909 =
             let uu____11912 = FStar_TypeChecker_Env.univ_vars env  in
             FStar_Util.set_difference x uu____11912  in
           FStar_All.pipe_right uu____11909 FStar_Util.set_elements  in
         (let uu____11928 =
            FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
              (FStar_Options.Other "Gen")
             in
          if uu____11928
          then
            let uu____11933 =
              let uu____11935 = FStar_TypeChecker_Env.univ_vars env  in
              string_of_univs uu____11935  in
            FStar_Util.print1 "univ_vars in env: %s\n" uu____11933
          else ());
         (let r =
            let uu____11944 = FStar_TypeChecker_Env.get_range env  in
            FStar_Pervasives_Native.Some uu____11944  in
          let u_names =
            FStar_All.pipe_right s
              (FStar_List.map
                 (fun u  ->
                    let u_name = FStar_Syntax_Syntax.new_univ_name r  in
                    (let uu____11983 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "Gen")
                        in
                     if uu____11983
                     then
                       let uu____11988 =
                         let uu____11990 =
                           FStar_Syntax_Unionfind.univ_uvar_id u  in
                         FStar_All.pipe_left FStar_Util.string_of_int
                           uu____11990
                          in
                       let uu____11994 =
                         FStar_Syntax_Print.univ_to_string
                           (FStar_Syntax_Syntax.U_unif u)
                          in
                       let uu____11996 =
                         FStar_Syntax_Print.univ_to_string
                           (FStar_Syntax_Syntax.U_name u_name)
                          in
                       FStar_Util.print3 "Setting ?%s (%s) to %s\n"
                         uu____11988 uu____11994 uu____11996
                     else ());
                    FStar_Syntax_Unionfind.univ_change u
                      (FStar_Syntax_Syntax.U_name u_name);
                    u_name))
             in
          u_names))
  
let (gather_free_univnames :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun env  ->
    fun t  ->
      let ctx_univnames = FStar_TypeChecker_Env.univnames env  in
      let tm_univnames = FStar_Syntax_Free.univnames t  in
      let univnames1 =
        let uu____12026 =
          FStar_Util.set_difference tm_univnames ctx_univnames  in
        FStar_All.pipe_right uu____12026 FStar_Util.set_elements  in
      univnames1
  
let (check_universe_generalization :
  FStar_Syntax_Syntax.univ_name Prims.list ->
    FStar_Syntax_Syntax.univ_name Prims.list ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun explicit_univ_names  ->
    fun generalized_univ_names  ->
      fun t  ->
        match (explicit_univ_names, generalized_univ_names) with
        | ([],uu____12065) -> generalized_univ_names
        | (uu____12072,[]) -> explicit_univ_names
        | uu____12079 ->
            let uu____12088 =
              let uu____12094 =
                let uu____12096 = FStar_Syntax_Print.term_to_string t  in
                Prims.op_Hat
                  "Generalized universe in a term containing explicit universe annotation : "
                  uu____12096
                 in
              (FStar_Errors.Fatal_UnexpectedGeneralizedUniverse, uu____12094)
               in
            FStar_Errors.raise_error uu____12088 t.FStar_Syntax_Syntax.pos
  
let (generalize_universes :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.tscheme)
  =
  fun env  ->
    fun t0  ->
      let t =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.NoFullNorm;
          FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.DoNotUnfoldPureLets] env t0
         in
      let univnames1 = gather_free_univnames env t  in
      (let uu____12118 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "Gen")
          in
       if uu____12118
       then
         let uu____12123 = FStar_Syntax_Print.term_to_string t  in
         let uu____12125 = FStar_Syntax_Print.univ_names_to_string univnames1
            in
         FStar_Util.print2
           "generalizing universes in the term (post norm): %s with univnames: %s\n"
           uu____12123 uu____12125
       else ());
      (let univs1 = FStar_Syntax_Free.univs t  in
       (let uu____12134 =
          FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
            (FStar_Options.Other "Gen")
           in
        if uu____12134
        then
          let uu____12139 = string_of_univs univs1  in
          FStar_Util.print1 "univs to gen : %s\n" uu____12139
        else ());
       (let gen1 = gen_univs env univs1  in
        (let uu____12148 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Gen")
            in
         if uu____12148
         then
           let uu____12153 = FStar_Syntax_Print.term_to_string t  in
           let uu____12155 = FStar_Syntax_Print.univ_names_to_string gen1  in
           FStar_Util.print2 "After generalization, t: %s and univs: %s\n"
             uu____12153 uu____12155
         else ());
        (let univs2 = check_universe_generalization univnames1 gen1 t0  in
         let t1 = FStar_TypeChecker_Normalize.reduce_uvar_solutions env t  in
         let ts = FStar_Syntax_Subst.close_univ_vars univs2 t1  in
         (univs2, ts))))
  
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
  fun env  ->
    fun is_rec  ->
      fun lecs  ->
        let uu____12239 =
          let uu____12241 =
            FStar_Util.for_all
              (fun uu____12255  ->
                 match uu____12255 with
                 | (uu____12265,uu____12266,c) ->
                     FStar_Syntax_Util.is_pure_or_ghost_comp c) lecs
             in
          FStar_All.pipe_left Prims.op_Negation uu____12241  in
        if uu____12239
        then FStar_Pervasives_Native.None
        else
          (let norm1 c =
             (let uu____12318 =
                FStar_TypeChecker_Env.debug env FStar_Options.Medium  in
              if uu____12318
              then
                let uu____12321 = FStar_Syntax_Print.comp_to_string c  in
                FStar_Util.print1 "Normalizing before generalizing:\n\t %s\n"
                  uu____12321
              else ());
             (let c1 =
                FStar_TypeChecker_Normalize.normalize_comp
                  [FStar_TypeChecker_Env.Beta;
                  FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta;
                  FStar_TypeChecker_Env.NoFullNorm;
                  FStar_TypeChecker_Env.DoNotUnfoldPureLets] env c
                 in
              (let uu____12328 =
                 FStar_TypeChecker_Env.debug env FStar_Options.Medium  in
               if uu____12328
               then
                 let uu____12331 = FStar_Syntax_Print.comp_to_string c1  in
                 FStar_Util.print1 "Normalized to:\n\t %s\n" uu____12331
               else ());
              c1)
              in
           let env_uvars = FStar_TypeChecker_Env.uvars_in_env env  in
           let gen_uvars uvs =
             let uu____12349 = FStar_Util.set_difference uvs env_uvars  in
             FStar_All.pipe_right uu____12349 FStar_Util.set_elements  in
           let univs_and_uvars_of_lec uu____12383 =
             match uu____12383 with
             | (lbname,e,c) ->
                 let c1 = norm1 c  in
                 let t = FStar_Syntax_Util.comp_result c1  in
                 let univs1 = FStar_Syntax_Free.univs t  in
                 let uvt = FStar_Syntax_Free.uvars t  in
                 ((let uu____12420 =
                     FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                       (FStar_Options.Other "Gen")
                      in
                   if uu____12420
                   then
                     let uu____12425 =
                       let uu____12427 =
                         let uu____12431 = FStar_Util.set_elements univs1  in
                         FStar_All.pipe_right uu____12431
                           (FStar_List.map
                              (fun u  ->
                                 FStar_Syntax_Print.univ_to_string
                                   (FStar_Syntax_Syntax.U_unif u)))
                          in
                       FStar_All.pipe_right uu____12427
                         (FStar_String.concat ", ")
                        in
                     let uu____12479 =
                       let uu____12481 =
                         let uu____12485 = FStar_Util.set_elements uvt  in
                         FStar_All.pipe_right uu____12485
                           (FStar_List.map
                              (fun u  ->
                                 let uu____12498 =
                                   FStar_Syntax_Print.uvar_to_string
                                     u.FStar_Syntax_Syntax.ctx_uvar_head
                                    in
                                 let uu____12500 =
                                   FStar_Syntax_Print.term_to_string
                                     u.FStar_Syntax_Syntax.ctx_uvar_typ
                                    in
                                 FStar_Util.format2 "(%s : %s)" uu____12498
                                   uu____12500))
                          in
                       FStar_All.pipe_right uu____12481
                         (FStar_String.concat ", ")
                        in
                     FStar_Util.print2
                       "^^^^\n\tFree univs = %s\n\tFree uvt=%s\n" uu____12425
                       uu____12479
                   else ());
                  (let univs2 =
                     let uu____12514 = FStar_Util.set_elements uvt  in
                     FStar_List.fold_left
                       (fun univs2  ->
                          fun uv  ->
                            let uu____12526 =
                              FStar_Syntax_Free.univs
                                uv.FStar_Syntax_Syntax.ctx_uvar_typ
                               in
                            FStar_Util.set_union univs2 uu____12526) univs1
                       uu____12514
                      in
                   let uvs = gen_uvars uvt  in
                   (let uu____12533 =
                      FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                        (FStar_Options.Other "Gen")
                       in
                    if uu____12533
                    then
                      let uu____12538 =
                        let uu____12540 =
                          let uu____12544 = FStar_Util.set_elements univs2
                             in
                          FStar_All.pipe_right uu____12544
                            (FStar_List.map
                               (fun u  ->
                                  FStar_Syntax_Print.univ_to_string
                                    (FStar_Syntax_Syntax.U_unif u)))
                           in
                        FStar_All.pipe_right uu____12540
                          (FStar_String.concat ", ")
                         in
                      let uu____12592 =
                        let uu____12594 =
                          FStar_All.pipe_right uvs
                            (FStar_List.map
                               (fun u  ->
                                  let uu____12608 =
                                    FStar_Syntax_Print.uvar_to_string
                                      u.FStar_Syntax_Syntax.ctx_uvar_head
                                     in
                                  let uu____12610 =
                                    FStar_TypeChecker_Normalize.term_to_string
                                      env u.FStar_Syntax_Syntax.ctx_uvar_typ
                                     in
                                  FStar_Util.format2 "(%s : %s)" uu____12608
                                    uu____12610))
                           in
                        FStar_All.pipe_right uu____12594
                          (FStar_String.concat ", ")
                         in
                      FStar_Util.print2
                        "^^^^\n\tFree univs = %s\n\tgen_uvars =%s"
                        uu____12538 uu____12592
                    else ());
                   (univs2, uvs, (lbname, e, c1))))
              in
           let uu____12631 =
             let uu____12648 = FStar_List.hd lecs  in
             univs_and_uvars_of_lec uu____12648  in
           match uu____12631 with
           | (univs1,uvs,lec_hd) ->
               let force_univs_eq lec2 u1 u2 =
                 let uu____12738 =
                   (FStar_Util.set_is_subset_of u1 u2) &&
                     (FStar_Util.set_is_subset_of u2 u1)
                    in
                 if uu____12738
                 then ()
                 else
                   (let uu____12743 = lec_hd  in
                    match uu____12743 with
                    | (lb1,uu____12751,uu____12752) ->
                        let uu____12753 = lec2  in
                        (match uu____12753 with
                         | (lb2,uu____12761,uu____12762) ->
                             let msg =
                               let uu____12765 =
                                 FStar_Syntax_Print.lbname_to_string lb1  in
                               let uu____12767 =
                                 FStar_Syntax_Print.lbname_to_string lb2  in
                               FStar_Util.format2
                                 "Generalizing the types of these mutually recursive definitions requires an incompatible set of universes for %s and %s"
                                 uu____12765 uu____12767
                                in
                             let uu____12770 =
                               FStar_TypeChecker_Env.get_range env  in
                             FStar_Errors.raise_error
                               (FStar_Errors.Fatal_IncompatibleSetOfUniverse,
                                 msg) uu____12770))
                  in
               let force_uvars_eq lec2 u1 u2 =
                 let uvars_subseteq u11 u21 =
                   FStar_All.pipe_right u11
                     (FStar_Util.for_all
                        (fun u  ->
                           FStar_All.pipe_right u21
                             (FStar_Util.for_some
                                (fun u'  ->
                                   FStar_Syntax_Unionfind.equiv
                                     u.FStar_Syntax_Syntax.ctx_uvar_head
                                     u'.FStar_Syntax_Syntax.ctx_uvar_head))))
                    in
                 let uu____12838 =
                   (uvars_subseteq u1 u2) && (uvars_subseteq u2 u1)  in
                 if uu____12838
                 then ()
                 else
                   (let uu____12843 = lec_hd  in
                    match uu____12843 with
                    | (lb1,uu____12851,uu____12852) ->
                        let uu____12853 = lec2  in
                        (match uu____12853 with
                         | (lb2,uu____12861,uu____12862) ->
                             let msg =
                               let uu____12865 =
                                 FStar_Syntax_Print.lbname_to_string lb1  in
                               let uu____12867 =
                                 FStar_Syntax_Print.lbname_to_string lb2  in
                               FStar_Util.format2
                                 "Generalizing the types of these mutually recursive definitions requires an incompatible number of types for %s and %s"
                                 uu____12865 uu____12867
                                in
                             let uu____12870 =
                               FStar_TypeChecker_Env.get_range env  in
                             FStar_Errors.raise_error
                               (FStar_Errors.Fatal_IncompatibleNumberOfTypes,
                                 msg) uu____12870))
                  in
               let lecs1 =
                 let uu____12881 = FStar_List.tl lecs  in
                 FStar_List.fold_right
                   (fun this_lec  ->
                      fun lecs1  ->
                        let uu____12934 = univs_and_uvars_of_lec this_lec  in
                        match uu____12934 with
                        | (this_univs,this_uvs,this_lec1) ->
                            (force_univs_eq this_lec1 univs1 this_univs;
                             force_uvars_eq this_lec1 uvs this_uvs;
                             this_lec1
                             ::
                             lecs1)) uu____12881 []
                  in
               let lecs2 = lec_hd :: lecs1  in
               let gen_types uvs1 =
                 let fail1 k =
                   let uu____13039 = lec_hd  in
                   match uu____13039 with
                   | (lbname,e,c) ->
                       let uu____13049 =
                         let uu____13055 =
                           let uu____13057 =
                             FStar_Syntax_Print.term_to_string k  in
                           let uu____13059 =
                             FStar_Syntax_Print.lbname_to_string lbname  in
                           let uu____13061 =
                             FStar_Syntax_Print.term_to_string
                               (FStar_Syntax_Util.comp_result c)
                              in
                           FStar_Util.format3
                             "Failed to resolve implicit argument of type '%s' in the type of %s (%s)"
                             uu____13057 uu____13059 uu____13061
                            in
                         (FStar_Errors.Fatal_FailToResolveImplicitArgument,
                           uu____13055)
                          in
                       let uu____13065 = FStar_TypeChecker_Env.get_range env
                          in
                       FStar_Errors.raise_error uu____13049 uu____13065
                    in
                 FStar_All.pipe_right uvs1
                   (FStar_List.map
                      (fun u  ->
                         let uu____13084 =
                           FStar_Syntax_Unionfind.find
                             u.FStar_Syntax_Syntax.ctx_uvar_head
                            in
                         match uu____13084 with
                         | FStar_Pervasives_Native.Some uu____13093 ->
                             failwith
                               "Unexpected instantiation of mutually recursive uvar"
                         | uu____13101 ->
                             let k =
                               FStar_TypeChecker_Normalize.normalize
                                 [FStar_TypeChecker_Env.Beta;
                                 FStar_TypeChecker_Env.Exclude
                                   FStar_TypeChecker_Env.Zeta] env
                                 u.FStar_Syntax_Syntax.ctx_uvar_typ
                                in
                             let uu____13105 =
                               FStar_Syntax_Util.arrow_formals k  in
                             (match uu____13105 with
                              | (bs,kres) ->
                                  ((let uu____13149 =
                                      let uu____13150 =
                                        let uu____13153 =
                                          FStar_TypeChecker_Normalize.unfold_whnf
                                            env kres
                                           in
                                        FStar_Syntax_Util.unrefine
                                          uu____13153
                                         in
                                      uu____13150.FStar_Syntax_Syntax.n  in
                                    match uu____13149 with
                                    | FStar_Syntax_Syntax.Tm_type uu____13154
                                        ->
                                        let free =
                                          FStar_Syntax_Free.names kres  in
                                        let uu____13158 =
                                          let uu____13160 =
                                            FStar_Util.set_is_empty free  in
                                          Prims.op_Negation uu____13160  in
                                        if uu____13158
                                        then fail1 kres
                                        else ()
                                    | uu____13165 -> fail1 kres);
                                   (let a =
                                      let uu____13167 =
                                        let uu____13170 =
                                          FStar_TypeChecker_Env.get_range env
                                           in
                                        FStar_All.pipe_left
                                          (fun _13173  ->
                                             FStar_Pervasives_Native.Some
                                               _13173) uu____13170
                                         in
                                      FStar_Syntax_Syntax.new_bv uu____13167
                                        kres
                                       in
                                    let t =
                                      match bs with
                                      | [] ->
                                          FStar_Syntax_Syntax.bv_to_name a
                                      | uu____13181 ->
                                          let uu____13190 =
                                            FStar_Syntax_Syntax.bv_to_name a
                                             in
                                          FStar_Syntax_Util.abs bs
                                            uu____13190
                                            (FStar_Pervasives_Native.Some
                                               (FStar_Syntax_Util.residual_tot
                                                  kres))
                                       in
                                    FStar_Syntax_Util.set_uvar
                                      u.FStar_Syntax_Syntax.ctx_uvar_head t;
                                    (a,
                                      (FStar_Pervasives_Native.Some
                                         FStar_Syntax_Syntax.imp_tag)))))))
                  in
               let gen_univs1 = gen_univs env univs1  in
               let gen_tvars = gen_types uvs  in
               let ecs =
                 FStar_All.pipe_right lecs2
                   (FStar_List.map
                      (fun uu____13293  ->
                         match uu____13293 with
                         | (lbname,e,c) ->
                             let uu____13339 =
                               match (gen_tvars, gen_univs1) with
                               | ([],[]) -> (e, c, [])
                               | uu____13400 ->
                                   let uu____13413 = (e, c)  in
                                   (match uu____13413 with
                                    | (e0,c0) ->
                                        let c1 =
                                          FStar_TypeChecker_Normalize.normalize_comp
                                            [FStar_TypeChecker_Env.Beta;
                                            FStar_TypeChecker_Env.DoNotUnfoldPureLets;
                                            FStar_TypeChecker_Env.CompressUvars;
                                            FStar_TypeChecker_Env.NoFullNorm;
                                            FStar_TypeChecker_Env.Exclude
                                              FStar_TypeChecker_Env.Zeta] env
                                            c
                                           in
                                        let e1 =
                                          FStar_TypeChecker_Normalize.reduce_uvar_solutions
                                            env e
                                           in
                                        let e2 =
                                          if is_rec
                                          then
                                            let tvar_args =
                                              FStar_List.map
                                                (fun uu____13453  ->
                                                   match uu____13453 with
                                                   | (x,uu____13459) ->
                                                       let uu____13460 =
                                                         FStar_Syntax_Syntax.bv_to_name
                                                           x
                                                          in
                                                       FStar_Syntax_Syntax.iarg
                                                         uu____13460)
                                                gen_tvars
                                               in
                                            let instantiate_lbname_with_app
                                              tm fv =
                                              let uu____13478 =
                                                let uu____13480 =
                                                  FStar_Util.right lbname  in
                                                FStar_Syntax_Syntax.fv_eq fv
                                                  uu____13480
                                                 in
                                              if uu____13478
                                              then
                                                FStar_Syntax_Syntax.mk_Tm_app
                                                  tm tvar_args
                                                  FStar_Pervasives_Native.None
                                                  tm.FStar_Syntax_Syntax.pos
                                              else tm  in
                                            FStar_Syntax_InstFV.inst
                                              instantiate_lbname_with_app e1
                                          else e1  in
                                        let t =
                                          let uu____13489 =
                                            let uu____13490 =
                                              FStar_Syntax_Subst.compress
                                                (FStar_Syntax_Util.comp_result
                                                   c1)
                                               in
                                            uu____13490.FStar_Syntax_Syntax.n
                                             in
                                          match uu____13489 with
                                          | FStar_Syntax_Syntax.Tm_arrow
                                              (bs,cod) ->
                                              let uu____13515 =
                                                FStar_Syntax_Subst.open_comp
                                                  bs cod
                                                 in
                                              (match uu____13515 with
                                               | (bs1,cod1) ->
                                                   FStar_Syntax_Util.arrow
                                                     (FStar_List.append
                                                        gen_tvars bs1) cod1)
                                          | uu____13526 ->
                                              FStar_Syntax_Util.arrow
                                                gen_tvars c1
                                           in
                                        let e' =
                                          FStar_Syntax_Util.abs gen_tvars e2
                                            (FStar_Pervasives_Native.Some
                                               (FStar_Syntax_Util.residual_comp_of_comp
                                                  c1))
                                           in
                                        let uu____13530 =
                                          FStar_Syntax_Syntax.mk_Total t  in
                                        (e', uu____13530, gen_tvars))
                                in
                             (match uu____13339 with
                              | (e1,c1,gvs) ->
                                  (lbname, gen_univs1, e1, c1, gvs))))
                  in
               FStar_Pervasives_Native.Some ecs)
  
let (generalize :
  FStar_TypeChecker_Env.env ->
    Prims.bool ->
      (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.term *
        FStar_Syntax_Syntax.comp) Prims.list ->
        (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.univ_names *
          FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.comp *
          FStar_Syntax_Syntax.binder Prims.list) Prims.list)
  =
  fun env  ->
    fun is_rec  ->
      fun lecs  ->
        (let uu____13677 = FStar_TypeChecker_Env.debug env FStar_Options.Low
            in
         if uu____13677
         then
           let uu____13680 =
             let uu____13682 =
               FStar_List.map
                 (fun uu____13697  ->
                    match uu____13697 with
                    | (lb,uu____13706,uu____13707) ->
                        FStar_Syntax_Print.lbname_to_string lb) lecs
                in
             FStar_All.pipe_right uu____13682 (FStar_String.concat ", ")  in
           FStar_Util.print1 "Generalizing: %s\n" uu____13680
         else ());
        (let univnames_lecs =
           FStar_List.map
             (fun uu____13733  ->
                match uu____13733 with
                | (l,t,c) -> gather_free_univnames env t) lecs
            in
         let generalized_lecs =
           let uu____13762 = gen env is_rec lecs  in
           match uu____13762 with
           | FStar_Pervasives_Native.None  ->
               FStar_All.pipe_right lecs
                 (FStar_List.map
                    (fun uu____13861  ->
                       match uu____13861 with | (l,t,c) -> (l, [], t, c, [])))
           | FStar_Pervasives_Native.Some luecs ->
               ((let uu____13923 =
                   FStar_TypeChecker_Env.debug env FStar_Options.Medium  in
                 if uu____13923
                 then
                   FStar_All.pipe_right luecs
                     (FStar_List.iter
                        (fun uu____13971  ->
                           match uu____13971 with
                           | (l,us,e,c,gvs) ->
                               let uu____14005 =
                                 FStar_Range.string_of_range
                                   e.FStar_Syntax_Syntax.pos
                                  in
                               let uu____14007 =
                                 FStar_Syntax_Print.lbname_to_string l  in
                               let uu____14009 =
                                 FStar_Syntax_Print.term_to_string
                                   (FStar_Syntax_Util.comp_result c)
                                  in
                               let uu____14011 =
                                 FStar_Syntax_Print.term_to_string e  in
                               let uu____14013 =
                                 FStar_Syntax_Print.binders_to_string ", "
                                   gvs
                                  in
                               FStar_Util.print5
                                 "(%s) Generalized %s at type %s\n%s\nVars = (%s)\n"
                                 uu____14005 uu____14007 uu____14009
                                 uu____14011 uu____14013))
                 else ());
                luecs)
            in
         FStar_List.map2
           (fun univnames1  ->
              fun uu____14058  ->
                match uu____14058 with
                | (l,generalized_univs,t,c,gvs) ->
                    let uu____14102 =
                      check_universe_generalization univnames1
                        generalized_univs t
                       in
                    (l, uu____14102, t, c, gvs)) univnames_lecs
           generalized_lecs)
  
let (check_and_ascribe :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun e  ->
      fun t1  ->
        fun t2  ->
          let env1 =
            FStar_TypeChecker_Env.set_range env e.FStar_Syntax_Syntax.pos  in
          let check1 env2 t11 t21 =
            if env2.FStar_TypeChecker_Env.use_eq
            then FStar_TypeChecker_Rel.try_teq true env2 t11 t21
            else
              (let uu____14163 =
                 FStar_TypeChecker_Rel.get_subtyping_predicate env2 t11 t21
                  in
               match uu____14163 with
               | FStar_Pervasives_Native.None  ->
                   FStar_Pervasives_Native.None
               | FStar_Pervasives_Native.Some f ->
                   let uu____14169 = FStar_TypeChecker_Env.apply_guard f e
                      in
                   FStar_All.pipe_left
                     (fun _14172  -> FStar_Pervasives_Native.Some _14172)
                     uu____14169)
             in
          let is_var e1 =
            let uu____14180 =
              let uu____14181 = FStar_Syntax_Subst.compress e1  in
              uu____14181.FStar_Syntax_Syntax.n  in
            match uu____14180 with
            | FStar_Syntax_Syntax.Tm_name uu____14185 -> true
            | uu____14187 -> false  in
          let decorate e1 t =
            let e2 = FStar_Syntax_Subst.compress e1  in
            match e2.FStar_Syntax_Syntax.n with
            | FStar_Syntax_Syntax.Tm_name x ->
                FStar_Syntax_Syntax.mk
                  (FStar_Syntax_Syntax.Tm_name
                     (let uu___1678_14208 = x  in
                      {
                        FStar_Syntax_Syntax.ppname =
                          (uu___1678_14208.FStar_Syntax_Syntax.ppname);
                        FStar_Syntax_Syntax.index =
                          (uu___1678_14208.FStar_Syntax_Syntax.index);
                        FStar_Syntax_Syntax.sort = t2
                      })) FStar_Pervasives_Native.None
                  e2.FStar_Syntax_Syntax.pos
            | uu____14209 -> e2  in
          let env2 =
            let uu___1681_14211 = env1  in
            {
              FStar_TypeChecker_Env.solver =
                (uu___1681_14211.FStar_TypeChecker_Env.solver);
              FStar_TypeChecker_Env.range =
                (uu___1681_14211.FStar_TypeChecker_Env.range);
              FStar_TypeChecker_Env.curmodule =
                (uu___1681_14211.FStar_TypeChecker_Env.curmodule);
              FStar_TypeChecker_Env.gamma =
                (uu___1681_14211.FStar_TypeChecker_Env.gamma);
              FStar_TypeChecker_Env.gamma_sig =
                (uu___1681_14211.FStar_TypeChecker_Env.gamma_sig);
              FStar_TypeChecker_Env.gamma_cache =
                (uu___1681_14211.FStar_TypeChecker_Env.gamma_cache);
              FStar_TypeChecker_Env.modules =
                (uu___1681_14211.FStar_TypeChecker_Env.modules);
              FStar_TypeChecker_Env.expected_typ =
                (uu___1681_14211.FStar_TypeChecker_Env.expected_typ);
              FStar_TypeChecker_Env.sigtab =
                (uu___1681_14211.FStar_TypeChecker_Env.sigtab);
              FStar_TypeChecker_Env.attrtab =
                (uu___1681_14211.FStar_TypeChecker_Env.attrtab);
              FStar_TypeChecker_Env.instantiate_imp =
                (uu___1681_14211.FStar_TypeChecker_Env.instantiate_imp);
              FStar_TypeChecker_Env.effects =
                (uu___1681_14211.FStar_TypeChecker_Env.effects);
              FStar_TypeChecker_Env.generalize =
                (uu___1681_14211.FStar_TypeChecker_Env.generalize);
              FStar_TypeChecker_Env.letrecs =
                (uu___1681_14211.FStar_TypeChecker_Env.letrecs);
              FStar_TypeChecker_Env.top_level =
                (uu___1681_14211.FStar_TypeChecker_Env.top_level);
              FStar_TypeChecker_Env.check_uvars =
                (uu___1681_14211.FStar_TypeChecker_Env.check_uvars);
              FStar_TypeChecker_Env.use_eq =
                (env1.FStar_TypeChecker_Env.use_eq);
              FStar_TypeChecker_Env.is_iface =
                (uu___1681_14211.FStar_TypeChecker_Env.is_iface);
              FStar_TypeChecker_Env.admit =
                (uu___1681_14211.FStar_TypeChecker_Env.admit);
              FStar_TypeChecker_Env.lax =
                (uu___1681_14211.FStar_TypeChecker_Env.lax);
              FStar_TypeChecker_Env.lax_universes =
                (uu___1681_14211.FStar_TypeChecker_Env.lax_universes);
              FStar_TypeChecker_Env.phase1 =
                (uu___1681_14211.FStar_TypeChecker_Env.phase1);
              FStar_TypeChecker_Env.failhard =
                (uu___1681_14211.FStar_TypeChecker_Env.failhard);
              FStar_TypeChecker_Env.nosynth =
                (uu___1681_14211.FStar_TypeChecker_Env.nosynth);
              FStar_TypeChecker_Env.uvar_subtyping =
                (uu___1681_14211.FStar_TypeChecker_Env.uvar_subtyping);
              FStar_TypeChecker_Env.tc_term =
                (uu___1681_14211.FStar_TypeChecker_Env.tc_term);
              FStar_TypeChecker_Env.type_of =
                (uu___1681_14211.FStar_TypeChecker_Env.type_of);
              FStar_TypeChecker_Env.universe_of =
                (uu___1681_14211.FStar_TypeChecker_Env.universe_of);
              FStar_TypeChecker_Env.check_type_of =
                (uu___1681_14211.FStar_TypeChecker_Env.check_type_of);
              FStar_TypeChecker_Env.use_bv_sorts =
                (uu___1681_14211.FStar_TypeChecker_Env.use_bv_sorts);
              FStar_TypeChecker_Env.qtbl_name_and_index =
                (uu___1681_14211.FStar_TypeChecker_Env.qtbl_name_and_index);
              FStar_TypeChecker_Env.normalized_eff_names =
                (uu___1681_14211.FStar_TypeChecker_Env.normalized_eff_names);
              FStar_TypeChecker_Env.fv_delta_depths =
                (uu___1681_14211.FStar_TypeChecker_Env.fv_delta_depths);
              FStar_TypeChecker_Env.proof_ns =
                (uu___1681_14211.FStar_TypeChecker_Env.proof_ns);
              FStar_TypeChecker_Env.synth_hook =
                (uu___1681_14211.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.try_solve_implicits_hook =
                (uu___1681_14211.FStar_TypeChecker_Env.try_solve_implicits_hook);
              FStar_TypeChecker_Env.splice =
                (uu___1681_14211.FStar_TypeChecker_Env.splice);
              FStar_TypeChecker_Env.mpreprocess =
                (uu___1681_14211.FStar_TypeChecker_Env.mpreprocess);
              FStar_TypeChecker_Env.postprocess =
                (uu___1681_14211.FStar_TypeChecker_Env.postprocess);
              FStar_TypeChecker_Env.is_native_tactic =
                (uu___1681_14211.FStar_TypeChecker_Env.is_native_tactic);
              FStar_TypeChecker_Env.identifier_info =
                (uu___1681_14211.FStar_TypeChecker_Env.identifier_info);
              FStar_TypeChecker_Env.tc_hooks =
                (uu___1681_14211.FStar_TypeChecker_Env.tc_hooks);
              FStar_TypeChecker_Env.dsenv =
                (uu___1681_14211.FStar_TypeChecker_Env.dsenv);
              FStar_TypeChecker_Env.nbe =
                (uu___1681_14211.FStar_TypeChecker_Env.nbe);
              FStar_TypeChecker_Env.strict_args_tab =
                (uu___1681_14211.FStar_TypeChecker_Env.strict_args_tab);
              FStar_TypeChecker_Env.erasable_types_tab =
                (uu___1681_14211.FStar_TypeChecker_Env.erasable_types_tab)
            }  in
          let uu____14212 = maybe_coerce env2 e t1 t2  in
          match uu____14212 with
          | (e1,t11) ->
              let uu____14223 = check1 env2 t11 t2  in
              (match uu____14223 with
               | FStar_Pervasives_Native.None  ->
                   let uu____14230 =
                     FStar_TypeChecker_Err.expected_expression_of_type env2
                       t2 e1 t11
                      in
                   let uu____14236 = FStar_TypeChecker_Env.get_range env2  in
                   FStar_Errors.raise_error uu____14230 uu____14236
               | FStar_Pervasives_Native.Some g ->
                   ((let uu____14243 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env2)
                         (FStar_Options.Other "Rel")
                        in
                     if uu____14243
                     then
                       let uu____14248 =
                         FStar_TypeChecker_Rel.guard_to_string env2 g  in
                       FStar_All.pipe_left
                         (FStar_Util.print1 "Applied guard is %s\n")
                         uu____14248
                     else ());
                    (let uu____14254 = decorate e1 t2  in (uu____14254, g))))
  
let (check_top_level :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.guard_t ->
      FStar_TypeChecker_Common.lcomp ->
        (Prims.bool * FStar_Syntax_Syntax.comp))
  =
  fun env  ->
    fun g  ->
      fun lc  ->
        (let uu____14282 = FStar_TypeChecker_Env.debug env FStar_Options.Low
            in
         if uu____14282
         then
           let uu____14285 = FStar_TypeChecker_Common.lcomp_to_string lc  in
           FStar_Util.print1 "check_top_level, lc = %s\n" uu____14285
         else ());
        (let discharge g1 =
           FStar_TypeChecker_Rel.force_trivial_guard env g1;
           FStar_TypeChecker_Common.is_pure_lcomp lc  in
         let g1 = FStar_TypeChecker_Rel.solve_deferred_constraints env g  in
         let uu____14299 = FStar_TypeChecker_Common.lcomp_comp lc  in
         match uu____14299 with
         | (c,g_c) ->
             let uu____14311 = FStar_TypeChecker_Common.is_total_lcomp lc  in
             if uu____14311
             then
               let uu____14319 =
                 let uu____14321 = FStar_TypeChecker_Env.conj_guard g1 g_c
                    in
                 discharge uu____14321  in
               (uu____14319, c)
             else
               (let steps =
                  [FStar_TypeChecker_Env.Beta;
                  FStar_TypeChecker_Env.NoFullNorm;
                  FStar_TypeChecker_Env.DoNotUnfoldPureLets]  in
                let c1 =
                  let uu____14329 =
                    let uu____14330 =
                      FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
                    FStar_All.pipe_right uu____14330
                      FStar_Syntax_Syntax.mk_Comp
                     in
                  FStar_All.pipe_right uu____14329
                    (FStar_TypeChecker_Normalize.normalize_comp steps env)
                   in
                let uu____14331 = check_trivial_precondition env c1  in
                match uu____14331 with
                | (ct,vc,g_pre) ->
                    ((let uu____14347 =
                        FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                          (FStar_Options.Other "Simplification")
                         in
                      if uu____14347
                      then
                        let uu____14352 =
                          FStar_Syntax_Print.term_to_string vc  in
                        FStar_Util.print1 "top-level VC: %s\n" uu____14352
                      else ());
                     (let uu____14357 =
                        let uu____14359 =
                          let uu____14360 =
                            FStar_TypeChecker_Env.conj_guard g_c g_pre  in
                          FStar_TypeChecker_Env.conj_guard g1 uu____14360  in
                        discharge uu____14359  in
                      let uu____14361 =
                        FStar_All.pipe_right ct FStar_Syntax_Syntax.mk_Comp
                         in
                      (uu____14357, uu____14361)))))
  
let (short_circuit :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.args -> FStar_TypeChecker_Common.guard_formula)
  =
  fun head1  ->
    fun seen_args  ->
      let short_bin_op f uu___8_14395 =
        match uu___8_14395 with
        | [] -> FStar_TypeChecker_Common.Trivial
        | (fst1,uu____14405)::[] -> f fst1
        | uu____14430 -> failwith "Unexpexted args to binary operator"  in
      let op_and_e e =
        let uu____14442 = FStar_Syntax_Util.b2t e  in
        FStar_All.pipe_right uu____14442
          (fun _14443  -> FStar_TypeChecker_Common.NonTrivial _14443)
         in
      let op_or_e e =
        let uu____14454 =
          let uu____14455 = FStar_Syntax_Util.b2t e  in
          FStar_Syntax_Util.mk_neg uu____14455  in
        FStar_All.pipe_right uu____14454
          (fun _14458  -> FStar_TypeChecker_Common.NonTrivial _14458)
         in
      let op_and_t t =
        FStar_All.pipe_right t
          (fun _14465  -> FStar_TypeChecker_Common.NonTrivial _14465)
         in
      let op_or_t t =
        let uu____14476 = FStar_All.pipe_right t FStar_Syntax_Util.mk_neg  in
        FStar_All.pipe_right uu____14476
          (fun _14479  -> FStar_TypeChecker_Common.NonTrivial _14479)
         in
      let op_imp_t t =
        FStar_All.pipe_right t
          (fun _14486  -> FStar_TypeChecker_Common.NonTrivial _14486)
         in
      let short_op_ite uu___9_14492 =
        match uu___9_14492 with
        | [] -> FStar_TypeChecker_Common.Trivial
        | (guard,uu____14502)::[] ->
            FStar_TypeChecker_Common.NonTrivial guard
        | _then::(guard,uu____14529)::[] ->
            let uu____14570 = FStar_Syntax_Util.mk_neg guard  in
            FStar_All.pipe_right uu____14570
              (fun _14571  -> FStar_TypeChecker_Common.NonTrivial _14571)
        | uu____14572 -> failwith "Unexpected args to ITE"  in
      let table =
        let uu____14584 =
          let uu____14592 = short_bin_op op_and_e  in
          (FStar_Parser_Const.op_And, uu____14592)  in
        let uu____14600 =
          let uu____14610 =
            let uu____14618 = short_bin_op op_or_e  in
            (FStar_Parser_Const.op_Or, uu____14618)  in
          let uu____14626 =
            let uu____14636 =
              let uu____14644 = short_bin_op op_and_t  in
              (FStar_Parser_Const.and_lid, uu____14644)  in
            let uu____14652 =
              let uu____14662 =
                let uu____14670 = short_bin_op op_or_t  in
                (FStar_Parser_Const.or_lid, uu____14670)  in
              let uu____14678 =
                let uu____14688 =
                  let uu____14696 = short_bin_op op_imp_t  in
                  (FStar_Parser_Const.imp_lid, uu____14696)  in
                [uu____14688; (FStar_Parser_Const.ite_lid, short_op_ite)]  in
              uu____14662 :: uu____14678  in
            uu____14636 :: uu____14652  in
          uu____14610 :: uu____14626  in
        uu____14584 :: uu____14600  in
      match head1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let lid = (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          let uu____14758 =
            FStar_Util.find_map table
              (fun uu____14773  ->
                 match uu____14773 with
                 | (x,mk1) ->
                     let uu____14790 = FStar_Ident.lid_equals x lid  in
                     if uu____14790
                     then
                       let uu____14795 = mk1 seen_args  in
                       FStar_Pervasives_Native.Some uu____14795
                     else FStar_Pervasives_Native.None)
             in
          (match uu____14758 with
           | FStar_Pervasives_Native.None  ->
               FStar_TypeChecker_Common.Trivial
           | FStar_Pervasives_Native.Some g -> g)
      | uu____14799 -> FStar_TypeChecker_Common.Trivial
  
let (short_circuit_head : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun l  ->
    let uu____14807 =
      let uu____14808 = FStar_Syntax_Util.un_uinst l  in
      uu____14808.FStar_Syntax_Syntax.n  in
    match uu____14807 with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        FStar_Util.for_some (FStar_Syntax_Syntax.fv_eq_lid fv)
          [FStar_Parser_Const.op_And;
          FStar_Parser_Const.op_Or;
          FStar_Parser_Const.and_lid;
          FStar_Parser_Const.or_lid;
          FStar_Parser_Const.imp_lid;
          FStar_Parser_Const.ite_lid]
    | uu____14813 -> false
  
let (maybe_add_implicit_binders :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.binders)
  =
  fun env  ->
    fun bs  ->
      let pos bs1 =
        match bs1 with
        | (hd1,uu____14849)::uu____14850 ->
            FStar_Syntax_Syntax.range_of_bv hd1
        | uu____14869 -> FStar_TypeChecker_Env.get_range env  in
      match bs with
      | (uu____14878,FStar_Pervasives_Native.Some
         (FStar_Syntax_Syntax.Implicit uu____14879))::uu____14880 -> bs
      | uu____14898 ->
          let uu____14899 = FStar_TypeChecker_Env.expected_typ env  in
          (match uu____14899 with
           | FStar_Pervasives_Native.None  -> bs
           | FStar_Pervasives_Native.Some t ->
               let uu____14903 =
                 let uu____14904 = FStar_Syntax_Subst.compress t  in
                 uu____14904.FStar_Syntax_Syntax.n  in
               (match uu____14903 with
                | FStar_Syntax_Syntax.Tm_arrow (bs',uu____14908) ->
                    let uu____14929 =
                      FStar_Util.prefix_until
                        (fun uu___10_14969  ->
                           match uu___10_14969 with
                           | (uu____14977,FStar_Pervasives_Native.Some
                              (FStar_Syntax_Syntax.Implicit uu____14978)) ->
                               false
                           | uu____14983 -> true) bs'
                       in
                    (match uu____14929 with
                     | FStar_Pervasives_Native.None  -> bs
                     | FStar_Pervasives_Native.Some
                         ([],uu____15019,uu____15020) -> bs
                     | FStar_Pervasives_Native.Some
                         (imps,uu____15092,uu____15093) ->
                         let uu____15166 =
                           FStar_All.pipe_right imps
                             (FStar_Util.for_all
                                (fun uu____15186  ->
                                   match uu____15186 with
                                   | (x,uu____15195) ->
                                       FStar_Util.starts_with
                                         (x.FStar_Syntax_Syntax.ppname).FStar_Ident.idText
                                         "'"))
                            in
                         if uu____15166
                         then
                           let r = pos bs  in
                           let imps1 =
                             FStar_All.pipe_right imps
                               (FStar_List.map
                                  (fun uu____15244  ->
                                     match uu____15244 with
                                     | (x,i) ->
                                         let uu____15263 =
                                           FStar_Syntax_Syntax.set_range_of_bv
                                             x r
                                            in
                                         (uu____15263, i)))
                              in
                           FStar_List.append imps1 bs
                         else bs)
                | uu____15274 -> bs))
  
let (maybe_lift :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Ident.lident ->
        FStar_Ident.lident ->
          FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      fun c1  ->
        fun c2  ->
          fun t  ->
            let m1 = FStar_TypeChecker_Env.norm_eff_name env c1  in
            let m2 = FStar_TypeChecker_Env.norm_eff_name env c2  in
            let uu____15303 =
              ((FStar_Ident.lid_equals m1 m2) ||
                 ((FStar_Syntax_Util.is_pure_effect c1) &&
                    (FStar_Syntax_Util.is_ghost_effect c2)))
                ||
                ((FStar_Syntax_Util.is_pure_effect c2) &&
                   (FStar_Syntax_Util.is_ghost_effect c1))
               in
            if uu____15303
            then e
            else
              FStar_Syntax_Syntax.mk
                (FStar_Syntax_Syntax.Tm_meta
                   (e, (FStar_Syntax_Syntax.Meta_monadic_lift (m1, m2, t))))
                FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos
  
let (maybe_monadic :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      fun c  ->
        fun t  ->
          let m = FStar_TypeChecker_Env.norm_eff_name env c  in
          let uu____15334 =
            ((is_pure_or_ghost_effect env m) ||
               (FStar_Ident.lid_equals m FStar_Parser_Const.effect_Tot_lid))
              ||
              (FStar_Ident.lid_equals m FStar_Parser_Const.effect_GTot_lid)
             in
          if uu____15334
          then e
          else
            FStar_Syntax_Syntax.mk
              (FStar_Syntax_Syntax.Tm_meta
                 (e, (FStar_Syntax_Syntax.Meta_monadic (m, t))))
              FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos
  
let (d : Prims.string -> unit) =
  fun s  -> FStar_Util.print1 "\027[01;36m%s\027[00m\n" s 
let (mk_toplevel_definition :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.term ->
        (FStar_Syntax_Syntax.sigelt * FStar_Syntax_Syntax.term))
  =
  fun env  ->
    fun lident  ->
      fun def  ->
        (let uu____15377 =
           FStar_TypeChecker_Env.debug env (FStar_Options.Other "ED")  in
         if uu____15377
         then
           ((let uu____15382 = FStar_Ident.text_of_lid lident  in
             d uu____15382);
            (let uu____15384 = FStar_Ident.text_of_lid lident  in
             let uu____15386 = FStar_Syntax_Print.term_to_string def  in
             FStar_Util.print2 "Registering top-level definition: %s\n%s\n"
               uu____15384 uu____15386))
         else ());
        (let fv =
           let uu____15392 = FStar_Syntax_Util.incr_delta_qualifier def  in
           FStar_Syntax_Syntax.lid_as_fv lident uu____15392
             FStar_Pervasives_Native.None
            in
         let lbname = FStar_Util.Inr fv  in
         let lb =
           (false,
             [FStar_Syntax_Util.mk_letbinding lbname []
                FStar_Syntax_Syntax.tun FStar_Parser_Const.effect_Tot_lid def
                [] FStar_Range.dummyRange])
            in
         let sig_ctx =
           FStar_Syntax_Syntax.mk_sigelt
             (FStar_Syntax_Syntax.Sig_let (lb, [lident]))
            in
         let uu____15404 =
           FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_fvar fv)
             FStar_Pervasives_Native.None FStar_Range.dummyRange
            in
         ((let uu___1841_15406 = sig_ctx  in
           {
             FStar_Syntax_Syntax.sigel =
               (uu___1841_15406.FStar_Syntax_Syntax.sigel);
             FStar_Syntax_Syntax.sigrng =
               (uu___1841_15406.FStar_Syntax_Syntax.sigrng);
             FStar_Syntax_Syntax.sigquals =
               [FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen];
             FStar_Syntax_Syntax.sigmeta =
               (uu___1841_15406.FStar_Syntax_Syntax.sigmeta);
             FStar_Syntax_Syntax.sigattrs =
               (uu___1841_15406.FStar_Syntax_Syntax.sigattrs);
             FStar_Syntax_Syntax.sigopts =
               (uu___1841_15406.FStar_Syntax_Syntax.sigopts)
           }), uu____15404))
  
let (check_sigelt_quals :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.sigelt -> unit) =
  fun env  ->
    fun se  ->
      let visibility uu___11_15424 =
        match uu___11_15424 with
        | FStar_Syntax_Syntax.Private  -> true
        | uu____15427 -> false  in
      let reducibility uu___12_15435 =
        match uu___12_15435 with
        | FStar_Syntax_Syntax.Abstract  -> true
        | FStar_Syntax_Syntax.Irreducible  -> true
        | FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen  -> true
        | FStar_Syntax_Syntax.Visible_default  -> true
        | FStar_Syntax_Syntax.Inline_for_extraction  -> true
        | uu____15442 -> false  in
      let assumption uu___13_15450 =
        match uu___13_15450 with
        | FStar_Syntax_Syntax.Assumption  -> true
        | FStar_Syntax_Syntax.New  -> true
        | uu____15454 -> false  in
      let reification uu___14_15462 =
        match uu___14_15462 with
        | FStar_Syntax_Syntax.Reifiable  -> true
        | FStar_Syntax_Syntax.Reflectable uu____15465 -> true
        | uu____15467 -> false  in
      let inferred uu___15_15475 =
        match uu___15_15475 with
        | FStar_Syntax_Syntax.Discriminator uu____15477 -> true
        | FStar_Syntax_Syntax.Projector uu____15479 -> true
        | FStar_Syntax_Syntax.RecordType uu____15485 -> true
        | FStar_Syntax_Syntax.RecordConstructor uu____15495 -> true
        | FStar_Syntax_Syntax.ExceptionConstructor  -> true
        | FStar_Syntax_Syntax.HasMaskedEffect  -> true
        | FStar_Syntax_Syntax.Effect  -> true
        | uu____15508 -> false  in
      let has_eq uu___16_15516 =
        match uu___16_15516 with
        | FStar_Syntax_Syntax.Noeq  -> true
        | FStar_Syntax_Syntax.Unopteq  -> true
        | uu____15520 -> false  in
      let quals_combo_ok quals q =
        match q with
        | FStar_Syntax_Syntax.Assumption  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                          (inferred x))
                         || (visibility x))
                        || (assumption x))
                       ||
                       (env.FStar_TypeChecker_Env.is_iface &&
                          (x = FStar_Syntax_Syntax.Inline_for_extraction)))
                      || (x = FStar_Syntax_Syntax.NoExtract)))
        | FStar_Syntax_Syntax.New  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    (((x = q) || (inferred x)) || (visibility x)) ||
                      (assumption x)))
        | FStar_Syntax_Syntax.Inline_for_extraction  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
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
        | FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Visible_default  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Irreducible  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Abstract  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Noeq  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Unopteq  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.TotalEffect  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    (((x = q) || (inferred x)) || (visibility x)) ||
                      (reification x)))
        | FStar_Syntax_Syntax.Logic  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((x = q) || (x = FStar_Syntax_Syntax.Assumption)) ||
                        (inferred x))
                       || (visibility x))
                      || (reducibility x)))
        | FStar_Syntax_Syntax.Reifiable  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((reification x) || (inferred x)) || (visibility x)) ||
                       (x = FStar_Syntax_Syntax.TotalEffect))
                      || (x = FStar_Syntax_Syntax.Visible_default)))
        | FStar_Syntax_Syntax.Reflectable uu____15599 ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((reification x) || (inferred x)) || (visibility x)) ||
                       (x = FStar_Syntax_Syntax.TotalEffect))
                      || (x = FStar_Syntax_Syntax.Visible_default)))
        | FStar_Syntax_Syntax.Private  -> true
        | uu____15606 -> true  in
      let check_erasable quals se1 r =
        let lids = FStar_Syntax_Util.lids_of_sigelt se1  in
        let val_exists =
          FStar_All.pipe_right lids
            (FStar_Util.for_some
               (fun l  ->
                  let uu____15639 =
                    FStar_TypeChecker_Env.try_lookup_val_decl env l  in
                  FStar_Option.isSome uu____15639))
           in
        let val_has_erasable_attr =
          FStar_All.pipe_right lids
            (FStar_Util.for_some
               (fun l  ->
                  let attrs_opt =
                    FStar_TypeChecker_Env.lookup_attrs_of_lid env l  in
                  (FStar_Option.isSome attrs_opt) &&
                    (let uu____15670 = FStar_Option.get attrs_opt  in
                     FStar_Syntax_Util.has_attribute uu____15670
                       FStar_Parser_Const.erasable_attr)))
           in
        let se_has_erasable_attr =
          FStar_Syntax_Util.has_attribute se1.FStar_Syntax_Syntax.sigattrs
            FStar_Parser_Const.erasable_attr
           in
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
           | FStar_Syntax_Syntax.Sig_bundle uu____15690 ->
               let uu____15699 =
                 let uu____15701 =
                   FStar_All.pipe_right quals
                     (FStar_Util.for_some
                        (fun uu___17_15707  ->
                           match uu___17_15707 with
                           | FStar_Syntax_Syntax.Noeq  -> true
                           | uu____15710 -> false))
                    in
                 Prims.op_Negation uu____15701  in
               if uu____15699
               then
                 FStar_Errors.raise_error
                   (FStar_Errors.Fatal_QulifierListNotPermitted,
                     "Incompatible attributes and qualifiers: erasable types do not support decidable equality and must be marked `noeq`")
                   r
               else ()
           | FStar_Syntax_Syntax.Sig_declare_typ uu____15717 -> ()
           | uu____15724 ->
               FStar_Errors.raise_error
                 (FStar_Errors.Fatal_QulifierListNotPermitted,
                   "Illegal attribute: the `erasable` attribute is only permitted on inductive type definitions")
                 r)
        else ()  in
      let quals =
        FStar_All.pipe_right (FStar_Syntax_Util.quals_of_sigelt se)
          (FStar_List.filter
             (fun x  -> Prims.op_Negation (x = FStar_Syntax_Syntax.Logic)))
         in
      let uu____15738 =
        let uu____15740 =
          FStar_All.pipe_right quals
            (FStar_Util.for_some
               (fun uu___18_15746  ->
                  match uu___18_15746 with
                  | FStar_Syntax_Syntax.OnlyName  -> true
                  | uu____15749 -> false))
           in
        FStar_All.pipe_right uu____15740 Prims.op_Negation  in
      if uu____15738
      then
        let r = FStar_Syntax_Util.range_of_sigelt se  in
        let no_dup_quals =
          FStar_Util.remove_dups (fun x  -> fun y  -> x = y) quals  in
        let err' msg =
          let uu____15770 =
            let uu____15776 =
              let uu____15778 = FStar_Syntax_Print.quals_to_string quals  in
              FStar_Util.format2
                "The qualifier list \"[%s]\" is not permissible for this element%s"
                uu____15778 msg
               in
            (FStar_Errors.Fatal_QulifierListNotPermitted, uu____15776)  in
          FStar_Errors.raise_error uu____15770 r  in
        let err msg = err' (Prims.op_Hat ": " msg)  in
        let err'1 uu____15796 = err' ""  in
        (if (FStar_List.length quals) <> (FStar_List.length no_dup_quals)
         then err "duplicate qualifiers"
         else ();
         (let uu____15804 =
            let uu____15806 =
              FStar_All.pipe_right quals
                (FStar_List.for_all (quals_combo_ok quals))
               in
            Prims.op_Negation uu____15806  in
          if uu____15804 then err "ill-formed combination" else ());
         check_erasable quals se r;
         (match se.FStar_Syntax_Syntax.sigel with
          | FStar_Syntax_Syntax.Sig_let ((is_rec,uu____15817),uu____15818) ->
              ((let uu____15830 =
                  is_rec &&
                    (FStar_All.pipe_right quals
                       (FStar_List.contains
                          FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen))
                   in
                if uu____15830
                then err "recursive definitions cannot be marked inline"
                else ());
               (let uu____15839 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_some
                       (fun x  -> (assumption x) || (has_eq x)))
                   in
                if uu____15839
                then
                  err
                    "definitions cannot be assumed or marked with equality qualifiers"
                else ()))
          | FStar_Syntax_Syntax.Sig_bundle uu____15850 ->
              ((let uu____15860 =
                  let uu____15862 =
                    FStar_All.pipe_right quals
                      (FStar_Util.for_all
                         (fun x  ->
                            (((((x = FStar_Syntax_Syntax.Abstract) ||
                                  (x =
                                     FStar_Syntax_Syntax.Inline_for_extraction))
                                 || (x = FStar_Syntax_Syntax.NoExtract))
                                || (inferred x))
                               || (visibility x))
                              || (has_eq x)))
                     in
                  Prims.op_Negation uu____15862  in
                if uu____15860 then err'1 () else ());
               (let uu____15872 =
                  (FStar_All.pipe_right quals
                     (FStar_List.existsb
                        (fun uu___19_15878  ->
                           match uu___19_15878 with
                           | FStar_Syntax_Syntax.Unopteq  -> true
                           | uu____15881 -> false)))
                    &&
                    (FStar_Syntax_Util.has_attribute
                       se.FStar_Syntax_Syntax.sigattrs
                       FStar_Parser_Const.erasable_attr)
                   in
                if uu____15872
                then
                  err
                    "unopteq is not allowed on an erasable inductives since they don't have decidable equality"
                else ()))
          | FStar_Syntax_Syntax.Sig_declare_typ uu____15887 ->
              let uu____15894 =
                FStar_All.pipe_right quals (FStar_Util.for_some has_eq)  in
              if uu____15894 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_assume uu____15902 ->
              let uu____15909 =
                let uu____15911 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          (visibility x) ||
                            (x = FStar_Syntax_Syntax.Assumption)))
                   in
                Prims.op_Negation uu____15911  in
              if uu____15909 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect uu____15921 ->
              let uu____15922 =
                let uu____15924 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          (((x = FStar_Syntax_Syntax.TotalEffect) ||
                              (inferred x))
                             || (visibility x))
                            || (reification x)))
                   in
                Prims.op_Negation uu____15924  in
              if uu____15922 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____15934 ->
              let uu____15935 =
                let uu____15937 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          (((x = FStar_Syntax_Syntax.TotalEffect) ||
                              (inferred x))
                             || (visibility x))
                            || (reification x)))
                   in
                Prims.op_Negation uu____15937  in
              if uu____15935 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_effect_abbrev uu____15947 ->
              let uu____15960 =
                let uu____15962 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  -> (inferred x) || (visibility x)))
                   in
                Prims.op_Negation uu____15962  in
              if uu____15960 then err'1 () else ()
          | uu____15972 -> ()))
      else ()
  
let (must_erase_for_extraction :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun g  ->
    fun t  ->
      let rec descend env t1 =
        let uu____16011 =
          let uu____16012 = FStar_Syntax_Subst.compress t1  in
          uu____16012.FStar_Syntax_Syntax.n  in
        match uu____16011 with
        | FStar_Syntax_Syntax.Tm_arrow uu____16016 ->
            let uu____16031 = FStar_Syntax_Util.arrow_formals_comp t1  in
            (match uu____16031 with
             | (bs,c) ->
                 let env1 = FStar_TypeChecker_Env.push_binders env bs  in
                 (FStar_Syntax_Util.is_ghost_effect
                    (FStar_Syntax_Util.comp_effect_name c))
                   ||
                   ((FStar_Syntax_Util.is_pure_or_ghost_comp c) &&
                      (aux env1 (FStar_Syntax_Util.comp_result c))))
        | FStar_Syntax_Syntax.Tm_refine
            ({ FStar_Syntax_Syntax.ppname = uu____16064;
               FStar_Syntax_Syntax.index = uu____16065;
               FStar_Syntax_Syntax.sort = t2;_},uu____16067)
            -> aux env t2
        | FStar_Syntax_Syntax.Tm_app (head1,uu____16076) -> descend env head1
        | FStar_Syntax_Syntax.Tm_uinst (head1,uu____16102) ->
            descend env head1
        | FStar_Syntax_Syntax.Tm_fvar fv ->
            FStar_TypeChecker_Env.fv_has_attr env fv
              FStar_Parser_Const.must_erase_for_extraction_attr
        | uu____16108 -> false
      
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
            FStar_TypeChecker_Env.Unascribe] env t1
           in
        let res =
          (FStar_TypeChecker_Env.non_informative env t2) || (descend env t2)
           in
        (let uu____16118 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Extraction")
            in
         if uu____16118
         then
           let uu____16123 = FStar_Syntax_Print.term_to_string t2  in
           FStar_Util.print2 "must_erase=%s: %s\n"
             (if res then "true" else "false") uu____16123
         else ());
        res
       in aux g t
  
let (fresh_effect_repr :
  FStar_TypeChecker_Env.env ->
    FStar_Range.range ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.tscheme ->
          FStar_Syntax_Syntax.tscheme ->
            FStar_Syntax_Syntax.universe ->
              FStar_Syntax_Syntax.term ->
                (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun r  ->
      fun eff_name  ->
        fun signature_ts  ->
          fun repr_ts  ->
            fun u  ->
              fun a_tm  ->
                let fail1 t =
                  let uu____16184 =
                    FStar_TypeChecker_Err.unexpected_signature_for_monad env
                      eff_name t
                     in
                  FStar_Errors.raise_error uu____16184 r  in
                let uu____16194 =
                  FStar_TypeChecker_Env.inst_tscheme signature_ts  in
                match uu____16194 with
                | (uu____16203,signature) ->
                    let uu____16205 =
                      let uu____16206 = FStar_Syntax_Subst.compress signature
                         in
                      uu____16206.FStar_Syntax_Syntax.n  in
                    (match uu____16205 with
                     | FStar_Syntax_Syntax.Tm_arrow (bs,uu____16214) ->
                         let bs1 = FStar_Syntax_Subst.open_binders bs  in
                         (match bs1 with
                          | a::bs2 ->
                              let uu____16262 =
                                FStar_TypeChecker_Env.uvars_for_binders env
                                  bs2
                                  [FStar_Syntax_Syntax.NT
                                     ((FStar_Pervasives_Native.fst a), a_tm)]
                                  (fun b  ->
                                     let uu____16277 =
                                       FStar_Syntax_Print.binder_to_string b
                                        in
                                     let uu____16279 =
                                       FStar_Range.string_of_range r  in
                                     FStar_Util.format3
                                       "uvar for binder %s when creating a fresh repr for %s at %s"
                                       uu____16277 eff_name.FStar_Ident.str
                                       uu____16279) r
                                 in
                              (match uu____16262 with
                               | (is,g) ->
                                   let uu____16292 =
                                     match repr_ts with
                                     | (uu____16293,{
                                                      FStar_Syntax_Syntax.n =
                                                        FStar_Syntax_Syntax.Tm_unknown
                                                        ;
                                                      FStar_Syntax_Syntax.pos
                                                        = uu____16294;
                                                      FStar_Syntax_Syntax.vars
                                                        = uu____16295;_})
                                         ->
                                         let eff_c =
                                           let uu____16305 =
                                             let uu____16306 =
                                               FStar_List.map
                                                 FStar_Syntax_Syntax.as_arg
                                                 is
                                                in
                                             {
                                               FStar_Syntax_Syntax.comp_univs
                                                 = [u];
                                               FStar_Syntax_Syntax.effect_name
                                                 = eff_name;
                                               FStar_Syntax_Syntax.result_typ
                                                 = a_tm;
                                               FStar_Syntax_Syntax.effect_args
                                                 = uu____16306;
                                               FStar_Syntax_Syntax.flags = []
                                             }  in
                                           FStar_Syntax_Syntax.mk_Comp
                                             uu____16305
                                            in
                                         let uu____16325 =
                                           let uu____16332 =
                                             let uu____16333 =
                                               let uu____16348 =
                                                 let uu____16357 =
                                                   FStar_Syntax_Syntax.null_binder
                                                     FStar_Syntax_Syntax.t_unit
                                                    in
                                                 [uu____16357]  in
                                               (uu____16348, eff_c)  in
                                             FStar_Syntax_Syntax.Tm_arrow
                                               uu____16333
                                              in
                                           FStar_Syntax_Syntax.mk uu____16332
                                            in
                                         uu____16325
                                           FStar_Pervasives_Native.None r
                                     | uu____16386 ->
                                         let repr =
                                           let uu____16388 =
                                             FStar_TypeChecker_Env.inst_tscheme_with
                                               repr_ts [u]
                                              in
                                           FStar_All.pipe_right uu____16388
                                             FStar_Pervasives_Native.snd
                                            in
                                         let uu____16397 =
                                           let uu____16402 =
                                             FStar_List.map
                                               FStar_Syntax_Syntax.as_arg
                                               (a_tm :: is)
                                              in
                                           FStar_Syntax_Syntax.mk_Tm_app repr
                                             uu____16402
                                            in
                                         uu____16397
                                           FStar_Pervasives_Native.None r
                                      in
                                   (uu____16292, g))
                          | uu____16411 -> fail1 signature)
                     | uu____16412 -> fail1 signature)
  
let (fresh_effect_repr_en :
  FStar_TypeChecker_Env.env ->
    FStar_Range.range ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.universe ->
          FStar_Syntax_Syntax.term ->
            (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun r  ->
      fun eff_name  ->
        fun u  ->
          fun a_tm  ->
            let uu____16443 =
              FStar_All.pipe_right eff_name
                (FStar_TypeChecker_Env.get_effect_decl env)
               in
            FStar_All.pipe_right uu____16443
              (fun ed  ->
                 fresh_effect_repr env r eff_name
                   ed.FStar_Syntax_Syntax.signature
                   ed.FStar_Syntax_Syntax.repr u a_tm)
  
let (layered_effect_indices_as_binders :
  FStar_TypeChecker_Env.env ->
    FStar_Range.range ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.tscheme ->
          FStar_Syntax_Syntax.universe ->
            FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.binders)
  =
  fun env  ->
    fun r  ->
      fun eff_name  ->
        fun sig_ts  ->
          fun u  ->
            fun a_tm  ->
              let uu____16481 =
                FStar_TypeChecker_Env.inst_tscheme_with sig_ts [u]  in
              match uu____16481 with
              | (uu____16486,sig_tm) ->
                  let fail1 t =
                    let uu____16494 =
                      FStar_TypeChecker_Err.unexpected_signature_for_monad
                        env eff_name t
                       in
                    FStar_Errors.raise_error uu____16494 r  in
                  let uu____16500 =
                    let uu____16501 = FStar_Syntax_Subst.compress sig_tm  in
                    uu____16501.FStar_Syntax_Syntax.n  in
                  (match uu____16500 with
                   | FStar_Syntax_Syntax.Tm_arrow (bs,uu____16505) ->
                       let bs1 = FStar_Syntax_Subst.open_binders bs  in
                       (match bs1 with
                        | (a',uu____16528)::bs2 ->
                            FStar_All.pipe_right bs2
                              (FStar_Syntax_Subst.subst_binders
                                 [FStar_Syntax_Syntax.NT (a', a_tm)])
                        | uu____16550 -> fail1 sig_tm)
                   | uu____16551 -> fail1 sig_tm)
  
let (lift_tf_layered_effect :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.tscheme ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.comp ->
          (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun tgt  ->
    fun lift_ts  ->
      fun env  ->
        fun c  ->
          (let uu____16582 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "LayeredEffects")
              in
           if uu____16582
           then
             let uu____16587 = FStar_Syntax_Print.comp_to_string c  in
             let uu____16589 = FStar_Syntax_Print.lid_to_string tgt  in
             FStar_Util.print2 "Lifting comp %s to layered effect %s {\n"
               uu____16587 uu____16589
           else ());
          (let r = FStar_TypeChecker_Env.get_range env  in
           let effect_args_from_repr repr is_layered =
             let err uu____16619 =
               let uu____16620 =
                 let uu____16626 =
                   let uu____16628 = FStar_Syntax_Print.term_to_string repr
                      in
                   let uu____16630 = FStar_Util.string_of_bool is_layered  in
                   FStar_Util.format2
                     "Could not get effect args from repr %s with is_layered %s"
                     uu____16628 uu____16630
                    in
                 (FStar_Errors.Fatal_UnexpectedEffect, uu____16626)  in
               FStar_Errors.raise_error uu____16620 r  in
             let repr1 = FStar_Syntax_Subst.compress repr  in
             if is_layered
             then
               match repr1.FStar_Syntax_Syntax.n with
               | FStar_Syntax_Syntax.Tm_app (uu____16642,uu____16643::is) ->
                   FStar_All.pipe_right is
                     (FStar_List.map FStar_Pervasives_Native.fst)
               | uu____16711 -> err ()
             else
               (match repr1.FStar_Syntax_Syntax.n with
                | FStar_Syntax_Syntax.Tm_arrow (uu____16716,c1) ->
                    let uu____16738 =
                      FStar_All.pipe_right c1
                        FStar_Syntax_Util.comp_to_comp_typ
                       in
                    FStar_All.pipe_right uu____16738
                      (fun ct  ->
                         FStar_All.pipe_right
                           ct.FStar_Syntax_Syntax.effect_args
                           (FStar_List.map FStar_Pervasives_Native.fst))
                | uu____16773 -> err ())
              in
           let ct = FStar_Syntax_Util.comp_to_comp_typ c  in
           let uu____16775 =
             let uu____16786 =
               FStar_List.hd ct.FStar_Syntax_Syntax.comp_univs  in
             let uu____16787 =
               FStar_All.pipe_right ct.FStar_Syntax_Syntax.effect_args
                 (FStar_List.map FStar_Pervasives_Native.fst)
                in
             (uu____16786, (ct.FStar_Syntax_Syntax.result_typ), uu____16787)
              in
           match uu____16775 with
           | (u,a,c_is) ->
               let uu____16835 =
                 FStar_TypeChecker_Env.inst_tscheme_with lift_ts [u]  in
               (match uu____16835 with
                | (uu____16844,lift_t) ->
                    let lift_t_shape_error s =
                      let uu____16855 =
                        FStar_Ident.string_of_lid
                          ct.FStar_Syntax_Syntax.effect_name
                         in
                      let uu____16857 = FStar_Ident.string_of_lid tgt  in
                      let uu____16859 =
                        FStar_Syntax_Print.term_to_string lift_t  in
                      FStar_Util.format4
                        "Lift from %s to %s has unexpected shape, reason: %s (lift:%s)"
                        uu____16855 uu____16857 s uu____16859
                       in
                    let uu____16862 =
                      let uu____16895 =
                        let uu____16896 = FStar_Syntax_Subst.compress lift_t
                           in
                        uu____16896.FStar_Syntax_Syntax.n  in
                      match uu____16895 with
                      | FStar_Syntax_Syntax.Tm_arrow (bs,c1) when
                          (FStar_List.length bs) >= (Prims.of_int (2)) ->
                          let uu____16960 =
                            FStar_Syntax_Subst.open_comp bs c1  in
                          (match uu____16960 with
                           | (a_b::bs1,c2) ->
                               let uu____17020 =
                                 FStar_All.pipe_right bs1
                                   (FStar_List.splitAt
                                      ((FStar_List.length bs1) -
                                         Prims.int_one))
                                  in
                               let uu____17082 =
                                 FStar_Syntax_Util.comp_to_comp_typ c2  in
                               (a_b, uu____17020, uu____17082))
                      | uu____17109 ->
                          let uu____17110 =
                            let uu____17116 =
                              lift_t_shape_error
                                "either not an arrow or not enough binders"
                               in
                            (FStar_Errors.Fatal_UnexpectedEffect,
                              uu____17116)
                             in
                          FStar_Errors.raise_error uu____17110 r
                       in
                    (match uu____16862 with
                     | (a_b,(rest_bs,f_b::[]),lift_ct) ->
                         let uu____17234 =
                           let uu____17241 =
                             let uu____17242 =
                               let uu____17243 =
                                 let uu____17250 =
                                   FStar_All.pipe_right a_b
                                     FStar_Pervasives_Native.fst
                                    in
                                 (uu____17250, a)  in
                               FStar_Syntax_Syntax.NT uu____17243  in
                             [uu____17242]  in
                           FStar_TypeChecker_Env.uvars_for_binders env
                             rest_bs uu____17241
                             (fun b  ->
                                let uu____17267 =
                                  FStar_Syntax_Print.binder_to_string b  in
                                let uu____17269 =
                                  FStar_Ident.string_of_lid
                                    ct.FStar_Syntax_Syntax.effect_name
                                   in
                                let uu____17271 =
                                  FStar_Ident.string_of_lid tgt  in
                                let uu____17273 =
                                  FStar_Range.string_of_range r  in
                                FStar_Util.format4
                                  "implicit var for binder %s of %s~>%s at %s"
                                  uu____17267 uu____17269 uu____17271
                                  uu____17273) r
                            in
                         (match uu____17234 with
                          | (rest_bs_uvars,g) ->
                              ((let uu____17287 =
                                  FStar_All.pipe_left
                                    (FStar_TypeChecker_Env.debug env)
                                    (FStar_Options.Other "LayeredEffects")
                                   in
                                if uu____17287
                                then
                                  let uu____17292 =
                                    FStar_List.fold_left
                                      (fun s  ->
                                         fun u1  ->
                                           let uu____17301 =
                                             let uu____17303 =
                                               FStar_Syntax_Print.term_to_string
                                                 u1
                                                in
                                             Prims.op_Hat ";;;;" uu____17303
                                              in
                                           Prims.op_Hat s uu____17301) ""
                                      rest_bs_uvars
                                     in
                                  FStar_Util.print1 "Introduced uvars: %s\n"
                                    uu____17292
                                else ());
                               (let substs =
                                  FStar_List.map2
                                    (fun b  ->
                                       fun t  ->
                                         let uu____17334 =
                                           let uu____17341 =
                                             FStar_All.pipe_right b
                                               FStar_Pervasives_Native.fst
                                              in
                                           (uu____17341, t)  in
                                         FStar_Syntax_Syntax.NT uu____17334)
                                    (a_b :: rest_bs) (a :: rest_bs_uvars)
                                   in
                                let guard_f =
                                  let f_sort =
                                    let uu____17360 =
                                      FStar_All.pipe_right
                                        (FStar_Pervasives_Native.fst f_b).FStar_Syntax_Syntax.sort
                                        (FStar_Syntax_Subst.subst substs)
                                       in
                                    FStar_All.pipe_right uu____17360
                                      FStar_Syntax_Subst.compress
                                     in
                                  let f_sort_is =
                                    let uu____17366 =
                                      FStar_TypeChecker_Env.is_layered_effect
                                        env
                                        ct.FStar_Syntax_Syntax.effect_name
                                       in
                                    effect_args_from_repr f_sort uu____17366
                                     in
                                  FStar_List.fold_left2
                                    (fun g1  ->
                                       fun i1  ->
                                         fun i2  ->
                                           let uu____17375 =
                                             FStar_TypeChecker_Rel.teq env i1
                                               i2
                                              in
                                           FStar_TypeChecker_Env.conj_guard
                                             g1 uu____17375)
                                    FStar_TypeChecker_Env.trivial_guard c_is
                                    f_sort_is
                                   in
                                let is =
                                  let uu____17379 =
                                    FStar_TypeChecker_Env.is_layered_effect
                                      env tgt
                                     in
                                  effect_args_from_repr
                                    lift_ct.FStar_Syntax_Syntax.result_typ
                                    uu____17379
                                   in
                                let c1 =
                                  let uu____17382 =
                                    let uu____17383 =
                                      let uu____17394 =
                                        FStar_All.pipe_right is
                                          (FStar_List.map
                                             (FStar_Syntax_Subst.subst substs))
                                         in
                                      FStar_All.pipe_right uu____17394
                                        (FStar_List.map
                                           FStar_Syntax_Syntax.as_arg)
                                       in
                                    {
                                      FStar_Syntax_Syntax.comp_univs =
                                        (lift_ct.FStar_Syntax_Syntax.comp_univs);
                                      FStar_Syntax_Syntax.effect_name = tgt;
                                      FStar_Syntax_Syntax.result_typ = a;
                                      FStar_Syntax_Syntax.effect_args =
                                        uu____17383;
                                      FStar_Syntax_Syntax.flags =
                                        (ct.FStar_Syntax_Syntax.flags)
                                    }  in
                                  FStar_Syntax_Syntax.mk_Comp uu____17382  in
                                (let uu____17414 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env)
                                     (FStar_Options.Other "LayeredEffects")
                                    in
                                 if uu____17414
                                 then
                                   let uu____17419 =
                                     FStar_Syntax_Print.comp_to_string c1  in
                                   FStar_Util.print1 "} Lifted comp: %s\n"
                                     uu____17419
                                 else ());
                                (let uu____17424 =
                                   FStar_TypeChecker_Env.conj_guard g guard_f
                                    in
                                 (c1, uu____17424))))))))
  
let (lift_tf_layered_effect_term :
  FStar_Syntax_Syntax.tscheme ->
    FStar_Syntax_Syntax.tscheme ->
      FStar_Syntax_Syntax.universe ->
        FStar_Syntax_Syntax.typ ->
          FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun lift  ->
    fun lift_t  ->
      fun u  ->
        fun a  ->
          fun e  ->
            let uu____17451 =
              FStar_TypeChecker_Env.inst_tscheme_with lift [u]  in
            match uu____17451 with
            | (uu____17456,lift1) ->
                let rest_bs =
                  let uu____17467 =
                    let uu____17468 =
                      let uu____17471 =
                        FStar_All.pipe_right lift_t
                          FStar_Pervasives_Native.snd
                         in
                      FStar_All.pipe_right uu____17471
                        FStar_Syntax_Subst.compress
                       in
                    uu____17468.FStar_Syntax_Syntax.n  in
                  match uu____17467 with
                  | FStar_Syntax_Syntax.Tm_arrow
                      (uu____17494::bs,uu____17496) when
                      (FStar_List.length bs) >= Prims.int_one ->
                      let uu____17536 =
                        FStar_All.pipe_right bs
                          (FStar_List.splitAt
                             ((FStar_List.length bs) - Prims.int_one))
                         in
                      FStar_All.pipe_right uu____17536
                        FStar_Pervasives_Native.fst
                  | uu____17642 ->
                      let uu____17643 =
                        let uu____17649 =
                          let uu____17651 =
                            FStar_Syntax_Print.tscheme_to_string lift_t  in
                          FStar_Util.format1
                            "lift_t tscheme %s is not an arrow with enough binders"
                            uu____17651
                           in
                        (FStar_Errors.Fatal_UnexpectedEffect, uu____17649)
                         in
                      FStar_Errors.raise_error uu____17643
                        (FStar_Pervasives_Native.snd lift_t).FStar_Syntax_Syntax.pos
                   in
                let args =
                  let uu____17678 = FStar_Syntax_Syntax.as_arg a  in
                  let uu____17687 =
                    let uu____17698 =
                      FStar_All.pipe_right rest_bs
                        (FStar_List.map
                           (fun uu____17734  ->
                              FStar_Syntax_Syntax.as_arg
                                FStar_Syntax_Syntax.unit_const))
                       in
                    let uu____17741 =
                      let uu____17752 = FStar_Syntax_Syntax.as_arg e  in
                      [uu____17752]  in
                    FStar_List.append uu____17698 uu____17741  in
                  uu____17678 :: uu____17687  in
                FStar_Syntax_Syntax.mk
                  (FStar_Syntax_Syntax.Tm_app (lift1, args))
                  FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos
  
let (get_mlift_for_subeff :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sub_eff -> FStar_TypeChecker_Env.mlift)
  =
  fun env  ->
    fun sub1  ->
      let uu____17816 =
        (FStar_TypeChecker_Env.is_layered_effect env
           sub1.FStar_Syntax_Syntax.source)
          ||
          (FStar_TypeChecker_Env.is_layered_effect env
             sub1.FStar_Syntax_Syntax.target)
         in
      if uu____17816
      then
        let uu____17819 =
          let uu____17832 =
            FStar_All.pipe_right sub1.FStar_Syntax_Syntax.lift_wp
              FStar_Util.must
             in
          lift_tf_layered_effect sub1.FStar_Syntax_Syntax.target uu____17832
           in
        let uu____17835 =
          let uu____17847 =
            let uu____17860 =
              FStar_All.pipe_right sub1.FStar_Syntax_Syntax.lift
                FStar_Util.must
               in
            let uu____17863 =
              FStar_All.pipe_right sub1.FStar_Syntax_Syntax.lift_wp
                FStar_Util.must
               in
            lift_tf_layered_effect_term uu____17860 uu____17863  in
          FStar_Pervasives_Native.Some uu____17847  in
        {
          FStar_TypeChecker_Env.mlift_wp = uu____17819;
          FStar_TypeChecker_Env.mlift_term = uu____17835
        }
      else
        (let mk_mlift_wp ts env1 c =
           let ct = FStar_Syntax_Util.comp_to_comp_typ c  in
           let uu____17898 =
             FStar_TypeChecker_Env.inst_tscheme_with ts
               ct.FStar_Syntax_Syntax.comp_univs
              in
           match uu____17898 with
           | (uu____17907,lift_t) ->
               let wp = FStar_List.hd ct.FStar_Syntax_Syntax.effect_args  in
               let uu____17926 =
                 let uu____17927 =
                   let uu___2211_17928 = ct  in
                   let uu____17929 =
                     let uu____17940 =
                       let uu____17949 =
                         let uu____17950 =
                           let uu____17957 =
                             let uu____17958 =
                               let uu____17975 =
                                 let uu____17986 =
                                   FStar_Syntax_Syntax.as_arg
                                     ct.FStar_Syntax_Syntax.result_typ
                                    in
                                 [uu____17986; wp]  in
                               (lift_t, uu____17975)  in
                             FStar_Syntax_Syntax.Tm_app uu____17958  in
                           FStar_Syntax_Syntax.mk uu____17957  in
                         uu____17950 FStar_Pervasives_Native.None
                           (FStar_Pervasives_Native.fst wp).FStar_Syntax_Syntax.pos
                          in
                       FStar_All.pipe_right uu____17949
                         FStar_Syntax_Syntax.as_arg
                        in
                     [uu____17940]  in
                   {
                     FStar_Syntax_Syntax.comp_univs =
                       (uu___2211_17928.FStar_Syntax_Syntax.comp_univs);
                     FStar_Syntax_Syntax.effect_name =
                       (sub1.FStar_Syntax_Syntax.target);
                     FStar_Syntax_Syntax.result_typ =
                       (uu___2211_17928.FStar_Syntax_Syntax.result_typ);
                     FStar_Syntax_Syntax.effect_args = uu____17929;
                     FStar_Syntax_Syntax.flags =
                       (uu___2211_17928.FStar_Syntax_Syntax.flags)
                   }  in
                 FStar_Syntax_Syntax.mk_Comp uu____17927  in
               (uu____17926, FStar_TypeChecker_Common.trivial_guard)
            in
         let mk_mlift_term ts u r e =
           let uu____18086 = FStar_TypeChecker_Env.inst_tscheme_with ts [u]
              in
           match uu____18086 with
           | (uu____18093,lift_t) ->
               let uu____18095 =
                 let uu____18102 =
                   let uu____18103 =
                     let uu____18120 =
                       let uu____18131 = FStar_Syntax_Syntax.as_arg r  in
                       let uu____18140 =
                         let uu____18151 =
                           FStar_Syntax_Syntax.as_arg FStar_Syntax_Syntax.tun
                            in
                         let uu____18160 =
                           let uu____18171 = FStar_Syntax_Syntax.as_arg e  in
                           [uu____18171]  in
                         uu____18151 :: uu____18160  in
                       uu____18131 :: uu____18140  in
                     (lift_t, uu____18120)  in
                   FStar_Syntax_Syntax.Tm_app uu____18103  in
                 FStar_Syntax_Syntax.mk uu____18102  in
               uu____18095 FStar_Pervasives_Native.None
                 e.FStar_Syntax_Syntax.pos
            in
         let uu____18224 =
           let uu____18237 =
             FStar_All.pipe_right sub1.FStar_Syntax_Syntax.lift_wp
               FStar_Util.must
              in
           FStar_All.pipe_right uu____18237 mk_mlift_wp  in
         let uu____18250 =
           FStar_Util.map_opt sub1.FStar_Syntax_Syntax.lift mk_mlift_term  in
         {
           FStar_TypeChecker_Env.mlift_wp = uu____18224;
           FStar_TypeChecker_Env.mlift_term = uu____18250
         })
  
let (get_field_projector_name :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident -> Prims.int -> FStar_Ident.lident)
  =
  fun env  ->
    fun datacon  ->
      fun index1  ->
        let uu____18289 = FStar_TypeChecker_Env.lookup_datacon env datacon
           in
        match uu____18289 with
        | (uu____18294,t) ->
            let err n1 =
              let uu____18304 =
                let uu____18310 =
                  let uu____18312 = FStar_Ident.string_of_lid datacon  in
                  let uu____18314 = FStar_Util.string_of_int n1  in
                  let uu____18316 = FStar_Util.string_of_int index1  in
                  FStar_Util.format3
                    "Data constructor %s does not have enough binders (has %s, tried %s)"
                    uu____18312 uu____18314 uu____18316
                   in
                (FStar_Errors.Fatal_UnexpectedDataConstructor, uu____18310)
                 in
              let uu____18320 = FStar_TypeChecker_Env.get_range env  in
              FStar_Errors.raise_error uu____18304 uu____18320  in
            let uu____18321 =
              let uu____18322 = FStar_Syntax_Subst.compress t  in
              uu____18322.FStar_Syntax_Syntax.n  in
            (match uu____18321 with
             | FStar_Syntax_Syntax.Tm_arrow (bs,uu____18326) ->
                 let bs1 =
                   FStar_All.pipe_right bs
                     (FStar_List.filter
                        (fun uu____18381  ->
                           match uu____18381 with
                           | (uu____18389,q) ->
                               (match q with
                                | FStar_Pervasives_Native.Some
                                    (FStar_Syntax_Syntax.Implicit (true )) ->
                                    false
                                | uu____18398 -> true)))
                    in
                 if (FStar_List.length bs1) <= index1
                 then err (FStar_List.length bs1)
                 else
                   (let b = FStar_List.nth bs1 index1  in
                    let uu____18430 =
                      FStar_Syntax_Util.mk_field_projector_name datacon
                        (FStar_Pervasives_Native.fst b) index1
                       in
                    FStar_All.pipe_right uu____18430
                      FStar_Pervasives_Native.fst)
             | uu____18441 -> err Prims.int_zero)
  