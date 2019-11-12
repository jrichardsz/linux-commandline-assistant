workspace_path=$(pwd)
echo "workspace_path:$workspace_path"

cd $workspace_path

remote=$(git remote)
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
git pull $remote $branch
