"==================================================
"		       (_)
"		 __   ___ _ __ ___  _ __ ___
"		 \ \ / / | '_ ` _ \| '__/ __|
"		  \ V /| | | | | | | | | (__
"		   \_/ |_|_| |_| |_|_|  \___|
"==================================================

"	Ravikiran Kawade
"	2018-08-27

"	Last Updated:	2018-09-28

" Preamble -----------------------------------------------------------------{{{
"
execute pathogen#infect()

set path+=/usr/local/include

syntax on					" enable syntax processing
filetype plugin indent on	" load filetype-specific indent files
set t_Co=256				" 256-color terminal
set nocompatible			" moar vim features (also arrow keys don't print ADCB that kind of thing)

"----------------------------------------	}}}
" PLUGINS ------------------------------------------------------------------{{{1
"	vim-airline									{{{
"----------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'				" minimalist airline theme
let g:airline#extensions#tabline#enabled = 1	" tab-bar at top of vim
let g:airline#extensions#vimtex#enabled = 1		" enable .tex syntax
let g:airline#extensions#vimtex#continuous = "c"	" generate live preview on each :w save
"----------------------------------------		}}}
"	vim latex									{{{
"-----------------------------------------
let g:livepreview_previewer = 'zathura'		" use zathura to load .tex preview pdfs
"----------------------------------------		}}}
"	Gundo undo tree								{{{
"-----------------------------------------
" nnoremap <F5> :GundoToggle<CR>			" default gundo remap
" use \u for gundo
nnoremap <leader>u :GundoToggle<CR>

let g:gundo_width = 70						" width of gundo pane
let g:gundo_preview_height = 20				" height of bottom preview pane
let g:gundo_preview_bottom = 0				" enable preview below main window
let g:gundo_right = 1						" gundo pane on right side
"----------------------------------------		}}}
"	Goyo 										{{{
"-----------------------------------------

let g:goyo_width = 80
let g:goyo_height = 25
let g:goyo_linenr = 1

" Callback functions
function! s:goyo_enter()
	set nonumber
	set norelativenumber
endfunction

function! s:goyo_leave()
	set number relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"-----------------------------------------		}}}
"	Syntastic									{{{
"-----------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"-----------------------------------------		}}}
"---------------------------------------------------------------------------}}}1
" ATTRIBUTES ---------------------------------------------------------------{{{1
" 	Basic Options				{{{
"----------------------------------------

set showcmd						" show last command on statusbar

set number relativenumber		" enable hybrid relative numbering

set tabstop=4					" 4 spaces for each tab
"set softtabstop=4				" 4 spaces for inserting tab
set shiftwidth=4				" Purely tab indentation
"set expandtab					" insert spaces instead of tab (use ^V<Tab> for normal tab)

set wildmenu					" visual autocomplete for commands
set showmatch					" highlight matching braces/paranthesis

set incsearch					" search as characters are entered
set hlsearch					" highlight matches

set omnifunc=syntaxcomplete#Complete	" enable omnicomplete

set splitbelow					" new split below
set splitright					" new split right

" Display extra whitespace
" set list listchars=tab:»·,trail:·,nbsp:·

"----------------------------------------	}}}
" 	Colors					{{{
"----------------------------------------

colorscheme minimalist

hi NonText          ctermfg=234     ctermbg=NONE    cterm=NONE      guifg=#1C1C1C       guibg=NONE   gui=NONE
hi Normal           ctermfg=255     ctermbg=000     cterm=NONE		guifg=#EEEEEE       guibg=NONE		gui=NONE
hi Comment			ctermfg=246	    ctermbg=NONE    cterm=NONE      guifg=#9B9B9B		guibg=NONE      gui=NONE

"----------------------------------------	}}}
" 	Folding									{{{
"----------------------------------------

set foldenable					" enable folding
set foldmethod=marker			" use \{{{ \}}} for fold markers
set foldclose=""				" default fold closing
set foldlevelstart=1			" only unfold starting level

function! MyFoldText() " {{{
		let line = getline(v:foldstart)

		let nucolwidth = &fdc + &number * &numberwidth
		let windowwidth = winwidth(0) - nucolwidth - 3
		let foldedlinecount = v:foldend - v:foldstart

		" expand tabs into spaces
		let onetab = strpart('          ', 0, &tabstop)
		let line = substitute(line, '\t', onetab, 'g')

		let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
		let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
		return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}

set foldtext=MyFoldText()
"---------------------------------------------------------------------------}}}1
" MAPPINGS -----------------------------------------------------------------{{{1

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" select line without indentation
nnoremap vv ^vg_

" highlight last inserted text
nnoremap gV `[v`]

" space open/closes folds
nnoremap <space> za

" Insert: remap jk to escape
inoremap jk <esc>

" Insert Mode Completion {{{
inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>
inoremap <c-l> <c-x><c-l>
" }}}

" Not-insane window/spit horizontal resizing
nnoremap <kPlus> <C-w><
nnoremap <kMinus> <C-w>>

" Move around windows easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"---------------------------------------------------------------------------}}}1
" COMMANDS -----------------------------------------------------------------{{{1
"	<leader> Commands														{{{2
"---------------------------------------

" source ~/.vimrc
nnoremap <leader>rv :source $MYVIMRC<CR>
" edit vimrc in a new tab
nnoremap <leader>ev :tabfind $MYVIMRC<CR>
" edit zshrc in a new tab
nnoremap <leader>ez :tabfind ~/.zshrc<CR>
" edit i3config in a new tab
nnoremap <leader>ei :tabfind ~/.config/i3/config<CR>

" turn off search highlights
nnoremap <leader><space> :nohlsearch<CR>

" Gundo undo tree
"	Already mapped in PLUGINS fold
" nnoremap <leader>u :GundoToggle<CR>

" Clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Rebuild Ctags (mnemonic RC -> CR -> <cr>)
nnoremap <leader><cr> :silent !myctags >/dev/null 2>&1 &<cr>:redraw!<cr>

" Remove backspace from Ctrl+Shift+V paste
nnoremap <leader>/ :s/\\//g<CR>

" Edit recently opened files
nnoremap <leader>1 :'1<CR>

" Enter & leave Goyo mode
nnoremap <leader>g :Goyo<CR>

" "Uppercase word" mapping.
" Explanation {{{
" This mapping allows you to press <c-u> in insert mode to convert the current
" word to uppercase.  It's handy when you're writing names of constants and
" don't want to use Capslock.
"
" To use it you type the name of the constant in lowercase.  While your
" cursor is at the end of the word, press <c-u> to uppercase it, and then
" continue happily on your way:
"
"                            cursor
"                            v
"     max_connections_allowed|
"     <c-u>
"     MAX_CONNECTIONS_ALLOWED|
"                            ^
"                            cursor
"
" It works by exiting out of insert mode, recording the current cursor location
" in the z mark, using gUiw to uppercase inside the current word, moving back to
" the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never use it, but
" if you do you'll probably want to use another mark.}}}
inoremap <C-u> <esc>mzgUiw`za
"----------------------------------------									}}}2
"	Autocommands															{{{
"----------------------------------------
" Line Number Toggle on Focus{{{
augroup numbertoggle			" relative numbering only in current focus
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" }}}

" Trailing whitespace {{{
augroup trailing				" Only shown when not in insert mode so I don't go insane.
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END
"}}}
"----------------------------------------									}}}
"---------------------------------------------------------------------------}}}1

