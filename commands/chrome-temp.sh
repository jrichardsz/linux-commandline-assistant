id=$(uuidgen)
temp_profile_path=/tmp/$id
echo "temp_profile_path: $temp_profile_path"
google-chrome --user-data-dir=$temp_profile_path