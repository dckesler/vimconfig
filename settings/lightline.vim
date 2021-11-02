" To change the lightline theme just change the
" colorscheme property here
" check out theme options here - https://github.com/itchyny/lightline.vim
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
	    \   'cocstatus': 'coc#status',
			\   'readonly': 'MyReadonly',
			\   'filename': 'MyFilename'
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

function! MyFilename()
	return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
				\ ('' != expand('%') ? expand('%') : '[No Name]')
endfunction

" Use status bar even with single buffer
set laststatus=2

set noshowmode

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
