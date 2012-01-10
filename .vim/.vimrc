set nocompatible                    " Using vim not vi
set helplang=en

set shell=/bin/bash

set title                           " Allow VIM to set the title of the terminal or window.
set number                          " Show line numbers in the margin
set ruler                           " Show line numbers in the toolbar
set cursorline                      " Highlight the line where the cursor lies
if has('gui_running')
    set guioptions-=T               " Hide the toolbar
    set guifont=Consolas:h10:cANSI  " Set the font
    colorscheme wombat              " Set the colorscheme
else
    colorscheme wombat256           " Set the colorscheme
endif     
syntax on       

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set wrap
set textwidth=85
set scrolloff=3                     " At least 3 lines above/below.

set autoindent
set smartindent

set incsearch                       " Search as I type

set vb t_vb=                        " Shhhh! (Remove annoying system noises)
set noerrorbells                    " No error bells please
set visualbell

"" wildmode and wildmenu configure your completion behavior. My settings
"" complete the longest common string and throw up the menu.
set wildmode=longest:full
set wildmenu

set backspace=indent,eol,start      " Allows the Backspace key to removing indenting, end of lines, and to remove before the start of insert mode.

set list
set listchars=tab:▸\ ,eol:¬
set showbreak=↪

filetype on                         " Enable filetype detection
filetype indent on                  " Enable filetype-specific indenting
filetype plugin on                  " Enable filetype-specific plugins
set ofu=syntaxcomplete#Complete     " Turn on OmniCompletion

autocmd BufRead *.txt set spell     " Spellcheck from .txt files only

au FileType javascript setlocal foldmethod=marker
au FileType javascript setlocal foldmarker={,}

au FileType c setlocal foldmethod=syntax

au BufNewFile,BufRead *.css  setlocal foldmethod=marker
au BufNewFile,BufRead *.css  setlocal foldmarker={,}
