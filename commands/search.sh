file_location=$1
string_to_search=$2
string_to_replace=$3

string_to_search_scaped=$(echo $string_to_search | sed 's_/_\\/_g')
string_to_replace_scaped=$(echo $string_to_replace | sed 's_/_\\/_g')

echo "search ocurrences of: $string_to_search_scaped"
grep -rnw $file_location -e $string_to_search_scaped | wc -l
