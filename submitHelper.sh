#!/bin/bash
git status
sleep 2
echo "-------Begin-------"
git add .
git commit -am "自动化代码提交"
git push origin master

git fetch

allTags=$(git tag --list)

if [ "$allTags" != "" ]; then

OLD_IFS="$IFS"
allTagsArr=($allTags)
IFS="$OLD_IFS"

result=`git describe --abbrev=0 --tags 2>/dev/null`

OLD_IFS="$IFS"
IFS="."
arr=($result)
IFS="$OLD_IFS"


lastchar=${arr[${#arr[@]}-1]}
latestChar=$[$lastchar+1]

newTag=${arr[0]}.${arr[1]}.$latestChar

for((k=0;k<200;k++)) do
    if [[ "${allTagsArr[@]}" =~ $newTag ]];then
        latestChar=$[$latestChar+1]
        newTag=${arr[0]}.${arr[1]}.$latestChar
    fi
done;

echo "自动升级tag为："$newTag

fi
