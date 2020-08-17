open Prims
exception Un_extractable 
let (uu___is_Un_extractable : Prims.exn -> Prims.bool) =
  fun projectee ->
    match projectee with | Un_extractable -> true | uu____5 -> false
let (type_leq :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Extraction_ML_Syntax.mlty ->
      FStar_Extraction_ML_Syntax.mlty -> Prims.bool)
  =
  fun g ->
    fun t1 ->
      fun t2 ->
        FStar_Extraction_ML_Util.type_leq
          (FStar_Extraction_ML_Util.udelta_unfold g) t1 t2
let (type_leq_c :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Extraction_ML_Syntax.mlexpr FStar_Pervasives_Native.option ->
      FStar_Extraction_ML_Syntax.mlty ->
        FStar_Extraction_ML_Syntax.mlty ->
          (Prims.bool * FStar_Extraction_ML_Syntax.mlexpr
            FStar_Pervasives_Native.option))
  =
  fun g ->
    fun t1 ->
      fun t2 ->
        FStar_Extraction_ML_Util.type_leq_c
          (FStar_Extraction_ML_Util.udelta_unfold g) t1 t2
let (eraseTypeDeep :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Extraction_ML_Syntax.mlty -> FStar_Extraction_ML_Syntax.mlty)
  =
  fun g ->
    fun t ->
      FStar_Extraction_ML_Util.eraseTypeDeep
        (FStar_Extraction_ML_Util.udelta_unfold g) t
let fail :
  'uuuuuu67 .
    FStar_Range.range -> (FStar_Errors.raw_error * Prims.string) -> 'uuuuuu67
  = fun r -> fun err -> FStar_Errors.raise_error err r
