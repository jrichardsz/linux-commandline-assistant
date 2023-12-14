time_init=$1
time_end=$2
source_file=$3
target_file=$4

start_minutes=$(echo $time_init | cut -d : -f1)
start_in_Seconds=$((start_minutes*60))

start_seconds=$(echo $time_init | cut -d : -f2)
start_in_Seconds=$((start_in_Seconds+start_seconds))
echo "start_in_Seconds:$start_in_Seconds"

end_minutes=$(echo $time_end | cut -d : -f1)
end_minutes_in_seconds=$((end_minutes*60))

end_seconds=$(echo $time_end | cut -d : -f2)
end_in_Seconds=$((end_minutes_in_seconds+end_seconds))
echo "end_in_Seconds:$end_in_Seconds"

elapsed_time=$(($end_in_Seconds-$start_in_Seconds))
echo "elapsed_time:$elapsed_time"

ffmpeg -ss $start_in_Seconds -t $elapsed_time -i "$source_file" -acodec copy "$target_file"