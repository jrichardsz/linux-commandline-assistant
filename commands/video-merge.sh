#!/bin/bash

: '''
# Password generator

This command gives you 3 passwords from simple to complex. Also gives you the option to set the length

Usage:

jarvis pass_gen 60

'''#end-readme

for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done

ffmpeg -i "concat:$file_1|$file_2" -acodec copy "$target_file"