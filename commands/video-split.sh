#!/bin/bash
source_file=$1
parts=$2
padding=5

full_duration=$(ffprobe -hide_banner -loglevel error -i "$source_file" -show_format | grep duration | cut -d = -f2 | cut -d . -f1)
part_duration=$((full_duration/parts))

echo "full_duration : $full_duration"
echo "part_duration : $part_duration"
echo "padding : $padding"

directory=$(dirname "$source_file")  
filename=$(basename -- "$source_file")
extension="${filename##*.}"
filename="${filename%.*}"


for ((i=1;i<=parts;i++)); do
    start=$(((i-1)*part_duration))
    duration=$((i*part_duration+padding))
    echo "part #$i - start : $start ; duration: $duration"
    #echo ffmpeg -hide_banner -loglevel error  -ss $start -t $duration -i "$source_file" -acodec copy "$directory/$filename""_part$i.$extension"
    ffmpeg -hide_banner -loglevel error  -ss $start -t $duration -i "$source_file" -acodec copy "$directory/$filename""_part$i.$extension"    
done