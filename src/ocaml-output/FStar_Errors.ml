open Prims
exception Err of Prims.string
let uu___is_Err: Prims.exn -> Prims.bool =
  fun projectee  ->
    match projectee with | Err uu____8 -> true | uu____9 -> false
let __proj__Err__item__uu___: Prims.exn -> Prims.string =
  fun projectee  -> match projectee with | Err uu____17 -> uu____17
exception Error of (Prims.string,FStar_Range.range)
  FStar_Pervasives_Native.tuple2
let uu___is_Error: Prims.exn -> Prims.bool =
  fun projectee  ->
    match projectee with | Error uu____29 -> true | uu____34 -> false
let __proj__Error__item__uu___:
  Prims.exn ->
    (Prims.string,FStar_Range.range) FStar_Pervasives_Native.tuple2
  = fun projectee  -> match projectee with | Error uu____50 -> uu____50
exception Warning of (Prims.string,FStar_Range.range)
  FStar_Pervasives_Native.tuple2
let uu___is_Warning: Prims.exn -> Prims.bool =
  fun projectee  ->
    match projectee with | Warning uu____66 -> true | uu____71 -> false
let __proj__Warning__item__uu___:
  Prims.exn ->
    (Prims.string,FStar_Range.range) FStar_Pervasives_Native.tuple2
  = fun projectee  -> match projectee with | Warning uu____87 -> uu____87
exception Empty_frag
let uu___is_Empty_frag: Prims.exn -> Prims.bool =
  fun projectee  ->
    match projectee with | Empty_frag  -> true | uu____96 -> false
type issue_level =
  | ENotImplemented
  | EInfo
  | EWarning
  | EError[@@deriving show]
let uu___is_ENotImplemented: issue_level -> Prims.bool =
  fun projectee  ->
    match projectee with | ENotImplemented  -> true | uu____101 -> false
let uu___is_EInfo: issue_level -> Prims.bool =
  fun projectee  ->
    match projectee with | EInfo  -> true | uu____106 -> false
let uu___is_EWarning: issue_level -> Prims.bool =
  fun projectee  ->
    match projectee with | EWarning  -> true | uu____111 -> false
let uu___is_EError: issue_level -> Prims.bool =
  fun projectee  ->
    match projectee with | EError  -> true | uu____116 -> false
type issue =
  {
  issue_message: Prims.string;
  issue_level: issue_level;
  issue_range: FStar_Range.range FStar_Pervasives_Native.option;}[@@deriving
                                                                   show]
let __proj__Mkissue__item__issue_message: issue -> Prims.string =
  fun projectee  ->
    match projectee with
    | { issue_message = __fname__issue_message;
        issue_level = __fname__issue_level;
        issue_range = __fname__issue_range;_} -> __fname__issue_message
let __proj__Mkissue__item__issue_level: issue -> issue_level =
  fun projectee  ->
    match projectee with
    | { issue_message = __fname__issue_message;
        issue_level = __fname__issue_level;
        issue_range = __fname__issue_range;_} -> __fname__issue_level
let __proj__Mkissue__item__issue_range:
  issue -> FStar_Range.range FStar_Pervasives_Native.option =
  fun projectee  ->
    match projectee with
    | { issue_message = __fname__issue_message;
        issue_level = __fname__issue_level;
        issue_range = __fname__issue_range;_} -> __fname__issue_range
type error_handler =
  {
  eh_add_one: issue -> Prims.unit;
  eh_count_errors: Prims.unit -> Prims.int;
  eh_report: Prims.unit -> issue Prims.list;
  eh_clear: Prims.unit -> Prims.unit;}[@@deriving show]
let __proj__Mkerror_handler__item__eh_add_one:
  error_handler -> issue -> Prims.unit =
  fun projectee  ->
    match projectee with
    | { eh_add_one = __fname__eh_add_one;
        eh_count_errors = __fname__eh_count_errors;
        eh_report = __fname__eh_report; eh_clear = __fname__eh_clear;_} ->
        __fname__eh_add_one
let __proj__Mkerror_handler__item__eh_count_errors:
  error_handler -> Prims.unit -> Prims.int =
  fun projectee  ->
    match projectee with
    | { eh_add_one = __fname__eh_add_one;
        eh_count_errors = __fname__eh_count_errors;
        eh_report = __fname__eh_report; eh_clear = __fname__eh_clear;_} ->
        __fname__eh_count_errors
let __proj__Mkerror_handler__item__eh_report:
  error_handler -> Prims.unit -> issue Prims.list =
  fun projectee  ->
    match projectee with
    | { eh_add_one = __fname__eh_add_one;
        eh_count_errors = __fname__eh_count_errors;
        eh_report = __fname__eh_report; eh_clear = __fname__eh_clear;_} ->
        __fname__eh_report
