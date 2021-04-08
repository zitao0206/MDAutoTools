#!/bin/bash

result=$(git tag --list)
OLD_IFS="$IFS"
arr=($result)
IFS="$OLD_IFS"
echo "arr count--->"${#arr[@]}
lastTag=${arr[${#arr[@]}-1]}
echo "lastTag--->"$lastTag

OLD_IFS="$IFS"
IFS="."
arr1=($lastTag)
IFS="$OLD_IFS"


lastchar=${arr1[${#arr1[@]}-1]}
latestChar=$[$lastchar+1]

latestTag=${arr1[0]}.${arr1[1]}.$latestChar

echo "latestTag--->"$latestTag
