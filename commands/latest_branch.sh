git fetch
latest_branch=$(git for-each-ref --sort=-committerdate | head -n 1 | awk -F '/' '{ print $NF }')
echo -e "latest_branch: $latest_branch\n"

echo -e "detailed\n"

git log --all --graph --decorate --oneline --simplify-by-decoration