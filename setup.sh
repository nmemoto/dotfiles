 #!/bin/bash

cd $(dirname $0)
for dotfile in $(find . -type f | egrep -v './.git/|setup.sh|README.md' | sed 's/.\///'  | grep -E '^\..*$')
do
    if [ ! -e $(dirname $HOME/$dotfile) ]; then
        mkdir -p $(dirname $HOME/$dotfile)
    fi
    ln -s "$PWD/$dotfile" $HOME/$dotfile
done

# VSCode User 設定(User and WorkSpace Settings https://code.visualstudio.com/docs/getstarted/settings)
ln -s $PWD/.vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
cd -
