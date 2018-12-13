#!/bin/bash

#load current config
source ~/.bashrc

#first, backup old config
backup_dir=~/.vim_backup_`date +%Y-%m-%d_%H%M%S`
mkdir $backup_dir
mv ~/.vimrc $backup_dir/
mv ~/.vim $backup_dir/
mv ~/.viminfo $backup_dir/

vim_version=`vim --version | head -n 1 | grep -oE 'VIM - Vi IMproved [0-9].' | grep -o '[0-9]'`

echo "vim version:"
echo $vim_version
echo ""

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd $vim_version.x

cp .vimrc ~/.vimrc

cp -r .vim ~/

vim -c PlugInstall +qall

