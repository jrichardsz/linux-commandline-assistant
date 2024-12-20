#!/bin/bash

: '''
# Sanitize file names

When files has blanks or special chars in their name but you need simple and clean names

- https://stackoverflow.com/a/14635450/3957754

# Usage

Just pass the parent folder

jarvis sanitize-names /tmp/workspace

'''

while read fullfile ; do 
   echo "$fullfile" 
   dir="$(dirname "${fullfile}")"
   filename=$(basename -- "$fullfile")
   extension="${filename##*.}"
   filename="${filename%.*}"

   new_fname=`echo $filename | sed 's/[^a-zA-Z0-9_-]/_/g'`
   full_location="$dir/$new_fname.$extension"
   echo "full_location: $full_location"
   mv "$fullfile" "$full_location"
done <<< $(find "$1" -maxdepth 1 -mindepth 1 -type f )