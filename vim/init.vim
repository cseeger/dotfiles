call plug#begin('~/.nvim/plugged')

Plug 'mhartington/oceanic-next' " OceanicNext theme
Plug 'sainnhe/everforest' " EverForest theme
Plug 'savq/melange' " Melange theme
Plug 'franbach/miramare' " Miramare theme
Plug 'ajmwagar/vim-deus' " Deus theme

Plug 'tpope/vim-sensible' " a universal set of defaults
" Plug 'tpope/vim-surround' " is all about surroundings: parentheses, brackets, quotes, XML tags
Plug 'tpope/vim-fugitive' " Git plugin
Plug 'tpope/vim-commentary' " gcc commenting
Plug 'tpope/vim-vinegar' " split windows and netrw support (maybe not needed)
" Plug 'tpope/vim-endwise' " end certain structures automagically
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " nerdtree
Plug 'hoob3rt/lualine.nvim'
Plug 'elixir-lang/vim-elixir' " elixir plugin
Plug 'mhinz/vim-mix-format'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons' "dev icons for lualine/airline
Plug 'mustache/vim-mustache-handlebars' "handlebars templating support
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

" Basics
set nobackup " no backups
set nowb "no write backup
set noswapfile "no swap
set number " set linenumbers
set encoding=utf8

" Whitespace
set showtabline=2 "always show tabs
set tabstop=2 " tab control
set shiftwidth=2 " tab control
set expandtab " swap tabs out for spaces
set list "whitespace chars are visible
set si " context based smart indent
set wrap " auto word wrap (look to use textwidth as well)
set cursorline " highlight current line
set scrolloff=7 " set 7 lines to the cursors - when moving vertical

" Misc
set showmatch " highlight matched parens, brackets, beginning and end of code blocks
set clipboard=unnamed " global clipboard
" set synmaxcol=128 " max col length for syntax highlight
" set timeoutlen=500 " milliseconds to wait for a mapped sequence to complete
" set ttimeoutlen=10 " time in milliseconds to wait for a key code sequence to complete

" Auto commands
" Save when you lose focus (don't warn about unsaved files)
" autocmd BufLeave,FocusLost * silent! wall

" Theme/Color
if (has("termguicolors"))
  set termguicolors " enable 24-bit colors
endif
syntax enable
set background=dark
colorscheme everforest

let mapleader = "," " set mapleader

nnoremap <silent> _ :nohl<CR> " kill the search higlighting

" NERDTree
map <leader>n :NERDTreeToggle<CR> " toggle NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
command NTF NERDTreeFind " trigger NERDTreeFind

" tab bindings
nnoremap :t<CR>    :tabnew<CR>
xnoremap :t<CR>    :tabnew<CR>

let g:mix_format_on_save = 1

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { 'elixir' }, -- list of language that will be disabled
  },
  rainbow = {
    enable = true
  }
}

require'nvim-web-devicons'.setup {
 default = true;
}

require'lualine'.setup {
  options = {
    theme = 'oceanicnext'
  }
}

require('gitsigns').setup {
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
  }
}
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fv <cmd>Telescope git_files<cr>

" Clipboard commands
nmap :cp<CR> :let @+ = expand("%")<CR>
= 1
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