let err_ill_typed_application :
  'uuuuuu100 'uuuuuu101 .
    FStar_Extraction_ML_UEnv.uenv ->
      FStar_Syntax_Syntax.term ->
        FStar_Extraction_ML_Syntax.mlexpr ->
          (FStar_Syntax_Syntax.term * 'uuuuuu100) Prims.list ->
            FStar_Extraction_ML_Syntax.mlty -> 'uuuuuu101
  =
  fun env ->
    fun t ->
      fun mlhead ->
        fun args ->
          fun ty ->
            let uu____139 =
              let uu____144 =
                let uu____145 = FStar_Syntax_Print.term_to_string t in
                let uu____146 =
                  let uu____147 =
                    FStar_Extraction_ML_UEnv.current_module_of_uenv env in
                  FStar_Extraction_ML_Code.string_of_mlexpr uu____147 mlhead in
                let uu____148 =
                  let uu____149 =
                    FStar_Extraction_ML_UEnv.current_module_of_uenv env in
                  FStar_Extraction_ML_Code.string_of_mlty uu____149 ty in
                let uu____150 =
                  let uu____151 =
                    FStar_All.pipe_right args
                      (FStar_List.map
                         (fun uu____169 ->
                            match uu____169 with
                            | (x, uu____175) ->
                                FStar_Syntax_Print.term_to_string x)) in
                  FStar_All.pipe_right uu____151 (FStar_String.concat " ") in
                FStar_Util.format4
                  "Ill-typed application: source application is %s \n translated prefix to %s at type %s\n remaining args are %s\n"
                  uu____145 uu____146 uu____148 uu____150 in
              (FStar_Errors.Fatal_IllTyped, uu____144) in
            fail t.FStar_Syntax_Syntax.pos uu____139
let err_ill_typed_erasure :
  'uuuuuu186 .
    FStar_Extraction_ML_UEnv.uenv ->
      FStar_Range.range -> FStar_Extraction_ML_Syntax.mlty -> 'uuuuuu186
  =
  fun env ->
    fun pos ->
      fun ty ->
        let uu____202 =
          let uu____207 =
            let uu____208 =
              let uu____209 =
                FStar_Extraction_ML_UEnv.current_module_of_uenv env in
              FStar_Extraction_ML_Code.string_of_mlty uu____209 ty in
            FStar_Util.format1
              "Erased value found where a value of type %s was expected"
              uu____208 in
          (FStar_Errors.Fatal_IllTyped, uu____207) in
        fail pos uu____202
let err_value_restriction :
  'uuuuuu214 .
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax -> 'uuuuuu214
  =
  fun t ->
    let uu____224 =
      let uu____229 =
        let uu____230 = FStar_Syntax_Print.tag_of_term t in
        let uu____231 = FStar_Syntax_Print.term_to_string t in
        FStar_Util.format2
          "Refusing to generalize because of the value restriction: (%s) %s"
          uu____230 uu____231 in
      (FStar_Errors.Fatal_ValueRestriction, uu____229) in
    fail t.FStar_Syntax_Syntax.pos uu____224
let (err_unexpected_eff :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Extraction_ML_Syntax.mlty ->
        FStar_Extraction_ML_Syntax.e_tag ->
          FStar_Extraction_ML_Syntax.e_tag -> unit)
  =
  fun env ->
    fun t ->
      fun ty ->
        fun f0 ->
          fun f1 ->
            let uu____261 =
              let uu____266 =
                let uu____267 = FStar_Syntax_Print.term_to_string t in
                let uu____268 =
                  let uu____269 =
                    FStar_Extraction_ML_UEnv.current_module_of_uenv env in
                  FStar_Extraction_ML_Code.string_of_mlty uu____269 ty in
                let uu____270 = FStar_Extraction_ML_Util.eff_to_string f0 in
                let uu____271 = FStar_Extraction_ML_Util.eff_to_string f1 in
                FStar_Util.format4
                  "for expression %s of type %s, Expected effect %s; got effect %s"
                  uu____267 uu____268 uu____270 uu____271 in
              (FStar_Errors.Warning_ExtractionUnexpectedEffect, uu____266) in
            FStar_Errors.log_issue t.FStar_Syntax_Syntax.pos uu____261
let (effect_as_etag :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Ident.lident -> FStar_Extraction_ML_Syntax.e_tag)
  =
  let cache = FStar_Util.smap_create (Prims.of_int (20)) in
  let rec delta_norm_eff g l =
    let uu____294 =
      let uu____297 = FStar_Ident.string_of_lid l in
      FStar_Util.smap_try_find cache uu____297 in
    match uu____294 with
    | FStar_Pervasives_Native.Some l1 -> l1
    | FStar_Pervasives_Native.None ->
        let res =
          let uu____300 =
            let uu____307 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
            FStar_TypeChecker_Env.lookup_effect_abbrev uu____307
              [FStar_Syntax_Syntax.U_zero] l in
          match uu____300 with
          | FStar_Pervasives_Native.None -> l
          | FStar_Pervasives_Native.Some (uu____312, c) ->
              delta_norm_eff g (FStar_Syntax_Util.comp_effect_name c) in
        ((let uu____319 = FStar_Ident.string_of_lid l in
          FStar_Util.smap_add cache uu____319 res);
         res) in
  fun g ->
    fun l ->
      let l1 = delta_norm_eff g l in
      let uu____323 =
        FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_PURE_lid in
      if uu____323
      then FStar_Extraction_ML_Syntax.E_PURE
      else
        (let uu____325 =
           FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_GHOST_lid in
         if uu____325
         then FStar_Extraction_ML_Syntax.E_GHOST
         else
           (let ed_opt =
              let uu____336 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
              FStar_TypeChecker_Env.effect_decl_opt uu____336 l1 in
            match ed_opt with
            | FStar_Pervasives_Native.Some (ed, qualifiers) ->
                let uu____349 =
                  let uu____350 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
                  FStar_TypeChecker_Env.is_reifiable_effect uu____350
                    ed.FStar_Syntax_Syntax.mname in
                if uu____349
                then FStar_Extraction_ML_Syntax.E_PURE
                else FStar_Extraction_ML_Syntax.E_IMPURE
            | FStar_Pervasives_Native.None ->
                FStar_Extraction_ML_Syntax.E_IMPURE))
let rec (is_arity :
  FStar_Extraction_ML_UEnv.uenv -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun env ->
    fun t ->
      let t1 = FStar_Syntax_Util.unmeta t in
      let uu____369 =
        let uu____370 = FStar_Syntax_Subst.compress t1 in
        uu____370.FStar_Syntax_Syntax.n in
      match uu____369 with
      | FStar_Syntax_Syntax.Tm_unknown -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_delayed uu____373 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_ascribed uu____388 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_meta uu____415 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_lazy i ->
          let uu____423 = FStar_Syntax_Util.unfold_lazy i in
          is_arity env uu____423
      | FStar_Syntax_Syntax.Tm_uvar uu____424 -> false
      | FStar_Syntax_Syntax.Tm_constant uu____437 -> false
      | FStar_Syntax_Syntax.Tm_name uu____438 -> false
      | FStar_Syntax_Syntax.Tm_quoted uu____439 -> false
      | FStar_Syntax_Syntax.Tm_bvar uu____446 -> false
      | FStar_Syntax_Syntax.Tm_type uu____447 -> true
      | FStar_Syntax_Syntax.Tm_arrow (uu____448, c) ->
          is_arity env (FStar_Syntax_Util.comp_result c)
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let topt =
            let uu____478 = FStar_Extraction_ML_UEnv.tcenv_of_uenv env in
            FStar_TypeChecker_Env.lookup_definition
              [FStar_TypeChecker_Env.Unfold
                 FStar_Syntax_Syntax.delta_constant] uu____478
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
          (match topt with
           | FStar_Pervasives_Native.None -> false
           | FStar_Pervasives_Native.Some (uu____483, t2) -> is_arity env t2)
      | FStar_Syntax_Syntax.Tm_app uu____489 ->
          let uu____506 = FStar_Syntax_Util.head_and_args t1 in
          (match uu____506 with | (head, uu____524) -> is_arity env head)
      | FStar_Syntax_Syntax.Tm_uinst (head, uu____550) -> is_arity env head
      | FStar_Syntax_Syntax.Tm_refine (x, uu____556) ->
          is_arity env x.FStar_Syntax_Syntax.sort
      | FStar_Syntax_Syntax.Tm_abs (uu____561, body, uu____563) ->
          is_arity env body
      | FStar_Syntax_Syntax.Tm_let (uu____588, body) -> is_arity env body
      | FStar_Syntax_Syntax.Tm_match (uu____606, branches) ->
          (match branches with
           | (uu____644, uu____645, e)::uu____647 -> is_arity env e
           | uu____694 -> false)
let rec (is_type_aux :
  FStar_Extraction_ML_UEnv.uenv -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun env ->
    fun t ->
      let t1 = FStar_Syntax_Subst.compress t in
      match t1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_delayed uu____722 ->
          let uu____737 =
            let uu____738 = FStar_Syntax_Print.tag_of_term t1 in
            FStar_Util.format1 "Impossible: %s" uu____738 in
          failwith uu____737
      | FStar_Syntax_Syntax.Tm_unknown ->
          let uu____739 =
            let uu____740 = FStar_Syntax_Print.tag_of_term t1 in
            FStar_Util.format1 "Impossible: %s" uu____740 in
          failwith uu____739
      | FStar_Syntax_Syntax.Tm_lazy i ->
          let uu____742 = FStar_Syntax_Util.unfold_lazy i in
          is_type_aux env uu____742
      | FStar_Syntax_Syntax.Tm_constant uu____743 -> false
      | FStar_Syntax_Syntax.Tm_type uu____744 -> true
      | FStar_Syntax_Syntax.Tm_refine uu____745 -> true
      | FStar_Syntax_Syntax.Tm_arrow uu____752 -> true
      | FStar_Syntax_Syntax.Tm_fvar fv when
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.failwith_lid ->
          false
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          FStar_Extraction_ML_UEnv.is_type_name env fv
      | FStar_Syntax_Syntax.Tm_uvar
          ({ FStar_Syntax_Syntax.ctx_uvar_head = uu____769;
             FStar_Syntax_Syntax.ctx_uvar_gamma = uu____770;
             FStar_Syntax_Syntax.ctx_uvar_binders = uu____771;
             FStar_Syntax_Syntax.ctx_uvar_typ = t2;
             FStar_Syntax_Syntax.ctx_uvar_reason = uu____773;
             FStar_Syntax_Syntax.ctx_uvar_should_check = uu____774;
             FStar_Syntax_Syntax.ctx_uvar_range = uu____775;
             FStar_Syntax_Syntax.ctx_uvar_meta = uu____776;_},
           s)
          ->
          let uu____820 = FStar_Syntax_Subst.subst' s t2 in
          is_arity env uu____820
      | FStar_Syntax_Syntax.Tm_bvar
          { FStar_Syntax_Syntax.ppname = uu____821;
            FStar_Syntax_Syntax.index = uu____822;
            FStar_Syntax_Syntax.sort = t2;_}
          -> is_arity env t2
      | FStar_Syntax_Syntax.Tm_name
          { FStar_Syntax_Syntax.ppname = uu____826;
            FStar_Syntax_Syntax.index = uu____827;
            FStar_Syntax_Syntax.sort = t2;_}
          -> is_arity env t2
      | FStar_Syntax_Syntax.Tm_ascribed (t2, uu____832, uu____833) ->
          is_type_aux env t2
      | FStar_Syntax_Syntax.Tm_uinst (t2, uu____875) -> is_type_aux env t2
      | FStar_Syntax_Syntax.Tm_abs (bs, body, uu____882) ->
          let uu____907 = FStar_Syntax_Subst.open_term bs body in
          (match uu____907 with | (uu____912, body1) -> is_type_aux env body1)
      | FStar_Syntax_Syntax.Tm_let ((false, lb::[]), body) ->
          let x = FStar_Util.left lb.FStar_Syntax_Syntax.lbname in
          let uu____929 =
            let uu____934 =
              let uu____935 = FStar_Syntax_Syntax.mk_binder x in [uu____935] in
            FStar_Syntax_Subst.open_term uu____934 body in
          (match uu____929 with | (uu____954, body1) -> is_type_aux env body1)
      | FStar_Syntax_Syntax.Tm_let ((uu____956, lbs), body) ->
          let uu____973 = FStar_Syntax_Subst.open_let_rec lbs body in
          (match uu____973 with | (uu____980, body1) -> is_type_aux env body1)
      | FStar_Syntax_Syntax.Tm_match (uu____986, branches) ->
          (match branches with
           | b::uu____1025 ->
               let uu____1070 = FStar_Syntax_Subst.open_branch b in
               (match uu____1070 with
                | (uu____1071, uu____1072, e) -> is_type_aux env e)
           | uu____1090 -> false)
      | FStar_Syntax_Syntax.Tm_quoted uu____1107 -> false
      | FStar_Syntax_Syntax.Tm_meta (t2, uu____1115) -> is_type_aux env t2
      | FStar_Syntax_Syntax.Tm_app (head, uu____1121) -> is_type_aux env head
let (is_type :
  FStar_Extraction_ML_UEnv.uenv -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun env ->
    fun t ->
      FStar_Extraction_ML_UEnv.debug env
        (fun uu____1160 ->
           let uu____1161 = FStar_Syntax_Print.tag_of_term t in
           let uu____1162 = FStar_Syntax_Print.term_to_string t in
           FStar_Util.print2 "checking is_type (%s) %s\n" uu____1161
             uu____1162);
      (let b = is_type_aux env t in
       FStar_Extraction_ML_UEnv.debug env
         (fun uu____1168 ->
            if b
            then
              let uu____1169 = FStar_Syntax_Print.term_to_string t in
              let uu____1170 = FStar_Syntax_Print.tag_of_term t in
              FStar_Util.print2 "yes, is_type %s (%s)\n" uu____1169
                uu____1170
            else
              (let uu____1172 = FStar_Syntax_Print.term_to_string t in
               let uu____1173 = FStar_Syntax_Print.tag_of_term t in
               FStar_Util.print2 "not a type %s (%s)\n" uu____1172 uu____1173));
       b)
let is_type_binder :
  'uuuuuu1180 .
    FStar_Extraction_ML_UEnv.uenv ->
      (FStar_Syntax_Syntax.bv * 'uuuuuu1180) -> Prims.bool
  =
  fun env ->
    fun x ->
      is_arity env (FStar_Pervasives_Native.fst x).FStar_Syntax_Syntax.sort
let (is_constructor : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t ->
    let uu____1204 =
      let uu____1205 = FStar_Syntax_Subst.compress t in
      uu____1205.FStar_Syntax_Syntax.n in
    match uu____1204 with
    | FStar_Syntax_Syntax.Tm_fvar
        { FStar_Syntax_Syntax.fv_name = uu____1208;
          FStar_Syntax_Syntax.fv_delta = uu____1209;
          FStar_Syntax_Syntax.fv_qual = FStar_Pervasives_Native.Some
            (FStar_Syntax_Syntax.Data_ctor);_}
        -> true
    | FStar_Syntax_Syntax.Tm_fvar
        { FStar_Syntax_Syntax.fv_name = uu____1210;
          FStar_Syntax_Syntax.fv_delta = uu____1211;
          FStar_Syntax_Syntax.fv_qual = FStar_Pervasives_Native.Some
            (FStar_Syntax_Syntax.Record_ctor uu____1212);_}
        -> true
    | uu____1219 -> false
let rec (is_fstar_value : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t ->
    let uu____1225 =
      let uu____1226 = FStar_Syntax_Subst.compress t in
      uu____1226.FStar_Syntax_Syntax.n in
    match uu____1225 with
    | FStar_Syntax_Syntax.Tm_constant uu____1229 -> true
    | FStar_Syntax_Syntax.Tm_bvar uu____1230 -> true
    | FStar_Syntax_Syntax.Tm_fvar uu____1231 -> true
    | FStar_Syntax_Syntax.Tm_abs uu____1232 -> true
    | FStar_Syntax_Syntax.Tm_app (head, args) ->
        let uu____1277 = is_constructor head in
        if uu____1277
        then
          FStar_All.pipe_right args
            (FStar_List.for_all
               (fun uu____1295 ->
                  match uu____1295 with
                  | (te, uu____1303) -> is_fstar_value te))
        else false
    | FStar_Syntax_Syntax.Tm_meta (t1, uu____1310) -> is_fstar_value t1
    | FStar_Syntax_Syntax.Tm_ascribed (t1, uu____1316, uu____1317) ->
        is_fstar_value t1
    | uu____1358 -> false
let rec (is_ml_value : FStar_Extraction_ML_Syntax.mlexpr -> Prims.bool) =
  fun e ->
    match e.FStar_Extraction_ML_Syntax.expr with
    | FStar_Extraction_ML_Syntax.MLE_Const uu____1364 -> true
    | FStar_Extraction_ML_Syntax.MLE_Var uu____1365 -> true
    | FStar_Extraction_ML_Syntax.MLE_Name uu____1366 -> true
    | FStar_Extraction_ML_Syntax.MLE_Fun uu____1367 -> true
    | FStar_Extraction_ML_Syntax.MLE_CTor (uu____1378, exps) ->
        FStar_Util.for_all is_ml_value exps
    | FStar_Extraction_ML_Syntax.MLE_Tuple exps ->
        FStar_Util.for_all is_ml_value exps
    | FStar_Extraction_ML_Syntax.MLE_Record (uu____1387, fields) ->
        FStar_Util.for_all
          (fun uu____1412 ->
             match uu____1412 with | (uu____1417, e1) -> is_ml_value e1)
          fields
    | FStar_Extraction_ML_Syntax.MLE_TApp (h, uu____1420) -> is_ml_value h
    | uu____1425 -> false
let (normalize_abs : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t0 ->
    let rec aux bs t copt =
      let t1 = FStar_Syntax_Subst.compress t in
      match t1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_abs (bs', body, copt1) ->
          aux (FStar_List.append bs bs') body copt1
      | uu____1505 ->
          let e' = FStar_Syntax_Util.unascribe t1 in
          let uu____1507 = FStar_Syntax_Util.is_fun e' in
          if uu____1507
          then aux bs e' copt
          else FStar_Syntax_Util.abs bs e' copt in
    aux [] t0 FStar_Pervasives_Native.None
let (unit_binder : unit -> FStar_Syntax_Syntax.binder) =
  fun uu____1521 ->
    let uu____1522 =
      FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
        FStar_Syntax_Syntax.t_unit in
    FStar_All.pipe_left FStar_Syntax_Syntax.mk_binder uu____1522
let (check_pats_for_ite :
  (FStar_Syntax_Syntax.pat * FStar_Syntax_Syntax.term
    FStar_Pervasives_Native.option * FStar_Syntax_Syntax.term) Prims.list ->
    (Prims.bool * FStar_Syntax_Syntax.term FStar_Pervasives_Native.option *
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option))
  =
  fun l ->
    let def =
      (false, FStar_Pervasives_Native.None, FStar_Pervasives_Native.None) in
    if (FStar_List.length l) <> (Prims.of_int (2))
    then def
    else
      (let uu____1602 = FStar_List.hd l in
       match uu____1602 with
       | (p1, w1, e1) ->
           let uu____1636 =
             let uu____1645 = FStar_List.tl l in FStar_List.hd uu____1645 in
           (match uu____1636 with
            | (p2, w2, e2) ->
                (match (w1, w2, (p1.FStar_Syntax_Syntax.v),
                         (p2.FStar_Syntax_Syntax.v))
                 with
                 | (FStar_Pervasives_Native.None,
                    FStar_Pervasives_Native.None,
                    FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool
                    (true)), FStar_Syntax_Syntax.Pat_constant
                    (FStar_Const.Const_bool (false))) ->
                     (true, (FStar_Pervasives_Native.Some e1),
                       (FStar_Pervasives_Native.Some e2))
                 | (FStar_Pervasives_Native.None,
                    FStar_Pervasives_Native.None,
                    FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool
                    (false)), FStar_Syntax_Syntax.Pat_constant
                    (FStar_Const.Const_bool (true))) ->
                     (true, (FStar_Pervasives_Native.Some e2),
                       (FStar_Pervasives_Native.Some e1))
                 | uu____1719 -> def)))
let (instantiate_tyscheme :
  FStar_Extraction_ML_Syntax.mltyscheme ->
    FStar_Extraction_ML_Syntax.mlty Prims.list ->
      FStar_Extraction_ML_Syntax.mlty)
  = fun s -> fun args -> FStar_Extraction_ML_Util.subst s args
let (fresh_mlidents :
  FStar_Extraction_ML_Syntax.mlty Prims.list ->
    FStar_Extraction_ML_UEnv.uenv ->
      ((FStar_Extraction_ML_Syntax.mlident * FStar_Extraction_ML_Syntax.mlty)
        Prims.list * FStar_Extraction_ML_UEnv.uenv))
  =
  fun ts ->
    fun g ->
      let uu____1780 =
        FStar_List.fold_right
          (fun t ->
             fun uu____1809 ->
               match uu____1809 with
               | (uenv, vs) ->
                   let uu____1844 = FStar_Extraction_ML_UEnv.new_mlident uenv in
                   (match uu____1844 with
                    | (uenv1, v) -> (uenv1, ((v, t) :: vs)))) ts (g, []) in
      match uu____1780 with | (g1, vs_ts) -> (vs_ts, g1)
let (instantiate_maybe_partial :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Extraction_ML_Syntax.mlexpr ->
      FStar_Extraction_ML_Syntax.mltyscheme ->
        FStar_Extraction_ML_Syntax.mlty Prims.list ->
          (FStar_Extraction_ML_Syntax.mlexpr *
            FStar_Extraction_ML_Syntax.e_tag *
            FStar_Extraction_ML_Syntax.mlty))
  =
  fun g ->
    fun e ->
      fun s ->
        fun tyargs ->
          let uu____1947 = s in
          match uu____1947 with
          | (vars, t) ->
              let n_vars = FStar_List.length vars in
              let n_args = FStar_List.length tyargs in
              if n_args = n_vars
              then
                (if n_args = Prims.int_zero
                 then (e, FStar_Extraction_ML_Syntax.E_PURE, t)
                 else
                   (let ts = instantiate_tyscheme (vars, t) tyargs in
                    let tapp =
                      let uu___372_1973 = e in
                      {
                        FStar_Extraction_ML_Syntax.expr =
                          (FStar_Extraction_ML_Syntax.MLE_TApp (e, tyargs));
                        FStar_Extraction_ML_Syntax.mlty = ts;
                        FStar_Extraction_ML_Syntax.loc =
                          (uu___372_1973.FStar_Extraction_ML_Syntax.loc)
                      } in
                    (tapp, FStar_Extraction_ML_Syntax.E_PURE, ts)))
              else
                if n_args < n_vars
                then
                  (let extra_tyargs =
                     let uu____1986 = FStar_Util.first_N n_args vars in
                     match uu____1986 with
                     | (uu____1997, rest_vars) ->
                         FStar_All.pipe_right rest_vars
                           (FStar_List.map
                              (fun uu____2012 ->
                                 FStar_Extraction_ML_Syntax.MLTY_Erased)) in
                   let tyargs1 = FStar_List.append tyargs extra_tyargs in
                   let ts = instantiate_tyscheme (vars, t) tyargs1 in
                   let tapp =
                     let uu___383_2018 = e in
                     {
                       FStar_Extraction_ML_Syntax.expr =
                         (FStar_Extraction_ML_Syntax.MLE_TApp (e, tyargs1));
                       FStar_Extraction_ML_Syntax.mlty = ts;
                       FStar_Extraction_ML_Syntax.loc =
                         (uu___383_2018.FStar_Extraction_ML_Syntax.loc)
                     } in
                   let t1 =
                     FStar_List.fold_left
                       (fun out ->
                          fun t1 ->
                            FStar_Extraction_ML_Syntax.MLTY_Fun
                              (t1, FStar_Extraction_ML_Syntax.E_PURE, out))
                       ts extra_tyargs in
                   let uu____2026 = fresh_mlidents extra_tyargs g in
                   match uu____2026 with
                   | (vs_ts, g1) ->
                       let f =
                         FStar_All.pipe_left
                           (FStar_Extraction_ML_Syntax.with_ty t1)
                           (FStar_Extraction_ML_Syntax.MLE_Fun (vs_ts, tapp)) in
                       (f, FStar_Extraction_ML_Syntax.E_PURE, t1))
                else
                  failwith
                    "Impossible: instantiate_maybe_partial called with too many arguments"
let (eta_expand :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Extraction_ML_Syntax.mlty ->
      FStar_Extraction_ML_Syntax.mlexpr -> FStar_Extraction_ML_Syntax.mlexpr)
  =
  fun g ->
    fun t ->
      fun e ->
        let uu____2086 = FStar_Extraction_ML_Util.doms_and_cod t in
        match uu____2086 with
        | (ts, r) ->
            if ts = []
            then e
            else
              (let uu____2102 = fresh_mlidents ts g in
               match uu____2102 with
               | (vs_ts, g1) ->
                   let vs_es =
                     FStar_List.map
                       (fun uu____2137 ->
                          match uu____2137 with
                          | (v, t1) ->
                              FStar_Extraction_ML_Syntax.with_ty t1
                                (FStar_Extraction_ML_Syntax.MLE_Var v)) vs_ts in
                   let body =
                     FStar_All.pipe_left
                       (FStar_Extraction_ML_Syntax.with_ty r)
                       (FStar_Extraction_ML_Syntax.MLE_App (e, vs_es)) in
                   FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty t)
                     (FStar_Extraction_ML_Syntax.MLE_Fun (vs_ts, body)))
let (default_value_for_ty :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Extraction_ML_Syntax.mlty -> FStar_Extraction_ML_Syntax.mlexpr)
  =
  fun g ->
    fun t ->
      let uu____2163 = FStar_Extraction_ML_Util.doms_and_cod t in
      match uu____2163 with
      | (ts, r) ->
          let body r1 =
            let r2 =
              let uu____2183 = FStar_Extraction_ML_Util.udelta_unfold g r1 in
              match uu____2183 with
              | FStar_Pervasives_Native.None -> r1
              | FStar_Pervasives_Native.Some r2 -> r2 in
            match r2 with
            | FStar_Extraction_ML_Syntax.MLTY_Erased ->
                FStar_Extraction_ML_Syntax.ml_unit
            | FStar_Extraction_ML_Syntax.MLTY_Top ->
                FStar_Extraction_ML_Syntax.apply_obj_repr
                  FStar_Extraction_ML_Syntax.ml_unit
                  FStar_Extraction_ML_Syntax.MLTY_Erased
            | uu____2187 ->
                FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty r2)
                  (FStar_Extraction_ML_Syntax.MLE_Coerce
                     (FStar_Extraction_ML_Syntax.ml_unit,
                       FStar_Extraction_ML_Syntax.MLTY_Erased, r2)) in
          if ts = []
          then body r
          else
            (let uu____2191 = fresh_mlidents ts g in
             match uu____2191 with
             | (vs_ts, g1) ->
                 let uu____2216 =
                   let uu____2217 =
                     let uu____2228 = body r in (vs_ts, uu____2228) in
                   FStar_Extraction_ML_Syntax.MLE_Fun uu____2217 in
                 FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty t)
                   uu____2216)
let (maybe_eta_expand :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Extraction_ML_Syntax.mlty ->
      FStar_Extraction_ML_Syntax.mlexpr -> FStar_Extraction_ML_Syntax.mlexpr)
  =
  fun g ->
    fun expect ->
      fun e ->
        let uu____2250 =
          (FStar_Options.ml_no_eta_expand_coertions ()) ||
            (let uu____2252 = FStar_Options.codegen () in
             uu____2252 =
               (FStar_Pervasives_Native.Some FStar_Options.Kremlin)) in
        if uu____2250 then e else eta_expand g expect e
let (apply_coercion :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Extraction_ML_Syntax.mlexpr ->
      FStar_Extraction_ML_Syntax.mlty ->
        FStar_Extraction_ML_Syntax.mlty -> FStar_Extraction_ML_Syntax.mlexpr)
  =
  fun g ->
    fun e ->
      fun ty ->
        fun expect ->
          let mk_fun binder body =
            match body.FStar_Extraction_ML_Syntax.expr with
            | FStar_Extraction_ML_Syntax.MLE_Fun (binders, body1) ->
                FStar_Extraction_ML_Syntax.MLE_Fun
                  ((binder :: binders), body1)
            | uu____2321 ->
                FStar_Extraction_ML_Syntax.MLE_Fun ([binder], body) in
          let rec aux e1 ty1 expect1 =
            let coerce_branch uu____2373 =
              match uu____2373 with
              | (pat, w, b) ->
                  let uu____2397 = aux b ty1 expect1 in (pat, w, uu____2397) in
            match ((e1.FStar_Extraction_ML_Syntax.expr), ty1, expect1) with
            | (FStar_Extraction_ML_Syntax.MLE_Fun (arg::rest, body),
               FStar_Extraction_ML_Syntax.MLTY_Fun (t0, uu____2404, t1),
               FStar_Extraction_ML_Syntax.MLTY_Fun (s0, uu____2407, s1)) ->
                let body1 =
                  match rest with
                  | [] -> body
                  | uu____2434 ->
                      FStar_Extraction_ML_Syntax.with_ty t1
                        (FStar_Extraction_ML_Syntax.MLE_Fun (rest, body)) in
                let body2 = aux body1 t1 s1 in
                let uu____2448 = type_leq g s0 t0 in
                if uu____2448
                then
                  FStar_Extraction_ML_Syntax.with_ty expect1
                    (mk_fun arg body2)
                else
                  (let lb =
                     let uu____2451 =
                       let uu____2452 =
                         let uu____2453 =
                           let uu____2460 =
                             FStar_All.pipe_left
                               (FStar_Extraction_ML_Syntax.with_ty s0)
                               (FStar_Extraction_ML_Syntax.MLE_Var
                                  (FStar_Pervasives_Native.fst arg)) in
                           (uu____2460, s0, t0) in
                         FStar_Extraction_ML_Syntax.MLE_Coerce uu____2453 in
                       FStar_Extraction_ML_Syntax.with_ty t0 uu____2452 in
                     {
                       FStar_Extraction_ML_Syntax.mllb_name =
                         (FStar_Pervasives_Native.fst arg);
                       FStar_Extraction_ML_Syntax.mllb_tysc =
                         (FStar_Pervasives_Native.Some ([], t0));
                       FStar_Extraction_ML_Syntax.mllb_add_unit = false;
                       FStar_Extraction_ML_Syntax.mllb_def = uu____2451;
                       FStar_Extraction_ML_Syntax.mllb_meta = [];
                       FStar_Extraction_ML_Syntax.print_typ = false
                     } in
                   let body3 =
                     FStar_All.pipe_left
                       (FStar_Extraction_ML_Syntax.with_ty s1)
                       (FStar_Extraction_ML_Syntax.MLE_Let
                          ((FStar_Extraction_ML_Syntax.NonRec, [lb]), body2)) in
                   FStar_Extraction_ML_Syntax.with_ty expect1
                     (mk_fun ((FStar_Pervasives_Native.fst arg), s0) body3))
            | (FStar_Extraction_ML_Syntax.MLE_Let (lbs, body), uu____2472,
               uu____2473) ->
                let uu____2486 =
                  let uu____2487 =
                    let uu____2498 = aux body ty1 expect1 in
                    (lbs, uu____2498) in
                  FStar_Extraction_ML_Syntax.MLE_Let uu____2487 in
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty expect1) uu____2486
            | (FStar_Extraction_ML_Syntax.MLE_Match (s, branches),
               uu____2507, uu____2508) ->
                let uu____2529 =
                  let uu____2530 =
                    let uu____2545 = FStar_List.map coerce_branch branches in
                    (s, uu____2545) in
                  FStar_Extraction_ML_Syntax.MLE_Match uu____2530 in
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty expect1) uu____2529
            | (FStar_Extraction_ML_Syntax.MLE_If (s, b1, b2_opt), uu____2585,
               uu____2586) ->
                let uu____2591 =
                  let uu____2592 =
                    let uu____2601 = aux b1 ty1 expect1 in
                    let uu____2602 =
                      FStar_Util.map_opt b2_opt
                        (fun b2 -> aux b2 ty1 expect1) in
                    (s, uu____2601, uu____2602) in
                  FStar_Extraction_ML_Syntax.MLE_If uu____2592 in
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty expect1) uu____2591
            | (FStar_Extraction_ML_Syntax.MLE_Seq es, uu____2610, uu____2611)
                ->
                let uu____2614 = FStar_Util.prefix es in
                (match uu____2614 with
                 | (prefix, last) ->
                     let uu____2627 =
                       let uu____2628 =
                         let uu____2631 =
                           let uu____2634 = aux last ty1 expect1 in
                           [uu____2634] in
                         FStar_List.append prefix uu____2631 in
                       FStar_Extraction_ML_Syntax.MLE_Seq uu____2628 in
                     FStar_All.pipe_left
                       (FStar_Extraction_ML_Syntax.with_ty expect1)
                       uu____2627)
            | (FStar_Extraction_ML_Syntax.MLE_Try (s, branches), uu____2637,
               uu____2638) ->
                let uu____2659 =
                  let uu____2660 =
                    let uu____2675 = FStar_List.map coerce_branch branches in
                    (s, uu____2675) in
                  FStar_Extraction_ML_Syntax.MLE_Try uu____2660 in
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty expect1) uu____2659
            | uu____2712 ->
                FStar_Extraction_ML_Syntax.with_ty expect1
                  (FStar_Extraction_ML_Syntax.MLE_Coerce (e1, ty1, expect1)) in
          aux e ty expect
let maybe_coerce :
  'uuuuuu2731 .
    'uuuuuu2731 ->
      FStar_Extraction_ML_UEnv.uenv ->
        FStar_Extraction_ML_Syntax.mlexpr ->
          FStar_Extraction_ML_Syntax.mlty ->
            FStar_Extraction_ML_Syntax.mlty ->
              FStar_Extraction_ML_Syntax.mlexpr
  =
  fun pos ->
    fun g ->
      fun e ->
        fun ty ->
          fun expect ->
            let ty1 = eraseTypeDeep g ty in
            let uu____2758 =
              type_leq_c g (FStar_Pervasives_Native.Some e) ty1 expect in
            match uu____2758 with
            | (true, FStar_Pervasives_Native.Some e') -> e'
            | uu____2768 ->
                (match ty1 with
                 | FStar_Extraction_ML_Syntax.MLTY_Erased ->
                     default_value_for_ty g expect
                 | uu____2775 ->
                     let uu____2776 =
                       let uu____2777 =
                         FStar_Extraction_ML_Util.erase_effect_annotations
                           ty1 in
                       let uu____2778 =
                         FStar_Extraction_ML_Util.erase_effect_annotations
                           expect in
                       type_leq g uu____2777 uu____2778 in
                     if uu____2776
                     then
                       (FStar_Extraction_ML_UEnv.debug g
                          (fun uu____2783 ->
                             let uu____2784 =
                               let uu____2785 =
                                 FStar_Extraction_ML_UEnv.current_module_of_uenv
                                   g in
                               FStar_Extraction_ML_Code.string_of_mlexpr
                                 uu____2785 e in
                             let uu____2786 =
                               let uu____2787 =
                                 FStar_Extraction_ML_UEnv.current_module_of_uenv
                                   g in
                               FStar_Extraction_ML_Code.string_of_mlty
                                 uu____2787 ty1 in
                             FStar_Util.print2
                               "\n Effect mismatch on type of %s : %s\n"
                               uu____2784 uu____2786);
                        e)
                     else
                       (FStar_Extraction_ML_UEnv.debug g
                          (fun uu____2794 ->
                             let uu____2795 =
                               let uu____2796 =
                                 FStar_Extraction_ML_UEnv.current_module_of_uenv
                                   g in
                               FStar_Extraction_ML_Code.string_of_mlexpr
                                 uu____2796 e in
                             let uu____2797 =
                               let uu____2798 =
                                 FStar_Extraction_ML_UEnv.current_module_of_uenv
                                   g in
                               FStar_Extraction_ML_Code.string_of_mlty
                                 uu____2798 ty1 in
                             let uu____2799 =
                               let uu____2800 =
                                 FStar_Extraction_ML_UEnv.current_module_of_uenv
                                   g in
                               FStar_Extraction_ML_Code.string_of_mlty
                                 uu____2800 expect in
                             FStar_Util.print3
                               "\n (*needed to coerce expression \n %s \n of type \n %s \n to type \n %s *) \n"
                               uu____2795 uu____2797 uu____2799);
                        (let uu____2801 = apply_coercion g e ty1 expect in
                         maybe_eta_expand g expect uu____2801)))
let (bv_as_mlty :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.bv -> FStar_Extraction_ML_Syntax.mlty)
  =
  fun g ->
    fun bv ->
      let uu____2812 = FStar_Extraction_ML_UEnv.lookup_bv g bv in
      match uu____2812 with
      | FStar_Util.Inl ty_b -> ty_b.FStar_Extraction_ML_UEnv.ty_b_ty
      | uu____2814 -> FStar_Extraction_ML_Syntax.MLTY_Top
let (extraction_norm_steps : FStar_TypeChecker_Env.step Prims.list) =
  let extraction_norm_steps_core =
    [FStar_TypeChecker_Env.AllowUnboundUniverses;
    FStar_TypeChecker_Env.EraseUniverses;
    FStar_TypeChecker_Env.Inlining;
    FStar_TypeChecker_Env.Eager_unfolding;
    FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta;
    FStar_TypeChecker_Env.Primops;
    FStar_TypeChecker_Env.Unascribe;
    FStar_TypeChecker_Env.ForExtraction] in
  let extraction_norm_steps_nbe = FStar_TypeChecker_Env.NBE ::
    extraction_norm_steps_core in
  let uu____2823 = FStar_Options.use_nbe_for_extraction () in
  if uu____2823
  then extraction_norm_steps_nbe
  else extraction_norm_steps_core
let (comp_no_args :
  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax ->
    FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax)
  =
  fun c ->
    match c.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Total uu____2840 -> c
    | FStar_Syntax_Syntax.GTotal uu____2849 -> c
    | FStar_Syntax_Syntax.Comp ct ->
        let effect_args =
          FStar_List.map
            (fun uu____2885 ->
               match uu____2885 with
               | (uu____2900, aq) -> (FStar_Syntax_Syntax.t_unit, aq))
            ct.FStar_Syntax_Syntax.effect_args in
        let ct1 =
          let uu___551_2913 = ct in
          {
            FStar_Syntax_Syntax.comp_univs =
              (uu___551_2913.FStar_Syntax_Syntax.comp_univs);
            FStar_Syntax_Syntax.effect_name =
              (uu___551_2913.FStar_Syntax_Syntax.effect_name);
            FStar_Syntax_Syntax.result_typ =
              (uu___551_2913.FStar_Syntax_Syntax.result_typ);
            FStar_Syntax_Syntax.effect_args = effect_args;
            FStar_Syntax_Syntax.flags =
              (uu___551_2913.FStar_Syntax_Syntax.flags)
          } in
        let c1 =
          let uu___554_2917 = c in
          {
            FStar_Syntax_Syntax.n = (FStar_Syntax_Syntax.Comp ct1);
            FStar_Syntax_Syntax.pos = (uu___554_2917.FStar_Syntax_Syntax.pos);
            FStar_Syntax_Syntax.vars =
              (uu___554_2917.FStar_Syntax_Syntax.vars)
          } in
        c1
let maybe_reify_comp :
  'uuuuuu2928 .
    'uuuuuu2928 ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.term
  =
  fun g ->
    fun env ->
      fun c ->
        let c1 = comp_no_args c in
        let uu____2947 =
          let uu____2948 =
            let uu____2949 =
              FStar_All.pipe_right c1 FStar_Syntax_Util.comp_effect_name in
            FStar_All.pipe_right uu____2949
              (FStar_TypeChecker_Env.norm_eff_name env) in
          FStar_All.pipe_right uu____2948
            (FStar_TypeChecker_Env.is_reifiable_effect env) in
        if uu____2947
        then
          let uu____2952 =
            FStar_TypeChecker_Env.reify_comp env c1
              FStar_Syntax_Syntax.U_unknown in
          FStar_All.pipe_right uu____2952
            (FStar_TypeChecker_Normalize.normalize extraction_norm_steps env)
        else FStar_Syntax_Util.comp_result c1
let rec (translate_term_to_mlty :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.term -> FStar_Extraction_ML_Syntax.mlty)
  =
  fun g ->
    fun t0 ->
      let arg_as_mlty g1 uu____2998 =
        match uu____2998 with
        | (a, uu____3006) ->
            let uu____3011 = is_type g1 a in
            if uu____3011
            then translate_term_to_mlty g1 a
            else FStar_Extraction_ML_Syntax.MLTY_Erased in
      let fv_app_as_mlty g1 fv args =
        let uu____3029 =
          let uu____3030 = FStar_Extraction_ML_UEnv.is_fv_type g1 fv in
          Prims.op_Negation uu____3030 in
        if uu____3029
        then FStar_Extraction_ML_Syntax.MLTY_Top
        else
          (let uu____3032 =
             let uu____3039 =
               let uu____3048 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g1 in
               FStar_TypeChecker_Env.lookup_lid uu____3048
                 (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
             match uu____3039 with
             | ((uu____3055, fvty), uu____3057) ->
                 let fvty1 =
                   let uu____3063 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g1 in
                   FStar_TypeChecker_Normalize.normalize
                     [FStar_TypeChecker_Env.UnfoldUntil
                        FStar_Syntax_Syntax.delta_constant;
                     FStar_TypeChecker_Env.ForExtraction] uu____3063 fvty in
                 FStar_Syntax_Util.arrow_formals fvty1 in
           match uu____3032 with
           | (formals, uu____3065) ->
               let mlargs = FStar_List.map (arg_as_mlty g1) args in
               let mlargs1 =
                 let n_args = FStar_List.length args in
                 if (FStar_List.length formals) > n_args
                 then
                   let uu____3101 = FStar_Util.first_N n_args formals in
                   match uu____3101 with
                   | (uu____3130, rest) ->
                       let uu____3164 =
                         FStar_List.map
                           (fun uu____3174 ->
                              FStar_Extraction_ML_Syntax.MLTY_Erased) rest in
                       FStar_List.append mlargs uu____3164
                 else mlargs in
               let nm =
                 FStar_Extraction_ML_UEnv.mlpath_of_lident g1
                   (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
               FStar_Extraction_ML_Syntax.MLTY_Named (mlargs1, nm)) in
      let aux env t =
        let t1 = FStar_Syntax_Subst.compress t in
        match t1.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Tm_type uu____3197 ->
            FStar_Extraction_ML_Syntax.MLTY_Erased
        | FStar_Syntax_Syntax.Tm_bvar uu____3198 ->
            let uu____3199 =
              let uu____3200 = FStar_Syntax_Print.term_to_string t1 in
              FStar_Util.format1 "Impossible: Unexpected term %s" uu____3200 in
            failwith uu____3199
        | FStar_Syntax_Syntax.Tm_delayed uu____3201 ->
            let uu____3216 =
              let uu____3217 = FStar_Syntax_Print.term_to_string t1 in
              FStar_Util.format1 "Impossible: Unexpected term %s" uu____3217 in
            failwith uu____3216
        | FStar_Syntax_Syntax.Tm_unknown ->
            let uu____3218 =
              let uu____3219 = FStar_Syntax_Print.term_to_string t1 in
              FStar_Util.format1 "Impossible: Unexpected term %s" uu____3219 in
            failwith uu____3218
        | FStar_Syntax_Syntax.Tm_lazy i ->
            let uu____3221 = FStar_Syntax_Util.unfold_lazy i in
            translate_term_to_mlty env uu____3221
        | FStar_Syntax_Syntax.Tm_constant uu____3222 ->
            FStar_Extraction_ML_Syntax.MLTY_Top
        | FStar_Syntax_Syntax.Tm_quoted uu____3223 ->
            FStar_Extraction_ML_Syntax.MLTY_Top
        | FStar_Syntax_Syntax.Tm_uvar uu____3230 ->
            FStar_Extraction_ML_Syntax.MLTY_Top
        | FStar_Syntax_Syntax.Tm_meta (t2, uu____3244) ->
            translate_term_to_mlty env t2
        | FStar_Syntax_Syntax.Tm_refine
            ({ FStar_Syntax_Syntax.ppname = uu____3249;
               FStar_Syntax_Syntax.index = uu____3250;
               FStar_Syntax_Syntax.sort = t2;_},
             uu____3252)
            -> translate_term_to_mlty env t2
        | FStar_Syntax_Syntax.Tm_uinst (t2, uu____3260) ->
            translate_term_to_mlty env t2
        | FStar_Syntax_Syntax.Tm_ascribed (t2, uu____3266, uu____3267) ->
            translate_term_to_mlty env t2
        | FStar_Syntax_Syntax.Tm_name bv -> bv_as_mlty env bv
        | FStar_Syntax_Syntax.Tm_fvar fv -> fv_app_as_mlty env fv []
        | FStar_Syntax_Syntax.Tm_arrow (bs, c) ->
            let uu____3340 = FStar_Syntax_Subst.open_comp bs c in
            (match uu____3340 with
             | (bs1, c1) ->
                 let uu____3347 = binders_as_ml_binders env bs1 in
                 (match uu____3347 with
                  | (mlbs, env1) ->
                      let t_ret =
                        let uu____3373 =
                          let uu____3374 =
                            FStar_Extraction_ML_UEnv.tcenv_of_uenv env1 in
                          maybe_reify_comp env1 uu____3374 c1 in
                        translate_term_to_mlty env1 uu____3373 in
                      let erase =
                        effect_as_etag env1
                          (FStar_Syntax_Util.comp_effect_name c1) in
                      let uu____3376 =
                        FStar_List.fold_right
                          (fun uu____3395 ->
                             fun uu____3396 ->
                               match (uu____3395, uu____3396) with
                               | ((uu____3417, t2), (tag, t')) ->
                                   (FStar_Extraction_ML_Syntax.E_PURE,
                                     (FStar_Extraction_ML_Syntax.MLTY_Fun
                                        (t2, tag, t')))) mlbs (erase, t_ret) in
                      (match uu____3376 with | (uu____3429, t2) -> t2)))
        | FStar_Syntax_Syntax.Tm_app (head, args) ->
            let res =
              let uu____3458 =
                let uu____3459 = FStar_Syntax_Util.un_uinst head in
                uu____3459.FStar_Syntax_Syntax.n in
              match uu____3458 with
              | FStar_Syntax_Syntax.Tm_name bv -> bv_as_mlty env bv
              | FStar_Syntax_Syntax.Tm_fvar fv -> fv_app_as_mlty env fv args
              | FStar_Syntax_Syntax.Tm_app (head1, args') ->
                  let uu____3490 =
                    FStar_Syntax_Syntax.mk
                      (FStar_Syntax_Syntax.Tm_app
                         (head1, (FStar_List.append args' args)))
                      t1.FStar_Syntax_Syntax.pos in
                  translate_term_to_mlty env uu____3490
              | uu____3511 -> FStar_Extraction_ML_Syntax.MLTY_Top in
            res
        | FStar_Syntax_Syntax.Tm_abs (bs, ty, uu____3514) ->
            let uu____3539 = FStar_Syntax_Subst.open_term bs ty in
            (match uu____3539 with
             | (bs1, ty1) ->
                 let uu____3546 = binders_as_ml_binders env bs1 in
                 (match uu____3546 with
                  | (bts, env1) -> translate_term_to_mlty env1 ty1))
        | FStar_Syntax_Syntax.Tm_let uu____3571 ->
            FStar_Extraction_ML_Syntax.MLTY_Top
        | FStar_Syntax_Syntax.Tm_match uu____3584 ->
            FStar_Extraction_ML_Syntax.MLTY_Top in
      let rec is_top_ty t =
        match t with
        | FStar_Extraction_ML_Syntax.MLTY_Top -> true
        | FStar_Extraction_ML_Syntax.MLTY_Named uu____3613 ->
            let uu____3620 = FStar_Extraction_ML_Util.udelta_unfold g t in
            (match uu____3620 with
             | FStar_Pervasives_Native.None -> false
             | FStar_Pervasives_Native.Some t1 -> is_top_ty t1)
        | uu____3624 -> false in
      let uu____3625 =
        let uu____3626 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
        FStar_TypeChecker_Util.must_erase_for_extraction uu____3626 t0 in
      if uu____3625
      then FStar_Extraction_ML_Syntax.MLTY_Erased
      else
        (let mlt = aux g t0 in
         let uu____3629 = is_top_ty mlt in
         if uu____3629 then FStar_Extraction_ML_Syntax.MLTY_Top else mlt)
and (binders_as_ml_binders :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.binders ->
      ((FStar_Extraction_ML_Syntax.mlident * FStar_Extraction_ML_Syntax.mlty)
        Prims.list * FStar_Extraction_ML_UEnv.uenv))
  =
  fun g ->
    fun bs ->
      let uu____3643 =
        FStar_All.pipe_right bs
          (FStar_List.fold_left
             (fun uu____3697 ->
                fun b ->
                  match uu____3697 with
                  | (ml_bs, env) ->
                      let uu____3739 = is_type_binder g b in
                      if uu____3739
                      then
                        let b1 = FStar_Pervasives_Native.fst b in
                        let env1 =
                          FStar_Extraction_ML_UEnv.extend_ty env b1 true in
                        let ml_b =
                          let uu____3757 =
                            FStar_Extraction_ML_UEnv.lookup_ty env1 b1 in
                          uu____3757.FStar_Extraction_ML_UEnv.ty_b_name in
                        let ml_b1 =
                          (ml_b, FStar_Extraction_ML_Syntax.ml_unit_ty) in
                        ((ml_b1 :: ml_bs), env1)
                      else
                        (let b1 = FStar_Pervasives_Native.fst b in
                         let t =
                           translate_term_to_mlty env
                             b1.FStar_Syntax_Syntax.sort in
                         let uu____3778 =
                           FStar_Extraction_ML_UEnv.extend_bv env b1 
                             ([], t) false false in
                         match uu____3778 with
                         | (env1, b2, uu____3797) ->
                             let ml_b = (b2, t) in ((ml_b :: ml_bs), env1)))
             ([], g)) in
      match uu____3643 with | (ml_bs, env) -> ((FStar_List.rev ml_bs), env)
let (term_as_mlty :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.term -> FStar_Extraction_ML_Syntax.mlty)
  =
  fun g ->
    fun t0 ->
      let t =
        let uu____3868 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
        FStar_TypeChecker_Normalize.normalize extraction_norm_steps
          uu____3868 t0 in
      translate_term_to_mlty g t
let (mk_MLE_Seq :
  FStar_Extraction_ML_Syntax.mlexpr ->
    FStar_Extraction_ML_Syntax.mlexpr -> FStar_Extraction_ML_Syntax.mlexpr')
  =
  fun e1 ->
    fun e2 ->
      match ((e1.FStar_Extraction_ML_Syntax.expr),
              (e2.FStar_Extraction_ML_Syntax.expr))
      with
      | (FStar_Extraction_ML_Syntax.MLE_Seq es1,
         FStar_Extraction_ML_Syntax.MLE_Seq es2) ->
          FStar_Extraction_ML_Syntax.MLE_Seq (FStar_List.append es1 es2)
      | (FStar_Extraction_ML_Syntax.MLE_Seq es1, uu____3886) ->
          FStar_Extraction_ML_Syntax.MLE_Seq (FStar_List.append es1 [e2])
      | (uu____3889, FStar_Extraction_ML_Syntax.MLE_Seq es2) ->
          FStar_Extraction_ML_Syntax.MLE_Seq (e1 :: es2)
      | uu____3893 -> FStar_Extraction_ML_Syntax.MLE_Seq [e1; e2]
let (mk_MLE_Let :
  Prims.bool ->
    FStar_Extraction_ML_Syntax.mlletbinding ->
      FStar_Extraction_ML_Syntax.mlexpr -> FStar_Extraction_ML_Syntax.mlexpr')
  =
  fun top_level ->
    fun lbs ->
      fun body ->
        match lbs with
        | (FStar_Extraction_ML_Syntax.NonRec, lb::[]) when
            Prims.op_Negation top_level ->
            (match lb.FStar_Extraction_ML_Syntax.mllb_tysc with
             | FStar_Pervasives_Native.Some ([], t) when
                 t = FStar_Extraction_ML_Syntax.ml_unit_ty ->
                 if
                   body.FStar_Extraction_ML_Syntax.expr =
                     FStar_Extraction_ML_Syntax.ml_unit.FStar_Extraction_ML_Syntax.expr
                 then
                   (lb.FStar_Extraction_ML_Syntax.mllb_def).FStar_Extraction_ML_Syntax.expr
                 else
                   (match body.FStar_Extraction_ML_Syntax.expr with
                    | FStar_Extraction_ML_Syntax.MLE_Var x when
                        x = lb.FStar_Extraction_ML_Syntax.mllb_name ->
                        (lb.FStar_Extraction_ML_Syntax.mllb_def).FStar_Extraction_ML_Syntax.expr
                    | uu____3919 when
                        (lb.FStar_Extraction_ML_Syntax.mllb_def).FStar_Extraction_ML_Syntax.expr
                          =
                          FStar_Extraction_ML_Syntax.ml_unit.FStar_Extraction_ML_Syntax.expr
                        -> body.FStar_Extraction_ML_Syntax.expr
                    | uu____3920 ->
                        mk_MLE_Seq lb.FStar_Extraction_ML_Syntax.mllb_def
                          body)
             | uu____3921 -> FStar_Extraction_ML_Syntax.MLE_Let (lbs, body))
        | uu____3930 -> FStar_Extraction_ML_Syntax.MLE_Let (lbs, body)
let record_fields :
  'a .
    FStar_Extraction_ML_UEnv.uenv ->
      FStar_Ident.lident ->
        FStar_Ident.ident Prims.list ->
          'a Prims.list ->
            (FStar_Extraction_ML_Syntax.mlsymbol * 'a) Prims.list
  =
  fun g ->
    fun ty ->
      fun fns ->
        fun xs ->
          let fns1 =
            FStar_List.map
              (fun x ->
                 FStar_Extraction_ML_UEnv.lookup_record_field_name g (ty, x))
              fns in
          FStar_List.map2
            (fun uu____4001 ->
               fun x -> match uu____4001 with | (p, s) -> (s, x)) fns1 xs
let (resugar_pat :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.fv_qual FStar_Pervasives_Native.option ->
      FStar_Extraction_ML_Syntax.mlpattern ->
        FStar_Extraction_ML_Syntax.mlpattern)
  =
  fun g ->
    fun q ->
      fun p ->
        match p with
        | FStar_Extraction_ML_Syntax.MLP_CTor (d, pats) ->
            let uu____4044 = FStar_Extraction_ML_Util.is_xtuple d in
            (match uu____4044 with
             | FStar_Pervasives_Native.Some n ->
                 FStar_Extraction_ML_Syntax.MLP_Tuple pats
             | uu____4048 ->
                 (match q with
                  | FStar_Pervasives_Native.Some
                      (FStar_Syntax_Syntax.Record_ctor (ty, fns)) ->
                      let path =
                        let uu____4060 = FStar_Ident.ns_of_lid ty in
                        FStar_List.map FStar_Ident.string_of_id uu____4060 in
                      let fs = record_fields g ty fns pats in
                      FStar_Extraction_ML_Syntax.MLP_Record (path, fs)
                  | uu____4078 -> p))
        | uu____4081 -> p
let rec (extract_one_pat :
  Prims.bool ->
    FStar_Extraction_ML_UEnv.uenv ->
      FStar_Syntax_Syntax.pat ->
        FStar_Extraction_ML_Syntax.mlty FStar_Pervasives_Native.option ->
          (FStar_Extraction_ML_UEnv.uenv ->
             FStar_Syntax_Syntax.term ->
               (FStar_Extraction_ML_Syntax.mlexpr *
                 FStar_Extraction_ML_Syntax.e_tag *
                 FStar_Extraction_ML_Syntax.mlty))
            ->
            (FStar_Extraction_ML_UEnv.uenv *
              (FStar_Extraction_ML_Syntax.mlpattern *
              FStar_Extraction_ML_Syntax.mlexpr Prims.list)
              FStar_Pervasives_Native.option * Prims.bool))
  =
  fun imp ->
    fun g ->
      fun p ->
        fun expected_topt ->
          fun term_as_mlexpr ->
            let ok t =
              match expected_topt with
              | FStar_Pervasives_Native.None -> true
              | FStar_Pervasives_Native.Some t' ->
                  let ok = type_leq g t t' in
                  (if Prims.op_Negation ok
                   then
                     FStar_Extraction_ML_UEnv.debug g
                       (fun uu____4173 ->
                          let uu____4174 =
                            let uu____4175 =
                              FStar_Extraction_ML_UEnv.current_module_of_uenv
                                g in
                            FStar_Extraction_ML_Code.string_of_mlty
                              uu____4175 t' in
                          let uu____4176 =
                            let uu____4177 =
                              FStar_Extraction_ML_UEnv.current_module_of_uenv
                                g in
                            FStar_Extraction_ML_Code.string_of_mlty
                              uu____4177 t in
                          FStar_Util.print2
                            "Expected pattern type %s; got pattern type %s\n"
                            uu____4174 uu____4176)
                   else ();
                   ok) in
            match p.FStar_Syntax_Syntax.v with
            | FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_int
                (c, swopt)) when
                let uu____4207 = FStar_Options.codegen () in
                uu____4207 <>
                  (FStar_Pervasives_Native.Some FStar_Options.Kremlin)
                ->
                let uu____4212 =
                  match swopt with
                  | FStar_Pervasives_Native.None ->
                      let uu____4225 =
                        let uu____4226 =
                          let uu____4227 =
                            FStar_Extraction_ML_Util.mlconst_of_const
                              p.FStar_Syntax_Syntax.p
                              (FStar_Const.Const_int
                                 (c, FStar_Pervasives_Native.None)) in
                          FStar_Extraction_ML_Syntax.MLE_Const uu____4227 in
                        FStar_All.pipe_left
                          (FStar_Extraction_ML_Syntax.with_ty
                             FStar_Extraction_ML_Syntax.ml_int_ty) uu____4226 in
                      (uu____4225, FStar_Extraction_ML_Syntax.ml_int_ty)
                  | FStar_Pervasives_Native.Some sw ->
                      let source_term =
                        let uu____4248 =
                          let uu____4249 =
                            FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
                          uu____4249.FStar_TypeChecker_Env.dsenv in
                        FStar_ToSyntax_ToSyntax.desugar_machine_integer
                          uu____4248 c sw FStar_Range.dummyRange in
                      let uu____4250 = term_as_mlexpr g source_term in
                      (match uu____4250 with
                       | (mlterm, uu____4262, mlty) -> (mlterm, mlty)) in
                (match uu____4212 with
                 | (mlc, ml_ty) ->
                     let uu____4280 = FStar_Extraction_ML_UEnv.new_mlident g in
                     (match uu____4280 with
                      | (g1, x) ->
                          let when_clause =
                            let uu____4302 =
                              let uu____4303 =
                                let uu____4310 =
                                  let uu____4313 =
                                    FStar_All.pipe_left
                                      (FStar_Extraction_ML_Syntax.with_ty
                                         ml_ty)
                                      (FStar_Extraction_ML_Syntax.MLE_Var x) in
                                  [uu____4313; mlc] in
                                (FStar_Extraction_ML_Util.prims_op_equality,
                                  uu____4310) in
                              FStar_Extraction_ML_Syntax.MLE_App uu____4303 in
                            FStar_All.pipe_left
                              (FStar_Extraction_ML_Syntax.with_ty
                                 FStar_Extraction_ML_Syntax.ml_bool_ty)
                              uu____4302 in
                          let uu____4316 = ok ml_ty in
                          (g1,
                            (FStar_Pervasives_Native.Some
                               ((FStar_Extraction_ML_Syntax.MLP_Var x),
                                 [when_clause])), uu____4316)))
            | FStar_Syntax_Syntax.Pat_constant s ->
                let t =
                  let uu____4335 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
                  FStar_TypeChecker_TcTerm.tc_constant uu____4335
                    FStar_Range.dummyRange s in
                let mlty = term_as_mlty g t in
                let uu____4337 =
                  let uu____4346 =
                    let uu____4353 =
                      let uu____4354 =
                        FStar_Extraction_ML_Util.mlconst_of_const
                          p.FStar_Syntax_Syntax.p s in
                      FStar_Extraction_ML_Syntax.MLP_Const uu____4354 in
                    (uu____4353, []) in
                  FStar_Pervasives_Native.Some uu____4346 in
                let uu____4363 = ok mlty in (g, uu____4337, uu____4363)
            | FStar_Syntax_Syntax.Pat_var x ->
                let mlty = term_as_mlty g x.FStar_Syntax_Syntax.sort in
                let uu____4374 =
                  FStar_Extraction_ML_UEnv.extend_bv g x ([], mlty) false imp in
                (match uu____4374 with
                 | (g1, x1, uu____4397) ->
                     let uu____4398 = ok mlty in
                     (g1,
                       (if imp
                        then FStar_Pervasives_Native.None
                        else
                          FStar_Pervasives_Native.Some
                            ((FStar_Extraction_ML_Syntax.MLP_Var x1), [])),
                       uu____4398))
            | FStar_Syntax_Syntax.Pat_wild x ->
                let mlty = term_as_mlty g x.FStar_Syntax_Syntax.sort in
                let uu____4432 =
                  FStar_Extraction_ML_UEnv.extend_bv g x ([], mlty) false imp in
                (match uu____4432 with
                 | (g1, x1, uu____4455) ->
                     let uu____4456 = ok mlty in
                     (g1,
                       (if imp
                        then FStar_Pervasives_Native.None
                        else
                          FStar_Pervasives_Native.Some
                            ((FStar_Extraction_ML_Syntax.MLP_Var x1), [])),
                       uu____4456))
            | FStar_Syntax_Syntax.Pat_dot_term uu____4488 ->
                (g, FStar_Pervasives_Native.None, true)
            | FStar_Syntax_Syntax.Pat_cons (f, pats) ->
                let uu____4527 =
                  let uu____4536 = FStar_Extraction_ML_UEnv.lookup_fv g f in
                  match uu____4536 with
                  | { FStar_Extraction_ML_UEnv.exp_b_name = uu____4545;
                      FStar_Extraction_ML_UEnv.exp_b_expr =
                        {
                          FStar_Extraction_ML_Syntax.expr =
                            FStar_Extraction_ML_Syntax.MLE_Name n;
                          FStar_Extraction_ML_Syntax.mlty = uu____4547;
                          FStar_Extraction_ML_Syntax.loc = uu____4548;_};
                      FStar_Extraction_ML_UEnv.exp_b_tscheme = ttys;_} ->
                      (n, ttys)
                  | uu____4554 -> failwith "Expected a constructor" in
                (match uu____4527 with
                 | (d, tys) ->
                     let nTyVars =
                       FStar_List.length (FStar_Pervasives_Native.fst tys) in
                     let uu____4588 = FStar_Util.first_N nTyVars pats in
                     (match uu____4588 with
                      | (tysVarPats, restPats) ->
                          let f_ty_opt =
                            try
                              (fun uu___853_4684 ->
                                 match () with
                                 | () ->
                                     let mlty_args =
                                       FStar_All.pipe_right tysVarPats
                                         (FStar_List.map
                                            (fun uu____4713 ->
                                               match uu____4713 with
                                               | (p1, uu____4719) ->
                                                   (match p1.FStar_Syntax_Syntax.v
                                                    with
                                                    | FStar_Syntax_Syntax.Pat_dot_term
                                                        (uu____4720, t) ->
                                                        term_as_mlty g t
                                                    | uu____4726 ->
                                                        (FStar_Extraction_ML_UEnv.debug
                                                           g
                                                           (fun uu____4730 ->
                                                              let uu____4731
                                                                =
                                                                FStar_Syntax_Print.pat_to_string
                                                                  p1 in
                                                              FStar_Util.print1
                                                                "Pattern %s is not extractable"
                                                                uu____4731);
                                                         FStar_Exn.raise
                                                           Un_extractable)))) in
                                     let f_ty =
                                       FStar_Extraction_ML_Util.subst tys
                                         mlty_args in
                                     let uu____4733 =
                                       FStar_Extraction_ML_Util.uncurry_mlty_fun
                                         f_ty in
                                     FStar_Pervasives_Native.Some uu____4733)
                                ()
                            with
                            | Un_extractable -> FStar_Pervasives_Native.None in
                          let uu____4762 =
                            FStar_Util.fold_map
                              (fun g1 ->
                                 fun uu____4798 ->
                                   match uu____4798 with
                                   | (p1, imp1) ->
                                       let uu____4817 =
                                         extract_one_pat true g1 p1
                                           FStar_Pervasives_Native.None
                                           term_as_mlexpr in
                                       (match uu____4817 with
                                        | (g2, p2, uu____4846) -> (g2, p2)))
                              g tysVarPats in
                          (match uu____4762 with
                           | (g1, tyMLPats) ->
                               let uu____4907 =
                                 FStar_Util.fold_map
                                   (fun uu____4971 ->
                                      fun uu____4972 ->
                                        match (uu____4971, uu____4972) with
                                        | ((g2, f_ty_opt1), (p1, imp1)) ->
                                            let uu____5065 =
                                              match f_ty_opt1 with
                                              | FStar_Pervasives_Native.Some
                                                  (hd::rest, res) ->
                                                  ((FStar_Pervasives_Native.Some
                                                      (rest, res)),
                                                    (FStar_Pervasives_Native.Some
                                                       hd))
                                              | uu____5125 ->
                                                  (FStar_Pervasives_Native.None,
                                                    FStar_Pervasives_Native.None) in
                                            (match uu____5065 with
                                             | (f_ty_opt2, expected_ty) ->
                                                 let uu____5196 =
                                                   extract_one_pat false g2
                                                     p1 expected_ty
                                                     term_as_mlexpr in
                                                 (match uu____5196 with
                                                  | (g3, p2, uu____5237) ->
                                                      ((g3, f_ty_opt2), p2))))
                                   (g1, f_ty_opt) restPats in
                               (match uu____4907 with
                                | ((g2, f_ty_opt1), restMLPats) ->
                                    let uu____5355 =
                                      let uu____5366 =
                                        FStar_All.pipe_right
                                          (FStar_List.append tyMLPats
                                             restMLPats)
                                          (FStar_List.collect
                                             (fun uu___0_5417 ->
                                                match uu___0_5417 with
                                                | FStar_Pervasives_Native.Some
                                                    x -> [x]
                                                | uu____5459 -> [])) in
                                      FStar_All.pipe_right uu____5366
                                        FStar_List.split in
                                    (match uu____5355 with
                                     | (mlPats, when_clauses) ->
                                         let pat_ty_compat =
                                           match f_ty_opt1 with
                                           | FStar_Pervasives_Native.Some
                                               ([], t) -> ok t
                                           | uu____5532 -> false in
                                         let uu____5541 =
                                           let uu____5550 =
                                             let uu____5557 =
                                               resugar_pat g2
                                                 f.FStar_Syntax_Syntax.fv_qual
                                                 (FStar_Extraction_ML_Syntax.MLP_CTor
                                                    (d, mlPats)) in
                                             let uu____5560 =
                                               FStar_All.pipe_right
                                                 when_clauses
                                                 FStar_List.flatten in
                                             (uu____5557, uu____5560) in
                                           FStar_Pervasives_Native.Some
                                             uu____5550 in
                                         (g2, uu____5541, pat_ty_compat))))))
let (extract_pat :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.pat ->
      FStar_Extraction_ML_Syntax.mlty ->
        (FStar_Extraction_ML_UEnv.uenv ->
           FStar_Syntax_Syntax.term ->
             (FStar_Extraction_ML_Syntax.mlexpr *
               FStar_Extraction_ML_Syntax.e_tag *
               FStar_Extraction_ML_Syntax.mlty))
          ->
          (FStar_Extraction_ML_UEnv.uenv *
            (FStar_Extraction_ML_Syntax.mlpattern *
            FStar_Extraction_ML_Syntax.mlexpr FStar_Pervasives_Native.option)
            Prims.list * Prims.bool))
  =
  fun g ->
    fun p ->
      fun expected_t ->
        fun term_as_mlexpr ->
          let extract_one_pat1 g1 p1 expected_t1 =
            let uu____5687 =
              extract_one_pat false g1 p1 expected_t1 term_as_mlexpr in
            match uu____5687 with
            | (g2, FStar_Pervasives_Native.Some (x, v), b) -> (g2, (x, v), b)
            | uu____5744 ->
                failwith "Impossible: Unable to translate pattern" in
          let mk_when_clause whens =
            match whens with
            | [] -> FStar_Pervasives_Native.None
            | hd::tl ->
                let uu____5789 =
                  FStar_List.fold_left FStar_Extraction_ML_Util.conjoin hd tl in
                FStar_Pervasives_Native.Some uu____5789 in
          let uu____5790 =
            extract_one_pat1 g p (FStar_Pervasives_Native.Some expected_t) in
          match uu____5790 with
          | (g1, (p1, whens), b) ->
              let when_clause = mk_when_clause whens in
              (g1, [(p1, when_clause)], b)
let (maybe_eta_data_and_project_record :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.fv_qual FStar_Pervasives_Native.option ->
      FStar_Extraction_ML_Syntax.mlty ->
        FStar_Extraction_ML_Syntax.mlexpr ->
          FStar_Extraction_ML_Syntax.mlexpr)
  =
  fun g ->
    fun qual ->
      fun residualType ->
        fun mlAppExpr ->
          let rec eta_args g1 more_args t =
            match t with
            | FStar_Extraction_ML_Syntax.MLTY_Fun (t0, uu____5945, t1) ->
                let uu____5947 = FStar_Extraction_ML_UEnv.new_mlident g1 in
                (match uu____5947 with
                 | (g2, x) ->
                     let uu____5968 =
                       let uu____5979 =
                         let uu____5988 =
                           FStar_All.pipe_left
                             (FStar_Extraction_ML_Syntax.with_ty t0)
                             (FStar_Extraction_ML_Syntax.MLE_Var x) in
                         ((x, t0), uu____5988) in
                       uu____5979 :: more_args in
                     eta_args g2 uu____5968 t1)
            | FStar_Extraction_ML_Syntax.MLTY_Named (uu____6001, uu____6002)
                -> ((FStar_List.rev more_args), t)
            | uu____6025 ->
                let uu____6026 =
                  let uu____6027 =
                    let uu____6028 =
                      FStar_Extraction_ML_UEnv.current_module_of_uenv g1 in
                    FStar_Extraction_ML_Code.string_of_mlexpr uu____6028
                      mlAppExpr in
                  let uu____6029 =
                    let uu____6030 =
                      FStar_Extraction_ML_UEnv.current_module_of_uenv g1 in
                    FStar_Extraction_ML_Code.string_of_mlty uu____6030 t in
                  FStar_Util.format2
                    "Impossible: Head type is not an arrow: (%s : %s)"
                    uu____6027 uu____6029 in
                failwith uu____6026 in
          let as_record qual1 e =
            match ((e.FStar_Extraction_ML_Syntax.expr), qual1) with
            | (FStar_Extraction_ML_Syntax.MLE_CTor (uu____6062, args),
               FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_ctor
               (tyname, fields))) ->
                let path =
                  let uu____6079 = FStar_Ident.ns_of_lid tyname in
                  FStar_List.map FStar_Ident.string_of_id uu____6079 in
                let fields1 = record_fields g tyname fields args in
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     e.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_Record (path, fields1))
            | uu____6097 -> e in
          let resugar_and_maybe_eta qual1 e =
            let uu____6119 = eta_args g [] residualType in
            match uu____6119 with
            | (eargs, tres) ->
                (match eargs with
                 | [] ->
                     let uu____6172 = as_record qual1 e in
                     FStar_Extraction_ML_Util.resugar_exp uu____6172
                 | uu____6173 ->
                     let uu____6184 = FStar_List.unzip eargs in
                     (match uu____6184 with
                      | (binders, eargs1) ->
                          (match e.FStar_Extraction_ML_Syntax.expr with
                           | FStar_Extraction_ML_Syntax.MLE_CTor (head, args)
                               ->
                               let body =
                                 let uu____6226 =
                                   let uu____6227 =
                                     FStar_All.pipe_left
                                       (FStar_Extraction_ML_Syntax.with_ty
                                          tres)
                                       (FStar_Extraction_ML_Syntax.MLE_CTor
                                          (head,
                                            (FStar_List.append args eargs1))) in
                                   FStar_All.pipe_left (as_record qual1)
                                     uu____6227 in
                                 FStar_All.pipe_left
                                   FStar_Extraction_ML_Util.resugar_exp
                                   uu____6226 in
                               FStar_All.pipe_left
                                 (FStar_Extraction_ML_Syntax.with_ty
                                    e.FStar_Extraction_ML_Syntax.mlty)
                                 (FStar_Extraction_ML_Syntax.MLE_Fun
                                    (binders, body))
                           | uu____6236 ->
                               failwith "Impossible: Not a constructor"))) in
          match ((mlAppExpr.FStar_Extraction_ML_Syntax.expr), qual) with
          | (uu____6239, FStar_Pervasives_Native.None) -> mlAppExpr
          | (FStar_Extraction_ML_Syntax.MLE_App
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_Name mlp;
                FStar_Extraction_ML_Syntax.mlty = uu____6243;
                FStar_Extraction_ML_Syntax.loc = uu____6244;_},
              mle::args),
             FStar_Pervasives_Native.Some
             (FStar_Syntax_Syntax.Record_projector (constrname, f))) ->
              let fn =
                let uu____6256 =
                  let uu____6261 =
                    let uu____6262 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
                    FStar_TypeChecker_Env.typ_of_datacon uu____6262
                      constrname in
                  (uu____6261, f) in
                FStar_Extraction_ML_UEnv.lookup_record_field_name g
                  uu____6256 in
              let proj = FStar_Extraction_ML_Syntax.MLE_Proj (mle, fn) in
              let e =
                match args with
                | [] -> proj
                | uu____6265 ->
                    let uu____6268 =
                      let uu____6275 =
                        FStar_All.pipe_left
                          (FStar_Extraction_ML_Syntax.with_ty
                             FStar_Extraction_ML_Syntax.MLTY_Top) proj in
                      (uu____6275, args) in
                    FStar_Extraction_ML_Syntax.MLE_App uu____6268 in
              FStar_Extraction_ML_Syntax.with_ty
                mlAppExpr.FStar_Extraction_ML_Syntax.mlty e
          | (FStar_Extraction_ML_Syntax.MLE_App
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_TApp
                  ({
                     FStar_Extraction_ML_Syntax.expr =
                       FStar_Extraction_ML_Syntax.MLE_Name mlp;
                     FStar_Extraction_ML_Syntax.mlty = uu____6279;
                     FStar_Extraction_ML_Syntax.loc = uu____6280;_},
                   uu____6281);
                FStar_Extraction_ML_Syntax.mlty = uu____6282;
                FStar_Extraction_ML_Syntax.loc = uu____6283;_},
              mle::args),
             FStar_Pervasives_Native.Some
             (FStar_Syntax_Syntax.Record_projector (constrname, f))) ->
              let fn =
                let uu____6299 =
                  let uu____6304 =
                    let uu____6305 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
                    FStar_TypeChecker_Env.typ_of_datacon uu____6305
                      constrname in
                  (uu____6304, f) in
                FStar_Extraction_ML_UEnv.lookup_record_field_name g
                  uu____6299 in
              let proj = FStar_Extraction_ML_Syntax.MLE_Proj (mle, fn) in
              let e =
                match args with
                | [] -> proj
                | uu____6308 ->
                    let uu____6311 =
                      let uu____6318 =
                        FStar_All.pipe_left
                          (FStar_Extraction_ML_Syntax.with_ty
                             FStar_Extraction_ML_Syntax.MLTY_Top) proj in
                      (uu____6318, args) in
                    FStar_Extraction_ML_Syntax.MLE_App uu____6311 in
              FStar_Extraction_ML_Syntax.with_ty
                mlAppExpr.FStar_Extraction_ML_Syntax.mlty e
          | (FStar_Extraction_ML_Syntax.MLE_App
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_Name mlp;
                FStar_Extraction_ML_Syntax.mlty = uu____6322;
                FStar_Extraction_ML_Syntax.loc = uu____6323;_},
              mlargs),
             FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)) ->
              let uu____6331 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, mlargs)) in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6331
          | (FStar_Extraction_ML_Syntax.MLE_App
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_Name mlp;
                FStar_Extraction_ML_Syntax.mlty = uu____6335;
                FStar_Extraction_ML_Syntax.loc = uu____6336;_},
              mlargs),
             FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_ctor
             uu____6338)) ->
              let uu____6351 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, mlargs)) in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6351
          | (FStar_Extraction_ML_Syntax.MLE_App
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_TApp
                  ({
                     FStar_Extraction_ML_Syntax.expr =
                       FStar_Extraction_ML_Syntax.MLE_Name mlp;
                     FStar_Extraction_ML_Syntax.mlty = uu____6355;
                     FStar_Extraction_ML_Syntax.loc = uu____6356;_},
                   uu____6357);
                FStar_Extraction_ML_Syntax.mlty = uu____6358;
                FStar_Extraction_ML_Syntax.loc = uu____6359;_},
              mlargs),
             FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)) ->
              let uu____6371 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, mlargs)) in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6371
          | (FStar_Extraction_ML_Syntax.MLE_App
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_TApp
                  ({
                     FStar_Extraction_ML_Syntax.expr =
                       FStar_Extraction_ML_Syntax.MLE_Name mlp;
                     FStar_Extraction_ML_Syntax.mlty = uu____6375;
                     FStar_Extraction_ML_Syntax.loc = uu____6376;_},
                   uu____6377);
                FStar_Extraction_ML_Syntax.mlty = uu____6378;
                FStar_Extraction_ML_Syntax.loc = uu____6379;_},
              mlargs),
             FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_ctor
             uu____6381)) ->
              let uu____6398 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, mlargs)) in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6398
          | (FStar_Extraction_ML_Syntax.MLE_Name mlp,
             FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)) ->
              let uu____6404 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, [])) in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6404
          | (FStar_Extraction_ML_Syntax.MLE_Name mlp,
             FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_ctor
             uu____6408)) ->
              let uu____6417 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, [])) in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6417
          | (FStar_Extraction_ML_Syntax.MLE_TApp
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_Name mlp;
                FStar_Extraction_ML_Syntax.mlty = uu____6421;
                FStar_Extraction_ML_Syntax.loc = uu____6422;_},
              uu____6423),
             FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)) ->
              let uu____6430 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, [])) in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6430
          | (FStar_Extraction_ML_Syntax.MLE_TApp
             ({
                FStar_Extraction_ML_Syntax.expr =
                  FStar_Extraction_ML_Syntax.MLE_Name mlp;
                FStar_Extraction_ML_Syntax.mlty = uu____6434;
                FStar_Extraction_ML_Syntax.loc = uu____6435;_},
              uu____6436),
             FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Record_ctor
             uu____6437)) ->
              let uu____6450 =
                FStar_All.pipe_left
                  (FStar_Extraction_ML_Syntax.with_ty
                     mlAppExpr.FStar_Extraction_ML_Syntax.mlty)
                  (FStar_Extraction_ML_Syntax.MLE_CTor (mlp, [])) in
              FStar_All.pipe_left (resugar_and_maybe_eta qual) uu____6450
          | uu____6453 -> mlAppExpr
