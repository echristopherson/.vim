" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2001 Sep 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"         for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"       for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

" Set GUI font
if has('gui_macvim')
    set guifont=Menlo:h11
elseif has('gui_win32') || has('nvim')
    "set guifont=Liberation\ Mono:h9
    set guifont=Consolas:h10
elseif has('gui_gtk')
    set guifont=Liberation\ Mono\ 9 " a little tighter heightwise
    "set guifont=Monospace\ 9
    "set guifont=DejaVu\ Sans\ Mono\ 9 " appears to be same as Monospace on my Ubuntu
    "" Not as nice:
    "set guifont=FreeMono\ 9
    "set guifont=Courier\ New\ 9
    "set guifont=Courier\ 10\ Pitch\ 9
    "set guifont=Nimbus\ Mono\ L\ 9
endif

set ch=2            " Make command line two lines high
set mousehide       " Hide the mouse when typing text

" Make shift-insert work like in Xterm
map  <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
"  highlight Normal guibg=grey90
"  highlight Cursor guibg=Green guifg=NONE
"  highlight lCursor guibg=Cyan guifg=NONE
"  highlight NonText guibg=grey80
"  highlight Constant gui=NONE guibg=grey95
"  highlight Special gui=NONE guibg=grey95

endif

set lines=40
"set columns=161 " enough for two 80-column windows plus split column
set columns=80

if has('gui_running')
    if has('gui_macvim')
        " Full-screen options
        set fuoptions=maxvert,maxhorz
        " Transparency
        "set transparency=10
    endif

    " Tab line uses text like in terminal, instead of GUI tabs
    "set guioptions-=e
    " Use text instead of GUI dialogs
    set guioptions+=c
    " Disable toolbar
    set guioptions-=T
    " Disable scrollbars
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
endif

"set guicursor+=a:blinkwait500-blinkoff500-blinkon500
set guicursor=a:blinkon0 " no blinking
" red cursor
highlight Cursor gui=Reverse guifg=red guibg=bg
"highlight Cursor guibg=Red

if 0
    if 0
        " Color background of lines approaching or exceeding 80 columns (or any number
        " I give it). Only works as is in gvim. From
        " <https://wincent.com/blog/highlighting-overlength-lines-in-vim>.
        " Still needs tweaking.
        hi LineProximity guibg=#404040
        hi LineOverflow guibg=#600000
        "let w:m1=matchadd('LineProximity', '\%<81v.\%>70v', -1)
        let w:m1=matchadd('LineProximity', '\%76v', -1)
        "let w:m2=matchadd('LineOverflow', '\%>80v.\+', -1)
        let w:m2=matchadd('LineOverflow', '\%81v', -1)
        autocmd VimEnter * autocmd WinEnter * let w:created=1
        autocmd VimEnter * let w:created=1
        "autocmd WinEnter * if !exists('w:created') | let w:m1=matchadd('LineProximity', '\%<81v.\%>70v', -1) | endif
        autocmd WinEnter * if !exists('w:created') | let w:m1=matchadd('LineProximity', '\%76v', -1) | endif
        "autocmd WinEnter * if !exists('w:created') | let w:m2=matchadd('LineOverflow', '\%>80v.\+', -1) | endif
        autocmd WinEnter * if !exists('w:created') | let w:m2=matchadd('LineOverflow', '\%81v', -1) | endif
    else
        " Color the 76th and 81st columns (textwidth - 2 and + 3)
        " This colors the appropriate columns all the way down (not just on long
        " lines). I think that's a little distracting.
        set colorcolumn=-2,+3
    endif
endif

" Color line the cursor is on. Cool to have, but it seems to really slow down
" scrolling and cursor movement, especially if you also have Vim color certain
" columns. From <http://amix.dk/blog/post/130>.
"set cursorline
"hi cursorline guibg=#333333
"set cursorcolumn
"hi cursorcolumn guibg=#333333

" Menu customization
" Modification of excerpt from $VIMRUNTIME/menu.vim
" TODO
if 0
    aunmenu Tools.Make
    an 40.360 &Tools.&Make<Tab>:make! :make!<CR>

    if has("toolbar")
      aunmenu ToolBar.Make
      an 1.250 ToolBar.Make :make!<CR>
      " Tooltip
      " tunmenu ToolBar.Make " I think aunmenu already got rid of this
      tmenu ToolBar.Make Make current project (:make!)
    endif

    if has("gui_macvim")
      macm Tools.Make<Tab>:make! key=<D-b>
    endif
endif


" Allow Option to be used as meta in GUI
if has('gui_macvim')
    set macmeta
    " Set F11 to toggle that; when macmeta is off, Option gets passed
    " on to the OS, so we can use it for input method/keyboard layout
    " functions.
    " TODO: Make this also toggle the use of Command as meta, like we do in
    " Emacs.
    " NOTE: iTerm2 profiles allow the behavior of left Option and right Option
    " to be different.
    map  <F11> :set invmacmeta<CR>
    imap <F11> <C-o><F11>
endif



" Unfortunately this makes vim too slow in iTerm 2
" And really it hasn't proved that useful to me, so let's disable it.
"if exists('+relativenumber')
"    set relativenumber " always shows line offsets from cursor line
"endif



" Don't let GUI menus capture key combinations like Alt+w for menus
set winaltkeys=no



" TODO: Change :cn/:cN key mappings
" These don't seem to work in gvim as I would like.
"map  <D-C-n> :cn<CR>
"imap <D-C-n> <C-o>:cn<CR>
"cmap <D-C-n> <C-c>:cn<CR>
"map  <D-C-p> :cN<CR>
"imap <D-C-p> <C-o>:cN<CR>
"cmap <D-C-p> <C-c>:cN<CR>

" Color switcher
" Disabled because I really like ir_gray-EAC.
"runtime scripts/setcolors.vim
