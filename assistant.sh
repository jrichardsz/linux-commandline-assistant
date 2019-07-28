basedir=$(dirname "$0")
assistant_name=`basename "$0"`
assistant_real_location=$(realpath "$basedir/$assistant_name")
assistant_commands_folder=$(dirname "$assistant_real_location");

echo "Hi sr, I am $assistant_name"

if [[ "$1" == ""  ]]; then
  echo "What Can I do for you? Tell me a command..."
else

  command_path=$assistant_commands_folder/commands/$1".sh"
  if [ -f "$command_path" ]; then
    echo "Result of $1 command is:"
    echo ""
    bash $command_path
  else
    command_path=$assistant_commands_folder/private_commands/$1".sh"
    if [ -f "$command_path" ]; then
      echo "Result of $1 command is:"
      echo ""
      bash $command_path
    else
        echo ""
        echo "I don't know any command called: $1"
        echo ""
        echo "Currently I can help you with these commands:"
        echo ""
        for command_sh in $assistant_commands_folder/commands/*.sh; do
            command_name=`basename "$command_sh"`
            echo "- ${command_name/.sh/}"
        done

        for command_sh in $assistant_commands_folder/private_commands/*.sh; do
            command_name=`basename "$command_sh"`
            echo "- ${command_name/.sh/}"
        done
    fi
  fi

fi
