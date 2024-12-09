git fetch
latest_branch=$(git for-each-ref --sort=-committerdate | head -n 1 | awk -F '/' '{ print $NF }')


echo "Latest branch"
echo "$latest_branch"
echo

echo "Latest commits in branch: $latest_branch"
git log --pretty='%h %an %ae %s' --branches=$latest_branch* -10
echo 

echo "Branch sort by date DESC"
git for-each-ref --sort=-committerdate --format='%(authordate:short) %(color:red)%(objectname:short) %(color:yellow)%(refname:short)%(color:reset) (%(color:green)%(committerdate:relative)%(color:reset))' | grep -v 'dependabot'