open Prims
let (fail_exp :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun lid  ->
    fun t  ->
      let uu____13 =
        let uu____20 =
          let uu____21 =
            let uu____36 =
              FStar_Syntax_Syntax.fvar FStar_Parser_Const.failwith_lid
                FStar_Syntax_Syntax.delta_constant
                FStar_Pervasives_Native.None
               in
            let uu____39 =
              let uu____48 = FStar_Syntax_Syntax.iarg t  in
              let uu____55 =
                let uu____64 =
                  let uu____71 =
                    let uu____72 =
                      let uu____79 =
                        let uu____80 =
                          let uu____81 =
                            let uu____86 =
                              let uu____87 =
                                FStar_Syntax_Print.lid_to_string lid  in
                              Prims.strcat "Not yet implemented:" uu____87
                               in
                            (uu____86, FStar_Range.dummyRange)  in
                          FStar_Const.Const_string uu____81  in
                        FStar_Syntax_Syntax.Tm_constant uu____80  in
                      FStar_Syntax_Syntax.mk uu____79  in
                    uu____72 FStar_Pervasives_Native.None
                      FStar_Range.dummyRange
                     in
                  FStar_All.pipe_left FStar_Syntax_Syntax.as_arg uu____71  in
                [uu____64]  in
              uu____48 :: uu____55  in
            (uu____36, uu____39)  in
          FStar_Syntax_Syntax.Tm_app uu____21  in
        FStar_Syntax_Syntax.mk uu____20  in
      uu____13 FStar_Pervasives_Native.None FStar_Range.dummyRange
  
let (mangle_projector_lid : FStar_Ident.lident -> FStar_Ident.lident) =
  fun x  -> x 
let (lident_as_mlsymbol :
  FStar_Ident.lident -> FStar_Extraction_ML_Syntax.mlsymbol) =
  fun id1  ->
    FStar_Extraction_ML_Syntax.avoid_keyword
      (id1.FStar_Ident.ident).FStar_Ident.idText
  
let as_pair :
  'Auu____142 .
    'Auu____142 Prims.list ->
      ('Auu____142,'Auu____142) FStar_Pervasives_Native.tuple2
  =
  fun uu___91_153  ->
    match uu___91_153 with
    | a::b::[] -> (a, b)
    | uu____158 -> failwith "Expected a list with 2 elements"
  
let (flag_of_qual :
  FStar_Syntax_Syntax.qualifier ->
    FStar_Extraction_ML_Syntax.meta FStar_Pervasives_Native.option)
  =
  fun uu___92_171  ->
    match uu___92_171 with
    | FStar_Syntax_Syntax.Assumption  ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.Assumed
    | FStar_Syntax_Syntax.Private  ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.Private
    | FStar_Syntax_Syntax.NoExtract  ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.NoExtract
    | uu____174 -> FStar_Pervasives_Native.None
  
let rec (extract_meta :
  FStar_Syntax_Syntax.term ->
    FStar_Extraction_ML_Syntax.meta FStar_Pervasives_Native.option)
  =
  fun x  ->
    let uu____182 = FStar_Syntax_Subst.compress x  in
    match uu____182 with
    | { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
        FStar_Syntax_Syntax.pos = uu____186;
        FStar_Syntax_Syntax.vars = uu____187;_} ->
        let uu____190 =
          let uu____191 = FStar_Syntax_Syntax.lid_of_fv fv  in
          FStar_Ident.string_of_lid uu____191  in
        (match uu____190 with
         | "FStar.Pervasives.PpxDerivingShow" ->
             FStar_Pervasives_Native.Some
               FStar_Extraction_ML_Syntax.PpxDerivingShow
         | "FStar.Pervasives.PpxDerivingYoJson" ->
             FStar_Pervasives_Native.Some
               FStar_Extraction_ML_Syntax.PpxDerivingYoJson
         | "FStar.Pervasives.CInline" ->
             FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.CInline
         | "FStar.Pervasives.Substitute" ->
             FStar_Pervasives_Native.Some
               FStar_Extraction_ML_Syntax.Substitute
         | "FStar.Pervasives.Gc" ->
             FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.GCType
         | uu____194 -> FStar_Pervasives_Native.None)
    | {
        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_app
          ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
             FStar_Syntax_Syntax.pos = uu____196;
             FStar_Syntax_Syntax.vars = uu____197;_},({
                                                        FStar_Syntax_Syntax.n
                                                          =
                                                          FStar_Syntax_Syntax.Tm_constant
                                                          (FStar_Const.Const_string
                                                          (s,uu____199));
                                                        FStar_Syntax_Syntax.pos
                                                          = uu____200;
                                                        FStar_Syntax_Syntax.vars
                                                          = uu____201;_},uu____202)::[]);
        FStar_Syntax_Syntax.pos = uu____203;
        FStar_Syntax_Syntax.vars = uu____204;_} ->
        let uu____235 =
          let uu____236 = FStar_Syntax_Syntax.lid_of_fv fv  in
          FStar_Ident.string_of_lid uu____236  in
        (match uu____235 with
         | "FStar.Pervasives.PpxDerivingShowConstant" ->
             FStar_Pervasives_Native.Some
               (FStar_Extraction_ML_Syntax.PpxDerivingShowConstant s)
         | "FStar.Pervasives.Comment" ->
             FStar_Pervasives_Native.Some
               (FStar_Extraction_ML_Syntax.Comment s)
         | "FStar.Pervasives.CPrologue" ->
             FStar_Pervasives_Native.Some
               (FStar_Extraction_ML_Syntax.CPrologue s)
         | "FStar.Pervasives.CEpilogue" ->
             FStar_Pervasives_Native.Some
               (FStar_Extraction_ML_Syntax.CEpilogue s)
         | "FStar.Pervasives.CConst" ->
             FStar_Pervasives_Native.Some
               (FStar_Extraction_ML_Syntax.CConst s)
         | uu____239 -> FStar_Pervasives_Native.None)
    | {
        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
          (FStar_Const.Const_string ("KremlinPrivate",uu____240));
        FStar_Syntax_Syntax.pos = uu____241;
        FStar_Syntax_Syntax.vars = uu____242;_} ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.Private
    | {
        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
          (FStar_Const.Const_string ("c_inline",uu____245));
        FStar_Syntax_Syntax.pos = uu____246;
        FStar_Syntax_Syntax.vars = uu____247;_} ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.CInline
    | {
        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
          (FStar_Const.Const_string ("substitute",uu____250));
        FStar_Syntax_Syntax.pos = uu____251;
        FStar_Syntax_Syntax.vars = uu____252;_} ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.Substitute
    | { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_meta (x1,uu____256);
        FStar_Syntax_Syntax.pos = uu____257;
        FStar_Syntax_Syntax.vars = uu____258;_} -> extract_meta x1
    | uu____265 -> FStar_Pervasives_Native.None
  
let (extract_metadata :
  FStar_Syntax_Syntax.term Prims.list ->
    FStar_Extraction_ML_Syntax.meta Prims.list)
  = fun metas  -> FStar_List.choose extract_meta metas 
