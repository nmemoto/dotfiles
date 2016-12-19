#!/bin/bash

cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -s "$PWD/$dotfile" $HOME
    fi
done

# vimrc setting
VIM_BK_DIR=${HOME}/.vim/backup
if ! [ -e "${VIM_BK_DIR}" ]; then
    mkdir -p "${VIM_BK_DIR}"
fi

VIM_SWP_DIR=${HOME}/.vim/swp
if ! [ -e "${VIM_SWP_DIR}" ]; then
    mkdir -p "${VIM_SWP_DIR}"
fi

# vim plugin
DEIN_HOME=~/.vim/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $DEIN_HOME
rm -f installer.sh
