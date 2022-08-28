#!/bin/bash

#start-readme
: '

# Description

This command retrieves information about all branches and search for 
the last one that received a commit.

# Usage

jarvis latest_branch

'
#end-readme

git fetch
latest_branch=$(git for-each-ref --sort=-committerdate | head -n 1 | awk -F '/' '{ print $NF }')
echo "latest branch is: $latest_branch"