let (maybe_promote_effect :
  FStar_Extraction_ML_Syntax.mlexpr ->
    FStar_Extraction_ML_Syntax.e_tag ->
      FStar_Extraction_ML_Syntax.mlty ->
        (FStar_Extraction_ML_Syntax.mlexpr *
          FStar_Extraction_ML_Syntax.e_tag))
  =
  fun ml_e ->
    fun tag ->
      fun t ->
        match (tag, t) with
        | (FStar_Extraction_ML_Syntax.E_GHOST,
           FStar_Extraction_ML_Syntax.MLTY_Erased) ->
            (FStar_Extraction_ML_Syntax.ml_unit,
              FStar_Extraction_ML_Syntax.E_PURE)
        | (FStar_Extraction_ML_Syntax.E_PURE,
           FStar_Extraction_ML_Syntax.MLTY_Erased) ->
            (FStar_Extraction_ML_Syntax.ml_unit,
              FStar_Extraction_ML_Syntax.E_PURE)
        | uu____6483 -> (ml_e, tag)
let (extract_lb_sig :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.letbindings ->
      (FStar_Syntax_Syntax.lbname * FStar_Extraction_ML_Syntax.e_tag *
        (FStar_Syntax_Syntax.typ * (FStar_Syntax_Syntax.binders *
        FStar_Extraction_ML_Syntax.mltyscheme)) * Prims.bool *
        FStar_Syntax_Syntax.term) Prims.list)
  =
  fun g ->
    fun lbs ->
      let maybe_generalize uu____6541 =
        match uu____6541 with
        | { FStar_Syntax_Syntax.lbname = lbname_;
            FStar_Syntax_Syntax.lbunivs = uu____6561;
            FStar_Syntax_Syntax.lbtyp = lbtyp;
            FStar_Syntax_Syntax.lbeff = lbeff;
            FStar_Syntax_Syntax.lbdef = lbdef;
            FStar_Syntax_Syntax.lbattrs = lbattrs;
            FStar_Syntax_Syntax.lbpos = uu____6566;_} ->
            let f_e = effect_as_etag g lbeff in
            let lbtyp1 = FStar_Syntax_Subst.compress lbtyp in
            let no_gen uu____6644 =
              let expected_t = term_as_mlty g lbtyp1 in
              (lbname_, f_e, (lbtyp1, ([], ([], expected_t))), false, lbdef) in
            let uu____6714 =
              let uu____6715 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
              FStar_TypeChecker_Util.must_erase_for_extraction uu____6715
                lbtyp1 in
            if uu____6714
            then
              (lbname_, f_e,
                (lbtyp1, ([], ([], FStar_Extraction_ML_Syntax.MLTY_Erased))),
                false, lbdef)
            else
              (match lbtyp1.FStar_Syntax_Syntax.n with
               | FStar_Syntax_Syntax.Tm_arrow (bs, c) when
                   let uu____6793 = FStar_List.hd bs in
                   FStar_All.pipe_right uu____6793 (is_type_binder g) ->
                   let uu____6814 = FStar_Syntax_Subst.open_comp bs c in
                   (match uu____6814 with
                    | (bs1, c1) ->
                        let uu____6839 =
                          let uu____6852 =
                            FStar_Util.prefix_until
                              (fun x ->
                                 let uu____6898 = is_type_binder g x in
                                 Prims.op_Negation uu____6898) bs1 in
                          match uu____6852 with
                          | FStar_Pervasives_Native.None ->
                              (bs1, (FStar_Syntax_Util.comp_result c1))
                          | FStar_Pervasives_Native.Some (bs2, b, rest) ->
                              let uu____7024 =
                                FStar_Syntax_Util.arrow (b :: rest) c1 in
                              (bs2, uu____7024) in
                        (match uu____6839 with
                         | (tbinders, tbody) ->
                             let n_tbinders = FStar_List.length tbinders in
                             let lbdef1 =
                               let uu____7085 = normalize_abs lbdef in
                               FStar_All.pipe_right uu____7085
                                 FStar_Syntax_Util.unmeta in
                             (match lbdef1.FStar_Syntax_Syntax.n with
                              | FStar_Syntax_Syntax.Tm_abs (bs2, body, copt)
                                  ->
                                  let uu____7133 =
                                    FStar_Syntax_Subst.open_term bs2 body in
                                  (match uu____7133 with
                                   | (bs3, body1) ->
                                       if
                                         n_tbinders <=
                                           (FStar_List.length bs3)
                                       then
                                         let uu____7182 =
                                           FStar_Util.first_N n_tbinders bs3 in
                                         (match uu____7182 with
                                          | (targs, rest_args) ->
                                              let expected_source_ty =
                                                let s =
                                                  FStar_List.map2
                                                    (fun uu____7284 ->
                                                       fun uu____7285 ->
                                                         match (uu____7284,
                                                                 uu____7285)
                                                         with
                                                         | ((x, uu____7311),
                                                            (y, uu____7313))
                                                             ->
                                                             let uu____7334 =
                                                               let uu____7341
                                                                 =
                                                                 FStar_Syntax_Syntax.bv_to_name
                                                                   y in
                                                               (x,
                                                                 uu____7341) in
                                                             FStar_Syntax_Syntax.NT
                                                               uu____7334)
                                                    tbinders targs in
                                                FStar_Syntax_Subst.subst s
                                                  tbody in
                                              let env =
                                                FStar_List.fold_left
                                                  (fun env ->
                                                     fun uu____7358 ->
                                                       match uu____7358 with
                                                       | (a, uu____7366) ->
                                                           FStar_Extraction_ML_UEnv.extend_ty
                                                             env a false) g
                                                  targs in
                                              let expected_t =
                                                term_as_mlty env
                                                  expected_source_ty in
                                              let polytype =
                                                let uu____7377 =
                                                  FStar_All.pipe_right targs
                                                    (FStar_List.map
                                                       (fun uu____7396 ->
                                                          match uu____7396
                                                          with
                                                          | (x, uu____7404)
                                                              ->
                                                              let uu____7409
                                                                =
                                                                FStar_Extraction_ML_UEnv.lookup_ty
                                                                  env x in
                                                              uu____7409.FStar_Extraction_ML_UEnv.ty_b_name)) in
                                                (uu____7377, expected_t) in
                                              let add_unit =
                                                match rest_args with
                                                | [] ->
                                                    (let uu____7419 =
                                                       is_fstar_value body1 in
                                                     Prims.op_Negation
                                                       uu____7419)
                                                      ||
                                                      (let uu____7421 =
                                                         FStar_Syntax_Util.is_pure_comp
                                                           c1 in
                                                       Prims.op_Negation
                                                         uu____7421)
                                                | uu____7422 -> false in
                                              let rest_args1 =
                                                if add_unit
                                                then
                                                  let uu____7432 =
                                                    unit_binder () in
                                                  uu____7432 :: rest_args
                                                else rest_args in
                                              let polytype1 =
                                                if add_unit
                                                then
                                                  FStar_Extraction_ML_Syntax.push_unit
                                                    polytype
                                                else polytype in
                                              let body2 =
                                                FStar_Syntax_Util.abs
                                                  rest_args1 body1 copt in
                                              (lbname_, f_e,
                                                (lbtyp1, (targs, polytype1)),
                                                add_unit, body2))
                                       else
                                         failwith "Not enough type binders")
                              | FStar_Syntax_Syntax.Tm_uinst uu____7482 ->
                                  let env =
                                    FStar_List.fold_left
                                      (fun env ->
                                         fun uu____7501 ->
                                           match uu____7501 with
                                           | (a, uu____7509) ->
                                               FStar_Extraction_ML_UEnv.extend_ty
                                                 env a false) g tbinders in
                                  let expected_t = term_as_mlty env tbody in
                                  let polytype =
                                    let uu____7520 =
                                      FStar_All.pipe_right tbinders
                                        (FStar_List.map
                                           (fun uu____7539 ->
                                              match uu____7539 with
                                              | (x, uu____7547) ->
                                                  let uu____7552 =
                                                    FStar_Extraction_ML_UEnv.lookup_ty
                                                      env x in
                                                  uu____7552.FStar_Extraction_ML_UEnv.ty_b_name)) in
                                    (uu____7520, expected_t) in
                                  let args =
                                    FStar_All.pipe_right tbinders
                                      (FStar_List.map
                                         (fun uu____7592 ->
                                            match uu____7592 with
                                            | (bv, uu____7600) ->
                                                let uu____7605 =
                                                  FStar_Syntax_Syntax.bv_to_name
                                                    bv in
                                                FStar_All.pipe_right
                                                  uu____7605
                                                  FStar_Syntax_Syntax.as_arg)) in
                                  let e =
                                    FStar_Syntax_Syntax.mk
                                      (FStar_Syntax_Syntax.Tm_app
                                         (lbdef1, args))
                                      lbdef1.FStar_Syntax_Syntax.pos in
                                  (lbname_, f_e,
                                    (lbtyp1, (tbinders, polytype)), false, e)
                              | FStar_Syntax_Syntax.Tm_fvar uu____7633 ->
                                  let env =
                                    FStar_List.fold_left
                                      (fun env ->
                                         fun uu____7646 ->
                                           match uu____7646 with
                                           | (a, uu____7654) ->
                                               FStar_Extraction_ML_UEnv.extend_ty
                                                 env a false) g tbinders in
                                  let expected_t = term_as_mlty env tbody in
                                  let polytype =
                                    let uu____7665 =
                                      FStar_All.pipe_right tbinders
                                        (FStar_List.map
                                           (fun uu____7684 ->
                                              match uu____7684 with
                                              | (x, uu____7692) ->
                                                  let uu____7697 =
                                                    FStar_Extraction_ML_UEnv.lookup_ty
                                                      env x in
                                                  uu____7697.FStar_Extraction_ML_UEnv.ty_b_name)) in
                                    (uu____7665, expected_t) in
                                  let args =
                                    FStar_All.pipe_right tbinders
                                      (FStar_List.map
                                         (fun uu____7737 ->
                                            match uu____7737 with
                                            | (bv, uu____7745) ->
                                                let uu____7750 =
                                                  FStar_Syntax_Syntax.bv_to_name
                                                    bv in
                                                FStar_All.pipe_right
                                                  uu____7750
                                                  FStar_Syntax_Syntax.as_arg)) in
                                  let e =
                                    FStar_Syntax_Syntax.mk
                                      (FStar_Syntax_Syntax.Tm_app
                                         (lbdef1, args))
                                      lbdef1.FStar_Syntax_Syntax.pos in
                                  (lbname_, f_e,
                                    (lbtyp1, (tbinders, polytype)), false, e)
                              | FStar_Syntax_Syntax.Tm_name uu____7778 ->
                                  let env =
                                    FStar_List.fold_left
                                      (fun env ->
                                         fun uu____7791 ->
                                           match uu____7791 with
                                           | (a, uu____7799) ->
                                               FStar_Extraction_ML_UEnv.extend_ty
                                                 env a false) g tbinders in
                                  let expected_t = term_as_mlty env tbody in
                                  let polytype =
                                    let uu____7810 =
                                      FStar_All.pipe_right tbinders
                                        (FStar_List.map
                                           (fun uu____7829 ->
                                              match uu____7829 with
                                              | (x, uu____7837) ->
                                                  let uu____7842 =
                                                    FStar_Extraction_ML_UEnv.lookup_ty
                                                      env x in
                                                  uu____7842.FStar_Extraction_ML_UEnv.ty_b_name)) in
                                    (uu____7810, expected_t) in
                                  let args =
                                    FStar_All.pipe_right tbinders
                                      (FStar_List.map
                                         (fun uu____7882 ->
                                            match uu____7882 with
                                            | (bv, uu____7890) ->
                                                let uu____7895 =
                                                  FStar_Syntax_Syntax.bv_to_name
                                                    bv in
                                                FStar_All.pipe_right
                                                  uu____7895
                                                  FStar_Syntax_Syntax.as_arg)) in
                                  let e =
                                    FStar_Syntax_Syntax.mk
                                      (FStar_Syntax_Syntax.Tm_app
                                         (lbdef1, args))
                                      lbdef1.FStar_Syntax_Syntax.pos in
                                  (lbname_, f_e,
                                    (lbtyp1, (tbinders, polytype)), false, e)
                              | uu____7923 -> err_value_restriction lbdef1)))
               | uu____7942 -> no_gen ()) in
      FStar_All.pipe_right (FStar_Pervasives_Native.snd lbs)
        (FStar_List.map maybe_generalize)
