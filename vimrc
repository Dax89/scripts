" External dependencies
" System Packages: ctags cscope
" TagBar: ctags

call plug#begin('~/.vim/plugins')
  " UI
  Plug 'vim-airline/vim-airline'
  Plug 'easymotion/vim-easymotion'
  Plug 'scrooloose/nerdtree'
  Plug 'vim-scripts/Gundo'
  Plug 'ctrlpvim/ctrlp.vim'

  " Code
  Plug 'qstrahl/vim-matchmaker'
  Plug 'tpope/vim-surround'
  Plug 'luochen1990/indent-detector.vim'
  Plug 'majutsushi/tagbar'
  Plug 'brookhong/cscope.vim'
  Plug 'indiofish/auto-pairs'
  Plug 'triglav/vim-visual-increment'
  Plug 'godlygeek/tabular'

  " Syntax Highlighting
  Plug 'jquintus/vim-log-syntax'
  Plug 'peterhoeg/vim-qml'

  " Modes
  Plug 'fidian/hexmode'

  " Theme
  Plug 'orthecreedence/void.vim'
  Plug 'morhetz/gruvbox'
  "
  " Python
  Plug 'davidhalter/jedi-vim'
  Plug 'vim-python/python-syntax'
call plug#end()

" General Vim settings
set nocompatible
set cursorline
set clipboard=unnamedplus
set cmdheight=2
set completeopt+=longest,menuone
set hlsearch
set ignorecase
set laststatus=2
set nowrap
set number
set ruler
set showcmd
set smartcase
set wildmenu
set nobackup
set noswapfile
set hidden
set splitbelow

syntax on

" Plugin Initializations
let mapleader = " "
let g:gruvbox_contrast_dark = 'hard'
let g:cscope_silent = 1
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#rename_command = "<F3>"
let g:jedi#show_usages = "<F4>"
let g:python_highlight_all = 1

nmap <F6> :GundoToggle<CR>
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <SPACE> <Nop>

nnoremap <leader>a ggVG<CR>
nnoremap <leader>v :vsp<CR>
nnoremap <leader>h :sp<CR>
nnoremap <leader>q :<C-q>q<CR>
nnoremap <leader>nhl :set nohlsearch<CR>
nnoremap <leader>hl :set hlsearch<CR>
nnoremap <leader>m :MatchmakerToggle<CR>
nnoremap <leader>sf :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>st :call ToggleLocationList()<CR>

nmap <leader><leader>c :e $MYVIMRC<CR>
nmap <leader><leader>x :Hexmode<CR>
nmap <leader><leader>wd :set list \| set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<<CR>
nmap <leader><leader>wh :set nolist<CR>
nmap <leader><leader>pi :PlugInstall<CR>
nmap <leader><leader>pc :PlugClean<CR>
nmap <leader><leader>pd :PlugUpdate<CR>
nmap <leader><leader>pg :PlugUpgrade<CR>
nmap <leader><leader>pr :UpdateRemotePlugins<CR>
nmap <leader><leader>nhl :set nohlsearch<CR>
nmap <leader><leader>hl :set hlsearch<CR>

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>+ :enew<CR>
nmap <leader>- :bp<BAR>:bd! #<CR>

nmap <leader>t= :Tabularize /=<CR>
vmap <leader>t= :Tabularize /=<CR>
nmap <leader>t: :Tabularize /:<CR>
vmap <leader>t: :Tabularize /:<CR>
nmap <leader>t\| :Tabularize /\|<CR>
vmap <leader>t\| :Tabularize /\|<CR>
nmap <leader>t, :Tabularize /,<CR>
vmap <leader>t, :Tabularize /,<CR>

set background=dark
colorscheme gruvbox

" GUI Window Size
if has("gui_running")
  " winpos 510 155 " Center window on screen (1920x1080)
  winpos 700 100   " Center window on screen (2560x1080)
  set columns=110 lines=40

  " Remove menubar, tearoffs and toolbar
  set guioptions=
  set guifont=Fira\ Code\ 13
endif

