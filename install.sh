#!/bin/bash

set -e

add-apt-repository ppa:jonathonf/vim -y
apt update
apt install -y vim vim-nox

cat << EOF >> $HOME/.bashrc

export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/vimrc'
EOF

cat << EOF >> $HOME/.zshrc

export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/vimrc'
EOF

export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/vimrc'

# install plug in vimrc
$vim -c PlugInstall +qall

# Coc extensions
vim -c 'CocInstall -sync coc-json coc-snippets coc-git coc-python|q'

