

" {{{  插件列表
" #########################vim-plug begin#######################
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips'

" On-demand loading
Plug 'scrooloose/nerdtree'

Plug 'maralla/completor.vim'

Plug 'majutsushi/tagbar'

Plug 'terryma/vim-expand-region'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'fatih/vim-go', { 'for': ['go', 'asm', 'gohtmltmpl'] }

Plug 'ctrlpvim/ctrlp.vim'

Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'vim-syntastic/syntastic', { 'for': ['php', 'python'] }

" You must install ag:
" https://github.com/ggreer/the_silver_searcher
" sudo apt install silversearcher-ag
Plug 'mileszs/ack.vim'

Plug 'tpope/vim-fugitive'

Plug 'tenfyzhong/tagbar-markdown.vim', {'for': ['md', 'markdown'] }

" rust
Plug 'rust-lang/rust.vim'

" Initialize plugin system
call plug#end()

" #########################vim-plug end#######################


" }}}

"{{{ 常规设置
set ts=4
set expandtab
syntax enable
set fdm=marker
filetype plugin on
set encoding=utf8

"paste
set pastetoggle=<F4>

" {{{ tags
set autochdir
set tags=tags;
" }}}

"{{{ 自定义tab的标题
"begin tab config
" make tabline in terminal mode
function! Vim_NeatTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'
        " the label is made by MyTabLabel()
        let s .= ' %{Vim_NeatTabLabel(' . (i + 1) . ')} '
    endfor
    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'
    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLine#%999XX'
    endif
    return s
endfunc
 
" get a single tab name 
function! Vim_NeatBuffer(bufnr, fullname, num)
    let l:name = bufname(a:bufnr)
    if getbufvar(a:bufnr, '&modifiable')
        if l:name == ''
            return '[No Name]'
        else
            if a:fullname 
                return a:num.'-'.fnamemodify(l:name, ':p')
            else
                return a:num.'-'.fnamemodify(l:name, ':t')
            endif
        endif
    else
        let l:buftype = getbufvar(a:bufnr, '&buftype')
        if l:buftype == 'quickfix'
            return '[Quickfix]'
        elseif l:name != ''
            if a:fullname 
                return '-'.fnamemodify(l:name, ':p')
            else
                return '-'.fnamemodify(l:name, ':t')
            endif
        else
        endif
        return '[No Name]'
    endif
endfunc
 
" get a single tab label
function! Vim_NeatTabLabel(n)
    let l:buflist = tabpagebuflist(a:n)
    let l:winnr = tabpagewinnr(a:n)
    let l:bufnr = l:buflist[l:winnr - 1]
    return Vim_NeatBuffer(l:bufnr, 0, a:n)
endfunc
 
" get a single tab label in gui
function! Vim_NeatGuiTabLabel()
    let l:num = v:lnum
    let l:buflist = tabpagebuflist(l:num)
    let l:winnr = tabpagewinnr(l:num)
    let l:bufnr = l:buflist[l:winnr - 1]
    return Vim_NeatBuffer(l:bufnr, 0, l:num)
endfunc
 
" setup new tabline, just like %M%t in macvim
set tabline=%!Vim_NeatTabLine()
set guitablabel=%{Vim_NeatGuiTabLabel()}


"}}}


"}}}

" {{{ 常用热键
" leader key设为,
let mapleader = ","

" 保存当前文件
noremap <leader>s :w<cr>

" 插入模式
"   输入'"<{[`自动补全另外一半，并将光标移动到合适的位置
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i
inoremap ` ``<esc>i
" }}}

"{{{ 插件配置

"{{{ CtrlP配置
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --noaffinity -g ""'
endif
"}}}

"{{{ syntastic配置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}

" {{{ tagbar
nmap <F8> :TagbarToggle<CR>
" }}}

" {{{ nerdtree
nmap <F7> :NERDTreeToggle<CR>
" }}}

"{{{ airline主题配置
let g:airline_theme='luna'
"}}}"

"{{{ completor.vim配置
" plug completor.vim 
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
let g:completor_filetype_map = {
      \ 'go':   {'ft': 'lsp', 'cmd': 'gopls'},
      \ 'rust': {'ft': 'lsp', 'cmd': 'rls'},
      \ }
"}}}"

"{{{ UltiSnips配置
" plug UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-r>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
"}}}"

"{{{
" plug ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"}}}"

"}}}"

" file type config
autocmd FileType go source ~/.vim/lang/go.vimrc
autocmd FileType asm source ~/.vim/lang/go.vimrc
autocmd FileType gohtmltmpl source ~/.vim/lang/go.vimrc
autocmd FileType php source ~/.vim/lang/php.vimrc
autocmd FileType c source ~/.vim/lang/c.vimrc

