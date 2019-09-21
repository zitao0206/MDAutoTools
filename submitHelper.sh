#!/bin/bash
git status
sleep 2
echo "-------Begin-------"
git add .
git commit -am "自动化代码提交"
git push origin master

git fetch
result=$(git tag --list)

echo "当前tag list:"$result


