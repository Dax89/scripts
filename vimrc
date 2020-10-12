" External dependencies
" System Packages: ctags fzf ripgrep
" Manual Language Servers: coc-tsserver coc-tsline-plugin coc-cmake coc-rls
" System Language Servers: clang python-language-server
" TagBar: ctags

call plug#begin('~/.vim/plugins')
  " UI
  Plug 'mhinz/vim-startify'
  Plug 'ryanoasis/vim-devicons'
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'easymotion/vim-easymotion'
  Plug 'scrooloose/nerdtree'

  " Navigation
  Plug 'junegunn/fzf'

  " Code
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jiangmiao/auto-pairs'
  Plug 'qstrahl/vim-matchmaker'
  Plug 'tpope/vim-surround'
  Plug 'luochen1990/indent-detector.vim'
  Plug 'majutsushi/tagbar'

  " Syntax Highlighting
  Plug 'mechatroner/rainbow_csv'
  Plug 'jquintus/vim-log-syntax'
  Plug 'peterhoeg/vim-qml'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'pangloss/vim-javascript'

  " Modes
  Plug 'fidian/hexmode'
  Plug 'jceb/vim-orgmode'

  " Theme
  Plug 'NLKNguyen/papercolor-theme'
call plug#end()

" General Vim settings
set nocompatible
set cursorline
set clipboard=unnamedplus
set cmdheight=1
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
set foldcolumn=1
set showtabline=2
set noshowmode

" *** CoC.NVim settings ***
" Sample: https://github.com/neoclide/coc.nvim
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes

let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline                  = {}
let g:lightline.colorscheme      = 'PaperColor'
let g:lightline.tabline          = {'left': [['buffers']], 'right': [[]]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold   :call CocAction('fold', <f-args>)
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')

" *** CoC.NVim settings ***
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

syntax on

" Plugin Initializations
let mapleader = " "
let maplocalleader = " "
let NERDTreeMinimalUI = 1
let g:tagbar_compact = 1
let g:tagbar_expand = 1
let g:tagbar_singleclick = 1

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
nnoremap <leader>s :Startify<CR>

nnoremap <C-p> :FZF<CR>
nmap <leader><leader>cs :source $MYVIMRC<CR>
nmap <leader><leader>cc :e $MYVIMRC<CR>
nmap <leader><leader>x :Hexmode<CR>
nmap <leader><leader>pi :PlugInstall<CR>
nmap <leader><leader>pc :PlugClean<CR>
nmap <leader><leader>pd :PlugUpdate<CR>
nmap <leader><leader>pg :PlugUpgrade<CR>

" Goto N-Buffer
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" Remove N-Buffer
nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)

" Add/Remove Buffer
nmap <leader>+ :enew<CR>
nmap <leader>- :bp<BAR>:bd! #<CR>

set background=dark
colorscheme PaperColor

" GUI Window Size
if has("gui_running")
  " winpos 510 155 " Center window on screen (1920x1080)
  winpos 700 100   " Center window on screen (2560x1080)
  set columns=110 lines=40

  " Remove menubar, tearoffs and toolbar
  set guioptions=
  set guifont=Fira\ Code\ 14
endif

