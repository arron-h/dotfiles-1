source ~/.vim/bundles.vim           " load Vundle plugins

set nocompatible                    " Using vim not vi

set title                           " Allow VIM to set the title of the terminal or window.
set number                          " Show line numbers in the margin
set cursorline                      " Highlight the line where the cursor lies

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set wrap
set textwidth=120
set scrolloff=3                     " At least 3 lines above/below.
set colorcolumn=+1

set smartindent
set incsearch                       " Search as I type
set vb t_vb=                        " Shhhh! (Remove annoying system noises)
set noerrorbells                    " No error bells please
set visualbell

set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪

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
    colorscheme wombat256mod        " Set the colorscheme
endif

" Improve Windows compatability; also use '.vim' instead of 'vimfiles'; 
" makes synchronization across systems easier. 
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

if !has('win32') && !has('win64')
    set term=$TERM
endif

" set viewoptions=folds,options,cursor,unix,slash " Better unix / windows compatibility

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Show trailing whitespace when not in Insert mode
augroup trailing
  au InsertEnter * :set listchars-=trail:⌴
  au InsertLeave * :set listchars+=trail:⌴
augroup END

au FocusLost * :wa                               " Save when losing focus
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

filetype on                                      " Enable filetype detection
filetype indent on                               " Enable filetype-specific indenting
filetype plugin on                               " Enable filetype-specific plugins
set ofu=syntaxcomplete#Complete                  " Turn on OmniCompletion

au FileType c setlocal foldmethod=syntax

au BufNewFile,BufRead *.css  setlocal foldmethod=marker
au BufNewFile,BufRead *.css  setlocal foldmarker={,}

au FileType javascript setlocal foldmethod=marker
au FileType javascript setlocal foldmarker={,}

autocmd BufRead *.txt set spell                  " Spellcheck from .txt files only
