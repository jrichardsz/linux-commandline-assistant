#!/bin/bash

#start-readme
: '

# Description

Just open the postman

# Usage

jarvis postman
'
#end-readme

cd $POSTMAN_HOME
nohup ./Postman >/dev/null 2>&1 &
