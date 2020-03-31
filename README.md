# vimrc

## INSTALL

First, you should add the export below to you .bashrc or .zshrc etc and reload it.
```sh
export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/vimrc'
```

Then, coc.nvim need nodejs:
```sh
curl -sL install-node.now.sh/lts | bash
```

Finally, install
```sh
- git clone https://github.com/tomjamescn/vimrc.git ~/.vim
- cd ~/.vim
- ./install.sh
- [optional] git checkout some-vers
```

## SETTING
### coc-python
please follow https://github.com/neoclide/coc-python


## FEATURE
- vim-plug as plug manager
- coc.nvim as auto completion plug
- file type specified located in dir ~/.vim/lang/
- golang out of the box using vim-go
- rust out of the box using rust.vim
- more humanized tab label

## USAGE

### useful snippets
https://github.com/honza/vim-snippets/tree/master/UltiSnips



please visit [this post](https://tomjamescn.github.io/2019-07-28-mastering-vim-part-2/), this was written in Chinese.
