#!/bin/bash

set -e

vim=vim

vim_version=`$vim --version | head -n 1 | grep -oE 'VIM - Vi IMproved [0-9].' | grep -o '[0-9]'`
if [ "$vim_version" != "8" ]; then
    echo "only support vim 8.x now!"
    exit
fi

export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/vimrc'

# install plug in vimrc
$vim -c PlugInstall +qall

# vim-go
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct

vim main.go -c GoInstallBinaries +qall

# Coc extensions
vim -c 'CocInstall -sync coc-json coc-snippets coc-git coc-rls coc-python coc-tsserver coc-phpls|q'

# bash language server
npm i -g bash-language-server

# rust
rustup update
rustup component add rls rust-analysis rust-src

