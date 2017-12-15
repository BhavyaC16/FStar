
open Prims
open FStar_Pervasives

type name =
FStar_Syntax_Syntax.bv


type env =
FStar_TypeChecker_Env.env


type implicits =
FStar_TypeChecker_Env.implicits


let normalize : FStar_TypeChecker_Normalize.step Prims.list  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun s e t -> (FStar_TypeChecker_Normalize.normalize_with_primitive_steps FStar_Reflection_Interpreter.reflection_primops s e t))


let bnorm : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun e t -> (normalize [] e t))

exception TacFailure of (Prims.string)


let uu___is_TacFailure : Prims.exn  ->  Prims.bool = (fun projectee -> (match (projectee) with
| TacFailure (uu____32) -> begin
true
end
| uu____33 -> begin
false
end))


let __proj__TacFailure__item__uu___ : Prims.exn  ->  Prims.string = (fun projectee -> (match (projectee) with
| TacFailure (uu____41) -> begin
uu____41
end))

type 'a tac =
{tac_f : FStar_Tactics_Types.proofstate  ->  'a FStar_Tactics_Result.__result}


let __proj__Mktac__item__tac_f : 'a . 'a tac  ->  FStar_Tactics_Types.proofstate  ->  'a FStar_Tactics_Result.__result = (fun projectee -> (match (projectee) with
| {tac_f = __fname__tac_f} -> begin
__fname__tac_f
end))


let mk_tac : 'a . (FStar_Tactics_Types.proofstate  ->  'a FStar_Tactics_Result.__result)  ->  'a tac = (fun f -> {tac_f = f})


let run : 'Auu____105 . 'Auu____105 tac  ->  FStar_Tactics_Types.proofstate  ->  'Auu____105 FStar_Tactics_Result.__result = (fun t p -> (t.tac_f p))


let ret : 'a . 'a  ->  'a tac = (fun x -> (mk_tac (fun p -> FStar_Tactics_Result.Success (((x), (p))))))


let bind : 'a 'b . 'a tac  ->  ('a  ->  'b tac)  ->  'b tac = (fun t1 t2 -> (mk_tac (fun p -> (

let uu____172 = (run t1 p)
in (match (uu____172) with
| FStar_Tactics_Result.Success (a, q) -> begin
(

let uu____179 = (t2 a)
in (run uu____179 q))
end
| FStar_Tactics_Result.Failed (msg, q) -> begin
FStar_Tactics_Result.Failed (((msg), (q)))
end)))))


let idtac : Prims.unit tac = (ret ())


let goal_to_string : FStar_Tactics_Types.goal  ->  Prims.string = (fun g -> (

let g_binders = (

let uu____191 = (FStar_TypeChecker_Env.all_binders g.FStar_Tactics_Types.context)
in (FStar_All.pipe_right uu____191 (FStar_Syntax_Print.binders_to_string ", ")))
in (

let w = (bnorm g.FStar_Tactics_Types.context g.FStar_Tactics_Types.witness)
in (

let t = (bnorm g.FStar_Tactics_Types.context g.FStar_Tactics_Types.goal_ty)
in (

let uu____194 = (FStar_Syntax_Print.term_to_string w)
in (

let uu____195 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.format3 "%s |- %s : %s" g_binders uu____194 uu____195)))))))


let tacprint : Prims.string  ->  Prims.unit = (fun s -> (FStar_Util.print1 "TAC>> %s\n" s))


let tacprint1 : Prims.string  ->  Prims.string  ->  Prims.unit = (fun s x -> (

let uu____208 = (FStar_Util.format1 s x)
in (FStar_Util.print1 "TAC>> %s\n" uu____208)))


let tacprint2 : Prims.string  ->  Prims.string  ->  Prims.string  ->  Prims.unit = (fun s x y -> (

let uu____221 = (FStar_Util.format2 s x y)
in (FStar_Util.print1 "TAC>> %s\n" uu____221)))


let tacprint3 : Prims.string  ->  Prims.string  ->  Prims.string  ->  Prims.string  ->  Prims.unit = (fun s x y z -> (

let uu____238 = (FStar_Util.format3 s x y z)
in (FStar_Util.print1 "TAC>> %s\n" uu____238)))


let comp_to_typ : FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.typ = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (t, uu____244) -> begin
t
end
| FStar_Syntax_Syntax.GTotal (t, uu____254) -> begin
t
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
ct.FStar_Syntax_Syntax.result_typ
end))


let is_irrelevant : FStar_Tactics_Types.goal  ->  Prims.bool = (fun g -> (

let uu____268 = (

let uu____273 = (FStar_TypeChecker_Normalize.unfold_whnf g.FStar_Tactics_Types.context g.FStar_Tactics_Types.goal_ty)
in (FStar_Syntax_Util.un_squash uu____273))
in (match (uu____268) with
| FStar_Pervasives_Native.Some (t) -> begin
true
end
| uu____279 -> begin
false
end)))


let dump_goal : 'Auu____290 . 'Auu____290  ->  FStar_Tactics_Types.goal  ->  Prims.unit = (fun ps goal -> (

let uu____300 = (goal_to_string goal)
in (tacprint uu____300)))


let dump_cur : FStar_Tactics_Types.proofstate  ->  Prims.string  ->  Prims.unit = (fun ps msg -> (match (ps.FStar_Tactics_Types.goals) with
| [] -> begin
(tacprint1 "No more goals (%s)" msg)
end
| (h)::uu____310 -> begin
((tacprint1 "Current goal (%s):" msg);
(

let uu____314 = (FStar_List.hd ps.FStar_Tactics_Types.goals)
in (dump_goal ps uu____314));
)
end))


let ps_to_string : (Prims.string * FStar_Tactics_Types.proofstate)  ->  Prims.string = (fun uu____322 -> (match (uu____322) with
| (msg, ps) -> begin
(

let uu____329 = (FStar_Util.string_of_int (FStar_List.length ps.FStar_Tactics_Types.goals))
in (

let uu____330 = (

let uu____331 = (FStar_List.map goal_to_string ps.FStar_Tactics_Types.goals)
in (FStar_String.concat "\n" uu____331))
in (

let uu____334 = (FStar_Util.string_of_int (FStar_List.length ps.FStar_Tactics_Types.smt_goals))
in (

let uu____335 = (

let uu____336 = (FStar_List.map goal_to_string ps.FStar_Tactics_Types.smt_goals)
in (FStar_String.concat "\n" uu____336))
in (FStar_Util.format5 "State dump (%s):\nACTIVE goals (%s):\n%s\nSMT goals (%s):\n%s" msg uu____329 uu____330 uu____334 uu____335)))))
end))


let goal_to_json : FStar_Tactics_Types.goal  ->  FStar_Util.json = (fun g -> (

let g_binders = (

let uu____344 = (FStar_TypeChecker_Env.all_binders g.FStar_Tactics_Types.context)
in (FStar_All.pipe_right uu____344 FStar_Syntax_Print.binders_to_json))
in (

let uu____345 = (

let uu____352 = (

let uu____359 = (

let uu____364 = (

let uu____365 = (

let uu____372 = (

let uu____377 = (

let uu____378 = (FStar_Syntax_Print.term_to_string g.FStar_Tactics_Types.witness)
in FStar_Util.JsonStr (uu____378))
in (("witness"), (uu____377)))
in (

let uu____379 = (

let uu____386 = (

let uu____391 = (

let uu____392 = (FStar_Syntax_Print.term_to_string g.FStar_Tactics_Types.goal_ty)
in FStar_Util.JsonStr (uu____392))
in (("type"), (uu____391)))
in (uu____386)::[])
in (uu____372)::uu____379))
in FStar_Util.JsonAssoc (uu____365))
in (("goal"), (uu____364)))
in (uu____359)::[])
in ((("hyps"), (g_binders)))::uu____352)
in FStar_Util.JsonAssoc (uu____345))))


let ps_to_json : (Prims.string * FStar_Tactics_Types.proofstate)  ->  FStar_Util.json = (fun uu____424 -> (match (uu____424) with
| (msg, ps) -> begin
(

let uu____431 = (

let uu____438 = (

let uu____445 = (

let uu____450 = (

let uu____451 = (FStar_List.map goal_to_json ps.FStar_Tactics_Types.goals)
in FStar_Util.JsonList (uu____451))
in (("goals"), (uu____450)))
in (

let uu____454 = (

let uu____461 = (

let uu____466 = (

let uu____467 = (FStar_List.map goal_to_json ps.FStar_Tactics_Types.smt_goals)
in FStar_Util.JsonList (uu____467))
in (("smt-goals"), (uu____466)))
in (uu____461)::[])
in (uu____445)::uu____454))
in ((("label"), (FStar_Util.JsonStr (msg))))::uu____438)
in FStar_Util.JsonAssoc (uu____431))
end))


let dump_proofstate : FStar_Tactics_Types.proofstate  ->  Prims.string  ->  Prims.unit = (fun ps msg -> (FStar_Options.with_saved_options (fun uu____496 -> ((FStar_Options.set_option "print_effect_args" (FStar_Options.Bool (true)));
(FStar_Util.print_generic "proof-state" ps_to_string ps_to_json ((msg), (ps)));
))))


let print_proof_state1 : Prims.string  ->  Prims.unit tac = (fun msg -> (mk_tac (fun p -> ((dump_cur p msg);
FStar_Tactics_Result.Success (((()), (p)));
))))


let print_proof_state : Prims.string  ->  Prims.unit tac = (fun msg -> (mk_tac (fun p -> ((dump_proofstate p msg);
FStar_Tactics_Result.Success (((()), (p)));
))))


let get : FStar_Tactics_Types.proofstate tac = (mk_tac (fun p -> FStar_Tactics_Result.Success (((p), (p)))))


let tac_verb_dbg : Prims.bool FStar_Pervasives_Native.option FStar_ST.ref = (FStar_Util.mk_ref FStar_Pervasives_Native.None)


let rec log : FStar_Tactics_Types.proofstate  ->  (Prims.unit  ->  Prims.unit)  ->  Prims.unit = (fun ps f -> (

let uu____556 = (FStar_ST.op_Bang tac_verb_dbg)
in (match (uu____556) with
| FStar_Pervasives_Native.None -> begin
((

let uu____578 = (

let uu____581 = (FStar_TypeChecker_Env.debug ps.FStar_Tactics_Types.main_context (FStar_Options.Other ("TacVerbose")))
in FStar_Pervasives_Native.Some (uu____581))
in (FStar_ST.op_Colon_Equals tac_verb_dbg uu____578));
(log ps f);
)
end
| FStar_Pervasives_Native.Some (true) -> begin
(f ())
end
| FStar_Pervasives_Native.Some (false) -> begin
()
end)))


