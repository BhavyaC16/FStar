open Prims
let (unfold_whnf :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  FStar_TypeChecker_Normalize.unfold_whnf'
    [FStar_TypeChecker_Env.AllowUnboundUniverses]
  
let (tc_tycon :
  FStar_TypeChecker_Env.env_t ->
    FStar_Syntax_Syntax.sigelt ->
      (FStar_TypeChecker_Env.env_t * FStar_Syntax_Syntax.sigelt *
        FStar_Syntax_Syntax.universe * FStar_TypeChecker_Env.guard_t))
  =
  fun env  ->
    fun s  ->
      match s.FStar_Syntax_Syntax.sigel with
      | FStar_Syntax_Syntax.Sig_inductive_typ (tc,uvs,tps,k,mutuals,data) ->
          let env0 = env  in
          let uu____50 = FStar_Syntax_Subst.univ_var_opening uvs  in
          (match uu____50 with
           | (usubst,uvs1) ->
               let uu____77 =
                 let uu____84 = FStar_TypeChecker_Env.push_univ_vars env uvs1
                    in
                 let uu____85 = FStar_Syntax_Subst.subst_binders usubst tps
                    in
                 let uu____86 =
                   let uu____87 =
                     FStar_Syntax_Subst.shift_subst (FStar_List.length tps)
                       usubst
                      in
                   FStar_Syntax_Subst.subst uu____87 k  in
                 (uu____84, uu____85, uu____86)  in
               (match uu____77 with
                | (env1,tps1,k1) ->
                    let uu____107 = FStar_Syntax_Subst.open_term tps1 k1  in
                    (match uu____107 with
                     | (tps2,k2) ->
                         let uu____122 =
                           FStar_TypeChecker_TcTerm.tc_binders env1 tps2  in
                         (match uu____122 with
                          | (tps3,env_tps,guard_params,us) ->
                              let uu____143 =
                                let uu____162 =
                                  FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term
                                    env_tps k2
                                   in
                                match uu____162 with
                                | (k3,uu____188,g) ->
                                    let k4 =
                                      FStar_TypeChecker_Normalize.normalize
                                        [FStar_TypeChecker_Env.Exclude
                                           FStar_TypeChecker_Env.Iota;
                                        FStar_TypeChecker_Env.Exclude
                                          FStar_TypeChecker_Env.Zeta;
                                        FStar_TypeChecker_Env.Eager_unfolding
                                          false;
                                        FStar_TypeChecker_Env.NoFullNorm;
                                        FStar_TypeChecker_Env.Exclude
                                          FStar_TypeChecker_Env.Beta] env_tps
                                        k3
                                       in
                                    let uu____192 =
                                      FStar_Syntax_Util.arrow_formals k4  in
                                    let uu____207 =
                                      let uu____208 =
                                        FStar_TypeChecker_Env.conj_guard
                                          guard_params g
                                         in
                                      FStar_TypeChecker_Rel.discharge_guard
                                        env_tps uu____208
                                       in
                                    (uu____192, uu____207)
                                 in
                              (match uu____143 with
                               | ((indices,t),guard) ->
                                   let k3 =
                                     let uu____271 =
                                       FStar_Syntax_Syntax.mk_Total t  in
                                     FStar_Syntax_Util.arrow indices
                                       uu____271
                                      in
                                   let uu____274 =
                                     FStar_Syntax_Util.type_u ()  in
                                   (match uu____274 with
                                    | (t_type,u) ->
                                        let valid_type =
                                          ((FStar_Syntax_Util.is_eqtype_no_unrefine
                                              t)
                                             &&
                                             (let uu____292 =
                                                FStar_All.pipe_right
                                                  s.FStar_Syntax_Syntax.sigquals
                                                  (FStar_List.contains
                                                     FStar_Syntax_Syntax.Unopteq)
                                                 in
                                              Prims.op_Negation uu____292))
                                            ||
                                            (FStar_TypeChecker_Rel.teq_nosmt_force
                                               env1 t t_type)
                                           in
                                        (if Prims.op_Negation valid_type
                                         then
                                           (let uu____299 =
                                              let uu____305 =
                                                let uu____307 =
                                                  FStar_Syntax_Print.term_to_string
                                                    t
                                                   in
                                                let uu____309 =
                                                  FStar_Ident.string_of_lid
                                                    tc
                                                   in
                                                FStar_Util.format2
                                                  "Type annotation %s for inductive %s is not Type or eqtype, or it is eqtype but contains unopteq qualifier"
                                                  uu____307 uu____309
                                                 in
                                              (FStar_Errors.Error_InductiveAnnotNotAType,
                                                uu____305)
                                               in
                                            FStar_Errors.raise_error
                                              uu____299
                                              s.FStar_Syntax_Syntax.sigrng)
                                         else ();
                                         (let usubst1 =
                                            FStar_Syntax_Subst.univ_var_closing
                                              uvs1
                                             in
                                          let guard1 =
                                            FStar_TypeChecker_Util.close_guard_implicits
                                              env1 tps3 guard
                                             in
                                          let t_tc =
                                            let uu____322 =
                                              let uu____331 =
                                                FStar_All.pipe_right tps3
                                                  (FStar_Syntax_Subst.subst_binders
                                                     usubst1)
                                                 in
                                              let uu____348 =
                                                let uu____357 =
                                                  let uu____370 =
                                                    FStar_Syntax_Subst.shift_subst
                                                      (FStar_List.length tps3)
                                                      usubst1
                                                     in
                                                  FStar_Syntax_Subst.subst_binders
                                                    uu____370
                                                   in
                                                FStar_All.pipe_right indices
                                                  uu____357
                                                 in
                                              FStar_List.append uu____331
                                                uu____348
                                               in
                                            let uu____393 =
                                              let uu____396 =
                                                let uu____397 =
                                                  let uu____402 =
                                                    FStar_Syntax_Subst.shift_subst
                                                      ((FStar_List.length
                                                          tps3)
                                                         +
                                                         (FStar_List.length
                                                            indices)) usubst1
                                                     in
                                                  FStar_Syntax_Subst.subst
                                                    uu____402
                                                   in
                                                FStar_All.pipe_right t
                                                  uu____397
                                                 in
                                              FStar_Syntax_Syntax.mk_Total
                                                uu____396
                                               in
                                            FStar_Syntax_Util.arrow uu____322
                                              uu____393
                                             in
                                          let tps4 =
                                            FStar_Syntax_Subst.close_binders
                                              tps3
                                             in
                                          let k4 =
                                            FStar_Syntax_Subst.close tps4 k3
                                             in
                                          let uu____419 =
                                            let uu____424 =
                                              FStar_Syntax_Subst.subst_binders
                                                usubst1 tps4
                                               in
                                            let uu____425 =
                                              let uu____426 =
                                                FStar_Syntax_Subst.shift_subst
                                                  (FStar_List.length tps4)
                                                  usubst1
                                                 in
                                              FStar_Syntax_Subst.subst
                                                uu____426 k4
                                               in
                                            (uu____424, uu____425)  in
                                          match uu____419 with
                                          | (tps5,k5) ->
                                              let fv_tc =
                                                FStar_Syntax_Syntax.lid_as_fv
                                                  tc
                                                  FStar_Syntax_Syntax.delta_constant
                                                  FStar_Pervasives_Native.None
                                                 in
                                              let uu____446 =
                                                FStar_TypeChecker_Env.push_let_binding
                                                  env0 (FStar_Util.Inr fv_tc)
                                                  (uvs1, t_tc)
                                                 in
                                              (uu____446,
                                                (let uu___61_452 = s  in
                                                 {
                                                   FStar_Syntax_Syntax.sigel
                                                     =
                                                     (FStar_Syntax_Syntax.Sig_inductive_typ
                                                        (tc, uvs1, tps5, k5,
                                                          mutuals, data));
                                                   FStar_Syntax_Syntax.sigrng
                                                     =
                                                     (uu___61_452.FStar_Syntax_Syntax.sigrng);
                                                   FStar_Syntax_Syntax.sigquals
                                                     =
                                                     (uu___61_452.FStar_Syntax_Syntax.sigquals);
                                                   FStar_Syntax_Syntax.sigmeta
                                                     =
                                                     (uu___61_452.FStar_Syntax_Syntax.sigmeta);
                                                   FStar_Syntax_Syntax.sigattrs
                                                     =
                                                     (uu___61_452.FStar_Syntax_Syntax.sigattrs)
                                                 }), u, guard1)))))))))
      | uu____457 -> failwith "impossible"
  
let (tc_data :
  FStar_TypeChecker_Env.env_t ->
    (FStar_Syntax_Syntax.sigelt * FStar_Syntax_Syntax.universe) Prims.list ->
      FStar_Syntax_Syntax.sigelt ->
        (FStar_Syntax_Syntax.sigelt * FStar_TypeChecker_Env.guard_t))
  =
  fun env  ->
    fun tcs  ->
      fun se  ->
        match se.FStar_Syntax_Syntax.sigel with
        | FStar_Syntax_Syntax.Sig_datacon (c,_uvs,t,tc_lid,ntps,_mutual_tcs)
            ->
            let uu____521 = FStar_Syntax_Subst.univ_var_opening _uvs  in
            (match uu____521 with
             | (usubst,_uvs1) ->
                 let uu____544 =
                   let uu____549 =
                     FStar_TypeChecker_Env.push_univ_vars env _uvs1  in
                   let uu____550 = FStar_Syntax_Subst.subst usubst t  in
                   (uu____549, uu____550)  in
                 (match uu____544 with
                  | (env1,t1) ->
                      let uu____557 =
                        let tps_u_opt =
                          FStar_Util.find_map tcs
                            (fun uu____596  ->
                               match uu____596 with
                               | (se1,u_tc) ->
                                   let uu____611 =
                                     let uu____613 =
                                       let uu____614 =
                                         FStar_Syntax_Util.lid_of_sigelt se1
                                          in
                                       FStar_Util.must uu____614  in
                                     FStar_Ident.lid_equals tc_lid uu____613
                                      in
                                   if uu____611
                                   then
                                     (match se1.FStar_Syntax_Syntax.sigel
                                      with
                                      | FStar_Syntax_Syntax.Sig_inductive_typ
                                          (uu____634,uu____635,tps,uu____637,uu____638,uu____639)
                                          ->
                                          let tps1 =
                                            let uu____649 =
                                              FStar_All.pipe_right tps
                                                (FStar_Syntax_Subst.subst_binders
                                                   usubst)
                                               in
                                            FStar_All.pipe_right uu____649
                                              (FStar_List.map
                                                 (fun uu____689  ->
                                                    match uu____689 with
                                                    | (x,uu____703) ->
                                                        (x,
                                                          (FStar_Pervasives_Native.Some
                                                             FStar_Syntax_Syntax.imp_tag))))
                                             in
                                          let tps2 =
                                            FStar_Syntax_Subst.open_binders
                                              tps1
                                             in
                                          let uu____711 =
                                            let uu____718 =
                                              FStar_TypeChecker_Env.push_binders
                                                env1 tps2
                                               in
                                            (uu____718, tps2, u_tc)  in
                                          FStar_Pervasives_Native.Some
                                            uu____711
                                      | uu____725 -> failwith "Impossible")
                                   else FStar_Pervasives_Native.None)
                           in
                        match tps_u_opt with
                        | FStar_Pervasives_Native.Some x -> x
                        | FStar_Pervasives_Native.None  ->
                            let uu____768 =
                              FStar_Ident.lid_equals tc_lid
                                FStar_Parser_Const.exn_lid
                               in
                            if uu____768
                            then (env1, [], FStar_Syntax_Syntax.U_zero)
                            else
                              FStar_Errors.raise_error
                                (FStar_Errors.Fatal_UnexpectedDataConstructor,
                                  "Unexpected data constructor")
                                se.FStar_Syntax_Syntax.sigrng
                         in
                      (match uu____557 with
                       | (env2,tps,u_tc) ->
                           let uu____800 =
                             let t2 =
                               FStar_TypeChecker_Normalize.normalize
                                 (FStar_List.append
                                    FStar_TypeChecker_Normalize.whnf_steps
                                    [FStar_TypeChecker_Env.AllowUnboundUniverses])
                                 env2 t1
                                in
                             let uu____816 =
                               let uu____817 = FStar_Syntax_Subst.compress t2
                                  in
                               uu____817.FStar_Syntax_Syntax.n  in
                             match uu____816 with
                             | FStar_Syntax_Syntax.Tm_arrow (bs,res) ->
                                 let uu____856 = FStar_Util.first_N ntps bs
                                    in
                                 (match uu____856 with
                                  | (uu____897,bs') ->
                                      let t3 =
                                        FStar_Syntax_Syntax.mk
                                          (FStar_Syntax_Syntax.Tm_arrow
                                             (bs', res))
                                          FStar_Pervasives_Native.None
                                          t2.FStar_Syntax_Syntax.pos
                                         in
                                      let subst1 =
                                        FStar_All.pipe_right tps
                                          (FStar_List.mapi
                                             (fun i  ->
                                                fun uu____968  ->
                                                  match uu____968 with
                                                  | (x,uu____977) ->
                                                      FStar_Syntax_Syntax.DB
                                                        ((ntps -
                                                            (Prims.int_one +
                                                               i)), x)))
                                         in
                                      let uu____984 =
                                        FStar_Syntax_Subst.subst subst1 t3
                                         in
                                      FStar_Syntax_Util.arrow_formals
                                        uu____984)
                             | uu____985 -> ([], t2)  in
                           (match uu____800 with
                            | (arguments,result) ->
                                ((let uu____1029 =
                                    FStar_TypeChecker_Env.debug env2
                                      FStar_Options.Low
                                     in
                                  if uu____1029
                                  then
                                    let uu____1032 =
                                      FStar_Syntax_Print.lid_to_string c  in
                                    let uu____1034 =
                                      FStar_Syntax_Print.binders_to_string
                                        "->" arguments
                                       in
                                    let uu____1037 =
                                      FStar_Syntax_Print.term_to_string
                                        result
                                       in
                                    FStar_Util.print3
                                      "Checking datacon  %s : %s -> %s \n"
                                      uu____1032 uu____1034 uu____1037
                                  else ());
                                 (let uu____1042 =
                                    FStar_TypeChecker_TcTerm.tc_tparams env2
                                      arguments
                                     in
                                  match uu____1042 with
                                  | (arguments1,env',us) ->
                                      let type_u_tc =
                                        FStar_Syntax_Syntax.mk
                                          (FStar_Syntax_Syntax.Tm_type u_tc)
                                          FStar_Pervasives_Native.None
                                          result.FStar_Syntax_Syntax.pos
                                         in
                                      let env'1 =
                                        FStar_TypeChecker_Env.set_expected_typ
                                          env' type_u_tc
                                         in
                                      let uu____1060 =
                                        FStar_TypeChecker_TcTerm.tc_trivial_guard
                                          env'1 result
                                         in
                                      (match uu____1060 with
                                       | (result1,res_lcomp) ->
                                           let uu____1071 =
                                             FStar_Syntax_Util.head_and_args
                                               result1
                                              in
                                           (match uu____1071 with
                                            | (head1,args) ->
                                                let p_args =
                                                  let uu____1129 =
                                                    FStar_Util.first_N
                                                      (FStar_List.length tps)
                                                      args
                                                     in
                                                  FStar_Pervasives_Native.fst
                                                    uu____1129
                                                   in
                                                (FStar_List.iter2
                                                   (fun uu____1211  ->
                                                      fun uu____1212  ->
                                                        match (uu____1211,
                                                                uu____1212)
                                                        with
                                                        | ((bv,uu____1242),
                                                           (t2,uu____1244))
                                                            ->
                                                            let uu____1271 =
                                                              let uu____1272
                                                                =
                                                                FStar_Syntax_Subst.compress
                                                                  t2
                                                                 in
                                                              uu____1272.FStar_Syntax_Syntax.n
                                                               in
                                                            (match uu____1271
                                                             with
                                                             | FStar_Syntax_Syntax.Tm_name
                                                                 bv' when
                                                                 FStar_Syntax_Syntax.bv_eq
                                                                   bv bv'
                                                                 -> ()
                                                             | uu____1276 ->
                                                                 let uu____1277
                                                                   =
                                                                   let uu____1283
                                                                    =
                                                                    let uu____1285
                                                                    =
                                                                    FStar_Syntax_Print.bv_to_string
                                                                    bv  in
                                                                    let uu____1287
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    t2  in
                                                                    FStar_Util.format2
                                                                    "This parameter is not constant: expected %s, got %s"
                                                                    uu____1285
                                                                    uu____1287
                                                                     in
                                                                   (FStar_Errors.Error_BadInductiveParam,
                                                                    uu____1283)
                                                                    in
                                                                 FStar_Errors.raise_error
                                                                   uu____1277
                                                                   t2.FStar_Syntax_Syntax.pos))
                                                   tps p_args;
                                                 (let ty =
                                                    let uu____1292 =
                                                      unfold_whnf env2
                                                        res_lcomp.FStar_Syntax_Syntax.res_typ
                                                       in
                                                    FStar_All.pipe_right
                                                      uu____1292
                                                      FStar_Syntax_Util.unrefine
                                                     in
                                                  (let uu____1294 =
                                                     let uu____1295 =
                                                       FStar_Syntax_Subst.compress
                                                         ty
                                                        in
                                                     uu____1295.FStar_Syntax_Syntax.n
                                                      in
                                                   match uu____1294 with
                                                   | FStar_Syntax_Syntax.Tm_type
                                                       uu____1298 -> ()
                                                   | uu____1299 ->
                                                       let uu____1300 =
                                                         let uu____1306 =
                                                           let uu____1308 =
                                                             FStar_Syntax_Print.term_to_string
                                                               result1
                                                              in
                                                           let uu____1310 =
                                                             FStar_Syntax_Print.term_to_string
                                                               ty
                                                              in
                                                           FStar_Util.format2
                                                             "The type of %s is %s, but since this is the result type of a constructor its type should be Type"
                                                             uu____1308
                                                             uu____1310
                                                            in
                                                         (FStar_Errors.Fatal_WrongResultTypeAfterConstrutor,
                                                           uu____1306)
                                                          in
                                                       FStar_Errors.raise_error
                                                         uu____1300
                                                         se.FStar_Syntax_Syntax.sigrng);
                                                  (let g_uvs =
                                                     let uu____1315 =
                                                       let uu____1316 =
                                                         FStar_Syntax_Subst.compress
                                                           head1
                                                          in
                                                       uu____1316.FStar_Syntax_Syntax.n
                                                        in
                                                     match uu____1315 with
                                                     | FStar_Syntax_Syntax.Tm_uinst
                                                         ({
                                                            FStar_Syntax_Syntax.n
                                                              =
                                                              FStar_Syntax_Syntax.Tm_fvar
                                                              fv;
                                                            FStar_Syntax_Syntax.pos
                                                              = uu____1320;
                                                            FStar_Syntax_Syntax.vars
                                                              = uu____1321;_},tuvs)
                                                         when
                                                         FStar_Syntax_Syntax.fv_eq_lid
                                                           fv tc_lid
                                                         ->
                                                         if
                                                           (FStar_List.length
                                                              _uvs1)
                                                             =
                                                             (FStar_List.length
                                                                tuvs)
                                                         then
                                                           FStar_List.fold_left2
                                                             (fun g  ->
                                                                fun u1  ->
                                                                  fun u2  ->
                                                                    let uu____1335
                                                                    =
                                                                    let uu____1336
                                                                    =
                                                                    FStar_Syntax_Syntax.mk
                                                                    (FStar_Syntax_Syntax.Tm_type
                                                                    u1)
                                                                    FStar_Pervasives_Native.None
                                                                    FStar_Range.dummyRange
                                                                     in
                                                                    let uu____1337
                                                                    =
                                                                    FStar_Syntax_Syntax.mk
                                                                    (FStar_Syntax_Syntax.Tm_type
                                                                    (FStar_Syntax_Syntax.U_name
                                                                    u2))
                                                                    FStar_Pervasives_Native.None
                                                                    FStar_Range.dummyRange
                                                                     in
                                                                    FStar_TypeChecker_Rel.teq
                                                                    env'1
                                                                    uu____1336
                                                                    uu____1337
                                                                     in
                                                                    FStar_TypeChecker_Env.conj_guard
                                                                    g
                                                                    uu____1335)
                                                             FStar_TypeChecker_Env.trivial_guard
                                                             tuvs _uvs1
                                                         else
                                                           FStar_Errors.raise_error
                                                             (FStar_Errors.Fatal_UnexpectedConstructorType,
                                                               "Length of annotated universes does not match inferred universes")
                                                             se.FStar_Syntax_Syntax.sigrng
                                                     | FStar_Syntax_Syntax.Tm_fvar
                                                         fv when
                                                         FStar_Syntax_Syntax.fv_eq_lid
                                                           fv tc_lid
                                                         ->
                                                         FStar_TypeChecker_Env.trivial_guard
                                                     | uu____1343 ->
                                                         let uu____1344 =
                                                           let uu____1350 =
                                                             let uu____1352 =
                                                               FStar_Syntax_Print.lid_to_string
                                                                 tc_lid
                                                                in
                                                             let uu____1354 =
                                                               FStar_Syntax_Print.term_to_string
                                                                 head1
                                                                in
                                                             FStar_Util.format2
                                                               "Expected a constructor of type %s; got %s"
                                                               uu____1352
                                                               uu____1354
                                                              in
                                                           (FStar_Errors.Fatal_UnexpectedConstructorType,
                                                             uu____1350)
                                                            in
                                                         FStar_Errors.raise_error
                                                           uu____1344
                                                           se.FStar_Syntax_Syntax.sigrng
                                                      in
                                                   let g =
                                                     FStar_List.fold_left2
                                                       (fun g  ->
                                                          fun uu____1372  ->
                                                            fun u_x  ->
                                                              match uu____1372
                                                              with
                                                              | (x,uu____1381)
                                                                  ->
                                                                  let uu____1386
                                                                    =
                                                                    FStar_TypeChecker_Rel.universe_inequality
                                                                    u_x u_tc
                                                                     in
                                                                  FStar_TypeChecker_Env.conj_guard
                                                                    g
                                                                    uu____1386)
                                                       g_uvs arguments1 us
                                                      in
                                                   let t2 =
                                                     let uu____1390 =
                                                       let uu____1399 =
                                                         FStar_All.pipe_right
                                                           tps
                                                           (FStar_List.map
                                                              (fun uu____1439
                                                                  ->
                                                                 match uu____1439
                                                                 with
                                                                 | (x,uu____1453)
                                                                    ->
                                                                    (x,
                                                                    (FStar_Pervasives_Native.Some
                                                                    (FStar_Syntax_Syntax.Implicit
                                                                    true)))))
                                                          in
                                                       FStar_List.append
                                                         uu____1399
                                                         arguments1
                                                        in
                                                     let uu____1467 =
                                                       FStar_Syntax_Syntax.mk_Total
                                                         result1
                                                        in
                                                     FStar_Syntax_Util.arrow
                                                       uu____1390 uu____1467
                                                      in
                                                   let t3 =
                                                     FStar_Syntax_Subst.close_univ_vars
                                                       _uvs1 t2
                                                      in
                                                   ((let uu___183_1472 = se
                                                        in
                                                     {
                                                       FStar_Syntax_Syntax.sigel
                                                         =
                                                         (FStar_Syntax_Syntax.Sig_datacon
                                                            (c, _uvs1, t3,
                                                              tc_lid, ntps,
                                                              []));
                                                       FStar_Syntax_Syntax.sigrng
                                                         =
                                                         (uu___183_1472.FStar_Syntax_Syntax.sigrng);
                                                       FStar_Syntax_Syntax.sigquals
                                                         =
                                                         (uu___183_1472.FStar_Syntax_Syntax.sigquals);
                                                       FStar_Syntax_Syntax.sigmeta
                                                         =
                                                         (uu___183_1472.FStar_Syntax_Syntax.sigmeta);
                                                       FStar_Syntax_Syntax.sigattrs
                                                         =
                                                         (uu___183_1472.FStar_Syntax_Syntax.sigattrs)
                                                     }), g))))))))))))
        | uu____1476 -> failwith "impossible"
  
let (generalize_and_inst_within :
  FStar_TypeChecker_Env.env_t ->
    (FStar_Syntax_Syntax.sigelt * FStar_Syntax_Syntax.universe) Prims.list ->
      FStar_Syntax_Syntax.sigelt Prims.list ->
        (FStar_Syntax_Syntax.sigelt Prims.list * FStar_Syntax_Syntax.sigelt
          Prims.list))
  =
  fun env  ->
    fun tcs  ->
      fun datas  ->
        let binders =
          FStar_All.pipe_right tcs
            (FStar_List.map
               (fun uu____1567  ->
                  match uu____1567 with
                  | (se,uu____1573) ->
                      (match se.FStar_Syntax_Syntax.sigel with
                       | FStar_Syntax_Syntax.Sig_inductive_typ
                           (uu____1574,uu____1575,tps,k,uu____1578,uu____1579)
                           ->
                           let uu____1588 =
                             let uu____1589 = FStar_Syntax_Syntax.mk_Total k
                                in
                             FStar_All.pipe_left
                               (FStar_Syntax_Util.arrow tps) uu____1589
                              in
                           FStar_Syntax_Syntax.null_binder uu____1588
                       | uu____1594 -> failwith "Impossible")))
           in
        let binders' =
          FStar_All.pipe_right datas
            (FStar_List.map
               (fun se  ->
                  match se.FStar_Syntax_Syntax.sigel with
                  | FStar_Syntax_Syntax.Sig_datacon
                      (uu____1623,uu____1624,t,uu____1626,uu____1627,uu____1628)
                      -> FStar_Syntax_Syntax.null_binder t
                  | uu____1635 -> failwith "Impossible"))
           in
        let t =
          let uu____1640 =
            FStar_Syntax_Syntax.mk_Total FStar_Syntax_Syntax.t_unit  in
          FStar_Syntax_Util.arrow (FStar_List.append binders binders')
            uu____1640
           in
        (let uu____1650 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "GenUniverses")
            in
         if uu____1650
         then
           let uu____1655 = FStar_TypeChecker_Normalize.term_to_string env t
              in
           FStar_Util.print1 "@@@@@@Trying to generalize universes in %s\n"
             uu____1655
         else ());
        (let uu____1660 = FStar_TypeChecker_Util.generalize_universes env t
            in
         match uu____1660 with
         | (uvs,t1) ->
             ((let uu____1680 =
                 FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                   (FStar_Options.Other "GenUniverses")
                  in
               if uu____1680
               then
                 let uu____1685 =
                   let uu____1687 =
                     FStar_All.pipe_right uvs
                       (FStar_List.map (fun u  -> u.FStar_Ident.idText))
                      in
                   FStar_All.pipe_right uu____1687 (FStar_String.concat ", ")
                    in
                 let uu____1704 = FStar_Syntax_Print.term_to_string t1  in
                 FStar_Util.print2 "@@@@@@Generalized to (%s, %s)\n"
                   uu____1685 uu____1704
               else ());
              (let uu____1709 = FStar_Syntax_Subst.open_univ_vars uvs t1  in
               match uu____1709 with
               | (uvs1,t2) ->
                   let uu____1724 = FStar_Syntax_Util.arrow_formals t2  in
                   (match uu____1724 with
                    | (args,uu____1748) ->
                        let uu____1769 =
                          FStar_Util.first_N (FStar_List.length binders) args
                           in
                        (match uu____1769 with
                         | (tc_types,data_types) ->
                             let tcs1 =
                               FStar_List.map2
                                 (fun uu____1874  ->
                                    fun uu____1875  ->
                                      match (uu____1874, uu____1875) with
                                      | ((x,uu____1897),(se,uu____1899)) ->
                                          (match se.FStar_Syntax_Syntax.sigel
                                           with
                                           | FStar_Syntax_Syntax.Sig_inductive_typ
                                               (tc,uu____1915,tps,uu____1917,mutuals,datas1)
                                               ->
                                               let ty =
                                                 FStar_Syntax_Subst.close_univ_vars
                                                   uvs1
                                                   x.FStar_Syntax_Syntax.sort
                                                  in
                                               let uu____1929 =
                                                 let uu____1934 =
                                                   let uu____1935 =
                                                     FStar_Syntax_Subst.compress
                                                       ty
                                                      in
                                                   uu____1935.FStar_Syntax_Syntax.n
                                                    in
                                                 match uu____1934 with
                                                 | FStar_Syntax_Syntax.Tm_arrow
                                                     (binders1,c) ->
                                                     let uu____1964 =
                                                       FStar_Util.first_N
                                                         (FStar_List.length
                                                            tps) binders1
                                                        in
                                                     (match uu____1964 with
                                                      | (tps1,rest) ->
                                                          let t3 =
                                                            match rest with
                                                            | [] ->
                                                                FStar_Syntax_Util.comp_result
                                                                  c
                                                            | uu____2042 ->
                                                                FStar_Syntax_Syntax.mk
                                                                  (FStar_Syntax_Syntax.Tm_arrow
                                                                    (rest, c))
                                                                  FStar_Pervasives_Native.None
                                                                  (x.FStar_Syntax_Syntax.sort).FStar_Syntax_Syntax.pos
                                                             in
                                                          (tps1, t3))
                                                 | uu____2061 -> ([], ty)  in
                                               (match uu____1929 with
                                                | (tps1,t3) ->
                                                    let uu___260_2070 = se
                                                       in
                                                    {
                                                      FStar_Syntax_Syntax.sigel
                                                        =
                                                        (FStar_Syntax_Syntax.Sig_inductive_typ
                                                           (tc, uvs1, tps1,
                                                             t3, mutuals,
                                                             datas1));
                                                      FStar_Syntax_Syntax.sigrng
                                                        =
                                                        (uu___260_2070.FStar_Syntax_Syntax.sigrng);
                                                      FStar_Syntax_Syntax.sigquals
                                                        =
                                                        (uu___260_2070.FStar_Syntax_Syntax.sigquals);
                                                      FStar_Syntax_Syntax.sigmeta
                                                        =
                                                        (uu___260_2070.FStar_Syntax_Syntax.sigmeta);
                                                      FStar_Syntax_Syntax.sigattrs
                                                        =
                                                        (uu___260_2070.FStar_Syntax_Syntax.sigattrs)
                                                    })
                                           | uu____2075 ->
                                               failwith "Impossible"))
                                 tc_types tcs
                                in
                             let datas1 =
                               match uvs1 with
                               | [] -> datas
                               | uu____2082 ->
                                   let uvs_universes =
                                     FStar_All.pipe_right uvs1
                                       (FStar_List.map
                                          (fun _2086  ->
                                             FStar_Syntax_Syntax.U_name _2086))
                                      in
                                   let tc_insts =
                                     FStar_All.pipe_right tcs1
                                       (FStar_List.map
                                          (fun uu___0_2105  ->
                                             match uu___0_2105 with
                                             | {
                                                 FStar_Syntax_Syntax.sigel =
                                                   FStar_Syntax_Syntax.Sig_inductive_typ
                                                   (tc,uu____2111,uu____2112,uu____2113,uu____2114,uu____2115);
                                                 FStar_Syntax_Syntax.sigrng =
                                                   uu____2116;
                                                 FStar_Syntax_Syntax.sigquals
                                                   = uu____2117;
                                                 FStar_Syntax_Syntax.sigmeta
                                                   = uu____2118;
                                                 FStar_Syntax_Syntax.sigattrs
                                                   = uu____2119;_}
                                                 -> (tc, uvs_universes)
                                             | uu____2132 ->
                                                 failwith "Impossible"))
                                      in
                                   FStar_List.map2
                                     (fun uu____2156  ->
                                        fun d  ->
                                          match uu____2156 with
                                          | (t3,uu____2165) ->
                                              (match d.FStar_Syntax_Syntax.sigel
                                               with
                                               | FStar_Syntax_Syntax.Sig_datacon
                                                   (l,uu____2171,uu____2172,tc,ntps,mutuals)
                                                   ->
                                                   let ty =
                                                     let uu____2183 =
                                                       FStar_Syntax_InstFV.instantiate
                                                         tc_insts
                                                         t3.FStar_Syntax_Syntax.sort
                                                        in
                                                     FStar_All.pipe_right
                                                       uu____2183
                                                       (FStar_Syntax_Subst.close_univ_vars
                                                          uvs1)
                                                      in
                                                   let uu___296_2184 = d  in
                                                   {
                                                     FStar_Syntax_Syntax.sigel
                                                       =
                                                       (FStar_Syntax_Syntax.Sig_datacon
                                                          (l, uvs1, ty, tc,
                                                            ntps, mutuals));
                                                     FStar_Syntax_Syntax.sigrng
                                                       =
                                                       (uu___296_2184.FStar_Syntax_Syntax.sigrng);
                                                     FStar_Syntax_Syntax.sigquals
                                                       =
                                                       (uu___296_2184.FStar_Syntax_Syntax.sigquals);
                                                     FStar_Syntax_Syntax.sigmeta
                                                       =
                                                       (uu___296_2184.FStar_Syntax_Syntax.sigmeta);
                                                     FStar_Syntax_Syntax.sigattrs
                                                       =
                                                       (uu___296_2184.FStar_Syntax_Syntax.sigattrs)
                                                   }
                                               | uu____2188 ->
                                                   failwith "Impossible"))
                                     data_types datas
                                in
                             (tcs1, datas1))))))
  
let (debug_log : FStar_TypeChecker_Env.env_t -> Prims.string -> unit) =
  fun env  ->
    fun s  ->
      let uu____2207 =
        FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
          (FStar_Options.Other "Positivity")
         in
      if uu____2207
      then
        FStar_Util.print_string
          (Prims.op_Hat "Positivity::" (Prims.op_Hat s "\n"))
      else ()
  
let (ty_occurs_in :
  FStar_Ident.lident -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun ty_lid  ->
    fun t  ->
      let uu____2229 = FStar_Syntax_Free.fvars t  in
      FStar_Util.set_mem ty_lid uu____2229
  
let (try_get_fv :
  FStar_Syntax_Syntax.term ->
    (FStar_Syntax_Syntax.fv * FStar_Syntax_Syntax.universes))
  =
  fun t  ->
    let uu____2246 =
      let uu____2247 = FStar_Syntax_Subst.compress t  in
      uu____2247.FStar_Syntax_Syntax.n  in
    match uu____2246 with
    | FStar_Syntax_Syntax.Tm_fvar fv -> (fv, [])
    | FStar_Syntax_Syntax.Tm_uinst (t1,us) ->
        (match t1.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.Tm_fvar fv -> (fv, us)
         | uu____2266 ->
             failwith "Node is a Tm_uinst, but Tm_uinst is not an fvar")
    | uu____2272 -> failwith "Node is not an fvar or a Tm_uinst"
  
type unfolded_memo_elt =
  (FStar_Ident.lident * FStar_Syntax_Syntax.args) Prims.list
type unfolded_memo_t = unfolded_memo_elt FStar_ST.ref
let (already_unfolded :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.args ->
      unfolded_memo_t -> FStar_TypeChecker_Env.env_t -> Prims.bool)
  =
  fun ilid  ->
    fun arrghs  ->
      fun unfolded  ->
        fun env  ->
          let uu____2309 = FStar_ST.op_Bang unfolded  in
          FStar_List.existsML
            (fun uu____2358  ->
               match uu____2358 with
               | (lid,l) ->
                   (FStar_Ident.lid_equals lid ilid) &&
                     (let args =
                        let uu____2402 =
                          FStar_List.splitAt (FStar_List.length l) arrghs  in
                        FStar_Pervasives_Native.fst uu____2402  in
                      FStar_List.fold_left2
                        (fun b  ->
                           fun a  ->
                             fun a'  ->
                               b &&
                                 (FStar_TypeChecker_Rel.teq_nosmt_force env
                                    (FStar_Pervasives_Native.fst a)
                                    (FStar_Pervasives_Native.fst a'))) true
                        args l)) uu____2309
  
let rec (ty_strictly_positive_in_type :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.term ->
      unfolded_memo_t -> FStar_TypeChecker_Env.env_t -> Prims.bool)
  =
  fun ty_lid  ->
    fun btype  ->
      fun unfolded  ->
        fun env  ->
          (let uu____2607 =
             let uu____2609 = FStar_Syntax_Print.term_to_string btype  in
             Prims.op_Hat "Checking strict positivity in type: " uu____2609
              in
           debug_log env uu____2607);
          (let btype1 =
             FStar_TypeChecker_Normalize.normalize
               [FStar_TypeChecker_Env.Beta;
               FStar_TypeChecker_Env.UnfoldUntil
                 FStar_Syntax_Syntax.delta_constant;
               FStar_TypeChecker_Env.Iota;
               FStar_TypeChecker_Env.Zeta;
               FStar_TypeChecker_Env.AllowUnboundUniverses] env btype
              in
           (let uu____2614 =
              let uu____2616 = FStar_Syntax_Print.term_to_string btype1  in
              Prims.op_Hat
                "Checking strict positivity in type, after normalization: "
                uu____2616
               in
            debug_log env uu____2614);
           (let uu____2621 = ty_occurs_in ty_lid btype1  in
            Prims.op_Negation uu____2621) ||
             ((debug_log env "ty does occur in this type, pressing ahead";
               (let uu____2634 =
                  let uu____2635 = FStar_Syntax_Subst.compress btype1  in
                  uu____2635.FStar_Syntax_Syntax.n  in
                match uu____2634 with
                | FStar_Syntax_Syntax.Tm_app (t,args) ->
                    let uu____2665 = try_get_fv t  in
                    (match uu____2665 with
                     | (fv,us) ->
                         let uu____2673 =
                           FStar_Ident.lid_equals
                             (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                             ty_lid
                            in
                         if uu____2673
                         then
                           (debug_log env
                              "Checking strict positivity in the Tm_app node where head lid is ty itself, checking that ty does not occur in the arguments";
                            FStar_List.for_all
                              (fun uu____2689  ->
                                 match uu____2689 with
                                 | (t1,uu____2698) ->
                                     let uu____2703 = ty_occurs_in ty_lid t1
                                        in
                                     Prims.op_Negation uu____2703) args)
                         else
                           (debug_log env
                              "Checking strict positivity in the Tm_app node, head lid is not ty, so checking nested positivity";
                            ty_nested_positive_in_inductive ty_lid
                              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                              us args unfolded env))
                | FStar_Syntax_Syntax.Tm_arrow (sbs,c) ->
                    (debug_log env "Checking strict positivity in Tm_arrow";
                     (let check_comp1 =
                        let c1 =
                          let uu____2738 =
                            FStar_TypeChecker_Env.unfold_effect_abbrev env c
                             in
                          FStar_All.pipe_right uu____2738
                            FStar_Syntax_Syntax.mk_Comp
                           in
                        (FStar_Syntax_Util.is_pure_or_ghost_comp c1) ||
                          (let uu____2742 =
                             FStar_TypeChecker_Env.lookup_effect_quals env
                               (FStar_Syntax_Util.comp_effect_name c1)
                              in
                           FStar_All.pipe_right uu____2742
                             (FStar_List.existsb
                                (fun q  ->
                                   q = FStar_Syntax_Syntax.TotalEffect)))
                         in
                      if Prims.op_Negation check_comp1
                      then
                        (debug_log env
                           "Checking strict positivity , the arrow is impure, so return true";
                         true)
                      else
                        (debug_log env
                           "Checking struict positivity, Pure arrow, checking that ty does not occur in the binders, and that it is strictly positive in the return type";
                         (FStar_List.for_all
                            (fun uu____2769  ->
                               match uu____2769 with
                               | (b,uu____2778) ->
                                   let uu____2783 =
                                     ty_occurs_in ty_lid
                                       b.FStar_Syntax_Syntax.sort
                                      in
                                   Prims.op_Negation uu____2783) sbs)
                           &&
                           ((let uu____2789 =
                               FStar_Syntax_Subst.open_term sbs
                                 (FStar_Syntax_Util.comp_result c)
                                in
                             match uu____2789 with
                             | (uu____2795,return_type) ->
                                 let uu____2797 =
                                   FStar_TypeChecker_Env.push_binders env sbs
                                    in
                                 ty_strictly_positive_in_type ty_lid
                                   return_type unfolded uu____2797)))))
                | FStar_Syntax_Syntax.Tm_fvar uu____2798 ->
                    (debug_log env
                       "Checking strict positivity in an fvar, return true";
                     true)
                | FStar_Syntax_Syntax.Tm_type uu____2802 ->
                    (debug_log env
                       "Checking strict positivity in an Tm_type, return true";
                     true)
                | FStar_Syntax_Syntax.Tm_uinst (t,uu____2807) ->
                    (debug_log env
                       "Checking strict positivity in an Tm_uinst, recur on the term inside (mostly it should be the same inductive)";
                     ty_strictly_positive_in_type ty_lid t unfolded env)
                | FStar_Syntax_Syntax.Tm_refine (bv,uu____2815) ->
                    (debug_log env
                       "Checking strict positivity in an Tm_refine, recur in the bv sort)";
                     ty_strictly_positive_in_type ty_lid
                       bv.FStar_Syntax_Syntax.sort unfolded env)
                | FStar_Syntax_Syntax.Tm_match (uu____2822,branches) ->
                    (debug_log env
                       "Checking strict positivity in an Tm_match, recur in the branches)";
                     FStar_List.for_all
                       (fun uu____2881  ->
                          match uu____2881 with
                          | (p,uu____2894,t) ->
                              let bs =
                                let uu____2913 =
                                  FStar_Syntax_Syntax.pat_bvs p  in
                                FStar_List.map FStar_Syntax_Syntax.mk_binder
                                  uu____2913
                                 in
                              let uu____2922 =
                                FStar_Syntax_Subst.open_term bs t  in
                              (match uu____2922 with
                               | (bs1,t1) ->
                                   let uu____2930 =
                                     FStar_TypeChecker_Env.push_binders env
                                       bs1
                                      in
                                   ty_strictly_positive_in_type ty_lid t1
                                     unfolded uu____2930)) branches)
                | FStar_Syntax_Syntax.Tm_ascribed (t,uu____2932,uu____2933)
                    ->
                    (debug_log env
                       "Checking strict positivity in an Tm_ascribed, recur)";
                     ty_strictly_positive_in_type ty_lid t unfolded env)
                | uu____2976 ->
                    ((let uu____2978 =
                        let uu____2980 =
                          let uu____2982 =
                            FStar_Syntax_Print.tag_of_term btype1  in
                          let uu____2984 =
                            let uu____2986 =
                              FStar_Syntax_Print.term_to_string btype1  in
                            Prims.op_Hat " and term: " uu____2986  in
                          Prims.op_Hat uu____2982 uu____2984  in
                        Prims.op_Hat
                          "Checking strict positivity, unexpected tag: "
                          uu____2980
                         in
                      debug_log env uu____2978);
                     false)))))

and (ty_nested_positive_in_inductive :
  FStar_Ident.lident ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.universes ->
        FStar_Syntax_Syntax.args ->
          unfolded_memo_t -> FStar_TypeChecker_Env.env_t -> Prims.bool)
  =
  fun ty_lid  ->
    fun ilid  ->
      fun us  ->
        fun args  ->
          fun unfolded  ->
            fun env  ->
              (let uu____2999 =
                 let uu____3001 =
                   let uu____3003 =
                     let uu____3005 = FStar_Syntax_Print.args_to_string args
                        in
                     Prims.op_Hat " applied to arguments: " uu____3005  in
                   Prims.op_Hat ilid.FStar_Ident.str uu____3003  in
                 Prims.op_Hat "Checking nested positivity in the inductive "
                   uu____3001
                  in
               debug_log env uu____2999);
              (let uu____3009 =
                 FStar_TypeChecker_Env.datacons_of_typ env ilid  in
               match uu____3009 with
               | (b,idatas) ->
                   if Prims.op_Negation b
                   then
                     let uu____3028 =
                       let uu____3030 =
                         FStar_Syntax_Syntax.lid_as_fv ilid
                           FStar_Syntax_Syntax.delta_constant
                           FStar_Pervasives_Native.None
                          in
                       FStar_TypeChecker_Env.fv_has_attr env uu____3030
                         FStar_Parser_Const.assume_strictly_positive_attr_lid
                        in
                     (if uu____3028
                      then
                        ((let uu____3034 =
                            let uu____3036 = FStar_Ident.string_of_lid ilid
                               in
                            FStar_Util.format1
                              "Checking nested positivity, special case decorated with `assume_strictly_positive` %s; return true"
                              uu____3036
                             in
                          debug_log env uu____3034);
                         true)
                      else
                        (debug_log env
                           "Checking nested positivity, not an inductive, return false";
                         false))
                   else
                     (let uu____3047 =
                        already_unfolded ilid args unfolded env  in
                      if uu____3047
                      then
                        (debug_log env
                           "Checking nested positivity, we have already unfolded this inductive with these args";
                         true)
                      else
                        (let num_ibs =
                           let uu____3058 =
                             FStar_TypeChecker_Env.num_inductive_ty_params
                               env ilid
                              in
                           FStar_Option.get uu____3058  in
                         (let uu____3064 =
                            let uu____3066 =
                              let uu____3068 =
                                FStar_Util.string_of_int num_ibs  in
                              Prims.op_Hat uu____3068
                                ", also adding to the memo table"
                               in
                            Prims.op_Hat
                              "Checking nested positivity, number of type parameters is "
                              uu____3066
                             in
                          debug_log env uu____3064);
                         (let uu____3073 =
                            let uu____3074 = FStar_ST.op_Bang unfolded  in
                            let uu____3100 =
                              let uu____3107 =
                                let uu____3112 =
                                  let uu____3113 =
                                    FStar_List.splitAt num_ibs args  in
                                  FStar_Pervasives_Native.fst uu____3113  in
                                (ilid, uu____3112)  in
                              [uu____3107]  in
                            FStar_List.append uu____3074 uu____3100  in
                          FStar_ST.op_Colon_Equals unfolded uu____3073);
                         FStar_List.for_all
                           (fun d  ->
                              ty_nested_positive_in_dlid ty_lid d ilid us
                                args num_ibs unfolded env) idatas)))

and (ty_nested_positive_in_dlid :
  FStar_Ident.lident ->
    FStar_Ident.lident ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.universes ->
          FStar_Syntax_Syntax.args ->
            Prims.int ->
              unfolded_memo_t -> FStar_TypeChecker_Env.env_t -> Prims.bool)
  =
  fun ty_lid  ->
    fun dlid  ->
      fun ilid  ->
        fun us  ->
          fun args  ->
            fun num_ibs  ->
              fun unfolded  ->
                fun env  ->
                  debug_log env
                    (Prims.op_Hat
                       "Checking nested positivity in data constructor "
                       (Prims.op_Hat dlid.FStar_Ident.str
                          (Prims.op_Hat " of the inductive "
                             ilid.FStar_Ident.str)));
                  (let uu____3212 =
                     FStar_TypeChecker_Env.lookup_datacon env dlid  in
                   match uu____3212 with
                   | (univ_unif_vars,dt) ->
                       (FStar_List.iter2
                          (fun u'  ->
                             fun u  ->
                               match u' with
                               | FStar_Syntax_Syntax.U_unif u'' ->
                                   FStar_Syntax_Unionfind.univ_change u'' u
                               | uu____3235 ->
                                   failwith
                                     "Impossible! Expected universe unification variables")
                          univ_unif_vars us;
                        (let dt1 =
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Env.Beta;
                             FStar_TypeChecker_Env.UnfoldUntil
                               FStar_Syntax_Syntax.delta_constant;
                             FStar_TypeChecker_Env.Iota;
                             FStar_TypeChecker_Env.Zeta;
                             FStar_TypeChecker_Env.AllowUnboundUniverses] env
                             dt
                            in
                         (let uu____3239 =
                            let uu____3241 =
                              FStar_Syntax_Print.term_to_string dt1  in
                            Prims.op_Hat
                              "Checking nested positivity in the data constructor type: "
                              uu____3241
                             in
                          debug_log env uu____3239);
                         (let uu____3244 =
                            let uu____3245 = FStar_Syntax_Subst.compress dt1
                               in
                            uu____3245.FStar_Syntax_Syntax.n  in
                          match uu____3244 with
                          | FStar_Syntax_Syntax.Tm_arrow (dbs,c) ->
                              (debug_log env
                                 "Checked nested positivity in Tm_arrow data constructor type";
                               (let uu____3273 =
                                  FStar_List.splitAt num_ibs dbs  in
                                match uu____3273 with
                                | (ibs,dbs1) ->
                                    let ibs1 =
                                      FStar_Syntax_Subst.open_binders ibs  in
                                    let dbs2 =
                                      let uu____3337 =
                                        FStar_Syntax_Subst.opening_of_binders
                                          ibs1
                                         in
                                      FStar_Syntax_Subst.subst_binders
                                        uu____3337 dbs1
                                       in
                                    let c1 =
                                      let uu____3341 =
                                        FStar_Syntax_Subst.opening_of_binders
                                          ibs1
                                         in
                                      FStar_Syntax_Subst.subst_comp
                                        uu____3341 c
                                       in
                                    let uu____3344 =
                                      FStar_List.splitAt num_ibs args  in
                                    (match uu____3344 with
                                     | (args1,uu____3379) ->
                                         let subst1 =
                                           FStar_List.fold_left2
                                             (fun subst1  ->
                                                fun ib  ->
                                                  fun arg  ->
                                                    FStar_List.append subst1
                                                      [FStar_Syntax_Syntax.NT
                                                         ((FStar_Pervasives_Native.fst
                                                             ib),
                                                           (FStar_Pervasives_Native.fst
                                                              arg))]) [] ibs1
                                             args1
                                            in
                                         let dbs3 =
                                           FStar_Syntax_Subst.subst_binders
                                             subst1 dbs2
                                            in
                                         let c2 =
                                           let uu____3471 =
                                             FStar_Syntax_Subst.shift_subst
                                               (FStar_List.length dbs3)
                                               subst1
                                              in
                                           FStar_Syntax_Subst.subst_comp
                                             uu____3471 c1
                                            in
                                         ((let uu____3481 =
                                             let uu____3483 =
                                               let uu____3485 =
                                                 FStar_Syntax_Print.binders_to_string
                                                   "; " dbs3
                                                  in
                                               let uu____3488 =
                                                 let uu____3490 =
                                                   FStar_Syntax_Print.comp_to_string
                                                     c2
                                                    in
                                                 Prims.op_Hat ", and c: "
                                                   uu____3490
                                                  in
                                               Prims.op_Hat uu____3485
                                                 uu____3488
                                                in
                                             Prims.op_Hat
                                               "Checking nested positivity in the unfolded data constructor binders as: "
                                               uu____3483
                                              in
                                           debug_log env uu____3481);
                                          ty_nested_positive_in_type ty_lid
                                            (FStar_Syntax_Syntax.Tm_arrow
                                               (dbs3, c2)) ilid num_ibs
                                            unfolded env))))
                          | uu____3504 ->
                              (debug_log env
                                 "Checking nested positivity in the data constructor type that is not an arrow";
                               (let uu____3507 =
                                  let uu____3508 =
                                    FStar_Syntax_Subst.compress dt1  in
                                  uu____3508.FStar_Syntax_Syntax.n  in
                                ty_nested_positive_in_type ty_lid uu____3507
                                  ilid num_ibs unfolded env))))))

and (ty_nested_positive_in_type :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.term' ->
      FStar_Ident.lident ->
        Prims.int ->
          unfolded_memo_t -> FStar_TypeChecker_Env.env_t -> Prims.bool)
  =
  fun ty_lid  ->
    fun t  ->
      fun ilid  ->
        fun num_ibs  ->
          fun unfolded  ->
            fun env  ->
              match t with
              | FStar_Syntax_Syntax.Tm_app (t1,args) ->
                  (debug_log env
                     "Checking nested positivity in an Tm_app node, which is expected to be the ilid itself";
                   (let uu____3547 = try_get_fv t1  in
                    match uu____3547 with
                    | (fv,uu____3554) ->
                        let uu____3555 =
                          FStar_Ident.lid_equals
                            (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                            ilid
                           in
                        if uu____3555
                        then true
                        else
                          failwith "Impossible, expected the type to be ilid"))
              | FStar_Syntax_Syntax.Tm_arrow (sbs,c) ->
                  ((let uu____3587 =
                      let uu____3589 =
                        FStar_Syntax_Print.binders_to_string "; " sbs  in
                      Prims.op_Hat
                        "Checking nested positivity in an Tm_arrow node, with binders as: "
                        uu____3589
                       in
                    debug_log env uu____3587);
                   (let sbs1 = FStar_Syntax_Subst.open_binders sbs  in
                    let uu____3594 =
                      FStar_List.fold_left
                        (fun uu____3615  ->
                           fun b  ->
                             match uu____3615 with
                             | (r,env1) ->
                                 if Prims.op_Negation r
                                 then (r, env1)
                                 else
                                   (let uu____3646 =
                                      ty_strictly_positive_in_type ty_lid
                                        (FStar_Pervasives_Native.fst b).FStar_Syntax_Syntax.sort
                                        unfolded env1
                                       in
                                    let uu____3650 =
                                      FStar_TypeChecker_Env.push_binders env1
                                        [b]
                                       in
                                    (uu____3646, uu____3650))) (true, env)
                        sbs1
                       in
                    match uu____3594 with | (b,uu____3668) -> b))
              | uu____3671 ->
                  failwith "Nested positive check, unhandled case"

let (ty_positive_in_datacon :
  FStar_Ident.lident ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.binders ->
        FStar_Syntax_Syntax.universes ->
          unfolded_memo_t -> FStar_TypeChecker_Env.env -> Prims.bool)
  =
  fun ty_lid  ->
    fun dlid  ->
      fun ty_bs  ->
        fun us  ->
          fun unfolded  ->
            fun env  ->
              let uu____3707 = FStar_TypeChecker_Env.lookup_datacon env dlid
                 in
              match uu____3707 with
              | (univ_unif_vars,dt) ->
                  (FStar_List.iter2
                     (fun u'  ->
                        fun u  ->
                          match u' with
                          | FStar_Syntax_Syntax.U_unif u'' ->
                              FStar_Syntax_Unionfind.univ_change u'' u
                          | uu____3730 ->
                              failwith
                                "Impossible! Expected universe unification variables")
                     univ_unif_vars us;
                   (let uu____3733 =
                      let uu____3735 = FStar_Syntax_Print.term_to_string dt
                         in
                      Prims.op_Hat "Checking data constructor type: "
                        uu____3735
                       in
                    debug_log env uu____3733);
                   (let uu____3738 =
                      let uu____3739 = FStar_Syntax_Subst.compress dt  in
                      uu____3739.FStar_Syntax_Syntax.n  in
                    match uu____3738 with
                    | FStar_Syntax_Syntax.Tm_fvar uu____3743 ->
                        (debug_log env
                           "Data constructor type is simply an fvar, returning true";
                         true)
                    | FStar_Syntax_Syntax.Tm_arrow (dbs,uu____3748) ->
                        let dbs1 =
                          let uu____3778 =
                            FStar_List.splitAt (FStar_List.length ty_bs) dbs
                             in
                          FStar_Pervasives_Native.snd uu____3778  in
                        let dbs2 =
                          let uu____3828 =
                            FStar_Syntax_Subst.opening_of_binders ty_bs  in
                          FStar_Syntax_Subst.subst_binders uu____3828 dbs1
                           in
                        let dbs3 = FStar_Syntax_Subst.open_binders dbs2  in
                        ((let uu____3833 =
                            let uu____3835 =
                              let uu____3837 =
                                FStar_Util.string_of_int
                                  (FStar_List.length dbs3)
                                 in
                              Prims.op_Hat uu____3837 " binders"  in
                            Prims.op_Hat
                              "Data constructor type is an arrow type, so checking strict positivity in "
                              uu____3835
                             in
                          debug_log env uu____3833);
                         (let uu____3847 =
                            FStar_List.fold_left
                              (fun uu____3868  ->
                                 fun b  ->
                                   match uu____3868 with
                                   | (r,env1) ->
                                       if Prims.op_Negation r
                                       then (r, env1)
                                       else
                                         (let uu____3899 =
                                            ty_strictly_positive_in_type
                                              ty_lid
                                              (FStar_Pervasives_Native.fst b).FStar_Syntax_Syntax.sort
                                              unfolded env1
                                             in
                                          let uu____3903 =
                                            FStar_TypeChecker_Env.push_binders
                                              env1 [b]
                                             in
                                          (uu____3899, uu____3903)))
                              (true, env) dbs3
                             in
                          match uu____3847 with | (b,uu____3921) -> b))
                    | FStar_Syntax_Syntax.Tm_app (uu____3924,uu____3925) ->
                        (debug_log env
                           "Data constructor type is a Tm_app, so returning true";
                         true)
                    | FStar_Syntax_Syntax.Tm_uinst (t,univs1) ->
                        (debug_log env
                           "Data constructor type is a Tm_uinst, so recursing in the base type";
                         ty_strictly_positive_in_type ty_lid t unfolded env)
                    | uu____3961 ->
                        failwith
                          "Unexpected data constructor type when checking positivity"))
  
let (check_positivity :
  FStar_Syntax_Syntax.sigelt -> FStar_TypeChecker_Env.env -> Prims.bool) =
  fun ty  ->
    fun env  ->
      let unfolded_inductives = FStar_Util.mk_ref []  in
      let uu____3984 =
        match ty.FStar_Syntax_Syntax.sigel with
        | FStar_Syntax_Syntax.Sig_inductive_typ
            (lid,us,bs,uu____4000,uu____4001,uu____4002) -> (lid, us, bs)
        | uu____4011 -> failwith "Impossible!"  in
      match uu____3984 with
      | (ty_lid,ty_us,ty_bs) ->
          let uu____4023 = FStar_Syntax_Subst.univ_var_opening ty_us  in
          (match uu____4023 with
           | (ty_usubst,ty_us1) ->
               let env1 = FStar_TypeChecker_Env.push_univ_vars env ty_us1  in
               let env2 = FStar_TypeChecker_Env.push_binders env1 ty_bs  in
               let ty_bs1 = FStar_Syntax_Subst.subst_binders ty_usubst ty_bs
                  in
               let ty_bs2 = FStar_Syntax_Subst.open_binders ty_bs1  in
               let uu____4047 =
                 let uu____4050 =
                   FStar_TypeChecker_Env.datacons_of_typ env2 ty_lid  in
                 FStar_Pervasives_Native.snd uu____4050  in
               FStar_List.for_all
                 (fun d  ->
                    let uu____4064 =
                      FStar_List.map (fun s  -> FStar_Syntax_Syntax.U_name s)
                        ty_us1
                       in
                    ty_positive_in_datacon ty_lid d ty_bs2 uu____4064
                      unfolded_inductives env2) uu____4047)
  
let (check_exn_positivity :
  FStar_Ident.lid -> FStar_TypeChecker_Env.env -> Prims.bool) =
  fun data_ctor_lid  ->
    fun env  ->
      let unfolded_inductives = FStar_Util.mk_ref []  in
      ty_positive_in_datacon FStar_Parser_Const.exn_lid data_ctor_lid [] []
        unfolded_inductives env
  
let (datacon_typ : FStar_Syntax_Syntax.sigelt -> FStar_Syntax_Syntax.term) =
  fun data  ->
    match data.FStar_Syntax_Syntax.sigel with
    | FStar_Syntax_Syntax.Sig_datacon
        (uu____4099,uu____4100,t,uu____4102,uu____4103,uu____4104) -> t
    | uu____4111 -> failwith "Impossible!"
  
let (haseq_suffix : Prims.string) = "__uu___haseq" 
let (is_haseq_lid : FStar_Ident.lid -> Prims.bool) =
  fun lid  ->
    let str = lid.FStar_Ident.str  in
    let len = FStar_String.length str  in
    let haseq_suffix_len = FStar_String.length haseq_suffix  in
    (len > haseq_suffix_len) &&
      (let uu____4128 =
         let uu____4130 =
           FStar_String.substring str (len - haseq_suffix_len)
             haseq_suffix_len
            in
         FStar_String.compare uu____4130 haseq_suffix  in
       uu____4128 = Prims.int_zero)
  
let (get_haseq_axiom_lid : FStar_Ident.lid -> FStar_Ident.lid) =
  fun lid  ->
    let uu____4140 =
      let uu____4143 =
        let uu____4146 =
          FStar_Ident.id_of_text
            (Prims.op_Hat (lid.FStar_Ident.ident).FStar_Ident.idText
               haseq_suffix)
           in
        [uu____4146]  in
      FStar_List.append lid.FStar_Ident.ns uu____4143  in
    FStar_Ident.lid_of_ids uu____4140
  
let (get_optimized_haseq_axiom :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sigelt ->
      FStar_Syntax_Syntax.subst_elt Prims.list ->
        FStar_Syntax_Syntax.univ_names ->
          (FStar_Ident.lident * FStar_Syntax_Syntax.term *
            FStar_Syntax_Syntax.binders * FStar_Syntax_Syntax.binders *
            FStar_Syntax_Syntax.term))
  =
  fun en  ->
    fun ty  ->
      fun usubst  ->
        fun us  ->
          let uu____4192 =
            match ty.FStar_Syntax_Syntax.sigel with
            | FStar_Syntax_Syntax.Sig_inductive_typ
                (lid,uu____4206,bs,t,uu____4209,uu____4210) -> (lid, bs, t)
            | uu____4219 -> failwith "Impossible!"  in
          match uu____4192 with
          | (lid,bs,t) ->
              let bs1 = FStar_Syntax_Subst.subst_binders usubst bs  in
              let t1 =
                let uu____4242 =
                  FStar_Syntax_Subst.shift_subst (FStar_List.length bs1)
                    usubst
                   in
                FStar_Syntax_Subst.subst uu____4242 t  in
              let uu____4251 = FStar_Syntax_Subst.open_term bs1 t1  in
              (match uu____4251 with
               | (bs2,t2) ->
                   let ibs =
                     let uu____4269 =
                       let uu____4270 = FStar_Syntax_Subst.compress t2  in
                       uu____4270.FStar_Syntax_Syntax.n  in
                     match uu____4269 with
                     | FStar_Syntax_Syntax.Tm_arrow (ibs,uu____4274) -> ibs
                     | uu____4295 -> []  in
                   let ibs1 = FStar_Syntax_Subst.open_binders ibs  in
                   let ind =
                     let uu____4304 =
                       FStar_Syntax_Syntax.fvar lid
                         FStar_Syntax_Syntax.delta_constant
                         FStar_Pervasives_Native.None
                        in
                     let uu____4305 =
                       FStar_List.map
                         (fun u  -> FStar_Syntax_Syntax.U_name u) us
                        in
                     FStar_Syntax_Syntax.mk_Tm_uinst uu____4304 uu____4305
                      in
                   let ind1 =
                     let uu____4311 =
                       let uu____4316 =
                         FStar_List.map
                           (fun uu____4333  ->
                              match uu____4333 with
                              | (bv,aq) ->
                                  let uu____4352 =
                                    FStar_Syntax_Syntax.bv_to_name bv  in
                                  (uu____4352, aq)) bs2
                          in
                       FStar_Syntax_Syntax.mk_Tm_app ind uu____4316  in
                     uu____4311 FStar_Pervasives_Native.None
                       FStar_Range.dummyRange
                      in
                   let ind2 =
                     let uu____4358 =
                       let uu____4363 =
                         FStar_List.map
                           (fun uu____4380  ->
                              match uu____4380 with
                              | (bv,aq) ->
                                  let uu____4399 =
                                    FStar_Syntax_Syntax.bv_to_name bv  in
                                  (uu____4399, aq)) ibs1
                          in
                       FStar_Syntax_Syntax.mk_Tm_app ind1 uu____4363  in
                     uu____4358 FStar_Pervasives_Native.None
                       FStar_Range.dummyRange
                      in
                   let haseq_ind =
                     let uu____4405 =
                       let uu____4410 =
                         let uu____4411 = FStar_Syntax_Syntax.as_arg ind2  in
                         [uu____4411]  in
                       FStar_Syntax_Syntax.mk_Tm_app
                         FStar_Syntax_Util.t_haseq uu____4410
                        in
                     uu____4405 FStar_Pervasives_Native.None
                       FStar_Range.dummyRange
                      in
                   let bs' =
                     FStar_List.filter
                       (fun b  ->
                          let uu____4460 =
                            let uu____4461 = FStar_Syntax_Util.type_u ()  in
                            FStar_Pervasives_Native.fst uu____4461  in
                          FStar_TypeChecker_Rel.subtype_nosmt_force en
                            (FStar_Pervasives_Native.fst b).FStar_Syntax_Syntax.sort
                            uu____4460) bs2
                      in
                   let haseq_bs =
                     FStar_List.fold_left
                       (fun t3  ->
                          fun b  ->
                            let uu____4474 =
                              let uu____4477 =
                                let uu____4482 =
                                  let uu____4483 =
                                    let uu____4492 =
                                      FStar_Syntax_Syntax.bv_to_name
                                        (FStar_Pervasives_Native.fst b)
                                       in
                                    FStar_Syntax_Syntax.as_arg uu____4492  in
                                  [uu____4483]  in
                                FStar_Syntax_Syntax.mk_Tm_app
                                  FStar_Syntax_Util.t_haseq uu____4482
                                 in
                              uu____4477 FStar_Pervasives_Native.None
                                FStar_Range.dummyRange
                               in
                            FStar_Syntax_Util.mk_conj t3 uu____4474)
                       FStar_Syntax_Util.t_true bs'
                      in
                   let fml = FStar_Syntax_Util.mk_imp haseq_bs haseq_ind  in
                   let fml1 =
                     let uu___630_4515 = fml  in
                     let uu____4516 =
                       let uu____4517 =
                         let uu____4524 =
                           let uu____4525 =
                             let uu____4546 =
                               FStar_Syntax_Syntax.binders_to_names ibs1  in
                             let uu____4551 =
                               let uu____4564 =
                                 let uu____4575 =
                                   FStar_Syntax_Syntax.as_arg haseq_ind  in
                                 [uu____4575]  in
                               [uu____4564]  in
                             (uu____4546, uu____4551)  in
                           FStar_Syntax_Syntax.Meta_pattern uu____4525  in
                         (fml, uu____4524)  in
                       FStar_Syntax_Syntax.Tm_meta uu____4517  in
                     {
                       FStar_Syntax_Syntax.n = uu____4516;
                       FStar_Syntax_Syntax.pos =
                         (uu___630_4515.FStar_Syntax_Syntax.pos);
                       FStar_Syntax_Syntax.vars =
                         (uu___630_4515.FStar_Syntax_Syntax.vars)
                     }  in
                   let fml2 =
                     FStar_List.fold_right
                       (fun b  ->
                          fun t3  ->
                            let uu____4644 =
                              let uu____4649 =
                                let uu____4650 =
                                  let uu____4659 =
                                    let uu____4660 =
                                      FStar_Syntax_Subst.close [b] t3  in
                                    FStar_Syntax_Util.abs
                                      [((FStar_Pervasives_Native.fst b),
                                         FStar_Pervasives_Native.None)]
                                      uu____4660 FStar_Pervasives_Native.None
                                     in
                                  FStar_Syntax_Syntax.as_arg uu____4659  in
                                [uu____4650]  in
                              FStar_Syntax_Syntax.mk_Tm_app
                                FStar_Syntax_Util.tforall uu____4649
                               in
                            uu____4644 FStar_Pervasives_Native.None
                              FStar_Range.dummyRange) ibs1 fml1
                      in
                   let fml3 =
                     FStar_List.fold_right
                       (fun b  ->
                          fun t3  ->
                            let uu____4713 =
                              let uu____4718 =
                                let uu____4719 =
                                  let uu____4728 =
                                    let uu____4729 =
                                      FStar_Syntax_Subst.close [b] t3  in
                                    FStar_Syntax_Util.abs
                                      [((FStar_Pervasives_Native.fst b),
                                         FStar_Pervasives_Native.None)]
                                      uu____4729 FStar_Pervasives_Native.None
                                     in
                                  FStar_Syntax_Syntax.as_arg uu____4728  in
                                [uu____4719]  in
                              FStar_Syntax_Syntax.mk_Tm_app
                                FStar_Syntax_Util.tforall uu____4718
                               in
                            uu____4713 FStar_Pervasives_Native.None
                              FStar_Range.dummyRange) bs2 fml2
                      in
                   let axiom_lid = get_haseq_axiom_lid lid  in
                   (axiom_lid, fml3, bs2, ibs1, haseq_bs))
  
let (optimized_haseq_soundness_for_data :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.sigelt ->
      FStar_Syntax_Syntax.subst_elt Prims.list ->
        FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.term)
  =
  fun ty_lid  ->
    fun data  ->
      fun usubst  ->
        fun bs  ->
          let dt = datacon_typ data  in
          let dt1 = FStar_Syntax_Subst.subst usubst dt  in
          let uu____4804 =
            let uu____4805 = FStar_Syntax_Subst.compress dt1  in
            uu____4805.FStar_Syntax_Syntax.n  in
          match uu____4804 with
          | FStar_Syntax_Syntax.Tm_arrow (dbs,uu____4809) ->
              let dbs1 =
                let uu____4839 =
                  FStar_List.splitAt (FStar_List.length bs) dbs  in
                FStar_Pervasives_Native.snd uu____4839  in
              let dbs2 =
                let uu____4889 = FStar_Syntax_Subst.opening_of_binders bs  in
                FStar_Syntax_Subst.subst_binders uu____4889 dbs1  in
              let dbs3 = FStar_Syntax_Subst.open_binders dbs2  in
              let cond =
                FStar_List.fold_left
                  (fun t  ->
                     fun b  ->
                       let haseq_b =
                         let uu____4904 =
                           let uu____4909 =
                             let uu____4910 =
                               FStar_Syntax_Syntax.as_arg
                                 (FStar_Pervasives_Native.fst b).FStar_Syntax_Syntax.sort
                                in
                             [uu____4910]  in
                           FStar_Syntax_Syntax.mk_Tm_app
                             FStar_Syntax_Util.t_haseq uu____4909
                            in
                         uu____4904 FStar_Pervasives_Native.None
                           FStar_Range.dummyRange
                          in
                       let sort_range =
                         ((FStar_Pervasives_Native.fst b).FStar_Syntax_Syntax.sort).FStar_Syntax_Syntax.pos
                          in
                       let haseq_b1 =
                         let uu____4941 =
                           FStar_Util.format1
                             "Failed to prove that the type '%s' supports decidable equality because of this argument; add either the 'noeq' or 'unopteq' qualifier"
                             ty_lid.FStar_Ident.str
                            in
                         FStar_TypeChecker_Util.label uu____4941 sort_range
                           haseq_b
                          in
                       FStar_Syntax_Util.mk_conj t haseq_b1)
                  FStar_Syntax_Util.t_true dbs3
                 in
              FStar_List.fold_right
                (fun b  ->
                   fun t  ->
                     let uu____4949 =
                       let uu____4954 =
                         let uu____4955 =
                           let uu____4964 =
                             let uu____4965 = FStar_Syntax_Subst.close [b] t
                                in
                             FStar_Syntax_Util.abs
                               [((FStar_Pervasives_Native.fst b),
                                  FStar_Pervasives_Native.None)] uu____4965
                               FStar_Pervasives_Native.None
                              in
                           FStar_Syntax_Syntax.as_arg uu____4964  in
                         [uu____4955]  in
                       FStar_Syntax_Syntax.mk_Tm_app
                         FStar_Syntax_Util.tforall uu____4954
                        in
                     uu____4949 FStar_Pervasives_Native.None
                       FStar_Range.dummyRange) dbs3 cond
          | uu____5012 -> FStar_Syntax_Util.t_true
  
let (optimized_haseq_ty :
  FStar_Syntax_Syntax.sigelts ->
    FStar_Syntax_Syntax.subst_elt Prims.list ->
      FStar_Syntax_Syntax.univ_name Prims.list ->
        ((FStar_Ident.lident * FStar_Syntax_Syntax.term) Prims.list *
          FStar_TypeChecker_Env.env * FStar_Syntax_Syntax.term'
          FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.term'
          FStar_Syntax_Syntax.syntax) ->
          FStar_Syntax_Syntax.sigelt ->
            ((FStar_Ident.lident * FStar_Syntax_Syntax.term) Prims.list *
              FStar_TypeChecker_Env.env * FStar_Syntax_Syntax.term'
              FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.term'
              FStar_Syntax_Syntax.syntax))
  =
  fun all_datas_in_the_bundle  ->
    fun usubst  ->
      fun us  ->
        fun acc  ->
          fun ty  ->
            let lid =
              match ty.FStar_Syntax_Syntax.sigel with
              | FStar_Syntax_Syntax.Sig_inductive_typ
                  (lid,uu____5103,uu____5104,uu____5105,uu____5106,uu____5107)
                  -> lid
              | uu____5116 -> failwith "Impossible!"  in
            let uu____5118 = acc  in
            match uu____5118 with
            | (uu____5155,en,uu____5157,uu____5158) ->
                let uu____5179 = get_optimized_haseq_axiom en ty usubst us
                   in
                (match uu____5179 with
                 | (axiom_lid,fml,bs,ibs,haseq_bs) ->
                     let guard = FStar_Syntax_Util.mk_conj haseq_bs fml  in
                     let uu____5216 = acc  in
                     (match uu____5216 with
                      | (l_axioms,env,guard',cond') ->
                          let env1 =
                            FStar_TypeChecker_Env.push_binders env bs  in
                          let env2 =
                            FStar_TypeChecker_Env.push_binders env1 ibs  in
                          let t_datas =
                            FStar_List.filter
                              (fun s  ->
                                 match s.FStar_Syntax_Syntax.sigel with
                                 | FStar_Syntax_Syntax.Sig_datacon
                                     (uu____5291,uu____5292,uu____5293,t_lid,uu____5295,uu____5296)
                                     -> t_lid = lid
                                 | uu____5303 -> failwith "Impossible")
                              all_datas_in_the_bundle
                             in
                          let cond =
                            FStar_List.fold_left
                              (fun acc1  ->
                                 fun d  ->
                                   let uu____5318 =
                                     optimized_haseq_soundness_for_data lid d
                                       usubst bs
                                      in
                                   FStar_Syntax_Util.mk_conj acc1 uu____5318)
                              FStar_Syntax_Util.t_true t_datas
                             in
                          let uu____5321 =
                            FStar_Syntax_Util.mk_conj guard' guard  in
                          let uu____5324 =
                            FStar_Syntax_Util.mk_conj cond' cond  in
                          ((FStar_List.append l_axioms [(axiom_lid, fml)]),
                            env2, uu____5321, uu____5324)))
  
let (optimized_haseq_scheme :
  FStar_Syntax_Syntax.sigelt ->
    FStar_Syntax_Syntax.sigelt Prims.list ->
      FStar_Syntax_Syntax.sigelt Prims.list ->
        FStar_TypeChecker_Env.env_t -> FStar_Syntax_Syntax.sigelt Prims.list)
  =
  fun sig_bndle  ->
    fun tcs  ->
      fun datas  ->
        fun env0  ->
          let uu____5382 =
            let ty = FStar_List.hd tcs  in
            match ty.FStar_Syntax_Syntax.sigel with
            | FStar_Syntax_Syntax.Sig_inductive_typ
                (uu____5392,us,uu____5394,t,uu____5396,uu____5397) -> 
                (us, t)
            | uu____5406 -> failwith "Impossible!"  in
          match uu____5382 with
          | (us,t) ->
              let uu____5416 = FStar_Syntax_Subst.univ_var_opening us  in
              (match uu____5416 with
               | (usubst,us1) ->
                   let env = FStar_TypeChecker_Env.push_sigelt env0 sig_bndle
                      in
                   ((env.FStar_TypeChecker_Env.solver).FStar_TypeChecker_Env.push
                      "haseq";
                    (env.FStar_TypeChecker_Env.solver).FStar_TypeChecker_Env.encode_sig
                      env sig_bndle;
                    (let env1 = FStar_TypeChecker_Env.push_univ_vars env us1
                        in
                     let uu____5442 =
                       FStar_List.fold_left
                         (optimized_haseq_ty datas usubst us1)
                         ([], env1, FStar_Syntax_Util.t_true,
                           FStar_Syntax_Util.t_true) tcs
                        in
                     match uu____5442 with
                     | (axioms,env2,guard,cond) ->
                         let phi =
                           let uu____5520 = FStar_Syntax_Util.arrow_formals t
                              in
                           match uu____5520 with
                           | (uu____5535,t1) ->
                               let uu____5557 =
                                 FStar_Syntax_Util.is_eqtype_no_unrefine t1
                                  in
                               if uu____5557
                               then cond
                               else FStar_Syntax_Util.mk_imp guard cond
                            in
                         let uu____5562 =
                           FStar_TypeChecker_TcTerm.tc_trivial_guard env2 phi
                            in
                         (match uu____5562 with
                          | (phi1,uu____5570) ->
                              ((let uu____5572 =
                                  FStar_TypeChecker_Env.should_verify env2
                                   in
                                if uu____5572
                                then
                                  let uu____5575 =
                                    FStar_TypeChecker_Env.guard_of_guard_formula
                                      (FStar_TypeChecker_Common.NonTrivial
                                         phi1)
                                     in
                                  FStar_TypeChecker_Rel.force_trivial_guard
                                    env2 uu____5575
                                else ());
                               (let ses =
                                  FStar_List.fold_left
                                    (fun l  ->
                                       fun uu____5593  ->
                                         match uu____5593 with
                                         | (lid,fml) ->
                                             let fml1 =
                                               FStar_Syntax_Subst.close_univ_vars
                                                 us1 fml
                                                in
                                             FStar_List.append l
                                               [{
                                                  FStar_Syntax_Syntax.sigel =
                                                    (FStar_Syntax_Syntax.Sig_assume
                                                       (lid, us1, fml1));
                                                  FStar_Syntax_Syntax.sigrng
                                                    = FStar_Range.dummyRange;
                                                  FStar_Syntax_Syntax.sigquals
                                                    = [];
                                                  FStar_Syntax_Syntax.sigmeta
                                                    =
                                                    FStar_Syntax_Syntax.default_sigmeta;
                                                  FStar_Syntax_Syntax.sigattrs
                                                    = []
                                                }]) [] axioms
                                   in
                                (env2.FStar_TypeChecker_Env.solver).FStar_TypeChecker_Env.pop
                                  "haseq";
                                ses))))))
  
let (unoptimized_haseq_data :
  FStar_Syntax_Syntax.subst_elt Prims.list ->
    FStar_Syntax_Syntax.binders ->
      FStar_Syntax_Syntax.term ->
        FStar_Ident.lident Prims.list ->
          FStar_Syntax_Syntax.term ->
            FStar_Syntax_Syntax.sigelt ->
              FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun usubst  ->
    fun bs  ->
      fun haseq_ind  ->
        fun mutuals  ->
          fun acc  ->
            fun data  ->
              let rec is_mutual t =
                let uu____5665 =
                  let uu____5666 = FStar_Syntax_Subst.compress t  in
                  uu____5666.FStar_Syntax_Syntax.n  in
                match uu____5665 with
                | FStar_Syntax_Syntax.Tm_fvar fv ->
                    FStar_List.existsb
                      (fun lid  ->
                         FStar_Ident.lid_equals lid
                           (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v)
                      mutuals
                | FStar_Syntax_Syntax.Tm_uinst (t',uu____5674) ->
                    is_mutual t'
                | FStar_Syntax_Syntax.Tm_refine (bv,t') ->
                    is_mutual bv.FStar_Syntax_Syntax.sort
                | FStar_Syntax_Syntax.Tm_app (t',args) ->
                    let uu____5711 = is_mutual t'  in
                    if uu____5711
                    then true
                    else
                      (let uu____5718 =
                         FStar_List.map FStar_Pervasives_Native.fst args  in
                       exists_mutual uu____5718)
                | FStar_Syntax_Syntax.Tm_meta (t',uu____5738) -> is_mutual t'
                | uu____5743 -> false
              
              and exists_mutual uu___1_5745 =
                match uu___1_5745 with
                | [] -> false
                | hd1::tl1 -> (is_mutual hd1) || (exists_mutual tl1)
               in
              let dt = datacon_typ data  in
              let dt1 = FStar_Syntax_Subst.subst usubst dt  in
              let uu____5766 =
                let uu____5767 = FStar_Syntax_Subst.compress dt1  in
                uu____5767.FStar_Syntax_Syntax.n  in
              match uu____5766 with
              | FStar_Syntax_Syntax.Tm_arrow (dbs,uu____5773) ->
                  let dbs1 =
                    let uu____5803 =
                      FStar_List.splitAt (FStar_List.length bs) dbs  in
                    FStar_Pervasives_Native.snd uu____5803  in
                  let dbs2 =
                    let uu____5853 = FStar_Syntax_Subst.opening_of_binders bs
                       in
                    FStar_Syntax_Subst.subst_binders uu____5853 dbs1  in
                  let dbs3 = FStar_Syntax_Subst.open_binders dbs2  in
                  let cond =
                    FStar_List.fold_left
                      (fun t  ->
                         fun b  ->
                           let sort =
                             (FStar_Pervasives_Native.fst b).FStar_Syntax_Syntax.sort
                              in
                           let haseq_sort =
                             let uu____5873 =
                               let uu____5878 =
                                 let uu____5879 =
                                   FStar_Syntax_Syntax.as_arg
                                     (FStar_Pervasives_Native.fst b).FStar_Syntax_Syntax.sort
                                    in
                                 [uu____5879]  in
                               FStar_Syntax_Syntax.mk_Tm_app
                                 FStar_Syntax_Util.t_haseq uu____5878
                                in
                             uu____5873 FStar_Pervasives_Native.None
                               FStar_Range.dummyRange
                              in
                           let haseq_sort1 =
                             let uu____5909 = is_mutual sort  in
                             if uu____5909
                             then
                               FStar_Syntax_Util.mk_imp haseq_ind haseq_sort
                             else haseq_sort  in
                           FStar_Syntax_Util.mk_conj t haseq_sort1)
                      FStar_Syntax_Util.t_true dbs3
                     in
                  let cond1 =
                    FStar_List.fold_right
                      (fun b  ->
                         fun t  ->
                           let uu____5922 =
                             let uu____5927 =
                               let uu____5928 =
                                 let uu____5937 =
                                   let uu____5938 =
                                     FStar_Syntax_Subst.close [b] t  in
                                   FStar_Syntax_Util.abs
                                     [((FStar_Pervasives_Native.fst b),
                                        FStar_Pervasives_Native.None)]
                                     uu____5938 FStar_Pervasives_Native.None
                                    in
                                 FStar_Syntax_Syntax.as_arg uu____5937  in
                               [uu____5928]  in
                             FStar_Syntax_Syntax.mk_Tm_app
                               FStar_Syntax_Util.tforall uu____5927
                              in
                           uu____5922 FStar_Pervasives_Native.None
                             FStar_Range.dummyRange) dbs3 cond
                     in
                  FStar_Syntax_Util.mk_conj acc cond1
              | uu____5985 -> acc
  
let (unoptimized_haseq_ty :
  FStar_Syntax_Syntax.sigelt Prims.list ->
    FStar_Ident.lident Prims.list ->
      FStar_Syntax_Syntax.subst_elt Prims.list ->
        FStar_Syntax_Syntax.univ_name Prims.list ->
          FStar_Syntax_Syntax.term ->
            FStar_Syntax_Syntax.sigelt ->
              FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun all_datas_in_the_bundle  ->
    fun mutuals  ->
      fun usubst  ->
        fun us  ->
          fun acc  ->
            fun ty  ->
              let uu____6035 =
                match ty.FStar_Syntax_Syntax.sigel with
                | FStar_Syntax_Syntax.Sig_inductive_typ
                    (lid,uu____6057,bs,t,uu____6060,d_lids) ->
                    (lid, bs, t, d_lids)
                | uu____6072 -> failwith "Impossible!"  in
              match uu____6035 with
              | (lid,bs,t,d_lids) ->
                  let bs1 = FStar_Syntax_Subst.subst_binders usubst bs  in
                  let t1 =
                    let uu____6096 =
                      FStar_Syntax_Subst.shift_subst (FStar_List.length bs1)
                        usubst
                       in
                    FStar_Syntax_Subst.subst uu____6096 t  in
                  let uu____6105 = FStar_Syntax_Subst.open_term bs1 t1  in
                  (match uu____6105 with
                   | (bs2,t2) ->
                       let ibs =
                         let uu____6115 =
                           let uu____6116 = FStar_Syntax_Subst.compress t2
                              in
                           uu____6116.FStar_Syntax_Syntax.n  in
                         match uu____6115 with
                         | FStar_Syntax_Syntax.Tm_arrow (ibs,uu____6120) ->
                             ibs
                         | uu____6141 -> []  in
                       let ibs1 = FStar_Syntax_Subst.open_binders ibs  in
                       let ind =
                         let uu____6150 =
                           FStar_Syntax_Syntax.fvar lid
                             FStar_Syntax_Syntax.delta_constant
                             FStar_Pervasives_Native.None
                            in
                         let uu____6151 =
                           FStar_List.map
                             (fun u  -> FStar_Syntax_Syntax.U_name u) us
                            in
                         FStar_Syntax_Syntax.mk_Tm_uinst uu____6150
                           uu____6151
                          in
                       let ind1 =
                         let uu____6157 =
                           let uu____6162 =
                             FStar_List.map
                               (fun uu____6179  ->
                                  match uu____6179 with
                                  | (bv,aq) ->
                                      let uu____6198 =
                                        FStar_Syntax_Syntax.bv_to_name bv  in
                                      (uu____6198, aq)) bs2
                              in
                           FStar_Syntax_Syntax.mk_Tm_app ind uu____6162  in
                         uu____6157 FStar_Pervasives_Native.None
                           FStar_Range.dummyRange
                          in
                       let ind2 =
                         let uu____6204 =
                           let uu____6209 =
                             FStar_List.map
                               (fun uu____6226  ->
                                  match uu____6226 with
                                  | (bv,aq) ->
                                      let uu____6245 =
                                        FStar_Syntax_Syntax.bv_to_name bv  in
                                      (uu____6245, aq)) ibs1
                              in
                           FStar_Syntax_Syntax.mk_Tm_app ind1 uu____6209  in
                         uu____6204 FStar_Pervasives_Native.None
                           FStar_Range.dummyRange
                          in
                       let haseq_ind =
                         let uu____6251 =
                           let uu____6256 =
                             let uu____6257 = FStar_Syntax_Syntax.as_arg ind2
                                in
                             [uu____6257]  in
                           FStar_Syntax_Syntax.mk_Tm_app
                             FStar_Syntax_Util.t_haseq uu____6256
                            in
                         uu____6251 FStar_Pervasives_Native.None
                           FStar_Range.dummyRange
                          in
                       let t_datas =
                         FStar_List.filter
                           (fun s  ->
                              match s.FStar_Syntax_Syntax.sigel with
                              | FStar_Syntax_Syntax.Sig_datacon
                                  (uu____6294,uu____6295,uu____6296,t_lid,uu____6298,uu____6299)
                                  -> t_lid = lid
                              | uu____6306 -> failwith "Impossible")
                           all_datas_in_the_bundle
                          in
                       let data_cond =
                         FStar_List.fold_left
                           (unoptimized_haseq_data usubst bs2 haseq_ind
                              mutuals) FStar_Syntax_Util.t_true t_datas
                          in
                       let fml = FStar_Syntax_Util.mk_imp data_cond haseq_ind
                          in
                       let fml1 =
                         let uu___867_6318 = fml  in
                         let uu____6319 =
                           let uu____6320 =
                             let uu____6327 =
                               let uu____6328 =
                                 let uu____6349 =
                                   FStar_Syntax_Syntax.binders_to_names ibs1
                                    in
                                 let uu____6354 =
                                   let uu____6367 =
                                     let uu____6378 =
                                       FStar_Syntax_Syntax.as_arg haseq_ind
                                        in
                                     [uu____6378]  in
                                   [uu____6367]  in
                                 (uu____6349, uu____6354)  in
                               FStar_Syntax_Syntax.Meta_pattern uu____6328
                                in
                             (fml, uu____6327)  in
                           FStar_Syntax_Syntax.Tm_meta uu____6320  in
                         {
                           FStar_Syntax_Syntax.n = uu____6319;
                           FStar_Syntax_Syntax.pos =
                             (uu___867_6318.FStar_Syntax_Syntax.pos);
                           FStar_Syntax_Syntax.vars =
                             (uu___867_6318.FStar_Syntax_Syntax.vars)
                         }  in
                       let fml2 =
                         FStar_List.fold_right
                           (fun b  ->
                              fun t3  ->
                                let uu____6447 =
                                  let uu____6452 =
                                    let uu____6453 =
                                      let uu____6462 =
                                        let uu____6463 =
                                          FStar_Syntax_Subst.close [b] t3  in
                                        FStar_Syntax_Util.abs
                                          [((FStar_Pervasives_Native.fst b),
                                             FStar_Pervasives_Native.None)]
                                          uu____6463
                                          FStar_Pervasives_Native.None
                                         in
                                      FStar_Syntax_Syntax.as_arg uu____6462
                                       in
                                    [uu____6453]  in
                                  FStar_Syntax_Syntax.mk_Tm_app
                                    FStar_Syntax_Util.tforall uu____6452
                                   in
                                uu____6447 FStar_Pervasives_Native.None
                                  FStar_Range.dummyRange) ibs1 fml1
                          in
                       let fml3 =
                         FStar_List.fold_right
                           (fun b  ->
                              fun t3  ->
                                let uu____6516 =
                                  let uu____6521 =
                                    let uu____6522 =
                                      let uu____6531 =
                                        let uu____6532 =
                                          FStar_Syntax_Subst.close [b] t3  in
                                        FStar_Syntax_Util.abs
                                          [((FStar_Pervasives_Native.fst b),
                                             FStar_Pervasives_Native.None)]
                                          uu____6532
                                          FStar_Pervasives_Native.None
                                         in
                                      FStar_Syntax_Syntax.as_arg uu____6531
                                       in
                                    [uu____6522]  in
                                  FStar_Syntax_Syntax.mk_Tm_app
                                    FStar_Syntax_Util.tforall uu____6521
                                   in
                                uu____6516 FStar_Pervasives_Native.None
                                  FStar_Range.dummyRange) bs2 fml2
                          in
                       FStar_Syntax_Util.mk_conj acc fml3)
  
let (unoptimized_haseq_scheme :
  FStar_Syntax_Syntax.sigelt ->
    FStar_Syntax_Syntax.sigelt Prims.list ->
      FStar_Syntax_Syntax.sigelt Prims.list ->
        FStar_TypeChecker_Env.env_t -> FStar_Syntax_Syntax.sigelt Prims.list)
  =
  fun sig_bndle  ->
    fun tcs  ->
      fun datas  ->
        fun env0  ->
          let mutuals =
            FStar_List.map
              (fun ty  ->
                 match ty.FStar_Syntax_Syntax.sigel with
                 | FStar_Syntax_Syntax.Sig_inductive_typ
                     (lid,uu____6624,uu____6625,uu____6626,uu____6627,uu____6628)
                     -> lid
                 | uu____6637 -> failwith "Impossible!") tcs
             in
          let uu____6639 =
            let ty = FStar_List.hd tcs  in
            match ty.FStar_Syntax_Syntax.sigel with
            | FStar_Syntax_Syntax.Sig_inductive_typ
                (lid,us,uu____6651,uu____6652,uu____6653,uu____6654) ->
                (lid, us)
            | uu____6663 -> failwith "Impossible!"  in
          match uu____6639 with
          | (lid,us) ->
              let uu____6673 = FStar_Syntax_Subst.univ_var_opening us  in
              (match uu____6673 with
               | (usubst,us1) ->
                   let fml =
                     FStar_List.fold_left
                       (unoptimized_haseq_ty datas mutuals usubst us1)
                       FStar_Syntax_Util.t_true tcs
                      in
                   let se =
                     let uu____6700 =
                       let uu____6701 =
                         let uu____6708 = get_haseq_axiom_lid lid  in
                         (uu____6708, us1, fml)  in
                       FStar_Syntax_Syntax.Sig_assume uu____6701  in
                     {
                       FStar_Syntax_Syntax.sigel = uu____6700;
                       FStar_Syntax_Syntax.sigrng = FStar_Range.dummyRange;
                       FStar_Syntax_Syntax.sigquals = [];
                       FStar_Syntax_Syntax.sigmeta =
                         FStar_Syntax_Syntax.default_sigmeta;
                       FStar_Syntax_Syntax.sigattrs = []
                     }  in
                   [se])
  
let (check_inductive_well_typedness :
  FStar_TypeChecker_Env.env_t ->
    FStar_Syntax_Syntax.sigelt Prims.list ->
      FStar_Syntax_Syntax.qualifier Prims.list ->
        FStar_Ident.lident Prims.list ->
          (FStar_Syntax_Syntax.sigelt * FStar_Syntax_Syntax.sigelt Prims.list
            * FStar_Syntax_Syntax.sigelt Prims.list))
  =
  fun env  ->
    fun ses  ->
      fun quals  ->
        fun lids  ->
          let uu____6762 =
            FStar_All.pipe_right ses
              (FStar_List.partition
                 (fun uu___2_6787  ->
                    match uu___2_6787 with
                    | {
                        FStar_Syntax_Syntax.sigel =
                          FStar_Syntax_Syntax.Sig_inductive_typ uu____6789;
                        FStar_Syntax_Syntax.sigrng = uu____6790;
                        FStar_Syntax_Syntax.sigquals = uu____6791;
                        FStar_Syntax_Syntax.sigmeta = uu____6792;
                        FStar_Syntax_Syntax.sigattrs = uu____6793;_} -> true
                    | uu____6815 -> false))
             in
          match uu____6762 with
          | (tys,datas) ->
              ((let uu____6838 =
                  FStar_All.pipe_right datas
                    (FStar_Util.for_some
                       (fun uu___3_6849  ->
                          match uu___3_6849 with
                          | {
                              FStar_Syntax_Syntax.sigel =
                                FStar_Syntax_Syntax.Sig_datacon uu____6851;
                              FStar_Syntax_Syntax.sigrng = uu____6852;
                              FStar_Syntax_Syntax.sigquals = uu____6853;
                              FStar_Syntax_Syntax.sigmeta = uu____6854;
                              FStar_Syntax_Syntax.sigattrs = uu____6855;_} ->
                              false
                          | uu____6876 -> true))
                   in
                if uu____6838
                then
                  let uu____6879 = FStar_TypeChecker_Env.get_range env  in
                  FStar_Errors.raise_error
                    (FStar_Errors.Fatal_NonInductiveInMutuallyDefinedType,
                      "Mutually defined type contains a non-inductive element")
                    uu____6879
                else ());
               (let univs1 =
                  if (FStar_List.length tys) = Prims.int_zero
                  then []
                  else
                    (let uu____6894 =
                       let uu____6895 = FStar_List.hd tys  in
                       uu____6895.FStar_Syntax_Syntax.sigel  in
                     match uu____6894 with
                     | FStar_Syntax_Syntax.Sig_inductive_typ
                         (uu____6898,uvs,uu____6900,uu____6901,uu____6902,uu____6903)
                         -> uvs
                     | uu____6912 -> failwith "Impossible, can't happen!")
                   in
                let env0 = env  in
                let uu____6917 =
                  FStar_List.fold_right
                    (fun tc  ->
                       fun uu____6956  ->
                         match uu____6956 with
                         | (env1,all_tcs,g) ->
                             let uu____6996 = tc_tycon env1 tc  in
                             (match uu____6996 with
                              | (env2,tc1,tc_u,guard) ->
                                  let g' =
                                    FStar_TypeChecker_Rel.universe_inequality
                                      FStar_Syntax_Syntax.U_zero tc_u
                                     in
                                  ((let uu____7023 =
                                      FStar_TypeChecker_Env.debug env2
                                        FStar_Options.Low
                                       in
                                    if uu____7023
                                    then
                                      let uu____7026 =
                                        FStar_Syntax_Print.sigelt_to_string
                                          tc1
                                         in
                                      FStar_Util.print1
                                        "Checked inductive: %s\n" uu____7026
                                    else ());
                                   (let uu____7031 =
                                      let uu____7032 =
                                        FStar_TypeChecker_Env.conj_guard
                                          guard g'
                                         in
                                      FStar_TypeChecker_Env.conj_guard g
                                        uu____7032
                                       in
                                    (env2, ((tc1, tc_u) :: all_tcs),
                                      uu____7031))))) tys
                    (env, [], FStar_TypeChecker_Env.trivial_guard)
                   in
                match uu____6917 with
                | (env1,tcs,g) ->
                    let uu____7078 =
                      FStar_List.fold_right
                        (fun se  ->
                           fun uu____7100  ->
                             match uu____7100 with
                             | (datas1,g1) ->
                                 let uu____7119 =
                                   let uu____7124 = tc_data env1 tcs  in
                                   uu____7124 se  in
                                 (match uu____7119 with
                                  | (data,g') ->
                                      let uu____7141 =
                                        FStar_TypeChecker_Env.conj_guard g1
                                          g'
                                         in
                                      ((data :: datas1), uu____7141))) datas
                        ([], g)
                       in
                    (match uu____7078 with
                     | (datas1,g1) ->
                         let uu____7162 =
                           let tc_universe_vars =
                             FStar_List.map FStar_Pervasives_Native.snd tcs
                              in
                           let g2 =
                             let uu___976_7179 = g1  in
                             {
                               FStar_TypeChecker_Env.guard_f =
                                 (uu___976_7179.FStar_TypeChecker_Env.guard_f);
                               FStar_TypeChecker_Env.deferred =
                                 (uu___976_7179.FStar_TypeChecker_Env.deferred);
                               FStar_TypeChecker_Env.univ_ineqs =
                                 (tc_universe_vars,
                                   (FStar_Pervasives_Native.snd
                                      g1.FStar_TypeChecker_Env.univ_ineqs));
                               FStar_TypeChecker_Env.implicits =
                                 (uu___976_7179.FStar_TypeChecker_Env.implicits)
                             }  in
                           (let uu____7189 =
                              FStar_All.pipe_left
                                (FStar_TypeChecker_Env.debug env0)
                                (FStar_Options.Other "GenUniverses")
                               in
                            if uu____7189
                            then
                              let uu____7194 =
                                FStar_TypeChecker_Rel.guard_to_string env1 g2
                                 in
                              FStar_Util.print1
                                "@@@@@@Guard before (possible) generalization: %s\n"
                                uu____7194
                            else ());
                           FStar_TypeChecker_Rel.force_trivial_guard env0 g2;
                           if (FStar_List.length univs1) = Prims.int_zero
                           then generalize_and_inst_within env0 tcs datas1
                           else
                             (let uu____7213 =
                                FStar_List.map FStar_Pervasives_Native.fst
                                  tcs
                                 in
                              (uu____7213, datas1))
                            in
                         (match uu____7162 with
                          | (tcs1,datas2) ->
                              let sig_bndle =
                                let uu____7245 =
                                  FStar_TypeChecker_Env.get_range env0  in
                                let uu____7246 =
                                  FStar_List.collect
                                    (fun s  -> s.FStar_Syntax_Syntax.sigattrs)
                                    ses
                                   in
                                {
                                  FStar_Syntax_Syntax.sigel =
                                    (FStar_Syntax_Syntax.Sig_bundle
                                       ((FStar_List.append tcs1 datas2),
                                         lids));
                                  FStar_Syntax_Syntax.sigrng = uu____7245;
                                  FStar_Syntax_Syntax.sigquals = quals;
                                  FStar_Syntax_Syntax.sigmeta =
                                    FStar_Syntax_Syntax.default_sigmeta;
                                  FStar_Syntax_Syntax.sigattrs = uu____7246
                                }  in
                              (FStar_All.pipe_right tcs1
                                 (FStar_List.iter
                                    (fun se  ->
                                       match se.FStar_Syntax_Syntax.sigel
                                       with
                                       | FStar_Syntax_Syntax.Sig_inductive_typ
                                           (l,univs2,binders,typ,uu____7272,uu____7273)
                                           ->
                                           let fail1 expected inferred =
                                             let uu____7293 =
                                               let uu____7299 =
                                                 let uu____7301 =
                                                   FStar_Syntax_Print.tscheme_to_string
                                                     expected
                                                    in
                                                 let uu____7303 =
                                                   FStar_Syntax_Print.tscheme_to_string
                                                     inferred
                                                    in
                                                 FStar_Util.format2
                                                   "Expected an inductive with type %s; got %s"
                                                   uu____7301 uu____7303
                                                  in
                                               (FStar_Errors.Fatal_UnexpectedInductivetype,
                                                 uu____7299)
                                                in
                                             FStar_Errors.raise_error
                                               uu____7293
                                               se.FStar_Syntax_Syntax.sigrng
                                              in
                                           let uu____7307 =
                                             FStar_TypeChecker_Env.try_lookup_val_decl
                                               env0 l
                                              in
                                           (match uu____7307 with
                                            | FStar_Pervasives_Native.None 
                                                -> ()
                                            | FStar_Pervasives_Native.Some
                                                (expected_typ1,uu____7323) ->
                                                let inferred_typ =
                                                  let body =
                                                    match binders with
                                                    | [] -> typ
                                                    | uu____7354 ->
                                                        let uu____7355 =
                                                          let uu____7362 =
                                                            let uu____7363 =
                                                              let uu____7378
                                                                =
                                                                FStar_Syntax_Syntax.mk_Total
                                                                  typ
                                                                 in
                                                              (binders,
                                                                uu____7378)
                                                               in
                                                            FStar_Syntax_Syntax.Tm_arrow
                                                              uu____7363
                                                             in
                                                          FStar_Syntax_Syntax.mk
                                                            uu____7362
                                                           in
                                                        uu____7355
                                                          FStar_Pervasives_Native.None
                                                          se.FStar_Syntax_Syntax.sigrng
                                                     in
                                                  (univs2, body)  in
                                                if
                                                  (FStar_List.length univs2)
                                                    =
                                                    (FStar_List.length
                                                       (FStar_Pervasives_Native.fst
                                                          expected_typ1))
                                                then
                                                  let uu____7400 =
                                                    FStar_TypeChecker_Env.inst_tscheme
                                                      inferred_typ
                                                     in
                                                  (match uu____7400 with
                                                   | (uu____7405,inferred) ->
                                                       let uu____7407 =
                                                         FStar_TypeChecker_Env.inst_tscheme
                                                           expected_typ1
                                                          in
                                                       (match uu____7407 with
                                                        | (uu____7412,expected)
                                                            ->
                                                            let uu____7414 =
                                                              FStar_TypeChecker_Rel.teq_nosmt_force
                                                                env0 inferred
                                                                expected
                                                               in
                                                            if uu____7414
                                                            then ()
                                                            else
                                                              fail1
                                                                expected_typ1
                                                                inferred_typ))
                                                else
                                                  fail1 expected_typ1
                                                    inferred_typ)
                                       | uu____7421 -> ()));
                               (sig_bndle, tcs1, datas2))))))
  
let (early_prims_inductives : Prims.string Prims.list) =
  ["c_False"; "c_True"; "equals"; "h_equals"; "c_and"; "c_or"] 
let (mk_discriminator_and_indexed_projectors :
  FStar_Syntax_Syntax.attribute Prims.list ->
    FStar_Syntax_Syntax.qualifier Prims.list ->
      FStar_Syntax_Syntax.fv_qual ->
        Prims.bool ->
          FStar_TypeChecker_Env.env ->
            FStar_Ident.lident ->
              FStar_Ident.lident ->
                FStar_Syntax_Syntax.univ_names ->
                  FStar_Syntax_Syntax.binders ->
                    FStar_Syntax_Syntax.binders ->
                      FStar_Syntax_Syntax.binders ->
                        Prims.bool -> FStar_Syntax_Syntax.sigelt Prims.list)
  =
  fun attrs  ->
    fun iquals  ->
      fun fvq  ->
        fun refine_domain  ->
          fun env  ->
            fun tc  ->
              fun lid  ->
                fun uvs  ->
                  fun inductive_tps  ->
                    fun indices  ->
                      fun fields  ->
                        fun erasable1  ->
                          let p = FStar_Ident.range_of_lid lid  in
                          let pos q = FStar_Syntax_Syntax.withinfo q p  in
                          let projectee ptyp =
                            FStar_Syntax_Syntax.gen_bv "projectee"
                              (FStar_Pervasives_Native.Some p) ptyp
                             in
                          let inst_univs =
                            FStar_List.map
                              (fun u  -> FStar_Syntax_Syntax.U_name u) uvs
                             in
                          let tps = inductive_tps  in
                          let arg_typ =
                            let inst_tc =
                              let uu____7548 =
                                let uu____7555 =
                                  let uu____7556 =
                                    let uu____7563 =
                                      let uu____7566 =
                                        FStar_Syntax_Syntax.lid_as_fv tc
                                          FStar_Syntax_Syntax.delta_constant
                                          FStar_Pervasives_Native.None
                                         in
                                      FStar_Syntax_Syntax.fv_to_tm uu____7566
                                       in
                                    (uu____7563, inst_univs)  in
                                  FStar_Syntax_Syntax.Tm_uinst uu____7556  in
                                FStar_Syntax_Syntax.mk uu____7555  in
                              uu____7548 FStar_Pervasives_Native.None p  in
                            let args =
                              FStar_All.pipe_right
                                (FStar_List.append tps indices)
                                (FStar_List.map
                                   (fun uu____7600  ->
                                      match uu____7600 with
                                      | (x,imp) ->
                                          let uu____7619 =
                                            FStar_Syntax_Syntax.bv_to_name x
                                             in
                                          (uu____7619, imp)))
                               in
                            FStar_Syntax_Syntax.mk_Tm_app inst_tc args
                              FStar_Pervasives_Native.None p
                             in
                          let unrefined_arg_binder =
                            let uu____7623 = projectee arg_typ  in
                            FStar_Syntax_Syntax.mk_binder uu____7623  in
                          let arg_binder =
                            if Prims.op_Negation refine_domain
                            then unrefined_arg_binder
                            else
                              (let disc_name =
                                 FStar_Syntax_Util.mk_discriminator lid  in
                               let x =
                                 FStar_Syntax_Syntax.new_bv
                                   (FStar_Pervasives_Native.Some p) arg_typ
                                  in
                               let sort =
                                 let disc_fvar =
                                   let uu____7646 =
                                     FStar_Ident.set_lid_range disc_name p
                                      in
                                   FStar_Syntax_Syntax.fvar uu____7646
                                     (FStar_Syntax_Syntax.Delta_equational_at_level
                                        Prims.int_one)
                                     FStar_Pervasives_Native.None
                                    in
                                 let uu____7648 =
                                   let uu____7651 =
                                     let uu____7654 =
                                       let uu____7659 =
                                         FStar_Syntax_Syntax.mk_Tm_uinst
                                           disc_fvar inst_univs
                                          in
                                       let uu____7660 =
                                         let uu____7661 =
                                           let uu____7670 =
                                             FStar_Syntax_Syntax.bv_to_name x
                                              in
                                           FStar_All.pipe_left
                                             FStar_Syntax_Syntax.as_arg
                                             uu____7670
                                            in
                                         [uu____7661]  in
                                       FStar_Syntax_Syntax.mk_Tm_app
                                         uu____7659 uu____7660
                                        in
                                     uu____7654 FStar_Pervasives_Native.None
                                       p
                                      in
                                   FStar_Syntax_Util.b2t uu____7651  in
                                 FStar_Syntax_Util.refine x uu____7648  in
                               let uu____7695 =
                                 let uu___1051_7696 = projectee arg_typ  in
                                 {
                                   FStar_Syntax_Syntax.ppname =
                                     (uu___1051_7696.FStar_Syntax_Syntax.ppname);
                                   FStar_Syntax_Syntax.index =
                                     (uu___1051_7696.FStar_Syntax_Syntax.index);
                                   FStar_Syntax_Syntax.sort = sort
                                 }  in
                               FStar_Syntax_Syntax.mk_binder uu____7695)
                             in
                          let ntps = FStar_List.length tps  in
                          let all_params =
                            let uu____7713 =
                              FStar_List.map
                                (fun uu____7737  ->
                                   match uu____7737 with
                                   | (x,uu____7751) ->
                                       (x,
                                         (FStar_Pervasives_Native.Some
                                            FStar_Syntax_Syntax.imp_tag)))
                                tps
                               in
                            FStar_List.append uu____7713 fields  in
                          let imp_binders =
                            FStar_All.pipe_right
                              (FStar_List.append tps indices)
                              (FStar_List.map
                                 (fun uu____7810  ->
                                    match uu____7810 with
                                    | (x,uu____7824) ->
                                        (x,
                                          (FStar_Pervasives_Native.Some
                                             FStar_Syntax_Syntax.imp_tag))))
                             in
                          let early_prims_inductive =
                            (let uu____7835 =
                               FStar_TypeChecker_Env.current_module env  in
                             FStar_Ident.lid_equals
                               FStar_Parser_Const.prims_lid uu____7835)
                              &&
                              (FStar_List.existsb
                                 (fun s  ->
                                    s =
                                      (tc.FStar_Ident.ident).FStar_Ident.idText)
                                 early_prims_inductives)
                             in
                          let discriminator_ses =
                            if fvq <> FStar_Syntax_Syntax.Data_ctor
                            then []
                            else
                              (let discriminator_name =
                                 FStar_Syntax_Util.mk_discriminator lid  in
                               let no_decl = false  in
                               let only_decl =
                                 early_prims_inductive ||
                                   (let uu____7856 =
                                      let uu____7858 =
                                        FStar_TypeChecker_Env.current_module
                                          env
                                         in
                                      uu____7858.FStar_Ident.str  in
                                    FStar_Options.dont_gen_projectors
                                      uu____7856)
                                  in
                               let quals =
                                 let uu____7862 =
                                   FStar_List.filter
                                     (fun uu___4_7866  ->
                                        match uu___4_7866 with
                                        | FStar_Syntax_Syntax.Abstract  ->
                                            Prims.op_Negation only_decl
                                        | FStar_Syntax_Syntax.Inline_for_extraction
                                             -> true
                                        | FStar_Syntax_Syntax.NoExtract  ->
                                            true
                                        | FStar_Syntax_Syntax.Private  ->
                                            true
                                        | uu____7871 -> false) iquals
                                    in
                                 FStar_List.append
                                   ((FStar_Syntax_Syntax.Discriminator lid)
                                   ::
                                   (if only_decl
                                    then
                                      [FStar_Syntax_Syntax.Logic;
                                      FStar_Syntax_Syntax.Assumption]
                                    else [])) uu____7862
                                  in
                               let binders =
                                 FStar_List.append imp_binders
                                   [unrefined_arg_binder]
                                  in
                               let t =
                                 let bool_typ =
                                   if erasable1
                                   then
                                     FStar_Syntax_Syntax.mk_GTotal
                                       FStar_Syntax_Util.t_bool
                                   else
                                     FStar_Syntax_Syntax.mk_Total
                                       FStar_Syntax_Util.t_bool
                                    in
                                 let uu____7916 =
                                   FStar_Syntax_Util.arrow binders bool_typ
                                    in
                                 FStar_All.pipe_left
                                   (FStar_Syntax_Subst.close_univ_vars uvs)
                                   uu____7916
                                  in
                               let decl =
                                 let uu____7920 =
                                   FStar_Ident.range_of_lid
                                     discriminator_name
                                    in
                                 {
                                   FStar_Syntax_Syntax.sigel =
                                     (FStar_Syntax_Syntax.Sig_declare_typ
                                        (discriminator_name, uvs, t));
                                   FStar_Syntax_Syntax.sigrng = uu____7920;
                                   FStar_Syntax_Syntax.sigquals = quals;
                                   FStar_Syntax_Syntax.sigmeta =
                                     FStar_Syntax_Syntax.default_sigmeta;
                                   FStar_Syntax_Syntax.sigattrs = []
                                 }  in
                               (let uu____7922 =
                                  FStar_TypeChecker_Env.debug env
                                    (FStar_Options.Other "LogTypes")
                                   in
                                if uu____7922
                                then
                                  let uu____7926 =
                                    FStar_Syntax_Print.sigelt_to_string decl
                                     in
                                  FStar_Util.print1
                                    "Declaration of a discriminator %s\n"
                                    uu____7926
                                else ());
                               if only_decl
                               then [decl]
                               else
                                 (let body =
                                    if Prims.op_Negation refine_domain
                                    then FStar_Syntax_Util.exp_true_bool
                                    else
                                      (let arg_pats =
                                         FStar_All.pipe_right all_params
                                           (FStar_List.mapi
                                              (fun j  ->
                                                 fun uu____7987  ->
                                                   match uu____7987 with
                                                   | (x,imp) ->
                                                       let b =
                                                         FStar_Syntax_Syntax.is_implicit
                                                           imp
                                                          in
                                                       if b && (j < ntps)
                                                       then
                                                         let uu____8012 =
                                                           let uu____8015 =
                                                             let uu____8016 =
                                                               let uu____8023
                                                                 =
                                                                 FStar_Syntax_Syntax.gen_bv
                                                                   (x.FStar_Syntax_Syntax.ppname).FStar_Ident.idText
                                                                   FStar_Pervasives_Native.None
                                                                   FStar_Syntax_Syntax.tun
                                                                  in
                                                               (uu____8023,
                                                                 FStar_Syntax_Syntax.tun)
                                                                in
                                                             FStar_Syntax_Syntax.Pat_dot_term
                                                               uu____8016
                                                              in
                                                           pos uu____8015  in
                                                         (uu____8012, b)
                                                       else
                                                         (let uu____8031 =
                                                            let uu____8034 =
                                                              let uu____8035
                                                                =
                                                                FStar_Syntax_Syntax.gen_bv
                                                                  (x.FStar_Syntax_Syntax.ppname).FStar_Ident.idText
                                                                  FStar_Pervasives_Native.None
                                                                  FStar_Syntax_Syntax.tun
                                                                 in
                                                              FStar_Syntax_Syntax.Pat_wild
                                                                uu____8035
                                                               in
                                                            pos uu____8034
                                                             in
                                                          (uu____8031, b))))
                                          in
                                       let pat_true =
                                         let uu____8054 =
                                           let uu____8057 =
                                             let uu____8058 =
                                               let uu____8072 =
                                                 FStar_Syntax_Syntax.lid_as_fv
                                                   lid
                                                   FStar_Syntax_Syntax.delta_constant
                                                   (FStar_Pervasives_Native.Some
                                                      fvq)
                                                  in
                                               (uu____8072, arg_pats)  in
                                             FStar_Syntax_Syntax.Pat_cons
                                               uu____8058
                                              in
                                           pos uu____8057  in
                                         (uu____8054,
                                           FStar_Pervasives_Native.None,
                                           FStar_Syntax_Util.exp_true_bool)
                                          in
                                       let pat_false =
                                         let uu____8107 =
                                           let uu____8110 =
                                             let uu____8111 =
                                               FStar_Syntax_Syntax.new_bv
                                                 FStar_Pervasives_Native.None
                                                 FStar_Syntax_Syntax.tun
                                                in
                                             FStar_Syntax_Syntax.Pat_wild
                                               uu____8111
                                              in
                                           pos uu____8110  in
                                         (uu____8107,
                                           FStar_Pervasives_Native.None,
                                           FStar_Syntax_Util.exp_false_bool)
                                          in
                                       let arg_exp =
                                         FStar_Syntax_Syntax.bv_to_name
                                           (FStar_Pervasives_Native.fst
                                              unrefined_arg_binder)
                                          in
                                       let uu____8125 =
                                         let uu____8132 =
                                           let uu____8133 =
                                             let uu____8156 =
                                               let uu____8173 =
                                                 FStar_Syntax_Util.branch
                                                   pat_true
                                                  in
                                               let uu____8188 =
                                                 let uu____8205 =
                                                   FStar_Syntax_Util.branch
                                                     pat_false
                                                    in
                                                 [uu____8205]  in
                                               uu____8173 :: uu____8188  in
                                             (arg_exp, uu____8156)  in
                                           FStar_Syntax_Syntax.Tm_match
                                             uu____8133
                                            in
                                         FStar_Syntax_Syntax.mk uu____8132
                                          in
                                       uu____8125
                                         FStar_Pervasives_Native.None p)
                                     in
                                  let dd =
                                    let uu____8281 =
                                      FStar_All.pipe_right quals
                                        (FStar_List.contains
                                           FStar_Syntax_Syntax.Abstract)
                                       in
                                    if uu____8281
                                    then
                                      FStar_Syntax_Syntax.Delta_abstract
                                        (FStar_Syntax_Syntax.Delta_equational_at_level
                                           Prims.int_one)
                                    else
                                      FStar_Syntax_Syntax.Delta_equational_at_level
                                        Prims.int_one
                                     in
                                  let imp =
                                    FStar_Syntax_Util.abs binders body
                                      FStar_Pervasives_Native.None
                                     in
                                  let lbtyp =
                                    if no_decl
                                    then t
                                    else FStar_Syntax_Syntax.tun  in
                                  let lb =
                                    let uu____8303 =
                                      let uu____8308 =
                                        FStar_Syntax_Syntax.lid_as_fv
                                          discriminator_name dd
                                          FStar_Pervasives_Native.None
                                         in
                                      FStar_Util.Inr uu____8308  in
                                    let uu____8309 =
                                      FStar_Syntax_Subst.close_univ_vars uvs
                                        imp
                                       in
                                    FStar_Syntax_Util.mk_letbinding
                                      uu____8303 uvs lbtyp
                                      FStar_Parser_Const.effect_Tot_lid
                                      uu____8309 [] FStar_Range.dummyRange
                                     in
                                  let impl =
                                    let uu____8315 =
                                      let uu____8316 =
                                        let uu____8323 =
                                          let uu____8326 =
                                            let uu____8327 =
                                              FStar_All.pipe_right
                                                lb.FStar_Syntax_Syntax.lbname
                                                FStar_Util.right
                                               in
                                            FStar_All.pipe_right uu____8327
                                              (fun fv  ->
                                                 (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v)
                                             in
                                          [uu____8326]  in
                                        ((false, [lb]), uu____8323)  in
                                      FStar_Syntax_Syntax.Sig_let uu____8316
                                       in
                                    {
                                      FStar_Syntax_Syntax.sigel = uu____8315;
                                      FStar_Syntax_Syntax.sigrng = p;
                                      FStar_Syntax_Syntax.sigquals = quals;
                                      FStar_Syntax_Syntax.sigmeta =
                                        FStar_Syntax_Syntax.default_sigmeta;
                                      FStar_Syntax_Syntax.sigattrs = []
                                    }  in
                                  (let uu____8341 =
                                     FStar_TypeChecker_Env.debug env
                                       (FStar_Options.Other "LogTypes")
                                      in
                                   if uu____8341
                                   then
                                     let uu____8345 =
                                       FStar_Syntax_Print.sigelt_to_string
                                         impl
                                        in
                                     FStar_Util.print1
                                       "Implementation of a discriminator %s\n"
                                       uu____8345
                                   else ());
                                  [decl; impl]))
                             in
                          let arg_exp =
                            FStar_Syntax_Syntax.bv_to_name
                              (FStar_Pervasives_Native.fst arg_binder)
                             in
                          let binders =
                            FStar_List.append imp_binders [arg_binder]  in
                          let arg =
                            FStar_Syntax_Util.arg_of_non_null_binder
                              arg_binder
                             in
                          let subst1 =
                            FStar_All.pipe_right fields
                              (FStar_List.mapi
                                 (fun i  ->
                                    fun uu____8418  ->
                                      match uu____8418 with
                                      | (a,uu____8427) ->
                                          let uu____8432 =
                                            FStar_Syntax_Util.mk_field_projector_name
                                              lid a i
                                             in
                                          (match uu____8432 with
                                           | (field_name,uu____8438) ->
                                               let field_proj_tm =
                                                 let uu____8440 =
                                                   let uu____8441 =
                                                     FStar_Syntax_Syntax.lid_as_fv
                                                       field_name
                                                       (FStar_Syntax_Syntax.Delta_equational_at_level
                                                          Prims.int_one)
                                                       FStar_Pervasives_Native.None
                                                      in
                                                   FStar_Syntax_Syntax.fv_to_tm
                                                     uu____8441
                                                    in
                                                 FStar_Syntax_Syntax.mk_Tm_uinst
                                                   uu____8440 inst_univs
                                                  in
                                               let proj =
                                                 FStar_Syntax_Syntax.mk_Tm_app
                                                   field_proj_tm [arg]
                                                   FStar_Pervasives_Native.None
                                                   p
                                                  in
                                               FStar_Syntax_Syntax.NT
                                                 (a, proj))))
                             in
                          let projectors_ses =
                            let uu____8467 =
                              FStar_All.pipe_right fields
                                (FStar_List.mapi
                                   (fun i  ->
                                      fun uu____8509  ->
                                        match uu____8509 with
                                        | (x,uu____8520) ->
                                            let p1 =
                                              FStar_Syntax_Syntax.range_of_bv
                                                x
                                               in
                                            let uu____8526 =
                                              FStar_Syntax_Util.mk_field_projector_name
                                                lid x i
                                               in
                                            (match uu____8526 with
                                             | (field_name,uu____8534) ->
                                                 let t =
                                                   let result_comp =
                                                     let t =
                                                       FStar_Syntax_Subst.subst
                                                         subst1
                                                         x.FStar_Syntax_Syntax.sort
                                                        in
                                                     if erasable1
                                                     then
                                                       FStar_Syntax_Syntax.mk_GTotal
                                                         t
                                                     else
                                                       FStar_Syntax_Syntax.mk_Total
                                                         t
                                                      in
                                                   let uu____8547 =
                                                     FStar_Syntax_Util.arrow
                                                       binders result_comp
                                                      in
                                                   FStar_All.pipe_left
                                                     (FStar_Syntax_Subst.close_univ_vars
                                                        uvs) uu____8547
                                                    in
                                                 let only_decl =
                                                   early_prims_inductive ||
                                                     (let uu____8553 =
                                                        let uu____8555 =
                                                          FStar_TypeChecker_Env.current_module
                                                            env
                                                           in
                                                        uu____8555.FStar_Ident.str
                                                         in
                                                      FStar_Options.dont_gen_projectors
                                                        uu____8553)
                                                    in
                                                 let no_decl = false  in
                                                 let quals q =
                                                   if only_decl
                                                   then
                                                     let uu____8574 =
                                                       FStar_List.filter
                                                         (fun uu___5_8578  ->
                                                            match uu___5_8578
                                                            with
                                                            | FStar_Syntax_Syntax.Abstract
                                                                 -> false
                                                            | uu____8581 ->
                                                                true) q
                                                        in
                                                     FStar_Syntax_Syntax.Assumption
                                                       :: uu____8574
                                                   else q  in
                                                 let quals1 =
                                                   let iquals1 =
                                                     FStar_All.pipe_right
                                                       iquals
                                                       (FStar_List.filter
                                                          (fun uu___6_8596 
                                                             ->
                                                             match uu___6_8596
                                                             with
                                                             | FStar_Syntax_Syntax.Inline_for_extraction
                                                                  -> true
                                                             | FStar_Syntax_Syntax.NoExtract
                                                                  -> true
                                                             | FStar_Syntax_Syntax.Abstract
                                                                  -> true
                                                             | FStar_Syntax_Syntax.Private
                                                                  -> true
                                                             | uu____8602 ->
                                                                 false))
                                                      in
                                                   quals
                                                     ((FStar_Syntax_Syntax.Projector
                                                         (lid,
                                                           (x.FStar_Syntax_Syntax.ppname)))
                                                     :: iquals1)
                                                    in
                                                 let attrs1 =
                                                   FStar_List.append
                                                     (if only_decl
                                                      then []
                                                      else
                                                        [FStar_Syntax_Util.attr_substitute])
                                                     attrs
                                                    in
                                                 let decl =
                                                   let uu____8613 =
                                                     FStar_Ident.range_of_lid
                                                       field_name
                                                      in
                                                   {
                                                     FStar_Syntax_Syntax.sigel
                                                       =
                                                       (FStar_Syntax_Syntax.Sig_declare_typ
                                                          (field_name, uvs,
                                                            t));
                                                     FStar_Syntax_Syntax.sigrng
                                                       = uu____8613;
                                                     FStar_Syntax_Syntax.sigquals
                                                       = quals1;
                                                     FStar_Syntax_Syntax.sigmeta
                                                       =
                                                       FStar_Syntax_Syntax.default_sigmeta;
                                                     FStar_Syntax_Syntax.sigattrs
                                                       = attrs1
                                                   }  in
                                                 ((let uu____8615 =
                                                     FStar_TypeChecker_Env.debug
                                                       env
                                                       (FStar_Options.Other
                                                          "LogTypes")
                                                      in
                                                   if uu____8615
                                                   then
                                                     let uu____8619 =
                                                       FStar_Syntax_Print.sigelt_to_string
                                                         decl
                                                        in
                                                     FStar_Util.print1
                                                       "Declaration of a projector %s\n"
                                                       uu____8619
                                                   else ());
                                                  if only_decl
                                                  then [decl]
                                                  else
                                                    (let projection =
                                                       FStar_Syntax_Syntax.gen_bv
                                                         (x.FStar_Syntax_Syntax.ppname).FStar_Ident.idText
                                                         FStar_Pervasives_Native.None
                                                         FStar_Syntax_Syntax.tun
                                                        in
                                                     let arg_pats =
                                                       FStar_All.pipe_right
                                                         all_params
                                                         (FStar_List.mapi
                                                            (fun j  ->
                                                               fun uu____8673
                                                                  ->
                                                                 match uu____8673
                                                                 with
                                                                 | (x1,imp)
                                                                    ->
                                                                    let b =
                                                                    FStar_Syntax_Syntax.is_implicit
                                                                    imp  in
                                                                    if
                                                                    (i + ntps)
                                                                    = j
                                                                    then
                                                                    let uu____8699
                                                                    =
                                                                    pos
                                                                    (FStar_Syntax_Syntax.Pat_var
                                                                    projection)
                                                                     in
                                                                    (uu____8699,
                                                                    b)
                                                                    else
                                                                    if
                                                                    b &&
                                                                    (j < ntps)
                                                                    then
                                                                    (let uu____8715
                                                                    =
                                                                    let uu____8718
                                                                    =
                                                                    let uu____8719
                                                                    =
                                                                    let uu____8726
                                                                    =
                                                                    FStar_Syntax_Syntax.gen_bv
                                                                    (x1.FStar_Syntax_Syntax.ppname).FStar_Ident.idText
                                                                    FStar_Pervasives_Native.None
                                                                    FStar_Syntax_Syntax.tun
                                                                     in
                                                                    (uu____8726,
                                                                    FStar_Syntax_Syntax.tun)
                                                                     in
                                                                    FStar_Syntax_Syntax.Pat_dot_term
                                                                    uu____8719
                                                                     in
                                                                    pos
                                                                    uu____8718
                                                                     in
                                                                    (uu____8715,
                                                                    b))
                                                                    else
                                                                    (let uu____8734
                                                                    =
                                                                    let uu____8737
                                                                    =
                                                                    let uu____8738
                                                                    =
                                                                    FStar_Syntax_Syntax.gen_bv
                                                                    (x1.FStar_Syntax_Syntax.ppname).FStar_Ident.idText
                                                                    FStar_Pervasives_Native.None
                                                                    FStar_Syntax_Syntax.tun
                                                                     in
                                                                    FStar_Syntax_Syntax.Pat_wild
                                                                    uu____8738
                                                                     in
                                                                    pos
                                                                    uu____8737
                                                                     in
                                                                    (uu____8734,
                                                                    b))))
                                                        in
                                                     let pat =
                                                       let uu____8757 =
                                                         let uu____8760 =
                                                           let uu____8761 =
                                                             let uu____8775 =
                                                               FStar_Syntax_Syntax.lid_as_fv
                                                                 lid
                                                                 FStar_Syntax_Syntax.delta_constant
                                                                 (FStar_Pervasives_Native.Some
                                                                    fvq)
                                                                in
                                                             (uu____8775,
                                                               arg_pats)
                                                              in
                                                           FStar_Syntax_Syntax.Pat_cons
                                                             uu____8761
                                                            in
                                                         pos uu____8760  in
                                                       let uu____8785 =
                                                         FStar_Syntax_Syntax.bv_to_name
                                                           projection
                                                          in
                                                       (uu____8757,
                                                         FStar_Pervasives_Native.None,
                                                         uu____8785)
                                                        in
                                                     let body =
                                                       let uu____8801 =
                                                         let uu____8808 =
                                                           let uu____8809 =
                                                             let uu____8832 =
                                                               let uu____8849
                                                                 =
                                                                 FStar_Syntax_Util.branch
                                                                   pat
                                                                  in
                                                               [uu____8849]
                                                                in
                                                             (arg_exp,
                                                               uu____8832)
                                                              in
                                                           FStar_Syntax_Syntax.Tm_match
                                                             uu____8809
                                                            in
                                                         FStar_Syntax_Syntax.mk
                                                           uu____8808
                                                          in
                                                       uu____8801
                                                         FStar_Pervasives_Native.None
                                                         p1
                                                        in
                                                     let imp =
                                                       FStar_Syntax_Util.abs
                                                         binders body
                                                         FStar_Pervasives_Native.None
                                                        in
                                                     let dd =
                                                       let uu____8914 =
                                                         FStar_All.pipe_right
                                                           quals1
                                                           (FStar_List.contains
                                                              FStar_Syntax_Syntax.Abstract)
                                                          in
                                                       if uu____8914
                                                       then
                                                         FStar_Syntax_Syntax.Delta_abstract
                                                           (FStar_Syntax_Syntax.Delta_equational_at_level
                                                              Prims.int_one)
                                                       else
                                                         FStar_Syntax_Syntax.Delta_equational_at_level
                                                           Prims.int_one
                                                        in
                                                     let lbtyp =
                                                       if no_decl
                                                       then t
                                                       else
                                                         FStar_Syntax_Syntax.tun
                                                        in
                                                     let lb =
                                                       let uu____8933 =
                                                         let uu____8938 =
                                                           FStar_Syntax_Syntax.lid_as_fv
                                                             field_name dd
                                                             FStar_Pervasives_Native.None
                                                            in
                                                         FStar_Util.Inr
                                                           uu____8938
                                                          in
                                                       let uu____8939 =
                                                         FStar_Syntax_Subst.close_univ_vars
                                                           uvs imp
                                                          in
                                                       {
                                                         FStar_Syntax_Syntax.lbname
                                                           = uu____8933;
                                                         FStar_Syntax_Syntax.lbunivs
                                                           = uvs;
                                                         FStar_Syntax_Syntax.lbtyp
                                                           = lbtyp;
                                                         FStar_Syntax_Syntax.lbeff
                                                           =
                                                           FStar_Parser_Const.effect_Tot_lid;
                                                         FStar_Syntax_Syntax.lbdef
                                                           = uu____8939;
                                                         FStar_Syntax_Syntax.lbattrs
                                                           = [];
                                                         FStar_Syntax_Syntax.lbpos
                                                           =
                                                           FStar_Range.dummyRange
                                                       }  in
                                                     let impl =
                                                       let uu____8945 =
                                                         let uu____8946 =
                                                           let uu____8953 =
                                                             let uu____8956 =
                                                               let uu____8957
                                                                 =
                                                                 FStar_All.pipe_right
                                                                   lb.FStar_Syntax_Syntax.lbname
                                                                   FStar_Util.right
                                                                  in
                                                               FStar_All.pipe_right
                                                                 uu____8957
                                                                 (fun fv  ->
                                                                    (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v)
                                                                in
                                                             [uu____8956]  in
                                                           ((false, [lb]),
                                                             uu____8953)
                                                            in
                                                         FStar_Syntax_Syntax.Sig_let
                                                           uu____8946
                                                          in
                                                       {
                                                         FStar_Syntax_Syntax.sigel
                                                           = uu____8945;
                                                         FStar_Syntax_Syntax.sigrng
                                                           = p1;
                                                         FStar_Syntax_Syntax.sigquals
                                                           = quals1;
                                                         FStar_Syntax_Syntax.sigmeta
                                                           =
                                                           FStar_Syntax_Syntax.default_sigmeta;
                                                         FStar_Syntax_Syntax.sigattrs
                                                           = attrs1
                                                       }  in
                                                     (let uu____8971 =
                                                        FStar_TypeChecker_Env.debug
                                                          env
                                                          (FStar_Options.Other
                                                             "LogTypes")
                                                         in
                                                      if uu____8971
                                                      then
                                                        let uu____8975 =
                                                          FStar_Syntax_Print.sigelt_to_string
                                                            impl
                                                           in
                                                        FStar_Util.print1
                                                          "Implementation of a projector %s\n"
                                                          uu____8975
                                                      else ());
                                                     if no_decl
                                                     then [impl]
                                                     else [decl; impl])))))
                               in
                            FStar_All.pipe_right uu____8467
                              FStar_List.flatten
                             in
                          FStar_List.append discriminator_ses projectors_ses
  
let (mk_data_operations :
  FStar_Syntax_Syntax.qualifier Prims.list ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.sigelt Prims.list ->
        FStar_Syntax_Syntax.sigelt -> FStar_Syntax_Syntax.sigelt Prims.list)
  =
  fun iquals  ->
    fun env  ->
      fun tcs  ->
        fun se  ->
          match se.FStar_Syntax_Syntax.sigel with
          | FStar_Syntax_Syntax.Sig_datacon
              (constr_lid,uvs,t,typ_lid,n_typars,uu____9029) when
              let uu____9036 =
                FStar_Ident.lid_equals constr_lid
                  FStar_Parser_Const.lexcons_lid
                 in
              Prims.op_Negation uu____9036 ->
              let uu____9038 = FStar_Syntax_Subst.univ_var_opening uvs  in
              (match uu____9038 with
               | (univ_opening,uvs1) ->
                   let t1 = FStar_Syntax_Subst.subst univ_opening t  in
                   let uu____9060 = FStar_Syntax_Util.arrow_formals t1  in
                   (match uu____9060 with
                    | (formals,uu____9078) ->
                        let uu____9099 =
                          let tps_opt =
                            FStar_Util.find_map tcs
                              (fun se1  ->
                                 let uu____9134 =
                                   let uu____9136 =
                                     let uu____9137 =
                                       FStar_Syntax_Util.lid_of_sigelt se1
                                        in
                                     FStar_Util.must uu____9137  in
                                   FStar_Ident.lid_equals typ_lid uu____9136
                                    in
                                 if uu____9134
                                 then
                                   match se1.FStar_Syntax_Syntax.sigel with
                                   | FStar_Syntax_Syntax.Sig_inductive_typ
                                       (uu____9159,uvs',tps,typ0,uu____9163,constrs)
                                       ->
                                       FStar_Pervasives_Native.Some
                                         (tps, typ0,
                                           ((FStar_List.length constrs) >
                                              Prims.int_one))
                                   | uu____9183 -> failwith "Impossible"
                                 else FStar_Pervasives_Native.None)
                             in
                          match tps_opt with
                          | FStar_Pervasives_Native.Some x -> x
                          | FStar_Pervasives_Native.None  ->
                              let uu____9232 =
                                FStar_Ident.lid_equals typ_lid
                                  FStar_Parser_Const.exn_lid
                                 in
                              if uu____9232
                              then ([], FStar_Syntax_Util.ktype0, true)
                              else
                                FStar_Errors.raise_error
                                  (FStar_Errors.Fatal_UnexpectedDataConstructor,
                                    "Unexpected data constructor")
                                  se.FStar_Syntax_Syntax.sigrng
                           in
                        (match uu____9099 with
                         | (inductive_tps,typ0,should_refine) ->
                             let inductive_tps1 =
                               FStar_Syntax_Subst.subst_binders univ_opening
                                 inductive_tps
                                in
                             let typ01 =
                               FStar_Syntax_Subst.subst univ_opening typ0  in
                             let uu____9270 =
                               FStar_Syntax_Util.arrow_formals typ01  in
                             (match uu____9270 with
                              | (indices,uu____9288) ->
                                  let refine_domain =
                                    let uu____9311 =
                                      FStar_All.pipe_right
                                        se.FStar_Syntax_Syntax.sigquals
                                        (FStar_Util.for_some
                                           (fun uu___7_9318  ->
                                              match uu___7_9318 with
                                              | FStar_Syntax_Syntax.RecordConstructor
                                                  uu____9320 -> true
                                              | uu____9330 -> false))
                                       in
                                    if uu____9311
                                    then false
                                    else should_refine  in
                                  let fv_qual =
                                    let filter_records uu___8_9345 =
                                      match uu___8_9345 with
                                      | FStar_Syntax_Syntax.RecordConstructor
                                          (uu____9348,fns) ->
                                          FStar_Pervasives_Native.Some
                                            (FStar_Syntax_Syntax.Record_ctor
                                               (constr_lid, fns))
                                      | uu____9360 ->
                                          FStar_Pervasives_Native.None
                                       in
                                    let uu____9361 =
                                      FStar_Util.find_map
                                        se.FStar_Syntax_Syntax.sigquals
                                        filter_records
                                       in
                                    match uu____9361 with
                                    | FStar_Pervasives_Native.None  ->
                                        FStar_Syntax_Syntax.Data_ctor
                                    | FStar_Pervasives_Native.Some q -> q  in
                                  let iquals1 =
                                    if
                                      (FStar_List.contains
                                         FStar_Syntax_Syntax.Abstract iquals)
                                        &&
                                        (Prims.op_Negation
                                           (FStar_List.contains
                                              FStar_Syntax_Syntax.Private
                                              iquals))
                                    then FStar_Syntax_Syntax.Private ::
                                      iquals
                                    else iquals  in
                                  let fields =
                                    let uu____9374 =
                                      FStar_Util.first_N n_typars formals  in
                                    match uu____9374 with
                                    | (imp_tps,fields) ->
                                        let rename =
                                          FStar_List.map2
                                            (fun uu____9457  ->
                                               fun uu____9458  ->
                                                 match (uu____9457,
                                                         uu____9458)
                                                 with
                                                 | ((x,uu____9484),(x',uu____9486))
                                                     ->
                                                     let uu____9507 =
                                                       let uu____9514 =
                                                         FStar_Syntax_Syntax.bv_to_name
                                                           x'
                                                          in
                                                       (x, uu____9514)  in
                                                     FStar_Syntax_Syntax.NT
                                                       uu____9507) imp_tps
                                            inductive_tps1
                                           in
                                        FStar_Syntax_Subst.subst_binders
                                          rename fields
                                     in
                                  let erasable1 =
                                    FStar_Syntax_Util.has_attribute
                                      se.FStar_Syntax_Syntax.sigattrs
                                      FStar_Parser_Const.erasable_attr
                                     in
                                  mk_discriminator_and_indexed_projectors
                                    se.FStar_Syntax_Syntax.sigattrs iquals1
                                    fv_qual refine_domain env typ_lid
                                    constr_lid uvs1 inductive_tps1 indices
                                    fields erasable1))))
          | uu____9521 -> []
  