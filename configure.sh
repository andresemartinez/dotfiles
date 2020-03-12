#!/bin/bash

DIR_NAME=$(dirname $(realpath "$0"))
BASE_NAME=$(basename "$0")

echo "Configuring dotfiles"
echo $(realpath "$0")
DOTFILES=$(ls -A $DIR_NAME | grep -v $BASE_NAME | grep -v .git | grep -v .gitignore)

for dotfile in $DOTFILES
do
    echo "* Creating symbolic link for $dotfile"
    ln -si $DIR_NAME/$dotfile $HOME/$dotfile
done

echo "Configuration successfull"

exit 0
