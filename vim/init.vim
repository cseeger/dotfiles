call plug#begin('~/.nvim/plugged')

Plug 'mhartington/oceanic-next'
" Plug 'junegunn/seoul256.vim'
" Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'

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
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'easymotion/vim-easymotion'
Plug '/usr/local/opt/fzf' "required for fzf.vim
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'
Plug 'wincent/terminus'
Plug 'elixir-lang/vim-elixir'
" Plug 'kassio/neoterm'
" Plug 'gabesoft/vim-ags'
" Plug 'numkil/ag.nvim'
Plug 'neomake/neomake'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'ngmy/vim-rubocop'
Plug 'vim-utils/vim-ruby-fold'
Plug 'aklt/plantuml-syntax'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'thoughtbot/vim-rspec'
Plug 'rlue/vim-fold-rspec'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'MattesGroeger/vim-bookmarks'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'mattn/emmet-vim'

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
" let g:deoplete#enable_at_startup = 1
" set cursorline "TODO: why does this spike CPU?

" CtrlP settings
" let g:ctrlp_match_window = 'bottom,order:ttb'
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_custom_ignore = 0
" let g:ctrlp_show_hidden = 0
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Auto commands
" Automatically reload .vimrc on save
" autocmd BufWritePost .nvimrc source %
" Save when you lose focus (don't warn about unsaved files)
autocmd BufLeave,FocusLost * silent! wall

" Theme/Color
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme OceanicNext
" colorscheme nord
" colorscheme gruvbox
" let g:seoul256_background = 233
" colorscheme seoul256
" colorscheme monokai
" set background=dark

let mapleader = ","
let g:mapleader = ","

vmap <Enter> <Plug>(EasyAlign)
nnoremap <silent> _ :nohl<CR>

" NERDTree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
command NTF NERDTreeFind

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
" let g:EasyMotion_do_mapping = 0 " Disable default mappings`s{char}{label}`
" nmap <leader>s <Plug>(easymotion-s)
" nmap <leader>j <Plug>(easymotion-j)
" nmap <leader>k <Plug>(easymotion-k)
" nmap <Leader>h <Plug>(easymotion-linebackward)
" nmap <Leader>l <Plug>(easymotion-lineforward)

" NeoTerm mappings
" let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = ',tt'
let g:neoterm_size = '15'
let g:neoterm_test_status_format = '1'

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSend<cr>
vnoremap <silent> <f9> :TREPLSend<cr>

" RSpec.vim mappings
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = ":sp term://bundle exec rspec {spec}"
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>

" NeoTerm
" nnoremap <silent> ,rt :call neoterm#test#run('all')<cr>
" nnoremap <silent> ,rf :call neoterm#test#run('file')<cr>
" nnoremap <silent> ,rn :call neoterm#test#run('current')<cr>
" nnoremap <silent> ,rr :call neoterm#test#rerun()<cr>

" Useful maps
" hide/close terminal
" nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
" nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
" nnoremap <silent> ,tc :call neoterm#kill()<cr>

" FZF mappings
nmap <Leader>F :GFiles<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>B :History<CR>
nmap <Leader>b :Buffers<CR>

" ALE (check out: https://github.com/mhanberg/.dotfiles/blob/5fce37367204bb9d2a0ac257955c0d9c01b73fb5/vimrc#L131)
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {}
let g:ale_linters.ruby = ['rubocop', 'ruby', 'solargraph']

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers.ruby = ['rubocop']
let g:ale_ruby_rubocop_executable = 'bundle'

" Coc Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>p  <Plug>(coc-format-selected)

" javascript
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

" ruby folding
let g:ruby_fold_lines_limit = 200
set nofoldenable

" emmet
let g:user_emmet_install_global = 0
" autocmd FileType html EmmetInstall
let g:user_emmet_leader_key='<c-m>'
