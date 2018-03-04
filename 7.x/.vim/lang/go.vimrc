set encoding=utf-8              " Set default encoding to UTF-8
set noexpandtab                 " go official recommend using tab instead of space, https://github.com/golang/go/issues/16256
set tabstop=4
set shiftwidth=4
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set autowrite                   " auto save when run GoBuild or GoRun
set foldmethod=syntax

""""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""

" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

nmap <leader>b  <Plug>(go-build)
nmap <leader>r  <Plug>(go-run)
nmap <leader>t  <Plug>(go-test)
nmap <Leader>d <Plug>(go-doc)
nmap <Leader>c <Plug>(go-coverage-toggle)
nmap <Leader>i <Plug>(go-info)
nmap <Leader>l <Plug>(go-metalinter)

nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>


" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
