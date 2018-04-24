
open Prims
open FStar_Pervasives

let uu___80 : unit = (FStar_Version.dummy ())


let process_args : unit  ->  (FStar_Getopt.parse_cmdline_res * Prims.string Prims.list) = (fun uu____11 -> (FStar_Options.parse_cmd_line ()))


let cleanup : unit  ->  unit = (fun uu____22 -> (FStar_Util.kill_all ()))


let finished_message : ((Prims.bool * FStar_Ident.lident) * Prims.int) Prims.list  ->  Prims.int  ->  unit = (fun fmods errs -> (

let print_to = (match ((errs > (Prims.parse_int "0"))) with
| true -> begin
FStar_Util.print_error
end
| uu____61 -> begin
FStar_Util.print_string
end)
in (

let uu____62 = (

let uu____63 = (FStar_Options.silent ())
in (not (uu____63)))
in (match (uu____62) with
| true -> begin
((FStar_All.pipe_right fmods (FStar_List.iter (fun uu____90 -> (match (uu____90) with
| ((iface1, name), time) -> begin
(

let tag = (match (iface1) with
| true -> begin
"i\'face (or impl+i\'face)"
end
| uu____107 -> begin
"module"
end)
in (

let uu____108 = (FStar_Options.should_print_message name.FStar_Ident.str)
in (match (uu____108) with
| true -> begin
(match ((time >= (Prims.parse_int "0"))) with
| true -> begin
(

let uu____109 = (

let uu____110 = (FStar_Ident.text_of_lid name)
in (

let uu____111 = (FStar_Util.string_of_int time)
in (FStar_Util.format3 "Verified %s: %s (%s milliseconds)\n" tag uu____110 uu____111)))
in (print_to uu____109))
end
| uu____112 -> begin
(

let uu____113 = (

let uu____114 = (FStar_Ident.text_of_lid name)
in (FStar_Util.format2 "Verified %s: %s\n" tag uu____114))
in (print_to uu____113))
end)
end
| uu____115 -> begin
()
end)))
end))));
(match ((errs > (Prims.parse_int "0"))) with
| true -> begin
(match ((Prims.op_Equality errs (Prims.parse_int "1"))) with
| true -> begin
(FStar_Util.print_error "1 error was reported (see above)\n")
end
| uu____116 -> begin
(

let uu____117 = (FStar_Util.string_of_int errs)
in (FStar_Util.print1_error "%s errors were reported (see above)\n" uu____117))
end)
end
| uu____118 -> begin
(

let uu____119 = (FStar_Util.colorize_bold "All verification conditions discharged successfully")
in (FStar_Util.print1 "%s\n" uu____119))
end);
)
end
| uu____120 -> begin
()
end))))


let report_errors : ((Prims.bool * FStar_Ident.lident) * Prims.int) Prims.list  ->  unit = (fun fmods -> ((

let uu____147 = (FStar_Errors.report_all ())
in (FStar_All.pipe_right uu____147 (fun a244 -> ())));
(

let nerrs = (FStar_Errors.get_err_count ())
in (match ((nerrs > (Prims.parse_int "0"))) with
| true -> begin
((finished_message fmods nerrs);
(FStar_All.exit (Prims.parse_int "1"));
)
end
| uu____154 -> begin
()
end));
))


