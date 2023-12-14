# https://wiki.mozilla.org/Firefox/CommandLineOptions

id=$(uuidgen)
temp_profile_path=/tmp/$id
echo "temp_profile_path: $temp_profile_path"
firefox -CreateProfile "jondoe $temp_profile_path"
firefox -P "jondoe" -no-remote -new-instance