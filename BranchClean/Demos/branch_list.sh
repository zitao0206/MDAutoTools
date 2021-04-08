#!/bin/bash
function checkMaster()
{
    A="master"
    B="Master"
    C="MASTER"
    if [[ $var == *$A* ]] || [[ $var == *$B* ]] || [[ $var == *$C* ]];
    then
        return 0
    else
        return 1
    fi
}

function checkRelease()
{
    A="release"
    B="Release"
    C="RELEASE"
    if [[ $var == *$A* ]] || [[ $var == *$B* ]] || [[ $var == *$C* ]];
    then
        return 0
    else
        return 1
    fi
}

function checkDevelop()
{
    A="develop"
    B="Develop"
    C="DEVELOP"
    if [[ $var == *$A* ]] || [[ $var == *$B* ]] || [[ $var == *$C* ]];
    then
        return 0
    else
        return 1
    fi
}

function checkHead()
{
    A="head"
    B="Head"
    C="HEAD"
    if [[ $var == *$A* ]] || [[ $var == *$B* ]] || [[ $var == *$C* ]];
    then
        return 0
    else
        return 1
    fi
}

function obtainAllDeleBranch()
{
    branch_all=$(git branch --all --format='%(refname:short)')

    OLD_IFS="$IFS"
    IFS=" "
    original_array=($branch_all)
    IFS="$OLD_IFS"
    array=()
    for var in ${original_array[@]}
    do
        if checkMaster || checkRelease || checkDevelop || checkHead
        then
          echo ""
        else
          array+=($var)
        fi
        echo $var
    done

    echo "可删除的分支列表如下： \n"

    for obj in ${array[@]}
    do
        echo $obj
    done
}




