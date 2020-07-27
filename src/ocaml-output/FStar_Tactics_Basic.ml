open Prims
type name = FStar_Syntax_Syntax.bv
type env = FStar_TypeChecker_Env.env
type implicits = FStar_TypeChecker_Env.implicits
let (normalize :
  FStar_TypeChecker_Env.steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun s ->
    fun e ->
      fun t ->
        FStar_TypeChecker_Normalize.normalize_with_primitive_steps
          FStar_Reflection_Interpreter.reflection_primops s e t
let (bnorm :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  = fun e -> fun t -> normalize [] e t
let (whnf :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  = fun e -> fun t -> FStar_TypeChecker_Normalize.unfold_whnf e t
let (tts :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> Prims.string) =
  FStar_TypeChecker_Normalize.term_to_string
let (term_to_string :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> Prims.string) =
  fun e ->
    fun t ->
      FStar_Syntax_Print.term_to_string' e.FStar_TypeChecker_Env.dsenv t
let (bnorm_goal : FStar_Tactics_Types.goal -> FStar_Tactics_Types.goal) =
  fun g ->
    let uu____58 =
      let uu____59 = FStar_Tactics_Types.goal_env g in
      let uu____60 = FStar_Tactics_Types.goal_type g in
      bnorm uu____59 uu____60 in
    FStar_Tactics_Types.goal_with_type g uu____58
let (tacprint : Prims.string -> unit) =
  fun s -> FStar_Util.print1 "TAC>> %s\n" s
let (tacprint1 : Prims.string -> Prims.string -> unit) =
  fun s ->
    fun x ->
      let uu____76 = FStar_Util.format1 s x in
      FStar_Util.print1 "TAC>> %s\n" uu____76
let (tacprint2 : Prims.string -> Prims.string -> Prims.string -> unit) =
  fun s ->
    fun x ->
      fun y ->
        let uu____92 = FStar_Util.format2 s x y in
        FStar_Util.print1 "TAC>> %s\n" uu____92
let (tacprint3 :
  Prims.string -> Prims.string -> Prims.string -> Prims.string -> unit) =
  fun s ->
    fun x ->
      fun y ->
        fun z ->
          let uu____113 = FStar_Util.format3 s x y z in
          FStar_Util.print1 "TAC>> %s\n" uu____113
let (print : Prims.string -> unit FStar_Tactics_Monad.tac) =
  fun msg ->
    (let uu____124 =
       let uu____125 = FStar_Options.silent () in Prims.op_Negation uu____125 in
     if uu____124 then tacprint msg else ());
    FStar_Tactics_Monad.ret ()
let (debugging : unit -> Prims.bool FStar_Tactics_Monad.tac) =
  fun uu____133 ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
      (fun ps ->
         let uu____139 =
           FStar_TypeChecker_Env.debug ps.FStar_Tactics_Types.main_context
             (FStar_Options.Other "Tac") in
         FStar_Tactics_Monad.ret uu____139)
let (do_dump_ps : Prims.string -> FStar_Tactics_Types.proofstate -> unit) =
  fun msg ->
    fun ps ->
      let psc = ps.FStar_Tactics_Types.psc in
      let subst = FStar_TypeChecker_Cfg.psc_subst psc in
      let uu____152 = FStar_Tactics_Types.subst_proof_state subst ps in
      FStar_Tactics_Printing.do_dump_proofstate uu____152 msg
let (dump : Prims.string -> unit FStar_Tactics_Monad.tac) =
  fun msg ->
    FStar_Tactics_Monad.mk_tac
      (fun ps -> do_dump_ps msg ps; FStar_Tactics_Result.Success ((), ps))
let (dump_all : Prims.string -> unit FStar_Tactics_Monad.tac) =
  fun msg ->
    FStar_Tactics_Monad.mk_tac
      (fun ps ->
         let ps' =
           let uu___43_180 = ps in
           let uu____181 =
             FStar_List.map
               (fun i ->
                  FStar_Tactics_Types.goal_of_implicit
                    ps.FStar_Tactics_Types.main_context i)
               ps.FStar_Tactics_Types.all_implicits in
           {
             FStar_Tactics_Types.main_context =
               (uu___43_180.FStar_Tactics_Types.main_context);
             FStar_Tactics_Types.all_implicits =
               (uu___43_180.FStar_Tactics_Types.all_implicits);
             FStar_Tactics_Types.goals = uu____181;
             FStar_Tactics_Types.smt_goals = [];
             FStar_Tactics_Types.depth =
               (uu___43_180.FStar_Tactics_Types.depth);
             FStar_Tactics_Types.__dump =
               (uu___43_180.FStar_Tactics_Types.__dump);
             FStar_Tactics_Types.psc = (uu___43_180.FStar_Tactics_Types.psc);
             FStar_Tactics_Types.entry_range =
               (uu___43_180.FStar_Tactics_Types.entry_range);
             FStar_Tactics_Types.guard_policy =
               (uu___43_180.FStar_Tactics_Types.guard_policy);
             FStar_Tactics_Types.freshness =
               (uu___43_180.FStar_Tactics_Types.freshness);
             FStar_Tactics_Types.tac_verb_dbg =
               (uu___43_180.FStar_Tactics_Types.tac_verb_dbg);
             FStar_Tactics_Types.local_state =
               (uu___43_180.FStar_Tactics_Types.local_state)
           } in
         do_dump_ps msg ps'; FStar_Tactics_Result.Success ((), ps))
let fail1 :
  'uuuuuu193 .
    Prims.string -> Prims.string -> 'uuuuuu193 FStar_Tactics_Monad.tac
  =
  fun msg ->
    fun x ->
      let uu____206 = FStar_Util.format1 msg x in
      FStar_Tactics_Monad.fail uu____206
let fail2 :
  'uuuuuu215 .
    Prims.string ->
      Prims.string -> Prims.string -> 'uuuuuu215 FStar_Tactics_Monad.tac
  =
  fun msg ->
    fun x ->
      fun y ->
        let uu____233 = FStar_Util.format2 msg x y in
        FStar_Tactics_Monad.fail uu____233
let fail3 :
  'uuuuuu244 .
    Prims.string ->
      Prims.string ->
        Prims.string -> Prims.string -> 'uuuuuu244 FStar_Tactics_Monad.tac
  =
  fun msg ->
    fun x ->
      fun y ->
        fun z ->
          let uu____267 = FStar_Util.format3 msg x y z in
          FStar_Tactics_Monad.fail uu____267
let fail4 :
  'uuuuuu280 .
    Prims.string ->
      Prims.string ->
        Prims.string ->
          Prims.string -> Prims.string -> 'uuuuuu280 FStar_Tactics_Monad.tac
  =
  fun msg ->
    fun x ->
      fun y ->
        fun z ->
          fun w ->
            let uu____308 = FStar_Util.format4 msg x y z w in
            FStar_Tactics_Monad.fail uu____308
let catch :
  'a .
    'a FStar_Tactics_Monad.tac ->
      (Prims.exn, 'a) FStar_Util.either FStar_Tactics_Monad.tac
  =
  fun t ->
    FStar_Tactics_Monad.mk_tac
      (fun ps ->
         let tx = FStar_Syntax_Unionfind.new_transaction () in
         let uu____341 = FStar_Tactics_Monad.run t ps in
         match uu____341 with
         | FStar_Tactics_Result.Success (a1, q) ->
             (FStar_Syntax_Unionfind.commit tx;
              FStar_Tactics_Result.Success ((FStar_Util.Inr a1), q))
         | FStar_Tactics_Result.Failed (m, q) ->
             (FStar_Syntax_Unionfind.rollback tx;
              (let ps1 =
                 let uu___77_365 = ps in
                 {
                   FStar_Tactics_Types.main_context =
                     (uu___77_365.FStar_Tactics_Types.main_context);
                   FStar_Tactics_Types.all_implicits =
                     (uu___77_365.FStar_Tactics_Types.all_implicits);
                   FStar_Tactics_Types.goals =
                     (uu___77_365.FStar_Tactics_Types.goals);
                   FStar_Tactics_Types.smt_goals =
                     (uu___77_365.FStar_Tactics_Types.smt_goals);
                   FStar_Tactics_Types.depth =
                     (uu___77_365.FStar_Tactics_Types.depth);
                   FStar_Tactics_Types.__dump =
                     (uu___77_365.FStar_Tactics_Types.__dump);
                   FStar_Tactics_Types.psc =
                     (uu___77_365.FStar_Tactics_Types.psc);
                   FStar_Tactics_Types.entry_range =
                     (uu___77_365.FStar_Tactics_Types.entry_range);
                   FStar_Tactics_Types.guard_policy =
                     (uu___77_365.FStar_Tactics_Types.guard_policy);
                   FStar_Tactics_Types.freshness =
                     (q.FStar_Tactics_Types.freshness);
                   FStar_Tactics_Types.tac_verb_dbg =
                     (uu___77_365.FStar_Tactics_Types.tac_verb_dbg);
                   FStar_Tactics_Types.local_state =
                     (uu___77_365.FStar_Tactics_Types.local_state)
                 } in
               FStar_Tactics_Result.Success ((FStar_Util.Inl m), ps1))))
let recover :
  'a .
    'a FStar_Tactics_Monad.tac ->
      (Prims.exn, 'a) FStar_Util.either FStar_Tactics_Monad.tac
  =
  fun t ->
    FStar_Tactics_Monad.mk_tac
      (fun ps ->
         let uu____403 = FStar_Tactics_Monad.run t ps in
         match uu____403 with
         | FStar_Tactics_Result.Success (a1, q) ->
             FStar_Tactics_Result.Success ((FStar_Util.Inr a1), q)
         | FStar_Tactics_Result.Failed (m, q) ->
             FStar_Tactics_Result.Success ((FStar_Util.Inl m), q))
let trytac :
  'a .
    'a FStar_Tactics_Monad.tac ->
      'a FStar_Pervasives_Native.option FStar_Tactics_Monad.tac
  =
  fun t ->
    let uu____450 = catch t in
    FStar_Tactics_Monad.bind uu____450
      (fun r ->
         match r with
         | FStar_Util.Inr v ->
             FStar_Tactics_Monad.ret (FStar_Pervasives_Native.Some v)
         | FStar_Util.Inl uu____477 ->
             FStar_Tactics_Monad.ret FStar_Pervasives_Native.None)
let trytac_exn :
  'a .
    'a FStar_Tactics_Monad.tac ->
      'a FStar_Pervasives_Native.option FStar_Tactics_Monad.tac
  =
  fun t ->
    FStar_Tactics_Monad.mk_tac
      (fun ps ->
         try
           (fun uu___103_508 ->
              match () with
              | () ->
                  let uu____513 = trytac t in
                  FStar_Tactics_Monad.run uu____513 ps) ()
         with
         | FStar_Errors.Err (uu____529, msg) ->
             (FStar_Tactics_Monad.log ps
                (fun uu____533 ->
                   FStar_Util.print1 "trytac_exn error: (%s)" msg);
              FStar_Tactics_Result.Success (FStar_Pervasives_Native.None, ps))
         | FStar_Errors.Error (uu____538, msg, uu____540) ->
             (FStar_Tactics_Monad.log ps
                (fun uu____543 ->
                   FStar_Util.print1 "trytac_exn error: (%s)" msg);
              FStar_Tactics_Result.Success (FStar_Pervasives_Native.None, ps)))
let (__do_unify :
  env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.term -> Prims.bool FStar_Tactics_Monad.tac)
  =
  fun env1 ->
    fun t1 ->
      fun t2 ->
        (let uu____568 =
           FStar_TypeChecker_Env.debug env1 (FStar_Options.Other "1346") in
         if uu____568
         then
           let uu____569 = FStar_Syntax_Print.term_to_string t1 in
           let uu____570 = FStar_Syntax_Print.term_to_string t2 in
           FStar_Util.print2 "%%%%%%%%do_unify %s =? %s\n" uu____569
             uu____570
         else ());
        (try
           (fun uu___123_577 ->
              match () with
              | () ->
                  let res = FStar_TypeChecker_Rel.teq_nosmt env1 t1 t2 in
                  ((let uu____584 =
                      FStar_TypeChecker_Env.debug env1
                        (FStar_Options.Other "1346") in
                    if uu____584
                    then
                      let uu____585 =
                        FStar_Common.string_of_option
                          (FStar_TypeChecker_Rel.guard_to_string env1) res in
                      let uu____586 = FStar_Syntax_Print.term_to_string t1 in
                      let uu____587 = FStar_Syntax_Print.term_to_string t2 in
                      FStar_Util.print3
                        "%%%%%%%%do_unify (RESULT %s) %s =? %s\n" uu____585
                        uu____586 uu____587
                    else ());
                   (match res with
                    | FStar_Pervasives_Native.None ->
                        FStar_Tactics_Monad.ret false
                    | FStar_Pervasives_Native.Some g ->
                        let uu____592 =
                          FStar_Tactics_Monad.add_implicits
                            g.FStar_TypeChecker_Common.implicits in
                        FStar_Tactics_Monad.bind uu____592
                          (fun uu____596 -> FStar_Tactics_Monad.ret true))))
             ()
         with
         | FStar_Errors.Err (uu____603, msg) ->
             FStar_Tactics_Monad.mlog
               (fun uu____606 ->
                  FStar_Util.print1 ">> do_unify error, (%s)\n" msg)
               (fun uu____608 -> FStar_Tactics_Monad.ret false)
         | FStar_Errors.Error (uu____609, msg, r) ->
             FStar_Tactics_Monad.mlog
               (fun uu____614 ->
                  let uu____615 = FStar_Range.string_of_range r in
                  FStar_Util.print2 ">> do_unify error, (%s) at (%s)\n" msg
                    uu____615)
               (fun uu____617 -> FStar_Tactics_Monad.ret false))
let (do_unify :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.term -> Prims.bool FStar_Tactics_Monad.tac)
  =
  fun env1 ->
    fun t1 ->
      fun t2 ->
        FStar_Tactics_Monad.bind FStar_Tactics_Monad.idtac
          (fun uu____640 ->
             (let uu____642 =
                FStar_TypeChecker_Env.debug env1 (FStar_Options.Other "1346") in
              if uu____642
              then
                (FStar_Options.push ();
                 (let uu____644 =
                    FStar_Options.set_options
                      "--debug_level Rel --debug_level RelCheck" in
                  ()))
              else ());
             (let uu____646 = __do_unify env1 t1 t2 in
              FStar_Tactics_Monad.bind uu____646
                (fun r ->
                   (let uu____653 =
                      FStar_TypeChecker_Env.debug env1
                        (FStar_Options.Other "1346") in
                    if uu____653 then FStar_Options.pop () else ());
                   FStar_Tactics_Monad.ret r)))
let (do_match :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.term -> Prims.bool FStar_Tactics_Monad.tac)
  =
  fun env1 ->
    fun t1 ->
      fun t2 ->
        let uvs1 = FStar_Syntax_Free.uvars_uncached t1 in
        let uu____677 = do_unify env1 t1 t2 in
        FStar_Tactics_Monad.bind uu____677
          (fun r ->
             if r
             then
               let uvs2 = FStar_Syntax_Free.uvars_uncached t1 in
               let uu____689 =
                 let uu____690 = FStar_Util.set_eq uvs1 uvs2 in
                 Prims.op_Negation uu____690 in
               (if uu____689
                then FStar_Tactics_Monad.ret false
                else FStar_Tactics_Monad.ret true)
             else FStar_Tactics_Monad.ret false)
let (set_solution :
  FStar_Tactics_Types.goal ->
    FStar_Syntax_Syntax.term -> unit FStar_Tactics_Monad.tac)
  =
  fun goal ->
    fun solution ->
      let uu____709 =
        FStar_Syntax_Unionfind.find
          (goal.FStar_Tactics_Types.goal_ctx_uvar).FStar_Syntax_Syntax.ctx_uvar_head in
      match uu____709 with
      | FStar_Pervasives_Native.Some uu____714 ->
          let uu____715 =
            let uu____716 =
              FStar_Tactics_Printing.goal_to_string_verbose goal in
            FStar_Util.format1 "Goal %s is already solved" uu____716 in
          FStar_Tactics_Monad.fail uu____715
      | FStar_Pervasives_Native.None ->
          (FStar_Syntax_Unionfind.change
             (goal.FStar_Tactics_Types.goal_ctx_uvar).FStar_Syntax_Syntax.ctx_uvar_head
             solution;
           FStar_Tactics_Monad.ret ())
let (trysolve :
  FStar_Tactics_Types.goal ->
    FStar_Syntax_Syntax.term -> Prims.bool FStar_Tactics_Monad.tac)
  =
  fun goal ->
    fun solution ->
      let uu____732 = FStar_Tactics_Types.goal_env goal in
      let uu____733 = FStar_Tactics_Types.goal_witness goal in
      do_unify uu____732 solution uu____733
let (solve :
  FStar_Tactics_Types.goal ->
    FStar_Syntax_Syntax.term -> unit FStar_Tactics_Monad.tac)
  =
  fun goal ->
    fun solution ->
      let e = FStar_Tactics_Types.goal_env goal in
      FStar_Tactics_Monad.mlog
        (fun uu____752 ->
           let uu____753 =
             let uu____754 = FStar_Tactics_Types.goal_witness goal in
             FStar_Syntax_Print.term_to_string uu____754 in
           let uu____755 = FStar_Syntax_Print.term_to_string solution in
           FStar_Util.print2 "solve %s := %s\n" uu____753 uu____755)
        (fun uu____758 ->
           let uu____759 = trysolve goal solution in
           FStar_Tactics_Monad.bind uu____759
             (fun b ->
                if b
                then
                  FStar_Tactics_Monad.bind FStar_Tactics_Monad.dismiss
                    (fun uu____767 -> FStar_Tactics_Monad.remove_solved_goals)
                else
                  (let uu____769 =
                     let uu____770 =
                       let uu____771 = FStar_Tactics_Types.goal_env goal in
                       tts uu____771 solution in
                     let uu____772 =
                       let uu____773 = FStar_Tactics_Types.goal_env goal in
                       let uu____774 = FStar_Tactics_Types.goal_witness goal in
                       tts uu____773 uu____774 in
                     let uu____775 =
                       let uu____776 = FStar_Tactics_Types.goal_env goal in
                       let uu____777 = FStar_Tactics_Types.goal_type goal in
                       tts uu____776 uu____777 in
                     FStar_Util.format3 "%s does not solve %s : %s" uu____770
                       uu____772 uu____775 in
                   FStar_Tactics_Monad.fail uu____769)))
let (solve' :
  FStar_Tactics_Types.goal ->
    FStar_Syntax_Syntax.term -> unit FStar_Tactics_Monad.tac)
  =
  fun goal ->
    fun solution ->
      let uu____792 = set_solution goal solution in
      FStar_Tactics_Monad.bind uu____792
        (fun uu____796 ->
           FStar_Tactics_Monad.bind FStar_Tactics_Monad.dismiss
             (fun uu____798 -> FStar_Tactics_Monad.remove_solved_goals))
let (is_true : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t ->
    let t1 = FStar_Syntax_Util.unascribe t in
    let uu____805 = FStar_Syntax_Util.un_squash t1 in
    match uu____805 with
    | FStar_Pervasives_Native.Some t' ->
        let t'1 = FStar_Syntax_Util.unascribe t' in
        let uu____816 =
          let uu____817 = FStar_Syntax_Subst.compress t'1 in
          uu____817.FStar_Syntax_Syntax.n in
        (match uu____816 with
         | FStar_Syntax_Syntax.Tm_fvar fv ->
             FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.true_lid
         | uu____821 -> false)
    | uu____822 -> false
let (is_false : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t ->
    let uu____832 = FStar_Syntax_Util.un_squash t in
    match uu____832 with
    | FStar_Pervasives_Native.Some t' ->
        let uu____842 =
          let uu____843 = FStar_Syntax_Subst.compress t' in
          uu____843.FStar_Syntax_Syntax.n in
        (match uu____842 with
         | FStar_Syntax_Syntax.Tm_fvar fv ->
             FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.false_lid
         | uu____847 -> false)
    | uu____848 -> false
let (tadmit_t : FStar_Syntax_Syntax.term -> unit FStar_Tactics_Monad.tac) =
  fun t ->
    let uu____862 =
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
        (fun ps ->
           FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
             (fun g ->
                (let uu____871 =
                   let uu____872 = FStar_Tactics_Types.goal_type g in
                   uu____872.FStar_Syntax_Syntax.pos in
                 let uu____875 =
                   let uu____880 =
                     let uu____881 =
                       FStar_Tactics_Printing.goal_to_string ""
                         FStar_Pervasives_Native.None ps g in
                     FStar_Util.format1 "Tactics admitted goal <%s>\n\n"
                       uu____881 in
                   (FStar_Errors.Warning_TacAdmit, uu____880) in
                 FStar_Errors.log_issue uu____871 uu____875);
                solve' g t)) in
    FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "tadmit_t") uu____862
let (fresh : unit -> FStar_BigInt.t FStar_Tactics_Monad.tac) =
  fun uu____896 ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
      (fun ps ->
         let n = ps.FStar_Tactics_Types.freshness in
         let ps1 =
           let uu___209_906 = ps in
           {
             FStar_Tactics_Types.main_context =
               (uu___209_906.FStar_Tactics_Types.main_context);
             FStar_Tactics_Types.all_implicits =
               (uu___209_906.FStar_Tactics_Types.all_implicits);
             FStar_Tactics_Types.goals =
               (uu___209_906.FStar_Tactics_Types.goals);
             FStar_Tactics_Types.smt_goals =
               (uu___209_906.FStar_Tactics_Types.smt_goals);
             FStar_Tactics_Types.depth =
               (uu___209_906.FStar_Tactics_Types.depth);
             FStar_Tactics_Types.__dump =
               (uu___209_906.FStar_Tactics_Types.__dump);
             FStar_Tactics_Types.psc = (uu___209_906.FStar_Tactics_Types.psc);
             FStar_Tactics_Types.entry_range =
               (uu___209_906.FStar_Tactics_Types.entry_range);
             FStar_Tactics_Types.guard_policy =
               (uu___209_906.FStar_Tactics_Types.guard_policy);
             FStar_Tactics_Types.freshness = (n + Prims.int_one);
             FStar_Tactics_Types.tac_verb_dbg =
               (uu___209_906.FStar_Tactics_Types.tac_verb_dbg);
             FStar_Tactics_Types.local_state =
               (uu___209_906.FStar_Tactics_Types.local_state)
           } in
         let uu____907 = FStar_Tactics_Monad.set ps1 in
         FStar_Tactics_Monad.bind uu____907
           (fun uu____912 ->
              let uu____913 = FStar_BigInt.of_int_fs n in
              FStar_Tactics_Monad.ret uu____913))
let (curms : unit -> FStar_BigInt.t FStar_Tactics_Monad.tac) =
  fun uu____920 ->
    let uu____923 =
      let uu____924 = FStar_Util.now_ms () in
      FStar_All.pipe_right uu____924 FStar_BigInt.of_int_fs in
    FStar_Tactics_Monad.ret uu____923
let (__tc :
  env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term * FStar_Reflection_Data.typ *
        FStar_TypeChecker_Common.guard_t) FStar_Tactics_Monad.tac)
  =
  fun e ->
    fun t ->
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
        (fun ps ->
           FStar_Tactics_Monad.mlog
             (fun uu____967 ->
                let uu____968 = FStar_Syntax_Print.term_to_string t in
                FStar_Util.print1 "Tac> __tc(%s)\n" uu____968)
             (fun uu____971 ->
                let e1 =
                  let uu___218_973 = e in
                  {
                    FStar_TypeChecker_Env.solver =
                      (uu___218_973.FStar_TypeChecker_Env.solver);
                    FStar_TypeChecker_Env.range =
                      (uu___218_973.FStar_TypeChecker_Env.range);
                    FStar_TypeChecker_Env.curmodule =
                      (uu___218_973.FStar_TypeChecker_Env.curmodule);
                    FStar_TypeChecker_Env.gamma =
                      (uu___218_973.FStar_TypeChecker_Env.gamma);
                    FStar_TypeChecker_Env.gamma_sig =
                      (uu___218_973.FStar_TypeChecker_Env.gamma_sig);
                    FStar_TypeChecker_Env.gamma_cache =
                      (uu___218_973.FStar_TypeChecker_Env.gamma_cache);
                    FStar_TypeChecker_Env.modules =
                      (uu___218_973.FStar_TypeChecker_Env.modules);
                    FStar_TypeChecker_Env.expected_typ =
                      (uu___218_973.FStar_TypeChecker_Env.expected_typ);
                    FStar_TypeChecker_Env.sigtab =
                      (uu___218_973.FStar_TypeChecker_Env.sigtab);
                    FStar_TypeChecker_Env.attrtab =
                      (uu___218_973.FStar_TypeChecker_Env.attrtab);
                    FStar_TypeChecker_Env.instantiate_imp =
                      (uu___218_973.FStar_TypeChecker_Env.instantiate_imp);
                    FStar_TypeChecker_Env.effects =
                      (uu___218_973.FStar_TypeChecker_Env.effects);
                    FStar_TypeChecker_Env.generalize =
                      (uu___218_973.FStar_TypeChecker_Env.generalize);
                    FStar_TypeChecker_Env.letrecs =
                      (uu___218_973.FStar_TypeChecker_Env.letrecs);
                    FStar_TypeChecker_Env.top_level =
                      (uu___218_973.FStar_TypeChecker_Env.top_level);
                    FStar_TypeChecker_Env.check_uvars =
                      (uu___218_973.FStar_TypeChecker_Env.check_uvars);
                    FStar_TypeChecker_Env.use_eq =
                      (uu___218_973.FStar_TypeChecker_Env.use_eq);
                    FStar_TypeChecker_Env.use_eq_strict =
                      (uu___218_973.FStar_TypeChecker_Env.use_eq_strict);
                    FStar_TypeChecker_Env.is_iface =
                      (uu___218_973.FStar_TypeChecker_Env.is_iface);
                    FStar_TypeChecker_Env.admit =
                      (uu___218_973.FStar_TypeChecker_Env.admit);
                    FStar_TypeChecker_Env.lax =
                      (uu___218_973.FStar_TypeChecker_Env.lax);
                    FStar_TypeChecker_Env.lax_universes =
                      (uu___218_973.FStar_TypeChecker_Env.lax_universes);
                    FStar_TypeChecker_Env.phase1 =
                      (uu___218_973.FStar_TypeChecker_Env.phase1);
                    FStar_TypeChecker_Env.failhard =
                      (uu___218_973.FStar_TypeChecker_Env.failhard);
                    FStar_TypeChecker_Env.nosynth =
                      (uu___218_973.FStar_TypeChecker_Env.nosynth);
                    FStar_TypeChecker_Env.uvar_subtyping = false;
                    FStar_TypeChecker_Env.tc_term =
                      (uu___218_973.FStar_TypeChecker_Env.tc_term);
                    FStar_TypeChecker_Env.type_of =
                      (uu___218_973.FStar_TypeChecker_Env.type_of);
                    FStar_TypeChecker_Env.universe_of =
                      (uu___218_973.FStar_TypeChecker_Env.universe_of);
                    FStar_TypeChecker_Env.check_type_of =
                      (uu___218_973.FStar_TypeChecker_Env.check_type_of);
                    FStar_TypeChecker_Env.use_bv_sorts =
                      (uu___218_973.FStar_TypeChecker_Env.use_bv_sorts);
                    FStar_TypeChecker_Env.qtbl_name_and_index =
                      (uu___218_973.FStar_TypeChecker_Env.qtbl_name_and_index);
                    FStar_TypeChecker_Env.normalized_eff_names =
                      (uu___218_973.FStar_TypeChecker_Env.normalized_eff_names);
                    FStar_TypeChecker_Env.fv_delta_depths =
                      (uu___218_973.FStar_TypeChecker_Env.fv_delta_depths);
                    FStar_TypeChecker_Env.proof_ns =
                      (uu___218_973.FStar_TypeChecker_Env.proof_ns);
                    FStar_TypeChecker_Env.synth_hook =
                      (uu___218_973.FStar_TypeChecker_Env.synth_hook);
                    FStar_TypeChecker_Env.try_solve_implicits_hook =
                      (uu___218_973.FStar_TypeChecker_Env.try_solve_implicits_hook);
                    FStar_TypeChecker_Env.splice =
                      (uu___218_973.FStar_TypeChecker_Env.splice);
                    FStar_TypeChecker_Env.mpreprocess =
                      (uu___218_973.FStar_TypeChecker_Env.mpreprocess);
                    FStar_TypeChecker_Env.postprocess =
                      (uu___218_973.FStar_TypeChecker_Env.postprocess);
                    FStar_TypeChecker_Env.identifier_info =
                      (uu___218_973.FStar_TypeChecker_Env.identifier_info);
                    FStar_TypeChecker_Env.tc_hooks =
                      (uu___218_973.FStar_TypeChecker_Env.tc_hooks);
                    FStar_TypeChecker_Env.dsenv =
                      (uu___218_973.FStar_TypeChecker_Env.dsenv);
                    FStar_TypeChecker_Env.nbe =
                      (uu___218_973.FStar_TypeChecker_Env.nbe);
                    FStar_TypeChecker_Env.strict_args_tab =
                      (uu___218_973.FStar_TypeChecker_Env.strict_args_tab);
                    FStar_TypeChecker_Env.erasable_types_tab =
                      (uu___218_973.FStar_TypeChecker_Env.erasable_types_tab);
                    FStar_TypeChecker_Env.enable_defer_to_tac =
                      (uu___218_973.FStar_TypeChecker_Env.enable_defer_to_tac)
                  } in
                try
                  (fun uu___222_984 ->
                     match () with
                     | () ->
                         let uu____993 =
                           FStar_TypeChecker_TcTerm.type_of_tot_term e1 t in
                         FStar_Tactics_Monad.ret uu____993) ()
                with
                | FStar_Errors.Err (uu____1020, msg) ->
                    let uu____1022 = tts e1 t in
                    let uu____1023 =
                      let uu____1024 = FStar_TypeChecker_Env.all_binders e1 in
                      FStar_All.pipe_right uu____1024
                        (FStar_Syntax_Print.binders_to_string ", ") in
                    fail3 "Cannot type %s in context (%s). Error = (%s)"
                      uu____1022 uu____1023 msg
                | FStar_Errors.Error (uu____1031, msg, uu____1033) ->
                    let uu____1034 = tts e1 t in
                    let uu____1035 =
                      let uu____1036 = FStar_TypeChecker_Env.all_binders e1 in
                      FStar_All.pipe_right uu____1036
                        (FStar_Syntax_Print.binders_to_string ", ") in
                    fail3 "Cannot type %s in context (%s). Error = (%s)"
                      uu____1034 uu____1035 msg))
let (__tc_ghost :
  env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term * FStar_Reflection_Data.typ *
        FStar_TypeChecker_Common.guard_t) FStar_Tactics_Monad.tac)
  =
  fun e ->
    fun t ->
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
        (fun ps ->
           FStar_Tactics_Monad.mlog
             (fun uu____1085 ->
                let uu____1086 = FStar_Syntax_Print.term_to_string t in
                FStar_Util.print1 "Tac> __tc_ghost(%s)\n" uu____1086)
             (fun uu____1089 ->
                let e1 =
                  let uu___239_1091 = e in
                  {
                    FStar_TypeChecker_Env.solver =
                      (uu___239_1091.FStar_TypeChecker_Env.solver);
                    FStar_TypeChecker_Env.range =
                      (uu___239_1091.FStar_TypeChecker_Env.range);
                    FStar_TypeChecker_Env.curmodule =
                      (uu___239_1091.FStar_TypeChecker_Env.curmodule);
                    FStar_TypeChecker_Env.gamma =
                      (uu___239_1091.FStar_TypeChecker_Env.gamma);
                    FStar_TypeChecker_Env.gamma_sig =
                      (uu___239_1091.FStar_TypeChecker_Env.gamma_sig);
                    FStar_TypeChecker_Env.gamma_cache =
                      (uu___239_1091.FStar_TypeChecker_Env.gamma_cache);
                    FStar_TypeChecker_Env.modules =
                      (uu___239_1091.FStar_TypeChecker_Env.modules);
                    FStar_TypeChecker_Env.expected_typ =
                      (uu___239_1091.FStar_TypeChecker_Env.expected_typ);
                    FStar_TypeChecker_Env.sigtab =
                      (uu___239_1091.FStar_TypeChecker_Env.sigtab);
                    FStar_TypeChecker_Env.attrtab =
                      (uu___239_1091.FStar_TypeChecker_Env.attrtab);
                    FStar_TypeChecker_Env.instantiate_imp =
                      (uu___239_1091.FStar_TypeChecker_Env.instantiate_imp);
                    FStar_TypeChecker_Env.effects =
                      (uu___239_1091.FStar_TypeChecker_Env.effects);
                    FStar_TypeChecker_Env.generalize =
                      (uu___239_1091.FStar_TypeChecker_Env.generalize);
                    FStar_TypeChecker_Env.letrecs =
                      (uu___239_1091.FStar_TypeChecker_Env.letrecs);
                    FStar_TypeChecker_Env.top_level =
                      (uu___239_1091.FStar_TypeChecker_Env.top_level);
                    FStar_TypeChecker_Env.check_uvars =
                      (uu___239_1091.FStar_TypeChecker_Env.check_uvars);
                    FStar_TypeChecker_Env.use_eq =
                      (uu___239_1091.FStar_TypeChecker_Env.use_eq);
                    FStar_TypeChecker_Env.use_eq_strict =
                      (uu___239_1091.FStar_TypeChecker_Env.use_eq_strict);
                    FStar_TypeChecker_Env.is_iface =
                      (uu___239_1091.FStar_TypeChecker_Env.is_iface);
                    FStar_TypeChecker_Env.admit =
                      (uu___239_1091.FStar_TypeChecker_Env.admit);
                    FStar_TypeChecker_Env.lax =
                      (uu___239_1091.FStar_TypeChecker_Env.lax);
                    FStar_TypeChecker_Env.lax_universes =
                      (uu___239_1091.FStar_TypeChecker_Env.lax_universes);
                    FStar_TypeChecker_Env.phase1 =
                      (uu___239_1091.FStar_TypeChecker_Env.phase1);
                    FStar_TypeChecker_Env.failhard =
                      (uu___239_1091.FStar_TypeChecker_Env.failhard);
                    FStar_TypeChecker_Env.nosynth =
                      (uu___239_1091.FStar_TypeChecker_Env.nosynth);
                    FStar_TypeChecker_Env.uvar_subtyping = false;
                    FStar_TypeChecker_Env.tc_term =
                      (uu___239_1091.FStar_TypeChecker_Env.tc_term);
                    FStar_TypeChecker_Env.type_of =
                      (uu___239_1091.FStar_TypeChecker_Env.type_of);
                    FStar_TypeChecker_Env.universe_of =
                      (uu___239_1091.FStar_TypeChecker_Env.universe_of);
                    FStar_TypeChecker_Env.check_type_of =
                      (uu___239_1091.FStar_TypeChecker_Env.check_type_of);
                    FStar_TypeChecker_Env.use_bv_sorts =
                      (uu___239_1091.FStar_TypeChecker_Env.use_bv_sorts);
                    FStar_TypeChecker_Env.qtbl_name_and_index =
                      (uu___239_1091.FStar_TypeChecker_Env.qtbl_name_and_index);
                    FStar_TypeChecker_Env.normalized_eff_names =
                      (uu___239_1091.FStar_TypeChecker_Env.normalized_eff_names);
                    FStar_TypeChecker_Env.fv_delta_depths =
                      (uu___239_1091.FStar_TypeChecker_Env.fv_delta_depths);
                    FStar_TypeChecker_Env.proof_ns =
                      (uu___239_1091.FStar_TypeChecker_Env.proof_ns);
                    FStar_TypeChecker_Env.synth_hook =
                      (uu___239_1091.FStar_TypeChecker_Env.synth_hook);
                    FStar_TypeChecker_Env.try_solve_implicits_hook =
                      (uu___239_1091.FStar_TypeChecker_Env.try_solve_implicits_hook);
                    FStar_TypeChecker_Env.splice =
                      (uu___239_1091.FStar_TypeChecker_Env.splice);
                    FStar_TypeChecker_Env.mpreprocess =
                      (uu___239_1091.FStar_TypeChecker_Env.mpreprocess);
                    FStar_TypeChecker_Env.postprocess =
                      (uu___239_1091.FStar_TypeChecker_Env.postprocess);
                    FStar_TypeChecker_Env.identifier_info =
                      (uu___239_1091.FStar_TypeChecker_Env.identifier_info);
                    FStar_TypeChecker_Env.tc_hooks =
                      (uu___239_1091.FStar_TypeChecker_Env.tc_hooks);
                    FStar_TypeChecker_Env.dsenv =
                      (uu___239_1091.FStar_TypeChecker_Env.dsenv);
                    FStar_TypeChecker_Env.nbe =
                      (uu___239_1091.FStar_TypeChecker_Env.nbe);
                    FStar_TypeChecker_Env.strict_args_tab =
                      (uu___239_1091.FStar_TypeChecker_Env.strict_args_tab);
                    FStar_TypeChecker_Env.erasable_types_tab =
                      (uu___239_1091.FStar_TypeChecker_Env.erasable_types_tab);
                    FStar_TypeChecker_Env.enable_defer_to_tac =
                      (uu___239_1091.FStar_TypeChecker_Env.enable_defer_to_tac)
                  } in
                try
                  (fun uu___243_1105 ->
                     match () with
                     | () ->
                         let uu____1114 =
                           FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term e1 t in
                         (match uu____1114 with
                          | (t1, lc, g) ->
                              FStar_Tactics_Monad.ret
                                (t1, (lc.FStar_TypeChecker_Common.res_typ),
                                  g))) ()
                with
                | FStar_Errors.Err (uu____1152, msg) ->
                    let uu____1154 = tts e1 t in
                    let uu____1155 =
                      let uu____1156 = FStar_TypeChecker_Env.all_binders e1 in
                      FStar_All.pipe_right uu____1156
                        (FStar_Syntax_Print.binders_to_string ", ") in
                    fail3 "Cannot type %s in context (%s). Error = (%s)"
                      uu____1154 uu____1155 msg
                | FStar_Errors.Error (uu____1163, msg, uu____1165) ->
                    let uu____1166 = tts e1 t in
                    let uu____1167 =
                      let uu____1168 = FStar_TypeChecker_Env.all_binders e1 in
                      FStar_All.pipe_right uu____1168
                        (FStar_Syntax_Print.binders_to_string ", ") in
                    fail3 "Cannot type %s in context (%s). Error = (%s)"
                      uu____1166 uu____1167 msg))
let (__tc_lax :
  env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.lcomp *
        FStar_TypeChecker_Common.guard_t) FStar_Tactics_Monad.tac)
  =
  fun e ->
    fun t ->
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
        (fun ps ->
           FStar_Tactics_Monad.mlog
             (fun uu____1217 ->
                let uu____1218 = FStar_Syntax_Print.term_to_string t in
                FStar_Util.print1 "Tac> __tc_lax(%s)\n" uu____1218)
             (fun uu____1222 ->
                let e1 =
                  let uu___264_1224 = e in
                  {
                    FStar_TypeChecker_Env.solver =
                      (uu___264_1224.FStar_TypeChecker_Env.solver);
                    FStar_TypeChecker_Env.range =
                      (uu___264_1224.FStar_TypeChecker_Env.range);
                    FStar_TypeChecker_Env.curmodule =
                      (uu___264_1224.FStar_TypeChecker_Env.curmodule);
                    FStar_TypeChecker_Env.gamma =
                      (uu___264_1224.FStar_TypeChecker_Env.gamma);
                    FStar_TypeChecker_Env.gamma_sig =
                      (uu___264_1224.FStar_TypeChecker_Env.gamma_sig);
                    FStar_TypeChecker_Env.gamma_cache =
                      (uu___264_1224.FStar_TypeChecker_Env.gamma_cache);
                    FStar_TypeChecker_Env.modules =
                      (uu___264_1224.FStar_TypeChecker_Env.modules);
                    FStar_TypeChecker_Env.expected_typ =
                      (uu___264_1224.FStar_TypeChecker_Env.expected_typ);
                    FStar_TypeChecker_Env.sigtab =
                      (uu___264_1224.FStar_TypeChecker_Env.sigtab);
                    FStar_TypeChecker_Env.attrtab =
                      (uu___264_1224.FStar_TypeChecker_Env.attrtab);
                    FStar_TypeChecker_Env.instantiate_imp =
                      (uu___264_1224.FStar_TypeChecker_Env.instantiate_imp);
                    FStar_TypeChecker_Env.effects =
                      (uu___264_1224.FStar_TypeChecker_Env.effects);
                    FStar_TypeChecker_Env.generalize =
                      (uu___264_1224.FStar_TypeChecker_Env.generalize);
                    FStar_TypeChecker_Env.letrecs =
                      (uu___264_1224.FStar_TypeChecker_Env.letrecs);
                    FStar_TypeChecker_Env.top_level =
                      (uu___264_1224.FStar_TypeChecker_Env.top_level);
                    FStar_TypeChecker_Env.check_uvars =
                      (uu___264_1224.FStar_TypeChecker_Env.check_uvars);
                    FStar_TypeChecker_Env.use_eq =
                      (uu___264_1224.FStar_TypeChecker_Env.use_eq);
                    FStar_TypeChecker_Env.use_eq_strict =
                      (uu___264_1224.FStar_TypeChecker_Env.use_eq_strict);
                    FStar_TypeChecker_Env.is_iface =
                      (uu___264_1224.FStar_TypeChecker_Env.is_iface);
                    FStar_TypeChecker_Env.admit =
                      (uu___264_1224.FStar_TypeChecker_Env.admit);
                    FStar_TypeChecker_Env.lax =
                      (uu___264_1224.FStar_TypeChecker_Env.lax);
                    FStar_TypeChecker_Env.lax_universes =
                      (uu___264_1224.FStar_TypeChecker_Env.lax_universes);
                    FStar_TypeChecker_Env.phase1 =
                      (uu___264_1224.FStar_TypeChecker_Env.phase1);
                    FStar_TypeChecker_Env.failhard =
                      (uu___264_1224.FStar_TypeChecker_Env.failhard);
                    FStar_TypeChecker_Env.nosynth =
                      (uu___264_1224.FStar_TypeChecker_Env.nosynth);
                    FStar_TypeChecker_Env.uvar_subtyping = false;
                    FStar_TypeChecker_Env.tc_term =
                      (uu___264_1224.FStar_TypeChecker_Env.tc_term);
                    FStar_TypeChecker_Env.type_of =
                      (uu___264_1224.FStar_TypeChecker_Env.type_of);
                    FStar_TypeChecker_Env.universe_of =
                      (uu___264_1224.FStar_TypeChecker_Env.universe_of);
                    FStar_TypeChecker_Env.check_type_of =
                      (uu___264_1224.FStar_TypeChecker_Env.check_type_of);
                    FStar_TypeChecker_Env.use_bv_sorts =
                      (uu___264_1224.FStar_TypeChecker_Env.use_bv_sorts);
                    FStar_TypeChecker_Env.qtbl_name_and_index =
                      (uu___264_1224.FStar_TypeChecker_Env.qtbl_name_and_index);
                    FStar_TypeChecker_Env.normalized_eff_names =
                      (uu___264_1224.FStar_TypeChecker_Env.normalized_eff_names);
                    FStar_TypeChecker_Env.fv_delta_depths =
                      (uu___264_1224.FStar_TypeChecker_Env.fv_delta_depths);
                    FStar_TypeChecker_Env.proof_ns =
                      (uu___264_1224.FStar_TypeChecker_Env.proof_ns);
                    FStar_TypeChecker_Env.synth_hook =
                      (uu___264_1224.FStar_TypeChecker_Env.synth_hook);
                    FStar_TypeChecker_Env.try_solve_implicits_hook =
                      (uu___264_1224.FStar_TypeChecker_Env.try_solve_implicits_hook);
                    FStar_TypeChecker_Env.splice =
                      (uu___264_1224.FStar_TypeChecker_Env.splice);
                    FStar_TypeChecker_Env.mpreprocess =
                      (uu___264_1224.FStar_TypeChecker_Env.mpreprocess);
                    FStar_TypeChecker_Env.postprocess =
                      (uu___264_1224.FStar_TypeChecker_Env.postprocess);
                    FStar_TypeChecker_Env.identifier_info =
                      (uu___264_1224.FStar_TypeChecker_Env.identifier_info);
                    FStar_TypeChecker_Env.tc_hooks =
                      (uu___264_1224.FStar_TypeChecker_Env.tc_hooks);
                    FStar_TypeChecker_Env.dsenv =
                      (uu___264_1224.FStar_TypeChecker_Env.dsenv);
                    FStar_TypeChecker_Env.nbe =
                      (uu___264_1224.FStar_TypeChecker_Env.nbe);
                    FStar_TypeChecker_Env.strict_args_tab =
                      (uu___264_1224.FStar_TypeChecker_Env.strict_args_tab);
                    FStar_TypeChecker_Env.erasable_types_tab =
                      (uu___264_1224.FStar_TypeChecker_Env.erasable_types_tab);
                    FStar_TypeChecker_Env.enable_defer_to_tac =
                      (uu___264_1224.FStar_TypeChecker_Env.enable_defer_to_tac)
                  } in
                let e2 =
                  let uu___267_1226 = e1 in
                  {
                    FStar_TypeChecker_Env.solver =
                      (uu___267_1226.FStar_TypeChecker_Env.solver);
                    FStar_TypeChecker_Env.range =
                      (uu___267_1226.FStar_TypeChecker_Env.range);
                    FStar_TypeChecker_Env.curmodule =
                      (uu___267_1226.FStar_TypeChecker_Env.curmodule);
                    FStar_TypeChecker_Env.gamma =
                      (uu___267_1226.FStar_TypeChecker_Env.gamma);
                    FStar_TypeChecker_Env.gamma_sig =
                      (uu___267_1226.FStar_TypeChecker_Env.gamma_sig);
                    FStar_TypeChecker_Env.gamma_cache =
                      (uu___267_1226.FStar_TypeChecker_Env.gamma_cache);
                    FStar_TypeChecker_Env.modules =
                      (uu___267_1226.FStar_TypeChecker_Env.modules);
                    FStar_TypeChecker_Env.expected_typ =
                      (uu___267_1226.FStar_TypeChecker_Env.expected_typ);
                    FStar_TypeChecker_Env.sigtab =
                      (uu___267_1226.FStar_TypeChecker_Env.sigtab);
                    FStar_TypeChecker_Env.attrtab =
                      (uu___267_1226.FStar_TypeChecker_Env.attrtab);
                    FStar_TypeChecker_Env.instantiate_imp =
                      (uu___267_1226.FStar_TypeChecker_Env.instantiate_imp);
                    FStar_TypeChecker_Env.effects =
                      (uu___267_1226.FStar_TypeChecker_Env.effects);
                    FStar_TypeChecker_Env.generalize =
                      (uu___267_1226.FStar_TypeChecker_Env.generalize);
                    FStar_TypeChecker_Env.letrecs =
                      (uu___267_1226.FStar_TypeChecker_Env.letrecs);
                    FStar_TypeChecker_Env.top_level =
                      (uu___267_1226.FStar_TypeChecker_Env.top_level);
                    FStar_TypeChecker_Env.check_uvars =
                      (uu___267_1226.FStar_TypeChecker_Env.check_uvars);
                    FStar_TypeChecker_Env.use_eq =
                      (uu___267_1226.FStar_TypeChecker_Env.use_eq);
                    FStar_TypeChecker_Env.use_eq_strict =
                      (uu___267_1226.FStar_TypeChecker_Env.use_eq_strict);
                    FStar_TypeChecker_Env.is_iface =
                      (uu___267_1226.FStar_TypeChecker_Env.is_iface);
                    FStar_TypeChecker_Env.admit =
                      (uu___267_1226.FStar_TypeChecker_Env.admit);
                    FStar_TypeChecker_Env.lax = true;
                    FStar_TypeChecker_Env.lax_universes =
                      (uu___267_1226.FStar_TypeChecker_Env.lax_universes);
                    FStar_TypeChecker_Env.phase1 =
                      (uu___267_1226.FStar_TypeChecker_Env.phase1);
                    FStar_TypeChecker_Env.failhard =
                      (uu___267_1226.FStar_TypeChecker_Env.failhard);
                    FStar_TypeChecker_Env.nosynth =
                      (uu___267_1226.FStar_TypeChecker_Env.nosynth);
                    FStar_TypeChecker_Env.uvar_subtyping =
                      (uu___267_1226.FStar_TypeChecker_Env.uvar_subtyping);
                    FStar_TypeChecker_Env.tc_term =
                      (uu___267_1226.FStar_TypeChecker_Env.tc_term);
                    FStar_TypeChecker_Env.type_of =
                      (uu___267_1226.FStar_TypeChecker_Env.type_of);
                    FStar_TypeChecker_Env.universe_of =
                      (uu___267_1226.FStar_TypeChecker_Env.universe_of);
                    FStar_TypeChecker_Env.check_type_of =
                      (uu___267_1226.FStar_TypeChecker_Env.check_type_of);
                    FStar_TypeChecker_Env.use_bv_sorts =
                      (uu___267_1226.FStar_TypeChecker_Env.use_bv_sorts);
                    FStar_TypeChecker_Env.qtbl_name_and_index =
                      (uu___267_1226.FStar_TypeChecker_Env.qtbl_name_and_index);
                    FStar_TypeChecker_Env.normalized_eff_names =
                      (uu___267_1226.FStar_TypeChecker_Env.normalized_eff_names);
                    FStar_TypeChecker_Env.fv_delta_depths =
                      (uu___267_1226.FStar_TypeChecker_Env.fv_delta_depths);
                    FStar_TypeChecker_Env.proof_ns =
                      (uu___267_1226.FStar_TypeChecker_Env.proof_ns);
                    FStar_TypeChecker_Env.synth_hook =
                      (uu___267_1226.FStar_TypeChecker_Env.synth_hook);
                    FStar_TypeChecker_Env.try_solve_implicits_hook =
                      (uu___267_1226.FStar_TypeChecker_Env.try_solve_implicits_hook);
                    FStar_TypeChecker_Env.splice =
                      (uu___267_1226.FStar_TypeChecker_Env.splice);
                    FStar_TypeChecker_Env.mpreprocess =
                      (uu___267_1226.FStar_TypeChecker_Env.mpreprocess);
                    FStar_TypeChecker_Env.postprocess =
                      (uu___267_1226.FStar_TypeChecker_Env.postprocess);
                    FStar_TypeChecker_Env.identifier_info =
                      (uu___267_1226.FStar_TypeChecker_Env.identifier_info);
                    FStar_TypeChecker_Env.tc_hooks =
                      (uu___267_1226.FStar_TypeChecker_Env.tc_hooks);
                    FStar_TypeChecker_Env.dsenv =
                      (uu___267_1226.FStar_TypeChecker_Env.dsenv);
                    FStar_TypeChecker_Env.nbe =
                      (uu___267_1226.FStar_TypeChecker_Env.nbe);
                    FStar_TypeChecker_Env.strict_args_tab =
                      (uu___267_1226.FStar_TypeChecker_Env.strict_args_tab);
                    FStar_TypeChecker_Env.erasable_types_tab =
                      (uu___267_1226.FStar_TypeChecker_Env.erasable_types_tab);
                    FStar_TypeChecker_Env.enable_defer_to_tac =
                      (uu___267_1226.FStar_TypeChecker_Env.enable_defer_to_tac)
                  } in
                try
                  (fun uu___271_1237 ->
                     match () with
                     | () ->
                         let uu____1246 =
                           FStar_TypeChecker_TcTerm.tc_term e2 t in
                         FStar_Tactics_Monad.ret uu____1246) ()
                with
                | FStar_Errors.Err (uu____1273, msg) ->
                    let uu____1275 = tts e2 t in
                    let uu____1276 =
                      let uu____1277 = FStar_TypeChecker_Env.all_binders e2 in
                      FStar_All.pipe_right uu____1277
                        (FStar_Syntax_Print.binders_to_string ", ") in
                    fail3 "Cannot type %s in context (%s). Error = (%s)"
                      uu____1275 uu____1276 msg
                | FStar_Errors.Error (uu____1284, msg, uu____1286) ->
                    let uu____1287 = tts e2 t in
                    let uu____1288 =
                      let uu____1289 = FStar_TypeChecker_Env.all_binders e2 in
                      FStar_All.pipe_right uu____1289
                        (FStar_Syntax_Print.binders_to_string ", ") in
                    fail3 "Cannot type %s in context (%s). Error = (%s)"
                      uu____1287 uu____1288 msg))
let (istrivial : env -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun e ->
    fun t ->
      let steps =
        [FStar_TypeChecker_Env.Reify;
        FStar_TypeChecker_Env.UnfoldUntil FStar_Syntax_Syntax.delta_constant;
        FStar_TypeChecker_Env.Primops;
        FStar_TypeChecker_Env.Simplify;
        FStar_TypeChecker_Env.UnfoldTac;
        FStar_TypeChecker_Env.Unmeta] in
      let t1 = normalize steps e t in is_true t1
let (get_guard_policy :
  unit -> FStar_Tactics_Types.guard_policy FStar_Tactics_Monad.tac) =
  fun uu____1316 ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
      (fun ps -> FStar_Tactics_Monad.ret ps.FStar_Tactics_Types.guard_policy)
let (set_guard_policy :
  FStar_Tactics_Types.guard_policy -> unit FStar_Tactics_Monad.tac) =
  fun pol ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
      (fun ps ->
         FStar_Tactics_Monad.set
           (let uu___292_1334 = ps in
            {
              FStar_Tactics_Types.main_context =
                (uu___292_1334.FStar_Tactics_Types.main_context);
              FStar_Tactics_Types.all_implicits =
                (uu___292_1334.FStar_Tactics_Types.all_implicits);
              FStar_Tactics_Types.goals =
                (uu___292_1334.FStar_Tactics_Types.goals);
              FStar_Tactics_Types.smt_goals =
                (uu___292_1334.FStar_Tactics_Types.smt_goals);
              FStar_Tactics_Types.depth =
                (uu___292_1334.FStar_Tactics_Types.depth);
              FStar_Tactics_Types.__dump =
                (uu___292_1334.FStar_Tactics_Types.__dump);
              FStar_Tactics_Types.psc =
                (uu___292_1334.FStar_Tactics_Types.psc);
              FStar_Tactics_Types.entry_range =
                (uu___292_1334.FStar_Tactics_Types.entry_range);
              FStar_Tactics_Types.guard_policy = pol;
              FStar_Tactics_Types.freshness =
                (uu___292_1334.FStar_Tactics_Types.freshness);
              FStar_Tactics_Types.tac_verb_dbg =
                (uu___292_1334.FStar_Tactics_Types.tac_verb_dbg);
              FStar_Tactics_Types.local_state =
                (uu___292_1334.FStar_Tactics_Types.local_state)
            }))
let with_policy :
  'a .
    FStar_Tactics_Types.guard_policy ->
      'a FStar_Tactics_Monad.tac -> 'a FStar_Tactics_Monad.tac
  =
  fun pol ->
    fun t ->
      let uu____1358 = get_guard_policy () in
      FStar_Tactics_Monad.bind uu____1358
        (fun old_pol ->
           let uu____1364 = set_guard_policy pol in
           FStar_Tactics_Monad.bind uu____1364
             (fun uu____1368 ->
                FStar_Tactics_Monad.bind t
                  (fun r ->
                     let uu____1372 = set_guard_policy old_pol in
                     FStar_Tactics_Monad.bind uu____1372
                       (fun uu____1376 -> FStar_Tactics_Monad.ret r))))
let (getopts : FStar_Options.optionstate FStar_Tactics_Monad.tac) =
  let uu____1379 = trytac FStar_Tactics_Monad.cur_goal in
  FStar_Tactics_Monad.bind uu____1379
    (fun uu___0_1388 ->
       match uu___0_1388 with
       | FStar_Pervasives_Native.Some g ->
           FStar_Tactics_Monad.ret g.FStar_Tactics_Types.opts
       | FStar_Pervasives_Native.None ->
           let uu____1394 = FStar_Options.peek () in
           FStar_Tactics_Monad.ret uu____1394)
let (proc_guard :
  Prims.string ->
    env -> FStar_TypeChecker_Common.guard_t -> unit FStar_Tactics_Monad.tac)
  =
  fun reason ->
    fun e ->
      fun g ->
        FStar_Tactics_Monad.mlog
          (fun uu____1416 ->
             let uu____1417 = FStar_TypeChecker_Rel.guard_to_string e g in
             FStar_Util.print2 "Processing guard (%s:%s)\n" reason uu____1417)
          (fun uu____1420 ->
             let uu____1421 =
               FStar_Tactics_Monad.add_implicits
                 g.FStar_TypeChecker_Common.implicits in
             FStar_Tactics_Monad.bind uu____1421
               (fun uu____1425 ->
                  FStar_Tactics_Monad.bind getopts
                    (fun opts ->
                       let uu____1429 =
                         let uu____1430 =
                           FStar_TypeChecker_Rel.simplify_guard e g in
                         uu____1430.FStar_TypeChecker_Common.guard_f in
                       match uu____1429 with
                       | FStar_TypeChecker_Common.Trivial ->
                           FStar_Tactics_Monad.ret ()
                       | FStar_TypeChecker_Common.NonTrivial f ->
                           let uu____1434 = istrivial e f in
                           if uu____1434
                           then FStar_Tactics_Monad.ret ()
                           else
                             FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
                               (fun ps ->
                                  match ps.FStar_Tactics_Types.guard_policy
                                  with
                                  | FStar_Tactics_Types.Drop ->
                                      ((let uu____1444 =
                                          let uu____1449 =
                                            let uu____1450 =
                                              FStar_TypeChecker_Rel.guard_to_string
                                                e g in
                                            FStar_Util.format1
                                              "Tactics admitted guard <%s>\n\n"
                                              uu____1450 in
                                          (FStar_Errors.Warning_TacAdmit,
                                            uu____1449) in
                                        FStar_Errors.log_issue
                                          e.FStar_TypeChecker_Env.range
                                          uu____1444);
                                       FStar_Tactics_Monad.ret ())
                                  | FStar_Tactics_Types.Goal ->
                                      FStar_Tactics_Monad.mlog
                                        (fun uu____1453 ->
                                           let uu____1454 =
                                             FStar_TypeChecker_Rel.guard_to_string
                                               e g in
                                           FStar_Util.print2
                                             "Making guard (%s:%s) into a goal\n"
                                             reason uu____1454)
                                        (fun uu____1457 ->
                                           let uu____1458 =
                                             FStar_Tactics_Monad.mk_irrelevant_goal
                                               reason e f opts "" in
                                           FStar_Tactics_Monad.bind
                                             uu____1458
                                             (fun goal ->
                                                let goal1 =
                                                  let uu___321_1465 = goal in
                                                  {
                                                    FStar_Tactics_Types.goal_main_env
                                                      =
                                                      (uu___321_1465.FStar_Tactics_Types.goal_main_env);
                                                    FStar_Tactics_Types.goal_ctx_uvar
                                                      =
                                                      (uu___321_1465.FStar_Tactics_Types.goal_ctx_uvar);
                                                    FStar_Tactics_Types.opts
                                                      =
                                                      (uu___321_1465.FStar_Tactics_Types.opts);
                                                    FStar_Tactics_Types.is_guard
                                                      = true;
                                                    FStar_Tactics_Types.label
                                                      =
                                                      (uu___321_1465.FStar_Tactics_Types.label)
                                                  } in
                                                FStar_Tactics_Monad.push_goals
                                                  [goal1]))
                                  | FStar_Tactics_Types.SMT ->
                                      FStar_Tactics_Monad.mlog
                                        (fun uu____1468 ->
                                           let uu____1469 =
                                             FStar_TypeChecker_Rel.guard_to_string
                                               e g in
                                           FStar_Util.print2
                                             "Sending guard (%s:%s) to SMT goal\n"
                                             reason uu____1469)
                                        (fun uu____1472 ->
                                           let uu____1473 =
                                             FStar_Tactics_Monad.mk_irrelevant_goal
                                               reason e f opts "" in
                                           FStar_Tactics_Monad.bind
                                             uu____1473
                                             (fun goal ->
                                                let goal1 =
                                                  let uu___328_1480 = goal in
                                                  {
                                                    FStar_Tactics_Types.goal_main_env
                                                      =
                                                      (uu___328_1480.FStar_Tactics_Types.goal_main_env);
                                                    FStar_Tactics_Types.goal_ctx_uvar
                                                      =
                                                      (uu___328_1480.FStar_Tactics_Types.goal_ctx_uvar);
                                                    FStar_Tactics_Types.opts
                                                      =
                                                      (uu___328_1480.FStar_Tactics_Types.opts);
                                                    FStar_Tactics_Types.is_guard
                                                      = true;
                                                    FStar_Tactics_Types.label
                                                      =
                                                      (uu___328_1480.FStar_Tactics_Types.label)
                                                  } in
                                                FStar_Tactics_Monad.push_smt_goals
                                                  [goal1]))
                                  | FStar_Tactics_Types.Force ->
                                      FStar_Tactics_Monad.mlog
                                        (fun uu____1483 ->
                                           let uu____1484 =
                                             FStar_TypeChecker_Rel.guard_to_string
                                               e g in
                                           FStar_Util.print2
                                             "Forcing guard (%s:%s)\n" reason
                                             uu____1484)
                                        (fun uu____1486 ->
                                           try
                                             (fun uu___335_1491 ->
                                                match () with
                                                | () ->
                                                    let uu____1494 =
                                                      let uu____1495 =
                                                        let uu____1496 =
                                                          FStar_TypeChecker_Rel.discharge_guard_no_smt
                                                            e g in
                                                        FStar_All.pipe_left
                                                          FStar_TypeChecker_Env.is_trivial
                                                          uu____1496 in
                                                      Prims.op_Negation
                                                        uu____1495 in
                                                    if uu____1494
                                                    then
                                                      FStar_Tactics_Monad.mlog
                                                        (fun uu____1501 ->
                                                           let uu____1502 =
                                                             FStar_TypeChecker_Rel.guard_to_string
                                                               e g in
                                                           FStar_Util.print1
                                                             "guard = %s\n"
                                                             uu____1502)
                                                        (fun uu____1504 ->
                                                           fail1
                                                             "Forcing the guard failed (%s)"
                                                             reason)
                                                    else
                                                      FStar_Tactics_Monad.ret
                                                        ()) ()
                                           with
                                           | uu___334_1507 ->
                                               FStar_Tactics_Monad.mlog
                                                 (fun uu____1512 ->
                                                    let uu____1513 =
                                                      FStar_TypeChecker_Rel.guard_to_string
                                                        e g in
                                                    FStar_Util.print1
                                                      "guard = %s\n"
                                                      uu____1513)
                                                 (fun uu____1515 ->
                                                    fail1
                                                      "Forcing the guard failed (%s)"
                                                      reason))))))
let (tcc :
  env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.comp FStar_Tactics_Monad.tac)
  =
  fun e ->
    fun t ->
      let uu____1530 =
        let uu____1533 = __tc_lax e t in
        FStar_Tactics_Monad.bind uu____1533
          (fun uu____1553 ->
             match uu____1553 with
             | (uu____1562, lc, uu____1564) ->
                 let uu____1565 =
                   let uu____1566 = FStar_TypeChecker_Common.lcomp_comp lc in
                   FStar_All.pipe_right uu____1566
                     FStar_Pervasives_Native.fst in
                 FStar_Tactics_Monad.ret uu____1565) in
      FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "tcc") uu____1530
let (tc :
  env ->
    FStar_Syntax_Syntax.term ->
      FStar_Reflection_Data.typ FStar_Tactics_Monad.tac)
  =
  fun e ->
    fun t ->
      let uu____1593 =
        let uu____1598 = tcc e t in
        FStar_Tactics_Monad.bind uu____1598
          (fun c -> FStar_Tactics_Monad.ret (FStar_Syntax_Util.comp_result c)) in
      FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "tc") uu____1593
let (trivial : unit -> unit FStar_Tactics_Monad.tac) =
  fun uu____1621 ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
      (fun goal ->
         let uu____1627 =
           let uu____1628 = FStar_Tactics_Types.goal_env goal in
           let uu____1629 = FStar_Tactics_Types.goal_type goal in
           istrivial uu____1628 uu____1629 in
         if uu____1627
         then solve' goal FStar_Syntax_Util.exp_unit
         else
           (let uu____1633 =
              let uu____1634 = FStar_Tactics_Types.goal_env goal in
              let uu____1635 = FStar_Tactics_Types.goal_type goal in
              tts uu____1634 uu____1635 in
            fail1 "Not a trivial goal: %s" uu____1633))
let divide :
  'a 'b .
    FStar_BigInt.t ->
      'a FStar_Tactics_Monad.tac ->
        'b FStar_Tactics_Monad.tac -> ('a * 'b) FStar_Tactics_Monad.tac
  =
  fun n ->
    fun l ->
      fun r ->
        FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
          (fun p ->
             let uu____1684 =
               try
                 (fun uu___386_1707 ->
                    match () with
                    | () ->
                        let uu____1718 =
                          let uu____1727 = FStar_BigInt.to_int_fs n in
                          FStar_List.splitAt uu____1727
                            p.FStar_Tactics_Types.goals in
                        FStar_Tactics_Monad.ret uu____1718) ()
               with
               | uu___385_1737 ->
                   FStar_Tactics_Monad.fail "divide: not enough goals" in
             FStar_Tactics_Monad.bind uu____1684
               (fun uu____1773 ->
                  match uu____1773 with
                  | (lgs, rgs) ->
                      let lp =
                        let uu___368_1799 = p in
                        {
                          FStar_Tactics_Types.main_context =
                            (uu___368_1799.FStar_Tactics_Types.main_context);
                          FStar_Tactics_Types.all_implicits =
                            (uu___368_1799.FStar_Tactics_Types.all_implicits);
                          FStar_Tactics_Types.goals = lgs;
                          FStar_Tactics_Types.smt_goals = [];
                          FStar_Tactics_Types.depth =
                            (uu___368_1799.FStar_Tactics_Types.depth);
                          FStar_Tactics_Types.__dump =
                            (uu___368_1799.FStar_Tactics_Types.__dump);
                          FStar_Tactics_Types.psc =
                            (uu___368_1799.FStar_Tactics_Types.psc);
                          FStar_Tactics_Types.entry_range =
                            (uu___368_1799.FStar_Tactics_Types.entry_range);
                          FStar_Tactics_Types.guard_policy =
                            (uu___368_1799.FStar_Tactics_Types.guard_policy);
                          FStar_Tactics_Types.freshness =
                            (uu___368_1799.FStar_Tactics_Types.freshness);
                          FStar_Tactics_Types.tac_verb_dbg =
                            (uu___368_1799.FStar_Tactics_Types.tac_verb_dbg);
                          FStar_Tactics_Types.local_state =
                            (uu___368_1799.FStar_Tactics_Types.local_state)
                        } in
                      let uu____1800 = FStar_Tactics_Monad.set lp in
                      FStar_Tactics_Monad.bind uu____1800
                        (fun uu____1808 ->
                           FStar_Tactics_Monad.bind l
                             (fun a1 ->
                                FStar_Tactics_Monad.bind
                                  FStar_Tactics_Monad.get
                                  (fun lp' ->
                                     let rp =
                                       let uu___374_1824 = lp' in
                                       {
                                         FStar_Tactics_Types.main_context =
                                           (uu___374_1824.FStar_Tactics_Types.main_context);
                                         FStar_Tactics_Types.all_implicits =
                                           (uu___374_1824.FStar_Tactics_Types.all_implicits);
                                         FStar_Tactics_Types.goals = rgs;
                                         FStar_Tactics_Types.smt_goals = [];
                                         FStar_Tactics_Types.depth =
                                           (uu___374_1824.FStar_Tactics_Types.depth);
                                         FStar_Tactics_Types.__dump =
                                           (uu___374_1824.FStar_Tactics_Types.__dump);
                                         FStar_Tactics_Types.psc =
                                           (uu___374_1824.FStar_Tactics_Types.psc);
                                         FStar_Tactics_Types.entry_range =
                                           (uu___374_1824.FStar_Tactics_Types.entry_range);
                                         FStar_Tactics_Types.guard_policy =
                                           (uu___374_1824.FStar_Tactics_Types.guard_policy);
                                         FStar_Tactics_Types.freshness =
                                           (uu___374_1824.FStar_Tactics_Types.freshness);
                                         FStar_Tactics_Types.tac_verb_dbg =
                                           (uu___374_1824.FStar_Tactics_Types.tac_verb_dbg);
                                         FStar_Tactics_Types.local_state =
                                           (uu___374_1824.FStar_Tactics_Types.local_state)
                                       } in
                                     let uu____1825 =
                                       FStar_Tactics_Monad.set rp in
                                     FStar_Tactics_Monad.bind uu____1825
                                       (fun uu____1833 ->
                                          FStar_Tactics_Monad.bind r
                                            (fun b1 ->
                                               FStar_Tactics_Monad.bind
                                                 FStar_Tactics_Monad.get
                                                 (fun rp' ->
                                                    let p' =
                                                      let uu___380_1849 = rp' in
                                                      {
                                                        FStar_Tactics_Types.main_context
                                                          =
                                                          (uu___380_1849.FStar_Tactics_Types.main_context);
                                                        FStar_Tactics_Types.all_implicits
                                                          =
                                                          (uu___380_1849.FStar_Tactics_Types.all_implicits);
                                                        FStar_Tactics_Types.goals
                                                          =
                                                          (FStar_List.append
                                                             lp'.FStar_Tactics_Types.goals
                                                             rp'.FStar_Tactics_Types.goals);
                                                        FStar_Tactics_Types.smt_goals
                                                          =
                                                          (FStar_List.append
                                                             lp'.FStar_Tactics_Types.smt_goals
                                                             (FStar_List.append
                                                                rp'.FStar_Tactics_Types.smt_goals
                                                                p.FStar_Tactics_Types.smt_goals));
                                                        FStar_Tactics_Types.depth
                                                          =
                                                          (uu___380_1849.FStar_Tactics_Types.depth);
                                                        FStar_Tactics_Types.__dump
                                                          =
                                                          (uu___380_1849.FStar_Tactics_Types.__dump);
                                                        FStar_Tactics_Types.psc
                                                          =
                                                          (uu___380_1849.FStar_Tactics_Types.psc);
                                                        FStar_Tactics_Types.entry_range
                                                          =
                                                          (uu___380_1849.FStar_Tactics_Types.entry_range);
                                                        FStar_Tactics_Types.guard_policy
                                                          =
                                                          (uu___380_1849.FStar_Tactics_Types.guard_policy);
                                                        FStar_Tactics_Types.freshness
                                                          =
                                                          (uu___380_1849.FStar_Tactics_Types.freshness);
                                                        FStar_Tactics_Types.tac_verb_dbg
                                                          =
                                                          (uu___380_1849.FStar_Tactics_Types.tac_verb_dbg);
                                                        FStar_Tactics_Types.local_state
                                                          =
                                                          (uu___380_1849.FStar_Tactics_Types.local_state)
                                                      } in
                                                    let uu____1850 =
                                                      FStar_Tactics_Monad.set
                                                        p' in
                                                    FStar_Tactics_Monad.bind
                                                      uu____1850
                                                      (fun uu____1858 ->
                                                         FStar_Tactics_Monad.bind
                                                           FStar_Tactics_Monad.remove_solved_goals
                                                           (fun uu____1864 ->
                                                              FStar_Tactics_Monad.ret
                                                                (a1, b1)))))))))))
let focus : 'a . 'a FStar_Tactics_Monad.tac -> 'a FStar_Tactics_Monad.tac =
  fun f ->
    let uu____1885 = divide FStar_BigInt.one f FStar_Tactics_Monad.idtac in
    FStar_Tactics_Monad.bind uu____1885
      (fun uu____1898 ->
         match uu____1898 with | (a1, ()) -> FStar_Tactics_Monad.ret a1)
let rec map :
  'a . 'a FStar_Tactics_Monad.tac -> 'a Prims.list FStar_Tactics_Monad.tac =
  fun tau ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
      (fun p ->
         match p.FStar_Tactics_Types.goals with
         | [] -> FStar_Tactics_Monad.ret []
         | uu____1935::uu____1936 ->
             let uu____1939 =
               let uu____1948 = map tau in
               divide FStar_BigInt.one tau uu____1948 in
             FStar_Tactics_Monad.bind uu____1939
               (fun uu____1966 ->
                  match uu____1966 with
                  | (h, t) -> FStar_Tactics_Monad.ret (h :: t)))
let (seq :
  unit FStar_Tactics_Monad.tac ->
    unit FStar_Tactics_Monad.tac -> unit FStar_Tactics_Monad.tac)
  =
  fun t1 ->
    fun t2 ->
      let uu____2007 =
        FStar_Tactics_Monad.bind t1
          (fun uu____2012 ->
             let uu____2013 = map t2 in
             FStar_Tactics_Monad.bind uu____2013
               (fun uu____2021 -> FStar_Tactics_Monad.ret ())) in
      focus uu____2007
let (intro : unit -> FStar_Syntax_Syntax.binder FStar_Tactics_Monad.tac) =
  fun uu____2030 ->
    let uu____2033 =
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
        (fun goal ->
           let uu____2042 =
             let uu____2049 =
               let uu____2050 = FStar_Tactics_Types.goal_env goal in
               let uu____2051 = FStar_Tactics_Types.goal_type goal in
               whnf uu____2050 uu____2051 in
             FStar_Syntax_Util.arrow_one uu____2049 in
           match uu____2042 with
           | FStar_Pervasives_Native.Some (b, c) ->
               let uu____2060 =
                 let uu____2061 = FStar_Syntax_Util.is_total_comp c in
                 Prims.op_Negation uu____2061 in
               if uu____2060
               then FStar_Tactics_Monad.fail "Codomain is effectful"
               else
                 (let env' =
                    let uu____2066 = FStar_Tactics_Types.goal_env goal in
                    FStar_TypeChecker_Env.push_binders uu____2066 [b] in
                  let typ' = FStar_Syntax_Util.comp_result c in
                  let uu____2082 =
                    FStar_Tactics_Monad.new_uvar "intro" env' typ' in
                  FStar_Tactics_Monad.bind uu____2082
                    (fun uu____2098 ->
                       match uu____2098 with
                       | (body, ctx_uvar) ->
                           let sol =
                             FStar_Syntax_Util.abs [b] body
                               (FStar_Pervasives_Native.Some
                                  (FStar_Syntax_Util.residual_comp_of_comp c)) in
                           let uu____2122 = set_solution goal sol in
                           FStar_Tactics_Monad.bind uu____2122
                             (fun uu____2128 ->
                                let g =
                                  FStar_Tactics_Types.mk_goal env' ctx_uvar
                                    goal.FStar_Tactics_Types.opts
                                    goal.FStar_Tactics_Types.is_guard
                                    goal.FStar_Tactics_Types.label in
                                let uu____2130 =
                                  let uu____2133 = bnorm_goal g in
                                  FStar_Tactics_Monad.replace_cur uu____2133 in
                                FStar_Tactics_Monad.bind uu____2130
                                  (fun uu____2135 ->
                                     FStar_Tactics_Monad.ret b))))
           | FStar_Pervasives_Native.None ->
               let uu____2140 =
                 let uu____2141 = FStar_Tactics_Types.goal_env goal in
                 let uu____2142 = FStar_Tactics_Types.goal_type goal in
                 tts uu____2141 uu____2142 in
               fail1 "goal is not an arrow (%s)" uu____2140) in
    FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "intro") uu____2033
let (intro_rec :
  unit ->
    (FStar_Syntax_Syntax.binder * FStar_Syntax_Syntax.binder)
      FStar_Tactics_Monad.tac)
  =
  fun uu____2157 ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
      (fun goal ->
         FStar_Util.print_string
           "WARNING (intro_rec): calling this is known to cause normalizer loops\n";
         FStar_Util.print_string
           "WARNING (intro_rec): proceed at your own risk...\n";
         (let uu____2178 =
            let uu____2185 =
              let uu____2186 = FStar_Tactics_Types.goal_env goal in
              let uu____2187 = FStar_Tactics_Types.goal_type goal in
              whnf uu____2186 uu____2187 in
            FStar_Syntax_Util.arrow_one uu____2185 in
          match uu____2178 with
          | FStar_Pervasives_Native.Some (b, c) ->
              let uu____2200 =
                let uu____2201 = FStar_Syntax_Util.is_total_comp c in
                Prims.op_Negation uu____2201 in
              if uu____2200
              then FStar_Tactics_Monad.fail "Codomain is effectful"
              else
                (let bv =
                   let uu____2214 = FStar_Tactics_Types.goal_type goal in
                   FStar_Syntax_Syntax.gen_bv "__recf"
                     FStar_Pervasives_Native.None uu____2214 in
                 let bs =
                   let uu____2224 = FStar_Syntax_Syntax.mk_binder bv in
                   [uu____2224; b] in
                 let env' =
                   let uu____2250 = FStar_Tactics_Types.goal_env goal in
                   FStar_TypeChecker_Env.push_binders uu____2250 bs in
                 let uu____2251 =
                   FStar_Tactics_Monad.new_uvar "intro_rec" env'
                     (FStar_Syntax_Util.comp_result c) in
                 FStar_Tactics_Monad.bind uu____2251
                   (fun uu____2276 ->
                      match uu____2276 with
                      | (u, ctx_uvar_u) ->
                          let lb =
                            let uu____2290 =
                              FStar_Tactics_Types.goal_type goal in
                            let uu____2293 =
                              FStar_Syntax_Util.abs [b] u
                                FStar_Pervasives_Native.None in
                            FStar_Syntax_Util.mk_letbinding
                              (FStar_Util.Inl bv) [] uu____2290
                              FStar_Parser_Const.effect_Tot_lid uu____2293 []
                              FStar_Range.dummyRange in
                          let body = FStar_Syntax_Syntax.bv_to_name bv in
                          let uu____2311 =
                            FStar_Syntax_Subst.close_let_rec [lb] body in
                          (match uu____2311 with
                           | (lbs, body1) ->
                               let tm =
                                 let uu____2333 =
                                   let uu____2334 =
                                     FStar_Tactics_Types.goal_witness goal in
                                   uu____2334.FStar_Syntax_Syntax.pos in
                                 FStar_Syntax_Syntax.mk
                                   (FStar_Syntax_Syntax.Tm_let
                                      ((true, lbs), body1)) uu____2333 in
                               let uu____2347 = set_solution goal tm in
                               FStar_Tactics_Monad.bind uu____2347
                                 (fun uu____2356 ->
                                    let uu____2357 =
                                      let uu____2360 =
                                        bnorm_goal
                                          (let uu___451_2363 = goal in
                                           {
                                             FStar_Tactics_Types.goal_main_env
                                               =
                                               (uu___451_2363.FStar_Tactics_Types.goal_main_env);
                                             FStar_Tactics_Types.goal_ctx_uvar
                                               = ctx_uvar_u;
                                             FStar_Tactics_Types.opts =
                                               (uu___451_2363.FStar_Tactics_Types.opts);
                                             FStar_Tactics_Types.is_guard =
                                               (uu___451_2363.FStar_Tactics_Types.is_guard);
                                             FStar_Tactics_Types.label =
                                               (uu___451_2363.FStar_Tactics_Types.label)
                                           }) in
                                      FStar_Tactics_Monad.replace_cur
                                        uu____2360 in
                                    FStar_Tactics_Monad.bind uu____2357
                                      (fun uu____2370 ->
                                         let uu____2371 =
                                           let uu____2376 =
                                             FStar_Syntax_Syntax.mk_binder bv in
                                           (uu____2376, b) in
                                         FStar_Tactics_Monad.ret uu____2371)))))
          | FStar_Pervasives_Native.None ->
              let uu____2385 =
                let uu____2386 = FStar_Tactics_Types.goal_env goal in
                let uu____2387 = FStar_Tactics_Types.goal_type goal in
                tts uu____2386 uu____2387 in
              fail1 "intro_rec: goal is not an arrow (%s)" uu____2385))
let (norm :
  FStar_Syntax_Embeddings.norm_step Prims.list ->
    unit FStar_Tactics_Monad.tac)
  =
  fun s ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
      (fun goal ->
         FStar_Tactics_Monad.mlog
           (fun uu____2409 ->
              let uu____2410 =
                let uu____2411 = FStar_Tactics_Types.goal_witness goal in
                FStar_Syntax_Print.term_to_string uu____2411 in
              FStar_Util.print1 "norm: witness = %s\n" uu____2410)
           (fun uu____2416 ->
              let steps =
                let uu____2420 = FStar_TypeChecker_Normalize.tr_norm_steps s in
                FStar_List.append
                  [FStar_TypeChecker_Env.Reify;
                  FStar_TypeChecker_Env.UnfoldTac] uu____2420 in
              let t =
                let uu____2424 = FStar_Tactics_Types.goal_env goal in
                let uu____2425 = FStar_Tactics_Types.goal_type goal in
                normalize steps uu____2424 uu____2425 in
              let uu____2426 = FStar_Tactics_Types.goal_with_type goal t in
              FStar_Tactics_Monad.replace_cur uu____2426))
let (norm_term_env :
  env ->
    FStar_Syntax_Embeddings.norm_step Prims.list ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.term FStar_Tactics_Monad.tac)
  =
  fun e ->
    fun s ->
      fun t ->
        let uu____2450 =
          FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
            (fun ps ->
               let opts =
                 match ps.FStar_Tactics_Types.goals with
                 | g::uu____2458 -> g.FStar_Tactics_Types.opts
                 | uu____2461 -> FStar_Options.peek () in
               FStar_Tactics_Monad.mlog
                 (fun uu____2466 ->
                    let uu____2467 = FStar_Syntax_Print.term_to_string t in
                    FStar_Util.print1 "norm_term_env: t = %s\n" uu____2467)
                 (fun uu____2470 ->
                    let uu____2471 = __tc_lax e t in
                    FStar_Tactics_Monad.bind uu____2471
                      (fun uu____2492 ->
                         match uu____2492 with
                         | (t1, uu____2502, uu____2503) ->
                             let steps =
                               let uu____2507 =
                                 FStar_TypeChecker_Normalize.tr_norm_steps s in
                               FStar_List.append
                                 [FStar_TypeChecker_Env.Reify;
                                 FStar_TypeChecker_Env.UnfoldTac] uu____2507 in
                             let t2 =
                               normalize steps
                                 ps.FStar_Tactics_Types.main_context t1 in
                             FStar_Tactics_Monad.mlog
                               (fun uu____2513 ->
                                  let uu____2514 =
                                    FStar_Syntax_Print.term_to_string t2 in
                                  FStar_Util.print1
                                    "norm_term_env: t' = %s\n" uu____2514)
                               (fun uu____2516 -> FStar_Tactics_Monad.ret t2)))) in
        FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "norm_term")
          uu____2450
let (refine_intro : unit -> unit FStar_Tactics_Monad.tac) =
  fun uu____2527 ->
    let uu____2530 =
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
        (fun g ->
           let uu____2537 =
             let uu____2548 = FStar_Tactics_Types.goal_env g in
             let uu____2549 = FStar_Tactics_Types.goal_type g in
             FStar_TypeChecker_Rel.base_and_refinement uu____2548 uu____2549 in
           match uu____2537 with
           | (uu____2552, FStar_Pervasives_Native.None) ->
               FStar_Tactics_Monad.fail "not a refinement"
           | (t, FStar_Pervasives_Native.Some (bv, phi)) ->
               let g1 = FStar_Tactics_Types.goal_with_type g t in
               let uu____2577 =
                 let uu____2582 =
                   let uu____2587 =
                     let uu____2588 = FStar_Syntax_Syntax.mk_binder bv in
                     [uu____2588] in
                   FStar_Syntax_Subst.open_term uu____2587 phi in
                 match uu____2582 with
                 | (bvs, phi1) ->
                     let uu____2613 =
                       let uu____2614 = FStar_List.hd bvs in
                       FStar_Pervasives_Native.fst uu____2614 in
                     (uu____2613, phi1) in
               (match uu____2577 with
                | (bv1, phi1) ->
                    let uu____2633 =
                      let uu____2636 = FStar_Tactics_Types.goal_env g in
                      let uu____2637 =
                        let uu____2638 =
                          let uu____2641 =
                            let uu____2642 =
                              let uu____2649 =
                                FStar_Tactics_Types.goal_witness g in
                              (bv1, uu____2649) in
                            FStar_Syntax_Syntax.NT uu____2642 in
                          [uu____2641] in
                        FStar_Syntax_Subst.subst uu____2638 phi1 in
                      FStar_Tactics_Monad.mk_irrelevant_goal
                        "refine_intro refinement" uu____2636 uu____2637
                        g.FStar_Tactics_Types.opts
                        g.FStar_Tactics_Types.label in
                    FStar_Tactics_Monad.bind uu____2633
                      (fun g2 ->
                         FStar_Tactics_Monad.bind FStar_Tactics_Monad.dismiss
                           (fun uu____2657 ->
                              FStar_Tactics_Monad.add_goals [g1; g2])))) in
    FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "refine_intro")
      uu____2530
let (__exact_now :
  Prims.bool -> FStar_Syntax_Syntax.term -> unit FStar_Tactics_Monad.tac) =
  fun set_expected_typ ->
    fun t ->
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
        (fun goal ->
           let env1 =
             if set_expected_typ
             then
               let uu____2681 = FStar_Tactics_Types.goal_env goal in
               let uu____2682 = FStar_Tactics_Types.goal_type goal in
               FStar_TypeChecker_Env.set_expected_typ uu____2681 uu____2682
             else FStar_Tactics_Types.goal_env goal in
           let uu____2684 = __tc env1 t in
           FStar_Tactics_Monad.bind uu____2684
             (fun uu____2703 ->
                match uu____2703 with
                | (t1, typ, guard) ->
                    FStar_Tactics_Monad.mlog
                      (fun uu____2718 ->
                         let uu____2719 =
                           FStar_Syntax_Print.term_to_string typ in
                         let uu____2720 =
                           let uu____2721 = FStar_Tactics_Types.goal_env goal in
                           FStar_TypeChecker_Rel.guard_to_string uu____2721
                             guard in
                         FStar_Util.print2
                           "__exact_now: got type %s\n__exact_now: and guard %s\n"
                           uu____2719 uu____2720)
                      (fun uu____2724 ->
                         let uu____2725 =
                           let uu____2728 = FStar_Tactics_Types.goal_env goal in
                           proc_guard "__exact typing" uu____2728 guard in
                         FStar_Tactics_Monad.bind uu____2725
                           (fun uu____2730 ->
                              FStar_Tactics_Monad.mlog
                                (fun uu____2734 ->
                                   let uu____2735 =
                                     FStar_Syntax_Print.term_to_string typ in
                                   let uu____2736 =
                                     let uu____2737 =
                                       FStar_Tactics_Types.goal_type goal in
                                     FStar_Syntax_Print.term_to_string
                                       uu____2737 in
                                   FStar_Util.print2
                                     "__exact_now: unifying %s and %s\n"
                                     uu____2735 uu____2736)
                                (fun uu____2740 ->
                                   let uu____2741 =
                                     let uu____2744 =
                                       FStar_Tactics_Types.goal_env goal in
                                     let uu____2745 =
                                       FStar_Tactics_Types.goal_type goal in
                                     do_unify uu____2744 typ uu____2745 in
                                   FStar_Tactics_Monad.bind uu____2741
                                     (fun b ->
                                        if b
                                        then solve goal t1
                                        else
                                          (let uu____2751 =
                                             let uu____2756 =
                                               let uu____2761 =
                                                 FStar_Tactics_Types.goal_env
                                                   goal in
                                               tts uu____2761 in
                                             let uu____2762 =
                                               FStar_Tactics_Types.goal_type
                                                 goal in
                                             FStar_TypeChecker_Err.print_discrepancy
                                               uu____2756 typ uu____2762 in
                                           match uu____2751 with
                                           | (typ1, goalt) ->
                                               let uu____2767 =
                                                 let uu____2768 =
                                                   FStar_Tactics_Types.goal_env
                                                     goal in
                                                 tts uu____2768 t1 in
                                               let uu____2769 =
                                                 let uu____2770 =
                                                   FStar_Tactics_Types.goal_env
                                                     goal in
                                                 let uu____2771 =
                                                   FStar_Tactics_Types.goal_witness
                                                     goal in
                                                 tts uu____2770 uu____2771 in
                                               fail4
                                                 "%s : %s does not exactly solve the goal %s (witness = %s)"
                                                 uu____2767 typ1 goalt
                                                 uu____2769)))))))
let (t_exact :
  Prims.bool ->
    Prims.bool -> FStar_Syntax_Syntax.term -> unit FStar_Tactics_Monad.tac)
  =
  fun try_refine ->
    fun set_expected_typ ->
      fun tm ->
        let uu____2791 =
          FStar_Tactics_Monad.mlog
            (fun uu____2796 ->
               let uu____2797 = FStar_Syntax_Print.term_to_string tm in
               FStar_Util.print1 "t_exact: tm = %s\n" uu____2797)
            (fun uu____2800 ->
               let uu____2801 =
                 let uu____2808 = __exact_now set_expected_typ tm in
                 catch uu____2808 in
               FStar_Tactics_Monad.bind uu____2801
                 (fun uu___2_2817 ->
                    match uu___2_2817 with
                    | FStar_Util.Inr r -> FStar_Tactics_Monad.ret ()
                    | FStar_Util.Inl e when Prims.op_Negation try_refine ->
                        FStar_Tactics_Monad.traise e
                    | FStar_Util.Inl e ->
                        FStar_Tactics_Monad.mlog
                          (fun uu____2828 ->
                             FStar_Util.print_string
                               "__exact_now failed, trying refine...\n")
                          (fun uu____2831 ->
                             let uu____2832 =
                               let uu____2839 =
                                 let uu____2842 =
                                   norm [FStar_Syntax_Embeddings.Delta] in
                                 FStar_Tactics_Monad.bind uu____2842
                                   (fun uu____2847 ->
                                      let uu____2848 = refine_intro () in
                                      FStar_Tactics_Monad.bind uu____2848
                                        (fun uu____2852 ->
                                           __exact_now set_expected_typ tm)) in
                               catch uu____2839 in
                             FStar_Tactics_Monad.bind uu____2832
                               (fun uu___1_2859 ->
                                  match uu___1_2859 with
                                  | FStar_Util.Inr r ->
                                      FStar_Tactics_Monad.mlog
                                        (fun uu____2868 ->
                                           FStar_Util.print_string
                                             "__exact_now: failed after refining too\n")
                                        (fun uu____2870 ->
                                           FStar_Tactics_Monad.ret ())
                                  | FStar_Util.Inl uu____2871 ->
                                      FStar_Tactics_Monad.mlog
                                        (fun uu____2873 ->
                                           FStar_Util.print_string
                                             "__exact_now: was not a refinement\n")
                                        (fun uu____2875 ->
                                           FStar_Tactics_Monad.traise e))))) in
        FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "exact") uu____2791
let rec (__try_unify_by_application :
  Prims.bool ->
    (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.aqual *
      FStar_Syntax_Syntax.ctx_uvar) Prims.list ->
      env ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.term ->
            (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.aqual *
              FStar_Syntax_Syntax.ctx_uvar) Prims.list
              FStar_Tactics_Monad.tac)
  =
  fun only_match ->
    fun acc ->
      fun e ->
        fun ty1 ->
          fun ty2 ->
            let f = if only_match then do_match else do_unify in
            let uu____2968 = f e ty2 ty1 in
            FStar_Tactics_Monad.bind uu____2968
              (fun uu___3_2980 ->
                 if uu___3_2980
                 then FStar_Tactics_Monad.ret acc
                 else
                   (let uu____2999 = FStar_Syntax_Util.arrow_one ty1 in
                    match uu____2999 with
                    | FStar_Pervasives_Native.None ->
                        let uu____3020 = term_to_string e ty1 in
                        let uu____3021 = term_to_string e ty2 in
                        fail2 "Could not instantiate, %s to %s" uu____3020
                          uu____3021
                    | FStar_Pervasives_Native.Some (b, c) ->
                        let uu____3036 =
                          let uu____3037 = FStar_Syntax_Util.is_total_comp c in
                          Prims.op_Negation uu____3037 in
                        if uu____3036
                        then FStar_Tactics_Monad.fail "Codomain is effectful"
                        else
                          (let uu____3057 =
                             FStar_Tactics_Monad.new_uvar "apply arg" e
                               (FStar_Pervasives_Native.fst b).FStar_Syntax_Syntax.sort in
                           FStar_Tactics_Monad.bind uu____3057
                             (fun uu____3081 ->
                                match uu____3081 with
                                | (uvt, uv) ->
                                    FStar_Tactics_Monad.mlog
                                      (fun uu____3108 ->
                                         let uu____3109 =
                                           FStar_Syntax_Print.ctx_uvar_to_string
                                             uv in
                                         FStar_Util.print1
                                           "t_apply: generated uvar %s\n"
                                           uu____3109)
                                      (fun uu____3113 ->
                                         let typ =
                                           FStar_Syntax_Util.comp_result c in
                                         let typ' =
                                           FStar_Syntax_Subst.subst
                                             [FStar_Syntax_Syntax.NT
                                                ((FStar_Pervasives_Native.fst
                                                    b), uvt)] typ in
                                         __try_unify_by_application
                                           only_match
                                           ((uvt,
                                              (FStar_Pervasives_Native.snd b),
                                              uv) :: acc) e typ' ty2)))))
let (try_unify_by_application :
  Prims.bool ->
    env ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.term ->
          (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.aqual *
            FStar_Syntax_Syntax.ctx_uvar) Prims.list FStar_Tactics_Monad.tac)
  =
  fun only_match ->
    fun e ->
      fun ty1 ->
        fun ty2 -> __try_unify_by_application only_match [] e ty1 ty2
let (t_apply :
  Prims.bool ->
    Prims.bool -> FStar_Syntax_Syntax.term -> unit FStar_Tactics_Monad.tac)
  =
  fun uopt ->
    fun only_match ->
      fun tm ->
        let uu____3195 =
          FStar_Tactics_Monad.mlog
            (fun uu____3200 ->
               let uu____3201 = FStar_Syntax_Print.term_to_string tm in
               FStar_Util.print1 "t_apply: tm = %s\n" uu____3201)
            (fun uu____3203 ->
               FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
                 (fun goal ->
                    let e = FStar_Tactics_Types.goal_env goal in
                    FStar_Tactics_Monad.mlog
                      (fun uu____3212 ->
                         let uu____3213 =
                           FStar_Syntax_Print.term_to_string tm in
                         let uu____3214 =
                           FStar_Tactics_Printing.goal_to_string_verbose goal in
                         let uu____3215 =
                           FStar_TypeChecker_Env.print_gamma
                             e.FStar_TypeChecker_Env.gamma in
                         FStar_Util.print3
                           "t_apply: tm = %s\nt_apply: goal = %s\nenv.gamma=%s\n"
                           uu____3213 uu____3214 uu____3215)
                      (fun uu____3218 ->
                         let uu____3219 = __tc e tm in
                         FStar_Tactics_Monad.bind uu____3219
                           (fun uu____3240 ->
                              match uu____3240 with
                              | (tm1, typ, guard) ->
                                  let typ1 = bnorm e typ in
                                  let uu____3253 =
                                    let uu____3264 =
                                      FStar_Tactics_Types.goal_type goal in
                                    try_unify_by_application only_match e
                                      typ1 uu____3264 in
                                  FStar_Tactics_Monad.bind uu____3253
                                    (fun uvs ->
                                       FStar_Tactics_Monad.mlog
                                         (fun uu____3285 ->
                                            let uu____3286 =
                                              FStar_Common.string_of_list
                                                (fun uu____3297 ->
                                                   match uu____3297 with
                                                   | (t, uu____3305,
                                                      uu____3306) ->
                                                       FStar_Syntax_Print.term_to_string
                                                         t) uvs in
                                            FStar_Util.print1
                                              "t_apply: found args = %s\n"
                                              uu____3286)
                                         (fun uu____3313 ->
                                            let fix_qual q =
                                              match q with
                                              | FStar_Pervasives_Native.Some
                                                  (FStar_Syntax_Syntax.Meta
                                                  uu____3328) ->
                                                  FStar_Pervasives_Native.Some
                                                    (FStar_Syntax_Syntax.Implicit
                                                       false)
                                              | uu____3329 -> q in
                                            let w =
                                              FStar_List.fold_right
                                                (fun uu____3352 ->
                                                   fun w ->
                                                     match uu____3352 with
                                                     | (uvt, q, uu____3370)
                                                         ->
                                                         FStar_Syntax_Util.mk_app
                                                           w
                                                           [(uvt,
                                                              (fix_qual q))])
                                                uvs tm1 in
                                            let uvset =
                                              let uu____3402 =
                                                FStar_Syntax_Free.new_uv_set
                                                  () in
                                              FStar_List.fold_right
                                                (fun uu____3419 ->
                                                   fun s ->
                                                     match uu____3419 with
                                                     | (uu____3431,
                                                        uu____3432, uv) ->
                                                         let uu____3434 =
                                                           FStar_Syntax_Free.uvars
                                                             uv.FStar_Syntax_Syntax.ctx_uvar_typ in
                                                         FStar_Util.set_union
                                                           s uu____3434) uvs
                                                uu____3402 in
                                            let free_in_some_goal uv =
                                              FStar_Util.set_mem uv uvset in
                                            let uu____3443 = solve' goal w in
                                            FStar_Tactics_Monad.bind
                                              uu____3443
                                              (fun uu____3448 ->
                                                 let uu____3449 =
                                                   FStar_Tactics_Monad.mapM
                                                     (fun uu____3466 ->
                                                        match uu____3466 with
                                                        | (uvt, q, uv) ->
                                                            let uu____3478 =
                                                              FStar_Syntax_Unionfind.find
                                                                uv.FStar_Syntax_Syntax.ctx_uvar_head in
                                                            (match uu____3478
                                                             with
                                                             | FStar_Pervasives_Native.Some
                                                                 uu____3483
                                                                 ->
                                                                 FStar_Tactics_Monad.ret
                                                                   ()
                                                             | FStar_Pervasives_Native.None
                                                                 ->
                                                                 let uu____3484
                                                                   =
                                                                   uopt &&
                                                                    (free_in_some_goal
                                                                    uv) in
                                                                 if
                                                                   uu____3484
                                                                 then
                                                                   FStar_Tactics_Monad.ret
                                                                    ()
                                                                 else
                                                                   (let uu____3488
                                                                    =
                                                                    let uu____3491
                                                                    =
                                                                    bnorm_goal
                                                                    (let uu___614_3494
                                                                    = goal in
                                                                    {
                                                                    FStar_Tactics_Types.goal_main_env
                                                                    =
                                                                    (uu___614_3494.FStar_Tactics_Types.goal_main_env);
                                                                    FStar_Tactics_Types.goal_ctx_uvar
                                                                    = uv;
                                                                    FStar_Tactics_Types.opts
                                                                    =
                                                                    (uu___614_3494.FStar_Tactics_Types.opts);
                                                                    FStar_Tactics_Types.is_guard
                                                                    = false;
                                                                    FStar_Tactics_Types.label
                                                                    =
                                                                    (uu___614_3494.FStar_Tactics_Types.label)
                                                                    }) in
                                                                    [uu____3491] in
                                                                    FStar_Tactics_Monad.add_goals
                                                                    uu____3488)))
                                                     uvs in
                                                 FStar_Tactics_Monad.bind
                                                   uu____3449
                                                   (fun uu____3498 ->
                                                      proc_guard
                                                        "apply guard" e guard)))))))) in
        FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "apply") uu____3195
let (lemma_or_sq :
  FStar_Syntax_Syntax.comp ->
    (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.term)
      FStar_Pervasives_Native.option)
  =
  fun c ->
    let ct = FStar_Syntax_Util.comp_to_comp_typ_nouniv c in
    let uu____3523 =
      FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
        FStar_Parser_Const.effect_Lemma_lid in
    if uu____3523
    then
      let uu____3530 =
        match ct.FStar_Syntax_Syntax.effect_args with
        | pre::post::uu____3545 ->
            ((FStar_Pervasives_Native.fst pre),
              (FStar_Pervasives_Native.fst post))
        | uu____3598 -> failwith "apply_lemma: impossible: not a lemma" in
      match uu____3530 with
      | (pre, post) ->
          let post1 =
            let uu____3630 =
              let uu____3641 =
                FStar_Syntax_Syntax.as_arg FStar_Syntax_Util.exp_unit in
              [uu____3641] in
            FStar_Syntax_Util.mk_app post uu____3630 in
          FStar_Pervasives_Native.Some (pre, post1)
    else
      (let uu____3671 =
         (FStar_Syntax_Util.is_pure_effect ct.FStar_Syntax_Syntax.effect_name)
           ||
           (FStar_Syntax_Util.is_ghost_effect
              ct.FStar_Syntax_Syntax.effect_name) in
       if uu____3671
       then
         let uu____3678 =
           FStar_Syntax_Util.un_squash ct.FStar_Syntax_Syntax.result_typ in
         FStar_Util.map_opt uu____3678
           (fun post -> (FStar_Syntax_Util.t_true, post))
       else FStar_Pervasives_Native.None)
let rec fold_left :
  'a 'b .
    ('a -> 'b -> 'b FStar_Tactics_Monad.tac) ->
      'b -> 'a Prims.list -> 'b FStar_Tactics_Monad.tac
  =
  fun f ->
    fun e ->
      fun xs ->
        match xs with
        | [] -> FStar_Tactics_Monad.ret e
        | x::xs1 ->
            let uu____3755 = f x e in
            FStar_Tactics_Monad.bind uu____3755
              (fun e' -> fold_left f e' xs1)
let (apply_lemma : FStar_Syntax_Syntax.term -> unit FStar_Tactics_Monad.tac)
  =
  fun tm ->
    let uu____3769 =
      let uu____3772 =
        FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
          (fun ps ->
             FStar_Tactics_Monad.mlog
               (fun uu____3779 ->
                  let uu____3780 = FStar_Syntax_Print.term_to_string tm in
                  FStar_Util.print1 "apply_lemma: tm = %s\n" uu____3780)
               (fun uu____3783 ->
                  let is_unit_t t =
                    let uu____3790 =
                      let uu____3791 = FStar_Syntax_Subst.compress t in
                      uu____3791.FStar_Syntax_Syntax.n in
                    match uu____3790 with
                    | FStar_Syntax_Syntax.Tm_fvar fv when
                        FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.unit_lid
                        -> true
                    | uu____3795 -> false in
                  FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
                    (fun goal ->
                       let env1 = FStar_Tactics_Types.goal_env goal in
                       let uu____3801 = __tc env1 tm in
                       FStar_Tactics_Monad.bind uu____3801
                         (fun uu____3824 ->
                            match uu____3824 with
                            | (tm1, t, guard) ->
                                let uu____3836 =
                                  FStar_Syntax_Util.arrow_formals_comp t in
                                (match uu____3836 with
                                 | (bs, comp) ->
                                     let uu____3845 = lemma_or_sq comp in
                                     (match uu____3845 with
                                      | FStar_Pervasives_Native.None ->
                                          FStar_Tactics_Monad.fail
                                            "not a lemma or squashed function"
                                      | FStar_Pervasives_Native.Some
                                          (pre, post) ->
                                          let uu____3864 =
                                            fold_left
                                              (fun uu____3926 ->
                                                 fun uu____3927 ->
                                                   match (uu____3926,
                                                           uu____3927)
                                                   with
                                                   | ((b, aq),
                                                      (uvs, imps, subst)) ->
                                                       let b_t =
                                                         FStar_Syntax_Subst.subst
                                                           subst
                                                           b.FStar_Syntax_Syntax.sort in
                                                       let uu____4078 =
                                                         is_unit_t b_t in
                                                       if uu____4078
                                                       then
                                                         FStar_All.pipe_left
                                                           FStar_Tactics_Monad.ret
                                                           (((FStar_Syntax_Util.exp_unit,
                                                               aq) :: uvs),
                                                             imps,
                                                             ((FStar_Syntax_Syntax.NT
                                                                 (b,
                                                                   FStar_Syntax_Util.exp_unit))
                                                             :: subst))
                                                       else
                                                         (let uu____4198 =
                                                            FStar_Tactics_Monad.new_uvar
                                                              "apply_lemma"
                                                              env1 b_t in
                                                          FStar_Tactics_Monad.bind
                                                            uu____4198
                                                            (fun uu____4234
                                                               ->
                                                               match uu____4234
                                                               with
                                                               | (t1, u) ->
                                                                   FStar_All.pipe_left
                                                                    FStar_Tactics_Monad.ret
                                                                    (((t1,
                                                                    aq) ::
                                                                    uvs),
                                                                    ((t1, u)
                                                                    :: imps),
                                                                    ((FStar_Syntax_Syntax.NT
                                                                    (b, t1))
                                                                    ::
                                                                    subst)))))
                                              ([], [], []) bs in
                                          FStar_Tactics_Monad.bind uu____3864
                                            (fun uu____4421 ->
                                               match uu____4421 with
                                               | (uvs, implicits1, subst) ->
                                                   let implicits2 =
                                                     FStar_List.rev
                                                       implicits1 in
                                                   let uvs1 =
                                                     FStar_List.rev uvs in
                                                   let pre1 =
                                                     FStar_Syntax_Subst.subst
                                                       subst pre in
                                                   let post1 =
                                                     FStar_Syntax_Subst.subst
                                                       subst post in
                                                   let post_u =
                                                     env1.FStar_TypeChecker_Env.universe_of
                                                       env1 post1 in
                                                   let uu____4510 =
                                                     let uu____4513 =
                                                       FStar_Syntax_Util.mk_squash
                                                         post_u post1 in
                                                     let uu____4514 =
                                                       FStar_Tactics_Types.goal_type
                                                         goal in
                                                     do_unify env1 uu____4513
                                                       uu____4514 in
                                                   FStar_Tactics_Monad.bind
                                                     uu____4510
                                                     (fun b ->
                                                        if
                                                          Prims.op_Negation b
                                                        then
                                                          let uu____4523 =
                                                            let uu____4528 =
                                                              FStar_Syntax_Util.mk_squash
                                                                post_u post1 in
                                                            let uu____4529 =
                                                              FStar_Tactics_Types.goal_type
                                                                goal in
                                                            FStar_TypeChecker_Err.print_discrepancy
                                                              (tts env1)
                                                              uu____4528
                                                              uu____4529 in
                                                          match uu____4523
                                                          with
                                                          | (post2, goalt) ->
                                                              let uu____4534
                                                                =
                                                                tts env1 tm1 in
                                                              fail3
                                                                "Cannot instantiate lemma %s (with postcondition: %s) to match goal (%s)"
                                                                uu____4534
                                                                post2 goalt
                                                        else
                                                          (let uu____4536 =
                                                             solve' goal
                                                               FStar_Syntax_Util.exp_unit in
                                                           FStar_Tactics_Monad.bind
                                                             uu____4536
                                                             (fun uu____4544
                                                                ->
                                                                let is_free_uvar
                                                                  uv t1 =
                                                                  let free_uvars
                                                                    =
                                                                    let uu____4571
                                                                    =
                                                                    let uu____4574
                                                                    =
                                                                    FStar_Syntax_Free.uvars
                                                                    t1 in
                                                                    FStar_Util.set_elements
                                                                    uu____4574 in
                                                                    FStar_List.map
                                                                    (fun x ->
                                                                    x.FStar_Syntax_Syntax.ctx_uvar_head)
                                                                    uu____4571 in
                                                                  FStar_List.existsML
                                                                    (
                                                                    fun u ->
                                                                    FStar_Syntax_Unionfind.equiv
                                                                    u uv)
                                                                    free_uvars in
                                                                let appears
                                                                  uv goals =
                                                                  FStar_List.existsML
                                                                    (
                                                                    fun g' ->
                                                                    let uu____4611
                                                                    =
                                                                    FStar_Tactics_Types.goal_type
                                                                    g' in
                                                                    is_free_uvar
                                                                    uv
                                                                    uu____4611)
                                                                    goals in
                                                                let checkone
                                                                  t1 goals =
                                                                  let uu____4627
                                                                    =
                                                                    FStar_Syntax_Util.head_and_args
                                                                    t1 in
                                                                  match uu____4627
                                                                  with
                                                                  | (hd,
                                                                    uu____4645)
                                                                    ->
                                                                    (match 
                                                                    hd.FStar_Syntax_Syntax.n
                                                                    with
                                                                    | 
                                                                    FStar_Syntax_Syntax.Tm_uvar
                                                                    (uv,
                                                                    uu____4671)
                                                                    ->
                                                                    appears
                                                                    uv.FStar_Syntax_Syntax.ctx_uvar_head
                                                                    goals
                                                                    | 
                                                                    uu____4688
                                                                    -> false) in
                                                                let uu____4689
                                                                  =
                                                                  FStar_All.pipe_right
                                                                    implicits2
                                                                    (
                                                                    FStar_Tactics_Monad.mapM
                                                                    (fun imp
                                                                    ->
                                                                    let uu____4730
                                                                    = imp in
                                                                    match uu____4730
                                                                    with
                                                                    | 
                                                                    (term,
                                                                    ctx_uvar)
                                                                    ->
                                                                    let uu____4741
                                                                    =
                                                                    FStar_Syntax_Util.head_and_args
                                                                    term in
                                                                    (match uu____4741
                                                                    with
                                                                    | 
                                                                    (hd,
                                                                    uu____4763)
                                                                    ->
                                                                    let uu____4788
                                                                    =
                                                                    let uu____4789
                                                                    =
                                                                    FStar_Syntax_Subst.compress
                                                                    hd in
                                                                    uu____4789.FStar_Syntax_Syntax.n in
                                                                    (match uu____4788
                                                                    with
                                                                    | 
                                                                    FStar_Syntax_Syntax.Tm_uvar
                                                                    (ctx_uvar1,
                                                                    uu____4797)
                                                                    ->
                                                                    let goal1
                                                                    =
                                                                    bnorm_goal
                                                                    (let uu___735_4817
                                                                    = goal in
                                                                    {
                                                                    FStar_Tactics_Types.goal_main_env
                                                                    =
                                                                    (uu___735_4817.FStar_Tactics_Types.goal_main_env);
                                                                    FStar_Tactics_Types.goal_ctx_uvar
                                                                    =
                                                                    ctx_uvar1;
                                                                    FStar_Tactics_Types.opts
                                                                    =
                                                                    (uu___735_4817.FStar_Tactics_Types.opts);
                                                                    FStar_Tactics_Types.is_guard
                                                                    =
                                                                    (uu___735_4817.FStar_Tactics_Types.is_guard);
                                                                    FStar_Tactics_Types.label
                                                                    =
                                                                    (uu___735_4817.FStar_Tactics_Types.label)
                                                                    }) in
                                                                    FStar_Tactics_Monad.ret
                                                                    [goal1]
                                                                    | 
                                                                    uu____4820
                                                                    ->
                                                                    FStar_Tactics_Monad.mlog
                                                                    (fun
                                                                    uu____4826
                                                                    ->
                                                                    let uu____4827
                                                                    =
                                                                    FStar_Syntax_Print.uvar_to_string
                                                                    ctx_uvar.FStar_Syntax_Syntax.ctx_uvar_head in
                                                                    let uu____4828
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    term in
                                                                    FStar_Util.print2
                                                                    "apply_lemma: arg %s unified to (%s)\n"
                                                                    uu____4827
                                                                    uu____4828)
                                                                    (fun
                                                                    uu____4832
                                                                    ->
                                                                    let g_typ
                                                                    =
                                                                    FStar_TypeChecker_TcTerm.check_type_of_well_typed_term'
                                                                    true env1
                                                                    term
                                                                    ctx_uvar.FStar_Syntax_Syntax.ctx_uvar_typ in
                                                                    let uu____4834
                                                                    =
                                                                    let uu____4837
                                                                    =
                                                                    if
                                                                    ps.FStar_Tactics_Types.tac_verb_dbg
                                                                    then
                                                                    let uu____4838
                                                                    =
                                                                    FStar_Syntax_Print.ctx_uvar_to_string
                                                                    ctx_uvar in
                                                                    let uu____4839
                                                                    =
                                                                    FStar_Syntax_Print.term_to_string
                                                                    term in
                                                                    FStar_Util.format2
                                                                    "apply_lemma solved arg %s to %s\n"
                                                                    uu____4838
                                                                    uu____4839
                                                                    else
                                                                    "apply_lemma solved arg" in
                                                                    proc_guard
                                                                    uu____4837
                                                                    env1
                                                                    g_typ in
                                                                    FStar_Tactics_Monad.bind
                                                                    uu____4834
                                                                    (fun
                                                                    uu____4844
                                                                    ->
                                                                    FStar_Tactics_Monad.ret
                                                                    [])))))) in
                                                                FStar_Tactics_Monad.bind
                                                                  uu____4689
                                                                  (fun
                                                                    sub_goals
                                                                    ->
                                                                    let sub_goals1
                                                                    =
                                                                    FStar_List.flatten
                                                                    sub_goals in
                                                                    let rec filter'
                                                                    f xs =
                                                                    match xs
                                                                    with
                                                                    | 
                                                                    [] -> []
                                                                    | 
                                                                    x::xs1 ->
                                                                    let uu____4906
                                                                    = f x xs1 in
                                                                    if
                                                                    uu____4906
                                                                    then
                                                                    let uu____4909
                                                                    =
                                                                    filter' f
                                                                    xs1 in x
                                                                    ::
                                                                    uu____4909
                                                                    else
                                                                    filter' f
                                                                    xs1 in
                                                                    let sub_goals2
                                                                    =
                                                                    filter'
                                                                    (fun g ->
                                                                    fun goals
                                                                    ->
                                                                    let uu____4923
                                                                    =
                                                                    let uu____4924
                                                                    =
                                                                    FStar_Tactics_Types.goal_witness
                                                                    g in
                                                                    checkone
                                                                    uu____4924
                                                                    goals in
                                                                    Prims.op_Negation
                                                                    uu____4923)
                                                                    sub_goals1 in
                                                                    let uu____4925
                                                                    =
                                                                    proc_guard
                                                                    "apply_lemma guard"
                                                                    env1
                                                                    guard in
                                                                    FStar_Tactics_Monad.bind
                                                                    uu____4925
                                                                    (fun
                                                                    uu____4931
                                                                    ->
                                                                    let pre_u
                                                                    =
                                                                    env1.FStar_TypeChecker_Env.universe_of
                                                                    env1 pre1 in
                                                                    let uu____4933
                                                                    =
                                                                    let uu____4936
                                                                    =
                                                                    let uu____4937
                                                                    =
                                                                    let uu____4938
                                                                    =
                                                                    FStar_Syntax_Util.mk_squash
                                                                    pre_u
                                                                    pre1 in
                                                                    istrivial
                                                                    env1
                                                                    uu____4938 in
                                                                    Prims.op_Negation
                                                                    uu____4937 in
                                                                    if
                                                                    uu____4936
                                                                    then
                                                                    FStar_Tactics_Monad.add_irrelevant_goal
                                                                    goal
                                                                    "apply_lemma precondition"
                                                                    env1 pre1
                                                                    else
                                                                    FStar_Tactics_Monad.ret
                                                                    () in
                                                                    FStar_Tactics_Monad.bind
                                                                    uu____4933
                                                                    (fun
                                                                    uu____4943
                                                                    ->
                                                                    FStar_Tactics_Monad.add_goals
                                                                    sub_goals2))))))))))))) in
      focus uu____3772 in
    FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "apply_lemma")
      uu____3769
let (destruct_eq' :
  FStar_Reflection_Data.typ ->
    (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.term)
      FStar_Pervasives_Native.option)
  =
  fun typ ->
    let uu____4965 = FStar_Syntax_Util.destruct_typ_as_formula typ in
    match uu____4965 with
    | FStar_Pervasives_Native.Some (FStar_Syntax_Util.BaseConn
        (l,
         uu____4975::(e1, FStar_Pervasives_Native.None)::(e2,
                                                          FStar_Pervasives_Native.None)::[]))
        when
        (FStar_Ident.lid_equals l FStar_Parser_Const.eq2_lid) ||
          (FStar_Ident.lid_equals l FStar_Parser_Const.c_eq2_lid)
        -> FStar_Pervasives_Native.Some (e1, e2)
    | FStar_Pervasives_Native.Some (FStar_Syntax_Util.BaseConn
        (l, uu____5035::uu____5036::(e1, uu____5038)::(e2, uu____5040)::[]))
        when FStar_Ident.lid_equals l FStar_Parser_Const.eq3_lid ->
        FStar_Pervasives_Native.Some (e1, e2)
    | uu____5117 ->
        let uu____5120 = FStar_Syntax_Util.unb2t typ in
        (match uu____5120 with
         | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
         | FStar_Pervasives_Native.Some t ->
             let uu____5134 = FStar_Syntax_Util.head_and_args t in
             (match uu____5134 with
              | (hd, args) ->
                  let uu____5183 =
                    let uu____5198 =
                      let uu____5199 = FStar_Syntax_Subst.compress hd in
                      uu____5199.FStar_Syntax_Syntax.n in
                    (uu____5198, args) in
                  (match uu____5183 with
                   | (FStar_Syntax_Syntax.Tm_fvar fv,
                      (uu____5219, FStar_Pervasives_Native.Some
                       (FStar_Syntax_Syntax.Implicit uu____5220))::(e1,
                                                                    FStar_Pervasives_Native.None)::
                      (e2, FStar_Pervasives_Native.None)::[]) when
                       FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Parser_Const.op_Eq
                       -> FStar_Pervasives_Native.Some (e1, e2)
                   | uu____5287 -> FStar_Pervasives_Native.None)))
let (destruct_eq :
  FStar_Reflection_Data.typ ->
    (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.term)
      FStar_Pervasives_Native.option)
  =
  fun typ ->
    let uu____5323 = destruct_eq' typ in
    match uu____5323 with
    | FStar_Pervasives_Native.Some t -> FStar_Pervasives_Native.Some t
    | FStar_Pervasives_Native.None ->
        let uu____5353 = FStar_Syntax_Util.un_squash typ in
        (match uu____5353 with
         | FStar_Pervasives_Native.Some typ1 -> destruct_eq' typ1
         | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None)
let (split_env :
  FStar_Syntax_Syntax.bv ->
    env ->
      (env * FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.bv Prims.list)
        FStar_Pervasives_Native.option)
  =
  fun bvar ->
    fun e ->
      let rec aux e1 =
        let uu____5421 = FStar_TypeChecker_Env.pop_bv e1 in
        match uu____5421 with
        | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
        | FStar_Pervasives_Native.Some (bv', e') ->
            let uu____5456 = FStar_Syntax_Syntax.bv_eq bvar bv' in
            if uu____5456
            then FStar_Pervasives_Native.Some (e', bv', [])
            else
              (let uu____5478 = aux e' in
               FStar_Util.map_opt uu____5478
                 (fun uu____5509 ->
                    match uu____5509 with
                    | (e'', bv, bvs) -> (e'', bv, (bv' :: bvs)))) in
      let uu____5535 = aux e in
      FStar_Util.map_opt uu____5535
        (fun uu____5566 ->
           match uu____5566 with
           | (e', bv, bvs) -> (e', bv, (FStar_List.rev bvs)))
let (push_bvs :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list -> FStar_TypeChecker_Env.env)
  =
  fun e ->
    fun bvs ->
      FStar_List.fold_left
        (fun e1 -> fun b -> FStar_TypeChecker_Env.push_bv e1 b) e bvs
let (subst_goal :
  FStar_Syntax_Syntax.bv ->
    FStar_Syntax_Syntax.bv ->
      FStar_Tactics_Types.goal ->
        (FStar_Syntax_Syntax.bv * FStar_Tactics_Types.goal)
          FStar_Pervasives_Native.option FStar_Tactics_Monad.tac)
  =
  fun b1 ->
    fun b2 ->
      fun g ->
        let uu____5641 =
          let uu____5652 = FStar_Tactics_Types.goal_env g in
          split_env b1 uu____5652 in
        match uu____5641 with
        | FStar_Pervasives_Native.Some (e0, b11, bvs) ->
            let bs =
              FStar_List.map FStar_Syntax_Syntax.mk_binder (b11 :: bvs) in
            let t = FStar_Tactics_Types.goal_type g in
            let uu____5692 =
              let uu____5705 = FStar_Syntax_Subst.close_binders bs in
              let uu____5714 = FStar_Syntax_Subst.close bs t in
              (uu____5705, uu____5714) in
            (match uu____5692 with
             | (bs', t') ->
                 let bs'1 =
                   let uu____5758 = FStar_Syntax_Syntax.mk_binder b2 in
                   let uu____5765 = FStar_List.tail bs' in uu____5758 ::
                     uu____5765 in
                 let uu____5786 = FStar_Syntax_Subst.open_term bs'1 t' in
                 (match uu____5786 with
                  | (bs'', t'') ->
                      let b21 =
                        let uu____5802 = FStar_List.hd bs'' in
                        FStar_Pervasives_Native.fst uu____5802 in
                      let new_env =
                        let uu____5818 =
                          FStar_List.map FStar_Pervasives_Native.fst bs'' in
                        push_bvs e0 uu____5818 in
                      let uu____5829 =
                        FStar_Tactics_Monad.new_uvar "subst_goal" new_env t'' in
                      FStar_Tactics_Monad.bind uu____5829
                        (fun uu____5852 ->
                           match uu____5852 with
                           | (uvt, uv) ->
                               let goal' =
                                 FStar_Tactics_Types.mk_goal new_env uv
                                   g.FStar_Tactics_Types.opts
                                   g.FStar_Tactics_Types.is_guard
                                   g.FStar_Tactics_Types.label in
                               let sol =
                                 let uu____5871 =
                                   FStar_Syntax_Util.abs bs'' uvt
                                     FStar_Pervasives_Native.None in
                                 let uu____5874 =
                                   FStar_List.map
                                     (fun uu____5895 ->
                                        match uu____5895 with
                                        | (bv, q) ->
                                            let uu____5908 =
                                              FStar_Syntax_Syntax.bv_to_name
                                                bv in
                                            FStar_Syntax_Syntax.as_arg
                                              uu____5908) bs in
                                 FStar_Syntax_Util.mk_app uu____5871
                                   uu____5874 in
                               let uu____5909 = set_solution g sol in
                               FStar_Tactics_Monad.bind uu____5909
                                 (fun uu____5919 ->
                                    FStar_Tactics_Monad.ret
                                      (FStar_Pervasives_Native.Some
                                         (b21, goal'))))))
        | FStar_Pervasives_Native.None ->
            FStar_Tactics_Monad.ret FStar_Pervasives_Native.None
let (rewrite : FStar_Syntax_Syntax.binder -> unit FStar_Tactics_Monad.tac) =
  fun h ->
    let uu____5957 =
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
        (fun goal ->
           let uu____5965 = h in
           match uu____5965 with
           | (bv, uu____5969) ->
               FStar_Tactics_Monad.mlog
                 (fun uu____5977 ->
                    let uu____5978 = FStar_Syntax_Print.bv_to_string bv in
                    let uu____5979 =
                      FStar_Syntax_Print.term_to_string
                        bv.FStar_Syntax_Syntax.sort in
                    FStar_Util.print2 "+++Rewrite %s : %s\n" uu____5978
                      uu____5979)
                 (fun uu____5982 ->
                    let uu____5983 =
                      let uu____5994 = FStar_Tactics_Types.goal_env goal in
                      split_env bv uu____5994 in
                    match uu____5983 with
                    | FStar_Pervasives_Native.None ->
                        FStar_Tactics_Monad.fail
                          "binder not found in environment"
                    | FStar_Pervasives_Native.Some (e0, bv1, bvs) ->
                        let uu____6020 =
                          let uu____6027 =
                            whnf e0 bv1.FStar_Syntax_Syntax.sort in
                          destruct_eq uu____6027 in
                        (match uu____6020 with
                         | FStar_Pervasives_Native.Some (x, e) ->
                             let uu____6036 =
                               let uu____6037 = FStar_Syntax_Subst.compress x in
                               uu____6037.FStar_Syntax_Syntax.n in
                             (match uu____6036 with
                              | FStar_Syntax_Syntax.Tm_name x1 ->
                                  let s = [FStar_Syntax_Syntax.NT (x1, e)] in
                                  let t = FStar_Tactics_Types.goal_type goal in
                                  let bs =
                                    FStar_List.map
                                      FStar_Syntax_Syntax.mk_binder bvs in
                                  let uu____6064 =
                                    let uu____6069 =
                                      FStar_Syntax_Subst.close_binders bs in
                                    let uu____6070 =
                                      FStar_Syntax_Subst.close bs t in
                                    (uu____6069, uu____6070) in
                                  (match uu____6064 with
                                   | (bs', t') ->
                                       let uu____6075 =
                                         let uu____6080 =
                                           FStar_Syntax_Subst.subst_binders s
                                             bs' in
                                         let uu____6081 =
                                           FStar_Syntax_Subst.subst s t in
                                         (uu____6080, uu____6081) in
                                       (match uu____6075 with
                                        | (bs'1, t'1) ->
                                            let uu____6086 =
                                              FStar_Syntax_Subst.open_term
                                                bs'1 t'1 in
                                            (match uu____6086 with
                                             | (bs'', t'') ->
                                                 let new_env =
                                                   let uu____6096 =
                                                     let uu____6099 =
                                                       FStar_List.map
                                                         FStar_Pervasives_Native.fst
                                                         bs'' in
                                                     bv1 :: uu____6099 in
                                                   push_bvs e0 uu____6096 in
                                                 let uu____6110 =
                                                   FStar_Tactics_Monad.new_uvar
                                                     "rewrite" new_env t'' in
                                                 FStar_Tactics_Monad.bind
                                                   uu____6110
                                                   (fun uu____6127 ->
                                                      match uu____6127 with
                                                      | (uvt, uv) ->
                                                          let goal' =
                                                            FStar_Tactics_Types.mk_goal
                                                              new_env uv
                                                              goal.FStar_Tactics_Types.opts
                                                              goal.FStar_Tactics_Types.is_guard
                                                              goal.FStar_Tactics_Types.label in
                                                          let sol =
                                                            let uu____6140 =
                                                              FStar_Syntax_Util.abs
                                                                bs'' uvt
                                                                FStar_Pervasives_Native.None in
                                                            let uu____6143 =
                                                              FStar_List.map
                                                                (fun
                                                                   uu____6164
                                                                   ->
                                                                   match uu____6164
                                                                   with
                                                                   | 
                                                                   (bv2,
                                                                    uu____6172)
                                                                    ->
                                                                    let uu____6177
                                                                    =
                                                                    FStar_Syntax_Syntax.bv_to_name
                                                                    bv2 in
                                                                    FStar_Syntax_Syntax.as_arg
                                                                    uu____6177)
                                                                bs in
                                                            FStar_Syntax_Util.mk_app
                                                              uu____6140
                                                              uu____6143 in
                                                          let uu____6178 =
                                                            set_solution goal
                                                              sol in
                                                          FStar_Tactics_Monad.bind
                                                            uu____6178
                                                            (fun uu____6182
                                                               ->
                                                               FStar_Tactics_Monad.replace_cur
                                                                 goal')))))
                              | uu____6183 ->
                                  FStar_Tactics_Monad.fail
                                    "Not an equality hypothesis with a variable on the LHS")
                         | uu____6184 ->
                             FStar_Tactics_Monad.fail
                               "Not an equality hypothesis"))) in
    FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "rewrite") uu____5957
let (rename_to :
  FStar_Syntax_Syntax.binder ->
    Prims.string -> FStar_Syntax_Syntax.binder FStar_Tactics_Monad.tac)
  =
  fun b ->
    fun s ->
      let uu____6209 =
        FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
          (fun goal ->
             let uu____6231 = b in
             match uu____6231 with
             | (bv, q) ->
                 let bv' =
                   let uu____6247 =
                     let uu___913_6248 = bv in
                     let uu____6249 =
                       let uu____6250 =
                         let uu____6255 =
                           FStar_Ident.range_of_id
                             bv.FStar_Syntax_Syntax.ppname in
                         (s, uu____6255) in
                       FStar_Ident.mk_ident uu____6250 in
                     {
                       FStar_Syntax_Syntax.ppname = uu____6249;
                       FStar_Syntax_Syntax.index =
                         (uu___913_6248.FStar_Syntax_Syntax.index);
                       FStar_Syntax_Syntax.sort =
                         (uu___913_6248.FStar_Syntax_Syntax.sort)
                     } in
                   FStar_Syntax_Syntax.freshen_bv uu____6247 in
                 let uu____6256 = subst_goal bv bv' goal in
                 FStar_Tactics_Monad.bind uu____6256
                   (fun uu___4_6278 ->
                      match uu___4_6278 with
                      | FStar_Pervasives_Native.None ->
                          FStar_Tactics_Monad.fail
                            "binder not found in environment"
                      | FStar_Pervasives_Native.Some (bv'1, goal1) ->
                          let uu____6309 =
                            FStar_Tactics_Monad.replace_cur goal1 in
                          FStar_Tactics_Monad.bind uu____6309
                            (fun uu____6319 ->
                               FStar_Tactics_Monad.ret (bv'1, q)))) in
      FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "rename_to")
        uu____6209
let (binder_retype :
  FStar_Syntax_Syntax.binder -> unit FStar_Tactics_Monad.tac) =
  fun b ->
    let uu____6353 =
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
        (fun goal ->
           let uu____6362 = b in
           match uu____6362 with
           | (bv, uu____6366) ->
               let uu____6371 =
                 let uu____6382 = FStar_Tactics_Types.goal_env goal in
                 split_env bv uu____6382 in
               (match uu____6371 with
                | FStar_Pervasives_Native.None ->
                    FStar_Tactics_Monad.fail
                      "binder is not present in environment"
                | FStar_Pervasives_Native.Some (e0, bv1, bvs) ->
                    let uu____6408 = FStar_Syntax_Util.type_u () in
                    (match uu____6408 with
                     | (ty, u) ->
                         let uu____6417 =
                           FStar_Tactics_Monad.new_uvar "binder_retype" e0 ty in
                         FStar_Tactics_Monad.bind uu____6417
                           (fun uu____6435 ->
                              match uu____6435 with
                              | (t', u_t') ->
                                  let bv'' =
                                    let uu___940_6445 = bv1 in
                                    {
                                      FStar_Syntax_Syntax.ppname =
                                        (uu___940_6445.FStar_Syntax_Syntax.ppname);
                                      FStar_Syntax_Syntax.index =
                                        (uu___940_6445.FStar_Syntax_Syntax.index);
                                      FStar_Syntax_Syntax.sort = t'
                                    } in
                                  let s =
                                    let uu____6449 =
                                      let uu____6450 =
                                        let uu____6457 =
                                          FStar_Syntax_Syntax.bv_to_name bv'' in
                                        (bv1, uu____6457) in
                                      FStar_Syntax_Syntax.NT uu____6450 in
                                    [uu____6449] in
                                  let bvs1 =
                                    FStar_List.map
                                      (fun b1 ->
                                         let uu___945_6469 = b1 in
                                         let uu____6470 =
                                           FStar_Syntax_Subst.subst s
                                             b1.FStar_Syntax_Syntax.sort in
                                         {
                                           FStar_Syntax_Syntax.ppname =
                                             (uu___945_6469.FStar_Syntax_Syntax.ppname);
                                           FStar_Syntax_Syntax.index =
                                             (uu___945_6469.FStar_Syntax_Syntax.index);
                                           FStar_Syntax_Syntax.sort =
                                             uu____6470
                                         }) bvs in
                                  let env' = push_bvs e0 (bv'' :: bvs1) in
                                  FStar_Tactics_Monad.bind
                                    FStar_Tactics_Monad.dismiss
                                    (fun uu____6477 ->
                                       let new_goal =
                                         let uu____6479 =
                                           FStar_Tactics_Types.goal_with_env
                                             goal env' in
                                         let uu____6480 =
                                           let uu____6481 =
                                             FStar_Tactics_Types.goal_type
                                               goal in
                                           FStar_Syntax_Subst.subst s
                                             uu____6481 in
                                         FStar_Tactics_Types.goal_with_type
                                           uu____6479 uu____6480 in
                                       let uu____6482 =
                                         FStar_Tactics_Monad.add_goals
                                           [new_goal] in
                                       FStar_Tactics_Monad.bind uu____6482
                                         (fun uu____6487 ->
                                            let uu____6488 =
                                              FStar_Syntax_Util.mk_eq2
                                                (FStar_Syntax_Syntax.U_succ u)
                                                ty
                                                bv1.FStar_Syntax_Syntax.sort
                                                t' in
                                            FStar_Tactics_Monad.add_irrelevant_goal
                                              goal "binder_retype equation"
                                              e0 uu____6488)))))) in
    FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "binder_retype")
      uu____6353
let (norm_binder_type :
  FStar_Syntax_Embeddings.norm_step Prims.list ->
    FStar_Syntax_Syntax.binder -> unit FStar_Tactics_Monad.tac)
  =
  fun s ->
    fun b ->
      let uu____6511 =
        FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
          (fun goal ->
             let uu____6520 = b in
             match uu____6520 with
             | (bv, uu____6524) ->
                 let uu____6529 =
                   let uu____6540 = FStar_Tactics_Types.goal_env goal in
                   split_env bv uu____6540 in
                 (match uu____6529 with
                  | FStar_Pervasives_Native.None ->
                      FStar_Tactics_Monad.fail
                        "binder is not present in environment"
                  | FStar_Pervasives_Native.Some (e0, bv1, bvs) ->
                      let steps =
                        let uu____6569 =
                          FStar_TypeChecker_Normalize.tr_norm_steps s in
                        FStar_List.append
                          [FStar_TypeChecker_Env.Reify;
                          FStar_TypeChecker_Env.UnfoldTac] uu____6569 in
                      let sort' =
                        normalize steps e0 bv1.FStar_Syntax_Syntax.sort in
                      let bv' =
                        let uu___966_6574 = bv1 in
                        {
                          FStar_Syntax_Syntax.ppname =
                            (uu___966_6574.FStar_Syntax_Syntax.ppname);
                          FStar_Syntax_Syntax.index =
                            (uu___966_6574.FStar_Syntax_Syntax.index);
                          FStar_Syntax_Syntax.sort = sort'
                        } in
                      let env' = push_bvs e0 (bv' :: bvs) in
                      let uu____6576 =
                        FStar_Tactics_Types.goal_with_env goal env' in
                      FStar_Tactics_Monad.replace_cur uu____6576)) in
      FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "norm_binder_type")
        uu____6511
let (revert : unit -> unit FStar_Tactics_Monad.tac) =
  fun uu____6587 ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
      (fun goal ->
         let uu____6593 =
           let uu____6600 = FStar_Tactics_Types.goal_env goal in
           FStar_TypeChecker_Env.pop_bv uu____6600 in
         match uu____6593 with
         | FStar_Pervasives_Native.None ->
             FStar_Tactics_Monad.fail "Cannot revert; empty context"
         | FStar_Pervasives_Native.Some (x, env') ->
             let typ' =
               let uu____6616 =
                 let uu____6619 = FStar_Tactics_Types.goal_type goal in
                 FStar_Syntax_Syntax.mk_Total uu____6619 in
               FStar_Syntax_Util.arrow [(x, FStar_Pervasives_Native.None)]
                 uu____6616 in
             let uu____6634 = FStar_Tactics_Monad.new_uvar "revert" env' typ' in
             FStar_Tactics_Monad.bind uu____6634
               (fun uu____6649 ->
                  match uu____6649 with
                  | (r, u_r) ->
                      let uu____6658 =
                        let uu____6661 =
                          let uu____6662 =
                            let uu____6663 =
                              let uu____6672 =
                                FStar_Syntax_Syntax.bv_to_name x in
                              FStar_Syntax_Syntax.as_arg uu____6672 in
                            [uu____6663] in
                          let uu____6689 =
                            let uu____6690 =
                              FStar_Tactics_Types.goal_type goal in
                            uu____6690.FStar_Syntax_Syntax.pos in
                          FStar_Syntax_Syntax.mk_Tm_app r uu____6662
                            uu____6689 in
                        set_solution goal uu____6661 in
                      FStar_Tactics_Monad.bind uu____6658
                        (fun uu____6695 ->
                           let g =
                             FStar_Tactics_Types.mk_goal env' u_r
                               goal.FStar_Tactics_Types.opts
                               goal.FStar_Tactics_Types.is_guard
                               goal.FStar_Tactics_Types.label in
                           FStar_Tactics_Monad.replace_cur g)))
let (free_in :
  FStar_Syntax_Syntax.bv -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun bv ->
    fun t ->
      let uu____6707 = FStar_Syntax_Free.names t in
      FStar_Util.set_mem bv uu____6707
let (clear : FStar_Syntax_Syntax.binder -> unit FStar_Tactics_Monad.tac) =
  fun b ->
    let bv = FStar_Pervasives_Native.fst b in
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
      (fun goal ->
         FStar_Tactics_Monad.mlog
           (fun uu____6727 ->
              let uu____6728 = FStar_Syntax_Print.binder_to_string b in
              let uu____6729 =
                let uu____6730 =
                  let uu____6731 =
                    let uu____6740 = FStar_Tactics_Types.goal_env goal in
                    FStar_TypeChecker_Env.all_binders uu____6740 in
                  FStar_All.pipe_right uu____6731 FStar_List.length in
                FStar_All.pipe_right uu____6730 FStar_Util.string_of_int in
              FStar_Util.print2 "Clear of (%s), env has %s binders\n"
                uu____6728 uu____6729)
           (fun uu____6757 ->
              let uu____6758 =
                let uu____6769 = FStar_Tactics_Types.goal_env goal in
                split_env bv uu____6769 in
              match uu____6758 with
              | FStar_Pervasives_Native.None ->
                  FStar_Tactics_Monad.fail
                    "Cannot clear; binder not in environment"
              | FStar_Pervasives_Native.Some (e', bv1, bvs) ->
                  let rec check bvs1 =
                    match bvs1 with
                    | [] -> FStar_Tactics_Monad.ret ()
                    | bv'::bvs2 ->
                        let uu____6813 =
                          free_in bv1 bv'.FStar_Syntax_Syntax.sort in
                        if uu____6813
                        then
                          let uu____6816 =
                            let uu____6817 =
                              FStar_Syntax_Print.bv_to_string bv' in
                            FStar_Util.format1
                              "Cannot clear; binder present in the type of %s"
                              uu____6817 in
                          FStar_Tactics_Monad.fail uu____6816
                        else check bvs2 in
                  let uu____6819 =
                    let uu____6820 = FStar_Tactics_Types.goal_type goal in
                    free_in bv1 uu____6820 in
                  if uu____6819
                  then
                    FStar_Tactics_Monad.fail
                      "Cannot clear; binder present in goal"
                  else
                    (let uu____6824 = check bvs in
                     FStar_Tactics_Monad.bind uu____6824
                       (fun uu____6830 ->
                          let env' = push_bvs e' bvs in
                          let uu____6832 =
                            let uu____6839 =
                              FStar_Tactics_Types.goal_type goal in
                            FStar_Tactics_Monad.new_uvar "clear.witness" env'
                              uu____6839 in
                          FStar_Tactics_Monad.bind uu____6832
                            (fun uu____6848 ->
                               match uu____6848 with
                               | (ut, uvar_ut) ->
                                   let uu____6857 = set_solution goal ut in
                                   FStar_Tactics_Monad.bind uu____6857
                                     (fun uu____6862 ->
                                        let uu____6863 =
                                          FStar_Tactics_Types.mk_goal env'
                                            uvar_ut
                                            goal.FStar_Tactics_Types.opts
                                            goal.FStar_Tactics_Types.is_guard
                                            goal.FStar_Tactics_Types.label in
                                        FStar_Tactics_Monad.replace_cur
                                          uu____6863))))))
let (clear_top : unit -> unit FStar_Tactics_Monad.tac) =
  fun uu____6870 ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
      (fun goal ->
         let uu____6876 =
           let uu____6883 = FStar_Tactics_Types.goal_env goal in
           FStar_TypeChecker_Env.pop_bv uu____6883 in
         match uu____6876 with
         | FStar_Pervasives_Native.None ->
             FStar_Tactics_Monad.fail "Cannot clear; empty context"
         | FStar_Pervasives_Native.Some (x, uu____6891) ->
             let uu____6896 = FStar_Syntax_Syntax.mk_binder x in
             clear uu____6896)
let (prune : Prims.string -> unit FStar_Tactics_Monad.tac) =
  fun s ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
      (fun g ->
         let ctx = FStar_Tactics_Types.goal_env g in
         let ctx' =
           let uu____6913 = FStar_Ident.path_of_text s in
           FStar_TypeChecker_Env.rem_proof_ns ctx uu____6913 in
         let g' = FStar_Tactics_Types.goal_with_env g ctx' in
         FStar_Tactics_Monad.replace_cur g')
let (addns : Prims.string -> unit FStar_Tactics_Monad.tac) =
  fun s ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
      (fun g ->
         let ctx = FStar_Tactics_Types.goal_env g in
         let ctx' =
           let uu____6931 = FStar_Ident.path_of_text s in
           FStar_TypeChecker_Env.add_proof_ns ctx uu____6931 in
         let g' = FStar_Tactics_Types.goal_with_env g ctx' in
         FStar_Tactics_Monad.replace_cur g')
let (_trefl :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.term -> unit FStar_Tactics_Monad.tac)
  =
  fun l ->
    fun r ->
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
        (fun g ->
           let uu____6950 =
             let uu____6953 = FStar_Tactics_Types.goal_env g in
             do_unify uu____6953 l r in
           FStar_Tactics_Monad.bind uu____6950
             (fun b ->
                if b
                then solve' g FStar_Syntax_Util.exp_unit
                else
                  (let l1 =
                     let uu____6960 = FStar_Tactics_Types.goal_env g in
                     FStar_TypeChecker_Normalize.normalize
                       [FStar_TypeChecker_Env.UnfoldUntil
                          FStar_Syntax_Syntax.delta_constant;
                       FStar_TypeChecker_Env.Primops;
                       FStar_TypeChecker_Env.UnfoldTac] uu____6960 l in
                   let r1 =
                     let uu____6962 = FStar_Tactics_Types.goal_env g in
                     FStar_TypeChecker_Normalize.normalize
                       [FStar_TypeChecker_Env.UnfoldUntil
                          FStar_Syntax_Syntax.delta_constant;
                       FStar_TypeChecker_Env.Primops;
                       FStar_TypeChecker_Env.UnfoldTac] uu____6962 r in
                   let uu____6963 =
                     let uu____6966 = FStar_Tactics_Types.goal_env g in
                     do_unify uu____6966 l1 r1 in
                   FStar_Tactics_Monad.bind uu____6963
                     (fun b1 ->
                        if b1
                        then solve' g FStar_Syntax_Util.exp_unit
                        else
                          (let uu____6972 =
                             let uu____6977 =
                               let uu____6982 =
                                 FStar_Tactics_Types.goal_env g in
                               tts uu____6982 in
                             FStar_TypeChecker_Err.print_discrepancy
                               uu____6977 l1 r1 in
                           match uu____6972 with
                           | (ls, rs) ->
                               fail2 "not a trivial equality ((%s) vs (%s))"
                                 ls rs)))))
let (trefl : unit -> unit FStar_Tactics_Monad.tac) =
  fun uu____6993 ->
    let uu____6996 =
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
        (fun g ->
           let uu____7004 =
             let uu____7011 =
               let uu____7012 = FStar_Tactics_Types.goal_env g in
               let uu____7013 = FStar_Tactics_Types.goal_type g in
               whnf uu____7012 uu____7013 in
             destruct_eq uu____7011 in
           match uu____7004 with
           | FStar_Pervasives_Native.Some (l, r) -> _trefl l r
           | FStar_Pervasives_Native.None ->
               let uu____7026 =
                 let uu____7027 = FStar_Tactics_Types.goal_env g in
                 let uu____7028 = FStar_Tactics_Types.goal_type g in
                 tts uu____7027 uu____7028 in
               fail1 "not an equality (%s)" uu____7026) in
    FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "trefl") uu____6996
let (dup : unit -> unit FStar_Tactics_Monad.tac) =
  fun uu____7039 ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
      (fun g ->
         let env1 = FStar_Tactics_Types.goal_env g in
         let uu____7047 =
           let uu____7054 = FStar_Tactics_Types.goal_type g in
           FStar_Tactics_Monad.new_uvar "dup" env1 uu____7054 in
         FStar_Tactics_Monad.bind uu____7047
           (fun uu____7063 ->
              match uu____7063 with
              | (u, u_uvar) ->
                  let g' =
                    let uu___1052_7073 = g in
                    {
                      FStar_Tactics_Types.goal_main_env =
                        (uu___1052_7073.FStar_Tactics_Types.goal_main_env);
                      FStar_Tactics_Types.goal_ctx_uvar = u_uvar;
                      FStar_Tactics_Types.opts =
                        (uu___1052_7073.FStar_Tactics_Types.opts);
                      FStar_Tactics_Types.is_guard =
                        (uu___1052_7073.FStar_Tactics_Types.is_guard);
                      FStar_Tactics_Types.label =
                        (uu___1052_7073.FStar_Tactics_Types.label)
                    } in
                  FStar_Tactics_Monad.bind FStar_Tactics_Monad.dismiss
                    (fun uu____7077 ->
                       let t_eq =
                         let uu____7079 =
                           let uu____7080 = FStar_Tactics_Types.goal_type g in
                           env1.FStar_TypeChecker_Env.universe_of env1
                             uu____7080 in
                         let uu____7081 = FStar_Tactics_Types.goal_type g in
                         let uu____7082 = FStar_Tactics_Types.goal_witness g in
                         FStar_Syntax_Util.mk_eq2 uu____7079 uu____7081 u
                           uu____7082 in
                       let uu____7083 =
                         FStar_Tactics_Monad.add_irrelevant_goal g
                           "dup equation" env1 t_eq in
                       FStar_Tactics_Monad.bind uu____7083
                         (fun uu____7088 ->
                            let uu____7089 =
                              FStar_Tactics_Monad.add_goals [g'] in
                            FStar_Tactics_Monad.bind uu____7089
                              (fun uu____7093 -> FStar_Tactics_Monad.ret ())))))
let longest_prefix :
  'a .
    ('a -> 'a -> Prims.bool) ->
      'a Prims.list ->
        'a Prims.list -> ('a Prims.list * 'a Prims.list * 'a Prims.list)
  =
  fun f ->
    fun l1 ->
      fun l2 ->
        let rec aux acc l11 l21 =
          match (l11, l21) with
          | (x::xs, y::ys) ->
              let uu____7216 = f x y in
              if uu____7216 then aux (x :: acc) xs ys else (acc, xs, ys)
          | uu____7236 -> (acc, l11, l21) in
        let uu____7251 = aux [] l1 l2 in
        match uu____7251 with | (pr, t1, t2) -> ((FStar_List.rev pr), t1, t2)
let (join_goals :
  FStar_Tactics_Types.goal ->
    FStar_Tactics_Types.goal ->
      FStar_Tactics_Types.goal FStar_Tactics_Monad.tac)
  =
  fun g1 ->
    fun g2 ->
      let close_forall_no_univs bs f =
        FStar_List.fold_right
          (fun b ->
             fun f1 ->
               FStar_Syntax_Util.mk_forall_no_univ
                 (FStar_Pervasives_Native.fst b) f1) bs f in
      let uu____7356 = FStar_Tactics_Types.get_phi g1 in
      match uu____7356 with
      | FStar_Pervasives_Native.None ->
          FStar_Tactics_Monad.fail "goal 1 is not irrelevant"
      | FStar_Pervasives_Native.Some phi1 ->
          let uu____7362 = FStar_Tactics_Types.get_phi g2 in
          (match uu____7362 with
           | FStar_Pervasives_Native.None ->
               FStar_Tactics_Monad.fail "goal 2 is not irrelevant"
           | FStar_Pervasives_Native.Some phi2 ->
               let gamma1 =
                 (g1.FStar_Tactics_Types.goal_ctx_uvar).FStar_Syntax_Syntax.ctx_uvar_gamma in
               let gamma2 =
                 (g2.FStar_Tactics_Types.goal_ctx_uvar).FStar_Syntax_Syntax.ctx_uvar_gamma in
               let uu____7374 =
                 longest_prefix FStar_Syntax_Syntax.eq_binding
                   (FStar_List.rev gamma1) (FStar_List.rev gamma2) in
               (match uu____7374 with
                | (gamma, r1, r2) ->
                    let t1 =
                      let uu____7405 =
                        FStar_TypeChecker_Env.binders_of_bindings
                          (FStar_List.rev r1) in
                      close_forall_no_univs uu____7405 phi1 in
                    let t2 =
                      let uu____7415 =
                        FStar_TypeChecker_Env.binders_of_bindings
                          (FStar_List.rev r2) in
                      close_forall_no_univs uu____7415 phi2 in
                    let uu____7424 =
                      set_solution g1 FStar_Syntax_Util.exp_unit in
                    FStar_Tactics_Monad.bind uu____7424
                      (fun uu____7429 ->
                         let uu____7430 =
                           set_solution g2 FStar_Syntax_Util.exp_unit in
                         FStar_Tactics_Monad.bind uu____7430
                           (fun uu____7437 ->
                              let ng = FStar_Syntax_Util.mk_conj t1 t2 in
                              let nenv =
                                let uu___1104_7442 =
                                  FStar_Tactics_Types.goal_env g1 in
                                let uu____7443 =
                                  FStar_Util.smap_create (Prims.of_int (100)) in
                                {
                                  FStar_TypeChecker_Env.solver =
                                    (uu___1104_7442.FStar_TypeChecker_Env.solver);
                                  FStar_TypeChecker_Env.range =
                                    (uu___1104_7442.FStar_TypeChecker_Env.range);
                                  FStar_TypeChecker_Env.curmodule =
                                    (uu___1104_7442.FStar_TypeChecker_Env.curmodule);
                                  FStar_TypeChecker_Env.gamma =
                                    (FStar_List.rev gamma);
                                  FStar_TypeChecker_Env.gamma_sig =
                                    (uu___1104_7442.FStar_TypeChecker_Env.gamma_sig);
                                  FStar_TypeChecker_Env.gamma_cache =
                                    uu____7443;
                                  FStar_TypeChecker_Env.modules =
                                    (uu___1104_7442.FStar_TypeChecker_Env.modules);
                                  FStar_TypeChecker_Env.expected_typ =
                                    (uu___1104_7442.FStar_TypeChecker_Env.expected_typ);
                                  FStar_TypeChecker_Env.sigtab =
                                    (uu___1104_7442.FStar_TypeChecker_Env.sigtab);
                                  FStar_TypeChecker_Env.attrtab =
                                    (uu___1104_7442.FStar_TypeChecker_Env.attrtab);
                                  FStar_TypeChecker_Env.instantiate_imp =
                                    (uu___1104_7442.FStar_TypeChecker_Env.instantiate_imp);
                                  FStar_TypeChecker_Env.effects =
                                    (uu___1104_7442.FStar_TypeChecker_Env.effects);
                                  FStar_TypeChecker_Env.generalize =
                                    (uu___1104_7442.FStar_TypeChecker_Env.generalize);
                                  FStar_TypeChecker_Env.letrecs =
                                    (uu___1104_7442.FStar_TypeChecker_Env.letrecs);
                                  FStar_TypeChecker_Env.top_level =
                                    (uu___1104_7442.FStar_TypeChecker_Env.top_level);
                                  FStar_TypeChecker_Env.check_uvars =
                                    (uu___1104_7442.FStar_TypeChecker_Env.check_uvars);
                                  FStar_TypeChecker_Env.use_eq =
                                    (uu___1104_7442.FStar_TypeChecker_Env.use_eq);
                                  FStar_TypeChecker_Env.use_eq_strict =
                                    (uu___1104_7442.FStar_TypeChecker_Env.use_eq_strict);
                                  FStar_TypeChecker_Env.is_iface =
                                    (uu___1104_7442.FStar_TypeChecker_Env.is_iface);
                                  FStar_TypeChecker_Env.admit =
                                    (uu___1104_7442.FStar_TypeChecker_Env.admit);
                                  FStar_TypeChecker_Env.lax =
                                    (uu___1104_7442.FStar_TypeChecker_Env.lax);
                                  FStar_TypeChecker_Env.lax_universes =
                                    (uu___1104_7442.FStar_TypeChecker_Env.lax_universes);
                                  FStar_TypeChecker_Env.phase1 =
                                    (uu___1104_7442.FStar_TypeChecker_Env.phase1);
                                  FStar_TypeChecker_Env.failhard =
                                    (uu___1104_7442.FStar_TypeChecker_Env.failhard);
                                  FStar_TypeChecker_Env.nosynth =
                                    (uu___1104_7442.FStar_TypeChecker_Env.nosynth);
                                  FStar_TypeChecker_Env.uvar_subtyping =
                                    (uu___1104_7442.FStar_TypeChecker_Env.uvar_subtyping);
                                  FStar_TypeChecker_Env.tc_term =
                                    (uu___1104_7442.FStar_TypeChecker_Env.tc_term);
                                  FStar_TypeChecker_Env.type_of =
                                    (uu___1104_7442.FStar_TypeChecker_Env.type_of);
                                  FStar_TypeChecker_Env.universe_of =
                                    (uu___1104_7442.FStar_TypeChecker_Env.universe_of);
                                  FStar_TypeChecker_Env.check_type_of =
                                    (uu___1104_7442.FStar_TypeChecker_Env.check_type_of);
                                  FStar_TypeChecker_Env.use_bv_sorts =
                                    (uu___1104_7442.FStar_TypeChecker_Env.use_bv_sorts);
                                  FStar_TypeChecker_Env.qtbl_name_and_index =
                                    (uu___1104_7442.FStar_TypeChecker_Env.qtbl_name_and_index);
                                  FStar_TypeChecker_Env.normalized_eff_names
                                    =
                                    (uu___1104_7442.FStar_TypeChecker_Env.normalized_eff_names);
                                  FStar_TypeChecker_Env.fv_delta_depths =
                                    (uu___1104_7442.FStar_TypeChecker_Env.fv_delta_depths);
                                  FStar_TypeChecker_Env.proof_ns =
                                    (uu___1104_7442.FStar_TypeChecker_Env.proof_ns);
                                  FStar_TypeChecker_Env.synth_hook =
                                    (uu___1104_7442.FStar_TypeChecker_Env.synth_hook);
                                  FStar_TypeChecker_Env.try_solve_implicits_hook
                                    =
                                    (uu___1104_7442.FStar_TypeChecker_Env.try_solve_implicits_hook);
                                  FStar_TypeChecker_Env.splice =
                                    (uu___1104_7442.FStar_TypeChecker_Env.splice);
                                  FStar_TypeChecker_Env.mpreprocess =
                                    (uu___1104_7442.FStar_TypeChecker_Env.mpreprocess);
                                  FStar_TypeChecker_Env.postprocess =
                                    (uu___1104_7442.FStar_TypeChecker_Env.postprocess);
                                  FStar_TypeChecker_Env.identifier_info =
                                    (uu___1104_7442.FStar_TypeChecker_Env.identifier_info);
                                  FStar_TypeChecker_Env.tc_hooks =
                                    (uu___1104_7442.FStar_TypeChecker_Env.tc_hooks);
                                  FStar_TypeChecker_Env.dsenv =
                                    (uu___1104_7442.FStar_TypeChecker_Env.dsenv);
                                  FStar_TypeChecker_Env.nbe =
                                    (uu___1104_7442.FStar_TypeChecker_Env.nbe);
                                  FStar_TypeChecker_Env.strict_args_tab =
                                    (uu___1104_7442.FStar_TypeChecker_Env.strict_args_tab);
                                  FStar_TypeChecker_Env.erasable_types_tab =
                                    (uu___1104_7442.FStar_TypeChecker_Env.erasable_types_tab);
                                  FStar_TypeChecker_Env.enable_defer_to_tac =
                                    (uu___1104_7442.FStar_TypeChecker_Env.enable_defer_to_tac)
                                } in
                              let uu____7446 =
                                FStar_Tactics_Monad.mk_irrelevant_goal
                                  "joined" nenv ng
                                  g1.FStar_Tactics_Types.opts
                                  g1.FStar_Tactics_Types.label in
                              FStar_Tactics_Monad.bind uu____7446
                                (fun goal ->
                                   FStar_Tactics_Monad.mlog
                                     (fun uu____7455 ->
                                        let uu____7456 =
                                          FStar_Tactics_Printing.goal_to_string_verbose
                                            g1 in
                                        let uu____7457 =
                                          FStar_Tactics_Printing.goal_to_string_verbose
                                            g2 in
                                        let uu____7458 =
                                          FStar_Tactics_Printing.goal_to_string_verbose
                                            goal in
                                        FStar_Util.print3
                                          "join_goals of\n(%s)\nand\n(%s)\n= (%s)\n"
                                          uu____7456 uu____7457 uu____7458)
                                     (fun uu____7460 ->
                                        FStar_Tactics_Monad.ret goal))))))
let (join : unit -> unit FStar_Tactics_Monad.tac) =
  fun uu____7467 ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
      (fun ps ->
         match ps.FStar_Tactics_Types.goals with
         | g1::g2::gs ->
             let uu____7483 =
               FStar_Tactics_Monad.set
                 (let uu___1119_7488 = ps in
                  {
                    FStar_Tactics_Types.main_context =
                      (uu___1119_7488.FStar_Tactics_Types.main_context);
                    FStar_Tactics_Types.all_implicits =
                      (uu___1119_7488.FStar_Tactics_Types.all_implicits);
                    FStar_Tactics_Types.goals = gs;
                    FStar_Tactics_Types.smt_goals =
                      (uu___1119_7488.FStar_Tactics_Types.smt_goals);
                    FStar_Tactics_Types.depth =
                      (uu___1119_7488.FStar_Tactics_Types.depth);
                    FStar_Tactics_Types.__dump =
                      (uu___1119_7488.FStar_Tactics_Types.__dump);
                    FStar_Tactics_Types.psc =
                      (uu___1119_7488.FStar_Tactics_Types.psc);
                    FStar_Tactics_Types.entry_range =
                      (uu___1119_7488.FStar_Tactics_Types.entry_range);
                    FStar_Tactics_Types.guard_policy =
                      (uu___1119_7488.FStar_Tactics_Types.guard_policy);
                    FStar_Tactics_Types.freshness =
                      (uu___1119_7488.FStar_Tactics_Types.freshness);
                    FStar_Tactics_Types.tac_verb_dbg =
                      (uu___1119_7488.FStar_Tactics_Types.tac_verb_dbg);
                    FStar_Tactics_Types.local_state =
                      (uu___1119_7488.FStar_Tactics_Types.local_state)
                  }) in
             FStar_Tactics_Monad.bind uu____7483
               (fun uu____7491 ->
                  let uu____7492 = join_goals g1 g2 in
                  FStar_Tactics_Monad.bind uu____7492
                    (fun g12 -> FStar_Tactics_Monad.add_goals [g12]))
         | uu____7497 -> FStar_Tactics_Monad.fail "join: less than 2 goals")
let (set_options : Prims.string -> unit FStar_Tactics_Monad.tac) =
  fun s ->
    let uu____7509 =
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
        (fun g ->
           FStar_Options.push ();
           (let uu____7522 = FStar_Util.smap_copy g.FStar_Tactics_Types.opts in
            FStar_Options.set uu____7522);
           (let res = FStar_Options.set_options s in
            let opts' = FStar_Options.peek () in
            FStar_Options.pop ();
            (match res with
             | FStar_Getopt.Success ->
                 let g' =
                   let uu___1130_7529 = g in
                   {
                     FStar_Tactics_Types.goal_main_env =
                       (uu___1130_7529.FStar_Tactics_Types.goal_main_env);
                     FStar_Tactics_Types.goal_ctx_uvar =
                       (uu___1130_7529.FStar_Tactics_Types.goal_ctx_uvar);
                     FStar_Tactics_Types.opts = opts';
                     FStar_Tactics_Types.is_guard =
                       (uu___1130_7529.FStar_Tactics_Types.is_guard);
                     FStar_Tactics_Types.label =
                       (uu___1130_7529.FStar_Tactics_Types.label)
                   } in
                 FStar_Tactics_Monad.replace_cur g'
             | FStar_Getopt.Error err ->
                 fail2 "Setting options `%s` failed: %s" s err
             | FStar_Getopt.Help ->
                 fail1 "Setting options `%s` failed (got `Help`?)" s))) in
    FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "set_options")
      uu____7509
let (top_env : unit -> env FStar_Tactics_Monad.tac) =
  fun uu____7541 ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
      (fun ps ->
         FStar_All.pipe_left FStar_Tactics_Monad.ret
           ps.FStar_Tactics_Types.main_context)
let (lax_on : unit -> Prims.bool FStar_Tactics_Monad.tac) =
  fun uu____7554 ->
    FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
      (fun g ->
         let uu____7560 =
           (FStar_Options.lax ()) ||
             (let uu____7562 = FStar_Tactics_Types.goal_env g in
              uu____7562.FStar_TypeChecker_Env.lax) in
         FStar_Tactics_Monad.ret uu____7560)
let (unquote :
  FStar_Reflection_Data.typ ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.term FStar_Tactics_Monad.tac)
  =
  fun ty ->
    fun tm ->
      let uu____7577 =
        FStar_Tactics_Monad.mlog
          (fun uu____7582 ->
             let uu____7583 = FStar_Syntax_Print.term_to_string tm in
             FStar_Util.print1 "unquote: tm = %s\n" uu____7583)
          (fun uu____7585 ->
             FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
               (fun goal ->
                  let env1 =
                    let uu____7591 = FStar_Tactics_Types.goal_env goal in
                    FStar_TypeChecker_Env.set_expected_typ uu____7591 ty in
                  let uu____7592 = __tc_ghost env1 tm in
                  FStar_Tactics_Monad.bind uu____7592
                    (fun uu____7611 ->
                       match uu____7611 with
                       | (tm1, typ, guard) ->
                           FStar_Tactics_Monad.mlog
                             (fun uu____7625 ->
                                let uu____7626 =
                                  FStar_Syntax_Print.term_to_string tm1 in
                                FStar_Util.print1 "unquote: tm' = %s\n"
                                  uu____7626)
                             (fun uu____7628 ->
                                FStar_Tactics_Monad.mlog
                                  (fun uu____7631 ->
                                     let uu____7632 =
                                       FStar_Syntax_Print.term_to_string typ in
                                     FStar_Util.print1 "unquote: typ = %s\n"
                                       uu____7632)
                                  (fun uu____7635 ->
                                     let uu____7636 =
                                       proc_guard "unquote" env1 guard in
                                     FStar_Tactics_Monad.bind uu____7636
                                       (fun uu____7640 ->
                                          FStar_Tactics_Monad.ret tm1)))))) in
      FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "unquote") uu____7577
let (uvar_env :
  env ->
    FStar_Reflection_Data.typ FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.term FStar_Tactics_Monad.tac)
  =
  fun env1 ->
    fun ty ->
      let uu____7663 =
        match ty with
        | FStar_Pervasives_Native.Some ty1 -> FStar_Tactics_Monad.ret ty1
        | FStar_Pervasives_Native.None ->
            let uu____7669 =
              let uu____7676 =
                let uu____7677 = FStar_Syntax_Util.type_u () in
                FStar_All.pipe_left FStar_Pervasives_Native.fst uu____7677 in
              FStar_Tactics_Monad.new_uvar "uvar_env.2" env1 uu____7676 in
            FStar_Tactics_Monad.bind uu____7669
              (fun uu____7693 ->
                 match uu____7693 with
                 | (typ, uvar_typ) -> FStar_Tactics_Monad.ret typ) in
      FStar_Tactics_Monad.bind uu____7663
        (fun typ ->
           let uu____7705 = FStar_Tactics_Monad.new_uvar "uvar_env" env1 typ in
           FStar_Tactics_Monad.bind uu____7705
             (fun uu____7719 ->
                match uu____7719 with
                | (t, uvar_t) -> FStar_Tactics_Monad.ret t))
let (unshelve : FStar_Syntax_Syntax.term -> unit FStar_Tactics_Monad.tac) =
  fun t ->
    let uu____7737 =
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
        (fun ps ->
           let env1 = ps.FStar_Tactics_Types.main_context in
           let opts =
             match ps.FStar_Tactics_Types.goals with
             | g::uu____7756 -> g.FStar_Tactics_Types.opts
             | uu____7759 -> FStar_Options.peek () in
           let uu____7762 = FStar_Syntax_Util.head_and_args t in
           match uu____7762 with
           | ({
                FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                  (ctx_uvar, uu____7782);
                FStar_Syntax_Syntax.pos = uu____7783;
                FStar_Syntax_Syntax.vars = uu____7784;_},
              uu____7785) ->
               let env2 =
                 let uu___1184_7827 = env1 in
                 {
                   FStar_TypeChecker_Env.solver =
                     (uu___1184_7827.FStar_TypeChecker_Env.solver);
                   FStar_TypeChecker_Env.range =
                     (uu___1184_7827.FStar_TypeChecker_Env.range);
                   FStar_TypeChecker_Env.curmodule =
                     (uu___1184_7827.FStar_TypeChecker_Env.curmodule);
                   FStar_TypeChecker_Env.gamma =
                     (ctx_uvar.FStar_Syntax_Syntax.ctx_uvar_gamma);
                   FStar_TypeChecker_Env.gamma_sig =
                     (uu___1184_7827.FStar_TypeChecker_Env.gamma_sig);
                   FStar_TypeChecker_Env.gamma_cache =
                     (uu___1184_7827.FStar_TypeChecker_Env.gamma_cache);
                   FStar_TypeChecker_Env.modules =
                     (uu___1184_7827.FStar_TypeChecker_Env.modules);
                   FStar_TypeChecker_Env.expected_typ =
                     (uu___1184_7827.FStar_TypeChecker_Env.expected_typ);
                   FStar_TypeChecker_Env.sigtab =
                     (uu___1184_7827.FStar_TypeChecker_Env.sigtab);
                   FStar_TypeChecker_Env.attrtab =
                     (uu___1184_7827.FStar_TypeChecker_Env.attrtab);
                   FStar_TypeChecker_Env.instantiate_imp =
                     (uu___1184_7827.FStar_TypeChecker_Env.instantiate_imp);
                   FStar_TypeChecker_Env.effects =
                     (uu___1184_7827.FStar_TypeChecker_Env.effects);
                   FStar_TypeChecker_Env.generalize =
                     (uu___1184_7827.FStar_TypeChecker_Env.generalize);
                   FStar_TypeChecker_Env.letrecs =
                     (uu___1184_7827.FStar_TypeChecker_Env.letrecs);
                   FStar_TypeChecker_Env.top_level =
                     (uu___1184_7827.FStar_TypeChecker_Env.top_level);
                   FStar_TypeChecker_Env.check_uvars =
                     (uu___1184_7827.FStar_TypeChecker_Env.check_uvars);
                   FStar_TypeChecker_Env.use_eq =
                     (uu___1184_7827.FStar_TypeChecker_Env.use_eq);
                   FStar_TypeChecker_Env.use_eq_strict =
                     (uu___1184_7827.FStar_TypeChecker_Env.use_eq_strict);
                   FStar_TypeChecker_Env.is_iface =
                     (uu___1184_7827.FStar_TypeChecker_Env.is_iface);
                   FStar_TypeChecker_Env.admit =
                     (uu___1184_7827.FStar_TypeChecker_Env.admit);
                   FStar_TypeChecker_Env.lax =
                     (uu___1184_7827.FStar_TypeChecker_Env.lax);
                   FStar_TypeChecker_Env.lax_universes =
                     (uu___1184_7827.FStar_TypeChecker_Env.lax_universes);
                   FStar_TypeChecker_Env.phase1 =
                     (uu___1184_7827.FStar_TypeChecker_Env.phase1);
                   FStar_TypeChecker_Env.failhard =
                     (uu___1184_7827.FStar_TypeChecker_Env.failhard);
                   FStar_TypeChecker_Env.nosynth =
                     (uu___1184_7827.FStar_TypeChecker_Env.nosynth);
                   FStar_TypeChecker_Env.uvar_subtyping =
                     (uu___1184_7827.FStar_TypeChecker_Env.uvar_subtyping);
                   FStar_TypeChecker_Env.tc_term =
                     (uu___1184_7827.FStar_TypeChecker_Env.tc_term);
                   FStar_TypeChecker_Env.type_of =
                     (uu___1184_7827.FStar_TypeChecker_Env.type_of);
                   FStar_TypeChecker_Env.universe_of =
                     (uu___1184_7827.FStar_TypeChecker_Env.universe_of);
                   FStar_TypeChecker_Env.check_type_of =
                     (uu___1184_7827.FStar_TypeChecker_Env.check_type_of);
                   FStar_TypeChecker_Env.use_bv_sorts =
                     (uu___1184_7827.FStar_TypeChecker_Env.use_bv_sorts);
                   FStar_TypeChecker_Env.qtbl_name_and_index =
                     (uu___1184_7827.FStar_TypeChecker_Env.qtbl_name_and_index);
                   FStar_TypeChecker_Env.normalized_eff_names =
                     (uu___1184_7827.FStar_TypeChecker_Env.normalized_eff_names);
                   FStar_TypeChecker_Env.fv_delta_depths =
                     (uu___1184_7827.FStar_TypeChecker_Env.fv_delta_depths);
                   FStar_TypeChecker_Env.proof_ns =
                     (uu___1184_7827.FStar_TypeChecker_Env.proof_ns);
                   FStar_TypeChecker_Env.synth_hook =
                     (uu___1184_7827.FStar_TypeChecker_Env.synth_hook);
                   FStar_TypeChecker_Env.try_solve_implicits_hook =
                     (uu___1184_7827.FStar_TypeChecker_Env.try_solve_implicits_hook);
                   FStar_TypeChecker_Env.splice =
                     (uu___1184_7827.FStar_TypeChecker_Env.splice);
                   FStar_TypeChecker_Env.mpreprocess =
                     (uu___1184_7827.FStar_TypeChecker_Env.mpreprocess);
                   FStar_TypeChecker_Env.postprocess =
                     (uu___1184_7827.FStar_TypeChecker_Env.postprocess);
                   FStar_TypeChecker_Env.identifier_info =
                     (uu___1184_7827.FStar_TypeChecker_Env.identifier_info);
                   FStar_TypeChecker_Env.tc_hooks =
                     (uu___1184_7827.FStar_TypeChecker_Env.tc_hooks);
                   FStar_TypeChecker_Env.dsenv =
                     (uu___1184_7827.FStar_TypeChecker_Env.dsenv);
                   FStar_TypeChecker_Env.nbe =
                     (uu___1184_7827.FStar_TypeChecker_Env.nbe);
                   FStar_TypeChecker_Env.strict_args_tab =
                     (uu___1184_7827.FStar_TypeChecker_Env.strict_args_tab);
                   FStar_TypeChecker_Env.erasable_types_tab =
                     (uu___1184_7827.FStar_TypeChecker_Env.erasable_types_tab);
                   FStar_TypeChecker_Env.enable_defer_to_tac =
                     (uu___1184_7827.FStar_TypeChecker_Env.enable_defer_to_tac)
                 } in
               let g =
                 FStar_Tactics_Types.mk_goal env2 ctx_uvar opts false "" in
               let uu____7829 = let uu____7832 = bnorm_goal g in [uu____7832] in
               FStar_Tactics_Monad.add_goals uu____7829
           | uu____7833 -> FStar_Tactics_Monad.fail "not a uvar") in
    FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "unshelve") uu____7737
let (tac_and :
  Prims.bool FStar_Tactics_Monad.tac ->
    Prims.bool FStar_Tactics_Monad.tac -> Prims.bool FStar_Tactics_Monad.tac)
  =
  fun t1 ->
    fun t2 ->
      let comp =
        FStar_Tactics_Monad.bind t1
          (fun b ->
             let uu____7882 = if b then t2 else FStar_Tactics_Monad.ret false in
             FStar_Tactics_Monad.bind uu____7882
               (fun b' ->
                  if b'
                  then FStar_Tactics_Monad.ret b'
                  else FStar_Tactics_Monad.fail "")) in
      let uu____7893 = trytac comp in
      FStar_Tactics_Monad.bind uu____7893
        (fun uu___5_7901 ->
           match uu___5_7901 with
           | FStar_Pervasives_Native.Some (true) ->
               FStar_Tactics_Monad.ret true
           | FStar_Pervasives_Native.Some (false) -> failwith "impossible"
           | FStar_Pervasives_Native.None -> FStar_Tactics_Monad.ret false)
let (unify_env :
  env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.term -> Prims.bool FStar_Tactics_Monad.tac)
  =
  fun e ->
    fun t1 ->
      fun t2 ->
        let uu____7927 =
          FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
            (fun ps ->
               let uu____7933 = __tc e t1 in
               FStar_Tactics_Monad.bind uu____7933
                 (fun uu____7953 ->
                    match uu____7953 with
                    | (t11, ty1, g1) ->
                        let uu____7965 = __tc e t2 in
                        FStar_Tactics_Monad.bind uu____7965
                          (fun uu____7985 ->
                             match uu____7985 with
                             | (t21, ty2, g2) ->
                                 let uu____7997 =
                                   proc_guard "unify_env g1" e g1 in
                                 FStar_Tactics_Monad.bind uu____7997
                                   (fun uu____8002 ->
                                      let uu____8003 =
                                        proc_guard "unify_env g2" e g2 in
                                      FStar_Tactics_Monad.bind uu____8003
                                        (fun uu____8009 ->
                                           let uu____8010 =
                                             do_unify e ty1 ty2 in
                                           let uu____8013 =
                                             do_unify e t11 t21 in
                                           tac_and uu____8010 uu____8013))))) in
        FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "unify_env")
          uu____7927
let (launch_process :
  Prims.string ->
    Prims.string Prims.list ->
      Prims.string -> Prims.string FStar_Tactics_Monad.tac)
  =
  fun prog ->
    fun args ->
      fun input ->
        FStar_Tactics_Monad.bind FStar_Tactics_Monad.idtac
          (fun uu____8046 ->
             let uu____8047 = FStar_Options.unsafe_tactic_exec () in
             if uu____8047
             then
               let s =
                 FStar_Util.run_process "tactic_launch" prog args
                   (FStar_Pervasives_Native.Some input) in
               FStar_Tactics_Monad.ret s
             else
               FStar_Tactics_Monad.fail
                 "launch_process: will not run anything unless --unsafe_tactic_exec is provided")
let (fresh_bv_named :
  Prims.string ->
    FStar_Reflection_Data.typ ->
      FStar_Syntax_Syntax.bv FStar_Tactics_Monad.tac)
  =
  fun nm ->
    fun t ->
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.idtac
        (fun uu____8068 ->
           let uu____8069 =
             FStar_Syntax_Syntax.gen_bv nm FStar_Pervasives_Native.None t in
           FStar_Tactics_Monad.ret uu____8069)
let (change : FStar_Reflection_Data.typ -> unit FStar_Tactics_Monad.tac) =
  fun ty ->
    let uu____8079 =
      FStar_Tactics_Monad.mlog
        (fun uu____8084 ->
           let uu____8085 = FStar_Syntax_Print.term_to_string ty in
           FStar_Util.print1 "change: ty = %s\n" uu____8085)
        (fun uu____8087 ->
           FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
             (fun g ->
                let uu____8091 =
                  let uu____8100 = FStar_Tactics_Types.goal_env g in
                  __tc uu____8100 ty in
                FStar_Tactics_Monad.bind uu____8091
                  (fun uu____8112 ->
                     match uu____8112 with
                     | (ty1, uu____8122, guard) ->
                         let uu____8124 =
                           let uu____8127 = FStar_Tactics_Types.goal_env g in
                           proc_guard "change" uu____8127 guard in
                         FStar_Tactics_Monad.bind uu____8124
                           (fun uu____8130 ->
                              let uu____8131 =
                                let uu____8134 =
                                  FStar_Tactics_Types.goal_env g in
                                let uu____8135 =
                                  FStar_Tactics_Types.goal_type g in
                                do_unify uu____8134 uu____8135 ty1 in
                              FStar_Tactics_Monad.bind uu____8131
                                (fun bb ->
                                   if bb
                                   then
                                     let uu____8141 =
                                       FStar_Tactics_Types.goal_with_type g
                                         ty1 in
                                     FStar_Tactics_Monad.replace_cur
                                       uu____8141
                                   else
                                     (let steps =
                                        [FStar_TypeChecker_Env.AllowUnboundUniverses;
                                        FStar_TypeChecker_Env.UnfoldUntil
                                          FStar_Syntax_Syntax.delta_constant;
                                        FStar_TypeChecker_Env.Primops] in
                                      let ng =
                                        let uu____8147 =
                                          FStar_Tactics_Types.goal_env g in
                                        let uu____8148 =
                                          FStar_Tactics_Types.goal_type g in
                                        normalize steps uu____8147 uu____8148 in
                                      let nty =
                                        let uu____8150 =
                                          FStar_Tactics_Types.goal_env g in
                                        normalize steps uu____8150 ty1 in
                                      let uu____8151 =
                                        let uu____8154 =
                                          FStar_Tactics_Types.goal_env g in
                                        do_unify uu____8154 ng nty in
                                      FStar_Tactics_Monad.bind uu____8151
                                        (fun b ->
                                           if b
                                           then
                                             let uu____8160 =
                                               FStar_Tactics_Types.goal_with_type
                                                 g ty1 in
                                             FStar_Tactics_Monad.replace_cur
                                               uu____8160
                                           else
                                             FStar_Tactics_Monad.fail
                                               "not convertible"))))))) in
    FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "change") uu____8079
let failwhen :
  'a .
    Prims.bool ->
      Prims.string ->
        (unit -> 'a FStar_Tactics_Monad.tac) -> 'a FStar_Tactics_Monad.tac
  =
  fun b ->
    fun msg -> fun k -> if b then FStar_Tactics_Monad.fail msg else k ()
let (t_destruct :
  FStar_Syntax_Syntax.term ->
    (FStar_Syntax_Syntax.fv * FStar_BigInt.t) Prims.list
      FStar_Tactics_Monad.tac)
  =
  fun s_tm ->
    let uu____8223 =
      FStar_Tactics_Monad.bind FStar_Tactics_Monad.cur_goal
        (fun g ->
           let uu____8241 =
             let uu____8250 = FStar_Tactics_Types.goal_env g in
             __tc uu____8250 s_tm in
           FStar_Tactics_Monad.bind uu____8241
             (fun uu____8268 ->
                match uu____8268 with
                | (s_tm1, s_ty, guard) ->
                    let uu____8286 =
                      let uu____8289 = FStar_Tactics_Types.goal_env g in
                      proc_guard "destruct" uu____8289 guard in
                    FStar_Tactics_Monad.bind uu____8286
                      (fun uu____8302 ->
                         let s_ty1 =
                           let uu____8304 = FStar_Tactics_Types.goal_env g in
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Env.UnfoldTac;
                             FStar_TypeChecker_Env.Weak;
                             FStar_TypeChecker_Env.HNF;
                             FStar_TypeChecker_Env.UnfoldUntil
                               FStar_Syntax_Syntax.delta_constant] uu____8304
                             s_ty in
                         let uu____8305 =
                           let uu____8320 = FStar_Syntax_Util.unrefine s_ty1 in
                           FStar_Syntax_Util.head_and_args' uu____8320 in
                         match uu____8305 with
                         | (h, args) ->
                             let uu____8351 =
                               let uu____8358 =
                                 let uu____8359 =
                                   FStar_Syntax_Subst.compress h in
                                 uu____8359.FStar_Syntax_Syntax.n in
                               match uu____8358 with
                               | FStar_Syntax_Syntax.Tm_fvar fv ->
                                   FStar_Tactics_Monad.ret (fv, [])
                               | FStar_Syntax_Syntax.Tm_uinst
                                   ({
                                      FStar_Syntax_Syntax.n =
                                        FStar_Syntax_Syntax.Tm_fvar fv;
                                      FStar_Syntax_Syntax.pos = uu____8374;
                                      FStar_Syntax_Syntax.vars = uu____8375;_},
                                    us)
                                   -> FStar_Tactics_Monad.ret (fv, us)
                               | uu____8385 ->
                                   FStar_Tactics_Monad.fail
                                     "type is not an fv" in
                             FStar_Tactics_Monad.bind uu____8351
                               (fun uu____8405 ->
                                  match uu____8405 with
                                  | (fv, a_us) ->
                                      let t_lid =
                                        FStar_Syntax_Syntax.lid_of_fv fv in
                                      let uu____8421 =
                                        let uu____8424 =
                                          FStar_Tactics_Types.goal_env g in
                                        FStar_TypeChecker_Env.lookup_sigelt
                                          uu____8424 t_lid in
                                      (match uu____8421 with
                                       | FStar_Pervasives_Native.None ->
                                           FStar_Tactics_Monad.fail
                                             "type not found in environment"
                                       | FStar_Pervasives_Native.Some se ->
                                           (match se.FStar_Syntax_Syntax.sigel
                                            with
                                            | FStar_Syntax_Syntax.Sig_inductive_typ
                                                (_lid, t_us, t_ps, t_ty, mut,
                                                 c_lids)
                                                ->
                                                let erasable =
                                                  FStar_Syntax_Util.has_attribute
                                                    se.FStar_Syntax_Syntax.sigattrs
                                                    FStar_Parser_Const.erasable_attr in
                                                let uu____8463 =
                                                  erasable &&
                                                    (let uu____8465 =
                                                       FStar_Tactics_Types.is_irrelevant
                                                         g in
                                                     Prims.op_Negation
                                                       uu____8465) in
                                                failwhen uu____8463
                                                  "cannot destruct erasable type to solve proof-relevant goal"
                                                  (fun uu____8473 ->
                                                     failwhen
                                                       ((FStar_List.length
                                                           a_us)
                                                          <>
                                                          (FStar_List.length
                                                             t_us))
                                                       "t_us don't match?"
                                                       (fun uu____8485 ->
                                                          let uu____8486 =
                                                            FStar_Syntax_Subst.open_term
                                                              t_ps t_ty in
                                                          match uu____8486
                                                          with
                                                          | (t_ps1, t_ty1) ->
                                                              let uu____8501
                                                                =
                                                                FStar_Tactics_Monad.mapM
                                                                  (fun c_lid
                                                                    ->
                                                                    let uu____8529
                                                                    =
                                                                    let uu____8532
                                                                    =
                                                                    FStar_Tactics_Types.goal_env
                                                                    g in
                                                                    FStar_TypeChecker_Env.lookup_sigelt
                                                                    uu____8532
                                                                    c_lid in
                                                                    match uu____8529
                                                                    with
                                                                    | 
                                                                    FStar_Pervasives_Native.None
                                                                    ->
                                                                    FStar_Tactics_Monad.fail
                                                                    "ctor not found?"
                                                                    | 
                                                                    FStar_Pervasives_Native.Some
                                                                    se1 ->
                                                                    (match 
                                                                    se1.FStar_Syntax_Syntax.sigel
                                                                    with
                                                                    | 
                                                                    FStar_Syntax_Syntax.Sig_datacon
                                                                    (_c_lid,
                                                                    c_us,
                                                                    c_ty,
                                                                    _t_lid,
                                                                    nparam,
                                                                    mut1) ->
                                                                    let fv1 =
                                                                    FStar_Syntax_Syntax.lid_as_fv
                                                                    c_lid
                                                                    FStar_Syntax_Syntax.delta_constant
                                                                    (FStar_Pervasives_Native.Some
                                                                    FStar_Syntax_Syntax.Data_ctor) in
                                                                    failwhen
                                                                    ((FStar_List.length
                                                                    a_us) <>
                                                                    (FStar_List.length
                                                                    c_us))
                                                                    "t_us don't match?"
                                                                    (fun
                                                                    uu____8605
                                                                    ->
                                                                    let s =
                                                                    FStar_TypeChecker_Env.mk_univ_subst
                                                                    c_us a_us in
                                                                    let c_ty1
                                                                    =
                                                                    FStar_Syntax_Subst.subst
                                                                    s c_ty in
                                                                    let uu____8610
                                                                    =
                                                                    FStar_TypeChecker_Env.inst_tscheme
                                                                    (c_us,
                                                                    c_ty1) in
                                                                    match uu____8610
                                                                    with
                                                                    | 
                                                                    (c_us1,
                                                                    c_ty2) ->
                                                                    let uu____8633
                                                                    =
                                                                    FStar_Syntax_Util.arrow_formals_comp
                                                                    c_ty2 in
                                                                    (match uu____8633
                                                                    with
                                                                    | 
                                                                    (bs,
                                                                    comp) ->
                                                                    let uu____8652
                                                                    =
                                                                    let rename_bv
                                                                    bv =
                                                                    let ppname
                                                                    =
                                                                    bv.FStar_Syntax_Syntax.ppname in
                                                                    let ppname1
                                                                    =
                                                                    let uu____8675
                                                                    =
                                                                    let uu____8680
                                                                    =
                                                                    let uu____8681
                                                                    =
                                                                    FStar_Ident.string_of_id
                                                                    ppname in
                                                                    Prims.op_Hat
                                                                    "a"
                                                                    uu____8681 in
                                                                    let uu____8682
                                                                    =
                                                                    FStar_Ident.range_of_id
                                                                    ppname in
                                                                    (uu____8680,
                                                                    uu____8682) in
                                                                    FStar_Ident.mk_ident
                                                                    uu____8675 in
                                                                    FStar_Syntax_Syntax.freshen_bv
                                                                    (let uu___1312_8685
                                                                    = bv in
                                                                    {
                                                                    FStar_Syntax_Syntax.ppname
                                                                    = ppname1;
                                                                    FStar_Syntax_Syntax.index
                                                                    =
                                                                    (uu___1312_8685.FStar_Syntax_Syntax.index);
                                                                    FStar_Syntax_Syntax.sort
                                                                    =
                                                                    (uu___1312_8685.FStar_Syntax_Syntax.sort)
                                                                    }) in
                                                                    let bs' =
                                                                    FStar_List.map
                                                                    (fun
                                                                    uu____8711
                                                                    ->
                                                                    match uu____8711
                                                                    with
                                                                    | 
                                                                    (bv, aq)
                                                                    ->
                                                                    let uu____8730
                                                                    =
                                                                    rename_bv
                                                                    bv in
                                                                    (uu____8730,
                                                                    aq)) bs in
                                                                    let subst
                                                                    =
                                                                    FStar_List.map2
                                                                    (fun
                                                                    uu____8755
                                                                    ->
                                                                    fun
                                                                    uu____8756
                                                                    ->
                                                                    match 
                                                                    (uu____8755,
                                                                    uu____8756)
                                                                    with
                                                                    | 
                                                                    ((bv,
                                                                    uu____8782),
                                                                    (bv',
                                                                    uu____8784))
                                                                    ->
                                                                    let uu____8805
                                                                    =
                                                                    let uu____8812
                                                                    =
                                                                    FStar_Syntax_Syntax.bv_to_name
                                                                    bv' in
                                                                    (bv,
                                                                    uu____8812) in
                                                                    FStar_Syntax_Syntax.NT
                                                                    uu____8805)
                                                                    bs bs' in
                                                                    let uu____8817
                                                                    =
                                                                    FStar_Syntax_Subst.subst_binders
                                                                    subst bs' in
                                                                    let uu____8826
                                                                    =
                                                                    FStar_Syntax_Subst.subst_comp
                                                                    subst
                                                                    comp in
                                                                    (uu____8817,
                                                                    uu____8826) in
                                                                    (match uu____8652
                                                                    with
                                                                    | 
                                                                    (bs1,
                                                                    comp1) ->
                                                                    let uu____8873
                                                                    =
                                                                    FStar_List.splitAt
                                                                    nparam
                                                                    bs1 in
                                                                    (match uu____8873
                                                                    with
                                                                    | 
                                                                    (d_ps,
                                                                    bs2) ->
                                                                    let uu____8946
                                                                    =
                                                                    let uu____8947
                                                                    =
                                                                    FStar_Syntax_Util.is_total_comp
                                                                    comp1 in
                                                                    Prims.op_Negation
                                                                    uu____8947 in
                                                                    failwhen
                                                                    uu____8946
                                                                    "not total?"
                                                                    (fun
                                                                    uu____8964
                                                                    ->
                                                                    let mk_pat
                                                                    p =
                                                                    {
                                                                    FStar_Syntax_Syntax.v
                                                                    = p;
                                                                    FStar_Syntax_Syntax.p
                                                                    =
                                                                    (s_tm1.FStar_Syntax_Syntax.pos)
                                                                    } in
                                                                    let is_imp
                                                                    uu___6_8980
                                                                    =
                                                                    match uu___6_8980
                                                                    with
                                                                    | 
                                                                    FStar_Pervasives_Native.Some
                                                                    (FStar_Syntax_Syntax.Implicit
                                                                    uu____8983)
                                                                    -> true
                                                                    | 
                                                                    uu____8984
                                                                    -> false in
                                                                    let uu____8987
                                                                    =
                                                                    FStar_List.splitAt
                                                                    nparam
                                                                    args in
                                                                    match uu____8987
                                                                    with
                                                                    | 
                                                                    (a_ps,
                                                                    a_is) ->
                                                                    failwhen
                                                                    ((FStar_List.length
                                                                    a_ps) <>
                                                                    (FStar_List.length
                                                                    d_ps))
                                                                    "params not match?"
                                                                    (fun
                                                                    uu____9122
                                                                    ->
                                                                    let d_ps_a_ps
                                                                    =
                                                                    FStar_List.zip
                                                                    d_ps a_ps in
                                                                    let subst
                                                                    =
                                                                    FStar_List.map
                                                                    (fun
                                                                    uu____9184
                                                                    ->
                                                                    match uu____9184
                                                                    with
                                                                    | 
                                                                    ((bv,
                                                                    uu____9204),
                                                                    (t,
                                                                    uu____9206))
                                                                    ->
                                                                    FStar_Syntax_Syntax.NT
                                                                    (bv, t))
                                                                    d_ps_a_ps in
                                                                    let bs3 =
                                                                    FStar_Syntax_Subst.subst_binders
                                                                    subst bs2 in
                                                                    let subpats_1
                                                                    =
                                                                    FStar_List.map
                                                                    (fun
                                                                    uu____9274
                                                                    ->
                                                                    match uu____9274
                                                                    with
                                                                    | 
                                                                    ((bv,
                                                                    uu____9300),
                                                                    (t,
                                                                    uu____9302))
                                                                    ->
                                                                    ((mk_pat
                                                                    (FStar_Syntax_Syntax.Pat_dot_term
                                                                    (bv, t))),
                                                                    true))
                                                                    d_ps_a_ps in
                                                                    let subpats_2
                                                                    =
                                                                    FStar_List.map
                                                                    (fun
                                                                    uu____9357
                                                                    ->
                                                                    match uu____9357
                                                                    with
                                                                    | 
                                                                    (bv, aq)
                                                                    ->
                                                                    ((mk_pat
                                                                    (FStar_Syntax_Syntax.Pat_var
                                                                    bv)),
                                                                    (is_imp
                                                                    aq))) bs3 in
                                                                    let subpats
                                                                    =
                                                                    FStar_List.append
                                                                    subpats_1
                                                                    subpats_2 in
                                                                    let pat =
                                                                    mk_pat
                                                                    (FStar_Syntax_Syntax.Pat_cons
                                                                    (fv1,
                                                                    subpats)) in
                                                                    let env1
                                                                    =
                                                                    FStar_Tactics_Types.goal_env
                                                                    g in
                                                                    let cod =
                                                                    FStar_Tactics_Types.goal_type
                                                                    g in
                                                                    let equ =
                                                                    env1.FStar_TypeChecker_Env.universe_of
                                                                    env1
                                                                    s_ty1 in
                                                                    let uu____9407
                                                                    =
                                                                    FStar_TypeChecker_TcTerm.tc_pat
                                                                    (let uu___1371_9430
                                                                    = env1 in
                                                                    {
                                                                    FStar_TypeChecker_Env.solver
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.solver);
                                                                    FStar_TypeChecker_Env.range
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.range);
                                                                    FStar_TypeChecker_Env.curmodule
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.curmodule);
                                                                    FStar_TypeChecker_Env.gamma
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.gamma);
                                                                    FStar_TypeChecker_Env.gamma_sig
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.gamma_sig);
                                                                    FStar_TypeChecker_Env.gamma_cache
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.gamma_cache);
                                                                    FStar_TypeChecker_Env.modules
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.modules);
                                                                    FStar_TypeChecker_Env.expected_typ
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.expected_typ);
                                                                    FStar_TypeChecker_Env.sigtab
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.sigtab);
                                                                    FStar_TypeChecker_Env.attrtab
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.attrtab);
                                                                    FStar_TypeChecker_Env.instantiate_imp
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.instantiate_imp);
                                                                    FStar_TypeChecker_Env.effects
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.effects);
                                                                    FStar_TypeChecker_Env.generalize
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.generalize);
                                                                    FStar_TypeChecker_Env.letrecs
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.letrecs);
                                                                    FStar_TypeChecker_Env.top_level
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.top_level);
                                                                    FStar_TypeChecker_Env.check_uvars
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.check_uvars);
                                                                    FStar_TypeChecker_Env.use_eq
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.use_eq);
                                                                    FStar_TypeChecker_Env.use_eq_strict
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.use_eq_strict);
                                                                    FStar_TypeChecker_Env.is_iface
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.is_iface);
                                                                    FStar_TypeChecker_Env.admit
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.admit);
                                                                    FStar_TypeChecker_Env.lax
                                                                    = true;
                                                                    FStar_TypeChecker_Env.lax_universes
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.lax_universes);
                                                                    FStar_TypeChecker_Env.phase1
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.phase1);
                                                                    FStar_TypeChecker_Env.failhard
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.failhard);
                                                                    FStar_TypeChecker_Env.nosynth
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.nosynth);
                                                                    FStar_TypeChecker_Env.uvar_subtyping
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.uvar_subtyping);
                                                                    FStar_TypeChecker_Env.tc_term
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.tc_term);
                                                                    FStar_TypeChecker_Env.type_of
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.type_of);
                                                                    FStar_TypeChecker_Env.universe_of
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.universe_of);
                                                                    FStar_TypeChecker_Env.check_type_of
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.check_type_of);
                                                                    FStar_TypeChecker_Env.use_bv_sorts
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.use_bv_sorts);
                                                                    FStar_TypeChecker_Env.qtbl_name_and_index
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.qtbl_name_and_index);
                                                                    FStar_TypeChecker_Env.normalized_eff_names
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.normalized_eff_names);
                                                                    FStar_TypeChecker_Env.fv_delta_depths
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.fv_delta_depths);
                                                                    FStar_TypeChecker_Env.proof_ns
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.proof_ns);
                                                                    FStar_TypeChecker_Env.synth_hook
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.synth_hook);
                                                                    FStar_TypeChecker_Env.try_solve_implicits_hook
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.try_solve_implicits_hook);
                                                                    FStar_TypeChecker_Env.splice
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.splice);
                                                                    FStar_TypeChecker_Env.mpreprocess
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.mpreprocess);
                                                                    FStar_TypeChecker_Env.postprocess
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.postprocess);
                                                                    FStar_TypeChecker_Env.identifier_info
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.identifier_info);
                                                                    FStar_TypeChecker_Env.tc_hooks
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.tc_hooks);
                                                                    FStar_TypeChecker_Env.dsenv
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.dsenv);
                                                                    FStar_TypeChecker_Env.nbe
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.nbe);
                                                                    FStar_TypeChecker_Env.strict_args_tab
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.strict_args_tab);
                                                                    FStar_TypeChecker_Env.erasable_types_tab
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.erasable_types_tab);
                                                                    FStar_TypeChecker_Env.enable_defer_to_tac
                                                                    =
                                                                    (uu___1371_9430.FStar_TypeChecker_Env.enable_defer_to_tac)
                                                                    }) s_ty1
                                                                    pat in
                                                                    match uu____9407
                                                                    with
                                                                    | 
                                                                    (uu____9443,
                                                                    uu____9444,
                                                                    uu____9445,
                                                                    uu____9446,
                                                                    pat_t,
                                                                    uu____9448,
                                                                    _guard_pat,
                                                                    _erasable)
                                                                    ->
                                                                    let eq_b
                                                                    =
                                                                    let uu____9460
                                                                    =
                                                                    let uu____9461
                                                                    =
                                                                    FStar_Syntax_Util.mk_eq2
                                                                    equ s_ty1
                                                                    s_tm1
                                                                    pat_t in
                                                                    FStar_Syntax_Util.mk_squash
                                                                    equ
                                                                    uu____9461 in
                                                                    FStar_Syntax_Syntax.gen_bv
                                                                    "breq"
                                                                    FStar_Pervasives_Native.None
                                                                    uu____9460 in
                                                                    let cod1
                                                                    =
                                                                    let uu____9465
                                                                    =
                                                                    let uu____9474
                                                                    =
                                                                    FStar_Syntax_Syntax.mk_binder
                                                                    eq_b in
                                                                    [uu____9474] in
                                                                    let uu____9493
                                                                    =
                                                                    FStar_Syntax_Syntax.mk_Total
                                                                    cod in
                                                                    FStar_Syntax_Util.arrow
                                                                    uu____9465
                                                                    uu____9493 in
                                                                    let nty =
                                                                    let uu____9499
                                                                    =
                                                                    FStar_Syntax_Syntax.mk_Total
                                                                    cod1 in
                                                                    FStar_Syntax_Util.arrow
                                                                    bs3
                                                                    uu____9499 in
                                                                    let uu____9502
                                                                    =
                                                                    FStar_Tactics_Monad.new_uvar
                                                                    "destruct branch"
                                                                    env1 nty in
                                                                    FStar_Tactics_Monad.bind
                                                                    uu____9502
                                                                    (fun
                                                                    uu____9531
                                                                    ->
                                                                    match uu____9531
                                                                    with
                                                                    | 
                                                                    (uvt, uv)
                                                                    ->
                                                                    let g' =
                                                                    FStar_Tactics_Types.mk_goal
                                                                    env1 uv
                                                                    g.FStar_Tactics_Types.opts
                                                                    false
                                                                    g.FStar_Tactics_Types.label in
                                                                    let brt =
                                                                    FStar_Syntax_Util.mk_app_binders
                                                                    uvt bs3 in
                                                                    let brt1
                                                                    =
                                                                    let uu____9557
                                                                    =
                                                                    let uu____9568
                                                                    =
                                                                    FStar_Syntax_Syntax.as_arg
                                                                    FStar_Syntax_Util.exp_unit in
                                                                    [uu____9568] in
                                                                    FStar_Syntax_Util.mk_app
                                                                    brt
                                                                    uu____9557 in
                                                                    let br =
                                                                    FStar_Syntax_Subst.close_branch
                                                                    (pat,
                                                                    FStar_Pervasives_Native.None,
                                                                    brt1) in
                                                                    let uu____9604
                                                                    =
                                                                    let uu____9615
                                                                    =
                                                                    let uu____9620
                                                                    =
                                                                    FStar_BigInt.of_int_fs
                                                                    (FStar_List.length
                                                                    bs3) in
                                                                    (fv1,
                                                                    uu____9620) in
                                                                    (g', br,
                                                                    uu____9615) in
                                                                    FStar_Tactics_Monad.ret
                                                                    uu____9604)))))))
                                                                    | 
                                                                    uu____9641
                                                                    ->
                                                                    FStar_Tactics_Monad.fail
                                                                    "impossible: not a ctor"))
                                                                  c_lids in
                                                              FStar_Tactics_Monad.bind
                                                                uu____8501
                                                                (fun goal_brs
                                                                   ->
                                                                   let uu____9690
                                                                    =
                                                                    FStar_List.unzip3
                                                                    goal_brs in
                                                                   match uu____9690
                                                                   with
                                                                   | 
                                                                   (goals,
                                                                    brs,
                                                                    infos) ->
                                                                    let w =
                                                                    FStar_Syntax_Syntax.mk
                                                                    (FStar_Syntax_Syntax.Tm_match
                                                                    (s_tm1,
                                                                    brs))
                                                                    s_tm1.FStar_Syntax_Syntax.pos in
                                                                    let uu____9763
                                                                    =
                                                                    solve' g
                                                                    w in
                                                                    FStar_Tactics_Monad.bind
                                                                    uu____9763
                                                                    (fun
                                                                    uu____9774
                                                                    ->
                                                                    let uu____9775
                                                                    =
                                                                    FStar_Tactics_Monad.add_goals
                                                                    goals in
                                                                    FStar_Tactics_Monad.bind
                                                                    uu____9775
                                                                    (fun
                                                                    uu____9785
                                                                    ->
                                                                    FStar_Tactics_Monad.ret
                                                                    infos)))))
                                            | uu____9792 ->
                                                FStar_Tactics_Monad.fail
                                                  "not an inductive type")))))) in
    FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "destruct") uu____8223
