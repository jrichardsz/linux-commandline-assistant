#!/bin/bash

: '''
# sanitize-names

Just remove blanks from file names

- https://stackoverflow.com/a/14635450/3957754

Usage:

friday sanitize-names /tmp/workspace

'''#end-readme

while read fullfile ; do 
   echo "$fullfile" 
   dir="$(dirname "${fullfile}")"
   filename=$(basename -- "$fullfile")
   extension="${filename##*.}"
   filename="${filename%.*}"

   new_fname=`echo $filename | sed 's/[^a-zA-Z0-9_-]//g'`
   full_location="$dir/$new_fname.$extension"
   echo "full_location: $full_location"
   mv "$fullfile" "$full_location"
done <<< $(find "$1" -maxdepth 1 -mindepth 1 -type f )