 #!/bin/bash

cd $(dirname $0)
for dotfile in $(find . -type f | egrep -v './.git/|setup.sh|README.md' | sed 's/.\///')
do
    ln -s "$PWD/$dotfile" $HOME/$dotfile
done
cd - 