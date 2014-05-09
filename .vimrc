source ~/.vim/bundles.vim           " load Vundle plugins

set nocompatible                    " Using vim not vi

if !has('win32') && !has('win64')
    set term=$TERM
endif
set shell=/bin/bash

set title                           " Allow VIM to set the title of the terminal or window.
set number                          " Show line numbers in the margin
set ruler                           " Show line numbers in the toolbar
set cursorline                      " Highlight the line where the cursor lies
" set viewoptions=folds,options,cursor,unix,slash " Better unix / windows compatibility
set history=1000                    " Store more history (default is 20)
set laststatus=2                    " Always show status line (turn vim-airline on straight away)

" TODO: Move this GUI stuff into a .gvimrc file
set background=dark
if has('gui_running')
    colorscheme wombat              " Set the colorscheme
    set guioptions-=T               " Hide the toolbar
    if has("gui_gtk2")
        set guifont=Consolas\ 11
    elseif has("gui_macvim")
        set guifont=Consolas:h12
    elseif has("gui_win32")
        set guifont=Consolas:h11
    end
else
    colorscheme wombat256mod           " Set the colorscheme
endif
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" -----------------------------------------------

" Improve Windows compatability; also use '.vim' instead of 'vimfiles'; 
" makes synchronization across systems easier. 
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set wrap
set textwidth=80
set scrolloff=3                     " At least 3 lines above/below.
set colorcolumn=+1

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

" Show trailing whitespace when not in Insert mode
augroup trailing
  au InsertEnter * :set listchars-=trail:⌴
  au InsertLeave * :set listchars+=trail:⌴
augroup END

au FocusLost * :wa                  " Save when losing focus
au VimResized * exe "normal! \<c-w>="

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

" Make Vim able to edit crontab files again.
set backupskip=/tmp*,/private/tmp/*"
set noswapfile

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
