call plug#begin('~/.nvim/plugged')

Plug 'mhartington/oceanic-next' " OceanicNext theme

Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] } " text alignment
Plug 'tpope/vim-sensible' " a universal set of defaults
Plug 'tpope/vim-surround' " is all about surroundings: parentheses, brackets, quotes, XML tags
Plug 'tpope/vim-fugitive' " Git plugin
Plug 'tpope/vim-abolish' " spelling substutions (why do I even have this?!)
Plug 'tpope/vim-repeat' " repeat plugins (probably not needed)
Plug 'tpope/vim-commentary' " gcc commenting
Plug 'tpope/vim-vinegar' " split windows and netrw support (maybe not needed)
Plug 'tpope/vim-rails' " rails support
Plug 'tpope/vim-endwise' " end certain structures automagically
Plug 'cakebaker/scss-syntax.vim' " scss syntax
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " nerdtree
Plug '/usr/local/opt/fzf' "required for fzf.vim
Plug 'junegunn/fzf.vim' " fzf
Plug 'bling/vim-airline' " bottom bar info
Plug 'wincent/terminus' " terminal support
Plug 'elixir-lang/vim-elixir' "elixir plugin"
Plug 'neomake/neomake' " async run programs
Plug 'othree/yajs.vim'  " JS syntax
Plug 'pangloss/vim-javascript' " JS
Plug 'mxw/vim-jsx' " JSX
Plug 'pedrohdz/vim-yaml-folds' " YAML folding
Plug 'AndrewRadev/splitjoin.vim' " switching between a single-line statement and a multi-line one.
Plug 'vim-utils/vim-ruby-fold' " Ruby folds
Plug 'aklt/plantuml-syntax' " plantuml
Plug 'MattesGroeger/vim-bookmarks' " vim bookmarks
Plug 'thoughtbot/vim-rspec' " rspec support
Plug 'rlue/vim-fold-rspec' " fold rspec
Plug 'tyru/open-browser.vim' " open in browser
Plug 'weirongxu/plantuml-previewer.vim' " plantuml

Plug 'dense-analysis/ale' " linting and LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP
Plug 'kristijanhusak/vim-carbon-now-sh' " carbon service integration
Plug 'mattn/emmet-vim' " emmet support

call plug#end()

" Basics
set nobackup " no backups
set nowb "no write backup
set noswapfile "no swap
set number " set linenumbers
set ruler  " botton right rulers
set encoding=utf8

" Whitespace
set showtabline=2 "always show tabs
set tabstop=2 " tab control
set shiftwidth=2 " tab control
set expandtab " swap tabs out for spaces
set list "whitespace chars are visible
set backspace=indent,eol,start
set smarttab " tab is whitespace
set ai " auto indent
set si " context based smart indent (what about ':filetype plugin indent on')
set wrap " auto word wrap (look to use textwidth as well)
set cursorline " highlight current line

" Misc
set showmatch " highlight matched parens, brackets, beginning and end of code blocks
set clipboard=unnamed " global clipboard
set synmaxcol=128 " max col length for syntax highlight
set timeoutlen=500 " milliseconds to wait for a mapped sequence to complete
set ttimeoutlen=10 " time in milliseconds to wait for a key code sequence to complete
set grepprg=ag " grep command
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " use guicursor now

" Auto commands
" Automatically reload .vimrc on save
" autocmd BufWritePost .nvimrc source %
" Save when you lose focus (don't warn about unsaved files)
autocmd BufLeave,FocusLost * silent! wall

" Theme/Color
if (has("termguicolors"))
  set termguicolors " enable 24-bit colors
endif
syntax enable " syntax highlighting
colorscheme OceanicNext " set colorscheme

let mapleader = "," " set mapleader
let g:mapleader = "," " do I still need this?

vmap <Enter> <Plug>(EasyAlign) " easyalign, which I dont use...
nnoremap <silent> _ :nohl<CR> " kill the search higlighting

" NERDTree
map <leader>n :NERDTreeToggle<CR> " toggle NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
command NTF NERDTreeFind " trigger NERDTreeFind

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

" NeoTerm mappings
" let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = ',tt'
let g:neoterm_size = '15'
let g:neoterm_test_status_format = '1'

" RSpec.vim mappings
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = ":sp term://bundle exec rspec {spec}"
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>

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

" tab bindings
nnoremap :t<CR>    :tabnew<CR>
xnoremap :t<CR>    :tabnew<CR>

let g:user_emmet_install_global = 0
" autocmd FileType html EmmetInstall
let g:user_emmet_leader_key='<c-m>'