let rec last : 'a . 'a Prims.list -> 'a =
  fun l ->
    match l with
    | [] -> failwith "last: empty list"
    | x::[] -> x
    | uu____9837::xs -> last xs
let rec init : 'a . 'a Prims.list -> 'a Prims.list =
  fun l ->
    match l with
    | [] -> failwith "init: empty list"
    | x::[] -> []
    | x::xs -> let uu____9865 = init xs in x :: uu____9865
let rec (inspect :
  FStar_Syntax_Syntax.term ->
    FStar_Reflection_Data.term_view FStar_Tactics_Monad.tac)
  =
  fun t ->
    let uu____9877 =
      let uu____9880 = top_env () in
      FStar_Tactics_Monad.bind uu____9880
        (fun e ->
           let t1 = FStar_Syntax_Util.unascribe t in
           let t2 = FStar_Syntax_Util.un_uinst t1 in
           let t3 = FStar_Syntax_Util.unlazy_emb t2 in
           match t3.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_meta (t4, uu____9896) -> inspect t4
           | FStar_Syntax_Syntax.Tm_name bv ->
               FStar_All.pipe_left FStar_Tactics_Monad.ret
                 (FStar_Reflection_Data.Tv_Var bv)
           | FStar_Syntax_Syntax.Tm_bvar bv ->
               FStar_All.pipe_left FStar_Tactics_Monad.ret
                 (FStar_Reflection_Data.Tv_BVar bv)
           | FStar_Syntax_Syntax.Tm_fvar fv ->
               FStar_All.pipe_left FStar_Tactics_Monad.ret
                 (FStar_Reflection_Data.Tv_FVar fv)
           | FStar_Syntax_Syntax.Tm_app (hd, []) ->
               failwith "empty arguments on Tm_app"
           | FStar_Syntax_Syntax.Tm_app (hd, args) ->
               let uu____9961 = last args in
               (match uu____9961 with
                | (a, q) ->
                    let q' = FStar_Reflection_Basic.inspect_aqual q in
                    let uu____9991 =
                      let uu____9992 =
                        let uu____9997 =
                          let uu____9998 = init args in
                          FStar_Syntax_Syntax.mk_Tm_app hd uu____9998
                            t3.FStar_Syntax_Syntax.pos in
                        (uu____9997, (a, q')) in
                      FStar_Reflection_Data.Tv_App uu____9992 in
                    FStar_All.pipe_left FStar_Tactics_Monad.ret uu____9991)
           | FStar_Syntax_Syntax.Tm_abs ([], uu____10009, uu____10010) ->
               failwith "empty arguments on Tm_abs"
           | FStar_Syntax_Syntax.Tm_abs (bs, t4, k) ->
               let uu____10062 = FStar_Syntax_Subst.open_term bs t4 in
               (match uu____10062 with
                | (bs1, t5) ->
                    (match bs1 with
                     | [] -> failwith "impossible"
                     | b::bs2 ->
                         let uu____10103 =
                           let uu____10104 =
                             let uu____10109 = FStar_Syntax_Util.abs bs2 t5 k in
                             (b, uu____10109) in
                           FStar_Reflection_Data.Tv_Abs uu____10104 in
                         FStar_All.pipe_left FStar_Tactics_Monad.ret
                           uu____10103))
           | FStar_Syntax_Syntax.Tm_type uu____10112 ->
               FStar_All.pipe_left FStar_Tactics_Monad.ret
                 (FStar_Reflection_Data.Tv_Type ())
           | FStar_Syntax_Syntax.Tm_arrow ([], k) ->
               failwith "empty binders on arrow"
           | FStar_Syntax_Syntax.Tm_arrow uu____10136 ->
               let uu____10151 = FStar_Syntax_Util.arrow_one t3 in
               (match uu____10151 with
                | FStar_Pervasives_Native.Some (b, c) ->
                    FStar_All.pipe_left FStar_Tactics_Monad.ret
                      (FStar_Reflection_Data.Tv_Arrow (b, c))
                | FStar_Pervasives_Native.None -> failwith "impossible")
           | FStar_Syntax_Syntax.Tm_refine (bv, t4) ->
               let b = FStar_Syntax_Syntax.mk_binder bv in
               let uu____10181 = FStar_Syntax_Subst.open_term [b] t4 in
               (match uu____10181 with
                | (b', t5) ->
                    let b1 =
                      match b' with
                      | b'1::[] -> b'1
                      | uu____10234 -> failwith "impossible" in
                    FStar_All.pipe_left FStar_Tactics_Monad.ret
                      (FStar_Reflection_Data.Tv_Refine
                         ((FStar_Pervasives_Native.fst b1), t5)))
           | FStar_Syntax_Syntax.Tm_constant c ->
               let uu____10246 =
                 let uu____10247 = FStar_Reflection_Basic.inspect_const c in
                 FStar_Reflection_Data.Tv_Const uu____10247 in
               FStar_All.pipe_left FStar_Tactics_Monad.ret uu____10246
           | FStar_Syntax_Syntax.Tm_uvar (ctx_u, s) ->
               let uu____10268 =
                 let uu____10269 =
                   let uu____10274 =
                     let uu____10275 =
                       FStar_Syntax_Unionfind.uvar_id
                         ctx_u.FStar_Syntax_Syntax.ctx_uvar_head in
                     FStar_BigInt.of_int_fs uu____10275 in
                   (uu____10274, (ctx_u, s)) in
                 FStar_Reflection_Data.Tv_Uvar uu____10269 in
               FStar_All.pipe_left FStar_Tactics_Monad.ret uu____10268
           | FStar_Syntax_Syntax.Tm_let ((false, lb::[]), t21) ->
               if lb.FStar_Syntax_Syntax.lbunivs <> []
               then
                 FStar_All.pipe_left FStar_Tactics_Monad.ret
                   FStar_Reflection_Data.Tv_Unknown
               else
                 (match lb.FStar_Syntax_Syntax.lbname with
                  | FStar_Util.Inr uu____10309 ->
                      FStar_All.pipe_left FStar_Tactics_Monad.ret
                        FStar_Reflection_Data.Tv_Unknown
                  | FStar_Util.Inl bv ->
                      let b = FStar_Syntax_Syntax.mk_binder bv in
                      let uu____10314 = FStar_Syntax_Subst.open_term [b] t21 in
                      (match uu____10314 with
                       | (bs, t22) ->
                           let b1 =
                             match bs with
                             | b1::[] -> b1
                             | uu____10367 ->
                                 failwith
                                   "impossible: open_term returned different amount of binders" in
                           FStar_All.pipe_left FStar_Tactics_Monad.ret
                             (FStar_Reflection_Data.Tv_Let
                                (false, (lb.FStar_Syntax_Syntax.lbattrs),
                                  (FStar_Pervasives_Native.fst b1),
                                  (lb.FStar_Syntax_Syntax.lbdef), t22))))
           | FStar_Syntax_Syntax.Tm_let ((true, lb::[]), t21) ->
               if lb.FStar_Syntax_Syntax.lbunivs <> []
               then
                 FStar_All.pipe_left FStar_Tactics_Monad.ret
                   FStar_Reflection_Data.Tv_Unknown
               else
                 (match lb.FStar_Syntax_Syntax.lbname with
                  | FStar_Util.Inr uu____10403 ->
                      FStar_All.pipe_left FStar_Tactics_Monad.ret
                        FStar_Reflection_Data.Tv_Unknown
                  | FStar_Util.Inl bv ->
                      let uu____10407 =
                        FStar_Syntax_Subst.open_let_rec [lb] t21 in
                      (match uu____10407 with
                       | (lbs, t22) ->
                           (match lbs with
                            | lb1::[] ->
                                (match lb1.FStar_Syntax_Syntax.lbname with
                                 | FStar_Util.Inr uu____10427 ->
                                     FStar_Tactics_Monad.ret
                                       FStar_Reflection_Data.Tv_Unknown
                                 | FStar_Util.Inl bv1 ->
                                     FStar_All.pipe_left
                                       FStar_Tactics_Monad.ret
                                       (FStar_Reflection_Data.Tv_Let
                                          (true,
                                            (lb1.FStar_Syntax_Syntax.lbattrs),
                                            bv1,
                                            (lb1.FStar_Syntax_Syntax.lbdef),
                                            t22)))
                            | uu____10433 ->
                                failwith
                                  "impossible: open_term returned different amount of binders")))
           | FStar_Syntax_Syntax.Tm_match (t4, brs) ->
               let rec inspect_pat p =
                 match p.FStar_Syntax_Syntax.v with
                 | FStar_Syntax_Syntax.Pat_constant c ->
                     let uu____10487 = FStar_Reflection_Basic.inspect_const c in
                     FStar_Reflection_Data.Pat_Constant uu____10487
                 | FStar_Syntax_Syntax.Pat_cons (fv, ps) ->
                     let uu____10506 =
                       let uu____10517 =
                         FStar_List.map
                           (fun uu____10538 ->
                              match uu____10538 with
                              | (p1, b) ->
                                  let uu____10555 = inspect_pat p1 in
                                  (uu____10555, b)) ps in
                       (fv, uu____10517) in
                     FStar_Reflection_Data.Pat_Cons uu____10506
                 | FStar_Syntax_Syntax.Pat_var bv ->
                     FStar_Reflection_Data.Pat_Var bv
                 | FStar_Syntax_Syntax.Pat_wild bv ->
                     FStar_Reflection_Data.Pat_Wild bv
                 | FStar_Syntax_Syntax.Pat_dot_term (bv, t5) ->
                     FStar_Reflection_Data.Pat_Dot_Term (bv, t5) in
               let brs1 = FStar_List.map FStar_Syntax_Subst.open_branch brs in
               let brs2 =
                 FStar_List.map
                   (fun uu___7_10649 ->
                      match uu___7_10649 with
                      | (pat, uu____10671, t5) ->
                          let uu____10689 = inspect_pat pat in
                          (uu____10689, t5)) brs1 in
               FStar_All.pipe_left FStar_Tactics_Monad.ret
                 (FStar_Reflection_Data.Tv_Match (t4, brs2))
           | FStar_Syntax_Syntax.Tm_unknown ->
               FStar_All.pipe_left FStar_Tactics_Monad.ret
                 FStar_Reflection_Data.Tv_Unknown
           | uu____10698 ->
               ((let uu____10700 =
                   let uu____10705 =
                     let uu____10706 = FStar_Syntax_Print.tag_of_term t3 in
                     let uu____10707 = term_to_string e t3 in
                     FStar_Util.format2
                       "inspect: outside of expected syntax (%s, %s)\n"
                       uu____10706 uu____10707 in
                   (FStar_Errors.Warning_CantInspect, uu____10705) in
                 FStar_Errors.log_issue t3.FStar_Syntax_Syntax.pos
                   uu____10700);
                FStar_All.pipe_left FStar_Tactics_Monad.ret
                  FStar_Reflection_Data.Tv_Unknown)) in
    FStar_Tactics_Monad.wrap_err "inspect" uu____9877
let (pack :
  FStar_Reflection_Data.term_view ->
    FStar_Syntax_Syntax.term FStar_Tactics_Monad.tac)
  =
  fun tv ->
    match tv with
    | FStar_Reflection_Data.Tv_Var bv ->
        let uu____10720 = FStar_Syntax_Syntax.bv_to_name bv in
        FStar_All.pipe_left FStar_Tactics_Monad.ret uu____10720
    | FStar_Reflection_Data.Tv_BVar bv ->
        let uu____10724 = FStar_Syntax_Syntax.bv_to_tm bv in
        FStar_All.pipe_left FStar_Tactics_Monad.ret uu____10724
    | FStar_Reflection_Data.Tv_FVar fv ->
        let uu____10728 = FStar_Syntax_Syntax.fv_to_tm fv in
        FStar_All.pipe_left FStar_Tactics_Monad.ret uu____10728
    | FStar_Reflection_Data.Tv_App (l, (r, q)) ->
        let q' = FStar_Reflection_Basic.pack_aqual q in
        let uu____10735 = FStar_Syntax_Util.mk_app l [(r, q')] in
        FStar_All.pipe_left FStar_Tactics_Monad.ret uu____10735
    | FStar_Reflection_Data.Tv_Abs (b, t) ->
        let uu____10760 =
          FStar_Syntax_Util.abs [b] t FStar_Pervasives_Native.None in
        FStar_All.pipe_left FStar_Tactics_Monad.ret uu____10760
    | FStar_Reflection_Data.Tv_Arrow (b, c) ->
        let uu____10777 = FStar_Syntax_Util.arrow [b] c in
        FStar_All.pipe_left FStar_Tactics_Monad.ret uu____10777
    | FStar_Reflection_Data.Tv_Type () ->
        FStar_All.pipe_left FStar_Tactics_Monad.ret FStar_Syntax_Util.ktype
    | FStar_Reflection_Data.Tv_Refine (bv, t) ->
        let uu____10796 = FStar_Syntax_Util.refine bv t in
        FStar_All.pipe_left FStar_Tactics_Monad.ret uu____10796
    | FStar_Reflection_Data.Tv_Const c ->
        let uu____10800 =
          let uu____10801 =
            let uu____10802 = FStar_Reflection_Basic.pack_const c in
            FStar_Syntax_Syntax.Tm_constant uu____10802 in
          FStar_Syntax_Syntax.mk uu____10801 FStar_Range.dummyRange in
        FStar_All.pipe_left FStar_Tactics_Monad.ret uu____10800
    | FStar_Reflection_Data.Tv_Uvar (_u, ctx_u_s) ->
        let uu____10807 =
          FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_uvar ctx_u_s)
            FStar_Range.dummyRange in
        FStar_All.pipe_left FStar_Tactics_Monad.ret uu____10807
    | FStar_Reflection_Data.Tv_Let (false, attrs, bv, t1, t2) ->
        let lb =
          FStar_Syntax_Util.mk_letbinding (FStar_Util.Inl bv) []
            bv.FStar_Syntax_Syntax.sort FStar_Parser_Const.effect_Tot_lid t1
            attrs FStar_Range.dummyRange in
        let uu____10819 =
          let uu____10820 =
            let uu____10821 =
              let uu____10834 =
                let uu____10837 =
                  let uu____10838 = FStar_Syntax_Syntax.mk_binder bv in
                  [uu____10838] in
                FStar_Syntax_Subst.close uu____10837 t2 in
              ((false, [lb]), uu____10834) in
            FStar_Syntax_Syntax.Tm_let uu____10821 in
          FStar_Syntax_Syntax.mk uu____10820 FStar_Range.dummyRange in
        FStar_All.pipe_left FStar_Tactics_Monad.ret uu____10819
    | FStar_Reflection_Data.Tv_Let (true, attrs, bv, t1, t2) ->
        let lb =
          FStar_Syntax_Util.mk_letbinding (FStar_Util.Inl bv) []
            bv.FStar_Syntax_Syntax.sort FStar_Parser_Const.effect_Tot_lid t1
            attrs FStar_Range.dummyRange in
        let uu____10878 = FStar_Syntax_Subst.close_let_rec [lb] t2 in
        (match uu____10878 with
         | (lbs, body) ->
             let uu____10893 =
               FStar_Syntax_Syntax.mk
                 (FStar_Syntax_Syntax.Tm_let ((true, lbs), body))
                 FStar_Range.dummyRange in
             FStar_All.pipe_left FStar_Tactics_Monad.ret uu____10893)
    | FStar_Reflection_Data.Tv_Match (t, brs) ->
        let wrap v =
          {
            FStar_Syntax_Syntax.v = v;
            FStar_Syntax_Syntax.p = FStar_Range.dummyRange
          } in
        let rec pack_pat p =
          match p with
          | FStar_Reflection_Data.Pat_Constant c ->
              let uu____10927 =
                let uu____10928 = FStar_Reflection_Basic.pack_const c in
                FStar_Syntax_Syntax.Pat_constant uu____10928 in
              FStar_All.pipe_left wrap uu____10927
          | FStar_Reflection_Data.Pat_Cons (fv, ps) ->
              let uu____10943 =
                let uu____10944 =
                  let uu____10957 =
                    FStar_List.map
                      (fun uu____10978 ->
                         match uu____10978 with
                         | (p1, b) ->
                             let uu____10989 = pack_pat p1 in
                             (uu____10989, b)) ps in
                  (fv, uu____10957) in
                FStar_Syntax_Syntax.Pat_cons uu____10944 in
              FStar_All.pipe_left wrap uu____10943
          | FStar_Reflection_Data.Pat_Var bv ->
              FStar_All.pipe_left wrap (FStar_Syntax_Syntax.Pat_var bv)
          | FStar_Reflection_Data.Pat_Wild bv ->
              FStar_All.pipe_left wrap (FStar_Syntax_Syntax.Pat_wild bv)
          | FStar_Reflection_Data.Pat_Dot_Term (bv, t1) ->
              FStar_All.pipe_left wrap
                (FStar_Syntax_Syntax.Pat_dot_term (bv, t1)) in
        let brs1 =
          FStar_List.map
            (fun uu___8_11035 ->
               match uu___8_11035 with
               | (pat, t1) ->
                   let uu____11052 = pack_pat pat in
                   (uu____11052, FStar_Pervasives_Native.None, t1)) brs in
        let brs2 = FStar_List.map FStar_Syntax_Subst.close_branch brs1 in
        let uu____11100 =
          FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_match (t, brs2))
            FStar_Range.dummyRange in
        FStar_All.pipe_left FStar_Tactics_Monad.ret uu____11100
    | FStar_Reflection_Data.Tv_AscribedT (e, t, tacopt) ->
        let uu____11128 =
          FStar_Syntax_Syntax.mk
            (FStar_Syntax_Syntax.Tm_ascribed
               (e, ((FStar_Util.Inl t), tacopt),
                 FStar_Pervasives_Native.None)) FStar_Range.dummyRange in
        FStar_All.pipe_left FStar_Tactics_Monad.ret uu____11128
    | FStar_Reflection_Data.Tv_AscribedC (e, c, tacopt) ->
        let uu____11174 =
          FStar_Syntax_Syntax.mk
            (FStar_Syntax_Syntax.Tm_ascribed
               (e, ((FStar_Util.Inr c), tacopt),
                 FStar_Pervasives_Native.None)) FStar_Range.dummyRange in
        FStar_All.pipe_left FStar_Tactics_Monad.ret uu____11174
    | FStar_Reflection_Data.Tv_Unknown ->
        let uu____11213 =
          FStar_Syntax_Syntax.mk FStar_Syntax_Syntax.Tm_unknown
            FStar_Range.dummyRange in
        FStar_All.pipe_left FStar_Tactics_Monad.ret uu____11213
let (lget :
  FStar_Reflection_Data.typ ->
    Prims.string -> FStar_Syntax_Syntax.term FStar_Tactics_Monad.tac)
  =
  fun ty ->
    fun k ->
      let uu____11230 =
        FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
          (fun ps ->
             let uu____11236 =
               FStar_Util.psmap_try_find ps.FStar_Tactics_Types.local_state k in
             match uu____11236 with
             | FStar_Pervasives_Native.None ->
                 FStar_Tactics_Monad.fail "not found"
             | FStar_Pervasives_Native.Some t -> unquote ty t) in
      FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "lget") uu____11230
let (lset :
  FStar_Reflection_Data.typ ->
    Prims.string -> FStar_Syntax_Syntax.term -> unit FStar_Tactics_Monad.tac)
  =
  fun _ty ->
    fun k ->
      fun t ->
        let uu____11265 =
          FStar_Tactics_Monad.bind FStar_Tactics_Monad.get
            (fun ps ->
               let ps1 =
                 let uu___1676_11272 = ps in
                 let uu____11273 =
                   FStar_Util.psmap_add ps.FStar_Tactics_Types.local_state k
                     t in
                 {
                   FStar_Tactics_Types.main_context =
                     (uu___1676_11272.FStar_Tactics_Types.main_context);
                   FStar_Tactics_Types.all_implicits =
                     (uu___1676_11272.FStar_Tactics_Types.all_implicits);
                   FStar_Tactics_Types.goals =
                     (uu___1676_11272.FStar_Tactics_Types.goals);
                   FStar_Tactics_Types.smt_goals =
                     (uu___1676_11272.FStar_Tactics_Types.smt_goals);
                   FStar_Tactics_Types.depth =
                     (uu___1676_11272.FStar_Tactics_Types.depth);
                   FStar_Tactics_Types.__dump =
                     (uu___1676_11272.FStar_Tactics_Types.__dump);
                   FStar_Tactics_Types.psc =
                     (uu___1676_11272.FStar_Tactics_Types.psc);
                   FStar_Tactics_Types.entry_range =
                     (uu___1676_11272.FStar_Tactics_Types.entry_range);
                   FStar_Tactics_Types.guard_policy =
                     (uu___1676_11272.FStar_Tactics_Types.guard_policy);
                   FStar_Tactics_Types.freshness =
                     (uu___1676_11272.FStar_Tactics_Types.freshness);
                   FStar_Tactics_Types.tac_verb_dbg =
                     (uu___1676_11272.FStar_Tactics_Types.tac_verb_dbg);
                   FStar_Tactics_Types.local_state = uu____11273
                 } in
               FStar_Tactics_Monad.set ps1) in
        FStar_All.pipe_left (FStar_Tactics_Monad.wrap_err "lset") uu____11265
let (tac_env : FStar_TypeChecker_Env.env -> FStar_TypeChecker_Env.env) =
  fun env1 ->
    let uu____11285 = FStar_TypeChecker_Env.clear_expected_typ env1 in
    match uu____11285 with
    | (env2, uu____11293) ->
        let env3 =
          let uu___1683_11299 = env2 in
          {
            FStar_TypeChecker_Env.solver =
              (uu___1683_11299.FStar_TypeChecker_Env.solver);
            FStar_TypeChecker_Env.range =
              (uu___1683_11299.FStar_TypeChecker_Env.range);
            FStar_TypeChecker_Env.curmodule =
              (uu___1683_11299.FStar_TypeChecker_Env.curmodule);
            FStar_TypeChecker_Env.gamma =
              (uu___1683_11299.FStar_TypeChecker_Env.gamma);
            FStar_TypeChecker_Env.gamma_sig =
              (uu___1683_11299.FStar_TypeChecker_Env.gamma_sig);
            FStar_TypeChecker_Env.gamma_cache =
              (uu___1683_11299.FStar_TypeChecker_Env.gamma_cache);
            FStar_TypeChecker_Env.modules =
              (uu___1683_11299.FStar_TypeChecker_Env.modules);
            FStar_TypeChecker_Env.expected_typ =
              (uu___1683_11299.FStar_TypeChecker_Env.expected_typ);
            FStar_TypeChecker_Env.sigtab =
              (uu___1683_11299.FStar_TypeChecker_Env.sigtab);
            FStar_TypeChecker_Env.attrtab =
              (uu___1683_11299.FStar_TypeChecker_Env.attrtab);
            FStar_TypeChecker_Env.instantiate_imp = false;
            FStar_TypeChecker_Env.effects =
              (uu___1683_11299.FStar_TypeChecker_Env.effects);
            FStar_TypeChecker_Env.generalize =
              (uu___1683_11299.FStar_TypeChecker_Env.generalize);
            FStar_TypeChecker_Env.letrecs =
              (uu___1683_11299.FStar_TypeChecker_Env.letrecs);
            FStar_TypeChecker_Env.top_level =
              (uu___1683_11299.FStar_TypeChecker_Env.top_level);
            FStar_TypeChecker_Env.check_uvars =
              (uu___1683_11299.FStar_TypeChecker_Env.check_uvars);
            FStar_TypeChecker_Env.use_eq =
              (uu___1683_11299.FStar_TypeChecker_Env.use_eq);
            FStar_TypeChecker_Env.use_eq_strict =
              (uu___1683_11299.FStar_TypeChecker_Env.use_eq_strict);
            FStar_TypeChecker_Env.is_iface =
              (uu___1683_11299.FStar_TypeChecker_Env.is_iface);
            FStar_TypeChecker_Env.admit =
              (uu___1683_11299.FStar_TypeChecker_Env.admit);
            FStar_TypeChecker_Env.lax =
              (uu___1683_11299.FStar_TypeChecker_Env.lax);
            FStar_TypeChecker_Env.lax_universes =
              (uu___1683_11299.FStar_TypeChecker_Env.lax_universes);
            FStar_TypeChecker_Env.phase1 =
              (uu___1683_11299.FStar_TypeChecker_Env.phase1);
            FStar_TypeChecker_Env.failhard =
              (uu___1683_11299.FStar_TypeChecker_Env.failhard);
            FStar_TypeChecker_Env.nosynth =
              (uu___1683_11299.FStar_TypeChecker_Env.nosynth);
            FStar_TypeChecker_Env.uvar_subtyping =
              (uu___1683_11299.FStar_TypeChecker_Env.uvar_subtyping);
            FStar_TypeChecker_Env.tc_term =
              (uu___1683_11299.FStar_TypeChecker_Env.tc_term);
            FStar_TypeChecker_Env.type_of =
              (uu___1683_11299.FStar_TypeChecker_Env.type_of);
            FStar_TypeChecker_Env.universe_of =
              (uu___1683_11299.FStar_TypeChecker_Env.universe_of);
            FStar_TypeChecker_Env.check_type_of =
              (uu___1683_11299.FStar_TypeChecker_Env.check_type_of);
            FStar_TypeChecker_Env.use_bv_sorts =
              (uu___1683_11299.FStar_TypeChecker_Env.use_bv_sorts);
            FStar_TypeChecker_Env.qtbl_name_and_index =
              (uu___1683_11299.FStar_TypeChecker_Env.qtbl_name_and_index);
            FStar_TypeChecker_Env.normalized_eff_names =
              (uu___1683_11299.FStar_TypeChecker_Env.normalized_eff_names);
            FStar_TypeChecker_Env.fv_delta_depths =
              (uu___1683_11299.FStar_TypeChecker_Env.fv_delta_depths);
            FStar_TypeChecker_Env.proof_ns =
              (uu___1683_11299.FStar_TypeChecker_Env.proof_ns);
            FStar_TypeChecker_Env.synth_hook =
              (uu___1683_11299.FStar_TypeChecker_Env.synth_hook);
            FStar_TypeChecker_Env.try_solve_implicits_hook =
              (uu___1683_11299.FStar_TypeChecker_Env.try_solve_implicits_hook);
            FStar_TypeChecker_Env.splice =
              (uu___1683_11299.FStar_TypeChecker_Env.splice);
            FStar_TypeChecker_Env.mpreprocess =
              (uu___1683_11299.FStar_TypeChecker_Env.mpreprocess);
            FStar_TypeChecker_Env.postprocess =
              (uu___1683_11299.FStar_TypeChecker_Env.postprocess);
            FStar_TypeChecker_Env.identifier_info =
              (uu___1683_11299.FStar_TypeChecker_Env.identifier_info);
            FStar_TypeChecker_Env.tc_hooks =
              (uu___1683_11299.FStar_TypeChecker_Env.tc_hooks);
            FStar_TypeChecker_Env.dsenv =
              (uu___1683_11299.FStar_TypeChecker_Env.dsenv);
            FStar_TypeChecker_Env.nbe =
              (uu___1683_11299.FStar_TypeChecker_Env.nbe);
            FStar_TypeChecker_Env.strict_args_tab =
              (uu___1683_11299.FStar_TypeChecker_Env.strict_args_tab);
            FStar_TypeChecker_Env.erasable_types_tab =
              (uu___1683_11299.FStar_TypeChecker_Env.erasable_types_tab);
            FStar_TypeChecker_Env.enable_defer_to_tac =
              (uu___1683_11299.FStar_TypeChecker_Env.enable_defer_to_tac)
          } in
        let env4 =
          let uu___1686_11301 = env3 in
          {
            FStar_TypeChecker_Env.solver =
              (uu___1686_11301.FStar_TypeChecker_Env.solver);
            FStar_TypeChecker_Env.range =
              (uu___1686_11301.FStar_TypeChecker_Env.range);
            FStar_TypeChecker_Env.curmodule =
              (uu___1686_11301.FStar_TypeChecker_Env.curmodule);
            FStar_TypeChecker_Env.gamma =
              (uu___1686_11301.FStar_TypeChecker_Env.gamma);
            FStar_TypeChecker_Env.gamma_sig =
              (uu___1686_11301.FStar_TypeChecker_Env.gamma_sig);
            FStar_TypeChecker_Env.gamma_cache =
              (uu___1686_11301.FStar_TypeChecker_Env.gamma_cache);
            FStar_TypeChecker_Env.modules =
              (uu___1686_11301.FStar_TypeChecker_Env.modules);
            FStar_TypeChecker_Env.expected_typ =
              (uu___1686_11301.FStar_TypeChecker_Env.expected_typ);
            FStar_TypeChecker_Env.sigtab =
              (uu___1686_11301.FStar_TypeChecker_Env.sigtab);
            FStar_TypeChecker_Env.attrtab =
              (uu___1686_11301.FStar_TypeChecker_Env.attrtab);
            FStar_TypeChecker_Env.instantiate_imp =
              (uu___1686_11301.FStar_TypeChecker_Env.instantiate_imp);
            FStar_TypeChecker_Env.effects =
              (uu___1686_11301.FStar_TypeChecker_Env.effects);
            FStar_TypeChecker_Env.generalize =
              (uu___1686_11301.FStar_TypeChecker_Env.generalize);
            FStar_TypeChecker_Env.letrecs =
              (uu___1686_11301.FStar_TypeChecker_Env.letrecs);
            FStar_TypeChecker_Env.top_level =
              (uu___1686_11301.FStar_TypeChecker_Env.top_level);
            FStar_TypeChecker_Env.check_uvars =
              (uu___1686_11301.FStar_TypeChecker_Env.check_uvars);
            FStar_TypeChecker_Env.use_eq =
              (uu___1686_11301.FStar_TypeChecker_Env.use_eq);
            FStar_TypeChecker_Env.use_eq_strict =
              (uu___1686_11301.FStar_TypeChecker_Env.use_eq_strict);
            FStar_TypeChecker_Env.is_iface =
              (uu___1686_11301.FStar_TypeChecker_Env.is_iface);
            FStar_TypeChecker_Env.admit =
              (uu___1686_11301.FStar_TypeChecker_Env.admit);
            FStar_TypeChecker_Env.lax =
              (uu___1686_11301.FStar_TypeChecker_Env.lax);
            FStar_TypeChecker_Env.lax_universes =
              (uu___1686_11301.FStar_TypeChecker_Env.lax_universes);
            FStar_TypeChecker_Env.phase1 =
              (uu___1686_11301.FStar_TypeChecker_Env.phase1);
            FStar_TypeChecker_Env.failhard = true;
            FStar_TypeChecker_Env.nosynth =
              (uu___1686_11301.FStar_TypeChecker_Env.nosynth);
            FStar_TypeChecker_Env.uvar_subtyping =
              (uu___1686_11301.FStar_TypeChecker_Env.uvar_subtyping);
            FStar_TypeChecker_Env.tc_term =
              (uu___1686_11301.FStar_TypeChecker_Env.tc_term);
            FStar_TypeChecker_Env.type_of =
              (uu___1686_11301.FStar_TypeChecker_Env.type_of);
            FStar_TypeChecker_Env.universe_of =
              (uu___1686_11301.FStar_TypeChecker_Env.universe_of);
            FStar_TypeChecker_Env.check_type_of =
              (uu___1686_11301.FStar_TypeChecker_Env.check_type_of);
            FStar_TypeChecker_Env.use_bv_sorts =
              (uu___1686_11301.FStar_TypeChecker_Env.use_bv_sorts);
            FStar_TypeChecker_Env.qtbl_name_and_index =
              (uu___1686_11301.FStar_TypeChecker_Env.qtbl_name_and_index);
            FStar_TypeChecker_Env.normalized_eff_names =
              (uu___1686_11301.FStar_TypeChecker_Env.normalized_eff_names);
            FStar_TypeChecker_Env.fv_delta_depths =
              (uu___1686_11301.FStar_TypeChecker_Env.fv_delta_depths);
            FStar_TypeChecker_Env.proof_ns =
              (uu___1686_11301.FStar_TypeChecker_Env.proof_ns);
            FStar_TypeChecker_Env.synth_hook =
              (uu___1686_11301.FStar_TypeChecker_Env.synth_hook);
            FStar_TypeChecker_Env.try_solve_implicits_hook =
              (uu___1686_11301.FStar_TypeChecker_Env.try_solve_implicits_hook);
            FStar_TypeChecker_Env.splice =
              (uu___1686_11301.FStar_TypeChecker_Env.splice);
            FStar_TypeChecker_Env.mpreprocess =
              (uu___1686_11301.FStar_TypeChecker_Env.mpreprocess);
            FStar_TypeChecker_Env.postprocess =
              (uu___1686_11301.FStar_TypeChecker_Env.postprocess);
            FStar_TypeChecker_Env.identifier_info =
              (uu___1686_11301.FStar_TypeChecker_Env.identifier_info);
            FStar_TypeChecker_Env.tc_hooks =
              (uu___1686_11301.FStar_TypeChecker_Env.tc_hooks);
            FStar_TypeChecker_Env.dsenv =
              (uu___1686_11301.FStar_TypeChecker_Env.dsenv);
            FStar_TypeChecker_Env.nbe =
              (uu___1686_11301.FStar_TypeChecker_Env.nbe);
            FStar_TypeChecker_Env.strict_args_tab =
              (uu___1686_11301.FStar_TypeChecker_Env.strict_args_tab);
            FStar_TypeChecker_Env.erasable_types_tab =
              (uu___1686_11301.FStar_TypeChecker_Env.erasable_types_tab);
            FStar_TypeChecker_Env.enable_defer_to_tac =
              (uu___1686_11301.FStar_TypeChecker_Env.enable_defer_to_tac)
          } in
        env4
let (proofstate_of_goals :
  FStar_Range.range ->
    env ->
      FStar_Tactics_Types.goal Prims.list ->
        FStar_TypeChecker_Common.implicit Prims.list ->
          FStar_Tactics_Types.proofstate)
  =
  fun rng ->
    fun env1 ->
      fun goals ->
        fun imps ->
          let env2 = tac_env env1 in
          let ps =
            let uu____11332 =
              FStar_TypeChecker_Env.debug env2
                (FStar_Options.Other "TacVerbose") in
            let uu____11333 = FStar_Util.psmap_empty () in
            {
              FStar_Tactics_Types.main_context = env2;
              FStar_Tactics_Types.all_implicits = imps;
              FStar_Tactics_Types.goals = goals;
              FStar_Tactics_Types.smt_goals = [];
              FStar_Tactics_Types.depth = Prims.int_zero;
              FStar_Tactics_Types.__dump =
                FStar_Tactics_Printing.do_dump_proofstate;
              FStar_Tactics_Types.psc = FStar_TypeChecker_Cfg.null_psc;
              FStar_Tactics_Types.entry_range = rng;
              FStar_Tactics_Types.guard_policy = FStar_Tactics_Types.SMT;
              FStar_Tactics_Types.freshness = Prims.int_zero;
              FStar_Tactics_Types.tac_verb_dbg = uu____11332;
              FStar_Tactics_Types.local_state = uu____11333
            } in
          ps
let (proofstate_of_goal_ty :
  FStar_Range.range ->
    env ->
      FStar_Reflection_Data.typ ->
        (FStar_Tactics_Types.proofstate * FStar_Syntax_Syntax.term))
  =
  fun rng ->
    fun env1 ->
      fun typ ->
        let env2 = tac_env env1 in
        let uu____11356 = FStar_Tactics_Types.goal_of_goal_ty env2 typ in
        match uu____11356 with
        | (g, g_u) ->
            let ps =
              proofstate_of_goals rng env2 [g]
                g_u.FStar_TypeChecker_Common.implicits in
            let uu____11368 = FStar_Tactics_Types.goal_witness g in
            (ps, uu____11368)
let (proofstate_of_all_implicits :
  FStar_Range.range ->
    env ->
      implicits ->
        (FStar_Tactics_Types.proofstate * FStar_Syntax_Syntax.term))
  =
  fun rng ->
    fun env1 ->
      fun imps ->
        let env2 = tac_env env1 in
        let goals =
          FStar_List.map (FStar_Tactics_Types.goal_of_implicit env2) imps in
        let w =
          let uu____11393 = FStar_List.hd goals in
          FStar_Tactics_Types.goal_witness uu____11393 in
        let ps =
          let uu____11395 =
            FStar_TypeChecker_Env.debug env2
              (FStar_Options.Other "TacVerbose") in
          let uu____11396 = FStar_Util.psmap_empty () in
          {
            FStar_Tactics_Types.main_context = env2;
            FStar_Tactics_Types.all_implicits = imps;
            FStar_Tactics_Types.goals = goals;
            FStar_Tactics_Types.smt_goals = [];
            FStar_Tactics_Types.depth = Prims.int_zero;
            FStar_Tactics_Types.__dump =
              (fun ps ->
                 fun msg -> FStar_Tactics_Printing.do_dump_proofstate ps msg);
            FStar_Tactics_Types.psc = FStar_TypeChecker_Cfg.null_psc;
            FStar_Tactics_Types.entry_range = rng;
            FStar_Tactics_Types.guard_policy = FStar_Tactics_Types.SMT;
            FStar_Tactics_Types.freshness = Prims.int_zero;
            FStar_Tactics_Types.tac_verb_dbg = uu____11395;
            FStar_Tactics_Types.local_state = uu____11396
          } in
        (ps, w)