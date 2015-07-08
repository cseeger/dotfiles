call plug#begin('~/.nvim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'bling/vim-airline'
Plug 'wincent/terminus'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'

call plug#end()

" Basics
set nobackup
set nowb
set noswapfile
set number
set ruler
set encoding=utf8

" Whitespace
set showtabline=2
set tabstop=2
set shiftwidth=2
set expandtab
set list
set backspace=indent,eol,start
set smarttab
set ai
set si
set wrap

" Misc
set showmatch

" Auto commands
" Automatically reload .vimrc on save
autocmd BufWritePost .vimrc source %
" Save when you lose focus (don't warn about unsaved files)
autocmd BufLeave,FocusLost * silent! wall

" Theme/Color
let g:seoul256_background = 233
colo seoul256

let mapleader = ","
let g:mapleader = ","

vmap <Enter> <Plug>(EasyAlign)
map <leader>n :NERDTreeToggle<CR>
nnoremap <silent> _ :nohl<CR>
