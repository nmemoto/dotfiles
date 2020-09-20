 #!/bin/bash

cd $(dirname $0)
for dotfile in $(find . -type f | egrep -v './.git/|setup.sh|README.md' | sed 's/.\///')
do
    if [ ! -e $(dirname $HOME/$dotfile) ]; then
        mkdir -p $(dirname $HOME/$dotfile)
    fi
    ln -s "$PWD/$dotfile" $HOME/$dotfile
done
cd -