let __proj__Mkerror_handler__item__eh_clear:
  error_handler -> Prims.unit -> Prims.unit =
  fun projectee  ->
    match projectee with
    | { eh_add_one = __fname__eh_add_one;
        eh_count_errors = __fname__eh_count_errors;
        eh_report = __fname__eh_report; eh_clear = __fname__eh_clear;_} ->
        __fname__eh_clear
let format_issue: issue -> Prims.string =
  fun issue  ->
    let level_header =
      match issue.issue_level with
      | EInfo  -> "(Info) "
      | EWarning  -> "(Warning) "
      | EError  -> "(Error) "
      | ENotImplemented  -> "Feature not yet implemented: " in
    let uu____297 =
      match issue.issue_range with
      | FStar_Pervasives_Native.None  -> ("", "")
      | FStar_Pervasives_Native.Some r ->
          let uu____307 =
            let uu____308 = FStar_Range.string_of_use_range r in
            FStar_Util.format1 "%s: " uu____308 in
          let uu____309 =
            let uu____310 =
              let uu____311 = FStar_Range.use_range r in
              let uu____312 = FStar_Range.def_range r in
              uu____311 = uu____312 in
            if uu____310
            then ""
            else
              (let uu____314 = FStar_Range.string_of_range r in
               FStar_Util.format1 " (see also %s)" uu____314) in
          (uu____307, uu____309) in
    match uu____297 with
    | (range_str,see_also_str) ->
        FStar_Util.format4 "%s%s%s%s\n" range_str level_header
          issue.issue_message see_also_str
let print_issue: issue -> Prims.unit =
  fun issue  ->
    let uu____321 = format_issue issue in FStar_Util.print_error uu____321
let compare_issues: issue -> issue -> Prims.int =
  fun i1  ->
    fun i2  ->
      match ((i1.issue_range), (i2.issue_range)) with
      | (FStar_Pervasives_Native.None ,FStar_Pervasives_Native.None ) ->
          Prims.parse_int "0"
      | (FStar_Pervasives_Native.None ,FStar_Pervasives_Native.Some
         uu____338) -> - (Prims.parse_int "1")
      | (FStar_Pervasives_Native.Some uu____343,FStar_Pervasives_Native.None
         ) -> Prims.parse_int "1"
      | (FStar_Pervasives_Native.Some r1,FStar_Pervasives_Native.Some r2) ->
          FStar_Range.compare_use_range r1 r2
let default_handler: error_handler =
  let errs = FStar_Util.mk_ref [] in
  let add_one e =
    match e.issue_level with
    | EError  ->
        let uu____365 =
          let uu____368 = FStar_ST.op_Bang errs in e :: uu____368 in
        FStar_ST.op_Colon_Equals errs uu____365
    | uu____499 -> print_issue e in
  let count_errors uu____503 =
    let uu____504 = FStar_ST.op_Bang errs in FStar_List.length uu____504 in
  let report uu____576 =
    let sorted1 =
      let uu____580 = FStar_ST.op_Bang errs in
      FStar_List.sortWith compare_issues uu____580 in
    FStar_List.iter print_issue sorted1; sorted1 in
  let clear1 uu____651 = FStar_ST.op_Colon_Equals errs [] in
  {
    eh_add_one = add_one;
    eh_count_errors = count_errors;
    eh_report = report;
    eh_clear = clear1
  }
let current_handler: error_handler FStar_ST.ref =
  FStar_Util.mk_ref default_handler
let mk_issue:
  issue_level ->
    FStar_Range.range FStar_Pervasives_Native.option -> Prims.string -> issue
  =
  fun level  ->
    fun range  ->
      fun msg  ->
        { issue_message = msg; issue_level = level; issue_range = range }
let get_err_count: Prims.unit -> Prims.int =
  fun uu____748  ->
    let uu____749 =
      let uu____752 = FStar_ST.op_Bang current_handler in
      uu____752.eh_count_errors in
    uu____749 ()
let add_one: issue -> Prims.unit =
  fun issue  ->
    FStar_Util.atomically
      (fun uu____805  ->
         let uu____806 =
           let uu____809 = FStar_ST.op_Bang current_handler in
           uu____809.eh_add_one in
         uu____806 issue)
let add_many: issue Prims.list -> Prims.unit =
  fun issues  ->
    FStar_Util.atomically
      (fun uu____866  ->
         let uu____867 =
           let uu____870 = FStar_ST.op_Bang current_handler in
           uu____870.eh_add_one in
         FStar_List.iter uu____867 issues)
let report_all: Prims.unit -> issue Prims.list =
  fun uu____922  ->
    let uu____923 =
      let uu____928 = FStar_ST.op_Bang current_handler in uu____928.eh_report in
    uu____923 ()
let clear: Prims.unit -> Prims.unit =
  fun uu____978  ->
    let uu____979 =
      let uu____982 = FStar_ST.op_Bang current_handler in uu____982.eh_clear in
    uu____979 ()
