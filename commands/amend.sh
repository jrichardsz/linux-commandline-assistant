#!/bin/bash

workspace_path=$(pwd)
echo "workspace_path:$workspace_path"
override_comment=$1
last_comment=$(git log -1 --pretty=%B)
comment=

if [ "$override_comment@" == "@" ] ;then
  comment=$last_comment
else
  comment=$override_comment
fi

echo "git commit message: $comment"

cd $workspace_path

git add --all
git commit --amend -m "$last_comment"
git push origin HEAD -f
