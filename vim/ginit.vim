Guifont! Nouveau_IBM Nerd Font:h12
""" FocusMode
function! ToggleFocusMode()
if (&foldcolumn != 12)
"    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
"    set noruler
    set nonumber
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0

"    if has ('nvim')
"       Guifont Anonymous Pro for Powerline:h18 
        Guifont! Nouveau_IBM Nerd Font:h18
"    else

"        if has ('gui_running')
"           set guifont=Anonymous\ Pro\ for\ Powerline\ 18
"           set guioptions-=T
"        endif

"    endif

else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    set number
    execute 'colorscheme ' . g:colors_name

"    if has ('gui_running')
"            Guifont Anonymous Pro for Powerline:h12
             Guifont! Nouveau_IBM Nerd Font:h12
"            set guioptions+=T
"    endif

endif

endfunc
