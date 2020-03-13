#!/bin/bash

EXIT_CODE=0
DIR_NAME=$(dirname $(realpath "$0"))
BASE_NAME=$(basename "$0")

echo "                                     "
echo "  ____        _    __ _ _            "
echo " |  _ \  ___ | |_ / _(_) | ___  ___  "
echo " | | | |/ _ \| __| |_| | |/ _ \/ __| "
echo " | |_| | (_) | |_|  _| | |  __/\__ \ "
echo " |____/ \___/ \__|_| |_|_|\___||___/ "
echo " ====================== by Chinipage " 
echo "                                     "

echo "Configuring dotfiles"
DOTFILES=$(ls -A $DIR_NAME | grep -v $BASE_NAME | grep -v .git | grep -v README.md)

for dotfile in $DOTFILES
do
    ln -sf $DIR_NAME/$dotfile $HOME/$dotfile

    if [ $? -eq 0 ]
    then 
        echo "* Created symbolic link for $dotfile"
    else
        echo "* Failed to create symbolic link for $dotfile"
        EXIT_CODE=1
    fi
done

echo "Dotfiles sucessfully configurated"
echo "Enjoy!!"

exit $EXIT_CODE
