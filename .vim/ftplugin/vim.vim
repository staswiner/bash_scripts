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
"   let selectedText = Get_visual_selection()
	let l:pureComment = 0

	for l:line in getline(line("'<"), line("'>"))
		if l:line !~# '\" .*' " if at least one line is not a comment
			let l:pureComment = 1
		endif
	endfor
  if l:pureComment == 1 " the block is not a consistent comment
		echom "not a comment"
		'<,'>norm 0i" 
	else
		echom "a comment"
		'<,'>norm 0xx
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
vnoremap  :call Comment_visual_vim()<cr>


" map leader and reload
nnoremap . <NOP>
let mapleader="."
noremap <leader>r :w<cr>:so %<cr>
