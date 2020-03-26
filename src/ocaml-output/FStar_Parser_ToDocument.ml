open Prims
let (maybe_unthunk : FStar_Parser_AST.term -> FStar_Parser_AST.term) =
  fun t  ->
    match t.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Abs (uu____8::[],body) -> body
    | uu____12 -> t
  
let (min : Prims.int -> Prims.int -> Prims.int) =
  fun x  -> fun y  -> if x > y then y else x 
let (max : Prims.int -> Prims.int -> Prims.int) =
  fun x  -> fun y  -> if x > y then x else y 
let map_rev : 'a 'b . ('a -> 'b) -> 'a Prims.list -> 'b Prims.list =
  fun f  ->
    fun l  ->
      let rec aux l1 acc =
        match l1 with
        | [] -> acc
        | x::xs ->
            let uu____112 = let uu____115 = f x  in uu____115 :: acc  in
            aux xs uu____112
         in
      aux l []
  
let map_if_all :
  'a 'b .
    ('a -> 'b FStar_Pervasives_Native.option) ->
      'a Prims.list -> 'b Prims.list FStar_Pervasives_Native.option
  =
  fun f  ->
    fun l  ->
      let rec aux l1 acc =
        match l1 with
        | [] -> acc
        | x::xs ->
            let uu____181 = f x  in
            (match uu____181 with
             | FStar_Pervasives_Native.Some r -> aux xs (r :: acc)
             | FStar_Pervasives_Native.None  -> [])
         in
      let r = aux l []  in
      if (FStar_List.length l) = (FStar_List.length r)
      then FStar_Pervasives_Native.Some r
      else FStar_Pervasives_Native.None
  
let rec all : 'a . ('a -> Prims.bool) -> 'a Prims.list -> Prims.bool =
  fun f  ->
    fun l  ->
      match l with
      | [] -> true
      | x::xs ->
          let uu____237 = f x  in if uu____237 then all f xs else false
  
let (all1_explicit :
  (FStar_Parser_AST.term * FStar_Parser_AST.imp) Prims.list -> Prims.bool) =
  fun args  ->
    (Prims.op_Negation (FStar_List.isEmpty args)) &&
      (FStar_Util.for_all
         (fun uu___0_274  ->
            match uu___0_274 with
            | (uu____280,FStar_Parser_AST.Nothing ) -> true
            | uu____282 -> false) args)
  
let (should_print_fs_typ_app : Prims.bool FStar_ST.ref) =
  FStar_Util.mk_ref false 
let (unfold_tuples : Prims.bool FStar_ST.ref) = FStar_Util.mk_ref true 
let with_fs_typ_app :
  'uuuuuu311 'uuuuuu312 .
    Prims.bool -> ('uuuuuu311 -> 'uuuuuu312) -> 'uuuuuu311 -> 'uuuuuu312
  =
  fun b  ->
    fun printer  ->
      fun t  ->
        let b0 = FStar_ST.op_Bang should_print_fs_typ_app  in
        FStar_ST.op_Colon_Equals should_print_fs_typ_app b;
        (let res = printer t  in
         FStar_ST.op_Colon_Equals should_print_fs_typ_app b0; res)
  
let (str : Prims.string -> FStar_Pprint.document) =
  fun s  -> FStar_Pprint.doc_of_string s 
let default_or_map :
  'uuuuuu422 'uuuuuu423 .
    'uuuuuu422 ->
      ('uuuuuu423 -> 'uuuuuu422) ->
        'uuuuuu423 FStar_Pervasives_Native.option -> 'uuuuuu422
  =
  fun n1  ->
    fun f  ->
      fun x  ->
        match x with
        | FStar_Pervasives_Native.None  -> n1
        | FStar_Pervasives_Native.Some x' -> f x'
  
let (prefix2 :
  FStar_Pprint.document -> FStar_Pprint.document -> FStar_Pprint.document) =
  fun prefix_  ->
    fun body  ->
      FStar_Pprint.prefix (Prims.of_int (2)) Prims.int_one prefix_ body
  
let (prefix2_nonempty :
  FStar_Pprint.document -> FStar_Pprint.document -> FStar_Pprint.document) =
  fun prefix_  ->
    fun body  ->
      if body = FStar_Pprint.empty then prefix_ else prefix2 prefix_ body
  
let (op_Hat_Slash_Plus_Hat :
  FStar_Pprint.document -> FStar_Pprint.document -> FStar_Pprint.document) =
  fun prefix_  -> fun body  -> prefix2 prefix_ body 
let (jump2 : FStar_Pprint.document -> FStar_Pprint.document) =
  fun body  -> FStar_Pprint.jump (Prims.of_int (2)) Prims.int_one body 
let (infix2 :
  FStar_Pprint.document ->
    FStar_Pprint.document -> FStar_Pprint.document -> FStar_Pprint.document)
  = FStar_Pprint.infix (Prims.of_int (2)) Prims.int_one 
let (infix0 :
  FStar_Pprint.document ->
    FStar_Pprint.document -> FStar_Pprint.document -> FStar_Pprint.document)
  = FStar_Pprint.infix Prims.int_zero Prims.int_one 
