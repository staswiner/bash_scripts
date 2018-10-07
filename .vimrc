highlight Normal ctermfg=white ctermbg=black
set tabstop=2
syntax on
set number
set visualbell
vmap <down> <down>$
vmap <up> <up>0

" set list
highlight Pmenu       ctermbg=LightGray
highlight PmenuSel    ctermbg=Gray
highlight PmenuSbar   ctermbg=Gray
highlight PmenuThumb  ctermbg=Black

" save as sudoer
cmap w!! w !sudo tee > /dev/null %

" enable omnicompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" abbrevs
iabbrev bash #!/bin/bash



" mimic vscode selection
" right
	" ctrl
nnoremap [1;5C e
	" shift-ctrl
nnoremap [1;6C ve
	" shift
nnoremap [1;2C v<right>
	" shift-ctrl
vnoremap [1;6C e
	" shift
vnoremap [1;2C <right>
	" disable visual mode on movement
vnoremap <right> v<right>

" left
nnoremap [1;5D b
nnoremap [1;6D vb
nnoremap [1;2D v<left>
vnoremap [1;6D b
vnoremap [1;2D <left>
vnoremap <left> v<left>

" up
	" disable visual mode on movement
vnoremap <up> v<up>
	" shift
vnoremap [1;2A <up>
vnoremap [1;6A <up>
	" shift
nnoremap [1;2A v<up>
nnoremap [1;6A v<up>

" down
	" disable visual mode on movement
vnoremap <down> v<down>
	" shift
vnoremap [1;2B <down>
vnoremap [1;6B <down>
	" shift
nnoremap [1;2B v<down>
nnoremap [1;6B v<down>

" autocomplete ctrl-space
inoremap <c-@> <c-p>

" move lines
	" up
noremap [1;3B ddp
	" down
function Move_line_up()
	if line('.') > 1
		norm ddkP
	endif
endfunction

noremap [1;3A :call Move_line_up()<cr> 


" search-replace
inoremap  <esc>:%s@@@g<left><left>
nnoremap  :%s@@@g<left><left>
vnoremap  y:%s@"@@g<left><left> 

" search-highlight
nnoremap  :set hlsearch!<cr>#*

" json format
com! FormatJSON	:%!python -m json.tool
