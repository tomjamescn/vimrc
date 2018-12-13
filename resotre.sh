#!/bin/bash

latest_backup_dir=`ls -t  ~/.vim_backup_* | head -n1 | awk -F: '{print $1}'`

rm ~/.vimrc
rm -rf ~/.vim
rm ~/.viminfo

cp -r $latest_backup_dir/.vimrc ~/
cp -r $latest_backup_dir/.vim ~/
cp -r $latest_backup_dir/.viminfo ~/

echo "resotre successfule!"