let (break1 : FStar_Pprint.document) = FStar_Pprint.break_ Prims.int_one 
let separate_break_map :
  'uuuuuu536 .
    FStar_Pprint.document ->
      ('uuuuuu536 -> FStar_Pprint.document) ->
        'uuuuuu536 Prims.list -> FStar_Pprint.document
  =
  fun sep  ->
    fun f  ->
      fun l  ->
        let uu____561 =
          let uu____562 =
            let uu____563 = FStar_Pprint.op_Hat_Hat sep break1  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____563  in
          FStar_Pprint.separate_map uu____562 f l  in
        FStar_Pprint.group uu____561
  
let precede_break_separate_map :
  'uuuuuu575 .
    FStar_Pprint.document ->
      FStar_Pprint.document ->
        ('uuuuuu575 -> FStar_Pprint.document) ->
          'uuuuuu575 Prims.list -> FStar_Pprint.document
  =
  fun prec  ->
    fun sep  ->
      fun f  ->
        fun l  ->
          let uu____605 =
            let uu____606 = FStar_Pprint.op_Hat_Hat prec FStar_Pprint.space
               in
            let uu____607 =
              let uu____608 = FStar_List.hd l  in
              FStar_All.pipe_right uu____608 f  in
            FStar_Pprint.precede uu____606 uu____607  in
          let uu____609 =
            let uu____610 = FStar_List.tl l  in
            FStar_Pprint.concat_map
              (fun x  ->
                 let uu____616 =
                   let uu____617 =
                     let uu____618 = f x  in
                     FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____618  in
                   FStar_Pprint.op_Hat_Hat sep uu____617  in
                 FStar_Pprint.op_Hat_Hat break1 uu____616) uu____610
             in
          FStar_Pprint.op_Hat_Hat uu____605 uu____609
  
let concat_break_map :
  'uuuuuu626 .
    ('uuuuuu626 -> FStar_Pprint.document) ->
      'uuuuuu626 Prims.list -> FStar_Pprint.document
  =
  fun f  ->
    fun l  ->
      let uu____646 =
        FStar_Pprint.concat_map
          (fun x  ->
             let uu____650 = f x  in FStar_Pprint.op_Hat_Hat uu____650 break1)
          l
         in
      FStar_Pprint.group uu____646
  
let (parens_with_nesting : FStar_Pprint.document -> FStar_Pprint.document) =
  fun contents  ->
    FStar_Pprint.surround (Prims.of_int (2)) Prims.int_zero
      FStar_Pprint.lparen contents FStar_Pprint.rparen
  
let (soft_parens_with_nesting :
  FStar_Pprint.document -> FStar_Pprint.document) =
  fun contents  ->
    FStar_Pprint.soft_surround (Prims.of_int (2)) Prims.int_zero
      FStar_Pprint.lparen contents FStar_Pprint.rparen
  
let (braces_with_nesting : FStar_Pprint.document -> FStar_Pprint.document) =
  fun contents  ->
    FStar_Pprint.surround (Prims.of_int (2)) Prims.int_one
      FStar_Pprint.lbrace contents FStar_Pprint.rbrace
  
let (soft_braces_with_nesting :
  FStar_Pprint.document -> FStar_Pprint.document) =
  fun contents  ->
    FStar_Pprint.soft_surround (Prims.of_int (2)) Prims.int_one
      FStar_Pprint.lbrace contents FStar_Pprint.rbrace
  
let (soft_braces_with_nesting_tight :
  FStar_Pprint.document -> FStar_Pprint.document) =
  fun contents  ->
    FStar_Pprint.soft_surround (Prims.of_int (2)) Prims.int_zero
      FStar_Pprint.lbrace contents FStar_Pprint.rbrace
  
let (brackets_with_nesting : FStar_Pprint.document -> FStar_Pprint.document)
  =
  fun contents  ->
    FStar_Pprint.surround (Prims.of_int (2)) Prims.int_one
      FStar_Pprint.lbracket contents FStar_Pprint.rbracket
  
let (soft_brackets_with_nesting :
  FStar_Pprint.document -> FStar_Pprint.document) =
  fun contents  ->
    FStar_Pprint.soft_surround (Prims.of_int (2)) Prims.int_one
      FStar_Pprint.lbracket contents FStar_Pprint.rbracket
  
let (soft_begin_end_with_nesting :
  FStar_Pprint.document -> FStar_Pprint.document) =
  fun contents  ->
    let uu____713 = str "begin"  in
    let uu____715 = str "end"  in
    FStar_Pprint.soft_surround (Prims.of_int (2)) Prims.int_one uu____713
      contents uu____715
  
let separate_map_last :
  'uuuuuu728 .
    FStar_Pprint.document ->
      (Prims.bool -> 'uuuuuu728 -> FStar_Pprint.document) ->
        'uuuuuu728 Prims.list -> FStar_Pprint.document
  =
  fun sep  ->
    fun f  ->
      fun es  ->
        let l = FStar_List.length es  in
        let es1 =
          FStar_List.mapi
            (fun i  -> fun e  -> f (i <> (l - Prims.int_one)) e) es
           in
        FStar_Pprint.separate sep es1
  
let separate_break_map_last :
  'uuuuuu780 .
    FStar_Pprint.document ->
      (Prims.bool -> 'uuuuuu780 -> FStar_Pprint.document) ->
        'uuuuuu780 Prims.list -> FStar_Pprint.document
  =
  fun sep  ->
    fun f  ->
      fun l  ->
        let uu____812 =
          let uu____813 =
            let uu____814 = FStar_Pprint.op_Hat_Hat sep break1  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____814  in
          separate_map_last uu____813 f l  in
        FStar_Pprint.group uu____812
  
let separate_map_or_flow :
  'uuuuuu824 .
    FStar_Pprint.document ->
      ('uuuuuu824 -> FStar_Pprint.document) ->
        'uuuuuu824 Prims.list -> FStar_Pprint.document
  =
  fun sep  ->
    fun f  ->
      fun l  ->
        if (FStar_List.length l) < (Prims.of_int (10))
        then FStar_Pprint.separate_map sep f l
        else FStar_Pprint.flow_map sep f l
  
let flow_map_last :
  'uuuuuu862 .
    FStar_Pprint.document ->
      (Prims.bool -> 'uuuuuu862 -> FStar_Pprint.document) ->
        'uuuuuu862 Prims.list -> FStar_Pprint.document
  =
  fun sep  ->
    fun f  ->
      fun es  ->
        let l = FStar_List.length es  in
        let es1 =
          FStar_List.mapi
            (fun i  -> fun e  -> f (i <> (l - Prims.int_one)) e) es
           in
        FStar_Pprint.flow sep es1
  
let separate_map_or_flow_last :
  'uuuuuu914 .
    FStar_Pprint.document ->
      (Prims.bool -> 'uuuuuu914 -> FStar_Pprint.document) ->
        'uuuuuu914 Prims.list -> FStar_Pprint.document
  =
  fun sep  ->
    fun f  ->
      fun l  ->
        if (FStar_List.length l) < (Prims.of_int (10))
        then separate_map_last sep f l
        else flow_map_last sep f l
  
let (separate_or_flow :
  FStar_Pprint.document ->
    FStar_Pprint.document Prims.list -> FStar_Pprint.document)
  = fun sep  -> fun l  -> separate_map_or_flow sep FStar_Pervasives.id l 
let (surround_maybe_empty :
  Prims.int ->
    Prims.int ->
      FStar_Pprint.document ->
        FStar_Pprint.document ->
          FStar_Pprint.document -> FStar_Pprint.document)
  =
  fun n1  ->
    fun b  ->
      fun doc1  ->
        fun doc2  ->
          fun doc3  ->
            if doc2 = FStar_Pprint.empty
            then
              let uu____996 = FStar_Pprint.op_Hat_Slash_Hat doc1 doc3  in
              FStar_Pprint.group uu____996
            else FStar_Pprint.surround n1 b doc1 doc2 doc3
  
let soft_surround_separate_map :
  'uuuuuu1018 .
    Prims.int ->
      Prims.int ->
        FStar_Pprint.document ->
          FStar_Pprint.document ->
            FStar_Pprint.document ->
              FStar_Pprint.document ->
                ('uuuuuu1018 -> FStar_Pprint.document) ->
                  'uuuuuu1018 Prims.list -> FStar_Pprint.document
  =
  fun n1  ->
    fun b  ->
      fun void_  ->
        fun opening  ->
          fun sep  ->
            fun closing  ->
              fun f  ->
                fun xs  ->
                  if xs = []
                  then void_
                  else
                    (let uu____1077 = FStar_Pprint.separate_map sep f xs  in
                     FStar_Pprint.soft_surround n1 b opening uu____1077
                       closing)
  
let soft_surround_map_or_flow :
  'uuuuuu1097 .
    Prims.int ->
      Prims.int ->
        FStar_Pprint.document ->
          FStar_Pprint.document ->
            FStar_Pprint.document ->
              FStar_Pprint.document ->
                ('uuuuuu1097 -> FStar_Pprint.document) ->
                  'uuuuuu1097 Prims.list -> FStar_Pprint.document
  =
  fun n1  ->
    fun b  ->
      fun void_  ->
        fun opening  ->
          fun sep  ->
            fun closing  ->
              fun f  ->
                fun xs  ->
                  if xs = []
                  then void_
                  else
                    (let uu____1156 = separate_map_or_flow sep f xs  in
                     FStar_Pprint.soft_surround n1 b opening uu____1156
                       closing)
  
let (is_unit : FStar_Parser_AST.term -> Prims.bool) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Const (FStar_Const.Const_unit ) -> true
    | uu____1166 -> false
  
let (matches_var : FStar_Parser_AST.term -> FStar_Ident.ident -> Prims.bool)
  =
  fun t  ->
    fun x  ->
      match t.FStar_Parser_AST.tm with
      | FStar_Parser_AST.Var y ->
          let uu____1182 = FStar_Ident.text_of_lid y  in
          x.FStar_Ident.idText = uu____1182
      | uu____1185 -> false
  
let (is_tuple_constructor : FStar_Ident.lident -> Prims.bool) =
  FStar_Parser_Const.is_tuple_data_lid' 
let (is_dtuple_constructor : FStar_Ident.lident -> Prims.bool) =
  FStar_Parser_Const.is_dtuple_data_lid' 
let (is_list_structure :
  FStar_Ident.lident ->
    FStar_Ident.lident -> FStar_Parser_AST.term -> Prims.bool)
  =
  fun cons_lid1  ->
    fun nil_lid1  ->
      let rec aux e =
        match e.FStar_Parser_AST.tm with
        | FStar_Parser_AST.Construct (lid,[]) ->
            FStar_Ident.lid_equals lid nil_lid1
        | FStar_Parser_AST.Construct (lid,uu____1236::(e2,uu____1238)::[]) ->
            (FStar_Ident.lid_equals lid cons_lid1) && (aux e2)
        | uu____1261 -> false  in
      aux
  
let (is_list : FStar_Parser_AST.term -> Prims.bool) =
  is_list_structure FStar_Parser_Const.cons_lid FStar_Parser_Const.nil_lid 
let (is_lex_list : FStar_Parser_AST.term -> Prims.bool) =
  is_list_structure FStar_Parser_Const.lexcons_lid
    FStar_Parser_Const.lextop_lid
  
let rec (extract_from_list :
  FStar_Parser_AST.term -> FStar_Parser_AST.term Prims.list) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Construct (uu____1285,[]) -> []
    | FStar_Parser_AST.Construct
        (uu____1296,(e1,FStar_Parser_AST.Nothing )::(e2,FStar_Parser_AST.Nothing
                                                     )::[])
        -> let uu____1317 = extract_from_list e2  in e1 :: uu____1317
    | uu____1320 ->
        let uu____1321 =
          let uu____1323 = FStar_Parser_AST.term_to_string e  in
          FStar_Util.format1 "Not a list %s" uu____1323  in
        failwith uu____1321
  
let (is_array : FStar_Parser_AST.term -> Prims.bool) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.App
        ({ FStar_Parser_AST.tm = FStar_Parser_AST.Var lid;
           FStar_Parser_AST.range = uu____1337;
           FStar_Parser_AST.level = uu____1338;_},l,FStar_Parser_AST.Nothing
         )
        ->
        (FStar_Ident.lid_equals lid FStar_Parser_Const.array_of_list_lid) &&
          (is_list l)
    | uu____1340 -> false
  
let rec (is_ref_set : FStar_Parser_AST.term -> Prims.bool) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Var maybe_empty_lid ->
        FStar_Ident.lid_equals maybe_empty_lid FStar_Parser_Const.set_empty
    | FStar_Parser_AST.App
        ({ FStar_Parser_AST.tm = FStar_Parser_AST.Var maybe_singleton_lid;
           FStar_Parser_AST.range = uu____1352;
           FStar_Parser_AST.level = uu____1353;_},{
                                                    FStar_Parser_AST.tm =
                                                      FStar_Parser_AST.App
                                                      ({
                                                         FStar_Parser_AST.tm
                                                           =
                                                           FStar_Parser_AST.Var
                                                           maybe_addr_of_lid;
                                                         FStar_Parser_AST.range
                                                           = uu____1355;
                                                         FStar_Parser_AST.level
                                                           = uu____1356;_},e1,FStar_Parser_AST.Nothing
                                                       );
                                                    FStar_Parser_AST.range =
                                                      uu____1358;
                                                    FStar_Parser_AST.level =
                                                      uu____1359;_},FStar_Parser_AST.Nothing
         )
        ->
        (FStar_Ident.lid_equals maybe_singleton_lid
           FStar_Parser_Const.set_singleton)
          &&
          (FStar_Ident.lid_equals maybe_addr_of_lid
             FStar_Parser_Const.heap_addr_of_lid)
    | FStar_Parser_AST.App
        ({
           FStar_Parser_AST.tm = FStar_Parser_AST.App
             ({ FStar_Parser_AST.tm = FStar_Parser_AST.Var maybe_union_lid;
                FStar_Parser_AST.range = uu____1361;
                FStar_Parser_AST.level = uu____1362;_},e1,FStar_Parser_AST.Nothing
              );
           FStar_Parser_AST.range = uu____1364;
           FStar_Parser_AST.level = uu____1365;_},e2,FStar_Parser_AST.Nothing
         )
        ->
        ((FStar_Ident.lid_equals maybe_union_lid FStar_Parser_Const.set_union)
           && (is_ref_set e1))
          && (is_ref_set e2)
    | uu____1367 -> false
  
let rec (extract_from_ref_set :
  FStar_Parser_AST.term -> FStar_Parser_AST.term Prims.list) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Var uu____1379 -> []
    | FStar_Parser_AST.App
        ({ FStar_Parser_AST.tm = FStar_Parser_AST.Var uu____1380;
           FStar_Parser_AST.range = uu____1381;
           FStar_Parser_AST.level = uu____1382;_},{
                                                    FStar_Parser_AST.tm =
                                                      FStar_Parser_AST.App
                                                      ({
                                                         FStar_Parser_AST.tm
                                                           =
                                                           FStar_Parser_AST.Var
                                                           uu____1383;
                                                         FStar_Parser_AST.range
                                                           = uu____1384;
                                                         FStar_Parser_AST.level
                                                           = uu____1385;_},e1,FStar_Parser_AST.Nothing
                                                       );
                                                    FStar_Parser_AST.range =
                                                      uu____1387;
                                                    FStar_Parser_AST.level =
                                                      uu____1388;_},FStar_Parser_AST.Nothing
         )
        -> [e1]
    | FStar_Parser_AST.App
        ({
           FStar_Parser_AST.tm = FStar_Parser_AST.App
             ({ FStar_Parser_AST.tm = FStar_Parser_AST.Var uu____1389;
                FStar_Parser_AST.range = uu____1390;
                FStar_Parser_AST.level = uu____1391;_},e1,FStar_Parser_AST.Nothing
              );
           FStar_Parser_AST.range = uu____1393;
           FStar_Parser_AST.level = uu____1394;_},e2,FStar_Parser_AST.Nothing
         )
        ->
        let uu____1396 = extract_from_ref_set e1  in
        let uu____1399 = extract_from_ref_set e2  in
        FStar_List.append uu____1396 uu____1399
    | uu____1402 ->
        let uu____1403 =
          let uu____1405 = FStar_Parser_AST.term_to_string e  in
          FStar_Util.format1 "Not a ref set %s" uu____1405  in
        failwith uu____1403
  
let (is_general_application : FStar_Parser_AST.term -> Prims.bool) =
  fun e  ->
    let uu____1417 = (is_array e) || (is_ref_set e)  in
    Prims.op_Negation uu____1417
  
let (is_general_construction : FStar_Parser_AST.term -> Prims.bool) =
  fun e  ->
    let uu____1426 = (is_list e) || (is_lex_list e)  in
    Prims.op_Negation uu____1426
  
let (is_general_prefix_op : FStar_Ident.ident -> Prims.bool) =
  fun op  ->
    let op_starting_char =
      let uu____1437 = FStar_Ident.text_of_id op  in
      FStar_Util.char_at uu____1437 Prims.int_zero  in
    ((op_starting_char = 33) || (op_starting_char = 63)) ||
      ((op_starting_char = 126) &&
         (let uu____1447 = FStar_Ident.text_of_id op  in uu____1447 <> "~"))
  
let (head_and_args :
  FStar_Parser_AST.term ->
    (FStar_Parser_AST.term * (FStar_Parser_AST.term * FStar_Parser_AST.imp)
      Prims.list))
  =
  fun e  ->
    let rec aux e1 acc =
      match e1.FStar_Parser_AST.tm with
      | FStar_Parser_AST.App (head1,arg,imp) -> aux head1 ((arg, imp) :: acc)
      | uu____1517 -> (e1, acc)  in
    aux e []
  
type associativity =
  | Left 
  | Right 
  | NonAssoc 
let (uu___is_Left : associativity -> Prims.bool) =
  fun projectee  ->
    match projectee with | Left  -> true | uu____1537 -> false
  
let (uu___is_Right : associativity -> Prims.bool) =
  fun projectee  ->
    match projectee with | Right  -> true | uu____1548 -> false
  
let (uu___is_NonAssoc : associativity -> Prims.bool) =
  fun projectee  ->
    match projectee with | NonAssoc  -> true | uu____1559 -> false
  
type token = (FStar_Char.char,Prims.string) FStar_Util.either
type associativity_level = (associativity * token Prims.list)
let (token_to_string :
  (FStar_BaseTypes.char,Prims.string) FStar_Util.either -> Prims.string) =
  fun uu___1_1585  ->
    match uu___1_1585 with
    | FStar_Util.Inl c -> Prims.op_Hat (FStar_Util.string_of_char c) ".*"
    | FStar_Util.Inr s -> s
  
let (matches_token :
  Prims.string ->
    (FStar_Char.char,Prims.string) FStar_Util.either -> Prims.bool)
  =
  fun s  ->
    fun uu___2_1620  ->
      match uu___2_1620 with
      | FStar_Util.Inl c ->
          let uu____1633 = FStar_String.get s Prims.int_zero  in
          uu____1633 = c
      | FStar_Util.Inr s' -> s = s'
  
let matches_level :
  'uuuuuu1649 .
    Prims.string ->
      ('uuuuuu1649 * (FStar_Char.char,Prims.string) FStar_Util.either
        Prims.list) -> Prims.bool
  =
  fun s  ->
    fun uu____1673  ->
      match uu____1673 with
      | (assoc_levels,tokens) ->
          let uu____1705 = FStar_List.tryFind (matches_token s) tokens  in
          uu____1705 <> FStar_Pervasives_Native.None
  
let (opinfix4 : associativity_level) = (Right, [FStar_Util.Inr "**"]) 
let (opinfix3 : associativity_level) =
  (Left, [FStar_Util.Inl 42; FStar_Util.Inl 47; FStar_Util.Inl 37]) 
let (opinfix2 : associativity_level) =
  (Left, [FStar_Util.Inl 43; FStar_Util.Inl 45]) 
let (minus_lvl : associativity_level) = (Left, [FStar_Util.Inr "-"]) 
let (opinfix1 : associativity_level) =
  (Right, [FStar_Util.Inl 64; FStar_Util.Inl 94]) 
let (pipe_right : associativity_level) = (Left, [FStar_Util.Inr "|>"]) 
let (opinfix0d : associativity_level) = (Left, [FStar_Util.Inl 36]) 
let (opinfix0c : associativity_level) =
  (Left, [FStar_Util.Inl 61; FStar_Util.Inl 60; FStar_Util.Inl 62]) 
let (equal : associativity_level) = (Left, [FStar_Util.Inr "="]) 
let (opinfix0b : associativity_level) = (Left, [FStar_Util.Inl 38]) 
let (opinfix0a : associativity_level) = (Left, [FStar_Util.Inl 124]) 
let (colon_equals : associativity_level) = (NonAssoc, [FStar_Util.Inr ":="]) 
let (amp : associativity_level) = (Right, [FStar_Util.Inr "&"]) 
let (colon_colon : associativity_level) = (Right, [FStar_Util.Inr "::"]) 
let (level_associativity_spec : associativity_level Prims.list) =
  [opinfix4;
  opinfix3;
  opinfix2;
  opinfix1;
  pipe_right;
  opinfix0d;
  opinfix0c;
  opinfix0b;
  opinfix0a;
  colon_equals;
  amp;
  colon_colon] 
let (level_table :
  ((Prims.int * Prims.int * Prims.int) * token Prims.list) Prims.list) =
  let levels_from_associativity l uu___3_1877 =
    match uu___3_1877 with
    | Left  -> (l, l, (l - Prims.int_one))
    | Right  -> ((l - Prims.int_one), l, l)
    | NonAssoc  -> ((l - Prims.int_one), l, (l - Prims.int_one))  in
  FStar_List.mapi
    (fun i  ->
       fun uu____1927  ->
         match uu____1927 with
         | (assoc1,tokens) -> ((levels_from_associativity i assoc1), tokens))
    level_associativity_spec
  
let (assign_levels :
  associativity_level Prims.list ->
    Prims.string -> (Prims.int * Prims.int * Prims.int))
  =
  fun token_associativity_spec  ->
    fun s  ->
      let uu____2002 = FStar_List.tryFind (matches_level s) level_table  in
      match uu____2002 with
      | FStar_Pervasives_Native.Some (assoc_levels,uu____2054) ->
          assoc_levels
      | uu____2092 -> failwith (Prims.op_Hat "Unrecognized operator " s)
  
let max_level :
  'uuuuuu2125 . ('uuuuuu2125 * token Prims.list) Prims.list -> Prims.int =
  fun l  ->
    let find_level_and_max n1 level =
      let uu____2174 =
        FStar_List.tryFind
          (fun uu____2210  ->
             match uu____2210 with
             | (uu____2227,tokens) ->
                 tokens = (FStar_Pervasives_Native.snd level)) level_table
         in
      match uu____2174 with
      | FStar_Pervasives_Native.Some ((uu____2256,l1,uu____2258),uu____2259)
          -> max n1 l1
      | FStar_Pervasives_Native.None  ->
          let uu____2309 =
            let uu____2311 =
              let uu____2313 =
                FStar_List.map token_to_string
                  (FStar_Pervasives_Native.snd level)
                 in
              FStar_String.concat "," uu____2313  in
            FStar_Util.format1 "Undefined associativity level %s" uu____2311
             in
          failwith uu____2309
       in
    FStar_List.fold_left find_level_and_max Prims.int_zero l
  
let (levels : Prims.string -> (Prims.int * Prims.int * Prims.int)) =
  fun op  ->
    let uu____2348 = assign_levels level_associativity_spec op  in
    match uu____2348 with
    | (left1,mine,right1) ->
        if op = "*"
        then ((left1 - Prims.int_one), mine, right1)
        else (left1, mine, right1)
  
let (operatorInfix0ad12 : associativity_level Prims.list) =
  [opinfix0a; opinfix0b; opinfix0c; opinfix0d; opinfix1; opinfix2] 
let (is_operatorInfix0ad12 : FStar_Ident.ident -> Prims.bool) =
  fun op  ->
    let uu____2407 =
      let uu____2410 =
        let uu____2416 = FStar_Ident.text_of_id op  in
        FStar_All.pipe_left matches_level uu____2416  in
      FStar_List.tryFind uu____2410 operatorInfix0ad12  in
    uu____2407 <> FStar_Pervasives_Native.None
  
let (is_operatorInfix34 : FStar_Ident.ident -> Prims.bool) =
  let opinfix34 = [opinfix3; opinfix4]  in
  fun op  ->
    let uu____2483 =
      let uu____2498 =
        let uu____2516 = FStar_Ident.text_of_id op  in
        FStar_All.pipe_left matches_level uu____2516  in
      FStar_List.tryFind uu____2498 opinfix34  in
    uu____2483 <> FStar_Pervasives_Native.None
  
let (handleable_args_length : FStar_Ident.ident -> Prims.int) =
  fun op  ->
    let op_s = FStar_Ident.text_of_id op  in
    let uu____2582 =
      (is_general_prefix_op op) || (FStar_List.mem op_s ["-"; "~"])  in
    if uu____2582
    then Prims.int_one
    else
      (let uu____2595 =
         ((is_operatorInfix0ad12 op) || (is_operatorInfix34 op)) ||
           (FStar_List.mem op_s
              ["<==>"; "==>"; "\\/"; "/\\"; "="; "|>"; ":="; ".()"; ".[]"])
          in
       if uu____2595
       then (Prims.of_int (2))
       else
         if FStar_List.mem op_s [".()<-"; ".[]<-"]
         then (Prims.of_int (3))
         else Prims.int_zero)
  
let handleable_op :
  'uuuuuu2641 . FStar_Ident.ident -> 'uuuuuu2641 Prims.list -> Prims.bool =
  fun op  ->
    fun args  ->
      match FStar_List.length args with
      | uu____2657 when uu____2657 = Prims.int_zero -> true
      | uu____2659 when uu____2659 = Prims.int_one ->
          (is_general_prefix_op op) ||
            (let uu____2661 = FStar_Ident.text_of_id op  in
             FStar_List.mem uu____2661 ["-"; "~"])
      | uu____2669 when uu____2669 = (Prims.of_int (2)) ->
          ((is_operatorInfix0ad12 op) || (is_operatorInfix34 op)) ||
            (let uu____2671 = FStar_Ident.text_of_id op  in
             FStar_List.mem uu____2671
               ["<==>"; "==>"; "\\/"; "/\\"; "="; "|>"; ":="; ".()"; ".[]"])
      | uu____2693 when uu____2693 = (Prims.of_int (3)) ->
          let uu____2694 = FStar_Ident.text_of_id op  in
          FStar_List.mem uu____2694 [".()<-"; ".[]<-"]
      | uu____2702 -> false
  
type annotation_style =
  | Binders of (Prims.int * Prims.int * Prims.bool) 
  | Arrows of (Prims.int * Prims.int) 
let (uu___is_Binders : annotation_style -> Prims.bool) =
  fun projectee  ->
    match projectee with | Binders _0 -> true | uu____2748 -> false
  
let (__proj__Binders__item___0 :
  annotation_style -> (Prims.int * Prims.int * Prims.bool)) =
  fun projectee  -> match projectee with | Binders _0 -> _0 
let (uu___is_Arrows : annotation_style -> Prims.bool) =
  fun projectee  ->
    match projectee with | Arrows _0 -> true | uu____2800 -> false
  
let (__proj__Arrows__item___0 : annotation_style -> (Prims.int * Prims.int))
  = fun projectee  -> match projectee with | Arrows _0 -> _0 
let (all_binders_annot : FStar_Parser_AST.term -> Prims.bool) =
  fun e  ->
    let is_binder_annot b =
      match b.FStar_Parser_AST.b with
      | FStar_Parser_AST.Annotated uu____2842 -> true
      | uu____2848 -> false  in
    let rec all_binders e1 l =
      match e1.FStar_Parser_AST.tm with
      | FStar_Parser_AST.Product (bs,tgt) ->
          let uu____2881 = FStar_List.for_all is_binder_annot bs  in
          if uu____2881
          then all_binders tgt (l + (FStar_List.length bs))
          else (false, Prims.int_zero)
      | uu____2896 -> (true, (l + Prims.int_one))  in
    let uu____2901 = all_binders e Prims.int_zero  in
    match uu____2901 with
    | (b,l) -> if b && (l > Prims.int_one) then true else false
  
type catf =
  FStar_Pprint.document -> FStar_Pprint.document -> FStar_Pprint.document
let (cat_with_colon :
  FStar_Pprint.document -> FStar_Pprint.document -> FStar_Pprint.document) =
  fun x  ->
    fun y  ->
      let uu____2940 = FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.colon y  in
      FStar_Pprint.op_Hat_Hat x uu____2940
  
let (comment_stack :
  (Prims.string * FStar_Range.range) Prims.list FStar_ST.ref) =
  FStar_Util.mk_ref [] 
type decl_meta =
  {
  r: FStar_Range.range ;
  has_qs: Prims.bool ;
  has_attrs: Prims.bool }
let (__proj__Mkdecl_meta__item__r : decl_meta -> FStar_Range.range) =
  fun projectee  -> match projectee with | { r; has_qs; has_attrs;_} -> r 
let (__proj__Mkdecl_meta__item__has_qs : decl_meta -> Prims.bool) =
  fun projectee  ->
    match projectee with | { r; has_qs; has_attrs;_} -> has_qs
  
let (__proj__Mkdecl_meta__item__has_attrs : decl_meta -> Prims.bool) =
  fun projectee  ->
    match projectee with | { r; has_qs; has_attrs;_} -> has_attrs
  
let (dummy_meta : decl_meta) =
  { r = FStar_Range.dummyRange; has_qs = false; has_attrs = false } 
let with_comment :
  'uuuuuu3029 .
    ('uuuuuu3029 -> FStar_Pprint.document) ->
      'uuuuuu3029 -> FStar_Range.range -> FStar_Pprint.document
  =
  fun printer  ->
    fun tm  ->
      fun tmrange  ->
        let rec comments_before_pos acc print_pos lookahead_pos =
          let uu____3071 = FStar_ST.op_Bang comment_stack  in
          match uu____3071 with
          | [] -> (acc, false)
          | (c,crange)::cs ->
              let comment =
                let uu____3142 = str c  in
                FStar_Pprint.op_Hat_Hat uu____3142 FStar_Pprint.hardline  in
              let uu____3143 = FStar_Range.range_before_pos crange print_pos
                 in
              if uu____3143
              then
                (FStar_ST.op_Colon_Equals comment_stack cs;
                 (let uu____3185 = FStar_Pprint.op_Hat_Hat acc comment  in
                  comments_before_pos uu____3185 print_pos lookahead_pos))
              else
                (let uu____3188 =
                   FStar_Range.range_before_pos crange lookahead_pos  in
                 (acc, uu____3188))
           in
        let uu____3191 =
          let uu____3197 =
            let uu____3198 = FStar_Range.start_of_range tmrange  in
            FStar_Range.end_of_line uu____3198  in
          let uu____3199 = FStar_Range.end_of_range tmrange  in
          comments_before_pos FStar_Pprint.empty uu____3197 uu____3199  in
        match uu____3191 with
        | (comments,has_lookahead) ->
            let printed_e = printer tm  in
            let comments1 =
              if has_lookahead
              then
                let pos = FStar_Range.end_of_range tmrange  in
                let uu____3208 = comments_before_pos comments pos pos  in
                FStar_Pervasives_Native.fst uu____3208
              else comments  in
            if comments1 = FStar_Pprint.empty
            then printed_e
            else
              (let uu____3220 = FStar_Pprint.op_Hat_Hat comments1 printed_e
                  in
               FStar_Pprint.group uu____3220)
  
let with_comment_sep :
  'uuuuuu3232 'uuuuuu3233 .
    ('uuuuuu3232 -> 'uuuuuu3233) ->
      'uuuuuu3232 ->
        FStar_Range.range -> (FStar_Pprint.document * 'uuuuuu3233)
  =
  fun printer  ->
    fun tm  ->
      fun tmrange  ->
        let rec comments_before_pos acc print_pos lookahead_pos =
          let uu____3279 = FStar_ST.op_Bang comment_stack  in
          match uu____3279 with
          | [] -> (acc, false)
          | (c,crange)::cs ->
              let comment = str c  in
              let uu____3350 = FStar_Range.range_before_pos crange print_pos
                 in
              if uu____3350
              then
                (FStar_ST.op_Colon_Equals comment_stack cs;
                 (let uu____3392 =
                    if acc = FStar_Pprint.empty
                    then comment
                    else
                      (let uu____3396 =
                         FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline
                           comment
                          in
                       FStar_Pprint.op_Hat_Hat acc uu____3396)
                     in
                  comments_before_pos uu____3392 print_pos lookahead_pos))
              else
                (let uu____3399 =
                   FStar_Range.range_before_pos crange lookahead_pos  in
                 (acc, uu____3399))
           in
        let uu____3402 =
          let uu____3408 =
            let uu____3409 = FStar_Range.start_of_range tmrange  in
            FStar_Range.end_of_line uu____3409  in
          let uu____3410 = FStar_Range.end_of_range tmrange  in
          comments_before_pos FStar_Pprint.empty uu____3408 uu____3410  in
        match uu____3402 with
        | (comments,has_lookahead) ->
            let printed_e = printer tm  in
            let comments1 =
              if has_lookahead
              then
                let pos = FStar_Range.end_of_range tmrange  in
                let uu____3423 = comments_before_pos comments pos pos  in
                FStar_Pervasives_Native.fst uu____3423
              else comments  in
            (comments1, printed_e)
  
let rec (place_comments_until_pos :
  Prims.int ->
    Prims.int ->
      FStar_Range.pos ->
        decl_meta ->
          FStar_Pprint.document ->
            Prims.bool -> Prims.bool -> FStar_Pprint.document)
  =
  fun k  ->
    fun lbegin  ->
      fun pos  ->
        fun meta_decl  ->
          fun doc  ->
            fun r  ->
              fun init1  ->
                let uu____3476 = FStar_ST.op_Bang comment_stack  in
                match uu____3476 with
                | (comment,crange)::cs when
                    FStar_Range.range_before_pos crange pos ->
                    (FStar_ST.op_Colon_Equals comment_stack cs;
                     (let lnum =
                        let uu____3570 =
                          let uu____3572 =
                            let uu____3574 =
                              FStar_Range.start_of_range crange  in
                            FStar_Range.line_of_pos uu____3574  in
                          uu____3572 - lbegin  in
                        max k uu____3570  in
                      let lnum1 = min (Prims.of_int (2)) lnum  in
                      let doc1 =
                        let uu____3579 =
                          let uu____3580 =
                            FStar_Pprint.repeat lnum1 FStar_Pprint.hardline
                             in
                          let uu____3581 = str comment  in
                          FStar_Pprint.op_Hat_Hat uu____3580 uu____3581  in
                        FStar_Pprint.op_Hat_Hat doc uu____3579  in
                      let uu____3582 =
                        let uu____3584 = FStar_Range.end_of_range crange  in
                        FStar_Range.line_of_pos uu____3584  in
                      place_comments_until_pos Prims.int_one uu____3582 pos
                        meta_decl doc1 true init1))
                | uu____3587 ->
                    if doc = FStar_Pprint.empty
                    then FStar_Pprint.empty
                    else
                      (let lnum =
                         let uu____3600 = FStar_Range.line_of_pos pos  in
                         uu____3600 - lbegin  in
                       let lnum1 = min (Prims.of_int (3)) lnum  in
                       let lnum2 =
                         if meta_decl.has_qs || meta_decl.has_attrs
                         then lnum1 - Prims.int_one
                         else lnum1  in
                       let lnum3 = max k lnum2  in
                       let lnum4 =
                         if meta_decl.has_qs && meta_decl.has_attrs
                         then (Prims.of_int (2))
                         else lnum3  in
                       let lnum5 =
                         if init1 then (Prims.of_int (2)) else lnum4  in
                       let uu____3628 =
                         FStar_Pprint.repeat lnum5 FStar_Pprint.hardline  in
                       FStar_Pprint.op_Hat_Hat doc uu____3628)
  
let separate_map_with_comments :
  'uuuuuu3642 .
    FStar_Pprint.document ->
      FStar_Pprint.document ->
        ('uuuuuu3642 -> FStar_Pprint.document) ->
          'uuuuuu3642 Prims.list ->
            ('uuuuuu3642 -> decl_meta) -> FStar_Pprint.document
  =
  fun prefix1  ->
    fun sep  ->
      fun f  ->
        fun xs  ->
          fun extract_meta  ->
            let fold_fun uu____3701 x =
              match uu____3701 with
              | (last_line,doc) ->
                  let meta_decl = extract_meta x  in
                  let r = meta_decl.r  in
                  let doc1 =
                    let uu____3720 = FStar_Range.start_of_range r  in
                    place_comments_until_pos Prims.int_one last_line
                      uu____3720 meta_decl doc false false
                     in
                  let uu____3724 =
                    let uu____3726 = FStar_Range.end_of_range r  in
                    FStar_Range.line_of_pos uu____3726  in
                  let uu____3727 =
                    let uu____3728 =
                      let uu____3729 = f x  in
                      FStar_Pprint.op_Hat_Hat sep uu____3729  in
                    FStar_Pprint.op_Hat_Hat doc1 uu____3728  in
                  (uu____3724, uu____3727)
               in
            let uu____3731 =
              let uu____3738 = FStar_List.hd xs  in
              let uu____3739 = FStar_List.tl xs  in (uu____3738, uu____3739)
               in
            match uu____3731 with
            | (x,xs1) ->
                let init1 =
                  let meta_decl = extract_meta x  in
                  let uu____3757 =
                    let uu____3759 = FStar_Range.end_of_range meta_decl.r  in
                    FStar_Range.line_of_pos uu____3759  in
                  let uu____3760 =
                    let uu____3761 = f x  in
                    FStar_Pprint.op_Hat_Hat prefix1 uu____3761  in
                  (uu____3757, uu____3760)  in
                let uu____3763 = FStar_List.fold_left fold_fun init1 xs1  in
                FStar_Pervasives_Native.snd uu____3763
  
let separate_map_with_comments_kw :
  'uuuuuu3790 'uuuuuu3791 .
    'uuuuuu3790 ->
      'uuuuuu3790 ->
        ('uuuuuu3790 -> 'uuuuuu3791 -> FStar_Pprint.document) ->
          'uuuuuu3791 Prims.list ->
            ('uuuuuu3791 -> decl_meta) -> FStar_Pprint.document
  =
  fun prefix1  ->
    fun sep  ->
      fun f  ->
        fun xs  ->
          fun extract_meta  ->
            let fold_fun uu____3855 x =
              match uu____3855 with
              | (last_line,doc) ->
                  let meta_decl = extract_meta x  in
                  let r = meta_decl.r  in
                  let doc1 =
                    let uu____3874 = FStar_Range.start_of_range r  in
                    place_comments_until_pos Prims.int_one last_line
                      uu____3874 meta_decl doc false false
                     in
                  let uu____3878 =
                    let uu____3880 = FStar_Range.end_of_range r  in
                    FStar_Range.line_of_pos uu____3880  in
                  let uu____3881 =
                    let uu____3882 = f sep x  in
                    FStar_Pprint.op_Hat_Hat doc1 uu____3882  in
                  (uu____3878, uu____3881)
               in
            let uu____3884 =
              let uu____3891 = FStar_List.hd xs  in
              let uu____3892 = FStar_List.tl xs  in (uu____3891, uu____3892)
               in
            match uu____3884 with
            | (x,xs1) ->
                let init1 =
                  let meta_decl = extract_meta x  in
                  let uu____3910 =
                    let uu____3912 = FStar_Range.end_of_range meta_decl.r  in
                    FStar_Range.line_of_pos uu____3912  in
                  let uu____3913 = f prefix1 x  in (uu____3910, uu____3913)
                   in
                let uu____3915 = FStar_List.fold_left fold_fun init1 xs1  in
                FStar_Pervasives_Native.snd uu____3915
  
let rec (p_decl : FStar_Parser_AST.decl -> FStar_Pprint.document) =
  fun d  ->
    let qualifiers =
      match ((d.FStar_Parser_AST.quals), (d.FStar_Parser_AST.d)) with
      | ((FStar_Parser_AST.Assumption )::[],FStar_Parser_AST.Assume
         (id1,uu____4871)) ->
          let uu____4874 =
            let uu____4876 =
              FStar_Util.char_at id1.FStar_Ident.idText Prims.int_zero  in
            FStar_All.pipe_right uu____4876 FStar_Util.is_upper  in
          if uu____4874
          then
            let uu____4882 = p_qualifier FStar_Parser_AST.Assumption  in
            FStar_Pprint.op_Hat_Hat uu____4882 FStar_Pprint.space
          else p_qualifiers d.FStar_Parser_AST.quals
      | uu____4885 -> p_qualifiers d.FStar_Parser_AST.quals  in
    let uu____4892 = p_attributes d.FStar_Parser_AST.attrs  in
    let uu____4893 =
      let uu____4894 = p_rawDecl d  in
      FStar_Pprint.op_Hat_Hat qualifiers uu____4894  in
    FStar_Pprint.op_Hat_Hat uu____4892 uu____4893

and (p_attributes : FStar_Parser_AST.attributes_ -> FStar_Pprint.document) =
  fun attrs  ->
    match attrs with
    | [] -> FStar_Pprint.empty
    | uu____4896 ->
        let uu____4897 =
          let uu____4898 = str "@ "  in
          let uu____4900 =
            let uu____4901 =
              let uu____4902 =
                let uu____4903 =
                  let uu____4904 = FStar_List.map p_atomicTerm attrs  in
                  FStar_Pprint.flow break1 uu____4904  in
                FStar_Pprint.op_Hat_Hat uu____4903 FStar_Pprint.rbracket  in
              FStar_Pprint.align uu____4902  in
            FStar_Pprint.op_Hat_Hat uu____4901 FStar_Pprint.hardline  in
          FStar_Pprint.op_Hat_Hat uu____4898 uu____4900  in
        FStar_Pprint.op_Hat_Hat FStar_Pprint.lbracket uu____4897

and (p_justSig : FStar_Parser_AST.decl -> FStar_Pprint.document) =
  fun d  ->
    match d.FStar_Parser_AST.d with
    | FStar_Parser_AST.Val (lid,t) ->
        let uu____4910 =
          let uu____4911 = str "val"  in
          let uu____4913 =
            let uu____4914 =
              let uu____4915 = p_lident lid  in
              let uu____4916 =
                FStar_Pprint.op_Hat_Hat FStar_Pprint.space FStar_Pprint.colon
                 in
              FStar_Pprint.op_Hat_Hat uu____4915 uu____4916  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____4914  in
          FStar_Pprint.op_Hat_Hat uu____4911 uu____4913  in
        let uu____4917 = p_typ false false t  in
        FStar_Pprint.op_Hat_Hat uu____4910 uu____4917
    | FStar_Parser_AST.TopLevelLet (uu____4920,lbs) ->
        FStar_Pprint.separate_map FStar_Pprint.hardline
          (fun lb  ->
             let uu____4945 =
               let uu____4946 = str "let"  in p_letlhs uu____4946 lb false
                in
             FStar_Pprint.group uu____4945) lbs
    | uu____4949 -> FStar_Pprint.empty

and (p_list :
  (FStar_Ident.ident -> FStar_Pprint.document) ->
    FStar_Pprint.document ->
      FStar_Ident.ident Prims.list -> FStar_Pprint.document)
  =
  fun f  ->
    fun sep  ->
      fun l  ->
        let rec p_list' uu___4_4964 =
          match uu___4_4964 with
          | [] -> FStar_Pprint.empty
          | x::[] -> f x
          | x::xs ->
              let uu____4972 = f x  in
              let uu____4973 =
                let uu____4974 = p_list' xs  in
                FStar_Pprint.op_Hat_Hat sep uu____4974  in
              FStar_Pprint.op_Hat_Hat uu____4972 uu____4973
           in
        let uu____4975 = str "["  in
        let uu____4977 =
          let uu____4978 = p_list' l  in
          let uu____4979 = str "]"  in
          FStar_Pprint.op_Hat_Hat uu____4978 uu____4979  in
        FStar_Pprint.op_Hat_Hat uu____4975 uu____4977

and (p_rawDecl : FStar_Parser_AST.decl -> FStar_Pprint.document) =
  fun d  ->
    match d.FStar_Parser_AST.d with
    | FStar_Parser_AST.Open uid ->
        let uu____4983 =
          let uu____4984 = str "open"  in
          let uu____4986 = p_quident uid  in
          FStar_Pprint.op_Hat_Slash_Hat uu____4984 uu____4986  in
        FStar_Pprint.group uu____4983
    | FStar_Parser_AST.Include uid ->
        let uu____4988 =
          let uu____4989 = str "include"  in
          let uu____4991 = p_quident uid  in
          FStar_Pprint.op_Hat_Slash_Hat uu____4989 uu____4991  in
        FStar_Pprint.group uu____4988
    | FStar_Parser_AST.Friend uid ->
        let uu____4993 =
          let uu____4994 = str "friend"  in
          let uu____4996 = p_quident uid  in
          FStar_Pprint.op_Hat_Slash_Hat uu____4994 uu____4996  in
        FStar_Pprint.group uu____4993
    | FStar_Parser_AST.ModuleAbbrev (uid1,uid2) ->
        let uu____4999 =
          let uu____5000 = str "module"  in
          let uu____5002 =
            let uu____5003 =
              let uu____5004 = p_uident uid1  in
              let uu____5005 =
                FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                  FStar_Pprint.equals
                 in
              FStar_Pprint.op_Hat_Hat uu____5004 uu____5005  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5003  in
          FStar_Pprint.op_Hat_Hat uu____5000 uu____5002  in
        let uu____5006 = p_quident uid2  in
        op_Hat_Slash_Plus_Hat uu____4999 uu____5006
    | FStar_Parser_AST.TopLevelModule uid ->
        let uu____5008 =
          let uu____5009 = str "module"  in
          let uu____5011 =
            let uu____5012 = p_quident uid  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5012  in
          FStar_Pprint.op_Hat_Hat uu____5009 uu____5011  in
        FStar_Pprint.group uu____5008
    | FStar_Parser_AST.Tycon
        (true ,uu____5013,(FStar_Parser_AST.TyconAbbrev
         (uid,tpars,FStar_Pervasives_Native.None ,t))::[])
        ->
        let effect_prefix_doc =
          let uu____5030 = str "effect"  in
          let uu____5032 =
            let uu____5033 = p_uident uid  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5033  in
          FStar_Pprint.op_Hat_Hat uu____5030 uu____5032  in
        let uu____5034 =
          let uu____5035 = p_typars tpars  in
          FStar_Pprint.surround (Prims.of_int (2)) Prims.int_one
            effect_prefix_doc uu____5035 FStar_Pprint.equals
           in
        let uu____5038 = p_typ false false t  in
        op_Hat_Slash_Plus_Hat uu____5034 uu____5038
    | FStar_Parser_AST.Tycon (false ,tc,tcdefs) ->
        let s = if tc then str "class" else str "type"  in
        let uu____5057 =
          let uu____5058 = FStar_List.hd tcdefs  in
          p_typeDeclWithKw s uu____5058  in
        let uu____5059 =
          let uu____5060 = FStar_List.tl tcdefs  in
          FStar_All.pipe_left
            (FStar_Pprint.concat_map
               (fun x  ->
                  let uu____5068 =
                    let uu____5069 = str "and"  in
                    p_typeDeclWithKw uu____5069 x  in
                  FStar_Pprint.op_Hat_Hat break1 uu____5068)) uu____5060
           in
        FStar_Pprint.op_Hat_Hat uu____5057 uu____5059
    | FStar_Parser_AST.TopLevelLet (q,lbs) ->
        let let_doc =
          let uu____5086 = str "let"  in
          let uu____5088 = p_letqualifier q  in
          FStar_Pprint.op_Hat_Hat uu____5086 uu____5088  in
        let uu____5089 = str "and"  in
        separate_map_with_comments_kw let_doc uu____5089 p_letbinding lbs
          (fun uu____5099  ->
             match uu____5099 with
             | (p,t) ->
                 let uu____5106 =
                   FStar_Range.union_ranges p.FStar_Parser_AST.prange
                     t.FStar_Parser_AST.range
                    in
                 { r = uu____5106; has_qs = false; has_attrs = false })
    | FStar_Parser_AST.Val (lid,t) ->
        let uu____5111 =
          let uu____5112 = str "val"  in
          let uu____5114 =
            let uu____5115 =
              let uu____5116 = p_lident lid  in
              let uu____5117 = sig_as_binders_if_possible t false  in
              FStar_Pprint.op_Hat_Hat uu____5116 uu____5117  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5115  in
          FStar_Pprint.op_Hat_Hat uu____5112 uu____5114  in
        FStar_All.pipe_left FStar_Pprint.group uu____5111
    | FStar_Parser_AST.Assume (id1,t) ->
        let decl_keyword =
          let uu____5122 =
            let uu____5124 =
              FStar_Util.char_at id1.FStar_Ident.idText Prims.int_zero  in
            FStar_All.pipe_right uu____5124 FStar_Util.is_upper  in
          if uu____5122
          then FStar_Pprint.empty
          else
            (let uu____5132 = str "val"  in
             FStar_Pprint.op_Hat_Hat uu____5132 FStar_Pprint.space)
           in
        let uu____5134 =
          let uu____5135 = p_ident id1  in
          let uu____5136 =
            let uu____5137 =
              let uu____5138 =
                let uu____5139 = p_typ false false t  in
                FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5139  in
              FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____5138  in
            FStar_Pprint.group uu____5137  in
          FStar_Pprint.op_Hat_Hat uu____5135 uu____5136  in
        FStar_Pprint.op_Hat_Hat decl_keyword uu____5134
    | FStar_Parser_AST.Exception (uid,t_opt) ->
        let uu____5148 = str "exception"  in
        let uu____5150 =
          let uu____5151 =
            let uu____5152 = p_uident uid  in
            let uu____5153 =
              FStar_Pprint.optional
                (fun t  ->
                   let uu____5157 =
                     let uu____5158 = str "of"  in
                     let uu____5160 = p_typ false false t  in
                     op_Hat_Slash_Plus_Hat uu____5158 uu____5160  in
                   FStar_Pprint.op_Hat_Hat break1 uu____5157) t_opt
               in
            FStar_Pprint.op_Hat_Hat uu____5152 uu____5153  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5151  in
        FStar_Pprint.op_Hat_Hat uu____5148 uu____5150
    | FStar_Parser_AST.NewEffect ne ->
        let uu____5164 = str "new_effect"  in
        let uu____5166 =
          let uu____5167 = p_newEffect ne  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5167  in
        FStar_Pprint.op_Hat_Hat uu____5164 uu____5166
    | FStar_Parser_AST.SubEffect se ->
        let uu____5169 = str "sub_effect"  in
        let uu____5171 =
          let uu____5172 = p_subEffect se  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5172  in
        FStar_Pprint.op_Hat_Hat uu____5169 uu____5171
    | FStar_Parser_AST.Pragma p -> p_pragma p
    | FStar_Parser_AST.Main uu____5174 ->
        failwith "*Main declaration* : Is that really still in use ??"
    | FStar_Parser_AST.Tycon (true ,uu____5176,uu____5177) ->
        failwith
          "Effect abbreviation is expected to be defined by an abbreviation"
    | FStar_Parser_AST.Splice (ids,t) ->
        let uu____5193 = str "%splice"  in
        let uu____5195 =
          let uu____5196 =
            let uu____5197 = str ";"  in p_list p_uident uu____5197 ids  in
          let uu____5199 =
            let uu____5200 = p_term false false t  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5200  in
          FStar_Pprint.op_Hat_Hat uu____5196 uu____5199  in
        FStar_Pprint.op_Hat_Hat uu____5193 uu____5195

and (p_pragma : FStar_Parser_AST.pragma -> FStar_Pprint.document) =
  fun uu___5_5203  ->
    match uu___5_5203 with
    | FStar_Parser_AST.SetOptions s ->
        let uu____5206 = str "#set-options"  in
        let uu____5208 =
          let uu____5209 =
            let uu____5210 = str s  in FStar_Pprint.dquotes uu____5210  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5209  in
        FStar_Pprint.op_Hat_Hat uu____5206 uu____5208
    | FStar_Parser_AST.ResetOptions s_opt ->
        let uu____5215 = str "#reset-options"  in
        let uu____5217 =
          FStar_Pprint.optional
            (fun s  ->
               let uu____5223 =
                 let uu____5224 = str s  in FStar_Pprint.dquotes uu____5224
                  in
               FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5223) s_opt
           in
        FStar_Pprint.op_Hat_Hat uu____5215 uu____5217
    | FStar_Parser_AST.PushOptions s_opt ->
        let uu____5229 = str "#push-options"  in
        let uu____5231 =
          FStar_Pprint.optional
            (fun s  ->
               let uu____5237 =
                 let uu____5238 = str s  in FStar_Pprint.dquotes uu____5238
                  in
               FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5237) s_opt
           in
        FStar_Pprint.op_Hat_Hat uu____5229 uu____5231
    | FStar_Parser_AST.PopOptions  -> str "#pop-options"
    | FStar_Parser_AST.RestartSolver  -> str "#restart-solver"
    | FStar_Parser_AST.LightOff  ->
        (FStar_ST.op_Colon_Equals should_print_fs_typ_app true;
         str "#light \"off\"")

and (p_typars : FStar_Parser_AST.binder Prims.list -> FStar_Pprint.document)
  = fun bs  -> p_binders true bs

and (p_typeDeclWithKw :
  FStar_Pprint.document -> FStar_Parser_AST.tycon -> FStar_Pprint.document) =
  fun kw  ->
    fun typedecl  ->
      let uu____5271 = p_typeDecl kw typedecl  in
      match uu____5271 with
      | (comm,decl,body,pre) ->
          if comm = FStar_Pprint.empty
          then
            let uu____5294 = pre body  in
            FStar_Pprint.op_Hat_Hat decl uu____5294
          else
            (let uu____5297 =
               let uu____5298 =
                 let uu____5299 =
                   let uu____5300 = pre body  in
                   FStar_Pprint.op_Hat_Slash_Hat uu____5300 comm  in
                 FStar_Pprint.op_Hat_Hat decl uu____5299  in
               let uu____5301 =
                 let uu____5302 =
                   let uu____5303 =
                     let uu____5304 =
                       let uu____5305 =
                         FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline body
                          in
                       FStar_Pprint.op_Hat_Hat comm uu____5305  in
                     FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline uu____5304
                      in
                   FStar_Pprint.nest (Prims.of_int (2)) uu____5303  in
                 FStar_Pprint.op_Hat_Hat decl uu____5302  in
               FStar_Pprint.ifflat uu____5298 uu____5301  in
             FStar_All.pipe_left FStar_Pprint.group uu____5297)

and (p_typeDecl :
  FStar_Pprint.document ->
    FStar_Parser_AST.tycon ->
      (FStar_Pprint.document * FStar_Pprint.document * FStar_Pprint.document
        * (FStar_Pprint.document -> FStar_Pprint.document)))
  =
  fun pre  ->
    fun uu___6_5308  ->
      match uu___6_5308 with
      | FStar_Parser_AST.TyconAbstract (lid,bs,typ_opt) ->
          let uu____5331 = p_typeDeclPrefix pre false lid bs typ_opt  in
          (FStar_Pprint.empty, uu____5331, FStar_Pprint.empty,
            FStar_Pervasives.id)
      | FStar_Parser_AST.TyconAbbrev (lid,bs,typ_opt,t) ->
          let uu____5348 = p_typ_sep false false t  in
          (match uu____5348 with
           | (comm,doc) ->
               let uu____5368 = p_typeDeclPrefix pre true lid bs typ_opt  in
               (comm, uu____5368, doc, jump2))
      | FStar_Parser_AST.TyconRecord (lid,bs,typ_opt,record_field_decls) ->
          let p_recordField ps uu____5412 =
            match uu____5412 with
            | (lid1,t) ->
                let uu____5420 =
                  let uu____5425 =
                    FStar_Range.extend_to_end_of_line
                      t.FStar_Parser_AST.range
                     in
                  with_comment_sep (p_recordFieldDecl ps) (lid1, t)
                    uu____5425
                   in
                (match uu____5420 with
                 | (comm,field) ->
                     let sep =
                       if ps then FStar_Pprint.semi else FStar_Pprint.empty
                        in
                     inline_comment_or_above comm field sep)
             in
          let p_fields =
            let uu____5437 =
              separate_map_last FStar_Pprint.hardline p_recordField
                record_field_decls
               in
            braces_with_nesting uu____5437  in
          let uu____5442 = p_typeDeclPrefix pre true lid bs typ_opt  in
          (FStar_Pprint.empty, uu____5442, p_fields,
            ((fun d  -> FStar_Pprint.op_Hat_Hat FStar_Pprint.space d)))
      | FStar_Parser_AST.TyconVariant (lid,bs,typ_opt,ct_decls) ->
          let p_constructorBranchAndComments uu____5497 =
            match uu____5497 with
            | (uid,t_opt,use_of) ->
                let range =
                  let uu____5517 =
                    let uu____5518 =
                      FStar_Util.map_opt t_opt
                        (fun t  -> t.FStar_Parser_AST.range)
                       in
                    FStar_Util.dflt uid.FStar_Ident.idRange uu____5518  in
                  FStar_Range.extend_to_end_of_line uu____5517  in
                let uu____5523 =
                  with_comment_sep p_constructorBranch (uid, t_opt, use_of)
                    range
                   in
                (match uu____5523 with
                 | (comm,ctor) ->
                     inline_comment_or_above comm ctor FStar_Pprint.empty)
             in
          let datacon_doc =
            FStar_Pprint.separate_map FStar_Pprint.hardline
              p_constructorBranchAndComments ct_decls
             in
          let uu____5552 = p_typeDeclPrefix pre true lid bs typ_opt  in
          (FStar_Pprint.empty, uu____5552, datacon_doc, jump2)

and (p_typeDeclPrefix :
  FStar_Pprint.document ->
    Prims.bool ->
      FStar_Ident.ident ->
        FStar_Parser_AST.binder Prims.list ->
          FStar_Parser_AST.knd FStar_Pervasives_Native.option ->
            FStar_Pprint.document)
  =
  fun kw  ->
    fun eq1  ->
      fun lid  ->
        fun bs  ->
          fun typ_opt  ->
            let with_kw cont =
              let lid_doc = p_ident lid  in
              let kw_lid =
                let uu____5580 = FStar_Pprint.op_Hat_Slash_Hat kw lid_doc  in
                FStar_Pprint.group uu____5580  in
              cont kw_lid  in
            let typ =
              let maybe_eq =
                if eq1 then FStar_Pprint.equals else FStar_Pprint.empty  in
              match typ_opt with
              | FStar_Pervasives_Native.None  -> maybe_eq
              | FStar_Pervasives_Native.Some t ->
                  let uu____5587 =
                    let uu____5588 =
                      let uu____5589 = p_typ false false t  in
                      FStar_Pprint.op_Hat_Slash_Hat uu____5589 maybe_eq  in
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5588  in
                  FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____5587
               in
            if bs = []
            then with_kw (fun n1  -> prefix2 n1 typ)
            else
              (let binders = p_binders_list true bs  in
               with_kw
                 (fun n1  ->
                    let uu____5609 =
                      let uu____5610 = FStar_Pprint.flow break1 binders  in
                      prefix2 n1 uu____5610  in
                    prefix2 uu____5609 typ))

and (p_recordFieldDecl :
  Prims.bool ->
    (FStar_Ident.ident * FStar_Parser_AST.term) -> FStar_Pprint.document)
  =
  fun ps  ->
    fun uu____5612  ->
      match uu____5612 with
      | (lid,t) ->
          let uu____5620 =
            let uu____5621 = p_lident lid  in
            let uu____5622 =
              let uu____5623 = p_typ ps false t  in
              FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____5623  in
            FStar_Pprint.op_Hat_Hat uu____5621 uu____5622  in
          FStar_Pprint.group uu____5620

and (p_constructorBranch :
  (FStar_Ident.ident * FStar_Parser_AST.term FStar_Pervasives_Native.option *
    Prims.bool) -> FStar_Pprint.document)
  =
  fun uu____5625  ->
    match uu____5625 with
    | (uid,t_opt,use_of) ->
        let sep = if use_of then str "of" else FStar_Pprint.colon  in
        let uid_doc =
          let uu____5650 =
            let uu____5651 =
              let uu____5652 = p_uident uid  in
              FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5652  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.bar uu____5651  in
          FStar_Pprint.group uu____5650  in
        default_or_map uid_doc
          (fun t  ->
             let uu____5656 =
               let uu____5657 =
                 let uu____5658 =
                   let uu____5659 =
                     let uu____5660 = p_typ false false t  in
                     FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5660
                      in
                   FStar_Pprint.op_Hat_Hat sep uu____5659  in
                 FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5658  in
               FStar_Pprint.op_Hat_Hat uid_doc uu____5657  in
             FStar_Pprint.group uu____5656) t_opt

and (p_letlhs :
  FStar_Pprint.document ->
    (FStar_Parser_AST.pattern * FStar_Parser_AST.term) ->
      Prims.bool -> FStar_Pprint.document)
  =
  fun kw  ->
    fun uu____5664  ->
      fun inner_let  ->
        match uu____5664 with
        | (pat,uu____5672) ->
            let uu____5673 =
              match pat.FStar_Parser_AST.pat with
              | FStar_Parser_AST.PatAscribed
                  (pat1,(t,FStar_Pervasives_Native.None )) ->
                  (pat1,
                    (FStar_Pervasives_Native.Some (t, FStar_Pprint.empty)))
              | FStar_Parser_AST.PatAscribed
                  (pat1,(t,FStar_Pervasives_Native.Some tac)) ->
                  let uu____5725 =
                    let uu____5732 =
                      let uu____5737 =
                        let uu____5738 =
                          let uu____5739 =
                            let uu____5740 = str "by"  in
                            let uu____5742 =
                              let uu____5743 =
                                p_atomicTerm (maybe_unthunk tac)  in
                              FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                                uu____5743
                               in
                            FStar_Pprint.op_Hat_Hat uu____5740 uu____5742  in
                          FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                            uu____5739
                           in
                        FStar_Pprint.group uu____5738  in
                      (t, uu____5737)  in
                    FStar_Pervasives_Native.Some uu____5732  in
                  (pat1, uu____5725)
              | uu____5754 -> (pat, FStar_Pervasives_Native.None)  in
            (match uu____5673 with
             | (pat1,ascr) ->
                 (match pat1.FStar_Parser_AST.pat with
                  | FStar_Parser_AST.PatApp
                      ({
                         FStar_Parser_AST.pat = FStar_Parser_AST.PatVar
                           (lid,uu____5780);
                         FStar_Parser_AST.prange = uu____5781;_},pats)
                      ->
                      let ascr_doc =
                        match ascr with
                        | FStar_Pervasives_Native.Some (t,tac) ->
                            let uu____5798 =
                              sig_as_binders_if_possible t true  in
                            FStar_Pprint.op_Hat_Hat uu____5798 tac
                        | FStar_Pervasives_Native.None  -> FStar_Pprint.empty
                         in
                      let uu____5804 =
                        if inner_let
                        then
                          let uu____5818 = pats_as_binders_if_possible pats
                             in
                          match uu____5818 with
                          | (bs,style) ->
                              ((FStar_List.append bs [ascr_doc]), style)
                        else
                          (let uu____5841 = pats_as_binders_if_possible pats
                              in
                           match uu____5841 with
                           | (bs,style) ->
                               ((FStar_List.append bs [ascr_doc]), style))
                         in
                      (match uu____5804 with
                       | (terms,style) ->
                           let uu____5868 =
                             let uu____5869 =
                               let uu____5870 =
                                 let uu____5871 = p_lident lid  in
                                 let uu____5872 =
                                   format_sig style terms true true  in
                                 FStar_Pprint.op_Hat_Hat uu____5871
                                   uu____5872
                                  in
                               FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                                 uu____5870
                                in
                             FStar_Pprint.op_Hat_Hat kw uu____5869  in
                           FStar_All.pipe_left FStar_Pprint.group uu____5868)
                  | uu____5875 ->
                      let ascr_doc =
                        match ascr with
                        | FStar_Pervasives_Native.Some (t,tac) ->
                            let uu____5883 =
                              let uu____5884 =
                                let uu____5885 =
                                  p_typ_top
                                    (Arrows
                                       ((Prims.of_int (2)),
                                         (Prims.of_int (2)))) false false t
                                   in
                                FStar_Pprint.op_Hat_Hat FStar_Pprint.colon
                                  uu____5885
                                 in
                              FStar_Pprint.group uu____5884  in
                            FStar_Pprint.op_Hat_Hat uu____5883 tac
                        | FStar_Pervasives_Native.None  -> FStar_Pprint.empty
                         in
                      let uu____5896 =
                        let uu____5897 =
                          let uu____5898 =
                            let uu____5899 = p_tuplePattern pat1  in
                            FStar_Pprint.op_Hat_Slash_Hat kw uu____5899  in
                          FStar_Pprint.group uu____5898  in
                        FStar_Pprint.op_Hat_Hat uu____5897 ascr_doc  in
                      FStar_Pprint.group uu____5896))

and (p_letbinding :
  FStar_Pprint.document ->
    (FStar_Parser_AST.pattern * FStar_Parser_AST.term) ->
      FStar_Pprint.document)
  =
  fun kw  ->
    fun uu____5901  ->
      match uu____5901 with
      | (pat,e) ->
          let doc_pat = p_letlhs kw (pat, e) false  in
          let uu____5910 = p_term_sep false false e  in
          (match uu____5910 with
           | (comm,doc_expr) ->
               let doc_expr1 =
                 inline_comment_or_above comm doc_expr FStar_Pprint.empty  in
               let uu____5920 =
                 let uu____5921 =
                   FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.equals
                     doc_expr1
                    in
                 FStar_Pprint.op_Hat_Slash_Hat doc_pat uu____5921  in
               let uu____5922 =
                 let uu____5923 =
                   let uu____5924 =
                     let uu____5925 =
                       let uu____5926 = jump2 doc_expr1  in
                       FStar_Pprint.op_Hat_Hat FStar_Pprint.equals uu____5926
                        in
                     FStar_Pprint.group uu____5925  in
                   FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5924  in
                 FStar_Pprint.op_Hat_Hat doc_pat uu____5923  in
               FStar_Pprint.ifflat uu____5920 uu____5922)

and (p_newEffect : FStar_Parser_AST.effect_decl -> FStar_Pprint.document) =
  fun uu___7_5927  ->
    match uu___7_5927 with
    | FStar_Parser_AST.RedefineEffect (lid,bs,t) ->
        p_effectRedefinition lid bs t
    | FStar_Parser_AST.DefineEffect (lid,bs,t,eff_decls) ->
        p_effectDefinition lid bs t eff_decls

and (p_effectRedefinition :
  FStar_Ident.ident ->
    FStar_Parser_AST.binder Prims.list ->
      FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun uid  ->
    fun bs  ->
      fun t  ->
        let uu____5952 = p_uident uid  in
        let uu____5953 = p_binders true bs  in
        let uu____5955 =
          let uu____5956 = p_simpleTerm false false t  in
          prefix2 FStar_Pprint.equals uu____5956  in
        surround_maybe_empty (Prims.of_int (2)) Prims.int_one uu____5952
          uu____5953 uu____5955

and (p_effectDefinition :
  FStar_Ident.ident ->
    FStar_Parser_AST.binder Prims.list ->
      FStar_Parser_AST.term ->
        FStar_Parser_AST.decl Prims.list -> FStar_Pprint.document)
  =
  fun uid  ->
    fun bs  ->
      fun t  ->
        fun eff_decls  ->
          let binders = p_binders true bs  in
          let uu____5971 =
            let uu____5972 =
              let uu____5973 =
                let uu____5974 = p_uident uid  in
                let uu____5975 = p_binders true bs  in
                let uu____5977 =
                  let uu____5978 = p_typ false false t  in
                  prefix2 FStar_Pprint.colon uu____5978  in
                surround_maybe_empty (Prims.of_int (2)) Prims.int_one
                  uu____5974 uu____5975 uu____5977
                 in
              FStar_Pprint.group uu____5973  in
            let uu____5983 =
              let uu____5984 = str "with"  in
              let uu____5986 =
                let uu____5987 =
                  let uu____5988 =
                    let uu____5989 =
                      let uu____5990 =
                        let uu____5991 =
                          FStar_Pprint.op_Hat_Hat FStar_Pprint.semi
                            FStar_Pprint.space
                           in
                        FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline
                          uu____5991
                         in
                      separate_map_last uu____5990 p_effectDecl eff_decls  in
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5989  in
                  FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5988  in
                FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline uu____5987  in
              FStar_Pprint.op_Hat_Hat uu____5984 uu____5986  in
            FStar_Pprint.op_Hat_Slash_Hat uu____5972 uu____5983  in
          braces_with_nesting uu____5971

and (p_effectDecl :
  Prims.bool -> FStar_Parser_AST.decl -> FStar_Pprint.document) =
  fun ps  ->
    fun d  ->
      match d.FStar_Parser_AST.d with
      | FStar_Parser_AST.Tycon
          (false ,uu____5995,(FStar_Parser_AST.TyconAbbrev
           (lid,[],FStar_Pervasives_Native.None ,e))::[])
          ->
          let uu____6008 =
            let uu____6009 = p_lident lid  in
            let uu____6010 =
              FStar_Pprint.op_Hat_Hat FStar_Pprint.space FStar_Pprint.equals
               in
            FStar_Pprint.op_Hat_Hat uu____6009 uu____6010  in
          let uu____6011 = p_simpleTerm ps false e  in
          prefix2 uu____6008 uu____6011
      | uu____6013 ->
          let uu____6014 =
            let uu____6016 = FStar_Parser_AST.decl_to_string d  in
            FStar_Util.format1
              "Not a declaration of an effect member... or at least I hope so : %s"
              uu____6016
             in
          failwith uu____6014

and (p_subEffect : FStar_Parser_AST.lift -> FStar_Pprint.document) =
  fun lift  ->
    let lift_op_doc =
      let lifts =
        match lift.FStar_Parser_AST.lift_op with
        | FStar_Parser_AST.NonReifiableLift t -> [("lift_wp", t)]
        | FStar_Parser_AST.ReifiableLift (t1,t2) ->
            [("lift_wp", t1); ("lift", t2)]
        | FStar_Parser_AST.LiftForFree t -> [("lift", t)]  in
      let p_lift ps uu____6099 =
        match uu____6099 with
        | (kwd,t) ->
            let uu____6110 =
              let uu____6111 = str kwd  in
              let uu____6112 =
                FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                  FStar_Pprint.equals
                 in
              FStar_Pprint.op_Hat_Hat uu____6111 uu____6112  in
            let uu____6113 = p_simpleTerm ps false t  in
            prefix2 uu____6110 uu____6113
         in
      separate_break_map_last FStar_Pprint.semi p_lift lifts  in
    let uu____6120 =
      let uu____6121 =
        let uu____6122 = p_quident lift.FStar_Parser_AST.msource  in
        let uu____6123 =
          let uu____6124 = str "~>"  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____6124  in
        FStar_Pprint.op_Hat_Hat uu____6122 uu____6123  in
      let uu____6126 = p_quident lift.FStar_Parser_AST.mdest  in
      prefix2 uu____6121 uu____6126  in
    let uu____6127 =
      let uu____6128 = braces_with_nesting lift_op_doc  in
      FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____6128  in
    FStar_Pprint.op_Hat_Hat uu____6120 uu____6127

and (p_qualifier : FStar_Parser_AST.qualifier -> FStar_Pprint.document) =
  fun uu___8_6129  ->
    match uu___8_6129 with
    | FStar_Parser_AST.Private  -> str "private"
    | FStar_Parser_AST.Abstract  -> str "abstract"
    | FStar_Parser_AST.Noeq  -> str "noeq"
    | FStar_Parser_AST.Unopteq  -> str "unopteq"
    | FStar_Parser_AST.Assumption  -> str "assume"
    | FStar_Parser_AST.DefaultEffect  -> str "default"
    | FStar_Parser_AST.TotalEffect  -> str "total"
    | FStar_Parser_AST.Effect_qual  -> FStar_Pprint.empty
    | FStar_Parser_AST.New  -> str "new"
    | FStar_Parser_AST.Inline  -> str "inline"
    | FStar_Parser_AST.Visible  -> FStar_Pprint.empty
    | FStar_Parser_AST.Unfold_for_unification_and_vcgen  -> str "unfold"
    | FStar_Parser_AST.Inline_for_extraction  -> str "inline_for_extraction"
    | FStar_Parser_AST.Irreducible  -> str "irreducible"
    | FStar_Parser_AST.NoExtract  -> str "noextract"
    | FStar_Parser_AST.Reifiable  -> str "reifiable"
    | FStar_Parser_AST.Reflectable  -> str "reflectable"
    | FStar_Parser_AST.Opaque  -> str "opaque"
    | FStar_Parser_AST.Logic  -> str "logic"

and (p_qualifiers : FStar_Parser_AST.qualifiers -> FStar_Pprint.document) =
  fun qs  ->
    match qs with
    | [] -> FStar_Pprint.empty
    | q::[] ->
        let uu____6149 = p_qualifier q  in
        FStar_Pprint.op_Hat_Hat uu____6149 FStar_Pprint.hardline
    | uu____6150 ->
        let uu____6151 =
          let uu____6152 = FStar_List.map p_qualifier qs  in
          FStar_Pprint.flow break1 uu____6152  in
        FStar_Pprint.op_Hat_Hat uu____6151 FStar_Pprint.hardline

and (p_letqualifier :
  FStar_Parser_AST.let_qualifier -> FStar_Pprint.document) =
  fun uu___9_6155  ->
    match uu___9_6155 with
    | FStar_Parser_AST.Rec  ->
        let uu____6156 = str "rec"  in
        FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____6156
    | FStar_Parser_AST.NoLetQualifier  -> FStar_Pprint.empty

and (p_aqual : FStar_Parser_AST.arg_qualifier -> FStar_Pprint.document) =
  fun uu___10_6158  ->
    match uu___10_6158 with
    | FStar_Parser_AST.Implicit  -> str "#"
    | FStar_Parser_AST.Equality  -> str "$"
    | FStar_Parser_AST.Meta t ->
        let t1 =
          match t.FStar_Parser_AST.tm with
          | FStar_Parser_AST.Abs (uu____6163,e) -> e
          | uu____6169 ->
              FStar_Parser_AST.mk_term
                (FStar_Parser_AST.App
                   (t,
                     (FStar_Parser_AST.unit_const t.FStar_Parser_AST.range),
                     FStar_Parser_AST.Nothing)) t.FStar_Parser_AST.range
                FStar_Parser_AST.Expr
           in
        let uu____6170 = str "#["  in
        let uu____6172 =
          let uu____6173 = p_term false false t1  in
          let uu____6176 =
            let uu____6177 = str "]"  in
            FStar_Pprint.op_Hat_Hat uu____6177 break1  in
          FStar_Pprint.op_Hat_Hat uu____6173 uu____6176  in
        FStar_Pprint.op_Hat_Hat uu____6170 uu____6172

and (p_disjunctivePattern :
  FStar_Parser_AST.pattern -> FStar_Pprint.document) =
  fun p  ->
    match p.FStar_Parser_AST.pat with
    | FStar_Parser_AST.PatOr pats ->
        let uu____6183 =
          let uu____6184 =
            let uu____6185 =
              FStar_Pprint.op_Hat_Hat FStar_Pprint.bar FStar_Pprint.space  in
            FStar_Pprint.op_Hat_Hat break1 uu____6185  in
          FStar_Pprint.separate_map uu____6184 p_tuplePattern pats  in
        FStar_Pprint.group uu____6183
    | uu____6186 -> p_tuplePattern p

and (p_tuplePattern : FStar_Parser_AST.pattern -> FStar_Pprint.document) =
  fun p  ->
    match p.FStar_Parser_AST.pat with
    | FStar_Parser_AST.PatTuple (pats,false ) ->
        let uu____6195 =
          let uu____6196 = FStar_Pprint.op_Hat_Hat FStar_Pprint.comma break1
             in
          FStar_Pprint.separate_map uu____6196 p_constructorPattern pats  in
        FStar_Pprint.group uu____6195
    | uu____6197 -> p_constructorPattern p

and (p_constructorPattern :
  FStar_Parser_AST.pattern -> FStar_Pprint.document) =
  fun p  ->
    match p.FStar_Parser_AST.pat with
    | FStar_Parser_AST.PatApp
        ({ FStar_Parser_AST.pat = FStar_Parser_AST.PatName maybe_cons_lid;
           FStar_Parser_AST.prange = uu____6200;_},hd1::tl1::[])
        when
        FStar_Ident.lid_equals maybe_cons_lid FStar_Parser_Const.cons_lid ->
        let uu____6205 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.colon FStar_Pprint.colon  in
        let uu____6206 = p_constructorPattern hd1  in
        let uu____6207 = p_constructorPattern tl1  in
        infix0 uu____6205 uu____6206 uu____6207
    | FStar_Parser_AST.PatApp
        ({ FStar_Parser_AST.pat = FStar_Parser_AST.PatName uid;
           FStar_Parser_AST.prange = uu____6209;_},pats)
        ->
        let uu____6215 = p_quident uid  in
        let uu____6216 =
          FStar_Pprint.separate_map break1 p_atomicPattern pats  in
        prefix2 uu____6215 uu____6216
    | uu____6217 -> p_atomicPattern p

and (p_atomicPattern : FStar_Parser_AST.pattern -> FStar_Pprint.document) =
  fun p  ->
    match p.FStar_Parser_AST.pat with
    | FStar_Parser_AST.PatAscribed (pat,(t,FStar_Pervasives_Native.None )) ->
        (match ((pat.FStar_Parser_AST.pat), (t.FStar_Parser_AST.tm)) with
         | (FStar_Parser_AST.PatVar (lid,aqual),FStar_Parser_AST.Refine
            ({ FStar_Parser_AST.b = FStar_Parser_AST.Annotated (lid',t1);
               FStar_Parser_AST.brange = uu____6233;
               FStar_Parser_AST.blevel = uu____6234;
               FStar_Parser_AST.aqual = uu____6235;_},phi))
             when lid.FStar_Ident.idText = lid'.FStar_Ident.idText ->
             let uu____6244 =
               let uu____6245 = p_ident lid  in
               p_refinement aqual uu____6245 t1 phi  in
             soft_parens_with_nesting uu____6244
         | (FStar_Parser_AST.PatWild aqual,FStar_Parser_AST.Refine
            ({ FStar_Parser_AST.b = FStar_Parser_AST.NoName t1;
               FStar_Parser_AST.brange = uu____6248;
               FStar_Parser_AST.blevel = uu____6249;
               FStar_Parser_AST.aqual = uu____6250;_},phi))
             ->
             let uu____6256 =
               p_refinement aqual FStar_Pprint.underscore t1 phi  in
             soft_parens_with_nesting uu____6256
         | uu____6257 ->
             let uu____6262 =
               let uu____6263 = p_tuplePattern pat  in
               let uu____6264 =
                 let uu____6265 = p_tmEqNoRefinement t  in
                 FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.colon uu____6265
                  in
               FStar_Pprint.op_Hat_Hat uu____6263 uu____6264  in
             soft_parens_with_nesting uu____6262)
    | FStar_Parser_AST.PatList pats ->
        let uu____6269 =
          separate_break_map FStar_Pprint.semi p_tuplePattern pats  in
        FStar_Pprint.surround (Prims.of_int (2)) Prims.int_zero
          FStar_Pprint.lbracket uu____6269 FStar_Pprint.rbracket
    | FStar_Parser_AST.PatRecord pats ->
        let p_recordFieldPat uu____6288 =
          match uu____6288 with
          | (lid,pat) ->
              let uu____6295 = p_qlident lid  in
              let uu____6296 = p_tuplePattern pat  in
              infix2 FStar_Pprint.equals uu____6295 uu____6296
           in
        let uu____6297 =
          separate_break_map FStar_Pprint.semi p_recordFieldPat pats  in
        soft_braces_with_nesting uu____6297
    | FStar_Parser_AST.PatTuple (pats,true ) ->
        let uu____6309 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.lparen FStar_Pprint.bar  in
        let uu____6310 =
          separate_break_map FStar_Pprint.comma p_constructorPattern pats  in
        let uu____6311 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.bar FStar_Pprint.rparen  in
        FStar_Pprint.surround (Prims.of_int (2)) Prims.int_one uu____6309
          uu____6310 uu____6311
    | FStar_Parser_AST.PatTvar (tv,arg_qualifier_opt) -> p_tvar tv
    | FStar_Parser_AST.PatOp op ->
        let uu____6322 =
          let uu____6323 =
            let uu____6324 =
              let uu____6325 = FStar_Ident.text_of_id op  in str uu____6325
               in
            let uu____6327 =
              FStar_Pprint.op_Hat_Hat FStar_Pprint.space FStar_Pprint.rparen
               in
            FStar_Pprint.op_Hat_Hat uu____6324 uu____6327  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____6323  in
        FStar_Pprint.op_Hat_Hat FStar_Pprint.lparen uu____6322
    | FStar_Parser_AST.PatWild aqual ->
        let uu____6331 = FStar_Pprint.optional p_aqual aqual  in
        FStar_Pprint.op_Hat_Hat uu____6331 FStar_Pprint.underscore
    | FStar_Parser_AST.PatConst c -> p_constant c
    | FStar_Parser_AST.PatVar (lid,aqual) ->
        let uu____6339 = FStar_Pprint.optional p_aqual aqual  in
        let uu____6340 = p_lident lid  in
        FStar_Pprint.op_Hat_Hat uu____6339 uu____6340
    | FStar_Parser_AST.PatName uid -> p_quident uid
    | FStar_Parser_AST.PatOr uu____6342 -> failwith "Inner or pattern !"
    | FStar_Parser_AST.PatApp
        ({ FStar_Parser_AST.pat = FStar_Parser_AST.PatName uu____6346;
           FStar_Parser_AST.prange = uu____6347;_},uu____6348)
        ->
        let uu____6353 = p_tuplePattern p  in
        soft_parens_with_nesting uu____6353
    | FStar_Parser_AST.PatTuple (uu____6354,false ) ->
        let uu____6361 = p_tuplePattern p  in
        soft_parens_with_nesting uu____6361
    | uu____6362 ->
        let uu____6363 =
          let uu____6365 = FStar_Parser_AST.pat_to_string p  in
          FStar_Util.format1 "Invalid pattern %s" uu____6365  in
        failwith uu____6363

and (is_typ_tuple : FStar_Parser_AST.term -> Prims.bool) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Op
        ({ FStar_Ident.idText = "*"; FStar_Ident.idRange = uu____6370;_},uu____6371)
        -> true
    | uu____6378 -> false

and (is_meta_qualifier :
  FStar_Parser_AST.arg_qualifier FStar_Pervasives_Native.option -> Prims.bool)
  =
  fun aq  ->
    match aq with
    | FStar_Pervasives_Native.Some (FStar_Parser_AST.Meta uu____6384) -> true
    | uu____6386 -> false

and (p_binder :
  Prims.bool -> FStar_Parser_AST.binder -> FStar_Pprint.document) =
  fun is_atomic  ->
    fun b  ->
      let uu____6393 = p_binder' is_atomic b  in
      match uu____6393 with
      | (b',t',catf) ->
          (match t' with
           | FStar_Pervasives_Native.Some typ -> catf b' typ
           | FStar_Pervasives_Native.None  -> b')

and (p_binder' :
  Prims.bool ->
    FStar_Parser_AST.binder ->
      (FStar_Pprint.document * FStar_Pprint.document
        FStar_Pervasives_Native.option * catf))
  =
  fun is_atomic  ->
    fun b  ->
      match b.FStar_Parser_AST.b with
      | FStar_Parser_AST.Variable lid ->
          let uu____6430 =
            let uu____6431 =
              FStar_Pprint.optional p_aqual b.FStar_Parser_AST.aqual  in
            let uu____6432 = p_lident lid  in
            FStar_Pprint.op_Hat_Hat uu____6431 uu____6432  in
          (uu____6430, FStar_Pervasives_Native.None, cat_with_colon)
      | FStar_Parser_AST.TVariable lid ->
          let uu____6438 = p_lident lid  in
          (uu____6438, FStar_Pervasives_Native.None, cat_with_colon)
      | FStar_Parser_AST.Annotated (lid,t) ->
          let uu____6445 =
            match t.FStar_Parser_AST.tm with
            | FStar_Parser_AST.Refine
                ({ FStar_Parser_AST.b = FStar_Parser_AST.Annotated (lid',t1);
                   FStar_Parser_AST.brange = uu____6456;
                   FStar_Parser_AST.blevel = uu____6457;
                   FStar_Parser_AST.aqual = uu____6458;_},phi)
                when lid.FStar_Ident.idText = lid'.FStar_Ident.idText ->
                let uu____6463 = p_lident lid  in
                p_refinement' b.FStar_Parser_AST.aqual uu____6463 t1 phi
            | uu____6464 ->
                let t' =
                  let uu____6466 = is_typ_tuple t  in
                  if uu____6466
                  then
                    let uu____6469 = p_tmFormula t  in
                    soft_parens_with_nesting uu____6469
                  else p_tmFormula t  in
                let uu____6472 =
                  let uu____6473 =
                    FStar_Pprint.optional p_aqual b.FStar_Parser_AST.aqual
                     in
                  let uu____6474 = p_lident lid  in
                  FStar_Pprint.op_Hat_Hat uu____6473 uu____6474  in
                (uu____6472, t')
             in
          (match uu____6445 with
           | (b',t') ->
               let catf =
                 let uu____6492 =
                   is_atomic || (is_meta_qualifier b.FStar_Parser_AST.aqual)
                    in
                 if uu____6492
                 then
                   fun x  ->
                     fun y  ->
                       let uu____6499 =
                         let uu____6500 =
                           let uu____6501 = cat_with_colon x y  in
                           FStar_Pprint.op_Hat_Hat uu____6501
                             FStar_Pprint.rparen
                            in
                         FStar_Pprint.op_Hat_Hat FStar_Pprint.lparen
                           uu____6500
                          in
                       FStar_Pprint.group uu____6499
                 else
                   (fun x  ->
                      fun y  ->
                        let uu____6506 = cat_with_colon x y  in
                        FStar_Pprint.group uu____6506)
                  in
               (b', (FStar_Pervasives_Native.Some t'), catf))
      | FStar_Parser_AST.TAnnotated uu____6511 ->
          failwith "Is this still used ?"
      | FStar_Parser_AST.NoName t ->
          (match t.FStar_Parser_AST.tm with
           | FStar_Parser_AST.Refine
               ({ FStar_Parser_AST.b = FStar_Parser_AST.NoName t1;
                  FStar_Parser_AST.brange = uu____6539;
                  FStar_Parser_AST.blevel = uu____6540;
                  FStar_Parser_AST.aqual = uu____6541;_},phi)
               ->
               let uu____6545 =
                 p_refinement' b.FStar_Parser_AST.aqual
                   FStar_Pprint.underscore t1 phi
                  in
               (match uu____6545 with
                | (b',t') ->
                    (b', (FStar_Pervasives_Native.Some t'), cat_with_colon))
           | uu____6566 ->
               if is_atomic
               then
                 let uu____6578 = p_atomicTerm t  in
                 (uu____6578, FStar_Pervasives_Native.None, cat_with_colon)
               else
                 (let uu____6585 = p_appTerm t  in
                  (uu____6585, FStar_Pervasives_Native.None, cat_with_colon)))

and (p_refinement :
  FStar_Parser_AST.arg_qualifier FStar_Pervasives_Native.option ->
    FStar_Pprint.document ->
      FStar_Parser_AST.term -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun aqual_opt  ->
    fun binder  ->
      fun t  ->
        fun phi  ->
          let uu____6596 = p_refinement' aqual_opt binder t phi  in
          match uu____6596 with | (b,typ) -> cat_with_colon b typ

and (p_refinement' :
  FStar_Parser_AST.arg_qualifier FStar_Pervasives_Native.option ->
    FStar_Pprint.document ->
      FStar_Parser_AST.term ->
        FStar_Parser_AST.term ->
          (FStar_Pprint.document * FStar_Pprint.document))
  =
  fun aqual_opt  ->
    fun binder  ->
      fun t  ->
        fun phi  ->
          let is_t_atomic =
            match t.FStar_Parser_AST.tm with
            | FStar_Parser_AST.Construct uu____6612 -> false
            | FStar_Parser_AST.App uu____6624 -> false
            | FStar_Parser_AST.Op uu____6632 -> false
            | uu____6640 -> true  in
          let uu____6642 = p_noSeqTerm false false phi  in
          match uu____6642 with
          | (comm,phi1) ->
              let phi2 =
                if comm = FStar_Pprint.empty
                then phi1
                else
                  (let uu____6659 =
                     FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline phi1  in
                   FStar_Pprint.op_Hat_Hat comm uu____6659)
                 in
              let jump_break =
                if is_t_atomic then Prims.int_zero else Prims.int_one  in
              let uu____6668 =
                let uu____6669 = FStar_Pprint.optional p_aqual aqual_opt  in
                FStar_Pprint.op_Hat_Hat uu____6669 binder  in
              let uu____6670 =
                let uu____6671 = p_appTerm t  in
                let uu____6672 =
                  let uu____6673 =
                    let uu____6674 =
                      let uu____6675 = soft_braces_with_nesting_tight phi2
                         in
                      let uu____6676 = soft_braces_with_nesting phi2  in
                      FStar_Pprint.ifflat uu____6675 uu____6676  in
                    FStar_Pprint.group uu____6674  in
                  FStar_Pprint.jump (Prims.of_int (2)) jump_break uu____6673
                   in
                FStar_Pprint.op_Hat_Hat uu____6671 uu____6672  in
              (uu____6668, uu____6670)

and (p_binders_list :
  Prims.bool ->
    FStar_Parser_AST.binder Prims.list -> FStar_Pprint.document Prims.list)
  = fun is_atomic  -> fun bs  -> FStar_List.map (p_binder is_atomic) bs

and (p_binders :
  Prims.bool -> FStar_Parser_AST.binder Prims.list -> FStar_Pprint.document)
  =
  fun is_atomic  ->
    fun bs  ->
      let uu____6690 = p_binders_list is_atomic bs  in
      separate_or_flow break1 uu____6690

and (text_of_id_or_underscore : FStar_Ident.ident -> FStar_Pprint.document) =
  fun lid  ->
    let uu____6694 =
      (FStar_Util.starts_with lid.FStar_Ident.idText
         FStar_Ident.reserved_prefix)
        &&
        (let uu____6697 = FStar_Options.print_real_names ()  in
         Prims.op_Negation uu____6697)
       in
    if uu____6694
    then FStar_Pprint.underscore
    else (let uu____6702 = FStar_Ident.text_of_id lid  in str uu____6702)

and (text_of_lid_or_underscore : FStar_Ident.lident -> FStar_Pprint.document)
  =
  fun lid  ->
    let uu____6705 =
      (FStar_Util.starts_with (lid.FStar_Ident.ident).FStar_Ident.idText
         FStar_Ident.reserved_prefix)
        &&
        (let uu____6708 = FStar_Options.print_real_names ()  in
         Prims.op_Negation uu____6708)
       in
    if uu____6705
    then FStar_Pprint.underscore
    else (let uu____6713 = FStar_Ident.text_of_lid lid  in str uu____6713)

and (p_qlident : FStar_Ident.lid -> FStar_Pprint.document) =
  fun lid  -> text_of_lid_or_underscore lid

and (p_quident : FStar_Ident.lid -> FStar_Pprint.document) =
  fun lid  -> text_of_lid_or_underscore lid

and (p_ident : FStar_Ident.ident -> FStar_Pprint.document) =
  fun lid  -> text_of_id_or_underscore lid

and (p_lident : FStar_Ident.ident -> FStar_Pprint.document) =
  fun lid  -> text_of_id_or_underscore lid

and (p_uident : FStar_Ident.ident -> FStar_Pprint.document) =
  fun lid  -> text_of_id_or_underscore lid

and (p_tvar : FStar_Ident.ident -> FStar_Pprint.document) =
  fun lid  -> text_of_id_or_underscore lid

and (paren_if : Prims.bool -> FStar_Pprint.document -> FStar_Pprint.document)
  = fun b  -> if b then soft_parens_with_nesting else (fun x  -> x)

and (inline_comment_or_above :
  FStar_Pprint.document ->
    FStar_Pprint.document -> FStar_Pprint.document -> FStar_Pprint.document)
  =
  fun comm  ->
    fun doc  ->
      fun sep  ->
        if comm = FStar_Pprint.empty
        then
          let uu____6734 = FStar_Pprint.op_Hat_Hat doc sep  in
          FStar_Pprint.group uu____6734
        else
          (let uu____6737 =
             let uu____6738 =
               let uu____6739 =
                 let uu____6740 =
                   let uu____6741 = FStar_Pprint.op_Hat_Hat break1 comm  in
                   FStar_Pprint.op_Hat_Hat sep uu____6741  in
                 FStar_Pprint.op_Hat_Hat doc uu____6740  in
               FStar_Pprint.group uu____6739  in
             let uu____6742 =
               let uu____6743 =
                 let uu____6744 = FStar_Pprint.op_Hat_Hat doc sep  in
                 FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline uu____6744  in
               FStar_Pprint.op_Hat_Hat comm uu____6743  in
             FStar_Pprint.ifflat uu____6738 uu____6742  in
           FStar_All.pipe_left FStar_Pprint.group uu____6737)

and (p_term :
  Prims.bool -> Prims.bool -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun ps  ->
    fun pb  ->
      fun e  ->
        match e.FStar_Parser_AST.tm with
        | FStar_Parser_AST.Seq (e1,e2) ->
            let uu____6752 = p_noSeqTerm true false e1  in
            (match uu____6752 with
             | (comm,t1) ->
                 let uu____6761 =
                   inline_comment_or_above comm t1 FStar_Pprint.semi  in
                 let uu____6762 =
                   let uu____6763 = p_term ps pb e2  in
                   FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline uu____6763
                    in
                 FStar_Pprint.op_Hat_Hat uu____6761 uu____6762)
        | FStar_Parser_AST.Bind (x,e1,e2) ->
            let uu____6767 =
              let uu____6768 =
                let uu____6769 =
                  let uu____6770 = p_lident x  in
                  let uu____6771 =
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                      FStar_Pprint.long_left_arrow
                     in
                  FStar_Pprint.op_Hat_Hat uu____6770 uu____6771  in
                let uu____6772 =
                  let uu____6773 = p_noSeqTermAndComment true false e1  in
                  let uu____6776 =
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                      FStar_Pprint.semi
                     in
                  FStar_Pprint.op_Hat_Hat uu____6773 uu____6776  in
                op_Hat_Slash_Plus_Hat uu____6769 uu____6772  in
              FStar_Pprint.group uu____6768  in
            let uu____6777 = p_term ps pb e2  in
            FStar_Pprint.op_Hat_Slash_Hat uu____6767 uu____6777
        | uu____6778 ->
            let uu____6779 = p_noSeqTermAndComment ps pb e  in
            FStar_Pprint.group uu____6779

and (p_term_sep :
  Prims.bool ->
    Prims.bool ->
      FStar_Parser_AST.term ->
        (FStar_Pprint.document * FStar_Pprint.document))
  =
  fun ps  ->
    fun pb  ->
      fun e  ->
        match e.FStar_Parser_AST.tm with
        | FStar_Parser_AST.Seq (e1,e2) ->
            let uu____6791 = p_noSeqTerm true false e1  in
            (match uu____6791 with
             | (comm,t1) ->
                 let uu____6804 =
                   let uu____6805 =
                     let uu____6806 =
                       FStar_Pprint.op_Hat_Hat t1 FStar_Pprint.semi  in
                     FStar_Pprint.group uu____6806  in
                   let uu____6807 =
                     let uu____6808 = p_term ps pb e2  in
                     FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline uu____6808
                      in
                   FStar_Pprint.op_Hat_Hat uu____6805 uu____6807  in
                 (comm, uu____6804))
        | FStar_Parser_AST.Bind (x,e1,e2) ->
            let uu____6812 =
              let uu____6813 =
                let uu____6814 =
                  let uu____6815 =
                    let uu____6816 = p_lident x  in
                    let uu____6817 =
                      FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                        FStar_Pprint.long_left_arrow
                       in
                    FStar_Pprint.op_Hat_Hat uu____6816 uu____6817  in
                  let uu____6818 =
                    let uu____6819 = p_noSeqTermAndComment true false e1  in
                    let uu____6822 =
                      FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                        FStar_Pprint.semi
                       in
                    FStar_Pprint.op_Hat_Hat uu____6819 uu____6822  in
                  op_Hat_Slash_Plus_Hat uu____6815 uu____6818  in
                FStar_Pprint.group uu____6814  in
              let uu____6823 = p_term ps pb e2  in
              FStar_Pprint.op_Hat_Slash_Hat uu____6813 uu____6823  in
            (FStar_Pprint.empty, uu____6812)
        | uu____6824 -> p_noSeqTerm ps pb e

and (p_noSeqTerm :
  Prims.bool ->
    Prims.bool ->
      FStar_Parser_AST.term ->
        (FStar_Pprint.document * FStar_Pprint.document))
  =
  fun ps  ->
    fun pb  ->
      fun e  ->
        with_comment_sep (p_noSeqTerm' ps pb) e e.FStar_Parser_AST.range

and (p_noSeqTermAndComment :
  Prims.bool -> Prims.bool -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun ps  ->
    fun pb  ->
      fun e  -> with_comment (p_noSeqTerm' ps pb) e e.FStar_Parser_AST.range

and (p_noSeqTerm' :
  Prims.bool -> Prims.bool -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun ps  ->
    fun pb  ->
      fun e  ->
        match e.FStar_Parser_AST.tm with
        | FStar_Parser_AST.Ascribed (e1,t,FStar_Pervasives_Native.None ) ->
            let uu____6844 =
              let uu____6845 = p_tmIff e1  in
              let uu____6846 =
                let uu____6847 =
                  let uu____6848 = p_typ ps pb t  in
                  FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.colon uu____6848
                   in
                FStar_Pprint.op_Hat_Hat FStar_Pprint.langle uu____6847  in
              FStar_Pprint.op_Hat_Slash_Hat uu____6845 uu____6846  in
            FStar_Pprint.group uu____6844
        | FStar_Parser_AST.Ascribed (e1,t,FStar_Pervasives_Native.Some tac)
            ->
            let uu____6854 =
              let uu____6855 = p_tmIff e1  in
              let uu____6856 =
                let uu____6857 =
                  let uu____6858 =
                    let uu____6859 = p_typ false false t  in
                    let uu____6862 =
                      let uu____6863 = str "by"  in
                      let uu____6865 = p_typ ps pb (maybe_unthunk tac)  in
                      FStar_Pprint.op_Hat_Slash_Hat uu____6863 uu____6865  in
                    FStar_Pprint.op_Hat_Slash_Hat uu____6859 uu____6862  in
                  FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.colon uu____6858
                   in
                FStar_Pprint.op_Hat_Hat FStar_Pprint.langle uu____6857  in
              FStar_Pprint.op_Hat_Slash_Hat uu____6855 uu____6856  in
            FStar_Pprint.group uu____6854
        | FStar_Parser_AST.Op
            ({ FStar_Ident.idText = ".()<-";
               FStar_Ident.idRange = uu____6866;_},e1::e2::e3::[])
            ->
            let uu____6873 =
              let uu____6874 =
                let uu____6875 =
                  let uu____6876 = p_atomicTermNotQUident e1  in
                  let uu____6877 =
                    let uu____6878 =
                      let uu____6879 =
                        let uu____6880 = p_term false false e2  in
                        soft_parens_with_nesting uu____6880  in
                      let uu____6883 =
                        FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                          FStar_Pprint.larrow
                         in
                      FStar_Pprint.op_Hat_Hat uu____6879 uu____6883  in
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____6878  in
                  FStar_Pprint.op_Hat_Hat uu____6876 uu____6877  in
                FStar_Pprint.group uu____6875  in
              let uu____6884 =
                let uu____6885 = p_noSeqTermAndComment ps pb e3  in
                jump2 uu____6885  in
              FStar_Pprint.op_Hat_Hat uu____6874 uu____6884  in
            FStar_Pprint.group uu____6873
        | FStar_Parser_AST.Op
            ({ FStar_Ident.idText = ".[]<-";
               FStar_Ident.idRange = uu____6886;_},e1::e2::e3::[])
            ->
            let uu____6893 =
              let uu____6894 =
                let uu____6895 =
                  let uu____6896 = p_atomicTermNotQUident e1  in
                  let uu____6897 =
                    let uu____6898 =
                      let uu____6899 =
                        let uu____6900 = p_term false false e2  in
                        soft_brackets_with_nesting uu____6900  in
                      let uu____6903 =
                        FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                          FStar_Pprint.larrow
                         in
                      FStar_Pprint.op_Hat_Hat uu____6899 uu____6903  in
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____6898  in
                  FStar_Pprint.op_Hat_Hat uu____6896 uu____6897  in
                FStar_Pprint.group uu____6895  in
              let uu____6904 =
                let uu____6905 = p_noSeqTermAndComment ps pb e3  in
                jump2 uu____6905  in
              FStar_Pprint.op_Hat_Hat uu____6894 uu____6904  in
            FStar_Pprint.group uu____6893
        | FStar_Parser_AST.Requires (e1,wtf) ->
            let uu____6915 =
              let uu____6916 = str "requires"  in
              let uu____6918 = p_typ ps pb e1  in
              FStar_Pprint.op_Hat_Slash_Hat uu____6916 uu____6918  in
            FStar_Pprint.group uu____6915
        | FStar_Parser_AST.Ensures (e1,wtf) ->
            let uu____6928 =
              let uu____6929 = str "ensures"  in
              let uu____6931 = p_typ ps pb e1  in
              FStar_Pprint.op_Hat_Slash_Hat uu____6929 uu____6931  in
            FStar_Pprint.group uu____6928
        | FStar_Parser_AST.Attributes es ->
            let uu____6935 =
              let uu____6936 = str "attributes"  in
              let uu____6938 =
                FStar_Pprint.separate_map break1 p_atomicTerm es  in
              FStar_Pprint.op_Hat_Slash_Hat uu____6936 uu____6938  in
            FStar_Pprint.group uu____6935
        | FStar_Parser_AST.If (e1,e2,e3) ->
            if is_unit e3
            then
              let uu____6943 =
                let uu____6944 =
                  let uu____6945 = str "if"  in
                  let uu____6947 = p_noSeqTermAndComment false false e1  in
                  op_Hat_Slash_Plus_Hat uu____6945 uu____6947  in
                let uu____6950 =
                  let uu____6951 = str "then"  in
                  let uu____6953 = p_noSeqTermAndComment ps pb e2  in
                  op_Hat_Slash_Plus_Hat uu____6951 uu____6953  in
                FStar_Pprint.op_Hat_Slash_Hat uu____6944 uu____6950  in
              FStar_Pprint.group uu____6943
            else
              (let e2_doc =
                 match e2.FStar_Parser_AST.tm with
                 | FStar_Parser_AST.If (uu____6957,uu____6958,e31) when
                     is_unit e31 ->
                     let uu____6960 = p_noSeqTermAndComment false false e2
                        in
                     soft_parens_with_nesting uu____6960
                 | uu____6963 -> p_noSeqTermAndComment false false e2  in
               let uu____6966 =
                 let uu____6967 =
                   let uu____6968 = str "if"  in
                   let uu____6970 = p_noSeqTermAndComment false false e1  in
                   op_Hat_Slash_Plus_Hat uu____6968 uu____6970  in
                 let uu____6973 =
                   let uu____6974 =
                     let uu____6975 = str "then"  in
                     op_Hat_Slash_Plus_Hat uu____6975 e2_doc  in
                   let uu____6977 =
                     let uu____6978 = str "else"  in
                     let uu____6980 = p_noSeqTermAndComment ps pb e3  in
                     op_Hat_Slash_Plus_Hat uu____6978 uu____6980  in
                   FStar_Pprint.op_Hat_Slash_Hat uu____6974 uu____6977  in
                 FStar_Pprint.op_Hat_Slash_Hat uu____6967 uu____6973  in
               FStar_Pprint.group uu____6966)
        | FStar_Parser_AST.TryWith (e1,branches) ->
            let uu____7003 =
              let uu____7004 =
                let uu____7005 =
                  let uu____7006 = str "try"  in
                  let uu____7008 = p_noSeqTermAndComment false false e1  in
                  prefix2 uu____7006 uu____7008  in
                let uu____7011 =
                  let uu____7012 = str "with"  in
                  let uu____7014 =
                    separate_map_last FStar_Pprint.hardline p_patternBranch
                      branches
                     in
                  FStar_Pprint.op_Hat_Slash_Hat uu____7012 uu____7014  in
                FStar_Pprint.op_Hat_Slash_Hat uu____7005 uu____7011  in
              FStar_Pprint.group uu____7004  in
            let uu____7023 = paren_if (ps || pb)  in uu____7023 uu____7003
        | FStar_Parser_AST.Match (e1,branches) ->
            let uu____7050 =
              let uu____7051 =
                let uu____7052 =
                  let uu____7053 = str "match"  in
                  let uu____7055 = p_noSeqTermAndComment false false e1  in
                  let uu____7058 = str "with"  in
                  FStar_Pprint.surround (Prims.of_int (2)) Prims.int_one
                    uu____7053 uu____7055 uu____7058
                   in
                let uu____7062 =
                  separate_map_last FStar_Pprint.hardline p_patternBranch
                    branches
                   in
                FStar_Pprint.op_Hat_Slash_Hat uu____7052 uu____7062  in
              FStar_Pprint.group uu____7051  in
            let uu____7071 = paren_if (ps || pb)  in uu____7071 uu____7050
        | FStar_Parser_AST.LetOpen (uid,e1) ->
            let uu____7078 =
              let uu____7079 =
                let uu____7080 =
                  let uu____7081 = str "let open"  in
                  let uu____7083 = p_quident uid  in
                  let uu____7084 = str "in"  in
                  FStar_Pprint.surround (Prims.of_int (2)) Prims.int_one
                    uu____7081 uu____7083 uu____7084
                   in
                let uu____7088 = p_term false pb e1  in
                FStar_Pprint.op_Hat_Slash_Hat uu____7080 uu____7088  in
              FStar_Pprint.group uu____7079  in
            let uu____7090 = paren_if ps  in uu____7090 uu____7078
        | FStar_Parser_AST.Let (q,lbs,e1) ->
            let p_lb q1 uu____7155 is_last =
              match uu____7155 with
              | (a,(pat,e2)) ->
                  let attrs = p_attrs_opt a  in
                  let doc_let_or_and =
                    match q1 with
                    | FStar_Pervasives_Native.Some (FStar_Parser_AST.Rec ) ->
                        let uu____7189 =
                          let uu____7190 = str "let"  in
                          let uu____7192 = str "rec"  in
                          FStar_Pprint.op_Hat_Slash_Hat uu____7190 uu____7192
                           in
                        FStar_Pprint.group uu____7189
                    | FStar_Pervasives_Native.Some
                        (FStar_Parser_AST.NoLetQualifier ) -> str "let"
                    | uu____7195 -> str "and"  in
                  let doc_pat = p_letlhs doc_let_or_and (pat, e2) true  in
                  let uu____7201 = p_term_sep false false e2  in
                  (match uu____7201 with
                   | (comm,doc_expr) ->
                       let doc_expr1 =
                         inline_comment_or_above comm doc_expr
                           FStar_Pprint.empty
                          in
                       let uu____7211 =
                         if is_last
                         then
                           let uu____7213 =
                             FStar_Pprint.flow break1
                               [doc_pat; FStar_Pprint.equals]
                              in
                           let uu____7214 = str "in"  in
                           FStar_Pprint.surround (Prims.of_int (2))
                             Prims.int_one uu____7213 doc_expr1 uu____7214
                         else
                           (let uu____7220 =
                              FStar_Pprint.flow break1
                                [doc_pat; FStar_Pprint.equals; doc_expr1]
                               in
                            FStar_Pprint.hang (Prims.of_int (2)) uu____7220)
                          in
                       FStar_Pprint.op_Hat_Hat attrs uu____7211)
               in
            let l = FStar_List.length lbs  in
            let lbs_docs =
              FStar_List.mapi
                (fun i  ->
                   fun lb  ->
                     if i = Prims.int_zero
                     then
                       let uu____7271 =
                         p_lb (FStar_Pervasives_Native.Some q) lb
                           (i = (l - Prims.int_one))
                          in
                       FStar_Pprint.group uu____7271
                     else
                       (let uu____7276 =
                          p_lb FStar_Pervasives_Native.None lb
                            (i = (l - Prims.int_one))
                           in
                        FStar_Pprint.group uu____7276)) lbs
               in
            let lbs_doc =
              let uu____7280 = FStar_Pprint.separate break1 lbs_docs  in
              FStar_Pprint.group uu____7280  in
            let uu____7281 =
              let uu____7282 =
                let uu____7283 =
                  let uu____7284 = p_term false pb e1  in
                  FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline uu____7284
                   in
                FStar_Pprint.op_Hat_Hat lbs_doc uu____7283  in
              FStar_Pprint.group uu____7282  in
            let uu____7286 = paren_if ps  in uu____7286 uu____7281
        | FStar_Parser_AST.Abs
            ({ FStar_Parser_AST.pat = FStar_Parser_AST.PatVar (x,typ_opt);
               FStar_Parser_AST.prange = uu____7293;_}::[],{
                                                             FStar_Parser_AST.tm
                                                               =
                                                               FStar_Parser_AST.Match
                                                               (maybe_x,branches);
                                                             FStar_Parser_AST.range
                                                               = uu____7296;
                                                             FStar_Parser_AST.level
                                                               = uu____7297;_})
            when matches_var maybe_x x ->
            let uu____7324 =
              let uu____7325 =
                let uu____7326 = str "function"  in
                let uu____7328 =
                  separate_map_last FStar_Pprint.hardline p_patternBranch
                    branches
                   in
                FStar_Pprint.op_Hat_Slash_Hat uu____7326 uu____7328  in
              FStar_Pprint.group uu____7325  in
            let uu____7337 = paren_if (ps || pb)  in uu____7337 uu____7324
        | FStar_Parser_AST.Quote (e1,FStar_Parser_AST.Dynamic ) ->
            let uu____7343 =
              let uu____7344 = str "quote"  in
              let uu____7346 = p_noSeqTermAndComment ps pb e1  in
              FStar_Pprint.op_Hat_Slash_Hat uu____7344 uu____7346  in
            FStar_Pprint.group uu____7343
        | FStar_Parser_AST.Quote (e1,FStar_Parser_AST.Static ) ->
            let uu____7348 =
              let uu____7349 = str "`"  in
              let uu____7351 = p_noSeqTermAndComment ps pb e1  in
              FStar_Pprint.op_Hat_Hat uu____7349 uu____7351  in
            FStar_Pprint.group uu____7348
        | FStar_Parser_AST.VQuote e1 ->
            let uu____7353 =
              let uu____7354 = str "`%"  in
              let uu____7356 = p_noSeqTermAndComment ps pb e1  in
              FStar_Pprint.op_Hat_Hat uu____7354 uu____7356  in
            FStar_Pprint.group uu____7353
        | FStar_Parser_AST.Antiquote
            {
              FStar_Parser_AST.tm = FStar_Parser_AST.Quote
                (e1,FStar_Parser_AST.Dynamic );
              FStar_Parser_AST.range = uu____7358;
              FStar_Parser_AST.level = uu____7359;_}
            ->
            let uu____7360 =
              let uu____7361 = str "`@"  in
              let uu____7363 = p_noSeqTermAndComment ps pb e1  in
              FStar_Pprint.op_Hat_Hat uu____7361 uu____7363  in
            FStar_Pprint.group uu____7360
        | FStar_Parser_AST.Antiquote e1 ->
            let uu____7365 =
              let uu____7366 = str "`#"  in
              let uu____7368 = p_noSeqTermAndComment ps pb e1  in
              FStar_Pprint.op_Hat_Hat uu____7366 uu____7368  in
            FStar_Pprint.group uu____7365
        | FStar_Parser_AST.CalcProof (rel,init1,steps) ->
            let head1 =
              let uu____7377 = str "calc"  in
              let uu____7379 =
                let uu____7380 =
                  let uu____7381 = p_noSeqTermAndComment false false rel  in
                  let uu____7384 =
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                      FStar_Pprint.lbrace
                     in
                  FStar_Pprint.op_Hat_Hat uu____7381 uu____7384  in
                FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____7380  in
              FStar_Pprint.op_Hat_Hat uu____7377 uu____7379  in
            let bot = FStar_Pprint.rbrace  in
            let uu____7386 =
              FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline bot  in
            let uu____7387 =
              let uu____7388 =
                let uu____7389 =
                  let uu____7390 = p_noSeqTermAndComment false false init1
                     in
                  let uu____7393 =
                    let uu____7394 = str ";"  in
                    let uu____7396 =
                      let uu____7397 =
                        separate_map_last FStar_Pprint.hardline p_calcStep
                          steps
                         in
                      FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline
                        uu____7397
                       in
                    FStar_Pprint.op_Hat_Hat uu____7394 uu____7396  in
                  FStar_Pprint.op_Hat_Hat uu____7390 uu____7393  in
                FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline uu____7389  in
              FStar_All.pipe_left (FStar_Pprint.nest (Prims.of_int (2)))
                uu____7388
               in
            FStar_Pprint.enclose head1 uu____7386 uu____7387
        | uu____7399 -> p_typ ps pb e

and (p_calcStep :
  Prims.bool -> FStar_Parser_AST.calc_step -> FStar_Pprint.document) =
  fun uu____7400  ->
    fun uu____7401  ->
      match uu____7401 with
      | FStar_Parser_AST.CalcStep (rel,just,next) ->
          let uu____7406 =
            let uu____7407 = p_noSeqTermAndComment false false rel  in
            let uu____7410 =
              let uu____7411 =
                let uu____7412 =
                  let uu____7413 =
                    let uu____7414 = p_noSeqTermAndComment false false just
                       in
                    let uu____7417 =
                      let uu____7418 =
                        let uu____7419 =
                          let uu____7420 =
                            let uu____7421 =
                              p_noSeqTermAndComment false false next  in
                            let uu____7424 = str ";"  in
                            FStar_Pprint.op_Hat_Hat uu____7421 uu____7424  in
                          FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline
                            uu____7420
                           in
                        FStar_Pprint.op_Hat_Hat FStar_Pprint.rbrace
                          uu____7419
                         in
                      FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____7418
                       in
                    FStar_Pprint.op_Hat_Hat uu____7414 uu____7417  in
                  FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____7413  in
                FStar_Pprint.op_Hat_Hat FStar_Pprint.lbrace uu____7412  in
              FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____7411  in
            FStar_Pprint.op_Hat_Hat uu____7407 uu____7410  in
          FStar_Pprint.group uu____7406

and (p_attrs_opt :
  FStar_Parser_AST.term Prims.list FStar_Pervasives_Native.option ->
    FStar_Pprint.document)
  =
  fun uu___11_7426  ->
    match uu___11_7426 with
    | FStar_Pervasives_Native.None  -> FStar_Pprint.empty
    | FStar_Pervasives_Native.Some terms ->
        let uu____7438 =
          let uu____7439 = str "[@"  in
          let uu____7441 =
            let uu____7442 =
              FStar_Pprint.separate_map break1 p_atomicTerm terms  in
            let uu____7443 = str "]"  in
            FStar_Pprint.op_Hat_Slash_Hat uu____7442 uu____7443  in
          FStar_Pprint.op_Hat_Slash_Hat uu____7439 uu____7441  in
        FStar_Pprint.group uu____7438

and (p_typ :
  Prims.bool -> Prims.bool -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun ps  ->
    fun pb  ->
      fun e  -> with_comment (p_typ' ps pb) e e.FStar_Parser_AST.range

and (p_typ_sep :
  Prims.bool ->
    Prims.bool ->
      FStar_Parser_AST.term ->
        (FStar_Pprint.document * FStar_Pprint.document))
  =
  fun ps  ->
    fun pb  ->
      fun e  -> with_comment_sep (p_typ' ps pb) e e.FStar_Parser_AST.range

and (p_typ' :
  Prims.bool -> Prims.bool -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun ps  ->
    fun pb  ->
      fun e  ->
        match e.FStar_Parser_AST.tm with
        | FStar_Parser_AST.QForall (bs,(uu____7461,trigger),e1) ->
            let binders_doc = p_binders true bs  in
            let term_doc = p_noSeqTermAndComment ps pb e1  in
            (match trigger with
             | [] ->
                 let uu____7495 =
                   let uu____7496 =
                     let uu____7497 = p_quantifier e  in
                     FStar_Pprint.op_Hat_Hat uu____7497 FStar_Pprint.space
                      in
                   FStar_Pprint.soft_surround (Prims.of_int (2))
                     Prims.int_zero uu____7496 binders_doc FStar_Pprint.dot
                    in
                 prefix2 uu____7495 term_doc
             | pats ->
                 let uu____7505 =
                   let uu____7506 =
                     let uu____7507 =
                       let uu____7508 =
                         let uu____7509 = p_quantifier e  in
                         FStar_Pprint.op_Hat_Hat uu____7509
                           FStar_Pprint.space
                          in
                       FStar_Pprint.soft_surround (Prims.of_int (2))
                         Prims.int_zero uu____7508 binders_doc
                         FStar_Pprint.dot
                        in
                     let uu____7512 = p_trigger trigger  in
                     prefix2 uu____7507 uu____7512  in
                   FStar_Pprint.group uu____7506  in
                 prefix2 uu____7505 term_doc)
        | FStar_Parser_AST.QExists (bs,(uu____7514,trigger),e1) ->
            let binders_doc = p_binders true bs  in
            let term_doc = p_noSeqTermAndComment ps pb e1  in
            (match trigger with
             | [] ->
                 let uu____7548 =
                   let uu____7549 =
                     let uu____7550 = p_quantifier e  in
                     FStar_Pprint.op_Hat_Hat uu____7550 FStar_Pprint.space
                      in
                   FStar_Pprint.soft_surround (Prims.of_int (2))
                     Prims.int_zero uu____7549 binders_doc FStar_Pprint.dot
                    in
                 prefix2 uu____7548 term_doc
             | pats ->
                 let uu____7558 =
                   let uu____7559 =
                     let uu____7560 =
                       let uu____7561 =
                         let uu____7562 = p_quantifier e  in
                         FStar_Pprint.op_Hat_Hat uu____7562
                           FStar_Pprint.space
                          in
                       FStar_Pprint.soft_surround (Prims.of_int (2))
                         Prims.int_zero uu____7561 binders_doc
                         FStar_Pprint.dot
                        in
                     let uu____7565 = p_trigger trigger  in
                     prefix2 uu____7560 uu____7565  in
                   FStar_Pprint.group uu____7559  in
                 prefix2 uu____7558 term_doc)
        | uu____7566 -> p_simpleTerm ps pb e

and (p_typ_top :
  annotation_style ->
    Prims.bool ->
      Prims.bool -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun style  ->
    fun ps  ->
      fun pb  ->
        fun e  ->
          with_comment (p_typ_top' style ps pb) e e.FStar_Parser_AST.range

and (p_typ_top' :
  annotation_style ->
    Prims.bool ->
      Prims.bool -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun style  ->
    fun ps  -> fun pb  -> fun e  -> p_tmArrow style true p_tmFormula e

and (sig_as_binders_if_possible :
  FStar_Parser_AST.term -> Prims.bool -> FStar_Pprint.document) =
  fun t  ->
    fun extra_space  ->
      let s = if extra_space then FStar_Pprint.space else FStar_Pprint.empty
         in
      let uu____7587 = all_binders_annot t  in
      if uu____7587
      then
        let uu____7590 =
          p_typ_top (Binders ((Prims.of_int (4)), Prims.int_zero, true))
            false false t
           in
        FStar_Pprint.op_Hat_Hat s uu____7590
      else
        (let uu____7601 =
           let uu____7602 =
             let uu____7603 =
               p_typ_top (Arrows ((Prims.of_int (2)), (Prims.of_int (2))))
                 false false t
                in
             FStar_Pprint.op_Hat_Hat s uu____7603  in
           FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____7602  in
         FStar_Pprint.group uu____7601)

and (collapse_pats :
  (FStar_Pprint.document * FStar_Pprint.document) Prims.list ->
    FStar_Pprint.document Prims.list)
  =
  fun pats  ->
    let fold_fun bs x =
      let uu____7662 = x  in
      match uu____7662 with
      | (b1,t1) ->
          (match bs with
           | [] -> [([b1], t1)]
           | hd1::tl1 ->
               let uu____7727 = hd1  in
               (match uu____7727 with
                | (b2s,t2) ->
                    if t1 = t2
                    then ((FStar_List.append b2s [b1]), t1) :: tl1
                    else ([b1], t1) :: hd1 :: tl1))
       in
    let p_collapsed_binder cb =
      let uu____7799 = cb  in
      match uu____7799 with
      | (bs,typ) ->
          (match bs with
           | [] -> failwith "Impossible"
           | b::[] -> cat_with_colon b typ
           | hd1::tl1 ->
               let uu____7818 =
                 FStar_List.fold_left
                   (fun x  ->
                      fun y  ->
                        let uu____7824 =
                          FStar_Pprint.op_Hat_Hat FStar_Pprint.space y  in
                        FStar_Pprint.op_Hat_Hat x uu____7824) hd1 tl1
                  in
               cat_with_colon uu____7818 typ)
       in
    let binders = FStar_List.fold_left fold_fun [] (FStar_List.rev pats)  in
    map_rev p_collapsed_binder binders

and (pats_as_binders_if_possible :
  FStar_Parser_AST.pattern Prims.list ->
    (FStar_Pprint.document Prims.list * annotation_style))
  =
  fun pats  ->
    let all_binders p =
      match p.FStar_Parser_AST.pat with
      | FStar_Parser_AST.PatAscribed (pat,(t,FStar_Pervasives_Native.None ))
          ->
          (match ((pat.FStar_Parser_AST.pat), (t.FStar_Parser_AST.tm)) with
           | (FStar_Parser_AST.PatVar (lid,aqual),FStar_Parser_AST.Refine
              ({ FStar_Parser_AST.b = FStar_Parser_AST.Annotated (lid',t1);
                 FStar_Parser_AST.brange = uu____7903;
                 FStar_Parser_AST.blevel = uu____7904;
                 FStar_Parser_AST.aqual = uu____7905;_},phi))
               when lid.FStar_Ident.idText = lid'.FStar_Ident.idText ->
               let uu____7914 =
                 let uu____7919 = p_ident lid  in
                 p_refinement' aqual uu____7919 t1 phi  in
               FStar_Pervasives_Native.Some uu____7914
           | (FStar_Parser_AST.PatVar (lid,aqual),uu____7926) ->
               let uu____7931 =
                 let uu____7936 =
                   let uu____7937 = FStar_Pprint.optional p_aqual aqual  in
                   let uu____7938 = p_ident lid  in
                   FStar_Pprint.op_Hat_Hat uu____7937 uu____7938  in
                 let uu____7939 = p_tmEqNoRefinement t  in
                 (uu____7936, uu____7939)  in
               FStar_Pervasives_Native.Some uu____7931
           | uu____7944 -> FStar_Pervasives_Native.None)
      | uu____7953 -> FStar_Pervasives_Native.None  in
    let all_unbound p =
      match p.FStar_Parser_AST.pat with
      | FStar_Parser_AST.PatAscribed uu____7966 -> false
      | uu____7978 -> true  in
    let uu____7980 = map_if_all all_binders pats  in
    match uu____7980 with
    | FStar_Pervasives_Native.Some bs ->
        let uu____8012 = collapse_pats bs  in
        (uu____8012, (Binders ((Prims.of_int (4)), Prims.int_zero, true)))
    | FStar_Pervasives_Native.None  ->
        let uu____8029 = FStar_List.map p_atomicPattern pats  in
        (uu____8029, (Binders ((Prims.of_int (4)), Prims.int_zero, false)))

and (p_quantifier : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.QForall uu____8041 -> str "forall"
    | FStar_Parser_AST.QExists uu____8061 -> str "exists"
    | uu____8081 ->
        failwith "Imposible : p_quantifier called on a non-quantifier term"

and (p_trigger :
  FStar_Parser_AST.term Prims.list Prims.list -> FStar_Pprint.document) =
  fun uu___12_8083  ->
    match uu___12_8083 with
    | [] -> FStar_Pprint.empty
    | pats ->
        let uu____8095 =
          let uu____8096 =
            let uu____8097 =
              let uu____8098 = str "pattern"  in
              let uu____8100 =
                let uu____8101 =
                  let uu____8102 = p_disjunctivePats pats  in
                  FStar_Pprint.jump (Prims.of_int (2)) Prims.int_zero
                    uu____8102
                   in
                FStar_Pprint.op_Hat_Hat uu____8101 FStar_Pprint.rbrace  in
              FStar_Pprint.op_Hat_Slash_Hat uu____8098 uu____8100  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____8097  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.lbrace uu____8096  in
        FStar_Pprint.group uu____8095

and (p_disjunctivePats :
  FStar_Parser_AST.term Prims.list Prims.list -> FStar_Pprint.document) =
  fun pats  ->
    let uu____8110 = str "\\/"  in
    FStar_Pprint.separate_map uu____8110 p_conjunctivePats pats

and (p_conjunctivePats :
  FStar_Parser_AST.term Prims.list -> FStar_Pprint.document) =
  fun pats  ->
    let uu____8117 =
      let uu____8118 = FStar_Pprint.op_Hat_Hat FStar_Pprint.semi break1  in
      FStar_Pprint.separate_map uu____8118 p_appTerm pats  in
    FStar_Pprint.group uu____8117

and (p_simpleTerm :
  Prims.bool -> Prims.bool -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun ps  ->
    fun pb  ->
      fun e  ->
        match e.FStar_Parser_AST.tm with
        | FStar_Parser_AST.Abs (pats,e1) ->
            let uu____8130 = p_term_sep false pb e1  in
            (match uu____8130 with
             | (comm,doc) ->
                 let prefix1 =
                   let uu____8139 = str "fun"  in
                   let uu____8141 =
                     let uu____8142 =
                       FStar_Pprint.separate_map break1 p_atomicPattern pats
                        in
                     FStar_Pprint.op_Hat_Slash_Hat uu____8142
                       FStar_Pprint.rarrow
                      in
                   op_Hat_Slash_Plus_Hat uu____8139 uu____8141  in
                 let uu____8143 =
                   if comm <> FStar_Pprint.empty
                   then
                     let uu____8145 =
                       let uu____8146 =
                         let uu____8147 =
                           FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline doc
                            in
                         FStar_Pprint.op_Hat_Hat comm uu____8147  in
                       FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline
                         uu____8146
                        in
                     FStar_Pprint.op_Hat_Hat prefix1 uu____8145
                   else
                     (let uu____8150 = op_Hat_Slash_Plus_Hat prefix1 doc  in
                      FStar_Pprint.group uu____8150)
                    in
                 let uu____8151 = paren_if ps  in uu____8151 uu____8143)
        | uu____8156 -> p_tmIff e

and (p_maybeFocusArrow : Prims.bool -> FStar_Pprint.document) =
  fun b  -> if b then str "~>" else FStar_Pprint.rarrow

and (p_patternBranch :
  Prims.bool ->
    (FStar_Parser_AST.pattern * FStar_Parser_AST.term
      FStar_Pervasives_Native.option * FStar_Parser_AST.term) ->
      FStar_Pprint.document)
  =
  fun pb  ->
    fun uu____8164  ->
      match uu____8164 with
      | (pat,when_opt,e) ->
          let one_pattern_branch p =
            let branch =
              match when_opt with
              | FStar_Pervasives_Native.None  ->
                  let uu____8188 =
                    let uu____8189 =
                      let uu____8190 =
                        let uu____8191 = p_tuplePattern p  in
                        let uu____8192 =
                          FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                            FStar_Pprint.rarrow
                           in
                        FStar_Pprint.op_Hat_Hat uu____8191 uu____8192  in
                      FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____8190
                       in
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.bar uu____8189  in
                  FStar_Pprint.group uu____8188
              | FStar_Pervasives_Native.Some f ->
                  let uu____8194 =
                    let uu____8195 =
                      let uu____8196 =
                        let uu____8197 =
                          let uu____8198 =
                            let uu____8199 = p_tuplePattern p  in
                            let uu____8200 = str "when"  in
                            FStar_Pprint.op_Hat_Slash_Hat uu____8199
                              uu____8200
                             in
                          FStar_Pprint.group uu____8198  in
                        let uu____8202 =
                          let uu____8203 =
                            let uu____8206 = p_tmFormula f  in
                            [uu____8206; FStar_Pprint.rarrow]  in
                          FStar_Pprint.flow break1 uu____8203  in
                        FStar_Pprint.op_Hat_Slash_Hat uu____8197 uu____8202
                         in
                      FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____8196
                       in
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.bar uu____8195  in
                  FStar_Pprint.hang (Prims.of_int (2)) uu____8194
               in
            let uu____8208 = p_term_sep false pb e  in
            match uu____8208 with
            | (comm,doc) ->
                if pb
                then
                  (if comm = FStar_Pprint.empty
                   then
                     let uu____8218 = op_Hat_Slash_Plus_Hat branch doc  in
                     FStar_Pprint.group uu____8218
                   else
                     (let uu____8221 =
                        let uu____8222 =
                          let uu____8223 =
                            let uu____8224 =
                              let uu____8225 =
                                FStar_Pprint.op_Hat_Hat break1 comm  in
                              FStar_Pprint.op_Hat_Hat doc uu____8225  in
                            op_Hat_Slash_Plus_Hat branch uu____8224  in
                          FStar_Pprint.group uu____8223  in
                        let uu____8226 =
                          let uu____8227 =
                            let uu____8228 =
                              inline_comment_or_above comm doc
                                FStar_Pprint.empty
                               in
                            jump2 uu____8228  in
                          FStar_Pprint.op_Hat_Hat branch uu____8227  in
                        FStar_Pprint.ifflat uu____8222 uu____8226  in
                      FStar_Pprint.group uu____8221))
                else
                  if comm <> FStar_Pprint.empty
                  then
                    (let uu____8232 =
                       let uu____8233 =
                         FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline doc
                          in
                       FStar_Pprint.op_Hat_Hat comm uu____8233  in
                     op_Hat_Slash_Plus_Hat branch uu____8232)
                  else op_Hat_Slash_Plus_Hat branch doc
             in
          (match pat.FStar_Parser_AST.pat with
           | FStar_Parser_AST.PatOr pats ->
               (match FStar_List.rev pats with
                | hd1::tl1 ->
                    let last_pat_branch = one_pattern_branch hd1  in
                    let uu____8244 =
                      let uu____8245 =
                        let uu____8246 =
                          let uu____8247 =
                            let uu____8248 =
                              let uu____8249 =
                                FStar_Pprint.op_Hat_Hat FStar_Pprint.bar
                                  FStar_Pprint.space
                                 in
                              FStar_Pprint.op_Hat_Hat break1 uu____8249  in
                            FStar_Pprint.separate_map uu____8248
                              p_tuplePattern (FStar_List.rev tl1)
                             in
                          FStar_Pprint.op_Hat_Slash_Hat uu____8247
                            last_pat_branch
                           in
                        FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____8246
                         in
                      FStar_Pprint.op_Hat_Hat FStar_Pprint.bar uu____8245  in
                    FStar_Pprint.group uu____8244
                | [] ->
                    failwith "Impossible: disjunctive pattern can't be empty")
           | uu____8251 -> one_pattern_branch pat)

and (p_tmIff : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Op
        ({ FStar_Ident.idText = "<==>"; FStar_Ident.idRange = uu____8253;_},e1::e2::[])
        ->
        let uu____8259 = str "<==>"  in
        let uu____8261 = p_tmImplies e1  in
        let uu____8262 = p_tmIff e2  in
        infix0 uu____8259 uu____8261 uu____8262
    | uu____8263 -> p_tmImplies e

and (p_tmImplies : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Op
        ({ FStar_Ident.idText = "==>"; FStar_Ident.idRange = uu____8265;_},e1::e2::[])
        ->
        let uu____8271 = str "==>"  in
        let uu____8273 =
          p_tmArrow (Arrows ((Prims.of_int (2)), (Prims.of_int (2)))) false
            p_tmFormula e1
           in
        let uu____8279 = p_tmImplies e2  in
        infix0 uu____8271 uu____8273 uu____8279
    | uu____8280 ->
        p_tmArrow (Arrows ((Prims.of_int (2)), (Prims.of_int (2)))) false
          p_tmFormula e

and (format_sig :
  annotation_style ->
    FStar_Pprint.document Prims.list ->
      Prims.bool -> Prims.bool -> FStar_Pprint.document)
  =
  fun style  ->
    fun terms  ->
      fun no_last_op  ->
        fun flat_space  ->
          let uu____8294 =
            FStar_List.splitAt ((FStar_List.length terms) - Prims.int_one)
              terms
             in
          match uu____8294 with
          | (terms',last1) ->
              let uu____8314 =
                match style with
                | Arrows (n1,ln) ->
                    let uu____8349 =
                      let uu____8350 =
                        FStar_Pprint.op_Hat_Hat FStar_Pprint.rarrow break1
                         in
                      FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____8350
                       in
                    let uu____8351 =
                      FStar_Pprint.op_Hat_Hat FStar_Pprint.rarrow
                        FStar_Pprint.space
                       in
                    (n1, ln, terms', uu____8349, uu____8351)
                | Binders (n1,ln,parens1) ->
                    let uu____8365 =
                      if parens1
                      then FStar_List.map soft_parens_with_nesting terms'
                      else terms'  in
                    let uu____8373 =
                      FStar_Pprint.op_Hat_Hat FStar_Pprint.colon
                        FStar_Pprint.space
                       in
                    (n1, ln, uu____8365, break1, uu____8373)
                 in
              (match uu____8314 with
               | (n1,last_n,terms'1,sep,last_op) ->
                   let last2 = FStar_List.hd last1  in
                   let last_op1 =
                     if
                       ((FStar_List.length terms) > Prims.int_one) &&
                         (Prims.op_Negation no_last_op)
                     then last_op
                     else FStar_Pprint.empty  in
                   let one_line_space =
                     if
                       (Prims.op_Negation (last2 = FStar_Pprint.empty)) ||
                         (Prims.op_Negation no_last_op)
                     then FStar_Pprint.space
                     else FStar_Pprint.empty  in
                   let single_line_arg_indent =
                     FStar_Pprint.repeat n1 FStar_Pprint.space  in
                   let fs =
                     if flat_space
                     then FStar_Pprint.space
                     else FStar_Pprint.empty  in
                   (match FStar_List.length terms with
                    | uu____8406 when uu____8406 = Prims.int_one ->
                        FStar_List.hd terms
                    | uu____8407 ->
                        let uu____8408 =
                          let uu____8409 =
                            let uu____8410 =
                              let uu____8411 =
                                FStar_Pprint.separate sep terms'1  in
                              let uu____8412 =
                                let uu____8413 =
                                  FStar_Pprint.op_Hat_Hat last_op1 last2  in
                                FStar_Pprint.op_Hat_Hat one_line_space
                                  uu____8413
                                 in
                              FStar_Pprint.op_Hat_Hat uu____8411 uu____8412
                               in
                            FStar_Pprint.op_Hat_Hat fs uu____8410  in
                          let uu____8414 =
                            let uu____8415 =
                              let uu____8416 =
                                let uu____8417 =
                                  let uu____8418 =
                                    FStar_Pprint.separate sep terms'1  in
                                  FStar_Pprint.op_Hat_Hat fs uu____8418  in
                                let uu____8419 =
                                  let uu____8420 =
                                    let uu____8421 =
                                      let uu____8422 =
                                        FStar_Pprint.op_Hat_Hat sep
                                          single_line_arg_indent
                                         in
                                      let uu____8423 =
                                        FStar_List.map
                                          (fun x  ->
                                             let uu____8429 =
                                               FStar_Pprint.hang
                                                 (Prims.of_int (2)) x
                                                in
                                             FStar_Pprint.align uu____8429)
                                          terms'1
                                         in
                                      FStar_Pprint.separate uu____8422
                                        uu____8423
                                       in
                                    FStar_Pprint.op_Hat_Hat
                                      single_line_arg_indent uu____8421
                                     in
                                  jump2 uu____8420  in
                                FStar_Pprint.ifflat uu____8417 uu____8419  in
                              FStar_Pprint.group uu____8416  in
                            let uu____8431 =
                              let uu____8432 =
                                let uu____8433 =
                                  FStar_Pprint.op_Hat_Hat last_op1 last2  in
                                FStar_Pprint.hang last_n uu____8433  in
                              FStar_Pprint.align uu____8432  in
                            FStar_Pprint.prefix n1 Prims.int_one uu____8415
                              uu____8431
                             in
                          FStar_Pprint.ifflat uu____8409 uu____8414  in
                        FStar_Pprint.group uu____8408))

and (p_tmArrow :
  annotation_style ->
    Prims.bool ->
      (FStar_Parser_AST.term -> FStar_Pprint.document) ->
        FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun style  ->
    fun flat_space  ->
      fun p_Tm  ->
        fun e  ->
          let terms =
            match style with
            | Arrows uu____8447 -> p_tmArrow' p_Tm e
            | Binders uu____8454 -> collapse_binders p_Tm e  in
          format_sig style terms false flat_space

and (p_tmArrow' :
  (FStar_Parser_AST.term -> FStar_Pprint.document) ->
    FStar_Parser_AST.term -> FStar_Pprint.document Prims.list)
  =
  fun p_Tm  ->
    fun e  ->
      match e.FStar_Parser_AST.tm with
      | FStar_Parser_AST.Product (bs,tgt) ->
          let uu____8477 = FStar_List.map (fun b  -> p_binder false b) bs  in
          let uu____8483 = p_tmArrow' p_Tm tgt  in
          FStar_List.append uu____8477 uu____8483
      | uu____8486 -> let uu____8487 = p_Tm e  in [uu____8487]

and (collapse_binders :
  (FStar_Parser_AST.term -> FStar_Pprint.document) ->
    FStar_Parser_AST.term -> FStar_Pprint.document Prims.list)
  =
  fun p_Tm  ->
    fun e  ->
      let rec accumulate_binders p_Tm1 e1 =
        match e1.FStar_Parser_AST.tm with
        | FStar_Parser_AST.Product (bs,tgt) ->
            let uu____8540 = FStar_List.map (fun b  -> p_binder' false b) bs
               in
            let uu____8566 = accumulate_binders p_Tm1 tgt  in
            FStar_List.append uu____8540 uu____8566
        | uu____8589 ->
            let uu____8590 =
              let uu____8601 = p_Tm1 e1  in
              (uu____8601, FStar_Pervasives_Native.None, cat_with_colon)  in
            [uu____8590]
         in
      let fold_fun bs x =
        let uu____8699 = x  in
        match uu____8699 with
        | (b1,t1,f1) ->
            (match bs with
             | [] -> [([b1], t1, f1)]
             | hd1::tl1 ->
                 let uu____8831 = hd1  in
                 (match uu____8831 with
                  | (b2s,t2,uu____8860) ->
                      (match (t1, t2) with
                       | (FStar_Pervasives_Native.Some
                          typ1,FStar_Pervasives_Native.Some typ2) ->
                           if typ1 = typ2
                           then ((FStar_List.append b2s [b1]), t1, f1) :: tl1
                           else ([b1], t1, f1) :: hd1 :: tl1
                       | uu____8962 -> ([b1], t1, f1) :: bs)))
         in
      let p_collapsed_binder cb =
        let uu____9019 = cb  in
        match uu____9019 with
        | (bs,t,f) ->
            (match t with
             | FStar_Pervasives_Native.None  ->
                 (match bs with
                  | b::[] -> b
                  | uu____9048 -> failwith "Impossible")
             | FStar_Pervasives_Native.Some typ ->
                 (match bs with
                  | [] -> failwith "Impossible"
                  | b::[] -> f b typ
                  | hd1::tl1 ->
                      let uu____9059 =
                        FStar_List.fold_left
                          (fun x  ->
                             fun y  ->
                               let uu____9065 =
                                 FStar_Pprint.op_Hat_Hat FStar_Pprint.space y
                                  in
                               FStar_Pprint.op_Hat_Hat x uu____9065) hd1 tl1
                         in
                      f uu____9059 typ))
         in
      let binders =
        let uu____9081 = accumulate_binders p_Tm e  in
        FStar_List.fold_left fold_fun [] uu____9081  in
      map_rev p_collapsed_binder binders

and (p_tmFormula : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    let conj =
      let uu____9144 =
        let uu____9145 = str "/\\"  in
        FStar_Pprint.op_Hat_Hat uu____9145 break1  in
      FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____9144  in
    let disj =
      let uu____9148 =
        let uu____9149 = str "\\/"  in
        FStar_Pprint.op_Hat_Hat uu____9149 break1  in
      FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____9148  in
    let formula = p_tmDisjunction e  in
    FStar_Pprint.flow_map disj
      (fun d  ->
         FStar_Pprint.flow_map conj (fun x  -> FStar_Pprint.group x) d)
      formula

and (p_tmDisjunction :
  FStar_Parser_AST.term -> FStar_Pprint.document Prims.list Prims.list) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Op
        ({ FStar_Ident.idText = "\\/"; FStar_Ident.idRange = uu____9169;_},e1::e2::[])
        ->
        let uu____9175 = p_tmDisjunction e1  in
        let uu____9180 = let uu____9185 = p_tmConjunction e2  in [uu____9185]
           in
        FStar_List.append uu____9175 uu____9180
    | uu____9194 -> let uu____9195 = p_tmConjunction e  in [uu____9195]

and (p_tmConjunction :
  FStar_Parser_AST.term -> FStar_Pprint.document Prims.list) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Op
        ({ FStar_Ident.idText = "/\\"; FStar_Ident.idRange = uu____9205;_},e1::e2::[])
        ->
        let uu____9211 = p_tmConjunction e1  in
        let uu____9214 = let uu____9217 = p_tmTuple e2  in [uu____9217]  in
        FStar_List.append uu____9211 uu____9214
    | uu____9218 -> let uu____9219 = p_tmTuple e  in [uu____9219]

and (p_tmTuple : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  -> with_comment p_tmTuple' e e.FStar_Parser_AST.range

and (p_tmTuple' : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Construct (lid,args) when
        (is_tuple_constructor lid) && (all1_explicit args) ->
        let uu____9236 = FStar_Pprint.op_Hat_Hat FStar_Pprint.comma break1
           in
        FStar_Pprint.separate_map uu____9236
          (fun uu____9244  ->
             match uu____9244 with | (e1,uu____9250) -> p_tmEq e1) args
    | uu____9251 -> p_tmEq e

and (paren_if_gt :
  Prims.int -> Prims.int -> FStar_Pprint.document -> FStar_Pprint.document) =
  fun curr  ->
    fun mine  ->
      fun doc  ->
        if mine <= curr
        then doc
        else
          (let uu____9260 =
             let uu____9261 = FStar_Pprint.op_Hat_Hat doc FStar_Pprint.rparen
                in
             FStar_Pprint.op_Hat_Hat FStar_Pprint.lparen uu____9261  in
           FStar_Pprint.group uu____9260)

and (p_tmEqWith :
  (FStar_Parser_AST.term -> FStar_Pprint.document) ->
    FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun p_X  ->
    fun e  ->
      let n1 =
        max_level
          (FStar_List.append [colon_equals; pipe_right] operatorInfix0ad12)
         in
      p_tmEqWith' p_X n1 e

and (p_tmEqWith' :
  (FStar_Parser_AST.term -> FStar_Pprint.document) ->
    Prims.int -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun p_X  ->
    fun curr  ->
      fun e  ->
        match e.FStar_Parser_AST.tm with
        | FStar_Parser_AST.Op (op,e1::e2::[]) when
            ((is_operatorInfix0ad12 op) ||
               (let uu____9280 = FStar_Ident.text_of_id op  in
                uu____9280 = "="))
              ||
              (let uu____9285 = FStar_Ident.text_of_id op  in
               uu____9285 = "|>")
            ->
            let op1 = FStar_Ident.text_of_id op  in
            let uu____9291 = levels op1  in
            (match uu____9291 with
             | (left1,mine,right1) ->
                 let uu____9310 =
                   let uu____9311 = FStar_All.pipe_left str op1  in
                   let uu____9313 = p_tmEqWith' p_X left1 e1  in
                   let uu____9314 = p_tmEqWith' p_X right1 e2  in
                   infix0 uu____9311 uu____9313 uu____9314  in
                 paren_if_gt curr mine uu____9310)
        | FStar_Parser_AST.Op
            ({ FStar_Ident.idText = ":="; FStar_Ident.idRange = uu____9315;_},e1::e2::[])
            ->
            let uu____9321 =
              let uu____9322 = p_tmEqWith p_X e1  in
              let uu____9323 =
                let uu____9324 =
                  let uu____9325 =
                    let uu____9326 = p_tmEqWith p_X e2  in
                    op_Hat_Slash_Plus_Hat FStar_Pprint.equals uu____9326  in
                  FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____9325  in
                FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____9324  in
              FStar_Pprint.op_Hat_Hat uu____9322 uu____9323  in
            FStar_Pprint.group uu____9321
        | FStar_Parser_AST.Op
            ({ FStar_Ident.idText = "-"; FStar_Ident.idRange = uu____9327;_},e1::[])
            ->
            let uu____9332 = levels "-"  in
            (match uu____9332 with
             | (left1,mine,right1) ->
                 let uu____9352 = p_tmEqWith' p_X mine e1  in
                 FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.minus uu____9352)
        | uu____9353 -> p_tmNoEqWith p_X e

and (p_tmNoEqWith :
  (FStar_Parser_AST.term -> FStar_Pprint.document) ->
    FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun p_X  ->
    fun e  ->
      let n1 = max_level [colon_colon; amp; opinfix3; opinfix4]  in
      p_tmNoEqWith' false p_X n1 e

and (p_tmNoEqWith' :
  Prims.bool ->
    (FStar_Parser_AST.term -> FStar_Pprint.document) ->
      Prims.int -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun inside_tuple  ->
    fun p_X  ->
      fun curr  ->
        fun e  ->
          match e.FStar_Parser_AST.tm with
          | FStar_Parser_AST.Construct
              (lid,(e1,uu____9401)::(e2,uu____9403)::[]) when
              (FStar_Ident.lid_equals lid FStar_Parser_Const.cons_lid) &&
                (let uu____9423 = is_list e  in Prims.op_Negation uu____9423)
              ->
              let op = "::"  in
              let uu____9428 = levels op  in
              (match uu____9428 with
               | (left1,mine,right1) ->
                   let uu____9447 =
                     let uu____9448 = str op  in
                     let uu____9449 = p_tmNoEqWith' false p_X left1 e1  in
                     let uu____9451 = p_tmNoEqWith' false p_X right1 e2  in
                     infix0 uu____9448 uu____9449 uu____9451  in
                   paren_if_gt curr mine uu____9447)
          | FStar_Parser_AST.Sum (binders,res) ->
              let op = "&"  in
              let uu____9470 = levels op  in
              (match uu____9470 with
               | (left1,mine,right1) ->
                   let p_dsumfst bt =
                     match bt with
                     | FStar_Util.Inl b ->
                         let uu____9504 = p_binder false b  in
                         let uu____9506 =
                           let uu____9507 =
                             let uu____9508 = str op  in
                             FStar_Pprint.op_Hat_Hat uu____9508 break1  in
                           FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                             uu____9507
                            in
                         FStar_Pprint.op_Hat_Hat uu____9504 uu____9506
                     | FStar_Util.Inr t ->
                         let uu____9510 = p_tmNoEqWith' false p_X left1 t  in
                         let uu____9512 =
                           let uu____9513 =
                             let uu____9514 = str op  in
                             FStar_Pprint.op_Hat_Hat uu____9514 break1  in
                           FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                             uu____9513
                            in
                         FStar_Pprint.op_Hat_Hat uu____9510 uu____9512
                      in
                   let uu____9515 =
                     let uu____9516 =
                       FStar_Pprint.concat_map p_dsumfst binders  in
                     let uu____9521 = p_tmNoEqWith' false p_X right1 res  in
                     FStar_Pprint.op_Hat_Hat uu____9516 uu____9521  in
                   paren_if_gt curr mine uu____9515)
          | FStar_Parser_AST.Op
              ({ FStar_Ident.idText = "*";
                 FStar_Ident.idRange = uu____9523;_},e1::e2::[])
              when FStar_ST.op_Bang unfold_tuples ->
              let op = "*"  in
              let uu____9553 = levels op  in
              (match uu____9553 with
               | (left1,mine,right1) ->
                   if inside_tuple
                   then
                     let uu____9573 = str op  in
                     let uu____9574 = p_tmNoEqWith' true p_X left1 e1  in
                     let uu____9576 = p_tmNoEqWith' true p_X right1 e2  in
                     infix0 uu____9573 uu____9574 uu____9576
                   else
                     (let uu____9580 =
                        let uu____9581 = str op  in
                        let uu____9582 = p_tmNoEqWith' true p_X left1 e1  in
                        let uu____9584 = p_tmNoEqWith' true p_X right1 e2  in
                        infix0 uu____9581 uu____9582 uu____9584  in
                      paren_if_gt curr mine uu____9580))
          | FStar_Parser_AST.Op (op,e1::e2::[]) when is_operatorInfix34 op ->
              let op1 = FStar_Ident.text_of_id op  in
              let uu____9593 = levels op1  in
              (match uu____9593 with
               | (left1,mine,right1) ->
                   let uu____9612 =
                     let uu____9613 = str op1  in
                     let uu____9614 = p_tmNoEqWith' false p_X left1 e1  in
                     let uu____9616 = p_tmNoEqWith' false p_X right1 e2  in
                     infix0 uu____9613 uu____9614 uu____9616  in
                   paren_if_gt curr mine uu____9612)
          | FStar_Parser_AST.Record (with_opt,record_fields) ->
              let uu____9636 =
                let uu____9637 =
                  default_or_map FStar_Pprint.empty p_with_clause with_opt
                   in
                let uu____9638 =
                  let uu____9639 =
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.semi break1  in
                  separate_map_last uu____9639 p_simpleDef record_fields  in
                FStar_Pprint.op_Hat_Hat uu____9637 uu____9638  in
              braces_with_nesting uu____9636
          | FStar_Parser_AST.Op
              ({ FStar_Ident.idText = "~";
                 FStar_Ident.idRange = uu____9644;_},e1::[])
              ->
              let uu____9649 =
                let uu____9650 = str "~"  in
                let uu____9652 = p_atomicTerm e1  in
                FStar_Pprint.op_Hat_Hat uu____9650 uu____9652  in
              FStar_Pprint.group uu____9649
          | FStar_Parser_AST.Paren p when inside_tuple ->
              (match p.FStar_Parser_AST.tm with
               | FStar_Parser_AST.Op
                   ({ FStar_Ident.idText = "*";
                      FStar_Ident.idRange = uu____9654;_},e1::e2::[])
                   ->
                   let op = "*"  in
                   let uu____9663 = levels op  in
                   (match uu____9663 with
                    | (left1,mine,right1) ->
                        let uu____9682 =
                          let uu____9683 = str op  in
                          let uu____9684 = p_tmNoEqWith' true p_X left1 e1
                             in
                          let uu____9686 = p_tmNoEqWith' true p_X right1 e2
                             in
                          infix0 uu____9683 uu____9684 uu____9686  in
                        paren_if_gt curr mine uu____9682)
               | uu____9688 -> p_X e)
          | uu____9689 -> p_X e

and (p_tmEqNoRefinement : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  -> p_tmEqWith p_appTerm e

and (p_tmEq : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  -> p_tmEqWith p_tmRefinement e

and (p_tmNoEq : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  -> p_tmNoEqWith p_tmRefinement e

and (p_tmRefinement : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.NamedTyp (lid,e1) ->
        let uu____9696 =
          let uu____9697 = p_lident lid  in
          let uu____9698 =
            let uu____9699 = p_appTerm e1  in
            FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.colon uu____9699  in
          FStar_Pprint.op_Hat_Slash_Hat uu____9697 uu____9698  in
        FStar_Pprint.group uu____9696
    | FStar_Parser_AST.Refine (b,phi) -> p_refinedBinder b phi
    | uu____9702 -> p_appTerm e

and (p_with_clause : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    let uu____9704 = p_appTerm e  in
    let uu____9705 =
      let uu____9706 =
        let uu____9707 = str "with"  in
        FStar_Pprint.op_Hat_Hat uu____9707 break1  in
      FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____9706  in
    FStar_Pprint.op_Hat_Hat uu____9704 uu____9705

and (p_refinedBinder :
  FStar_Parser_AST.binder -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun b  ->
    fun phi  ->
      match b.FStar_Parser_AST.b with
      | FStar_Parser_AST.Annotated (lid,t) ->
          let uu____9713 = p_lident lid  in
          p_refinement b.FStar_Parser_AST.aqual uu____9713 t phi
      | FStar_Parser_AST.TAnnotated uu____9714 ->
          failwith "Is this still used ?"
      | FStar_Parser_AST.Variable uu____9720 ->
          let uu____9721 =
            let uu____9723 = FStar_Parser_AST.binder_to_string b  in
            FStar_Util.format1
              "Imposible : a refined binder ought to be annotated %s"
              uu____9723
             in
          failwith uu____9721
      | FStar_Parser_AST.TVariable uu____9726 ->
          let uu____9727 =
            let uu____9729 = FStar_Parser_AST.binder_to_string b  in
            FStar_Util.format1
              "Imposible : a refined binder ought to be annotated %s"
              uu____9729
             in
          failwith uu____9727
      | FStar_Parser_AST.NoName uu____9732 ->
          let uu____9733 =
            let uu____9735 = FStar_Parser_AST.binder_to_string b  in
            FStar_Util.format1
              "Imposible : a refined binder ought to be annotated %s"
              uu____9735
             in
          failwith uu____9733

and (p_simpleDef :
  Prims.bool ->
    (FStar_Ident.lid * FStar_Parser_AST.term) -> FStar_Pprint.document)
  =
  fun ps  ->
    fun uu____9739  ->
      match uu____9739 with
      | (lid,e) ->
          let uu____9747 =
            let uu____9748 = p_qlident lid  in
            let uu____9749 =
              let uu____9750 = p_noSeqTermAndComment ps false e  in
              FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.equals uu____9750
               in
            FStar_Pprint.op_Hat_Slash_Hat uu____9748 uu____9749  in
          FStar_Pprint.group uu____9747

and (p_appTerm : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.App uu____9753 when is_general_application e ->
        let uu____9760 = head_and_args e  in
        (match uu____9760 with
         | (head1,args) ->
             (match args with
              | e1::e2::[] when
                  (FStar_Pervasives_Native.snd e1) = FStar_Parser_AST.Infix
                  ->
                  let uu____9807 = p_argTerm e1  in
                  let uu____9808 =
                    let uu____9809 =
                      let uu____9810 =
                        let uu____9811 = str "`"  in
                        let uu____9813 =
                          let uu____9814 = p_indexingTerm head1  in
                          let uu____9815 = str "`"  in
                          FStar_Pprint.op_Hat_Hat uu____9814 uu____9815  in
                        FStar_Pprint.op_Hat_Hat uu____9811 uu____9813  in
                      FStar_Pprint.group uu____9810  in
                    let uu____9817 = p_argTerm e2  in
                    FStar_Pprint.op_Hat_Slash_Hat uu____9809 uu____9817  in
                  FStar_Pprint.op_Hat_Slash_Hat uu____9807 uu____9808
              | uu____9818 ->
                  let uu____9825 =
                    let uu____9836 = FStar_ST.op_Bang should_print_fs_typ_app
                       in
                    if uu____9836
                    then
                      let uu____9870 =
                        FStar_Util.take
                          (fun uu____9894  ->
                             match uu____9894 with
                             | (uu____9900,aq) ->
                                 aq = FStar_Parser_AST.FsTypApp) args
                         in
                      match uu____9870 with
                      | (fs_typ_args,args1) ->
                          let uu____9938 =
                            let uu____9939 = p_indexingTerm head1  in
                            let uu____9940 =
                              let uu____9941 =
                                FStar_Pprint.op_Hat_Hat FStar_Pprint.comma
                                  break1
                                 in
                              soft_surround_map_or_flow (Prims.of_int (2))
                                Prims.int_zero FStar_Pprint.empty
                                FStar_Pprint.langle uu____9941
                                FStar_Pprint.rangle p_fsTypArg fs_typ_args
                               in
                            FStar_Pprint.op_Hat_Hat uu____9939 uu____9940  in
                          (uu____9938, args1)
                    else
                      (let uu____9956 = p_indexingTerm head1  in
                       (uu____9956, args))
                     in
                  (match uu____9825 with
                   | (head_doc,args1) ->
                       let uu____9977 =
                         let uu____9978 =
                           FStar_Pprint.op_Hat_Hat head_doc
                             FStar_Pprint.space
                            in
                         soft_surround_map_or_flow (Prims.of_int (2))
                           Prims.int_zero head_doc uu____9978 break1
                           FStar_Pprint.empty p_argTerm args1
                          in
                       FStar_Pprint.group uu____9977)))
    | FStar_Parser_AST.Construct (lid,args) when
        (is_general_construction e) &&
          (let uu____10000 =
             (is_dtuple_constructor lid) && (all1_explicit args)  in
           Prims.op_Negation uu____10000)
        ->
        (match args with
         | [] -> p_quident lid
         | arg::[] ->
             let uu____10019 =
               let uu____10020 = p_quident lid  in
               let uu____10021 = p_argTerm arg  in
               FStar_Pprint.op_Hat_Slash_Hat uu____10020 uu____10021  in
             FStar_Pprint.group uu____10019
         | hd1::tl1 ->
             let uu____10038 =
               let uu____10039 =
                 let uu____10040 =
                   let uu____10041 = p_quident lid  in
                   let uu____10042 = p_argTerm hd1  in
                   prefix2 uu____10041 uu____10042  in
                 FStar_Pprint.group uu____10040  in
               let uu____10043 =
                 let uu____10044 =
                   FStar_Pprint.separate_map break1 p_argTerm tl1  in
                 jump2 uu____10044  in
               FStar_Pprint.op_Hat_Hat uu____10039 uu____10043  in
             FStar_Pprint.group uu____10038)
    | uu____10049 -> p_indexingTerm e

and (p_argTerm :
  (FStar_Parser_AST.term * FStar_Parser_AST.imp) -> FStar_Pprint.document) =
  fun arg_imp  ->
    match arg_imp with
    | (u,FStar_Parser_AST.UnivApp ) -> p_universe u
    | (e,FStar_Parser_AST.FsTypApp ) ->
        (FStar_Errors.log_issue e.FStar_Parser_AST.range
           (FStar_Errors.Warning_UnexpectedFsTypApp,
             "Unexpected FsTypApp, output might not be formatted correctly.");
         (let uu____10060 = p_indexingTerm e  in
          FStar_Pprint.surround (Prims.of_int (2)) Prims.int_one
            FStar_Pprint.langle uu____10060 FStar_Pprint.rangle))
    | (e,FStar_Parser_AST.Hash ) ->
        let uu____10064 = str "#"  in
        let uu____10066 = p_indexingTerm e  in
        FStar_Pprint.op_Hat_Hat uu____10064 uu____10066
    | (e,FStar_Parser_AST.HashBrace t) ->
        let uu____10069 = str "#["  in
        let uu____10071 =
          let uu____10072 = p_indexingTerm t  in
          let uu____10073 =
            let uu____10074 = str "]"  in
            let uu____10076 = p_indexingTerm e  in
            FStar_Pprint.op_Hat_Hat uu____10074 uu____10076  in
          FStar_Pprint.op_Hat_Hat uu____10072 uu____10073  in
        FStar_Pprint.op_Hat_Hat uu____10069 uu____10071
    | (e,FStar_Parser_AST.Infix ) -> p_indexingTerm e
    | (e,FStar_Parser_AST.Nothing ) -> p_indexingTerm e

and (p_fsTypArg :
  (FStar_Parser_AST.term * FStar_Parser_AST.imp) -> FStar_Pprint.document) =
  fun uu____10079  ->
    match uu____10079 with | (e,uu____10085) -> p_indexingTerm e

and (p_indexingTerm_aux :
  (FStar_Parser_AST.term -> FStar_Pprint.document) ->
    FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun exit1  ->
    fun e  ->
      match e.FStar_Parser_AST.tm with
      | FStar_Parser_AST.Op
          ({ FStar_Ident.idText = ".()"; FStar_Ident.idRange = uu____10090;_},e1::e2::[])
          ->
          let uu____10096 =
            let uu____10097 = p_indexingTerm_aux p_atomicTermNotQUident e1
               in
            let uu____10098 =
              let uu____10099 =
                let uu____10100 = p_term false false e2  in
                soft_parens_with_nesting uu____10100  in
              FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____10099  in
            FStar_Pprint.op_Hat_Hat uu____10097 uu____10098  in
          FStar_Pprint.group uu____10096
      | FStar_Parser_AST.Op
          ({ FStar_Ident.idText = ".[]"; FStar_Ident.idRange = uu____10103;_},e1::e2::[])
          ->
          let uu____10109 =
            let uu____10110 = p_indexingTerm_aux p_atomicTermNotQUident e1
               in
            let uu____10111 =
              let uu____10112 =
                let uu____10113 = p_term false false e2  in
                soft_brackets_with_nesting uu____10113  in
              FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____10112  in
            FStar_Pprint.op_Hat_Hat uu____10110 uu____10111  in
          FStar_Pprint.group uu____10109
      | uu____10116 -> exit1 e

and (p_indexingTerm : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  -> p_indexingTerm_aux p_atomicTerm e

and (p_atomicTerm : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.LetOpen (lid,e1) ->
        let uu____10121 = p_quident lid  in
        let uu____10122 =
          let uu____10123 =
            let uu____10124 = p_term false false e1  in
            soft_parens_with_nesting uu____10124  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____10123  in
        FStar_Pprint.op_Hat_Hat uu____10121 uu____10122
    | FStar_Parser_AST.Name lid -> p_quident lid
    | FStar_Parser_AST.Op (op,e1::[]) when is_general_prefix_op op ->
        let uu____10132 =
          let uu____10133 = FStar_Ident.text_of_id op  in str uu____10133  in
        let uu____10135 = p_atomicTerm e1  in
        FStar_Pprint.op_Hat_Hat uu____10132 uu____10135
    | uu____10136 -> p_atomicTermNotQUident e

and (p_atomicTermNotQUident : FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Wild  -> FStar_Pprint.underscore
    | FStar_Parser_AST.Var lid when
        FStar_Ident.lid_equals lid FStar_Parser_Const.assert_lid ->
        str "assert"
    | FStar_Parser_AST.Var lid when
        FStar_Ident.lid_equals lid FStar_Parser_Const.assume_lid ->
        str "assume"
    | FStar_Parser_AST.Tvar tv -> p_tvar tv
    | FStar_Parser_AST.Const c ->
        (match c with
         | FStar_Const.Const_char x when x = 10 -> str "0x0Az"
         | uu____10149 -> p_constant c)
    | FStar_Parser_AST.Name lid when
        FStar_Ident.lid_equals lid FStar_Parser_Const.true_lid -> str "True"
    | FStar_Parser_AST.Name lid when
        FStar_Ident.lid_equals lid FStar_Parser_Const.false_lid ->
        str "False"
    | FStar_Parser_AST.Op (op,e1::[]) when is_general_prefix_op op ->
        let uu____10158 =
          let uu____10159 = FStar_Ident.text_of_id op  in str uu____10159  in
        let uu____10161 = p_atomicTermNotQUident e1  in
        FStar_Pprint.op_Hat_Hat uu____10158 uu____10161
    | FStar_Parser_AST.Op (op,[]) ->
        let uu____10165 =
          let uu____10166 =
            let uu____10167 =
              let uu____10168 = FStar_Ident.text_of_id op  in str uu____10168
               in
            let uu____10170 =
              FStar_Pprint.op_Hat_Hat FStar_Pprint.space FStar_Pprint.rparen
               in
            FStar_Pprint.op_Hat_Hat uu____10167 uu____10170  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____10166  in
        FStar_Pprint.op_Hat_Hat FStar_Pprint.lparen uu____10165
    | FStar_Parser_AST.Construct (lid,args) when
        (is_dtuple_constructor lid) && (all1_explicit args) ->
        let uu____10185 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.lparen FStar_Pprint.bar  in
        let uu____10186 =
          let uu____10187 = FStar_Pprint.op_Hat_Hat FStar_Pprint.comma break1
             in
          FStar_Pprint.separate_map uu____10187
            (fun uu____10195  ->
               match uu____10195 with | (e1,uu____10201) -> p_tmEq e1) args
           in
        let uu____10202 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.bar FStar_Pprint.rparen  in
        FStar_Pprint.surround (Prims.of_int (2)) Prims.int_one uu____10185
          uu____10186 uu____10202
    | FStar_Parser_AST.Project (e1,lid) ->
        let uu____10207 =
          let uu____10208 = p_atomicTermNotQUident e1  in
          let uu____10209 =
            let uu____10210 = p_qlident lid  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____10210  in
          FStar_Pprint.prefix (Prims.of_int (2)) Prims.int_zero uu____10208
            uu____10209
           in
        FStar_Pprint.group uu____10207
    | uu____10213 -> p_projectionLHS e

and (p_projectionLHS : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Var lid -> p_qlident lid
    | FStar_Parser_AST.Projector (constr_lid,field_lid) ->
        let uu____10218 = p_quident constr_lid  in
        let uu____10219 =
          let uu____10220 =
            let uu____10221 = p_lident field_lid  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____10221  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.qmark uu____10220  in
        FStar_Pprint.op_Hat_Hat uu____10218 uu____10219
    | FStar_Parser_AST.Discrim constr_lid ->
        let uu____10223 = p_quident constr_lid  in
        FStar_Pprint.op_Hat_Hat uu____10223 FStar_Pprint.qmark
    | FStar_Parser_AST.Paren e1 ->
        let uu____10225 = p_term_sep false false e1  in
        (match uu____10225 with
         | (comm,t) ->
             let doc = soft_parens_with_nesting t  in
             if comm = FStar_Pprint.empty
             then doc
             else
               (let uu____10238 =
                  FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline doc  in
                FStar_Pprint.op_Hat_Hat comm uu____10238))
    | uu____10239 when is_array e ->
        let es = extract_from_list e  in
        let uu____10243 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.lbracket FStar_Pprint.bar  in
        let uu____10244 =
          let uu____10245 = FStar_Pprint.op_Hat_Hat FStar_Pprint.semi break1
             in
          separate_map_or_flow_last uu____10245
            (fun ps  -> p_noSeqTermAndComment ps false) es
           in
        let uu____10250 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.bar FStar_Pprint.rbracket  in
        FStar_Pprint.surround (Prims.of_int (2)) Prims.int_zero uu____10243
          uu____10244 uu____10250
    | uu____10253 when is_list e ->
        let uu____10254 =
          let uu____10255 = FStar_Pprint.op_Hat_Hat FStar_Pprint.semi break1
             in
          let uu____10256 = extract_from_list e  in
          separate_map_or_flow_last uu____10255
            (fun ps  -> p_noSeqTermAndComment ps false) uu____10256
           in
        FStar_Pprint.surround (Prims.of_int (2)) Prims.int_zero
          FStar_Pprint.lbracket uu____10254 FStar_Pprint.rbracket
    | uu____10265 when is_lex_list e ->
        let uu____10266 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.percent FStar_Pprint.lbracket
           in
        let uu____10267 =
          let uu____10268 = FStar_Pprint.op_Hat_Hat FStar_Pprint.semi break1
             in
          let uu____10269 = extract_from_list e  in
          separate_map_or_flow_last uu____10268
            (fun ps  -> p_noSeqTermAndComment ps false) uu____10269
           in
        FStar_Pprint.surround (Prims.of_int (2)) Prims.int_one uu____10266
          uu____10267 FStar_Pprint.rbracket
    | uu____10278 when is_ref_set e ->
        let es = extract_from_ref_set e  in
        let uu____10282 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.bang FStar_Pprint.lbrace  in
        let uu____10283 =
          let uu____10284 = FStar_Pprint.op_Hat_Hat FStar_Pprint.comma break1
             in
          separate_map_or_flow uu____10284 p_appTerm es  in
        FStar_Pprint.surround (Prims.of_int (2)) Prims.int_zero uu____10282
          uu____10283 FStar_Pprint.rbrace
    | FStar_Parser_AST.Labeled (e1,s,b) ->
        let uu____10294 = str (Prims.op_Hat "(*" (Prims.op_Hat s "*)"))  in
        let uu____10297 = p_term false false e1  in
        FStar_Pprint.op_Hat_Slash_Hat uu____10294 uu____10297
    | FStar_Parser_AST.Op (op,args) when
        let uu____10306 = handleable_op op args  in
        Prims.op_Negation uu____10306 ->
        let uu____10308 =
          let uu____10310 =
            let uu____10312 = FStar_Ident.text_of_id op  in
            let uu____10314 =
              let uu____10316 =
                let uu____10318 =
                  FStar_Util.string_of_int (FStar_List.length args)  in
                Prims.op_Hat uu____10318
                  " arguments couldn't be handled by the pretty printer"
                 in
              Prims.op_Hat " with " uu____10316  in
            Prims.op_Hat uu____10312 uu____10314  in
          Prims.op_Hat "Operation " uu____10310  in
        failwith uu____10308
    | FStar_Parser_AST.Uvar id1 ->
        failwith "Unexpected universe variable out of universe context"
    | FStar_Parser_AST.Wild  ->
        let uu____10325 = p_term false false e  in
        soft_parens_with_nesting uu____10325
    | FStar_Parser_AST.Const uu____10328 ->
        let uu____10329 = p_term false false e  in
        soft_parens_with_nesting uu____10329
    | FStar_Parser_AST.Op uu____10332 ->
        let uu____10339 = p_term false false e  in
        soft_parens_with_nesting uu____10339
    | FStar_Parser_AST.Tvar uu____10342 ->
        let uu____10343 = p_term false false e  in
        soft_parens_with_nesting uu____10343
    | FStar_Parser_AST.Var uu____10346 ->
        let uu____10347 = p_term false false e  in
        soft_parens_with_nesting uu____10347
    | FStar_Parser_AST.Name uu____10350 ->
        let uu____10351 = p_term false false e  in
        soft_parens_with_nesting uu____10351
    | FStar_Parser_AST.Construct uu____10354 ->
        let uu____10365 = p_term false false e  in
        soft_parens_with_nesting uu____10365
    | FStar_Parser_AST.Abs uu____10368 ->
        let uu____10375 = p_term false false e  in
        soft_parens_with_nesting uu____10375
    | FStar_Parser_AST.App uu____10378 ->
        let uu____10385 = p_term false false e  in
        soft_parens_with_nesting uu____10385
    | FStar_Parser_AST.Let uu____10388 ->
        let uu____10409 = p_term false false e  in
        soft_parens_with_nesting uu____10409
    | FStar_Parser_AST.LetOpen uu____10412 ->
        let uu____10417 = p_term false false e  in
        soft_parens_with_nesting uu____10417
    | FStar_Parser_AST.Seq uu____10420 ->
        let uu____10425 = p_term false false e  in
        soft_parens_with_nesting uu____10425
    | FStar_Parser_AST.Bind uu____10428 ->
        let uu____10435 = p_term false false e  in
        soft_parens_with_nesting uu____10435
    | FStar_Parser_AST.If uu____10438 ->
        let uu____10445 = p_term false false e  in
        soft_parens_with_nesting uu____10445
    | FStar_Parser_AST.Match uu____10448 ->
        let uu____10463 = p_term false false e  in
        soft_parens_with_nesting uu____10463
    | FStar_Parser_AST.TryWith uu____10466 ->
        let uu____10481 = p_term false false e  in
        soft_parens_with_nesting uu____10481
    | FStar_Parser_AST.Ascribed uu____10484 ->
        let uu____10493 = p_term false false e  in
        soft_parens_with_nesting uu____10493
    | FStar_Parser_AST.Record uu____10496 ->
        let uu____10509 = p_term false false e  in
        soft_parens_with_nesting uu____10509
    | FStar_Parser_AST.Project uu____10512 ->
        let uu____10517 = p_term false false e  in
        soft_parens_with_nesting uu____10517
    | FStar_Parser_AST.Product uu____10520 ->
        let uu____10527 = p_term false false e  in
        soft_parens_with_nesting uu____10527
    | FStar_Parser_AST.Sum uu____10530 ->
        let uu____10541 = p_term false false e  in
        soft_parens_with_nesting uu____10541
    | FStar_Parser_AST.QForall uu____10544 ->
        let uu____10563 = p_term false false e  in
        soft_parens_with_nesting uu____10563
    | FStar_Parser_AST.QExists uu____10566 ->
        let uu____10585 = p_term false false e  in
        soft_parens_with_nesting uu____10585
    | FStar_Parser_AST.Refine uu____10588 ->
        let uu____10593 = p_term false false e  in
        soft_parens_with_nesting uu____10593
    | FStar_Parser_AST.NamedTyp uu____10596 ->
        let uu____10601 = p_term false false e  in
        soft_parens_with_nesting uu____10601
    | FStar_Parser_AST.Requires uu____10604 ->
        let uu____10612 = p_term false false e  in
        soft_parens_with_nesting uu____10612
    | FStar_Parser_AST.Ensures uu____10615 ->
        let uu____10623 = p_term false false e  in
        soft_parens_with_nesting uu____10623
    | FStar_Parser_AST.Attributes uu____10626 ->
        let uu____10629 = p_term false false e  in
        soft_parens_with_nesting uu____10629
    | FStar_Parser_AST.Quote uu____10632 ->
        let uu____10637 = p_term false false e  in
        soft_parens_with_nesting uu____10637
    | FStar_Parser_AST.VQuote uu____10640 ->
        let uu____10641 = p_term false false e  in
        soft_parens_with_nesting uu____10641
    | FStar_Parser_AST.Antiquote uu____10644 ->
        let uu____10645 = p_term false false e  in
        soft_parens_with_nesting uu____10645
    | FStar_Parser_AST.CalcProof uu____10648 ->
        let uu____10657 = p_term false false e  in
        soft_parens_with_nesting uu____10657

and (p_constant : FStar_Const.sconst -> FStar_Pprint.document) =
  fun uu___15_10660  ->
    match uu___15_10660 with
    | FStar_Const.Const_effect  -> str "Effect"
    | FStar_Const.Const_unit  -> str "()"
    | FStar_Const.Const_bool b -> FStar_Pprint.doc_of_bool b
    | FStar_Const.Const_real r -> str (Prims.op_Hat r "R")
    | FStar_Const.Const_float x -> str (FStar_Util.string_of_float x)
    | FStar_Const.Const_char x -> FStar_Pprint.doc_of_char x
    | FStar_Const.Const_string (s,uu____10672) ->
        let uu____10675 = str (FStar_String.escaped s)  in
        FStar_Pprint.dquotes uu____10675
    | FStar_Const.Const_bytearray (bytes,uu____10677) ->
        let uu____10682 =
          let uu____10683 = str (FStar_Util.string_of_bytes bytes)  in
          FStar_Pprint.dquotes uu____10683  in
        let uu____10684 = str "B"  in
        FStar_Pprint.op_Hat_Hat uu____10682 uu____10684
    | FStar_Const.Const_int (repr,sign_width_opt) ->
        let signedness uu___13_10707 =
          match uu___13_10707 with
          | FStar_Const.Unsigned  -> str "u"
          | FStar_Const.Signed  -> FStar_Pprint.empty  in
        let width uu___14_10714 =
          match uu___14_10714 with
          | FStar_Const.Int8  -> str "y"
          | FStar_Const.Int16  -> str "s"
          | FStar_Const.Int32  -> str "l"
          | FStar_Const.Int64  -> str "L"  in
        let ending =
          default_or_map FStar_Pprint.empty
            (fun uu____10729  ->
               match uu____10729 with
               | (s,w) ->
                   let uu____10736 = signedness s  in
                   let uu____10737 = width w  in
                   FStar_Pprint.op_Hat_Hat uu____10736 uu____10737)
            sign_width_opt
           in
        let uu____10738 = str repr  in
        FStar_Pprint.op_Hat_Hat uu____10738 ending
    | FStar_Const.Const_range_of  -> str "range_of"
    | FStar_Const.Const_set_range_of  -> str "set_range_of"
    | FStar_Const.Const_range r ->
        let uu____10742 = FStar_Range.string_of_range r  in str uu____10742
    | FStar_Const.Const_reify  -> str "reify"
    | FStar_Const.Const_reflect lid ->
        let uu____10746 = p_quident lid  in
        let uu____10747 =
          let uu____10748 =
            let uu____10749 = str "reflect"  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____10749  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.qmark uu____10748  in
        FStar_Pprint.op_Hat_Hat uu____10746 uu____10747

and (p_universe : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun u  ->
    let uu____10752 = str "u#"  in
    let uu____10754 = p_atomicUniverse u  in
    FStar_Pprint.op_Hat_Hat uu____10752 uu____10754

and (p_universeFrom : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun u  ->
    match u.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Op
        ({ FStar_Ident.idText = "+"; FStar_Ident.idRange = uu____10756;_},u1::u2::[])
        ->
        let uu____10762 =
          let uu____10763 = p_universeFrom u1  in
          let uu____10764 =
            let uu____10765 = p_universeFrom u2  in
            FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.plus uu____10765  in
          FStar_Pprint.op_Hat_Slash_Hat uu____10763 uu____10764  in
        FStar_Pprint.group uu____10762
    | FStar_Parser_AST.App uu____10766 ->
        let uu____10773 = head_and_args u  in
        (match uu____10773 with
         | (head1,args) ->
             (match head1.FStar_Parser_AST.tm with
              | FStar_Parser_AST.Var maybe_max_lid when
                  FStar_Ident.lid_equals maybe_max_lid
                    FStar_Parser_Const.max_lid
                  ->
                  let uu____10799 =
                    let uu____10800 = p_qlident FStar_Parser_Const.max_lid
                       in
                    let uu____10801 =
                      FStar_Pprint.separate_map FStar_Pprint.space
                        (fun uu____10809  ->
                           match uu____10809 with
                           | (u1,uu____10815) -> p_atomicUniverse u1) args
                       in
                    op_Hat_Slash_Plus_Hat uu____10800 uu____10801  in
                  FStar_Pprint.group uu____10799
              | uu____10816 ->
                  let uu____10817 =
                    let uu____10819 = FStar_Parser_AST.term_to_string u  in
                    FStar_Util.format1 "Invalid term in universe context %s"
                      uu____10819
                     in
                  failwith uu____10817))
    | uu____10822 -> p_atomicUniverse u

and (p_atomicUniverse : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun u  ->
    match u.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Wild  -> FStar_Pprint.underscore
    | FStar_Parser_AST.Const (FStar_Const.Const_int (r,sw)) ->
        p_constant (FStar_Const.Const_int (r, sw))
    | FStar_Parser_AST.Uvar id1 ->
        let uu____10848 = FStar_Ident.text_of_id id1  in str uu____10848
    | FStar_Parser_AST.Paren u1 ->
        let uu____10851 = p_universeFrom u1  in
        soft_parens_with_nesting uu____10851
    | FStar_Parser_AST.Op
        ({ FStar_Ident.idText = "+"; FStar_Ident.idRange = uu____10852;_},uu____10853::uu____10854::[])
        ->
        let uu____10858 = p_universeFrom u  in
        soft_parens_with_nesting uu____10858
    | FStar_Parser_AST.App uu____10859 ->
        let uu____10866 = p_universeFrom u  in
        soft_parens_with_nesting uu____10866
    | uu____10867 ->
        let uu____10868 =
          let uu____10870 = FStar_Parser_AST.term_to_string u  in
          FStar_Util.format1 "Invalid term in universe context %s"
            uu____10870
           in
        failwith uu____10868

let (term_to_document : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    FStar_ST.op_Colon_Equals unfold_tuples false; p_term false false e
  
let (signature_to_document : FStar_Parser_AST.decl -> FStar_Pprint.document)
  = fun e  -> p_justSig e 
let (decl_to_document : FStar_Parser_AST.decl -> FStar_Pprint.document) =
  fun e  -> p_decl e 
let (pat_to_document : FStar_Parser_AST.pattern -> FStar_Pprint.document) =
  fun p  -> p_disjunctivePattern p 
let (binder_to_document : FStar_Parser_AST.binder -> FStar_Pprint.document) =
  fun b  -> p_binder true b 
let (modul_to_document : FStar_Parser_AST.modul -> FStar_Pprint.document) =
  fun m  ->
    FStar_ST.op_Colon_Equals should_print_fs_typ_app false;
    (let res =
       match m with
       | FStar_Parser_AST.Module (uu____10959,decls) ->
           let uu____10965 =
             FStar_All.pipe_right decls (FStar_List.map decl_to_document)  in
           FStar_All.pipe_right uu____10965
             (FStar_Pprint.separate FStar_Pprint.hardline)
       | FStar_Parser_AST.Interface (uu____10974,decls,uu____10976) ->
           let uu____10983 =
             FStar_All.pipe_right decls (FStar_List.map decl_to_document)  in
           FStar_All.pipe_right uu____10983
             (FStar_Pprint.separate FStar_Pprint.hardline)
        in
     FStar_ST.op_Colon_Equals should_print_fs_typ_app false; res)
  
let (comments_to_document :
  (Prims.string * FStar_Range.range) Prims.list -> FStar_Pprint.document) =
  fun comments  ->
    FStar_Pprint.separate_map FStar_Pprint.hardline
      (fun uu____11043  ->
         match uu____11043 with | (comment,range) -> str comment) comments
  
let (extract_decl_range : FStar_Parser_AST.decl -> decl_meta) =
  fun d  ->
    let has_qs =
      match ((d.FStar_Parser_AST.quals), (d.FStar_Parser_AST.d)) with
      | ((FStar_Parser_AST.Assumption )::[],FStar_Parser_AST.Assume
         (id1,uu____11065)) -> false
      | ([],uu____11069) -> false
      | uu____11073 -> true  in
    {
      r = (d.FStar_Parser_AST.drange);
      has_qs;
      has_attrs =
        (Prims.op_Negation (FStar_List.isEmpty d.FStar_Parser_AST.attrs))
    }
  
let (modul_with_comments_to_document :
  FStar_Parser_AST.modul ->
    (Prims.string * FStar_Range.range) Prims.list ->
      (FStar_Pprint.document * (Prims.string * FStar_Range.range) Prims.list))
  =
  fun m  ->
    fun comments  ->
      let decls =
        match m with
        | FStar_Parser_AST.Module (uu____11122,decls) -> decls
        | FStar_Parser_AST.Interface (uu____11128,decls,uu____11130) -> decls
         in
      FStar_ST.op_Colon_Equals should_print_fs_typ_app false;
      (match decls with
       | [] -> (FStar_Pprint.empty, comments)
       | d::ds ->
           let uu____11182 =
             match ds with
             | {
                 FStar_Parser_AST.d = FStar_Parser_AST.Pragma
                   (FStar_Parser_AST.LightOff );
                 FStar_Parser_AST.drange = uu____11195;
                 FStar_Parser_AST.quals = uu____11196;
                 FStar_Parser_AST.attrs = uu____11197;_}::uu____11198 ->
                 let d0 = FStar_List.hd ds  in
                 let uu____11202 =
                   let uu____11205 =
                     let uu____11208 = FStar_List.tl ds  in d :: uu____11208
                      in
                   d0 :: uu____11205  in
                 (uu____11202, (d0.FStar_Parser_AST.drange))
             | uu____11213 -> ((d :: ds), (d.FStar_Parser_AST.drange))  in
           (match uu____11182 with
            | (decls1,first_range) ->
                (FStar_ST.op_Colon_Equals comment_stack comments;
                 (let initial_comment =
                    let uu____11270 = FStar_Range.start_of_range first_range
                       in
                    place_comments_until_pos Prims.int_zero Prims.int_one
                      uu____11270 dummy_meta FStar_Pprint.empty false true
                     in
                  let doc =
                    separate_map_with_comments FStar_Pprint.empty
                      FStar_Pprint.empty p_decl decls1 extract_decl_range
                     in
                  let comments1 = FStar_ST.op_Bang comment_stack  in
                  FStar_ST.op_Colon_Equals comment_stack [];
                  FStar_ST.op_Colon_Equals should_print_fs_typ_app false;
                  (let uu____11379 =
                     FStar_Pprint.op_Hat_Hat initial_comment doc  in
                   (uu____11379, comments1))))))
  