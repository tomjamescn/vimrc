#!/bin/bash

latest_backup_dir=`ls -t  ~/.vim_backup_* | head -n1 | awk -F: '{print $1}'`

rm ~/.vimrc
rm -rf ~/.vim
rm ~/.viminfo

mv $latest_backup_dir/.vimrc ~/
mv $latest_backup_dir/.vim ~/
mv $latest_backup_dir/.viminfo ~/

echo "resotre successfule!"