let binders_as_mlty_binders :
  'Auu____283 .
    FStar_Extraction_ML_UEnv.env ->
      (FStar_Syntax_Syntax.bv,'Auu____283) FStar_Pervasives_Native.tuple2
        Prims.list ->
        (FStar_Extraction_ML_UEnv.env,Prims.string Prims.list)
          FStar_Pervasives_Native.tuple2
  =
  fun env  ->
    fun bs  ->
      FStar_Util.fold_map
        (fun env1  ->
           fun uu____323  ->
             match uu____323 with
             | (bv,uu____333) ->
                 let uu____334 =
                   let uu____335 =
                     let uu____338 =
                       let uu____339 =
                         FStar_Extraction_ML_UEnv.bv_as_ml_tyvar bv  in
                       FStar_Extraction_ML_Syntax.MLTY_Var uu____339  in
                     FStar_Pervasives_Native.Some uu____338  in
                   FStar_Extraction_ML_UEnv.extend_ty env1 bv uu____335  in
                 let uu____340 = FStar_Extraction_ML_UEnv.bv_as_ml_tyvar bv
                    in
                 (uu____334, uu____340)) env bs
  
let (extract_typ_abbrev :
  FStar_Extraction_ML_UEnv.env ->
    FStar_Syntax_Syntax.fv ->
      FStar_Syntax_Syntax.qualifier Prims.list ->
        FStar_Syntax_Syntax.term Prims.list ->
          FStar_Syntax_Syntax.term ->
            (FStar_Extraction_ML_UEnv.env,FStar_Extraction_ML_Syntax.mlmodule1
                                            Prims.list)
              FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun fv  ->
      fun quals  ->
        fun attrs  ->
          fun def  ->
            let lid = (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
               in
            let def1 =
              let uu____384 =
                let uu____385 = FStar_Syntax_Subst.compress def  in
                FStar_All.pipe_right uu____385 FStar_Syntax_Util.unmeta  in
              FStar_All.pipe_right uu____384 FStar_Syntax_Util.un_uinst  in
            let def2 =
              match def1.FStar_Syntax_Syntax.n with
              | FStar_Syntax_Syntax.Tm_abs uu____393 ->
                  FStar_Extraction_ML_Term.normalize_abs def1
              | uu____410 -> def1  in
            let uu____411 =
              match def2.FStar_Syntax_Syntax.n with
              | FStar_Syntax_Syntax.Tm_abs (bs,body,uu____422) ->
                  FStar_Syntax_Subst.open_term bs body
              | uu____443 -> ([], def2)  in
            match uu____411 with
            | (bs,body) ->
                let assumed =
                  FStar_Util.for_some
                    (fun uu___93_464  ->
                       match uu___93_464 with
                       | FStar_Syntax_Syntax.Assumption  -> true
                       | uu____465 -> false) quals
                   in
                let uu____466 = binders_as_mlty_binders env bs  in
                (match uu____466 with
                 | (env1,ml_bs) ->
                     let body1 =
                       let uu____486 =
                         FStar_Extraction_ML_Term.term_as_mlty env1 body  in
                       FStar_All.pipe_right uu____486
                         (FStar_Extraction_ML_Util.eraseTypeDeep
                            (FStar_Extraction_ML_Util.udelta_unfold env1))
                        in
                     let mangled_projector =
                       let uu____490 =
                         FStar_All.pipe_right quals
                           (FStar_Util.for_some
                              (fun uu___94_495  ->
                                 match uu___94_495 with
                                 | FStar_Syntax_Syntax.Projector uu____496 ->
                                     true
                                 | uu____501 -> false))
                          in
                       if uu____490
                       then
                         let mname = mangle_projector_lid lid  in
                         FStar_Pervasives_Native.Some
                           ((mname.FStar_Ident.ident).FStar_Ident.idText)
                       else FStar_Pervasives_Native.None  in
                     let metadata =
                       let uu____509 = extract_metadata attrs  in
                       let uu____512 = FStar_List.choose flag_of_qual quals
                          in
                       FStar_List.append uu____509 uu____512  in
                     let td =
                       let uu____518 =
                         let uu____519 = lident_as_mlsymbol lid  in
                         (assumed, uu____519, mangled_projector, ml_bs,
                           metadata,
                           (FStar_Pervasives_Native.Some
                              (FStar_Extraction_ML_Syntax.MLTD_Abbrev body1)))
                          in
                       [uu____518]  in
                     let def3 =
                       let uu____527 =
                         let uu____528 =
                           let uu____529 = FStar_Ident.range_of_lid lid  in
                           FStar_Extraction_ML_Util.mlloc_of_range uu____529
                            in
                         FStar_Extraction_ML_Syntax.MLM_Loc uu____528  in
                       [uu____527; FStar_Extraction_ML_Syntax.MLM_Ty td]  in
                     let env2 =
                       let uu____531 =
                         FStar_All.pipe_right quals
                           (FStar_Util.for_some
                              (fun uu___95_535  ->
                                 match uu___95_535 with
                                 | FStar_Syntax_Syntax.Assumption  -> true
                                 | FStar_Syntax_Syntax.New  -> true
                                 | uu____536 -> false))
                          in
                       if uu____531
                       then FStar_Extraction_ML_UEnv.extend_type_name env1 fv
                       else FStar_Extraction_ML_UEnv.extend_tydef env1 fv td
                        in
                     (env2, def3))
  
type data_constructor =
  {
  dname: FStar_Ident.lident ;
  dtyp: FStar_Syntax_Syntax.typ }
let (__proj__Mkdata_constructor__item__dname :
  data_constructor -> FStar_Ident.lident) =
  fun projectee  ->
    match projectee with
    | { dname = __fname__dname; dtyp = __fname__dtyp;_} -> __fname__dname
  
let (__proj__Mkdata_constructor__item__dtyp :
  data_constructor -> FStar_Syntax_Syntax.typ) =
  fun projectee  ->
    match projectee with
    | { dname = __fname__dname; dtyp = __fname__dtyp;_} -> __fname__dtyp
  
type inductive_family =
  {
  iname: FStar_Ident.lident ;
  iparams: FStar_Syntax_Syntax.binders ;
  ityp: FStar_Syntax_Syntax.term ;
  idatas: data_constructor Prims.list ;
  iquals: FStar_Syntax_Syntax.qualifier Prims.list ;
  imetadata: FStar_Extraction_ML_Syntax.metadata }
let (__proj__Mkinductive_family__item__iname :
  inductive_family -> FStar_Ident.lident) =
  fun projectee  ->
    match projectee with
    | { iname = __fname__iname; iparams = __fname__iparams;
        ityp = __fname__ityp; idatas = __fname__idatas;
        iquals = __fname__iquals; imetadata = __fname__imetadata;_} ->
        __fname__iname
  
let (__proj__Mkinductive_family__item__iparams :
  inductive_family -> FStar_Syntax_Syntax.binders) =
  fun projectee  ->
    match projectee with
    | { iname = __fname__iname; iparams = __fname__iparams;
        ityp = __fname__ityp; idatas = __fname__idatas;
        iquals = __fname__iquals; imetadata = __fname__imetadata;_} ->
        __fname__iparams
  
let (__proj__Mkinductive_family__item__ityp :
  inductive_family -> FStar_Syntax_Syntax.term) =
  fun projectee  ->
    match projectee with
    | { iname = __fname__iname; iparams = __fname__iparams;
        ityp = __fname__ityp; idatas = __fname__idatas;
        iquals = __fname__iquals; imetadata = __fname__imetadata;_} ->
        __fname__ityp
  
let (__proj__Mkinductive_family__item__idatas :
  inductive_family -> data_constructor Prims.list) =
  fun projectee  ->
    match projectee with
    | { iname = __fname__iname; iparams = __fname__iparams;
        ityp = __fname__ityp; idatas = __fname__idatas;
        iquals = __fname__iquals; imetadata = __fname__imetadata;_} ->
        __fname__idatas
  
let (__proj__Mkinductive_family__item__iquals :
  inductive_family -> FStar_Syntax_Syntax.qualifier Prims.list) =
  fun projectee  ->
    match projectee with
    | { iname = __fname__iname; iparams = __fname__iparams;
        ityp = __fname__ityp; idatas = __fname__idatas;
        iquals = __fname__iquals; imetadata = __fname__imetadata;_} ->
        __fname__iquals
  
let (__proj__Mkinductive_family__item__imetadata :
  inductive_family -> FStar_Extraction_ML_Syntax.metadata) =
  fun projectee  ->
    match projectee with
    | { iname = __fname__iname; iparams = __fname__iparams;
        ityp = __fname__ityp; idatas = __fname__idatas;
        iquals = __fname__iquals; imetadata = __fname__imetadata;_} ->
        __fname__imetadata
  
let (print_ifamily : inductive_family -> unit) =
  fun i  ->
    let uu____701 = FStar_Syntax_Print.lid_to_string i.iname  in
    let uu____702 = FStar_Syntax_Print.binders_to_string " " i.iparams  in
    let uu____703 = FStar_Syntax_Print.term_to_string i.ityp  in
    let uu____704 =
      let uu____705 =
        FStar_All.pipe_right i.idatas
          (FStar_List.map
             (fun d  ->
                let uu____716 = FStar_Syntax_Print.lid_to_string d.dname  in
                let uu____717 =
                  let uu____718 = FStar_Syntax_Print.term_to_string d.dtyp
                     in
                  Prims.strcat " : " uu____718  in
                Prims.strcat uu____716 uu____717))
         in
      FStar_All.pipe_right uu____705 (FStar_String.concat "\n\t\t")  in
    FStar_Util.print4 "\n\t%s %s : %s { %s }\n" uu____701 uu____702 uu____703
      uu____704
  
let bundle_as_inductive_families :
  'Auu____731 .
    FStar_Extraction_ML_UEnv.env ->
      FStar_Syntax_Syntax.sigelt Prims.list ->
        'Auu____731 ->
          FStar_Syntax_Syntax.attribute Prims.list ->
            (FStar_Extraction_ML_UEnv.env,inductive_family Prims.list)
              FStar_Pervasives_Native.tuple2
  =
  fun env  ->
    fun ses  ->
      fun quals  ->
        fun attrs  ->
          let uu____766 =
            FStar_Util.fold_map
              (fun env1  ->
                 fun se  ->
                   match se.FStar_Syntax_Syntax.sigel with
                   | FStar_Syntax_Syntax.Sig_inductive_typ
                       (l,_us,bs,t,_mut_i,datas) ->
                       let uu____813 = FStar_Syntax_Subst.open_term bs t  in
                       (match uu____813 with
                        | (bs1,t1) ->
                            let datas1 =
                              FStar_All.pipe_right ses
                                (FStar_List.collect
                                   (fun se1  ->
                                      match se1.FStar_Syntax_Syntax.sigel
                                      with
                                      | FStar_Syntax_Syntax.Sig_datacon
                                          (d,uu____852,t2,l',nparams,uu____856)
                                          when FStar_Ident.lid_equals l l' ->
                                          let uu____861 =
                                            FStar_Syntax_Util.arrow_formals
                                              t2
                                             in
                                          (match uu____861 with
                                           | (bs',body) ->
                                               let uu____894 =
                                                 FStar_Util.first_N
                                                   (FStar_List.length bs1)
                                                   bs'
                                                  in
                                               (match uu____894 with
                                                | (bs_params,rest) ->
                                                    let subst1 =
                                                      FStar_List.map2
                                                        (fun uu____965  ->
                                                           fun uu____966  ->
                                                             match (uu____965,
                                                                    uu____966)
                                                             with
                                                             | ((b',uu____984),
                                                                (b,uu____986))
                                                                 ->
                                                                 let uu____995
                                                                   =
                                                                   let uu____1002
                                                                    =
                                                                    FStar_Syntax_Syntax.bv_to_name
                                                                    b  in
                                                                   (b',
                                                                    uu____1002)
                                                                    in
                                                                 FStar_Syntax_Syntax.NT
                                                                   uu____995)
                                                        bs_params bs1
                                                       in
                                                    let t3 =
                                                      let uu____1008 =
                                                        let uu____1009 =
                                                          FStar_Syntax_Syntax.mk_Total
                                                            body
                                                           in
                                                        FStar_Syntax_Util.arrow
                                                          rest uu____1009
                                                         in
                                                      FStar_All.pipe_right
                                                        uu____1008
                                                        (FStar_Syntax_Subst.subst
                                                           subst1)
                                                       in
                                                    [{ dname = d; dtyp = t3 }]))
                                      | uu____1012 -> []))
                               in
                            let metadata =
                              extract_metadata
                                (FStar_List.append
                                   se.FStar_Syntax_Syntax.sigattrs attrs)
                               in
                            let env2 =
                              let uu____1017 =
                                FStar_Syntax_Syntax.lid_as_fv l
                                  FStar_Syntax_Syntax.delta_constant
                                  FStar_Pervasives_Native.None
                                 in
                              FStar_Extraction_ML_UEnv.extend_type_name env1
                                uu____1017
                               in
                            (env2,
                              [{
                                 iname = l;
                                 iparams = bs1;
                                 ityp = t1;
                                 idatas = datas1;
                                 iquals = (se.FStar_Syntax_Syntax.sigquals);
                                 imetadata = metadata
                               }]))
                   | uu____1020 -> (env1, [])) env ses
             in
          match uu____766 with
          | (env1,ifams) -> (env1, (FStar_List.flatten ifams))
  
type env_t = FStar_Extraction_ML_UEnv.env
let (extract_bundle :
  FStar_Extraction_ML_UEnv.env ->
    FStar_Syntax_Syntax.sigelt ->
      (env_t,FStar_Extraction_ML_Syntax.mlmodule1 Prims.list)
        FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun se  ->
      let extract_ctor ml_tyvars env1 ctor =
        let mlt =
          let uu____1106 =
            FStar_Extraction_ML_Term.term_as_mlty env1 ctor.dtyp  in
          FStar_Extraction_ML_Util.eraseTypeDeep
            (FStar_Extraction_ML_Util.udelta_unfold env1) uu____1106
           in
        let steps =
          [FStar_TypeChecker_Normalize.Inlining;
          FStar_TypeChecker_Normalize.UnfoldUntil
            FStar_Syntax_Syntax.delta_constant;
          FStar_TypeChecker_Normalize.EraseUniverses;
          FStar_TypeChecker_Normalize.AllowUnboundUniverses]  in
        let names1 =
          let uu____1113 =
            let uu____1114 =
              let uu____1117 =
                FStar_TypeChecker_Normalize.normalize steps
                  env1.FStar_Extraction_ML_UEnv.tcenv ctor.dtyp
                 in
              FStar_Syntax_Subst.compress uu____1117  in
            uu____1114.FStar_Syntax_Syntax.n  in
          match uu____1113 with
          | FStar_Syntax_Syntax.Tm_arrow (bs,uu____1121) ->
              FStar_List.map
                (fun uu____1147  ->
                   match uu____1147 with
                   | ({ FStar_Syntax_Syntax.ppname = ppname;
                        FStar_Syntax_Syntax.index = uu____1153;
                        FStar_Syntax_Syntax.sort = uu____1154;_},uu____1155)
                       -> ppname.FStar_Ident.idText) bs
          | uu____1158 -> []  in
        let tys = (ml_tyvars, mlt)  in
        let fvv = FStar_Extraction_ML_UEnv.mkFvvar ctor.dname ctor.dtyp  in
        let uu____1165 =
          let uu____1166 =
            FStar_Extraction_ML_UEnv.extend_fv env1 fvv tys false false  in
          FStar_Pervasives_Native.fst uu____1166  in
        let uu____1171 =
          let uu____1182 = lident_as_mlsymbol ctor.dname  in
          let uu____1183 =
            let uu____1190 = FStar_Extraction_ML_Util.argTypes mlt  in
            FStar_List.zip names1 uu____1190  in
          (uu____1182, uu____1183)  in
        (uu____1165, uu____1171)  in
      let extract_one_family env1 ind =
        let uu____1242 = binders_as_mlty_binders env1 ind.iparams  in
        match uu____1242 with
        | (env2,vars) ->
            let uu____1277 =
              FStar_All.pipe_right ind.idatas
                (FStar_Util.fold_map (extract_ctor vars) env2)
               in
            (match uu____1277 with
             | (env3,ctors) ->
                 let uu____1370 = FStar_Syntax_Util.arrow_formals ind.ityp
                    in
                 (match uu____1370 with
                  | (indices,uu____1406) ->
                      let ml_params =
                        let uu____1426 =
                          FStar_All.pipe_right indices
                            (FStar_List.mapi
                               (fun i  ->
                                  fun uu____1445  ->
                                    let uu____1450 =
                                      FStar_Util.string_of_int i  in
                                    Prims.strcat "'dummyV" uu____1450))
                           in
                        FStar_List.append vars uu____1426  in
                      let tbody =
                        let uu____1452 =
                          FStar_Util.find_opt
                            (fun uu___96_1457  ->
                               match uu___96_1457 with
                               | FStar_Syntax_Syntax.RecordType uu____1458 ->
                                   true
                               | uu____1467 -> false) ind.iquals
                           in
                        match uu____1452 with
                        | FStar_Pervasives_Native.Some
                            (FStar_Syntax_Syntax.RecordType (ns,ids)) ->
                            let uu____1478 = FStar_List.hd ctors  in
                            (match uu____1478 with
                             | (uu____1499,c_ty) ->
                                 let fields =
                                   FStar_List.map2
                                     (fun id1  ->
                                        fun uu____1536  ->
                                          match uu____1536 with
                                          | (uu____1545,ty) ->
                                              let lid =
                                                FStar_Ident.lid_of_ids
                                                  (FStar_List.append ns [id1])
                                                 in
                                              let uu____1548 =
                                                lident_as_mlsymbol lid  in
                                              (uu____1548, ty)) ids c_ty
                                    in
                                 FStar_Extraction_ML_Syntax.MLTD_Record
                                   fields)
                        | uu____1549 ->
                            FStar_Extraction_ML_Syntax.MLTD_DType ctors
                         in
                      let uu____1552 =
                        let uu____1571 = lident_as_mlsymbol ind.iname  in
                        (false, uu____1571, FStar_Pervasives_Native.None,
                          ml_params, (ind.imetadata),
                          (FStar_Pervasives_Native.Some tbody))
                         in
                      (env3, uu____1552)))
         in
      match ((se.FStar_Syntax_Syntax.sigel),
              (se.FStar_Syntax_Syntax.sigquals))
      with
      | (FStar_Syntax_Syntax.Sig_bundle
         ({
            FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_datacon
              (l,uu____1605,t,uu____1607,uu____1608,uu____1609);
            FStar_Syntax_Syntax.sigrng = uu____1610;
            FStar_Syntax_Syntax.sigquals = uu____1611;
            FStar_Syntax_Syntax.sigmeta = uu____1612;
            FStar_Syntax_Syntax.sigattrs = uu____1613;_}::[],uu____1614),(FStar_Syntax_Syntax.ExceptionConstructor
         )::[]) ->
          let uu____1631 = extract_ctor [] env { dname = l; dtyp = t }  in
          (match uu____1631 with
           | (env1,ctor) -> (env1, [FStar_Extraction_ML_Syntax.MLM_Exn ctor]))
      | (FStar_Syntax_Syntax.Sig_bundle (ses,uu____1677),quals) ->
          let uu____1691 =
            bundle_as_inductive_families env ses quals
              se.FStar_Syntax_Syntax.sigattrs
             in
          (match uu____1691 with
           | (env1,ifams) ->
               let uu____1712 =
                 FStar_Util.fold_map extract_one_family env1 ifams  in
               (match uu____1712 with
                | (env2,td) -> (env2, [FStar_Extraction_ML_Syntax.MLM_Ty td])))
      | uu____1805 -> failwith "Unexpected signature element"
  
let (maybe_register_plugin :
  env_t ->
    FStar_Syntax_Syntax.sigelt ->
      FStar_Extraction_ML_Syntax.mlmodule1 Prims.list)
  =
  fun g  ->
    fun se  ->
      let w =
        FStar_Extraction_ML_Syntax.with_ty
          FStar_Extraction_ML_Syntax.MLTY_Top
         in
      let uu____1837 =
        (let uu____1840 = FStar_Options.codegen ()  in
         uu____1840 <> (FStar_Pervasives_Native.Some FStar_Options.Plugin))
          ||
          (let uu____1846 =
             FStar_Syntax_Util.has_attribute se.FStar_Syntax_Syntax.sigattrs
               FStar_Parser_Const.plugin_attr
              in
           Prims.op_Negation uu____1846)
         in
      if uu____1837
      then []
      else
        (match se.FStar_Syntax_Syntax.sigel with
         | FStar_Syntax_Syntax.Sig_let (lbs,lids) ->
             let mk_registration lb =
               let fv =
                 let uu____1869 =
                   let uu____1872 =
                     FStar_Util.right lb.FStar_Syntax_Syntax.lbname  in
                   uu____1872.FStar_Syntax_Syntax.fv_name  in
                 uu____1869.FStar_Syntax_Syntax.v  in
               let fv_t = lb.FStar_Syntax_Syntax.lbtyp  in
               let ml_name_str =
                 let uu____1877 =
                   let uu____1878 = FStar_Ident.string_of_lid fv  in
                   FStar_Extraction_ML_Syntax.MLC_String uu____1878  in
                 FStar_Extraction_ML_Syntax.MLE_Const uu____1877  in
               let uu____1879 =
                 FStar_Extraction_ML_Util.interpret_plugin_as_term_fun
                   g.FStar_Extraction_ML_UEnv.tcenv fv fv_t ml_name_str
                  in
               match uu____1879 with
               | FStar_Pervasives_Native.Some (interp,arity,plugin) ->
                   let register =
                     if plugin
                     then "FStar_Tactics_Native.register_plugin"
                     else "FStar_Tactics_Native.register_tactic"  in
                   let h =
                     let uu____1902 =
                       let uu____1903 =
                         let uu____1904 = FStar_Ident.lid_of_str register  in
                         FStar_Extraction_ML_Syntax.mlpath_of_lident
                           uu____1904
                          in
                       FStar_Extraction_ML_Syntax.MLE_Name uu____1903  in
                     FStar_All.pipe_left
                       (FStar_Extraction_ML_Syntax.with_ty
                          FStar_Extraction_ML_Syntax.MLTY_Top) uu____1902
                      in
                   let arity1 =
                     let uu____1906 =
                       let uu____1907 =
                         let uu____1918 = FStar_Util.string_of_int arity  in
                         (uu____1918, FStar_Pervasives_Native.None)  in
                       FStar_Extraction_ML_Syntax.MLC_Int uu____1907  in
                     FStar_Extraction_ML_Syntax.MLE_Const uu____1906  in
                   let app =
                     FStar_All.pipe_left
                       (FStar_Extraction_ML_Syntax.with_ty
                          FStar_Extraction_ML_Syntax.MLTY_Top)
                       (FStar_Extraction_ML_Syntax.MLE_App
                          (h, [w ml_name_str; w arity1; interp]))
                      in
                   [FStar_Extraction_ML_Syntax.MLM_Top app]
               | FStar_Pervasives_Native.None  -> []  in
             FStar_List.collect mk_registration
               (FStar_Pervasives_Native.snd lbs)
         | uu____1940 -> [])
  
let rec (extract_sig :
  env_t ->
    FStar_Syntax_Syntax.sigelt ->
      (env_t,FStar_Extraction_ML_Syntax.mlmodule1 Prims.list)
        FStar_Pervasives_Native.tuple2)
  =
  fun g  ->
    fun se  ->
      FStar_Extraction_ML_UEnv.debug g
        (fun u  ->
           let uu____1967 = FStar_Syntax_Print.sigelt_to_string se  in
           FStar_Util.print1 ">>>> extract_sig %s \n" uu____1967);
      (match se.FStar_Syntax_Syntax.sigel with
       | FStar_Syntax_Syntax.Sig_bundle uu____1974 -> extract_bundle g se
       | FStar_Syntax_Syntax.Sig_inductive_typ uu____1983 ->
           extract_bundle g se
       | FStar_Syntax_Syntax.Sig_datacon uu____2000 -> extract_bundle g se
       | FStar_Syntax_Syntax.Sig_new_effect ed when
           FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
             (FStar_List.contains FStar_Syntax_Syntax.Reifiable)
           ->
           let extend_env g1 lid ml_name tm tysc =
             let uu____2048 =
               let uu____2053 =
                 FStar_Syntax_Syntax.lid_as_fv lid
                   FStar_Syntax_Syntax.delta_equational
                   FStar_Pervasives_Native.None
                  in
               FStar_Extraction_ML_UEnv.extend_fv' g1 uu____2053 ml_name tysc
                 false false
                in
             match uu____2048 with
             | (g2,mangled_name) ->
                 ((let uu____2061 =
                     FStar_All.pipe_left
                       (FStar_TypeChecker_Env.debug
                          g2.FStar_Extraction_ML_UEnv.tcenv)
                       (FStar_Options.Other "ExtractionReify")
                      in
                   if uu____2061
                   then FStar_Util.print1 "Mangled name: %s\n" mangled_name
                   else ());
                  (let lb =
                     {
                       FStar_Extraction_ML_Syntax.mllb_name = mangled_name;
                       FStar_Extraction_ML_Syntax.mllb_tysc =
                         FStar_Pervasives_Native.None;
                       FStar_Extraction_ML_Syntax.mllb_add_unit = false;
                       FStar_Extraction_ML_Syntax.mllb_def = tm;
                       FStar_Extraction_ML_Syntax.mllb_meta = [];
                       FStar_Extraction_ML_Syntax.print_typ = false
                     }  in
                   (g2,
                     (FStar_Extraction_ML_Syntax.MLM_Let
                        (FStar_Extraction_ML_Syntax.NonRec, [lb])))))
              in
           let rec extract_fv tm =
             (let uu____2077 =
                FStar_All.pipe_left
                  (FStar_TypeChecker_Env.debug
                     g.FStar_Extraction_ML_UEnv.tcenv)
                  (FStar_Options.Other "ExtractionReify")
                 in
              if uu____2077
              then
                let uu____2078 = FStar_Syntax_Print.term_to_string tm  in
                FStar_Util.print1 "extract_fv term: %s\n" uu____2078
              else ());
             (let uu____2080 =
                let uu____2081 = FStar_Syntax_Subst.compress tm  in
                uu____2081.FStar_Syntax_Syntax.n  in
              match uu____2080 with
              | FStar_Syntax_Syntax.Tm_uinst (tm1,uu____2089) ->
                  extract_fv tm1
              | FStar_Syntax_Syntax.Tm_fvar fv ->
                  let mlp =
                    FStar_Extraction_ML_Syntax.mlpath_of_lident
                      (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                     in
                  let uu____2096 =
                    let uu____2105 = FStar_Extraction_ML_UEnv.lookup_fv g fv
                       in
                    FStar_All.pipe_left FStar_Util.right uu____2105  in
                  (match uu____2096 with
                   | (uu____2162,uu____2163,tysc,uu____2165) ->
                       let uu____2166 =
                         FStar_All.pipe_left
                           (FStar_Extraction_ML_Syntax.with_ty
                              FStar_Extraction_ML_Syntax.MLTY_Top)
                           (FStar_Extraction_ML_Syntax.MLE_Name mlp)
                          in
                       (uu____2166, tysc))
              | uu____2167 -> failwith "Not an fv")
              in
           let extract_action g1 a =
             (let uu____2189 =
                FStar_All.pipe_left
                  (FStar_TypeChecker_Env.debug
                     g1.FStar_Extraction_ML_UEnv.tcenv)
                  (FStar_Options.Other "ExtractionReify")
                 in
              if uu____2189
              then
                let uu____2190 =
                  FStar_Syntax_Print.term_to_string
                    a.FStar_Syntax_Syntax.action_typ
                   in
                let uu____2191 =
                  FStar_Syntax_Print.term_to_string
                    a.FStar_Syntax_Syntax.action_defn
                   in
                FStar_Util.print2 "Action type %s and term %s\n" uu____2190
                  uu____2191
              else ());
             (let uu____2193 = FStar_Extraction_ML_UEnv.action_name ed a  in
              match uu____2193 with
              | (a_nm,a_lid) ->
                  let lbname =
                    let uu____2209 =
                      FStar_Syntax_Syntax.new_bv
                        (FStar_Pervasives_Native.Some
                           ((a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos))
                        FStar_Syntax_Syntax.tun
                       in
                    FStar_Util.Inl uu____2209  in
                  let lb =
                    FStar_Syntax_Syntax.mk_lb
                      (lbname, (a.FStar_Syntax_Syntax.action_univs),
                        FStar_Parser_Const.effect_Tot_lid,
                        (a.FStar_Syntax_Syntax.action_typ),
                        (a.FStar_Syntax_Syntax.action_defn),
                        ((a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos))
                     in
                  let lbs = (false, [lb])  in
                  let action_lb =
                    FStar_Syntax_Syntax.mk
                      (FStar_Syntax_Syntax.Tm_let
                         (lbs, FStar_Syntax_Util.exp_false_bool))
                      FStar_Pervasives_Native.None
                      (a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos
                     in
                  let uu____2233 =
                    FStar_Extraction_ML_Term.term_as_mlexpr g1 action_lb  in
                  (match uu____2233 with
                   | (a_let,uu____2245,ty) ->
                       ((let uu____2248 =
                           FStar_All.pipe_left
                             (FStar_TypeChecker_Env.debug
                                g1.FStar_Extraction_ML_UEnv.tcenv)
                             (FStar_Options.Other "ExtractionReify")
                            in
                         if uu____2248
                         then
                           let uu____2249 =
                             FStar_Extraction_ML_Code.string_of_mlexpr a_nm
                               a_let
                              in
                           FStar_Util.print1 "Extracted action term: %s\n"
                             uu____2249
                         else ());
                        (let uu____2251 =
                           match a_let.FStar_Extraction_ML_Syntax.expr with
                           | FStar_Extraction_ML_Syntax.MLE_Let
                               ((uu____2260,mllb::[]),uu____2262) ->
                               (match mllb.FStar_Extraction_ML_Syntax.mllb_tysc
                                with
                                | FStar_Pervasives_Native.Some tysc ->
                                    ((mllb.FStar_Extraction_ML_Syntax.mllb_def),
                                      tysc)
                                | FStar_Pervasives_Native.None  ->
                                    failwith "No type scheme")
                           | uu____2280 -> failwith "Impossible"  in
                         match uu____2251 with
                         | (exp,tysc) ->
                             ((let uu____2292 =
                                 FStar_All.pipe_left
                                   (FStar_TypeChecker_Env.debug
                                      g1.FStar_Extraction_ML_UEnv.tcenv)
                                   (FStar_Options.Other "ExtractionReify")
                                  in
                               if uu____2292
                               then
                                 ((let uu____2294 =
                                     FStar_Extraction_ML_Code.string_of_mlty
                                       a_nm
                                       (FStar_Pervasives_Native.snd tysc)
                                      in
                                   FStar_Util.print1
                                     "Extracted action type: %s\n" uu____2294);
                                  FStar_List.iter
                                    (fun x  ->
                                       FStar_Util.print1 "and binders: %s\n"
                                         x)
                                    (FStar_Pervasives_Native.fst tysc))
                               else ());
                              extend_env g1 a_lid a_nm exp tysc)))))
              in
           let uu____2300 =
             let uu____2305 =
               extract_fv
                 (FStar_Pervasives_Native.snd
                    ed.FStar_Syntax_Syntax.return_repr)
                in
             match uu____2305 with
             | (return_tm,ty_sc) ->
                 let uu____2320 =
                   FStar_Extraction_ML_UEnv.monad_op_name ed "return"  in
                 (match uu____2320 with
                  | (return_nm,return_lid) ->
                      extend_env g return_lid return_nm return_tm ty_sc)
              in
           (match uu____2300 with
            | (g1,return_decl) ->
                let uu____2339 =
                  let uu____2344 =
                    extract_fv
                      (FStar_Pervasives_Native.snd
                         ed.FStar_Syntax_Syntax.bind_repr)
                     in
                  match uu____2344 with
                  | (bind_tm,ty_sc) ->
                      let uu____2359 =
                        FStar_Extraction_ML_UEnv.monad_op_name ed "bind"  in
                      (match uu____2359 with
                       | (bind_nm,bind_lid) ->
                           extend_env g1 bind_lid bind_nm bind_tm ty_sc)
                   in
                (match uu____2339 with
                 | (g2,bind_decl) ->
                     let uu____2378 =
                       FStar_Util.fold_map extract_action g2
                         ed.FStar_Syntax_Syntax.actions
                        in
                     (match uu____2378 with
                      | (g3,actions) ->
                          (g3,
                            (FStar_List.append [return_decl; bind_decl]
                               actions)))))
       | FStar_Syntax_Syntax.Sig_splice uu____2399 ->
           failwith "impossible: trying to extract splice"
       | FStar_Syntax_Syntax.Sig_new_effect uu____2412 -> (g, [])
       | FStar_Syntax_Syntax.Sig_declare_typ (lid,uu____2416,t) when
           FStar_Extraction_ML_Term.is_arity g t ->
           let quals = se.FStar_Syntax_Syntax.sigquals  in
           let attrs = se.FStar_Syntax_Syntax.sigattrs  in
           let uu____2424 =
             let uu____2425 =
               FStar_All.pipe_right quals
                 (FStar_Util.for_some
                    (fun uu___97_2429  ->
                       match uu___97_2429 with
                       | FStar_Syntax_Syntax.Assumption  -> true
                       | uu____2430 -> false))
                in
             Prims.op_Negation uu____2425  in
           if uu____2424
           then (g, [])
           else
             (let uu____2440 = FStar_Syntax_Util.arrow_formals t  in
              match uu____2440 with
              | (bs,uu____2460) ->
                  let fv =
                    FStar_Syntax_Syntax.lid_as_fv lid
                      FStar_Syntax_Syntax.delta_constant
                      FStar_Pervasives_Native.None
                     in
                  let uu____2478 =
                    FStar_Syntax_Util.abs bs FStar_Syntax_Syntax.t_unit
                      FStar_Pervasives_Native.None
                     in
                  extract_typ_abbrev g fv quals attrs uu____2478)
       | FStar_Syntax_Syntax.Sig_let ((false ,lb::[]),uu____2480) when
           FStar_Extraction_ML_Term.is_arity g lb.FStar_Syntax_Syntax.lbtyp
           ->
           let quals = se.FStar_Syntax_Syntax.sigquals  in
           let uu____2490 =
             let uu____2499 =
               FStar_TypeChecker_Env.open_universes_in
                 g.FStar_Extraction_ML_UEnv.tcenv
                 lb.FStar_Syntax_Syntax.lbunivs
                 [lb.FStar_Syntax_Syntax.lbdef; lb.FStar_Syntax_Syntax.lbtyp]
                in
             match uu____2499 with
             | (tcenv,uu____2517,def_typ) ->
                 let uu____2523 = as_pair def_typ  in (tcenv, uu____2523)
              in
           (match uu____2490 with
            | (tcenv,(lbdef,lbtyp)) ->
                let lbtyp1 =
                  FStar_TypeChecker_Normalize.normalize
                    [FStar_TypeChecker_Normalize.Beta;
                    FStar_TypeChecker_Normalize.UnfoldUntil
                      FStar_Syntax_Syntax.delta_constant] tcenv lbtyp
                   in
                let lbdef1 =
                  FStar_TypeChecker_Normalize.eta_expand_with_type tcenv
                    lbdef lbtyp1
                   in
                let uu____2547 =
                  FStar_Util.right lb.FStar_Syntax_Syntax.lbname  in
                extract_typ_abbrev g uu____2547 quals
                  se.FStar_Syntax_Syntax.sigattrs lbdef1)
       | FStar_Syntax_Syntax.Sig_let (lbs,uu____2549) ->
           let attrs = se.FStar_Syntax_Syntax.sigattrs  in
           let quals = se.FStar_Syntax_Syntax.sigquals  in
           let uu____2560 =
             let uu____2567 =
               FStar_Syntax_Syntax.mk
                 (FStar_Syntax_Syntax.Tm_let
                    (lbs, FStar_Syntax_Util.exp_false_bool))
                 FStar_Pervasives_Native.None se.FStar_Syntax_Syntax.sigrng
                in
             FStar_Extraction_ML_Term.term_as_mlexpr g uu____2567  in
           (match uu____2560 with
            | (ml_let,uu____2583,uu____2584) ->
                (match ml_let.FStar_Extraction_ML_Syntax.expr with
                 | FStar_Extraction_ML_Syntax.MLE_Let
                     ((flavor,bindings),uu____2593) ->
                     let flags1 = FStar_List.choose flag_of_qual quals  in
                     let flags' = extract_metadata attrs  in
                     let uu____2610 =
                       FStar_List.fold_left2
                         (fun uu____2636  ->
                            fun ml_lb  ->
                              fun uu____2638  ->
                                match (uu____2636, uu____2638) with
                                | ((env,ml_lbs),{
                                                  FStar_Syntax_Syntax.lbname
                                                    = lbname;
                                                  FStar_Syntax_Syntax.lbunivs
                                                    = uu____2660;
                                                  FStar_Syntax_Syntax.lbtyp =
                                                    t;
                                                  FStar_Syntax_Syntax.lbeff =
                                                    uu____2662;
                                                  FStar_Syntax_Syntax.lbdef =
                                                    uu____2663;
                                                  FStar_Syntax_Syntax.lbattrs
                                                    = uu____2664;
                                                  FStar_Syntax_Syntax.lbpos =
                                                    uu____2665;_})
                                    ->
                                    let uu____2690 =
                                      FStar_All.pipe_right
                                        ml_lb.FStar_Extraction_ML_Syntax.mllb_meta
                                        (FStar_List.contains
                                           FStar_Extraction_ML_Syntax.Erased)
                                       in
                                    if uu____2690
                                    then (env, ml_lbs)
                                    else
                                      (let lb_lid =
                                         let uu____2703 =
                                           let uu____2706 =
                                             FStar_Util.right lbname  in
                                           uu____2706.FStar_Syntax_Syntax.fv_name
                                            in
                                         uu____2703.FStar_Syntax_Syntax.v  in
                                       let flags'' =
                                         let uu____2710 =
                                           let uu____2711 =
                                             FStar_Syntax_Subst.compress t
                                              in
                                           uu____2711.FStar_Syntax_Syntax.n
                                            in
                                         match uu____2710 with
                                         | FStar_Syntax_Syntax.Tm_arrow
                                             (uu____2716,{
                                                           FStar_Syntax_Syntax.n
                                                             =
                                                             FStar_Syntax_Syntax.Comp
                                                             {
                                                               FStar_Syntax_Syntax.comp_univs
                                                                 = uu____2717;
                                                               FStar_Syntax_Syntax.effect_name
                                                                 = e;
                                                               FStar_Syntax_Syntax.result_typ
                                                                 = uu____2719;
                                                               FStar_Syntax_Syntax.effect_args
                                                                 = uu____2720;
                                                               FStar_Syntax_Syntax.flags
                                                                 = uu____2721;_};
                                                           FStar_Syntax_Syntax.pos
                                                             = uu____2722;
                                                           FStar_Syntax_Syntax.vars
                                                             = uu____2723;_})
                                             when
                                             let uu____2752 =
                                               FStar_Ident.string_of_lid e
                                                in
                                             uu____2752 =
                                               "FStar.HyperStack.ST.StackInline"
                                             ->
                                             [FStar_Extraction_ML_Syntax.StackInline]
                                         | uu____2753 -> []  in
                                       let meta =
                                         FStar_List.append flags1
                                           (FStar_List.append flags' flags'')
                                          in
                                       let ml_lb1 =
                                         let uu___101_2758 = ml_lb  in
                                         {
                                           FStar_Extraction_ML_Syntax.mllb_name
                                             =
                                             (uu___101_2758.FStar_Extraction_ML_Syntax.mllb_name);
                                           FStar_Extraction_ML_Syntax.mllb_tysc
                                             =
                                             (uu___101_2758.FStar_Extraction_ML_Syntax.mllb_tysc);
                                           FStar_Extraction_ML_Syntax.mllb_add_unit
                                             =
                                             (uu___101_2758.FStar_Extraction_ML_Syntax.mllb_add_unit);
                                           FStar_Extraction_ML_Syntax.mllb_def
                                             =
                                             (uu___101_2758.FStar_Extraction_ML_Syntax.mllb_def);
                                           FStar_Extraction_ML_Syntax.mllb_meta
                                             = meta;
                                           FStar_Extraction_ML_Syntax.print_typ
                                             =
                                             (uu___101_2758.FStar_Extraction_ML_Syntax.print_typ)
                                         }  in
                                       let uu____2759 =
                                         let uu____2764 =
                                           FStar_All.pipe_right quals
                                             (FStar_Util.for_some
                                                (fun uu___98_2769  ->
                                                   match uu___98_2769 with
                                                   | FStar_Syntax_Syntax.Projector
                                                       uu____2770 -> true
                                                   | uu____2775 -> false))
                                            in
                                         if uu____2764
                                         then
                                           let mname =
                                             let uu____2787 =
                                               mangle_projector_lid lb_lid
                                                in
                                             FStar_All.pipe_right uu____2787
                                               FStar_Extraction_ML_Syntax.mlpath_of_lident
                                              in
                                           let uu____2794 =
                                             let uu____2799 =
                                               FStar_Util.right lbname  in
                                             let uu____2800 =
                                               FStar_Util.must
                                                 ml_lb1.FStar_Extraction_ML_Syntax.mllb_tysc
                                                in
                                             FStar_Extraction_ML_UEnv.extend_fv'
                                               env uu____2799 mname
                                               uu____2800
                                               ml_lb1.FStar_Extraction_ML_Syntax.mllb_add_unit
                                               false
                                              in
                                           match uu____2794 with
                                           | (env1,uu____2806) ->
                                               (env1,
                                                 (let uu___102_2808 = ml_lb1
                                                     in
                                                  {
                                                    FStar_Extraction_ML_Syntax.mllb_name
                                                      =
                                                      (FStar_Pervasives_Native.snd
                                                         mname);
                                                    FStar_Extraction_ML_Syntax.mllb_tysc
                                                      =
                                                      (uu___102_2808.FStar_Extraction_ML_Syntax.mllb_tysc);
                                                    FStar_Extraction_ML_Syntax.mllb_add_unit
                                                      =
                                                      (uu___102_2808.FStar_Extraction_ML_Syntax.mllb_add_unit);
                                                    FStar_Extraction_ML_Syntax.mllb_def
                                                      =
                                                      (uu___102_2808.FStar_Extraction_ML_Syntax.mllb_def);
                                                    FStar_Extraction_ML_Syntax.mllb_meta
                                                      =
                                                      (uu___102_2808.FStar_Extraction_ML_Syntax.mllb_meta);
                                                    FStar_Extraction_ML_Syntax.print_typ
                                                      =
                                                      (uu___102_2808.FStar_Extraction_ML_Syntax.print_typ)
                                                  }))
                                         else
                                           (let uu____2812 =
                                              let uu____2813 =
                                                let uu____2818 =
                                                  FStar_Util.must
                                                    ml_lb1.FStar_Extraction_ML_Syntax.mllb_tysc
                                                   in
                                                FStar_Extraction_ML_UEnv.extend_lb
                                                  env lbname t uu____2818
                                                  ml_lb1.FStar_Extraction_ML_Syntax.mllb_add_unit
                                                  false
                                                 in
                                              FStar_All.pipe_left
                                                FStar_Pervasives_Native.fst
                                                uu____2813
                                               in
                                            (uu____2812, ml_lb1))
                                          in
                                       match uu____2759 with
                                       | (g1,ml_lb2) ->
                                           (g1, (ml_lb2 :: ml_lbs)))) 
                         (g, []) bindings (FStar_Pervasives_Native.snd lbs)
                        in
                     (match uu____2610 with
                      | (g1,ml_lbs') ->
                          let uu____2849 =
                            let uu____2852 =
                              let uu____2855 =
                                let uu____2856 =
                                  FStar_Extraction_ML_Util.mlloc_of_range
                                    se.FStar_Syntax_Syntax.sigrng
                                   in
                                FStar_Extraction_ML_Syntax.MLM_Loc uu____2856
                                 in
                              [uu____2855;
                              FStar_Extraction_ML_Syntax.MLM_Let
                                (flavor, (FStar_List.rev ml_lbs'))]
                               in
                            let uu____2859 = maybe_register_plugin g1 se  in
                            FStar_List.append uu____2852 uu____2859  in
                          (g1, uu____2849))
                 | uu____2864 ->
                     let uu____2865 =
                       let uu____2866 =
                         FStar_Extraction_ML_Code.string_of_mlexpr
                           g.FStar_Extraction_ML_UEnv.currentModule ml_let
                          in
                       FStar_Util.format1
                         "Impossible: Translated a let to a non-let: %s"
                         uu____2866
                        in
                     failwith uu____2865))
       | FStar_Syntax_Syntax.Sig_declare_typ (lid,uu____2874,t) ->
           let quals = se.FStar_Syntax_Syntax.sigquals  in
           let uu____2879 =
             (FStar_All.pipe_right quals
                (FStar_List.contains FStar_Syntax_Syntax.Assumption))
               &&
               (let uu____2883 =
                  FStar_TypeChecker_Util.must_erase_for_extraction
                    g.FStar_Extraction_ML_UEnv.tcenv t
                   in
                Prims.op_Negation uu____2883)
              in
           if uu____2879
           then
             let always_fail =
               let imp =
                 let uu____2894 = FStar_Syntax_Util.arrow_formals t  in
                 match uu____2894 with
                 | ([],t1) ->
                     let b =
                       let uu____2929 =
                         FStar_Syntax_Syntax.gen_bv "_"
                           FStar_Pervasives_Native.None t1
                          in
                       FStar_All.pipe_left FStar_Syntax_Syntax.mk_binder
                         uu____2929
                        in
                     let uu____2934 = fail_exp lid t1  in
                     FStar_Syntax_Util.abs [b] uu____2934
                       FStar_Pervasives_Native.None
                 | (bs,t1) ->
                     let uu____2963 = fail_exp lid t1  in
                     FStar_Syntax_Util.abs bs uu____2963
                       FStar_Pervasives_Native.None
                  in
               let uu___103_2966 = se  in
               let uu____2967 =
                 let uu____2968 =
                   let uu____2975 =
                     let uu____2976 =
                       let uu____2979 =
                         let uu____2980 =
                           let uu____2985 =
                             FStar_Syntax_Syntax.lid_as_fv lid
                               FStar_Syntax_Syntax.delta_constant
                               FStar_Pervasives_Native.None
                              in
                           FStar_Util.Inr uu____2985  in
                         {
                           FStar_Syntax_Syntax.lbname = uu____2980;
                           FStar_Syntax_Syntax.lbunivs = [];
                           FStar_Syntax_Syntax.lbtyp = t;
                           FStar_Syntax_Syntax.lbeff =
                             FStar_Parser_Const.effect_ML_lid;
                           FStar_Syntax_Syntax.lbdef = imp;
                           FStar_Syntax_Syntax.lbattrs = [];
                           FStar_Syntax_Syntax.lbpos =
                             (imp.FStar_Syntax_Syntax.pos)
                         }  in
                       [uu____2979]  in
                     (false, uu____2976)  in
                   (uu____2975, [])  in
                 FStar_Syntax_Syntax.Sig_let uu____2968  in
               {
                 FStar_Syntax_Syntax.sigel = uu____2967;
                 FStar_Syntax_Syntax.sigrng =
                   (uu___103_2966.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___103_2966.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___103_2966.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___103_2966.FStar_Syntax_Syntax.sigattrs)
               }  in
             let uu____2992 = extract_sig g always_fail  in
             (match uu____2992 with
              | (g1,mlm) ->
                  let uu____3011 =
                    FStar_Util.find_map quals
                      (fun uu___99_3016  ->
                         match uu___99_3016 with
                         | FStar_Syntax_Syntax.Discriminator l ->
                             FStar_Pervasives_Native.Some l
                         | uu____3020 -> FStar_Pervasives_Native.None)
                     in
                  (match uu____3011 with
                   | FStar_Pervasives_Native.Some l ->
                       let uu____3028 =
                         let uu____3031 =
                           let uu____3032 =
                             FStar_Extraction_ML_Util.mlloc_of_range
                               se.FStar_Syntax_Syntax.sigrng
                              in
                           FStar_Extraction_ML_Syntax.MLM_Loc uu____3032  in
                         let uu____3033 =
                           let uu____3036 =
                             FStar_Extraction_ML_Term.ind_discriminator_body
                               g1 lid l
                              in
                           [uu____3036]  in
                         uu____3031 :: uu____3033  in
                       (g1, uu____3028)
                   | uu____3039 ->
                       let uu____3042 =
                         FStar_Util.find_map quals
                           (fun uu___100_3048  ->
                              match uu___100_3048 with
                              | FStar_Syntax_Syntax.Projector (l,uu____3052)
                                  -> FStar_Pervasives_Native.Some l
                              | uu____3053 -> FStar_Pervasives_Native.None)
                          in
                       (match uu____3042 with
                        | FStar_Pervasives_Native.Some uu____3060 -> (g1, [])
                        | uu____3063 -> (g1, mlm))))
           else (g, [])
       | FStar_Syntax_Syntax.Sig_main e ->
           let uu____3072 = FStar_Extraction_ML_Term.term_as_mlexpr g e  in
           (match uu____3072 with
            | (ml_main,uu____3086,uu____3087) ->
                let uu____3088 =
                  let uu____3091 =
                    let uu____3092 =
                      FStar_Extraction_ML_Util.mlloc_of_range
                        se.FStar_Syntax_Syntax.sigrng
                       in
                    FStar_Extraction_ML_Syntax.MLM_Loc uu____3092  in
                  [uu____3091; FStar_Extraction_ML_Syntax.MLM_Top ml_main]
                   in
                (g, uu____3088))
       | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____3095 ->
           failwith "impossible -- removed by tc.fs"
       | FStar_Syntax_Syntax.Sig_assume uu____3102 -> (g, [])
       | FStar_Syntax_Syntax.Sig_sub_effect uu____3111 -> (g, [])
       | FStar_Syntax_Syntax.Sig_effect_abbrev uu____3114 -> (g, [])
       | FStar_Syntax_Syntax.Sig_pragma p ->
           (FStar_Syntax_Util.process_pragma p se.FStar_Syntax_Syntax.sigrng;
            (g, [])))
  
let (extract_iface :
  FStar_Extraction_ML_UEnv.env -> FStar_Syntax_Syntax.modul -> env_t) =
  fun g  ->
    fun m  ->
      let uu____3143 =
        FStar_Util.fold_map extract_sig g m.FStar_Syntax_Syntax.declarations
         in
      FStar_All.pipe_right uu____3143 FStar_Pervasives_Native.fst
  
let (extract' :
  FStar_Extraction_ML_UEnv.env ->
    FStar_Syntax_Syntax.modul ->
      (FStar_Extraction_ML_UEnv.env,FStar_Extraction_ML_Syntax.mllib
                                      Prims.list)
        FStar_Pervasives_Native.tuple2)
  =
  fun g  ->
    fun m  ->
      FStar_Syntax_Syntax.reset_gensym ();
      (let uu____3189 = FStar_Options.restore_cmd_line_options true  in
       let name =
         FStar_Extraction_ML_Syntax.mlpath_of_lident
           m.FStar_Syntax_Syntax.name
          in
       let g1 =
         let uu___104_3192 = g  in
         let uu____3193 =
           FStar_TypeChecker_Env.set_current_module
             g.FStar_Extraction_ML_UEnv.tcenv m.FStar_Syntax_Syntax.name
            in
         {
           FStar_Extraction_ML_UEnv.tcenv = uu____3193;
           FStar_Extraction_ML_UEnv.gamma =
             (uu___104_3192.FStar_Extraction_ML_UEnv.gamma);
           FStar_Extraction_ML_UEnv.tydefs =
             (uu___104_3192.FStar_Extraction_ML_UEnv.tydefs);
           FStar_Extraction_ML_UEnv.type_names =
             (uu___104_3192.FStar_Extraction_ML_UEnv.type_names);
           FStar_Extraction_ML_UEnv.currentModule = name
         }  in
       let uu____3194 =
         FStar_Util.fold_map extract_sig g1
           m.FStar_Syntax_Syntax.declarations
          in
       match uu____3194 with
       | (g2,sigs) ->
           let mlm = FStar_List.flatten sigs  in
           let is_kremlin =
             let uu____3223 = FStar_Options.codegen ()  in
             uu____3223 =
               (FStar_Pervasives_Native.Some FStar_Options.Kremlin)
              in
           let uu____3228 =
             (((m.FStar_Syntax_Syntax.name).FStar_Ident.str <> "Prims") &&
                (is_kremlin ||
                   (Prims.op_Negation m.FStar_Syntax_Syntax.is_interface)))
               &&
               (FStar_Options.should_extract
                  (m.FStar_Syntax_Syntax.name).FStar_Ident.str)
              in
           if uu____3228
           then
             ((let uu____3236 =
                 FStar_Syntax_Print.lid_to_string m.FStar_Syntax_Syntax.name
                  in
               FStar_Util.print1 "Extracted module %s\n" uu____3236);
              (g2,
                [FStar_Extraction_ML_Syntax.MLLib
                   [(name, (FStar_Pervasives_Native.Some ([], mlm)),
                      (FStar_Extraction_ML_Syntax.MLLib []))]]))
           else (g2, []))
  
let (extract :
  FStar_Extraction_ML_UEnv.env ->
    FStar_Syntax_Syntax.modul ->
      (FStar_Extraction_ML_UEnv.env,FStar_Extraction_ML_Syntax.mllib
                                      Prims.list)
        FStar_Pervasives_Native.tuple2)
  =
  fun g  ->
    fun m  ->
      let uu____3304 = FStar_Options.debug_any ()  in
      if uu____3304
      then
        let msg =
          let uu____3312 =
            FStar_Syntax_Print.lid_to_string m.FStar_Syntax_Syntax.name  in
          FStar_Util.format1 "Extracting module %s\n" uu____3312  in
        FStar_Util.measure_execution_time msg
          (fun uu____3320  -> extract' g m)
      else extract' g m
  