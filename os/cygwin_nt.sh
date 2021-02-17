#!/bin/sh
#if [[command -v  winpty >/dev/null 2>&1 ]];then
#    echo "please install winpty to run python.exe in the shell"
#else
#    alias python='winpty python.exe'
#    alias ipython='winpty ipython.exe'
#fi

export PATH_BAC=$PATH
function path_munge() 
{
    case ":${PATH}:" in
        *:"$1":*)
            ;;
        *)
            if [ "$2" = "after" ] ; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
    esac
}

function set_python()
{
    if [ "$MSYS2_PATH_TYPE" = "inherit" ];then
        echo "Use windows python env"
    else 
        if [ -z $1 ];then
            echo "Please input python version"
        elif [[ "$PATH" =~ '/env/Python' ]];then
            echo "The env is $PATH"
        elif [ "$1" == '24' ];then
            path_munge $TOOLCHAINS/Python$1/Scripts
            path_munge $TOOLCHAINS/Python$1
        elif [ "$1" == '37-32' ];then
            path_munge $TOOLCHAINS/Python$1/Scripts
            path_munge $TOOLCHAINS/Python$1
        else
            echo "Couldn't find $temp_dir$1"
        fi 
    fi
}

function set_acsenv()
{
    export KI_DT_ICONHOME="C:\\S4200\\sys\\dat"
    export KI_KULT_PATH="C:\\S4200\\kiuser\\usrlib"
    export KI_LOCK_LOC="C:\\S4200\\sys\\lock"
    export KI_PLATFORM="S4200"
    export KI_PRB_CONFIG="C:\\S4200\\sys\\dat\\prbcnfg.dat"
    export KI_PRB_FAKE_OUTPUT="OFF"
    export KIBIN="C:\\S4200\\sys\\bin"
    export KIDAT="C:\\S4200\\sys\\dat"
    export KIHOME="C:\\S4200\\sys"
    export KILIB="C:\\S4200\\sys\\lib"
    export KILOG="C:\\S4200\\sys\\log"
    export KIPGM="C:\\S4200\\kiuser\\dbtask"
    export KIROOT="C:\\S4200"
    export KITMP="C:\\Temp"

}
function set_acs37env()
{
    set_acsenv
    export PATH=$PATH:/c/S4200/kiuser/usrlib:/c/S4200/sys/bin::/c/S4200/sys/openint/dll
    export KI_KULT_PATH="C:\\S4200\\kiuser\\usrlib"
    unset pyLibrary
    export pyLibrary="C:\\Users\\hwang29\\work\\src\\perforce\\depot\\ADT\\main\\ACS53_Improve_Python\\library\\pyLibrary"
    export ptm_path="C:\\Users\\hwang29\\work\\src\\perforce\\depot\\ADT\\main\\ACS53_Improve_Python\\library\\pyLibrary\\PTMLib"
}

function env_acs37()
{
    export PATH=$PATH_BAC
    set_acs37env
    set_python 37-32
    go.acs
}
function set_acs24env()
{
    set_acsenv
    unset pyLibrary
    export pyLibrary="C:\\ACS\\library\\pyLibrary"
    export PATH=$PATH:/c/S4200/kiuser/usrlib:/c/S4200/sys/bin:/c/S4200/sys/openint/dll
}


function env_acs24()
{

    export PATH=$PATH_BAC
    set_acs24env
    set_python 24
    go.acs.et24
}

function env_py()
{
    if [ -z $1 ];then
        export PATH=$PATH_BAC
        path_munge $HOME/AppData/Local/Programs/Python/Python37-32 
        path_munge $HOME/AppData/Local/Programs/Python/Python37-32/Scripts 
    elif [ $1 == '37' ];then
        export PATH=$PATH_BAC
        path_munge $HOME/AppData/Local/Programs/Python/Python37 
        path_munge $HOME/AppData/Local/Programs/Python/Python37/Scripts 
    elif [ $1 == '37-32' ];then
        export PATH=$PATH_BAC
        path_munge $HOME/AppData/Local/Programs/Python/Python37-32 
        path_munge $HOME/AppData/Local/Programs/Python/Python37-32/Scripts 
    elif [ $1 == '24' ];then
        export PATH=$PATH_BAC
        path_munge $HOME/AppData/Local/Programs/Python/Python24 
        path_munge $HOME/AppData/Local/Programs/Python/Python24/Scripts 
    else
        echo "Incorrect python version $1"
    fi

}



