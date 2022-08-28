#!/bin/bash

#start-readme
: '

# Description

Replace a string into a file

# Usage

jarvis /foo/file.txt "to search" "to replace"
'
#end-readme

file_location=$1
string_to_search=$2
string_to_replace=$3

string_to_search_scaped=$(echo $string_to_search | sed 's_/_\\/_g')
string_to_replace_scaped=$(echo $string_to_replace | sed 's_/_\\/_g')

echo "count ocurrences of: $string_to_search before replace"
grep -rnw $file_location -e $string_to_search_scaped | wc -l


sed -e "s/$string_to_search_scaped/$string_to_replace_scaped/g" $file_location

echo "count ocurrences of: $string_to_search after replace"
grep -rnw $file_location -e $string_to_search | wc -l
