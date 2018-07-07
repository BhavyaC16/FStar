open Prims
type fsteps =
  {
  beta: Prims.bool ;
  iota: Prims.bool ;
  zeta: Prims.bool ;
  weak: Prims.bool ;
  hnf: Prims.bool ;
  primops: Prims.bool ;
  do_not_unfold_pure_lets: Prims.bool ;
  unfold_until:
    FStar_Syntax_Syntax.delta_depth FStar_Pervasives_Native.option ;
  unfold_only: FStar_Ident.lid Prims.list FStar_Pervasives_Native.option ;
  unfold_fully: FStar_Ident.lid Prims.list FStar_Pervasives_Native.option ;
  unfold_attr:
    FStar_Syntax_Syntax.attribute Prims.list FStar_Pervasives_Native.option ;
  unfold_tac: Prims.bool ;
  pure_subterms_within_computations: Prims.bool ;
  simplify: Prims.bool ;
  erase_universes: Prims.bool ;
  allow_unbound_universes: Prims.bool ;
  reify_: Prims.bool ;
  compress_uvars: Prims.bool ;
  no_full_norm: Prims.bool ;
  check_no_uvars: Prims.bool ;
  unmeta: Prims.bool ;
  unascribe: Prims.bool ;
  in_full_norm_request: Prims.bool ;
  weakly_reduce_scrutinee: Prims.bool ;
  nbe_step: Prims.bool }
