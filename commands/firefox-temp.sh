temp_profile_path=/tmp/$(uuidgen)
firefox -CreateProfile "profile $temp_profile_path"
firefox -profile "$temp_profile_path" -no-remote -new-instance