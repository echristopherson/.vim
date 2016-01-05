" Override original buffer write handling --
" only automatically export buffer to HTML when the file is within
" $HOME/vimwiki
if VimwikiGet('auto_export')
  " Automatically generate HTML on page write.
  augroup vimwiki
    "au BufWritePost <buffer> Vimwiki2HTML
    au! BufWritePost <buffer>
    au BufWritePost <buffer>
        \ let s:wiki_path_regex = '\C^' . substitute($HOME . '/vimwiki' . '/', '\/', '\\/', 'g') |
        \ if match(expand('%:p'), s:wiki_path_regex) != -1 |
        \     exec 'Vimwiki2HTML' |
        \ endif
  augroup END
endif
