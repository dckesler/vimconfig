" vim-rspec mappings
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" tslime
let g:tslime_always_current_session=1
let g:tslime_always_current_window=1

nmap <C-t>r <Plug>SetTmuxVars

" Configure vim-rspec to work nicely with tslime
let g:rspec_command = 'call Send_to_Tmux("\<c-c>bundle exec rspec {spec}\n")'
let g:tslime_always_current_session=1
let g:tslime_always_current_windwo=1
