set fileencodings=utf-8
set encoding=utf-8
set modelines=0         " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible        " Use Vim defaults instead of 100% vi compatibility
set backspace=2         " more powerful backspacing
set ruler tabstop=2 expandtab shiftwidth=2
set noendofline
set nofixendofline

" FZF and Ripgrep configuration"
nnoremap <C-t> :Files<Cr>
nnoremap <C-g> :Rg<Cr>

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

" Save and load folds"
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Zig configuration
let g:zig_fmt_autosave = 1
let g:zig_fmt_command = ['zig', 'fmt', '--color', 'off']

" Rust configuration
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
let g:racer_cmd = "/home/user/.cargo/bin/racer"
set hidden
let g:racer_cmd = 'racer'

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
Plug 'racer-rust/vim-racer'
Plug 'lifepillar/pgsql.vim'
Plug 'ziglang/zig.vim'
Plug 'ervandew/supertab'
call plug#end()
