open Prims
let fail_exp:
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax
  =
  fun lid  ->
    fun t  ->
      let uu____9 =
        let uu____12 =
          let uu____13 =
            let uu____28 =
              FStar_Syntax_Syntax.fvar FStar_Parser_Const.failwith_lid
                FStar_Syntax_Syntax.Delta_constant
                FStar_Pervasives_Native.None in
            let uu____29 =
              let uu____32 = FStar_Syntax_Syntax.iarg t in
              let uu____33 =
                let uu____36 =
                  let uu____37 =
                    let uu____38 =
                      let uu____41 =
                        let uu____42 =
                          let uu____43 =
                            let uu____48 =
                              let uu____49 =
                                FStar_Syntax_Print.lid_to_string lid in
                              Prims.strcat "Not yet implemented:" uu____49 in
                            (uu____48, FStar_Range.dummyRange) in
                          FStar_Const.Const_string uu____43 in
                        FStar_Syntax_Syntax.Tm_constant uu____42 in
                      FStar_Syntax_Syntax.mk uu____41 in
                    uu____38 FStar_Pervasives_Native.None
                      FStar_Range.dummyRange in
                  FStar_All.pipe_left FStar_Syntax_Syntax.as_arg uu____37 in
                [uu____36] in
              uu____32 :: uu____33 in
            (uu____28, uu____29) in
          FStar_Syntax_Syntax.Tm_app uu____13 in
        FStar_Syntax_Syntax.mk uu____12 in
      uu____9 FStar_Pervasives_Native.None FStar_Range.dummyRange
let mangle_projector_lid: FStar_Ident.lident -> FStar_Ident.lident =
  fun x  -> x
let lident_as_mlsymbol:
  FStar_Ident.lident -> FStar_Extraction_ML_Syntax.mlsymbol =
  fun id1  ->
    FStar_Extraction_ML_Syntax.avoid_keyword
      (id1.FStar_Ident.ident).FStar_Ident.idText
let as_pair:
  'Auu____66 .
    'Auu____66 Prims.list ->
      ('Auu____66,'Auu____66) FStar_Pervasives_Native.tuple2
  =
  fun uu___295_76  ->
    match uu___295_76 with
    | a::b::[] -> (a, b)
    | uu____81 -> failwith "Expected a list with 2 elements"
let is_tactic_decl:
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.term ->
      FStar_Extraction_ML_Syntax.mlpath -> Prims.bool
  =
  fun tac_lid  ->
    fun h  ->
      fun current_module1  ->
        match h.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Tm_uinst (h',uu____98) ->
            let uu____103 =
              let uu____104 = FStar_Syntax_Subst.compress h' in
              uu____104.FStar_Syntax_Syntax.n in
            (match uu____103 with
             | FStar_Syntax_Syntax.Tm_fvar fv when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.tactic_lid
                 ->
                 let uu____108 =
                   let uu____109 =
                     FStar_Extraction_ML_Syntax.string_of_mlpath
                       current_module1 in
                   FStar_Util.starts_with uu____109 "FStar.Tactics" in
                 Prims.op_Negation uu____108
             | uu____110 -> false)
        | uu____111 -> false
let rec extract_meta:
  FStar_Syntax_Syntax.term ->
    FStar_Extraction_ML_Syntax.meta FStar_Pervasives_Native.option
  =
  fun x  ->
    let uu____117 = FStar_Syntax_Subst.compress x in
    match uu____117 with
    | { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
        FStar_Syntax_Syntax.pos = uu____121;
        FStar_Syntax_Syntax.vars = uu____122;_} when
        let uu____125 =
          let uu____126 = FStar_Syntax_Syntax.lid_of_fv fv in
          FStar_Ident.string_of_lid uu____126 in
        uu____125 = "FStar.Pervasives.PpxDerivingShow" ->
        FStar_Pervasives_Native.Some
          FStar_Extraction_ML_Syntax.PpxDerivingShow
    | { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
        FStar_Syntax_Syntax.pos = uu____128;
        FStar_Syntax_Syntax.vars = uu____129;_} when
        let uu____132 =
          let uu____133 = FStar_Syntax_Syntax.lid_of_fv fv in
          FStar_Ident.string_of_lid uu____133 in
        uu____132 = "FStar.Pervasives.CInline" ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.CInline
    | { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
        FStar_Syntax_Syntax.pos = uu____135;
        FStar_Syntax_Syntax.vars = uu____136;_} when
        let uu____139 =
          let uu____140 = FStar_Syntax_Syntax.lid_of_fv fv in
          FStar_Ident.string_of_lid uu____140 in
        uu____139 = "FStar.Pervasives.Substitute" ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.Substitute
    | { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
        FStar_Syntax_Syntax.pos = uu____142;
        FStar_Syntax_Syntax.vars = uu____143;_} when
        let uu____146 =
          let uu____147 = FStar_Syntax_Syntax.lid_of_fv fv in
          FStar_Ident.string_of_lid uu____147 in
        uu____146 = "FStar.Pervasives.Gc" ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.GCType
    | {
        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_app
          ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
             FStar_Syntax_Syntax.pos = uu____149;
             FStar_Syntax_Syntax.vars = uu____150;_},({
                                                        FStar_Syntax_Syntax.n
                                                          =
                                                          FStar_Syntax_Syntax.Tm_constant
                                                          (FStar_Const.Const_string
                                                          (s,uu____152));
                                                        FStar_Syntax_Syntax.pos
                                                          = uu____153;
                                                        FStar_Syntax_Syntax.vars
                                                          = uu____154;_},uu____155)::[]);
        FStar_Syntax_Syntax.pos = uu____156;
        FStar_Syntax_Syntax.vars = uu____157;_} when
        let uu____188 =
          let uu____189 = FStar_Syntax_Syntax.lid_of_fv fv in
          FStar_Ident.string_of_lid uu____189 in
        uu____188 = "FStar.Pervasives.PpxDerivingShowConstant" ->
        FStar_Pervasives_Native.Some
          (FStar_Extraction_ML_Syntax.PpxDerivingShowConstant s)
    | {
        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_app
          ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
             FStar_Syntax_Syntax.pos = uu____191;
             FStar_Syntax_Syntax.vars = uu____192;_},({
                                                        FStar_Syntax_Syntax.n
                                                          =
                                                          FStar_Syntax_Syntax.Tm_constant
                                                          (FStar_Const.Const_string
                                                          (s,uu____194));
                                                        FStar_Syntax_Syntax.pos
                                                          = uu____195;
                                                        FStar_Syntax_Syntax.vars
                                                          = uu____196;_},uu____197)::[]);
        FStar_Syntax_Syntax.pos = uu____198;
        FStar_Syntax_Syntax.vars = uu____199;_} when
        let uu____230 =
          let uu____231 = FStar_Syntax_Syntax.lid_of_fv fv in
          FStar_Ident.string_of_lid uu____231 in
        uu____230 = "FStar.Pervasives.Comment" ->
        FStar_Pervasives_Native.Some (FStar_Extraction_ML_Syntax.Comment s)
    | {
        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
          (FStar_Const.Const_string (data,uu____233));
        FStar_Syntax_Syntax.pos = uu____234;
        FStar_Syntax_Syntax.vars = uu____235;_} when data = "KremlinPrivate"
        -> FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.Private
    | {
        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
          (FStar_Const.Const_string (data,uu____239));
        FStar_Syntax_Syntax.pos = uu____240;
        FStar_Syntax_Syntax.vars = uu____241;_} when data = "c_inline" ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.CInline
    | {
        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
          (FStar_Const.Const_string (data,uu____245));
        FStar_Syntax_Syntax.pos = uu____246;
        FStar_Syntax_Syntax.vars = uu____247;_} when data = "substitute" ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.Substitute
    | { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_meta (x1,uu____251);
        FStar_Syntax_Syntax.pos = uu____252;
        FStar_Syntax_Syntax.vars = uu____253;_} -> extract_meta x1
    | a ->
        ((let uu____262 = FStar_Syntax_Print.term_to_string a in
          FStar_Util.print1_warning
            "Unrecognized attribute (%s), valid attributes are `c_inline`, `substitute`, and `gc`.\n"
            uu____262);
         FStar_Pervasives_Native.None)