let (extract_lb_iface :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.letbindings ->
      (FStar_Extraction_ML_UEnv.uenv * (FStar_Syntax_Syntax.fv *
        FStar_Extraction_ML_UEnv.exp_binding) Prims.list))
  =
  fun g ->
    fun lbs ->
      let is_top =
        FStar_Syntax_Syntax.is_top_level (FStar_Pervasives_Native.snd lbs) in
      let is_rec =
        (Prims.op_Negation is_top) && (FStar_Pervasives_Native.fst lbs) in
      let lbs1 = extract_lb_sig g lbs in
      FStar_Util.fold_map
        (fun env ->
           fun uu____8083 ->
             match uu____8083 with
             | (lbname, e_tag, (typ, (binders, mltyscheme)), add_unit, _body)
                 ->
                 let uu____8141 =
                   FStar_Extraction_ML_UEnv.extend_lb env lbname typ
                     mltyscheme add_unit in
                 (match uu____8141 with
                  | (env1, uu____8157, exp_binding) ->
                      let uu____8159 =
                        let uu____8164 = FStar_Util.right lbname in
                        (uu____8164, exp_binding) in
                      (env1, uu____8159))) g lbs1
let rec (check_term_as_mlexpr :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.term ->
      FStar_Extraction_ML_Syntax.e_tag ->
        FStar_Extraction_ML_Syntax.mlty ->
          (FStar_Extraction_ML_Syntax.mlexpr *
            FStar_Extraction_ML_Syntax.mlty))
  =
  fun g ->
    fun e ->
      fun f ->
        fun ty ->
          FStar_Extraction_ML_UEnv.debug g
            (fun uu____8230 ->
               let uu____8231 = FStar_Syntax_Print.term_to_string e in
               let uu____8232 =
                 let uu____8233 =
                   FStar_Extraction_ML_UEnv.current_module_of_uenv g in
                 FStar_Extraction_ML_Code.string_of_mlty uu____8233 ty in
               let uu____8234 = FStar_Extraction_ML_Util.eff_to_string f in
               FStar_Util.print3 "Checking %s at type %s and eff %s\n"
                 uu____8231 uu____8232 uu____8234);
          (match (f, ty) with
           | (FStar_Extraction_ML_Syntax.E_GHOST, uu____8239) ->
               (FStar_Extraction_ML_Syntax.ml_unit,
                 FStar_Extraction_ML_Syntax.MLTY_Erased)
           | (FStar_Extraction_ML_Syntax.E_PURE,
              FStar_Extraction_ML_Syntax.MLTY_Erased) ->
               (FStar_Extraction_ML_Syntax.ml_unit,
                 FStar_Extraction_ML_Syntax.MLTY_Erased)
           | uu____8240 ->
               let uu____8245 = term_as_mlexpr g e in
               (match uu____8245 with
                | (ml_e, tag, t) ->
                    let uu____8259 = FStar_Extraction_ML_Util.eff_leq tag f in
                    if uu____8259
                    then
                      let uu____8264 =
                        maybe_coerce e.FStar_Syntax_Syntax.pos g ml_e t ty in
                      (uu____8264, ty)
                    else
                      (match (tag, f, ty) with
                       | (FStar_Extraction_ML_Syntax.E_GHOST,
                          FStar_Extraction_ML_Syntax.E_PURE,
                          FStar_Extraction_ML_Syntax.MLTY_Erased) ->
                           let uu____8270 =
                             maybe_coerce e.FStar_Syntax_Syntax.pos g ml_e t
                               ty in
                           (uu____8270, ty)
                       | uu____8271 ->
                           (err_unexpected_eff g e ty f tag;
                            (let uu____8279 =
                               maybe_coerce e.FStar_Syntax_Syntax.pos g ml_e
                                 t ty in
                             (uu____8279, ty))))))