let codegen : (FStar_Syntax_Syntax.modul Prims.list * FStar_TypeChecker_Env.env * FStar_Universal.delta_env)  ->  unit = (fun uu____167 -> (match (uu____167) with
| (umods, env, delta1) -> begin
(

let opt = (FStar_Options.codegen ())
in (match ((Prims.op_disEquality opt FStar_Pervasives_Native.None)) with
| true -> begin
(

let env1 = (FStar_Universal.apply_delta_env env delta1)
in (

let mllibs = (

let uu____196 = (

let uu____205 = (FStar_Extraction_ML_UEnv.mkContext env1)
in (FStar_Util.fold_map FStar_Extraction_ML_Modul.extract uu____205 umods))
in (FStar_All.pipe_left FStar_Pervasives_Native.snd uu____196))
in (

let mllibs1 = (FStar_List.flatten mllibs)
in (

let ext = (match (opt) with
| FStar_Pervasives_Native.Some (FStar_Options.FSharp) -> begin
".fs"
end
| FStar_Pervasives_Native.Some (FStar_Options.OCaml) -> begin
".ml"
end
| FStar_Pervasives_Native.Some (FStar_Options.Plugin) -> begin
".ml"
end
| FStar_Pervasives_Native.Some (FStar_Options.Kremlin) -> begin
".krml"
end
| uu____228 -> begin
(failwith "Unrecognized option")
end)
in (match (opt) with
| FStar_Pervasives_Native.Some (FStar_Options.FSharp) -> begin
(

let outdir = (FStar_Options.output_dir ())
in (FStar_List.iter (FStar_Extraction_ML_PrintML.print outdir ext) mllibs1))
end
| FStar_Pervasives_Native.Some (FStar_Options.OCaml) -> begin
(

let outdir = (FStar_Options.output_dir ())
in (FStar_List.iter (FStar_Extraction_ML_PrintML.print outdir ext) mllibs1))
end
| FStar_Pervasives_Native.Some (FStar_Options.Plugin) -> begin
(

let outdir = (FStar_Options.output_dir ())
in (FStar_List.iter (FStar_Extraction_ML_PrintML.print outdir ext) mllibs1))
end
| FStar_Pervasives_Native.Some (FStar_Options.Kremlin) -> begin
(

let programs = (

let uu____243 = (FStar_List.map FStar_Extraction_Kremlin.translate mllibs1)
in (FStar_List.flatten uu____243))
in (

let bin = ((FStar_Extraction_Kremlin.current_version), (programs))
in (match (programs) with
| ((name, uu____254))::[] -> begin
(

let uu____263 = (FStar_Options.prepend_output_dir (Prims.strcat name ext))
in (FStar_Util.save_value_to_file uu____263 bin))
end
| uu____264 -> begin
(

let uu____267 = (FStar_Options.prepend_output_dir "out.krml")
in (FStar_Util.save_value_to_file uu____267 bin))
end)))
end
| uu____268 -> begin
(failwith "Unrecognized option")
end)))))
end
| uu____271 -> begin
()
end))
end))


let load_native_tactics : unit  ->  unit = (fun uu____276 -> (

let modules_to_load = (

let uu____280 = (FStar_Options.load ())
in (FStar_All.pipe_right uu____280 (FStar_List.map FStar_Ident.lid_of_str)))
in (

let ml_module_name = (fun m -> (

let uu____293 = (FStar_Extraction_ML_Util.mlpath_of_lid m)
in (FStar_All.pipe_right uu____293 FStar_Extraction_ML_Util.flatten_mlpath)))
in (

let ml_file = (fun m -> (

let uu____312 = (ml_module_name m)
in (Prims.strcat uu____312 ".ml")))
in (

let cmxs_file = (fun m -> (

let cmxs = (

let uu____320 = (ml_module_name m)
in (Prims.strcat uu____320 ".cmxs"))
in (

let uu____321 = (FStar_Options.find_file cmxs)
in (match (uu____321) with
| FStar_Pervasives_Native.Some (f) -> begin
f
end
| FStar_Pervasives_Native.None -> begin
(

let uu____325 = (

let uu____328 = (ml_file m)
in (FStar_Options.find_file uu____328))
in (match (uu____325) with
| FStar_Pervasives_Native.None -> begin
(

let uu____329 = (

let uu____334 = (

let uu____335 = (ml_file m)
in (FStar_Util.format1 "Failed to compile native tactic; extracted module %s not found" uu____335))
in ((FStar_Errors.Fatal_FailToCompileNativeTactic), (uu____334)))
in (FStar_Errors.raise_err uu____329))
end
| FStar_Pervasives_Native.Some (ml) -> begin
(

let dir = (FStar_Util.dirname ml)
in ((

let uu____339 = (

let uu____342 = (ml_module_name m)
in (uu____342)::[])
in (FStar_Tactics_Load.compile_modules dir uu____339));
(

let uu____343 = (FStar_Options.find_file cmxs)
in (match (uu____343) with
| FStar_Pervasives_Native.None -> begin
(

let uu____346 = (

let uu____351 = (FStar_Util.format1 "Failed to compile native tactic; compiled object %s not found" cmxs)
in ((FStar_Errors.Fatal_FailToCompileNativeTactic), (uu____351)))
in (FStar_Errors.raise_err uu____346))
end
| FStar_Pervasives_Native.Some (f) -> begin
f
end));
))
end))
end))))
in (

let cmxs_files = (FStar_All.pipe_right modules_to_load (FStar_List.map cmxs_file))
in ((FStar_List.iter (fun x -> (FStar_Util.print1 "cmxs file: %s\n" x)) cmxs_files);
(FStar_Tactics_Load.load_tactics cmxs_files);
)))))))