let extract_metadata:
  FStar_Syntax_Syntax.term Prims.list ->
    FStar_Extraction_ML_Syntax.meta Prims.list
  = fun metas  -> FStar_List.choose extract_meta metas
let binders_as_mlty_binders:
  'Auu____275 .
    FStar_Extraction_ML_UEnv.env ->
      (FStar_Syntax_Syntax.bv,'Auu____275) FStar_Pervasives_Native.tuple2
        Prims.list ->
        (FStar_Extraction_ML_UEnv.env,Prims.string Prims.list)
          FStar_Pervasives_Native.tuple2
  =
  fun env  ->
    fun bs  ->
      FStar_Util.fold_map
        (fun env1  ->
           fun uu____313  ->
             match uu____313 with
             | (bv,uu____323) ->
                 let uu____324 =
                   let uu____325 =
                     let uu____328 =
                       let uu____329 =
                         FStar_Extraction_ML_UEnv.bv_as_ml_tyvar bv in
                       FStar_Extraction_ML_Syntax.MLTY_Var uu____329 in
                     FStar_Pervasives_Native.Some uu____328 in
                   FStar_Extraction_ML_UEnv.extend_ty env1 bv uu____325 in
                 let uu____330 = FStar_Extraction_ML_UEnv.bv_as_ml_tyvar bv in
                 (uu____324, uu____330)) env bs
let extract_typ_abbrev:
  FStar_Extraction_ML_UEnv.env ->
    FStar_Syntax_Syntax.fv ->
      FStar_Syntax_Syntax.qualifier Prims.list ->
        FStar_Syntax_Syntax.term Prims.list ->
          FStar_Syntax_Syntax.term ->
            (FStar_Extraction_ML_UEnv.env,FStar_Extraction_ML_Syntax.mlmodule1
                                            Prims.list)
              FStar_Pervasives_Native.tuple2
  =
  fun env  ->
    fun fv  ->
      fun quals  ->
        fun attrs  ->
          fun def  ->
            let lid = (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
            let def1 =
              let uu____362 =
                let uu____363 = FStar_Syntax_Subst.compress def in
                FStar_All.pipe_right uu____363 FStar_Syntax_Util.unmeta in
              FStar_All.pipe_right uu____362 FStar_Syntax_Util.un_uinst in
            let def2 =
              match def1.FStar_Syntax_Syntax.n with
              | FStar_Syntax_Syntax.Tm_abs uu____365 ->
                  FStar_Extraction_ML_Term.normalize_abs def1
              | uu____382 -> def1 in
            let uu____383 =
              match def2.FStar_Syntax_Syntax.n with
              | FStar_Syntax_Syntax.Tm_abs (bs,body,uu____394) ->
                  FStar_Syntax_Subst.open_term bs body
              | uu____415 -> ([], def2) in
            match uu____383 with
            | (bs,body) ->
                let assumed =
                  FStar_Util.for_some
                    (fun uu___296_436  ->
                       match uu___296_436 with
                       | FStar_Syntax_Syntax.Assumption  -> true
                       | uu____437 -> false) quals in
                let uu____438 = binders_as_mlty_binders env bs in
                (match uu____438 with
                 | (env1,ml_bs) ->
                     let body1 =
                       let uu____458 =
                         FStar_Extraction_ML_Term.term_as_mlty env1 body in
                       FStar_All.pipe_right uu____458
                         (FStar_Extraction_ML_Util.eraseTypeDeep
                            (FStar_Extraction_ML_Util.udelta_unfold env1)) in
                     let mangled_projector =
                       let uu____462 =
                         FStar_All.pipe_right quals
                           (FStar_Util.for_some
                              (fun uu___297_467  ->
                                 match uu___297_467 with
                                 | FStar_Syntax_Syntax.Projector uu____468 ->
                                     true
                                 | uu____473 -> false)) in
                       if uu____462
                       then
                         let mname = mangle_projector_lid lid in
                         FStar_Pervasives_Native.Some
                           ((mname.FStar_Ident.ident).FStar_Ident.idText)
                       else FStar_Pervasives_Native.None in
                     let metadata = extract_metadata attrs in
                     let td =
                       let uu____504 =
                         let uu____525 = lident_as_mlsymbol lid in
                         (assumed, uu____525, mangled_projector, ml_bs,
                           metadata,
                           (FStar_Pervasives_Native.Some
                              (FStar_Extraction_ML_Syntax.MLTD_Abbrev body1))) in
                       [uu____504] in
                     let def3 =
                       let uu____577 =
                         let uu____578 =
                           FStar_Extraction_ML_Util.mlloc_of_range
                             (FStar_Ident.range_of_lid lid) in
                         FStar_Extraction_ML_Syntax.MLM_Loc uu____578 in
                       [uu____577; FStar_Extraction_ML_Syntax.MLM_Ty td] in
                     let env2 =
                       let uu____580 =
                         FStar_All.pipe_right quals
                           (FStar_Util.for_some
                              (fun uu___298_584  ->
                                 match uu___298_584 with
                                 | FStar_Syntax_Syntax.Assumption  -> true
                                 | FStar_Syntax_Syntax.New  -> true
                                 | uu____585 -> false)) in
                       if uu____580
                       then FStar_Extraction_ML_UEnv.extend_type_name env1 fv
                       else FStar_Extraction_ML_UEnv.extend_tydef env1 fv td in
                     (env2, def3))
type data_constructor =
  {
  dname: FStar_Ident.lident;
  dtyp: FStar_Syntax_Syntax.typ;}[@@deriving show]
let __proj__Mkdata_constructor__item__dname:
  data_constructor -> FStar_Ident.lident =
  fun projectee  ->
    match projectee with
    | { dname = __fname__dname; dtyp = __fname__dtyp;_} -> __fname__dname
let __proj__Mkdata_constructor__item__dtyp:
  data_constructor -> FStar_Syntax_Syntax.typ =
  fun projectee  ->
    match projectee with
    | { dname = __fname__dname; dtyp = __fname__dtyp;_} -> __fname__dtyp
type inductive_family =
  {
  iname: FStar_Ident.lident;
  iparams: FStar_Syntax_Syntax.binders;
  ityp: FStar_Syntax_Syntax.term;
  idatas: data_constructor Prims.list;
  iquals: FStar_Syntax_Syntax.qualifier Prims.list;
  imetadata: FStar_Extraction_ML_Syntax.metadata;}[@@deriving show]
let __proj__Mkinductive_family__item__iname:
  inductive_family -> FStar_Ident.lident =
  fun projectee  ->
    match projectee with
    | { iname = __fname__iname; iparams = __fname__iparams;
        ityp = __fname__ityp; idatas = __fname__idatas;
        iquals = __fname__iquals; imetadata = __fname__imetadata;_} ->
        __fname__iname
let __proj__Mkinductive_family__item__iparams:
  inductive_family -> FStar_Syntax_Syntax.binders =
  fun projectee  ->
    match projectee with
    | { iname = __fname__iname; iparams = __fname__iparams;
        ityp = __fname__ityp; idatas = __fname__idatas;
        iquals = __fname__iquals; imetadata = __fname__imetadata;_} ->
        __fname__iparams
let __proj__Mkinductive_family__item__ityp:
  inductive_family -> FStar_Syntax_Syntax.term =
  fun projectee  ->
    match projectee with
    | { iname = __fname__iname; iparams = __fname__iparams;
        ityp = __fname__ityp; idatas = __fname__idatas;
        iquals = __fname__iquals; imetadata = __fname__imetadata;_} ->
        __fname__ityp
let __proj__Mkinductive_family__item__idatas:
  inductive_family -> data_constructor Prims.list =
  fun projectee  ->
    match projectee with
    | { iname = __fname__iname; iparams = __fname__iparams;
        ityp = __fname__ityp; idatas = __fname__idatas;
        iquals = __fname__iquals; imetadata = __fname__imetadata;_} ->
        __fname__idatas
let __proj__Mkinductive_family__item__iquals:
  inductive_family -> FStar_Syntax_Syntax.qualifier Prims.list =
  fun projectee  ->
    match projectee with
    | { iname = __fname__iname; iparams = __fname__iparams;
        ityp = __fname__ityp; idatas = __fname__idatas;
        iquals = __fname__iquals; imetadata = __fname__imetadata;_} ->
        __fname__iquals
let __proj__Mkinductive_family__item__imetadata:
  inductive_family -> FStar_Extraction_ML_Syntax.metadata =
  fun projectee  ->
    match projectee with
    | { iname = __fname__iname; iparams = __fname__iparams;
        ityp = __fname__ityp; idatas = __fname__idatas;
        iquals = __fname__iquals; imetadata = __fname__imetadata;_} ->
        __fname__imetadata
let print_ifamily: inductive_family -> Prims.unit =
  fun i  ->
    let uu____724 = FStar_Syntax_Print.lid_to_string i.iname in
    let uu____725 = FStar_Syntax_Print.binders_to_string " " i.iparams in
    let uu____726 = FStar_Syntax_Print.term_to_string i.ityp in
    let uu____727 =
      let uu____728 =
        FStar_All.pipe_right i.idatas
          (FStar_List.map
             (fun d  ->
                let uu____739 = FStar_Syntax_Print.lid_to_string d.dname in
                let uu____740 =
                  let uu____741 = FStar_Syntax_Print.term_to_string d.dtyp in
                  Prims.strcat " : " uu____741 in
                Prims.strcat uu____739 uu____740)) in
      FStar_All.pipe_right uu____728 (FStar_String.concat "\n\t\t") in
    FStar_Util.print4 "\n\t%s %s : %s { %s }\n" uu____724 uu____725 uu____726
      uu____727
let bundle_as_inductive_families:
  'Auu____749 .
    FStar_Extraction_ML_UEnv.env ->
      FStar_Syntax_Syntax.sigelt Prims.list ->
        'Auu____749 ->
          FStar_Syntax_Syntax.attribute Prims.list ->
            (FStar_Extraction_ML_UEnv.env,inductive_family Prims.list)
              FStar_Pervasives_Native.tuple2
  =
  fun env  ->
    fun ses  ->
      fun quals  ->
        fun attrs  ->
          let uu____780 =
            FStar_Util.fold_map
              (fun env1  ->
                 fun se  ->
                   match se.FStar_Syntax_Syntax.sigel with
                   | FStar_Syntax_Syntax.Sig_inductive_typ
                       (l,_us,bs,t,_mut_i,datas) ->
                       let uu____827 = FStar_Syntax_Subst.open_term bs t in
                       (match uu____827 with
                        | (bs1,t1) ->
                            let datas1 =
                              FStar_All.pipe_right ses
                                (FStar_List.collect
                                   (fun se1  ->
                                      match se1.FStar_Syntax_Syntax.sigel
                                      with
                                      | FStar_Syntax_Syntax.Sig_datacon
                                          (d,uu____866,t2,l',nparams,uu____870)
                                          when FStar_Ident.lid_equals l l' ->
                                          let uu____875 =
                                            FStar_Syntax_Util.arrow_formals
                                              t2 in
                                          (match uu____875 with
                                           | (bs',body) ->
                                               let uu____908 =
                                                 FStar_Util.first_N
                                                   (FStar_List.length bs1)
                                                   bs' in
                                               (match uu____908 with
                                                | (bs_params,rest) ->
                                                    let subst1 =
                                                      FStar_List.map2
                                                        (fun uu____979  ->
                                                           fun uu____980  ->
                                                             match (uu____979,
                                                                    uu____980)
                                                             with
                                                             | ((b',uu____998),
                                                                (b,uu____1000))
                                                                 ->
                                                                 let uu____1009
                                                                   =
                                                                   let uu____1016
                                                                    =
                                                                    FStar_Syntax_Syntax.bv_to_name
                                                                    b in
                                                                   (b',
                                                                    uu____1016) in
                                                                 FStar_Syntax_Syntax.NT
                                                                   uu____1009)
                                                        bs_params bs1 in
                                                    let t3 =
                                                      let uu____1018 =
                                                        let uu____1021 =
                                                          FStar_Syntax_Syntax.mk_Total
                                                            body in
                                                        FStar_Syntax_Util.arrow
                                                          rest uu____1021 in
                                                      FStar_All.pipe_right
                                                        uu____1018
                                                        (FStar_Syntax_Subst.subst
                                                           subst1) in
                                                    [{ dname = d; dtyp = t3 }]))
                                      | uu____1026 -> [])) in
                            let metadata =
                              extract_metadata
                                (FStar_List.append
                                   se.FStar_Syntax_Syntax.sigattrs attrs) in
                            let env2 =
                              let uu____1031 =
                                FStar_Syntax_Syntax.lid_as_fv l
                                  FStar_Syntax_Syntax.Delta_constant
                                  FStar_Pervasives_Native.None in
                              FStar_Extraction_ML_UEnv.extend_type_name env1
                                uu____1031 in
                            (env2,
                              [{
                                 iname = l;
                                 iparams = bs1;
                                 ityp = t1;
                                 idatas = datas1;
                                 iquals = (se.FStar_Syntax_Syntax.sigquals);
                                 imetadata = metadata
                               }]))
                   | uu____1034 -> (env1, [])) env ses in
          match uu____780 with
          | (env1,ifams) -> (env1, (FStar_List.flatten ifams))
type env_t = FStar_Extraction_ML_UEnv.env[@@deriving show]
let extract_bundle:
  env_t ->
    FStar_Syntax_Syntax.sigelt ->
      (env_t,FStar_Extraction_ML_Syntax.mlmodule1 Prims.list)
        FStar_Pervasives_Native.tuple2
  =
  fun env  ->
    fun se  ->
      let extract_ctor ml_tyvars env1 ctor =
        let mlt =
          let uu____1110 =
            FStar_Extraction_ML_Term.term_as_mlty env1 ctor.dtyp in
          FStar_Extraction_ML_Util.eraseTypeDeep
            (FStar_Extraction_ML_Util.udelta_unfold env1) uu____1110 in
        let steps =
          [FStar_TypeChecker_Normalize.Inlining;
          FStar_TypeChecker_Normalize.UnfoldUntil
            FStar_Syntax_Syntax.Delta_constant;
          FStar_TypeChecker_Normalize.EraseUniverses;
          FStar_TypeChecker_Normalize.AllowUnboundUniverses] in
        let names1 =
          let uu____1117 =
            let uu____1118 =
              let uu____1121 =
                FStar_TypeChecker_Normalize.normalize steps
                  env1.FStar_Extraction_ML_UEnv.tcenv ctor.dtyp in
              FStar_Syntax_Subst.compress uu____1121 in
            uu____1118.FStar_Syntax_Syntax.n in
          match uu____1117 with
          | FStar_Syntax_Syntax.Tm_arrow (bs,uu____1125) ->
              FStar_List.map
                (fun uu____1151  ->
                   match uu____1151 with
                   | ({ FStar_Syntax_Syntax.ppname = ppname;
                        FStar_Syntax_Syntax.index = uu____1157;
                        FStar_Syntax_Syntax.sort = uu____1158;_},uu____1159)
                       -> ppname.FStar_Ident.idText) bs
          | uu____1162 -> [] in
        let tys = (ml_tyvars, mlt) in
        let fvv = FStar_Extraction_ML_UEnv.mkFvvar ctor.dname ctor.dtyp in
        let uu____1173 =
          let uu____1174 =
            FStar_Extraction_ML_UEnv.extend_fv env1 fvv tys false false in
          FStar_Pervasives_Native.fst uu____1174 in
        let uu____1179 =
          let uu____1190 = lident_as_mlsymbol ctor.dname in
          let uu____1191 =
            let uu____1198 = FStar_Extraction_ML_Util.argTypes mlt in
            FStar_List.zip names1 uu____1198 in
          (uu____1190, uu____1191) in
        (uu____1173, uu____1179) in
      let extract_one_family env1 ind =
        let uu____1246 = binders_as_mlty_binders env1 ind.iparams in
        match uu____1246 with
        | (env2,vars) ->
            let uu____1281 =
              FStar_All.pipe_right ind.idatas
                (FStar_Util.fold_map (extract_ctor vars) env2) in
            (match uu____1281 with
             | (env3,ctors) ->
                 let uu____1374 = FStar_Syntax_Util.arrow_formals ind.ityp in
                 (match uu____1374 with
                  | (indices,uu____1410) ->
                      let ml_params =
                        let uu____1430 =
                          FStar_All.pipe_right indices
                            (FStar_List.mapi
                               (fun i  ->
                                  fun uu____1449  ->
                                    let uu____1454 =
                                      FStar_Util.string_of_int i in
                                    Prims.strcat "'dummyV" uu____1454)) in
                        FStar_List.append vars uu____1430 in
                      let tbody =
                        let uu____1456 =
                          FStar_Util.find_opt
                            (fun uu___299_1461  ->
                               match uu___299_1461 with
                               | FStar_Syntax_Syntax.RecordType uu____1462 ->
                                   true
                               | uu____1471 -> false) ind.iquals in
                        match uu____1456 with
                        | FStar_Pervasives_Native.Some
                            (FStar_Syntax_Syntax.RecordType (ns,ids)) ->
                            let uu____1482 = FStar_List.hd ctors in
                            (match uu____1482 with
                             | (uu____1503,c_ty) ->
                                 let fields =
                                   FStar_List.map2
                                     (fun id1  ->
                                        fun uu____1542  ->
                                          match uu____1542 with
                                          | (uu____1551,ty) ->
                                              let lid =
                                                FStar_Ident.lid_of_ids
                                                  (FStar_List.append ns [id1]) in
                                              let uu____1554 =
                                                lident_as_mlsymbol lid in
                                              (uu____1554, ty)) ids c_ty in
                                 FStar_Extraction_ML_Syntax.MLTD_Record
                                   fields)
                        | uu____1555 ->
                            FStar_Extraction_ML_Syntax.MLTD_DType ctors in
                      let uu____1558 =
                        let uu____1577 = lident_as_mlsymbol ind.iname in
                        (false, uu____1577, FStar_Pervasives_Native.None,
                          ml_params, (ind.imetadata),
                          (FStar_Pervasives_Native.Some tbody)) in
                      (env3, uu____1558))) in
      match ((se.FStar_Syntax_Syntax.sigel),
              (se.FStar_Syntax_Syntax.sigquals))
      with
      | (FStar_Syntax_Syntax.Sig_bundle
         ({
            FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_datacon
              (l,uu____1611,t,uu____1613,uu____1614,uu____1615);
            FStar_Syntax_Syntax.sigrng = uu____1616;
            FStar_Syntax_Syntax.sigquals = uu____1617;
            FStar_Syntax_Syntax.sigmeta = uu____1618;
            FStar_Syntax_Syntax.sigattrs = uu____1619;_}::[],uu____1620),(FStar_Syntax_Syntax.ExceptionConstructor
         )::[]) ->
          let uu____1637 = extract_ctor [] env { dname = l; dtyp = t } in
          (match uu____1637 with
           | (env1,ctor) -> (env1, [FStar_Extraction_ML_Syntax.MLM_Exn ctor]))
      | (FStar_Syntax_Syntax.Sig_bundle (ses,uu____1683),quals) ->
          let uu____1697 =
            bundle_as_inductive_families env ses quals
              se.FStar_Syntax_Syntax.sigattrs in
          (match uu____1697 with
           | (env1,ifams) ->
               let uu____1718 =
                 FStar_Util.fold_map extract_one_family env1 ifams in
               (match uu____1718 with
                | (env2,td) -> (env2, [FStar_Extraction_ML_Syntax.MLM_Ty td])))
      | uu____1811 -> failwith "Unexpected signature element"
let rec extract_sig:
  env_t ->
    FStar_Syntax_Syntax.sigelt ->
      (env_t,FStar_Extraction_ML_Syntax.mlmodule1 Prims.list)
        FStar_Pervasives_Native.tuple2
  =
  fun g  ->
    fun se  ->
      FStar_Extraction_ML_UEnv.debug g
        (fun u  ->
           let uu____1846 = FStar_Syntax_Print.sigelt_to_string se in
           FStar_Util.print1 ">>>> extract_sig %s \n" uu____1846);
      (match se.FStar_Syntax_Syntax.sigel with
       | FStar_Syntax_Syntax.Sig_bundle uu____1853 -> extract_bundle g se
       | FStar_Syntax_Syntax.Sig_inductive_typ uu____1862 ->
           extract_bundle g se
       | FStar_Syntax_Syntax.Sig_datacon uu____1879 -> extract_bundle g se
       | FStar_Syntax_Syntax.Sig_new_effect ed when
           FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
             (FStar_List.contains FStar_Syntax_Syntax.Reifiable)
           ->
           let extend_env g1 lid ml_name tm tysc =
             let uu____1917 =
               let uu____1922 =
                 FStar_Syntax_Syntax.lid_as_fv lid
                   FStar_Syntax_Syntax.Delta_equational
                   FStar_Pervasives_Native.None in
               FStar_Extraction_ML_UEnv.extend_fv' g1 uu____1922 ml_name tysc
                 false false in
             match uu____1917 with
             | (g2,mangled_name) ->
                 ((let uu____1930 =
                     FStar_All.pipe_left
                       (FStar_TypeChecker_Env.debug
                          g2.FStar_Extraction_ML_UEnv.tcenv)
                       (FStar_Options.Other "ExtractionReify") in
                   if uu____1930
                   then FStar_Util.print1 "Mangled name: %s\n" mangled_name
                   else ());
                  (let lb =
                     {
                       FStar_Extraction_ML_Syntax.mllb_name = mangled_name;
                       FStar_Extraction_ML_Syntax.mllb_tysc =
                         FStar_Pervasives_Native.None;
                       FStar_Extraction_ML_Syntax.mllb_add_unit = false;
                       FStar_Extraction_ML_Syntax.mllb_def = tm;
                       FStar_Extraction_ML_Syntax.print_typ = false
                     } in
                   (g2,
                     (FStar_Extraction_ML_Syntax.MLM_Let
                        (FStar_Extraction_ML_Syntax.NonRec, [], [lb]))))) in
           let rec extract_fv tm =
             (let uu____1946 =
                FStar_All.pipe_left
                  (FStar_TypeChecker_Env.debug
                     g.FStar_Extraction_ML_UEnv.tcenv)
                  (FStar_Options.Other "ExtractionReify") in
              if uu____1946
              then
                let uu____1947 = FStar_Syntax_Print.term_to_string tm in
                FStar_Util.print1 "extract_fv term: %s\n" uu____1947
              else ());
             (let uu____1949 =
                let uu____1950 = FStar_Syntax_Subst.compress tm in
                uu____1950.FStar_Syntax_Syntax.n in
              match uu____1949 with
              | FStar_Syntax_Syntax.Tm_uinst (tm1,uu____1958) ->
                  extract_fv tm1
              | FStar_Syntax_Syntax.Tm_fvar fv ->
                  let mlp =
                    FStar_Extraction_ML_Syntax.mlpath_of_lident
                      (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
                  let uu____1965 =
                    let uu____1974 = FStar_Extraction_ML_UEnv.lookup_fv g fv in
                    FStar_All.pipe_left FStar_Util.right uu____1974 in
                  (match uu____1965 with
                   | (uu____2031,uu____2032,tysc,uu____2034) ->
                       let uu____2035 =
                         FStar_All.pipe_left
                           (FStar_Extraction_ML_Syntax.with_ty
                              FStar_Extraction_ML_Syntax.MLTY_Top)
                           (FStar_Extraction_ML_Syntax.MLE_Name mlp) in
                       (uu____2035, tysc))
              | uu____2036 -> failwith "Not an fv") in
           let extract_action g1 a =
             (let uu____2062 =
                FStar_All.pipe_left
                  (FStar_TypeChecker_Env.debug
                     g1.FStar_Extraction_ML_UEnv.tcenv)
                  (FStar_Options.Other "ExtractionReify") in
              if uu____2062
              then
                let uu____2063 =
                  FStar_Syntax_Print.term_to_string
                    a.FStar_Syntax_Syntax.action_typ in
                let uu____2064 =
                  FStar_Syntax_Print.term_to_string
                    a.FStar_Syntax_Syntax.action_defn in
                FStar_Util.print2 "Action type %s and term %s\n" uu____2063
                  uu____2064
              else ());
             (let uu____2066 = FStar_Extraction_ML_UEnv.action_name ed a in
              match uu____2066 with
              | (a_nm,a_lid) ->
                  let lbname =
                    let uu____2082 =
                      FStar_Syntax_Syntax.new_bv
                        (FStar_Pervasives_Native.Some
                           ((a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos))
                        FStar_Syntax_Syntax.tun in
                    FStar_Util.Inl uu____2082 in
                  let lb =
                    FStar_Syntax_Syntax.mk_lb
                      (lbname, (a.FStar_Syntax_Syntax.action_univs),
                        FStar_Parser_Const.effect_Tot_lid,
                        (a.FStar_Syntax_Syntax.action_typ),
                        (a.FStar_Syntax_Syntax.action_defn)) in
                  let lbs = (false, [lb]) in
                  let action_lb =
                    FStar_Syntax_Syntax.mk
                      (FStar_Syntax_Syntax.Tm_let
                         (lbs, FStar_Syntax_Util.exp_false_bool))
                      FStar_Pervasives_Native.None
                      (a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos in
                  let uu____2108 =
                    FStar_Extraction_ML_Term.term_as_mlexpr g1 action_lb in
                  (match uu____2108 with
                   | (a_let,uu____2120,ty) ->
                       ((let uu____2123 =
                           FStar_All.pipe_left
                             (FStar_TypeChecker_Env.debug
                                g1.FStar_Extraction_ML_UEnv.tcenv)
                             (FStar_Options.Other "ExtractionReify") in
                         if uu____2123
                         then
                           let uu____2124 =
                             FStar_Extraction_ML_Code.string_of_mlexpr a_nm
                               a_let in
                           FStar_Util.print1 "Extracted action term: %s\n"
                             uu____2124
                         else ());
                        (let uu____2126 =
                           match a_let.FStar_Extraction_ML_Syntax.expr with
                           | FStar_Extraction_ML_Syntax.MLE_Let
                               ((uu____2135,uu____2136,mllb::[]),uu____2138)
                               ->
                               (match mllb.FStar_Extraction_ML_Syntax.mllb_tysc
                                with
                                | FStar_Pervasives_Native.Some tysc ->
                                    ((mllb.FStar_Extraction_ML_Syntax.mllb_def),
                                      tysc)
                                | FStar_Pervasives_Native.None  ->
                                    failwith "No type scheme")
                           | uu____2158 -> failwith "Impossible" in
                         match uu____2126 with
                         | (exp,tysc) ->
                             ((let uu____2170 =
                                 FStar_All.pipe_left
                                   (FStar_TypeChecker_Env.debug
                                      g1.FStar_Extraction_ML_UEnv.tcenv)
                                   (FStar_Options.Other "ExtractionReify") in
                               if uu____2170
                               then
                                 ((let uu____2172 =
                                     FStar_Extraction_ML_Code.string_of_mlty
                                       a_nm
                                       (FStar_Pervasives_Native.snd tysc) in
                                   FStar_Util.print1
                                     "Extracted action type: %s\n" uu____2172);
                                  FStar_List.iter
                                    (fun x  ->
                                       FStar_Util.print1 "and binders: %s\n"
                                         x)
                                    (FStar_Pervasives_Native.fst tysc))
                               else ());
                              extend_env g1 a_lid a_nm exp tysc))))) in
           let uu____2176 =
             let uu____2181 =
               extract_fv
                 (FStar_Pervasives_Native.snd
                    ed.FStar_Syntax_Syntax.return_repr) in
             match uu____2181 with
             | (return_tm,ty_sc) ->
                 let uu____2194 =
                   FStar_Extraction_ML_UEnv.monad_op_name ed "return" in
                 (match uu____2194 with
                  | (return_nm,return_lid) ->
                      extend_env g return_lid return_nm return_tm ty_sc) in
           (match uu____2176 with
            | (g1,return_decl) ->
                let uu____2213 =
                  let uu____2218 =
                    extract_fv
                      (FStar_Pervasives_Native.snd
                         ed.FStar_Syntax_Syntax.bind_repr) in
                  match uu____2218 with
                  | (bind_tm,ty_sc) ->
                      let uu____2231 =
                        FStar_Extraction_ML_UEnv.monad_op_name ed "bind" in
                      (match uu____2231 with
                       | (bind_nm,bind_lid) ->
                           extend_env g1 bind_lid bind_nm bind_tm ty_sc) in
                (match uu____2213 with
                 | (g2,bind_decl) ->
                     let uu____2250 =
                       FStar_Util.fold_map extract_action g2
                         ed.FStar_Syntax_Syntax.actions in
                     (match uu____2250 with
                      | (g3,actions) ->
                          (g3,
                            (FStar_List.append [return_decl; bind_decl]
                               actions)))))
       | FStar_Syntax_Syntax.Sig_new_effect uu____2271 -> (g, [])
       | FStar_Syntax_Syntax.Sig_declare_typ (lid,uu____2275,t) when
           FStar_Extraction_ML_Term.is_arity g t ->
           let quals = se.FStar_Syntax_Syntax.sigquals in
           let attrs = se.FStar_Syntax_Syntax.sigattrs in
           let uu____2283 =
             let uu____2284 =
               FStar_All.pipe_right quals
                 (FStar_Util.for_some
                    (fun uu___300_2288  ->
                       match uu___300_2288 with
                       | FStar_Syntax_Syntax.Assumption  -> true
                       | uu____2289 -> false)) in
             Prims.op_Negation uu____2284 in
           if uu____2283
           then (g, [])
           else
             (let uu____2299 = FStar_Syntax_Util.arrow_formals t in
              match uu____2299 with
              | (bs,uu____2319) ->
                  let fv =
                    FStar_Syntax_Syntax.lid_as_fv lid
                      FStar_Syntax_Syntax.Delta_constant
                      FStar_Pervasives_Native.None in
                  let uu____2337 =
                    FStar_Syntax_Util.abs bs FStar_Syntax_Syntax.t_unit
                      FStar_Pervasives_Native.None in
                  extract_typ_abbrev g fv quals attrs uu____2337)
       | FStar_Syntax_Syntax.Sig_let ((false ,lb::[]),uu____2339) when
           FStar_Extraction_ML_Term.is_arity g lb.FStar_Syntax_Syntax.lbtyp
           ->
           let quals = se.FStar_Syntax_Syntax.sigquals in
           let uu____2355 =
             let uu____2364 =
               FStar_TypeChecker_Env.open_universes_in
                 g.FStar_Extraction_ML_UEnv.tcenv
                 lb.FStar_Syntax_Syntax.lbunivs
                 [lb.FStar_Syntax_Syntax.lbdef; lb.FStar_Syntax_Syntax.lbtyp] in
             match uu____2364 with
             | (tcenv,uu____2388,def_typ) ->
                 let uu____2394 = as_pair def_typ in (tcenv, uu____2394) in
           (match uu____2355 with
            | (tcenv,(lbdef,lbtyp)) ->
                let lbtyp1 =
                  FStar_TypeChecker_Normalize.normalize
                    [FStar_TypeChecker_Normalize.Beta;
                    FStar_TypeChecker_Normalize.UnfoldUntil
                      FStar_Syntax_Syntax.Delta_constant] tcenv lbtyp in
                let lbdef1 =
                  FStar_TypeChecker_Normalize.eta_expand_with_type tcenv
                    lbdef lbtyp1 in
                let uu____2418 =
                  FStar_Util.right lb.FStar_Syntax_Syntax.lbname in
                extract_typ_abbrev g uu____2418 quals
                  se.FStar_Syntax_Syntax.sigattrs lbdef1)
       | FStar_Syntax_Syntax.Sig_let (lbs,uu____2420) ->
           let attrs = se.FStar_Syntax_Syntax.sigattrs in
           let quals = se.FStar_Syntax_Syntax.sigquals in
           let elet =
             FStar_Syntax_Syntax.mk
               (FStar_Syntax_Syntax.Tm_let
                  (lbs, FStar_Syntax_Util.exp_false_bool))
               FStar_Pervasives_Native.None se.FStar_Syntax_Syntax.sigrng in
           let tactic_registration_decl =
             let mk_registration tac_lid assm_lid t bs =
               let h =
                 let uu____2467 =
                   let uu____2468 =
                     let uu____2469 =
                       FStar_Ident.lid_of_str
                         "FStar_Tactics_Native.register_tactic" in
                     FStar_Extraction_ML_Syntax.mlpath_of_lident uu____2469 in
                   FStar_Extraction_ML_Syntax.MLE_Name uu____2468 in
                 FStar_All.pipe_left
                   (FStar_Extraction_ML_Syntax.with_ty
                      FStar_Extraction_ML_Syntax.MLTY_Top) uu____2467 in
               let lid_arg =
                 let uu____2471 =
                   let uu____2472 = FStar_Ident.string_of_lid assm_lid in
                   FStar_Extraction_ML_Syntax.MLC_String uu____2472 in
                 FStar_Extraction_ML_Syntax.MLE_Const uu____2471 in
               let tac_arity = FStar_List.length bs in
               let arity =
                 let uu____2479 =
                   let uu____2480 =
                     let uu____2481 =
                       FStar_Util.string_of_int
                         (tac_arity + (Prims.parse_int "1")) in
                     FStar_Ident.lid_of_str uu____2481 in
                   FStar_Extraction_ML_Syntax.mlpath_of_lident uu____2480 in
                 FStar_Extraction_ML_Syntax.MLE_Name uu____2479 in
               let uu____2488 =
                 FStar_Extraction_ML_Util.mk_interpretation_fun tac_lid
                   lid_arg t bs in
               match uu____2488 with
               | FStar_Pervasives_Native.Some tac_interpretation ->
                   let app =
                     let uu____2495 =
                       let uu____2496 =
                         let uu____2503 =
                           FStar_List.map
                             (FStar_Extraction_ML_Syntax.with_ty
                                FStar_Extraction_ML_Syntax.MLTY_Top)
                             [lid_arg; arity; tac_interpretation] in
                         (h, uu____2503) in
                       FStar_Extraction_ML_Syntax.MLE_App uu____2496 in
                     FStar_All.pipe_left
                       (FStar_Extraction_ML_Syntax.with_ty
                          FStar_Extraction_ML_Syntax.MLTY_Top) uu____2495 in
                   [FStar_Extraction_ML_Syntax.MLM_Top app]
               | FStar_Pervasives_Native.None  -> [] in
             let uu____2508 =
               let uu____2509 = FStar_Options.codegen () in
               uu____2509 = (FStar_Pervasives_Native.Some "tactics") in
             if uu____2508
             then
               match FStar_Pervasives_Native.snd lbs with
               | hd1::[] ->
                   let uu____2521 =
                     FStar_Syntax_Util.arrow_formals_comp
                       hd1.FStar_Syntax_Syntax.lbtyp in
                   (match uu____2521 with
                    | (bs,comp) ->
                        let t = FStar_Syntax_Util.comp_result comp in
                        let uu____2551 =
                          let uu____2552 = FStar_Syntax_Subst.compress t in
                          uu____2552.FStar_Syntax_Syntax.n in
                        (match uu____2551 with
                         | FStar_Syntax_Syntax.Tm_app (h,args) ->
                             let tac_lid =
                               let uu____2580 =
                                 let uu____2583 =
                                   FStar_Util.right
                                     hd1.FStar_Syntax_Syntax.lbname in
                                 uu____2583.FStar_Syntax_Syntax.fv_name in
                               uu____2580.FStar_Syntax_Syntax.v in
                             let assm_lid =
                               let uu____2585 =
                                 FStar_All.pipe_left FStar_Ident.id_of_text
                                   (Prims.strcat "__"
                                      (tac_lid.FStar_Ident.ident).FStar_Ident.idText) in
                               FStar_Ident.lid_of_ns_and_id
                                 tac_lid.FStar_Ident.ns uu____2585 in
                             let uu____2586 =
                               let uu____2587 = FStar_Syntax_Subst.compress h in
                               is_tactic_decl assm_lid uu____2587
                                 g.FStar_Extraction_ML_UEnv.currentModule in
                             if uu____2586
                             then
                               let uu____2590 =
                                 let uu____2591 = FStar_List.hd args in
                                 FStar_Pervasives_Native.fst uu____2591 in
                               mk_registration tac_lid assm_lid uu____2590 bs
                             else []
                         | uu____2607 -> []))
               | uu____2608 -> []
             else [] in
           let uu____2612 = FStar_Extraction_ML_Term.term_as_mlexpr g elet in
           (match uu____2612 with
            | (ml_let,uu____2626,uu____2627) ->
                (match ml_let.FStar_Extraction_ML_Syntax.expr with
                 | FStar_Extraction_ML_Syntax.MLE_Let
                     ((flavor,uu____2635,bindings),uu____2637) ->
                     let uu____2650 =
                       FStar_List.fold_left2
                         (fun uu____2677  ->
                            fun ml_lb  ->
                              fun uu____2679  ->
                                match (uu____2677, uu____2679) with
                                | ((env,ml_lbs),{
                                                  FStar_Syntax_Syntax.lbname
                                                    = lbname;
                                                  FStar_Syntax_Syntax.lbunivs
                                                    = uu____2701;
                                                  FStar_Syntax_Syntax.lbtyp =
                                                    t;
                                                  FStar_Syntax_Syntax.lbeff =
                                                    uu____2703;
                                                  FStar_Syntax_Syntax.lbdef =
                                                    uu____2704;_})
                                    ->
                                    let lb_lid =
                                      let uu____2726 =
                                        let uu____2729 =
                                          FStar_Util.right lbname in
                                        uu____2729.FStar_Syntax_Syntax.fv_name in
                                      uu____2726.FStar_Syntax_Syntax.v in
                                    let uu____2730 =
                                      let uu____2735 =
                                        FStar_All.pipe_right quals
                                          (FStar_Util.for_some
                                             (fun uu___301_2740  ->
                                                match uu___301_2740 with
                                                | FStar_Syntax_Syntax.Projector
                                                    uu____2741 -> true
                                                | uu____2746 -> false)) in
                                      if uu____2735
                                      then
                                        let mname =
                                          let uu____2752 =
                                            mangle_projector_lid lb_lid in
                                          FStar_All.pipe_right uu____2752
                                            FStar_Extraction_ML_Syntax.mlpath_of_lident in
                                        let uu____2753 =
                                          let uu____2758 =
                                            FStar_Util.right lbname in
                                          let uu____2759 =
                                            FStar_Util.must
                                              ml_lb.FStar_Extraction_ML_Syntax.mllb_tysc in
                                          FStar_Extraction_ML_UEnv.extend_fv'
                                            env uu____2758 mname uu____2759
                                            ml_lb.FStar_Extraction_ML_Syntax.mllb_add_unit
                                            false in
                                        match uu____2753 with
                                        | (env1,uu____2765) ->
                                            (env1,
                                              (let uu___305_2767 = ml_lb in
                                               {
                                                 FStar_Extraction_ML_Syntax.mllb_name
                                                   =
                                                   (FStar_Pervasives_Native.snd
                                                      mname);
                                                 FStar_Extraction_ML_Syntax.mllb_tysc
                                                   =
                                                   (uu___305_2767.FStar_Extraction_ML_Syntax.mllb_tysc);
                                                 FStar_Extraction_ML_Syntax.mllb_add_unit
                                                   =
                                                   (uu___305_2767.FStar_Extraction_ML_Syntax.mllb_add_unit);
                                                 FStar_Extraction_ML_Syntax.mllb_def
                                                   =
                                                   (uu___305_2767.FStar_Extraction_ML_Syntax.mllb_def);
                                                 FStar_Extraction_ML_Syntax.print_typ
                                                   =
                                                   (uu___305_2767.FStar_Extraction_ML_Syntax.print_typ)
                                               }))
                                      else
                                        (let uu____2771 =
                                           let uu____2772 =
                                             let uu____2777 =
                                               FStar_Util.must
                                                 ml_lb.FStar_Extraction_ML_Syntax.mllb_tysc in
                                             FStar_Extraction_ML_UEnv.extend_lb
                                               env lbname t uu____2777
                                               ml_lb.FStar_Extraction_ML_Syntax.mllb_add_unit
                                               false in
                                           FStar_All.pipe_left
                                             FStar_Pervasives_Native.fst
                                             uu____2772 in
                                         (uu____2771, ml_lb)) in
                                    (match uu____2730 with
                                     | (g1,ml_lb1) ->
                                         (g1, (ml_lb1 :: ml_lbs)))) (g, [])
                         bindings (FStar_Pervasives_Native.snd lbs) in
                     (match uu____2650 with
                      | (g1,ml_lbs') ->
                          let flags =
                            FStar_List.choose
                              (fun uu___302_2812  ->
                                 match uu___302_2812 with
                                 | FStar_Syntax_Syntax.Assumption  ->
                                     FStar_Pervasives_Native.Some
                                       FStar_Extraction_ML_Syntax.Assumed
                                 | FStar_Syntax_Syntax.Private  ->
                                     FStar_Pervasives_Native.Some
                                       FStar_Extraction_ML_Syntax.Private
                                 | FStar_Syntax_Syntax.NoExtract  ->
                                     FStar_Pervasives_Native.Some
                                       FStar_Extraction_ML_Syntax.NoExtract
                                 | uu____2815 -> FStar_Pervasives_Native.None)
                              quals in
                          let flags' = extract_metadata attrs in
                          let uu____2819 =
                            let uu____2822 =
                              let uu____2825 =
                                let uu____2826 =
                                  FStar_Extraction_ML_Util.mlloc_of_range
                                    se.FStar_Syntax_Syntax.sigrng in
                                FStar_Extraction_ML_Syntax.MLM_Loc uu____2826 in
                              [uu____2825;
                              FStar_Extraction_ML_Syntax.MLM_Let
                                (flavor, (FStar_List.append flags flags'),
                                  (FStar_List.rev ml_lbs'))] in
                            FStar_List.append uu____2822
                              tactic_registration_decl in
                          (g1, uu____2819))
                 | uu____2833 ->
                     let uu____2834 =
                       let uu____2835 =
                         FStar_Extraction_ML_Code.string_of_mlexpr
                           g.FStar_Extraction_ML_UEnv.currentModule ml_let in
                       FStar_Util.format1
                         "Impossible: Translated a let to a non-let: %s"
                         uu____2835 in
                     failwith uu____2834))
       | FStar_Syntax_Syntax.Sig_declare_typ (lid,uu____2843,t) ->
           let quals = se.FStar_Syntax_Syntax.sigquals in
           let uu____2848 =
             FStar_All.pipe_right quals
               (FStar_List.contains FStar_Syntax_Syntax.Assumption) in
           if uu____2848
           then
             let always_fail =
               let imp =
                 let uu____2859 = FStar_Syntax_Util.arrow_formals t in
                 match uu____2859 with
                 | ([],t1) ->
                     let b =
                       let uu____2888 =
                         FStar_Syntax_Syntax.gen_bv "_"
                           FStar_Pervasives_Native.None t1 in
                       FStar_All.pipe_left FStar_Syntax_Syntax.mk_binder
                         uu____2888 in
                     let uu____2889 = fail_exp lid t1 in
                     FStar_Syntax_Util.abs [b] uu____2889
                       FStar_Pervasives_Native.None
                 | (bs,t1) ->
                     let uu____2908 = fail_exp lid t1 in
                     FStar_Syntax_Util.abs bs uu____2908
                       FStar_Pervasives_Native.None in
               let uu___306_2909 = se in
               let uu____2910 =
                 let uu____2911 =
                   let uu____2918 =
                     let uu____2925 =
                       let uu____2928 =
                         let uu____2929 =
                           let uu____2934 =
                             FStar_Syntax_Syntax.lid_as_fv lid
                               FStar_Syntax_Syntax.Delta_constant
                               FStar_Pervasives_Native.None in
                           FStar_Util.Inr uu____2934 in
                         {
                           FStar_Syntax_Syntax.lbname = uu____2929;
                           FStar_Syntax_Syntax.lbunivs = [];
                           FStar_Syntax_Syntax.lbtyp = t;
                           FStar_Syntax_Syntax.lbeff =
                             FStar_Parser_Const.effect_ML_lid;
                           FStar_Syntax_Syntax.lbdef = imp
                         } in
                       [uu____2928] in
                     (false, uu____2925) in
                   (uu____2918, []) in
                 FStar_Syntax_Syntax.Sig_let uu____2911 in
               {
                 FStar_Syntax_Syntax.sigel = uu____2910;
                 FStar_Syntax_Syntax.sigrng =
                   (uu___306_2909.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___306_2909.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___306_2909.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___306_2909.FStar_Syntax_Syntax.sigattrs)
               } in
             let uu____2945 = extract_sig g always_fail in
             (match uu____2945 with
              | (g1,mlm) ->
                  let uu____2964 =
                    FStar_Util.find_map quals
                      (fun uu___303_2969  ->
                         match uu___303_2969 with
                         | FStar_Syntax_Syntax.Discriminator l ->
                             FStar_Pervasives_Native.Some l
                         | uu____2973 -> FStar_Pervasives_Native.None) in
                  (match uu____2964 with
                   | FStar_Pervasives_Native.Some l ->
                       let uu____2981 =
                         let uu____2984 =
                           let uu____2985 =
                             FStar_Extraction_ML_Util.mlloc_of_range
                               se.FStar_Syntax_Syntax.sigrng in
                           FStar_Extraction_ML_Syntax.MLM_Loc uu____2985 in
                         let uu____2986 =
                           let uu____2989 =
                             FStar_Extraction_ML_Term.ind_discriminator_body
                               g1 lid l in
                           [uu____2989] in
                         uu____2984 :: uu____2986 in
                       (g1, uu____2981)
                   | uu____2992 ->
                       let uu____2995 =
                         FStar_Util.find_map quals
                           (fun uu___304_3001  ->
                              match uu___304_3001 with
                              | FStar_Syntax_Syntax.Projector (l,uu____3005)
                                  -> FStar_Pervasives_Native.Some l
                              | uu____3006 -> FStar_Pervasives_Native.None) in
                       (match uu____2995 with
                        | FStar_Pervasives_Native.Some uu____3013 -> (g1, [])
                        | uu____3016 -> (g1, mlm))))
           else (g, [])
       | FStar_Syntax_Syntax.Sig_main e ->
           let uu____3025 = FStar_Extraction_ML_Term.term_as_mlexpr g e in
           (match uu____3025 with
            | (ml_main,uu____3039,uu____3040) ->
                let uu____3041 =
                  let uu____3044 =
                    let uu____3045 =
                      FStar_Extraction_ML_Util.mlloc_of_range
                        se.FStar_Syntax_Syntax.sigrng in
                    FStar_Extraction_ML_Syntax.MLM_Loc uu____3045 in
                  [uu____3044; FStar_Extraction_ML_Syntax.MLM_Top ml_main] in
                (g, uu____3041))
       | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____3048 ->
           failwith "impossible -- removed by tc.fs"
       | FStar_Syntax_Syntax.Sig_assume uu____3055 -> (g, [])
       | FStar_Syntax_Syntax.Sig_sub_effect uu____3064 -> (g, [])
       | FStar_Syntax_Syntax.Sig_effect_abbrev uu____3067 -> (g, [])
       | FStar_Syntax_Syntax.Sig_pragma p ->
           (if p = FStar_Syntax_Syntax.LightOff
            then FStar_Options.set_ml_ish ()
            else ();
            (g, [])))
let extract_iface:
  FStar_Extraction_ML_UEnv.env -> FStar_Syntax_Syntax.modul -> env_t =
  fun g  ->
    fun m  ->
      let uu____3093 =
        FStar_Util.fold_map extract_sig g m.FStar_Syntax_Syntax.declarations in
      FStar_All.pipe_right uu____3093 FStar_Pervasives_Native.fst
let extract':
  FStar_Extraction_ML_UEnv.env ->
    FStar_Syntax_Syntax.modul ->
      (FStar_Extraction_ML_UEnv.env,FStar_Extraction_ML_Syntax.mllib
                                      Prims.list)
        FStar_Pervasives_Native.tuple2
  =
  fun g  ->
    fun m  ->
      FStar_Syntax_Syntax.reset_gensym ();
      (let codegen_opt = FStar_Options.codegen () in
       let uu____3138 = FStar_Options.restore_cmd_line_options true in
       (match codegen_opt with
        | FStar_Pervasives_Native.Some "tactics" ->
            FStar_Options.set_option "codegen"
              (FStar_Options.String "tactics")
        | uu____3140 -> ());
       (let name =
          FStar_Extraction_ML_Syntax.mlpath_of_lident
            m.FStar_Syntax_Syntax.name in
        let g1 =
          let uu___307_3145 = g in
          let uu____3146 =
            FStar_TypeChecker_Env.set_current_module
              g.FStar_Extraction_ML_UEnv.tcenv m.FStar_Syntax_Syntax.name in
          {
            FStar_Extraction_ML_UEnv.tcenv = uu____3146;
            FStar_Extraction_ML_UEnv.gamma =
              (uu___307_3145.FStar_Extraction_ML_UEnv.gamma);
            FStar_Extraction_ML_UEnv.tydefs =
              (uu___307_3145.FStar_Extraction_ML_UEnv.tydefs);
            FStar_Extraction_ML_UEnv.type_names =
              (uu___307_3145.FStar_Extraction_ML_UEnv.type_names);
            FStar_Extraction_ML_UEnv.currentModule = name
          } in
        let uu____3147 =
          FStar_Util.fold_map extract_sig g1
            m.FStar_Syntax_Syntax.declarations in
        match uu____3147 with
        | (g2,sigs) ->
            let mlm = FStar_List.flatten sigs in
            let is_kremlin =
              let uu____3176 = FStar_Options.codegen () in
              match uu____3176 with
              | FStar_Pervasives_Native.Some "Kremlin" -> true
              | uu____3179 -> false in
            let uu____3182 =
              (((m.FStar_Syntax_Syntax.name).FStar_Ident.str <> "Prims") &&
                 (is_kremlin ||
                    (Prims.op_Negation m.FStar_Syntax_Syntax.is_interface)))
                &&
                (FStar_Options.should_extract
                   (m.FStar_Syntax_Syntax.name).FStar_Ident.str) in
            if uu____3182
            then
              ((let uu____3190 =
                  FStar_Syntax_Print.lid_to_string m.FStar_Syntax_Syntax.name in
                FStar_Util.print1 "Extracted module %s\n" uu____3190);
               (g2,
                 [FStar_Extraction_ML_Syntax.MLLib
                    [(name, (FStar_Pervasives_Native.Some ([], mlm)),
                       (FStar_Extraction_ML_Syntax.MLLib []))]]))
            else (g2, [])))
let extract:
  FStar_Extraction_ML_UEnv.env ->
    FStar_Syntax_Syntax.modul ->
      (FStar_Extraction_ML_UEnv.env,FStar_Extraction_ML_Syntax.mllib
                                      Prims.list)
        FStar_Pervasives_Native.tuple2
  =
  fun g  ->
    fun m  ->
      let uu____3264 = FStar_Options.debug_any () in
      if uu____3264
      then
        let msg =
          let uu____3272 =
            FStar_Syntax_Print.lid_to_string m.FStar_Syntax_Syntax.name in
          FStar_Util.format1 "Extracting module %s\n" uu____3272 in
        FStar_Util.measure_execution_time msg
          (fun uu____3280  -> extract' g m)
      else extract' g m