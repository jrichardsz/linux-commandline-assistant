#!/bin/bash

echo "Your private commands are:"
echo ""
for command_sh in $ASSISTANT_HOME/private_commands/*.sh; do
    command_name=`basename "$command_sh"`
    echo "- ${command_name/.sh/}"
done

echo ""
echo "And these are the community commands:"
echo ""
for command_sh in $ASSISTANT_HOME/commands/*.sh; do
    command_name=`basename "$command_sh"`
    echo "- ${command_name/.sh/}"
done
