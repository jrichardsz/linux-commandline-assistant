#!/bin/bash

#start-readme
: '

# Description

Shows the content of a script

# Usage

jarvis script push
'
#end-readme

absolute_script_location=
if [ -f "$ASSISTANT_HOME/commands/$1.sh" ]; then
  absolute_script_location="$ASSISTANT_HOME/commands/$1.sh"
else
    if [ -f "$ASSISTANT_HOME/private_commands/$1.sh" ]; then
      absolute_script_location="$ASSISTANT_HOME/private_commands/$1.sh"
    else
      echo "Sr. there is not readme for this command"
      exit 0      
    fi
fi

echo "Sr. this is the content of this command $1.sh"
cat $absolute_script_location
