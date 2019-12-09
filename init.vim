" Declarations
let mapleader=" " "space
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')

" NERDTree options
let g:NERDTreeWinPos = "right"

let g:signify_vcs_list = [ 'git', 'hg' ]

" Airline ------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_skip_empty_sections = 1

" Airline symbols
let g:airline_left_sep = "\uE0C0"
let g:airline_right_sep = "\uE0C2"
let g:airline_symbols = {}
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" Airline theme
let g:airline_solarized_bg='dark'
let g:airline_theme='molokai'

" vim-ident-guides
let g:indent_guides_enable_on_vim_startup = 1

" Dart default settings 
let dart_format_on_save = 1
let dart_style_guide = 2
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let dart_html_in_string=v:

" Vim-plug initialization
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin('~/.config/nvim/plugged')


"ctrlp
let g:ctrlp_working_path_mode = 0
set runtimepath^=~/.config/nvim/plugged/ctrlp/ctrlp.vim

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Better file browser
Plug 'scrooloose/nerdtree'

" Search results counter
Plug 'vim-scripts/IndexedSearch'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Paint css colors with the real color
Plug 'lilydjwg/colorizer'

" Highlight matching html tags
Plug 'valloric/MatchTagAlways'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'

" Color scheme
Plug 'nanotech/jellybeans.vim'

" Visually displaying indent levels in code
Plug 'Yggdroot/indentLine'

"enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'

" Highlight briefly every yank text
Plug 'machakann/vim-highlightedyank'

" Fancy start screen for Vim
Plug 'mhinz/vim-startify'

" script for text filtering and alignment
Plug 'godlygeek/tabular'

" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'

" Sublime Text's awesome multiple selection
Plug 'terryma/vim-multiple-cursors'

" Dart Plugin
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

" Typescript
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
"Plug 'HerringtonDarkholme/yats.vim'

"Prettier
Plug 'prettier/vim-prettier'

"Ack.vim
Plug 'mileszs/ack.vim'

"Python
Plug 'Vimjas/vim-python-pep8-indent'

"GraphQL file detection, syntax highlighting, and indentation
Plug 'jparise/vim-graphql'

"Plug 'Valloric/YouCompleteMe', {'for': 'php,typescript,javascript,html,css,xml'}
"Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': 'dart,ptyhon'}

"Vim intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Whitespace highlight
Plug 'ntpeters/vim-better-whitespace'

"snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"PHP
Plug 'stephpy/vim-php-cs-fixer'

call plug#end()

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

filetype plugin indent on

"" Copy/Paste/Cut
set clipboard=unnamed

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

set directory=~/.config/nvim/temp

"set wildmode=list:full
set wildmode=list:longest
set path+=**
set cursorline
set hlsearch
set cindent
set hidden

set termguicolors
set noswapfile
set ruler
set colorcolumn=80
set smartcase

" tabs and spaces handling
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set autoindent

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set bomb
set binary
set mouse= 

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

"Nicer vertical split
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg

" Floating Window colors
highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931

" Keybindings start


" buffer movement
nmap <C-l> :bnext<CR>
nmap <C-h> :bprevious<CR>
nmap <C-d> :bdelete<CR>


" toggle comment
nmap ,c :call NERDComment(0, 'toggle');<CR>
vmap ,c :call NERDComment(0, 'toggle');<CR>

" clear search results
nnoremap <silent> // :noh<CR>

" Kill flutter pid
nmap <leader>f :!kill -SIGUSR1 $(pgrep -f flutter_tools.snapshot) &> /dev/null<CR>

" Git
noremap <leader>b :Gblame<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>

noremap <leader>v :tabe $MYVIMRC<CR>

" NERDTree -----------------------------

" open nerdtree with the current file selected
nmap <leader>t :NERDTreeFind<CR>
nmap ,t :call ToggleNERDTree()<CR><Esc>

" mappings
map <C-q> :Ack! '<C-r>=expand("<cword>")<CR>'<CR>

"fuzzy mappings
nmap <C-b> :Buffers<CR>
nmap <C-f> :Files<CR>

" Keybindings end 

" save as sudo
ca w!! w !sudo tee "%"

autocmd FileType typescript nmap <buffer> <C-]> <Plug>(coc-definition)
autocmd FileType dart nmap <buffer> <C-]> <Plug>(coc-definition)
autocmd FileType python nmap <buffer> <C-]> <Plug>(coc-definition)
autocmd FileType javascript nmap <buffer> <C-]> <Plug>(coc-definition)
autocmd FileType php nmap <buffer> <C-]> <Plug>(coc-definition)
"autocmd FileType typescript nmap <buffer> <C-]> :YcmCompleter GoTo<CR>
"autocmd FileType javascript nmap <buffer> <C-]> :YcmCompleter GoTo<CR>

"autocmd BufWritePre *.dart silent! :FlutterHotReload
autocmd BufWritePre *.dart silent! :!kill -SIGUSR1 $(pgrep -f flutter_tools.snapshot) &> /dev/null
autocmd BufWritePre *.php,*.html,*.css,*.js silent! :%s/\s\+$//e
autocmd BufWritePre *.php,*.html,*.css,*.js silent! :%s///g

"autocmd BufWritePre *.ts :Prettier
"autocmd BufWritePre *.js :Prettier
"autocmd BufWritePre *.json :Prettier
autocmd BufWritePre *.yaml :Prettier
autocmd BufWritePre *.html :Prettier

"Credits to 
"https://kassioborges.dev/2019/04/10/neovim-fzf-with-a-floating-window.html

" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse'

" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Function to create the custom floating window
function! FloatingFZF()
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)

  " 90% of the height
  let height = float2nr(&lines * 0.9)
  " 60% of the height
  let width = float2nr(&columns * 0.6)
  " horizontal position (centralized)
  let horizontal = float2nr((&columns - width) / 2)
  " vertical position (one line down of the top)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }

  " open the new window, floating, and enter to it
  call nvim_open_win(buf, v:true, opts)
endfunction

function! ToggleNERDTree()
	if g:NERDTree.IsOpen()
		:NERDTreeToggle
	else
		:NERDTreeFind
		":vertical resize 50
	endif
endfunction