let mlog : (Prims.unit  ->  Prims.unit)  ->  Prims.unit tac = (fun f -> (bind get (fun ps -> ((log ps f);
(ret ());
))))


let fail : 'Auu____621 . Prims.string  ->  'Auu____621 tac = (fun msg -> (mk_tac (fun ps -> ((

let uu____632 = (FStar_TypeChecker_Env.debug ps.FStar_Tactics_Types.main_context (FStar_Options.Other ("TacFail")))
in (match (uu____632) with
| true -> begin
(dump_proofstate ps (Prims.strcat "TACTING FAILING: " msg))
end
| uu____633 -> begin
()
end));
FStar_Tactics_Result.Failed (((msg), (ps)));
))))


let fail1 : 'Auu____640 . Prims.string  ->  Prims.string  ->  'Auu____640 tac = (fun msg x -> (

let uu____651 = (FStar_Util.format1 msg x)
in (fail uu____651)))


let fail2 : 'Auu____660 . Prims.string  ->  Prims.string  ->  Prims.string  ->  'Auu____660 tac = (fun msg x y -> (

let uu____675 = (FStar_Util.format2 msg x y)
in (fail uu____675)))


let fail3 : 'Auu____686 . Prims.string  ->  Prims.string  ->  Prims.string  ->  Prims.string  ->  'Auu____686 tac = (fun msg x y z -> (

let uu____705 = (FStar_Util.format3 msg x y z)
in (fail uu____705)))


let trytac : 'a . 'a tac  ->  'a FStar_Pervasives_Native.option tac = (fun t -> (mk_tac (fun ps -> (

let tx = (FStar_Syntax_Unionfind.new_transaction ())
in (

let uu____733 = (run t ps)
in (match (uu____733) with
| FStar_Tactics_Result.Success (a, q) -> begin
((FStar_Syntax_Unionfind.commit tx);
FStar_Tactics_Result.Success (((FStar_Pervasives_Native.Some (a)), (q)));
)
end
| FStar_Tactics_Result.Failed (uu____747, uu____748) -> begin
((FStar_Syntax_Unionfind.rollback tx);
FStar_Tactics_Result.Success (((FStar_Pervasives_Native.None), (ps)));
)
end))))))


let set : FStar_Tactics_Types.proofstate  ->  Prims.unit tac = (fun p -> (mk_tac (fun uu____763 -> FStar_Tactics_Result.Success (((()), (p))))))


let trysolve : FStar_Tactics_Types.goal  ->  FStar_Syntax_Syntax.typ  ->  Prims.bool = (fun goal solution -> (FStar_TypeChecker_Rel.teq_nosmt goal.FStar_Tactics_Types.context goal.FStar_Tactics_Types.witness solution))


let solve : FStar_Tactics_Types.goal  ->  FStar_Syntax_Syntax.typ  ->  Prims.unit = (fun goal solution -> (

let uu____780 = (trysolve goal solution)
in (match (uu____780) with
| true -> begin
()
end
| uu____781 -> begin
(

let uu____782 = (

let uu____783 = (

let uu____784 = (FStar_TypeChecker_Normalize.term_to_string goal.FStar_Tactics_Types.context solution)
in (

let uu____785 = (FStar_TypeChecker_Normalize.term_to_string goal.FStar_Tactics_Types.context goal.FStar_Tactics_Types.witness)
in (

let uu____786 = (FStar_Syntax_Print.term_to_string goal.FStar_Tactics_Types.goal_ty)
in (FStar_Util.format3 "%s does not solve %s : %s" uu____784 uu____785 uu____786))))
in TacFailure (uu____783))
in (FStar_Exn.raise uu____782))
end)))


let dismiss : Prims.unit tac = (bind get (fun p -> (

let uu____792 = (

let uu___106_793 = p
in (

let uu____794 = (FStar_List.tl p.FStar_Tactics_Types.goals)
in {FStar_Tactics_Types.main_context = uu___106_793.FStar_Tactics_Types.main_context; FStar_Tactics_Types.main_goal = uu___106_793.FStar_Tactics_Types.main_goal; FStar_Tactics_Types.all_implicits = uu___106_793.FStar_Tactics_Types.all_implicits; FStar_Tactics_Types.goals = uu____794; FStar_Tactics_Types.smt_goals = uu___106_793.FStar_Tactics_Types.smt_goals}))
in (set uu____792))))


let dismiss_all : Prims.unit tac = (bind get (fun p -> (set (

let uu___107_803 = p
in {FStar_Tactics_Types.main_context = uu___107_803.FStar_Tactics_Types.main_context; FStar_Tactics_Types.main_goal = uu___107_803.FStar_Tactics_Types.main_goal; FStar_Tactics_Types.all_implicits = uu___107_803.FStar_Tactics_Types.all_implicits; FStar_Tactics_Types.goals = []; FStar_Tactics_Types.smt_goals = uu___107_803.FStar_Tactics_Types.smt_goals}))))


let add_goals : FStar_Tactics_Types.goal Prims.list  ->  Prims.unit tac = (fun gs -> (bind get (fun p -> (set (

let uu___108_820 = p
in {FStar_Tactics_Types.main_context = uu___108_820.FStar_Tactics_Types.main_context; FStar_Tactics_Types.main_goal = uu___108_820.FStar_Tactics_Types.main_goal; FStar_Tactics_Types.all_implicits = uu___108_820.FStar_Tactics_Types.all_implicits; FStar_Tactics_Types.goals = (FStar_List.append gs p.FStar_Tactics_Types.goals); FStar_Tactics_Types.smt_goals = uu___108_820.FStar_Tactics_Types.smt_goals})))))


let add_smt_goals : FStar_Tactics_Types.goal Prims.list  ->  Prims.unit tac = (fun gs -> (bind get (fun p -> (set (

let uu___109_837 = p
in {FStar_Tactics_Types.main_context = uu___109_837.FStar_Tactics_Types.main_context; FStar_Tactics_Types.main_goal = uu___109_837.FStar_Tactics_Types.main_goal; FStar_Tactics_Types.all_implicits = uu___109_837.FStar_Tactics_Types.all_implicits; FStar_Tactics_Types.goals = uu___109_837.FStar_Tactics_Types.goals; FStar_Tactics_Types.smt_goals = (FStar_List.append gs p.FStar_Tactics_Types.smt_goals)})))))


let push_goals : FStar_Tactics_Types.goal Prims.list  ->  Prims.unit tac = (fun gs -> (bind get (fun p -> (set (

let uu___110_854 = p
in {FStar_Tactics_Types.main_context = uu___110_854.FStar_Tactics_Types.main_context; FStar_Tactics_Types.main_goal = uu___110_854.FStar_Tactics_Types.main_goal; FStar_Tactics_Types.all_implicits = uu___110_854.FStar_Tactics_Types.all_implicits; FStar_Tactics_Types.goals = (FStar_List.append p.FStar_Tactics_Types.goals gs); FStar_Tactics_Types.smt_goals = uu___110_854.FStar_Tactics_Types.smt_goals})))))


let push_smt_goals : FStar_Tactics_Types.goal Prims.list  ->  Prims.unit tac = (fun gs -> (bind get (fun p -> (set (

let uu___111_871 = p
in {FStar_Tactics_Types.main_context = uu___111_871.FStar_Tactics_Types.main_context; FStar_Tactics_Types.main_goal = uu___111_871.FStar_Tactics_Types.main_goal; FStar_Tactics_Types.all_implicits = uu___111_871.FStar_Tactics_Types.all_implicits; FStar_Tactics_Types.goals = uu___111_871.FStar_Tactics_Types.goals; FStar_Tactics_Types.smt_goals = (FStar_List.append p.FStar_Tactics_Types.smt_goals gs)})))))


let replace_cur : FStar_Tactics_Types.goal  ->  Prims.unit tac = (fun g -> (bind dismiss (fun uu____881 -> (add_goals ((g)::[])))))


let add_implicits : implicits  ->  Prims.unit tac = (fun i -> (bind get (fun p -> (set (

let uu___112_894 = p
in {FStar_Tactics_Types.main_context = uu___112_894.FStar_Tactics_Types.main_context; FStar_Tactics_Types.main_goal = uu___112_894.FStar_Tactics_Types.main_goal; FStar_Tactics_Types.all_implicits = (FStar_List.append i p.FStar_Tactics_Types.all_implicits); FStar_Tactics_Types.goals = uu___112_894.FStar_Tactics_Types.goals; FStar_Tactics_Types.smt_goals = uu___112_894.FStar_Tactics_Types.smt_goals})))))


let new_uvar : env  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term tac = (fun env typ -> (

let uu____919 = (FStar_TypeChecker_Util.new_implicit_var "tactics.new_uvar" typ.FStar_Syntax_Syntax.pos env typ)
in (match (uu____919) with
| (u, uu____935, g_u) -> begin
(

let uu____949 = (add_implicits g_u.FStar_TypeChecker_Env.implicits)
in (bind uu____949 (fun uu____953 -> (ret u))))
end)))


let is_true : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____958 = (FStar_Syntax_Util.un_squash t)
in (match (uu____958) with
| FStar_Pervasives_Native.Some (t') -> begin
(

let uu____968 = (

let uu____969 = (FStar_Syntax_Subst.compress t')
in uu____969.FStar_Syntax_Syntax.n)
in (match (uu____968) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.true_lid)
end
| uu____973 -> begin
false
end))
end
| uu____974 -> begin
false
end)))


let is_false : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____983 = (FStar_Syntax_Util.un_squash t)
in (match (uu____983) with
| FStar_Pervasives_Native.Some (t') -> begin
(

let uu____993 = (

let uu____994 = (FStar_Syntax_Subst.compress t')
in uu____994.FStar_Syntax_Syntax.n)
in (match (uu____993) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.false_lid)
end
| uu____998 -> begin
false
end))
end
| uu____999 -> begin
false
end)))


let cur_goal : FStar_Tactics_Types.goal tac = (bind get (fun p -> (match (p.FStar_Tactics_Types.goals) with
| [] -> begin
(fail "No more goals (1)")
end
| (hd1)::tl1 -> begin
(ret hd1)
end)))


let mk_irrelevant_goal : env  ->  FStar_Syntax_Syntax.typ  ->  FStar_Options.optionstate  ->  FStar_Tactics_Types.goal tac = (fun env phi opts -> (

let typ = (FStar_Syntax_Util.mk_squash phi)
in (

let uu____1033 = (new_uvar env typ)
in (bind uu____1033 (fun u -> (

let goal = {FStar_Tactics_Types.context = env; FStar_Tactics_Types.witness = u; FStar_Tactics_Types.goal_ty = typ; FStar_Tactics_Types.opts = opts; FStar_Tactics_Types.is_guard = false}
in (ret goal)))))))


