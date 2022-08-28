#!/bin/bash

#start-readme
: '

# Description

List all the community and private commands

# Usage

jarvis ascii

then press: ctrl + shift + u and the code
'
#end-readme

echo ""
echo "community commands:"
echo ""
for command_sh in $ASSISTANT_HOME/commands/*.sh; do
    command_name=`basename "$command_sh"`
    echo "- ${command_name/.sh/}"
done

echo "private commands:"
echo ""
for command_sh in $ASSISTANT_HOME/private_commands/*.sh; do
    command_name=`basename "$command_sh"`
    echo "- ${command_name/.sh/}"
done

echo ""
echo "Remember that private commands overrides the public commands"
echo ""
echo ""
echo ""