(vim.cmd "colorscheme OceanicNext")

(vim.cmd
  "set nofoldenable\n
  set noswapfile\n
  set autoindent\n
  set expandtab\n
  set shiftwidth=4\n
  set smartindent\n
  set softtabstop=4\n
  set tabstop=4\n")

(vim.cmd
  "autocmd BufEnter * silent! lcd %:p:h\n
  autocmd BufNewFile,BufRead,BufEnter *.postcss set syntax=scss\n
  au TextYankPost * silent! lua vim.highlight.on_yank()")

; Theme Settings
(tset vim.g "oceanic_next_terminal_bold" 1)
(tset vim.g "oceanic_next_terminal_italic" 1)

; Editor Settings
(tset vim.g "mapleader" " ")
(tset vim.opt "clipboard" "unnamedplus")                  ; Use System Clipboard
(tset vim.opt "mouse" "a")                                ; Mouse interacts with NeoVim
(tset vim.opt "cursorline" true)                          ; Highlight current line
(tset vim.opt "completeopt" "menuone,noinsert,noselect")  ; Completion options
(tset vim.opt "hidden" true)                              ; Enable modified buffers in background
(tset vim.opt "ignorecase" true)                          ; Ignore case
(tset vim.opt "joinspaces" false)                         ; No double spaces with join after a dot
(tset vim.opt "scrolloff" 4)                              ; Lines of context
(tset vim.opt "shiftround" true)                          ; Round indent
(tset vim.opt "sidescrolloff" 8)                          ; Columns of context
(tset vim.opt "smartcase" true)                           ; Don"t ignore case with capitals
(tset vim.opt "splitbelow" true)                          ; Put new windows below current
(tset vim.opt "splitright" true)                          ; Put new windows right of current
(tset vim.opt "termguicolors" true)                       ; True color support
(tset vim.opt "wildmode" "list:longest")                  ; Command-line completion mode
(tset vim.opt "list" true)                                ; Show some invisible characters (tabs...)
(tset vim.opt "number" true)                              ; Print line number
(tset vim.opt "wrap" false)                               ; Disable line wrap

; GUI Specific
(tset vim.o "guifont" "Fira Mono:h14")

; Plugin Specific
(tset vim.g "startify_custom_header"
      {1 "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  "
       2 "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  "
       3 "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  "
       4 "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  "
       5 "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  "
       6 "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  "})
