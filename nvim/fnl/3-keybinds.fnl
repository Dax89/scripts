; General
(vim.api.nvim_set_keymap "n" "<Up>" "<Nop>"        { :noremap true })
(vim.api.nvim_set_keymap "n" "<Down>" "<Nop>"      { :noremap true })
(vim.api.nvim_set_keymap "n" "<Left>" "<Nop>"      { :noremap true })
(vim.api.nvim_set_keymap "n" "<Right>" "<Nop>"     { :noremap true })
(vim.api.nvim_set_keymap "n" "<Space>" "<Nop>"     { :noremap true })
(vim.api.nvim_set_keymap "n" "<F10>" "zA"          { :noremap true })
(vim.api.nvim_set_keymap "i" "<F10>" "zA"          { :noremap true })
(vim.api.nvim_set_keymap "o" "<F10>" "zA"          { :noremap true })
(vim.api.nvim_set_keymap "v" "<F10>" "zA"          { :noremap true })
(vim.api.nvim_set_keymap "n" "<Leader>a" "gg0VG"   { :noremap true })
(vim.api.nvim_set_keymap "n" "<C-Tab>" ":bn<CR>"   { :noremap true })
(vim.api.nvim_set_keymap "n" "<C-S-Tab>" ":bp<CR>" { :noremap true })

; Plugins
(vim.api.nvim_set_keymap "n" "<F5>" ":NvimTreeRefresh<CR>"        { :noremap true })
(vim.api.nvim_set_keymap "n" "<F6>" ":FloatermToggle<CR>"         { :noremap true })
(vim.api.nvim_set_keymap "n" "<F7>" ":NvimTreeToggle<CR>"         { :noremap true })
(vim.api.nvim_set_keymap "n" "<F8>" ":Vista!!<CR>"                { :noremap true })
(vim.api.nvim_set_keymap "n" "<F9>" ":LspTroubleToggle<CR>"       { :noremap true })
(vim.api.nvim_set_keymap "n" "<C-p>" ":Telescope find_files<CR>"  { :noremap true })
(vim.api.nvim_set_keymap "n" "<C-A-p>" ":Telescope live_grep<CR>" { :noremap true })

; Terminal Commands
(vim.api.nvim_set_keymap "t" "<F6>" "<C-\\><C-n>:FloatermToggle<CR>" { :noremap true })

