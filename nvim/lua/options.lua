vim.cmd("colorscheme OceanicNext")

-- Theme Settings
vim.g.oceanic_next_terminal_bold = 1
vim.g.oceanic_next_terminal_italic = 1

-- Editor Settings
vim.g.mapleader = " "                              -- Leader is " "
vim.opt.clipboard = "unnamedplus"                  -- Use System Clipboard
vim.opt.mouse = "a"                                -- Mouse interacts with NeoVim
vim.opt.cursorline = true                          -- Highlight current line
vim.opt.completeopt = "menuone,noinsert,noselect"  -- Completion options (for deoplete
vim.opt.hidden = true                              -- Enable modified buffers in background
vim.opt.ignorecase = true                          -- Ignore case
vim.opt.joinspaces = false                         -- No double spaces with join after a dot
vim.opt.scrolloff = 4                              -- Lines of context
vim.opt.shiftround = true                          -- Round indent
vim.opt.sidescrolloff = 8                          -- Columns of context
vim.opt.smartcase = true                           -- Don"t ignore case with capitals
vim.opt.splitbelow = true                          -- Put new windows below current
vim.opt.splitright = true                          -- Put new windows right of current
vim.opt.termguicolors = true                       -- True color support
vim.opt.wildmode = "list:longest"                  -- Command-line completion mode
vim.opt.list = true                                -- Show some invisible characters (tabs...)
vim.opt.number = true                              -- Print line number
vim.opt.wrap = false                               -- Disable line wrap

vim.cmd[[
set nofoldenable
set noswapfile
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4
]]

vim.cmd[[
autocmd BufEnter * silent! lcd %:p:h
autocmd BufNewFile,BufRead,BufEnter *.postcss set syntax=scss
au TextYankPost * silent! lua vim.highlight.on_yank()
]]

-- GUI Specific
vim.o.guifont = "Fira Mono:h14"

-- Plugin Specific
-- vim.g['aniseed#env'] = true

vim.g.startify_custom_header = {
    [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ]],
    [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ]],
    [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ]],
    [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ]],
    [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ]],
    [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ]],
}
