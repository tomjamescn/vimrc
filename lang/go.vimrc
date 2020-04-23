" 要理解此文件的配置，请阅读https://github.com/fatih/vim-go/wiki/Tutorial

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

nmap <leader>b  <Plug>(go-build)
nmap <leader>r  <Plug>(go-run)
nmap <leader>t  <Plug>(go-test)
nmap <Leader>d <Plug>(go-doc)
nmap <Leader>c <Plug>(go-coverage-toggle)
nmap <Leader>i <Plug>(go-info)
nmap <Leader>l <Plug>(go-metalinter)

nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

command! -bang A call go#alternate#Switch(<bang>0, 'edit')
command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -bang AS call go#alternate#Switch(<bang>0, 'split')
command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" do Not fold after save
let g:go_fmt_experimental = 1

let g:go_list_type = "quickfix"

" layout of debug
" Defaults:
" >
"  let g:go_debug_windows = {
"            \ 'vars':       'leftabove 30vnew',
"            \ 'stack':      'leftabove 20new',
"            \ 'goroutines': 'botright 10new',
"            \ 'out':        'botright 5new',
"  \ }
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }

" some highlight, no effect under coc.nvim
"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_generate_tags = 1

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
