-- LSP
vim.api.nvim_set_keymap('n', '<space>,', ':lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>;', ':lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>a', ':lua vim.lsp.diagnostic.code_action()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>d', ':lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>f', ':lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>h', ':lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>m', ':lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>r', ':lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>s', ':lua vim.lsp.buf.document_symbol()<CR>', {noremap = true, silent = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ft', ":lua require('telescope.builtin').treesitter()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fv', ":lua require('telescope.builtin').git_files()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>f/', ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", {noremap = true, silent = true})
