BRANCH=$1
TAG=$2
git branch -d $BRANCH &> /dev/null || echo $BRANCH branch not found
git subtree split --prefix=Assets/com.nuclearband.sodatabase -b $BRANCH
git checkout $BRANCH
#git filter-branch --prune-empty --tree-filter 'rm -rf Tests' upm
git gc
git tag $TAG $BRANCH
git push -f -u origin $BRANCH --tags