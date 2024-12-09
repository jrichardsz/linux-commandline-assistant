#!/bin/bash

: '''
# Video size reducer

If you have a big video file but you need to upload it in some comment or platform with file zise restrictions

# Usage

Just pass the parent folder

jarvis video-size-reducer /tmp/huge-videos

'''

source_file=$1

directory=$(dirname "$source_file")  
filename=$(basename -- "$source_file")
extension="${filename##*.}"
filename="${filename%.*}"


ffmpeg -n -loglevel error -i "$source_file" -vcodec libx264 -crf 28 -preset faster -tune film "$directory/$filename""_light.$extension"

/home/admin/Projects/spell-game/issues/20240724_074546_light.mp4

ffmpeg -i "$directory/$filename""_light.$extension" -vf scale="200:-1" "$directory/$filename""_small.$extension"