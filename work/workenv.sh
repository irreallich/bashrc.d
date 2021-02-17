#!/bin/sh 
# used to set environment of work

#set work path
export CODE_DIR="${WORK}/src"
export WORK_PERFORCE="${CODE_DIR}/perforce/depot/ADT/main"
export ADTXML="${WORK_PERFORCE}/coding_stage/adtxml/src"
export ACS_PY3="${WORK_PERFORCE}/ACS53_Improve_Python"            
export ACS_24="${WORK_PERFORCE}/ACS53_ImproveAmara"
export ACS_24AMARA="${WORK_PERFORCE}/ACS53"
export TOOLCHAINS="${CODE_DIR}/toolchains"
export PYTHON2432="${TOOLCHAINS}/Python24"
export PYTHON3732="${TOOLCHAINS}/Python37-32"

alias go.adtxml="cd ${ADTXML}"
alias go.acs="cd ${ACS_PY3}"
alias go.acs.et24="cd ${ACS_24}"
alias go.acs.ama24="cd ${ACS_24AMARA}"
alias go.pf="cd ${WORK_PERFORCE}"




#perforce 
#export PATH=$HOME/.local:$PATH
#export P4PORT=perforce.keithley.com:1666
#export P4CLIENT=hjwang_ubuntu_appsshare
#export P4USER=appsshare
#export P4PASSWD=123456
#export P4CHARSET=utf8


