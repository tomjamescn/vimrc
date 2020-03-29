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

# install plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/vimrc'

$vim -c PlugInstall +qall

# vim-go
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct

vim main.go -c GoInstallBinaries +qall

