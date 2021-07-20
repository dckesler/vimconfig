" custom overrides

set mouse=a
set background=dark
set completeopt=menu
colorscheme gruvbox8
let g:gruvbox_transp_bg = 1

map <Leader>w :w<CR>
nnoremap L J

inoremap <c-l> console.log()<Esc>i
inoremap <c-d> debugger<Esc>

nmap <Leader>yp :let @+ = expand("%")<cr>

nmap <Space> za
nnoremap J zj
nnoremap K zk

nmap U :redo<CR>

nmap <Leader>j o<Esc>
nmap <Leader>k O<Esc>

nnoremap <Leader>tn :tabnew<CR>

nmap <Leader>gs :Gstatus<CR>

nmap <Leader>l :syntax sync fromstart<CR>

nmap <Leader>zi :set foldmethod=indent<CR>

nmap <Leader>jf :%!python3 -m json.tool<CR>

function DiffCurrentQuickfixEntry() abort
  cc
  let qf = getqflist({'context': 0, 'idx': 0})
  if get(qf, 'idx') && type(get(qf, 'context')) == type({}) && type(get(qf.context, 'items')) == type([])
    let diff = get(qf.context.items[qf.idx - 1], 'diff', [])
    for i in reverse(range(len(diff)))
      exe (i ? 'rightbelow' : 'leftabove') 'vert diffsplit' fnameescape(diff[i].filename)
      wincmd p
    endfor
  endif
endfunction
