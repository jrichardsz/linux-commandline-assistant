if [[ "$1" == ""  ]]; then
  echo "You don't enter a command to inspect it"
else

  command_path=$ASSISTANT_HOME/private_commands/$1".sh"
  if [ -f "$command_path" ]; then
    echo ""
    cat "$command_path"
  else
    command_path=$ASSISTANT_HOME/commands/$1".sh"
    if [ -f "$command_path" ]; then
        echo ""
        cat "$command_path"
    else
        echo "command not found"
    fi
  fi

fi