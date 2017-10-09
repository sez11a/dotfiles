" Pathogen
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

" Set the font and window size
if has ('gui_running')
"    set guifont=Anonymous\ Pro\ for\ Powerline\ 12
"    The VGA font below doesn't have bold/italic variants and so had display
"    problems.
"    Guifont! Nouveau_IBM Nerd Font:h18
    Guifont! TerminessTTF Nerd Font Mono:h12
	set lines=50
	set columns=100
endif

set background=dark
colorscheme xoria256

" No vi compatibility
set nocompatible
set encoding=utf-8
"let g:airline_detect_whitespace=0
"let g:airline#extensions#whitespace#enabled
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

set backspace=indent,eol,start
set tabstop=4
set expandtab 
set softtabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set number
set wrap
set linebreak
set nolist
set textwidth=0
"set ttyscroll=0
"set clipboard=unnamedplus

" nnoremap j gj
" nnoremap k gk

" Save when focus is lost
" au FocusLost * :wa

" Turn on omnicompletion
filetype plugin on
set ofu=syntaxcomplete#Complete

let g:vim_markdown_folding_disabled=1

let g:airline#extensions#whitespace#enabled=0

" Custom key combos
nmap <silent> <F3> :NERDTreeToggle<CR>

func! WordProcessorMode() 
  " setlocal formatoptions=1 
  set spell spelllang=en_us 
  set thesaurus+=~/.vim/thesaurus/mthesaur.txt
  set complete+=s
  " setlocal linebreak 
  set wrap
  set textwidth=80
  " Look like WordStar
"  colorscheme adaryn
  colorscheme xoria256-blue
"  colorscheme transparent
  filetype detect
  nnoremap <Leader>w :NextWordy<CR>
  nnoremap <Leader>q :NoWordy<CR>
  call pencil#init()

endfu 
com! WP call WordProcessorMode()

" Back to code mode
func! CodeMode()
        map j gj 
        map k gk
        setlocal expandtab
        set textwidth=0
        colorscheme xoria256
        filetype detect
endfu
com! CODE call CodeMode()

nnoremap <F4> :call ToggleFocusMode()<cr>
nnoremap <F5> :Latexmk<cr>

" This starts WP mode on markdown files, but it wreaks havoc with airline
"autocmd FileType markdown call WordProcessorMode()
"
"Here's another way I tried that also didn't work:
"
"augroup ws
"    autocmd!
"    autocmd FileType markdown,mkd call WordProcessorMode()
"    autocmd FileType text         call WordProcessorMode()
"augroup END
