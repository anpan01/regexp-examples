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

# $total = $frontage.length + $main.length + $pavement_benefit.length + $bridge_benefit.length + $ncec_new_interchange.length + $ncec_construct_interchange.length

# File.open("./wordlist/summary.txt", "a") { 
# 	|f| f.write(
# 		"FRONTAGE NUMBER OF PHRASES: " + $frontage.length.to_s + "\n",
# 		"MAIN NUMBER OF PHRASES: " + $main.length.to_s + "\n",
# 		"PAVEMENT_BENEFIT NUMBER OF PHRASES: " + $pavement_benefit.length.to_s + "\n",
# 		"BRIDGE_BENEFIT NUMBER OF PHRASES: " + $bridge_benefit.length.to_s + "\n",
# 		"NCEC_NEW_INTERCHANGE NUMBER OF PHRASES: " + $ncec_new_interchange.length.to_s + "\n",
# 		"NCEC_CONSTRUCT_INTERCHANGE NUMBER OF PHRASES: " + $ncec_construct_interchange.length.to_s + "\n"
# 	)
# }

File.open("./wordlist/project_processing.txt", "w"){
	|f| f.puts("\n\"Frontage\" Related Words: \n", $frontage)
}

File.open("./wordlist/project_processing.txt", "a"){
	|f| f.puts("\n\"Main\" Related Words: \n", $main)}

File.open("./wordlist/project_processing.txt", "a"){
	|f| f.puts("\n\"Pavement Benefit\" Related Words: \n", $pavement_benefit)}

File.open("./wordlist/project_processing.txt", "a"){
	|f| f.puts("\n\"Bridge Benefit\" Related Words: \n", $bridge_benefit)}

File.open("./wordlist/project_processing.txt", "a"){
	|f| f.puts("\n\"NCEC New Interchange\" Related Words: \n", $ncec_new_interchange)}

File.open("./wordlist/project_processing.txt", "a"){
	|f| f.puts("\n\"NCEC Construct Interchange\" Related Words: \n", $ncec_construct_interchange)}

dur = Time.now - start
puts Time.at(dur).gmtime.strftime("%H:%M:%S")