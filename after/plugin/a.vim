" Override key mappings from a.vim - we don't want these in insert mode
iunmap <Leader>ih
iunmap <Leader>is
iunmap <Leader>ihn

" Add some of my own
" These switch to alternate of current file:
" <Leader>aa    switches within current window      (:A)  -- note the extra a so it will execute immediately
" <Leader>as    opens alternate in split            (:AS) 
" <Leader>av    opens alternate in vertical split   (:AV)
" <Leader>at    opens alternate in tab              (:AT)
" <Leader>an    cycles through matches              (:AN)
"
" TODO: Get the semantics right, compared to the original \ih, \is, \ihn
" NOTE: Never mind that TODO. I never use those \i... mappings, so I don't
" really care about making mappings parallel to them.
"
nnoremap <Leader>aa :A<CR>
nnoremap <Leader>av :AV<CR>
nnoremap <Leader>at :AT<CR>
nnoremap <Leader>an :AN<CR>

" Added functionality to shrink horizontal split if it's taller than the file.
" TODO: Find a way to detect if AS was successful; don't shrink if not
function! ShrinkWrap()
    let l:num_lines = line('$')

    if l:num_lines < winheight(0)
        exec 'resize ' . l:num_lines
    endif
endfunction
" Apparently you can't use <Bar> after this command
nnoremap <Leader>as :AS<CR>:call ShrinkWrap()<CR>

" Don't jump to nonexistent file
let alternateNoDefaultAlternate = 1

" Convert paths to relative
let g:alternateRelativeFiles = 1

" Add mappings for Objective-C, Arduino, C++, etc.
let g:alternateExtensions_m = 'h'
let g:alternateExtensions_mm = 'h'
let g:alternateExtensions_ino = 'h'
let g:alternateExtensions_cpp = 'hpp'
let g:alternateExtensions_hpp = 'cpp'
let g:alternateExtensions_h = 'c,cpp,cxx,cc,CC,C,m,mm,ino'

" TODO: get a.vim to stop chdir:ing!!!
