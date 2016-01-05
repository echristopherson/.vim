" From <https://gist.github.com/tpope/287147>
" By Tim Pope
" TODO: Keep watching to see if he makes this into a proper plugin.
" I suppose when I install Pathogen I can still install this gist the same as
" I would a proper repository.
" TODO: Also try <https://github.com/dhruvasagar/vim-table-mode>.

inoremap <silent> <buffer> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
