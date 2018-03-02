#!/bin/bash

vim_version=`vim --version | head -n 1 | grep -oE 'VIM - Vi IMproved [0-9].' | grep -o '[0-9]'`

echo "vim version:"
echo $vim_version
echo ""

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd $vim_version.x

cp .vimrc ~/.vimrc

cp -r .vim ~/.vim

vim -c PlugInstall +qall

