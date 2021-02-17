#!/bin/sh

function hj_check_sys()
{
    if [ -z "$1" ];then
        echo "Please input paramter for $0"
        return 0
    else
        local sys_val
        sys_val="$(uname -a)"
        if [[ "$sys_val" =~ "$1" ]]; then
            return 0
        else
            return 1
        fi
    fi    
}

function hj_check_app()
{
    if [ -z "$1" ];then
        echo "Please input paramter for $0"
        return 0
    else
        if command -v $1 > /dev/null; then
            return 1
        else 
            return 0
        fi
    fi
}

function hj_check_root()
{
    user=$(env |grep -w USER | cut -d "=" -f 2)
    if [ $user == "root" ]; then
        return 1
    else
        return 0 
    fi
}



function hj_install_software()
{
    if [ -z "$1" ];then
        hj_check_root 
        if [ $? == 1 ]; then
            echo $1
        else
            echo "Please use sudo to install softwares "
        fi
    fi
}
