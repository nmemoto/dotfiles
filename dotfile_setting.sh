#!/bin/bash

# vim plugin
DEIN_HOME=~/.vim/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $DEIN_HOME
rm -f installer.sh
