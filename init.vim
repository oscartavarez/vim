" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin('~/.config/nvim/plugged')

" Now the actual plugins:

" to get clipboard data
let g:clipboard = {
  \   'name': 'xclip-xfce4-clipman',
  \   'copy': {
  \      '+': 'xclip -selection clipboard',
  \      '*': 'xclip -selection clipboard',
  \    },
  \   'paste': {
  \      '+': 'xclip -selection clipboard -o',
  \      '*': 'xclip -selection clipboard -o',
  \   },
  \   'cache_enabled': 1,
  \ }

set runtimepath^=~/.config/nvim/plugged/ctrlp/ctrlp.vim
set directory=~/.config/nvim/temp

"set wildmode=list:full
set wildmode=list:longest
set path+=**
set cursorline
set hlsearch
set cindent
set clipboard=unnamed

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Better file browser
Plug 'scrooloose/nerdtree'

" Class/module browser
Plug 'majutsushi/tagbar'

" Search results counter
Plug 'vim-scripts/IndexedSearch'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code and files fuzzy finder
" Extension to ctrlp, for fuzzy command finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'

" Paint css colors with the real color
Plug 'lilydjwg/colorizer'

" Highlight matching html tags
Plug 'valloric/MatchTagAlways'

" Git integration
Plug 'tpope/vim-fugitive'

" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'

" Color scheme
Plug 'tomasr/molokai'

" Visually displaying indent levels in code
Plug 'nathanaelkane/vim-indent-guides'

"enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'

" Highlight briefly every yank text
Plug 'machakann/vim-highlightedyank'

" Fancy start screen for Vim
Plug 'mhinz/vim-startify'
" script for text filtering and alignment
Plug 'godlygeek/tabular'

" Asynchronous linting and make framework for Neovim/Vim
Plug 'neomake/neomake'

" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'

" Sublime Text's awesome multiple selection
Plug 'terryma/vim-multiple-cursors'

" Dart Plugin 
Plug 'dart-lang/dart-vim-plugin'

"Plug 'natebosch/dart_language_server'

"Plug 'reisub0/hot-reload.vim'

Plug 'thosakwe/vim-flutter'

"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'leafgarland/typescript-vim'

Plug 'Quramy/tsuquyomi'

Plug 'machakann/vim-highlightedyank'

Plug 'prettier/vim-prettier'

Plug 'morhetz/gruvbox'

Plug 'nanotech/jellybeans.vim'

Plug 'Valloric/YouCompleteMe'

Plug 'mileszs/ack.vim'

Plug 'Vimjas/vim-python-pep8-indent'

Plug 'jparise/vim-graphql'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

set termguicolors
set noswapfile
set ruler
set colorcolumn=80

" tabs and spaces handling
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set autoindent
set hlsearch


set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set bomb
set binary
set mouse= 
"set autoread


" show line numbers
set nu

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" remove ugly vertical lines on window division
set fillchars+=vert:\

" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
set shell=/bin/bash

set undofile
set undodir=/home/oscar/.vimundo/

if !exists('g:not_finish_vimplug')
  colorscheme jellybeans
endif

" save as sudo
ca w!! w !sudo tee "%"

" Keybindings start

"let mapleader=","

" tab navigation mappings
map tt :tabnew<ENTER>
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" buffer movement
nmap <C-l> :bnext<CR>
nmap <C-h> :bprevious<CR>
nmap <C-d> :bdelete<CR>

map <C-q> :Ack! '<C-r>=expand("<cword>")<CR>'<CR>

" map \ gc <esc>
map <leader>2 <leader>ci
nmap ,c <leader>2

" clear search results
nnoremap <silent> // :noh<CR>

" toggle tagbar display
map <leader>3 :TagbarToggle<CR>

" git shows file in commit
nmap <C-f> :!gitfiles<CR>
" gitfiles in /usr/bin/gitfiles content below
"git whatchanged --name-only --pretty="" origin..HEAD | sort | uniq -u<CR>

nmap <C-b> :!git blame %<CR>

" NERDTree -----------------------------

" toggle nerdtree display
map <leader>1 :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>

" Tasklist ------------------------------

" show pending tasks list
map <leader>4 :TaskList<CR>

" Neomake ------------------------------

" Run linter on write
autocmd! BufWritePost * Neomake

" Fzf ------------------------------

" file finder mapping
nmap ,e :Files<CR>
" tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tag<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" commands finder mapping
"nmap ,c :Commands<CR>

" mappings
nmap ,r :Ack
nmap ,wr :Ack <cword><CR>

" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)

"Coc.vim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"autocmd FileType dart nmap <buffer> <C-]> <Plug>(coc-definition)
"autocmd FileType python nmap <buffer> <C-]> <Plug>(coc-definition)
autocmd FileType typescript nmap <buffer> <C-]> :YcmCompleter GoTo<CR>
autocmd FileType javascript nmap <buffer> <C-]> :YcmCompleter GoTo<CR>

" Keybindings end 

" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Declarations

" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" autofocus on tagbar open
let g:tagbar_autofocus = 1

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'jellybeans'
let g:airline#extensions#whitespace#enabled = 0

let g:ctrlp_map = '<c-p>'
let g:indent_guides_enable_on_vim_startup = 1

"to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on docs/fancy_symbols.rst)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" Dart default settings 
let dart_format_on_save = 1
let dart_style_guide = 2
let g:lsc_server_commands = {'dart': 'dart_language_server'}

autocmd BufWritePre *.dart silent! :FlutterHotRestart
autocmd BufWritePre *.php,*.html,*.css,*.js silent! :%s/\s\+$//e
autocmd BufWritePre *.php,*.html,*.css,*.js silent! :%s///g

"autocmd BufEnter * NERDTreeMirror
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd w
autocmd BufWritePre *.ts :Prettier
autocmd BufWritePre *.js :Prettier
autocmd BufWritePre *.yaml :Prettier
autocmd BufWritePre *.html :Prettier
autocmd BufWritePre *.json :Prettier

" autocmd BufEnter * if !argc() | NERDTreeMirror | endif
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files = 1
