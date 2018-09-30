highlight Normal ctermfg=white ctermbg=black
set tabstop=2
syntax on
set number
set visualbell
vmap <down> <down>$
vmap <up> <up>0
map  0i#<esc>
vmap  :norm i#<esc>
" set list
highlight Pmenu 			ctermbg=LightGray
highlight PmenuSel 		ctermbg=Gray
highlight PmenuSbar		ctermbg=Gray
highlight PmenuThumb	ctermbg=Black
cmap w!! w !sudo tee > /dev/null %

" mimic vscode selection
" right
	" ctrl
nnoremap [1;5C w
	" shift-ctrl
nnoremap [1;6C vw
	" shift
nnoremap [1;2C v<right>
	" shift-ctrl
vnoremap [1;6C w
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
