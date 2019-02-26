open Prims
let mkForall_fuel' :
  'Auu____71171 .
    Prims.string ->
      FStar_Range.range ->
        'Auu____71171 ->
          (FStar_SMTEncoding_Term.pat Prims.list Prims.list *
            FStar_SMTEncoding_Term.fvs * FStar_SMTEncoding_Term.term) ->
            FStar_SMTEncoding_Term.term
  =
  fun mname  ->
    fun r  ->
      fun n1  ->
        fun uu____71202  ->
          match uu____71202 with
          | (pats,vars,body) ->
              let fallback uu____71230 =
                FStar_SMTEncoding_Term.mkForall r (pats, vars, body)  in
              let uu____71235 = FStar_Options.unthrottle_inductives ()  in
              if uu____71235
              then fallback ()
              else
                (let uu____71240 =
                   FStar_SMTEncoding_Env.fresh_fvar mname "f"
                     FStar_SMTEncoding_Term.Fuel_sort
                    in
                 match uu____71240 with
                 | (fsym,fterm) ->
                     let add_fuel1 tms =
                       FStar_All.pipe_right tms
                         (FStar_List.map
                            (fun p  ->
                               match p.FStar_SMTEncoding_Term.tm with
                               | FStar_SMTEncoding_Term.App
                                   (FStar_SMTEncoding_Term.Var
                                    "HasType",args)
                                   ->
                                   FStar_SMTEncoding_Util.mkApp
                                     ("HasTypeFuel", (fterm :: args))
                               | uu____71280 -> p))
                        in
                     let pats1 = FStar_List.map add_fuel1 pats  in
                     let body1 =
                       match body.FStar_SMTEncoding_Term.tm with
                       | FStar_SMTEncoding_Term.App
                           (FStar_SMTEncoding_Term.Imp ,guard::body'::[]) ->
                           let guard1 =
                             match guard.FStar_SMTEncoding_Term.tm with
                             | FStar_SMTEncoding_Term.App
                                 (FStar_SMTEncoding_Term.And ,guards) ->
                                 let uu____71301 = add_fuel1 guards  in
                                 FStar_SMTEncoding_Util.mk_and_l uu____71301
                             | uu____71304 ->
                                 let uu____71305 = add_fuel1 [guard]  in
                                 FStar_All.pipe_right uu____71305
                                   FStar_List.hd
                              in
                           FStar_SMTEncoding_Util.mkImp (guard1, body')
                       | uu____71310 -> body  in
                     let vars1 =
                       let uu____71322 =
                         FStar_SMTEncoding_Term.mk_fv
                           (fsym, FStar_SMTEncoding_Term.Fuel_sort)
                          in
                       uu____71322 :: vars  in
                     FStar_SMTEncoding_Term.mkForall r (pats1, vars1, body1))
  
let (mkForall_fuel :
  Prims.string ->
    FStar_Range.range ->
      (FStar_SMTEncoding_Term.pat Prims.list Prims.list *
        FStar_SMTEncoding_Term.fvs * FStar_SMTEncoding_Term.term) ->
        FStar_SMTEncoding_Term.term)
  = fun mname  -> fun r  -> mkForall_fuel' mname r (Prims.parse_int "1") 
let (head_normal :
  FStar_SMTEncoding_Env.env_t -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun env  ->
    fun t  ->
      let t1 = FStar_Syntax_Util.unmeta t  in
      match t1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_arrow uu____71386 -> true
      | FStar_Syntax_Syntax.Tm_refine uu____71402 -> true
      | FStar_Syntax_Syntax.Tm_bvar uu____71410 -> true
      | FStar_Syntax_Syntax.Tm_uvar uu____71412 -> true
      | FStar_Syntax_Syntax.Tm_abs uu____71426 -> true
      | FStar_Syntax_Syntax.Tm_constant uu____71446 -> true
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let uu____71449 =
            FStar_TypeChecker_Env.lookup_definition
              [FStar_TypeChecker_Env.Eager_unfolding_only]
              env.FStar_SMTEncoding_Env.tcenv
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          FStar_All.pipe_right uu____71449 FStar_Option.isNone
      | FStar_Syntax_Syntax.Tm_app
          ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
             FStar_Syntax_Syntax.pos = uu____71468;
             FStar_Syntax_Syntax.vars = uu____71469;_},uu____71470)
          ->
          let uu____71495 =
            FStar_TypeChecker_Env.lookup_definition
              [FStar_TypeChecker_Env.Eager_unfolding_only]
              env.FStar_SMTEncoding_Env.tcenv
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          FStar_All.pipe_right uu____71495 FStar_Option.isNone
      | uu____71513 -> false
  
let (head_redex :
  FStar_SMTEncoding_Env.env_t -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun env  ->
    fun t  ->
      let uu____71527 =
        let uu____71528 = FStar_Syntax_Util.un_uinst t  in
        uu____71528.FStar_Syntax_Syntax.n  in
      match uu____71527 with
      | FStar_Syntax_Syntax.Tm_abs
          (uu____71532,uu____71533,FStar_Pervasives_Native.Some rc) ->
          ((FStar_Ident.lid_equals rc.FStar_Syntax_Syntax.residual_effect
              FStar_Parser_Const.effect_Tot_lid)
             ||
             (FStar_Ident.lid_equals rc.FStar_Syntax_Syntax.residual_effect
                FStar_Parser_Const.effect_GTot_lid))
            ||
            (FStar_List.existsb
               (fun uu___630_71558  ->
                  match uu___630_71558 with
                  | FStar_Syntax_Syntax.TOTAL  -> true
                  | uu____71561 -> false)
               rc.FStar_Syntax_Syntax.residual_flags)
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let uu____71564 =
            FStar_TypeChecker_Env.lookup_definition
              [FStar_TypeChecker_Env.Eager_unfolding_only]
              env.FStar_SMTEncoding_Env.tcenv
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          FStar_All.pipe_right uu____71564 FStar_Option.isSome
      | uu____71582 -> false
  
let (whnf :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  ->
      let uu____71595 = head_normal env t  in
      if uu____71595
      then t
      else
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.Weak;
          FStar_TypeChecker_Env.HNF;
          FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta;
          FStar_TypeChecker_Env.Eager_unfolding;
          FStar_TypeChecker_Env.EraseUniverses]
          env.FStar_SMTEncoding_Env.tcenv t
  
let (norm :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  ->
      FStar_TypeChecker_Normalize.normalize
        [FStar_TypeChecker_Env.Beta;
        FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta;
        FStar_TypeChecker_Env.Eager_unfolding;
        FStar_TypeChecker_Env.EraseUniverses] env.FStar_SMTEncoding_Env.tcenv
        t
  
let (trivial_post : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t  ->
    let uu____71617 =
      let uu____71618 = FStar_Syntax_Syntax.null_binder t  in [uu____71618]
       in
    let uu____71637 =
      FStar_Syntax_Syntax.fvar FStar_Parser_Const.true_lid
        FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
       in
    FStar_Syntax_Util.abs uu____71617 uu____71637
      FStar_Pervasives_Native.None
  
let (mk_Apply :
  FStar_SMTEncoding_Term.term ->
    FStar_SMTEncoding_Term.fvs -> FStar_SMTEncoding_Term.term)
  =
  fun e  ->
    fun vars  ->
      FStar_All.pipe_right vars
        (FStar_List.fold_left
           (fun out  ->
              fun var  ->
                let uu____71659 = FStar_SMTEncoding_Term.fv_sort var  in
                match uu____71659 with
                | FStar_SMTEncoding_Term.Fuel_sort  ->
                    let uu____71660 = FStar_SMTEncoding_Util.mkFreeV var  in
                    FStar_SMTEncoding_Term.mk_ApplyTF out uu____71660
                | s ->
                    let uu____71663 = FStar_SMTEncoding_Util.mkFreeV var  in
                    FStar_SMTEncoding_Util.mk_ApplyTT out uu____71663) e)
  
let (mk_Apply_args :
  FStar_SMTEncoding_Term.term ->
    FStar_SMTEncoding_Term.term Prims.list -> FStar_SMTEncoding_Term.term)
  =
  fun e  ->
    fun args  ->
      FStar_All.pipe_right args
        (FStar_List.fold_left FStar_SMTEncoding_Util.mk_ApplyTT e)
  
let raise_arity_mismatch :
  'a . Prims.string -> Prims.int -> Prims.int -> FStar_Range.range -> 'a =
  fun head1  ->
    fun arity  ->
      fun n_args  ->
        fun rng  ->
          let uu____71719 =
            let uu____71725 =
              let uu____71727 = FStar_Util.string_of_int arity  in
              let uu____71729 = FStar_Util.string_of_int n_args  in
              FStar_Util.format3
                "Head symbol %s expects at least %s arguments; got only %s"
                head1 uu____71727 uu____71729
               in
            (FStar_Errors.Fatal_SMTEncodingArityMismatch, uu____71725)  in
          FStar_Errors.raise_error uu____71719 rng
  
let (maybe_curry_app :
  FStar_Range.range ->
    (FStar_SMTEncoding_Term.op,FStar_SMTEncoding_Term.term) FStar_Util.either
      ->
      Prims.int ->
        FStar_SMTEncoding_Term.term Prims.list -> FStar_SMTEncoding_Term.term)
  =
  fun rng  ->
    fun head1  ->
      fun arity  ->
        fun args  ->
          let n_args = FStar_List.length args  in
          match head1 with
          | FStar_Util.Inr head2 -> mk_Apply_args head2 args
          | FStar_Util.Inl head2 ->
              if n_args = arity
              then FStar_SMTEncoding_Util.mkApp' (head2, args)
              else
                if n_args > arity
                then
                  (let uu____71788 = FStar_Util.first_N arity args  in
                   match uu____71788 with
                   | (args1,rest) ->
                       let head3 =
                         FStar_SMTEncoding_Util.mkApp' (head2, args1)  in
                       mk_Apply_args head3 rest)
                else
                  (let uu____71812 =
                     FStar_SMTEncoding_Term.op_to_string head2  in
                   raise_arity_mismatch uu____71812 arity n_args rng)
  
let (maybe_curry_fvb :
  FStar_Range.range ->
    FStar_SMTEncoding_Env.fvar_binding ->
      FStar_SMTEncoding_Term.term Prims.list -> FStar_SMTEncoding_Term.term)
  =
  fun rng  ->
    fun fvb  ->
      fun args  ->
        if fvb.FStar_SMTEncoding_Env.fvb_thunked
        then
          let uu____71839 = FStar_SMTEncoding_Env.force_thunk fvb  in
          mk_Apply_args uu____71839 args
        else
          maybe_curry_app rng
            (FStar_Util.Inl
               (FStar_SMTEncoding_Term.Var (fvb.FStar_SMTEncoding_Env.smt_id)))
            fvb.FStar_SMTEncoding_Env.smt_arity args
  
let (is_app : FStar_SMTEncoding_Term.op -> Prims.bool) =
  fun uu___631_71848  ->
    match uu___631_71848 with
    | FStar_SMTEncoding_Term.Var "ApplyTT" -> true
    | FStar_SMTEncoding_Term.Var "ApplyTF" -> true
    | uu____71854 -> false
  
let (is_an_eta_expansion :
  FStar_SMTEncoding_Env.env_t ->
    FStar_SMTEncoding_Term.fv Prims.list ->
      FStar_SMTEncoding_Term.term ->
        FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun vars  ->
      fun body  ->
        let rec check_partial_applications t xs =
          match ((t.FStar_SMTEncoding_Term.tm), xs) with
          | (FStar_SMTEncoding_Term.App
             (app,f::{
                       FStar_SMTEncoding_Term.tm =
                         FStar_SMTEncoding_Term.FreeV y;
                       FStar_SMTEncoding_Term.freevars = uu____71902;
                       FStar_SMTEncoding_Term.rng = uu____71903;_}::[]),x::xs1)
              when (is_app app) && (FStar_SMTEncoding_Term.fv_eq x y) ->
              check_partial_applications f xs1
          | (FStar_SMTEncoding_Term.App
             (FStar_SMTEncoding_Term.Var f,args),uu____71934) ->
              let uu____71944 =
                ((FStar_List.length args) = (FStar_List.length xs)) &&
                  (FStar_List.forall2
                     (fun a  ->
                        fun v1  ->
                          match a.FStar_SMTEncoding_Term.tm with
                          | FStar_SMTEncoding_Term.FreeV fv ->
                              FStar_SMTEncoding_Term.fv_eq fv v1
                          | uu____71961 -> false) args (FStar_List.rev xs))
                 in
              if uu____71944
              then FStar_SMTEncoding_Env.tok_of_name env f
              else FStar_Pervasives_Native.None
          | (uu____71968,[]) ->
              let fvs = FStar_SMTEncoding_Term.free_variables t  in
              let uu____71972 =
                FStar_All.pipe_right fvs
                  (FStar_List.for_all
                     (fun fv  ->
                        let uu____71980 =
                          FStar_Util.for_some
                            (FStar_SMTEncoding_Term.fv_eq fv) vars
                           in
                        Prims.op_Negation uu____71980))
                 in
              if uu____71972
              then FStar_Pervasives_Native.Some t
              else FStar_Pervasives_Native.None
          | uu____71987 -> FStar_Pervasives_Native.None  in
        check_partial_applications body (FStar_List.rev vars)
  
let check_pattern_vars :
  'Auu____72005 'Auu____72006 .
    FStar_SMTEncoding_Env.env_t ->
      (FStar_Syntax_Syntax.bv * 'Auu____72005) Prims.list ->
        (FStar_Syntax_Syntax.term * 'Auu____72006) Prims.list -> unit
  =
  fun env  ->
    fun vars  ->
      fun pats  ->
        let pats1 =
          FStar_All.pipe_right pats
            (FStar_List.map
               (fun uu____72064  ->
                  match uu____72064 with
                  | (x,uu____72070) ->
                      FStar_TypeChecker_Normalize.normalize
                        [FStar_TypeChecker_Env.Beta;
                        FStar_TypeChecker_Env.AllowUnboundUniverses;
                        FStar_TypeChecker_Env.EraseUniverses]
                        env.FStar_SMTEncoding_Env.tcenv x))
           in
        match pats1 with
        | [] -> ()
        | hd1::tl1 ->
            let pat_vars =
              let uu____72078 = FStar_Syntax_Free.names hd1  in
              FStar_List.fold_left
                (fun out  ->
                   fun x  ->
                     let uu____72090 = FStar_Syntax_Free.names x  in
                     FStar_Util.set_union out uu____72090) uu____72078 tl1
               in
            let uu____72093 =
              FStar_All.pipe_right vars
                (FStar_Util.find_opt
                   (fun uu____72120  ->
                      match uu____72120 with
                      | (b,uu____72127) ->
                          let uu____72128 = FStar_Util.set_mem b pat_vars  in
                          Prims.op_Negation uu____72128))
               in
            (match uu____72093 with
             | FStar_Pervasives_Native.None  -> ()
             | FStar_Pervasives_Native.Some (x,uu____72135) ->
                 let pos =
                   FStar_List.fold_left
                     (fun out  ->
                        fun t  ->
                          FStar_Range.union_ranges out
                            t.FStar_Syntax_Syntax.pos)
                     hd1.FStar_Syntax_Syntax.pos tl1
                    in
                 let uu____72149 =
                   let uu____72155 =
                     let uu____72157 = FStar_Syntax_Print.bv_to_string x  in
                     FStar_Util.format1
                       "SMT pattern misses at least one bound variable: %s"
                       uu____72157
                      in
                   (FStar_Errors.Warning_SMTPatternMissingBoundVar,
                     uu____72155)
                    in
                 FStar_Errors.log_issue pos uu____72149)
  
type label = (FStar_SMTEncoding_Term.fv * Prims.string * FStar_Range.range)
type labels = label Prims.list
type pattern =
  {
  pat_vars: (FStar_Syntax_Syntax.bv * FStar_SMTEncoding_Term.fv) Prims.list ;
  pat_term:
    unit -> (FStar_SMTEncoding_Term.term * FStar_SMTEncoding_Term.decls_t) ;
  guard: FStar_SMTEncoding_Term.term -> FStar_SMTEncoding_Term.term ;
  projections:
    FStar_SMTEncoding_Term.term ->
      (FStar_Syntax_Syntax.bv * FStar_SMTEncoding_Term.term) Prims.list
    }
let (__proj__Mkpattern__item__pat_vars :
  pattern -> (FStar_Syntax_Syntax.bv * FStar_SMTEncoding_Term.fv) Prims.list)
  =
  fun projectee  ->
    match projectee with
    | { pat_vars; pat_term; guard; projections;_} -> pat_vars
  
let (__proj__Mkpattern__item__pat_term :
  pattern ->
    unit -> (FStar_SMTEncoding_Term.term * FStar_SMTEncoding_Term.decls_t))
  =
  fun projectee  ->
    match projectee with
    | { pat_vars; pat_term; guard; projections;_} -> pat_term
  
let (__proj__Mkpattern__item__guard :
  pattern -> FStar_SMTEncoding_Term.term -> FStar_SMTEncoding_Term.term) =
  fun projectee  ->
    match projectee with
    | { pat_vars; pat_term; guard; projections;_} -> guard
  
let (__proj__Mkpattern__item__projections :
  pattern ->
    FStar_SMTEncoding_Term.term ->
      (FStar_Syntax_Syntax.bv * FStar_SMTEncoding_Term.term) Prims.list)
  =
  fun projectee  ->
    match projectee with
    | { pat_vars; pat_term; guard; projections;_} -> projections
  
let (as_function_typ :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t0  ->
      let rec aux norm1 t =
        let t1 = FStar_Syntax_Subst.compress t  in
        match t1.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Tm_arrow uu____72443 -> t1
        | FStar_Syntax_Syntax.Tm_refine uu____72458 ->
            let uu____72465 = FStar_Syntax_Util.unrefine t1  in
            aux true uu____72465
        | uu____72467 ->
            if norm1
            then let uu____72469 = whnf env t1  in aux false uu____72469
            else
              (let uu____72473 =
                 let uu____72475 =
                   FStar_Range.string_of_range t0.FStar_Syntax_Syntax.pos  in
                 let uu____72477 = FStar_Syntax_Print.term_to_string t0  in
                 FStar_Util.format2 "(%s) Expected a function typ; got %s"
                   uu____72475 uu____72477
                  in
               failwith uu____72473)
         in
      aux true t0
  
let rec (curried_arrow_formals_comp :
  FStar_Syntax_Syntax.term ->
    (FStar_Syntax_Syntax.binders * FStar_Syntax_Syntax.comp))
  =
  fun k  ->
    let k1 = FStar_Syntax_Subst.compress k  in
    match k1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
        FStar_Syntax_Subst.open_comp bs c
    | FStar_Syntax_Syntax.Tm_refine (bv,uu____72519) ->
        let uu____72524 =
          curried_arrow_formals_comp bv.FStar_Syntax_Syntax.sort  in
        (match uu____72524 with
         | (args,res) ->
             (match args with
              | [] ->
                  let uu____72545 = FStar_Syntax_Syntax.mk_Total k1  in
                  ([], uu____72545)
              | uu____72552 -> (args, res)))
    | uu____72553 ->
        let uu____72554 = FStar_Syntax_Syntax.mk_Total k1  in
        ([], uu____72554)
  
let is_arithmetic_primitive :
  'Auu____72568 .
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      'Auu____72568 Prims.list -> Prims.bool
  =
  fun head1  ->
    fun args  ->
      match ((head1.FStar_Syntax_Syntax.n), args) with
      | (FStar_Syntax_Syntax.Tm_fvar fv,uu____72591::uu____72592::[]) ->
          ((((((((((((FStar_Syntax_Syntax.fv_eq_lid fv
                        FStar_Parser_Const.op_Addition)
                       ||
                       (FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.op_Subtraction))
                      ||
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Parser_Const.op_Multiply))
                     ||
                     (FStar_Syntax_Syntax.fv_eq_lid fv
                        FStar_Parser_Const.op_Division))
                    ||
                    (FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Parser_Const.op_Modulus))
                   ||
                   (FStar_Syntax_Syntax.fv_eq_lid fv
                      FStar_Parser_Const.real_op_LT))
                  ||
                  (FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.real_op_LTE))
                 ||
                 (FStar_Syntax_Syntax.fv_eq_lid fv
                    FStar_Parser_Const.real_op_GT))
                ||
                (FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.real_op_GTE))
               ||
               (FStar_Syntax_Syntax.fv_eq_lid fv
                  FStar_Parser_Const.real_op_Addition))
              ||
              (FStar_Syntax_Syntax.fv_eq_lid fv
                 FStar_Parser_Const.real_op_Subtraction))
             ||
             (FStar_Syntax_Syntax.fv_eq_lid fv
                FStar_Parser_Const.real_op_Multiply))
            ||
            (FStar_Syntax_Syntax.fv_eq_lid fv
               FStar_Parser_Const.real_op_Division)
      | (FStar_Syntax_Syntax.Tm_fvar fv,uu____72596::[]) ->
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.op_Minus
      | uu____72599 -> false
  
let (isInteger : FStar_Syntax_Syntax.term' -> Prims.bool) =
  fun tm  ->
    match tm with
    | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int
        (n1,FStar_Pervasives_Native.None )) -> true
    | uu____72630 -> false
  
let (getInteger : FStar_Syntax_Syntax.term' -> Prims.int) =
  fun tm  ->
    match tm with
    | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int
        (n1,FStar_Pervasives_Native.None )) -> FStar_Util.int_of_string n1
    | uu____72653 -> failwith "Expected an Integer term"
  
let is_BitVector_primitive :
  'Auu____72663 .
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * 'Auu____72663)
        Prims.list -> Prims.bool
  =
  fun head1  ->
    fun args  ->
      match ((head1.FStar_Syntax_Syntax.n), args) with
      | (FStar_Syntax_Syntax.Tm_fvar
         fv,(sz_arg,uu____72705)::uu____72706::uu____72707::[]) ->
          (((((((((((FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Parser_Const.bv_and_lid)
                      ||
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Parser_Const.bv_xor_lid))
                     ||
                     (FStar_Syntax_Syntax.fv_eq_lid fv
                        FStar_Parser_Const.bv_or_lid))
                    ||
                    (FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Parser_Const.bv_add_lid))
                   ||
                   (FStar_Syntax_Syntax.fv_eq_lid fv
                      FStar_Parser_Const.bv_sub_lid))
                  ||
                  (FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.bv_shift_left_lid))
                 ||
                 (FStar_Syntax_Syntax.fv_eq_lid fv
                    FStar_Parser_Const.bv_shift_right_lid))
                ||
                (FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.bv_udiv_lid))
               ||
               (FStar_Syntax_Syntax.fv_eq_lid fv
                  FStar_Parser_Const.bv_mod_lid))
              ||
              (FStar_Syntax_Syntax.fv_eq_lid fv
                 FStar_Parser_Const.bv_uext_lid))
             ||
             (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.bv_mul_lid))
            && (isInteger sz_arg.FStar_Syntax_Syntax.n)
      | (FStar_Syntax_Syntax.Tm_fvar
         fv,(sz_arg,uu____72758)::uu____72759::[]) ->
          ((FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.nat_to_bv_lid)
             ||
             (FStar_Syntax_Syntax.fv_eq_lid fv
                FStar_Parser_Const.bv_to_nat_lid))
            && (isInteger sz_arg.FStar_Syntax_Syntax.n)
      | uu____72796 -> false
  
let rec (encode_const :
  FStar_Const.sconst ->
    FStar_SMTEncoding_Env.env_t ->
      (FStar_SMTEncoding_Term.term * FStar_SMTEncoding_Term.decls_t))
  =
  fun c  ->
    fun env  ->
      match c with
      | FStar_Const.Const_unit  -> (FStar_SMTEncoding_Term.mk_Term_unit, [])
      | FStar_Const.Const_bool (true ) ->
          let uu____73120 =
            FStar_SMTEncoding_Term.boxBool FStar_SMTEncoding_Util.mkTrue  in
          (uu____73120, [])
      | FStar_Const.Const_bool (false ) ->
          let uu____73122 =
            FStar_SMTEncoding_Term.boxBool FStar_SMTEncoding_Util.mkFalse  in
          (uu____73122, [])
      | FStar_Const.Const_char c1 ->
          let uu____73125 =
            let uu____73126 =
              let uu____73134 =
                let uu____73137 =
                  let uu____73138 =
                    FStar_SMTEncoding_Util.mkInteger'
                      (FStar_Util.int_of_char c1)
                     in
                  FStar_SMTEncoding_Term.boxInt uu____73138  in
                [uu____73137]  in
              ("FStar.Char.__char_of_int", uu____73134)  in
            FStar_SMTEncoding_Util.mkApp uu____73126  in
          (uu____73125, [])
      | FStar_Const.Const_int (i,FStar_Pervasives_Native.None ) ->
          let uu____73156 =
            let uu____73157 = FStar_SMTEncoding_Util.mkInteger i  in
            FStar_SMTEncoding_Term.boxInt uu____73157  in
          (uu____73156, [])
      | FStar_Const.Const_int (repr,FStar_Pervasives_Native.Some sw) ->
          let syntax_term =
            FStar_ToSyntax_ToSyntax.desugar_machine_integer
              (env.FStar_SMTEncoding_Env.tcenv).FStar_TypeChecker_Env.dsenv
              repr sw FStar_Range.dummyRange
             in
          encode_term syntax_term env
      | FStar_Const.Const_string (s,uu____73178) ->
          let uu____73181 =
            FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.string_const s
             in
          (uu____73181, [])
      | FStar_Const.Const_range uu____73182 ->
          let uu____73183 = FStar_SMTEncoding_Term.mk_Range_const ()  in
          (uu____73183, [])
      | FStar_Const.Const_effect  ->
          (FStar_SMTEncoding_Term.mk_Term_type, [])
      | FStar_Const.Const_real r ->
          let uu____73186 =
            let uu____73187 = FStar_SMTEncoding_Util.mkReal r  in
            FStar_SMTEncoding_Term.boxReal uu____73187  in
          (uu____73186, [])
      | c1 ->
          let uu____73189 =
            let uu____73191 = FStar_Syntax_Print.const_to_string c1  in
            FStar_Util.format1 "Unhandled constant: %s" uu____73191  in
          failwith uu____73189

and (encode_binders :
  FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option ->
    FStar_Syntax_Syntax.binders ->
      FStar_SMTEncoding_Env.env_t ->
        (FStar_SMTEncoding_Term.fv Prims.list * FStar_SMTEncoding_Term.term
          Prims.list * FStar_SMTEncoding_Env.env_t *
          FStar_SMTEncoding_Term.decls_t * FStar_Syntax_Syntax.bv Prims.list))
  =
  fun fuel_opt  ->
    fun bs  ->
      fun env  ->
        (let uu____73220 =
           FStar_TypeChecker_Env.debug env.FStar_SMTEncoding_Env.tcenv
             FStar_Options.Medium
            in
         if uu____73220
         then
           let uu____73223 = FStar_Syntax_Print.binders_to_string ", " bs  in
           FStar_Util.print1 "Encoding binders %s\n" uu____73223
         else ());
        (let uu____73229 =
           FStar_All.pipe_right bs
             (FStar_List.fold_left
                (fun uu____73311  ->
                   fun b  ->
                     match uu____73311 with
                     | (vars,guards,env1,decls,names1) ->
                         let uu____73376 =
                           let x = FStar_Pervasives_Native.fst b  in
                           let uu____73392 =
                             FStar_SMTEncoding_Env.gen_term_var env1 x  in
                           match uu____73392 with
                           | (xxsym,xx,env') ->
                               let uu____73417 =
                                 let uu____73422 =
                                   norm env1 x.FStar_Syntax_Syntax.sort  in
                                 encode_term_pred fuel_opt uu____73422 env1
                                   xx
                                  in
                               (match uu____73417 with
                                | (guard_x_t,decls') ->
                                    let uu____73437 =
                                      FStar_SMTEncoding_Term.mk_fv
                                        (xxsym,
                                          FStar_SMTEncoding_Term.Term_sort)
                                       in
                                    (uu____73437, guard_x_t, env', decls', x))
                            in
                         (match uu____73376 with
                          | (v1,g,env2,decls',n1) ->
                              ((v1 :: vars), (g :: guards), env2,
                                (FStar_List.append decls decls'), (n1 ::
                                names1)))) ([], [], env, [], []))
            in
         match uu____73229 with
         | (vars,guards,env1,decls,names1) ->
             ((FStar_List.rev vars), (FStar_List.rev guards), env1, decls,
               (FStar_List.rev names1)))

and (encode_term_pred :
  FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option ->
    FStar_Syntax_Syntax.typ ->
      FStar_SMTEncoding_Env.env_t ->
        FStar_SMTEncoding_Term.term ->
          (FStar_SMTEncoding_Term.term * FStar_SMTEncoding_Term.decls_t))
  =
  fun fuel_opt  ->
    fun t  ->
      fun env  ->
        fun e  ->
          let uu____73537 = encode_term t env  in
          match uu____73537 with
          | (t1,decls) ->
              let uu____73548 =
                FStar_SMTEncoding_Term.mk_HasTypeWithFuel fuel_opt e t1  in
              (uu____73548, decls)

and (encode_term_pred' :
  FStar_SMTEncoding_Term.term FStar_Pervasives_Native.option ->
    FStar_Syntax_Syntax.typ ->
      FStar_SMTEncoding_Env.env_t ->
        FStar_SMTEncoding_Term.term ->
          (FStar_SMTEncoding_Term.term * FStar_SMTEncoding_Term.decls_t))
  =
  fun fuel_opt  ->
    fun t  ->
      fun env  ->
        fun e  ->
          let uu____73559 = encode_term t env  in
          match uu____73559 with
          | (t1,decls) ->
              (match fuel_opt with
               | FStar_Pervasives_Native.None  ->
                   let uu____73574 = FStar_SMTEncoding_Term.mk_HasTypeZ e t1
                      in
                   (uu____73574, decls)
               | FStar_Pervasives_Native.Some f ->
                   let uu____73576 =
                     FStar_SMTEncoding_Term.mk_HasTypeFuel f e t1  in
                   (uu____73576, decls))

and (encode_arith_term :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.args ->
        (FStar_SMTEncoding_Term.term * FStar_SMTEncoding_Term.decls_t))
  =
  fun env  ->
    fun head1  ->
      fun args_e  ->
        let uu____73582 = encode_args args_e env  in
        match uu____73582 with
        | (arg_tms,decls) ->
            let head_fv =
              match head1.FStar_Syntax_Syntax.n with
              | FStar_Syntax_Syntax.Tm_fvar fv -> fv
              | uu____73601 -> failwith "Impossible"  in
            let unary unbox arg_tms1 =
              let uu____73623 = FStar_List.hd arg_tms1  in unbox uu____73623
               in
            let binary unbox arg_tms1 =
              let uu____73648 =
                let uu____73649 = FStar_List.hd arg_tms1  in
                unbox uu____73649  in
              let uu____73650 =
                let uu____73651 =
                  let uu____73652 = FStar_List.tl arg_tms1  in
                  FStar_List.hd uu____73652  in
                unbox uu____73651  in
              (uu____73648, uu____73650)  in
            let mk_default uu____73660 =
              let uu____73661 =
                FStar_SMTEncoding_Env.lookup_free_var_sym env
                  head_fv.FStar_Syntax_Syntax.fv_name
                 in
              match uu____73661 with
              | (fname,fuel_args,arity) ->
                  let args = FStar_List.append fuel_args arg_tms  in
                  maybe_curry_app head1.FStar_Syntax_Syntax.pos fname arity
                    args
               in
            let mk_l box op mk_args ts =
              let uu____73750 = FStar_Options.smtencoding_l_arith_native ()
                 in
              if uu____73750
              then
                let uu____73753 =
                  let uu____73754 = mk_args ts  in op uu____73754  in
                FStar_All.pipe_right uu____73753 box
              else mk_default ()  in
            let mk_nl box unbox nm op ts =
              let uu____73812 = FStar_Options.smtencoding_nl_arith_wrapped ()
                 in
              if uu____73812
              then
                let uu____73815 = binary unbox ts  in
                match uu____73815 with
                | (t1,t2) ->
                    let uu____73822 =
                      FStar_SMTEncoding_Util.mkApp (nm, [t1; t2])  in
                    FStar_All.pipe_right uu____73822 box
              else
                (let uu____73828 =
                   FStar_Options.smtencoding_nl_arith_native ()  in
                 if uu____73828
                 then
                   let uu____73831 =
                     let uu____73832 = binary unbox ts  in op uu____73832  in
                   FStar_All.pipe_right uu____73831 box
                 else mk_default ())
               in
            let add1 box unbox =
              mk_l box FStar_SMTEncoding_Util.mkAdd (binary unbox)  in
            let sub1 box unbox =
              mk_l box FStar_SMTEncoding_Util.mkSub (binary unbox)  in
            let minus1 box unbox =
              mk_l box FStar_SMTEncoding_Util.mkMinus (unary unbox)  in
            let mul1 box unbox nm =
              mk_nl box unbox nm FStar_SMTEncoding_Util.mkMul  in
            let div1 box unbox nm =
              mk_nl box unbox nm FStar_SMTEncoding_Util.mkDiv  in
            let modulus box unbox =
              mk_nl box unbox "_mod" FStar_SMTEncoding_Util.mkMod  in
            let ops =
              [(FStar_Parser_Const.op_Addition,
                 (add1 FStar_SMTEncoding_Term.boxInt
                    FStar_SMTEncoding_Term.unboxInt));
              (FStar_Parser_Const.op_Subtraction,
                (sub1 FStar_SMTEncoding_Term.boxInt
                   FStar_SMTEncoding_Term.unboxInt));
              (FStar_Parser_Const.op_Multiply,
                (mul1 FStar_SMTEncoding_Term.boxInt
                   FStar_SMTEncoding_Term.unboxInt "_mul"));
              (FStar_Parser_Const.op_Division,
                (div1 FStar_SMTEncoding_Term.boxInt
                   FStar_SMTEncoding_Term.unboxInt "_div"));
              (FStar_Parser_Const.op_Modulus,
                (modulus FStar_SMTEncoding_Term.boxInt
                   FStar_SMTEncoding_Term.unboxInt));
              (FStar_Parser_Const.op_Minus,
                (minus1 FStar_SMTEncoding_Term.boxInt
                   FStar_SMTEncoding_Term.unboxInt));
              (FStar_Parser_Const.real_op_Addition,
                (add1 FStar_SMTEncoding_Term.boxReal
                   FStar_SMTEncoding_Term.unboxReal));
              (FStar_Parser_Const.real_op_Subtraction,
                (sub1 FStar_SMTEncoding_Term.boxReal
                   FStar_SMTEncoding_Term.unboxReal));
              (FStar_Parser_Const.real_op_Multiply,
                (mul1 FStar_SMTEncoding_Term.boxReal
                   FStar_SMTEncoding_Term.unboxReal "_rmul"));
              (FStar_Parser_Const.real_op_Division,
                (mk_nl FStar_SMTEncoding_Term.boxReal
                   FStar_SMTEncoding_Term.unboxReal "_rdiv"
                   FStar_SMTEncoding_Util.mkRealDiv));
              (FStar_Parser_Const.real_op_LT,
                (mk_l FStar_SMTEncoding_Term.boxBool
                   FStar_SMTEncoding_Util.mkLT
                   (binary FStar_SMTEncoding_Term.unboxReal)));
              (FStar_Parser_Const.real_op_LTE,
                (mk_l FStar_SMTEncoding_Term.boxBool
                   FStar_SMTEncoding_Util.mkLTE
                   (binary FStar_SMTEncoding_Term.unboxReal)));
              (FStar_Parser_Const.real_op_GT,
                (mk_l FStar_SMTEncoding_Term.boxBool
                   FStar_SMTEncoding_Util.mkGT
                   (binary FStar_SMTEncoding_Term.unboxReal)));
              (FStar_Parser_Const.real_op_GTE,
                (mk_l FStar_SMTEncoding_Term.boxBool
                   FStar_SMTEncoding_Util.mkGTE
                   (binary FStar_SMTEncoding_Term.unboxReal)))]
               in
            let uu____74267 =
              let uu____74277 =
                FStar_List.tryFind
                  (fun uu____74301  ->
                     match uu____74301 with
                     | (l,uu____74312) ->
                         FStar_Syntax_Syntax.fv_eq_lid head_fv l) ops
                 in
              FStar_All.pipe_right uu____74277 FStar_Util.must  in
            (match uu____74267 with
             | (uu____74356,op) ->
                 let uu____74368 = op arg_tms  in (uu____74368, decls))

and (encode_BitVector_term :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax *
        FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option)
        Prims.list ->
        (FStar_SMTEncoding_Term.term * FStar_SMTEncoding_Term.decls_elt
          Prims.list))
  =
  fun env  ->
    fun head1  ->
      fun args_e  ->
        let uu____74384 = FStar_List.hd args_e  in
        match uu____74384 with
        | (tm_sz,uu____74400) ->
            let uu____74409 = uu____74384  in
            let sz = getInteger tm_sz.FStar_Syntax_Syntax.n  in
            let sz_key =
              FStar_Util.format1 "BitVector_%s" (Prims.string_of_int sz)  in
            let sz_decls =
              let t_decls1 = FStar_SMTEncoding_Term.mkBvConstructor sz  in
              FStar_SMTEncoding_Term.mk_decls "" sz_key t_decls1 []  in
            let uu____74420 =
              match ((head1.FStar_Syntax_Syntax.n), args_e) with
              | (FStar_Syntax_Syntax.Tm_fvar
                 fv,uu____74446::(sz_arg,uu____74448)::uu____74449::[]) when
                  (FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.bv_uext_lid)
                    && (isInteger sz_arg.FStar_Syntax_Syntax.n)
                  ->
                  let uu____74516 =
                    let uu____74517 = FStar_List.tail args_e  in
                    FStar_List.tail uu____74517  in
                  let uu____74544 =
                    let uu____74548 = getInteger sz_arg.FStar_Syntax_Syntax.n
                       in
                    FStar_Pervasives_Native.Some uu____74548  in
                  (uu____74516, uu____74544)
              | (FStar_Syntax_Syntax.Tm_fvar
                 fv,uu____74555::(sz_arg,uu____74557)::uu____74558::[]) when
                  FStar_Syntax_Syntax.fv_eq_lid fv
                    FStar_Parser_Const.bv_uext_lid
                  ->
                  let uu____74625 =
                    let uu____74627 =
                      FStar_Syntax_Print.term_to_string sz_arg  in
                    FStar_Util.format1
                      "Not a constant bitvector extend size: %s" uu____74627
                     in
                  failwith uu____74625
              | uu____74637 ->
                  let uu____74652 = FStar_List.tail args_e  in
                  (uu____74652, FStar_Pervasives_Native.None)
               in
            (match uu____74420 with
             | (arg_tms,ext_sz) ->
                 let uu____74679 = encode_args arg_tms env  in
                 (match uu____74679 with
                  | (arg_tms1,decls) ->
                      let head_fv =
                        match head1.FStar_Syntax_Syntax.n with
                        | FStar_Syntax_Syntax.Tm_fvar fv -> fv
                        | uu____74700 -> failwith "Impossible"  in
                      let unary arg_tms2 =
                        let uu____74712 = FStar_List.hd arg_tms2  in
                        FStar_SMTEncoding_Term.unboxBitVec sz uu____74712  in
                      let unary_arith arg_tms2 =
                        let uu____74723 = FStar_List.hd arg_tms2  in
                        FStar_SMTEncoding_Term.unboxInt uu____74723  in
                      let binary arg_tms2 =
                        let uu____74738 =
                          let uu____74739 = FStar_List.hd arg_tms2  in
                          FStar_SMTEncoding_Term.unboxBitVec sz uu____74739
                           in
                        let uu____74740 =
                          let uu____74741 =
                            let uu____74742 = FStar_List.tl arg_tms2  in
                            FStar_List.hd uu____74742  in
                          FStar_SMTEncoding_Term.unboxBitVec sz uu____74741
                           in
                        (uu____74738, uu____74740)  in
                      let binary_arith arg_tms2 =
                        let uu____74759 =
                          let uu____74760 = FStar_List.hd arg_tms2  in
                          FStar_SMTEncoding_Term.unboxBitVec sz uu____74760
                           in
                        let uu____74761 =
                          let uu____74762 =
                            let uu____74763 = FStar_List.tl arg_tms2  in
                            FStar_List.hd uu____74763  in
                          FStar_SMTEncoding_Term.unboxInt uu____74762  in
                        (uu____74759, uu____74761)  in
                      let mk_bv op mk_args resBox ts =
                        let uu____74821 =
                          let uu____74822 = mk_args ts  in op uu____74822  in
                        FStar_All.pipe_right uu____74821 resBox  in
                      let bv_and =
                        mk_bv FStar_SMTEncoding_Util.mkBvAnd binary
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_xor =
                        mk_bv FStar_SMTEncoding_Util.mkBvXor binary
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_or =
                        mk_bv FStar_SMTEncoding_Util.mkBvOr binary
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_add =
                        mk_bv FStar_SMTEncoding_Util.mkBvAdd binary
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_sub =
                        mk_bv FStar_SMTEncoding_Util.mkBvSub binary
                          (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_shl =
                        mk_bv (FStar_SMTEncoding_Util.mkBvShl sz)
                          binary_arith (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_shr =
                        mk_bv (FStar_SMTEncoding_Util.mkBvShr sz)
                          binary_arith (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_udiv =
                        mk_bv (FStar_SMTEncoding_Util.mkBvUdiv sz)
                          binary_arith (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_mod =
                        mk_bv (FStar_SMTEncoding_Util.mkBvMod sz)
                          binary_arith (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_mul =
                        mk_bv (FStar_SMTEncoding_Util.mkBvMul sz)
                          binary_arith (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let bv_ult =
                        mk_bv FStar_SMTEncoding_Util.mkBvUlt binary
                          FStar_SMTEncoding_Term.boxBool
                         in
                      let bv_uext arg_tms2 =
                        let uu____74954 =
                          let uu____74959 =
                            match ext_sz with
                            | FStar_Pervasives_Native.Some x -> x
                            | FStar_Pervasives_Native.None  ->
                                failwith "impossible"
                             in
                          FStar_SMTEncoding_Util.mkBvUext uu____74959  in
                        let uu____74968 =
                          let uu____74973 =
                            let uu____74975 =
                              match ext_sz with
                              | FStar_Pervasives_Native.Some x -> x
                              | FStar_Pervasives_Native.None  ->
                                  failwith "impossible"
                               in
                            sz + uu____74975  in
                          FStar_SMTEncoding_Term.boxBitVec uu____74973  in
                        mk_bv uu____74954 unary uu____74968 arg_tms2  in
                      let to_int1 =
                        mk_bv FStar_SMTEncoding_Util.mkBvToNat unary
                          FStar_SMTEncoding_Term.boxInt
                         in
                      let bv_to =
                        mk_bv (FStar_SMTEncoding_Util.mkNatToBv sz)
                          unary_arith (FStar_SMTEncoding_Term.boxBitVec sz)
                         in
                      let ops =
                        [(FStar_Parser_Const.bv_and_lid, bv_and);
                        (FStar_Parser_Const.bv_xor_lid, bv_xor);
                        (FStar_Parser_Const.bv_or_lid, bv_or);
                        (FStar_Parser_Const.bv_add_lid, bv_add);
                        (FStar_Parser_Const.bv_sub_lid, bv_sub);
                        (FStar_Parser_Const.bv_shift_left_lid, bv_shl);
                        (FStar_Parser_Const.bv_shift_right_lid, bv_shr);
                        (FStar_Parser_Const.bv_udiv_lid, bv_udiv);
                        (FStar_Parser_Const.bv_mod_lid, bv_mod);
                        (FStar_Parser_Const.bv_mul_lid, bv_mul);
                        (FStar_Parser_Const.bv_ult_lid, bv_ult);
                        (FStar_Parser_Const.bv_uext_lid, bv_uext);
                        (FStar_Parser_Const.bv_to_nat_lid, to_int1);
                        (FStar_Parser_Const.nat_to_bv_lid, bv_to)]  in
                      let uu____75215 =
                        let uu____75225 =
                          FStar_List.tryFind
                            (fun uu____75249  ->
                               match uu____75249 with
                               | (l,uu____75260) ->
                                   FStar_Syntax_Syntax.fv_eq_lid head_fv l)
                            ops
                           in
                        FStar_All.pipe_right uu____75225 FStar_Util.must  in
                      (match uu____75215 with
                       | (uu____75306,op) ->
                           let uu____75318 = op arg_tms1  in
                           (uu____75318, (FStar_List.append sz_decls decls)))))

and (encode_deeply_embedded_quantifier :
  FStar_Syntax_Syntax.term ->
    FStar_SMTEncoding_Env.env_t ->
      (FStar_SMTEncoding_Term.term * FStar_SMTEncoding_Term.decls_t))
  =
  fun t  ->
    fun env  ->
      let env1 =
        let uu___1170_75328 = env  in
        {
          FStar_SMTEncoding_Env.bvar_bindings =
            (uu___1170_75328.FStar_SMTEncoding_Env.bvar_bindings);
          FStar_SMTEncoding_Env.fvar_bindings =
            (uu___1170_75328.FStar_SMTEncoding_Env.fvar_bindings);
          FStar_SMTEncoding_Env.depth =
            (uu___1170_75328.FStar_SMTEncoding_Env.depth);
          FStar_SMTEncoding_Env.tcenv =
            (uu___1170_75328.FStar_SMTEncoding_Env.tcenv);
          FStar_SMTEncoding_Env.warn =
            (uu___1170_75328.FStar_SMTEncoding_Env.warn);
          FStar_SMTEncoding_Env.nolabels =
            (uu___1170_75328.FStar_SMTEncoding_Env.nolabels);
          FStar_SMTEncoding_Env.use_zfuel_name =
            (uu___1170_75328.FStar_SMTEncoding_Env.use_zfuel_name);
          FStar_SMTEncoding_Env.encode_non_total_function_typ =
            (uu___1170_75328.FStar_SMTEncoding_Env.encode_non_total_function_typ);
          FStar_SMTEncoding_Env.current_module_name =
            (uu___1170_75328.FStar_SMTEncoding_Env.current_module_name);
          FStar_SMTEncoding_Env.encoding_quantifier = true;
          FStar_SMTEncoding_Env.global_cache =
            (uu___1170_75328.FStar_SMTEncoding_Env.global_cache)
        }  in
      let uu____75330 = encode_term t env1  in
      match uu____75330 with
      | (tm,decls) ->
          let vars = FStar_SMTEncoding_Term.free_variables tm  in
          let valid_tm = FStar_SMTEncoding_Term.mk_Valid tm  in
          let key =
            FStar_SMTEncoding_Term.mkForall t.FStar_Syntax_Syntax.pos
              ([], vars, valid_tm)
             in
          let tkey_hash = FStar_SMTEncoding_Term.hash_of_term key  in
          (match tm.FStar_SMTEncoding_Term.tm with
           | FStar_SMTEncoding_Term.App
               (uu____75356,{
                              FStar_SMTEncoding_Term.tm =
                                FStar_SMTEncoding_Term.FreeV uu____75357;
                              FStar_SMTEncoding_Term.freevars = uu____75358;
                              FStar_SMTEncoding_Term.rng = uu____75359;_}::
                {
                  FStar_SMTEncoding_Term.tm = FStar_SMTEncoding_Term.FreeV
                    uu____75360;
                  FStar_SMTEncoding_Term.freevars = uu____75361;
                  FStar_SMTEncoding_Term.rng = uu____75362;_}::[])
               ->
               (FStar_Errors.log_issue t.FStar_Syntax_Syntax.pos
                  (FStar_Errors.Warning_QuantifierWithoutPattern,
                    "Not encoding deeply embedded, unguarded quantifier to SMT");
                (tm, decls))
           | uu____75408 ->
               let uu____75409 = encode_formula t env1  in
               (match uu____75409 with
                | (phi,decls') ->
                    let interp =
                      match vars with
                      | [] ->
                          let uu____75429 =
                            let uu____75434 =
                              FStar_SMTEncoding_Term.mk_Valid tm  in
                            (uu____75434, phi)  in
                          FStar_SMTEncoding_Util.mkIff uu____75429
                      | uu____75435 ->
                          let uu____75436 =
                            let uu____75447 =
                              let uu____75448 =
                                let uu____75453 =
                                  FStar_SMTEncoding_Term.mk_Valid tm  in
                                (uu____75453, phi)  in
                              FStar_SMTEncoding_Util.mkIff uu____75448  in
                            ([[valid_tm]], vars, uu____75447)  in
                          FStar_SMTEncoding_Term.mkForall
                            t.FStar_Syntax_Syntax.pos uu____75436
                       in
                    let ax =
                      let uu____75463 =
                        let uu____75471 =
                          let uu____75473 =
                            FStar_Util.digest_of_string tkey_hash  in
                          Prims.op_Hat "l_quant_interp_" uu____75473  in
                        (interp,
                          (FStar_Pervasives_Native.Some
                             "Interpretation of deeply embedded quantifier"),
                          uu____75471)
                         in
                      FStar_SMTEncoding_Util.mkAssume uu____75463  in
                    let uu____75479 =
                      let uu____75480 =
                        let uu____75483 =
                          FStar_SMTEncoding_Term.mk_decls "" tkey_hash 
                            [ax] (FStar_List.append decls decls')
                           in
                        FStar_List.append decls' uu____75483  in
                      FStar_List.append decls uu____75480  in
                    (tm, uu____75479)))

and (encode_term :
  FStar_Syntax_Syntax.typ ->
    FStar_SMTEncoding_Env.env_t ->
      (FStar_SMTEncoding_Term.term * FStar_SMTEncoding_Term.decls_t))
  =
  fun t  ->
    fun env  ->
      let t0 = FStar_Syntax_Subst.compress t  in
      (let uu____75495 =
         FStar_All.pipe_left
           (FStar_TypeChecker_Env.debug env.FStar_SMTEncoding_Env.tcenv)
           (FStar_Options.Other "SMTEncoding")
          in
       if uu____75495
       then
         let uu____75500 = FStar_Syntax_Print.tag_of_term t  in
         let uu____75502 = FStar_Syntax_Print.tag_of_term t0  in
         let uu____75504 = FStar_Syntax_Print.term_to_string t0  in
         FStar_Util.print3 "(%s) (%s)   %s\n" uu____75500 uu____75502
           uu____75504
       else ());
      (match t0.FStar_Syntax_Syntax.n with
       | FStar_Syntax_Syntax.Tm_delayed uu____75513 ->
           let uu____75536 =
             let uu____75538 =
               FStar_All.pipe_left FStar_Range.string_of_range
                 t.FStar_Syntax_Syntax.pos
                in
             let uu____75541 = FStar_Syntax_Print.tag_of_term t0  in
             let uu____75543 = FStar_Syntax_Print.term_to_string t0  in
             let uu____75545 = FStar_Syntax_Print.term_to_string t  in
             FStar_Util.format4 "(%s) Impossible: %s\n%s\n%s\n" uu____75538
               uu____75541 uu____75543 uu____75545
              in
           failwith uu____75536
       | FStar_Syntax_Syntax.Tm_unknown  ->
           let uu____75552 =
             let uu____75554 =
               FStar_All.pipe_left FStar_Range.string_of_range
                 t.FStar_Syntax_Syntax.pos
                in
             let uu____75557 = FStar_Syntax_Print.tag_of_term t0  in
             let uu____75559 = FStar_Syntax_Print.term_to_string t0  in
             let uu____75561 = FStar_Syntax_Print.term_to_string t  in
             FStar_Util.format4 "(%s) Impossible: %s\n%s\n%s\n" uu____75554
               uu____75557 uu____75559 uu____75561
              in
           failwith uu____75552
       | FStar_Syntax_Syntax.Tm_lazy i ->
           let e = FStar_Syntax_Util.unfold_lazy i  in
           ((let uu____75571 =
               FStar_All.pipe_left
                 (FStar_TypeChecker_Env.debug env.FStar_SMTEncoding_Env.tcenv)
                 (FStar_Options.Other "SMTEncoding")
                in
             if uu____75571
             then
               let uu____75576 = FStar_Syntax_Print.term_to_string t0  in
               let uu____75578 = FStar_Syntax_Print.term_to_string e  in
               FStar_Util.print2 ">> Unfolded (%s) ~> (%s)\n" uu____75576
                 uu____75578
             else ());
            encode_term e env)
       | FStar_Syntax_Syntax.Tm_bvar x ->
           let uu____75584 =
             let uu____75586 = FStar_Syntax_Print.bv_to_string x  in
             FStar_Util.format1 "Impossible: locally nameless; got %s"
               uu____75586
              in
           failwith uu____75584
       | FStar_Syntax_Syntax.Tm_ascribed (t1,(k,uu____75595),uu____75596) ->
           let uu____75645 =
             match k with
             | FStar_Util.Inl t2 -> FStar_Syntax_Util.is_unit t2
             | uu____75655 -> false  in
           if uu____75645
           then (FStar_SMTEncoding_Term.mk_Term_unit, [])
           else encode_term t1 env
       | FStar_Syntax_Syntax.Tm_quoted (qt,uu____75673) ->
           let tv =
             let uu____75679 =
               let uu____75686 = FStar_Reflection_Basic.inspect_ln qt  in
               FStar_Syntax_Embeddings.embed
                 FStar_Reflection_Embeddings.e_term_view uu____75686
                in
             uu____75679 t.FStar_Syntax_Syntax.pos
               FStar_Pervasives_Native.None
               FStar_Syntax_Embeddings.id_norm_cb
              in
           ((let uu____75713 =
               FStar_All.pipe_left
                 (FStar_TypeChecker_Env.debug env.FStar_SMTEncoding_Env.tcenv)
                 (FStar_Options.Other "SMTEncoding")
                in
             if uu____75713
             then
               let uu____75718 = FStar_Syntax_Print.term_to_string t0  in
               let uu____75720 = FStar_Syntax_Print.term_to_string tv  in
               FStar_Util.print2 ">> Inspected (%s) ~> (%s)\n" uu____75718
                 uu____75720
             else ());
            (let t1 =
               let uu____75728 =
                 let uu____75739 = FStar_Syntax_Syntax.as_arg tv  in
                 [uu____75739]  in
               FStar_Syntax_Util.mk_app
                 (FStar_Reflection_Data.refl_constant_term
                    FStar_Reflection_Data.fstar_refl_pack_ln) uu____75728
                in
             encode_term t1 env))
       | FStar_Syntax_Syntax.Tm_meta
           (t1,FStar_Syntax_Syntax.Meta_pattern uu____75765) ->
           encode_term t1
             (let uu___1242_75783 = env  in
              {
                FStar_SMTEncoding_Env.bvar_bindings =
                  (uu___1242_75783.FStar_SMTEncoding_Env.bvar_bindings);
                FStar_SMTEncoding_Env.fvar_bindings =
                  (uu___1242_75783.FStar_SMTEncoding_Env.fvar_bindings);
                FStar_SMTEncoding_Env.depth =
                  (uu___1242_75783.FStar_SMTEncoding_Env.depth);
                FStar_SMTEncoding_Env.tcenv =
                  (uu___1242_75783.FStar_SMTEncoding_Env.tcenv);
                FStar_SMTEncoding_Env.warn =
                  (uu___1242_75783.FStar_SMTEncoding_Env.warn);
                FStar_SMTEncoding_Env.nolabels =
                  (uu___1242_75783.FStar_SMTEncoding_Env.nolabels);
                FStar_SMTEncoding_Env.use_zfuel_name =
                  (uu___1242_75783.FStar_SMTEncoding_Env.use_zfuel_name);
                FStar_SMTEncoding_Env.encode_non_total_function_typ =
                  (uu___1242_75783.FStar_SMTEncoding_Env.encode_non_total_function_typ);
                FStar_SMTEncoding_Env.current_module_name =
                  (uu___1242_75783.FStar_SMTEncoding_Env.current_module_name);
                FStar_SMTEncoding_Env.encoding_quantifier = false;
                FStar_SMTEncoding_Env.global_cache =
                  (uu___1242_75783.FStar_SMTEncoding_Env.global_cache)
              })
       | FStar_Syntax_Syntax.Tm_meta (t1,uu____75786) -> encode_term t1 env
       | FStar_Syntax_Syntax.Tm_name x ->
           let t1 = FStar_SMTEncoding_Env.lookup_term_var env x  in (t1, [])
       | FStar_Syntax_Syntax.Tm_fvar v1 ->
           let uu____75794 = head_redex env t  in
           if uu____75794
           then let uu____75801 = whnf env t  in encode_term uu____75801 env
           else
             (let fvb =
                FStar_SMTEncoding_Env.lookup_free_var_name env
                  v1.FStar_Syntax_Syntax.fv_name
                 in
              let tok =
                FStar_SMTEncoding_Env.lookup_free_var env
                  v1.FStar_Syntax_Syntax.fv_name
                 in
              let tkey_hash = FStar_SMTEncoding_Term.hash_of_term tok  in
              let uu____75808 =
                if
                  fvb.FStar_SMTEncoding_Env.smt_arity > (Prims.parse_int "0")
                then
                  match tok.FStar_SMTEncoding_Term.tm with
                  | FStar_SMTEncoding_Term.FreeV uu____75832 ->
                      let sym_name =
                        let uu____75843 =
                          FStar_Util.digest_of_string tkey_hash  in
                        Prims.op_Hat "@kick_partial_app_" uu____75843  in
                      let uu____75846 =
                        let uu____75849 =
                          let uu____75850 =
                            let uu____75858 =
                              FStar_SMTEncoding_Term.kick_partial_app tok  in
                            (uu____75858,
                              (FStar_Pervasives_Native.Some
                                 "kick_partial_app"), sym_name)
                             in
                          FStar_SMTEncoding_Util.mkAssume uu____75850  in
                        [uu____75849]  in
                      (uu____75846, sym_name)
                  | FStar_SMTEncoding_Term.App (uu____75865,[]) ->
                      let sym_name =
                        let uu____75870 =
                          FStar_Util.digest_of_string tkey_hash  in
                        Prims.op_Hat "@kick_partial_app_" uu____75870  in
                      let uu____75873 =
                        let uu____75876 =
                          let uu____75877 =
                            let uu____75885 =
                              FStar_SMTEncoding_Term.kick_partial_app tok  in
                            (uu____75885,
                              (FStar_Pervasives_Native.Some
                                 "kick_partial_app"), sym_name)
                             in
                          FStar_SMTEncoding_Util.mkAssume uu____75877  in
                        [uu____75876]  in
                      (uu____75873, sym_name)
                  | uu____75892 -> ([], "")
                else ([], "")  in
              match uu____75808 with
              | (aux_decls,sym_name) ->
                  let uu____75915 =
                    if aux_decls = []
                    then
                      FStar_All.pipe_right []
                        FStar_SMTEncoding_Term.mk_decls_trivial
                    else
                      FStar_SMTEncoding_Term.mk_decls sym_name tkey_hash
                        aux_decls []
                     in
                  (tok, uu____75915))
       | FStar_Syntax_Syntax.Tm_type uu____75923 ->
           (FStar_SMTEncoding_Term.mk_Term_type, [])
       | FStar_Syntax_Syntax.Tm_uinst (t1,uu____75925) -> encode_term t1 env
       | FStar_Syntax_Syntax.Tm_constant c -> encode_const c env
       | FStar_Syntax_Syntax.Tm_arrow (binders,c) ->
           let module_name = env.FStar_SMTEncoding_Env.current_module_name
              in
           let uu____75955 = FStar_Syntax_Subst.open_comp binders c  in
           (match uu____75955 with
            | (binders1,res) ->
                let uu____75966 =
                  (env.FStar_SMTEncoding_Env.encode_non_total_function_typ &&
                     (FStar_Syntax_Util.is_pure_or_ghost_comp res))
                    || (FStar_Syntax_Util.is_tot_or_gtot_comp res)
                   in
                if uu____75966
                then
                  let uu____75973 =
                    encode_binders FStar_Pervasives_Native.None binders1 env
                     in
                  (match uu____75973 with
                   | (vars,guards,env',decls,uu____75998) ->
                       let fsym =
                         let uu____76012 =
                           let uu____76018 =
                             FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.fresh
                               module_name "f"
                              in
                           (uu____76018, FStar_SMTEncoding_Term.Term_sort)
                            in
                         FStar_SMTEncoding_Term.mk_fv uu____76012  in
                       let f = FStar_SMTEncoding_Util.mkFreeV fsym  in
                       let app = mk_Apply f vars  in
                       let uu____76024 =
                         FStar_TypeChecker_Util.pure_or_ghost_pre_and_post
                           (let uu___1296_76033 =
                              env.FStar_SMTEncoding_Env.tcenv  in
                            {
                              FStar_TypeChecker_Env.solver =
                                (uu___1296_76033.FStar_TypeChecker_Env.solver);
                              FStar_TypeChecker_Env.range =
                                (uu___1296_76033.FStar_TypeChecker_Env.range);
                              FStar_TypeChecker_Env.curmodule =
                                (uu___1296_76033.FStar_TypeChecker_Env.curmodule);
                              FStar_TypeChecker_Env.gamma =
                                (uu___1296_76033.FStar_TypeChecker_Env.gamma);
                              FStar_TypeChecker_Env.gamma_sig =
                                (uu___1296_76033.FStar_TypeChecker_Env.gamma_sig);
                              FStar_TypeChecker_Env.gamma_cache =
                                (uu___1296_76033.FStar_TypeChecker_Env.gamma_cache);
                              FStar_TypeChecker_Env.modules =
                                (uu___1296_76033.FStar_TypeChecker_Env.modules);
                              FStar_TypeChecker_Env.expected_typ =
                                (uu___1296_76033.FStar_TypeChecker_Env.expected_typ);
                              FStar_TypeChecker_Env.sigtab =
                                (uu___1296_76033.FStar_TypeChecker_Env.sigtab);
                              FStar_TypeChecker_Env.attrtab =
                                (uu___1296_76033.FStar_TypeChecker_Env.attrtab);
                              FStar_TypeChecker_Env.is_pattern =
                                (uu___1296_76033.FStar_TypeChecker_Env.is_pattern);
                              FStar_TypeChecker_Env.instantiate_imp =
                                (uu___1296_76033.FStar_TypeChecker_Env.instantiate_imp);
                              FStar_TypeChecker_Env.effects =
                                (uu___1296_76033.FStar_TypeChecker_Env.effects);
                              FStar_TypeChecker_Env.generalize =
                                (uu___1296_76033.FStar_TypeChecker_Env.generalize);
                              FStar_TypeChecker_Env.letrecs =
                                (uu___1296_76033.FStar_TypeChecker_Env.letrecs);
                              FStar_TypeChecker_Env.top_level =
                                (uu___1296_76033.FStar_TypeChecker_Env.top_level);
                              FStar_TypeChecker_Env.check_uvars =
                                (uu___1296_76033.FStar_TypeChecker_Env.check_uvars);
                              FStar_TypeChecker_Env.use_eq =
                                (uu___1296_76033.FStar_TypeChecker_Env.use_eq);
                              FStar_TypeChecker_Env.is_iface =
                                (uu___1296_76033.FStar_TypeChecker_Env.is_iface);
                              FStar_TypeChecker_Env.admit =
                                (uu___1296_76033.FStar_TypeChecker_Env.admit);
                              FStar_TypeChecker_Env.lax = true;
                              FStar_TypeChecker_Env.lax_universes =
                                (uu___1296_76033.FStar_TypeChecker_Env.lax_universes);
                              FStar_TypeChecker_Env.phase1 =
                                (uu___1296_76033.FStar_TypeChecker_Env.phase1);
                              FStar_TypeChecker_Env.failhard =
                                (uu___1296_76033.FStar_TypeChecker_Env.failhard);
                              FStar_TypeChecker_Env.nosynth =
                                (uu___1296_76033.FStar_TypeChecker_Env.nosynth);
                              FStar_TypeChecker_Env.uvar_subtyping =
                                (uu___1296_76033.FStar_TypeChecker_Env.uvar_subtyping);
                              FStar_TypeChecker_Env.tc_term =
                                (uu___1296_76033.FStar_TypeChecker_Env.tc_term);
                              FStar_TypeChecker_Env.type_of =
                                (uu___1296_76033.FStar_TypeChecker_Env.type_of);
                              FStar_TypeChecker_Env.universe_of =
                                (uu___1296_76033.FStar_TypeChecker_Env.universe_of);
                              FStar_TypeChecker_Env.check_type_of =
                                (uu___1296_76033.FStar_TypeChecker_Env.check_type_of);
                              FStar_TypeChecker_Env.use_bv_sorts =
                                (uu___1296_76033.FStar_TypeChecker_Env.use_bv_sorts);
                              FStar_TypeChecker_Env.qtbl_name_and_index =
                                (uu___1296_76033.FStar_TypeChecker_Env.qtbl_name_and_index);
                              FStar_TypeChecker_Env.normalized_eff_names =
                                (uu___1296_76033.FStar_TypeChecker_Env.normalized_eff_names);
                              FStar_TypeChecker_Env.fv_delta_depths =
                                (uu___1296_76033.FStar_TypeChecker_Env.fv_delta_depths);
                              FStar_TypeChecker_Env.proof_ns =
                                (uu___1296_76033.FStar_TypeChecker_Env.proof_ns);
                              FStar_TypeChecker_Env.synth_hook =
                                (uu___1296_76033.FStar_TypeChecker_Env.synth_hook);
                              FStar_TypeChecker_Env.splice =
                                (uu___1296_76033.FStar_TypeChecker_Env.splice);
                              FStar_TypeChecker_Env.postprocess =
                                (uu___1296_76033.FStar_TypeChecker_Env.postprocess);
                              FStar_TypeChecker_Env.is_native_tactic =
                                (uu___1296_76033.FStar_TypeChecker_Env.is_native_tactic);
                              FStar_TypeChecker_Env.identifier_info =
                                (uu___1296_76033.FStar_TypeChecker_Env.identifier_info);
                              FStar_TypeChecker_Env.tc_hooks =
                                (uu___1296_76033.FStar_TypeChecker_Env.tc_hooks);
                              FStar_TypeChecker_Env.dsenv =
                                (uu___1296_76033.FStar_TypeChecker_Env.dsenv);
                              FStar_TypeChecker_Env.nbe =
                                (uu___1296_76033.FStar_TypeChecker_Env.nbe)
                            }) res
                          in
                       (match uu____76024 with
                        | (pre_opt,res_t) ->
                            let uu____76045 =
                              encode_term_pred FStar_Pervasives_Native.None
                                res_t env' app
                               in
                            (match uu____76045 with
                             | (res_pred,decls') ->
                                 let uu____76056 =
                                   match pre_opt with
                                   | FStar_Pervasives_Native.None  ->
                                       let uu____76069 =
                                         FStar_SMTEncoding_Util.mk_and_l
                                           guards
                                          in
                                       (uu____76069, [])
                                   | FStar_Pervasives_Native.Some pre ->
                                       let uu____76073 =
                                         encode_formula pre env'  in
                                       (match uu____76073 with
                                        | (guard,decls0) ->
                                            let uu____76086 =
                                              FStar_SMTEncoding_Util.mk_and_l
                                                (guard :: guards)
                                               in
                                            (uu____76086, decls0))
                                    in
                                 (match uu____76056 with
                                  | (guards1,guard_decls) ->
                                      let t_interp =
                                        let uu____76100 =
                                          let uu____76111 =
                                            FStar_SMTEncoding_Util.mkImp
                                              (guards1, res_pred)
                                             in
                                          ([[app]], vars, uu____76111)  in
                                        FStar_SMTEncoding_Term.mkForall
                                          t.FStar_Syntax_Syntax.pos
                                          uu____76100
                                         in
                                      let cvars =
                                        let uu____76131 =
                                          FStar_SMTEncoding_Term.free_variables
                                            t_interp
                                           in
                                        FStar_All.pipe_right uu____76131
                                          (FStar_List.filter
                                             (fun x  ->
                                                let uu____76150 =
                                                  FStar_SMTEncoding_Term.fv_name
                                                    x
                                                   in
                                                let uu____76152 =
                                                  FStar_SMTEncoding_Term.fv_name
                                                    fsym
                                                   in
                                                uu____76150 <> uu____76152))
                                         in
                                      let tkey =
                                        FStar_SMTEncoding_Term.mkForall
                                          t.FStar_Syntax_Syntax.pos
                                          ([], (fsym :: cvars), t_interp)
                                         in
                                      let tkey_hash =
                                        FStar_SMTEncoding_Term.hash_of_term
                                          tkey
                                         in
                                      let tsym =
                                        let uu____76174 =
                                          FStar_Util.digest_of_string
                                            tkey_hash
                                           in
                                        Prims.op_Hat "Tm_arrow_" uu____76174
                                         in
                                      let cvar_sorts =
                                        FStar_List.map
                                          FStar_SMTEncoding_Term.fv_sort
                                          cvars
                                         in
                                      let caption =
                                        let uu____76189 =
                                          FStar_Options.log_queries ()  in
                                        if uu____76189
                                        then
                                          let uu____76192 =
                                            let uu____76194 =
                                              FStar_TypeChecker_Normalize.term_to_string
                                                env.FStar_SMTEncoding_Env.tcenv
                                                t0
                                               in
                                            FStar_Util.replace_char
                                              uu____76194 10 32
                                             in
                                          FStar_Pervasives_Native.Some
                                            uu____76192
                                        else FStar_Pervasives_Native.None  in
                                      let tdecl =
                                        FStar_SMTEncoding_Term.DeclFun
                                          (tsym, cvar_sorts,
                                            FStar_SMTEncoding_Term.Term_sort,
                                            caption)
                                         in
                                      let t1 =
                                        let uu____76207 =
                                          let uu____76215 =
                                            FStar_List.map
                                              FStar_SMTEncoding_Util.mkFreeV
                                              cvars
                                             in
                                          (tsym, uu____76215)  in
                                        FStar_SMTEncoding_Util.mkApp
                                          uu____76207
                                         in
                                      let t_has_kind =
                                        FStar_SMTEncoding_Term.mk_HasType t1
                                          FStar_SMTEncoding_Term.mk_Term_type
                                         in
                                      let k_assumption =
                                        let a_name =
                                          Prims.op_Hat "kinding_" tsym  in
                                        let uu____76234 =
                                          let uu____76242 =
                                            FStar_SMTEncoding_Term.mkForall
                                              t0.FStar_Syntax_Syntax.pos
                                              ([[t_has_kind]], cvars,
                                                t_has_kind)
                                             in
                                          (uu____76242,
                                            (FStar_Pervasives_Native.Some
                                               a_name), a_name)
                                           in
                                        FStar_SMTEncoding_Util.mkAssume
                                          uu____76234
                                         in
                                      let f_has_t =
                                        FStar_SMTEncoding_Term.mk_HasType f
                                          t1
                                         in
                                      let f_has_t_z =
                                        FStar_SMTEncoding_Term.mk_HasTypeZ f
                                          t1
                                         in
                                      let pre_typing =
                                        let a_name =
                                          Prims.op_Hat "pre_typing_" tsym  in
                                        let uu____76259 =
                                          let uu____76267 =
                                            let uu____76268 =
                                              let uu____76279 =
                                                let uu____76280 =
                                                  let uu____76285 =
                                                    let uu____76286 =
                                                      FStar_SMTEncoding_Term.mk_PreType
                                                        f
                                                       in
                                                    FStar_SMTEncoding_Term.mk_tester
                                                      "Tm_arrow" uu____76286
                                                     in
                                                  (f_has_t, uu____76285)  in
                                                FStar_SMTEncoding_Util.mkImp
                                                  uu____76280
                                                 in
                                              ([[f_has_t]], (fsym :: cvars),
                                                uu____76279)
                                               in
                                            let uu____76304 =
                                              mkForall_fuel module_name
                                                t0.FStar_Syntax_Syntax.pos
                                               in
                                            uu____76304 uu____76268  in
                                          (uu____76267,
                                            (FStar_Pervasives_Native.Some
                                               "pre-typing for functions"),
                                            (Prims.op_Hat module_name
                                               (Prims.op_Hat "_" a_name)))
                                           in
                                        FStar_SMTEncoding_Util.mkAssume
                                          uu____76259
                                         in
                                      let t_interp1 =
                                        let a_name =
                                          Prims.op_Hat "interpretation_" tsym
                                           in
                                        let uu____76327 =
                                          let uu____76335 =
                                            let uu____76336 =
                                              let uu____76347 =
                                                FStar_SMTEncoding_Util.mkIff
                                                  (f_has_t_z, t_interp)
                                                 in
                                              ([[f_has_t_z]], (fsym ::
                                                cvars), uu____76347)
                                               in
                                            FStar_SMTEncoding_Term.mkForall
                                              t0.FStar_Syntax_Syntax.pos
                                              uu____76336
                                             in
                                          (uu____76335,
                                            (FStar_Pervasives_Native.Some
                                               a_name),
                                            (Prims.op_Hat module_name
                                               (Prims.op_Hat "_" a_name)))
                                           in
                                        FStar_SMTEncoding_Util.mkAssume
                                          uu____76327
                                         in
                                      let t_decls1 =
                                        [tdecl;
                                        k_assumption;
                                        pre_typing;
                                        t_interp1]  in
                                      let uu____76370 =
                                        let uu____76371 =
                                          let uu____76374 =
                                            let uu____76377 =
                                              FStar_SMTEncoding_Term.mk_decls
                                                tsym tkey_hash t_decls1
                                                (FStar_List.append decls
                                                   (FStar_List.append decls'
                                                      guard_decls))
                                               in
                                            FStar_List.append guard_decls
                                              uu____76377
                                             in
                                          FStar_List.append decls'
                                            uu____76374
                                           in
                                        FStar_List.append decls uu____76371
                                         in
                                      (t1, uu____76370)))))
                else
                  (let tsym =
                     FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.fresh
                       module_name "Non_total_Tm_arrow"
                      in
                   let tdecl =
                     FStar_SMTEncoding_Term.DeclFun
                       (tsym, [], FStar_SMTEncoding_Term.Term_sort,
                         FStar_Pervasives_Native.None)
                      in
                   let t1 = FStar_SMTEncoding_Util.mkApp (tsym, [])  in
                   let t_kinding =
                     let a_name =
                       Prims.op_Hat "non_total_function_typing_" tsym  in
                     let uu____76398 =
                       let uu____76406 =
                         FStar_SMTEncoding_Term.mk_HasType t1
                           FStar_SMTEncoding_Term.mk_Term_type
                          in
                       (uu____76406,
                         (FStar_Pervasives_Native.Some
                            "Typing for non-total arrows"), a_name)
                        in
                     FStar_SMTEncoding_Util.mkAssume uu____76398  in
                   let fsym =
                     FStar_SMTEncoding_Term.mk_fv
                       ("f", FStar_SMTEncoding_Term.Term_sort)
                      in
                   let f = FStar_SMTEncoding_Util.mkFreeV fsym  in
                   let f_has_t = FStar_SMTEncoding_Term.mk_HasType f t1  in
                   let t_interp =
                     let a_name = Prims.op_Hat "pre_typing_" tsym  in
                     let uu____76419 =
                       let uu____76427 =
                         let uu____76428 =
                           let uu____76439 =
                             let uu____76440 =
                               let uu____76445 =
                                 let uu____76446 =
                                   FStar_SMTEncoding_Term.mk_PreType f  in
                                 FStar_SMTEncoding_Term.mk_tester "Tm_arrow"
                                   uu____76446
                                  in
                               (f_has_t, uu____76445)  in
                             FStar_SMTEncoding_Util.mkImp uu____76440  in
                           ([[f_has_t]], [fsym], uu____76439)  in
                         let uu____76472 =
                           mkForall_fuel module_name
                             t0.FStar_Syntax_Syntax.pos
                            in
                         uu____76472 uu____76428  in
                       (uu____76427, (FStar_Pervasives_Native.Some a_name),
                         a_name)
                        in
                     FStar_SMTEncoding_Util.mkAssume uu____76419  in
                   let uu____76489 =
                     FStar_All.pipe_right [tdecl; t_kinding; t_interp]
                       FStar_SMTEncoding_Term.mk_decls_trivial
                      in
                   (t1, uu____76489)))
       | FStar_Syntax_Syntax.Tm_refine uu____76492 ->
           let uu____76499 =
             let uu____76504 =
               FStar_TypeChecker_Normalize.normalize_refinement
                 [FStar_TypeChecker_Env.Weak;
                 FStar_TypeChecker_Env.HNF;
                 FStar_TypeChecker_Env.EraseUniverses]
                 env.FStar_SMTEncoding_Env.tcenv t0
                in
             match uu____76504 with
             | { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_refine (x,f);
                 FStar_Syntax_Syntax.pos = uu____76511;
                 FStar_Syntax_Syntax.vars = uu____76512;_} ->
                 let uu____76519 =
                   FStar_Syntax_Subst.open_term
                     [(x, FStar_Pervasives_Native.None)] f
                    in
                 (match uu____76519 with
                  | (b,f1) ->
                      let uu____76544 =
                        let uu____76545 = FStar_List.hd b  in
                        FStar_Pervasives_Native.fst uu____76545  in
                      (uu____76544, f1))
             | uu____76560 -> failwith "impossible"  in
           (match uu____76499 with
            | (x,f) ->
                let uu____76572 = encode_term x.FStar_Syntax_Syntax.sort env
                   in
                (match uu____76572 with
                 | (base_t,decls) ->
                     let uu____76583 =
                       FStar_SMTEncoding_Env.gen_term_var env x  in
                     (match uu____76583 with
                      | (x1,xtm,env') ->
                          let uu____76600 = encode_formula f env'  in
                          (match uu____76600 with
                           | (refinement,decls') ->
                               let uu____76611 =
                                 FStar_SMTEncoding_Env.fresh_fvar
                                   env.FStar_SMTEncoding_Env.current_module_name
                                   "f" FStar_SMTEncoding_Term.Fuel_sort
                                  in
                               (match uu____76611 with
                                | (fsym,fterm) ->
                                    let tm_has_type_with_fuel =
                                      FStar_SMTEncoding_Term.mk_HasTypeWithFuel
                                        (FStar_Pervasives_Native.Some fterm)
                                        xtm base_t
                                       in
                                    let encoding =
                                      FStar_SMTEncoding_Util.mkAnd
                                        (tm_has_type_with_fuel, refinement)
                                       in
                                    let cvars =
                                      let uu____76639 =
                                        let uu____76650 =
                                          FStar_SMTEncoding_Term.free_variables
                                            refinement
                                           in
                                        let uu____76661 =
                                          FStar_SMTEncoding_Term.free_variables
                                            tm_has_type_with_fuel
                                           in
                                        FStar_List.append uu____76650
                                          uu____76661
                                         in
                                      FStar_Util.remove_dups
                                        FStar_SMTEncoding_Term.fv_eq
                                        uu____76639
                                       in
                                    let cvars1 =
                                      FStar_All.pipe_right cvars
                                        (FStar_List.filter
                                           (fun y  ->
                                              (let uu____76715 =
                                                 FStar_SMTEncoding_Term.fv_name
                                                   y
                                                  in
                                               uu____76715 <> x1) &&
                                                (let uu____76719 =
                                                   FStar_SMTEncoding_Term.fv_name
                                                     y
                                                    in
                                                 uu____76719 <> fsym)))
                                       in
                                    let xfv =
                                      FStar_SMTEncoding_Term.mk_fv
                                        (x1,
                                          FStar_SMTEncoding_Term.Term_sort)
                                       in
                                    let ffv =
                                      FStar_SMTEncoding_Term.mk_fv
                                        (fsym,
                                          FStar_SMTEncoding_Term.Fuel_sort)
                                       in
                                    let tkey =
                                      FStar_SMTEncoding_Term.mkForall
                                        t0.FStar_Syntax_Syntax.pos
                                        ([], (ffv :: xfv :: cvars1),
                                          encoding)
                                       in
                                    let tkey_hash =
                                      FStar_SMTEncoding_Term.hash_of_term
                                        tkey
                                       in
                                    let module_name =
                                      env.FStar_SMTEncoding_Env.current_module_name
                                       in
                                    let tsym =
                                      let uu____76755 =
                                        FStar_Util.digest_of_string tkey_hash
                                         in
                                      Prims.op_Hat "Tm_refine_" uu____76755
                                       in
                                    let cvar_sorts =
                                      FStar_List.map
                                        FStar_SMTEncoding_Term.fv_sort cvars1
                                       in
                                    let tdecl =
                                      FStar_SMTEncoding_Term.DeclFun
                                        (tsym, cvar_sorts,
                                          FStar_SMTEncoding_Term.Term_sort,
                                          FStar_Pervasives_Native.None)
                                       in
                                    let t1 =
                                      let uu____76775 =
                                        let uu____76783 =
                                          FStar_List.map
                                            FStar_SMTEncoding_Util.mkFreeV
                                            cvars1
                                           in
                                        (tsym, uu____76783)  in
                                      FStar_SMTEncoding_Util.mkApp
                                        uu____76775
                                       in
                                    let x_has_base_t =
                                      FStar_SMTEncoding_Term.mk_HasType xtm
                                        base_t
                                       in
                                    let x_has_t =
                                      FStar_SMTEncoding_Term.mk_HasTypeWithFuel
                                        (FStar_Pervasives_Native.Some fterm)
                                        xtm t1
                                       in
                                    let t_has_kind =
                                      FStar_SMTEncoding_Term.mk_HasType t1
                                        FStar_SMTEncoding_Term.mk_Term_type
                                       in
                                    let t_haseq_base =
                                      FStar_SMTEncoding_Term.mk_haseq base_t
                                       in
                                    let t_haseq_ref =
                                      FStar_SMTEncoding_Term.mk_haseq t1  in
                                    let t_haseq1 =
                                      let uu____76803 =
                                        let uu____76811 =
                                          let uu____76812 =
                                            let uu____76823 =
                                              FStar_SMTEncoding_Util.mkIff
                                                (t_haseq_ref, t_haseq_base)
                                               in
                                            ([[t_haseq_ref]], cvars1,
                                              uu____76823)
                                             in
                                          FStar_SMTEncoding_Term.mkForall
                                            t0.FStar_Syntax_Syntax.pos
                                            uu____76812
                                           in
                                        (uu____76811,
                                          (FStar_Pervasives_Native.Some
                                             (Prims.op_Hat "haseq for " tsym)),
                                          (Prims.op_Hat "haseq" tsym))
                                         in
                                      FStar_SMTEncoding_Util.mkAssume
                                        uu____76803
                                       in
                                    let t_kinding =
                                      let uu____76837 =
                                        let uu____76845 =
                                          FStar_SMTEncoding_Term.mkForall
                                            t0.FStar_Syntax_Syntax.pos
                                            ([[t_has_kind]], cvars1,
                                              t_has_kind)
                                           in
                                        (uu____76845,
                                          (FStar_Pervasives_Native.Some
                                             "refinement kinding"),
                                          (Prims.op_Hat "refinement_kinding_"
                                             tsym))
                                         in
                                      FStar_SMTEncoding_Util.mkAssume
                                        uu____76837
                                       in
                                    let t_interp =
                                      let uu____76859 =
                                        let uu____76867 =
                                          let uu____76868 =
                                            let uu____76879 =
                                              FStar_SMTEncoding_Util.mkIff
                                                (x_has_t, encoding)
                                               in
                                            ([[x_has_t]], (ffv :: xfv ::
                                              cvars1), uu____76879)
                                             in
                                          FStar_SMTEncoding_Term.mkForall
                                            t0.FStar_Syntax_Syntax.pos
                                            uu____76868
                                           in
                                        (uu____76867,
                                          (FStar_Pervasives_Native.Some
                                             "refinement_interpretation"),
                                          (Prims.op_Hat
                                             "refinement_interpretation_"
                                             tsym))
                                         in
                                      FStar_SMTEncoding_Util.mkAssume
                                        uu____76859
                                       in
                                    let t_decls1 =
                                      [tdecl; t_kinding; t_interp; t_haseq1]
                                       in
                                    let uu____76911 =
                                      let uu____76912 =
                                        let uu____76915 =
                                          FStar_SMTEncoding_Term.mk_decls
                                            tsym tkey_hash t_decls1
                                            (FStar_List.append decls decls')
                                           in
                                        FStar_List.append decls' uu____76915
                                         in
                                      FStar_List.append decls uu____76912  in
                                    (t1, uu____76911))))))
       | FStar_Syntax_Syntax.Tm_uvar (uv,uu____76919) ->
           let ttm =
             let uu____76937 =
               FStar_Syntax_Unionfind.uvar_id
                 uv.FStar_Syntax_Syntax.ctx_uvar_head
                in
             FStar_SMTEncoding_Util.mk_Term_uvar uu____76937  in
           let uu____76939 =
             encode_term_pred FStar_Pervasives_Native.None
               uv.FStar_Syntax_Syntax.ctx_uvar_typ env ttm
              in
           (match uu____76939 with
            | (t_has_k,decls) ->
                let d =
                  let uu____76951 =
                    let uu____76959 =
                      let uu____76961 =
                        let uu____76963 =
                          let uu____76965 =
                            FStar_Syntax_Unionfind.uvar_id
                              uv.FStar_Syntax_Syntax.ctx_uvar_head
                             in
                          FStar_Util.string_of_int uu____76965  in
                        FStar_Util.format1 "uvar_typing_%s" uu____76963  in
                      FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.mk_unique
                        uu____76961
                       in
                    (t_has_k, (FStar_Pervasives_Native.Some "Uvar typing"),
                      uu____76959)
                     in
                  FStar_SMTEncoding_Util.mkAssume uu____76951  in
                let uu____76971 =
                  let uu____76972 =
                    FStar_All.pipe_right [d]
                      FStar_SMTEncoding_Term.mk_decls_trivial
                     in
                  FStar_List.append decls uu____76972  in
                (ttm, uu____76971))
       | FStar_Syntax_Syntax.Tm_app uu____76979 ->
           let uu____76996 = FStar_Syntax_Util.head_and_args t0  in
           (match uu____76996 with
            | (head1,args_e) ->
                let uu____77043 =
                  let uu____77058 =
                    let uu____77059 = FStar_Syntax_Subst.compress head1  in
                    uu____77059.FStar_Syntax_Syntax.n  in
                  (uu____77058, args_e)  in
                (match uu____77043 with
                 | uu____77076 when head_redex env head1 ->
                     let uu____77091 = whnf env t  in
                     encode_term uu____77091 env
                 | uu____77092 when is_arithmetic_primitive head1 args_e ->
                     encode_arith_term env head1 args_e
                 | uu____77115 when is_BitVector_primitive head1 args_e ->
                     encode_BitVector_term env head1 args_e
                 | (FStar_Syntax_Syntax.Tm_fvar fv,uu____77133) when
                     (Prims.op_Negation
                        env.FStar_SMTEncoding_Env.encoding_quantifier)
                       &&
                       ((FStar_Syntax_Syntax.fv_eq_lid fv
                           FStar_Parser_Const.forall_lid)
                          ||
                          (FStar_Syntax_Syntax.fv_eq_lid fv
                             FStar_Parser_Const.exists_lid))
                     -> encode_deeply_embedded_quantifier t0 env
                 | (FStar_Syntax_Syntax.Tm_uinst
                    ({
                       FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
                       FStar_Syntax_Syntax.pos = uu____77155;
                       FStar_Syntax_Syntax.vars = uu____77156;_},uu____77157),uu____77158)
                     when
                     (Prims.op_Negation
                        env.FStar_SMTEncoding_Env.encoding_quantifier)
                       &&
                       ((FStar_Syntax_Syntax.fv_eq_lid fv
                           FStar_Parser_Const.forall_lid)
                          ||
                          (FStar_Syntax_Syntax.fv_eq_lid fv
                             FStar_Parser_Const.exists_lid))
                     -> encode_deeply_embedded_quantifier t0 env
                 | (FStar_Syntax_Syntax.Tm_uinst
                    ({
                       FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
                       FStar_Syntax_Syntax.pos = uu____77184;
                       FStar_Syntax_Syntax.vars = uu____77185;_},uu____77186),
                    (v0,uu____77188)::(v1,uu____77190)::(v2,uu____77192)::[])
                     when
                     FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Parser_Const.lexcons_lid
                     ->
                     let uu____77263 = encode_term v0 env  in
                     (match uu____77263 with
                      | (v01,decls0) ->
                          let uu____77274 = encode_term v1 env  in
                          (match uu____77274 with
                           | (v11,decls1) ->
                               let uu____77285 = encode_term v2 env  in
                               (match uu____77285 with
                                | (v21,decls2) ->
                                    let uu____77296 =
                                      FStar_SMTEncoding_Util.mk_LexCons v01
                                        v11 v21
                                       in
                                    (uu____77296,
                                      (FStar_List.append decls0
                                         (FStar_List.append decls1 decls2))))))
                 | (FStar_Syntax_Syntax.Tm_fvar
                    fv,(v0,uu____77299)::(v1,uu____77301)::(v2,uu____77303)::[])
                     when
                     FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Parser_Const.lexcons_lid
                     ->
                     let uu____77370 = encode_term v0 env  in
                     (match uu____77370 with
                      | (v01,decls0) ->
                          let uu____77381 = encode_term v1 env  in
                          (match uu____77381 with
                           | (v11,decls1) ->
                               let uu____77392 = encode_term v2 env  in
                               (match uu____77392 with
                                | (v21,decls2) ->
                                    let uu____77403 =
                                      FStar_SMTEncoding_Util.mk_LexCons v01
                                        v11 v21
                                       in
                                    (uu____77403,
                                      (FStar_List.append decls0
                                         (FStar_List.append decls1 decls2))))))
                 | (FStar_Syntax_Syntax.Tm_constant
                    (FStar_Const.Const_range_of ),(arg,uu____77405)::[]) ->
                     encode_const
                       (FStar_Const.Const_range (arg.FStar_Syntax_Syntax.pos))
                       env
                 | (FStar_Syntax_Syntax.Tm_constant
                    (FStar_Const.Const_set_range_of
                    ),(arg,uu____77441)::(rng,uu____77443)::[]) ->
                     encode_term arg env
                 | (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify
                    ),uu____77494) ->
                     let e0 =
                       let uu____77516 = FStar_List.hd args_e  in
                       FStar_TypeChecker_Util.reify_body_with_arg
                         env.FStar_SMTEncoding_Env.tcenv head1 uu____77516
                        in
                     ((let uu____77526 =
                         FStar_All.pipe_left
                           (FStar_TypeChecker_Env.debug
                              env.FStar_SMTEncoding_Env.tcenv)
                           (FStar_Options.Other "SMTEncodingReify")
                          in
                       if uu____77526
                       then
                         let uu____77531 =
                           FStar_Syntax_Print.term_to_string e0  in
                         FStar_Util.print1 "Result of normalization %s\n"
                           uu____77531
                       else ());
                      (let e =
                         let uu____77539 =
                           let uu____77544 =
                             FStar_TypeChecker_Util.remove_reify e0  in
                           let uu____77545 = FStar_List.tl args_e  in
                           FStar_Syntax_Syntax.mk_Tm_app uu____77544
                             uu____77545
                            in
                         uu____77539 FStar_Pervasives_Native.None
                           t0.FStar_Syntax_Syntax.pos
                          in
                       encode_term e env))
                 | (FStar_Syntax_Syntax.Tm_constant
                    (FStar_Const.Const_reflect
                    uu____77556),(arg,uu____77558)::[]) ->
                     encode_term arg env
                 | uu____77593 ->
                     let uu____77608 = encode_args args_e env  in
                     (match uu____77608 with
                      | (args,decls) ->
                          let encode_partial_app ht_opt =
                            let uu____77669 = encode_term head1 env  in
                            match uu____77669 with
                            | (head2,decls') ->
                                let app_tm = mk_Apply_args head2 args  in
                                (match ht_opt with
                                 | FStar_Pervasives_Native.None  ->
                                     (app_tm,
                                       (FStar_List.append decls decls'))
                                 | FStar_Pervasives_Native.Some (formals,c)
                                     ->
                                     let uu____77741 =
                                       FStar_Util.first_N
                                         (FStar_List.length args_e) formals
                                        in
                                     (match uu____77741 with
                                      | (formals1,rest) ->
                                          let subst1 =
                                            FStar_List.map2
                                              (fun uu____77839  ->
                                                 fun uu____77840  ->
                                                   match (uu____77839,
                                                           uu____77840)
                                                   with
                                                   | ((bv,uu____77870),
                                                      (a,uu____77872)) ->
                                                       FStar_Syntax_Syntax.NT
                                                         (bv, a)) formals1
                                              args_e
                                             in
                                          let ty =
                                            let uu____77902 =
                                              FStar_Syntax_Util.arrow rest c
                                               in
                                            FStar_All.pipe_right uu____77902
                                              (FStar_Syntax_Subst.subst
                                                 subst1)
                                             in
                                          let uu____77903 =
                                            encode_term_pred
                                              FStar_Pervasives_Native.None ty
                                              env app_tm
                                             in
                                          (match uu____77903 with
                                           | (has_type,decls'') ->
                                               let cvars =
                                                 FStar_SMTEncoding_Term.free_variables
                                                   has_type
                                                  in
                                               let tkey_hash =
                                                 FStar_SMTEncoding_Term.hash_of_term
                                                   app_tm
                                                  in
                                               let e_typing =
                                                 let uu____77920 =
                                                   let uu____77928 =
                                                     FStar_SMTEncoding_Term.mkForall
                                                       t0.FStar_Syntax_Syntax.pos
                                                       ([[has_type]], cvars,
                                                         has_type)
                                                      in
                                                   let uu____77937 =
                                                     let uu____77939 =
                                                       let uu____77941 =
                                                         FStar_SMTEncoding_Term.hash_of_term
                                                           app_tm
                                                          in
                                                       FStar_Util.digest_of_string
                                                         uu____77941
                                                        in
                                                     Prims.op_Hat
                                                       "partial_app_typing_"
                                                       uu____77939
                                                      in
                                                   (uu____77928,
                                                     (FStar_Pervasives_Native.Some
                                                        "Partial app typing"),
                                                     uu____77937)
                                                    in
                                                 FStar_SMTEncoding_Util.mkAssume
                                                   uu____77920
                                                  in
                                               let uu____77947 =
                                                 let uu____77950 =
                                                   let uu____77953 =
                                                     let uu____77956 =
                                                       FStar_SMTEncoding_Term.mk_decls
                                                         "" tkey_hash
                                                         [e_typing]
                                                         (FStar_List.append
                                                            decls
                                                            (FStar_List.append
                                                               decls' decls''))
                                                        in
                                                     FStar_List.append
                                                       decls'' uu____77956
                                                      in
                                                   FStar_List.append decls'
                                                     uu____77953
                                                    in
                                                 FStar_List.append decls
                                                   uu____77950
                                                  in
                                               (app_tm, uu____77947))))
                             in
                          let encode_full_app fv =
                            let uu____77976 =
                              FStar_SMTEncoding_Env.lookup_free_var_sym env
                                fv
                               in
                            match uu____77976 with
                            | (fname,fuel_args,arity) ->
                                let tm =
                                  maybe_curry_app t0.FStar_Syntax_Syntax.pos
                                    fname arity
                                    (FStar_List.append fuel_args args)
                                   in
                                (tm, decls)
                             in
                          let head2 = FStar_Syntax_Subst.compress head1  in
                          let head_type =
                            match head2.FStar_Syntax_Syntax.n with
                            | FStar_Syntax_Syntax.Tm_uinst
                                ({
                                   FStar_Syntax_Syntax.n =
                                     FStar_Syntax_Syntax.Tm_name x;
                                   FStar_Syntax_Syntax.pos = uu____78019;
                                   FStar_Syntax_Syntax.vars = uu____78020;_},uu____78021)
                                ->
                                FStar_Pervasives_Native.Some
                                  (x.FStar_Syntax_Syntax.sort)
                            | FStar_Syntax_Syntax.Tm_name x ->
                                FStar_Pervasives_Native.Some
                                  (x.FStar_Syntax_Syntax.sort)
                            | FStar_Syntax_Syntax.Tm_uinst
                                ({
                                   FStar_Syntax_Syntax.n =
                                     FStar_Syntax_Syntax.Tm_fvar fv;
                                   FStar_Syntax_Syntax.pos = uu____78028;
                                   FStar_Syntax_Syntax.vars = uu____78029;_},uu____78030)
                                ->
                                let uu____78035 =
                                  let uu____78036 =
                                    let uu____78041 =
                                      FStar_TypeChecker_Env.lookup_lid
                                        env.FStar_SMTEncoding_Env.tcenv
                                        (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                                       in
                                    FStar_All.pipe_right uu____78041
                                      FStar_Pervasives_Native.fst
                                     in
                                  FStar_All.pipe_right uu____78036
                                    FStar_Pervasives_Native.snd
                                   in
                                FStar_Pervasives_Native.Some uu____78035
                            | FStar_Syntax_Syntax.Tm_fvar fv ->
                                let uu____78071 =
                                  let uu____78072 =
                                    let uu____78077 =
                                      FStar_TypeChecker_Env.lookup_lid
                                        env.FStar_SMTEncoding_Env.tcenv
                                        (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                                       in
                                    FStar_All.pipe_right uu____78077
                                      FStar_Pervasives_Native.fst
                                     in
                                  FStar_All.pipe_right uu____78072
                                    FStar_Pervasives_Native.snd
                                   in
                                FStar_Pervasives_Native.Some uu____78071
                            | FStar_Syntax_Syntax.Tm_ascribed
                                (uu____78106,(FStar_Util.Inl t1,uu____78108),uu____78109)
                                -> FStar_Pervasives_Native.Some t1
                            | FStar_Syntax_Syntax.Tm_ascribed
                                (uu____78156,(FStar_Util.Inr c,uu____78158),uu____78159)
                                ->
                                FStar_Pervasives_Native.Some
                                  (FStar_Syntax_Util.comp_result c)
                            | uu____78206 -> FStar_Pervasives_Native.None  in
                          (match head_type with
                           | FStar_Pervasives_Native.None  ->
                               encode_partial_app
                                 FStar_Pervasives_Native.None
                           | FStar_Pervasives_Native.Some head_type1 ->
                               let head_type2 =
                                 let uu____78227 =
                                   FStar_TypeChecker_Normalize.normalize_refinement
                                     [FStar_TypeChecker_Env.Weak;
                                     FStar_TypeChecker_Env.HNF;
                                     FStar_TypeChecker_Env.EraseUniverses]
                                     env.FStar_SMTEncoding_Env.tcenv
                                     head_type1
                                    in
                                 FStar_All.pipe_left
                                   FStar_Syntax_Util.unrefine uu____78227
                                  in
                               let uu____78228 =
                                 curried_arrow_formals_comp head_type2  in
                               (match uu____78228 with
                                | (formals,c) ->
                                    (match head2.FStar_Syntax_Syntax.n with
                                     | FStar_Syntax_Syntax.Tm_uinst
                                         ({
                                            FStar_Syntax_Syntax.n =
                                              FStar_Syntax_Syntax.Tm_fvar fv;
                                            FStar_Syntax_Syntax.pos =
                                              uu____78244;
                                            FStar_Syntax_Syntax.vars =
                                              uu____78245;_},uu____78246)
                                         when
                                         (FStar_List.length formals) =
                                           (FStar_List.length args)
                                         ->
                                         encode_full_app
                                           fv.FStar_Syntax_Syntax.fv_name
                                     | FStar_Syntax_Syntax.Tm_fvar fv when
                                         (FStar_List.length formals) =
                                           (FStar_List.length args)
                                         ->
                                         encode_full_app
                                           fv.FStar_Syntax_Syntax.fv_name
                                     | uu____78264 ->
                                         if
                                           (FStar_List.length formals) >
                                             (FStar_List.length args)
                                         then
                                           encode_partial_app
                                             (FStar_Pervasives_Native.Some
                                                (formals, c))
                                         else
                                           encode_partial_app
                                             FStar_Pervasives_Native.None))))))
       | FStar_Syntax_Syntax.Tm_abs (bs,body,lopt) ->
           let uu____78343 = FStar_Syntax_Subst.open_term' bs body  in
           (match uu____78343 with
            | (bs1,body1,opening) ->
                let fallback uu____78366 =
                  let f =
                    FStar_SMTEncoding_Env.varops.FStar_SMTEncoding_Env.fresh
                      env.FStar_SMTEncoding_Env.current_module_name "Tm_abs"
                     in
                  let decl =
                    FStar_SMTEncoding_Term.DeclFun
                      (f, [], FStar_SMTEncoding_Term.Term_sort,
                        (FStar_Pervasives_Native.Some
                           "Imprecise function encoding"))
                     in
                  let uu____78376 =
                    let uu____78377 =
                      FStar_SMTEncoding_Term.mk_fv
                        (f, FStar_SMTEncoding_Term.Term_sort)
                       in
                    FStar_All.pipe_left FStar_SMTEncoding_Util.mkFreeV
                      uu____78377
                     in
                  let uu____78379 =
                    FStar_All.pipe_right [decl]
                      FStar_SMTEncoding_Term.mk_decls_trivial
                     in
                  (uu____78376, uu____78379)  in
                let is_impure rc =
                  let uu____78389 =
                    FStar_TypeChecker_Util.is_pure_or_ghost_effect
                      env.FStar_SMTEncoding_Env.tcenv
                      rc.FStar_Syntax_Syntax.residual_effect
                     in
                  FStar_All.pipe_right uu____78389 Prims.op_Negation  in
                let codomain_eff rc =
                  let res_typ =
                    match rc.FStar_Syntax_Syntax.residual_typ with
                    | FStar_Pervasives_Native.None  ->
                        let uu____78404 =
                          let uu____78417 =
                            FStar_TypeChecker_Env.get_range
                              env.FStar_SMTEncoding_Env.tcenv
                             in
                          FStar_TypeChecker_Util.new_implicit_var
                            "SMTEncoding codomain" uu____78417
                            env.FStar_SMTEncoding_Env.tcenv
                            FStar_Syntax_Util.ktype0
                           in
                        (match uu____78404 with
                         | (t1,uu____78420,uu____78421) -> t1)
                    | FStar_Pervasives_Native.Some t1 -> t1  in
                  let uu____78439 =
                    FStar_Ident.lid_equals
                      rc.FStar_Syntax_Syntax.residual_effect
                      FStar_Parser_Const.effect_Tot_lid
                     in
                  if uu____78439
                  then
                    let uu____78444 = FStar_Syntax_Syntax.mk_Total res_typ
                       in
                    FStar_Pervasives_Native.Some uu____78444
                  else
                    (let uu____78447 =
                       FStar_Ident.lid_equals
                         rc.FStar_Syntax_Syntax.residual_effect
                         FStar_Parser_Const.effect_GTot_lid
                        in
                     if uu____78447
                     then
                       let uu____78452 =
                         FStar_Syntax_Syntax.mk_GTotal res_typ  in
                       FStar_Pervasives_Native.Some uu____78452
                     else FStar_Pervasives_Native.None)
                   in
                (match lopt with
                 | FStar_Pervasives_Native.None  ->
                     ((let uu____78460 =
                         let uu____78466 =
                           let uu____78468 =
                             FStar_Syntax_Print.term_to_string t0  in
                           FStar_Util.format1
                             "Losing precision when encoding a function literal: %s\n(Unnannotated abstraction in the compiler ?)"
                             uu____78468
                            in
                         (FStar_Errors.Warning_FunctionLiteralPrecisionLoss,
                           uu____78466)
                          in
                       FStar_Errors.log_issue t0.FStar_Syntax_Syntax.pos
                         uu____78460);
                      fallback ())
                 | FStar_Pervasives_Native.Some rc ->
                     let uu____78473 =
                       (is_impure rc) &&
                         (let uu____78476 =
                            FStar_TypeChecker_Env.is_reifiable_rc
                              env.FStar_SMTEncoding_Env.tcenv rc
                             in
                          Prims.op_Negation uu____78476)
                        in
                     if uu____78473
                     then fallback ()
                     else
                       (let uu____78485 =
                          encode_binders FStar_Pervasives_Native.None bs1 env
                           in
                        match uu____78485 with
                        | (vars,guards,envbody,decls,uu____78510) ->
                            let body2 =
                              let uu____78524 =
                                FStar_TypeChecker_Env.is_reifiable_rc
                                  env.FStar_SMTEncoding_Env.tcenv rc
                                 in
                              if uu____78524
                              then
                                FStar_TypeChecker_Util.reify_body
                                  env.FStar_SMTEncoding_Env.tcenv body1
                              else body1  in
                            let uu____78529 = encode_term body2 envbody  in
                            (match uu____78529 with
                             | (body3,decls') ->
                                 let uu____78540 =
                                   let uu____78549 = codomain_eff rc  in
                                   match uu____78549 with
                                   | FStar_Pervasives_Native.None  ->
                                       (FStar_Pervasives_Native.None, [])
                                   | FStar_Pervasives_Native.Some c ->
                                       let tfun =
                                         FStar_Syntax_Util.arrow bs1 c  in
                                       let uu____78568 = encode_term tfun env
                                          in
                                       (match uu____78568 with
                                        | (t1,decls1) ->
                                            ((FStar_Pervasives_Native.Some t1),
                                              decls1))
                                    in
                                 (match uu____78540 with
                                  | (arrow_t_opt,decls'') ->
                                      let key_body =
                                        let uu____78602 =
                                          let uu____78613 =
                                            let uu____78614 =
                                              let uu____78619 =
                                                FStar_SMTEncoding_Util.mk_and_l
                                                  guards
                                                 in
                                              (uu____78619, body3)  in
                                            FStar_SMTEncoding_Util.mkImp
                                              uu____78614
                                             in
                                          ([], vars, uu____78613)  in
                                        FStar_SMTEncoding_Term.mkForall
                                          t0.FStar_Syntax_Syntax.pos
                                          uu____78602
                                         in
                                      let cvars =
                                        FStar_SMTEncoding_Term.free_variables
                                          key_body
                                         in
                                      let uu____78627 =
                                        match arrow_t_opt with
                                        | FStar_Pervasives_Native.None  ->
                                            (cvars, key_body)
                                        | FStar_Pervasives_Native.Some t1 ->
                                            let uu____78643 =
                                              let uu____78646 =
                                                let uu____78657 =
                                                  FStar_SMTEncoding_Term.free_variables
                                                    t1
                                                   in
                                                FStar_List.append uu____78657
                                                  cvars
                                                 in
                                              FStar_Util.remove_dups
                                                FStar_SMTEncoding_Term.fv_eq
                                                uu____78646
                                               in
                                            let uu____78684 =
                                              FStar_SMTEncoding_Util.mkAnd
                                                (key_body, t1)
                                               in
                                            (uu____78643, uu____78684)
                                         in
                                      (match uu____78627 with
                                       | (cvars1,key_body1) ->
                                           let tkey =
                                             FStar_SMTEncoding_Term.mkForall
                                               t0.FStar_Syntax_Syntax.pos
                                               ([], cvars1, key_body1)
                                              in
                                           let tkey_hash =
                                             FStar_SMTEncoding_Term.hash_of_term
                                               tkey
                                              in
                                           let uu____78706 =
                                             is_an_eta_expansion env vars
                                               body3
                                              in
                                           (match uu____78706 with
                                            | FStar_Pervasives_Native.Some t1
                                                ->
                                                let decls1 =
                                                  FStar_List.append decls
                                                    (FStar_List.append decls'
                                                       decls'')
                                                   in
                                                (t1, decls1)
                                            | FStar_Pervasives_Native.None 
                                                ->
                                                let cvar_sorts =
                                                  FStar_List.map
                                                    FStar_SMTEncoding_Term.fv_sort
                                                    cvars1
                                                   in
                                                let fsym =
                                                  let uu____78722 =
                                                    FStar_Util.digest_of_string
                                                      tkey_hash
                                                     in
                                                  Prims.op_Hat "Tm_abs_"
                                                    uu____78722
                                                   in
                                                let fdecl =
                                                  FStar_SMTEncoding_Term.DeclFun
                                                    (fsym, cvar_sorts,
                                                      FStar_SMTEncoding_Term.Term_sort,
                                                      FStar_Pervasives_Native.None)
                                                   in
                                                let f =
                                                  let uu____78731 =
                                                    let uu____78739 =
                                                      FStar_List.map
                                                        FStar_SMTEncoding_Util.mkFreeV
                                                        cvars1
                                                       in
                                                    (fsym, uu____78739)  in
                                                  FStar_SMTEncoding_Util.mkApp
                                                    uu____78731
                                                   in
                                                let app = mk_Apply f vars  in
                                                let typing_f =
                                                  match arrow_t_opt with
                                                  | FStar_Pervasives_Native.None
                                                       -> []
                                                  | FStar_Pervasives_Native.Some
                                                      t1 ->
                                                      let f_has_t =
                                                        FStar_SMTEncoding_Term.mk_HasTypeWithFuel
                                                          FStar_Pervasives_Native.None
                                                          f t1
                                                         in
                                                      let a_name =
                                                        Prims.op_Hat
                                                          "typing_" fsym
                                                         in
                                                      let uu____78756 =
                                                        let uu____78757 =
                                                          let uu____78765 =
                                                            FStar_SMTEncoding_Term.mkForall
                                                              t0.FStar_Syntax_Syntax.pos
                                                              ([[f]], cvars1,
                                                                f_has_t)
                                                             in
                                                          (uu____78765,
                                                            (FStar_Pervasives_Native.Some
                                                               a_name),
                                                            a_name)
                                                           in
                                                        FStar_SMTEncoding_Util.mkAssume
                                                          uu____78757
                                                         in
                                                      [uu____78756]
                                                   in
                                                let interp_f =
                                                  let a_name =
                                                    Prims.op_Hat
                                                      "interpretation_" fsym
                                                     in
                                                  let uu____78780 =
                                                    let uu____78788 =
                                                      let uu____78789 =
                                                        let uu____78800 =
                                                          FStar_SMTEncoding_Util.mkEq
                                                            (app, body3)
                                                           in
                                                        ([[app]],
                                                          (FStar_List.append
                                                             vars cvars1),
                                                          uu____78800)
                                                         in
                                                      FStar_SMTEncoding_Term.mkForall
                                                        t0.FStar_Syntax_Syntax.pos
                                                        uu____78789
                                                       in
                                                    (uu____78788,
                                                      (FStar_Pervasives_Native.Some
                                                         a_name), a_name)
                                                     in
                                                  FStar_SMTEncoding_Util.mkAssume
                                                    uu____78780
                                                   in
                                                let f_decls =
                                                  FStar_List.append (fdecl ::
                                                    typing_f) [interp_f]
                                                   in
                                                let uu____78814 =
                                                  let uu____78815 =
                                                    let uu____78818 =
                                                      let uu____78821 =
                                                        FStar_SMTEncoding_Term.mk_decls
                                                          fsym tkey_hash
                                                          f_decls
                                                          (FStar_List.append
                                                             decls
                                                             (FStar_List.append
                                                                decls'
                                                                decls''))
                                                         in
                                                      FStar_List.append
                                                        decls'' uu____78821
                                                       in
                                                    FStar_List.append decls'
                                                      uu____78818
                                                     in
                                                  FStar_List.append decls
                                                    uu____78815
                                                   in
                                                (f, uu____78814))))))))
       | FStar_Syntax_Syntax.Tm_let
           ((uu____78824,{
                           FStar_Syntax_Syntax.lbname = FStar_Util.Inr
                             uu____78825;
                           FStar_Syntax_Syntax.lbunivs = uu____78826;
                           FStar_Syntax_Syntax.lbtyp = uu____78827;
                           FStar_Syntax_Syntax.lbeff = uu____78828;
                           FStar_Syntax_Syntax.lbdef = uu____78829;
                           FStar_Syntax_Syntax.lbattrs = uu____78830;
                           FStar_Syntax_Syntax.lbpos = uu____78831;_}::uu____78832),uu____78833)
           -> failwith "Impossible: already handled by encoding of Sig_let"
       | FStar_Syntax_Syntax.Tm_let
           ((false
             ,{ FStar_Syntax_Syntax.lbname = FStar_Util.Inl x;
                FStar_Syntax_Syntax.lbunivs = uu____78867;
                FStar_Syntax_Syntax.lbtyp = t1;
                FStar_Syntax_Syntax.lbeff = uu____78869;
                FStar_Syntax_Syntax.lbdef = e1;
                FStar_Syntax_Syntax.lbattrs = uu____78871;
                FStar_Syntax_Syntax.lbpos = uu____78872;_}::[]),e2)
           -> encode_let x t1 e1 e2 env encode_term
       | FStar_Syntax_Syntax.Tm_let uu____78899 ->
           (FStar_Errors.diag t0.FStar_Syntax_Syntax.pos
              "Non-top-level recursive functions, and their enclosings let bindings (including the top-level let) are not yet fully encoded to the SMT solver; you may not be able to prove some facts";
            FStar_Exn.raise FStar_SMTEncoding_Env.Inner_let_rec)
       | FStar_Syntax_Syntax.Tm_match (e,pats) ->
           encode_match e pats FStar_SMTEncoding_Term.mk_Term_unit env
             encode_term)

and (encode_let :
  FStar_Syntax_Syntax.bv ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.term ->
          FStar_SMTEncoding_Env.env_t ->
            (FStar_Syntax_Syntax.term ->
               FStar_SMTEncoding_Env.env_t ->
                 (FStar_SMTEncoding_Term.term *
                   FStar_SMTEncoding_Term.decls_t))
              ->
              (FStar_SMTEncoding_Term.term * FStar_SMTEncoding_Term.decls_t))
  =
  fun x  ->
    fun t1  ->
      fun e1  ->
        fun e2  ->
          fun env  ->
            fun encode_body  ->
              let uu____78971 =
                let uu____78976 =
                  FStar_Syntax_Util.ascribe e1
                    ((FStar_Util.Inl t1), FStar_Pervasives_Native.None)
                   in
                encode_term uu____78976 env  in
              match uu____78971 with
              | (ee1,decls1) ->
                  let uu____79001 =
                    FStar_Syntax_Subst.open_term
                      [(x, FStar_Pervasives_Native.None)] e2
                     in
                  (match uu____79001 with
                   | (xs,e21) ->
                       let uu____79026 = FStar_List.hd xs  in
                       (match uu____79026 with
                        | (x1,uu____79044) ->
                            let env' =
                              FStar_SMTEncoding_Env.push_term_var env x1 ee1
                               in
                            let uu____79050 = encode_body e21 env'  in
                            (match uu____79050 with
                             | (ee2,decls2) ->
                                 (ee2, (FStar_List.append decls1 decls2)))))

and (encode_match :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.branch Prims.list ->
      FStar_SMTEncoding_Term.term ->
        FStar_SMTEncoding_Env.env_t ->
          (FStar_Syntax_Syntax.term ->
             FStar_SMTEncoding_Env.env_t ->
               (FStar_SMTEncoding_Term.term * FStar_SMTEncoding_Term.decls_t))
            -> (FStar_SMTEncoding_Term.term * FStar_SMTEncoding_Term.decls_t))
  =
  fun e  ->
    fun pats  ->
      fun default_case  ->
        fun env  ->
          fun encode_br  ->
            let uu____79080 =
              let uu____79088 =
                let uu____79089 =
                  FStar_Syntax_Syntax.mk FStar_Syntax_Syntax.Tm_unknown
                    FStar_Pervasives_Native.None FStar_Range.dummyRange
                   in
                FStar_Syntax_Syntax.null_bv uu____79089  in
              FStar_SMTEncoding_Env.gen_term_var env uu____79088  in
            match uu____79080 with
            | (scrsym,scr',env1) ->
                let uu____79099 = encode_term e env1  in
                (match uu____79099 with
                 | (scr,decls) ->
                     let uu____79110 =
                       let encode_branch b uu____79139 =
                         match uu____79139 with
                         | (else_case,decls1) ->
                             let uu____79158 =
                               FStar_Syntax_Subst.open_branch b  in
                             (match uu____79158 with
                              | (p,w,br) ->
                                  let uu____79184 = encode_pat env1 p  in
                                  (match uu____79184 with
                                   | (env0,pattern) ->
                                       let guard = pattern.guard scr'  in
                                       let projections =
                                         pattern.projections scr'  in
                                       let env2 =
                                         FStar_All.pipe_right projections
                                           (FStar_List.fold_left
                                              (fun env2  ->
                                                 fun uu____79221  ->
                                                   match uu____79221 with
                                                   | (x,t) ->
                                                       FStar_SMTEncoding_Env.push_term_var
                                                         env2 x t) env1)
                                          in
                                       let uu____79228 =
                                         match w with
                                         | FStar_Pervasives_Native.None  ->
                                             (guard, [])
                                         | FStar_Pervasives_Native.Some w1 ->
                                             let uu____79250 =
                                               encode_term w1 env2  in
                                             (match uu____79250 with
                                              | (w2,decls2) ->
                                                  let uu____79263 =
                                                    let uu____79264 =
                                                      let uu____79269 =
                                                        let uu____79270 =
                                                          let uu____79275 =
                                                            FStar_SMTEncoding_Term.boxBool
                                                              FStar_SMTEncoding_Util.mkTrue
                                                             in
                                                          (w2, uu____79275)
                                                           in
                                                        FStar_SMTEncoding_Util.mkEq
                                                          uu____79270
                                                         in
                                                      (guard, uu____79269)
                                                       in
                                                    FStar_SMTEncoding_Util.mkAnd
                                                      uu____79264
                                                     in
                                                  (uu____79263, decls2))
                                          in
                                       (match uu____79228 with
                                        | (guard1,decls2) ->
                                            let uu____79290 =
                                              encode_br br env2  in
                                            (match uu____79290 with
                                             | (br1,decls3) ->
                                                 let uu____79303 =
                                                   FStar_SMTEncoding_Util.mkITE
                                                     (guard1, br1, else_case)
                                                    in
                                                 (uu____79303,
                                                   (FStar_List.append decls1
                                                      (FStar_List.append
                                                         decls2 decls3)))))))
                          in
                       FStar_List.fold_right encode_branch pats
                         (default_case, decls)
                        in
                     (match uu____79110 with
                      | (match_tm,decls1) ->
                          let uu____79324 =
                            let uu____79325 =
                              let uu____79336 =
                                let uu____79343 =
                                  let uu____79348 =
                                    FStar_SMTEncoding_Term.mk_fv
                                      (scrsym,
                                        FStar_SMTEncoding_Term.Term_sort)
                                     in
                                  (uu____79348, scr)  in
                                [uu____79343]  in
                              (uu____79336, match_tm)  in
                            FStar_SMTEncoding_Term.mkLet' uu____79325
                              FStar_Range.dummyRange
                             in
                          (uu____79324, decls1)))

and (encode_pat :
  FStar_SMTEncoding_Env.env_t ->
    FStar_Syntax_Syntax.pat -> (FStar_SMTEncoding_Env.env_t * pattern))
  =
  fun env  ->
    fun pat  ->
      (let uu____79371 =
         FStar_TypeChecker_Env.debug env.FStar_SMTEncoding_Env.tcenv
           FStar_Options.Medium
          in
       if uu____79371
       then
         let uu____79374 = FStar_Syntax_Print.pat_to_string pat  in
         FStar_Util.print1 "Encoding pattern %s\n" uu____79374
       else ());
      (let uu____79379 = FStar_TypeChecker_Util.decorated_pattern_as_term pat
          in
       match uu____79379 with
       | (vars,pat_term) ->
           let uu____79396 =
             FStar_All.pipe_right vars
               (FStar_List.fold_left
                  (fun uu____79438  ->
                     fun v1  ->
                       match uu____79438 with
                       | (env1,vars1) ->
                           let uu____79474 =
                             FStar_SMTEncoding_Env.gen_term_var env1 v1  in
                           (match uu____79474 with
                            | (xx,uu____79493,env2) ->
                                let uu____79497 =
                                  let uu____79504 =
                                    let uu____79509 =
                                      FStar_SMTEncoding_Term.mk_fv
                                        (xx,
                                          FStar_SMTEncoding_Term.Term_sort)
                                       in
                                    (v1, uu____79509)  in
                                  uu____79504 :: vars1  in
                                (env2, uu____79497))) (env, []))
              in
           (match uu____79396 with
            | (env1,vars1) ->
                let rec mk_guard pat1 scrutinee =
                  match pat1.FStar_Syntax_Syntax.v with
                  | FStar_Syntax_Syntax.Pat_var uu____79564 ->
                      FStar_SMTEncoding_Util.mkTrue
                  | FStar_Syntax_Syntax.Pat_wild uu____79565 ->
                      FStar_SMTEncoding_Util.mkTrue
                  | FStar_Syntax_Syntax.Pat_dot_term uu____79566 ->
                      FStar_SMTEncoding_Util.mkTrue
                  | FStar_Syntax_Syntax.Pat_constant c ->
                      let uu____79574 = encode_const c env1  in
                      (match uu____79574 with
                       | (tm,decls) ->
                           ((match decls with
                             | uu____79582::uu____79583 ->
                                 failwith
                                   "Unexpected encoding of constant pattern"
                             | uu____79587 -> ());
                            FStar_SMTEncoding_Util.mkEq (scrutinee, tm)))
                  | FStar_Syntax_Syntax.Pat_cons (f,args) ->
                      let is_f =
                        let tc_name =
                          FStar_TypeChecker_Env.typ_of_datacon
                            env1.FStar_SMTEncoding_Env.tcenv
                            (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                           in
                        let uu____79610 =
                          FStar_TypeChecker_Env.datacons_of_typ
                            env1.FStar_SMTEncoding_Env.tcenv tc_name
                           in
                        match uu____79610 with
                        | (uu____79618,uu____79619::[]) ->
                            FStar_SMTEncoding_Util.mkTrue
                        | uu____79624 ->
                            FStar_SMTEncoding_Env.mk_data_tester env1
                              (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                              scrutinee
                         in
                      let sub_term_guards =
                        FStar_All.pipe_right args
                          (FStar_List.mapi
                             (fun i  ->
                                fun uu____79660  ->
                                  match uu____79660 with
                                  | (arg,uu____79670) ->
                                      let proj =
                                        FStar_SMTEncoding_Env.primitive_projector_by_pos
                                          env1.FStar_SMTEncoding_Env.tcenv
                                          (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                                          i
                                         in
                                      let uu____79679 =
                                        FStar_SMTEncoding_Util.mkApp
                                          (proj, [scrutinee])
                                         in
                                      mk_guard arg uu____79679))
                         in
                      FStar_SMTEncoding_Util.mk_and_l (is_f ::
                        sub_term_guards)
                   in
                let rec mk_projections pat1 scrutinee =
                  match pat1.FStar_Syntax_Syntax.v with
                  | FStar_Syntax_Syntax.Pat_dot_term (x,uu____79711) ->
                      [(x, scrutinee)]
                  | FStar_Syntax_Syntax.Pat_var x -> [(x, scrutinee)]
                  | FStar_Syntax_Syntax.Pat_wild x -> [(x, scrutinee)]
                  | FStar_Syntax_Syntax.Pat_constant uu____79742 -> []
                  | FStar_Syntax_Syntax.Pat_cons (f,args) ->
                      let uu____79767 =
                        FStar_All.pipe_right args
                          (FStar_List.mapi
                             (fun i  ->
                                fun uu____79813  ->
                                  match uu____79813 with
                                  | (arg,uu____79829) ->
                                      let proj =
                                        FStar_SMTEncoding_Env.primitive_projector_by_pos
                                          env1.FStar_SMTEncoding_Env.tcenv
                                          (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                                          i
                                         in
                                      let uu____79838 =
                                        FStar_SMTEncoding_Util.mkApp
                                          (proj, [scrutinee])
                                         in
                                      mk_projections arg uu____79838))
                         in
                      FStar_All.pipe_right uu____79767 FStar_List.flatten
                   in
                let pat_term1 uu____79869 = encode_term pat_term env1  in
                let pattern =
                  {
                    pat_vars = vars1;
                    pat_term = pat_term1;
                    guard = (mk_guard pat);
                    projections = (mk_projections pat)
                  }  in
                (env1, pattern)))

and (encode_args :
  FStar_Syntax_Syntax.args ->
    FStar_SMTEncoding_Env.env_t ->
      (FStar_SMTEncoding_Term.term Prims.list *
        FStar_SMTEncoding_Term.decls_t))
  =
  fun l  ->
    fun env  ->
      let uu____79879 =
        FStar_All.pipe_right l
          (FStar_List.fold_left
             (fun uu____79927  ->
                fun uu____79928  ->
                  match (uu____79927, uu____79928) with
                  | ((tms,decls),(t,uu____79968)) ->
                      let uu____79995 = encode_term t env  in
                      (match uu____79995 with
                       | (t1,decls') ->
                           ((t1 :: tms), (FStar_List.append decls decls'))))
             ([], []))
         in
      match uu____79879 with | (l1,decls) -> ((FStar_List.rev l1), decls)

and (encode_function_type_as_formula :
  FStar_Syntax_Syntax.typ ->
    FStar_SMTEncoding_Env.env_t ->
      (FStar_SMTEncoding_Term.term * FStar_SMTEncoding_Term.decls_t))
  =
  fun t  ->
    fun env  ->
      let list_elements1 e =
        let uu____80052 = FStar_Syntax_Util.list_elements e  in
        match uu____80052 with
        | FStar_Pervasives_Native.Some l -> l
        | FStar_Pervasives_Native.None  ->
            (FStar_Errors.log_issue e.FStar_Syntax_Syntax.pos
               (FStar_Errors.Warning_NonListLiteralSMTPattern,
                 "SMT pattern is not a list literal; ignoring the pattern");
             [])
         in
      let one_pat p =
        let uu____80083 =
          let uu____80100 = FStar_Syntax_Util.unmeta p  in
          FStar_All.pipe_right uu____80100 FStar_Syntax_Util.head_and_args
           in
        match uu____80083 with
        | (head1,args) ->
            let uu____80151 =
              let uu____80166 =
                let uu____80167 = FStar_Syntax_Util.un_uinst head1  in
                uu____80167.FStar_Syntax_Syntax.n  in
              (uu____80166, args)  in
            (match uu____80151 with
             | (FStar_Syntax_Syntax.Tm_fvar
                fv,(uu____80189,uu____80190)::arg::[]) when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.smtpat_lid
                 -> arg
             | uu____80242 -> failwith "Unexpected pattern term")
         in
      let lemma_pats p =
        let elts = list_elements1 p  in
        let smt_pat_or1 t1 =
          let uu____80297 =
            let uu____80314 = FStar_Syntax_Util.unmeta t1  in
            FStar_All.pipe_right uu____80314 FStar_Syntax_Util.head_and_args
             in
          match uu____80297 with
          | (head1,args) ->
              let uu____80361 =
                let uu____80376 =
                  let uu____80377 = FStar_Syntax_Util.un_uinst head1  in
                  uu____80377.FStar_Syntax_Syntax.n  in
                (uu____80376, args)  in
              (match uu____80361 with
               | (FStar_Syntax_Syntax.Tm_fvar fv,(e,uu____80396)::[]) when
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.smtpatOr_lid
                   -> FStar_Pervasives_Native.Some e
               | uu____80433 -> FStar_Pervasives_Native.None)
           in
        match elts with
        | t1::[] ->
            let uu____80463 = smt_pat_or1 t1  in
            (match uu____80463 with
             | FStar_Pervasives_Native.Some e ->
                 let uu____80485 = list_elements1 e  in
                 FStar_All.pipe_right uu____80485
                   (FStar_List.map
                      (fun branch1  ->
                         let uu____80515 = list_elements1 branch1  in
                         FStar_All.pipe_right uu____80515
                           (FStar_List.map one_pat)))
             | uu____80538 ->
                 let uu____80543 =
                   FStar_All.pipe_right elts (FStar_List.map one_pat)  in
                 [uu____80543])
        | uu____80594 ->
            let uu____80597 =
              FStar_All.pipe_right elts (FStar_List.map one_pat)  in
            [uu____80597]
         in
      let uu____80648 =
        let uu____80663 =
          let uu____80664 = FStar_Syntax_Subst.compress t  in
          uu____80664.FStar_Syntax_Syntax.n  in
        match uu____80663 with
        | FStar_Syntax_Syntax.Tm_arrow (binders,c) ->
            let uu____80703 = FStar_Syntax_Subst.open_comp binders c  in
            (match uu____80703 with
             | (binders1,c1) ->
                 (match c1.FStar_Syntax_Syntax.n with
                  | FStar_Syntax_Syntax.Comp
                      { FStar_Syntax_Syntax.comp_univs = uu____80738;
                        FStar_Syntax_Syntax.effect_name = uu____80739;
                        FStar_Syntax_Syntax.result_typ = uu____80740;
                        FStar_Syntax_Syntax.effect_args =
                          (pre,uu____80742)::(post,uu____80744)::(pats,uu____80746)::[];
                        FStar_Syntax_Syntax.flags = uu____80747;_}
                      ->
                      let uu____80808 = lemma_pats pats  in
                      (binders1, pre, post, uu____80808)
                  | uu____80819 -> failwith "impos"))
        | uu____80835 -> failwith "Impos"  in
      match uu____80648 with
      | (binders,pre,post,patterns) ->
          let env1 =
            let uu___1940_80872 = env  in
            {
              FStar_SMTEncoding_Env.bvar_bindings =
                (uu___1940_80872.FStar_SMTEncoding_Env.bvar_bindings);
              FStar_SMTEncoding_Env.fvar_bindings =
                (uu___1940_80872.FStar_SMTEncoding_Env.fvar_bindings);
              FStar_SMTEncoding_Env.depth =
                (uu___1940_80872.FStar_SMTEncoding_Env.depth);
              FStar_SMTEncoding_Env.tcenv =
                (uu___1940_80872.FStar_SMTEncoding_Env.tcenv);
              FStar_SMTEncoding_Env.warn =
                (uu___1940_80872.FStar_SMTEncoding_Env.warn);
              FStar_SMTEncoding_Env.nolabels =
                (uu___1940_80872.FStar_SMTEncoding_Env.nolabels);
              FStar_SMTEncoding_Env.use_zfuel_name = true;
              FStar_SMTEncoding_Env.encode_non_total_function_typ =
                (uu___1940_80872.FStar_SMTEncoding_Env.encode_non_total_function_typ);
              FStar_SMTEncoding_Env.current_module_name =
                (uu___1940_80872.FStar_SMTEncoding_Env.current_module_name);
              FStar_SMTEncoding_Env.encoding_quantifier =
                (uu___1940_80872.FStar_SMTEncoding_Env.encoding_quantifier);
              FStar_SMTEncoding_Env.global_cache =
                (uu___1940_80872.FStar_SMTEncoding_Env.global_cache)
            }  in
          let uu____80874 =
            encode_binders FStar_Pervasives_Native.None binders env1  in
          (match uu____80874 with
           | (vars,guards,env2,decls,uu____80899) ->
               let uu____80912 = encode_smt_patterns patterns env2  in
               (match uu____80912 with
                | (pats,decls') ->
                    let post1 = FStar_Syntax_Util.unthunk_lemma_post post  in
                    let env3 =
                      let uu___1953_80939 = env2  in
                      {
                        FStar_SMTEncoding_Env.bvar_bindings =
                          (uu___1953_80939.FStar_SMTEncoding_Env.bvar_bindings);
                        FStar_SMTEncoding_Env.fvar_bindings =
                          (uu___1953_80939.FStar_SMTEncoding_Env.fvar_bindings);
                        FStar_SMTEncoding_Env.depth =
                          (uu___1953_80939.FStar_SMTEncoding_Env.depth);
                        FStar_SMTEncoding_Env.tcenv =
                          (uu___1953_80939.FStar_SMTEncoding_Env.tcenv);
                        FStar_SMTEncoding_Env.warn =
                          (uu___1953_80939.FStar_SMTEncoding_Env.warn);
                        FStar_SMTEncoding_Env.nolabels = true;
                        FStar_SMTEncoding_Env.use_zfuel_name =
                          (uu___1953_80939.FStar_SMTEncoding_Env.use_zfuel_name);
                        FStar_SMTEncoding_Env.encode_non_total_function_typ =
                          (uu___1953_80939.FStar_SMTEncoding_Env.encode_non_total_function_typ);
                        FStar_SMTEncoding_Env.current_module_name =
                          (uu___1953_80939.FStar_SMTEncoding_Env.current_module_name);
                        FStar_SMTEncoding_Env.encoding_quantifier =
                          (uu___1953_80939.FStar_SMTEncoding_Env.encoding_quantifier);
                        FStar_SMTEncoding_Env.global_cache =
                          (uu___1953_80939.FStar_SMTEncoding_Env.global_cache)
                      }  in
                    let uu____80941 =
                      let uu____80946 = FStar_Syntax_Util.unmeta pre  in
                      encode_formula uu____80946 env3  in
                    (match uu____80941 with
                     | (pre1,decls'') ->
                         let uu____80953 =
                           let uu____80958 = FStar_Syntax_Util.unmeta post1
                              in
                           encode_formula uu____80958 env3  in
                         (match uu____80953 with
                          | (post2,decls''') ->
                              let decls1 =
                                FStar_List.append decls
                                  (FStar_List.append decls'
                                     (FStar_List.append decls'' decls'''))
                                 in
                              let uu____80968 =
                                let uu____80969 =
                                  let uu____80980 =
                                    let uu____80981 =
                                      let uu____80986 =
                                        FStar_SMTEncoding_Util.mk_and_l (pre1
                                          :: guards)
                                         in
                                      (uu____80986, post2)  in
                                    FStar_SMTEncoding_Util.mkImp uu____80981
                                     in
                                  (pats, vars, uu____80980)  in
                                FStar_SMTEncoding_Term.mkForall
                                  t.FStar_Syntax_Syntax.pos uu____80969
                                 in
                              (uu____80968, decls1)))))

and (encode_smt_patterns :
  FStar_Syntax_Syntax.arg Prims.list Prims.list ->
    FStar_SMTEncoding_Env.env_t ->
      (FStar_SMTEncoding_Term.term Prims.list Prims.list *
        FStar_SMTEncoding_Term.decls_t))
  =
  fun pats_l  ->
    fun env  ->
      let env1 =
        let uu___1965_81006 = env  in
        {
          FStar_SMTEncoding_Env.bvar_bindings =
            (uu___1965_81006.FStar_SMTEncoding_Env.bvar_bindings);
          FStar_SMTEncoding_Env.fvar_bindings =
            (uu___1965_81006.FStar_SMTEncoding_Env.fvar_bindings);
          FStar_SMTEncoding_Env.depth =
            (uu___1965_81006.FStar_SMTEncoding_Env.depth);
          FStar_SMTEncoding_Env.tcenv =
            (uu___1965_81006.FStar_SMTEncoding_Env.tcenv);
          FStar_SMTEncoding_Env.warn =
            (uu___1965_81006.FStar_SMTEncoding_Env.warn);
          FStar_SMTEncoding_Env.nolabels =
            (uu___1965_81006.FStar_SMTEncoding_Env.nolabels);
          FStar_SMTEncoding_Env.use_zfuel_name = true;
          FStar_SMTEncoding_Env.encode_non_total_function_typ =
            (uu___1965_81006.FStar_SMTEncoding_Env.encode_non_total_function_typ);
          FStar_SMTEncoding_Env.current_module_name =
            (uu___1965_81006.FStar_SMTEncoding_Env.current_module_name);
          FStar_SMTEncoding_Env.encoding_quantifier =
            (uu___1965_81006.FStar_SMTEncoding_Env.encoding_quantifier);
          FStar_SMTEncoding_Env.global_cache =
            (uu___1965_81006.FStar_SMTEncoding_Env.global_cache)
        }  in
      let encode_smt_pattern t =
        let uu____81022 = FStar_Syntax_Util.head_and_args t  in
        match uu____81022 with
        | (head1,args) ->
            let head2 = FStar_Syntax_Util.un_uinst head1  in
            (match ((head2.FStar_Syntax_Syntax.n), args) with
             | (FStar_Syntax_Syntax.Tm_fvar
                fv,uu____81085::(x,uu____81087)::(t1,uu____81089)::[]) when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.has_type_lid
                 ->
                 let uu____81156 = encode_term x env1  in
                 (match uu____81156 with
                  | (x1,decls) ->
                      let uu____81167 = encode_term t1 env1  in
                      (match uu____81167 with
                       | (t2,decls') ->
                           let uu____81178 =
                             FStar_SMTEncoding_Term.mk_HasType x1 t2  in
                           (uu____81178, (FStar_List.append decls decls'))))
             | uu____81179 -> encode_term t env1)
         in
      FStar_List.fold_right
        (fun pats  ->
           fun uu____81222  ->
             match uu____81222 with
             | (pats_l1,decls) ->
                 let uu____81267 =
                   FStar_List.fold_right
                     (fun uu____81302  ->
                        fun uu____81303  ->
                          match (uu____81302, uu____81303) with
                          | ((p,uu____81345),(pats1,decls1)) ->
                              let uu____81380 = encode_smt_pattern p  in
                              (match uu____81380 with
                               | (t,d) ->
                                   let uu____81395 =
                                     FStar_SMTEncoding_Term.check_pattern_ok
                                       t
                                      in
                                   (match uu____81395 with
                                    | FStar_Pervasives_Native.None  ->
                                        ((t :: pats1),
                                          (FStar_List.append d decls1))
                                    | FStar_Pervasives_Native.Some
                                        illegal_subterm ->
                                        ((let uu____81412 =
                                            let uu____81418 =
                                              let uu____81420 =
                                                FStar_Syntax_Print.term_to_string
                                                  p
                                                 in
                                              let uu____81422 =
                                                FStar_SMTEncoding_Term.print_smt_term
                                                  illegal_subterm
                                                 in
                                              FStar_Util.format2
                                                "Pattern %s contains illegal sub-term (%s); dropping it"
                                                uu____81420 uu____81422
                                               in
                                            (FStar_Errors.Warning_SMTPatternMissingBoundVar,
                                              uu____81418)
                                             in
                                          FStar_Errors.log_issue
                                            p.FStar_Syntax_Syntax.pos
                                            uu____81412);
                                         (pats1,
                                           (FStar_List.append d decls1))))))
                     pats ([], decls)
                    in
                 (match uu____81267 with
                  | (pats1,decls1) -> ((pats1 :: pats_l1), decls1))) pats_l
        ([], [])

and (encode_formula :
  FStar_Syntax_Syntax.typ ->
    FStar_SMTEncoding_Env.env_t ->
      (FStar_SMTEncoding_Term.term * FStar_SMTEncoding_Term.decls_t))
  =
  fun phi  ->
    fun env  ->
      let debug1 phi1 =
        let uu____81482 =
          FStar_All.pipe_left
            (FStar_TypeChecker_Env.debug env.FStar_SMTEncoding_Env.tcenv)
            (FStar_Options.Other "SMTEncoding")
           in
        if uu____81482
        then
          let uu____81487 = FStar_Syntax_Print.tag_of_term phi1  in
          let uu____81489 = FStar_Syntax_Print.term_to_string phi1  in
          FStar_Util.print2 "Formula (%s)  %s\n" uu____81487 uu____81489
        else ()  in
      let enc f r l =
        let uu____81531 =
          FStar_Util.fold_map
            (fun decls  ->
               fun x  ->
                 let uu____81563 =
                   encode_term (FStar_Pervasives_Native.fst x) env  in
                 match uu____81563 with
                 | (t,decls') -> ((FStar_List.append decls decls'), t)) [] l
           in
        match uu____81531 with
        | (decls,args) ->
            let uu____81594 =
              let uu___2029_81595 = f args  in
              {
                FStar_SMTEncoding_Term.tm =
                  (uu___2029_81595.FStar_SMTEncoding_Term.tm);
                FStar_SMTEncoding_Term.freevars =
                  (uu___2029_81595.FStar_SMTEncoding_Term.freevars);
                FStar_SMTEncoding_Term.rng = r
              }  in
            (uu____81594, decls)
         in
      let const_op f r uu____81630 =
        let uu____81643 = f r  in (uu____81643, [])  in
      let un_op f l =
        let uu____81666 = FStar_List.hd l  in
        FStar_All.pipe_left f uu____81666  in
      let bin_op f uu___632_81686 =
        match uu___632_81686 with
        | t1::t2::[] -> f (t1, t2)
        | uu____81697 -> failwith "Impossible"  in
      let enc_prop_c f r l =
        let uu____81738 =
          FStar_Util.fold_map
            (fun decls  ->
               fun uu____81763  ->
                 match uu____81763 with
                 | (t,uu____81779) ->
                     let uu____81784 = encode_formula t env  in
                     (match uu____81784 with
                      | (phi1,decls') ->
                          ((FStar_List.append decls decls'), phi1))) [] l
           in
        match uu____81738 with
        | (decls,phis) ->
            let uu____81813 =
              let uu___2059_81814 = f phis  in
              {
                FStar_SMTEncoding_Term.tm =
                  (uu___2059_81814.FStar_SMTEncoding_Term.tm);
                FStar_SMTEncoding_Term.freevars =
                  (uu___2059_81814.FStar_SMTEncoding_Term.freevars);
                FStar_SMTEncoding_Term.rng = r
              }  in
            (uu____81813, decls)
         in
      let eq_op r args =
        let rf =
          FStar_List.filter
            (fun uu____81877  ->
               match uu____81877 with
               | (a,q) ->
                   (match q with
                    | FStar_Pervasives_Native.Some
                        (FStar_Syntax_Syntax.Implicit uu____81898) -> false
                    | uu____81901 -> true)) args
           in
        if (FStar_List.length rf) <> (Prims.parse_int "2")
        then
          let uu____81920 =
            FStar_Util.format1
              "eq_op: got %s non-implicit arguments instead of 2?"
              (Prims.string_of_int (FStar_List.length rf))
             in
          failwith uu____81920
        else
          (let uu____81937 = enc (bin_op FStar_SMTEncoding_Util.mkEq)  in
           uu____81937 r rf)
         in
      let eq3_op r args =
        let n1 = FStar_List.length args  in
        if n1 = (Prims.parse_int "4")
        then
          let uu____82009 =
            enc
              (fun terms  ->
                 match terms with
                 | t0::t1::v0::v1::[] ->
                     let uu____82041 =
                       let uu____82046 = FStar_SMTEncoding_Util.mkEq (t0, t1)
                          in
                       let uu____82047 = FStar_SMTEncoding_Util.mkEq (v0, v1)
                          in
                       (uu____82046, uu____82047)  in
                     FStar_SMTEncoding_Util.mkAnd uu____82041
                 | uu____82048 -> failwith "Impossible")
             in
          uu____82009 r args
        else
          (let uu____82054 =
             FStar_Util.format1
               "eq3_op: got %s non-implicit arguments instead of 4?"
               (Prims.string_of_int n1)
              in
           failwith uu____82054)
         in
      let h_equals_op r args =
        let n1 = FStar_List.length args  in
        if n1 = (Prims.parse_int "4")
        then
          let uu____82126 =
            enc
              (fun terms  ->
                 match terms with
                 | t0::v0::t1::v1::[] ->
                     let uu____82158 =
                       let uu____82163 = FStar_SMTEncoding_Util.mkEq (t0, t1)
                          in
                       let uu____82164 = FStar_SMTEncoding_Util.mkEq (v0, v1)
                          in
                       (uu____82163, uu____82164)  in
                     FStar_SMTEncoding_Util.mkAnd uu____82158
                 | uu____82165 -> failwith "Impossible")
             in
          uu____82126 r args
        else
          (let uu____82171 =
             FStar_Util.format1
               "eq3_op: got %s non-implicit arguments instead of 4?"
               (Prims.string_of_int n1)
              in
           failwith uu____82171)
         in
      let mk_imp1 r uu___633_82206 =
        match uu___633_82206 with
        | (lhs,uu____82212)::(rhs,uu____82214)::[] ->
            let uu____82255 = encode_formula rhs env  in
            (match uu____82255 with
             | (l1,decls1) ->
                 (match l1.FStar_SMTEncoding_Term.tm with
                  | FStar_SMTEncoding_Term.App
                      (FStar_SMTEncoding_Term.TrueOp ,uu____82270) ->
                      (l1, decls1)
                  | uu____82275 ->
                      let uu____82276 = encode_formula lhs env  in
                      (match uu____82276 with
                       | (l2,decls2) ->
                           let uu____82287 =
                             FStar_SMTEncoding_Term.mkImp (l2, l1) r  in
                           (uu____82287, (FStar_List.append decls1 decls2)))))
        | uu____82288 -> failwith "impossible"  in
      let mk_ite r uu___634_82316 =
        match uu___634_82316 with
        | (guard,uu____82322)::(_then,uu____82324)::(_else,uu____82326)::[]
            ->
            let uu____82383 = encode_formula guard env  in
            (match uu____82383 with
             | (g,decls1) ->
                 let uu____82394 = encode_formula _then env  in
                 (match uu____82394 with
                  | (t,decls2) ->
                      let uu____82405 = encode_formula _else env  in
                      (match uu____82405 with
                       | (e,decls3) ->
                           let res = FStar_SMTEncoding_Term.mkITE (g, t, e) r
                              in
                           (res,
                             (FStar_List.append decls1
                                (FStar_List.append decls2 decls3))))))
        | uu____82417 -> failwith "impossible"  in
      let unboxInt_l f l =
        let uu____82447 = FStar_List.map FStar_SMTEncoding_Term.unboxInt l
           in
        f uu____82447  in
      let connectives =
        let uu____82477 =
          let uu____82502 = enc_prop_c (bin_op FStar_SMTEncoding_Util.mkAnd)
             in
          (FStar_Parser_Const.and_lid, uu____82502)  in
        let uu____82545 =
          let uu____82572 =
            let uu____82597 = enc_prop_c (bin_op FStar_SMTEncoding_Util.mkOr)
               in
            (FStar_Parser_Const.or_lid, uu____82597)  in
          let uu____82640 =
            let uu____82667 =
              let uu____82694 =
                let uu____82719 =
                  enc_prop_c (bin_op FStar_SMTEncoding_Util.mkIff)  in
                (FStar_Parser_Const.iff_lid, uu____82719)  in
              let uu____82762 =
                let uu____82789 =
                  let uu____82816 =
                    let uu____82841 =
                      enc_prop_c (un_op FStar_SMTEncoding_Util.mkNot)  in
                    (FStar_Parser_Const.not_lid, uu____82841)  in
                  [uu____82816;
                  (FStar_Parser_Const.eq2_lid, eq_op);
                  (FStar_Parser_Const.c_eq2_lid, eq_op);
                  (FStar_Parser_Const.eq3_lid, eq3_op);
                  (FStar_Parser_Const.c_eq3_lid, h_equals_op);
                  (FStar_Parser_Const.true_lid,
                    (const_op FStar_SMTEncoding_Term.mkTrue));
                  (FStar_Parser_Const.false_lid,
                    (const_op FStar_SMTEncoding_Term.mkFalse))]
                   in
                (FStar_Parser_Const.ite_lid, mk_ite) :: uu____82789  in
              uu____82694 :: uu____82762  in
            (FStar_Parser_Const.imp_lid, mk_imp1) :: uu____82667  in
          uu____82572 :: uu____82640  in
        uu____82477 :: uu____82545  in
      let rec fallback phi1 =
        match phi1.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Tm_meta
            (phi',FStar_Syntax_Syntax.Meta_labeled (msg,r,b)) ->
            let uu____83386 = encode_formula phi' env  in
            (match uu____83386 with
             | (phi2,decls) ->
                 let uu____83397 =
                   FStar_SMTEncoding_Term.mk
                     (FStar_SMTEncoding_Term.Labeled (phi2, msg, r)) r
                    in
                 (uu____83397, decls))
        | FStar_Syntax_Syntax.Tm_meta uu____83399 ->
            let uu____83406 = FStar_Syntax_Util.unmeta phi1  in
            encode_formula uu____83406 env
        | FStar_Syntax_Syntax.Tm_match (e,pats) ->
            let uu____83445 =
              encode_match e pats FStar_SMTEncoding_Util.mkFalse env
                encode_formula
               in
            (match uu____83445 with | (t,decls) -> (t, decls))
        | FStar_Syntax_Syntax.Tm_let
            ((false
              ,{ FStar_Syntax_Syntax.lbname = FStar_Util.Inl x;
                 FStar_Syntax_Syntax.lbunivs = uu____83457;
                 FStar_Syntax_Syntax.lbtyp = t1;
                 FStar_Syntax_Syntax.lbeff = uu____83459;
                 FStar_Syntax_Syntax.lbdef = e1;
                 FStar_Syntax_Syntax.lbattrs = uu____83461;
                 FStar_Syntax_Syntax.lbpos = uu____83462;_}::[]),e2)
            ->
            let uu____83489 = encode_let x t1 e1 e2 env encode_formula  in
            (match uu____83489 with | (t,decls) -> (t, decls))
        | FStar_Syntax_Syntax.Tm_app (head1,args) ->
            let head2 = FStar_Syntax_Util.un_uinst head1  in
            (match ((head2.FStar_Syntax_Syntax.n), args) with
             | (FStar_Syntax_Syntax.Tm_fvar
                fv,uu____83542::(x,uu____83544)::(t,uu____83546)::[]) when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.has_type_lid
                 ->
                 let uu____83613 = encode_term x env  in
                 (match uu____83613 with
                  | (x1,decls) ->
                      let uu____83624 = encode_term t env  in
                      (match uu____83624 with
                       | (t1,decls') ->
                           let uu____83635 =
                             FStar_SMTEncoding_Term.mk_HasType x1 t1  in
                           (uu____83635, (FStar_List.append decls decls'))))
             | (FStar_Syntax_Syntax.Tm_fvar
                fv,(r,uu____83638)::(msg,uu____83640)::(phi2,uu____83642)::[])
                 when
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.labeled_lid
                 ->
                 let uu____83709 =
                   let uu____83714 =
                     let uu____83715 = FStar_Syntax_Subst.compress r  in
                     uu____83715.FStar_Syntax_Syntax.n  in
                   let uu____83718 =
                     let uu____83719 = FStar_Syntax_Subst.compress msg  in
                     uu____83719.FStar_Syntax_Syntax.n  in
                   (uu____83714, uu____83718)  in
                 (match uu____83709 with
                  | (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_range
                     r1),FStar_Syntax_Syntax.Tm_constant
                     (FStar_Const.Const_string (s,uu____83728))) ->
                      let phi3 =
                        FStar_Syntax_Syntax.mk
                          (FStar_Syntax_Syntax.Tm_meta
                             (phi2,
                               (FStar_Syntax_Syntax.Meta_labeled
                                  (s, r1, false))))
                          FStar_Pervasives_Native.None r1
                         in
                      fallback phi3
                  | uu____83739 -> fallback phi2)
             | (FStar_Syntax_Syntax.Tm_fvar fv,(t,uu____83746)::[]) when
                 (FStar_Syntax_Syntax.fv_eq_lid fv
                    FStar_Parser_Const.squash_lid)
                   ||
                   (FStar_Syntax_Syntax.fv_eq_lid fv
                      FStar_Parser_Const.auto_squash_lid)
                 -> encode_formula t env
             | uu____83781 when head_redex env head2 ->
                 let uu____83796 = whnf env phi1  in
                 encode_formula uu____83796 env
             | uu____83797 ->
                 let uu____83812 = encode_term phi1 env  in
                 (match uu____83812 with
                  | (tt,decls) ->
                      let tt1 =
                        let uu____83824 =
                          let uu____83826 =
                            FStar_Range.use_range
                              tt.FStar_SMTEncoding_Term.rng
                             in
                          let uu____83827 =
                            FStar_Range.use_range
                              phi1.FStar_Syntax_Syntax.pos
                             in
                          FStar_Range.rng_included uu____83826 uu____83827
                           in
                        if uu____83824
                        then tt
                        else
                          (let uu___2246_83831 = tt  in
                           {
                             FStar_SMTEncoding_Term.tm =
                               (uu___2246_83831.FStar_SMTEncoding_Term.tm);
                             FStar_SMTEncoding_Term.freevars =
                               (uu___2246_83831.FStar_SMTEncoding_Term.freevars);
                             FStar_SMTEncoding_Term.rng =
                               (phi1.FStar_Syntax_Syntax.pos)
                           })
                         in
                      let uu____83832 = FStar_SMTEncoding_Term.mk_Valid tt1
                         in
                      (uu____83832, decls)))
        | uu____83833 ->
            let uu____83834 = encode_term phi1 env  in
            (match uu____83834 with
             | (tt,decls) ->
                 let tt1 =
                   let uu____83846 =
                     let uu____83848 =
                       FStar_Range.use_range tt.FStar_SMTEncoding_Term.rng
                        in
                     let uu____83849 =
                       FStar_Range.use_range phi1.FStar_Syntax_Syntax.pos  in
                     FStar_Range.rng_included uu____83848 uu____83849  in
                   if uu____83846
                   then tt
                   else
                     (let uu___2254_83853 = tt  in
                      {
                        FStar_SMTEncoding_Term.tm =
                          (uu___2254_83853.FStar_SMTEncoding_Term.tm);
                        FStar_SMTEncoding_Term.freevars =
                          (uu___2254_83853.FStar_SMTEncoding_Term.freevars);
                        FStar_SMTEncoding_Term.rng =
                          (phi1.FStar_Syntax_Syntax.pos)
                      })
                    in
                 let uu____83854 = FStar_SMTEncoding_Term.mk_Valid tt1  in
                 (uu____83854, decls))
         in
      let encode_q_body env1 bs ps body =
        let uu____83898 = encode_binders FStar_Pervasives_Native.None bs env1
           in
        match uu____83898 with
        | (vars,guards,env2,decls,uu____83937) ->
            let uu____83950 = encode_smt_patterns ps env2  in
            (match uu____83950 with
             | (pats,decls') ->
                 let uu____83987 = encode_formula body env2  in
                 (match uu____83987 with
                  | (body1,decls'') ->
                      let guards1 =
                        match pats with
                        | ({
                             FStar_SMTEncoding_Term.tm =
                               FStar_SMTEncoding_Term.App
                               (FStar_SMTEncoding_Term.Var gf,p::[]);
                             FStar_SMTEncoding_Term.freevars = uu____84019;
                             FStar_SMTEncoding_Term.rng = uu____84020;_}::[])::[]
                            when
                            let uu____84040 =
                              FStar_Ident.text_of_lid
                                FStar_Parser_Const.guard_free
                               in
                            uu____84040 = gf -> []
                        | uu____84043 -> guards  in
                      let uu____84048 =
                        FStar_SMTEncoding_Util.mk_and_l guards1  in
                      (vars, pats, uu____84048, body1,
                        (FStar_List.append decls
                           (FStar_List.append decls' decls'')))))
         in
      debug1 phi;
      (let phi1 = FStar_Syntax_Util.unascribe phi  in
       let uu____84059 = FStar_Syntax_Util.destruct_typ_as_formula phi1  in
       match uu____84059 with
       | FStar_Pervasives_Native.None  -> fallback phi1
       | FStar_Pervasives_Native.Some (FStar_Syntax_Util.BaseConn (op,arms))
           ->
           let uu____84068 =
             FStar_All.pipe_right connectives
               (FStar_List.tryFind
                  (fun uu____84174  ->
                     match uu____84174 with
                     | (l,uu____84199) -> FStar_Ident.lid_equals op l))
              in
           (match uu____84068 with
            | FStar_Pervasives_Native.None  -> fallback phi1
            | FStar_Pervasives_Native.Some (uu____84268,f) ->
                f phi1.FStar_Syntax_Syntax.pos arms)
       | FStar_Pervasives_Native.Some (FStar_Syntax_Util.QAll
           (vars,pats,body)) ->
           (FStar_All.pipe_right pats
              (FStar_List.iter (check_pattern_vars env vars));
            (let uu____84360 = encode_q_body env vars pats body  in
             match uu____84360 with
             | (vars1,pats1,guard,body1,decls) ->
                 let tm =
                   let uu____84405 =
                     let uu____84416 =
                       FStar_SMTEncoding_Util.mkImp (guard, body1)  in
                     (pats1, vars1, uu____84416)  in
                   FStar_SMTEncoding_Term.mkForall
                     phi1.FStar_Syntax_Syntax.pos uu____84405
                    in
                 (tm, decls)))
       | FStar_Pervasives_Native.Some (FStar_Syntax_Util.QEx
           (vars,pats,body)) ->
           (FStar_All.pipe_right pats
              (FStar_List.iter (check_pattern_vars env vars));
            (let uu____84447 = encode_q_body env vars pats body  in
             match uu____84447 with
             | (vars1,pats1,guard,body1,decls) ->
                 let uu____84491 =
                   let uu____84492 =
                     let uu____84503 =
                       FStar_SMTEncoding_Util.mkAnd (guard, body1)  in
                     (pats1, vars1, uu____84503)  in
                   FStar_SMTEncoding_Term.mkExists
                     phi1.FStar_Syntax_Syntax.pos uu____84492
                    in
                 (uu____84491, decls))))
