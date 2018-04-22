"  Michele Giugliano’s vimrc file - Apr 21th 2018
"
" Note: install vim via brew, as the default vim under macOS
"       does NOT have the clipboard integration with the os working.
"------------------------------------------------------------------------------------------------------------

" type ':h setting' to learn about individual settings
" This must be first, because it changes other options as a side effect.

" remap leader from \ to ,
let mapleader = ","

" Disable the arrow keys while in NORMAL mode (forcing muscle memory)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Copy and Paste (macOs)
"map <C-C> :.w !pbcopy<CR><CR>
"map <C-P> :r !pbpaste<CR>

" Navigate through buffers (visiting 'next' one)
:nnoremap <C-B> :bnext<CR>


" Remap ; to :, so that pressing SHIFT becomes an option when e.g. :w, :q!
nnoremap  ;  :
"nnoremap  :  ;
" Remap Ctrl+R (redo) to U (although loosing the 'restore line' function)
"nnoremap U <C-R>

set nocompatible                  " Use Vim settings, rather than Vi settings (much better!).
set backspace=indent,eol,start    " Make backspace behave in a sane manner.
set ruler 						  " Show current line and column number in the status bar
set number relativenumber   	  " Hybdrid mode of line numbering: current line and relative nums to it

set autoindent 					  " new line with same indentation
set smartindent 				  " http://superuser.com/questions/9974

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
syntax on                         " Switch syntax highlighting on
filetype plugin on
filetype plugin indent on         " Enable file type detection and do language-dependent indenting.

if $TMUX == ''
    set clipboard+=unnamed 		  " Make the yank/paste working in vim within a TMUX session too
endif 							  " the option 'unnamed' makes it working with OSX copy/paste

" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown',
                  \ '.mkd': 'markdown',
                  \ '.wiki': 'media'}
" vimwiki stuff "
" Run multiple wikis "

let wiki_1 = {}
let wiki_1.path = '~/Dropbox/Pro/BibTex/wiki/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md' 

let wiki_2 = {}
let wiki_2.path = '~/Dropbox/Pvt/a_private.wiki/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md' 

let g:vimwiki_list = [wiki_1, wiki_2]

"au BufRead,BufNewFile *.wiki set filetype=vimwiki

" vim-instant-markdown: Instant Previews from Vim (disable autostart)
let g:instant_markdown_autostart = 0 
map <leader>md :InstantMarkdownPreview<CR>

set hidden                        " Allow hidden buffers, don't limit to 1 file per window/split
set mouse=a"n                     " Enable the mouse but only in normal mode
set ttymouse=xterm2
set cursorline                    " highlight current line
"set cursorcolumn 				   " highlight current column
set showcmd                       " show command in bottom bar
set cmdheight=1
set shell=/bin/bash
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

autocmd BufRead,BufNewFile *.md setlocal spell    "Spell check if the file type is *.md or *.txt
autocmd BufRead,BufNewFile *.txt setlocal spell

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

color dracula

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  "Limelight
  " ...
endfunction

function! s:goyo_leave()
" Quit Vim if this is the only remaining buffer
   if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
       if b:quitting_bang
             qa!
       else
             qa
        endif
  endif
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  "Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
