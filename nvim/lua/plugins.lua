local installpath = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'


if vim.fn.empty(vim.fn.glob(installpath)) > 0 then
        vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..installpath)
        vim.api.nvim_command('packadd packer.nvim')
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- Lua
  use { 'wbthomason/packer.nvim', opt = true } -- Packer can manage itself as an optional plugin
  use { 'sainnhe/edge' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'romgrk/barbar.nvim' }
  use { 'glepnir/galaxyline.nvim' }
  use { 'liuchengxu/vista.vim' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }
  use { 'norcalli/nvim-colorizer.lua' }

  -- VimL
  use { 'leafOfTree/vim-svelte-plugin' }
  use { 'easymotion/vim-easymotion' }
  use { 'voldikss/vim-floaterm' }
  use { 'mhinz/vim-startify' }
  use { 'ziglang/zig.vim' }
  use { 'pangloss/vim-javascript' }
  use { 'evanleck/vim-svelte.git' }
  use { 'axvr/org.vim' }
  use { 'instant-markdown/vim-instant-markdown' }
  end)

require('colorizer').setup()
