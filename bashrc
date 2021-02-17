#!/bin/sh 
# bashrc for hjwang
# 因为这个配置也需要在win下运行，如果source太多脚本，会导致运行速度变得非常慢，所以尽量少做source

if [ $SHELL == "/bin/bash" -o  $SHELL == "/bin/bash.exe" -o $SHELL == "/usr/bin/bash" ]; then
    shell="bash" 
elif [ $SHELL == '/bin/zsh' -o $SHELL == '/usr/bin/zsh' ]; then
    shell="zsh"
else
    echo "Unknown shell!!!"
    exit 1
fi
export CONFIG_DIR="${WORK}/config"
export SHELL_CFG_DIR="${CONFIG_DIR}/bashrc.d"
export TOOLS_DIR="${WORK}/tools"

alias go.work="cd ${WORK}"
alias go.vimrc="cd ${CONFIG_DIR}/vimrc.d"
alias go.bashrc="cd ${SHELL_CFG_DIR}"

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'


alias ls='ls --color=auto'
alias ll='ls -lrth --color=auto'
alias la='ls -larth --color=auto'
alias grep='grep --color=auto'
alias vi='vim'
alias path='echo $PATH | tr ":" "\n"'
function check_sys()
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

function check_app()
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

function check_root()
{
    user=$(env |grep -w USER | cut -d "=" -f 2)
    if [ $user == "root" ]; then
        return 1
    else
        return 0 
    fi
}

function install_software()
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

function ccat() 
{
    local style="monokai"
    #local style="rainbow_dash"
    if [ $# -eq 0 ]; then
        pygmentize -P style=$style -P tabsize=4 -f terminal256 -g
    else
        for NAME in $@; do
            pygmentize -P style=$style -P tabsize=4 -f terminal256 -g "$NAME"
        done
    fi
}
#alias cat='ccat'

#CYGWIN_NT for modaxterm ,MSYS2_NT and MINGW* for msys2 system 
#Ubuntu must be in front of Linux
# 添加新的工作系统的时候要加在 linux 之前
sys_kw_array=("MINGW64_NT" "MINGW32_NT" "MSYS_NT" "MSYS2_NT" "CYGWIN_NT" "Ubuntu" "Microsoft" "Linux" "NONE")
for str in ${sys_kw_array[*]}
do
    check_sys $str
    if [ $? -eq 0 ]; then
        break
    fi
done

if [ $str == "Ubuntu" ];then
    source ${SHELL_CFG_DIR}/work/workenv_ubuntu.sh
#else
#    source ${SHELL_CFG_DIR}/work/workenv.sh
fi

mysys=`echo $str | tr '[:upper:]' '[:lower:]'`
source ${SHELL_CFG_DIR}/os/$mysys.sh
${mysys}_init


