colorscheme wombat
set guioptions-=T               " Hide the toolbar
if has("gui_gtk2")
    set guifont=Consolas\ 11
elseif has("gui_macvim")
    set guifont=Consolas:h12
elseif has("gui_win32")
    set guifont=Consolas:h11
end
