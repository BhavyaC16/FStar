open Prims
let (has_cygpath : Prims.bool) =
  try
    (fun uu___2_4 ->
       match () with
       | () ->
           let t_out =
             FStar_Util.run_process "has_cygpath" "which" ["cygpath"]
               FStar_Pervasives_Native.None in
           (FStar_Util.trim_string t_out) = "/usr/bin/cygpath") ()
  with | uu___1_17 -> false
let (try_convert_file_name_to_mixed : Prims.string -> Prims.string) =
  let cache = FStar_Util.smap_create (Prims.of_int (20)) in
  fun s ->
    if has_cygpath && (FStar_Util.starts_with s "/")
    then
      let uu____38 = FStar_Util.smap_try_find cache s in
      match uu____38 with
      | FStar_Pervasives_Native.Some s1 -> s1
      | FStar_Pervasives_Native.None ->
          let label = "try_convert_file_name_to_mixed" in
          let out =
            let uu____53 =
              FStar_Util.run_process label "cygpath" ["-m"; s]
                FStar_Pervasives_Native.None in
            FStar_All.pipe_right uu____53 FStar_Util.trim_string in
          (FStar_Util.smap_add cache s out; out)
    else s
let snapshot :
  'a 'b 'c .
    ('a -> 'b) -> 'c Prims.list FStar_ST.ref -> 'a -> (Prims.int * 'b)
  =
  fun push ->
    fun stackref ->
      fun arg ->
        FStar_Util.atomically
          (fun uu____123 ->
             let len =
               let uu____125 = FStar_ST.op_Bang stackref in
               FStar_List.length uu____125 in
             let arg' = push arg in (len, arg'))
let rollback :
  'a 'c .
    (unit -> 'a) ->
      'c Prims.list FStar_ST.ref ->
        Prims.int FStar_Pervasives_Native.option -> 'a
  =
  fun pop ->
    fun stackref ->
      fun depth ->
        let rec aux n =
          if n <= Prims.int_zero
          then failwith "Too many pops"
          else
            if n = Prims.int_one
            then pop ()
            else ((let uu____218 = pop () in ()); aux (n - Prims.int_one)) in
        let curdepth =
          let uu____221 = FStar_ST.op_Bang stackref in
          FStar_List.length uu____221 in
        let n =
          match depth with
          | FStar_Pervasives_Native.Some d -> curdepth - d
          | FStar_Pervasives_Native.None -> Prims.int_one in
        FStar_Util.atomically (fun uu____256 -> aux n)
let raise_failed_assertion : 'uuuuuu262 . Prims.string -> 'uuuuuu262 =
  fun msg ->
    let uu____270 = FStar_Util.format1 "Assertion failed: %s" msg in
    failwith uu____270
let (runtime_assert : Prims.bool -> Prims.string -> unit) =
  fun b ->
    fun msg -> if Prims.op_Negation b then raise_failed_assertion msg else ()
let string_of_list :
  'a . ('a -> Prims.string) -> 'a Prims.list -> Prims.string =
  fun f ->
    fun l ->
      let uu____321 =
        let uu____323 =
          let uu____325 = FStar_List.map f l in
          FStar_String.concat ", " uu____325 in
        Prims.op_Hat uu____323 "]" in
      Prims.op_Hat "[" uu____321
let list_of_option : 'a . 'a FStar_Pervasives_Native.option -> 'a Prims.list
  =
  fun o ->
    match o with
    | FStar_Pervasives_Native.None -> []
    | FStar_Pervasives_Native.Some x -> [x]
let string_of_option :
  'uuuuuu360 .
    ('uuuuuu360 -> Prims.string) ->
      'uuuuuu360 FStar_Pervasives_Native.option -> Prims.string
  =
  fun f ->
    fun uu___0_377 ->
      match uu___0_377 with
      | FStar_Pervasives_Native.None -> "None"
      | FStar_Pervasives_Native.Some x ->
          let uu____385 = f x in Prims.op_Hat "Some " uu____385
let tabulate : 'a . Prims.int -> (Prims.int -> 'a) -> 'a Prims.list =
  fun n ->
    fun f ->
      let rec aux i =
        if i < n
        then
          let uu____430 = f i in
          let uu____431 = aux (i + Prims.int_one) in uu____430 :: uu____431
        else [] in
      aux Prims.int_zero
let rec max_prefix :
  'a . ('a -> Prims.bool) -> 'a Prims.list -> ('a Prims.list * 'a Prims.list)
  =
  fun f ->
    fun xs ->
      match xs with
      | [] -> ([], [])
      | x::xs1 when f x ->
          let uu____484 = max_prefix f xs1 in
          (match uu____484 with | (l, r) -> ((x :: l), r))
      | x::xs1 -> ([], (x :: xs1))
let max_suffix :
  'a . ('a -> Prims.bool) -> 'a Prims.list -> ('a Prims.list * 'a Prims.list)
  =
  fun f ->
    fun xs ->
      let rec aux acc xs1 =
        match xs1 with
        | [] -> (acc, [])
        | x::xs2 when f x -> aux (x :: acc) xs2
        | x::xs2 -> (acc, (x :: xs2)) in
      let uu____611 =
        let uu____620 = FStar_All.pipe_right xs FStar_List.rev in
        FStar_All.pipe_right uu____620 (aux []) in
      FStar_All.pipe_right uu____611
        (fun uu____656 ->
           match uu____656 with | (xs1, ys) -> ((FStar_List.rev ys), xs1))