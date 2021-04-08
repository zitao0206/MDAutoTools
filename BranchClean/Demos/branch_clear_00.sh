#!/bin/bash
if [[ $1 = "--help" ]] || [[ $1 = "-h" ]]
then
    echo "这是一个git分支清理工具脚本"
    echo "包含'master'、'main'、'develop'、'release'字符串的分支不会清理"
    exit 0
else
    while getopts "a:b:local" opt
    do
        if [ $opt = "local" ];then
            echo "this is -l the arg is:  $opt"
        elif [ $opt = "r" ];then
            echo "this is -r the arg is:  $opt"
        elif [ $opt = "a" ];then
            echo "this is -a the arg is:  $OPTARG"
        else
            echo "\033[31m请使用命令'sh branch_clear.sh --help'查看相关参数设置\033[0m"
            exit 0
        fi
#        case $opt in
#        l)
#            echo "this is -l the arg is:  $OPTARG"
#            ;;
#        r)
#            echo "this is -r the arg is:  $OPTARG"
#            ;;
#        a)
#            echo "this is -a the arg is:  $OPTARG"
##            exit 0
#            ;;
#        b)
#            echo "this is -b the arg is:  $OPTARG"
#            exit 0
#            ;;
#        \?)
#            echo "\033[31m请使用命令'sh branch_clear.sh --help'查看相关参数设置\033[0m"
#            exit 0
#            ;;
#        esac
    done
    exit 0
fi
echo "\033[31m请使用命令'sh branch_clear.sh --help'查看相关参数设置\033[0m"
