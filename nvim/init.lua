local installpath = vim.fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"

if vim.fn.isdirectory(installpath) == 0 then
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', installpath})
end

vim.cmd("packadd packer.nvim")

require("packer").startup(function()
    -- Lua
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "wbthomason/packer.nvim", opt = true } -- Packer can manage itself as an optional plugin
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}} }
    use { "folke/lsp-trouble.nvim" }
    use "kyazdani42/nvim-web-devicons"
    use "onsails/lspkind-nvim"
    use "kyazdani42/nvim-tree.lua"
    use "romgrk/barbar.nvim"
    use "glepnir/galaxyline.nvim"
    use "liuchengxu/vista.vim"
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use "hrsh7th/nvim-compe"
    use "norcalli/nvim-colorizer.lua"
    use "mhartington/oceanic-next"

    -- VimL
    use "easymotion/vim-easymotion"
    use "voldikss/vim-floaterm"
    use "mhinz/vim-startify"
    use "pangloss/vim-javascript"
    use "evanleck/vim-svelte"
    use "instant-markdown/vim-instant-markdown"
    use "Raimondi/delimitMate"
    use "MTDL9/vim-log-highlighting"
    use "alaviss/nim.nvim"
    use "ziglang/zig.vim"

    -- Lisp
    -- use "jpalardy/vim-slime"
    use "vlime/vlime"
    use "kovisoft/paredit"
end)

require("dev")
require("options")
require("keybinds")
require("lsp")
require("plugins/simple")
require("plugins/bufferline")
require("plugins/statusline")
require("plugins/lisp")
