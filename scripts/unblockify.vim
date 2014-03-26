" A very nice sequence Raimondi gave me, which (when the cursor is on a brace
" or other matchable delimiter) deletes the braces (and the lines they're on)
" and decreases the indent of what they used to contain. Clobbers marks a and
" A.
" TODO: Make this work with things like Ruby and Objective-C block
" delimiters. Currently this only detects (, [, or {.
function! Unblockify()
    let l:is_on_last_line = 0
    let l:current_char = getline('.')[col('.')-1]
    let l:is_beginning_block_delim = l:current_char =~ '[([{]'
    if ! l:is_beginning_block_delim && !(l:current_char =~ '[)\]}]')
        " TODO: Find beginning of current block and use that as start
        return
    endif
    
    " Set mark A to beginning position
    normal! mA
    " Go to end delimiter, if not already there
    if ! l:is_beginning_block_delim
        normal! %
    endif
    " Set mark a to beginning delimiter position
    normal! ma
    " Go to end delimiter
    normal! %
    " If this is the last line, dd will cause the cursor to move up
    if line('.') == line('$')
        let l:is_on_last_line = 1
    endif
    " Delete end delimiter
    normal! dd
    " Move up, if necessary
    if ! l:is_on_last_line
        normal! k
    endif
    " Select contents of delimiters
    normal! V`aj
    " Deindent
    normal! <
    " Delete beginning delimiter
    normal! kdd
    " Restore position
    if ! l:is_beginning_block_delim
        if l:is_on_last_line
            normal! G
        else
            normal! `A
        endif
    endif
endfunction

call MakeMetaCharacter('%')
noremap <silent> <A-%> :call Unblockify()<CR>
