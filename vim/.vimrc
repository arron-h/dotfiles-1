call pathogen#runtime_append_all_bundles()

set nocompatible                    " Using vim not vi

set term=xterm-256color
set shell=/bin/bash

set title                           " Allow VIM to set the title of the terminal or window.
set number                          " Show line numbers in the margin
set ruler                           " Show line numbers in the toolbar
set cursorline                      " Highlight the line where the cursor lies

syntax on
set background=dark
if has('gui_running')
    set guioptions-=T               " Hide the toolbar
    "" set guifont=Consolas:h10:cANSI  " Set the font
    colorscheme wombat              " Set the colorscheme
else
    colorscheme wombat256           " Set the colorscheme
endif

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set wrap
set textwidth=80
set scrolloff=3                     " At least 3 lines above/below.

set autoindent
set smartindent

set incsearch                       " Search as I type

set vb t_vb=                        " Shhhh! (Remove annoying system noises)
set noerrorbells                    " No error bells please
set visualbell

set backspace=indent,eol,start
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪

au FocusLost * :wa                  " Save when losing focus

"" wildmode and wildmenu configure your completion behavior. My settings
"" complete the longest common string and throw up the menu.
set wildmenu
set wildmode=longest:full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

filetype on                         " Enable filetype detection
filetype indent on                  " Enable filetype-specific indenting
filetype plugin on                  " Enable filetype-specific plugins
set ofu=syntaxcomplete#Complete     " Turn on OmniCompletion

au FileType c setlocal foldmethod=syntax

au BufNewFile,BufRead *.css  setlocal foldmethod=marker
au BufNewFile,BufRead *.css  setlocal foldmarker={,}

au FileType javascript setlocal foldmethod=marker
au FileType javascript setlocal foldmarker={,}

autocmd BufRead *.txt set spell     " Spellcheck from .txt files only
