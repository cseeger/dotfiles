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
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'cakebaker/scss-syntax.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'bling/vim-airline'
Plug 'wincent/terminus'
Plug 'kien/ctrlp.vim'

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
set clipboard=unnamed
set synmaxcol=128
set timeoutlen=500
set ttimeoutlen=10
set grepprg=ag
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set cursorline

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 0
let g:ctrlp_show_hidden = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Auto commands
" Automatically reload .vimrc on save
autocmd BufWritePost .nvimrc source %
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

" Terminal mappings
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
:nnoremap <A-_> <C-w>_
:nnoremap <A-=> <C-w>=

" Easymotion mappings
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" `s{char}{label}`
nmap <leader>s <Plug>(easymotion-s)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)
nmap <Leader>h <Plug>(easymotion-linebackward)
nmap <Leader>l <Plug>(easymotion-lineforward)
