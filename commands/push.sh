#!/bin/bash

#start-readme
: '

# Description

This command add all the files, commit, get the current branch and push

# Usage

jarvis push "im your commit"

'
#end-readme

workspace_path=$(pwd)
echo "workspace_path:$workspace_path"

cd $workspace_path
git add --all
git commit -m "$1"
git push $(git remote) HEAD