#!/bin/bash

set -e

add-apt-repository ppa:jonathonf/vim -y
apt update
apt install -y vim vim-nox

cat << EOF >> $HOME/.bashrc

export MYVIMRC='~/.vim/vimrc'
export VIMINIT='source $MYVIMRC'
EOF

cat << EOF >> $HOME/.zshrc

export MYVIMRC='~/.vim/vimrc'
export VIMINIT='source $MYVIMRC'
EOF

export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/vimrc'

# install plug in vimrc
vim -c PlugInstall +qall

# Coc extensions
#vim -c 'CocInstall -sync coc-json coc-snippets coc-git coc-python|q'

