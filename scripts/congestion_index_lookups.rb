require 'pstore'
require 'pp'
require 'time'
require_relative '../lib/regexp-examples.rb'

start = Time.now

$congestion_index_add_aux_lanes = /AUX/.examples
$congestion_index_ramp_reconfiguration = /RAMPS? REVERS(E|AL)?|RECONFIG(URE?)? § RAMPS?|REVERS(E|AL)? § RAMPS?|REMO?V?E? § RAMPS?/.examples
$congestion_index_its = /ITS EQUIPMENT|(BU?I?LD(ING)?|ADD(ING|L|N|NL|TL|ITI?O?NA?L?)?|CO?NSTR?U?C?T?(I?O?N|I?N?G)?|CR(EA)?TE?(ING)?|E?XTE?ND(ING)?|INST(A?LL?(A?TI?O?N|I?NG)?)?)S? § ITS/.examples
$congestion_index_int_imp = /RECONFIG(URE?)? § INTERSECTIONS?|INTERSECTION IMPROVEMENTS?|IMPROVE § INTERSECTIONS?/.examples
$congestion_index_grade_sep = /(BU?I?LD(ING)?|ADD(ING|L|N|NL|TL|ITI?O?NA?L?)?|CO?NSTR?U?C?T?(I?O?N|I?N?G)?|CR(EA)?TE?(ING)?|E?XTE?ND(ING)?|INST(A?LL?(A?TI?O?N|I?NG)?)?)S? § GRA?DE? SEP(AR(ATION)?)?/.examples
$replace_interchange =/RE(BU?I?LD(ING)?|ADD(ING|L|N|NL|TL|ITI?O?NA?L?)?|CO?NSTR?U?C?T?(I?O?N|I?N?G)?|CR(EA)?TE?(ING)?|E?XTE?ND(ING)?|INST(A?LL?(A?TI?O?N|I?NG)?)?)S? § (INT(E?R?CH?A?N?GE?)?|I[\/\\]C|(O(VE?R?)|UNDE?R?)P(A?S?S(ES)?)?)S?/.examples
$new_interchange = /(INT(E?R?CH?A?N?GE?)?|I[\/\\]C|(O(VE?R?)|UNDE?R?)P(A?S?S(ES)?)?)S?/.examples

$total = $congestion_index_add_aux_lanes.length + $congestion_index_ramp_reconfiguration.length + $congestion_index_its.length + $congestion_index_int_imp.length + $congestion_index_grade_sep.length + $replace_interchange.length + $new_interchange.length

# File.open("./wordlist/summary.txt", "a") { 
# 	|f| f.write(
# 		"CONGESTION_INDEX_ADD_AUX_LANES NUMBER OF WORDS: " + $congestion_index_add_aux_lanes.length.to_s + "\n",
# 		"CONGESTION_INDEX_RAMP_RECONFIGURATION NUMBER OF WORDS: " + $congestion_index_ramp_reconfiguration.length.to_s + "\n",
# 		"CONGESTION_INDEX_ITS NUMBER OF WORDS: " + $congestion_index_its.length.to_s + "\n",
# 		"CONGESTION_INDEX_INT_IMP NUMBER OF WORDS: " + $congestion_index_int_imp.length.to_s + "\n",
# 		"CONGESTION_INDEX_GRADE_SEP NUMBER OF WORDS: " + $congestion_index_grade_sep.length.to_s + "\n",
# 		"REPLACE_INTERCHANGE NUMBER OF WORDS: " + $replace_interchange.length.to_s + "\n",
# 		"NEW_INTERCHANGE NUMBER OF WORDS: " + $new_interchange.length.to_s + "\n",
# 		"TOTAL: " + $total.to_s + "\n")}

File.open("./wordlist/temp.txt", "w") { 
	|f| f.puts(
		# "\"Add Aux Lanes\" Word List: \n", $congestion_index_add_aux_lanes,
		# "\"Ramp Reconfiguration\" Word List: \n", $congestion_index_ramp_reconfiguration,
		# "\"ITS\" Word List: \n", $congestion_index_its,
		# "\"INT IMP\" Word List: \n", $congestion_index_int_imp,
		# "\"Grade Separation\" Word List: \n", $congestion_index_grade_sep,
		# "\"Replace Interchange\" Word List: \n", $replace_interchange,
		 "\"New Interchange\" Word List: \n", $new_interchange
)}

dur = Time.now - start
puts Time.at(dur).gmtime.strftime("%H:%M:%S")

