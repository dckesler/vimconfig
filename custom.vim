" custom overrides

set mouse=a
set background=dark
set completeopt=menu
colorscheme gruvbox8
let g:gruvbox_transp_bg = 1

set formatoptions=tcroqj

map <Leader>w :w<CR>
nnoremap L J

nmap <Space> za
nnoremap J zj
nnoremap K zk

nmap U :redo<CR>

nmap <Leader>j o<Esc>
nmap <Leader>k O<Esc>

nnoremap <Leader>cd :cd %:p:h<CR>

nnoremap <Leader>tn :tabnew<CR>

nmap <Leader>gs :Gstatus<CR>

nmap <Leader>l :syntax sync fromstart<CR>

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
