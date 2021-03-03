-- General
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>',    { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap = true })

-- Shortcuts
vim.api.nvim_set_keymap('n', '<Leader>pc', ':PackerCompile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pi', ':PackerInstall<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ps', ':PackerSync<CR>',    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><Leader>c', ':e '..vim.fn.stdpath("config")..'/init.lua<CR>', { noremap = true })

-- Plugins
vim.api.nvim_set_keymap('n', '<F5>', ':NvimTreeRefresh<CR>',     { noremap = true })
vim.api.nvim_set_keymap('n', '<F6>', ':FloatermToggle<CR>',     { noremap = true })
vim.api.nvim_set_keymap('n', '<F7>', ':NvimTreeToggle<CR>',      { noremap = true })
vim.api.nvim_set_keymap('n', '<F8>', ':Vista!!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':FZF<CR>',    { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':FZF<CR>',    { noremap = true })