let add_irrelevant_goal : env  ->  FStar_Syntax_Syntax.typ  ->  FStar_Options.optionstate  ->  Prims.unit tac = (fun env phi opts -> (

let uu____1056 = (mk_irrelevant_goal env phi opts)
in (bind uu____1056 (fun goal -> (add_goals ((goal)::[]))))))


let istrivial : env  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun e t -> (

let steps = (FStar_TypeChecker_Normalize.Reify)::(FStar_TypeChecker_Normalize.UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::(FStar_TypeChecker_Normalize.Primops)::(FStar_TypeChecker_Normalize.Simplify)::(FStar_TypeChecker_Normalize.UnfoldTac)::(FStar_TypeChecker_Normalize.Unmeta)::[]
in (

let t1 = (normalize steps e t)
in (is_true t1))))


let trivial : Prims.unit tac = (bind cur_goal (fun goal -> (

let uu____1079 = (istrivial goal.FStar_Tactics_Types.context goal.FStar_Tactics_Types.goal_ty)
in (match (uu____1079) with
| true -> begin
((solve goal FStar_Syntax_Util.exp_unit);
dismiss;
)
end
| uu____1083 -> begin
(

let uu____1084 = (FStar_Syntax_Print.term_to_string goal.FStar_Tactics_Types.goal_ty)
in (fail1 "Not a trivial goal: %s" uu____1084))
end))))


let add_goal_from_guard : env  ->  FStar_TypeChecker_Env.guard_t  ->  FStar_Options.optionstate  ->  Prims.unit tac = (fun e g opts -> (

let uu____1101 = (

let uu____1102 = (FStar_TypeChecker_Rel.simplify_guard e g)
in uu____1102.FStar_TypeChecker_Env.guard_f)
in (match (uu____1101) with
| FStar_TypeChecker_Common.Trivial -> begin
(ret ())
end
| FStar_TypeChecker_Common.NonTrivial (f) -> begin
(

let uu____1106 = (istrivial e f)
in (match (uu____1106) with
| true -> begin
(ret ())
end
| uu____1109 -> begin
(

let uu____1110 = (mk_irrelevant_goal e f opts)
in (bind uu____1110 (fun goal -> (

let goal1 = (

let uu___113_1117 = goal
in {FStar_Tactics_Types.context = uu___113_1117.FStar_Tactics_Types.context; FStar_Tactics_Types.witness = uu___113_1117.FStar_Tactics_Types.witness; FStar_Tactics_Types.goal_ty = uu___113_1117.FStar_Tactics_Types.goal_ty; FStar_Tactics_Types.opts = uu___113_1117.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = true})
in (push_goals ((goal1)::[]))))))
end))
end)))


let smt : Prims.unit tac = (bind cur_goal (fun g -> (

let uu____1123 = (is_irrelevant g)
in (match (uu____1123) with
| true -> begin
(bind dismiss (fun uu____1127 -> (add_smt_goals ((g)::[]))))
end
| uu____1128 -> begin
(

let uu____1129 = (FStar_Syntax_Print.term_to_string g.FStar_Tactics_Types.goal_ty)
in (fail1 "goal is not irrelevant: cannot dispatch to smt (%s)" uu____1129))
end))))


let divide : 'a 'b . Prims.int  ->  'a tac  ->  'b tac  ->  ('a * 'b) tac = (fun n1 l r -> (bind get (fun p -> (

let uu____1175 = (FStar_All.try_with (fun uu___118_1198 -> (match (()) with
| () -> begin
(

let uu____1209 = (FStar_List.splitAt n1 p.FStar_Tactics_Types.goals)
in (ret uu____1209))
end)) (fun uu___117_1228 -> (match (uu___117_1228) with
| uu____1239 -> begin
(fail "divide: not enough goals")
end)))
in (bind uu____1175 (fun uu____1266 -> (match (uu____1266) with
| (lgs, rgs) -> begin
(

let lp = (

let uu___114_1292 = p
in {FStar_Tactics_Types.main_context = uu___114_1292.FStar_Tactics_Types.main_context; FStar_Tactics_Types.main_goal = uu___114_1292.FStar_Tactics_Types.main_goal; FStar_Tactics_Types.all_implicits = uu___114_1292.FStar_Tactics_Types.all_implicits; FStar_Tactics_Types.goals = lgs; FStar_Tactics_Types.smt_goals = []})
in (

let rp = (

let uu___115_1294 = p
in {FStar_Tactics_Types.main_context = uu___115_1294.FStar_Tactics_Types.main_context; FStar_Tactics_Types.main_goal = uu___115_1294.FStar_Tactics_Types.main_goal; FStar_Tactics_Types.all_implicits = uu___115_1294.FStar_Tactics_Types.all_implicits; FStar_Tactics_Types.goals = rgs; FStar_Tactics_Types.smt_goals = []})
in (

let uu____1295 = (set lp)
in (bind uu____1295 (fun uu____1303 -> (bind l (fun a -> (bind get (fun lp' -> (

let uu____1317 = (set rp)
in (bind uu____1317 (fun uu____1325 -> (bind r (fun b -> (bind get (fun rp' -> (

let p' = (

let uu___116_1341 = p
in {FStar_Tactics_Types.main_context = uu___116_1341.FStar_Tactics_Types.main_context; FStar_Tactics_Types.main_goal = uu___116_1341.FStar_Tactics_Types.main_goal; FStar_Tactics_Types.all_implicits = uu___116_1341.FStar_Tactics_Types.all_implicits; FStar_Tactics_Types.goals = (FStar_List.append lp'.FStar_Tactics_Types.goals rp'.FStar_Tactics_Types.goals); FStar_Tactics_Types.smt_goals = (FStar_List.append lp'.FStar_Tactics_Types.smt_goals (FStar_List.append rp'.FStar_Tactics_Types.smt_goals p.FStar_Tactics_Types.smt_goals))})
in (

let uu____1342 = (set p')
in (bind uu____1342 (fun uu____1350 -> (ret ((a), (b)))))))))))))))))))))))
end)))))))


let focus : 'a . 'a tac  ->  'a tac = (fun f -> (

let uu____1370 = (divide (Prims.parse_int "1") f idtac)
in (bind uu____1370 (fun uu____1383 -> (match (uu____1383) with
| (a, ()) -> begin
(ret a)
end)))))


let rec map : 'a . 'a tac  ->  'a Prims.list tac = (fun tau -> (bind get (fun p -> (match (p.FStar_Tactics_Types.goals) with
| [] -> begin
(ret [])
end
| (uu____1418)::uu____1419 -> begin
(

let uu____1422 = (

let uu____1431 = (map tau)
in (divide (Prims.parse_int "1") tau uu____1431))
in (bind uu____1422 (fun uu____1449 -> (match (uu____1449) with
| (h, t) -> begin
(ret ((h)::t))
end))))
end))))


let seq : Prims.unit tac  ->  Prims.unit tac  ->  Prims.unit tac = (fun t1 t2 -> (

let uu____1488 = (bind t1 (fun uu____1493 -> (

let uu____1494 = (map t2)
in (bind uu____1494 (fun uu____1502 -> (ret ()))))))
in (focus uu____1488)))


