#!/bin/bash

function deleLocalBranch()
{
    git branch -D $1
}

function deleRemoteBranch()
{
    git push -u origin :$1
}

function deleLocalAndRemoteBranch()
{
    git branch -D $1
    git push -u origin :$1
}

function deleOneBranch()
{
    echo "\033[32m要删除的分支: \033[0m $1"
    if [[ $2 = 0 ]] && [[ $3 = 0 ]] ; then
        echo "\033[32m要删除远端和本地分支1\033[0m"
    elif [[ $2 = 1 ]] && [[ $3 = 1 ]]; then
        echo "\033[32m要删除远端和本地分支2\033[0m"
    elif [[ $2 = 1 ]] && [[ $3 = 0 ]]; then
        echo "\033[32m要删除本地分支3\033[0m"
    elif [[ $2 = 0 ]] && [[ $3 = 1 ]]; then
        echo "\033[32m要删除远端分支4\033[0m"
    else
        echo "\033[32m要删除远端和本地分支5\033[0m $2 $3"
    fi
#    git branch -D $1
#    git push -u origin :$1
}

function deleBranches()
{
    echo "\033[32m要删除的分支: \033[0m $1"
    if [[ $2 = 0 ]] && [[ $3 = 0 ]] ; then
        echo "\033[32m要删除远端和本地分支1\033[0m"
    elif [[ $2 = 1 ]] && [[ $3 = 1 ]]; then
        echo "\033[32m要删除远端和本地分支2\033[0m"
    elif [[ $2 = 1 ]] && [[ $3 = 0 ]]; then
        echo "\033[32m要删除本地分支3\033[0m"
    elif [[ $2 = 0 ]] && [[ $3 = 1 ]]; then
        echo "\033[32m要删除远端分支4\033[0m"
    else
        echo "\033[32m要删除远端和本地分支5\033[0m $2 $3"
    fi
#    git branch -D $1
#    git push -u origin :$1
}

if [ ! $1 ]; then
    echo "\033[31m请使用命令'sh branch_clear.sh --help'查看相关参数设置\033[0m"
    exit 0
fi

if [[ $1 = "--help" ]] || [[ $1 = "-h" ]]; then
    echo "这是一个git分支清理工具脚本"
    echo "包含'master'、'main'、'develop'、'release'字符串的分支不会清理"
    exit 0
else
    loca="0"
    remote="0"
    branchName=""
    branchKeyword=""
    # -o 接收短参数， -l 接收长参数， 需要参数值的在参数后面添加:
    set -- $(getopt -o lrs:S:m:M: -l loca,remote "$@")

    while [ -n "$1" ]; do
        case "$1" in
        -s|-S|-Specific)
            if [ ! $2 ]; then
                echo "\033[31m错误的输入参数，请使用命令'sh branch_clear.sh --help'查看相关参数设置\033[0m"
            else
                branchName=$2
            fi
            ;;
        -m|-M)
            if [ ! $2 ]; then
                echo "\033[31m错误的输入参数，请使用命令'sh branch_clear.sh --help'查看相关参数设置\033[0m"
            else
                branchKeyword=$2
            fi
            shift ;;
        --l|--local)
            loca="1"
            ;;
        --r|--remote)
            remote="1"
            shift ;;
        esac
        shift
    done
    echo "${branchName}--${branchKeyword}--local:${loca}--remote:${remote}"
    #删除分支操作
    if [ $branchName ]; then
        deleOneBranch $branchName $loca $remote
        exit 0
    fi
    if [ $branchKeyword ]; then
        deleBranches $branchKeyword $loca $remote
        exit 0
    fi
    exit 0
fi
echo "\033[31m请使用命令'sh branch_clear.sh --help'查看相关参数设置\033[0m"
