open Prims
let main : 'Auu____6 'Auu____7 . 'Auu____6 -> 'Auu____7 =
  fun argv  ->
    FStar_Util.print_string "Initializing ...\n";
    (try
       (fun uu___3_19  ->
          match () with
          | () ->
              ((let uu____21 = FStar_Tests_Pars.init ()  in
                FStar_All.pipe_right uu____21 (fun a1  -> ()));
               FStar_Tests_Norm.run_all ();
               (let uu____186 = FStar_Tests_Unif.run_all ()  in
                if uu____186
                then ()
                else FStar_All.exit (Prims.parse_int "1"));
               FStar_All.exit (Prims.parse_int "0"))) ()
     with
     | FStar_Errors.Error (err,msg,r) when
         let uu____204 = FStar_Options.trace_error ()  in
         FStar_All.pipe_left Prims.op_Negation uu____204 ->
         (if r = FStar_Range.dummyRange
          then FStar_Util.print_string msg
          else
            (let uu____212 = FStar_Range.string_of_range r  in
             FStar_Util.print2 "%s: %s\n" uu____212 msg);
          FStar_All.exit (Prims.parse_int "1")))
  