and (term_as_mlexpr :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.term ->
      (FStar_Extraction_ML_Syntax.mlexpr * FStar_Extraction_ML_Syntax.e_tag *
        FStar_Extraction_ML_Syntax.mlty))
  =
  fun g ->
    fun e ->
      let uu____8288 = term_as_mlexpr' g e in
      match uu____8288 with
      | (e1, f, t) ->
          let uu____8304 = maybe_promote_effect e1 f t in
          (match uu____8304 with | (e2, f1) -> (e2, f1, t))
and (term_as_mlexpr' :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Syntax_Syntax.term ->
      (FStar_Extraction_ML_Syntax.mlexpr * FStar_Extraction_ML_Syntax.e_tag *
        FStar_Extraction_ML_Syntax.mlty))
  =
  fun g ->
    fun top ->
      let top1 = FStar_Syntax_Subst.compress top in
      FStar_Extraction_ML_UEnv.debug g
        (fun u ->
           let uu____8330 =
             let uu____8331 =
               FStar_Range.string_of_range top1.FStar_Syntax_Syntax.pos in
             let uu____8332 = FStar_Syntax_Print.tag_of_term top1 in
             let uu____8333 = FStar_Syntax_Print.term_to_string top1 in
             FStar_Util.format3 "%s: term_as_mlexpr' (%s) :  %s \n"
               uu____8331 uu____8332 uu____8333 in
           FStar_Util.print_string uu____8330);
      (let is_match t =
         let uu____8340 =
           let uu____8341 =
             let uu____8344 =
               FStar_All.pipe_right t FStar_Syntax_Subst.compress in
             FStar_All.pipe_right uu____8344 FStar_Syntax_Util.unascribe in
           uu____8341.FStar_Syntax_Syntax.n in
         match uu____8340 with
         | FStar_Syntax_Syntax.Tm_match uu____8347 -> true
         | uu____8370 -> false in
       let should_apply_to_match_branches =
         FStar_List.for_all
           (fun uu____8387 ->
              match uu____8387 with
              | (t, uu____8395) ->
                  let uu____8400 =
                    let uu____8401 =
                      FStar_All.pipe_right t FStar_Syntax_Subst.compress in
                    uu____8401.FStar_Syntax_Syntax.n in
                  (match uu____8400 with
                   | FStar_Syntax_Syntax.Tm_name uu____8406 -> true
                   | FStar_Syntax_Syntax.Tm_fvar uu____8407 -> true
                   | FStar_Syntax_Syntax.Tm_constant uu____8408 -> true
                   | uu____8409 -> false)) in
       let apply_to_match_branches head args =
         let uu____8447 =
           let uu____8448 =
             let uu____8451 =
               FStar_All.pipe_right head FStar_Syntax_Subst.compress in
             FStar_All.pipe_right uu____8451 FStar_Syntax_Util.unascribe in
           uu____8448.FStar_Syntax_Syntax.n in
         match uu____8447 with
         | FStar_Syntax_Syntax.Tm_match (scrutinee, branches) ->
             let branches1 =
               FStar_All.pipe_right branches
                 (FStar_List.map
                    (fun uu____8575 ->
                       match uu____8575 with
                       | (pat, when_opt, body) ->
                           (pat, when_opt,
                             (let uu___1320_8632 = body in
                              {
                                FStar_Syntax_Syntax.n =
                                  (FStar_Syntax_Syntax.Tm_app (body, args));
                                FStar_Syntax_Syntax.pos =
                                  (uu___1320_8632.FStar_Syntax_Syntax.pos);
                                FStar_Syntax_Syntax.vars =
                                  (uu___1320_8632.FStar_Syntax_Syntax.vars)
                              })))) in
             let uu___1323_8647 = head in
             {
               FStar_Syntax_Syntax.n =
                 (FStar_Syntax_Syntax.Tm_match (scrutinee, branches1));
               FStar_Syntax_Syntax.pos =
                 (uu___1323_8647.FStar_Syntax_Syntax.pos);
               FStar_Syntax_Syntax.vars =
                 (uu___1323_8647.FStar_Syntax_Syntax.vars)
             }
         | uu____8668 ->
             failwith
               "Impossible! cannot apply args to match branches if head is not a match" in
       let t = FStar_Syntax_Subst.compress top1 in
       match t.FStar_Syntax_Syntax.n with
       | FStar_Syntax_Syntax.Tm_unknown ->
           let uu____8678 =
             let uu____8679 = FStar_Syntax_Print.tag_of_term t in
             FStar_Util.format1 "Impossible: Unexpected term: %s" uu____8679 in
           failwith uu____8678
       | FStar_Syntax_Syntax.Tm_delayed uu____8686 ->
           let uu____8701 =
             let uu____8702 = FStar_Syntax_Print.tag_of_term t in
             FStar_Util.format1 "Impossible: Unexpected term: %s" uu____8702 in
           failwith uu____8701
       | FStar_Syntax_Syntax.Tm_uvar uu____8709 ->
           let uu____8722 =
             let uu____8723 = FStar_Syntax_Print.tag_of_term t in
             FStar_Util.format1 "Impossible: Unexpected term: %s" uu____8723 in
           failwith uu____8722
       | FStar_Syntax_Syntax.Tm_bvar uu____8730 ->
           let uu____8731 =
             let uu____8732 = FStar_Syntax_Print.tag_of_term t in
             FStar_Util.format1 "Impossible: Unexpected term: %s" uu____8732 in
           failwith uu____8731
       | FStar_Syntax_Syntax.Tm_lazy i ->
           let uu____8740 = FStar_Syntax_Util.unfold_lazy i in
           term_as_mlexpr g uu____8740
       | FStar_Syntax_Syntax.Tm_type uu____8741 ->
           (FStar_Extraction_ML_Syntax.ml_unit,
             FStar_Extraction_ML_Syntax.E_PURE,
             FStar_Extraction_ML_Syntax.ml_unit_ty)
       | FStar_Syntax_Syntax.Tm_refine uu____8742 ->
           (FStar_Extraction_ML_Syntax.ml_unit,
             FStar_Extraction_ML_Syntax.E_PURE,
             FStar_Extraction_ML_Syntax.ml_unit_ty)
       | FStar_Syntax_Syntax.Tm_arrow uu____8749 ->
           (FStar_Extraction_ML_Syntax.ml_unit,
             FStar_Extraction_ML_Syntax.E_PURE,
             FStar_Extraction_ML_Syntax.ml_unit_ty)
       | FStar_Syntax_Syntax.Tm_quoted
           (qt,
            { FStar_Syntax_Syntax.qkind = FStar_Syntax_Syntax.Quote_dynamic;
              FStar_Syntax_Syntax.antiquotes = uu____8765;_})
           ->
           let uu____8778 =
             let uu____8779 =
               FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.failwith_lid
                 FStar_Syntax_Syntax.delta_constant
                 FStar_Pervasives_Native.None in
             FStar_Extraction_ML_UEnv.lookup_fv g uu____8779 in
           (match uu____8778 with
            | { FStar_Extraction_ML_UEnv.exp_b_name = uu____8786;
                FStar_Extraction_ML_UEnv.exp_b_expr = fw;
                FStar_Extraction_ML_UEnv.exp_b_tscheme = uu____8788;_} ->
                let uu____8789 =
                  let uu____8790 =
                    let uu____8791 =
                      let uu____8798 =
                        let uu____8801 =
                          FStar_All.pipe_left
                            (FStar_Extraction_ML_Syntax.with_ty
                               FStar_Extraction_ML_Syntax.ml_string_ty)
                            (FStar_Extraction_ML_Syntax.MLE_Const
                               (FStar_Extraction_ML_Syntax.MLC_String
                                  "Cannot evaluate open quotation at runtime")) in
                        [uu____8801] in
                      (fw, uu____8798) in
                    FStar_Extraction_ML_Syntax.MLE_App uu____8791 in
                  FStar_All.pipe_left
                    (FStar_Extraction_ML_Syntax.with_ty
                       FStar_Extraction_ML_Syntax.ml_int_ty) uu____8790 in
                (uu____8789, FStar_Extraction_ML_Syntax.E_PURE,
                  FStar_Extraction_ML_Syntax.ml_int_ty))
       | FStar_Syntax_Syntax.Tm_quoted
           (qt,
            { FStar_Syntax_Syntax.qkind = FStar_Syntax_Syntax.Quote_static;
              FStar_Syntax_Syntax.antiquotes = aqs;_})
           ->
           let uu____8818 = FStar_Reflection_Basic.inspect_ln qt in
           (match uu____8818 with
            | FStar_Reflection_Data.Tv_Var bv ->
                let uu____8826 = FStar_Syntax_Syntax.lookup_aq bv aqs in
                (match uu____8826 with
                 | FStar_Pervasives_Native.Some tm -> term_as_mlexpr g tm
                 | FStar_Pervasives_Native.None ->
                     let tv =
                       let uu____8837 =
                         let uu____8844 =
                           FStar_Reflection_Embeddings.e_term_view_aq aqs in
                         FStar_Syntax_Embeddings.embed uu____8844
                           (FStar_Reflection_Data.Tv_Var bv) in
                       uu____8837 t.FStar_Syntax_Syntax.pos
                         FStar_Pervasives_Native.None
                         FStar_Syntax_Embeddings.id_norm_cb in
                     let t1 =
                       let uu____8852 =
                         let uu____8863 = FStar_Syntax_Syntax.as_arg tv in
                         [uu____8863] in
                       FStar_Syntax_Util.mk_app
                         (FStar_Reflection_Data.refl_constant_term
                            FStar_Reflection_Data.fstar_refl_pack_ln)
                         uu____8852 in
                     term_as_mlexpr g t1)
            | tv ->
                let tv1 =
                  let uu____8890 =
                    let uu____8897 =
                      FStar_Reflection_Embeddings.e_term_view_aq aqs in
                    FStar_Syntax_Embeddings.embed uu____8897 tv in
                  uu____8890 t.FStar_Syntax_Syntax.pos
                    FStar_Pervasives_Native.None
                    FStar_Syntax_Embeddings.id_norm_cb in
                let t1 =
                  let uu____8905 =
                    let uu____8916 = FStar_Syntax_Syntax.as_arg tv1 in
                    [uu____8916] in
                  FStar_Syntax_Util.mk_app
                    (FStar_Reflection_Data.refl_constant_term
                       FStar_Reflection_Data.fstar_refl_pack_ln) uu____8905 in
                term_as_mlexpr g t1)
       | FStar_Syntax_Syntax.Tm_meta
           (t1, FStar_Syntax_Syntax.Meta_monadic (m, uu____8943)) ->
           let t2 = FStar_Syntax_Subst.compress t1 in
           (match t2.FStar_Syntax_Syntax.n with
            | FStar_Syntax_Syntax.Tm_let ((false, lb::[]), body) when
                FStar_Util.is_left lb.FStar_Syntax_Syntax.lbname ->
                let uu____8973 =
                  let uu____8980 =
                    let uu____8989 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
                    FStar_TypeChecker_Env.effect_decl_opt uu____8989 m in
                  FStar_Util.must uu____8980 in
                (match uu____8973 with
                 | (ed, qualifiers) ->
                     let uu____9008 =
                       let uu____9009 =
                         let uu____9010 =
                           FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
                         FStar_TypeChecker_Env.is_reifiable_effect uu____9010
                           ed.FStar_Syntax_Syntax.mname in
                       Prims.op_Negation uu____9009 in
                     if uu____9008
                     then term_as_mlexpr g t2
                     else
                       failwith
                         "This should not happen (should have been handled at Tm_abs level)")
            | uu____9024 -> term_as_mlexpr g t2)
       | FStar_Syntax_Syntax.Tm_meta (t1, uu____9026) -> term_as_mlexpr g t1
       | FStar_Syntax_Syntax.Tm_uinst (t1, uu____9032) -> term_as_mlexpr g t1
       | FStar_Syntax_Syntax.Tm_constant c ->
           let uu____9038 =
             let uu____9045 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
             FStar_TypeChecker_TcTerm.type_of_tot_term uu____9045 t in
           (match uu____9038 with
            | (uu____9052, ty, uu____9054) ->
                let ml_ty = term_as_mlty g ty in
                let uu____9056 =
                  let uu____9057 =
                    FStar_Extraction_ML_Util.mlexpr_of_const
                      t.FStar_Syntax_Syntax.pos c in
                  FStar_Extraction_ML_Syntax.with_ty ml_ty uu____9057 in
                (uu____9056, FStar_Extraction_ML_Syntax.E_PURE, ml_ty))
       | FStar_Syntax_Syntax.Tm_name uu____9058 ->
           let uu____9059 = is_type g t in
           if uu____9059
           then
             (FStar_Extraction_ML_Syntax.ml_unit,
               FStar_Extraction_ML_Syntax.E_PURE,
               FStar_Extraction_ML_Syntax.ml_unit_ty)
           else
             (let uu____9067 = FStar_Extraction_ML_UEnv.lookup_term g t in
              match uu____9067 with
              | (FStar_Util.Inl uu____9080, uu____9081) ->
                  (FStar_Extraction_ML_Syntax.ml_unit,
                    FStar_Extraction_ML_Syntax.E_PURE,
                    FStar_Extraction_ML_Syntax.ml_unit_ty)
              | (FStar_Util.Inr
                 { FStar_Extraction_ML_UEnv.exp_b_name = uu____9086;
                   FStar_Extraction_ML_UEnv.exp_b_expr = x;
                   FStar_Extraction_ML_UEnv.exp_b_tscheme = mltys;_},
                 qual) ->
                  (match mltys with
                   | ([], t1) when t1 = FStar_Extraction_ML_Syntax.ml_unit_ty
                       ->
                       (FStar_Extraction_ML_Syntax.ml_unit,
                         FStar_Extraction_ML_Syntax.E_PURE, t1)
                   | ([], t1) ->
                       let uu____9102 =
                         maybe_eta_data_and_project_record g qual t1 x in
                       (uu____9102, FStar_Extraction_ML_Syntax.E_PURE, t1)
                   | uu____9103 -> instantiate_maybe_partial g x mltys []))
       | FStar_Syntax_Syntax.Tm_fvar fv ->
           let uu____9105 = is_type g t in
           if uu____9105
           then
             (FStar_Extraction_ML_Syntax.ml_unit,
               FStar_Extraction_ML_Syntax.E_PURE,
               FStar_Extraction_ML_Syntax.ml_unit_ty)
           else
             (let uu____9113 = FStar_Extraction_ML_UEnv.try_lookup_fv g fv in
              match uu____9113 with
              | FStar_Pervasives_Native.None ->
                  (FStar_Extraction_ML_Syntax.ml_unit,
                    FStar_Extraction_ML_Syntax.E_PURE,
                    FStar_Extraction_ML_Syntax.MLTY_Erased)
              | FStar_Pervasives_Native.Some
                  { FStar_Extraction_ML_UEnv.exp_b_name = uu____9122;
                    FStar_Extraction_ML_UEnv.exp_b_expr = x;
                    FStar_Extraction_ML_UEnv.exp_b_tscheme = mltys;_}
                  ->
                  (FStar_Extraction_ML_UEnv.debug g
                     (fun uu____9130 ->
                        let uu____9131 = FStar_Syntax_Print.fv_to_string fv in
                        let uu____9132 =
                          let uu____9133 =
                            FStar_Extraction_ML_UEnv.current_module_of_uenv g in
                          FStar_Extraction_ML_Code.string_of_mlexpr
                            uu____9133 x in
                        let uu____9134 =
                          let uu____9135 =
                            FStar_Extraction_ML_UEnv.current_module_of_uenv g in
                          FStar_Extraction_ML_Code.string_of_mlty uu____9135
                            (FStar_Pervasives_Native.snd mltys) in
                        FStar_Util.print3 "looked up %s: got %s at %s \n"
                          uu____9131 uu____9132 uu____9134);
                   (match mltys with
                    | ([], t1) when
                        t1 = FStar_Extraction_ML_Syntax.ml_unit_ty ->
                        (FStar_Extraction_ML_Syntax.ml_unit,
                          FStar_Extraction_ML_Syntax.E_PURE, t1)
                    | ([], t1) ->
                        let uu____9144 =
                          maybe_eta_data_and_project_record g
                            fv.FStar_Syntax_Syntax.fv_qual t1 x in
                        (uu____9144, FStar_Extraction_ML_Syntax.E_PURE, t1)
                    | uu____9145 -> instantiate_maybe_partial g x mltys [])))
       | FStar_Syntax_Syntax.Tm_abs (bs, body, rcopt) ->
           let uu____9173 = FStar_Syntax_Subst.open_term bs body in
           (match uu____9173 with
            | (bs1, body1) ->
                let uu____9186 = binders_as_ml_binders g bs1 in
                (match uu____9186 with
                 | (ml_bs, env) ->
                     let body2 =
                       match rcopt with
                       | FStar_Pervasives_Native.Some rc ->
                           let uu____9219 =
                             let uu____9220 =
                               FStar_Extraction_ML_UEnv.tcenv_of_uenv env in
                             FStar_TypeChecker_Env.is_reifiable_rc uu____9220
                               rc in
                           if uu____9219
                           then
                             let uu____9221 =
                               FStar_Extraction_ML_UEnv.tcenv_of_uenv env in
                             FStar_TypeChecker_Util.reify_body uu____9221
                               [FStar_TypeChecker_Env.Inlining;
                               FStar_TypeChecker_Env.ForExtraction;
                               FStar_TypeChecker_Env.Unascribe] body1
                           else body1
                       | FStar_Pervasives_Native.None ->
                           (FStar_Extraction_ML_UEnv.debug g
                              (fun uu____9226 ->
                                 let uu____9227 =
                                   FStar_Syntax_Print.term_to_string body1 in
                                 FStar_Util.print1
                                   "No computation type for: %s\n" uu____9227);
                            body1) in
                     let uu____9228 = term_as_mlexpr env body2 in
                     (match uu____9228 with
                      | (ml_body, f, t1) ->
                          let uu____9244 =
                            FStar_List.fold_right
                              (fun uu____9263 ->
                                 fun uu____9264 ->
                                   match (uu____9263, uu____9264) with
                                   | ((uu____9285, targ), (f1, t2)) ->
                                       (FStar_Extraction_ML_Syntax.E_PURE,
                                         (FStar_Extraction_ML_Syntax.MLTY_Fun
                                            (targ, f1, t2)))) ml_bs (f, t1) in
                          (match uu____9244 with
                           | (f1, tfun) ->
                               let uu____9305 =
                                 FStar_All.pipe_left
                                   (FStar_Extraction_ML_Syntax.with_ty tfun)
                                   (FStar_Extraction_ML_Syntax.MLE_Fun
                                      (ml_bs, ml_body)) in
                               (uu____9305, f1, tfun)))))
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_range_of);
              FStar_Syntax_Syntax.pos = uu____9312;
              FStar_Syntax_Syntax.vars = uu____9313;_},
            (a1, uu____9315)::[])
           ->
           let ty =
             let uu____9355 =
               FStar_Syntax_Syntax.tabbrev FStar_Parser_Const.range_lid in
             term_as_mlty g uu____9355 in
           let uu____9356 =
             let uu____9357 =
               FStar_Extraction_ML_Util.mlexpr_of_range
                 a1.FStar_Syntax_Syntax.pos in
             FStar_All.pipe_left (FStar_Extraction_ML_Syntax.with_ty ty)
               uu____9357 in
           (uu____9356, FStar_Extraction_ML_Syntax.E_PURE, ty)
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_set_range_of);
              FStar_Syntax_Syntax.pos = uu____9358;
              FStar_Syntax_Syntax.vars = uu____9359;_},
            (t1, uu____9361)::(r, uu____9363)::[])
           -> term_as_mlexpr g t1
       | FStar_Syntax_Syntax.Tm_app
           ({
              FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                (FStar_Const.Const_reflect uu____9418);
              FStar_Syntax_Syntax.pos = uu____9419;
              FStar_Syntax_Syntax.vars = uu____9420;_},
            uu____9421)
           -> failwith "Unreachable? Tm_app Const_reflect"
       | FStar_Syntax_Syntax.Tm_app (head, args) when
           (is_match head) &&
             (FStar_All.pipe_right args should_apply_to_match_branches)
           ->
           let uu____9478 =
             FStar_All.pipe_right args (apply_to_match_branches head) in
           FStar_All.pipe_right uu____9478 (term_as_mlexpr g)
       | FStar_Syntax_Syntax.Tm_app (head, args) ->
           let is_total rc =
             (FStar_Ident.lid_equals rc.FStar_Syntax_Syntax.residual_effect
                FStar_Parser_Const.effect_Tot_lid)
               ||
               (FStar_All.pipe_right rc.FStar_Syntax_Syntax.residual_flags
                  (FStar_List.existsb
                     (fun uu___1_9530 ->
                        match uu___1_9530 with
                        | FStar_Syntax_Syntax.TOTAL -> true
                        | uu____9531 -> false))) in
           let uu____9532 =
             let uu____9533 =
               let uu____9536 =
                 FStar_All.pipe_right head FStar_Syntax_Subst.compress in
               FStar_All.pipe_right uu____9536 FStar_Syntax_Util.unascribe in
             uu____9533.FStar_Syntax_Syntax.n in
           (match uu____9532 with
            | FStar_Syntax_Syntax.Tm_abs (bs, uu____9546, _rc) ->
                let uu____9572 =
                  let uu____9573 =
                    let uu____9578 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
                    FStar_TypeChecker_Normalize.normalize
                      [FStar_TypeChecker_Env.Beta;
                      FStar_TypeChecker_Env.Iota;
                      FStar_TypeChecker_Env.Zeta;
                      FStar_TypeChecker_Env.EraseUniverses;
                      FStar_TypeChecker_Env.AllowUnboundUniverses;
                      FStar_TypeChecker_Env.ForExtraction] uu____9578 in
                  FStar_All.pipe_right t uu____9573 in
                FStar_All.pipe_right uu____9572 (term_as_mlexpr g)
            | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify) ->
                let e =
                  let uu____9586 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
                  let uu____9587 = FStar_List.hd args in
                  FStar_TypeChecker_Util.reify_body_with_arg uu____9586
                    [FStar_TypeChecker_Env.Inlining;
                    FStar_TypeChecker_Env.ForExtraction;
                    FStar_TypeChecker_Env.Unascribe] head uu____9587 in
                let tm =
                  let uu____9597 = FStar_TypeChecker_Util.remove_reify e in
                  let uu____9598 = FStar_List.tl args in
                  FStar_Syntax_Syntax.mk_Tm_app uu____9597 uu____9598
                    t.FStar_Syntax_Syntax.pos in
                term_as_mlexpr g tm
            | uu____9607 ->
                let rec extract_app is_data uu____9656 uu____9657 restArgs =
                  match (uu____9656, uu____9657) with
                  | ((mlhead, mlargs_f), (f, t1)) ->
                      let mk_head uu____9738 =
                        let mlargs =
                          FStar_All.pipe_right (FStar_List.rev mlargs_f)
                            (FStar_List.map FStar_Pervasives_Native.fst) in
                        FStar_All.pipe_left
                          (FStar_Extraction_ML_Syntax.with_ty t1)
                          (FStar_Extraction_ML_Syntax.MLE_App
                             (mlhead, mlargs)) in
                      (FStar_Extraction_ML_UEnv.debug g
                         (fun uu____9765 ->
                            let uu____9766 =
                              let uu____9767 =
                                FStar_Extraction_ML_UEnv.current_module_of_uenv
                                  g in
                              let uu____9768 = mk_head () in
                              FStar_Extraction_ML_Code.string_of_mlexpr
                                uu____9767 uu____9768 in
                            let uu____9769 =
                              let uu____9770 =
                                FStar_Extraction_ML_UEnv.current_module_of_uenv
                                  g in
                              FStar_Extraction_ML_Code.string_of_mlty
                                uu____9770 t1 in
                            let uu____9771 =
                              match restArgs with
                              | [] -> "none"
                              | (hd, uu____9779)::uu____9780 ->
                                  FStar_Syntax_Print.term_to_string hd in
                            FStar_Util.print3
                              "extract_app ml_head=%s type of head = %s, next arg = %s\n"
                              uu____9766 uu____9769 uu____9771);
                       (match (restArgs, t1) with
                        | ([], uu____9813) ->
                            let app =
                              let uu____9829 = mk_head () in
                              maybe_eta_data_and_project_record g is_data t1
                                uu____9829 in
                            (app, f, t1)
                        | ((arg, uu____9831)::rest,
                           FStar_Extraction_ML_Syntax.MLTY_Fun
                           (formal_t, f', t2)) when
                            (is_type g arg) &&
                              (type_leq g formal_t
                                 FStar_Extraction_ML_Syntax.ml_unit_ty)
                            ->
                            let uu____9862 =
                              let uu____9867 =
                                FStar_Extraction_ML_Util.join
                                  arg.FStar_Syntax_Syntax.pos f f' in
                              (uu____9867, t2) in
                            extract_app is_data
                              (mlhead,
                                ((FStar_Extraction_ML_Syntax.ml_unit,
                                   FStar_Extraction_ML_Syntax.E_PURE) ::
                                mlargs_f)) uu____9862 rest
                        | ((e0, uu____9879)::rest,
                           FStar_Extraction_ML_Syntax.MLTY_Fun
                           (tExpected, f', t2)) ->
                            let r = e0.FStar_Syntax_Syntax.pos in
                            let expected_effect =
                              let uu____9912 =
                                (FStar_Options.lax ()) &&
                                  (FStar_TypeChecker_Util.short_circuit_head
                                     head) in
                              if uu____9912
                              then FStar_Extraction_ML_Syntax.E_IMPURE
                              else FStar_Extraction_ML_Syntax.E_PURE in
                            let uu____9914 =
                              check_term_as_mlexpr g e0 expected_effect
                                tExpected in
                            (match uu____9914 with
                             | (e01, tInferred) ->
                                 let uu____9927 =
                                   let uu____9932 =
                                     FStar_Extraction_ML_Util.join_l r
                                       [f; f'] in
                                   (uu____9932, t2) in
                                 extract_app is_data
                                   (mlhead, ((e01, expected_effect) ::
                                     mlargs_f)) uu____9927 rest)
                        | uu____9943 ->
                            let uu____9956 =
                              FStar_Extraction_ML_Util.udelta_unfold g t1 in
                            (match uu____9956 with
                             | FStar_Pervasives_Native.Some t2 ->
                                 extract_app is_data (mlhead, mlargs_f)
                                   (f, t2) restArgs
                             | FStar_Pervasives_Native.None ->
                                 (match t1 with
                                  | FStar_Extraction_ML_Syntax.MLTY_Erased ->
                                      (FStar_Extraction_ML_Syntax.ml_unit,
                                        FStar_Extraction_ML_Syntax.E_PURE,
                                        t1)
                                  | FStar_Extraction_ML_Syntax.MLTY_Top ->
                                      let t2 =
                                        FStar_List.fold_right
                                          (fun t2 ->
                                             fun out ->
                                               FStar_Extraction_ML_Syntax.MLTY_Fun
                                                 (FStar_Extraction_ML_Syntax.MLTY_Top,
                                                   FStar_Extraction_ML_Syntax.E_PURE,
                                                   out)) restArgs
                                          FStar_Extraction_ML_Syntax.MLTY_Top in
                                      let mlhead1 =
                                        let mlargs =
                                          FStar_All.pipe_right
                                            (FStar_List.rev mlargs_f)
                                            (FStar_List.map
                                               FStar_Pervasives_Native.fst) in
                                        let head1 =
                                          FStar_All.pipe_left
                                            (FStar_Extraction_ML_Syntax.with_ty
                                               FStar_Extraction_ML_Syntax.MLTY_Top)
                                            (FStar_Extraction_ML_Syntax.MLE_App
                                               (mlhead, mlargs)) in
                                        maybe_coerce
                                          top1.FStar_Syntax_Syntax.pos g
                                          head1
                                          FStar_Extraction_ML_Syntax.MLTY_Top
                                          t2 in
                                      extract_app is_data (mlhead1, [])
                                        (f, t2) restArgs
                                  | uu____10028 ->
                                      let mlhead1 =
                                        let mlargs =
                                          FStar_All.pipe_right
                                            (FStar_List.rev mlargs_f)
                                            (FStar_List.map
                                               FStar_Pervasives_Native.fst) in
                                        let head1 =
                                          FStar_All.pipe_left
                                            (FStar_Extraction_ML_Syntax.with_ty
                                               FStar_Extraction_ML_Syntax.MLTY_Top)
                                            (FStar_Extraction_ML_Syntax.MLE_App
                                               (mlhead, mlargs)) in
                                        maybe_coerce
                                          top1.FStar_Syntax_Syntax.pos g
                                          head1
                                          FStar_Extraction_ML_Syntax.MLTY_Top
                                          t1 in
                                      err_ill_typed_application g top1
                                        mlhead1 restArgs t1)))) in
                let extract_app_maybe_projector is_data mlhead uu____10099
                  args1 =
                  match uu____10099 with
                  | (f, t1) ->
                      (match is_data with
                       | FStar_Pervasives_Native.Some
                           (FStar_Syntax_Syntax.Record_projector uu____10129)
                           ->
                           let rec remove_implicits args2 f1 t2 =
                             match (args2, t2) with
                             | ((a0, FStar_Pervasives_Native.Some
                                 (FStar_Syntax_Syntax.Implicit uu____10213))::args3,
                                FStar_Extraction_ML_Syntax.MLTY_Fun
                                (uu____10215, f', t3)) ->
                                 let uu____10252 =
                                   FStar_Extraction_ML_Util.join
                                     a0.FStar_Syntax_Syntax.pos f1 f' in
                                 remove_implicits args3 uu____10252 t3
                             | uu____10253 -> (args2, f1, t2) in
                           let uu____10278 = remove_implicits args1 f t1 in
                           (match uu____10278 with
                            | (args2, f1, t2) ->
                                extract_app is_data (mlhead, []) (f1, t2)
                                  args2)
                       | uu____10334 ->
                           extract_app is_data (mlhead, []) (f, t1) args1) in
                let extract_app_with_instantiations uu____10358 =
                  let head1 = FStar_Syntax_Util.un_uinst head in
                  match head1.FStar_Syntax_Syntax.n with
                  | FStar_Syntax_Syntax.Tm_name uu____10366 ->
                      let uu____10367 =
                        let uu____10382 =
                          FStar_Extraction_ML_UEnv.lookup_term g head1 in
                        match uu____10382 with
                        | (FStar_Util.Inr exp_b, q) ->
                            (FStar_Extraction_ML_UEnv.debug g
                               (fun uu____10414 ->
                                  let uu____10415 =
                                    FStar_Syntax_Print.term_to_string head1 in
                                  let uu____10416 =
                                    let uu____10417 =
                                      FStar_Extraction_ML_UEnv.current_module_of_uenv
                                        g in
                                    FStar_Extraction_ML_Code.string_of_mlexpr
                                      uu____10417
                                      exp_b.FStar_Extraction_ML_UEnv.exp_b_expr in
                                  let uu____10418 =
                                    let uu____10419 =
                                      FStar_Extraction_ML_UEnv.current_module_of_uenv
                                        g in
                                    FStar_Extraction_ML_Code.string_of_mlty
                                      uu____10419
                                      (FStar_Pervasives_Native.snd
                                         exp_b.FStar_Extraction_ML_UEnv.exp_b_tscheme) in
                                  FStar_Util.print3
                                    "@@@looked up %s: got %s at %s\n"
                                    uu____10415 uu____10416 uu____10418);
                             (((exp_b.FStar_Extraction_ML_UEnv.exp_b_expr),
                                (exp_b.FStar_Extraction_ML_UEnv.exp_b_tscheme)),
                               q))
                        | uu____10434 -> failwith "FIXME Ty" in
                      (match uu____10367 with
                       | ((head_ml, (vars, t1)), qual) ->
                           let has_typ_apps =
                             match args with
                             | (a, uu____10483)::uu____10484 -> is_type g a
                             | uu____10511 -> false in
                           let uu____10522 =
                             let n = FStar_List.length vars in
                             let uu____10538 =
                               if (FStar_List.length args) <= n
                               then
                                 let uu____10575 =
                                   FStar_List.map
                                     (fun uu____10587 ->
                                        match uu____10587 with
                                        | (x, uu____10595) ->
                                            term_as_mlty g x) args in
                                 (uu____10575, [])
                               else
                                 (let uu____10617 = FStar_Util.first_N n args in
                                  match uu____10617 with
                                  | (prefix, rest) ->
                                      let uu____10706 =
                                        FStar_List.map
                                          (fun uu____10718 ->
                                             match uu____10718 with
                                             | (x, uu____10726) ->
                                                 term_as_mlty g x) prefix in
                                      (uu____10706, rest)) in
                             match uu____10538 with
                             | (provided_type_args, rest) ->
                                 let uu____10777 =
                                   match head_ml.FStar_Extraction_ML_Syntax.expr
                                   with
                                   | FStar_Extraction_ML_Syntax.MLE_Name
                                       uu____10786 ->
                                       let uu____10787 =
                                         instantiate_maybe_partial g head_ml
                                           (vars, t1) provided_type_args in
                                       (match uu____10787 with
                                        | (head2, uu____10799, t2) ->
                                            (head2, t2))
                                   | FStar_Extraction_ML_Syntax.MLE_Var
                                       uu____10801 ->
                                       let uu____10802 =
                                         instantiate_maybe_partial g head_ml
                                           (vars, t1) provided_type_args in
                                       (match uu____10802 with
                                        | (head2, uu____10814, t2) ->
                                            (head2, t2))
                                   | FStar_Extraction_ML_Syntax.MLE_App
                                       (head2,
                                        {
                                          FStar_Extraction_ML_Syntax.expr =
                                            FStar_Extraction_ML_Syntax.MLE_Const
                                            (FStar_Extraction_ML_Syntax.MLC_Unit);
                                          FStar_Extraction_ML_Syntax.mlty =
                                            uu____10817;
                                          FStar_Extraction_ML_Syntax.loc =
                                            uu____10818;_}::[])
                                       ->
                                       let uu____10821 =
                                         instantiate_maybe_partial g head2
                                           (vars, t1) provided_type_args in
                                       (match uu____10821 with
                                        | (head3, uu____10833, t2) ->
                                            let uu____10835 =
                                              FStar_All.pipe_right
                                                (FStar_Extraction_ML_Syntax.MLE_App
                                                   (head3,
                                                     [FStar_Extraction_ML_Syntax.ml_unit]))
                                                (FStar_Extraction_ML_Syntax.with_ty
                                                   t2) in
                                            (uu____10835, t2))
                                   | uu____10838 ->
                                       failwith
                                         "Impossible: Unexpected head term" in
                                 (match uu____10777 with
                                  | (head2, t2) -> (head2, t2, rest)) in
                           (match uu____10522 with
                            | (head_ml1, head_t, args1) ->
                                (match args1 with
                                 | [] ->
                                     let uu____10904 =
                                       maybe_eta_data_and_project_record g
                                         qual head_t head_ml1 in
                                     (uu____10904,
                                       FStar_Extraction_ML_Syntax.E_PURE,
                                       head_t)
                                 | uu____10905 ->
                                     extract_app_maybe_projector qual
                                       head_ml1
                                       (FStar_Extraction_ML_Syntax.E_PURE,
                                         head_t) args1)))
                  | FStar_Syntax_Syntax.Tm_fvar uu____10914 ->
                      let uu____10915 =
                        let uu____10930 =
                          FStar_Extraction_ML_UEnv.lookup_term g head1 in
                        match uu____10930 with
                        | (FStar_Util.Inr exp_b, q) ->
                            (FStar_Extraction_ML_UEnv.debug g
                               (fun uu____10962 ->
                                  let uu____10963 =
                                    FStar_Syntax_Print.term_to_string head1 in
                                  let uu____10964 =
                                    let uu____10965 =
                                      FStar_Extraction_ML_UEnv.current_module_of_uenv
                                        g in
                                    FStar_Extraction_ML_Code.string_of_mlexpr
                                      uu____10965
                                      exp_b.FStar_Extraction_ML_UEnv.exp_b_expr in
                                  let uu____10966 =
                                    let uu____10967 =
                                      FStar_Extraction_ML_UEnv.current_module_of_uenv
                                        g in
                                    FStar_Extraction_ML_Code.string_of_mlty
                                      uu____10967
                                      (FStar_Pervasives_Native.snd
                                         exp_b.FStar_Extraction_ML_UEnv.exp_b_tscheme) in
                                  FStar_Util.print3
                                    "@@@looked up %s: got %s at %s\n"
                                    uu____10963 uu____10964 uu____10966);
                             (((exp_b.FStar_Extraction_ML_UEnv.exp_b_expr),
                                (exp_b.FStar_Extraction_ML_UEnv.exp_b_tscheme)),
                               q))
                        | uu____10982 -> failwith "FIXME Ty" in
                      (match uu____10915 with
                       | ((head_ml, (vars, t1)), qual) ->
                           let has_typ_apps =
                             match args with
                             | (a, uu____11031)::uu____11032 -> is_type g a
                             | uu____11059 -> false in
                           let uu____11070 =
                             let n = FStar_List.length vars in
                             let uu____11086 =
                               if (FStar_List.length args) <= n
                               then
                                 let uu____11123 =
                                   FStar_List.map
                                     (fun uu____11135 ->
                                        match uu____11135 with
                                        | (x, uu____11143) ->
                                            term_as_mlty g x) args in
                                 (uu____11123, [])
                               else
                                 (let uu____11165 = FStar_Util.first_N n args in
                                  match uu____11165 with
                                  | (prefix, rest) ->
                                      let uu____11254 =
                                        FStar_List.map
                                          (fun uu____11266 ->
                                             match uu____11266 with
                                             | (x, uu____11274) ->
                                                 term_as_mlty g x) prefix in
                                      (uu____11254, rest)) in
                             match uu____11086 with
                             | (provided_type_args, rest) ->
                                 let uu____11325 =
                                   match head_ml.FStar_Extraction_ML_Syntax.expr
                                   with
                                   | FStar_Extraction_ML_Syntax.MLE_Name
                                       uu____11334 ->
                                       let uu____11335 =
                                         instantiate_maybe_partial g head_ml
                                           (vars, t1) provided_type_args in
                                       (match uu____11335 with
                                        | (head2, uu____11347, t2) ->
                                            (head2, t2))
                                   | FStar_Extraction_ML_Syntax.MLE_Var
                                       uu____11349 ->
                                       let uu____11350 =
                                         instantiate_maybe_partial g head_ml
                                           (vars, t1) provided_type_args in
                                       (match uu____11350 with
                                        | (head2, uu____11362, t2) ->
                                            (head2, t2))
                                   | FStar_Extraction_ML_Syntax.MLE_App
                                       (head2,
                                        {
                                          FStar_Extraction_ML_Syntax.expr =
                                            FStar_Extraction_ML_Syntax.MLE_Const
                                            (FStar_Extraction_ML_Syntax.MLC_Unit);
                                          FStar_Extraction_ML_Syntax.mlty =
                                            uu____11365;
                                          FStar_Extraction_ML_Syntax.loc =
                                            uu____11366;_}::[])
                                       ->
                                       let uu____11369 =
                                         instantiate_maybe_partial g head2
                                           (vars, t1) provided_type_args in
                                       (match uu____11369 with
                                        | (head3, uu____11381, t2) ->
                                            let uu____11383 =
                                              FStar_All.pipe_right
                                                (FStar_Extraction_ML_Syntax.MLE_App
                                                   (head3,
                                                     [FStar_Extraction_ML_Syntax.ml_unit]))
                                                (FStar_Extraction_ML_Syntax.with_ty
                                                   t2) in
                                            (uu____11383, t2))
                                   | uu____11386 ->
                                       failwith
                                         "Impossible: Unexpected head term" in
                                 (match uu____11325 with
                                  | (head2, t2) -> (head2, t2, rest)) in
                           (match uu____11070 with
                            | (head_ml1, head_t, args1) ->
                                (match args1 with
                                 | [] ->
                                     let uu____11452 =
                                       maybe_eta_data_and_project_record g
                                         qual head_t head_ml1 in
                                     (uu____11452,
                                       FStar_Extraction_ML_Syntax.E_PURE,
                                       head_t)
                                 | uu____11453 ->
                                     extract_app_maybe_projector qual
                                       head_ml1
                                       (FStar_Extraction_ML_Syntax.E_PURE,
                                         head_t) args1)))
                  | uu____11462 ->
                      let uu____11463 = term_as_mlexpr g head1 in
                      (match uu____11463 with
                       | (head2, f, t1) ->
                           extract_app_maybe_projector
                             FStar_Pervasives_Native.None head2 (f, t1) args) in
                let uu____11479 = is_type g t in
                if uu____11479
                then
                  (FStar_Extraction_ML_Syntax.ml_unit,
                    FStar_Extraction_ML_Syntax.E_PURE,
                    FStar_Extraction_ML_Syntax.ml_unit_ty)
                else
                  (let uu____11487 =
                     let uu____11488 = FStar_Syntax_Util.un_uinst head in
                     uu____11488.FStar_Syntax_Syntax.n in
                   match uu____11487 with
                   | FStar_Syntax_Syntax.Tm_fvar fv ->
                       let uu____11498 =
                         FStar_Extraction_ML_UEnv.try_lookup_fv g fv in
                       (match uu____11498 with
                        | FStar_Pervasives_Native.None ->
                            (FStar_Extraction_ML_Syntax.ml_unit,
                              FStar_Extraction_ML_Syntax.E_PURE,
                              FStar_Extraction_ML_Syntax.MLTY_Erased)
                        | uu____11507 -> extract_app_with_instantiations ())
                   | uu____11510 -> extract_app_with_instantiations ()))
       | FStar_Syntax_Syntax.Tm_ascribed (e0, (tc, uu____11513), f) ->
           let t1 =
             match tc with
             | FStar_Util.Inl t1 -> term_as_mlty g t1
             | FStar_Util.Inr c ->
                 let uu____11578 =
                   let uu____11579 = FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
                   maybe_reify_comp g uu____11579 c in
                 term_as_mlty g uu____11578 in
           let f1 =
             match f with
             | FStar_Pervasives_Native.None ->
                 failwith "Ascription node with an empty effect label"
             | FStar_Pervasives_Native.Some l -> effect_as_etag g l in
           let uu____11582 = check_term_as_mlexpr g e0 f1 t1 in
           (match uu____11582 with | (e, t2) -> (e, f1, t2))
       | FStar_Syntax_Syntax.Tm_let ((false, lb::[]), e') when
           (let uu____11611 = FStar_Syntax_Syntax.is_top_level [lb] in
            Prims.op_Negation uu____11611) &&
             (let uu____11613 =
                FStar_Syntax_Util.get_attribute
                  FStar_Parser_Const.rename_let_attr
                  lb.FStar_Syntax_Syntax.lbattrs in
              FStar_Util.is_some uu____11613)
           ->
           let b =
             let uu____11623 = FStar_Util.left lb.FStar_Syntax_Syntax.lbname in
             (uu____11623, FStar_Pervasives_Native.None) in
           let uu____11626 = FStar_Syntax_Subst.open_term_1 b e' in
           (match uu____11626 with
            | ((x, uu____11638), body) ->
                let suggested_name =
                  let attr =
                    FStar_Syntax_Util.get_attribute
                      FStar_Parser_Const.rename_let_attr
                      lb.FStar_Syntax_Syntax.lbattrs in
                  match attr with
                  | FStar_Pervasives_Native.Some ((str, uu____11653)::[]) ->
                      let uu____11678 =
                        let uu____11679 = FStar_Syntax_Subst.compress str in
                        uu____11679.FStar_Syntax_Syntax.n in
                      (match uu____11678 with
                       | FStar_Syntax_Syntax.Tm_constant
                           (FStar_Const.Const_string (s, uu____11685)) ->
                           let id =
                             let uu____11687 =
                               let uu____11692 =
                                 FStar_Syntax_Syntax.range_of_bv x in
                               (s, uu____11692) in
                             FStar_Ident.mk_ident uu____11687 in
                           let bv =
                             {
                               FStar_Syntax_Syntax.ppname = id;
                               FStar_Syntax_Syntax.index = Prims.int_zero;
                               FStar_Syntax_Syntax.sort =
                                 (x.FStar_Syntax_Syntax.sort)
                             } in
                           let bv1 = FStar_Syntax_Syntax.freshen_bv bv in
                           FStar_Pervasives_Native.Some bv1
                       | uu____11695 -> FStar_Pervasives_Native.None)
                  | FStar_Pervasives_Native.Some uu____11696 ->
                      (FStar_Errors.log_issue top1.FStar_Syntax_Syntax.pos
                         (FStar_Errors.Warning_UnrecognizedAttribute,
                           "Ill-formed application of `rename_let`");
                       FStar_Pervasives_Native.None)
                  | FStar_Pervasives_Native.None ->
                      FStar_Pervasives_Native.None in
                let remove_attr attrs =
                  let uu____11714 =
                    FStar_List.partition
                      (fun attr ->
                         let uu____11726 =
                           FStar_Syntax_Util.get_attribute
                             FStar_Parser_Const.rename_let_attr [attr] in
                         FStar_Util.is_some uu____11726)
                      lb.FStar_Syntax_Syntax.lbattrs in
                  match uu____11714 with
                  | (uu____11731, other_attrs) -> other_attrs in
                let maybe_rewritten_let =
                  match suggested_name with
                  | FStar_Pervasives_Native.None ->
                      let other_attrs =
                        remove_attr lb.FStar_Syntax_Syntax.lbattrs in
                      FStar_Syntax_Syntax.Tm_let
                        ((false,
                           [(let uu___1775_11756 = lb in
                             {
                               FStar_Syntax_Syntax.lbname =
                                 (uu___1775_11756.FStar_Syntax_Syntax.lbname);
                               FStar_Syntax_Syntax.lbunivs =
                                 (uu___1775_11756.FStar_Syntax_Syntax.lbunivs);
                               FStar_Syntax_Syntax.lbtyp =
                                 (uu___1775_11756.FStar_Syntax_Syntax.lbtyp);
                               FStar_Syntax_Syntax.lbeff =
                                 (uu___1775_11756.FStar_Syntax_Syntax.lbeff);
                               FStar_Syntax_Syntax.lbdef =
                                 (uu___1775_11756.FStar_Syntax_Syntax.lbdef);
                               FStar_Syntax_Syntax.lbattrs = other_attrs;
                               FStar_Syntax_Syntax.lbpos =
                                 (uu___1775_11756.FStar_Syntax_Syntax.lbpos)
                             })]), e')
                  | FStar_Pervasives_Native.Some y ->
                      let other_attrs =
                        remove_attr lb.FStar_Syntax_Syntax.lbattrs in
                      let rename =
                        let uu____11764 =
                          let uu____11765 =
                            let uu____11772 =
                              FStar_Syntax_Syntax.bv_to_name y in
                            (x, uu____11772) in
                          FStar_Syntax_Syntax.NT uu____11765 in
                        [uu____11764] in
                      let body1 =
                        let uu____11778 =
                          FStar_Syntax_Subst.subst rename body in
                        FStar_Syntax_Subst.close
                          [(y, FStar_Pervasives_Native.None)] uu____11778 in
                      let lb1 =
                        let uu___1782_11794 = lb in
                        {
                          FStar_Syntax_Syntax.lbname = (FStar_Util.Inl y);
                          FStar_Syntax_Syntax.lbunivs =
                            (uu___1782_11794.FStar_Syntax_Syntax.lbunivs);
                          FStar_Syntax_Syntax.lbtyp =
                            (uu___1782_11794.FStar_Syntax_Syntax.lbtyp);
                          FStar_Syntax_Syntax.lbeff =
                            (uu___1782_11794.FStar_Syntax_Syntax.lbeff);
                          FStar_Syntax_Syntax.lbdef =
                            (uu___1782_11794.FStar_Syntax_Syntax.lbdef);
                          FStar_Syntax_Syntax.lbattrs = other_attrs;
                          FStar_Syntax_Syntax.lbpos =
                            (uu___1782_11794.FStar_Syntax_Syntax.lbpos)
                        } in
                      FStar_Syntax_Syntax.Tm_let ((false, [lb1]), body1) in
                let top2 =
                  let uu___1786_11808 = top1 in
                  {
                    FStar_Syntax_Syntax.n = maybe_rewritten_let;
                    FStar_Syntax_Syntax.pos =
                      (uu___1786_11808.FStar_Syntax_Syntax.pos);
                    FStar_Syntax_Syntax.vars =
                      (uu___1786_11808.FStar_Syntax_Syntax.vars)
                  } in
                term_as_mlexpr' g top2)
       | FStar_Syntax_Syntax.Tm_let ((is_rec, lbs), e') ->
           let top_level = FStar_Syntax_Syntax.is_top_level lbs in
           let uu____11827 =
             if is_rec
             then FStar_Syntax_Subst.open_let_rec lbs e'
             else
               (let uu____11841 = FStar_Syntax_Syntax.is_top_level lbs in
                if uu____11841
                then (lbs, e')
                else
                  (let lb = FStar_List.hd lbs in
                   let x =
                     let uu____11853 =
                       FStar_Util.left lb.FStar_Syntax_Syntax.lbname in
                     FStar_Syntax_Syntax.freshen_bv uu____11853 in
                   let lb1 =
                     let uu___1800_11855 = lb in
                     {
                       FStar_Syntax_Syntax.lbname = (FStar_Util.Inl x);
                       FStar_Syntax_Syntax.lbunivs =
                         (uu___1800_11855.FStar_Syntax_Syntax.lbunivs);
                       FStar_Syntax_Syntax.lbtyp =
                         (uu___1800_11855.FStar_Syntax_Syntax.lbtyp);
                       FStar_Syntax_Syntax.lbeff =
                         (uu___1800_11855.FStar_Syntax_Syntax.lbeff);
                       FStar_Syntax_Syntax.lbdef =
                         (uu___1800_11855.FStar_Syntax_Syntax.lbdef);
                       FStar_Syntax_Syntax.lbattrs =
                         (uu___1800_11855.FStar_Syntax_Syntax.lbattrs);
                       FStar_Syntax_Syntax.lbpos =
                         (uu___1800_11855.FStar_Syntax_Syntax.lbpos)
                     } in
                   let e'1 =
                     FStar_Syntax_Subst.subst
                       [FStar_Syntax_Syntax.DB (Prims.int_zero, x)] e' in
                   ([lb1], e'1))) in
           (match uu____11827 with
            | (lbs1, e'1) ->
                let lbs2 =
                  if top_level
                  then
                    let tcenv =
                      let uu____11877 =
                        FStar_Extraction_ML_UEnv.tcenv_of_uenv g in
                      let uu____11878 =
                        let uu____11879 =
                          let uu____11880 =
                            let uu____11883 =
                              FStar_Extraction_ML_UEnv.current_module_of_uenv
                                g in
                            FStar_Pervasives_Native.fst uu____11883 in
                          let uu____11892 =
                            let uu____11895 =
                              let uu____11896 =
                                FStar_Extraction_ML_UEnv.current_module_of_uenv
                                  g in
                              FStar_Pervasives_Native.snd uu____11896 in
                            [uu____11895] in
                          FStar_List.append uu____11880 uu____11892 in
                        FStar_Ident.lid_of_path uu____11879
                          FStar_Range.dummyRange in
                      FStar_TypeChecker_Env.set_current_module uu____11877
                        uu____11878 in
                    FStar_All.pipe_right lbs1
                      (FStar_List.map
                         (fun lb ->
                            let lbdef =
                              let uu____11916 = FStar_Options.ml_ish () in
                              if uu____11916
                              then lb.FStar_Syntax_Syntax.lbdef
                              else
                                (let norm_call uu____11925 =
                                   FStar_TypeChecker_Normalize.normalize
                                     (FStar_TypeChecker_Env.PureSubtermsWithinComputations
                                     :: FStar_TypeChecker_Env.Reify ::
                                     extraction_norm_steps) tcenv
                                     lb.FStar_Syntax_Syntax.lbdef in
                                 let uu____11926 =
                                   (FStar_All.pipe_left
                                      (FStar_TypeChecker_Env.debug tcenv)
                                      (FStar_Options.Other "Extraction"))
                                     ||
                                     (FStar_All.pipe_left
                                        (FStar_TypeChecker_Env.debug tcenv)
                                        (FStar_Options.Other "ExtractNorm")) in
                                 if uu____11926
                                 then
                                   ((let uu____11930 =
                                       FStar_Syntax_Print.lbname_to_string
                                         lb.FStar_Syntax_Syntax.lbname in
                                     FStar_Util.print1
                                       "Starting to normalize top-level let %s\n"
                                       uu____11930);
                                    (let a =
                                       let uu____11934 =
                                         let uu____11935 =
                                           FStar_Syntax_Print.lbname_to_string
                                             lb.FStar_Syntax_Syntax.lbname in
                                         FStar_Util.format1
                                           "###(Time to normalize top-level let %s)"
                                           uu____11935 in
                                       FStar_Util.measure_execution_time
                                         uu____11934 norm_call in
                                     (let uu____11939 =
                                        FStar_Syntax_Print.term_to_string a in
                                      FStar_Util.print1 "Normalized to %s\n"
                                        uu____11939);
                                     a))
                                 else norm_call ()) in
                            let uu___1818_11941 = lb in
                            {
                              FStar_Syntax_Syntax.lbname =
                                (uu___1818_11941.FStar_Syntax_Syntax.lbname);
                              FStar_Syntax_Syntax.lbunivs =
                                (uu___1818_11941.FStar_Syntax_Syntax.lbunivs);
                              FStar_Syntax_Syntax.lbtyp =
                                (uu___1818_11941.FStar_Syntax_Syntax.lbtyp);
                              FStar_Syntax_Syntax.lbeff =
                                (uu___1818_11941.FStar_Syntax_Syntax.lbeff);
                              FStar_Syntax_Syntax.lbdef = lbdef;
                              FStar_Syntax_Syntax.lbattrs =
                                (uu___1818_11941.FStar_Syntax_Syntax.lbattrs);
                              FStar_Syntax_Syntax.lbpos =
                                (uu___1818_11941.FStar_Syntax_Syntax.lbpos)
                            }))
                  else lbs1 in
                let check_lb env uu____11991 =
                  match uu____11991 with
                  | (nm, (_lbname, f, (_t, (targs, polytype)), add_unit, e))
                      ->
                      let env1 =
                        FStar_List.fold_left
                          (fun env1 ->
                             fun uu____12140 ->
                               match uu____12140 with
                               | (a, uu____12148) ->
                                   FStar_Extraction_ML_UEnv.extend_ty env1 a
                                     false) env targs in
                      let expected_t = FStar_Pervasives_Native.snd polytype in
                      let uu____12154 =
                        check_term_as_mlexpr env1 e f expected_t in
                      (match uu____12154 with
                       | (e1, ty) ->
                           let uu____12165 =
                             maybe_promote_effect e1 f expected_t in
                           (match uu____12165 with
                            | (e2, f1) ->
                                let meta =
                                  match (f1, ty) with
                                  | (FStar_Extraction_ML_Syntax.E_PURE,
                                     FStar_Extraction_ML_Syntax.MLTY_Erased)
                                      -> [FStar_Extraction_ML_Syntax.Erased]
                                  | (FStar_Extraction_ML_Syntax.E_GHOST,
                                     FStar_Extraction_ML_Syntax.MLTY_Erased)
                                      -> [FStar_Extraction_ML_Syntax.Erased]
                                  | uu____12177 -> [] in
                                (f1,
                                  {
                                    FStar_Extraction_ML_Syntax.mllb_name = nm;
                                    FStar_Extraction_ML_Syntax.mllb_tysc =
                                      (FStar_Pervasives_Native.Some polytype);
                                    FStar_Extraction_ML_Syntax.mllb_add_unit
                                      = add_unit;
                                    FStar_Extraction_ML_Syntax.mllb_def = e2;
                                    FStar_Extraction_ML_Syntax.mllb_meta =
                                      meta;
                                    FStar_Extraction_ML_Syntax.print_typ =
                                      true
                                  }))) in
                let lbs3 = extract_lb_sig g (is_rec, lbs2) in
                let uu____12205 =
                  FStar_List.fold_right
                    (fun lb ->
                       fun uu____12297 ->
                         match uu____12297 with
                         | (env, lbs4) ->
                             let uu____12422 = lb in
                             (match uu____12422 with
                              | (lbname, uu____12470,
                                 (t1, (uu____12472, polytype)), add_unit,
                                 uu____12475) ->
                                  let uu____12488 =
                                    FStar_Extraction_ML_UEnv.extend_lb env
                                      lbname t1 polytype add_unit in
                                  (match uu____12488 with
                                   | (env1, nm, uu____12525) ->
                                       (env1, ((nm, lb) :: lbs4))))) lbs3
                    (g, []) in
                (match uu____12205 with
                 | (env_body, lbs4) ->
                     let env_def = if is_rec then env_body else g in
                     let lbs5 =
                       FStar_All.pipe_right lbs4
                         (FStar_List.map (check_lb env_def)) in
                     let e'_rng = e'1.FStar_Syntax_Syntax.pos in
                     let uu____12782 = term_as_mlexpr env_body e'1 in
                     (match uu____12782 with
                      | (e'2, f', t') ->
                          let f =
                            let uu____12799 =
                              let uu____12802 =
                                FStar_List.map FStar_Pervasives_Native.fst
                                  lbs5 in
                              f' :: uu____12802 in
                            FStar_Extraction_ML_Util.join_l e'_rng
                              uu____12799 in
                          let is_rec1 =
                            if is_rec = true
                            then FStar_Extraction_ML_Syntax.Rec
                            else FStar_Extraction_ML_Syntax.NonRec in
                          let uu____12811 =
                            let uu____12812 =
                              let uu____12813 =
                                let uu____12814 =
                                  FStar_List.map FStar_Pervasives_Native.snd
                                    lbs5 in
                                (is_rec1, uu____12814) in
                              mk_MLE_Let top_level uu____12813 e'2 in
                            let uu____12823 =
                              FStar_Extraction_ML_Util.mlloc_of_range
                                t.FStar_Syntax_Syntax.pos in
                            FStar_Extraction_ML_Syntax.with_ty_loc t'
                              uu____12812 uu____12823 in
                          (uu____12811, f, t'))))
       | FStar_Syntax_Syntax.Tm_match (scrutinee, pats) ->
           let uu____12862 = term_as_mlexpr g scrutinee in
           (match uu____12862 with
            | (e, f_e, t_e) ->
                let uu____12878 = check_pats_for_ite pats in
                (match uu____12878 with
                 | (b, then_e, else_e) ->
                     let no_lift x t1 = x in
                     if b
                     then
                       (match (then_e, else_e) with
                        | (FStar_Pervasives_Native.Some then_e1,
                           FStar_Pervasives_Native.Some else_e1) ->
                            let uu____12939 = term_as_mlexpr g then_e1 in
                            (match uu____12939 with
                             | (then_mle, f_then, t_then) ->
                                 let uu____12955 = term_as_mlexpr g else_e1 in
                                 (match uu____12955 with
                                  | (else_mle, f_else, t_else) ->
                                      let uu____12971 =
                                        let uu____12982 =
                                          type_leq g t_then t_else in
                                        if uu____12982
                                        then (t_else, no_lift)
                                        else
                                          (let uu____13000 =
                                             type_leq g t_else t_then in
                                           if uu____13000
                                           then (t_then, no_lift)
                                           else
                                             (FStar_Extraction_ML_Syntax.MLTY_Top,
                                               FStar_Extraction_ML_Syntax.apply_obj_repr)) in
                                      (match uu____12971 with
                                       | (t_branch, maybe_lift) ->
                                           let uu____13044 =
                                             let uu____13045 =
                                               let uu____13046 =
                                                 let uu____13055 =
                                                   maybe_lift then_mle t_then in
                                                 let uu____13056 =
                                                   let uu____13059 =
                                                     maybe_lift else_mle
                                                       t_else in
                                                   FStar_Pervasives_Native.Some
                                                     uu____13059 in
                                                 (e, uu____13055,
                                                   uu____13056) in
                                               FStar_Extraction_ML_Syntax.MLE_If
                                                 uu____13046 in
                                             FStar_All.pipe_left
                                               (FStar_Extraction_ML_Syntax.with_ty
                                                  t_branch) uu____13045 in
                                           let uu____13062 =
                                             FStar_Extraction_ML_Util.join
                                               then_e1.FStar_Syntax_Syntax.pos
                                               f_then f_else in
                                           (uu____13044, uu____13062,
                                             t_branch))))
                        | uu____13063 ->
                            failwith
                              "ITE pats matched but then and else expressions not found?")
                     else
                       (let uu____13079 =
                          FStar_All.pipe_right pats
                            (FStar_Util.fold_map
                               (fun compat ->
                                  fun br ->
                                    let uu____13174 =
                                      FStar_Syntax_Subst.open_branch br in
                                    match uu____13174 with
                                    | (pat, when_opt, branch) ->
                                        let uu____13218 =
                                          extract_pat g pat t_e
                                            term_as_mlexpr in
                                        (match uu____13218 with
                                         | (env, p, pat_t_compat) ->
                                             let uu____13276 =
                                               match when_opt with
                                               | FStar_Pervasives_Native.None
                                                   ->
                                                   (FStar_Pervasives_Native.None,
                                                     FStar_Extraction_ML_Syntax.E_PURE)
                                               | FStar_Pervasives_Native.Some
                                                   w ->
                                                   let w_pos =
                                                     w.FStar_Syntax_Syntax.pos in
                                                   let uu____13299 =
                                                     term_as_mlexpr env w in
                                                   (match uu____13299 with
                                                    | (w1, f_w, t_w) ->
                                                        let w2 =
                                                          maybe_coerce w_pos
                                                            env w1 t_w
                                                            FStar_Extraction_ML_Syntax.ml_bool_ty in
                                                        ((FStar_Pervasives_Native.Some
                                                            w2), f_w)) in
                                             (match uu____13276 with
                                              | (when_opt1, f_when) ->
                                                  let uu____13348 =
                                                    term_as_mlexpr env branch in
                                                  (match uu____13348 with
                                                   | (mlbranch, f_branch,
                                                      t_branch) ->
                                                       let uu____13382 =
                                                         FStar_All.pipe_right
                                                           p
                                                           (FStar_List.map
                                                              (fun
                                                                 uu____13459
                                                                 ->
                                                                 match uu____13459
                                                                 with
                                                                 | (p1, wopt)
                                                                    ->
                                                                    let when_clause
                                                                    =
                                                                    FStar_Extraction_ML_Util.conjoin_opt
                                                                    wopt
                                                                    when_opt1 in
                                                                    (p1,
                                                                    (when_clause,
                                                                    f_when),
                                                                    (mlbranch,
                                                                    f_branch,
                                                                    t_branch)))) in
                                                       ((compat &&
                                                           pat_t_compat),
                                                         uu____13382)))))
                               true) in
                        match uu____13079 with
                        | (pat_t_compat, mlbranches) ->
                            let mlbranches1 = FStar_List.flatten mlbranches in
                            let e1 =
                              if pat_t_compat
                              then e
                              else
                                (FStar_Extraction_ML_UEnv.debug g
                                   (fun uu____13624 ->
                                      let uu____13625 =
                                        let uu____13626 =
                                          FStar_Extraction_ML_UEnv.current_module_of_uenv
                                            g in
                                        FStar_Extraction_ML_Code.string_of_mlexpr
                                          uu____13626 e in
                                      let uu____13627 =
                                        let uu____13628 =
                                          FStar_Extraction_ML_UEnv.current_module_of_uenv
                                            g in
                                        FStar_Extraction_ML_Code.string_of_mlty
                                          uu____13628 t_e in
                                      FStar_Util.print2
                                        "Coercing scrutinee %s from type %s because pattern type is incompatible\n"
                                        uu____13625 uu____13627);
                                 FStar_All.pipe_left
                                   (FStar_Extraction_ML_Syntax.with_ty t_e)
                                   (FStar_Extraction_ML_Syntax.MLE_Coerce
                                      (e, t_e,
                                        FStar_Extraction_ML_Syntax.MLTY_Top))) in
                            (match mlbranches1 with
                             | [] ->
                                 let uu____13653 =
                                   let uu____13654 =
                                     FStar_Syntax_Syntax.lid_as_fv
                                       FStar_Parser_Const.failwith_lid
                                       FStar_Syntax_Syntax.delta_constant
                                       FStar_Pervasives_Native.None in
                                   FStar_Extraction_ML_UEnv.lookup_fv g
                                     uu____13654 in
                                 (match uu____13653 with
                                  | {
                                      FStar_Extraction_ML_UEnv.exp_b_name =
                                        uu____13661;
                                      FStar_Extraction_ML_UEnv.exp_b_expr =
                                        fw;
                                      FStar_Extraction_ML_UEnv.exp_b_tscheme
                                        = uu____13663;_}
                                      ->
                                      let uu____13664 =
                                        let uu____13665 =
                                          let uu____13666 =
                                            let uu____13673 =
                                              let uu____13676 =
                                                FStar_All.pipe_left
                                                  (FStar_Extraction_ML_Syntax.with_ty
                                                     FStar_Extraction_ML_Syntax.ml_string_ty)
                                                  (FStar_Extraction_ML_Syntax.MLE_Const
                                                     (FStar_Extraction_ML_Syntax.MLC_String
                                                        "unreachable")) in
                                              [uu____13676] in
                                            (fw, uu____13673) in
                                          FStar_Extraction_ML_Syntax.MLE_App
                                            uu____13666 in
                                        FStar_All.pipe_left
                                          (FStar_Extraction_ML_Syntax.with_ty
                                             FStar_Extraction_ML_Syntax.ml_int_ty)
                                          uu____13665 in
                                      (uu____13664,
                                        FStar_Extraction_ML_Syntax.E_PURE,
                                        FStar_Extraction_ML_Syntax.ml_int_ty))
                             | (uu____13679, uu____13680,
                                (uu____13681, f_first, t_first))::rest ->
                                 let uu____13741 =
                                   FStar_List.fold_left
                                     (fun uu____13783 ->
                                        fun uu____13784 ->
                                          match (uu____13783, uu____13784)
                                          with
                                          | ((topt, f),
                                             (uu____13841, uu____13842,
                                              (uu____13843, f_branch,
                                               t_branch)))
                                              ->
                                              let f1 =
                                                FStar_Extraction_ML_Util.join
                                                  top1.FStar_Syntax_Syntax.pos
                                                  f f_branch in
                                              let topt1 =
                                                match topt with
                                                | FStar_Pervasives_Native.None
                                                    ->
                                                    FStar_Pervasives_Native.None
                                                | FStar_Pervasives_Native.Some
                                                    t1 ->
                                                    let uu____13899 =
                                                      type_leq g t1 t_branch in
                                                    if uu____13899
                                                    then
                                                      FStar_Pervasives_Native.Some
                                                        t_branch
                                                    else
                                                      (let uu____13903 =
                                                         type_leq g t_branch
                                                           t1 in
                                                       if uu____13903
                                                       then
                                                         FStar_Pervasives_Native.Some
                                                           t1
                                                       else
                                                         FStar_Pervasives_Native.None) in
                                              (topt1, f1))
                                     ((FStar_Pervasives_Native.Some t_first),
                                       f_first) rest in
                                 (match uu____13741 with
                                  | (topt, f_match) ->
                                      let mlbranches2 =
                                        FStar_All.pipe_right mlbranches1
                                          (FStar_List.map
                                             (fun uu____13998 ->
                                                match uu____13998 with
                                                | (p, (wopt, uu____14027),
                                                   (b1, uu____14029, t1)) ->
                                                    let b2 =
                                                      match topt with
                                                      | FStar_Pervasives_Native.None
                                                          ->
                                                          FStar_Extraction_ML_Syntax.apply_obj_repr
                                                            b1 t1
                                                      | FStar_Pervasives_Native.Some
                                                          uu____14048 -> b1 in
                                                    (p, wopt, b2))) in
                                      let t_match =
                                        match topt with
                                        | FStar_Pervasives_Native.None ->
                                            FStar_Extraction_ML_Syntax.MLTY_Top
                                        | FStar_Pervasives_Native.Some t1 ->
                                            t1 in
                                      let uu____14053 =
                                        FStar_All.pipe_left
                                          (FStar_Extraction_ML_Syntax.with_ty
                                             t_match)
                                          (FStar_Extraction_ML_Syntax.MLE_Match
                                             (e1, mlbranches2)) in
                                      (uu____14053, f_match, t_match)))))))
let (ind_discriminator_body :
  FStar_Extraction_ML_UEnv.uenv ->
    FStar_Ident.lident ->
      FStar_Ident.lident -> FStar_Extraction_ML_Syntax.mlmodule1)
  =
  fun env ->
    fun discName ->
      fun constrName ->
        let uu____14079 =
          let uu____14084 =
            let uu____14093 = FStar_Extraction_ML_UEnv.tcenv_of_uenv env in
            FStar_TypeChecker_Env.lookup_lid uu____14093 discName in
          FStar_All.pipe_left FStar_Pervasives_Native.fst uu____14084 in
        match uu____14079 with
        | (uu____14110, fstar_disc_type) ->
            let uu____14112 =
              let uu____14123 =
                let uu____14124 = FStar_Syntax_Subst.compress fstar_disc_type in
                uu____14124.FStar_Syntax_Syntax.n in
              match uu____14123 with
              | FStar_Syntax_Syntax.Tm_arrow (binders, uu____14138) ->
                  let binders1 =
                    FStar_All.pipe_right binders
                      (FStar_List.filter
                         (fun uu___2_14193 ->
                            match uu___2_14193 with
                            | (uu____14200, FStar_Pervasives_Native.Some
                               (FStar_Syntax_Syntax.Implicit uu____14201)) ->
                                true
                            | uu____14204 -> false)) in
                  FStar_List.fold_right
                    (fun uu____14234 ->
                       fun uu____14235 ->
                         match uu____14235 with
                         | (g, vs) ->
                             let uu____14276 =
                               FStar_Extraction_ML_UEnv.new_mlident g in
                             (match uu____14276 with
                              | (g1, v) ->
                                  (g1,
                                    ((v, FStar_Extraction_ML_Syntax.MLTY_Top)
                                    :: vs)))) binders1 (env, [])
              | uu____14313 -> failwith "Discriminator must be a function" in
            (match uu____14112 with
             | (g, wildcards) ->
                 let uu____14338 = FStar_Extraction_ML_UEnv.new_mlident g in
                 (match uu____14338 with
                  | (g1, mlid) ->
                      let targ = FStar_Extraction_ML_Syntax.MLTY_Top in
                      let disc_ty = FStar_Extraction_ML_Syntax.MLTY_Top in
                      let discrBody =
                        let uu____14348 =
                          let uu____14349 =
                            let uu____14360 =
                              let uu____14361 =
                                let uu____14362 =
                                  let uu____14377 =
                                    FStar_All.pipe_left
                                      (FStar_Extraction_ML_Syntax.with_ty
                                         targ)
                                      (FStar_Extraction_ML_Syntax.MLE_Name
                                         ([], mlid)) in
                                  let uu____14380 =
                                    let uu____14391 =
                                      let uu____14400 =
                                        let uu____14401 =
                                          let uu____14408 =
                                            FStar_Extraction_ML_UEnv.mlpath_of_lident
                                              g1 constrName in
                                          (uu____14408,
                                            [FStar_Extraction_ML_Syntax.MLP_Wild]) in
                                        FStar_Extraction_ML_Syntax.MLP_CTor
                                          uu____14401 in
                                      let uu____14411 =
                                        FStar_All.pipe_left
                                          (FStar_Extraction_ML_Syntax.with_ty
                                             FStar_Extraction_ML_Syntax.ml_bool_ty)
                                          (FStar_Extraction_ML_Syntax.MLE_Const
                                             (FStar_Extraction_ML_Syntax.MLC_Bool
                                                true)) in
                                      (uu____14400,
                                        FStar_Pervasives_Native.None,
                                        uu____14411) in
                                    let uu____14414 =
                                      let uu____14425 =
                                        let uu____14434 =
                                          FStar_All.pipe_left
                                            (FStar_Extraction_ML_Syntax.with_ty
                                               FStar_Extraction_ML_Syntax.ml_bool_ty)
                                            (FStar_Extraction_ML_Syntax.MLE_Const
                                               (FStar_Extraction_ML_Syntax.MLC_Bool
                                                  false)) in
                                        (FStar_Extraction_ML_Syntax.MLP_Wild,
                                          FStar_Pervasives_Native.None,
                                          uu____14434) in
                                      [uu____14425] in
                                    uu____14391 :: uu____14414 in
                                  (uu____14377, uu____14380) in
                                FStar_Extraction_ML_Syntax.MLE_Match
                                  uu____14362 in
                              FStar_All.pipe_left
                                (FStar_Extraction_ML_Syntax.with_ty
                                   FStar_Extraction_ML_Syntax.ml_bool_ty)
                                uu____14361 in
                            ((FStar_List.append wildcards [(mlid, targ)]),
                              uu____14360) in
                          FStar_Extraction_ML_Syntax.MLE_Fun uu____14349 in
                        FStar_All.pipe_left
                          (FStar_Extraction_ML_Syntax.with_ty disc_ty)
                          uu____14348 in
                      let uu____14489 =
                        FStar_Extraction_ML_UEnv.mlpath_of_lident env
                          discName in
                      (match uu____14489 with
                       | (uu____14490, name) ->
                           FStar_Extraction_ML_Syntax.MLM_Let
                             (FStar_Extraction_ML_Syntax.NonRec,
                               [{
                                  FStar_Extraction_ML_Syntax.mllb_name = name;
                                  FStar_Extraction_ML_Syntax.mllb_tysc =
                                    FStar_Pervasives_Native.None;
                                  FStar_Extraction_ML_Syntax.mllb_add_unit =
                                    false;
                                  FStar_Extraction_ML_Syntax.mllb_def =
                                    discrBody;
                                  FStar_Extraction_ML_Syntax.mllb_meta = [];
                                  FStar_Extraction_ML_Syntax.print_typ =
                                    false
                                }]))))