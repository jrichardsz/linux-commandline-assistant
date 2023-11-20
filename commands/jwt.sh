#!/bin/bash

: '''
# JWT Decoder

sudo apt-get install jq

Usage:

jarvis jwt *****

'''#end-readme

function jwt-decode() {
  sed 's/\./\n/g' <<< $(cut -d. -f1,2 <<< $1) | base64 --decode | jq
}

jwt-decode "$1"