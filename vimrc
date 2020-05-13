" External dependencies
" System Packages: ctags prettier fzf ripgrep
" Language Servers: clang python-language-server
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
set foldcolumn=1

" *** CoC.NVim settings ***
" Sample: https://github.com/neoclide/coc.nvim
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes

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
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)
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

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" *** CoC.NVim settings ***

" *** TagBar JSON Support ***
let g:tagbar_type_json = {
      \ 'ctagstype' : 'json',
      \ 'kinds' : [ 'o:objects', 'a:arrays', 'n:numbers', 's:strings', 'b:booleans', 'z:nulls' ],
      \ 'sro' : '.',
      \ 'scope2kind': { 'object': 'o', 'array': 'a', 'number': 'n', 'string': 's', 'boolean': 'b', 'null': 'z' },
      \ 'kind2scope': { 'o': 'object', 'a': 'array', 'n': 'number', 's': 'string', 'b': 'boolean', 'z': 'null' },
      \ 'sort' : 0
      \ }
" *** TagBar JSON Support ***

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

