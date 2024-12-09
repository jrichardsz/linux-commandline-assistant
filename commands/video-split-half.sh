source_file=$1

full_duration=$(ffprobe -hide_banner -loglevel error -i "$source_file" -show_format | grep duration | cut -d = -f2 | cut -d . -f1)

half_duration=$((full_duration/2))

echo "full_duration : $full_duration"
echo "half_duration : $half_duration"

directory=$(dirname "$source_file")  
filename=$(basename -- "$source_file")
extension="${filename##*.}"
filename="${filename%.*}"

echo ffmpeg -ss 0 -t $((half_duration-5)) -i "$source_file" -acodec copy "$directory/$filename""_part01.$extension"
ffmpeg -hide_banner -loglevel error  -ss 0 -t $((half_duration-5)) -i "$source_file" -acodec copy "$directory/$filename""_part01.$extension"

echo ffmpeg -ss $half_duration -i "$source_file" -acodec copy "$directory/$filename""_part02.$extension"
ffmpeg -hide_banner -loglevel error  -ss $half_duration -i "$source_file" -acodec copy "$directory/$filename""_part02.$extension"
