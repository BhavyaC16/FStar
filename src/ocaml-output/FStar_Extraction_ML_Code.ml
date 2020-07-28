open Prims
type assoc =
  | ILeft 
  | IRight 
  | Left 
  | Right 
  | NonAssoc 
let (uu___is_ILeft : assoc -> Prims.bool) =
  fun projectee -> match projectee with | ILeft -> true | uu____6 -> false
let (uu___is_IRight : assoc -> Prims.bool) =
  fun projectee -> match projectee with | IRight -> true | uu____12 -> false
let (uu___is_Left : assoc -> Prims.bool) =
  fun projectee -> match projectee with | Left -> true | uu____18 -> false
let (uu___is_Right : assoc -> Prims.bool) =
  fun projectee -> match projectee with | Right -> true | uu____24 -> false
let (uu___is_NonAssoc : assoc -> Prims.bool) =
  fun projectee ->
    match projectee with | NonAssoc -> true | uu____30 -> false
type fixity =
  | Prefix 
  | Postfix 
  | Infix of assoc 
let (uu___is_Prefix : fixity -> Prims.bool) =
  fun projectee -> match projectee with | Prefix -> true | uu____41 -> false
let (uu___is_Postfix : fixity -> Prims.bool) =
  fun projectee -> match projectee with | Postfix -> true | uu____47 -> false
let (uu___is_Infix : fixity -> Prims.bool) =
  fun projectee ->
    match projectee with | Infix _0 -> true | uu____54 -> false
let (__proj__Infix__item___0 : fixity -> assoc) =
  fun projectee -> match projectee with | Infix _0 -> _0
type opprec = (Prims.int * fixity)
type level = (opprec * assoc)
let (t_prio_fun : (Prims.int * fixity)) =
  ((Prims.of_int (10)), (Infix Right))
let (t_prio_tpl : (Prims.int * fixity)) =
  ((Prims.of_int (20)), (Infix NonAssoc))
let (t_prio_name : (Prims.int * fixity)) = ((Prims.of_int (30)), Postfix)
let (e_bin_prio_lambda : (Prims.int * fixity)) = ((Prims.of_int (5)), Prefix)
let (e_bin_prio_if : (Prims.int * fixity)) = ((Prims.of_int (15)), Prefix)
let (e_bin_prio_letin : (Prims.int * fixity)) = ((Prims.of_int (19)), Prefix)
let (e_bin_prio_or : (Prims.int * fixity)) =
  ((Prims.of_int (20)), (Infix Left))
let (e_bin_prio_and : (Prims.int * fixity)) =
  ((Prims.of_int (25)), (Infix Left))
let (e_bin_prio_eq : (Prims.int * fixity)) =
  ((Prims.of_int (27)), (Infix NonAssoc))
let (e_bin_prio_order : (Prims.int * fixity)) =
  ((Prims.of_int (29)), (Infix NonAssoc))
let (e_bin_prio_op1 : (Prims.int * fixity)) =
  ((Prims.of_int (30)), (Infix Left))
let (e_bin_prio_op2 : (Prims.int * fixity)) =
  ((Prims.of_int (40)), (Infix Left))
let (e_bin_prio_op3 : (Prims.int * fixity)) =
  ((Prims.of_int (50)), (Infix Left))
let (e_bin_prio_op4 : (Prims.int * fixity)) =
  ((Prims.of_int (60)), (Infix Left))
let (e_bin_prio_comb : (Prims.int * fixity)) =
  ((Prims.of_int (70)), (Infix Left))
let (e_bin_prio_seq : (Prims.int * fixity)) =
  ((Prims.of_int (100)), (Infix Left))
let (e_app_prio : (Prims.int * fixity)) =
  ((Prims.of_int (10000)), (Infix Left))
let (min_op_prec : (Prims.int * fixity)) =
  ((~- Prims.int_one), (Infix NonAssoc))
let (max_op_prec : (Prims.int * fixity)) =
  (FStar_Util.max_int, (Infix NonAssoc))
type doc =
  | Doc of Prims.string 
let (uu___is_Doc : doc -> Prims.bool) = fun projectee -> true
let (__proj__Doc__item___0 : doc -> Prims.string) =
  fun projectee -> match projectee with | Doc _0 -> _0
let (empty : doc) = Doc ""
let (hardline : doc) = Doc "\n"
let (text : Prims.string -> doc) = fun s -> Doc s
let (num : Prims.int -> doc) =
  fun i -> let uu____171 = FStar_Util.string_of_int i in Doc uu____171
let (break1 : doc) = text " "
let (enclose : doc -> doc -> doc -> doc) =
  fun uu____184 ->
    fun uu____185 ->
      fun uu____186 ->
        match (uu____184, uu____185, uu____186) with
        | (Doc l, Doc r, Doc x) -> Doc (Prims.op_Hat l (Prims.op_Hat x r))
let (cbrackets : doc -> doc) =
  fun uu____194 ->
    match uu____194 with | Doc d -> enclose (text "{") (text "}") (Doc d)
let (parens : doc -> doc) =
  fun uu____200 ->
    match uu____200 with | Doc d -> enclose (text "(") (text ")") (Doc d)
let (cat : doc -> doc -> doc) =
  fun uu____210 ->
    fun uu____211 ->
      match (uu____210, uu____211) with
      | (Doc d1, Doc d2) -> Doc (Prims.op_Hat d1 d2)
let (reduce : doc Prims.list -> doc) =
  fun docs -> FStar_List.fold_left cat empty docs
let (combine : doc -> doc Prims.list -> doc) =
  fun uu____233 ->
    fun docs ->
      match uu____233 with
      | Doc sep ->
          let select uu____245 =
            match uu____245 with
            | Doc d ->
                if d = ""
                then FStar_Pervasives_Native.None
                else FStar_Pervasives_Native.Some d in
          let docs1 = FStar_List.choose select docs in
          Doc (FStar_String.concat sep docs1)
let (reduce1 : doc Prims.list -> doc) = fun docs -> combine break1 docs
let (hbox : doc -> doc) = fun d -> d
let rec in_ns : 'a . ('a Prims.list * 'a Prims.list) -> Prims.bool =
  fun x ->
    match x with
    | ([], uu____295) -> true
    | (x1::t1, x2::t2) when x1 = x2 -> in_ns (t1, t2)
    | (uu____318, uu____319) -> false
