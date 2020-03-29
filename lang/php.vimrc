set ts=4
set shiftwidth=4
set cindent
set expandtab
set fdm=indent

let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_folding = 1
source ~/.vim/lang/php-doc.vim
:imap <C-D> <ESC>:call PhpDocSingle()<CR>i
:nmap <C-D> :call PhpDocSingle()<CR>
:vmap <C-D> :call PhpDocRange()<CR>

