#!/bin/sh 

#!/bin/sh 
function install()
{
    if [ -z "$1" ];then
        echo "Please input paramter for $0"
        return 0
    else
        return 1
    fi    
}

function linux_init()
{
    # set term as 256 color
    if [ "$TERM" == "xterm" ]; then
        export TERM=xterm-256color
    fi

    if [ -d "/usr/share/man/zh_CN" ];then
        alias cman="man -M /usr/share/man/zh_CN"
    fi
}
function init_env()
{
    applist=("ctags" "gtags" "vim" "rg")
    hj_install_software "ctags" 
}

