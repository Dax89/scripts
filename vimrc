" External dependencies
" System Packages: ctags prettier fzf ripgrep
" VimPrettier: prettier
" TagBar: ctags

call plug#begin('~/.vim/plugins')
  " UI
  Plug 'mhinz/vim-startify'
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'easymotion/vim-easymotion'
  Plug 'scrooloose/nerdtree'

  " Navigation
  Plug 'junegunn/fzf'
  Plug 'dyng/ctrlsf.vim'

  " Code
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jiangmiao/auto-pairs'
  Plug 'qstrahl/vim-matchmaker'
  Plug 'tpope/vim-surround'
  Plug 'luochen1990/indent-detector.vim'
  Plug 'majutsushi/tagbar'

  " Syntax Highlighting
  Plug 'jquintus/vim-log-syntax'
  Plug 'peterhoeg/vim-qml'

  " Modes
  Plug 'fidian/hexmode'

  " Theme
  Plug 'altercation/vim-colors-solarized'
  Plug 'dracula/vim', { 'as': 'dracula' }
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
let maplocalleader = " "
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_position = 'bottom'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1 
let g:buffet_always_show_tabline = 0
let g:buffet_show_index = 1

let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

let g:startify_custom_header = [
      \ ' __     ___            ',
      \ ' \ \   / (_)_ __ ___   ',
      \ '  \ \ / /| | ''_ ` _ \ ',
      \ '   \ V / | | | | | | | ',
      \ '    \_/  |_|_| |_| |_| ',
      \ '',
      \ '' ]

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
nnoremap <leader>m :MatchmakerToggle<CR>

nnoremap <leader><leader>st :call ToggleLocationList()<CR>

nnoremap <C-f> :CtrlSF<CR>
nnoremap <C-p> :FZF<CR>
nmap <leader><leader>cs :source $MYVIMRC<CR>
nmap <leader><leader>cc :e $MYVIMRC<CR>
nmap <leader><leader>x :Hexmode<CR>
nmap <leader><leader>pi :PlugInstall<CR>
nmap <leader><leader>pc :PlugClean<CR>
nmap <leader><leader>pd :PlugUpdate<CR>
nmap <leader><leader>pg :PlugUpgrade<CR>

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

" set background=dark
colorscheme dracula

" GUI Window Size
if has("gui_running")
  " winpos 510 155 " Center window on screen (1920x1080)
  winpos 700 100   " Center window on screen (2560x1080)
  set columns=110 lines=40

  " Remove menubar, tearoffs and toolbar
  set guioptions=
  set guifont=Fira\ Mono\ 13
endif

