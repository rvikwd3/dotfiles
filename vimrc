"	VIMRC
"
"	Ravikiran Kawade
"	2018-08-27

""""""""""""""""""""""""""
" 	Pathogen
""""""""""""""""""""""""""

execute pathogen#infect()

syntax on
filetype plugin indent on

set t_Co=256
colorscheme minimalist

hi Normal	guibg=NONE	ctermbg=NONE
hi Comment      ctermfg=246	ctermbg=NONE    cterm=NONE      guifg=#9B9B9B	guibg=NONE      gui=NONE

""""""""""""""""""""""""""
"	vim-airline
""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1
