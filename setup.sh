 #!/bin/bash

cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -s "$PWD/$dotfile" $HOME
    fi
done