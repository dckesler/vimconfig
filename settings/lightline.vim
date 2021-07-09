" To change the lightline theme just change the
" colorscheme property here
" check out theme options here - https://github.com/itchyny/lightline.vim
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
			\   'readonly': 'MyReadonly',
			\   'filename': 'MyFilename',
			\ },
			\ }

function! MyReadonly()
	if &filetype == "help"
		return ""
	elseif &readonly
		return "⭤ "
	else
		return ""
	endif
endfunction

function! LightlineFilename()
	let root = fnamemodify(get(b:, 'git_dir'), ':h')
	let path = expand('%:p')
	if path[:len(root)-1] ==# root
		return path[len(root)+1:]
	endif
	return expand('%')
endfunction

function! MyFilename()
	return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
				\ ('' != LightlineFilename() ? LightlineFilename() : '[NoName]')
endfunction

" Use status bar even with single buffer
set laststatus=2
