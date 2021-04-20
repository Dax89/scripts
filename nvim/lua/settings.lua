vim.cmd("colorscheme edge")

vim.g.mapleader = " "                            -- Leader is " "
vim.o.clipboard = "unnamedplus"                  -- Use System Clipboard
vim.o.mouse = "a"                                -- Mouse interacts with NeoVim
vim.o.cursorline = true                          -- Highlight current line
vim.o.completeopt = "menuone,noinsert,noselect"  -- Completion options (for deoplete
vim.o.hidden = true                              -- Enable modified buffers in background
vim.o.ignorecase = true                          -- Ignore case
vim.o.joinspaces = false                         -- No double spaces with join after a dot
vim.o.scrolloff = 4                              -- Lines of context
vim.o.shiftround = true                          -- Round indent
vim.o.sidescrolloff = 8                          -- Columns of context
vim.o.smartcase = true                           -- Don"t ignore case with capitals
vim.o.splitbelow = true                          -- Put new windows below current
vim.o.splitright = true                          -- Put new windows right of current
vim.o.termguicolors = true                       -- True color support
vim.o.wildmode = "list:longest"                  -- Command-line completion mode
vim.wo.list = true                               -- Show some invisible characters (tabs...)
vim.wo.number = true                             -- Print line number
vim.wo.wrap = false                              -- Disable line wrap

vim.cmd[[
set noswapfile
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4
]]

vim.api.nvim_command[[
autocmd BufEnter * silent! lcd %:p:h
]]

-- GUI Specific
vim.o.guifont = "Fira Mono:h14"

-- Plugin Specific
vim.g.startify_custom_header = {
    [[   _   _         __     _____ __  __   ]],
    [[  | \ | | ___  __\ \   / /_ _|  \/  |  ]],
    [[  |  \| |/ _ \/ _ \ \ / / | || |\/| |  ]],
    [[  | |\  |  __/ (_) \ V /  | || |  | |  ]],
    [[  |_| \_|\___|\___/ \_/  |___|_|  |_|  ]],
}

vim.g.startify_lists = {
    { type = "dir", header = { "   Current directory " .. vim.fn.getcwd() } },
    { type = "files", header = { "   Recent files" } },
    { type = "sessions", header = { "   Sessions" } },
    { type = "bookmarks", header = { "   Bookmarks" } },
    { type = "commands", header = { "   Commands" } },
}
