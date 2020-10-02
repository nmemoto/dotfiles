#/bin/bash
EXTENSIONS_FILE=extensions.list

cd $(dirname $0)

for extension in $(cat ${EXTENSIONS_FILE} | grep -v '^#')
do
    code --install-extension $extension
done

cd -
