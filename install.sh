#!/bin/sh
# file name: install.sh
# description: TODO
# create date: 2016-02-18 20:03:46
# author: amoblin
# This file is created by Marboo<http://marboo.io> template file $MARBOO_HOME/.media/starts/default.sh
# 本文件由 Marboo<http://marboo.io> 模板文件 $MARBOO_HOME/.media/starts/default.sh　创建

#name=`basename "$1"`
#name_without_extension=`echo ${name%.*}`


function info()
{
    printf "${BLUE}$1${NORMAL}"
}

function error()
{
    printf "$1"
}


function init()
{
    # Use colors, but only if connected to a terminal, and that terminal
    # supports them.
    if which tput >/dev/null 2>&1; then
        ncolors=$(tput colors)
    fi
    if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
        RED="$(tput setaf 1)"
        GREEN="$(tput setaf 2)"
        YELLOW="$(tput setaf 3)"
        BLUE="$(tput setaf 4)"
        BOLD="$(tput bold)"
        NORMAL="$(tput sgr0)"
    else
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        BOLD=""
        NORMAL=""
    fi

    # Only enable exit-on-error after the non-critical colorization stuff,
    # which may fail on systems lacking tput or terminfo
    set -e
    
    umask g-w,o-w
}

init

info "Cloning gitdisk...\n"
hash git >/dev/null 2>&1 || {
    echo "Error: git is not installed"
    exit 1
}

TMP_PATH=/tmp/gitdisk

if [ -d $TMP_PATH ]; then
    rm -rf $TMP_PATH
fi

env git clone --depth=1 https://github.com/amoblin/gitdisk $TMP_PATH || {
    error "Error: git clone of gitdisk repo failed\n"

    exit 1
}

cd $TMP_PATH

info "Installing scripts...\n"

if [ ! -d /usr/local/bin ]; then
    sudo mkdir /usr/local/bin
fi

sudo install -m 755 gitdisk-update /usr/local/bin/gitdisk-update

sudo cp gitdisk-update.applescript "/Library/Scripts/Folder Action Scripts"

printf "${GREEN}"
echo '
       _ _      _ _     _
  __ _(_) |_ __| (_)___| | __
 / _` | | __/ _` | / __| |/ /
| (_| | | || (_| | \__ \   <
 \__, |_|\__\__,_|_|___/_|\_\
 |___/

'
echo 'Succeed! Done!'
echo ''
printf "${NORMAL}"
