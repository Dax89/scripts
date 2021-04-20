local installpath = vim.fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(installpath)) > 0 then
    vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim "..installpath)
    vim.api.nvim_command("packadd packer.nvim")
end

vim.cmd [[packadd packer.nvim]]

require("packer").startup(function()
    -- Lua
    use { "wbthomason/packer.nvim", opt = true } -- Packer can manage itself as an optional plugin
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}} }
    use "sainnhe/edge"
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "romgrk/barbar.nvim"
    use "glepnir/galaxyline.nvim"
    use "liuchengxu/vista.vim"
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use "nvim-lua/completion-nvim"
    use "norcalli/nvim-colorizer.lua"

    -- VimL
    use "easymotion/vim-easymotion"
    use "voldikss/vim-floaterm"
    use "mhinz/vim-startify"
    use "pangloss/vim-javascript"
    use "evanleck/vim-svelte.git"
    use "axvr/org.vim"
    use "instant-markdown/vim-instant-markdown"
    use "Raimondi/delimitMate"
end)

require("colorizer").setup()
