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

call plug#end()

set nobackup
set nowb
set noswapfile
set encoding=utf8
set showtabline=2
set showmatch
set smarttab
set expandtab
set ai
set si
set wrap

let g:seoul256_background = 233
colo seoul256

let mapleader = ","
let g:mapleader = ","

vmap <Enter> <Plug>(EasyAlign)
map <leader>n :NERDTreeToggle<CR>
set number
nnoremap <silent> _ :nohl<CR>
