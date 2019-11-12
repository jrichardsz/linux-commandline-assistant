workspace_path=$(pwd)
echo "workspace_path:$workspace_path"

cd $workspace_path
git add --all
git commit --author="$GIT_AUTHOR" -m "$1"
git push $(git remote) HEAD
