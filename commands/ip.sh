#!/bin/bash

#start-readme
: '

# Description

just get the current ip

# Usage

jarvis ip
'
#end-readme

echo "$(hostname -I | awk '{print $1}')"
