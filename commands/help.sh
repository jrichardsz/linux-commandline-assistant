#!/bin/bash

: '''
# Description

This command show the readme of command

# Usage

jarvis describe pass_gen

'''

start_line_number=$(grep -n ": '''" $ASSISTANT_HOME/commands/$1.sh | head -n 1| cut -f1 -d:| xargs echo -n)
start_line_number=$(echo $start_line_number | xargs echo -n)
start_line_number=$((start_line_number+1))

end_line_number=$(grep -n "'''" $ASSISTANT_HOME/commands/$1.sh | sed '2q;d'| cut -f1 -d:| xargs echo -n)
end_line_number=$(echo "$end_line_number" | xargs)
end_line_number=$((end_line_number-1))

echo "----------------------------------"
sed -n "$start_line_number,$end_line_number""p" < $ASSISTANT_HOME/commands/$1.sh
echo "----------------------------------"