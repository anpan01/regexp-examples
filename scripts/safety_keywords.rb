require 'pstore'
require 'pp'
require 'time'
require_relative '../lib/regexp-examples.rb'
start = Time.now

$grade_separated = /GRA?DE? SEP(A?RA?T(E?D|I?O?N))?/.examples
$railroad_grade_separated = /R(A?I?L)?R(O?A?D)? GRA?DE? SEP(A?RA?T(E?D|I?O?N))?/.examples
$overpass = /O(VE?R)?P(A?S?S(ES)?)?|INT(E?R?CH?A?N?GE?)?|RAMPS?/.examples
$overpass_realign = /O(VE?R)?P(A?S?S(ES)?)?|INT(E?R?CH?A?N?GE?)?|RAMPS?|REALIGN(ME?N?T)?S?/.examples
$convert_one_way = /CO?NVE?RT § (ONE|1)[\-]WAY/.examples
$aux_lane = /AUX/.examples
$widen_shoulders = /WI?DE?N § SH(OU)?LDE?RS?/.examples
$construct_shoulders = /(BU?I?LD(ING)?|ADD(ING|L|N|NL|TL|ITI?O?NA?L?)?|CO?NSTR?U?C?T?(I?O?N|I?N?G)?|CR(EA)?TE?(ING)?|E?XTE?ND(ING)?|INST(A?LL?(A?TI?O?N|I?NG)?)?)S? § SH(OU)?LDE?RS?/.examples
$upgrade_standards = /UPG(R?ADE?)? § STANDA?R?D?S?/.examples
$widen_lanes = /WI?DE?N/.examples
$vertical_alignment = /VE?RT(I?CA?L)?/.examples
$super_two = /SUPER (2|TWO)/.examples
$divided = /DIVIDED?/.examples
$passing_lanes = /PASSING/.examples
$center_left = /CENTER LEFT|TWLTL|TWO[\-]WAY LEFT[\-]TURN/.examples
$roadway_signs = /SI?GNS?/.examples

$total = $grade_separated.length + $railroad_grade_separated.length + $overpass.length + $overpass_realign.length + $convert_one_way.length + $aux_lane.length + $widen_shoulders.length + $construct_shoulders.length + $upgrade_standards.length + $widen_lanes.length + $vertical_alignment.length + $super_two.length + $divided.length + $passing_lanes.length + $center_left.length + $roadway_signs.length

# File.open("./wordlist/summary.txt", "a") { 
# 	|f| f.write("/n",
# 		"GRADE SEPARATED WORD LIST: " + $grade_separated.length.to_s + "\n",
# 		"RAILROAD GRADE SEPARATED WORD LIST: " + $railroad_grade_separated.length.to_s + "\n",
# 		"OVERPASS WORD LIST: " + $overpass.length.to_s + "\n",
# 		"OVERPASS REALIGN WORD LIST: " + $overpass_realign.length.to_s + "\n",
# 		"CONVERT ONE WAY WORD LIST: " + $convert_one_way.length.to_s + "\n",
# 		"AUX LANE WORD LIST: " + $aux_lane.length.to_s + "\n",
# 		"WIDEN SHOULDERS WORD LIST: " + $widen_shoulders.length.to_s + "\n",
# 		"CONSTRUCT SHOULDERS WORD LIST: " + $construct_shoulders.length.to_s + "\n",
# 		"UPGRADE STANDARDS WORD LIST: " + $upgrade_standards.length.to_s + "\n",
# 		"WIDEN LANES WORD LIST: " + $widen_lanes.length.to_s + "\n",
# 		"VERTICAL ALIGNMENT WORD LIST: " + $vertical_alignment.length.to_s + "\n",
# 		"SUPER TWO WORD LIST: " + $super_two.length.to_s + "\n",
# 		"DIVIDED: " + $divided.length.to_s + "\n",
# 		"PASSING LANES WORD LIST: " + $passing_lanes.length.to_s + "\n",
# 		"CENTER LEFT WORD LIST: " + $center_left.length.to_s + "\n",
# 		"ROADWAY SIGNS WORD LIST: " + $roadway_signs.length.to_s + "\n",
# 		"TOTAL: " + $total.to_s + "\n",
# 	)}

	File.open("./wordlist/safety_keywords_updateWF.txt", "w") { 
	|f| f.puts(
		"\"Aux Lane\" Word List: \n", $aux_lane,
		"\"Center Left\" Word List: \n", $center_left,
		"\"Construct Shoulders\" Word List: \n", $construct_shoulders,
		"\"Convert One Way\" Word List: \n", $convert_one_way,
		"\"Divided\" Word List: \n", $divided,
		"\"Grade Separated\" Word List: \n", $grade_separated,
		"\"Overpass\" Word List: \n", $overpass,
		"\"Overpass realign\" Word List: \n", $overpass_realign,
		"\"Passing Lanes\" Word List: \n", $passing_lanes,
		"\"Railroad Grade Separated\" Word List: \n", $railroad_grade_separated,
		"\"Roadway Signs\" Word List: \n", $roadway_signs
		"\"Super Two\" Word List: \n", $super_two,
		"\"Upgrade Standards\" Word List: \n", $upgrade_standards,
		"\"Vertical Alignment\" Word List: \n", $vertical_alignment,
		"\"Widen Shoulders\" Word List: \n", $widen_shoulders, 
		"\"Widening\" Word List: \n", $widening,
		"\"Widening Shoulders\" Word List: \n", $widening_shoulders,
		"\"Widening Lanes\" Word List: \n", $widening_lanes,
)}

dur = Time.now - start

puts Time.at(dur).gmtime.strftime("%H:%M:%S")