set fileencodings=utf-8
set encoding=utf-8
set modelines=0         

set nocompatible        
set backspace=2         
set ruler tabstop=2 expandtab shiftwidth=2
set noendofline
set nofixendofline

"" better switching between splits
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" FZF and Silver Searcher configuration"
nnoremap <Leader>t :FZF<Cr>
nnoremap <Leader>g :Ag<Cr>

" colorscheme and syntax configuration"
colo desert
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

" Zig configuration
let g:zig_fmt_autosave = 1
let g:zig_fmt_command = ['zig', 'fmt', '--color', 'off']

" Haskell configuration
let g:haskell_classic_highlighting = 1

" pgsql configuration
let g:sql_type_default = 'pgsql'

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

"Vim Plug configuration
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'lifepillar/pgsql.vim'
Plug 'ziglang/zig.vim'
Plug 'ervandew/supertab'
Plug 'neovimhaskell/haskell-vim'
Plug 'idris-hackers/idris-vim'
Plug 'udalov/kotlin-vim'
Plug 'jvoorhis/coq.vim'
Plug 'junegunn/vader.vim'
call plug#end()