let init_warn_error : unit  ->  unit = (fun uu____367 -> (

let s = (FStar_Options.warn_error ())
in (match ((Prims.op_disEquality s "")) with
| true -> begin
(FStar_Parser_ParseIt.parse_warn_error s)
end
| uu____370 -> begin
()
end)))


let go : 'Auu____375 . 'Auu____375  ->  unit = (fun uu____380 -> (

let uu____381 = (process_args ())
in (match (uu____381) with
| (res, filenames) -> begin
(match (res) with
| FStar_Getopt.Help -> begin
((FStar_Options.display_usage ());
(FStar_All.exit (Prims.parse_int "0"));
)
end
| FStar_Getopt.Error (msg) -> begin
((FStar_Util.print_string msg);
(FStar_All.exit (Prims.parse_int "1"));
)
end
| FStar_Getopt.Success -> begin
((load_native_tactics ());
(init_warn_error ());
(

let uu____399 = (

let uu____400 = (FStar_Options.dep ())
in (Prims.op_disEquality uu____400 FStar_Pervasives_Native.None))
in (match (uu____399) with
| true -> begin
(

let uu____405 = (FStar_Parser_Dep.collect filenames)
in (match (uu____405) with
| (uu____412, deps) -> begin
(FStar_Parser_Dep.print deps)
end))
end
| uu____418 -> begin
(

let uu____419 = (((FStar_Options.use_extracted_interfaces ()) && (

let uu____421 = (FStar_Options.expose_interfaces ())
in (not (uu____421)))) && ((FStar_List.length filenames) > (Prims.parse_int "1")))
in (match (uu____419) with
| true -> begin
(

let uu____422 = (

let uu____427 = (

let uu____428 = (FStar_Util.string_of_int (FStar_List.length filenames))
in (Prims.strcat "Only one command line file is allowed if --use_extracted_interfaces is set, found %s" uu____428))
in ((FStar_Errors.Error_TooManyFiles), (uu____427)))
in (FStar_Errors.raise_error uu____422 FStar_Range.dummyRange))
end
| uu____429 -> begin
(

let uu____430 = (FStar_Options.interactive ())
in (match (uu____430) with
| true -> begin
(match (filenames) with
| [] -> begin
((FStar_Errors.log_issue FStar_Range.dummyRange ((FStar_Errors.Error_MissingFileName), ("--ide: Name of current file missing in command line invocation\n")));
(FStar_All.exit (Prims.parse_int "1"));
)
end
| (uu____432)::(uu____433)::uu____434 -> begin
((FStar_Errors.log_issue FStar_Range.dummyRange ((FStar_Errors.Error_TooManyFiles), ("--ide: Too many files in command line invocation\n")));
(FStar_All.exit (Prims.parse_int "1"));
)
end
| (filename)::[] -> begin
(

let uu____439 = (FStar_Options.legacy_interactive ())
in (match (uu____439) with
| true -> begin
(FStar_Interactive_Legacy.interactive_mode filename)
end
| uu____440 -> begin
(FStar_Interactive_Ide.interactive_mode filename)
end))
end)
end
| uu____441 -> begin
(

let uu____442 = (FStar_Options.doc ())
in (match (uu____442) with
| true -> begin
(FStar_Fsdoc_Generator.generate filenames)
end
| uu____443 -> begin
(

let uu____444 = (FStar_Options.indent ())
in (match (uu____444) with
| true -> begin
(match (FStar_Platform.is_fstar_compiler_using_ocaml) with
| true -> begin
(FStar_Indent.generate filenames)
end
| uu____445 -> begin
(failwith "You seem to be using the F#-generated version ofthe compiler ; reindenting is not known to work yet with this version")
end)
end
| uu____446 -> begin
(match (((FStar_List.length filenames) >= (Prims.parse_int "1"))) with
| true -> begin
(

let uu____447 = (FStar_Dependencies.find_deps_if_needed filenames)
in (match (uu____447) with
| (filenames1, dep_graph1) -> begin
(

let uu____460 = (FStar_Universal.batch_mode_tc filenames1 dep_graph1)
in (match (uu____460) with
| (fmods, env, delta_env) -> begin
(

let module_names_and_times = (FStar_All.pipe_right fmods (FStar_List.map (fun uu____545 -> (match (uu____545) with
| (x, t) -> begin
(((FStar_Universal.module_or_interface_name x)), (t))
end))))
in ((report_errors module_names_and_times);
(

let uu____566 = (

let uu____575 = (FStar_All.pipe_right fmods (FStar_List.map FStar_Pervasives_Native.fst))
in ((uu____575), (env), (delta_env)))
in (codegen uu____566));
(report_errors module_names_and_times);
(finished_message module_names_and_times (Prims.parse_int "0"));
))
end))
end))
end
| uu____598 -> begin
(FStar_Errors.log_issue FStar_Range.dummyRange ((FStar_Errors.Error_MissingFileName), ("no file provided\n")))
end)
end))
end))
end))
end))
end));
)
end)
end)))


