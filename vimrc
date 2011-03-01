set nocompatible                    " Using vim not vi

set autoindent
set smartindent

set shiftwidth=4
set tabstop=4

set number                          " Show line numbers in the margin
set ruler                           " Show line numbers in the toolbar

syntax on
set guifont=Consolas:h9:cANSI       " Set the font
set cursorline                      " Highlight the line where the cursor lies
if has('gui_running')
  set guioptions-=T                 " Hide the toolbar
  colorscheme wombat                " Set the colorscheme
endif               

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

