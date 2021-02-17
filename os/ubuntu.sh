#!/bin/sh 

function ubuntu_init()
{

    export build_dir="${work}/build"
    export src_dir="${WORK}/src"
    export projects_dir="${src_dir}/projects"
    export test_dir="${WORK}/test"
    export download_dir="${WORK}/download"
    export share_dir="${WORK}/share"
    export tftp_dir="${share_dir}/tftproot"
    export nfs_dir="${share_dir}/nfsroot"
    export ftp_dir="${share_dir}/ftproot"
    export win_dir="${share_dir}/win"
    
    # tools
    alias go.download="cd ${download_dir}"
    alias go.share="cd ${share_dir}"
    alias go.nfs="cd ${nfs_dir}"
    alias go.tftp="cd ${tftp_dir}"
    alias go.ftp="cd ${ftp_dir}"
    alias go.win="cd ${win_dir}"
    alias go.test="cd ${test_dir}"
    
    alias go.src="cd ${src_dir}"
    alias go.project="cd ${projects_dir}"
    alias go.learnc="cd ${projects_dir}/learnc"
    alias go.learnpy="cd ${projects_dir}/learnpy"
    
    # cpu占用率高的前是个进程
    alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
    alias vless=/usr/local/share/vim/vim82/macros/less.sh
    alias cpuusage="top -bn1 | grep 'Cpu(s)' | sed 's/.*, *\([0-9.]*\)%* id.*/\1/' | awk '{print 100 - \$1\"%\"}'"
    
    # set term as 256 color
    if [ "$TERM" == "xterm" ]; then
        export TERM=xterm-256color
    fi

    if [ -d "/usr/share/man/zh_CN" ];then
        alias cman="man -M /usr/share/man/zh_CN"
    fi

    export PS1='\[\e[32m\]\W $ \[\e[m\]'    # 仅显示最后目录
    export HISTTIMEFORMAT="%F %T "          # history显示时间

    export PATH=${HOME}/.local/bin/:$PATH
    export PATH=$HOME/.local:$PATH
    # 禁止使用ctrl+d退出终端
    #IGNOREEOF=10   # Shell only exists after the 10th consecutive Ctrl-d
    set -o ignoreeof  # Same as setting IGNOREEOF=10
}

