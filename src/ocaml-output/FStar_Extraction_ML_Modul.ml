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
            let uu____37 =
              let uu____40 = FStar_Syntax_Syntax.iarg t  in
              let uu____41 =
                let uu____44 =
                  let uu____45 =
                    let uu____46 =
                      let uu____53 =
                        let uu____54 =
                          let uu____55 =
                            let uu____60 =
                              let uu____61 =
                                FStar_Syntax_Print.lid_to_string lid  in
                              Prims.strcat "Not yet implemented:" uu____61
                               in
                            (uu____60, FStar_Range.dummyRange)  in
                          FStar_Const.Const_string uu____55  in
                        FStar_Syntax_Syntax.Tm_constant uu____54  in
                      FStar_Syntax_Syntax.mk uu____53  in
                    uu____46 FStar_Pervasives_Native.None
                      FStar_Range.dummyRange
                     in
                  FStar_All.pipe_left FStar_Syntax_Syntax.as_arg uu____45  in
                [uu____44]  in
              uu____40 :: uu____41  in
            (uu____36, uu____37)  in
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
  'Auu____84 .
    'Auu____84 Prims.list ->
      ('Auu____84,'Auu____84) FStar_Pervasives_Native.tuple2
  =
  fun uu___91_95  ->
    match uu___91_95 with
    | a::b::[] -> (a, b)
    | uu____100 -> failwith "Expected a list with 2 elements"
  
let (flag_of_qual :
  FStar_Syntax_Syntax.qualifier ->
    FStar_Extraction_ML_Syntax.meta FStar_Pervasives_Native.option)
  =
  fun uu___92_113  ->
    match uu___92_113 with
    | FStar_Syntax_Syntax.Assumption  ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.Assumed
    | FStar_Syntax_Syntax.Private  ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.Private
    | FStar_Syntax_Syntax.NoExtract  ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.NoExtract
    | uu____116 -> FStar_Pervasives_Native.None
  
let rec (extract_meta :
  FStar_Syntax_Syntax.term ->
    FStar_Extraction_ML_Syntax.meta FStar_Pervasives_Native.option)
  =
  fun x  ->
    let uu____124 = FStar_Syntax_Subst.compress x  in
    match uu____124 with
    | { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
        FStar_Syntax_Syntax.pos = uu____128;
        FStar_Syntax_Syntax.vars = uu____129;_} ->
        let uu____132 =
          let uu____133 = FStar_Syntax_Syntax.lid_of_fv fv  in
          FStar_Ident.string_of_lid uu____133  in
        (match uu____132 with
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
         | uu____136 -> FStar_Pervasives_Native.None)
    | {
        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_app
          ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
             FStar_Syntax_Syntax.pos = uu____138;
             FStar_Syntax_Syntax.vars = uu____139;_},({
                                                        FStar_Syntax_Syntax.n
                                                          =
                                                          FStar_Syntax_Syntax.Tm_constant
                                                          (FStar_Const.Const_string
                                                          (s,uu____141));
                                                        FStar_Syntax_Syntax.pos
                                                          = uu____142;
                                                        FStar_Syntax_Syntax.vars
                                                          = uu____143;_},uu____144)::[]);
        FStar_Syntax_Syntax.pos = uu____145;
        FStar_Syntax_Syntax.vars = uu____146;_} ->
        let uu____177 =
          let uu____178 = FStar_Syntax_Syntax.lid_of_fv fv  in
          FStar_Ident.string_of_lid uu____178  in
        (match uu____177 with
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
         | uu____181 -> FStar_Pervasives_Native.None)
    | {
        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
          (FStar_Const.Const_string ("KremlinPrivate",uu____182));
        FStar_Syntax_Syntax.pos = uu____183;
        FStar_Syntax_Syntax.vars = uu____184;_} ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.Private
    | {
        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
          (FStar_Const.Const_string ("c_inline",uu____187));
        FStar_Syntax_Syntax.pos = uu____188;
        FStar_Syntax_Syntax.vars = uu____189;_} ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.CInline
    | {
        FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
          (FStar_Const.Const_string ("substitute",uu____192));
        FStar_Syntax_Syntax.pos = uu____193;
        FStar_Syntax_Syntax.vars = uu____194;_} ->
        FStar_Pervasives_Native.Some FStar_Extraction_ML_Syntax.Substitute
    | { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_meta (x1,uu____198);
        FStar_Syntax_Syntax.pos = uu____199;
        FStar_Syntax_Syntax.vars = uu____200;_} -> extract_meta x1
    | uu____207 -> FStar_Pervasives_Native.None
  
let (extract_metadata :
  FStar_Syntax_Syntax.term Prims.list ->
    FStar_Extraction_ML_Syntax.meta Prims.list)
  = fun metas  -> FStar_List.choose extract_meta metas 
