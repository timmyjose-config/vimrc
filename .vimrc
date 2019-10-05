set modelines=0         " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible        " Use Vim defaults instead of 100% vi compatibility
set backspace=2         " more powerful backspacing
set ruler tabstop=2 expandtab shiftwidth=2

" FZF configuration"
nnoremap <C-t> :Files<Cr>
nnoremap <C-g> :Rg<Cr>

" RustFmt configuration"
noremap <C-y> :RustFmt<Cr>

" ocp-indent configuration for OCaml"
set rtp +="/Users/z0ltan/Software/ocp-indent-vim"

" colorscheme and syntax configuration"
colo default 
syntax on
filetype plugin indent on
set autoindent
set smartindent
set clipboard=unnamed
set termguicolors

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

au BufWrite *: Autoformat

" Save and load folds"
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


let g:sql_type_default = 'pgsql'
let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']
let g:formatter_yapf_style = 'pep8'
set hidden
let g:racer_cmd = 'racer'

execute pathogen#infect()
call pathogen#infect()

function! InsertNamespace()
  let s:dir_regex        = 'test\/\|src\/'
  let s:first_line_empty = getbufline('%', 1, 1) == ['']
  let s:file_path        = expand('%')
  if match(s:file_path, s:dir_regex) > -1 && s:first_line_empty
      let s:relevant_path   = substitute(s:file_path, s:dir_regex, '', '')
      let s:dasherized_path = substitute(s:relevant_path, '_', '-', 'g')
      let s:dotted_path     = substitute(s:dasherized_path, '\/', '\.', 'g')
      let s:namespace       = substitute(s:dotted_path, '\.clj[s]*$', '', '')
      call setline(1, '(ns ' . s:namespace . ')')
  endif
endfunction

augroup filetype_clojure
    autocmd!
    autocmd FileType clojure call InsertNamespace()
augroup END

augroup filetype_clojurescript
   autocmd!
   autocmd FileType clojurescript call InsertNamespace()
augroup END

"Zig configuration
let g:zig_fmt_autosave = 1
let g:zig_fmt_command = ['zig', 'fmt', '--color', 'off']

"C configuration
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

"Vim Plug configuration
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
call plug#end()
