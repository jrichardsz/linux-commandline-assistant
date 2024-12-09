#!/bin/bash

: '''
# randomize-names

Usage:

friday randomize-names /tmp/workspace

'''

while read fullfile ; do 
   echo "$fullfile" 
   dir="$(dirname "${fullfile}")"
   filename=$(basename -- "$fullfile")
   extension="${filename##*.}"
   filename="${filename%.*}"

   new_fname=$(uuidgen)
   full_location="$dir/$new_fname.$extension"
   echo "full_location: $full_location"
   mv "$fullfile" "$full_location"
done <<< $(find "$1" -maxdepth 1 -mindepth 1 -type f )