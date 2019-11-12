#!/bin/bash

workspace_path=$(pwd)
echo "workspace_path:$workspace_path"
last_comment=$(git log -1 --pretty=%B)

cd $workspace_path

git add --all
git commit --author="$GIT_AUTHOR" --amend -m "$last_comment"
git push origin HEAD -f
