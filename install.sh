#!/bin/sh
# file name: install.sh
# description: TODO
# create date: 2016-02-18 20:03:46
# author: amoblin
# This file is created by Marboo<http://marboo.io> template file $MARBOO_HOME/.media/starts/default.sh
# 本文件由 Marboo<http://marboo.io> 模板文件 $MARBOO_HOME/.media/starts/default.sh　创建

#name=`basename "$1"`
#name_without_extension=`echo ${name%.*}`

hash git >/dev/null 2>&1 || {
    echo "Error: git is not installed"
    exit 1
}

TMP_PATH=/tmp/gitdisk

env git clone --depth=1 https://github.com/amoblin/gitdisk $TMP_PATH || {
    printf "Error: git clone of gitdisk repo failed\n"
    exit 1
}

cd $TMP_PATH

if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi

cp gitdisk-update ~/bin
sudo cp gitdisk-update.applescript "/Library/Scripts/Folder Action Scripts"
