basedir=$(dirname "$0")
assistant_name=`basename "$0"`
assistant_real_location=$(realpath "$basedir/$assistant_name")
assistant_commands_folder=$(dirname "$assistant_real_location");

export ASSISTANT_COMMANDS_FOLDER=$assistant_commands_folder

if [ -s $assistant_commands_folder/variables ]
then
  export $(cat $assistant_commands_folder/variables | xargs)
else
  echo "variables are empty sr."
fi


echo "Hi sr, I am $assistant_name"

if [[ "$1" == ""  ]]; then
  echo "What Can I do for you? Tell me a command..."
else

  command_path=$assistant_commands_folder/private_commands/$1".sh"
  if [ -f "$command_path" ]; then
    echo "I will launch your private [$1] command ..."
    echo ""
    echo ""
    bash $command_path "${@:2}"
  else
    command_path=$assistant_commands_folder/commands/$1".sh"
    if [ -f "$command_path" ]; then
      echo "I will launch community [$1] command ..."
      echo ""
      bash $command_path "${@:2}"
    else
        echo ""
        echo "I don't know any command called: $1"
        echo ""
        echo "Currently I can help you with these private commands:"
        echo ""
        for command_sh in $assistant_commands_folder/private_commands/*.sh; do
            command_name=`basename "$command_sh"`
            echo "- ${command_name/.sh/}"
        done

        echo ""
        echo "And these community commands:"
        echo ""
        for command_sh in $assistant_commands_folder/commands/*.sh; do
            command_name=`basename "$command_sh"`
            echo "- ${command_name/.sh/}"
        done
    fi
  fi

fi
