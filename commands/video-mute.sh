#!/bin/bash

: '''
# Remove audio from video

# Usage

Just pass the source video location

jarvis mute /tmp/foo/demo.mp4

'''

source_file=$1

directory=$(dirname "$source_file")  
filename=$(basename -- "$source_file")
extension="${filename##*.}"
filename="${filename%.*}"

ffmpeg -i "$source_file" -c copy -an "$directory/$filename""_mute.$extension"

