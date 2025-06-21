#!/bin/bash

: '''
# Video cut

Cut the video using an time interval

# Usage

Just start, end, source and target

jarvis video-cut 00:15 02:10 /tmp/ini.mp4  /tmp/ready.mp4

'''

time_init=$1
time_end=$2
source_file=$3
target_file=$4

if [ "$time_init" = "00:00" ]; then
  start_in_Seconds=0
else
    start_minutes=$(echo $time_init | cut -d : -f1)
    start_in_Seconds=$((start_minutes*60))
    start_in_Seconds=${start_in_Seconds#0}

    start_seconds=$(echo $time_init | cut -d : -f2)
    start_seconds=${start_seconds#0}
    start_in_Seconds=$((start_in_Seconds+start_seconds))
    start_seconds=${start_seconds#0}
    start_in_Seconds=${start_in_Seconds#0}
fi

echo "start_in_Seconds:$start_in_Seconds"

end_minutes=$(echo $time_end | cut -d : -f1)
end_minutes_in_seconds=$((end_minutes*60))
end_minutes_in_seconds=${end_minutes_in_seconds#0}

end_seconds=$(echo $time_end | cut -d : -f2)
end_seconds=${end_seconds#0}

end_in_Seconds=$((end_minutes_in_seconds+end_seconds))
echo "end_in_Seconds:$end_in_Seconds"

elapsed_time=$(($end_in_Seconds-$start_in_Seconds))
echo "elapsed_time:$elapsed_time"

echo "ffmpeg -ss $start_in_Seconds -t $elapsed_time -i $source_file -acodec copy $target_file"

# ffmpeg -ss $start_in_Seconds -t $elapsed_time -i "$source_file" -acodec copy -vcodec copy "$target_file"
ffmpeg -ss $start_in_Seconds -t $elapsed_time -i "$source_file" -acodec copy -vcodec libx264 "$target_file"