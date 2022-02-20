import 'package:flutter/cupertino.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:path/path.dart';

enum FileGroup {
  video,
  audio,
  ebooks,
  text,
  diskISO,
  tables,
  imageRaster,
  imageVector,
  imageRaw,
  archives,
  dataFile,
  dbFile,
  file3d,
  cadFiles,
  programming,
  executableFiles,
  fontsFiles,
  sysFiles,
  unkown
}

Map<String, FileGroup> _groups = {
  ".asf": FileGroup.video,
  ".avi": FileGroup.video,
  ".flv": FileGroup.video,
  ".mkv": FileGroup.video,
  ".srt": FileGroup.video,
  ".vid": FileGroup.video,
  ".wmv": FileGroup.video,
  ".webm": FileGroup.video,
  ".mpeg4": FileGroup.video,
  ".mp4": FileGroup.video,
  ".amr": FileGroup.audio,
  ".ape": FileGroup.audio,
  ".kar": FileGroup.audio,
  ".m4b": FileGroup.audio,
  ".mp3": FileGroup.audio,
  ".mp2": FileGroup.audio,
  ".mxl": FileGroup.audio,
  ".flac": FileGroup.audio,
  ".wave": FileGroup.audio,
  ".fb2": FileGroup.ebooks,
  ".epub": FileGroup.ebooks,
  ".mobi": FileGroup.ebooks,
  ".doc": FileGroup.text,
  ".eml": FileGroup.text,
  ".fdf": FileGroup.text,
  ".lst": FileGroup.text,
  ".msg": FileGroup.text,
  ".odt": FileGroup.text,
  ".rtf": FileGroup.text,
  ".sig": FileGroup.text,
  ".txt": FileGroup.text,
  ".cue": FileGroup.diskISO,
  ".dmg": FileGroup.diskISO,
  ".img": FileGroup.diskISO,
  ".iso": FileGroup.diskISO,
  ".mdf": FileGroup.diskISO,
  ".nrg": FileGroup.diskISO,
  ".tib": FileGroup.diskISO,
  ".vcd": FileGroup.diskISO,
  ".ods": FileGroup.tables,
  ".xls": FileGroup.tables,
  ".xlsx": FileGroup.tables,
  ".dds": FileGroup.imageRaster,
  ".gif": FileGroup.imageRaster,
  ".pat": FileGroup.imageRaster,
  ".png": FileGroup.imageRaster,
  ".psd": FileGroup.imageRaster,
  ".tga": FileGroup.imageRaster,
  ".dfvu": FileGroup.imageRaster,
  ".jpeg": FileGroup.imageRaster,
  ".tiff": FileGroup.imageRaster,
  ".ai": FileGroup.imageVector,
  ".cdr": FileGroup.imageVector,
  ".eps": FileGroup.imageVector,
  ".svg": FileGroup.imageVector,
  ".vsd": FileGroup.imageVector,
  ".cr2": FileGroup.imageRaw,
  ".raw": FileGroup.imageRaw,
  ".7z": FileGroup.archives,
  ".gz": FileGroup.archives,
  ".cbr": FileGroup.archives,
  ".pak": FileGroup.archives,
  ".pkg": FileGroup.archives,
  ".rar": FileGroup.archives,
  ".rpm": FileGroup.archives,
  ".zip": FileGroup.archives,
  ".avc": FileGroup.dataFile,
  ".csv": FileGroup.dataFile,
  ".dat": FileGroup.dataFile,
  ".fdb": FileGroup.dataFile,
  ".lay": FileGroup.dataFile,
  ".ldf": FileGroup.dataFile,
  ".mpp": FileGroup.dataFile,
  ".pps": FileGroup.dataFile,
  ".ppt": FileGroup.dataFile,
  ".sav": FileGroup.dataFile,
  ".sch": FileGroup.dataFile,
  ".sdf": FileGroup.dataFile,
  ".str": FileGroup.dataFile,
  ".tar": FileGroup.dataFile,
  ".cvf": FileGroup.dataFile,
  ".vvf": FileGroup.dataFile,
  ".xml": FileGroup.dataFile,
  ".dbf": FileGroup.dbFile,
  ".sql": FileGroup.dbFile,
  "dfs": FileGroup.file3d,
  "max": FileGroup.file3d,
  "skp": FileGroup.file3d,
  "step": FileGroup.file3d,
  "cdw": FileGroup.cadFiles,
  "dwg": FileGroup.cadFiles,
  "dxf": FileGroup.cadFiles,
  "mcd": FileGroup.cadFiles,
  "pln": FileGroup.cadFiles,
  "stl": FileGroup.cadFiles,
  ".abap": FileGroup.programming,
  ".asc": FileGroup.programming,
  ".ash": FileGroup.programming,
  ".ampl": FileGroup.programming,
  ".mod": FileGroup.programming,
  ".g4": FileGroup.programming,
  ".apl": FileGroup.programming,
  ".dyalog": FileGroup.programming,
  ".asp": FileGroup.programming,
  ".asax": FileGroup.programming,
  ".ascx": FileGroup.programming,
  ".ashx": FileGroup.programming,
  ".asmx": FileGroup.programming,
  ".aspx": FileGroup.programming,
  ".axd": FileGroup.programming,
  ".dats": FileGroup.programming,
  ".hats": FileGroup.programming,
  ".sats": FileGroup.programming,
  ".as": FileGroup.programming,
  ".adb": FileGroup.programming,
  ".ada": FileGroup.programming,
  ".ads": FileGroup.programming,
  ".agda": FileGroup.programming,
  ".als": FileGroup.programming,
  ".cls": FileGroup.programming,
  ".applescript": FileGroup.programming,
  ".scpt": FileGroup.programming,
  ".arc": FileGroup.programming,
  ".ino": FileGroup.programming,
  ".aj": FileGroup.programming,
  ".asm": FileGroup.programming,
  ".a51": FileGroup.programming,
  ".inc": FileGroup.programming,
  ".nasm": FileGroup.programming,
  ".aug": FileGroup.programming,
  ".ahk": FileGroup.programming,
  ".ahkl": FileGroup.programming,
  ".au3": FileGroup.programming,
  ".awk": FileGroup.programming,
  ".auk": FileGroup.programming,
  ".gawk": FileGroup.programming,
  ".mawk": FileGroup.programming,
  ".nawk": FileGroup.programming,
  ".bat": FileGroup.programming,
  ".cmd": FileGroup.programming,
  ".befunge": FileGroup.programming,
  ".bison": FileGroup.programming,
  ".bb": FileGroup.programming,
  ".decls": FileGroup.programming,
  ".bmx": FileGroup.programming,
  ".bsv": FileGroup.programming,
  ".boo": FileGroup.programming,
  ".b": FileGroup.programming,
  ".bf": FileGroup.programming,
  ".brs": FileGroup.programming,
  ".bro": FileGroup.programming,
  ".c": FileGroup.programming,
  ".cats": FileGroup.programming,
  ".h": FileGroup.programming,
  ".idc": FileGroup.programming,
  ".w": FileGroup.programming,
  ".cs": FileGroup.programming,
  ".cake": FileGroup.programming,
  ".cshtml": FileGroup.programming,
  ".csx": FileGroup.programming,
  ".cpp": FileGroup.programming,
  ".c++": FileGroup.programming,
  ".cc": FileGroup.programming,
  ".cp": FileGroup.programming,
  ".cxx": FileGroup.programming,
  ".h++": FileGroup.programming,
  ".hh": FileGroup.programming,
  ".hpp": FileGroup.programming,
  ".hxx": FileGroup.programming,
  ".inl": FileGroup.programming,
  ".ipp": FileGroup.programming,
  ".tcc": FileGroup.programming,
  ".tpp": FileGroup.programming,
  ".chs": FileGroup.programming,
  ".clp": FileGroup.programming,
  ".cmake": FileGroup.programming,
  ".cmake.in": FileGroup.programming,
  ".cob": FileGroup.programming,
  ".cbl": FileGroup.programming,
  ".ccp": FileGroup.programming,
  ".cobol": FileGroup.programming,
  ".cpy": FileGroup.programming,
  ".capnp": FileGroup.programming,
  ".mss": FileGroup.programming,
  ".ceylon": FileGroup.programming,
  ".chpl": FileGroup.programming,
  ".ch": FileGroup.programming,
  ".ck": FileGroup.programming,
  ".cirru": FileGroup.programming,
  ".clw": FileGroup.programming,
  ".icl": FileGroup.programming,
  ".dcl": FileGroup.programming,
  ".click": FileGroup.programming,
  ".clj": FileGroup.programming,
  ".boot": FileGroup.programming,
  ".cl2": FileGroup.programming,
  ".cljc": FileGroup.programming,
  ".cljs": FileGroup.programming,
  ".cljs.hl": FileGroup.programming,
  ".cljscm": FileGroup.programming,
  ".cljx": FileGroup.programming,
  ".hic": FileGroup.programming,
  ".coffee": FileGroup.programming,
  "._coffee": FileGroup.programming,
  ".cjsx": FileGroup.programming,
  ".cson": FileGroup.programming,
  ".iced": FileGroup.programming,
  ".cfm": FileGroup.programming,
  ".cfml": FileGroup.programming,
  ".cfc": FileGroup.programming,
  ".lisp": FileGroup.programming,
  ".asd": FileGroup.programming,
  ".cl": FileGroup.programming,
  ".l": FileGroup.programming,
  ".lsp": FileGroup.programming,
  ".ny": FileGroup.programming,
  ".podsl": FileGroup.programming,
  ".sexp": FileGroup.programming,
  ".cps": FileGroup.programming,
  ".coq": FileGroup.programming,
  ".v": FileGroup.programming,
  ".cr": FileGroup.programming,
  ".feature": FileGroup.programming,
  ".cu": FileGroup.programming,
  ".cuh": FileGroup.programming,
  ".cy": FileGroup.programming,
  ".pyx": FileGroup.programming,
  ".pxd": FileGroup.programming,
  ".pxi": FileGroup.programming,
  ".d": FileGroup.programming,
  ".di": FileGroup.programming,
  ".com": FileGroup.programming,
  ".dm": FileGroup.programming,
  ".dart": FileGroup.programming,
  ".djs": FileGroup.programming,
  ".dylan": FileGroup.programming,
  ".dyl": FileGroup.programming,
  ".intr": FileGroup.programming,
  ".lid": FileGroup.programming,
  ".E": FileGroup.programming,
  ".ecl": FileGroup.programming,
  ".eclxml": FileGroup.programming,
  ".e": FileGroup.programming,
  ".ex": FileGroup.programming,
  ".exs": FileGroup.programming,
  ".elm": FileGroup.programming,
  ".el": FileGroup.programming,
  ".emacs": FileGroup.programming,
  ".emacs.desktop": FileGroup.programming,
  ".em": FileGroup.programming,
  ".emberscript": FileGroup.programming,
  ".erl": FileGroup.programming,
  ".es": FileGroup.programming,
  ".escript": FileGroup.programming,
  ".hrl": FileGroup.programming,
  ".xrl": FileGroup.programming,
  ".yrl": FileGroup.programming,
  ".fs": FileGroup.programming,
  ".fsi": FileGroup.programming,
  ".fsx": FileGroup.programming,
  ".fx": FileGroup.programming,
  ".flux": FileGroup.programming,
  ".f90": FileGroup.programming,
  ".f": FileGroup.programming,
  ".f03": FileGroup.programming,
  ".f08": FileGroup.programming,
  ".f77": FileGroup.programming,
  ".f95": FileGroup.programming,
  ".for": FileGroup.programming,
  ".fpp": FileGroup.programming,
  ".factor": FileGroup.programming,
  ".fy": FileGroup.programming,
  ".fancypack": FileGroup.programming,
  ".fan": FileGroup.programming,
  ".fth": FileGroup.programming,
  ".4th": FileGroup.programming,
  ".forth": FileGroup.programming,
  ".fr": FileGroup.programming,
  ".frt": FileGroup.programming,
  ".ftl": FileGroup.programming,
  ".gms": FileGroup.programming,
  ".g": FileGroup.programming,
  ".gap": FileGroup.programming,
  ".gd": FileGroup.programming,
  ".gi": FileGroup.programming,
  ".tst": FileGroup.programming,
  ".s": FileGroup.programming,
  ".ms": FileGroup.programming,
  ".glsl": FileGroup.programming,
  ".fp": FileGroup.programming,
  ".frag": FileGroup.programming,
  ".frg": FileGroup.programming,
  ".fsh": FileGroup.programming,
  ".fshader": FileGroup.programming,
  ".geo": FileGroup.programming,
  ".geom": FileGroup.programming,
  ".glslv": FileGroup.programming,
  ".gshader": FileGroup.programming,
  ".shader": FileGroup.programming,
  ".vert": FileGroup.programming,
  ".vrx": FileGroup.programming,
  ".vsh": FileGroup.programming,
  ".vshader": FileGroup.programming,
  ".gml": FileGroup.programming,
  ".kid": FileGroup.programming,
  ".ebuild": FileGroup.programming,
  ".eclass": FileGroup.programming,
  ".glf": FileGroup.programming,
  ".gp": FileGroup.programming,
  ".gnu": FileGroup.programming,
  ".gnuplot": FileGroup.programming,
  ".plot": FileGroup.programming,
  ".plt": FileGroup.programming,
  ".go": FileGroup.programming,
  ".golo": FileGroup.programming,
  ".gs": FileGroup.programming,
  ".gst": FileGroup.programming,
  ".gsx": FileGroup.programming,
  ".vark": FileGroup.programming,
  ".grace": FileGroup.programming,
  ".gf": FileGroup.programming,
  ".groovy": FileGroup.programming,
  ".grt": FileGroup.programming,
  ".gtpl": FileGroup.programming,
  ".gvy": FileGroup.programming,
  ".gsp": FileGroup.programming,
  ".hcl": FileGroup.programming,
  ".tf": FileGroup.programming,
  ".hlsl": FileGroup.programming,
  ".fxh": FileGroup.programming,
  ".hlsli": FileGroup.programming,
  ".php": FileGroup.programming,
  ".hb": FileGroup.programming,
  ".hs": FileGroup.programming,
  ".hsc": FileGroup.programming,
  ".hx": FileGroup.programming,
  ".hxsl": FileGroup.programming,
  ".hy": FileGroup.programming,
  ".pro": FileGroup.programming,
  ".dlm": FileGroup.programming,
  ".ipf": FileGroup.programming,
  ".idr": FileGroup.programming,
  ".lidr": FileGroup.programming,
  ".ni": FileGroup.programming,
  ".i7x": FileGroup.programming,
  ".iss": FileGroup.programming,
  ".io": FileGroup.programming,
  ".ik": FileGroup.programming,
  ".thy": FileGroup.programming,
  ".ijs": FileGroup.programming,
  ".flex": FileGroup.programming,
  ".jflex": FileGroup.programming,
  ".jq": FileGroup.programming,
  ".jsx": FileGroup.programming,
  ".j": FileGroup.programming,
  ".java": FileGroup.programming,
  ".jsp": FileGroup.programming,
  ".js": FileGroup.programming,
  "._js": FileGroup.programming,
  ".bones": FileGroup.programming,
  ".es6": FileGroup.programming,
  ".jake": FileGroup.programming,
  ".jsb": FileGroup.programming,
  ".jscad": FileGroup.programming,
  ".jsfl": FileGroup.programming,
  ".jsm": FileGroup.programming,
  ".jss": FileGroup.programming,
  ".njs": FileGroup.programming,
  ".pac": FileGroup.programming,
  ".sjs": FileGroup.programming,
  ".ssjs": FileGroup.programming,
  ".sublime-build": FileGroup.programming,
  ".sublime-commands": FileGroup.programming,
  ".sublime-completions": FileGroup.programming,
  ".sublime-keymap": FileGroup.programming,
  ".sublime-macro": FileGroup.programming,
  ".sublime-menu": FileGroup.programming,
  ".sublime-mousemap": FileGroup.programming,
  ".sublime-project": FileGroup.programming,
  ".sublime-settings": FileGroup.programming,
  ".sublime-theme": FileGroup.programming,
  ".sublime-workspace": FileGroup.programming,
  ".sublime_metrics": FileGroup.programming,
  ".sublime_session": FileGroup.programming,
  ".xsjs": FileGroup.programming,
  ".xsjslib": FileGroup.programming,
  ".jl": FileGroup.programming,
  ".krl": FileGroup.programming,
  ".brd": FileGroup.programming,
  ".kicad_pcb": FileGroup.programming,
  ".kt": FileGroup.programming,
  ".ktm": FileGroup.programming,
  ".kts": FileGroup.programming,
  ".lfe": FileGroup.programming,
  ".ll": FileGroup.programming,
  ".lol": FileGroup.programming,
  ".lsl": FileGroup.programming,
  ".lslp": FileGroup.programming,
  ".lvproj": FileGroup.programming,
  ".lasso": FileGroup.programming,
  ".las": FileGroup.programming,
  ".lasso8": FileGroup.programming,
  ".lasso9": FileGroup.programming,
  ".ldml": FileGroup.programming,
  ".lean": FileGroup.programming,
  ".hlean": FileGroup.programming,
  ".lex": FileGroup.programming,
  ".ly": FileGroup.programming,
  ".ily": FileGroup.programming,
  ".m": FileGroup.programming,
  ".lagda": FileGroup.programming,
  ".litcoffee": FileGroup.programming,
  ".lhs": FileGroup.programming,
  ".ls": FileGroup.programming,
  "._ls": FileGroup.programming,
  ".xm": FileGroup.programming,
  ".x": FileGroup.programming,
  ".xi": FileGroup.programming,
  ".lgt": FileGroup.programming,
  ".logtalk": FileGroup.programming,
  ".lookml": FileGroup.programming,
  ".lua": FileGroup.programming,
  ".fcgi": FileGroup.programming,
  ".nse": FileGroup.programming,
  ".pd_lua": FileGroup.programming,
  ".rbxs": FileGroup.programming,
  ".wlua": FileGroup.programming,
  ".mumps": FileGroup.programming,
  ".m4": FileGroup.programming,
  ".mcr": FileGroup.programming,
  ".muf": FileGroup.programming,
  ".mak": FileGroup.programming,
  ".mk": FileGroup.programming,
  ".mkfile": FileGroup.programming,
  ".mako": FileGroup.programming,
  ".mao": FileGroup.programming,
  ".mathematica": FileGroup.programming,
  ".cdf": FileGroup.programming,
  ".ma": FileGroup.programming,
  ".mt": FileGroup.programming,
  ".nb": FileGroup.programming,
  ".nbp": FileGroup.programming,
  ".wl": FileGroup.programming,
  ".wlt": FileGroup.programming,
  ".matlab": FileGroup.programming,
  ".maxpat": FileGroup.programming,
  ".maxhelp": FileGroup.programming,
  ".maxproj": FileGroup.programming,
  ".mxt": FileGroup.programming,
  ".moo": FileGroup.programming,
  ".metal": FileGroup.programming,
  ".minid": FileGroup.programming,
  ".druby": FileGroup.programming,
  ".duby": FileGroup.programming,
  ".mir": FileGroup.programming,
  ".mirah": FileGroup.programming,
  ".mo": FileGroup.programming,
  ".mms": FileGroup.programming,
  ".mmk": FileGroup.programming,
  ".monkey": FileGroup.programming,
  ".moon": FileGroup.programming,
  ".myt": FileGroup.programming,
  ".ncl": FileGroup.programming,
  ".nsi": FileGroup.programming,
  ".nsh": FileGroup.programming,
  ".n": FileGroup.programming,
  ".axs": FileGroup.programming,
  ".axi": FileGroup.programming,
  ".axs.erb": FileGroup.programming,
  ".axi.erb": FileGroup.programming,
  ".nlogo": FileGroup.programming,
  ".nl": FileGroup.programming,
  ".nim": FileGroup.programming,
  ".nimrod": FileGroup.programming,
  ".nit": FileGroup.programming,
  ".nix": FileGroup.programming,
  ".nu": FileGroup.programming,
  ".numpy": FileGroup.programming,
  ".numpyw": FileGroup.programming,
  ".numsc": FileGroup.programming,
  ".ml": FileGroup.programming,
  ".eliom": FileGroup.programming,
  ".eliomi": FileGroup.programming,
  ".ml4": FileGroup.programming,
  ".mli": FileGroup.programming,
  ".mll": FileGroup.programming,
  ".mly": FileGroup.programming,
  ".mm": FileGroup.programming,
  ".sj": FileGroup.programming,
  ".omgrofl": FileGroup.programming,
  ".opa": FileGroup.programming,
  ".opal": FileGroup.programming,
  ".opencl": FileGroup.programming,
  ".p": FileGroup.programming,
  ".scad": FileGroup.programming,
  ".ox": FileGroup.programming,
  ".oxh": FileGroup.programming,
  ".oxo": FileGroup.programming,
  ".oxygene": FileGroup.programming,
  ".oz": FileGroup.programming,
  ".pwn": FileGroup.programming,
  ".aw": FileGroup.programming,
  ".ctp": FileGroup.programming,
  ".php3": FileGroup.programming,
  ".php4": FileGroup.programming,
  ".php5": FileGroup.programming,
  ".phps": FileGroup.programming,
  ".phpt": FileGroup.programming,
  ".pls": FileGroup.programming,
  ".pck": FileGroup.programming,
  ".pkb": FileGroup.programming,
  ".pks": FileGroup.programming,
  ".plb": FileGroup.programming,
  ".plsql": FileGroup.programming,
  ".pov": FileGroup.programming,
  ".pan": FileGroup.programming,
  ".psc": FileGroup.programming,
  ".parrot": FileGroup.programming,
  ".pasm": FileGroup.programming,
  ".pir": FileGroup.programming,
  ".pas": FileGroup.programming,
  ".dfm": FileGroup.programming,
  ".dpr": FileGroup.programming,
  ".lpr": FileGroup.programming,
  ".pp": FileGroup.programming,
  ".pl": FileGroup.programming,
  ".al": FileGroup.programming,
  ".cgi": FileGroup.programming,
  ".perl": FileGroup.programming,
  ".ph": FileGroup.programming,
  ".plx": FileGroup.programming,
  ".pm": FileGroup.programming,
  ".pod": FileGroup.programming,
  ".psgi": FileGroup.programming,
  ".t": FileGroup.programming,
  ".6pl": FileGroup.programming,
  ".6pm": FileGroup.programming,
  ".nqp": FileGroup.programming,
  ".p6": FileGroup.programming,
  ".p6l": FileGroup.programming,
  ".p6m": FileGroup.programming,
  ".pl6": FileGroup.programming,
  ".pm6": FileGroup.programming,
  ".pig": FileGroup.programming,
  ".pike": FileGroup.programming,
  ".pmod": FileGroup.programming,
  ".pogo": FileGroup.programming,
  ".pony": FileGroup.programming,
  ".ps1": FileGroup.programming,
  ".psd1": FileGroup.programming,
  ".psm1": FileGroup.programming,
  ".pde": FileGroup.programming,
  ".prolog": FileGroup.programming,
  ".yap": FileGroup.programming,
  ".spin": FileGroup.programming,
  ".pd": FileGroup.programming,
  ".pb": FileGroup.programming,
  ".pbi": FileGroup.programming,
  ".purs": FileGroup.programming,
  ".py": FileGroup.programming,
  ".bzl": FileGroup.programming,
  ".gyp": FileGroup.programming,
  ".lmi": FileGroup.programming,
  ".pyde": FileGroup.programming,
  ".pyp": FileGroup.programming,
  ".pyt": FileGroup.programming,
  ".pyw": FileGroup.programming,
  ".rpy": FileGroup.programming,
  ".tac": FileGroup.programming,
  ".wsgi": FileGroup.programming,
  ".xpy": FileGroup.programming,
  ".qml": FileGroup.programming,
  ".qbs": FileGroup.programming,
  ".pri": FileGroup.programming,
  ".r": FileGroup.programming,
  ".rd": FileGroup.programming,
  ".rsx": FileGroup.programming,
  ".rbbas": FileGroup.programming,
  ".rbfrm": FileGroup.programming,
  ".rbmnu": FileGroup.programming,
  ".rbres": FileGroup.programming,
  ".rbtbar": FileGroup.programming,
  ".rbuistate": FileGroup.programming,
  ".rkt": FileGroup.programming,
  ".rktd": FileGroup.programming,
  ".rktl": FileGroup.programming,
  ".scrbl": FileGroup.programming,
  ".rl": FileGroup.programming,
  ".reb": FileGroup.programming,
  ".r2": FileGroup.programming,
  ".r3": FileGroup.programming,
  ".rebol": FileGroup.programming,
  ".red": FileGroup.programming,
  ".reds": FileGroup.programming,
  ".cw": FileGroup.programming,
  ".rs": FileGroup.programming,
  ".rsh": FileGroup.programming,
  ".robot": FileGroup.programming,
  ".rg": FileGroup.programming,
  ".rb": FileGroup.programming,
  ".builder": FileGroup.programming,
  ".gemspec": FileGroup.programming,
  ".god": FileGroup.programming,
  ".irbrc": FileGroup.programming,
  ".jbuilder": FileGroup.programming,
  ".mspec": FileGroup.programming,
  ".pluginspec": FileGroup.programming,
  ".podspec": FileGroup.programming,
  ".rabl": FileGroup.programming,
  ".rake": FileGroup.programming,
  ".rbuild": FileGroup.programming,
  ".rbw": FileGroup.programming,
  ".rbx": FileGroup.programming,
  ".ru": FileGroup.programming,
  ".ruby": FileGroup.programming,
  ".thor": FileGroup.programming,
  ".watchr": FileGroup.programming,
  ".rs.in": FileGroup.programming,
  ".sas": FileGroup.programming,
  ".smt2": FileGroup.programming,
  ".smt": FileGroup.programming,
  ".sqf": FileGroup.programming,
  ".hqf": FileGroup.programming,
  ".db2": FileGroup.programming,
  ".sage": FileGroup.programming,
  ".sagews": FileGroup.programming,
  ".sls": FileGroup.programming,
  ".scala": FileGroup.programming,
  ".sbt": FileGroup.programming,
  ".sc": FileGroup.programming,
  ".scm": FileGroup.programming,
  ".sld": FileGroup.programming,
  ".sps": FileGroup.programming,
  ".ss": FileGroup.programming,
  ".sci": FileGroup.programming,
  ".sce": FileGroup.programming,
  ".self": FileGroup.programming,
  ".sh": FileGroup.programming,
  ".bash": FileGroup.programming,
  ".bats": FileGroup.programming,
  ".command": FileGroup.programming,
  ".ksh": FileGroup.programming,
  ".sh.in": FileGroup.programming,
  ".tmux": FileGroup.programming,
  ".tool": FileGroup.programming,
  ".zsh": FileGroup.programming,
  ".sh-session": FileGroup.programming,
  ".shen": FileGroup.programming,
  ".sl": FileGroup.programming,
  ".smali": FileGroup.programming,
  ".st": FileGroup.programming,
  ".tpl": FileGroup.programming,
  ".sp": FileGroup.programming,
  ".sma": FileGroup.programming,
  ".nut": FileGroup.programming,
  ".stan": FileGroup.programming,
  ".ML": FileGroup.programming,
  ".fun": FileGroup.programming,
  ".sml": FileGroup.programming,
  ".do": FileGroup.programming,
  ".ado": FileGroup.programming,
  ".doh": FileGroup.programming,
  ".ihlp": FileGroup.programming,
  ".mata": FileGroup.programming,
  ".matah": FileGroup.programming,
  ".sthlp": FileGroup.programming,
  ".scd": FileGroup.programming,
  ".swift": FileGroup.programming,
  ".sv": FileGroup.programming,
  ".svh": FileGroup.programming,
  ".vh": FileGroup.programming,
  ".txl": FileGroup.programming,
  ".tcl": FileGroup.programming,
  ".adp": FileGroup.programming,
  ".tm": FileGroup.programming,
  ".tcsh": FileGroup.programming,
  ".csh": FileGroup.programming,
  ".thrift": FileGroup.programming,
  ".tu": FileGroup.programming,
  ".ts": FileGroup.programming,
  ".tsx": FileGroup.programming,
  ".upc": FileGroup.programming,
  ".uno": FileGroup.programming,
  ".uc": FileGroup.programming,
  ".ur": FileGroup.programming,
  ".urs": FileGroup.programming,
  ".vcl": FileGroup.programming,
  ".vhdl": FileGroup.programming,
  ".vhd": FileGroup.programming,
  ".vhf": FileGroup.programming,
  ".vhi": FileGroup.programming,
  ".vho": FileGroup.programming,
  ".vhs": FileGroup.programming,
  ".vht": FileGroup.programming,
  ".vhw": FileGroup.programming,
  ".vala": FileGroup.programming,
  ".vapi": FileGroup.programming,
  ".veo": FileGroup.programming,
  ".vim": FileGroup.programming,
  ".vb": FileGroup.programming,
  ".bas": FileGroup.programming,
  ".frm": FileGroup.programming,
  ".frx": FileGroup.programming,
  ".vba": FileGroup.programming,
  ".vbhtml": FileGroup.programming,
  ".vbs": FileGroup.programming,
  ".volt": FileGroup.programming,
  ".webidl": FileGroup.programming,
  ".x10": FileGroup.programming,
  ".xc": FileGroup.programming,
  ".xsp-config": FileGroup.programming,
  ".xsp.metadata": FileGroup.programming,
  ".xpl": FileGroup.programming,
  ".xproc": FileGroup.programming,
  ".xquery": FileGroup.programming,
  ".xq": FileGroup.programming,
  ".xql": FileGroup.programming,
  ".xqm": FileGroup.programming,
  ".xqy": FileGroup.programming,
  ".xs": FileGroup.programming,
  ".xslt": FileGroup.programming,
  ".xsl": FileGroup.programming,
  ".xojo_code": FileGroup.programming,
  ".xojo_menu": FileGroup.programming,
  ".xojo_report": FileGroup.programming,
  ".xojo_script": FileGroup.programming,
  ".xojo_toolbar": FileGroup.programming,
  ".xojo_window": FileGroup.programming,
  ".xtend": FileGroup.programming,
  ".y": FileGroup.programming,
  ".yacc": FileGroup.programming,
  ".yy": FileGroup.programming,
  ".zep": FileGroup.programming,
  ".zimpl": FileGroup.programming,
  ".zmpl": FileGroup.programming,
  ".zpl": FileGroup.programming,
  ".ec": FileGroup.programming,
  ".eh": FileGroup.programming,
  ".fish": FileGroup.programming,
  ".mu": FileGroup.programming,
  ".nc": FileGroup.programming,
  ".ooc": FileGroup.programming,
  ".wisp": FileGroup.programming,
  ".prg": FileGroup.programming,
  ".prw": FileGroup.programming,
  ".apk": FileGroup.executableFiles,
  ".bin": FileGroup.executableFiles,
  ".exe": FileGroup.executableFiles,
  ".jar": FileGroup.executableFiles,
  ".scr": FileGroup.executableFiles,
  ".bdf": FileGroup.fontsFiles,
  ".otf": FileGroup.fontsFiles,
  ".ttf": FileGroup.fontsFiles,
  ".cab": FileGroup.sysFiles,
  ".cur": FileGroup.sysFiles,
  ".dll": FileGroup.sysFiles,
  ".ico": FileGroup.sysFiles,
  ".lnk": FileGroup.sysFiles,
  ".spl": FileGroup.sysFiles,
  ".sys": FileGroup.sysFiles,
};

String getFileExtension(String fileName) => fileName.split(".").last;

FileGroup getFileGroup(String fileName) {
  return _groups[".${getFileExtension(fileName)}"] ?? FileGroup.unkown;
}

Color getFileColor(String fileName) {
  var ext = getFileExtension(fileName);
  //filecadFilesColor:ref(fileunkownColor);
  var color = ClientTheme.currentTheme.tryGetField("file|$ext|color");
  color ??= ClientTheme.currentTheme.getField("file${getFileGroup(fileName).toString().split(".")[1]}Color");
  return color;
}

IconData? getFileIcon(String fileExtension) => ClientTheme.currentTheme.tryGetField("file|$fileExtension|icon");
