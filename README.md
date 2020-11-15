# vimrc

## FEATURE
- use vim-plug as plug manager
- use [coc.nvim](https://github.com/neoclide/coc.nvim) as VSCode-like IDE plug
- file type specified located in dir ~/.vim/lang/
- golang out of the box using [vim-go](https://github.com/fatih/vim-go) and [coc.nvim](https://github.com/neoclide/coc.nvim)
- python out of the box using [coc-python](https://github.com/neoclide/coc-python)
- more humanized tab label
- [experimental]rust out of the box using rust.vim


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


## USAGE

### config
> leader key is `,`

### hotkey
- `F4` enter paste mode
- `F5` refresh all buffer
- `F7` open nerdtree window on left
- `F8` open tagbar window on right


### hotkey from coc.nvim default setting
- `[g` and `]g` to navigate diagnostics
- `gd` to goto definition and `<ctrl>o` to go back
- `gr` to get all references
- `K` to show documentation in preview window
- `<leader>rn` to renaming symbol
- `<leader>f` to format selected code
- `<leader>a` to applying codeAction to the selected region
- `<leader>qf` to apply AutoFix to problem on the current line
- `<space>a` to show all diagnostics

### useful command
- `:CocConfig` to config coc.nvim
- `:Format` to format current buffer
- `:Fold` to fold current buffer


### useful snippets
https://github.com/honza/vim-snippets/tree/master/UltiSnips



please visit [this post](https://tomjamescn.github.io/2019-07-28-mastering-vim-part-2/), this was written in Chinese.

### install only-python vim IDE for docker env
```
curl https://cdn.jsdelivr.net/gh/tomjamescn/vimrc/install-python-ide-in-docker.sh | bash
```
