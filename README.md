# vimrc

## INSTALL

FIRST, you should add the export below to you .bashrc or .zshrc etc and reload it.
```sh
export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/vimrc'
```

Then, install
```sh
- git clone https://github.com/tomjamescn/vimrc.git ~/.vim
- cd vimrc
- ./install.sh
- [optional] git checkout some-vers
```

## FEATURE
- vim-plug as plug manager
- coc.nvim as auto completion plug
- file type specified located in dir ~/.vim/lang/
- golang out of the box using vim-go
- rust out of the box using rust.vim
- more humanized tab label