let (path_of_ns :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    Prims.string Prims.list -> Prims.string Prims.list)
  =
  fun currentModule ->
    fun ns ->
      let ns' = FStar_Extraction_ML_Util.flatten_ns ns in
      if ns' = currentModule
      then []
      else
        (let cg_libs = FStar_Options.codegen_libs () in
         let ns_len = FStar_List.length ns in
         let found =
           FStar_Util.find_map cg_libs
             (fun cg_path ->
                let cg_len = FStar_List.length cg_path in
                if (FStar_List.length cg_path) < ns_len
                then
                  let uu____377 = FStar_Util.first_N cg_len ns in
                  match uu____377 with
                  | (pfx, sfx) ->
                      (if pfx = cg_path
                       then
                         let uu____406 =
                           let uu____409 =
                             let uu____412 =
                               FStar_Extraction_ML_Util.flatten_ns sfx in
                             [uu____412] in
                           FStar_List.append pfx uu____409 in
                         FStar_Pervasives_Native.Some uu____406
                       else FStar_Pervasives_Native.None)
                else FStar_Pervasives_Native.None) in
         match found with
         | FStar_Pervasives_Native.None -> [ns']
         | FStar_Pervasives_Native.Some x -> x)
let (mlpath_of_mlpath :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlpath -> FStar_Extraction_ML_Syntax.mlpath)
  =
  fun currentModule ->
    fun x ->
      let uu____440 = FStar_Extraction_ML_Syntax.string_of_mlpath x in
      match uu____440 with
      | "Prims.Some" -> ([], "Some")
      | "Prims.None" -> ([], "None")
      | uu____445 ->
          let uu____446 = x in
          (match uu____446 with
           | (ns, x1) ->
               let uu____453 = path_of_ns currentModule ns in (uu____453, x1))
let (ptsym_of_symbol :
  FStar_Extraction_ML_Syntax.mlsymbol -> FStar_Extraction_ML_Syntax.mlsymbol)
  =
  fun s ->
    let uu____463 =
      let uu____464 =
        let uu____465 = FStar_String.get s Prims.int_zero in
        FStar_Char.lowercase uu____465 in
      let uu____466 = FStar_String.get s Prims.int_zero in
      uu____464 <> uu____466 in
    if uu____463 then Prims.op_Hat "l__" s else s
let (ptsym :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlpath -> FStar_Extraction_ML_Syntax.mlsymbol)
  =
  fun currentModule ->
    fun mlp ->
      if FStar_List.isEmpty (FStar_Pervasives_Native.fst mlp)
      then ptsym_of_symbol (FStar_Pervasives_Native.snd mlp)
      else
        (let uu____483 = mlpath_of_mlpath currentModule mlp in
         match uu____483 with
         | (p, s) ->
             let uu____490 =
               let uu____493 =
                 let uu____496 = ptsym_of_symbol s in [uu____496] in
               FStar_List.append p uu____493 in
             FStar_String.concat "." uu____490)
let (ptctor :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlpath -> FStar_Extraction_ML_Syntax.mlsymbol)
  =
  fun currentModule ->
    fun mlp ->
      let uu____507 = mlpath_of_mlpath currentModule mlp in
      match uu____507 with
      | (p, s) ->
          let s1 =
            let uu____515 =
              let uu____516 =
                let uu____517 = FStar_String.get s Prims.int_zero in
                FStar_Char.uppercase uu____517 in
              let uu____518 = FStar_String.get s Prims.int_zero in
              uu____516 <> uu____518 in
            if uu____515 then Prims.op_Hat "U__" s else s in
          FStar_String.concat "." (FStar_List.append p [s1])
let (infix_prim_ops :
  (Prims.string * (Prims.int * fixity) * Prims.string) Prims.list) =
  [("op_Addition", e_bin_prio_op1, "+");
  ("op_Subtraction", e_bin_prio_op1, "-");
  ("op_Multiply", e_bin_prio_op1, "*");
  ("op_Division", e_bin_prio_op1, "/");
  ("op_Equality", e_bin_prio_eq, "=");
  ("op_Colon_Equals", e_bin_prio_eq, ":=");
  ("op_disEquality", e_bin_prio_eq, "<>");
  ("op_AmpAmp", e_bin_prio_and, "&&");
  ("op_BarBar", e_bin_prio_or, "||");
  ("op_LessThanOrEqual", e_bin_prio_order, "<=");
  ("op_GreaterThanOrEqual", e_bin_prio_order, ">=");
  ("op_LessThan", e_bin_prio_order, "<");
  ("op_GreaterThan", e_bin_prio_order, ">");
  ("op_Modulus", e_bin_prio_order, "mod")]
let (prim_uni_ops : unit -> (Prims.string * Prims.string) Prims.list) =
  fun uu____748 ->
    let op_minus =
      let uu____750 =
        let uu____751 = FStar_Options.codegen () in
        uu____751 = (FStar_Pervasives_Native.Some FStar_Options.FSharp) in
      if uu____750 then "-" else "~-" in
    [("op_Negation", "not");
    ("op_Minus", op_minus);
    ("op_Bang", "Support.ST.read")]
let prim_types : 'uuuuuu775 . unit -> 'uuuuuu775 Prims.list =
  fun uu____779 -> []
let (prim_constructors : (Prims.string * Prims.string) Prims.list) =
  [("Some", "Some"); ("None", "None"); ("Nil", "[]"); ("Cons", "::")]
let (is_prims_ns :
  FStar_Extraction_ML_Syntax.mlsymbol Prims.list -> Prims.bool) =
  fun ns -> ns = ["Prims"]
let (as_bin_op :
  FStar_Extraction_ML_Syntax.mlpath ->
    (FStar_Extraction_ML_Syntax.mlsymbol * (Prims.int * fixity) *
      Prims.string) FStar_Pervasives_Native.option)
  =
  fun uu____833 ->
    match uu____833 with
    | (ns, x) ->
        if is_prims_ns ns
        then
          FStar_List.tryFind
            (fun uu____878 ->
               match uu____878 with | (y, uu____890, uu____891) -> x = y)
            infix_prim_ops
        else FStar_Pervasives_Native.None
let (is_bin_op : FStar_Extraction_ML_Syntax.mlpath -> Prims.bool) =
  fun p ->
    let uu____916 = as_bin_op p in uu____916 <> FStar_Pervasives_Native.None
let (as_uni_op :
  FStar_Extraction_ML_Syntax.mlpath ->
    (FStar_Extraction_ML_Syntax.mlsymbol * Prims.string)
      FStar_Pervasives_Native.option)
  =
  fun uu____961 ->
    match uu____961 with
    | (ns, x) ->
        if is_prims_ns ns
        then
          let uu____980 = prim_uni_ops () in
          FStar_List.tryFind
            (fun uu____994 -> match uu____994 with | (y, uu____1000) -> x = y)
            uu____980
        else FStar_Pervasives_Native.None
let (is_uni_op : FStar_Extraction_ML_Syntax.mlpath -> Prims.bool) =
  fun p ->
    let uu____1011 = as_uni_op p in
    uu____1011 <> FStar_Pervasives_Native.None
let (is_standard_type : FStar_Extraction_ML_Syntax.mlpath -> Prims.bool) =
  fun p -> false
let (as_standard_constructor :
  FStar_Extraction_ML_Syntax.mlpath ->
    (FStar_Extraction_ML_Syntax.mlsymbol * Prims.string)
      FStar_Pervasives_Native.option)
  =
  fun uu____1043 ->
    match uu____1043 with
    | (ns, x) ->
        if is_prims_ns ns
        then
          FStar_List.tryFind
            (fun uu____1069 ->
               match uu____1069 with | (y, uu____1075) -> x = y)
            prim_constructors
        else FStar_Pervasives_Native.None
let (is_standard_constructor :
  FStar_Extraction_ML_Syntax.mlpath -> Prims.bool) =
  fun p ->
    let uu____1086 = as_standard_constructor p in
    uu____1086 <> FStar_Pervasives_Native.None
let (maybe_paren :
  ((Prims.int * fixity) * assoc) -> (Prims.int * fixity) -> doc -> doc) =
  fun uu____1127 ->
    fun inner ->
      fun doc1 ->
        match uu____1127 with
        | (outer, side) ->
            let noparens _inner _outer side1 =
              let uu____1184 = _inner in
              match uu____1184 with
              | (pi, fi) ->
                  let uu____1191 = _outer in
                  (match uu____1191 with
                   | (po, fo) ->
                       (pi > po) ||
                         ((match (fi, side1) with
                           | (Postfix, Left) -> true
                           | (Prefix, Right) -> true
                           | (Infix (Left), Left) ->
                               (pi = po) && (fo = (Infix Left))
                           | (Infix (Right), Right) ->
                               (pi = po) && (fo = (Infix Right))
                           | (Infix (Left), ILeft) ->
                               (pi = po) && (fo = (Infix Left))
                           | (Infix (Right), IRight) ->
                               (pi = po) && (fo = (Infix Right))
                           | (uu____1198, NonAssoc) -> (pi = po) && (fi = fo)
                           | (uu____1199, uu____1200) -> false))) in
            if noparens inner outer side then doc1 else parens doc1
let (escape_byte_hex : FStar_BaseTypes.byte -> Prims.string) =
  fun x -> Prims.op_Hat "\\x" (FStar_Util.hex_string_of_byte x)
let (escape_char_hex : FStar_BaseTypes.char -> Prims.string) =
  fun x -> escape_byte_hex (FStar_Util.byte_of_char x)
let (escape_or :
  (FStar_BaseTypes.char -> Prims.string) ->
    FStar_BaseTypes.char -> Prims.string)
  =
  fun fallback ->
    fun uu___0_1224 ->
      if uu___0_1224 = 92
      then "\\\\"
      else
        if uu___0_1224 = 32
        then " "
        else
          if uu___0_1224 = 8
          then "\\b"
          else
            if uu___0_1224 = 9
            then "\\t"
            else
              if uu___0_1224 = 13
              then "\\r"
              else
                if uu___0_1224 = 10
                then "\\n"
                else
                  if uu___0_1224 = 39
                  then "\\'"
                  else
                    if uu___0_1224 = 34
                    then "\\\""
                    else
                      if FStar_Util.is_letter_or_digit uu___0_1224
                      then FStar_Util.string_of_char uu___0_1224
                      else
                        if FStar_Util.is_punctuation uu___0_1224
                        then FStar_Util.string_of_char uu___0_1224
                        else
                          if FStar_Util.is_symbol uu___0_1224
                          then FStar_Util.string_of_char uu___0_1224
                          else fallback uu___0_1224
let (string_of_mlconstant :
  FStar_Extraction_ML_Syntax.mlconstant -> Prims.string) =
  fun sctt ->
    match sctt with
    | FStar_Extraction_ML_Syntax.MLC_Unit -> "()"
    | FStar_Extraction_ML_Syntax.MLC_Bool (true) -> "true"
    | FStar_Extraction_ML_Syntax.MLC_Bool (false) -> "false"
    | FStar_Extraction_ML_Syntax.MLC_Char c ->
        let nc = FStar_Char.int_of_char c in
        let uu____1234 = FStar_Util.string_of_int nc in
        Prims.op_Hat uu____1234
          (if
             ((nc >= (Prims.of_int (32))) && (nc <= (Prims.of_int (127)))) &&
               (nc <> (Prims.of_int (34)))
           then
             Prims.op_Hat " (*"
               (Prims.op_Hat (FStar_Util.string_of_char c) "*)")
           else "")
    | FStar_Extraction_ML_Syntax.MLC_Int
        (s, FStar_Pervasives_Native.Some
         (FStar_Const.Signed, FStar_Const.Int32))
        -> Prims.op_Hat s "l"
    | FStar_Extraction_ML_Syntax.MLC_Int
        (s, FStar_Pervasives_Native.Some
         (FStar_Const.Signed, FStar_Const.Int64))
        -> Prims.op_Hat s "L"
    | FStar_Extraction_ML_Syntax.MLC_Int
        (s, FStar_Pervasives_Native.Some (uu____1259, FStar_Const.Int8)) -> s
    | FStar_Extraction_ML_Syntax.MLC_Int
        (s, FStar_Pervasives_Native.Some (uu____1271, FStar_Const.Int16)) ->
        s
    | FStar_Extraction_ML_Syntax.MLC_Int (s, FStar_Pervasives_Native.None) ->
        Prims.op_Hat "(Prims.parse_int \"" (Prims.op_Hat s "\")")
    | FStar_Extraction_ML_Syntax.MLC_Float d -> FStar_Util.string_of_float d
    | FStar_Extraction_ML_Syntax.MLC_Bytes bytes ->
        let uu____1297 =
          let uu____1298 =
            FStar_Compiler_Bytes.f_encode escape_byte_hex bytes in
          Prims.op_Hat uu____1298 "\"" in
        Prims.op_Hat "\"" uu____1297
    | FStar_Extraction_ML_Syntax.MLC_String chars ->
        let uu____1300 =
          let uu____1301 =
            FStar_String.collect (escape_or FStar_Util.string_of_char) chars in
          Prims.op_Hat uu____1301 "\"" in
        Prims.op_Hat "\"" uu____1300
    | uu____1302 ->
        failwith "TODO: extract integer constants properly into OCaml"
let rec (doc_of_mltype' :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    level -> FStar_Extraction_ML_Syntax.mlty -> doc)
  =
  fun currentModule ->
    fun outer ->
      fun ty ->
        match ty with
        | FStar_Extraction_ML_Syntax.MLTY_Var x ->
            let escape_tyvar s =
              if FStar_Util.starts_with s "'_"
              then FStar_Util.replace_char s 95 117
              else s in
            text (escape_tyvar x)
        | FStar_Extraction_ML_Syntax.MLTY_Tuple tys ->
            let doc1 =
              FStar_List.map (doc_of_mltype currentModule (t_prio_tpl, Left))
                tys in
            let doc2 =
              let uu____1345 =
                let uu____1346 = combine (text " * ") doc1 in hbox uu____1346 in
              parens uu____1345 in
            doc2
        | FStar_Extraction_ML_Syntax.MLTY_Named (args, name) ->
            let args1 =
              match args with
              | [] -> empty
              | arg::[] ->
                  doc_of_mltype currentModule (t_prio_name, Left) arg
              | uu____1355 ->
                  let args1 =
                    FStar_List.map
                      (doc_of_mltype currentModule (min_op_prec, NonAssoc))
                      args in
                  let uu____1361 =
                    let uu____1362 = combine (text ", ") args1 in
                    hbox uu____1362 in
                  parens uu____1361 in
            let name1 = ptsym currentModule name in
            let uu____1364 = reduce1 [args1; text name1] in hbox uu____1364
        | FStar_Extraction_ML_Syntax.MLTY_Fun (t1, uu____1366, t2) ->
            let d1 = doc_of_mltype currentModule (t_prio_fun, Left) t1 in
            let d2 = doc_of_mltype currentModule (t_prio_fun, Right) t2 in
            let uu____1370 =
              let uu____1371 = reduce1 [d1; text " -> "; d2] in
              hbox uu____1371 in
            maybe_paren outer t_prio_fun uu____1370
        | FStar_Extraction_ML_Syntax.MLTY_Top ->
            let uu____1372 = FStar_Extraction_ML_Util.codegen_fsharp () in
            if uu____1372 then text "obj" else text "Obj.t"
        | FStar_Extraction_ML_Syntax.MLTY_Erased -> text "unit"
and (doc_of_mltype :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    level -> FStar_Extraction_ML_Syntax.mlty -> doc)
  =
  fun currentModule ->
    fun outer ->
      fun ty ->
        let uu____1377 = FStar_Extraction_ML_Util.resugar_mlty ty in
        doc_of_mltype' currentModule outer uu____1377
let rec (doc_of_expr :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    level -> FStar_Extraction_ML_Syntax.mlexpr -> doc)
  =
  fun currentModule ->
    fun outer ->
      fun e ->
        match e.FStar_Extraction_ML_Syntax.expr with
        | FStar_Extraction_ML_Syntax.MLE_Coerce (e1, t, t') ->
            let doc1 = doc_of_expr currentModule (min_op_prec, NonAssoc) e1 in
            let uu____1461 = FStar_Extraction_ML_Util.codegen_fsharp () in
            if uu____1461
            then
              let uu____1462 = reduce [text "Prims.unsafe_coerce "; doc1] in
              parens uu____1462
            else
              (let uu____1464 = reduce [text "Obj.magic "; parens doc1] in
               parens uu____1464)
        | FStar_Extraction_ML_Syntax.MLE_Seq es ->
            let docs =
              FStar_List.map
                (doc_of_expr currentModule (min_op_prec, NonAssoc)) es in
            let docs1 =
              FStar_List.map (fun d -> reduce [d; text ";"; hardline]) docs in
            let uu____1476 = reduce docs1 in parens uu____1476
        | FStar_Extraction_ML_Syntax.MLE_Const c ->
            let uu____1478 = string_of_mlconstant c in text uu____1478
        | FStar_Extraction_ML_Syntax.MLE_Var x -> text x
        | FStar_Extraction_ML_Syntax.MLE_Name path ->
            let uu____1481 = ptsym currentModule path in text uu____1481
        | FStar_Extraction_ML_Syntax.MLE_Record (path, fields) ->
            let for1 uu____1509 =
              match uu____1509 with
              | (name, e1) ->
                  let doc1 =
                    doc_of_expr currentModule (min_op_prec, NonAssoc) e1 in
                  let uu____1517 =
                    let uu____1520 =
                      let uu____1521 = ptsym currentModule (path, name) in
                      text uu____1521 in
                    [uu____1520; text "="; doc1] in
                  reduce1 uu____1517 in
            let uu____1524 =
              let uu____1525 = FStar_List.map for1 fields in
              combine (text "; ") uu____1525 in
            cbrackets uu____1524
        | FStar_Extraction_ML_Syntax.MLE_CTor (ctor, []) ->
            let name =
              let uu____1536 = is_standard_constructor ctor in
              if uu____1536
              then
                let uu____1537 =
                  let uu____1542 = as_standard_constructor ctor in
                  FStar_Option.get uu____1542 in
                FStar_Pervasives_Native.snd uu____1537
              else ptctor currentModule ctor in
            text name
        | FStar_Extraction_ML_Syntax.MLE_CTor (ctor, args) ->
            let name =
              let uu____1561 = is_standard_constructor ctor in
              if uu____1561
              then
                let uu____1562 =
                  let uu____1567 = as_standard_constructor ctor in
                  FStar_Option.get uu____1567 in
                FStar_Pervasives_Native.snd uu____1562
              else ptctor currentModule ctor in
            let args1 =
              FStar_List.map
                (doc_of_expr currentModule (min_op_prec, NonAssoc)) args in
            let doc1 =
              match (name, args1) with
              | ("::", x::xs::[]) -> reduce [parens x; text "::"; xs]
              | (uu____1589, uu____1590) ->
                  let uu____1595 =
                    let uu____1598 =
                      let uu____1601 =
                        let uu____1602 = combine (text ", ") args1 in
                        parens uu____1602 in
                      [uu____1601] in
                    (text name) :: uu____1598 in
                  reduce1 uu____1595 in
            maybe_paren outer e_app_prio doc1
        | FStar_Extraction_ML_Syntax.MLE_Tuple es ->
            let docs =
              FStar_List.map
                (fun x ->
                   let uu____1612 =
                     doc_of_expr currentModule (min_op_prec, NonAssoc) x in
                   parens uu____1612) es in
            let docs1 =
              let uu____1614 = combine (text ", ") docs in parens uu____1614 in
            docs1
        | FStar_Extraction_ML_Syntax.MLE_Let ((rec_, lets), body) ->
            let pre =
              if
                e.FStar_Extraction_ML_Syntax.loc <>
                  FStar_Extraction_ML_Syntax.dummy_loc
              then
                let uu____1629 =
                  let uu____1632 =
                    let uu____1635 =
                      doc_of_loc e.FStar_Extraction_ML_Syntax.loc in
                    [uu____1635] in
                  hardline :: uu____1632 in
                reduce uu____1629
              else empty in
            let doc1 = doc_of_lets currentModule (rec_, false, lets) in
            let body1 =
              doc_of_expr currentModule (min_op_prec, NonAssoc) body in
            let uu____1641 =
              let uu____1642 =
                let uu____1645 =
                  let uu____1648 =
                    let uu____1651 = reduce1 [text "in"; body1] in
                    [uu____1651] in
                  doc1 :: uu____1648 in
                pre :: uu____1645 in
              combine hardline uu____1642 in
            parens uu____1641
        | FStar_Extraction_ML_Syntax.MLE_App (e1, args) ->
            (match ((e1.FStar_Extraction_ML_Syntax.expr), args) with
             | (FStar_Extraction_ML_Syntax.MLE_Name p,
                {
                  FStar_Extraction_ML_Syntax.expr =
                    FStar_Extraction_ML_Syntax.MLE_Fun
                    (uu____1661::[], scrutinee);
                  FStar_Extraction_ML_Syntax.mlty = uu____1663;
                  FStar_Extraction_ML_Syntax.loc = uu____1664;_}::{
                                                                    FStar_Extraction_ML_Syntax.expr
                                                                    =
                                                                    FStar_Extraction_ML_Syntax.MLE_Fun
                                                                    ((arg,
                                                                    uu____1666)::[],
                                                                    possible_match);
                                                                    FStar_Extraction_ML_Syntax.mlty
                                                                    =
                                                                    uu____1668;
                                                                    FStar_Extraction_ML_Syntax.loc
                                                                    =
                                                                    uu____1669;_}::[])
                 when
                 let uu____1704 =
                   FStar_Extraction_ML_Syntax.string_of_mlpath p in
                 uu____1704 = "FStar.All.try_with" ->
                 let branches =
                   match possible_match with
                   | {
                       FStar_Extraction_ML_Syntax.expr =
                         FStar_Extraction_ML_Syntax.MLE_Match
                         ({
                            FStar_Extraction_ML_Syntax.expr =
                              FStar_Extraction_ML_Syntax.MLE_Var arg';
                            FStar_Extraction_ML_Syntax.mlty = uu____1727;
                            FStar_Extraction_ML_Syntax.loc = uu____1728;_},
                          branches);
                       FStar_Extraction_ML_Syntax.mlty = uu____1730;
                       FStar_Extraction_ML_Syntax.loc = uu____1731;_} when
                       arg = arg' -> branches
                   | e2 ->
                       [(FStar_Extraction_ML_Syntax.MLP_Wild,
                          FStar_Pervasives_Native.None, e2)] in
                 doc_of_expr currentModule outer
                   {
                     FStar_Extraction_ML_Syntax.expr =
                       (FStar_Extraction_ML_Syntax.MLE_Try
                          (scrutinee, branches));
                     FStar_Extraction_ML_Syntax.mlty =
                       (possible_match.FStar_Extraction_ML_Syntax.mlty);
                     FStar_Extraction_ML_Syntax.loc =
                       (possible_match.FStar_Extraction_ML_Syntax.loc)
                   }
             | (FStar_Extraction_ML_Syntax.MLE_Name p, e11::e2::[]) when
                 is_bin_op p -> doc_of_binop currentModule p e11 e2
             | (FStar_Extraction_ML_Syntax.MLE_App
                ({
                   FStar_Extraction_ML_Syntax.expr =
                     FStar_Extraction_ML_Syntax.MLE_Name p;
                   FStar_Extraction_ML_Syntax.mlty = uu____1787;
                   FStar_Extraction_ML_Syntax.loc = uu____1788;_},
                 unitVal::[]),
                e11::e2::[]) when
                 (is_bin_op p) &&
                   (unitVal = FStar_Extraction_ML_Syntax.ml_unit)
                 -> doc_of_binop currentModule p e11 e2
             | (FStar_Extraction_ML_Syntax.MLE_Name p, e11::[]) when
                 is_uni_op p -> doc_of_uniop currentModule p e11
             | (FStar_Extraction_ML_Syntax.MLE_App
                ({
                   FStar_Extraction_ML_Syntax.expr =
                     FStar_Extraction_ML_Syntax.MLE_Name p;
                   FStar_Extraction_ML_Syntax.mlty = uu____1801;
                   FStar_Extraction_ML_Syntax.loc = uu____1802;_},
                 unitVal::[]),
                e11::[]) when
                 (is_uni_op p) &&
                   (unitVal = FStar_Extraction_ML_Syntax.ml_unit)
                 -> doc_of_uniop currentModule p e11
             | uu____1809 ->
                 let e2 = doc_of_expr currentModule (e_app_prio, ILeft) e1 in
                 let args1 =
                   FStar_List.map
                     (doc_of_expr currentModule (e_app_prio, IRight)) args in
                 let uu____1820 = reduce1 (e2 :: args1) in parens uu____1820)
        | FStar_Extraction_ML_Syntax.MLE_Proj (e1, f) ->
            let e2 = doc_of_expr currentModule (min_op_prec, NonAssoc) e1 in
            let doc1 =
              let uu____1825 = FStar_Extraction_ML_Util.codegen_fsharp () in
              if uu____1825
              then
                reduce [e2; text "."; text (FStar_Pervasives_Native.snd f)]
              else
                (let uu____1829 =
                   let uu____1832 =
                     let uu____1835 =
                       let uu____1838 =
                         let uu____1839 = ptsym currentModule f in
                         text uu____1839 in
                       [uu____1838] in
                     (text ".") :: uu____1835 in
                   e2 :: uu____1832 in
                 reduce uu____1829) in
            doc1
        | FStar_Extraction_ML_Syntax.MLE_Fun (ids, body) ->
            let bvar_annot x xt =
              let uu____1869 = FStar_Extraction_ML_Util.codegen_fsharp () in
              if uu____1869
              then
                let uu____1870 =
                  let uu____1873 =
                    let uu____1876 =
                      let uu____1879 =
                        match xt with
                        | FStar_Pervasives_Native.Some xxt ->
                            let uu____1881 =
                              let uu____1884 =
                                let uu____1887 =
                                  doc_of_mltype currentModule outer xxt in
                                [uu____1887] in
                              (text " : ") :: uu____1884 in
                            reduce1 uu____1881
                        | uu____1888 -> text "" in
                      [uu____1879; text ")"] in
                    (text x) :: uu____1876 in
                  (text "(") :: uu____1873 in
                reduce1 uu____1870
              else text x in
            let ids1 =
              FStar_List.map
                (fun uu____1902 ->
                   match uu____1902 with
                   | (x, xt) ->
                       bvar_annot x (FStar_Pervasives_Native.Some xt)) ids in
            let body1 =
              doc_of_expr currentModule (min_op_prec, NonAssoc) body in
            let doc1 =
              let uu____1911 =
                let uu____1914 =
                  let uu____1917 = reduce1 ids1 in
                  [uu____1917; text "->"; body1] in
                (text "fun") :: uu____1914 in
              reduce1 uu____1911 in
            parens doc1
        | FStar_Extraction_ML_Syntax.MLE_If
            (cond, e1, FStar_Pervasives_Native.None) ->
            let cond1 =
              doc_of_expr currentModule (min_op_prec, NonAssoc) cond in
            let doc1 =
              let uu____1924 =
                let uu____1927 =
                  reduce1 [text "if"; cond1; text "then"; text "begin"] in
                let uu____1928 =
                  let uu____1931 =
                    doc_of_expr currentModule (min_op_prec, NonAssoc) e1 in
                  [uu____1931; text "end"] in
                uu____1927 :: uu____1928 in
              combine hardline uu____1924 in
            maybe_paren outer e_bin_prio_if doc1
        | FStar_Extraction_ML_Syntax.MLE_If
            (cond, e1, FStar_Pervasives_Native.Some e2) ->
            let cond1 =
              doc_of_expr currentModule (min_op_prec, NonAssoc) cond in
            let doc1 =
              let uu____1939 =
                let uu____1942 =
                  reduce1 [text "if"; cond1; text "then"; text "begin"] in
                let uu____1943 =
                  let uu____1946 =
                    doc_of_expr currentModule (min_op_prec, NonAssoc) e1 in
                  let uu____1947 =
                    let uu____1950 =
                      reduce1 [text "end"; text "else"; text "begin"] in
                    let uu____1951 =
                      let uu____1954 =
                        doc_of_expr currentModule (min_op_prec, NonAssoc) e2 in
                      [uu____1954; text "end"] in
                    uu____1950 :: uu____1951 in
                  uu____1946 :: uu____1947 in
                uu____1942 :: uu____1943 in
              combine hardline uu____1939 in
            maybe_paren outer e_bin_prio_if doc1
        | FStar_Extraction_ML_Syntax.MLE_Match (cond, pats) ->
            let cond1 =
              doc_of_expr currentModule (min_op_prec, NonAssoc) cond in
            let pats1 = FStar_List.map (doc_of_branch currentModule) pats in
            let doc1 =
              let uu____1992 =
                reduce1 [text "match"; parens cond1; text "with"] in
              uu____1992 :: pats1 in
            let doc2 = combine hardline doc1 in parens doc2
        | FStar_Extraction_ML_Syntax.MLE_Raise (exn, []) ->
            let uu____1997 =
              let uu____2000 =
                let uu____2003 =
                  let uu____2004 = ptctor currentModule exn in
                  text uu____2004 in
                [uu____2003] in
              (text "raise") :: uu____2000 in
            reduce1 uu____1997
        | FStar_Extraction_ML_Syntax.MLE_Raise (exn, args) ->
            let args1 =
              FStar_List.map
                (doc_of_expr currentModule (min_op_prec, NonAssoc)) args in
            let uu____2014 =
              let uu____2017 =
                let uu____2020 =
                  let uu____2021 = ptctor currentModule exn in
                  text uu____2021 in
                let uu____2022 =
                  let uu____2025 =
                    let uu____2026 = combine (text ", ") args1 in
                    parens uu____2026 in
                  [uu____2025] in
                uu____2020 :: uu____2022 in
              (text "raise") :: uu____2017 in
            reduce1 uu____2014
        | FStar_Extraction_ML_Syntax.MLE_Try (e1, pats) ->
            let uu____2049 =
              let uu____2052 =
                let uu____2055 =
                  doc_of_expr currentModule (min_op_prec, NonAssoc) e1 in
                let uu____2056 =
                  let uu____2059 =
                    let uu____2062 =
                      let uu____2063 =
                        FStar_List.map (doc_of_branch currentModule) pats in
                      combine hardline uu____2063 in
                    [uu____2062] in
                  (text "with") :: uu____2059 in
                uu____2055 :: uu____2056 in
              (text "try") :: uu____2052 in
            combine hardline uu____2049
        | FStar_Extraction_ML_Syntax.MLE_TApp (head, ty_args) ->
            doc_of_expr currentModule outer head
and (doc_of_binop :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlpath ->
      FStar_Extraction_ML_Syntax.mlexpr ->
        FStar_Extraction_ML_Syntax.mlexpr -> doc)
  =
  fun currentModule ->
    fun p ->
      fun e1 ->
        fun e2 ->
          let uu____2084 =
            let uu____2095 = as_bin_op p in FStar_Option.get uu____2095 in
          match uu____2084 with
          | (uu____2118, prio, txt) ->
              let e11 = doc_of_expr currentModule (prio, Left) e1 in
              let e21 = doc_of_expr currentModule (prio, Right) e2 in
              let doc1 = reduce1 [e11; text txt; e21] in parens doc1
and (doc_of_uniop :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlpath ->
      FStar_Extraction_ML_Syntax.mlexpr -> doc)
  =
  fun currentModule ->
    fun p ->
      fun e1 ->
        let uu____2135 =
          let uu____2140 = as_uni_op p in FStar_Option.get uu____2140 in
        match uu____2135 with
        | (uu____2151, txt) ->
            let e11 = doc_of_expr currentModule (min_op_prec, NonAssoc) e1 in
            let doc1 = reduce1 [text txt; parens e11] in parens doc1
and (doc_of_pattern :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlpattern -> doc)
  =
  fun currentModule ->
    fun pattern ->
      match pattern with
      | FStar_Extraction_ML_Syntax.MLP_Wild -> text "_"
      | FStar_Extraction_ML_Syntax.MLP_Const c ->
          let uu____2158 = string_of_mlconstant c in text uu____2158
      | FStar_Extraction_ML_Syntax.MLP_Var x -> text x
      | FStar_Extraction_ML_Syntax.MLP_Record (path, fields) ->
          let for1 uu____2187 =
            match uu____2187 with
            | (name, p) ->
                let uu____2194 =
                  let uu____2197 =
                    let uu____2198 = ptsym currentModule (path, name) in
                    text uu____2198 in
                  let uu____2201 =
                    let uu____2204 =
                      let uu____2207 = doc_of_pattern currentModule p in
                      [uu____2207] in
                    (text "=") :: uu____2204 in
                  uu____2197 :: uu____2201 in
                reduce1 uu____2194 in
          let uu____2208 =
            let uu____2209 = FStar_List.map for1 fields in
            combine (text "; ") uu____2209 in
          cbrackets uu____2208
      | FStar_Extraction_ML_Syntax.MLP_CTor (ctor, []) ->
          let name =
            let uu____2220 = is_standard_constructor ctor in
            if uu____2220
            then
              let uu____2221 =
                let uu____2226 = as_standard_constructor ctor in
                FStar_Option.get uu____2226 in
              FStar_Pervasives_Native.snd uu____2221
            else ptctor currentModule ctor in
          text name
      | FStar_Extraction_ML_Syntax.MLP_CTor (ctor, pats) ->
          let name =
            let uu____2245 = is_standard_constructor ctor in
            if uu____2245
            then
              let uu____2246 =
                let uu____2251 = as_standard_constructor ctor in
                FStar_Option.get uu____2251 in
              FStar_Pervasives_Native.snd uu____2246
            else ptctor currentModule ctor in
          let doc1 =
            match (name, pats) with
            | ("::", x::xs::[]) ->
                let uu____2270 =
                  let uu____2273 =
                    let uu____2274 = doc_of_pattern currentModule x in
                    parens uu____2274 in
                  let uu____2275 =
                    let uu____2278 =
                      let uu____2281 = doc_of_pattern currentModule xs in
                      [uu____2281] in
                    (text "::") :: uu____2278 in
                  uu____2273 :: uu____2275 in
                reduce uu____2270
            | (uu____2282, (FStar_Extraction_ML_Syntax.MLP_Tuple
               uu____2283)::[]) ->
                let uu____2288 =
                  let uu____2291 =
                    let uu____2294 =
                      let uu____2295 = FStar_List.hd pats in
                      doc_of_pattern currentModule uu____2295 in
                    [uu____2294] in
                  (text name) :: uu____2291 in
                reduce1 uu____2288
            | uu____2296 ->
                let uu____2303 =
                  let uu____2306 =
                    let uu____2309 =
                      let uu____2310 =
                        let uu____2311 =
                          FStar_List.map (doc_of_pattern currentModule) pats in
                        combine (text ", ") uu____2311 in
                      parens uu____2310 in
                    [uu____2309] in
                  (text name) :: uu____2306 in
                reduce1 uu____2303 in
          maybe_paren (min_op_prec, NonAssoc) e_app_prio doc1
      | FStar_Extraction_ML_Syntax.MLP_Tuple ps ->
          let ps1 = FStar_List.map (doc_of_pattern currentModule) ps in
          let uu____2324 = combine (text ", ") ps1 in parens uu____2324
      | FStar_Extraction_ML_Syntax.MLP_Branch ps ->
          let ps1 = FStar_List.map (doc_of_pattern currentModule) ps in
          let ps2 = FStar_List.map parens ps1 in combine (text " | ") ps2
and (doc_of_branch :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlbranch -> doc)
  =
  fun currentModule ->
    fun uu____2335 ->
      match uu____2335 with
      | (p, cond, e) ->
          let case =
            match cond with
            | FStar_Pervasives_Native.None ->
                let uu____2344 =
                  let uu____2347 =
                    let uu____2350 = doc_of_pattern currentModule p in
                    [uu____2350] in
                  (text "|") :: uu____2347 in
                reduce1 uu____2344
            | FStar_Pervasives_Native.Some c ->
                let c1 = doc_of_expr currentModule (min_op_prec, NonAssoc) c in
                let uu____2353 =
                  let uu____2356 =
                    let uu____2359 = doc_of_pattern currentModule p in
                    [uu____2359; text "when"; c1] in
                  (text "|") :: uu____2356 in
                reduce1 uu____2353 in
          let uu____2360 =
            let uu____2363 = reduce1 [case; text "->"; text "begin"] in
            let uu____2364 =
              let uu____2367 =
                doc_of_expr currentModule (min_op_prec, NonAssoc) e in
              [uu____2367; text "end"] in
            uu____2363 :: uu____2364 in
          combine hardline uu____2360
and (doc_of_lets :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    (FStar_Extraction_ML_Syntax.mlletflavor * Prims.bool *
      FStar_Extraction_ML_Syntax.mllb Prims.list) -> doc)
  =
  fun currentModule ->
    fun uu____2369 ->
      match uu____2369 with
      | (rec_, top_level, lets) ->
          let for1 uu____2390 =
            match uu____2390 with
            | { FStar_Extraction_ML_Syntax.mllb_name = name;
                FStar_Extraction_ML_Syntax.mllb_tysc = tys;
                FStar_Extraction_ML_Syntax.mllb_add_unit = uu____2393;
                FStar_Extraction_ML_Syntax.mllb_def = e;
                FStar_Extraction_ML_Syntax.mllb_meta = uu____2395;
                FStar_Extraction_ML_Syntax.print_typ = pt;_} ->
                let e1 = doc_of_expr currentModule (min_op_prec, NonAssoc) e in
                let ids = [] in
                let ty_annot =
                  if Prims.op_Negation pt
                  then text ""
                  else
                    (let uu____2405 =
                       (FStar_Extraction_ML_Util.codegen_fsharp ()) &&
                         ((rec_ = FStar_Extraction_ML_Syntax.Rec) ||
                            top_level) in
                     if uu____2405
                     then
                       match tys with
                       | FStar_Pervasives_Native.Some
                           (uu____2406::uu____2407, uu____2408) -> text ""
                       | FStar_Pervasives_Native.None -> text ""
                       | FStar_Pervasives_Native.Some ([], ty) ->
                           let ty1 =
                             doc_of_mltype currentModule
                               (min_op_prec, NonAssoc) ty in
                           reduce1 [text ":"; ty1]
                     else
                       if top_level
                       then
                         (match tys with
                          | FStar_Pervasives_Native.None -> text ""
                          | FStar_Pervasives_Native.Some ([], ty) ->
                              let ty1 =
                                doc_of_mltype currentModule
                                  (min_op_prec, NonAssoc) ty in
                              reduce1 [text ":"; ty1]
                          | FStar_Pervasives_Native.Some (vs, ty) ->
                              let ty1 =
                                doc_of_mltype currentModule
                                  (min_op_prec, NonAssoc) ty in
                              let vars =
                                let uu____2420 =
                                  FStar_All.pipe_right vs
                                    (FStar_List.map
                                       (fun x ->
                                          doc_of_mltype currentModule
                                            (min_op_prec, NonAssoc)
                                            (FStar_Extraction_ML_Syntax.MLTY_Var
                                               x))) in
                                FStar_All.pipe_right uu____2420 reduce1 in
                              reduce1 [text ":"; vars; text "."; ty1])
                       else text "") in
                let uu____2432 =
                  let uu____2435 =
                    let uu____2438 = reduce1 ids in
                    [uu____2438; ty_annot; text "="; e1] in
                  (text name) :: uu____2435 in
                reduce1 uu____2432 in
          let letdoc =
            if rec_ = FStar_Extraction_ML_Syntax.Rec
            then reduce1 [text "let"; text "rec"]
            else text "let" in
          let lets1 = FStar_List.map for1 lets in
          let lets2 =
            FStar_List.mapi
              (fun i ->
                 fun doc1 ->
                   reduce1
                     [if i = Prims.int_zero then letdoc else text "and";
                     doc1]) lets1 in
          combine hardline lets2
and (doc_of_loc : FStar_Extraction_ML_Syntax.mlloc -> doc) =
  fun uu____2452 ->
    match uu____2452 with
    | (lineno, file) ->
        let uu____2455 =
          ((FStar_Options.no_location_info ()) ||
             (FStar_Extraction_ML_Util.codegen_fsharp ()))
            || (file = "<dummy>") in
        if uu____2455
        then empty
        else
          (let file1 = FStar_Util.basename file in
           let uu____2458 =
             let uu____2461 =
               let uu____2464 = num lineno in
               [uu____2464;
               text (Prims.op_Hat "\"" (Prims.op_Hat file1 "\""))] in
             (text "#") :: uu____2461 in
           reduce1 uu____2458)
let (doc_of_mltydecl :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mltydecl -> doc)
  =
  fun currentModule ->
    fun decls ->
      let for1 uu____2498 =
        match uu____2498 with
        | (uu____2517, x, mangle_opt, tparams, uu____2521, body) ->
            let x1 =
              match mangle_opt with
              | FStar_Pervasives_Native.None -> x
              | FStar_Pervasives_Native.Some y -> y in
            let tparams1 =
              match tparams with
              | [] -> empty
              | x2::[] -> text x2
              | uu____2539 ->
                  let doc1 = FStar_List.map (fun x2 -> text x2) tparams in
                  let uu____2547 = combine (text ", ") doc1 in
                  parens uu____2547 in
            let forbody body1 =
              match body1 with
              | FStar_Extraction_ML_Syntax.MLTD_Abbrev ty ->
                  doc_of_mltype currentModule (min_op_prec, NonAssoc) ty
              | FStar_Extraction_ML_Syntax.MLTD_Record fields ->
                  let forfield uu____2571 =
                    match uu____2571 with
                    | (name, ty) ->
                        let name1 = text name in
                        let ty1 =
                          doc_of_mltype currentModule (min_op_prec, NonAssoc)
                            ty in
                        reduce1 [name1; text ":"; ty1] in
                  let uu____2580 =
                    let uu____2581 = FStar_List.map forfield fields in
                    combine (text "; ") uu____2581 in
                  cbrackets uu____2580
              | FStar_Extraction_ML_Syntax.MLTD_DType ctors ->
                  let forctor uu____2616 =
                    match uu____2616 with
                    | (name, tys) ->
                        let uu____2641 = FStar_List.split tys in
                        (match uu____2641 with
                         | (_names, tys1) ->
                             (match tys1 with
                              | [] -> text name
                              | uu____2660 ->
                                  let tys2 =
                                    FStar_List.map
                                      (doc_of_mltype currentModule
                                         (t_prio_tpl, Left)) tys1 in
                                  let tys3 = combine (text " * ") tys2 in
                                  reduce1 [text name; text "of"; tys3])) in
                  let ctors1 = FStar_List.map forctor ctors in
                  let ctors2 =
                    FStar_List.map (fun d -> reduce1 [text "|"; d]) ctors1 in
                  combine hardline ctors2 in
            let doc1 =
              let uu____2686 =
                let uu____2689 =
                  let uu____2692 =
                    let uu____2693 = ptsym currentModule ([], x1) in
                    text uu____2693 in
                  [uu____2692] in
                tparams1 :: uu____2689 in
              reduce1 uu____2686 in
            (match body with
             | FStar_Pervasives_Native.None -> doc1
             | FStar_Pervasives_Native.Some body1 ->
                 let body2 = forbody body1 in
                 let uu____2698 =
                   let uu____2701 = reduce1 [doc1; text "="] in
                   [uu____2701; body2] in
                 combine hardline uu____2698) in
      let doc1 = FStar_List.map for1 decls in
      let doc2 =
        if (FStar_List.length doc1) > Prims.int_zero
        then
          let uu____2706 =
            let uu____2709 =
              let uu____2712 = combine (text " \n and ") doc1 in [uu____2712] in
            (text "type") :: uu____2709 in
          reduce1 uu____2706
        else text "" in
      doc2
let rec (doc_of_sig1 :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlsig1 -> doc)
  =
  fun currentModule ->
    fun s ->
      match s with
      | FStar_Extraction_ML_Syntax.MLS_Mod (x, subsig) ->
          let uu____2738 =
            let uu____2741 = reduce1 [text "module"; text x; text "="] in
            let uu____2742 =
              let uu____2745 = doc_of_sig currentModule subsig in
              let uu____2746 =
                let uu____2749 = reduce1 [text "end"] in [uu____2749] in
              uu____2745 :: uu____2746 in
            uu____2741 :: uu____2742 in
          combine hardline uu____2738
      | FStar_Extraction_ML_Syntax.MLS_Exn (x, []) ->
          reduce1 [text "exception"; text x]
      | FStar_Extraction_ML_Syntax.MLS_Exn (x, args) ->
          let args1 =
            FStar_List.map
              (doc_of_mltype currentModule (min_op_prec, NonAssoc)) args in
          let args2 =
            let uu____2763 = combine (text " * ") args1 in parens uu____2763 in
          reduce1 [text "exception"; text x; text "of"; args2]
      | FStar_Extraction_ML_Syntax.MLS_Val (x, (uu____2765, ty)) ->
          let ty1 = doc_of_mltype currentModule (min_op_prec, NonAssoc) ty in
          reduce1 [text "val"; text x; text ": "; ty1]
      | FStar_Extraction_ML_Syntax.MLS_Ty decls ->
          doc_of_mltydecl currentModule decls
and (doc_of_sig :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlsig -> doc)
  =
  fun currentModule ->
    fun s ->
      let docs = FStar_List.map (doc_of_sig1 currentModule) s in
      let docs1 =
        FStar_List.map (fun x -> reduce [x; hardline; hardline]) docs in
      reduce docs1
let (doc_of_mod1 :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlmodule1 -> doc)
  =
  fun currentModule ->
    fun m ->
      match m with
      | FStar_Extraction_ML_Syntax.MLM_Exn (x, []) ->
          reduce1 [text "exception"; text x]
      | FStar_Extraction_ML_Syntax.MLM_Exn (x, args) ->
          let args1 = FStar_List.map FStar_Pervasives_Native.snd args in
          let args2 =
            FStar_List.map
              (doc_of_mltype currentModule (min_op_prec, NonAssoc)) args1 in
          let args3 =
            let uu____2825 = combine (text " * ") args2 in parens uu____2825 in
          reduce1 [text "exception"; text x; text "of"; args3]
      | FStar_Extraction_ML_Syntax.MLM_Ty decls ->
          doc_of_mltydecl currentModule decls
      | FStar_Extraction_ML_Syntax.MLM_Let (rec_, lets) ->
          doc_of_lets currentModule (rec_, true, lets)
      | FStar_Extraction_ML_Syntax.MLM_Top e ->
          let uu____2836 =
            let uu____2839 =
              let uu____2842 =
                let uu____2845 =
                  let uu____2848 =
                    doc_of_expr currentModule (min_op_prec, NonAssoc) e in
                  [uu____2848] in
                (text "=") :: uu____2845 in
              (text "_") :: uu____2842 in
            (text "let") :: uu____2839 in
          reduce1 uu____2836
      | FStar_Extraction_ML_Syntax.MLM_Loc loc -> doc_of_loc loc
let (doc_of_mod :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlmodule -> doc)
  =
  fun currentModule ->
    fun m ->
      let docs =
        FStar_List.map
          (fun x ->
             let doc1 = doc_of_mod1 currentModule x in
             [doc1;
             (match x with
              | FStar_Extraction_ML_Syntax.MLM_Loc uu____2872 -> empty
              | uu____2873 -> hardline);
             hardline]) m in
      reduce (FStar_List.flatten docs)
let (doc_of_mllib_r :
  FStar_Extraction_ML_Syntax.mllib -> (Prims.string * doc) Prims.list) =
  fun uu____2884 ->
    match uu____2884 with
    | FStar_Extraction_ML_Syntax.MLLib mllib ->
        let rec for1_sig uu____2950 =
          match uu____2950 with
          | (x, sigmod, FStar_Extraction_ML_Syntax.MLLib sub) ->
              let x1 = FStar_Extraction_ML_Util.flatten_mlpath x in
              let head =
                reduce1 [text "module"; text x1; text ":"; text "sig"] in
              let tail = reduce1 [text "end"] in
              let doc1 =
                FStar_Option.map
                  (fun uu____3005 ->
                     match uu____3005 with
                     | (s, uu____3011) -> doc_of_sig x1 s) sigmod in
              let sub1 = FStar_List.map for1_sig sub in
              let sub2 =
                FStar_List.map (fun x2 -> reduce [x2; hardline; hardline])
                  sub1 in
              let uu____3032 =
                let uu____3035 =
                  let uu____3038 =
                    let uu____3041 = reduce sub2 in
                    [uu____3041; cat tail hardline] in
                  (match doc1 with
                   | FStar_Pervasives_Native.None -> empty
                   | FStar_Pervasives_Native.Some s -> cat s hardline) ::
                    uu____3038 in
                (cat head hardline) :: uu____3035 in
              reduce uu____3032
        and for1_mod istop uu____3044 =
          match uu____3044 with
          | (mod_name, sigmod, FStar_Extraction_ML_Syntax.MLLib sub) ->
              let target_mod_name =
                FStar_Extraction_ML_Util.flatten_mlpath mod_name in
              let maybe_open_pervasives =
                match mod_name with
                | ("FStar"::[], "Pervasives") -> []
                | uu____3112 ->
                    let pervasives =
                      FStar_Extraction_ML_Util.flatten_mlpath
                        (["FStar"], "Pervasives") in
                    [hardline; text (Prims.op_Hat "open " pervasives)] in
              let head =
                let uu____3123 =
                  let uu____3126 = FStar_Extraction_ML_Util.codegen_fsharp () in
                  if uu____3126
                  then [text "module"; text target_mod_name]
                  else
                    if Prims.op_Negation istop
                    then
                      [text "module";
                      text target_mod_name;
                      text "=";
                      text "struct"]
                    else [] in
                reduce1 uu____3123 in
              let tail =
                if Prims.op_Negation istop
                then reduce1 [text "end"]
                else reduce1 [] in
              let doc1 =
                FStar_Option.map
                  (fun uu____3145 ->
                     match uu____3145 with
                     | (uu____3150, m) -> doc_of_mod target_mod_name m)
                  sigmod in
              let sub1 = FStar_List.map (for1_mod false) sub in
              let sub2 =
                FStar_List.map (fun x -> reduce [x; hardline; hardline]) sub1 in
              let prefix =
                let uu____3175 = FStar_Extraction_ML_Util.codegen_fsharp () in
                if uu____3175
                then [cat (text "#light \"off\"") hardline]
                else [] in
              let uu____3179 =
                let uu____3182 =
                  let uu____3185 =
                    let uu____3188 =
                      let uu____3191 =
                        let uu____3194 =
                          let uu____3197 = reduce sub2 in
                          [uu____3197; cat tail hardline] in
                        (match doc1 with
                         | FStar_Pervasives_Native.None -> empty
                         | FStar_Pervasives_Native.Some s -> cat s hardline)
                          :: uu____3194 in
                      hardline :: uu____3191 in
                    FStar_List.append maybe_open_pervasives uu____3188 in
                  FStar_List.append [head; hardline; text "open Prims"]
                    uu____3185 in
                FStar_List.append prefix uu____3182 in
              FStar_All.pipe_left reduce uu____3179 in
        let docs =
          FStar_List.map
            (fun uu____3236 ->
               match uu____3236 with
               | (x, s, m) ->
                   let uu____3286 = FStar_Extraction_ML_Util.flatten_mlpath x in
                   let uu____3287 = for1_mod true (x, s, m) in
                   (uu____3286, uu____3287)) mllib in
        docs
let (pretty : Prims.int -> doc -> Prims.string) =
  fun sz -> fun uu____3309 -> match uu____3309 with | Doc doc1 -> doc1
let (doc_of_mllib :
  FStar_Extraction_ML_Syntax.mllib -> (Prims.string * doc) Prims.list) =
  fun mllib -> doc_of_mllib_r mllib
let (string_of_mlexpr :
  FStar_Extraction_ML_Syntax.mlpath ->
    FStar_Extraction_ML_Syntax.mlexpr -> Prims.string)
  =
  fun cmod ->
    fun e ->
      let doc1 =
        let uu____3333 = FStar_Extraction_ML_Util.flatten_mlpath cmod in
        doc_of_expr uu____3333 (min_op_prec, NonAssoc) e in
      pretty Prims.int_zero doc1
let (string_of_mlty :
  FStar_Extraction_ML_Syntax.mlpath ->
    FStar_Extraction_ML_Syntax.mlty -> Prims.string)
  =
  fun cmod ->
    fun e ->
      let doc1 =
        let uu____3345 = FStar_Extraction_ML_Util.flatten_mlpath cmod in
        doc_of_mltype uu____3345 (min_op_prec, NonAssoc) e in
      pretty Prims.int_zero doc1