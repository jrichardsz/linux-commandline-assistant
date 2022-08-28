#!/bin/bash

#start-readme
: '

# Description

That will generate a password with 15 characters

# Usage

pass_gen 15
'
#end-readme

date +%s | sha256sum | base64 | head -c $1 ; echo