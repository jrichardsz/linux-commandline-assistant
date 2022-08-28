lines_before_match=100

absolute_script_location=
if [ -f "$ASSISTANT_HOME/private_commands/$1.sh" ]; then
  absolute_script_location="$ASSISTANT_HOME/private_commands/$1.sh"
else
    if [ -f "$ASSISTANT_HOME/commands/$1.sh" ]; then
      absolute_script_location="$ASSISTANT_HOME/commands/$1.sh"
    else
      echo "Sr. there is not readme for this command"
      exit 0      
    fi
fi

echo "command found: $absolute_script_location"
readme=$(sed -n '/#start-readme/,/#end-readme/p' "$absolute_script_location" | sed '$d'  | sed '$d' | sed '1d' | sed '1d' | sed '1d')
#readme=$(grep -B $lines_before_match '#end-readme' "$absolute_script_location"  | sed '$d'  | sed '$d' | sed '1d' )
echo ""
echo "$readme"