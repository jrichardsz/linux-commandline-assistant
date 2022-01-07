basedir=$(dirname "$0")
assistant_name=`basename "$0"`
assistant_real_location=$(realpath "$basedir/$assistant_name")
assistant_home=$(dirname "$assistant_real_location");

export ASSISTANT_LOCATION=$assistant_real_location
export ASSISTANT_HOME=$assistant_home

if [ -s $assistant_home/variables ]
then
  export $(cat $assistant_home/variables | xargs)
else
  echo "variables are empty sr. Don't forget to create it if you want to centralize some variables like folder locations, global users, etc"
fi


echo "Hi sr, I am $assistant_name"

if [[ "$1" == ""  ]]; then
  echo "What Can I do for you? Tell me a command..."
else

  command_path=$assistant_home/private_commands/$1".sh"
  if [ -f "$command_path" ]; then
    echo "I will launch your private [$1] command ..."
    echo ""
    echo ""
    bash $command_path "${@:2}"
  else
    command_path=$assistant_home/commands/$1".sh"
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
        for command_sh in $assistant_home/private_commands/*.sh; do
            command_name=`basename "$command_sh"`
            echo "- ${command_name/.sh/}"
        done

        echo ""
        echo "And these community commands:"
        echo ""
        for command_sh in $assistant_home/commands/*.sh; do
            command_name=`basename "$command_sh"`
            echo "- ${command_name/.sh/}"
        done
    fi
  fi

fi
