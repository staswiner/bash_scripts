function! Get_visual_selection()
	let [line_start, column_start] = getpos("'<")[1:2]
	let [line_end, column_end] = getpos("'>")[1:2]
	let lines = getline(line_start, line_end)
	if len(lines) == 0
		return ''
	endif
	let lines[-1] = lines[-1][: column_end - 2]
	let lines[0] = lines[0][column_start - 1:]
	return join(lines, "\n")
endfunction

function! Comment_visual_vim()
	let selectedText = Get_visual_selection()
	echom selectedText
	if selectedText =~# '/\*.*\*/'
		echom "in C comment"
	endif
endfunction

function! Comment_vim()
	if getline('.') =~# "\" .*"	
		norm 0xx
	else
		norm 0i" 
	endif
endfunction

noremap  :call Comment_vim()<cr>
vnoremap : :<bs><bs><bs><bs><bs>
vmap  :call Comment_visual_vim()<cr>
noremap <c-right> w
noremap <s-right> vl


" map leader and reload
nnoremap . <NOP>
let mapleader="."
noremap <leader>r :w<cr>:so %<cr>
" noremap aa dd