let intro : FStar_Syntax_Syntax.binder tac = (bind cur_goal (fun goal -> (

let uu____1513 = (FStar_Syntax_Util.arrow_one goal.FStar_Tactics_Types.goal_ty)
in (match (uu____1513) with
| FStar_Pervasives_Native.Some (b, c) -> begin
(

let uu____1528 = (

let uu____1529 = (FStar_Syntax_Util.is_total_comp c)
in (not (uu____1529)))
in (match (uu____1528) with
| true -> begin
(fail "Codomain is effectful")
end
| uu____1532 -> begin
(

let env' = (FStar_TypeChecker_Env.push_binders goal.FStar_Tactics_Types.context ((b)::[]))
in (

let typ' = (comp_to_typ c)
in (

let uu____1535 = (new_uvar env' typ')
in (bind uu____1535 (fun u -> (

let uu____1542 = (

let uu____1543 = (FStar_Syntax_Util.abs ((b)::[]) u FStar_Pervasives_Native.None)
in (trysolve goal uu____1543))
in (match (uu____1542) with
| true -> begin
(

let uu____1546 = (

let uu____1549 = (

let uu___119_1550 = goal
in (

let uu____1551 = (bnorm env' u)
in (

let uu____1552 = (bnorm env' typ')
in {FStar_Tactics_Types.context = env'; FStar_Tactics_Types.witness = uu____1551; FStar_Tactics_Types.goal_ty = uu____1552; FStar_Tactics_Types.opts = uu___119_1550.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = uu___119_1550.FStar_Tactics_Types.is_guard})))
in (replace_cur uu____1549))
in (bind uu____1546 (fun uu____1554 -> (ret b))))
end
| uu____1555 -> begin
(fail "intro: unification failed")
end)))))))
end))
end
| FStar_Pervasives_Native.None -> begin
(

let uu____1560 = (FStar_Syntax_Print.term_to_string goal.FStar_Tactics_Types.goal_ty)
in (fail1 "intro: goal is not an arrow (%s)" uu____1560))
end))))


let intro_rec : (FStar_Syntax_Syntax.binder * FStar_Syntax_Syntax.binder) tac = (bind cur_goal (fun goal -> ((FStar_Util.print_string "WARNING (intro_rec): calling this is known to cause normalizer loops\n");
(FStar_Util.print_string "WARNING (intro_rec): proceed at your own risk...\n");
(

let uu____1581 = (FStar_Syntax_Util.arrow_one goal.FStar_Tactics_Types.goal_ty)
in (match (uu____1581) with
| FStar_Pervasives_Native.Some (b, c) -> begin
(

let uu____1600 = (

let uu____1601 = (FStar_Syntax_Util.is_total_comp c)
in (not (uu____1601)))
in (match (uu____1600) with
| true -> begin
(fail "Codomain is effectful")
end
| uu____1612 -> begin
(

let bv = (FStar_Syntax_Syntax.gen_bv "__recf" FStar_Pervasives_Native.None goal.FStar_Tactics_Types.goal_ty)
in (

let bs = (

let uu____1617 = (FStar_Syntax_Syntax.mk_binder bv)
in (uu____1617)::(b)::[])
in (

let env' = (FStar_TypeChecker_Env.push_binders goal.FStar_Tactics_Types.context bs)
in (

let uu____1619 = (

let uu____1622 = (comp_to_typ c)
in (new_uvar env' uu____1622))
in (bind uu____1619 (fun u -> (

let lb = (

let uu____1639 = (FStar_Syntax_Util.abs ((b)::[]) u FStar_Pervasives_Native.None)
in (FStar_Syntax_Util.mk_letbinding (FStar_Util.Inl (bv)) [] goal.FStar_Tactics_Types.goal_ty FStar_Parser_Const.effect_Tot_lid uu____1639))
in (

let body = (FStar_Syntax_Syntax.bv_to_name bv)
in (

let uu____1643 = (FStar_Syntax_Subst.close_let_rec ((lb)::[]) body)
in (match (uu____1643) with
| (lbs, body1) -> begin
(

let tm = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_let (((((true), (lbs))), (body1)))) FStar_Pervasives_Native.None goal.FStar_Tactics_Types.witness.FStar_Syntax_Syntax.pos)
in ((FStar_Util.print_string "calling teq_nosmt\n");
(

let res = (trysolve goal tm)
in (match (res) with
| true -> begin
(

let uu____1681 = (

let uu____1684 = (

let uu___120_1685 = goal
in (

let uu____1686 = (bnorm env' u)
in (

let uu____1687 = (

let uu____1688 = (comp_to_typ c)
in (bnorm env' uu____1688))
in {FStar_Tactics_Types.context = env'; FStar_Tactics_Types.witness = uu____1686; FStar_Tactics_Types.goal_ty = uu____1687; FStar_Tactics_Types.opts = uu___120_1685.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = uu___120_1685.FStar_Tactics_Types.is_guard})))
in (replace_cur uu____1684))
in (bind uu____1681 (fun uu____1695 -> (

let uu____1696 = (

let uu____1701 = (FStar_Syntax_Syntax.mk_binder bv)
in ((uu____1701), (b)))
in (ret uu____1696)))))
end
| uu____1706 -> begin
(fail "intro_rec: unification failed")
end));
))
end))))))))))
end))
end
| FStar_Pervasives_Native.None -> begin
(

let uu____1715 = (FStar_Syntax_Print.term_to_string goal.FStar_Tactics_Types.goal_ty)
in (fail1 "intro_rec: goal is not an arrow (%s)" uu____1715))
end));
)))


let norm : FStar_Syntax_Embeddings.norm_step Prims.list  ->  Prims.unit tac = (fun s -> (bind cur_goal (fun goal -> (

let steps = (

let uu____1740 = (FStar_TypeChecker_Normalize.tr_norm_steps s)
in (FStar_List.append ((FStar_TypeChecker_Normalize.Reify)::(FStar_TypeChecker_Normalize.UnfoldTac)::[]) uu____1740))
in (

let w = (normalize steps goal.FStar_Tactics_Types.context goal.FStar_Tactics_Types.witness)
in (

let t = (normalize steps goal.FStar_Tactics_Types.context goal.FStar_Tactics_Types.goal_ty)
in (replace_cur (

let uu___121_1747 = goal
in {FStar_Tactics_Types.context = uu___121_1747.FStar_Tactics_Types.context; FStar_Tactics_Types.witness = w; FStar_Tactics_Types.goal_ty = t; FStar_Tactics_Types.opts = uu___121_1747.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = uu___121_1747.FStar_Tactics_Types.is_guard}))))))))


let norm_term : FStar_Syntax_Embeddings.norm_step Prims.list  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term tac = (fun s t -> (bind get (fun ps -> (

let steps = (

let uu____1771 = (FStar_TypeChecker_Normalize.tr_norm_steps s)
in (FStar_List.append ((FStar_TypeChecker_Normalize.Reify)::(FStar_TypeChecker_Normalize.UnfoldTac)::[]) uu____1771))
in (

let t1 = (normalize steps ps.FStar_Tactics_Types.main_context t)
in (ret t1))))))


let __exact : FStar_Syntax_Syntax.term  ->  Prims.unit tac = (fun t -> (bind cur_goal (fun goal -> (

let uu____1786 = (FStar_All.try_with (fun uu___123_1805 -> (match (()) with
| () -> begin
(

let uu____1814 = (goal.FStar_Tactics_Types.context.FStar_TypeChecker_Env.type_of goal.FStar_Tactics_Types.context t)
in (ret uu____1814))
end)) (fun uu___122_1831 -> (match (uu___122_1831) with
| e -> begin
(

let uu____1841 = (FStar_Syntax_Print.term_to_string t)
in (

let uu____1842 = (FStar_Syntax_Print.tag_of_term t)
in (fail2 "exact: term is not typeable: %s (%s)" uu____1841 uu____1842)))
end)))
in (bind uu____1786 (fun uu____1860 -> (match (uu____1860) with
| (t1, typ, guard) -> begin
(

let uu____1872 = (

let uu____1873 = (

let uu____1874 = (FStar_TypeChecker_Rel.discharge_guard goal.FStar_Tactics_Types.context guard)
in (FStar_All.pipe_left FStar_TypeChecker_Rel.is_trivial uu____1874))
in (not (uu____1873)))
in (match (uu____1872) with
| true -> begin
(fail "exact: got non-trivial guard")
end
| uu____1877 -> begin
(

let uu____1878 = (FStar_TypeChecker_Rel.teq_nosmt goal.FStar_Tactics_Types.context typ goal.FStar_Tactics_Types.goal_ty)
in (match (uu____1878) with
| true -> begin
((solve goal t1);
dismiss;
)
end
| uu____1882 -> begin
(

let uu____1883 = (FStar_Syntax_Print.term_to_string t1)
in (

let uu____1884 = (

let uu____1885 = (bnorm goal.FStar_Tactics_Types.context typ)
in (FStar_Syntax_Print.term_to_string uu____1885))
in (

let uu____1886 = (FStar_Syntax_Print.term_to_string goal.FStar_Tactics_Types.goal_ty)
in (fail3 "%s : %s does not exactly solve the goal %s" uu____1883 uu____1884 uu____1886))))
end))
end))
end)))))))


let exact : FStar_Syntax_Syntax.term  ->  Prims.unit tac = (fun t -> (

let uu____1895 = (__exact t)
in (focus uu____1895)))


let exact_lemma : FStar_Syntax_Syntax.term  ->  Prims.unit tac = (fun t -> (bind cur_goal (fun goal -> (

let uu____1909 = (FStar_All.try_with (fun uu___125_1928 -> (match (()) with
| () -> begin
(

let uu____1937 = (FStar_TypeChecker_TcTerm.tc_term goal.FStar_Tactics_Types.context t)
in (ret uu____1937))
end)) (fun uu___124_1954 -> (match (uu___124_1954) with
| e -> begin
(

let uu____1964 = (FStar_Syntax_Print.term_to_string t)
in (

let uu____1965 = (FStar_Syntax_Print.tag_of_term t)
in (fail2 "exact_lemma: term is not typeable: %s (%s)" uu____1964 uu____1965)))
end)))
in (bind uu____1909 (fun uu____1983 -> (match (uu____1983) with
| (t1, lcomp, guard) -> begin
(

let comp = (lcomp.FStar_Syntax_Syntax.comp ())
in (match ((not ((FStar_Syntax_Util.is_lemma_comp comp)))) with
| true -> begin
(fail "exact_lemma: not a lemma")
end
| uu____2000 -> begin
(

let uu____2001 = (

let uu____2002 = (FStar_TypeChecker_Rel.is_trivial guard)
in (not (uu____2002)))
in (match (uu____2001) with
| true -> begin
(fail "exact: got non-trivial guard")
end
| uu____2005 -> begin
(

let uu____2006 = (

let uu____2015 = (

let uu____2024 = (FStar_Syntax_Util.comp_to_comp_typ comp)
in uu____2024.FStar_Syntax_Syntax.effect_args)
in (match (uu____2015) with
| (pre)::(post)::uu____2035 -> begin
(((FStar_Pervasives_Native.fst pre)), ((FStar_Pervasives_Native.fst post)))
end
| uu____2076 -> begin
(failwith "exact_lemma: impossible: not a lemma")
end))
in (match (uu____2006) with
| (pre, post) -> begin
(

let uu____2105 = (FStar_TypeChecker_Rel.teq_nosmt goal.FStar_Tactics_Types.context post goal.FStar_Tactics_Types.goal_ty)
in (match (uu____2105) with
| true -> begin
((solve goal t1);
(bind dismiss (fun uu____2110 -> (add_irrelevant_goal goal.FStar_Tactics_Types.context pre goal.FStar_Tactics_Types.opts)));
)
end
| uu____2111 -> begin
(

let uu____2112 = (FStar_Syntax_Print.term_to_string t1)
in (

let uu____2113 = (FStar_Syntax_Print.term_to_string post)
in (

let uu____2114 = (FStar_Syntax_Print.term_to_string goal.FStar_Tactics_Types.goal_ty)
in (fail3 "%s : %s does not exactly solve the goal %s" uu____2112 uu____2113 uu____2114))))
end))
end))
end))
end))
end)))))))


let uvar_free_in_goal : FStar_Syntax_Syntax.uvar  ->  FStar_Tactics_Types.goal  ->  Prims.bool = (fun u g -> (match (g.FStar_Tactics_Types.is_guard) with
| true -> begin
false
end
| uu____2123 -> begin
(

let free_uvars = (

let uu____2127 = (

let uu____2134 = (FStar_Syntax_Free.uvars g.FStar_Tactics_Types.goal_ty)
in (FStar_Util.set_elements uu____2134))
in (FStar_List.map FStar_Pervasives_Native.fst uu____2127))
in (FStar_List.existsML (FStar_Syntax_Unionfind.equiv u) free_uvars))
end))


let uvar_free : FStar_Syntax_Syntax.uvar  ->  FStar_Tactics_Types.proofstate  ->  Prims.bool = (fun u ps -> (FStar_List.existsML (uvar_free_in_goal u) ps.FStar_Tactics_Types.goals))

exception NoUnif


let uu___is_NoUnif : Prims.exn  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NoUnif -> begin
true
end
| uu____2161 -> begin
false
end))


let rec __apply : Prims.bool  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  Prims.unit tac = (fun uopt tm typ -> (bind cur_goal (fun goal -> (

let uu____2181 = (

let uu____2186 = (__exact tm)
in (trytac uu____2186))
in (bind uu____2181 (fun r -> (match (r) with
| FStar_Pervasives_Native.Some (r1) -> begin
(ret ())
end
| FStar_Pervasives_Native.None -> begin
(

let uu____2199 = (FStar_Syntax_Util.arrow_one typ)
in (match (uu____2199) with
| FStar_Pervasives_Native.None -> begin
(FStar_Exn.raise NoUnif)
end
| FStar_Pervasives_Native.Some ((bv, aq), c) -> begin
(

let uu____2229 = (

let uu____2230 = (FStar_Syntax_Util.is_total_comp c)
in (not (uu____2230)))
in (match (uu____2229) with
| true -> begin
(fail "apply: not total codomain")
end
| uu____2233 -> begin
(

let uu____2234 = (new_uvar goal.FStar_Tactics_Types.context bv.FStar_Syntax_Syntax.sort)
in (bind uu____2234 (fun u -> (

let tm' = (FStar_Syntax_Syntax.mk_Tm_app tm ((((u), (aq)))::[]) FStar_Pervasives_Native.None goal.FStar_Tactics_Types.context.FStar_TypeChecker_Env.range)
in (

let typ' = (

let uu____2254 = (comp_to_typ c)
in (FStar_All.pipe_left (FStar_Syntax_Subst.subst ((FStar_Syntax_Syntax.NT (((bv), (u))))::[])) uu____2254))
in (

let uu____2255 = (__apply uopt tm' typ')
in (bind uu____2255 (fun uu____2262 -> (

let uu____2263 = (

let uu____2264 = (

let uu____2267 = (

let uu____2268 = (FStar_Syntax_Util.head_and_args u)
in (FStar_Pervasives_Native.fst uu____2268))
in (FStar_Syntax_Subst.compress uu____2267))
in uu____2264.FStar_Syntax_Syntax.n)
in (match (uu____2263) with
| FStar_Syntax_Syntax.Tm_uvar (uvar, uu____2296) -> begin
(bind get (fun ps -> (

let uu____2324 = (uopt && (uvar_free uvar ps))
in (match (uu____2324) with
| true -> begin
(ret ())
end
| uu____2327 -> begin
(

let uu____2328 = (

let uu____2331 = (

let uu___126_2332 = goal
in (

let uu____2333 = (bnorm goal.FStar_Tactics_Types.context u)
in (

let uu____2334 = (bnorm goal.FStar_Tactics_Types.context bv.FStar_Syntax_Syntax.sort)
in {FStar_Tactics_Types.context = uu___126_2332.FStar_Tactics_Types.context; FStar_Tactics_Types.witness = uu____2333; FStar_Tactics_Types.goal_ty = uu____2334; FStar_Tactics_Types.opts = uu___126_2332.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = false})))
in (uu____2331)::[])
in (add_goals uu____2328))
end))))
end
| uu____2335 -> begin
(ret ())
end))))))))))
end))
end))
end)))))))


let try_unif : 'a . 'a tac  ->  'a tac  ->  'a tac = (fun t t' -> (mk_tac (fun ps -> (FStar_All.try_with (fun uu___128_2366 -> (match (()) with
| () -> begin
(run t ps)
end)) (fun uu___127_2370 -> (match (uu___127_2370) with
| NoUnif -> begin
(run t' ps)
end))))))


let apply : Prims.bool  ->  FStar_Syntax_Syntax.term  ->  Prims.unit tac = (fun uopt tm -> (bind cur_goal (fun goal -> (

let uu____2393 = (goal.FStar_Tactics_Types.context.FStar_TypeChecker_Env.type_of goal.FStar_Tactics_Types.context tm)
in (match (uu____2393) with
| (tm1, typ, guard) -> begin
(

let uu____2405 = (

let uu____2408 = (

let uu____2411 = (__apply uopt tm1 typ)
in (bind uu____2411 (fun uu____2415 -> (add_goal_from_guard goal.FStar_Tactics_Types.context guard goal.FStar_Tactics_Types.opts))))
in (focus uu____2408))
in (

let uu____2416 = (

let uu____2419 = (FStar_Syntax_Print.term_to_string tm1)
in (

let uu____2420 = (FStar_Syntax_Print.term_to_string typ)
in (

let uu____2421 = (FStar_Syntax_Print.term_to_string goal.FStar_Tactics_Types.goal_ty)
in (fail3 "apply: Cannot instantiate %s (of type %s) to match goal (%s)" uu____2419 uu____2420 uu____2421))))
in (try_unif uu____2405 uu____2416)))
end)))))


let apply_lemma : FStar_Syntax_Syntax.term  ->  Prims.unit tac = (fun tm -> (

let uu____2430 = (

let is_unit_t = (fun t -> (

let uu____2437 = (

let uu____2438 = (FStar_Syntax_Subst.compress t)
in uu____2438.FStar_Syntax_Syntax.n)
in (match (uu____2437) with
| FStar_Syntax_Syntax.Tm_fvar (fv) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.unit_lid) -> begin
true
end
| uu____2442 -> begin
false
end)))
in (bind cur_goal (fun goal -> (

let uu____2452 = (goal.FStar_Tactics_Types.context.FStar_TypeChecker_Env.type_of goal.FStar_Tactics_Types.context tm)
in (match (uu____2452) with
| (tm1, t, guard) -> begin
(

let uu____2464 = (FStar_Syntax_Util.arrow_formals_comp t)
in (match (uu____2464) with
| (bs, comp) -> begin
(match ((not ((FStar_Syntax_Util.is_lemma_comp comp)))) with
| true -> begin
(fail "apply_lemma: not a lemma")
end
| uu____2493 -> begin
(

let uu____2494 = (FStar_List.fold_left (fun uu____2540 uu____2541 -> (match (((uu____2540), (uu____2541))) with
| ((uvs, guard1, subst1), (b, aq)) -> begin
(

let b_t = (FStar_Syntax_Subst.subst subst1 b.FStar_Syntax_Syntax.sort)
in (

let uu____2644 = (is_unit_t b_t)
in (match (uu____2644) with
| true -> begin
(((((FStar_Syntax_Util.exp_unit), (aq)))::uvs), (guard1), ((FStar_Syntax_Syntax.NT (((b), (FStar_Syntax_Util.exp_unit))))::subst1))
end
| uu____2681 -> begin
(

let uu____2682 = (FStar_TypeChecker_Util.new_implicit_var "apply_lemma" goal.FStar_Tactics_Types.goal_ty.FStar_Syntax_Syntax.pos goal.FStar_Tactics_Types.context b_t)
in (match (uu____2682) with
| (u, uu____2712, g_u) -> begin
(

let uu____2726 = (FStar_TypeChecker_Rel.conj_guard guard1 g_u)
in (((((u), (aq)))::uvs), (uu____2726), ((FStar_Syntax_Syntax.NT (((b), (u))))::subst1)))
end))
end)))
end)) (([]), (guard), ([])) bs)
in (match (uu____2494) with
| (uvs, implicits, subst1) -> begin
(

let uvs1 = (FStar_List.rev uvs)
in (

let comp1 = (FStar_Syntax_Subst.subst_comp subst1 comp)
in (

let uu____2796 = (

let uu____2805 = (

let uu____2814 = (FStar_Syntax_Util.comp_to_comp_typ comp1)
in uu____2814.FStar_Syntax_Syntax.effect_args)
in (match (uu____2805) with
| (pre)::(post)::uu____2825 -> begin
(((FStar_Pervasives_Native.fst pre)), ((FStar_Pervasives_Native.fst post)))
end
| uu____2866 -> begin
(failwith "apply_lemma: impossible: not a lemma")
end))
in (match (uu____2796) with
| (pre, post) -> begin
(

let uu____2895 = (

let uu____2896 = (

let uu____2897 = (FStar_Syntax_Util.mk_squash post)
in (FStar_TypeChecker_Rel.teq_nosmt goal.FStar_Tactics_Types.context uu____2897 goal.FStar_Tactics_Types.goal_ty))
in (not (uu____2896)))
in (match (uu____2895) with
| true -> begin
(

let uu____2900 = (FStar_Syntax_Print.term_to_string tm1)
in (

let uu____2901 = (

let uu____2902 = (FStar_Syntax_Util.mk_squash post)
in (FStar_Syntax_Print.term_to_string uu____2902))
in (

let uu____2903 = (FStar_Syntax_Print.term_to_string goal.FStar_Tactics_Types.goal_ty)
in (fail3 "apply: Cannot instantiate lemma %s (with postcondition %s) to match goal (%s)" uu____2900 uu____2901 uu____2903))))
end
| uu____2904 -> begin
(

let solution = (

let uu____2906 = (FStar_Syntax_Syntax.mk_Tm_app tm1 uvs1 FStar_Pervasives_Native.None goal.FStar_Tactics_Types.context.FStar_TypeChecker_Env.range)
in (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::[]) goal.FStar_Tactics_Types.context uu____2906))
in (

let implicits1 = (FStar_All.pipe_right implicits.FStar_TypeChecker_Env.implicits (FStar_List.filter (fun uu____2974 -> (match (uu____2974) with
| (uu____2987, uu____2988, uu____2989, tm2, uu____2991, uu____2992) -> begin
(

let uu____2993 = (FStar_Syntax_Util.head_and_args tm2)
in (match (uu____2993) with
| (hd1, uu____3009) -> begin
(

let uu____3030 = (

let uu____3031 = (FStar_Syntax_Subst.compress hd1)
in uu____3031.FStar_Syntax_Syntax.n)
in (match (uu____3030) with
| FStar_Syntax_Syntax.Tm_uvar (uu____3034) -> begin
true
end
| uu____3051 -> begin
false
end))
end))
end))))
in ((solve goal solution);
(

let uu____3053 = (add_implicits implicits1)
in (bind uu____3053 (fun uu____3057 -> (bind dismiss (fun uu____3066 -> (

let is_free_uvar = (fun uv t1 -> (

let free_uvars = (

let uu____3077 = (

let uu____3084 = (FStar_Syntax_Free.uvars t1)
in (FStar_Util.set_elements uu____3084))
in (FStar_List.map FStar_Pervasives_Native.fst uu____3077))
in (FStar_List.existsML (fun u -> (FStar_Syntax_Unionfind.equiv u uv)) free_uvars)))
in (

let appears = (fun uv goals -> (FStar_List.existsML (fun g' -> (is_free_uvar uv g'.FStar_Tactics_Types.goal_ty)) goals))
in (

let checkone = (fun t1 goals -> (

let uu____3125 = (FStar_Syntax_Util.head_and_args t1)
in (match (uu____3125) with
| (hd1, uu____3141) -> begin
(match (hd1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_uvar (uv, uu____3163) -> begin
(appears uv goals)
end
| uu____3188 -> begin
false
end)
end)))
in (

let sub_goals = (FStar_All.pipe_right implicits1 (FStar_List.map (fun uu____3230 -> (match (uu____3230) with
| (_msg, _env, _uvar, term, typ, uu____3248) -> begin
(

let uu___129_3249 = goal
in (

let uu____3250 = (bnorm goal.FStar_Tactics_Types.context term)
in (

let uu____3251 = (bnorm goal.FStar_Tactics_Types.context typ)
in {FStar_Tactics_Types.context = uu___129_3249.FStar_Tactics_Types.context; FStar_Tactics_Types.witness = uu____3250; FStar_Tactics_Types.goal_ty = uu____3251; FStar_Tactics_Types.opts = uu___129_3249.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = uu___129_3249.FStar_Tactics_Types.is_guard})))
end))))
in (

let rec filter' = (fun f xs -> (match (xs) with
| [] -> begin
[]
end
| (x)::xs1 -> begin
(

let uu____3289 = (f x xs1)
in (match (uu____3289) with
| true -> begin
(

let uu____3292 = (filter' f xs1)
in (x)::uu____3292)
end
| uu____3295 -> begin
(filter' f xs1)
end))
end))
in (

let sub_goals1 = (filter' (fun g goals -> (

let uu____3306 = (checkone g.FStar_Tactics_Types.witness goals)
in (not (uu____3306)))) sub_goals)
in (

let uu____3307 = (add_goal_from_guard goal.FStar_Tactics_Types.context guard goal.FStar_Tactics_Types.opts)
in (bind uu____3307 (fun uu____3312 -> (

let uu____3313 = (add_irrelevant_goal goal.FStar_Tactics_Types.context pre goal.FStar_Tactics_Types.opts)
in (bind uu____3313 (fun uu____3318 -> (

let uu____3319 = (trytac trivial)
in (bind uu____3319 (fun uu____3327 -> (add_goals sub_goals1)))))))))))))))))))));
)))
end))
end))))
end))
end)
end))
end)))))
in (focus uu____2430)))


let destruct_eq' : FStar_Syntax_Syntax.typ  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.term) FStar_Pervasives_Native.option = (fun typ -> (

let uu____3346 = (FStar_Syntax_Util.destruct_typ_as_formula typ)
in (match (uu____3346) with
| FStar_Pervasives_Native.Some (FStar_Syntax_Util.BaseConn (l, (uu____3356)::((e1, uu____3358))::((e2, uu____3360))::[])) when (FStar_Ident.lid_equals l FStar_Parser_Const.eq2_lid) -> begin
FStar_Pervasives_Native.Some (((e1), (e2)))
end
| uu____3419 -> begin
FStar_Pervasives_Native.None
end)))


