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
Plug 'tpope/vim-endwise' " end certain structures automagically
Plug 'rstacruz/vim-closer' " auto close parens, brackets, etc.
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " nerdtree
Plug 'hoob3rt/lualine.nvim' " lua based airline
Plug 'elixir-lang/vim-elixir' " elixir plugin
Plug 'mhinz/vim-mix-format' " run `mix format`
Plug 'npxbr/glow.nvim' " markdown preview

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons' "dev icons for lualine/airline
Plug 'mustache/vim-mustache-handlebars' "handlebars templating support
Plug 'lewis6991/gitsigns.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'ray-x/cmp-treesitter'
Plug 'hrsh7th/nvim-cmp'

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
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
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

" LSP
lua <<EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.elixirls.setup{
  cmd = { '/Users/cseeger/.local/share/nvim/lsp_servers/elixir/elixir-ls/language_server.sh' },
  on_attach = on_attach,
  capabilities = capabilities
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'elixirls' }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end
EOF

"completion
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'treesitter' }
    })
  })
EOF

lua <<EOF
require('settings.keymap')
EOF

" Clipboard commands
nmap :cp<CR> :let @+ = expand("%")<CR>

" Plug commands
nmap :pi<CR> :PlugInstall<CR>
