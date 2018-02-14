"  Michele Giugliano’s vimrc file - Jan 3rd 2018
"
" brew install vim   (the default under macOS does NOT have the clipboard working)
"------------------------------------------------------------------------------------------------------------
"" If it's a new install, pls follow the instructions below:
"
" Install Pathogen (https://github.com/tpope/vim-pathogen)
"     > mkdir -p ~/.vim/autoload ~/.vim/bundle
"     > curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
"  (add to .vimrc        execute pathogen#infect()    )
"
" Now any plugins you wish to install can be extracted to a subdirectory under ~/.vim/bundle, and they will
" be added to the 'runtimepath'. Observe:
"
" cd ~/.vim/bundle
" git clone https://github.com/tpope/vim-sensible.git
" git clone https://github.com/vim-airline/vim-airline
" git clone https://github.com/vim-airline/vim-airline-themes
" git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
" git clone git://github.com/ntpeters/vim-better-whitespace.git
" git clone git://github.com/Raimondi/delimitMate
" git clone git://github.com/Yggdroot/indentLine
" git clone git://github.com/sheerun/vim-polyglot
" git clone git://github.com/ervandew/screen
" git clone https://github.com/scrooloose/nerdtree.git
" git clone https://github.com/jistr/vim-nerdtree-tabs.git
" git clone https://github.com/tpope/vim-repeat
" git clone https://github.com/svermeulen/vim-easyclip
"------------------------------------------------------------------------------------------------------------

"  If you don't understand a setting in here, just type ':h setting'.
" This must be first, because it changes other options as a side effect.
set nocompatible                  " Use Vim settings, rather than Vi settings (much better!).
set backspace=indent,eol,start    " Make backspace behave in a sane manner.
set ruler
set nonumber
syntax on                         " Switch syntax highlighting on
filetype plugin indent on         " Enable file type detection and do language-dependent indenting.
"set number                        " Show line numbers
set clipboard=unnamed
map <C-C> :.w !pbcopy<CR><CR>
map <C-P> :r !pbpaste<CR>
nnoremap  ;  :
"nnoremap  :  ;
set hidden                        " Allow hidden buffers, don't limit to 1 file per window/split
set mouse=a"n                     " Enable the mouse but only in normal mode
set ttymouse=xterm2
"set cursorline                    " highlight current line
"set cursorcolumn 				   " highlight current column
set showcmd                       " show command in bottom bar
set cmdheight=1
set shell=/bin/sh
set showmatch                     " highlight matching [{()}]
set wildmenu                      " visual autocomplete for command menu
set wildchar=<Tab> wildmenu wildmode=full
set incsearch                     " search as characters are entered
set hlsearch                      " highlight matches
set ignorecase smartcase          " case-sensitive only if they contain upper-case chars
set path+=**
"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set tabstop=4                     " number of visual spaces per TAB
"set softtabstop=4                 " number of spaces in tab when editing
"set expandtab                     " tabs are spaces
filetype indent on      " load filetype-specific indent files
set wrap                " Always wrap long lines:

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"" Use modeline overrides
set modeline
set modelines=10
set title
set titleold="Terminal"
set titlestring=%F

"" Highlighting column 81
"highlight ColorColumn ctermbg=black				" Outline the character at column 81
"call matchadd('ColorColumn', '\%81v', 100)		" with a different color (altering on col>80)



execute pathogen#infect()

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"" NERDTree settings (close it if only one open,
"" open it when vim opens a folder, start it when no file open 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
