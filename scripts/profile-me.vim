function! s:CountToAMillion()
    for i in range(1000000)
        " do nothing
    endfor
endfunction

profile start /Users/eric/profile-me.txt
profile func <SNR>*_CountToAMillion
call s:CountToAMillion()

" profile-me.txt does get created, but there's nothing in it!
