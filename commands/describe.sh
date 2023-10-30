#!/bin/bash

: '''
# Describe command

This command show the readme of command

Usage:

jarvis describe pass_gen

'''#end-readme

start_line_numer=$(grep -n ": '''" $ASSISTANT_HOME/commands/$1.sh | cut -f1 -d:)
start_line_numer=$((start_line_numer+1))

end_line_numer=$(grep -n "'''#end-readme" $ASSISTANT_HOME/commands/$1.sh | cut -f1 -d:)
end_line_numer=$((end_line_numer-1))

echo "----------------------------------"
sed -n "$start_line_numer,$end_line_numer""p" < $ASSISTANT_HOME/commands/$1.sh
echo "----------------------------------"