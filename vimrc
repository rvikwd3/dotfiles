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

""""""""""""""""""""""""""
"	vim-airline
""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

let g:airline#extensions#default#layout = [
	\ [ 'a', 'b', 'c' ],
	\ [ 'x', 'y', 'z', 'error', 'warning' ]
	\ ]
