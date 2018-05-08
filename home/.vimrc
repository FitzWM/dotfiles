" VIM CONFIGURATION 

" Enable plugins.
execute pathogen#infect()

" Appearance
highlight Comment cterm=italic gui=italic
set colorcolumn=80
set number
set showcmd
set showmatch
syntax enable

" Functionality
filetype indent on
set mouse=a
map <ScrollWheelUp> 3k
map <ScrollWheelDown> 3j
set noexpandtab
set shiftwidth=4
set tabstop=4

" gvim 
set guifont=DejaVu_Sans_Mono:h11:cANSI:qDRAFT
set guioptions=egmLt
