#!/bin/sh 
# for windows wsl







export PS1='\[\e[32m\]\W $ \[\e[m\]'    # 仅显示最后目录
export HISTTIMEFORMAT="%F %T "          # history显示时间

export PATH=${HOME}/.local/bin/:$PATH
export PATH=$HOME/.local:$PATH

export WORK_SRC_DIR="${WORK}/src"
export WORK_WINSHARE="${WORK_SRC_DIR}/winshare"
export PROJECT_DIR="${WORK_SRC_DIR}/projects"
export LEARNC_DIR="${PROJECT_DIR}/learnc"
export LEARNPY_DIR="${PROJECT_DIR}/learnpy"

export TEST_DIR="${WORK}/test"
export DOWNLOAD_DIR="${WORK}/download"
export SHARE_DIR="${WORK}/share"
export TFTP_DIR="${SHARE_DIR}/tftproot"
export NFS_DIR="${SHARE_DIR}/nfsroot"
export FTP_DIR="${SHARE_DIR}/ftproot"

# tools
alias go.test="cd ${TEST_DIR}"
alias go.download="cd ${DOWNLOAD_DIR}"
alias go.winshare="cd ${WORK_WINSHARE}"
alias go.share="cd ${SHARE_DIR}"
alias go.nfs="cd ${NFS_DIR}"
alias go.tftp="cd ${TFTP_DIR}"
alias go.ftp="cd ${FTP_DIR}"

alias go.src="cd ${WORK_SRC_DIR}"
alias go.project="cd ${PROJECT_DIR}"
alias go.learnc="cd ${LEARNC_DIR}"
alias go.learnpy="cd ${LEARNPY_DIR}"


