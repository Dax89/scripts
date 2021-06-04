local installpath = vim.fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"

if vim.fn.isdirectory(installpath) == 0 then
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', installpath})
end

vim.api.nvim_command("packadd packer.nvim")

require("packer").startup(function()
    -- Lua
    use { "wbthomason/packer.nvim", opt = true } -- Packer can manage itself as an optional plugin
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}} }
    use { "folke/lsp-trouble.nvim" }
    use "sainnhe/edge"
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "romgrk/barbar.nvim"
    use "glepnir/galaxyline.nvim"
    use "liuchengxu/vista.vim"
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use "hrsh7th/nvim-compe"
    use "norcalli/nvim-colorizer.lua"
    use "Olical/aniseed"

    use {
        "Olical/conjure",
        requires = {
            "tami5/compe-conjure"
        },

        config = "vim.g['conjure#client#fennel#aniseed#aniseed_module_prefix'] = 'aniseed.'",
    }

    -- VimL
    use "easymotion/vim-easymotion"
    use "voldikss/vim-floaterm"
    use "mhinz/vim-startify"
    use "pangloss/vim-javascript"
    use "evanleck/vim-svelte.git"
    use "axvr/org.vim"
    use "instant-markdown/vim-instant-markdown"
    use "Raimondi/delimitMate"
    use "alaviss/nim.nvim"
    use "ziglang/zig.vim"
end)

require("colorizer").setup()
require("trouble").setup()

require("dev")
require("options")
require("keybinds")
require("lsp")
require("plugins/bufferline")
require("plugins/statusline")