let set_handler: error_handler -> Prims.unit =
  fun handler  ->
    let issues = report_all () in
    clear ();
    FStar_ST.op_Colon_Equals current_handler handler;
    add_many issues
let diag: FStar_Range.range -> Prims.string -> Prims.unit =
  fun r  ->
    fun msg  ->
      let uu____1092 = FStar_Options.debug_any () in
      if uu____1092
      then add_one (mk_issue EInfo (FStar_Pervasives_Native.Some r) msg)
      else ()
let warn: FStar_Range.range -> Prims.string -> Prims.unit =
  fun r  ->
    fun msg  ->
      add_one (mk_issue EWarning (FStar_Pervasives_Native.Some r) msg)
let err: FStar_Range.range -> Prims.string -> Prims.unit =
  fun r  ->
    fun msg  ->
      add_one (mk_issue EError (FStar_Pervasives_Native.Some r) msg)
type error_message_prefix =
  {
  set_prefix: Prims.string -> Prims.unit;
  append_prefix: Prims.string -> Prims.string;
  clear_prefix: Prims.unit -> Prims.unit;}[@@deriving show]
let __proj__Mkerror_message_prefix__item__set_prefix:
  error_message_prefix -> Prims.string -> Prims.unit =
  fun projectee  ->
    match projectee with
    | { set_prefix = __fname__set_prefix;
        append_prefix = __fname__append_prefix;
        clear_prefix = __fname__clear_prefix;_} -> __fname__set_prefix
let __proj__Mkerror_message_prefix__item__append_prefix:
  error_message_prefix -> Prims.string -> Prims.string =
  fun projectee  ->
    match projectee with
    | { set_prefix = __fname__set_prefix;
        append_prefix = __fname__append_prefix;
        clear_prefix = __fname__clear_prefix;_} -> __fname__append_prefix
let __proj__Mkerror_message_prefix__item__clear_prefix:
  error_message_prefix -> Prims.unit -> Prims.unit =
  fun projectee  ->
    match projectee with
    | { set_prefix = __fname__set_prefix;
        append_prefix = __fname__append_prefix;
        clear_prefix = __fname__clear_prefix;_} -> __fname__clear_prefix
let message_prefix: error_message_prefix =
  let pfx = FStar_Util.mk_ref FStar_Pervasives_Native.None in
  let set_prefix s =
    FStar_ST.op_Colon_Equals pfx (FStar_Pervasives_Native.Some s) in
  let clear_prefix uu____1266 =
    FStar_ST.op_Colon_Equals pfx FStar_Pervasives_Native.None in
  let append_prefix s =
    let uu____1335 = FStar_ST.op_Bang pfx in
    match uu____1335 with
    | FStar_Pervasives_Native.None  -> s
    | FStar_Pervasives_Native.Some p -> Prims.strcat p (Prims.strcat ": " s) in
  { set_prefix; append_prefix; clear_prefix }
let add_errors:
  (Prims.string,FStar_Range.range) FStar_Pervasives_Native.tuple2 Prims.list
    -> Prims.unit
  =
  fun errs  ->
    FStar_Util.atomically
      (fun uu____1420  ->
         FStar_List.iter
           (fun uu____1429  ->
              match uu____1429 with
              | (msg,r) ->
                  let uu____1436 = message_prefix.append_prefix msg in
                  err r uu____1436) errs)
let issue_of_exn: Prims.exn -> issue FStar_Pervasives_Native.option =
  fun uu___62_1442  ->
    match uu___62_1442 with
    | Error (msg,r) ->
        let uu____1447 =
          let uu____1448 = message_prefix.append_prefix msg in
          mk_issue EError (FStar_Pervasives_Native.Some r) uu____1448 in
        FStar_Pervasives_Native.Some uu____1447
    | FStar_Util.NYI msg ->
        let uu____1450 =
          let uu____1451 = message_prefix.append_prefix msg in
          mk_issue ENotImplemented FStar_Pervasives_Native.None uu____1451 in
        FStar_Pervasives_Native.Some uu____1450
    | Err msg ->
        let uu____1453 =
          let uu____1454 = message_prefix.append_prefix msg in
          mk_issue EError FStar_Pervasives_Native.None uu____1454 in
        FStar_Pervasives_Native.Some uu____1453
    | uu____1455 -> FStar_Pervasives_Native.None
let err_exn: Prims.exn -> Prims.unit =
  fun exn  ->
    let uu____1460 = issue_of_exn exn in
    match uu____1460 with
    | FStar_Pervasives_Native.Some issue -> add_one issue
    | FStar_Pervasives_Native.None  -> FStar_Exn.raise exn
let handleable: Prims.exn -> Prims.bool =
  fun uu___63_1467  ->
    match uu___63_1467 with
    | Error uu____1468 -> true
    | FStar_Util.NYI uu____1473 -> true
    | Err uu____1474 -> true
    | uu____1475 -> false