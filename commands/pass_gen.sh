#!/bin/bash

: '''
# Password generator

This command gives you 3 passwords from simple to complex. Also gives you the option to set the length

Usage:

jarvis pass_gen 60

'''#end-readme


date +%s | sha256sum | base64 | head -c $1 ; echo

echo

openssl rand -base64 $1

echo 

cat /dev/urandom | tr -dc 'a-zA-Z0-9-_!@#=' | fold -w $1 | grep -i '[!@#$%^&*()_+{}|:<>?=]' | head -n 1