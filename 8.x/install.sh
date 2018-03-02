#!/bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~/.vimrc
cp -r .vim ~/.vim
vim -c PlugInstall +qall

