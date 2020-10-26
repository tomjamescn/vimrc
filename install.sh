#!/bin/bash

set -e

add-apt-repository ppa:jonathonf/vim -y
apt install vim vim-nox

export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/vimrc'

# install plug in vimrc
$vim -c PlugInstall +qall

# Coc extensions
vim -c 'CocInstall -sync coc-json coc-snippets coc-git coc-python|q'

