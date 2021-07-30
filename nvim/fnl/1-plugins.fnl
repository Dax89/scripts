(macro use-pkg [name]
    `(use [,name]))

(local packerpath (.. (vim.fn.stdpath "data") "/site/pack/packer/start/packer.nvim"))

(fn packer-installed? [ ]
  (= (vim.fn.empty (vim.fn.glob packerpath)) 0))

(local wasinstalled? (packer-installed?))

(when (= (packer-installed?) false)
  (print "Could not find packer.nvim, cloning new copy to" packerpath)
  (vim.fn.system ["git" "clone" "https://github.com/wbthomason/packer.nvim" packerpath])
  (vim.api.nvim_command "packadd packer.nvim"))

(local packer (require :packer))

(packer.startup (fn [use]
  ; Lua
  (use-pkg :wbthomason/packer.nvim) ; Packer can manage itself as an optional plugin
  (use-pkg :rktjmp/hotpot.nvim)     ; Fennel Support
  (use-pkg :lukas-reineke/indent-blankline.nvim)
  (use-pkg :kyazdani42/nvim-web-devicons)
  (use-pkg :onsails/lspkind-nvim)
  (use-pkg :kyazdani42/nvim-tree.lua)
  (use-pkg :romgrk/barbar.nvim)
  (use-pkg :glepnir/galaxyline.nvim)
  (use-pkg :liuchengxu/vista.vim)
  (use-pkg :neovim/nvim-lspconfig)
  (use-pkg :kabouzeid/nvim-lspinstall)
  (use-pkg :hrsh7th/nvim-compe)
  (use-pkg :norcalli/nvim-colorizer.lua)
  (use-pkg :mhartington/oceanic-next)
  (use-pkg :folke/lsp-trouble.nvim)

  ; NOTE: How can I wrap these with use-pkg?
  (use {1 :nvim-treesitter/nvim-treesitter :run ":TSUpdate"})
  (use {1 :nvim-telescope/telescope.nvim :requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]})

  ; VimL
  (use-pkg :easymotion/vim-easymotion)
  (use-pkg :voldikss/vim-floaterm)
  (use-pkg :mhinz/vim-startify)
  (use-pkg :pangloss/vim-javascript)
  (use-pkg :evanleck/vim-svelte)
  (use-pkg :instant-markdown/vim-instant-markdown)
  (use-pkg :Raimondi/delimitMate)
  (use-pkg :MTDL9/vim-log-highlighting)
  (use-pkg :bakpakin/fennel.vim)
  (use-pkg :alaviss/nim.nvim)
  (use-pkg :ziglang/zig.vim)

  ; Lisp
  (use-pkg :vlime/vlime)
  ;(use-pkg :kovisoft/paredit)
  nil))

(when (= wasinstalled? false)
  (vim.api.nvim_command :PackerInstall))