let lazy_chooser : FStar_Syntax_Syntax.lazy_kind  ->  FStar_Syntax_Syntax.lazyinfo  ->  FStar_Syntax_Syntax.term = (fun k i -> (match (k) with
| FStar_Syntax_Syntax.BadLazy -> begin
(failwith "lazy chooser: got a BadLazy")
end
| FStar_Syntax_Syntax.Lazy_bv -> begin
(FStar_Reflection_Embeddings.unfold_lazy_bv i)
end
| FStar_Syntax_Syntax.Lazy_binder -> begin
(FStar_Reflection_Embeddings.unfold_lazy_binder i)
end
| FStar_Syntax_Syntax.Lazy_fvar -> begin
(FStar_Reflection_Embeddings.unfold_lazy_fvar i)
end
| FStar_Syntax_Syntax.Lazy_comp -> begin
(FStar_Reflection_Embeddings.unfold_lazy_comp i)
end
| FStar_Syntax_Syntax.Lazy_env -> begin
(FStar_Reflection_Embeddings.unfold_lazy_env i)
end
| FStar_Syntax_Syntax.Lazy_sigelt -> begin
(FStar_Reflection_Embeddings.unfold_lazy_sigelt i)
end
| FStar_Syntax_Syntax.Lazy_proofstate -> begin
(FStar_Tactics_Embedding.unfold_lazy_proofstate i)
end))


let setup_hooks : unit  ->  unit = (fun uu____613 -> ((FStar_ST.op_Colon_Equals FStar_Syntax_Syntax.lazy_chooser (FStar_Pervasives_Native.Some (lazy_chooser)));
(FStar_ST.op_Colon_Equals FStar_Syntax_Util.tts_f (FStar_Pervasives_Native.Some (FStar_Syntax_Print.term_to_string)));
(FStar_ST.op_Colon_Equals FStar_TypeChecker_Normalize.unembed_binder_knot (FStar_Pervasives_Native.Some (FStar_Reflection_Embeddings.e_binder)));
))


let handle_error : Prims.exn  ->  unit = (fun e -> ((match ((FStar_Errors.handleable e)) with
| true -> begin
(FStar_Errors.err_exn e)
end
| uu____754 -> begin
()
end);
(

let uu____756 = (FStar_Options.trace_error ())
in (match (uu____756) with
| true -> begin
(

let uu____757 = (FStar_Util.message_of_exn e)
in (

let uu____758 = (FStar_Util.trace_of_exn e)
in (FStar_Util.print2_error "Unexpected error\n%s\n%s\n" uu____757 uu____758)))
end
| uu____759 -> begin
(match ((not ((FStar_Errors.handleable e)))) with
| true -> begin
(

let uu____760 = (FStar_Util.message_of_exn e)
in (FStar_Util.print1_error "Unexpected error; please file a bug report, ideally with a minimized version of the source program that triggered the error.\n%s\n" uu____760))
end
| uu____761 -> begin
()
end)
end));
(cleanup ());
(report_errors []);
))


let main : 'Auu____775 . unit  ->  'Auu____775 = (fun uu____780 -> (FStar_All.try_with (fun uu___82_788 -> (match (()) with
| () -> begin
((setup_hooks ());
(

let uu____790 = (FStar_Util.record_time go)
in (match (uu____790) with
| (uu____795, time) -> begin
((

let uu____798 = (FStar_Options.query_stats ())
in (match (uu____798) with
| true -> begin
(

let uu____799 = (FStar_Util.string_of_int time)
in (

let uu____800 = (

let uu____801 = (FStar_Getopt.cmdline ())
in (FStar_String.concat " " uu____801))
in (FStar_Util.print2 "TOTAL TIME %s ms: %s\n" uu____799 uu____800)))
end
| uu____804 -> begin
()
end));
(cleanup ());
(FStar_All.exit (Prims.parse_int "0"));
)
end));
)
end)) (fun uu___81_809 -> (match (uu___81_809) with
| e -> begin
((handle_error e);
(FStar_All.exit (Prims.parse_int "1"));
)
end))))