let (__proj__Mkfsteps__item__beta : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__beta
  
let (__proj__Mkfsteps__item__iota : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__iota
  
let (__proj__Mkfsteps__item__zeta : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__zeta
  
let (__proj__Mkfsteps__item__weak : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__weak
  
let (__proj__Mkfsteps__item__hnf : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__hnf
  
let (__proj__Mkfsteps__item__primops : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__primops
  
let (__proj__Mkfsteps__item__do_not_unfold_pure_lets : fsteps -> Prims.bool)
  =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__do_not_unfold_pure_lets
  
let (__proj__Mkfsteps__item__unfold_until :
  fsteps -> FStar_Syntax_Syntax.delta_depth FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__unfold_until
  
let (__proj__Mkfsteps__item__unfold_only :
  fsteps -> FStar_Ident.lid Prims.list FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__unfold_only
  
let (__proj__Mkfsteps__item__unfold_fully :
  fsteps -> FStar_Ident.lid Prims.list FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__unfold_fully
  
let (__proj__Mkfsteps__item__unfold_attr :
  fsteps ->
    FStar_Syntax_Syntax.attribute Prims.list FStar_Pervasives_Native.option)
  =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__unfold_attr
  
let (__proj__Mkfsteps__item__unfold_tac : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__unfold_tac
  
let (__proj__Mkfsteps__item__pure_subterms_within_computations :
  fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} ->
        __fname__pure_subterms_within_computations
  
let (__proj__Mkfsteps__item__simplify : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__simplify
  
let (__proj__Mkfsteps__item__erase_universes : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__erase_universes
  
let (__proj__Mkfsteps__item__allow_unbound_universes : fsteps -> Prims.bool)
  =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__allow_unbound_universes
  
let (__proj__Mkfsteps__item__reify_ : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__reify_
  
let (__proj__Mkfsteps__item__compress_uvars : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__compress_uvars
  
let (__proj__Mkfsteps__item__no_full_norm : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__no_full_norm
  
let (__proj__Mkfsteps__item__check_no_uvars : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__check_no_uvars
  
let (__proj__Mkfsteps__item__unmeta : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__unmeta
  
let (__proj__Mkfsteps__item__unascribe : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__unascribe
  
let (__proj__Mkfsteps__item__in_full_norm_request : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__in_full_norm_request
  
let (__proj__Mkfsteps__item__weakly_reduce_scrutinee : fsteps -> Prims.bool)
  =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__weakly_reduce_scrutinee
  
let (__proj__Mkfsteps__item__nbe_step : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;
        nbe_step = __fname__nbe_step;_} -> __fname__nbe_step
  
let (steps_to_string : fsteps -> Prims.string) =
  fun f  ->
    let format_opt f1 o =
      match o with
      | FStar_Pervasives_Native.None  -> "None"
      | FStar_Pervasives_Native.Some x ->
          let uu____1301 =
            let uu____1302 = f1 x  in Prims.strcat uu____1302 ")"  in
          Prims.strcat "Some (" uu____1301
       in
    let b = FStar_Util.string_of_bool  in
    let uu____1308 =
      let uu____1311 = FStar_All.pipe_right f.beta b  in
      let uu____1312 =
        let uu____1315 = FStar_All.pipe_right f.iota b  in
        let uu____1316 =
          let uu____1319 = FStar_All.pipe_right f.zeta b  in
          let uu____1320 =
            let uu____1323 = FStar_All.pipe_right f.weak b  in
            let uu____1324 =
              let uu____1327 = FStar_All.pipe_right f.hnf b  in
              let uu____1328 =
                let uu____1331 = FStar_All.pipe_right f.primops b  in
                let uu____1332 =
                  let uu____1335 =
                    FStar_All.pipe_right f.do_not_unfold_pure_lets b  in
                  let uu____1336 =
                    let uu____1339 =
                      FStar_All.pipe_right f.unfold_until
                        (format_opt FStar_Syntax_Print.delta_depth_to_string)
                       in
                    let uu____1342 =
                      let uu____1345 =
                        FStar_All.pipe_right f.unfold_only
                          (format_opt
                             (fun x  ->
                                let uu____1357 =
                                  FStar_List.map FStar_Ident.string_of_lid x
                                   in
                                FStar_All.pipe_right uu____1357
                                  (FStar_String.concat ", ")))
                         in
                      let uu____1362 =
                        let uu____1365 =
                          FStar_All.pipe_right f.unfold_fully
                            (format_opt
                               (fun x  ->
                                  let uu____1377 =
                                    FStar_List.map FStar_Ident.string_of_lid
                                      x
                                     in
                                  FStar_All.pipe_right uu____1377
                                    (FStar_String.concat ", ")))
                           in
                        let uu____1382 =
                          let uu____1385 =
                            FStar_All.pipe_right f.unfold_attr
                              (format_opt
                                 (fun xs  ->
                                    let uu____1397 =
                                      FStar_List.map
                                        FStar_Syntax_Print.term_to_string xs
                                       in
                                    FStar_All.pipe_right uu____1397
                                      (FStar_String.concat ", ")))
                             in
                          let uu____1402 =
                            let uu____1405 =
                              FStar_All.pipe_right f.unfold_tac b  in
                            let uu____1406 =
                              let uu____1409 =
                                FStar_All.pipe_right
                                  f.pure_subterms_within_computations b
                                 in
                              let uu____1410 =
                                let uu____1413 =
                                  FStar_All.pipe_right f.simplify b  in
                                let uu____1414 =
                                  let uu____1417 =
                                    FStar_All.pipe_right f.erase_universes b
                                     in
                                  let uu____1418 =
                                    let uu____1421 =
                                      FStar_All.pipe_right
                                        f.allow_unbound_universes b
                                       in
                                    let uu____1422 =
                                      let uu____1425 =
                                        FStar_All.pipe_right f.reify_ b  in
                                      let uu____1426 =
                                        let uu____1429 =
                                          FStar_All.pipe_right
                                            f.compress_uvars b
                                           in
                                        let uu____1430 =
                                          let uu____1433 =
                                            FStar_All.pipe_right
                                              f.no_full_norm b
                                             in
                                          let uu____1434 =
                                            let uu____1437 =
                                              FStar_All.pipe_right
                                                f.check_no_uvars b
                                               in
                                            let uu____1438 =
                                              let uu____1441 =
                                                FStar_All.pipe_right 
                                                  f.unmeta b
                                                 in
                                              let uu____1442 =
                                                let uu____1445 =
                                                  FStar_All.pipe_right
                                                    f.unascribe b
                                                   in
                                                let uu____1446 =
                                                  let uu____1449 =
                                                    FStar_All.pipe_right
                                                      f.in_full_norm_request
                                                      b
                                                     in
                                                  let uu____1450 =
                                                    let uu____1453 =
                                                      FStar_All.pipe_right
                                                        f.weakly_reduce_scrutinee
                                                        b
                                                       in
                                                    [uu____1453]  in
                                                  uu____1449 :: uu____1450
                                                   in
                                                uu____1445 :: uu____1446  in
                                              uu____1441 :: uu____1442  in
                                            uu____1437 :: uu____1438  in
                                          uu____1433 :: uu____1434  in
                                        uu____1429 :: uu____1430  in
                                      uu____1425 :: uu____1426  in
                                    uu____1421 :: uu____1422  in
                                  uu____1417 :: uu____1418  in
                                uu____1413 :: uu____1414  in
                              uu____1409 :: uu____1410  in
                            uu____1405 :: uu____1406  in
                          uu____1385 :: uu____1402  in
                        uu____1365 :: uu____1382  in
                      uu____1345 :: uu____1362  in
                    uu____1339 :: uu____1342  in
                  uu____1335 :: uu____1336  in
                uu____1331 :: uu____1332  in
              uu____1327 :: uu____1328  in
            uu____1323 :: uu____1324  in
          uu____1319 :: uu____1320  in
        uu____1315 :: uu____1316  in
      uu____1311 :: uu____1312  in
    FStar_Util.format
      "{\nbeta = %s;\niota = %s;\nzeta = %s;\nweak = %s;\nhnf  = %s;\nprimops = %s;\ndo_not_unfold_pure_lets = %s;\nunfold_until = %s;\nunfold_only = %s;\nunfold_fully = %s;\nunfold_attr = %s;\nunfold_tac = %s;\npure_subterms_within_computations = %s;\nsimplify = %s;\nerase_universes = %s;\nallow_unbound_universes = %s;\nreify_ = %s;\ncompress_uvars = %s;\nno_full_norm = %s;\ncheck_no_uvars = %s;\nunmeta = %s;\nunascribe = %s;\nin_full_norm_request = %s;\nweakly_reduce_scrutinee = %s;\n}"
      uu____1308
  
let (default_steps : fsteps) =
  {
    beta = true;
    iota = true;
    zeta = true;
    weak = false;
    hnf = false;
    primops = false;
    do_not_unfold_pure_lets = false;
    unfold_until = FStar_Pervasives_Native.None;
    unfold_only = FStar_Pervasives_Native.None;
    unfold_fully = FStar_Pervasives_Native.None;
    unfold_attr = FStar_Pervasives_Native.None;
    unfold_tac = false;
    pure_subterms_within_computations = false;
    simplify = false;
    erase_universes = false;
    allow_unbound_universes = false;
    reify_ = false;
    compress_uvars = false;
    no_full_norm = false;
    check_no_uvars = false;
    unmeta = false;
    unascribe = false;
    in_full_norm_request = false;
    weakly_reduce_scrutinee = true;
    nbe_step = false
  } 
let (fstep_add_one : FStar_TypeChecker_Env.step -> fsteps -> fsteps) =
  fun s  ->
    fun fs  ->
      let add_opt x uu___229_1488 =
        match uu___229_1488 with
        | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.Some [x]
        | FStar_Pervasives_Native.Some xs ->
            FStar_Pervasives_Native.Some (x :: xs)
         in
      match s with
      | FStar_TypeChecker_Env.Beta  ->
          let uu___231_1508 = fs  in
          {
            beta = true;
            iota = (uu___231_1508.iota);
            zeta = (uu___231_1508.zeta);
            weak = (uu___231_1508.weak);
            hnf = (uu___231_1508.hnf);
            primops = (uu___231_1508.primops);
            do_not_unfold_pure_lets = (uu___231_1508.do_not_unfold_pure_lets);
            unfold_until = (uu___231_1508.unfold_until);
            unfold_only = (uu___231_1508.unfold_only);
            unfold_fully = (uu___231_1508.unfold_fully);
            unfold_attr = (uu___231_1508.unfold_attr);
            unfold_tac = (uu___231_1508.unfold_tac);
            pure_subterms_within_computations =
              (uu___231_1508.pure_subterms_within_computations);
            simplify = (uu___231_1508.simplify);
            erase_universes = (uu___231_1508.erase_universes);
            allow_unbound_universes = (uu___231_1508.allow_unbound_universes);
            reify_ = (uu___231_1508.reify_);
            compress_uvars = (uu___231_1508.compress_uvars);
            no_full_norm = (uu___231_1508.no_full_norm);
            check_no_uvars = (uu___231_1508.check_no_uvars);
            unmeta = (uu___231_1508.unmeta);
            unascribe = (uu___231_1508.unascribe);
            in_full_norm_request = (uu___231_1508.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___231_1508.weakly_reduce_scrutinee);
            nbe_step = (uu___231_1508.nbe_step)
          }
      | FStar_TypeChecker_Env.Iota  ->
          let uu___232_1509 = fs  in
          {
            beta = (uu___232_1509.beta);
            iota = true;
            zeta = (uu___232_1509.zeta);
            weak = (uu___232_1509.weak);
            hnf = (uu___232_1509.hnf);
            primops = (uu___232_1509.primops);
            do_not_unfold_pure_lets = (uu___232_1509.do_not_unfold_pure_lets);
            unfold_until = (uu___232_1509.unfold_until);
            unfold_only = (uu___232_1509.unfold_only);
            unfold_fully = (uu___232_1509.unfold_fully);
            unfold_attr = (uu___232_1509.unfold_attr);
            unfold_tac = (uu___232_1509.unfold_tac);
            pure_subterms_within_computations =
              (uu___232_1509.pure_subterms_within_computations);
            simplify = (uu___232_1509.simplify);
            erase_universes = (uu___232_1509.erase_universes);
            allow_unbound_universes = (uu___232_1509.allow_unbound_universes);
            reify_ = (uu___232_1509.reify_);
            compress_uvars = (uu___232_1509.compress_uvars);
            no_full_norm = (uu___232_1509.no_full_norm);
            check_no_uvars = (uu___232_1509.check_no_uvars);
            unmeta = (uu___232_1509.unmeta);
            unascribe = (uu___232_1509.unascribe);
            in_full_norm_request = (uu___232_1509.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___232_1509.weakly_reduce_scrutinee);
            nbe_step = (uu___232_1509.nbe_step)
          }
      | FStar_TypeChecker_Env.Zeta  ->
          let uu___233_1510 = fs  in
          {
            beta = (uu___233_1510.beta);
            iota = (uu___233_1510.iota);
            zeta = true;
            weak = (uu___233_1510.weak);
            hnf = (uu___233_1510.hnf);
            primops = (uu___233_1510.primops);
            do_not_unfold_pure_lets = (uu___233_1510.do_not_unfold_pure_lets);
            unfold_until = (uu___233_1510.unfold_until);
            unfold_only = (uu___233_1510.unfold_only);
            unfold_fully = (uu___233_1510.unfold_fully);
            unfold_attr = (uu___233_1510.unfold_attr);
            unfold_tac = (uu___233_1510.unfold_tac);
            pure_subterms_within_computations =
              (uu___233_1510.pure_subterms_within_computations);
            simplify = (uu___233_1510.simplify);
            erase_universes = (uu___233_1510.erase_universes);
            allow_unbound_universes = (uu___233_1510.allow_unbound_universes);
            reify_ = (uu___233_1510.reify_);
            compress_uvars = (uu___233_1510.compress_uvars);
            no_full_norm = (uu___233_1510.no_full_norm);
            check_no_uvars = (uu___233_1510.check_no_uvars);
            unmeta = (uu___233_1510.unmeta);
            unascribe = (uu___233_1510.unascribe);
            in_full_norm_request = (uu___233_1510.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___233_1510.weakly_reduce_scrutinee);
            nbe_step = (uu___233_1510.nbe_step)
          }
      | FStar_TypeChecker_Env.Exclude (FStar_TypeChecker_Env.Beta ) ->
          let uu___234_1511 = fs  in
          {
            beta = false;
            iota = (uu___234_1511.iota);
            zeta = (uu___234_1511.zeta);
            weak = (uu___234_1511.weak);
            hnf = (uu___234_1511.hnf);
            primops = (uu___234_1511.primops);
            do_not_unfold_pure_lets = (uu___234_1511.do_not_unfold_pure_lets);
            unfold_until = (uu___234_1511.unfold_until);
            unfold_only = (uu___234_1511.unfold_only);
            unfold_fully = (uu___234_1511.unfold_fully);
            unfold_attr = (uu___234_1511.unfold_attr);
            unfold_tac = (uu___234_1511.unfold_tac);
            pure_subterms_within_computations =
              (uu___234_1511.pure_subterms_within_computations);
            simplify = (uu___234_1511.simplify);
            erase_universes = (uu___234_1511.erase_universes);
            allow_unbound_universes = (uu___234_1511.allow_unbound_universes);
            reify_ = (uu___234_1511.reify_);
            compress_uvars = (uu___234_1511.compress_uvars);
            no_full_norm = (uu___234_1511.no_full_norm);
            check_no_uvars = (uu___234_1511.check_no_uvars);
            unmeta = (uu___234_1511.unmeta);
            unascribe = (uu___234_1511.unascribe);
            in_full_norm_request = (uu___234_1511.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___234_1511.weakly_reduce_scrutinee);
            nbe_step = (uu___234_1511.nbe_step)
          }
      | FStar_TypeChecker_Env.Exclude (FStar_TypeChecker_Env.Iota ) ->
          let uu___235_1512 = fs  in
          {
            beta = (uu___235_1512.beta);
            iota = false;
            zeta = (uu___235_1512.zeta);
            weak = (uu___235_1512.weak);
            hnf = (uu___235_1512.hnf);
            primops = (uu___235_1512.primops);
            do_not_unfold_pure_lets = (uu___235_1512.do_not_unfold_pure_lets);
            unfold_until = (uu___235_1512.unfold_until);
            unfold_only = (uu___235_1512.unfold_only);
            unfold_fully = (uu___235_1512.unfold_fully);
            unfold_attr = (uu___235_1512.unfold_attr);
            unfold_tac = (uu___235_1512.unfold_tac);
            pure_subterms_within_computations =
              (uu___235_1512.pure_subterms_within_computations);
            simplify = (uu___235_1512.simplify);
            erase_universes = (uu___235_1512.erase_universes);
            allow_unbound_universes = (uu___235_1512.allow_unbound_universes);
            reify_ = (uu___235_1512.reify_);
            compress_uvars = (uu___235_1512.compress_uvars);
            no_full_norm = (uu___235_1512.no_full_norm);
            check_no_uvars = (uu___235_1512.check_no_uvars);
            unmeta = (uu___235_1512.unmeta);
            unascribe = (uu___235_1512.unascribe);
            in_full_norm_request = (uu___235_1512.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___235_1512.weakly_reduce_scrutinee);
            nbe_step = (uu___235_1512.nbe_step)
          }
      | FStar_TypeChecker_Env.Exclude (FStar_TypeChecker_Env.Zeta ) ->
          let uu___236_1513 = fs  in
          {
            beta = (uu___236_1513.beta);
            iota = (uu___236_1513.iota);
            zeta = false;
            weak = (uu___236_1513.weak);
            hnf = (uu___236_1513.hnf);
            primops = (uu___236_1513.primops);
            do_not_unfold_pure_lets = (uu___236_1513.do_not_unfold_pure_lets);
            unfold_until = (uu___236_1513.unfold_until);
            unfold_only = (uu___236_1513.unfold_only);
            unfold_fully = (uu___236_1513.unfold_fully);
            unfold_attr = (uu___236_1513.unfold_attr);
            unfold_tac = (uu___236_1513.unfold_tac);
            pure_subterms_within_computations =
              (uu___236_1513.pure_subterms_within_computations);
            simplify = (uu___236_1513.simplify);
            erase_universes = (uu___236_1513.erase_universes);
            allow_unbound_universes = (uu___236_1513.allow_unbound_universes);
            reify_ = (uu___236_1513.reify_);
            compress_uvars = (uu___236_1513.compress_uvars);
            no_full_norm = (uu___236_1513.no_full_norm);
            check_no_uvars = (uu___236_1513.check_no_uvars);
            unmeta = (uu___236_1513.unmeta);
            unascribe = (uu___236_1513.unascribe);
            in_full_norm_request = (uu___236_1513.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___236_1513.weakly_reduce_scrutinee);
            nbe_step = (uu___236_1513.nbe_step)
          }
      | FStar_TypeChecker_Env.Exclude uu____1514 -> failwith "Bad exclude"
      | FStar_TypeChecker_Env.Weak  ->
          let uu___237_1515 = fs  in
          {
            beta = (uu___237_1515.beta);
            iota = (uu___237_1515.iota);
            zeta = (uu___237_1515.zeta);
            weak = true;
            hnf = (uu___237_1515.hnf);
            primops = (uu___237_1515.primops);
            do_not_unfold_pure_lets = (uu___237_1515.do_not_unfold_pure_lets);
            unfold_until = (uu___237_1515.unfold_until);
            unfold_only = (uu___237_1515.unfold_only);
            unfold_fully = (uu___237_1515.unfold_fully);
            unfold_attr = (uu___237_1515.unfold_attr);
            unfold_tac = (uu___237_1515.unfold_tac);
            pure_subterms_within_computations =
              (uu___237_1515.pure_subterms_within_computations);
            simplify = (uu___237_1515.simplify);
            erase_universes = (uu___237_1515.erase_universes);
            allow_unbound_universes = (uu___237_1515.allow_unbound_universes);
            reify_ = (uu___237_1515.reify_);
            compress_uvars = (uu___237_1515.compress_uvars);
            no_full_norm = (uu___237_1515.no_full_norm);
            check_no_uvars = (uu___237_1515.check_no_uvars);
            unmeta = (uu___237_1515.unmeta);
            unascribe = (uu___237_1515.unascribe);
            in_full_norm_request = (uu___237_1515.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___237_1515.weakly_reduce_scrutinee);
            nbe_step = (uu___237_1515.nbe_step)
          }
      | FStar_TypeChecker_Env.HNF  ->
          let uu___238_1516 = fs  in
          {
            beta = (uu___238_1516.beta);
            iota = (uu___238_1516.iota);
            zeta = (uu___238_1516.zeta);
            weak = (uu___238_1516.weak);
            hnf = true;
            primops = (uu___238_1516.primops);
            do_not_unfold_pure_lets = (uu___238_1516.do_not_unfold_pure_lets);
            unfold_until = (uu___238_1516.unfold_until);
            unfold_only = (uu___238_1516.unfold_only);
            unfold_fully = (uu___238_1516.unfold_fully);
            unfold_attr = (uu___238_1516.unfold_attr);
            unfold_tac = (uu___238_1516.unfold_tac);
            pure_subterms_within_computations =
              (uu___238_1516.pure_subterms_within_computations);
            simplify = (uu___238_1516.simplify);
            erase_universes = (uu___238_1516.erase_universes);
            allow_unbound_universes = (uu___238_1516.allow_unbound_universes);
            reify_ = (uu___238_1516.reify_);
            compress_uvars = (uu___238_1516.compress_uvars);
            no_full_norm = (uu___238_1516.no_full_norm);
            check_no_uvars = (uu___238_1516.check_no_uvars);
            unmeta = (uu___238_1516.unmeta);
            unascribe = (uu___238_1516.unascribe);
            in_full_norm_request = (uu___238_1516.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___238_1516.weakly_reduce_scrutinee);
            nbe_step = (uu___238_1516.nbe_step)
          }
      | FStar_TypeChecker_Env.Primops  ->
          let uu___239_1517 = fs  in
          {
            beta = (uu___239_1517.beta);
            iota = (uu___239_1517.iota);
            zeta = (uu___239_1517.zeta);
            weak = (uu___239_1517.weak);
            hnf = (uu___239_1517.hnf);
            primops = true;
            do_not_unfold_pure_lets = (uu___239_1517.do_not_unfold_pure_lets);
            unfold_until = (uu___239_1517.unfold_until);
            unfold_only = (uu___239_1517.unfold_only);
            unfold_fully = (uu___239_1517.unfold_fully);
            unfold_attr = (uu___239_1517.unfold_attr);
            unfold_tac = (uu___239_1517.unfold_tac);
            pure_subterms_within_computations =
              (uu___239_1517.pure_subterms_within_computations);
            simplify = (uu___239_1517.simplify);
            erase_universes = (uu___239_1517.erase_universes);
            allow_unbound_universes = (uu___239_1517.allow_unbound_universes);
            reify_ = (uu___239_1517.reify_);
            compress_uvars = (uu___239_1517.compress_uvars);
            no_full_norm = (uu___239_1517.no_full_norm);
            check_no_uvars = (uu___239_1517.check_no_uvars);
            unmeta = (uu___239_1517.unmeta);
            unascribe = (uu___239_1517.unascribe);
            in_full_norm_request = (uu___239_1517.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___239_1517.weakly_reduce_scrutinee);
            nbe_step = (uu___239_1517.nbe_step)
          }
      | FStar_TypeChecker_Env.Eager_unfolding  -> fs
      | FStar_TypeChecker_Env.Inlining  -> fs
      | FStar_TypeChecker_Env.DoNotUnfoldPureLets  ->
          let uu___240_1518 = fs  in
          {
            beta = (uu___240_1518.beta);
            iota = (uu___240_1518.iota);
            zeta = (uu___240_1518.zeta);
            weak = (uu___240_1518.weak);
            hnf = (uu___240_1518.hnf);
            primops = (uu___240_1518.primops);
            do_not_unfold_pure_lets = true;
            unfold_until = (uu___240_1518.unfold_until);
            unfold_only = (uu___240_1518.unfold_only);
            unfold_fully = (uu___240_1518.unfold_fully);
            unfold_attr = (uu___240_1518.unfold_attr);
            unfold_tac = (uu___240_1518.unfold_tac);
            pure_subterms_within_computations =
              (uu___240_1518.pure_subterms_within_computations);
            simplify = (uu___240_1518.simplify);
            erase_universes = (uu___240_1518.erase_universes);
            allow_unbound_universes = (uu___240_1518.allow_unbound_universes);
            reify_ = (uu___240_1518.reify_);
            compress_uvars = (uu___240_1518.compress_uvars);
            no_full_norm = (uu___240_1518.no_full_norm);
            check_no_uvars = (uu___240_1518.check_no_uvars);
            unmeta = (uu___240_1518.unmeta);
            unascribe = (uu___240_1518.unascribe);
            in_full_norm_request = (uu___240_1518.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___240_1518.weakly_reduce_scrutinee);
            nbe_step = (uu___240_1518.nbe_step)
          }
      | FStar_TypeChecker_Env.UnfoldUntil d ->
          let uu___241_1520 = fs  in
          {
            beta = (uu___241_1520.beta);
            iota = (uu___241_1520.iota);
            zeta = (uu___241_1520.zeta);
            weak = (uu___241_1520.weak);
            hnf = (uu___241_1520.hnf);
            primops = (uu___241_1520.primops);
            do_not_unfold_pure_lets = (uu___241_1520.do_not_unfold_pure_lets);
            unfold_until = (FStar_Pervasives_Native.Some d);
            unfold_only = (uu___241_1520.unfold_only);
            unfold_fully = (uu___241_1520.unfold_fully);
            unfold_attr = (uu___241_1520.unfold_attr);
            unfold_tac = (uu___241_1520.unfold_tac);
            pure_subterms_within_computations =
              (uu___241_1520.pure_subterms_within_computations);
            simplify = (uu___241_1520.simplify);
            erase_universes = (uu___241_1520.erase_universes);
            allow_unbound_universes = (uu___241_1520.allow_unbound_universes);
            reify_ = (uu___241_1520.reify_);
            compress_uvars = (uu___241_1520.compress_uvars);
            no_full_norm = (uu___241_1520.no_full_norm);
            check_no_uvars = (uu___241_1520.check_no_uvars);
            unmeta = (uu___241_1520.unmeta);
            unascribe = (uu___241_1520.unascribe);
            in_full_norm_request = (uu___241_1520.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___241_1520.weakly_reduce_scrutinee);
            nbe_step = (uu___241_1520.nbe_step)
          }
      | FStar_TypeChecker_Env.UnfoldOnly lids ->
          let uu___242_1524 = fs  in
          {
            beta = (uu___242_1524.beta);
            iota = (uu___242_1524.iota);
            zeta = (uu___242_1524.zeta);
            weak = (uu___242_1524.weak);
            hnf = (uu___242_1524.hnf);
            primops = (uu___242_1524.primops);
            do_not_unfold_pure_lets = (uu___242_1524.do_not_unfold_pure_lets);
            unfold_until = (uu___242_1524.unfold_until);
            unfold_only = (FStar_Pervasives_Native.Some lids);
            unfold_fully = (uu___242_1524.unfold_fully);
            unfold_attr = (uu___242_1524.unfold_attr);
            unfold_tac = (uu___242_1524.unfold_tac);
            pure_subterms_within_computations =
              (uu___242_1524.pure_subterms_within_computations);
            simplify = (uu___242_1524.simplify);
            erase_universes = (uu___242_1524.erase_universes);
            allow_unbound_universes = (uu___242_1524.allow_unbound_universes);
            reify_ = (uu___242_1524.reify_);
            compress_uvars = (uu___242_1524.compress_uvars);
            no_full_norm = (uu___242_1524.no_full_norm);
            check_no_uvars = (uu___242_1524.check_no_uvars);
            unmeta = (uu___242_1524.unmeta);
            unascribe = (uu___242_1524.unascribe);
            in_full_norm_request = (uu___242_1524.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___242_1524.weakly_reduce_scrutinee);
            nbe_step = (uu___242_1524.nbe_step)
          }
      | FStar_TypeChecker_Env.UnfoldFully lids ->
          let uu___243_1530 = fs  in
          {
            beta = (uu___243_1530.beta);
            iota = (uu___243_1530.iota);
            zeta = (uu___243_1530.zeta);
            weak = (uu___243_1530.weak);
            hnf = (uu___243_1530.hnf);
            primops = (uu___243_1530.primops);
            do_not_unfold_pure_lets = (uu___243_1530.do_not_unfold_pure_lets);
            unfold_until = (uu___243_1530.unfold_until);
            unfold_only = (uu___243_1530.unfold_only);
            unfold_fully = (FStar_Pervasives_Native.Some lids);
            unfold_attr = (uu___243_1530.unfold_attr);
            unfold_tac = (uu___243_1530.unfold_tac);
            pure_subterms_within_computations =
              (uu___243_1530.pure_subterms_within_computations);
            simplify = (uu___243_1530.simplify);
            erase_universes = (uu___243_1530.erase_universes);
            allow_unbound_universes = (uu___243_1530.allow_unbound_universes);
            reify_ = (uu___243_1530.reify_);
            compress_uvars = (uu___243_1530.compress_uvars);
            no_full_norm = (uu___243_1530.no_full_norm);
            check_no_uvars = (uu___243_1530.check_no_uvars);
            unmeta = (uu___243_1530.unmeta);
            unascribe = (uu___243_1530.unascribe);
            in_full_norm_request = (uu___243_1530.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___243_1530.weakly_reduce_scrutinee);
            nbe_step = (uu___243_1530.nbe_step)
          }
      | FStar_TypeChecker_Env.UnfoldAttr attr ->
          let uu___244_1534 = fs  in
          {
            beta = (uu___244_1534.beta);
            iota = (uu___244_1534.iota);
            zeta = (uu___244_1534.zeta);
            weak = (uu___244_1534.weak);
            hnf = (uu___244_1534.hnf);
            primops = (uu___244_1534.primops);
            do_not_unfold_pure_lets = (uu___244_1534.do_not_unfold_pure_lets);
            unfold_until = (uu___244_1534.unfold_until);
            unfold_only = (uu___244_1534.unfold_only);
            unfold_fully = (uu___244_1534.unfold_fully);
            unfold_attr = (add_opt attr fs.unfold_attr);
            unfold_tac = (uu___244_1534.unfold_tac);
            pure_subterms_within_computations =
              (uu___244_1534.pure_subterms_within_computations);
            simplify = (uu___244_1534.simplify);
            erase_universes = (uu___244_1534.erase_universes);
            allow_unbound_universes = (uu___244_1534.allow_unbound_universes);
            reify_ = (uu___244_1534.reify_);
            compress_uvars = (uu___244_1534.compress_uvars);
            no_full_norm = (uu___244_1534.no_full_norm);
            check_no_uvars = (uu___244_1534.check_no_uvars);
            unmeta = (uu___244_1534.unmeta);
            unascribe = (uu___244_1534.unascribe);
            in_full_norm_request = (uu___244_1534.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___244_1534.weakly_reduce_scrutinee);
            nbe_step = (uu___244_1534.nbe_step)
          }
      | FStar_TypeChecker_Env.UnfoldTac  ->
          let uu___245_1535 = fs  in
          {
            beta = (uu___245_1535.beta);
            iota = (uu___245_1535.iota);
            zeta = (uu___245_1535.zeta);
            weak = (uu___245_1535.weak);
            hnf = (uu___245_1535.hnf);
            primops = (uu___245_1535.primops);
            do_not_unfold_pure_lets = (uu___245_1535.do_not_unfold_pure_lets);
            unfold_until = (uu___245_1535.unfold_until);
            unfold_only = (uu___245_1535.unfold_only);
            unfold_fully = (uu___245_1535.unfold_fully);
            unfold_attr = (uu___245_1535.unfold_attr);
            unfold_tac = true;
            pure_subterms_within_computations =
              (uu___245_1535.pure_subterms_within_computations);
            simplify = (uu___245_1535.simplify);
            erase_universes = (uu___245_1535.erase_universes);
            allow_unbound_universes = (uu___245_1535.allow_unbound_universes);
            reify_ = (uu___245_1535.reify_);
            compress_uvars = (uu___245_1535.compress_uvars);
            no_full_norm = (uu___245_1535.no_full_norm);
            check_no_uvars = (uu___245_1535.check_no_uvars);
            unmeta = (uu___245_1535.unmeta);
            unascribe = (uu___245_1535.unascribe);
            in_full_norm_request = (uu___245_1535.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___245_1535.weakly_reduce_scrutinee);
            nbe_step = (uu___245_1535.nbe_step)
          }
      | FStar_TypeChecker_Env.PureSubtermsWithinComputations  ->
          let uu___246_1536 = fs  in
          {
            beta = (uu___246_1536.beta);
            iota = (uu___246_1536.iota);
            zeta = (uu___246_1536.zeta);
            weak = (uu___246_1536.weak);
            hnf = (uu___246_1536.hnf);
            primops = (uu___246_1536.primops);
            do_not_unfold_pure_lets = (uu___246_1536.do_not_unfold_pure_lets);
            unfold_until = (uu___246_1536.unfold_until);
            unfold_only = (uu___246_1536.unfold_only);
            unfold_fully = (uu___246_1536.unfold_fully);
            unfold_attr = (uu___246_1536.unfold_attr);
            unfold_tac = (uu___246_1536.unfold_tac);
            pure_subterms_within_computations = true;
            simplify = (uu___246_1536.simplify);
            erase_universes = (uu___246_1536.erase_universes);
            allow_unbound_universes = (uu___246_1536.allow_unbound_universes);
            reify_ = (uu___246_1536.reify_);
            compress_uvars = (uu___246_1536.compress_uvars);
            no_full_norm = (uu___246_1536.no_full_norm);
            check_no_uvars = (uu___246_1536.check_no_uvars);
            unmeta = (uu___246_1536.unmeta);
            unascribe = (uu___246_1536.unascribe);
            in_full_norm_request = (uu___246_1536.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___246_1536.weakly_reduce_scrutinee);
            nbe_step = (uu___246_1536.nbe_step)
          }
      | FStar_TypeChecker_Env.Simplify  ->
          let uu___247_1537 = fs  in
          {
            beta = (uu___247_1537.beta);
            iota = (uu___247_1537.iota);
            zeta = (uu___247_1537.zeta);
            weak = (uu___247_1537.weak);
            hnf = (uu___247_1537.hnf);
            primops = (uu___247_1537.primops);
            do_not_unfold_pure_lets = (uu___247_1537.do_not_unfold_pure_lets);
            unfold_until = (uu___247_1537.unfold_until);
            unfold_only = (uu___247_1537.unfold_only);
            unfold_fully = (uu___247_1537.unfold_fully);
            unfold_attr = (uu___247_1537.unfold_attr);
            unfold_tac = (uu___247_1537.unfold_tac);
            pure_subterms_within_computations =
              (uu___247_1537.pure_subterms_within_computations);
            simplify = true;
            erase_universes = (uu___247_1537.erase_universes);
            allow_unbound_universes = (uu___247_1537.allow_unbound_universes);
            reify_ = (uu___247_1537.reify_);
            compress_uvars = (uu___247_1537.compress_uvars);
            no_full_norm = (uu___247_1537.no_full_norm);
            check_no_uvars = (uu___247_1537.check_no_uvars);
            unmeta = (uu___247_1537.unmeta);
            unascribe = (uu___247_1537.unascribe);
            in_full_norm_request = (uu___247_1537.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___247_1537.weakly_reduce_scrutinee);
            nbe_step = (uu___247_1537.nbe_step)
          }
      | FStar_TypeChecker_Env.EraseUniverses  ->
          let uu___248_1538 = fs  in
          {
            beta = (uu___248_1538.beta);
            iota = (uu___248_1538.iota);
            zeta = (uu___248_1538.zeta);
            weak = (uu___248_1538.weak);
            hnf = (uu___248_1538.hnf);
            primops = (uu___248_1538.primops);
            do_not_unfold_pure_lets = (uu___248_1538.do_not_unfold_pure_lets);
            unfold_until = (uu___248_1538.unfold_until);
            unfold_only = (uu___248_1538.unfold_only);
            unfold_fully = (uu___248_1538.unfold_fully);
            unfold_attr = (uu___248_1538.unfold_attr);
            unfold_tac = (uu___248_1538.unfold_tac);
            pure_subterms_within_computations =
              (uu___248_1538.pure_subterms_within_computations);
            simplify = (uu___248_1538.simplify);
            erase_universes = true;
            allow_unbound_universes = (uu___248_1538.allow_unbound_universes);
            reify_ = (uu___248_1538.reify_);
            compress_uvars = (uu___248_1538.compress_uvars);
            no_full_norm = (uu___248_1538.no_full_norm);
            check_no_uvars = (uu___248_1538.check_no_uvars);
            unmeta = (uu___248_1538.unmeta);
            unascribe = (uu___248_1538.unascribe);
            in_full_norm_request = (uu___248_1538.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___248_1538.weakly_reduce_scrutinee);
            nbe_step = (uu___248_1538.nbe_step)
          }
      | FStar_TypeChecker_Env.AllowUnboundUniverses  ->
          let uu___249_1539 = fs  in
          {
            beta = (uu___249_1539.beta);
            iota = (uu___249_1539.iota);
            zeta = (uu___249_1539.zeta);
            weak = (uu___249_1539.weak);
            hnf = (uu___249_1539.hnf);
            primops = (uu___249_1539.primops);
            do_not_unfold_pure_lets = (uu___249_1539.do_not_unfold_pure_lets);
            unfold_until = (uu___249_1539.unfold_until);
            unfold_only = (uu___249_1539.unfold_only);
            unfold_fully = (uu___249_1539.unfold_fully);
            unfold_attr = (uu___249_1539.unfold_attr);
            unfold_tac = (uu___249_1539.unfold_tac);
            pure_subterms_within_computations =
              (uu___249_1539.pure_subterms_within_computations);
            simplify = (uu___249_1539.simplify);
            erase_universes = (uu___249_1539.erase_universes);
            allow_unbound_universes = true;
            reify_ = (uu___249_1539.reify_);
            compress_uvars = (uu___249_1539.compress_uvars);
            no_full_norm = (uu___249_1539.no_full_norm);
            check_no_uvars = (uu___249_1539.check_no_uvars);
            unmeta = (uu___249_1539.unmeta);
            unascribe = (uu___249_1539.unascribe);
            in_full_norm_request = (uu___249_1539.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___249_1539.weakly_reduce_scrutinee);
            nbe_step = (uu___249_1539.nbe_step)
          }
      | FStar_TypeChecker_Env.Reify  ->
          let uu___250_1540 = fs  in
          {
            beta = (uu___250_1540.beta);
            iota = (uu___250_1540.iota);
            zeta = (uu___250_1540.zeta);
            weak = (uu___250_1540.weak);
            hnf = (uu___250_1540.hnf);
            primops = (uu___250_1540.primops);
            do_not_unfold_pure_lets = (uu___250_1540.do_not_unfold_pure_lets);
            unfold_until = (uu___250_1540.unfold_until);
            unfold_only = (uu___250_1540.unfold_only);
            unfold_fully = (uu___250_1540.unfold_fully);
            unfold_attr = (uu___250_1540.unfold_attr);
            unfold_tac = (uu___250_1540.unfold_tac);
            pure_subterms_within_computations =
              (uu___250_1540.pure_subterms_within_computations);
            simplify = (uu___250_1540.simplify);
            erase_universes = (uu___250_1540.erase_universes);
            allow_unbound_universes = (uu___250_1540.allow_unbound_universes);
            reify_ = true;
            compress_uvars = (uu___250_1540.compress_uvars);
            no_full_norm = (uu___250_1540.no_full_norm);
            check_no_uvars = (uu___250_1540.check_no_uvars);
            unmeta = (uu___250_1540.unmeta);
            unascribe = (uu___250_1540.unascribe);
            in_full_norm_request = (uu___250_1540.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___250_1540.weakly_reduce_scrutinee);
            nbe_step = (uu___250_1540.nbe_step)
          }
      | FStar_TypeChecker_Env.CompressUvars  ->
          let uu___251_1541 = fs  in
          {
            beta = (uu___251_1541.beta);
            iota = (uu___251_1541.iota);
            zeta = (uu___251_1541.zeta);
            weak = (uu___251_1541.weak);
            hnf = (uu___251_1541.hnf);
            primops = (uu___251_1541.primops);
            do_not_unfold_pure_lets = (uu___251_1541.do_not_unfold_pure_lets);
            unfold_until = (uu___251_1541.unfold_until);
            unfold_only = (uu___251_1541.unfold_only);
            unfold_fully = (uu___251_1541.unfold_fully);
            unfold_attr = (uu___251_1541.unfold_attr);
            unfold_tac = (uu___251_1541.unfold_tac);
            pure_subterms_within_computations =
              (uu___251_1541.pure_subterms_within_computations);
            simplify = (uu___251_1541.simplify);
            erase_universes = (uu___251_1541.erase_universes);
            allow_unbound_universes = (uu___251_1541.allow_unbound_universes);
            reify_ = (uu___251_1541.reify_);
            compress_uvars = true;
            no_full_norm = (uu___251_1541.no_full_norm);
            check_no_uvars = (uu___251_1541.check_no_uvars);
            unmeta = (uu___251_1541.unmeta);
            unascribe = (uu___251_1541.unascribe);
            in_full_norm_request = (uu___251_1541.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___251_1541.weakly_reduce_scrutinee);
            nbe_step = (uu___251_1541.nbe_step)
          }
      | FStar_TypeChecker_Env.NoFullNorm  ->
          let uu___252_1542 = fs  in
          {
            beta = (uu___252_1542.beta);
            iota = (uu___252_1542.iota);
            zeta = (uu___252_1542.zeta);
            weak = (uu___252_1542.weak);
            hnf = (uu___252_1542.hnf);
            primops = (uu___252_1542.primops);
            do_not_unfold_pure_lets = (uu___252_1542.do_not_unfold_pure_lets);
            unfold_until = (uu___252_1542.unfold_until);
            unfold_only = (uu___252_1542.unfold_only);
            unfold_fully = (uu___252_1542.unfold_fully);
            unfold_attr = (uu___252_1542.unfold_attr);
            unfold_tac = (uu___252_1542.unfold_tac);
            pure_subterms_within_computations =
              (uu___252_1542.pure_subterms_within_computations);
            simplify = (uu___252_1542.simplify);
            erase_universes = (uu___252_1542.erase_universes);
            allow_unbound_universes = (uu___252_1542.allow_unbound_universes);
            reify_ = (uu___252_1542.reify_);
            compress_uvars = (uu___252_1542.compress_uvars);
            no_full_norm = true;
            check_no_uvars = (uu___252_1542.check_no_uvars);
            unmeta = (uu___252_1542.unmeta);
            unascribe = (uu___252_1542.unascribe);
            in_full_norm_request = (uu___252_1542.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___252_1542.weakly_reduce_scrutinee);
            nbe_step = (uu___252_1542.nbe_step)
          }
      | FStar_TypeChecker_Env.CheckNoUvars  ->
          let uu___253_1543 = fs  in
          {
            beta = (uu___253_1543.beta);
            iota = (uu___253_1543.iota);
            zeta = (uu___253_1543.zeta);
            weak = (uu___253_1543.weak);
            hnf = (uu___253_1543.hnf);
            primops = (uu___253_1543.primops);
            do_not_unfold_pure_lets = (uu___253_1543.do_not_unfold_pure_lets);
            unfold_until = (uu___253_1543.unfold_until);
            unfold_only = (uu___253_1543.unfold_only);
            unfold_fully = (uu___253_1543.unfold_fully);
            unfold_attr = (uu___253_1543.unfold_attr);
            unfold_tac = (uu___253_1543.unfold_tac);
            pure_subterms_within_computations =
              (uu___253_1543.pure_subterms_within_computations);
            simplify = (uu___253_1543.simplify);
            erase_universes = (uu___253_1543.erase_universes);
            allow_unbound_universes = (uu___253_1543.allow_unbound_universes);
            reify_ = (uu___253_1543.reify_);
            compress_uvars = (uu___253_1543.compress_uvars);
            no_full_norm = (uu___253_1543.no_full_norm);
            check_no_uvars = true;
            unmeta = (uu___253_1543.unmeta);
            unascribe = (uu___253_1543.unascribe);
            in_full_norm_request = (uu___253_1543.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___253_1543.weakly_reduce_scrutinee);
            nbe_step = (uu___253_1543.nbe_step)
          }
      | FStar_TypeChecker_Env.Unmeta  ->
          let uu___254_1544 = fs  in
          {
            beta = (uu___254_1544.beta);
            iota = (uu___254_1544.iota);
            zeta = (uu___254_1544.zeta);
            weak = (uu___254_1544.weak);
            hnf = (uu___254_1544.hnf);
            primops = (uu___254_1544.primops);
            do_not_unfold_pure_lets = (uu___254_1544.do_not_unfold_pure_lets);
            unfold_until = (uu___254_1544.unfold_until);
            unfold_only = (uu___254_1544.unfold_only);
            unfold_fully = (uu___254_1544.unfold_fully);
            unfold_attr = (uu___254_1544.unfold_attr);
            unfold_tac = (uu___254_1544.unfold_tac);
            pure_subterms_within_computations =
              (uu___254_1544.pure_subterms_within_computations);
            simplify = (uu___254_1544.simplify);
            erase_universes = (uu___254_1544.erase_universes);
            allow_unbound_universes = (uu___254_1544.allow_unbound_universes);
            reify_ = (uu___254_1544.reify_);
            compress_uvars = (uu___254_1544.compress_uvars);
            no_full_norm = (uu___254_1544.no_full_norm);
            check_no_uvars = (uu___254_1544.check_no_uvars);
            unmeta = true;
            unascribe = (uu___254_1544.unascribe);
            in_full_norm_request = (uu___254_1544.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___254_1544.weakly_reduce_scrutinee);
            nbe_step = (uu___254_1544.nbe_step)
          }
      | FStar_TypeChecker_Env.Unascribe  ->
          let uu___255_1545 = fs  in
          {
            beta = (uu___255_1545.beta);
            iota = (uu___255_1545.iota);
            zeta = (uu___255_1545.zeta);
            weak = (uu___255_1545.weak);
            hnf = (uu___255_1545.hnf);
            primops = (uu___255_1545.primops);
            do_not_unfold_pure_lets = (uu___255_1545.do_not_unfold_pure_lets);
            unfold_until = (uu___255_1545.unfold_until);
            unfold_only = (uu___255_1545.unfold_only);
            unfold_fully = (uu___255_1545.unfold_fully);
            unfold_attr = (uu___255_1545.unfold_attr);
            unfold_tac = (uu___255_1545.unfold_tac);
            pure_subterms_within_computations =
              (uu___255_1545.pure_subterms_within_computations);
            simplify = (uu___255_1545.simplify);
            erase_universes = (uu___255_1545.erase_universes);
            allow_unbound_universes = (uu___255_1545.allow_unbound_universes);
            reify_ = (uu___255_1545.reify_);
            compress_uvars = (uu___255_1545.compress_uvars);
            no_full_norm = (uu___255_1545.no_full_norm);
            check_no_uvars = (uu___255_1545.check_no_uvars);
            unmeta = (uu___255_1545.unmeta);
            unascribe = true;
            in_full_norm_request = (uu___255_1545.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___255_1545.weakly_reduce_scrutinee);
            nbe_step = (uu___255_1545.nbe_step)
          }
      | FStar_TypeChecker_Env.NBE  ->
          let uu___256_1546 = fs  in
          {
            beta = (uu___256_1546.beta);
            iota = (uu___256_1546.iota);
            zeta = (uu___256_1546.zeta);
            weak = (uu___256_1546.weak);
            hnf = (uu___256_1546.hnf);
            primops = (uu___256_1546.primops);
            do_not_unfold_pure_lets = (uu___256_1546.do_not_unfold_pure_lets);
            unfold_until = (uu___256_1546.unfold_until);
            unfold_only = (uu___256_1546.unfold_only);
            unfold_fully = (uu___256_1546.unfold_fully);
            unfold_attr = (uu___256_1546.unfold_attr);
            unfold_tac = (uu___256_1546.unfold_tac);
            pure_subterms_within_computations =
              (uu___256_1546.pure_subterms_within_computations);
            simplify = (uu___256_1546.simplify);
            erase_universes = (uu___256_1546.erase_universes);
            allow_unbound_universes = (uu___256_1546.allow_unbound_universes);
            reify_ = (uu___256_1546.reify_);
            compress_uvars = (uu___256_1546.compress_uvars);
            no_full_norm = (uu___256_1546.no_full_norm);
            check_no_uvars = (uu___256_1546.check_no_uvars);
            unmeta = (uu___256_1546.unmeta);
            unascribe = (uu___256_1546.unascribe);
            in_full_norm_request = (uu___256_1546.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___256_1546.weakly_reduce_scrutinee);
            nbe_step = true
          }
  
let (to_fsteps : FStar_TypeChecker_Env.step Prims.list -> fsteps) =
  fun s  -> FStar_List.fold_right fstep_add_one s default_steps 
type psc =
  {
  psc_range: FStar_Range.range ;
  psc_subst: unit -> FStar_Syntax_Syntax.subst_t }
let (__proj__Mkpsc__item__psc_range : psc -> FStar_Range.range) =
  fun projectee  ->
    match projectee with
    | { psc_range = __fname__psc_range; psc_subst = __fname__psc_subst;_} ->
        __fname__psc_range
  
let (__proj__Mkpsc__item__psc_subst :
  psc -> unit -> FStar_Syntax_Syntax.subst_t) =
  fun projectee  ->
    match projectee with
    | { psc_range = __fname__psc_range; psc_subst = __fname__psc_subst;_} ->
        __fname__psc_subst
  
let (null_psc : psc) =
  { psc_range = FStar_Range.dummyRange; psc_subst = (fun uu____1599  -> []) } 
let (psc_range : psc -> FStar_Range.range) = fun psc  -> psc.psc_range 
let (psc_subst : psc -> FStar_Syntax_Syntax.subst_t) =
  fun psc  -> psc.psc_subst () 
type debug_switches =
  {
  gen: Prims.bool ;
  top: Prims.bool ;
  cfg: Prims.bool ;
  primop: Prims.bool ;
  unfolding: Prims.bool ;
  b380: Prims.bool ;
  wpe: Prims.bool ;
  norm_delayed: Prims.bool ;
  print_normalized: Prims.bool }
let (__proj__Mkdebug_switches__item__gen : debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; top = __fname__top; cfg = __fname__cfg;
        primop = __fname__primop; unfolding = __fname__unfolding;
        b380 = __fname__b380; wpe = __fname__wpe;
        norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__gen
  
let (__proj__Mkdebug_switches__item__top : debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; top = __fname__top; cfg = __fname__cfg;
        primop = __fname__primop; unfolding = __fname__unfolding;
        b380 = __fname__b380; wpe = __fname__wpe;
        norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__top
  
let (__proj__Mkdebug_switches__item__cfg : debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; top = __fname__top; cfg = __fname__cfg;
        primop = __fname__primop; unfolding = __fname__unfolding;
        b380 = __fname__b380; wpe = __fname__wpe;
        norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__cfg
  
let (__proj__Mkdebug_switches__item__primop : debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; top = __fname__top; cfg = __fname__cfg;
        primop = __fname__primop; unfolding = __fname__unfolding;
        b380 = __fname__b380; wpe = __fname__wpe;
        norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__primop
  
let (__proj__Mkdebug_switches__item__unfolding :
  debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; top = __fname__top; cfg = __fname__cfg;
        primop = __fname__primop; unfolding = __fname__unfolding;
        b380 = __fname__b380; wpe = __fname__wpe;
        norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__unfolding
  
let (__proj__Mkdebug_switches__item__b380 : debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; top = __fname__top; cfg = __fname__cfg;
        primop = __fname__primop; unfolding = __fname__unfolding;
        b380 = __fname__b380; wpe = __fname__wpe;
        norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__b380
  
let (__proj__Mkdebug_switches__item__wpe : debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; top = __fname__top; cfg = __fname__cfg;
        primop = __fname__primop; unfolding = __fname__unfolding;
        b380 = __fname__b380; wpe = __fname__wpe;
        norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__wpe
  
let (__proj__Mkdebug_switches__item__norm_delayed :
  debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; top = __fname__top; cfg = __fname__cfg;
        primop = __fname__primop; unfolding = __fname__unfolding;
        b380 = __fname__b380; wpe = __fname__wpe;
        norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} ->
        __fname__norm_delayed
  
let (__proj__Mkdebug_switches__item__print_normalized :
  debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; top = __fname__top; cfg = __fname__cfg;
        primop = __fname__primop; unfolding = __fname__unfolding;
        b380 = __fname__b380; wpe = __fname__wpe;
        norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} ->
        __fname__print_normalized
  
type primitive_step =
  {
  name: FStar_Ident.lid ;
  arity: Prims.int ;
  univ_arity: Prims.int ;
  auto_reflect: Prims.int FStar_Pervasives_Native.option ;
  strong_reduction_ok: Prims.bool ;
  requires_binder_substitution: Prims.bool ;
  interpretation:
    psc ->
      FStar_Syntax_Embeddings.norm_cb ->
        FStar_Syntax_Syntax.args ->
          FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
    ;
  interpretation_nbe:
    FStar_TypeChecker_NBETerm.nbe_cbs ->
      FStar_TypeChecker_NBETerm.args ->
        FStar_TypeChecker_NBETerm.t FStar_Pervasives_Native.option
    }
let (__proj__Mkprimitive_step__item__name :
  primitive_step -> FStar_Ident.lid) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        univ_arity = __fname__univ_arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;
        interpretation_nbe = __fname__interpretation_nbe;_} -> __fname__name
  
let (__proj__Mkprimitive_step__item__arity : primitive_step -> Prims.int) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        univ_arity = __fname__univ_arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;
        interpretation_nbe = __fname__interpretation_nbe;_} -> __fname__arity
  
let (__proj__Mkprimitive_step__item__univ_arity :
  primitive_step -> Prims.int) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        univ_arity = __fname__univ_arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;
        interpretation_nbe = __fname__interpretation_nbe;_} ->
        __fname__univ_arity
  
let (__proj__Mkprimitive_step__item__auto_reflect :
  primitive_step -> Prims.int FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        univ_arity = __fname__univ_arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;
        interpretation_nbe = __fname__interpretation_nbe;_} ->
        __fname__auto_reflect
  
let (__proj__Mkprimitive_step__item__strong_reduction_ok :
  primitive_step -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        univ_arity = __fname__univ_arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;
        interpretation_nbe = __fname__interpretation_nbe;_} ->
        __fname__strong_reduction_ok
  
let (__proj__Mkprimitive_step__item__requires_binder_substitution :
  primitive_step -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        univ_arity = __fname__univ_arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;
        interpretation_nbe = __fname__interpretation_nbe;_} ->
        __fname__requires_binder_substitution
  
let (__proj__Mkprimitive_step__item__interpretation :
  primitive_step ->
    psc ->
      FStar_Syntax_Embeddings.norm_cb ->
        FStar_Syntax_Syntax.args ->
          FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        univ_arity = __fname__univ_arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;
        interpretation_nbe = __fname__interpretation_nbe;_} ->
        __fname__interpretation
  
let (__proj__Mkprimitive_step__item__interpretation_nbe :
  primitive_step ->
    FStar_TypeChecker_NBETerm.nbe_cbs ->
      FStar_TypeChecker_NBETerm.args ->
        FStar_TypeChecker_NBETerm.t FStar_Pervasives_Native.option)
  =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        univ_arity = __fname__univ_arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;
        interpretation_nbe = __fname__interpretation_nbe;_} ->
        __fname__interpretation_nbe
  
type cfg =
  {
  steps: fsteps ;
  tcenv: FStar_TypeChecker_Env.env ;
  debug: debug_switches ;
  delta_level: FStar_TypeChecker_Env.delta_level Prims.list ;
  primitive_steps: primitive_step FStar_Util.psmap ;
  strong: Prims.bool ;
  memoize_lazy: Prims.bool ;
  normalize_pure_lets: Prims.bool ;
  reifying: Prims.bool }
let (__proj__Mkcfg__item__steps : cfg -> fsteps) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;
        reifying = __fname__reifying;_} -> __fname__steps
  
let (__proj__Mkcfg__item__tcenv : cfg -> FStar_TypeChecker_Env.env) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;
        reifying = __fname__reifying;_} -> __fname__tcenv
  
let (__proj__Mkcfg__item__debug : cfg -> debug_switches) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;
        reifying = __fname__reifying;_} -> __fname__debug
  
let (__proj__Mkcfg__item__delta_level :
  cfg -> FStar_TypeChecker_Env.delta_level Prims.list) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;
        reifying = __fname__reifying;_} -> __fname__delta_level
  
let (__proj__Mkcfg__item__primitive_steps :
  cfg -> primitive_step FStar_Util.psmap) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;
        reifying = __fname__reifying;_} -> __fname__primitive_steps
  
let (__proj__Mkcfg__item__strong : cfg -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;
        reifying = __fname__reifying;_} -> __fname__strong
  
let (__proj__Mkcfg__item__memoize_lazy : cfg -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;
        reifying = __fname__reifying;_} -> __fname__memoize_lazy
  
let (__proj__Mkcfg__item__normalize_pure_lets : cfg -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;
        reifying = __fname__reifying;_} -> __fname__normalize_pure_lets
  
let (__proj__Mkcfg__item__reifying : cfg -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;
        reifying = __fname__reifying;_} -> __fname__reifying
  
let (cfg_to_string : cfg -> Prims.string) =
  fun cfg  ->
    let uu____2418 =
      let uu____2421 =
        let uu____2424 =
          let uu____2425 = steps_to_string cfg.steps  in
          FStar_Util.format1 "  steps = %s" uu____2425  in
        [uu____2424; "}"]  in
      "{" :: uu____2421  in
    FStar_String.concat "\n" uu____2418
  
let (cfg_env : cfg -> FStar_TypeChecker_Env.env) = fun cfg  -> cfg.tcenv 
let (add_steps :
  primitive_step FStar_Util.psmap ->
    primitive_step Prims.list -> primitive_step FStar_Util.psmap)
  =
  fun m  ->
    fun l  ->
      FStar_List.fold_right
        (fun p  ->
           fun m1  ->
             let uu____2462 = FStar_Ident.text_of_lid p.name  in
             FStar_Util.psmap_add m1 uu____2462 p) l m
  
let (prim_from_list :
  primitive_step Prims.list -> primitive_step FStar_Util.psmap) =
  fun l  ->
    let uu____2476 = FStar_Util.psmap_empty ()  in add_steps uu____2476 l
  
let (find_prim_step :
  cfg ->
    FStar_Syntax_Syntax.fv -> primitive_step FStar_Pervasives_Native.option)
  =
  fun cfg  ->
    fun fv  ->
      let uu____2491 =
        FStar_Ident.text_of_lid
          (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
         in
      FStar_Util.psmap_try_find cfg.primitive_steps uu____2491
  
let (is_prim_step : cfg -> FStar_Syntax_Syntax.fv -> Prims.bool) =
  fun cfg  ->
    fun fv  ->
      let uu____2502 =
        let uu____2505 =
          FStar_Ident.text_of_lid
            (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
           in
        FStar_Util.psmap_try_find cfg.primitive_steps uu____2505  in
      FStar_Util.is_some uu____2502
  
let (log : cfg -> (unit -> unit) -> unit) =
  fun cfg  -> fun f  -> if (cfg.debug).gen then f () else () 
let (log_top : cfg -> (unit -> unit) -> unit) =
  fun cfg  -> fun f  -> if (cfg.debug).top then f () else () 
let (log_cfg : cfg -> (unit -> unit) -> unit) =
  fun cfg  -> fun f  -> if (cfg.debug).cfg then f () else () 
let (log_primops : cfg -> (unit -> unit) -> unit) =
  fun cfg  -> fun f  -> if (cfg.debug).primop then f () else () 
let (log_unfolding : cfg -> (unit -> unit) -> unit) =
  fun cfg  -> fun f  -> if (cfg.debug).unfolding then f () else () 
let (log_nbe : cfg -> (unit -> unit) -> unit) =
  fun cfg  ->
    fun f  ->
      let uu____2601 =
        FStar_All.pipe_left (FStar_TypeChecker_Env.debug cfg.tcenv)
          (FStar_Options.Other "NBE")
         in
      if uu____2601 then f () else ()
  
let embed_simple :
  'a .
    'a FStar_Syntax_Embeddings.embedding ->
      FStar_Range.range -> 'a -> FStar_Syntax_Syntax.term
  =
  fun emb  ->
    fun r  ->
      fun x  ->
        let uu____2631 = FStar_Syntax_Embeddings.embed emb x  in
        uu____2631 r FStar_Pervasives_Native.None
          FStar_Syntax_Embeddings.id_norm_cb
  
let try_unembed_simple :
  'a .
    'a FStar_Syntax_Embeddings.embedding ->
      FStar_Syntax_Syntax.term -> 'a FStar_Pervasives_Native.option
  =
  fun emb  ->
    fun x  ->
      let uu____2686 = FStar_Syntax_Embeddings.unembed emb x  in
      uu____2686 false FStar_Syntax_Embeddings.id_norm_cb
  
let mk :
  'Auu____2703 .
    'Auu____2703 ->
      FStar_Range.range -> 'Auu____2703 FStar_Syntax_Syntax.syntax
  =
  fun t  -> fun r  -> FStar_Syntax_Syntax.mk t FStar_Pervasives_Native.None r 
let (built_in_primitive_steps : primitive_step FStar_Util.psmap) =
  let arg_as_int1 a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (try_unembed_simple FStar_Syntax_Embeddings.e_int)
     in
  let arg_as_bool1 a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (try_unembed_simple FStar_Syntax_Embeddings.e_bool)
     in
  let arg_as_char1 a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (try_unembed_simple FStar_Syntax_Embeddings.e_char)
     in
  let arg_as_string1 a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (try_unembed_simple FStar_Syntax_Embeddings.e_string)
     in
  let arg_as_list1 e a =
    let uu____2817 =
      let uu____2826 = FStar_Syntax_Embeddings.e_list e  in
      try_unembed_simple uu____2826  in
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a) uu____2817  in
  let arg_as_bounded_int1 uu____2856 =
    match uu____2856 with
    | (a,uu____2870) ->
        let uu____2881 = FStar_Syntax_Util.head_and_args' a  in
        (match uu____2881 with
         | (hd1,args) ->
             let a1 = FStar_Syntax_Util.unlazy_emb a  in
             let uu____2925 =
               let uu____2940 =
                 let uu____2941 = FStar_Syntax_Subst.compress hd1  in
                 uu____2941.FStar_Syntax_Syntax.n  in
               (uu____2940, args)  in
             (match uu____2925 with
              | (FStar_Syntax_Syntax.Tm_fvar fv1,(arg,uu____2962)::[]) when
                  let uu____2997 =
                    FStar_Ident.text_of_lid
                      (fv1.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                     in
                  FStar_Util.ends_with uu____2997 "int_to_t" ->
                  let arg1 = FStar_Syntax_Util.unlazy_emb arg  in
                  let uu____2999 =
                    let uu____3000 = FStar_Syntax_Subst.compress arg1  in
                    uu____3000.FStar_Syntax_Syntax.n  in
                  (match uu____2999 with
                   | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int
                       (i,FStar_Pervasives_Native.None )) ->
                       let uu____3020 =
                         let uu____3025 = FStar_BigInt.big_int_of_string i
                            in
                         (fv1, uu____3025)  in
                       FStar_Pervasives_Native.Some uu____3020
                   | uu____3030 -> FStar_Pervasives_Native.None)
              | uu____3035 -> FStar_Pervasives_Native.None))
     in
  let lift_unary f aopts =
    match aopts with
    | (FStar_Pervasives_Native.Some a)::[] ->
        let uu____3097 = f a  in FStar_Pervasives_Native.Some uu____3097
    | uu____3098 -> FStar_Pervasives_Native.None  in
  let lift_binary f aopts =
    match aopts with
    | (FStar_Pervasives_Native.Some a0)::(FStar_Pervasives_Native.Some
        a1)::[] ->
        let uu____3154 = f a0 a1  in FStar_Pervasives_Native.Some uu____3154
    | uu____3155 -> FStar_Pervasives_Native.None  in
  let unary_op1 as_a f res norm_cb args =
    let uu____3224 = FStar_List.map as_a args  in
    lift_unary (f res.psc_range) uu____3224  in
  let binary_op1 as_a f res n1 args =
    let uu____3308 = FStar_List.map as_a args  in
    lift_binary (f res.psc_range) uu____3308  in
  let as_primitive_step is_strong uu____3361 =
    match uu____3361 with
    | (l,arity,u_arity,f,f_nbe) ->
        {
          name = l;
          arity;
          univ_arity = u_arity;
          auto_reflect = FStar_Pervasives_Native.None;
          strong_reduction_ok = is_strong;
          requires_binder_substitution = false;
          interpretation = f;
          interpretation_nbe = ((fun _cb  -> f_nbe))
        }
     in
  let unary_int_op1 f =
    unary_op1 arg_as_int1
      (fun r  ->
         fun x  ->
           let uu____3464 = f x  in
           embed_simple FStar_Syntax_Embeddings.e_int r uu____3464)
     in
  let binary_int_op1 f =
    binary_op1 arg_as_int1
      (fun r  ->
         fun x  ->
           fun y  ->
             let uu____3507 = f x y  in
             embed_simple FStar_Syntax_Embeddings.e_int r uu____3507)
     in
  let unary_bool_op1 f =
    unary_op1 arg_as_bool1
      (fun r  ->
         fun x  ->
           let uu____3543 = f x  in
           embed_simple FStar_Syntax_Embeddings.e_bool r uu____3543)
     in
  let binary_bool_op1 f =
    binary_op1 arg_as_bool1
      (fun r  ->
         fun x  ->
           fun y  ->
             let uu____3586 = f x y  in
             embed_simple FStar_Syntax_Embeddings.e_bool r uu____3586)
     in
  let binary_string_op1 f =
    binary_op1 arg_as_string1
      (fun r  ->
         fun x  ->
           fun y  ->
             let uu____3629 = f x y  in
             embed_simple FStar_Syntax_Embeddings.e_string r uu____3629)
     in
  let mixed_binary_op1 as_a as_b embed_c f res _norm_cb args =
    match args with
    | a::b::[] ->
        let uu____3782 =
          let uu____3791 = as_a a  in
          let uu____3794 = as_b b  in (uu____3791, uu____3794)  in
        (match uu____3782 with
         | (FStar_Pervasives_Native.Some a1,FStar_Pervasives_Native.Some b1)
             ->
             let uu____3809 =
               let uu____3810 = f res.psc_range a1 b1  in
               embed_c res.psc_range uu____3810  in
             FStar_Pervasives_Native.Some uu____3809
         | uu____3811 -> FStar_Pervasives_Native.None)
    | uu____3820 -> FStar_Pervasives_Native.None  in
  let list_of_string'1 rng s =
    let name l =
      let uu____3840 =
        let uu____3841 =
          FStar_Syntax_Syntax.lid_as_fv l FStar_Syntax_Syntax.delta_constant
            FStar_Pervasives_Native.None
           in
        FStar_Syntax_Syntax.Tm_fvar uu____3841  in
      mk uu____3840 rng  in
    let char_t = name FStar_Parser_Const.char_lid  in
    let charterm c =
      mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_char c)) rng  in
    let uu____3855 =
      let uu____3858 = FStar_String.list_of_string s  in
      FStar_List.map charterm uu____3858  in
    FStar_All.pipe_left (FStar_Syntax_Util.mk_list char_t rng) uu____3855  in
  let string_of_list'1 rng l =
    let s = FStar_String.string_of_list l  in FStar_Syntax_Util.exp_string s
     in
  let string_compare'1 rng s1 s2 =
    let r = FStar_String.compare s1 s2  in
    let uu____3900 =
      let uu____3901 = FStar_Util.string_of_int r  in
      FStar_BigInt.big_int_of_string uu____3901  in
    embed_simple FStar_Syntax_Embeddings.e_int rng uu____3900  in
  let string_concat'1 psc _n args =
    match args with
    | a1::a2::[] ->
        let uu____3988 = arg_as_string1 a1  in
        (match uu____3988 with
         | FStar_Pervasives_Native.Some s1 ->
             let uu____3994 =
               arg_as_list1 FStar_Syntax_Embeddings.e_string a2  in
             (match uu____3994 with
              | FStar_Pervasives_Native.Some s2 ->
                  let r = FStar_String.concat s1 s2  in
                  let uu____4007 =
                    embed_simple FStar_Syntax_Embeddings.e_string
                      psc.psc_range r
                     in
                  FStar_Pervasives_Native.Some uu____4007
              | uu____4008 -> FStar_Pervasives_Native.None)
         | uu____4013 -> FStar_Pervasives_Native.None)
    | uu____4016 -> FStar_Pervasives_Native.None  in
  let string_split'1 psc _norm_cb args =
    match args with
    | a1::a2::[] ->
        let uu____4099 = arg_as_list1 FStar_Syntax_Embeddings.e_char a1  in
        (match uu____4099 with
         | FStar_Pervasives_Native.Some s1 ->
             let uu____4115 = arg_as_string1 a2  in
             (match uu____4115 with
              | FStar_Pervasives_Native.Some s2 ->
                  let r = FStar_String.split s1 s2  in
                  let uu____4124 =
                    let uu____4125 =
                      FStar_Syntax_Embeddings.e_list
                        FStar_Syntax_Embeddings.e_string
                       in
                    embed_simple uu____4125 psc.psc_range r  in
                  FStar_Pervasives_Native.Some uu____4124
              | uu____4132 -> FStar_Pervasives_Native.None)
         | uu____4135 -> FStar_Pervasives_Native.None)
    | uu____4141 -> FStar_Pervasives_Native.None  in
  let string_substring'1 psc _norm_cb args =
    match args with
    | a1::a2::a3::[] ->
        let uu____4181 =
          let uu____4194 = arg_as_string1 a1  in
          let uu____4197 = arg_as_int1 a2  in
          let uu____4200 = arg_as_int1 a3  in
          (uu____4194, uu____4197, uu____4200)  in
        (match uu____4181 with
         | (FStar_Pervasives_Native.Some s1,FStar_Pervasives_Native.Some
            n1,FStar_Pervasives_Native.Some n2) ->
             let n11 = FStar_BigInt.to_int_fs n1  in
             let n21 = FStar_BigInt.to_int_fs n2  in
             (try
                (fun uu___258_4227  ->
                   match () with
                   | () ->
                       let r = FStar_String.substring s1 n11 n21  in
                       let uu____4231 =
                         embed_simple FStar_Syntax_Embeddings.e_string
                           psc.psc_range r
                          in
                       FStar_Pervasives_Native.Some uu____4231) ()
              with | uu___257_4233 -> FStar_Pervasives_Native.None)
         | uu____4236 -> FStar_Pervasives_Native.None)
    | uu____4249 -> FStar_Pervasives_Native.None  in
  let string_of_int1 rng i =
    let uu____4263 = FStar_BigInt.string_of_big_int i  in
    embed_simple FStar_Syntax_Embeddings.e_string rng uu____4263  in
  let string_of_bool1 rng b =
    embed_simple FStar_Syntax_Embeddings.e_string rng
      (if b then "true" else "false")
     in
  let mk_range1 psc _norm_cb args =
    match args with
    | fn::from_line::from_col::to_line::to_col::[] ->
        let uu____4309 =
          let uu____4330 = arg_as_string1 fn  in
          let uu____4333 = arg_as_int1 from_line  in
          let uu____4336 = arg_as_int1 from_col  in
          let uu____4339 = arg_as_int1 to_line  in
          let uu____4342 = arg_as_int1 to_col  in
          (uu____4330, uu____4333, uu____4336, uu____4339, uu____4342)  in
        (match uu____4309 with
         | (FStar_Pervasives_Native.Some fn1,FStar_Pervasives_Native.Some
            from_l,FStar_Pervasives_Native.Some
            from_c,FStar_Pervasives_Native.Some
            to_l,FStar_Pervasives_Native.Some to_c) ->
             let r =
               let uu____4373 =
                 let uu____4374 = FStar_BigInt.to_int_fs from_l  in
                 let uu____4375 = FStar_BigInt.to_int_fs from_c  in
                 FStar_Range.mk_pos uu____4374 uu____4375  in
               let uu____4376 =
                 let uu____4377 = FStar_BigInt.to_int_fs to_l  in
                 let uu____4378 = FStar_BigInt.to_int_fs to_c  in
                 FStar_Range.mk_pos uu____4377 uu____4378  in
               FStar_Range.mk_range fn1 uu____4373 uu____4376  in
             let uu____4379 =
               embed_simple FStar_Syntax_Embeddings.e_range psc.psc_range r
                in
             FStar_Pervasives_Native.Some uu____4379
         | uu____4380 -> FStar_Pervasives_Native.None)
    | uu____4401 -> FStar_Pervasives_Native.None  in
  let decidable_eq1 neg psc _norm_cb args =
    let r = psc.psc_range  in
    let tru =
      mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool true)) r
       in
    let fal =
      mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool false)) r
       in
    match args with
    | (_typ,uu____4443)::(a1,uu____4445)::(a2,uu____4447)::[] ->
        let uu____4504 = FStar_Syntax_Util.eq_tm a1 a2  in
        (match uu____4504 with
         | FStar_Syntax_Util.Equal  ->
             FStar_Pervasives_Native.Some (if neg then fal else tru)
         | FStar_Syntax_Util.NotEqual  ->
             FStar_Pervasives_Native.Some (if neg then tru else fal)
         | uu____4509 -> FStar_Pervasives_Native.None)
    | uu____4510 -> failwith "Unexpected number of arguments"  in
  let prims_to_fstar_range_step1 psc _norm_cb args =
    match args with
    | (a1,uu____4554)::[] ->
        let uu____4571 =
          try_unembed_simple FStar_Syntax_Embeddings.e_range a1  in
        (match uu____4571 with
         | FStar_Pervasives_Native.Some r ->
             let uu____4577 =
               embed_simple FStar_Syntax_Embeddings.e_range psc.psc_range r
                in
             FStar_Pervasives_Native.Some uu____4577
         | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None)
    | uu____4578 -> failwith "Unexpected number of arguments"  in
  let bogus_cbs =
    {
      FStar_TypeChecker_NBETerm.iapp = (fun h  -> fun _args  -> h);
      FStar_TypeChecker_NBETerm.translate =
        (fun uu____4597  -> failwith "bogus_cbs translate")
    }  in
  let basic_ops =
    let uu____4629 =
      let uu____4658 =
        FStar_TypeChecker_NBETerm.unary_int_op
          (fun x  -> FStar_BigInt.minus_big_int x)
         in
      (FStar_Parser_Const.op_Minus, (Prims.parse_int "1"),
        (Prims.parse_int "0"),
        (unary_int_op1 (fun x  -> FStar_BigInt.minus_big_int x)), uu____4658)
       in
    let uu____4689 =
      let uu____4720 =
        let uu____4749 =
          FStar_TypeChecker_NBETerm.binary_int_op
            (fun x  -> fun y  -> FStar_BigInt.add_big_int x y)
           in
        (FStar_Parser_Const.op_Addition, (Prims.parse_int "2"),
          (Prims.parse_int "0"),
          (binary_int_op1 (fun x  -> fun y  -> FStar_BigInt.add_big_int x y)),
          uu____4749)
         in
      let uu____4786 =
        let uu____4817 =
          let uu____4846 =
            FStar_TypeChecker_NBETerm.binary_int_op
              (fun x  -> fun y  -> FStar_BigInt.sub_big_int x y)
             in
          (FStar_Parser_Const.op_Subtraction, (Prims.parse_int "2"),
            (Prims.parse_int "0"),
            (binary_int_op1
               (fun x  -> fun y  -> FStar_BigInt.sub_big_int x y)),
            uu____4846)
           in
        let uu____4883 =
          let uu____4914 =
            let uu____4943 =
              FStar_TypeChecker_NBETerm.binary_int_op
                (fun x  -> fun y  -> FStar_BigInt.mult_big_int x y)
               in
            (FStar_Parser_Const.op_Multiply, (Prims.parse_int "2"),
              (Prims.parse_int "0"),
              (binary_int_op1
                 (fun x  -> fun y  -> FStar_BigInt.mult_big_int x y)),
              uu____4943)
             in
          let uu____4980 =
            let uu____5011 =
              let uu____5040 =
                FStar_TypeChecker_NBETerm.binary_int_op
                  (fun x  -> fun y  -> FStar_BigInt.div_big_int x y)
                 in
              (FStar_Parser_Const.op_Division, (Prims.parse_int "2"),
                (Prims.parse_int "0"),
                (binary_int_op1
                   (fun x  -> fun y  -> FStar_BigInt.div_big_int x y)),
                uu____5040)
               in
            let uu____5077 =
              let uu____5108 =
                let uu____5137 =
                  FStar_TypeChecker_NBETerm.binary_op
                    FStar_TypeChecker_NBETerm.arg_as_int
                    (fun x  ->
                       fun y  ->
                         let uu____5149 = FStar_BigInt.lt_big_int x y  in
                         FStar_TypeChecker_NBETerm.embed
                           FStar_TypeChecker_NBETerm.e_bool bogus_cbs
                           uu____5149)
                   in
                (FStar_Parser_Const.op_LT, (Prims.parse_int "2"),
                  (Prims.parse_int "0"),
                  (binary_op1 arg_as_int1
                     (fun r  ->
                        fun x  ->
                          fun y  ->
                            let uu____5175 = FStar_BigInt.lt_big_int x y  in
                            embed_simple FStar_Syntax_Embeddings.e_bool r
                              uu____5175)), uu____5137)
                 in
              let uu____5176 =
                let uu____5207 =
                  let uu____5236 =
                    FStar_TypeChecker_NBETerm.binary_op
                      FStar_TypeChecker_NBETerm.arg_as_int
                      (fun x  ->
                         fun y  ->
                           let uu____5248 = FStar_BigInt.le_big_int x y  in
                           FStar_TypeChecker_NBETerm.embed
                             FStar_TypeChecker_NBETerm.e_bool bogus_cbs
                             uu____5248)
                     in
                  (FStar_Parser_Const.op_LTE, (Prims.parse_int "2"),
                    (Prims.parse_int "0"),
                    (binary_op1 arg_as_int1
                       (fun r  ->
                          fun x  ->
                            fun y  ->
                              let uu____5274 = FStar_BigInt.le_big_int x y
                                 in
                              embed_simple FStar_Syntax_Embeddings.e_bool r
                                uu____5274)), uu____5236)
                   in
                let uu____5275 =
                  let uu____5306 =
                    let uu____5335 =
                      FStar_TypeChecker_NBETerm.binary_op
                        FStar_TypeChecker_NBETerm.arg_as_int
                        (fun x  ->
                           fun y  ->
                             let uu____5347 = FStar_BigInt.gt_big_int x y  in
                             FStar_TypeChecker_NBETerm.embed
                               FStar_TypeChecker_NBETerm.e_bool bogus_cbs
                               uu____5347)
                       in
                    (FStar_Parser_Const.op_GT, (Prims.parse_int "2"),
                      (Prims.parse_int "0"),
                      (binary_op1 arg_as_int1
                         (fun r  ->
                            fun x  ->
                              fun y  ->
                                let uu____5373 = FStar_BigInt.gt_big_int x y
                                   in
                                embed_simple FStar_Syntax_Embeddings.e_bool r
                                  uu____5373)), uu____5335)
                     in
                  let uu____5374 =
                    let uu____5405 =
                      let uu____5434 =
                        FStar_TypeChecker_NBETerm.binary_op
                          FStar_TypeChecker_NBETerm.arg_as_int
                          (fun x  ->
                             fun y  ->
                               let uu____5446 = FStar_BigInt.ge_big_int x y
                                  in
                               FStar_TypeChecker_NBETerm.embed
                                 FStar_TypeChecker_NBETerm.e_bool bogus_cbs
                                 uu____5446)
                         in
                      (FStar_Parser_Const.op_GTE, (Prims.parse_int "2"),
                        (Prims.parse_int "0"),
                        (binary_op1 arg_as_int1
                           (fun r  ->
                              fun x  ->
                                fun y  ->
                                  let uu____5472 =
                                    FStar_BigInt.ge_big_int x y  in
                                  embed_simple FStar_Syntax_Embeddings.e_bool
                                    r uu____5472)), uu____5434)
                       in
                    let uu____5473 =
                      let uu____5504 =
                        let uu____5533 =
                          FStar_TypeChecker_NBETerm.binary_int_op
                            (fun x  -> fun y  -> FStar_BigInt.mod_big_int x y)
                           in
                        (FStar_Parser_Const.op_Modulus,
                          (Prims.parse_int "2"), (Prims.parse_int "0"),
                          (binary_int_op1
                             (fun x  ->
                                fun y  -> FStar_BigInt.mod_big_int x y)),
                          uu____5533)
                         in
                      let uu____5570 =
                        let uu____5601 =
                          let uu____5630 =
                            FStar_TypeChecker_NBETerm.unary_bool_op
                              (fun x  -> Prims.op_Negation x)
                             in
                          (FStar_Parser_Const.op_Negation,
                            (Prims.parse_int "1"), (Prims.parse_int "0"),
                            (unary_bool_op1 (fun x  -> Prims.op_Negation x)),
                            uu____5630)
                           in
                        let uu____5661 =
                          let uu____5692 =
                            let uu____5721 =
                              FStar_TypeChecker_NBETerm.binary_bool_op
                                (fun x  -> fun y  -> x && y)
                               in
                            (FStar_Parser_Const.op_And,
                              (Prims.parse_int "2"), (Prims.parse_int "0"),
                              (binary_bool_op1 (fun x  -> fun y  -> x && y)),
                              uu____5721)
                             in
                          let uu____5758 =
                            let uu____5789 =
                              let uu____5818 =
                                FStar_TypeChecker_NBETerm.binary_bool_op
                                  (fun x  -> fun y  -> x || y)
                                 in
                              (FStar_Parser_Const.op_Or,
                                (Prims.parse_int "2"), (Prims.parse_int "0"),
                                (binary_bool_op1 (fun x  -> fun y  -> x || y)),
                                uu____5818)
                               in
                            let uu____5855 =
                              let uu____5886 =
                                let uu____5915 =
                                  FStar_TypeChecker_NBETerm.binary_string_op
                                    (fun x  -> fun y  -> Prims.strcat x y)
                                   in
                                (FStar_Parser_Const.strcat_lid,
                                  (Prims.parse_int "2"),
                                  (Prims.parse_int "0"),
                                  (binary_string_op1
                                     (fun x  -> fun y  -> Prims.strcat x y)),
                                  uu____5915)
                                 in
                              let uu____5952 =
                                let uu____5983 =
                                  let uu____6012 =
                                    FStar_TypeChecker_NBETerm.binary_string_op
                                      (fun x  -> fun y  -> Prims.strcat x y)
                                     in
                                  (FStar_Parser_Const.strcat_lid',
                                    (Prims.parse_int "2"),
                                    (Prims.parse_int "0"),
                                    (binary_string_op1
                                       (fun x  -> fun y  -> Prims.strcat x y)),
                                    uu____6012)
                                   in
                                let uu____6049 =
                                  let uu____6080 =
                                    let uu____6111 =
                                      let uu____6140 =
                                        FStar_TypeChecker_NBETerm.unary_op
                                          FStar_TypeChecker_NBETerm.arg_as_int
                                          FStar_TypeChecker_NBETerm.string_of_int
                                         in
                                      (FStar_Parser_Const.string_of_int_lid,
                                        (Prims.parse_int "1"),
                                        (Prims.parse_int "0"),
                                        (unary_op1 arg_as_int1 string_of_int1),
                                        uu____6140)
                                       in
                                    let uu____6165 =
                                      let uu____6196 =
                                        let uu____6225 =
                                          FStar_TypeChecker_NBETerm.unary_op
                                            FStar_TypeChecker_NBETerm.arg_as_bool
                                            FStar_TypeChecker_NBETerm.string_of_bool
                                           in
                                        (FStar_Parser_Const.string_of_bool_lid,
                                          (Prims.parse_int "1"),
                                          (Prims.parse_int "0"),
                                          (unary_op1 arg_as_bool1
                                             string_of_bool1), uu____6225)
                                         in
                                      let uu____6250 =
                                        let uu____6281 =
                                          let uu____6310 =
                                            FStar_TypeChecker_NBETerm.binary_op
                                              FStar_TypeChecker_NBETerm.arg_as_string
                                              FStar_TypeChecker_NBETerm.string_compare'
                                             in
                                          (FStar_Parser_Const.string_compare,
                                            (Prims.parse_int "2"),
                                            (Prims.parse_int "0"),
                                            (binary_op1 arg_as_string1
                                               string_compare'1), uu____6310)
                                           in
                                        let uu____6335 =
                                          let uu____6366 =
                                            let uu____6397 =
                                              let uu____6428 =
                                                let uu____6457 =
                                                  FStar_Parser_Const.p2l
                                                    ["FStar";
                                                    "String";
                                                    "list_of_string"]
                                                   in
                                                let uu____6458 =
                                                  FStar_TypeChecker_NBETerm.unary_op
                                                    FStar_TypeChecker_NBETerm.arg_as_string
                                                    FStar_TypeChecker_NBETerm.list_of_string'
                                                   in
                                                (uu____6457,
                                                  (Prims.parse_int "1"),
                                                  (Prims.parse_int "0"),
                                                  (unary_op1 arg_as_string1
                                                     list_of_string'1),
                                                  uu____6458)
                                                 in
                                              let uu____6483 =
                                                let uu____6514 =
                                                  let uu____6543 =
                                                    FStar_Parser_Const.p2l
                                                      ["FStar";
                                                      "String";
                                                      "string_of_list"]
                                                     in
                                                  let uu____6544 =
                                                    FStar_TypeChecker_NBETerm.unary_op
                                                      (FStar_TypeChecker_NBETerm.arg_as_list
                                                         FStar_TypeChecker_NBETerm.e_char)
                                                      FStar_TypeChecker_NBETerm.string_of_list'
                                                     in
                                                  (uu____6543,
                                                    (Prims.parse_int "1"),
                                                    (Prims.parse_int "0"),
                                                    (unary_op1
                                                       (arg_as_list1
                                                          FStar_Syntax_Embeddings.e_char)
                                                       string_of_list'1),
                                                    uu____6544)
                                                   in
                                                let uu____6577 =
                                                  let uu____6608 =
                                                    let uu____6637 =
                                                      FStar_Parser_Const.p2l
                                                        ["FStar";
                                                        "String";
                                                        "split"]
                                                       in
                                                    (uu____6637,
                                                      (Prims.parse_int "2"),
                                                      (Prims.parse_int "0"),
                                                      string_split'1,
                                                      FStar_TypeChecker_NBETerm.string_split')
                                                     in
                                                  let uu____6656 =
                                                    let uu____6687 =
                                                      let uu____6716 =
                                                        FStar_Parser_Const.p2l
                                                          ["FStar";
                                                          "String";
                                                          "substring"]
                                                         in
                                                      (uu____6716,
                                                        (Prims.parse_int "3"),
                                                        (Prims.parse_int "0"),
                                                        string_substring'1,
                                                        FStar_TypeChecker_NBETerm.string_substring')
                                                       in
                                                    let uu____6735 =
                                                      let uu____6766 =
                                                        let uu____6795 =
                                                          FStar_Parser_Const.p2l
                                                            ["FStar";
                                                            "String";
                                                            "concat"]
                                                           in
                                                        (uu____6795,
                                                          (Prims.parse_int "2"),
                                                          (Prims.parse_int "0"),
                                                          string_concat'1,
                                                          FStar_TypeChecker_NBETerm.string_concat')
                                                         in
                                                      let uu____6814 =
                                                        let uu____6845 =
                                                          let uu____6874 =
                                                            FStar_Parser_Const.p2l
                                                              ["Prims";
                                                              "mk_range"]
                                                             in
                                                          (uu____6874,
                                                            (Prims.parse_int "5"),
                                                            (Prims.parse_int "0"),
                                                            mk_range1,
                                                            FStar_TypeChecker_NBETerm.mk_range)
                                                           in
                                                        let uu____6893 =
                                                          let uu____6924 =
                                                            let uu____6953 =
                                                              FStar_Parser_Const.p2l
                                                                ["FStar";
                                                                "Range";
                                                                "prims_to_fstar_range"]
                                                               in
                                                            (uu____6953,
                                                              (Prims.parse_int "1"),
                                                              (Prims.parse_int "0"),
                                                              prims_to_fstar_range_step1,
                                                              FStar_TypeChecker_NBETerm.prims_to_fstar_range_step)
                                                             in
                                                          [uu____6924]  in
                                                        uu____6845 ::
                                                          uu____6893
                                                         in
                                                      uu____6766 ::
                                                        uu____6814
                                                       in
                                                    uu____6687 :: uu____6735
                                                     in
                                                  uu____6608 :: uu____6656
                                                   in
                                                uu____6514 :: uu____6577  in
                                              uu____6428 :: uu____6483  in
                                            (FStar_Parser_Const.op_notEq,
                                              (Prims.parse_int "3"),
                                              (Prims.parse_int "1"),
                                              (decidable_eq1 true),
                                              (FStar_TypeChecker_NBETerm.decidable_eq
                                                 true))
                                              :: uu____6397
                                             in
                                          (FStar_Parser_Const.op_Eq,
                                            (Prims.parse_int "3"),
                                            (Prims.parse_int "1"),
                                            (decidable_eq1 false),
                                            (FStar_TypeChecker_NBETerm.decidable_eq
                                               false))
                                            :: uu____6366
                                           in
                                        uu____6281 :: uu____6335  in
                                      uu____6196 :: uu____6250  in
                                    uu____6111 :: uu____6165  in
                                  (FStar_Parser_Const.str_make_lid,
                                    (Prims.parse_int "2"),
                                    (Prims.parse_int "0"),
                                    (mixed_binary_op1 arg_as_int1
                                       arg_as_char1
                                       (embed_simple
                                          FStar_Syntax_Embeddings.e_string)
                                       (fun r  ->
                                          fun x  ->
                                            fun y  ->
                                              let uu____7427 =
                                                FStar_BigInt.to_int_fs x  in
                                              FStar_String.make uu____7427 y)),
                                    (FStar_TypeChecker_NBETerm.mixed_binary_op
                                       FStar_TypeChecker_NBETerm.arg_as_int
                                       FStar_TypeChecker_NBETerm.arg_as_char
                                       (FStar_TypeChecker_NBETerm.embed
                                          FStar_TypeChecker_NBETerm.e_string
                                          bogus_cbs)
                                       (fun x  ->
                                          fun y  ->
                                            let uu____7435 =
                                              FStar_BigInt.to_int_fs x  in
                                            FStar_String.make uu____7435 y)))
                                    :: uu____6080
                                   in
                                uu____5983 :: uu____6049  in
                              uu____5886 :: uu____5952  in
                            uu____5789 :: uu____5855  in
                          uu____5692 :: uu____5758  in
                        uu____5601 :: uu____5661  in
                      uu____5504 :: uu____5570  in
                    uu____5405 :: uu____5473  in
                  uu____5306 :: uu____5374  in
                uu____5207 :: uu____5275  in
              uu____5108 :: uu____5176  in
            uu____5011 :: uu____5077  in
          uu____4914 :: uu____4980  in
        uu____4817 :: uu____4883  in
      uu____4720 :: uu____4786  in
    uu____4629 :: uu____4689  in
  let weak_ops = []  in
  let bounded_arith_ops =
    let bounded_signed_int_types = ["Int8"; "Int16"; "Int32"; "Int64"]  in
    let bounded_unsigned_int_types =
      ["UInt8"; "UInt16"; "UInt32"; "UInt64"; "UInt128"]  in
    let int_as_bounded1 r int_to_t1 n1 =
      let c = embed_simple FStar_Syntax_Embeddings.e_int r n1  in
      let int_to_t2 = FStar_Syntax_Syntax.fv_to_tm int_to_t1  in
      let uu____7972 =
        let uu____7977 =
          let uu____7978 = FStar_Syntax_Syntax.as_arg c  in [uu____7978]  in
        FStar_Syntax_Syntax.mk_Tm_app int_to_t2 uu____7977  in
      uu____7972 FStar_Pervasives_Native.None r  in
    let add_sub_mul_v =
      FStar_All.pipe_right
        (FStar_List.append bounded_signed_int_types
           bounded_unsigned_int_types)
        (FStar_List.collect
           (fun m  ->
              let uu____8100 =
                let uu____8129 = FStar_Parser_Const.p2l ["FStar"; m; "add"]
                   in
                let uu____8130 =
                  FStar_TypeChecker_NBETerm.binary_op
                    FStar_TypeChecker_NBETerm.arg_as_bounded_int
                    (fun uu____8148  ->
                       fun uu____8149  ->
                         match (uu____8148, uu____8149) with
                         | ((int_to_t1,x),(uu____8168,y)) ->
                             let uu____8178 = FStar_BigInt.add_big_int x y
                                in
                             FStar_TypeChecker_NBETerm.int_as_bounded
                               int_to_t1 uu____8178)
                   in
                (uu____8129, (Prims.parse_int "2"), (Prims.parse_int "0"),
                  (binary_op1 arg_as_bounded_int1
                     (fun r  ->
                        fun uu____8210  ->
                          fun uu____8211  ->
                            match (uu____8210, uu____8211) with
                            | ((int_to_t1,x),(uu____8230,y)) ->
                                let uu____8240 = FStar_BigInt.add_big_int x y
                                   in
                                int_as_bounded1 r int_to_t1 uu____8240)),
                  uu____8130)
                 in
              let uu____8241 =
                let uu____8272 =
                  let uu____8301 = FStar_Parser_Const.p2l ["FStar"; m; "sub"]
                     in
                  let uu____8302 =
                    FStar_TypeChecker_NBETerm.binary_op
                      FStar_TypeChecker_NBETerm.arg_as_bounded_int
                      (fun uu____8320  ->
                         fun uu____8321  ->
                           match (uu____8320, uu____8321) with
                           | ((int_to_t1,x),(uu____8340,y)) ->
                               let uu____8350 = FStar_BigInt.sub_big_int x y
                                  in
                               FStar_TypeChecker_NBETerm.int_as_bounded
                                 int_to_t1 uu____8350)
                     in
                  (uu____8301, (Prims.parse_int "2"), (Prims.parse_int "0"),
                    (binary_op1 arg_as_bounded_int1
                       (fun r  ->
                          fun uu____8382  ->
                            fun uu____8383  ->
                              match (uu____8382, uu____8383) with
                              | ((int_to_t1,x),(uu____8402,y)) ->
                                  let uu____8412 =
                                    FStar_BigInt.sub_big_int x y  in
                                  int_as_bounded1 r int_to_t1 uu____8412)),
                    uu____8302)
                   in
                let uu____8413 =
                  let uu____8444 =
                    let uu____8473 =
                      FStar_Parser_Const.p2l ["FStar"; m; "mul"]  in
                    let uu____8474 =
                      FStar_TypeChecker_NBETerm.binary_op
                        FStar_TypeChecker_NBETerm.arg_as_bounded_int
                        (fun uu____8492  ->
                           fun uu____8493  ->
                             match (uu____8492, uu____8493) with
                             | ((int_to_t1,x),(uu____8512,y)) ->
                                 let uu____8522 =
                                   FStar_BigInt.mult_big_int x y  in
                                 FStar_TypeChecker_NBETerm.int_as_bounded
                                   int_to_t1 uu____8522)
                       in
                    (uu____8473, (Prims.parse_int "2"),
                      (Prims.parse_int "0"),
                      (binary_op1 arg_as_bounded_int1
                         (fun r  ->
                            fun uu____8554  ->
                              fun uu____8555  ->
                                match (uu____8554, uu____8555) with
                                | ((int_to_t1,x),(uu____8574,y)) ->
                                    let uu____8584 =
                                      FStar_BigInt.mult_big_int x y  in
                                    int_as_bounded1 r int_to_t1 uu____8584)),
                      uu____8474)
                     in
                  let uu____8585 =
                    let uu____8616 =
                      let uu____8645 =
                        FStar_Parser_Const.p2l ["FStar"; m; "v"]  in
                      let uu____8646 =
                        FStar_TypeChecker_NBETerm.unary_op
                          FStar_TypeChecker_NBETerm.arg_as_bounded_int
                          (fun uu____8660  ->
                             match uu____8660 with
                             | (int_to_t1,x) ->
                                 FStar_TypeChecker_NBETerm.embed
                                   FStar_TypeChecker_NBETerm.e_int bogus_cbs
                                   x)
                         in
                      (uu____8645, (Prims.parse_int "1"),
                        (Prims.parse_int "0"),
                        (unary_op1 arg_as_bounded_int1
                           (fun r  ->
                              fun uu____8694  ->
                                match uu____8694 with
                                | (int_to_t1,x) ->
                                    embed_simple
                                      FStar_Syntax_Embeddings.e_int r x)),
                        uu____8646)
                       in
                    [uu____8616]  in
                  uu____8444 :: uu____8585  in
                uu____8272 :: uu____8413  in
              uu____8100 :: uu____8241))
       in
    let div_mod_unsigned =
      FStar_All.pipe_right bounded_unsigned_int_types
        (FStar_List.collect
           (fun m  ->
              let uu____8936 =
                let uu____8965 = FStar_Parser_Const.p2l ["FStar"; m; "div"]
                   in
                let uu____8966 =
                  FStar_TypeChecker_NBETerm.binary_op
                    FStar_TypeChecker_NBETerm.arg_as_bounded_int
                    (fun uu____8984  ->
                       fun uu____8985  ->
                         match (uu____8984, uu____8985) with
                         | ((int_to_t1,x),(uu____9004,y)) ->
                             let uu____9014 = FStar_BigInt.div_big_int x y
                                in
                             FStar_TypeChecker_NBETerm.int_as_bounded
                               int_to_t1 uu____9014)
                   in
                (uu____8965, (Prims.parse_int "2"), (Prims.parse_int "0"),
                  (binary_op1 arg_as_bounded_int1
                     (fun r  ->
                        fun uu____9046  ->
                          fun uu____9047  ->
                            match (uu____9046, uu____9047) with
                            | ((int_to_t1,x),(uu____9066,y)) ->
                                let uu____9076 = FStar_BigInt.div_big_int x y
                                   in
                                int_as_bounded1 r int_to_t1 uu____9076)),
                  uu____8966)
                 in
              let uu____9077 =
                let uu____9108 =
                  let uu____9137 = FStar_Parser_Const.p2l ["FStar"; m; "rem"]
                     in
                  let uu____9138 =
                    FStar_TypeChecker_NBETerm.binary_op
                      FStar_TypeChecker_NBETerm.arg_as_bounded_int
                      (fun uu____9156  ->
                         fun uu____9157  ->
                           match (uu____9156, uu____9157) with
                           | ((int_to_t1,x),(uu____9176,y)) ->
                               let uu____9186 = FStar_BigInt.mod_big_int x y
                                  in
                               FStar_TypeChecker_NBETerm.int_as_bounded
                                 int_to_t1 uu____9186)
                     in
                  (uu____9137, (Prims.parse_int "2"), (Prims.parse_int "0"),
                    (binary_op1 arg_as_bounded_int1
                       (fun r  ->
                          fun uu____9218  ->
                            fun uu____9219  ->
                              match (uu____9218, uu____9219) with
                              | ((int_to_t1,x),(uu____9238,y)) ->
                                  let uu____9248 =
                                    FStar_BigInt.mod_big_int x y  in
                                  int_as_bounded1 r int_to_t1 uu____9248)),
                    uu____9138)
                   in
                [uu____9108]  in
              uu____8936 :: uu____9077))
       in
    FStar_List.append add_sub_mul_v div_mod_unsigned  in
  let strong_steps =
    FStar_List.map (as_primitive_step true)
      (FStar_List.append basic_ops bounded_arith_ops)
     in
  let weak_steps = FStar_List.map (as_primitive_step false) weak_ops  in
  FStar_All.pipe_left prim_from_list
    (FStar_List.append strong_steps weak_steps)
  
let (equality_ops : primitive_step FStar_Util.psmap) =
  let interp_prop1 psc _norm_cb args =
    let r = psc.psc_range  in
    match args with
    | (_typ,uu____9487)::(a1,uu____9489)::(a2,uu____9491)::[] ->
        let uu____9548 = FStar_Syntax_Util.eq_tm a1 a2  in
        (match uu____9548 with
         | FStar_Syntax_Util.Equal  ->
             FStar_Pervasives_Native.Some
               (let uu___259_9552 = FStar_Syntax_Util.t_true  in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___259_9552.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___259_9552.FStar_Syntax_Syntax.vars)
                })
         | FStar_Syntax_Util.NotEqual  ->
             FStar_Pervasives_Native.Some
               (let uu___260_9554 = FStar_Syntax_Util.t_false  in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___260_9554.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___260_9554.FStar_Syntax_Syntax.vars)
                })
         | uu____9555 -> FStar_Pervasives_Native.None)
    | (_typ,uu____9557)::uu____9558::(a1,uu____9560)::(a2,uu____9562)::[] ->
        let uu____9635 = FStar_Syntax_Util.eq_tm a1 a2  in
        (match uu____9635 with
         | FStar_Syntax_Util.Equal  ->
             FStar_Pervasives_Native.Some
               (let uu___259_9639 = FStar_Syntax_Util.t_true  in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___259_9639.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___259_9639.FStar_Syntax_Syntax.vars)
                })
         | FStar_Syntax_Util.NotEqual  ->
             FStar_Pervasives_Native.Some
               (let uu___260_9641 = FStar_Syntax_Util.t_false  in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___260_9641.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___260_9641.FStar_Syntax_Syntax.vars)
                })
         | uu____9642 -> FStar_Pervasives_Native.None)
    | uu____9643 -> failwith "Unexpected number of arguments"  in
  let propositional_equality =
    {
      name = FStar_Parser_Const.eq2_lid;
      arity = (Prims.parse_int "3");
      univ_arity = (Prims.parse_int "1");
      auto_reflect = FStar_Pervasives_Native.None;
      strong_reduction_ok = true;
      requires_binder_substitution = false;
      interpretation = interp_prop1;
      interpretation_nbe =
        (fun _cb  -> FStar_TypeChecker_NBETerm.interp_prop)
    }  in
  let hetero_propositional_equality =
    {
      name = FStar_Parser_Const.eq3_lid;
      arity = (Prims.parse_int "4");
      univ_arity = (Prims.parse_int "2");
      auto_reflect = FStar_Pervasives_Native.None;
      strong_reduction_ok = true;
      requires_binder_substitution = false;
      interpretation = interp_prop1;
      interpretation_nbe =
        (fun _cb  -> FStar_TypeChecker_NBETerm.interp_prop)
    }  in
  prim_from_list [propositional_equality; hetero_propositional_equality] 
let (plugins :
  (primitive_step -> unit,unit -> primitive_step Prims.list)
    FStar_Pervasives_Native.tuple2)
  =
  let plugins = FStar_Util.mk_ref []  in
  let register p =
    let uu____9677 =
      let uu____9680 = FStar_ST.op_Bang plugins  in p :: uu____9680  in
    FStar_ST.op_Colon_Equals plugins uu____9677  in
  let retrieve uu____9780 = FStar_ST.op_Bang plugins  in (register, retrieve) 
let (register_plugin : primitive_step -> unit) =
  fun p  -> FStar_Pervasives_Native.fst plugins p 
let (retrieve_plugins : unit -> primitive_step Prims.list) =
  fun uu____9853  -> FStar_Pervasives_Native.snd plugins () 
let (config' :
  primitive_step Prims.list ->
    FStar_TypeChecker_Env.step Prims.list -> FStar_TypeChecker_Env.env -> cfg)
  =
  fun psteps  ->
    fun s  ->
      fun e  ->
        let d =
          FStar_All.pipe_right s
            (FStar_List.collect
               (fun uu___230_9894  ->
                  match uu___230_9894 with
                  | FStar_TypeChecker_Env.UnfoldUntil k ->
                      [FStar_TypeChecker_Env.Unfold k]
                  | FStar_TypeChecker_Env.Eager_unfolding  ->
                      [FStar_TypeChecker_Env.Eager_unfolding_only]
                  | FStar_TypeChecker_Env.Inlining  ->
                      [FStar_TypeChecker_Env.InliningDelta]
                  | uu____9898 -> []))
           in
        let d1 =
          match d with
          | [] -> [FStar_TypeChecker_Env.NoDelta]
          | uu____9904 -> d  in
        let uu____9907 = to_fsteps s  in
        let uu____9908 =
          let uu____9909 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "Norm")  in
          let uu____9910 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "NormTop")  in
          let uu____9911 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "NormCfg")  in
          let uu____9912 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "Primops")  in
          let uu____9913 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "Unfolding")
             in
          let uu____9914 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "380")  in
          let uu____9915 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "WPE")  in
          let uu____9916 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "NormDelayed")
             in
          let uu____9917 =
            FStar_TypeChecker_Env.debug e
              (FStar_Options.Other "print_normalized_terms")
             in
          {
            gen = uu____9909;
            top = uu____9910;
            cfg = uu____9911;
            primop = uu____9912;
            unfolding = uu____9913;
            b380 = uu____9914;
            wpe = uu____9915;
            norm_delayed = uu____9916;
            print_normalized = uu____9917
          }  in
        let uu____9918 =
          let uu____9921 =
            let uu____9924 = retrieve_plugins ()  in
            FStar_List.append uu____9924 psteps  in
          add_steps built_in_primitive_steps uu____9921  in
        let uu____9927 =
          (FStar_Options.normalize_pure_terms_for_extraction ()) ||
            (let uu____9929 =
               FStar_All.pipe_right s
                 (FStar_Util.for_some
                    (FStar_TypeChecker_Env.eq_step
                       FStar_TypeChecker_Env.PureSubtermsWithinComputations))
                in
             Prims.op_Negation uu____9929)
           in
        {
          steps = uu____9907;
          tcenv = e;
          debug = uu____9908;
          delta_level = d1;
          primitive_steps = uu____9918;
          strong = false;
          memoize_lazy = true;
          normalize_pure_lets = uu____9927;
          reifying = false
        }
  
let (config :
  FStar_TypeChecker_Env.step Prims.list -> FStar_TypeChecker_Env.env -> cfg)
  = fun s  -> fun e  -> config' [] s e 