let destruct_eq : FStar_Syntax_Syntax.typ  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.term) FStar_Pervasives_Native.option = (fun typ -> (

let uu____3442 = (destruct_eq' typ)
in (match (uu____3442) with
| FStar_Pervasives_Native.Some (t) -> begin
FStar_Pervasives_Native.Some (t)
end
| FStar_Pervasives_Native.None -> begin
(

let uu____3472 = (FStar_Syntax_Util.un_squash typ)
in (match (uu____3472) with
| FStar_Pervasives_Native.Some (typ1) -> begin
(destruct_eq' typ1)
end
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end))
end)))


let rewrite : FStar_Syntax_Syntax.binder  ->  Prims.unit tac = (fun h -> (bind cur_goal (fun goal -> (

let uu____3505 = (FStar_All.pipe_left mlog (fun uu____3515 -> (

let uu____3516 = (FStar_Syntax_Print.bv_to_string (FStar_Pervasives_Native.fst h))
in (

let uu____3517 = (FStar_Syntax_Print.term_to_string (FStar_Pervasives_Native.fst h).FStar_Syntax_Syntax.sort)
in (FStar_Util.print2 "+++Rewrite %s : %s\n" uu____3516 uu____3517)))))
in (bind uu____3505 (fun uu____3525 -> (

let uu____3526 = (

let uu____3533 = (

let uu____3534 = (FStar_TypeChecker_Env.lookup_bv goal.FStar_Tactics_Types.context (FStar_Pervasives_Native.fst h))
in (FStar_All.pipe_left FStar_Pervasives_Native.fst uu____3534))
in (destruct_eq uu____3533))
in (match (uu____3526) with
| FStar_Pervasives_Native.Some (x, e) -> begin
(

let uu____3551 = (

let uu____3552 = (FStar_Syntax_Subst.compress x)
in uu____3552.FStar_Syntax_Syntax.n)
in (match (uu____3551) with
| FStar_Syntax_Syntax.Tm_name (x1) -> begin
(

let goal1 = (

let uu___130_3559 = goal
in (

let uu____3560 = (FStar_Syntax_Subst.subst ((FStar_Syntax_Syntax.NT (((x1), (e))))::[]) goal.FStar_Tactics_Types.witness)
in (

let uu____3561 = (FStar_Syntax_Subst.subst ((FStar_Syntax_Syntax.NT (((x1), (e))))::[]) goal.FStar_Tactics_Types.goal_ty)
in {FStar_Tactics_Types.context = uu___130_3559.FStar_Tactics_Types.context; FStar_Tactics_Types.witness = uu____3560; FStar_Tactics_Types.goal_ty = uu____3561; FStar_Tactics_Types.opts = uu___130_3559.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = uu___130_3559.FStar_Tactics_Types.is_guard})))
in (replace_cur goal1))
end
| uu____3562 -> begin
(fail "Not an equality hypothesis with a variable on the LHS")
end))
end
| uu____3563 -> begin
(fail "Not an equality hypothesis")
end))))))))


let subst_goal : FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.subst_elt Prims.list  ->  FStar_Tactics_Types.goal  ->  FStar_Tactics_Types.goal = (fun b1 b2 s g -> (

let rec alpha = (fun e -> (

let uu____3594 = (FStar_TypeChecker_Env.pop_bv e)
in (match (uu____3594) with
| FStar_Pervasives_Native.None -> begin
e
end
| FStar_Pervasives_Native.Some (bv, e') -> begin
(match ((FStar_Syntax_Syntax.bv_eq bv b1)) with
| true -> begin
(FStar_TypeChecker_Env.push_bv e' b2)
end
| uu____3611 -> begin
(

let uu____3612 = (alpha e')
in (

let uu____3613 = (

let uu___131_3614 = bv
in (

let uu____3615 = (FStar_Syntax_Subst.subst s bv.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = uu___131_3614.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___131_3614.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu____3615}))
in (FStar_TypeChecker_Env.push_bv uu____3612 uu____3613)))
end)
end)))
in (

let c = (alpha g.FStar_Tactics_Types.context)
in (

let w = (FStar_Syntax_Subst.subst s g.FStar_Tactics_Types.witness)
in (

let t = (FStar_Syntax_Subst.subst s g.FStar_Tactics_Types.goal_ty)
in (

let uu___132_3621 = g
in {FStar_Tactics_Types.context = c; FStar_Tactics_Types.witness = w; FStar_Tactics_Types.goal_ty = t; FStar_Tactics_Types.opts = uu___132_3621.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = uu___132_3621.FStar_Tactics_Types.is_guard}))))))


let rename_to : FStar_Syntax_Syntax.binder  ->  Prims.string  ->  Prims.unit tac = (fun b s -> (bind cur_goal (fun goal -> (

let uu____3642 = b
in (match (uu____3642) with
| (bv, uu____3646) -> begin
(

let bv' = (FStar_Syntax_Syntax.freshen_bv (

let uu___133_3650 = bv
in {FStar_Syntax_Syntax.ppname = (FStar_Ident.mk_ident ((s), (bv.FStar_Syntax_Syntax.ppname.FStar_Ident.idRange))); FStar_Syntax_Syntax.index = uu___133_3650.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu___133_3650.FStar_Syntax_Syntax.sort}))
in (

let s1 = (

let uu____3654 = (

let uu____3655 = (

let uu____3662 = (FStar_Syntax_Syntax.bv_to_name bv')
in ((bv), (uu____3662)))
in FStar_Syntax_Syntax.NT (uu____3655))
in (uu____3654)::[])
in (

let uu____3663 = (subst_goal bv bv' s1 goal)
in (replace_cur uu____3663))))
end)))))


let revert : Prims.unit tac = (bind cur_goal (fun goal -> (

let uu____3669 = (FStar_TypeChecker_Env.pop_bv goal.FStar_Tactics_Types.context)
in (match (uu____3669) with
| FStar_Pervasives_Native.None -> begin
(fail "Cannot revert; empty context")
end
| FStar_Pervasives_Native.Some (x, env') -> begin
(

let typ' = (

let uu____3691 = (FStar_Syntax_Syntax.mk_Total goal.FStar_Tactics_Types.goal_ty)
in (FStar_Syntax_Util.arrow ((((x), (FStar_Pervasives_Native.None)))::[]) uu____3691))
in (

let w' = (FStar_Syntax_Util.abs ((((x), (FStar_Pervasives_Native.None)))::[]) goal.FStar_Tactics_Types.witness FStar_Pervasives_Native.None)
in (replace_cur (

let uu___134_3725 = goal
in {FStar_Tactics_Types.context = env'; FStar_Tactics_Types.witness = w'; FStar_Tactics_Types.goal_ty = typ'; FStar_Tactics_Types.opts = uu___134_3725.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = uu___134_3725.FStar_Tactics_Types.is_guard}))))
end))))


let revert_hd : name  ->  Prims.unit tac = (fun x -> (bind cur_goal (fun goal -> (

let uu____3737 = (FStar_TypeChecker_Env.pop_bv goal.FStar_Tactics_Types.context)
in (match (uu____3737) with
| FStar_Pervasives_Native.None -> begin
(fail "Cannot revert_hd; empty context")
end
| FStar_Pervasives_Native.Some (y, env') -> begin
(match ((not ((FStar_Syntax_Syntax.bv_eq x y)))) with
| true -> begin
(

let uu____3758 = (FStar_Syntax_Print.bv_to_string x)
in (

let uu____3759 = (FStar_Syntax_Print.bv_to_string y)
in (fail2 "Cannot revert_hd %s; head variable mismatch ... egot %s" uu____3758 uu____3759)))
end
| uu____3760 -> begin
revert
end)
end)))))


let clear_top : Prims.unit tac = (bind cur_goal (fun goal -> (

let uu____3766 = (FStar_TypeChecker_Env.pop_bv goal.FStar_Tactics_Types.context)
in (match (uu____3766) with
| FStar_Pervasives_Native.None -> begin
(fail "Cannot clear; empty context")
end
| FStar_Pervasives_Native.Some (x, env') -> begin
(

let fns_ty = (FStar_Syntax_Free.names goal.FStar_Tactics_Types.goal_ty)
in (

let uu____3788 = (FStar_Util.set_mem x fns_ty)
in (match (uu____3788) with
| true -> begin
(fail "Cannot clear; variable appears in goal")
end
| uu____3791 -> begin
(

let uu____3792 = (new_uvar env' goal.FStar_Tactics_Types.goal_ty)
in (bind uu____3792 (fun u -> (

let uu____3798 = (

let uu____3799 = (trysolve goal u)
in (not (uu____3799)))
in (match (uu____3798) with
| true -> begin
(fail "clear: unification failed")
end
| uu____3802 -> begin
(

let new_goal = (

let uu___135_3804 = goal
in (

let uu____3805 = (bnorm env' u)
in {FStar_Tactics_Types.context = env'; FStar_Tactics_Types.witness = uu____3805; FStar_Tactics_Types.goal_ty = uu___135_3804.FStar_Tactics_Types.goal_ty; FStar_Tactics_Types.opts = uu___135_3804.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = uu___135_3804.FStar_Tactics_Types.is_guard}))
in (bind dismiss (fun uu____3807 -> (add_goals ((new_goal)::[])))))
end)))))
end)))
end))))


let rec clear : FStar_Syntax_Syntax.binder  ->  Prims.unit tac = (fun b -> (bind cur_goal (fun goal -> (

let uu____3819 = (FStar_TypeChecker_Env.pop_bv goal.FStar_Tactics_Types.context)
in (match (uu____3819) with
| FStar_Pervasives_Native.None -> begin
(fail "Cannot clear; empty context")
end
| FStar_Pervasives_Native.Some (b', env') -> begin
(match ((FStar_Syntax_Syntax.bv_eq (FStar_Pervasives_Native.fst b) b')) with
| true -> begin
clear_top
end
| uu____3840 -> begin
(bind revert (fun uu____3843 -> (

let uu____3844 = (clear b)
in (bind uu____3844 (fun uu____3848 -> (bind intro (fun uu____3850 -> (ret ()))))))))
end)
end)))))


let prune : Prims.string  ->  Prims.unit tac = (fun s -> (bind cur_goal (fun g -> (

let ctx = g.FStar_Tactics_Types.context
in (

let ctx' = (FStar_TypeChecker_Env.rem_proof_ns ctx (FStar_Ident.path_of_text s))
in (

let g' = (

let uu___136_3867 = g
in {FStar_Tactics_Types.context = ctx'; FStar_Tactics_Types.witness = uu___136_3867.FStar_Tactics_Types.witness; FStar_Tactics_Types.goal_ty = uu___136_3867.FStar_Tactics_Types.goal_ty; FStar_Tactics_Types.opts = uu___136_3867.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = uu___136_3867.FStar_Tactics_Types.is_guard})
in (bind dismiss (fun uu____3869 -> (add_goals ((g')::[]))))))))))


let addns : Prims.string  ->  Prims.unit tac = (fun s -> (bind cur_goal (fun g -> (

let ctx = g.FStar_Tactics_Types.context
in (

let ctx' = (FStar_TypeChecker_Env.add_proof_ns ctx (FStar_Ident.path_of_text s))
in (

let g' = (

let uu___137_3886 = g
in {FStar_Tactics_Types.context = ctx'; FStar_Tactics_Types.witness = uu___137_3886.FStar_Tactics_Types.witness; FStar_Tactics_Types.goal_ty = uu___137_3886.FStar_Tactics_Types.goal_ty; FStar_Tactics_Types.opts = uu___137_3886.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = uu___137_3886.FStar_Tactics_Types.is_guard})
in (bind dismiss (fun uu____3888 -> (add_goals ((g')::[]))))))))))


let rec mapM : 'a 'b . ('a  ->  'b tac)  ->  'a Prims.list  ->  'b Prims.list tac = (fun f l -> (match (l) with
| [] -> begin
(ret [])
end
| (x)::xs -> begin
(

let uu____3930 = (f x)
in (bind uu____3930 (fun y -> (

let uu____3938 = (mapM f xs)
in (bind uu____3938 (fun ys -> (ret ((y)::ys))))))))
end))


let rec tac_bottom_fold_env : (env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term tac)  ->  env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term tac = (fun f env t -> (

let tn = (

let uu____3984 = (FStar_Syntax_Subst.compress t)
in uu____3984.FStar_Syntax_Syntax.n)
in (

let tn1 = (match (tn) with
| FStar_Syntax_Syntax.Tm_app (hd1, args) -> begin
(

let ff = (tac_bottom_fold_env f env)
in (

let uu____4019 = (ff hd1)
in (bind uu____4019 (fun hd2 -> (

let fa = (fun uu____4039 -> (match (uu____4039) with
| (a, q) -> begin
(

let uu____4052 = (ff a)
in (bind uu____4052 (fun a1 -> (ret ((a1), (q))))))
end))
in (

let uu____4065 = (mapM fa args)
in (bind uu____4065 (fun args1 -> (ret (FStar_Syntax_Syntax.Tm_app (((hd2), (args1)))))))))))))
end
| FStar_Syntax_Syntax.Tm_abs (bs, t1, k) -> begin
(

let uu____4125 = (FStar_Syntax_Subst.open_term bs t1)
in (match (uu____4125) with
| (bs1, t') -> begin
(

let uu____4134 = (

let uu____4137 = (FStar_TypeChecker_Env.push_binders env bs1)
in (tac_bottom_fold_env f uu____4137 t'))
in (bind uu____4134 (fun t'' -> (

let uu____4141 = (

let uu____4142 = (

let uu____4159 = (FStar_Syntax_Subst.close_binders bs1)
in (

let uu____4160 = (FStar_Syntax_Subst.close bs1 t'')
in ((uu____4159), (uu____4160), (k))))
in FStar_Syntax_Syntax.Tm_abs (uu____4142))
in (ret uu____4141)))))
end))
end
| FStar_Syntax_Syntax.Tm_arrow (bs, k) -> begin
(ret tn)
end
| uu____4181 -> begin
(ret tn)
end)
in (bind tn1 (fun tn2 -> (f env (

let uu___138_4185 = t
in {FStar_Syntax_Syntax.n = tn2; FStar_Syntax_Syntax.pos = uu___138_4185.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___138_4185.FStar_Syntax_Syntax.vars})))))))


let pointwise_rec : FStar_Tactics_Types.proofstate  ->  Prims.unit tac  ->  FStar_Options.optionstate  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term tac = (fun ps tau opts env t -> (

let uu____4214 = (FStar_TypeChecker_TcTerm.tc_term env t)
in (match (uu____4214) with
| (t1, lcomp, g) -> begin
(

let uu____4226 = (

let uu____4227 = (FStar_TypeChecker_Rel.is_trivial g)
in (not (uu____4227)))
in (match (uu____4226) with
| true -> begin
(ret t1)
end
| uu____4230 -> begin
(

let typ = lcomp.FStar_Syntax_Syntax.res_typ
in (

let uu____4234 = (new_uvar env typ)
in (bind uu____4234 (fun ut -> ((log ps (fun uu____4245 -> (

let uu____4246 = (FStar_Syntax_Print.term_to_string t1)
in (

let uu____4247 = (FStar_Syntax_Print.term_to_string ut)
in (FStar_Util.print2 "Pointwise_rec: making equality %s = %s\n" uu____4246 uu____4247)))));
(

let uu____4248 = (

let uu____4251 = (

let uu____4252 = (FStar_TypeChecker_TcTerm.universe_of env typ)
in (FStar_Syntax_Util.mk_eq2 uu____4252 typ t1 ut))
in (add_irrelevant_goal env uu____4251 opts))
in (bind uu____4248 (fun uu____4255 -> (

let uu____4256 = (bind tau (fun uu____4261 -> (

let ut1 = (FStar_TypeChecker_Normalize.reduce_uvar_solutions env ut)
in (ret ut1))))
in (focus uu____4256)))));
)))))
end))
end)))


let pointwise : Prims.unit tac  ->  Prims.unit tac = (fun tau -> (bind get (fun ps -> (

let uu____4282 = (match (ps.FStar_Tactics_Types.goals) with
| (g)::gs -> begin
((g), (gs))
end
| [] -> begin
(failwith "Pointwise: no goals")
end)
in (match (uu____4282) with
| (g, gs) -> begin
(

let gt1 = g.FStar_Tactics_Types.goal_ty
in ((log ps (fun uu____4319 -> (

let uu____4320 = (FStar_Syntax_Print.term_to_string gt1)
in (FStar_Util.print1 "Pointwise starting with %s\n" uu____4320))));
(bind dismiss_all (fun uu____4323 -> (

let uu____4324 = (tac_bottom_fold_env (pointwise_rec ps tau g.FStar_Tactics_Types.opts) g.FStar_Tactics_Types.context gt1)
in (bind uu____4324 (fun gt' -> ((log ps (fun uu____4334 -> (

let uu____4335 = (FStar_Syntax_Print.term_to_string gt')
in (FStar_Util.print1 "Pointwise seems to have succeded with %s\n" uu____4335))));
(

let uu____4336 = (push_goals gs)
in (bind uu____4336 (fun uu____4340 -> (add_goals (((

let uu___139_4342 = g
in {FStar_Tactics_Types.context = uu___139_4342.FStar_Tactics_Types.context; FStar_Tactics_Types.witness = uu___139_4342.FStar_Tactics_Types.witness; FStar_Tactics_Types.goal_ty = gt'; FStar_Tactics_Types.opts = uu___139_4342.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = uu___139_4342.FStar_Tactics_Types.is_guard}))::[])))));
))))));
))
end)))))


let trefl : Prims.unit tac = (bind cur_goal (fun g -> (

let uu____4362 = (FStar_Syntax_Util.un_squash g.FStar_Tactics_Types.goal_ty)
in (match (uu____4362) with
| FStar_Pervasives_Native.Some (t) -> begin
(

let uu____4374 = (FStar_Syntax_Util.head_and_args' t)
in (match (uu____4374) with
| (hd1, args) -> begin
(

let uu____4407 = (

let uu____4420 = (

let uu____4421 = (FStar_Syntax_Util.un_uinst hd1)
in uu____4421.FStar_Syntax_Syntax.n)
in ((uu____4420), (args)))
in (match (uu____4407) with
| (FStar_Syntax_Syntax.Tm_fvar (fv), (uu____4435)::((l, uu____4437))::((r, uu____4439))::[]) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.eq2_lid) -> begin
(

let uu____4486 = (

let uu____4487 = (FStar_TypeChecker_Rel.teq_nosmt g.FStar_Tactics_Types.context l r)
in (not (uu____4487)))
in (match (uu____4486) with
| true -> begin
(

let uu____4490 = (FStar_Syntax_Print.term_to_string l)
in (

let uu____4491 = (FStar_Syntax_Print.term_to_string r)
in (fail2 "trefl: not a trivial equality (%s vs %s)" uu____4490 uu____4491)))
end
| uu____4492 -> begin
((solve g FStar_Syntax_Util.exp_unit);
dismiss;
)
end))
end
| (hd2, uu____4495) -> begin
(

let uu____4512 = (FStar_Syntax_Print.term_to_string t)
in (fail1 "trefl: not an equality (%s)" uu____4512))
end))
end))
end
| FStar_Pervasives_Native.None -> begin
(fail "not an irrelevant goal")
end))))


let dup : Prims.unit tac = (bind cur_goal (fun g -> (

let uu____4520 = (new_uvar g.FStar_Tactics_Types.context g.FStar_Tactics_Types.goal_ty)
in (bind uu____4520 (fun u -> (

let g' = (

let uu___140_4527 = g
in {FStar_Tactics_Types.context = uu___140_4527.FStar_Tactics_Types.context; FStar_Tactics_Types.witness = u; FStar_Tactics_Types.goal_ty = uu___140_4527.FStar_Tactics_Types.goal_ty; FStar_Tactics_Types.opts = uu___140_4527.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = uu___140_4527.FStar_Tactics_Types.is_guard})
in (bind dismiss (fun uu____4530 -> (

let uu____4531 = (

let uu____4534 = (

let uu____4535 = (FStar_TypeChecker_TcTerm.universe_of g.FStar_Tactics_Types.context g.FStar_Tactics_Types.goal_ty)
in (FStar_Syntax_Util.mk_eq2 uu____4535 g.FStar_Tactics_Types.goal_ty u g.FStar_Tactics_Types.witness))
in (add_irrelevant_goal g.FStar_Tactics_Types.context uu____4534 g.FStar_Tactics_Types.opts))
in (bind uu____4531 (fun uu____4538 -> (

let uu____4539 = (add_goals ((g')::[]))
in (bind uu____4539 (fun uu____4543 -> (ret ())))))))))))))))


let flip : Prims.unit tac = (bind get (fun ps -> (match (ps.FStar_Tactics_Types.goals) with
| (g1)::(g2)::gs -> begin
(set (

let uu___141_4560 = ps
in {FStar_Tactics_Types.main_context = uu___141_4560.FStar_Tactics_Types.main_context; FStar_Tactics_Types.main_goal = uu___141_4560.FStar_Tactics_Types.main_goal; FStar_Tactics_Types.all_implicits = uu___141_4560.FStar_Tactics_Types.all_implicits; FStar_Tactics_Types.goals = (g2)::(g1)::gs; FStar_Tactics_Types.smt_goals = uu___141_4560.FStar_Tactics_Types.smt_goals}))
end
| uu____4561 -> begin
(fail "flip: less than 2 goals")
end)))


let later : Prims.unit tac = (bind get (fun ps -> (match (ps.FStar_Tactics_Types.goals) with
| [] -> begin
(ret ())
end
| (g)::gs -> begin
(set (

let uu___142_4576 = ps
in {FStar_Tactics_Types.main_context = uu___142_4576.FStar_Tactics_Types.main_context; FStar_Tactics_Types.main_goal = uu___142_4576.FStar_Tactics_Types.main_goal; FStar_Tactics_Types.all_implicits = uu___142_4576.FStar_Tactics_Types.all_implicits; FStar_Tactics_Types.goals = (FStar_List.append gs ((g)::[])); FStar_Tactics_Types.smt_goals = uu___142_4576.FStar_Tactics_Types.smt_goals}))
end)))


let qed : Prims.unit tac = (bind get (fun ps -> (match (ps.FStar_Tactics_Types.goals) with
| [] -> begin
(ret ())
end
| uu____4583 -> begin
(fail "Not done!")
end)))


let cases : FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.term) tac = (fun t -> (bind cur_goal (fun g -> (

let uu____4625 = (g.FStar_Tactics_Types.context.FStar_TypeChecker_Env.type_of g.FStar_Tactics_Types.context t)
in (match (uu____4625) with
| (t1, typ, guard) -> begin
(

let uu____4641 = (FStar_Syntax_Util.head_and_args typ)
in (match (uu____4641) with
| (hd1, args) -> begin
(

let uu____4684 = (

let uu____4697 = (

let uu____4698 = (FStar_Syntax_Util.un_uinst hd1)
in uu____4698.FStar_Syntax_Syntax.n)
in ((uu____4697), (args)))
in (match (uu____4684) with
| (FStar_Syntax_Syntax.Tm_fvar (fv), ((p, uu____4717))::((q, uu____4719))::[]) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.or_lid) -> begin
(

let v_p = (FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None p)
in (

let v_q = (FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None q)
in (

let g1 = (

let uu___143_4757 = g
in (

let uu____4758 = (FStar_TypeChecker_Env.push_bv g.FStar_Tactics_Types.context v_p)
in {FStar_Tactics_Types.context = uu____4758; FStar_Tactics_Types.witness = uu___143_4757.FStar_Tactics_Types.witness; FStar_Tactics_Types.goal_ty = uu___143_4757.FStar_Tactics_Types.goal_ty; FStar_Tactics_Types.opts = uu___143_4757.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = uu___143_4757.FStar_Tactics_Types.is_guard}))
in (

let g2 = (

let uu___144_4760 = g
in (

let uu____4761 = (FStar_TypeChecker_Env.push_bv g.FStar_Tactics_Types.context v_q)
in {FStar_Tactics_Types.context = uu____4761; FStar_Tactics_Types.witness = uu___144_4760.FStar_Tactics_Types.witness; FStar_Tactics_Types.goal_ty = uu___144_4760.FStar_Tactics_Types.goal_ty; FStar_Tactics_Types.opts = uu___144_4760.FStar_Tactics_Types.opts; FStar_Tactics_Types.is_guard = uu___144_4760.FStar_Tactics_Types.is_guard}))
in (bind dismiss (fun uu____4768 -> (

let uu____4769 = (add_goals ((g1)::(g2)::[]))
in (bind uu____4769 (fun uu____4778 -> (

let uu____4779 = (

let uu____4784 = (FStar_Syntax_Syntax.bv_to_name v_p)
in (

let uu____4785 = (FStar_Syntax_Syntax.bv_to_name v_q)
in ((uu____4784), (uu____4785))))
in (ret uu____4779)))))))))))
end
| uu____4790 -> begin
(

let uu____4803 = (FStar_Syntax_Print.term_to_string typ)
in (fail1 "Not a disjunction: %s" uu____4803))
end))
end))
end)))))


let set_options : Prims.string  ->  Prims.unit tac = (fun s -> (bind cur_goal (fun g -> ((FStar_Options.push ());
(

let uu____4826 = (FStar_Util.smap_copy g.FStar_Tactics_Types.opts)
in (FStar_Options.set uu____4826));
(

let res = (FStar_Options.set_options FStar_Options.Set s)
in (

let opts' = (FStar_Options.peek ())
in ((FStar_Options.pop ());
(match (res) with
| FStar_Getopt.Success -> begin
(

let g' = (

let uu___145_4833 = g
in {FStar_Tactics_Types.context = uu___145_4833.FStar_Tactics_Types.context; FStar_Tactics_Types.witness = uu___145_4833.FStar_Tactics_Types.witness; FStar_Tactics_Types.goal_ty = uu___145_4833.FStar_Tactics_Types.goal_ty; FStar_Tactics_Types.opts = opts'; FStar_Tactics_Types.is_guard = uu___145_4833.FStar_Tactics_Types.is_guard})
in (replace_cur g'))
end
| FStar_Getopt.Error (err1) -> begin
(fail2 "Setting options `%s` failed: %s" s err1)
end
| FStar_Getopt.Help -> begin
(fail1 "Setting options `%s` failed (got `Help`?)" s)
end);
)));
))))


let cur_env : FStar_TypeChecker_Env.env tac = (bind cur_goal (fun g -> (FStar_All.pipe_left ret g.FStar_Tactics_Types.context)))


let cur_goal' : FStar_Syntax_Syntax.typ tac = (bind cur_goal (fun g -> (FStar_All.pipe_left ret g.FStar_Tactics_Types.goal_ty)))


let cur_witness : FStar_Syntax_Syntax.term tac = (bind cur_goal (fun g -> (FStar_All.pipe_left ret g.FStar_Tactics_Types.witness)))


let unquote : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term tac = (fun ty tm -> (bind cur_goal (fun goal -> (

let env = (FStar_TypeChecker_Env.set_expected_typ goal.FStar_Tactics_Types.context ty)
in (

let uu____4874 = (goal.FStar_Tactics_Types.context.FStar_TypeChecker_Env.type_of env tm)
in (match (uu____4874) with
| (tm1, typ, guard) -> begin
((FStar_TypeChecker_Rel.force_trivial_guard env guard);
(ret tm1);
)
end))))))


let uvar_env : env  ->  FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option  ->  FStar_Syntax_Syntax.term tac = (fun env ty -> (

let uu____4903 = (match (ty) with
| FStar_Pervasives_Native.Some (ty1) -> begin
(ret ty1)
end
| FStar_Pervasives_Native.None -> begin
(

let uu____4909 = (

let uu____4910 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_left FStar_Pervasives_Native.fst uu____4910))
in (new_uvar env uu____4909))
end)
in (bind uu____4903 (fun typ -> (

let uu____4922 = (new_uvar env typ)
in (bind uu____4922 (fun t -> (ret t))))))))


let unify : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  Prims.bool tac = (fun t1 t2 -> (bind get (fun ps -> (

let uu____4942 = (FStar_TypeChecker_Rel.teq_nosmt ps.FStar_Tactics_Types.main_context t1 t2)
in (ret uu____4942)))))


let launch_process : Prims.string  ->  Prims.string  ->  Prims.string  ->  Prims.string tac = (fun prog args input -> (bind idtac (fun uu____4962 -> (

let uu____4963 = (FStar_Options.unsafe_tactic_exec ())
in (match (uu____4963) with
| true -> begin
(

let s = (FStar_Util.launch_process true "tactic_launch" prog args input (fun uu____4969 uu____4970 -> false))
in (ret s))
end
| uu____4971 -> begin
(fail "launch_process: will not run anything unless --unsafe_tactic_exec is provided")
end)))))


let goal_of_goal_ty : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  (FStar_Tactics_Types.goal * FStar_TypeChecker_Env.guard_t) = (fun env typ -> (

let uu____4992 = (FStar_TypeChecker_Util.new_implicit_var "proofstate_of_goal_ty" typ.FStar_Syntax_Syntax.pos env typ)
in (match (uu____4992) with
| (u, uu____5010, g_u) -> begin
(

let g = (

let uu____5025 = (FStar_Options.peek ())
in {FStar_Tactics_Types.context = env; FStar_Tactics_Types.witness = u; FStar_Tactics_Types.goal_ty = typ; FStar_Tactics_Types.opts = uu____5025; FStar_Tactics_Types.is_guard = false})
in ((g), (g_u)))
end)))


let proofstate_of_goal_ty : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  (FStar_Tactics_Types.proofstate * FStar_Syntax_Syntax.term) = (fun env typ -> (

let uu____5042 = (goal_of_goal_ty env typ)
in (match (uu____5042) with
| (g, g_u) -> begin
(

let ps = {FStar_Tactics_Types.main_context = env; FStar_Tactics_Types.main_goal = g; FStar_Tactics_Types.all_implicits = g_u.FStar_TypeChecker_Env.implicits; FStar_Tactics_Types.goals = (g)::[]; FStar_Tactics_Types.smt_goals = []}
in ((ps), (g.FStar_Tactics_Types.witness)))
end)))




