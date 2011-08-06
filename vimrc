set nocompatible                    " Using vim not vi

set autoindent
set smartindent

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set wrap
set textwidth=85

set number                          " Show line numbers in the margin
set ruler                           " Show line numbers in the toolbar

syntax on

set cursorline                      " Highlight the line where the cursor lies
if has('gui_running')
    set guioptions-=T                 " Hide the toolbar
    set guifont=Consolas:h10:cANSI    " Set the font
endif
colorscheme wombat                  " Set the colorscheme             

filetype on                         " Enable filetype detection
filetype indent on                  " Enable filetype-specific indenting
filetype plugin on                  " Enable filetype-specific plugins
set ofu=syntaxcomplete#Complete     " Turn on OmniCompletion

set incsearch                       " Search as I type

set vb t_vb=                        " Shhhh! (Remove annoying system noises)
set noerrorbells                    " No error bells please
set visualbell

set helplang=en
autocmd BufRead *.txt set spell     " Spellcheck from .txt files only

filetype plugin on

"" Allows the Backspace key to removing indenting, end of lines, and to remove text before the start of insert mode.
set backspace=indent,eol,start

"" Allow VIM to set the title of the terminal or window.
set title

"" wildmode and wildmenu configure your completion behavior. My settings
"" complete the longest common string and throw up the menu.
set wildmode=longest:full
set wildmenu

"" I don't like it when my cursor is on the edge of the screen; this makes sure
"" I have at least 3 lines above/below.
set scrolloff=3

set list
set listchars=tab:▸\ ,eol:¬
set showbreak=↪
set shell=/bin/bash