let binders_as_mlty_binders :
  'Auu____225 .
    FStar_Extraction_ML_UEnv.env ->
      (FStar_Syntax_Syntax.bv,'Auu____225) FStar_Pervasives_Native.tuple2
        Prims.list ->
        (FStar_Extraction_ML_UEnv.env,Prims.string Prims.list)
          FStar_Pervasives_Native.tuple2
  =
  fun env  ->
    fun bs  ->
      FStar_Util.fold_map
        (fun env1  ->
           fun uu____265  ->
             match uu____265 with
             | (bv,uu____275) ->
                 let uu____276 =
                   let uu____277 =
                     let uu____280 =
                       let uu____281 =
                         FStar_Extraction_ML_UEnv.bv_as_ml_tyvar bv  in
                       FStar_Extraction_ML_Syntax.MLTY_Var uu____281  in
                     FStar_Pervasives_Native.Some uu____280  in
                   FStar_Extraction_ML_UEnv.extend_ty env1 bv uu____277  in
                 let uu____282 = FStar_Extraction_ML_UEnv.bv_as_ml_tyvar bv
                    in
                 (uu____276, uu____282)) env bs
  
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
              let uu____324 =
                let uu____325 = FStar_Syntax_Subst.compress def  in
                FStar_All.pipe_right uu____325 FStar_Syntax_Util.unmeta  in
              FStar_All.pipe_right uu____324 FStar_Syntax_Util.un_uinst  in
            let def2 =
              match def1.FStar_Syntax_Syntax.n with
              | FStar_Syntax_Syntax.Tm_abs uu____327 ->
                  FStar_Extraction_ML_Term.normalize_abs def1
              | uu____344 -> def1  in
            let uu____345 =
              match def2.FStar_Syntax_Syntax.n with
              | FStar_Syntax_Syntax.Tm_abs (bs,body,uu____356) ->
                  FStar_Syntax_Subst.open_term bs body
              | uu____377 -> ([], def2)  in
            match uu____345 with
            | (bs,body) ->
                let assumed =
                  FStar_Util.for_some
                    (fun uu___93_398  ->
                       match uu___93_398 with
                       | FStar_Syntax_Syntax.Assumption  -> true
                       | uu____399 -> false) quals
                   in
                let uu____400 = binders_as_mlty_binders env bs  in
                (match uu____400 with
                 | (env1,ml_bs) ->
                     let body1 =
                       let uu____420 =
                         FStar_Extraction_ML_Term.term_as_mlty env1 body  in
                       FStar_All.pipe_right uu____420
                         (FStar_Extraction_ML_Util.eraseTypeDeep
                            (FStar_Extraction_ML_Util.udelta_unfold env1))
                        in
                     let mangled_projector =
                       let uu____424 =
                         FStar_All.pipe_right quals
                           (FStar_Util.for_some
                              (fun uu___94_429  ->
                                 match uu___94_429 with
                                 | FStar_Syntax_Syntax.Projector uu____430 ->
                                     true
                                 | uu____435 -> false))
                          in
                       if uu____424
                       then
                         let mname = mangle_projector_lid lid  in
                         FStar_Pervasives_Native.Some
                           ((mname.FStar_Ident.ident).FStar_Ident.idText)
                       else FStar_Pervasives_Native.None  in
                     let metadata =
                       let uu____443 = extract_metadata attrs  in
                       let uu____446 = FStar_List.choose flag_of_qual quals
                          in
                       FStar_List.append uu____443 uu____446  in
                     let td =
                       let uu____472 =
                         let uu____493 = lident_as_mlsymbol lid  in
                         (assumed, uu____493, mangled_projector, ml_bs,
                           metadata,
                           (FStar_Pervasives_Native.Some
                              (FStar_Extraction_ML_Syntax.MLTD_Abbrev body1)))
                          in
                       [uu____472]  in
                     let def3 =
                       let uu____545 =
                         let uu____546 =
                           let uu____547 = FStar_Ident.range_of_lid lid  in
                           FStar_Extraction_ML_Util.mlloc_of_range uu____547
                            in
                         FStar_Extraction_ML_Syntax.MLM_Loc uu____546  in
                       [uu____545; FStar_Extraction_ML_Syntax.MLM_Ty td]  in
                     let env2 =
                       let uu____549 =
                         FStar_All.pipe_right quals
                           (FStar_Util.for_some
                              (fun uu___95_553  ->
                                 match uu___95_553 with
                                 | FStar_Syntax_Syntax.Assumption  -> true
                                 | FStar_Syntax_Syntax.New  -> true
                                 | uu____554 -> false))
                          in
                       if uu____549
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
    let uu____719 = FStar_Syntax_Print.lid_to_string i.iname  in
    let uu____720 = FStar_Syntax_Print.binders_to_string " " i.iparams  in
    let uu____721 = FStar_Syntax_Print.term_to_string i.ityp  in
    let uu____722 =
      let uu____723 =
        FStar_All.pipe_right i.idatas
          (FStar_List.map
             (fun d  ->
                let uu____734 = FStar_Syntax_Print.lid_to_string d.dname  in
                let uu____735 =
                  let uu____736 = FStar_Syntax_Print.term_to_string d.dtyp
                     in
                  Prims.strcat " : " uu____736  in
                Prims.strcat uu____734 uu____735))
         in
      FStar_All.pipe_right uu____723 (FStar_String.concat "\n\t\t")  in
    FStar_Util.print4 "\n\t%s %s : %s { %s }\n" uu____719 uu____720 uu____721
      uu____722
  
let bundle_as_inductive_families :
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
          let uu____784 =
            FStar_Util.fold_map
              (fun env1  ->
                 fun se  ->
                   match se.FStar_Syntax_Syntax.sigel with
                   | FStar_Syntax_Syntax.Sig_inductive_typ
                       (l,_us,bs,t,_mut_i,datas) ->
                       let uu____831 = FStar_Syntax_Subst.open_term bs t  in
                       (match uu____831 with
                        | (bs1,t1) ->
                            let datas1 =
                              FStar_All.pipe_right ses
                                (FStar_List.collect
                                   (fun se1  ->
                                      match se1.FStar_Syntax_Syntax.sigel
                                      with
                                      | FStar_Syntax_Syntax.Sig_datacon
                                          (d,uu____870,t2,l',nparams,uu____874)
                                          when FStar_Ident.lid_equals l l' ->
                                          let uu____879 =
                                            FStar_Syntax_Util.arrow_formals
                                              t2
                                             in
                                          (match uu____879 with
                                           | (bs',body) ->
                                               let uu____912 =
                                                 FStar_Util.first_N
                                                   (FStar_List.length bs1)
                                                   bs'
                                                  in
                                               (match uu____912 with
                                                | (bs_params,rest) ->
                                                    let subst1 =
                                                      FStar_List.map2
                                                        (fun uu____983  ->
                                                           fun uu____984  ->
                                                             match (uu____983,
                                                                    uu____984)
                                                             with
                                                             | ((b',uu____1002),
                                                                (b,uu____1004))
                                                                 ->
                                                                 let uu____1013
                                                                   =
                                                                   let uu____1020
                                                                    =
                                                                    FStar_Syntax_Syntax.bv_to_name
                                                                    b  in
                                                                   (b',
                                                                    uu____1020)
                                                                    in
                                                                 FStar_Syntax_Syntax.NT
                                                                   uu____1013)
                                                        bs_params bs1
                                                       in
                                                    let t3 =
                                                      let uu____1022 =
                                                        let uu____1025 =
                                                          FStar_Syntax_Syntax.mk_Total
                                                            body
                                                           in
                                                        FStar_Syntax_Util.arrow
                                                          rest uu____1025
                                                         in
                                                      FStar_All.pipe_right
                                                        uu____1022
                                                        (FStar_Syntax_Subst.subst
                                                           subst1)
                                                       in
                                                    [{ dname = d; dtyp = t3 }]))
                                      | uu____1030 -> []))
                               in
                            let metadata =
                              extract_metadata
                                (FStar_List.append
                                   se.FStar_Syntax_Syntax.sigattrs attrs)
                               in
                            let env2 =
                              let uu____1035 =
                                FStar_Syntax_Syntax.lid_as_fv l
                                  FStar_Syntax_Syntax.delta_constant
                                  FStar_Pervasives_Native.None
                                 in
                              FStar_Extraction_ML_UEnv.extend_type_name env1
                                uu____1035
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
                   | uu____1038 -> (env1, [])) env ses
             in
          match uu____784 with
          | (env1,ifams) -> (env1, (FStar_List.flatten ifams))
  
type env_t = FStar_Extraction_ML_UEnv.env
let (extract_bundle :
  env_t ->
    FStar_Syntax_Syntax.sigelt ->
      (env_t,FStar_Extraction_ML_Syntax.mlmodule1 Prims.list)
        FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun se  ->
      let extract_ctor ml_tyvars env1 ctor =
        let mlt =
          let uu____1124 =
            FStar_Extraction_ML_Term.term_as_mlty env1 ctor.dtyp  in
          FStar_Extraction_ML_Util.eraseTypeDeep
            (FStar_Extraction_ML_Util.udelta_unfold env1) uu____1124
           in
        let steps =
          [FStar_TypeChecker_Normalize.Inlining;
          FStar_TypeChecker_Normalize.UnfoldUntil
            FStar_Syntax_Syntax.delta_constant;
          FStar_TypeChecker_Normalize.EraseUniverses;
          FStar_TypeChecker_Normalize.AllowUnboundUniverses]  in
        let names1 =
          let uu____1131 =
            let uu____1132 =
              let uu____1135 =
                FStar_TypeChecker_Normalize.normalize steps
                  env1.FStar_Extraction_ML_UEnv.tcenv ctor.dtyp
                 in
              FStar_Syntax_Subst.compress uu____1135  in
            uu____1132.FStar_Syntax_Syntax.n  in
          match uu____1131 with
          | FStar_Syntax_Syntax.Tm_arrow (bs,uu____1139) ->
              FStar_List.map
                (fun uu____1165  ->
                   match uu____1165 with
                   | ({ FStar_Syntax_Syntax.ppname = ppname;
                        FStar_Syntax_Syntax.index = uu____1171;
                        FStar_Syntax_Syntax.sort = uu____1172;_},uu____1173)
                       -> ppname.FStar_Ident.idText) bs
          | uu____1176 -> []  in
        let tys = (ml_tyvars, mlt)  in
        let fvv = FStar_Extraction_ML_UEnv.mkFvvar ctor.dname ctor.dtyp  in
        let uu____1187 =
          let uu____1188 =
            FStar_Extraction_ML_UEnv.extend_fv env1 fvv tys false false  in
          FStar_Pervasives_Native.fst uu____1188  in
        let uu____1193 =
          let uu____1204 = lident_as_mlsymbol ctor.dname  in
          let uu____1205 =
            let uu____1212 = FStar_Extraction_ML_Util.argTypes mlt  in
            FStar_List.zip names1 uu____1212  in
          (uu____1204, uu____1205)  in
        (uu____1187, uu____1193)  in
      let extract_one_family env1 ind =
        let uu____1264 = binders_as_mlty_binders env1 ind.iparams  in
        match uu____1264 with
        | (env2,vars) ->
            let uu____1299 =
              FStar_All.pipe_right ind.idatas
                (FStar_Util.fold_map (extract_ctor vars) env2)
               in
            (match uu____1299 with
             | (env3,ctors) ->
                 let uu____1392 = FStar_Syntax_Util.arrow_formals ind.ityp
                    in
                 (match uu____1392 with
                  | (indices,uu____1428) ->
                      let ml_params =
                        let uu____1448 =
                          FStar_All.pipe_right indices
                            (FStar_List.mapi
                               (fun i  ->
                                  fun uu____1467  ->
                                    let uu____1472 =
                                      FStar_Util.string_of_int i  in
                                    Prims.strcat "'dummyV" uu____1472))
                           in
                        FStar_List.append vars uu____1448  in
                      let tbody =
                        let uu____1474 =
                          FStar_Util.find_opt
                            (fun uu___96_1479  ->
                               match uu___96_1479 with
                               | FStar_Syntax_Syntax.RecordType uu____1480 ->
                                   true
                               | uu____1489 -> false) ind.iquals
                           in
                        match uu____1474 with
                        | FStar_Pervasives_Native.Some
                            (FStar_Syntax_Syntax.RecordType (ns,ids)) ->
                            let uu____1500 = FStar_List.hd ctors  in
                            (match uu____1500 with
                             | (uu____1521,c_ty) ->
                                 let fields =
                                   FStar_List.map2
                                     (fun id1  ->
                                        fun uu____1558  ->
                                          match uu____1558 with
                                          | (uu____1567,ty) ->
                                              let lid =
                                                FStar_Ident.lid_of_ids
                                                  (FStar_List.append ns [id1])
                                                 in
                                              let uu____1570 =
                                                lident_as_mlsymbol lid  in
                                              (uu____1570, ty)) ids c_ty
                                    in
                                 FStar_Extraction_ML_Syntax.MLTD_Record
                                   fields)
                        | uu____1571 ->
                            FStar_Extraction_ML_Syntax.MLTD_DType ctors
                         in
                      let uu____1574 =
                        let uu____1593 = lident_as_mlsymbol ind.iname  in
                        (false, uu____1593, FStar_Pervasives_Native.None,
                          ml_params, (ind.imetadata),
                          (FStar_Pervasives_Native.Some tbody))
                         in
                      (env3, uu____1574)))
         in
      match ((se.FStar_Syntax_Syntax.sigel),
              (se.FStar_Syntax_Syntax.sigquals))
      with
      | (FStar_Syntax_Syntax.Sig_bundle
         ({
            FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_datacon
              (l,uu____1627,t,uu____1629,uu____1630,uu____1631);
            FStar_Syntax_Syntax.sigrng = uu____1632;
            FStar_Syntax_Syntax.sigquals = uu____1633;
            FStar_Syntax_Syntax.sigmeta = uu____1634;
            FStar_Syntax_Syntax.sigattrs = uu____1635;_}::[],uu____1636),(FStar_Syntax_Syntax.ExceptionConstructor
         )::[]) ->
          let uu____1653 = extract_ctor [] env { dname = l; dtyp = t }  in
          (match uu____1653 with
           | (env1,ctor) -> (env1, [FStar_Extraction_ML_Syntax.MLM_Exn ctor]))
      | (FStar_Syntax_Syntax.Sig_bundle (ses,uu____1699),quals) ->
          let uu____1713 =
            bundle_as_inductive_families env ses quals
              se.FStar_Syntax_Syntax.sigattrs
             in
          (match uu____1713 with
           | (env1,ifams) ->
               let uu____1734 =
                 FStar_Util.fold_map extract_one_family env1 ifams  in
               (match uu____1734 with
                | (env2,td) -> (env2, [FStar_Extraction_ML_Syntax.MLM_Ty td])))
      | uu____1827 -> failwith "Unexpected signature element"
  
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
      let uu____1859 =
        (let uu____1862 = FStar_Options.codegen ()  in
         uu____1862 <> (FStar_Pervasives_Native.Some FStar_Options.Plugin))
          ||
          (let uu____1868 =
             FStar_Syntax_Util.has_attribute se.FStar_Syntax_Syntax.sigattrs
               FStar_Parser_Const.plugin_attr
              in
           Prims.op_Negation uu____1868)
         in
      if uu____1859
      then []
      else
        (match se.FStar_Syntax_Syntax.sigel with
         | FStar_Syntax_Syntax.Sig_let (lbs,lids) ->
             let mk_registration lb =
               let fv =
                 let uu____1891 =
                   let uu____1894 =
                     FStar_Util.right lb.FStar_Syntax_Syntax.lbname  in
                   uu____1894.FStar_Syntax_Syntax.fv_name  in
                 uu____1891.FStar_Syntax_Syntax.v  in
               let fv_t = lb.FStar_Syntax_Syntax.lbtyp  in
               let ml_name_str =
                 let uu____1899 =
                   let uu____1900 = FStar_Ident.string_of_lid fv  in
                   FStar_Extraction_ML_Syntax.MLC_String uu____1900  in
                 FStar_Extraction_ML_Syntax.MLE_Const uu____1899  in
               let uu____1901 =
                 FStar_Extraction_ML_Util.interpret_plugin_as_term_fun
                   g.FStar_Extraction_ML_UEnv.tcenv fv fv_t ml_name_str
                  in
               match uu____1901 with
               | FStar_Pervasives_Native.Some (interp,arity,plugin) ->
                   let register =
                     if plugin
                     then "FStar_Tactics_Native.register_plugin"
                     else "FStar_Tactics_Native.register_tactic"  in
                   let h =
                     let uu____1924 =
                       let uu____1925 =
                         let uu____1926 = FStar_Ident.lid_of_str register  in
                         FStar_Extraction_ML_Syntax.mlpath_of_lident
                           uu____1926
                          in
                       FStar_Extraction_ML_Syntax.MLE_Name uu____1925  in
                     FStar_All.pipe_left
                       (FStar_Extraction_ML_Syntax.with_ty
                          FStar_Extraction_ML_Syntax.MLTY_Top) uu____1924
                      in
                   let arity1 =
                     let uu____1928 =
                       let uu____1929 =
                         let uu____1940 = FStar_Util.string_of_int arity  in
                         (uu____1940, FStar_Pervasives_Native.None)  in
                       FStar_Extraction_ML_Syntax.MLC_Int uu____1929  in
                     FStar_Extraction_ML_Syntax.MLE_Const uu____1928  in
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
         | uu____1962 -> [])
  
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
           let uu____1989 = FStar_Syntax_Print.sigelt_to_string se  in
           FStar_Util.print1 ">>>> extract_sig %s \n" uu____1989);
      (match se.FStar_Syntax_Syntax.sigel with
       | FStar_Syntax_Syntax.Sig_bundle uu____1996 -> extract_bundle g se
       | FStar_Syntax_Syntax.Sig_inductive_typ uu____2005 ->
           extract_bundle g se
       | FStar_Syntax_Syntax.Sig_datacon uu____2022 -> extract_bundle g se
       | FStar_Syntax_Syntax.Sig_new_effect ed when
           FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
             (FStar_List.contains FStar_Syntax_Syntax.Reifiable)
           ->
           let extend_env g1 lid ml_name tm tysc =
             let uu____2070 =
               let uu____2075 =
                 FStar_Syntax_Syntax.lid_as_fv lid
                   FStar_Syntax_Syntax.delta_equational
                   FStar_Pervasives_Native.None
                  in
               FStar_Extraction_ML_UEnv.extend_fv' g1 uu____2075 ml_name tysc
                 false false
                in
             match uu____2070 with
             | (g2,mangled_name) ->
                 ((let uu____2083 =
                     FStar_All.pipe_left
                       (FStar_TypeChecker_Env.debug
                          g2.FStar_Extraction_ML_UEnv.tcenv)
                       (FStar_Options.Other "ExtractionReify")
                      in
                   if uu____2083
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
             (let uu____2099 =
                FStar_All.pipe_left
                  (FStar_TypeChecker_Env.debug
                     g.FStar_Extraction_ML_UEnv.tcenv)
                  (FStar_Options.Other "ExtractionReify")
                 in
              if uu____2099
              then
                let uu____2100 = FStar_Syntax_Print.term_to_string tm  in
                FStar_Util.print1 "extract_fv term: %s\n" uu____2100
              else ());
             (let uu____2102 =
                let uu____2103 = FStar_Syntax_Subst.compress tm  in
                uu____2103.FStar_Syntax_Syntax.n  in
              match uu____2102 with
              | FStar_Syntax_Syntax.Tm_uinst (tm1,uu____2111) ->
                  extract_fv tm1
              | FStar_Syntax_Syntax.Tm_fvar fv ->
                  let mlp =
                    FStar_Extraction_ML_Syntax.mlpath_of_lident
                      (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                     in
                  let uu____2118 =
                    let uu____2127 = FStar_Extraction_ML_UEnv.lookup_fv g fv
                       in
                    FStar_All.pipe_left FStar_Util.right uu____2127  in
                  (match uu____2118 with
                   | (uu____2184,uu____2185,tysc,uu____2187) ->
                       let uu____2188 =
                         FStar_All.pipe_left
                           (FStar_Extraction_ML_Syntax.with_ty
                              FStar_Extraction_ML_Syntax.MLTY_Top)
                           (FStar_Extraction_ML_Syntax.MLE_Name mlp)
                          in
                       (uu____2188, tysc))
              | uu____2189 -> failwith "Not an fv")
              in
           let extract_action g1 a =
             (let uu____2211 =
                FStar_All.pipe_left
                  (FStar_TypeChecker_Env.debug
                     g1.FStar_Extraction_ML_UEnv.tcenv)
                  (FStar_Options.Other "ExtractionReify")
                 in
              if uu____2211
              then
                let uu____2212 =
                  FStar_Syntax_Print.term_to_string
                    a.FStar_Syntax_Syntax.action_typ
                   in
                let uu____2213 =
                  FStar_Syntax_Print.term_to_string
                    a.FStar_Syntax_Syntax.action_defn
                   in
                FStar_Util.print2 "Action type %s and term %s\n" uu____2212
                  uu____2213
              else ());
             (let uu____2215 = FStar_Extraction_ML_UEnv.action_name ed a  in
              match uu____2215 with
              | (a_nm,a_lid) ->
                  let lbname =
                    let uu____2231 =
                      FStar_Syntax_Syntax.new_bv
                        (FStar_Pervasives_Native.Some
                           ((a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos))
                        FStar_Syntax_Syntax.tun
                       in
                    FStar_Util.Inl uu____2231  in
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
                  let uu____2255 =
                    FStar_Extraction_ML_Term.term_as_mlexpr g1 action_lb  in
                  (match uu____2255 with
                   | (a_let,uu____2267,ty) ->
                       ((let uu____2270 =
                           FStar_All.pipe_left
                             (FStar_TypeChecker_Env.debug
                                g1.FStar_Extraction_ML_UEnv.tcenv)
                             (FStar_Options.Other "ExtractionReify")
                            in
                         if uu____2270
                         then
                           let uu____2271 =
                             FStar_Extraction_ML_Code.string_of_mlexpr a_nm
                               a_let
                              in
                           FStar_Util.print1 "Extracted action term: %s\n"
                             uu____2271
                         else ());
                        (let uu____2273 =
                           match a_let.FStar_Extraction_ML_Syntax.expr with
                           | FStar_Extraction_ML_Syntax.MLE_Let
                               ((uu____2282,mllb::[]),uu____2284) ->
                               (match mllb.FStar_Extraction_ML_Syntax.mllb_tysc
                                with
                                | FStar_Pervasives_Native.Some tysc ->
                                    ((mllb.FStar_Extraction_ML_Syntax.mllb_def),
                                      tysc)
                                | FStar_Pervasives_Native.None  ->
                                    failwith "No type scheme")
                           | uu____2302 -> failwith "Impossible"  in
                         match uu____2273 with
                         | (exp,tysc) ->
                             ((let uu____2314 =
                                 FStar_All.pipe_left
                                   (FStar_TypeChecker_Env.debug
                                      g1.FStar_Extraction_ML_UEnv.tcenv)
                                   (FStar_Options.Other "ExtractionReify")
                                  in
                               if uu____2314
                               then
                                 ((let uu____2316 =
                                     FStar_Extraction_ML_Code.string_of_mlty
                                       a_nm
                                       (FStar_Pervasives_Native.snd tysc)
                                      in
                                   FStar_Util.print1
                                     "Extracted action type: %s\n" uu____2316);
                                  FStar_List.iter
                                    (fun x  ->
                                       FStar_Util.print1 "and binders: %s\n"
                                         x)
                                    (FStar_Pervasives_Native.fst tysc))
                               else ());
                              extend_env g1 a_lid a_nm exp tysc)))))
              in
           let uu____2320 =
             let uu____2325 =
               extract_fv
                 (FStar_Pervasives_Native.snd
                    ed.FStar_Syntax_Syntax.return_repr)
                in
             match uu____2325 with
             | (return_tm,ty_sc) ->
                 let uu____2338 =
                   FStar_Extraction_ML_UEnv.monad_op_name ed "return"  in
                 (match uu____2338 with
                  | (return_nm,return_lid) ->
                      extend_env g return_lid return_nm return_tm ty_sc)
              in
           (match uu____2320 with
            | (g1,return_decl) ->
                let uu____2357 =
                  let uu____2362 =
                    extract_fv
                      (FStar_Pervasives_Native.snd
                         ed.FStar_Syntax_Syntax.bind_repr)
                     in
                  match uu____2362 with
                  | (bind_tm,ty_sc) ->
                      let uu____2375 =
                        FStar_Extraction_ML_UEnv.monad_op_name ed "bind"  in
                      (match uu____2375 with
                       | (bind_nm,bind_lid) ->
                           extend_env g1 bind_lid bind_nm bind_tm ty_sc)
                   in
                (match uu____2357 with
                 | (g2,bind_decl) ->
                     let uu____2394 =
                       FStar_Util.fold_map extract_action g2
                         ed.FStar_Syntax_Syntax.actions
                        in
                     (match uu____2394 with
                      | (g3,actions) ->
                          (g3,
                            (FStar_List.append [return_decl; bind_decl]
                               actions)))))
       | FStar_Syntax_Syntax.Sig_splice uu____2415 ->
           failwith "impossible: trying to extract splice"
       | FStar_Syntax_Syntax.Sig_new_effect uu____2428 -> (g, [])
       | FStar_Syntax_Syntax.Sig_declare_typ (lid,uu____2432,t) when
           FStar_Extraction_ML_Term.is_arity g t ->
           let quals = se.FStar_Syntax_Syntax.sigquals  in
           let attrs = se.FStar_Syntax_Syntax.sigattrs  in
           let uu____2440 =
             let uu____2441 =
               FStar_All.pipe_right quals
                 (FStar_Util.for_some
                    (fun uu___97_2445  ->
                       match uu___97_2445 with
                       | FStar_Syntax_Syntax.Assumption  -> true
                       | uu____2446 -> false))
                in
             Prims.op_Negation uu____2441  in
           if uu____2440
           then (g, [])
           else
             (let uu____2456 = FStar_Syntax_Util.arrow_formals t  in
              match uu____2456 with
              | (bs,uu____2476) ->
                  let fv =
                    FStar_Syntax_Syntax.lid_as_fv lid
                      FStar_Syntax_Syntax.delta_constant
                      FStar_Pervasives_Native.None
                     in
                  let uu____2494 =
                    FStar_Syntax_Util.abs bs FStar_Syntax_Syntax.t_unit
                      FStar_Pervasives_Native.None
                     in
                  extract_typ_abbrev g fv quals attrs uu____2494)
       | FStar_Syntax_Syntax.Sig_let ((false ,lb::[]),uu____2496) when
           FStar_Extraction_ML_Term.is_arity g lb.FStar_Syntax_Syntax.lbtyp
           ->
           let quals = se.FStar_Syntax_Syntax.sigquals  in
           let uu____2512 =
             let uu____2521 =
               FStar_TypeChecker_Env.open_universes_in
                 g.FStar_Extraction_ML_UEnv.tcenv
                 lb.FStar_Syntax_Syntax.lbunivs
                 [lb.FStar_Syntax_Syntax.lbdef; lb.FStar_Syntax_Syntax.lbtyp]
                in
             match uu____2521 with
             | (tcenv,uu____2545,def_typ) ->
                 let uu____2551 = as_pair def_typ  in (tcenv, uu____2551)
              in
           (match uu____2512 with
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
                let uu____2575 =
                  FStar_Util.right lb.FStar_Syntax_Syntax.lbname  in
                extract_typ_abbrev g uu____2575 quals
                  se.FStar_Syntax_Syntax.sigattrs lbdef1)
       | FStar_Syntax_Syntax.Sig_let (lbs,uu____2577) ->
           let attrs = se.FStar_Syntax_Syntax.sigattrs  in
           let quals = se.FStar_Syntax_Syntax.sigquals  in
           let uu____2588 =
             let uu____2595 =
               FStar_Syntax_Syntax.mk
                 (FStar_Syntax_Syntax.Tm_let
                    (lbs, FStar_Syntax_Util.exp_false_bool))
                 FStar_Pervasives_Native.None se.FStar_Syntax_Syntax.sigrng
                in
             FStar_Extraction_ML_Term.term_as_mlexpr g uu____2595  in
           (match uu____2588 with
            | (ml_let,uu____2603,uu____2604) ->
                (match ml_let.FStar_Extraction_ML_Syntax.expr with
                 | FStar_Extraction_ML_Syntax.MLE_Let
                     ((flavor,bindings),uu____2613) ->
                     let flags1 = FStar_List.choose flag_of_qual quals  in
                     let flags' = extract_metadata attrs  in
                     let uu____2630 =
                       FStar_List.fold_left2
                         (fun uu____2656  ->
                            fun ml_lb  ->
                              fun uu____2658  ->
                                match (uu____2656, uu____2658) with
                                | ((env,ml_lbs),{
                                                  FStar_Syntax_Syntax.lbname
                                                    = lbname;
                                                  FStar_Syntax_Syntax.lbunivs
                                                    = uu____2680;
                                                  FStar_Syntax_Syntax.lbtyp =
                                                    t;
                                                  FStar_Syntax_Syntax.lbeff =
                                                    uu____2682;
                                                  FStar_Syntax_Syntax.lbdef =
                                                    uu____2683;
                                                  FStar_Syntax_Syntax.lbattrs
                                                    = uu____2684;
                                                  FStar_Syntax_Syntax.lbpos =
                                                    uu____2685;_})
                                    ->
                                    let uu____2710 =
                                      FStar_All.pipe_right
                                        ml_lb.FStar_Extraction_ML_Syntax.mllb_meta
                                        (FStar_List.contains
                                           FStar_Extraction_ML_Syntax.Erased)
                                       in
                                    if uu____2710
                                    then (env, ml_lbs)
                                    else
                                      (let lb_lid =
                                         let uu____2721 =
                                           let uu____2724 =
                                             FStar_Util.right lbname  in
                                           uu____2724.FStar_Syntax_Syntax.fv_name
                                            in
                                         uu____2721.FStar_Syntax_Syntax.v  in
                                       let flags'' =
                                         let uu____2728 =
                                           let uu____2729 =
                                             FStar_Syntax_Subst.compress t
                                              in
                                           uu____2729.FStar_Syntax_Syntax.n
                                            in
                                         match uu____2728 with
                                         | FStar_Syntax_Syntax.Tm_arrow
                                             (uu____2734,{
                                                           FStar_Syntax_Syntax.n
                                                             =
                                                             FStar_Syntax_Syntax.Comp
                                                             {
                                                               FStar_Syntax_Syntax.comp_univs
                                                                 = uu____2735;
                                                               FStar_Syntax_Syntax.effect_name
                                                                 = e;
                                                               FStar_Syntax_Syntax.result_typ
                                                                 = uu____2737;
                                                               FStar_Syntax_Syntax.effect_args
                                                                 = uu____2738;
                                                               FStar_Syntax_Syntax.flags
                                                                 = uu____2739;_};
                                                           FStar_Syntax_Syntax.pos
                                                             = uu____2740;
                                                           FStar_Syntax_Syntax.vars
                                                             = uu____2741;_})
                                             when
                                             let uu____2770 =
                                               FStar_Ident.string_of_lid e
                                                in
                                             uu____2770 =
                                               "FStar.HyperStack.ST.StackInline"
                                             ->
                                             [FStar_Extraction_ML_Syntax.StackInline]
                                         | uu____2771 -> []  in
                                       let meta =
                                         FStar_List.append flags1
                                           (FStar_List.append flags' flags'')
                                          in
                                       let ml_lb1 =
                                         let uu___101_2776 = ml_lb  in
                                         {
                                           FStar_Extraction_ML_Syntax.mllb_name
                                             =
                                             (uu___101_2776.FStar_Extraction_ML_Syntax.mllb_name);
                                           FStar_Extraction_ML_Syntax.mllb_tysc
                                             =
                                             (uu___101_2776.FStar_Extraction_ML_Syntax.mllb_tysc);
                                           FStar_Extraction_ML_Syntax.mllb_add_unit
                                             =
                                             (uu___101_2776.FStar_Extraction_ML_Syntax.mllb_add_unit);
                                           FStar_Extraction_ML_Syntax.mllb_def
                                             =
                                             (uu___101_2776.FStar_Extraction_ML_Syntax.mllb_def);
                                           FStar_Extraction_ML_Syntax.mllb_meta
                                             = meta;
                                           FStar_Extraction_ML_Syntax.print_typ
                                             =
                                             (uu___101_2776.FStar_Extraction_ML_Syntax.print_typ)
                                         }  in
                                       let uu____2777 =
                                         let uu____2782 =
                                           FStar_All.pipe_right quals
                                             (FStar_Util.for_some
                                                (fun uu___98_2787  ->
                                                   match uu___98_2787 with
                                                   | FStar_Syntax_Syntax.Projector
                                                       uu____2788 -> true
                                                   | uu____2793 -> false))
                                            in
                                         if uu____2782
                                         then
                                           let mname =
                                             let uu____2799 =
                                               mangle_projector_lid lb_lid
                                                in
                                             FStar_All.pipe_right uu____2799
                                               FStar_Extraction_ML_Syntax.mlpath_of_lident
                                              in
                                           let uu____2800 =
                                             let uu____2805 =
                                               FStar_Util.right lbname  in
                                             let uu____2806 =
                                               FStar_Util.must
                                                 ml_lb1.FStar_Extraction_ML_Syntax.mllb_tysc
                                                in
                                             FStar_Extraction_ML_UEnv.extend_fv'
                                               env uu____2805 mname
                                               uu____2806
                                               ml_lb1.FStar_Extraction_ML_Syntax.mllb_add_unit
                                               false
                                              in
                                           match uu____2800 with
                                           | (env1,uu____2812) ->
                                               (env1,
                                                 (let uu___102_2814 = ml_lb1
                                                     in
                                                  {
                                                    FStar_Extraction_ML_Syntax.mllb_name
                                                      =
                                                      (FStar_Pervasives_Native.snd
                                                         mname);
                                                    FStar_Extraction_ML_Syntax.mllb_tysc
                                                      =
                                                      (uu___102_2814.FStar_Extraction_ML_Syntax.mllb_tysc);
                                                    FStar_Extraction_ML_Syntax.mllb_add_unit
                                                      =
                                                      (uu___102_2814.FStar_Extraction_ML_Syntax.mllb_add_unit);
                                                    FStar_Extraction_ML_Syntax.mllb_def
                                                      =
                                                      (uu___102_2814.FStar_Extraction_ML_Syntax.mllb_def);
                                                    FStar_Extraction_ML_Syntax.mllb_meta
                                                      =
                                                      (uu___102_2814.FStar_Extraction_ML_Syntax.mllb_meta);
                                                    FStar_Extraction_ML_Syntax.print_typ
                                                      =
                                                      (uu___102_2814.FStar_Extraction_ML_Syntax.print_typ)
                                                  }))
                                         else
                                           (let uu____2818 =
                                              let uu____2819 =
                                                let uu____2824 =
                                                  FStar_Util.must
                                                    ml_lb1.FStar_Extraction_ML_Syntax.mllb_tysc
                                                   in
                                                FStar_Extraction_ML_UEnv.extend_lb
                                                  env lbname t uu____2824
                                                  ml_lb1.FStar_Extraction_ML_Syntax.mllb_add_unit
                                                  false
                                                 in
                                              FStar_All.pipe_left
                                                FStar_Pervasives_Native.fst
                                                uu____2819
                                               in
                                            (uu____2818, ml_lb1))
                                          in
                                       match uu____2777 with
                                       | (g1,ml_lb2) ->
                                           (g1, (ml_lb2 :: ml_lbs)))) 
                         (g, []) bindings (FStar_Pervasives_Native.snd lbs)
                        in
                     (match uu____2630 with
                      | (g1,ml_lbs') ->
                          let uu____2855 =
                            let uu____2858 =
                              let uu____2861 =
                                let uu____2862 =
                                  FStar_Extraction_ML_Util.mlloc_of_range
                                    se.FStar_Syntax_Syntax.sigrng
                                   in
                                FStar_Extraction_ML_Syntax.MLM_Loc uu____2862
                                 in
                              [uu____2861;
                              FStar_Extraction_ML_Syntax.MLM_Let
                                (flavor, (FStar_List.rev ml_lbs'))]
                               in
                            let uu____2865 = maybe_register_plugin g1 se  in
                            FStar_List.append uu____2858 uu____2865  in
                          (g1, uu____2855))
                 | uu____2870 ->
                     let uu____2871 =
                       let uu____2872 =
                         FStar_Extraction_ML_Code.string_of_mlexpr
                           g.FStar_Extraction_ML_UEnv.currentModule ml_let
                          in
                       FStar_Util.format1
                         "Impossible: Translated a let to a non-let: %s"
                         uu____2872
                        in
                     failwith uu____2871))
       | FStar_Syntax_Syntax.Sig_declare_typ (lid,uu____2880,t) ->
           let quals = se.FStar_Syntax_Syntax.sigquals  in
           let uu____2885 =
             (FStar_All.pipe_right quals
                (FStar_List.contains FStar_Syntax_Syntax.Assumption))
               &&
               (let uu____2889 =
                  FStar_TypeChecker_Util.must_erase_for_extraction
                    g.FStar_Extraction_ML_UEnv.tcenv t
                   in
                Prims.op_Negation uu____2889)
              in
           if uu____2885
           then
             let always_fail =
               let imp =
                 let uu____2898 = FStar_Syntax_Util.arrow_formals t  in
                 match uu____2898 with
                 | ([],t1) ->
                     let b =
                       let uu____2927 =
                         FStar_Syntax_Syntax.gen_bv "_"
                           FStar_Pervasives_Native.None t1
                          in
                       FStar_All.pipe_left FStar_Syntax_Syntax.mk_binder
                         uu____2927
                        in
                     let uu____2928 = fail_exp lid t1  in
                     FStar_Syntax_Util.abs [b] uu____2928
                       FStar_Pervasives_Native.None
                 | (bs,t1) ->
                     let uu____2947 = fail_exp lid t1  in
                     FStar_Syntax_Util.abs bs uu____2947
                       FStar_Pervasives_Native.None
                  in
               let uu___103_2948 = se  in
               let uu____2949 =
                 let uu____2950 =
                   let uu____2957 =
                     let uu____2964 =
                       let uu____2967 =
                         let uu____2968 =
                           let uu____2973 =
                             FStar_Syntax_Syntax.lid_as_fv lid
                               FStar_Syntax_Syntax.delta_constant
                               FStar_Pervasives_Native.None
                              in
                           FStar_Util.Inr uu____2973  in
                         {
                           FStar_Syntax_Syntax.lbname = uu____2968;
                           FStar_Syntax_Syntax.lbunivs = [];
                           FStar_Syntax_Syntax.lbtyp = t;
                           FStar_Syntax_Syntax.lbeff =
                             FStar_Parser_Const.effect_ML_lid;
                           FStar_Syntax_Syntax.lbdef = imp;
                           FStar_Syntax_Syntax.lbattrs = [];
                           FStar_Syntax_Syntax.lbpos =
                             (imp.FStar_Syntax_Syntax.pos)
                         }  in
                       [uu____2967]  in
                     (false, uu____2964)  in
                   (uu____2957, [])  in
                 FStar_Syntax_Syntax.Sig_let uu____2950  in
               {
                 FStar_Syntax_Syntax.sigel = uu____2949;
                 FStar_Syntax_Syntax.sigrng =
                   (uu___103_2948.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___103_2948.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___103_2948.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___103_2948.FStar_Syntax_Syntax.sigattrs)
               }  in
             let uu____2986 = extract_sig g always_fail  in
             (match uu____2986 with
              | (g1,mlm) ->
                  let uu____3005 =
                    FStar_Util.find_map quals
                      (fun uu___99_3010  ->
                         match uu___99_3010 with
                         | FStar_Syntax_Syntax.Discriminator l ->
                             FStar_Pervasives_Native.Some l
                         | uu____3014 -> FStar_Pervasives_Native.None)
                     in
                  (match uu____3005 with
                   | FStar_Pervasives_Native.Some l ->
                       let uu____3022 =
                         let uu____3025 =
                           let uu____3026 =
                             FStar_Extraction_ML_Util.mlloc_of_range
                               se.FStar_Syntax_Syntax.sigrng
                              in
                           FStar_Extraction_ML_Syntax.MLM_Loc uu____3026  in
                         let uu____3027 =
                           let uu____3030 =
                             FStar_Extraction_ML_Term.ind_discriminator_body
                               g1 lid l
                              in
                           [uu____3030]  in
                         uu____3025 :: uu____3027  in
                       (g1, uu____3022)
                   | uu____3033 ->
                       let uu____3036 =
                         FStar_Util.find_map quals
                           (fun uu___100_3042  ->
                              match uu___100_3042 with
                              | FStar_Syntax_Syntax.Projector (l,uu____3046)
                                  -> FStar_Pervasives_Native.Some l
                              | uu____3047 -> FStar_Pervasives_Native.None)
                          in
                       (match uu____3036 with
                        | FStar_Pervasives_Native.Some uu____3054 -> (g1, [])
                        | uu____3057 -> (g1, mlm))))
           else (g, [])
       | FStar_Syntax_Syntax.Sig_main e ->
           let uu____3066 = FStar_Extraction_ML_Term.term_as_mlexpr g e  in
           (match uu____3066 with
            | (ml_main,uu____3080,uu____3081) ->
                let uu____3082 =
                  let uu____3085 =
                    let uu____3086 =
                      FStar_Extraction_ML_Util.mlloc_of_range
                        se.FStar_Syntax_Syntax.sigrng
                       in
                    FStar_Extraction_ML_Syntax.MLM_Loc uu____3086  in
                  [uu____3085; FStar_Extraction_ML_Syntax.MLM_Top ml_main]
                   in
                (g, uu____3082))
       | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____3089 ->
           failwith "impossible -- removed by tc.fs"
       | FStar_Syntax_Syntax.Sig_assume uu____3096 -> (g, [])
       | FStar_Syntax_Syntax.Sig_sub_effect uu____3105 -> (g, [])
       | FStar_Syntax_Syntax.Sig_effect_abbrev uu____3108 -> (g, [])
       | FStar_Syntax_Syntax.Sig_pragma p ->
           (FStar_Syntax_Util.process_pragma p se.FStar_Syntax_Syntax.sigrng;
            (g, [])))
  
let (extract_iface :
  FStar_Extraction_ML_UEnv.env -> FStar_Syntax_Syntax.modul -> env_t) =
  fun g  ->
    fun m  ->
      let uu____3137 =
        FStar_Util.fold_map extract_sig g m.FStar_Syntax_Syntax.declarations
         in
      FStar_All.pipe_right uu____3137 FStar_Pervasives_Native.fst
  
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
      (let uu____3183 = FStar_Options.restore_cmd_line_options true  in
       let name =
         FStar_Extraction_ML_Syntax.mlpath_of_lident
           m.FStar_Syntax_Syntax.name
          in
       let g1 =
         let uu___104_3186 = g  in
         let uu____3187 =
           FStar_TypeChecker_Env.set_current_module
             g.FStar_Extraction_ML_UEnv.tcenv m.FStar_Syntax_Syntax.name
            in
         {
           FStar_Extraction_ML_UEnv.tcenv = uu____3187;
           FStar_Extraction_ML_UEnv.gamma =
             (uu___104_3186.FStar_Extraction_ML_UEnv.gamma);
           FStar_Extraction_ML_UEnv.tydefs =
             (uu___104_3186.FStar_Extraction_ML_UEnv.tydefs);
           FStar_Extraction_ML_UEnv.type_names =
             (uu___104_3186.FStar_Extraction_ML_UEnv.type_names);
           FStar_Extraction_ML_UEnv.currentModule = name
         }  in
       let uu____3188 =
         FStar_Util.fold_map extract_sig g1
           m.FStar_Syntax_Syntax.declarations
          in
       match uu____3188 with
       | (g2,sigs) ->
           let mlm = FStar_List.flatten sigs  in
           let is_kremlin =
             let uu____3217 = FStar_Options.codegen ()  in
             uu____3217 =
               (FStar_Pervasives_Native.Some FStar_Options.Kremlin)
              in
           let uu____3222 =
             (((m.FStar_Syntax_Syntax.name).FStar_Ident.str <> "Prims") &&
                (is_kremlin ||
                   (Prims.op_Negation m.FStar_Syntax_Syntax.is_interface)))
               &&
               (FStar_Options.should_extract
                  (m.FStar_Syntax_Syntax.name).FStar_Ident.str)
              in
           if uu____3222
           then
             ((let uu____3230 =
                 FStar_Syntax_Print.lid_to_string m.FStar_Syntax_Syntax.name
                  in
               FStar_Util.print1 "Extracted module %s\n" uu____3230);
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
      let uu____3308 = FStar_Options.debug_any ()  in
      if uu____3308
      then
        let msg =
          let uu____3316 =
            FStar_Syntax_Print.lid_to_string m.FStar_Syntax_Syntax.name  in
          FStar_Util.format1 "Extracting module %s\n" uu____3316  in
        FStar_Util.measure_execution_time msg
          (fun uu____3324  -> extract' g m)
      else extract' g m
  