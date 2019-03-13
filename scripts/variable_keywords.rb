require 'pstore'
require 'pp'
require 'time'
require_relative '../lib/regexp-examples.rb'
start = Time.now
#AUX[A-Z\-\d]?
$construct = /(BU?I?LD(ING)?|ADD(ING|L|N|NL|TL|ITI?O?NA?L?)?|CO?NSTR?U?C?T?(I?O?N|I?N?G)?|CR(EA)?TE?(ING)?|E?XTE?ND(ING)?|INST(A?LL?(A?TI?O?N|I?NG)?)?)S?/.examples
$remove = /(RE?MO?V(E|ING)?|CO?NVE?RT(ING)?|DE?CO?NSTR?U?C?T?(I?O?N|I?N?G)?|UNINSTA?L?L?(ING)?|DE?STRO?Y?(ING)?|OBLITERAT(E|ING)?|DE?LE?T(E|ING)?|DISMANTL(E|ING)?|ELIMINAT(E|ING)?)S?/.examples
$road_suffix = /(R(OA)?D|DR(V|IVE)?|STR?(EET)?|R(OU)?TE?|IH|SH|L(OO)?P|RR|FM|SL|BO?U?LE?VA?R?D|CIR(C(LE?)?)?|PL(C|ACE)?|(SKY|SP(EE)?D|EXPR?(ESS)?|PA?R?K|HI?(GH)?)?WA?Y|LA?NE?|AVEN?(UE)?|TR(AI)?L?|CO?VE?|C(OU)?R?T|BE?ND)S?/.examples
$new_construct = /NEW|(BU?I?LD(ING)?|ADD(ING|L|N|NL|TL|ITI?O?NA?L?)?|CO?NSTR?U?C?T?(I?O?N|I?N?G)?|CR(EA)?TE?(ING)?|INST(A?LL?(A?TI?O?N|I?NG)?)?)S?/.examples
$replace = /RE(BU?I?LD(ING)?|CO?NSTR?U?C?T?(I?O?N|I?N?G)?|CR(EA)?TE?(ING)?|INST(A?LL?(A?TI?O?N|I?NG)?)?|PLA?CE?|CO?NFI?G(URE?(D|I?NG|A?TI?O?N)?)?|ALI?GN(ME?N?T)?)S?/.examples
$interchange = /(INT(E?R?CH?A?N?GE?)?|I[\/\\]C|(O(VE?R?)|UNDE?R?)P(A?S?S(ES)?)?)S?/.examples
$median = /MEDIANS?/.examples
$realign = /RE ?ALIGNS?/.examples
$construct_undivided = /(BU?I?LD(ING)?|ADD(ING|L|N|NL|TL|ITI?O?NA?L?)?|CO?NSTR?U?C?T?(I?O?N|I?N?G)?|CR(EA)?TE?(ING)?|E?XTE?ND(ING)?|INST(A?LL?(A?TI?O?N|I?NG)?)?)S? § UNDIVIDED/.examples
$upgrade_standards = /UPG(R?ADE?)? § STANDA?R?D?S?/.examples
$construct_ramps = /(BU?I?LD(ING)?|ADD(ING|L|N|NL|TL|ITI?O?NA?L?)?|CO?NSTR?U?C?T?(I?O?N|I?N?G)?|CR(EA)?TE?(ING)?|E?XTE?ND(ING)?|INST(A?LL?(A?TI?O?N|I?NG)?)?)S? § RAMPS?/.examples
$ada = /ADA|COMPLIANT|SIDEWALK/.examples
$hov = /HOV/.examples
$remove_hov = /(RE?MO?V(E|ING)?|CO?NVE?RT(ING)?|DE?CO?NSTR?U?C?T?(I?O?N|I?N?G)?|UNINSTA?L?L?(ING)?|DE?STRO?Y?(ING)?|OBLITERAT(E|ING)?|DE?LE?T(E|ING)?|DISMANTL(E|ING)?|ELIMINAT(E|ING)?)S? HOV/.examples

$total = $construct.length + $remove.length + $road_suffix.length + $new_construct.length + $replace.length + $interchange.length + $median.length + $realign.length + $construct_undivided.length + $upgrade_standards.length + $construct_ramps.length + $ada.length + $hov.length + $remove_hov.length


File.open("./wordlist/variable_word_lists.txt", "w+") { 
	|f| f.write(
		"CONSTRUCT WORD LIST NUMBER: " + $construct.length.to_s + "\n",
		"REMOVE WORD LIST NUMBER: " + $remove.length.to_s + "\n",
		"ROAD_SUFFIX WORD LIST NUMBER: " + $road_suffix.length.to_s + "\n",
		"NEW_CONSTRUCT WORD LIST NUMBER: " + $new_construct.length.to_s + "\n",
		"REPLACE WORD LIST NUMBER: " + $replace.length.to_s + "\n",
		"INTERCHANGE WORD LIST NUMBER: " + $interchange.length.to_s + "\n",
		"MEDIAN WORD LIST NUMBER: " + $median.length.to_s + "\n",
		"REALIGN WORD LIST NUMBER: " + $realign.length.to_s + "\n",
		"CONSTRUCT_UNDIVIDED WORD LIST NUMBER: " + $construct_undivided.length.to_s + "\n",
		"UPGRADE_STANDARDS WORD LIST NUMBER: " + $upgrade_standards.length.to_s + "\n",
		"CONSTRUCT_RAMPS WORD LIST NUMBER: " + $construct_ramps.length.to_s + "\n",
		"ADA WORD LIST NUMBER: " + $ada.length.to_s + "\n",
		"HOV WORD LIST NUMBER: " + $hov.length.to_s + "\n",
		"REMOVE_HOV WORD LIST NUMBER: " + $remove_hov.length.to_s + "\n",
		"TOTAL: " + $total.to_s + "\n",

		"\n\nCONSTRUCT WORD LIST: \n", $construct, 
		"\n\nREMOVE WORD LIST: \n", $remove, 
		"\n\nROAD_SUFFIX WORD LIST: \n", $road_suffix, 
		"\n\nNEW_CONSTRUCT WORD LIST: \n", $new_construct, 
		"\n\nREPLACE WORD LIST: \n", $replace, 
		"\n\nINTERCHANGE WORD LIST: \n", $interchange, 
		"\n\nMEDIAN WORD LIST: \n", $median, 
		"\n\nREALIGN WORD LIST: \n", $realign, 
		"\n\nCONSTRUCT_UNDIVIDED WORD LIST: \n", $construct_undivided, 
		"\n\nUPGRADE_STANDARDS WORD LIST: \n", $upgrade_standards, 
		"\n\nCONSTRUCT_RAMPS WORD LIST: \n", $construct_ramps, 
		"\n\nADA WORD LIST: \n", $ada, 
		"\n\nHOV WORD LIST: \n", $hov, 
		"\n\nREMOVE_HOV WORD LIST: \n", $remove_hov
)}

dur = Time.now - start

puts Time.at(dur).gmtime.strftime("%H:%M:%S")

