# https://wiki.mozilla.org/Firefox/CommandLineOptions

id=$(uuidgen)
temp_profile_path=/tmp/$id
echo "temp_profile_path: $temp_profile_path"
firefox -CreateProfile "$id $temp_profile_path"
nohup firefox -P "$id" -no-remote -new-instance >/dev/null 2>&1 &