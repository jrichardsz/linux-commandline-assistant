# https://wiki.mozilla.org/Firefox/CommandLineOptions

id=$(uuidgen)
temp_profile_path=/tmp/$id
echo "temp_profile_path: $temp_profile_path"
firefox -CreateProfile "$id $temp_profile_path"
firefox -P "$id" -no-remote -new-instance