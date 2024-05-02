git fetch
latest_branch=$(git for-each-ref --sort=-committerdate | head -n 1 | awk -F '/' '{ print $NF }')
echo -e "latest_branch: \n$latest_branch\n"

echo "Latest commits in branch: $latest_branch"

git log --pretty='%h %an %ae %s' --branches=$latest_branch* -10