#!/bin/bash

: '''
# Video size reducer

If you have a big video file but you need to upload it in some comment or platform with file zise restrictions

# Usage

Just pass the parent folder

jarvis video-size-reducer /tmp/foo/demo.mp4

'''

source_file=$1

directory=$(dirname "$source_file")  
filename=$(basename -- "$source_file")
extension="${filename##*.}"
filename="${filename%.*}"


ffmpeg -n -loglevel error -i "$source_file" -vcodec libx264 -crf 28 -preset faster -tune film "$directory/$filename""_light.$extension"

width=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$source_file" | cut -d x -f 1)
heigth=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$source_file" | cut -d x -f 2)

new_width=$((width/2))
new_heigth=$((heigth/2))

rs=`expr $new_width % 2`

if [ $rs != 0 ]
then
  new_width=$((new_width+1))
fi

rs=`expr $new_heigth % 2`
if [ $rs != 0 ]
then
  new_heigth=$((new_heigth+1))    
fi

echo "new size= $new_width:$new_heigth"

nohup ffmpeg -i "$directory/$filename""_light.$extension" -vf scale="$new_width:$new_heigth" "$directory/$filename""_small.$extension"  >/dev/null 2>&1 &

h_small=$((200*heigth/width))
rs=`expr $h_small % 2`
if [ $rs != 0 ]
then
  h_small=$((h_small+1))    
fi

nohup ffmpeg -i "$directory/$filename""_light.$extension" -vf scale="200:$h_small" "$directory/$filename""_tiny.$extension"  >/dev/null 2>&1 &

h_small=$((100*heigth/width))
rs=`expr $h_small % 2`
if [ $rs != 0 ]
then
  h_small=$((h_small+1))    
fi

nohup ffmpeg -i "$directory/$filename""_light.$extension" -vf scale="100:$h_small" "$directory/$filename""_micro.$extension"  >/dev/null 2>&1 &

# ffmpeg -i "$directory/$filename""_light.$extension" -vf scale="200:-1" "$directory/$filename""_small.$extension"
# ffmpeg -i "$directory/$filename""_light.$extension" -vf "scale=ceil(iw/2):ceil(ih/2)" "$directory/$filename""_small.$extension"