#!/bin/bash

#start-readme
: '

# Description

Shows the user variables

# Usage

jarvis vars

'
#end-readme

cat $ASSISTANT_HOME/variables
