require 'pstore'
require 'pp'
require 'time'
require_relative '../lib/regexp-examples.rb'

start = Time.now

$frontage = /F(RO?N?)?TA?GE?|FR R/.examples
$main = /M(AI)?N( LA?NE?S?)?/.examples
$pavement_benefit = /(RE)?PA?VE?M?E?N?T?|(RE)?SURF(A?C(E|ING)?)?|OVE?R?LA?Y(E?D|I?NG)?|(CR|A|J)CP/.examples
$bridge_benefit = /B(RI?D?GE?|DGE?)S?|STR(U?CT?(URE)?)?S?|OVE?RPA?SS(ES)?/.examples
$ncec_new_interchange = /(BU?I?LD(ING)?|ADD(ING|L|N|NL|TL|ITI?O?NA?L?)?|CO?NSTR?U?C?T?(I?O?N|I?N?G)?|CR(EA)?TE?(ING)?|E?XTE?ND(ING)?|INST(A?LL?(A?TI?O?N|I?NG)?)?)S?/.examples
$ncec_construct_interchange = /CO?NSTR?U?C?T?(I?O?N|I?N?G)?/.examples

$total = $frontage.length + $main.length + $pavement_benefit.length + $bridge_benefit.length + $ncec_new_interchange.length + $ncec_construct_interchange.length

File.open("./wordlist/project_processing_cat.txt", "w+") { 
	|f| f.write(
		"FRONTAGE NUMBER OF WORD POSSIBILITIES: " + $frontage.length.to_s + "\n",
		"MAIN NUMBER OF WORD POSSIBILITIES: " + $main.length.to_s + "\n",
		"PAVEMENT_BENEFIT NUMBER OF WORD POSSIBILITIES: " + $pavement_benefit.length.to_s + "\n",
		"BRIDGE_BENEFIT NUMBER OF WORD POSSIBILITIES: " + $bridge_benefit.length.to_s + "\n",
		"NCEC_NEW_INTERCHANGE NUMBER OF WORD POSSIBILITIES: " + $ncec_new_interchange.length.to_s + "\n",
		"NCEC_CONSTRUCT_INTERCHANGE NUMBER OF WORD POSSIBILITIES: " + $ncec_construct_interchange.length.to_s + "\n",
		"TOTAL WORD POSSIBILITIES: " + $total.to_s + "\n",

		"\nFRONTAGE WORD LIST: \n", $frontage,
		"\nMAIN WORD LIST: \n", $main,
		"\nPAVEMENT_BENEFIT WORD LIST: \n", $pavement_benefit,
		"\nBRIDGE_BENEFIT WORD LIST: \n", $bridge_benefit,
		"\nNCEC_NEW_INTERCHANGE WORD LIST: \n", $ncec_new_interchange,
		"\nNCEC_CONSTRUCT_INTERCHANGE WORD LIST: \n", $ncec_construct_interchange
)}

dur = Time.now - start
puts Time.at(dur).gmtime.strftime("%H:%M:%S")