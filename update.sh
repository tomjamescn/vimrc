#!/bin/bash

vim=vim

vim_version=`$vim --version | head -n 1 | grep -oE 'VIM - Vi IMproved [0-9].' | grep -o '[0-9]'`
if [ "$vim_version" != "8" ]; then
    echo "only support vim 8.x now!"
    exit
fi

echo "vim version:"
echo $vim_version
echo ""

cd $vim_version.x

cp .vimrc ~/.vimrc

cp -r .vim ~/

$vim -c PlugUpdate +qall

