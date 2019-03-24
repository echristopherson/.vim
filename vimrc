" Settings that are generally a good idea
set nocompatible
set nohidden

let b:this_dir = expand('<sfile>:p:h')

" Source file if it exists and is readable
" TODO: Replace with :runtime?
function! SourceIfReadable(filename)
  if filereadable(a:filename)
    exec 'source ' . a:filename
  else
    echo a:filename . ' not found.'
  endif
endfunction

" Detect OS Vim is running on
function! GetHostOS()
  if has('win32') || has('win64')
    return 'windows'
  elseif has('unix')
    let s:uname = system('uname')
    if s:uname == "Darwin\n"
      return 'osx'
    else
      " TODO: This doesn't actually distinguish Linux from BSD, etc.
      return 'linux'
    endif
  endif
endfunction

function! IsHostOSWindows()
  return GetHostOS() == 'windows'
endfunction

function! IsHostOSOSX()
  return GetHostOS() == 'osx'
endfunction

function! IsHostOSLinux()
  return GetHostOS() == 'linux'
endfunction

" See http://vim.wikia.com/wiki/Main_Page for useful help.
" vim:sw=2

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Persistent undo
if has('persistent_undo')
  set undofile
  let &undodir = b:this_dir . "/undo"
  " No backup files
  set nobackup
else
  set backup            " keep a backup file
endif

" Keep swap files in one place
" Default is something like (on Windows):
"let &directory = '.,C:\Users\ECHRIS~1\AppData\Local\Temp,c:\tmp,c:\temp,C:/Users/ECHRIS~1/AppData/Local/Temp'
" The trailing // makes it encode the original pathname in the swap file name
" (the way undo files are named by default).
let &directory = b:this_dir . '/swp//'
set swapfile

" Allow u to undo reloading of a file, including when the file is changed by
" an external process.
set undoreload=-1

set history=5000        " keep 5000 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  if &t_Co >= 256 || has("gui_running")
    colorscheme ir_gray-EAC-256color
  endif
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  " TODO: Put more autocmd groups into use.
  augroup vimrcEx
    autocmd!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " EXCEPT if file is a gitcommit file; then start at beginning.
    autocmd BufReadPost *
          \ if &filetype != 'gitcommit' |
          \     if line("'\"") > 0 && line("'\"") <= line("$") |
          \       exe "normal! g`\"" |
          \     endif |
          \ endif
  augroup END

  augroup markdown
    au!
    au BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn setlocal filetype=ghmarkdown
  augroup END

  " From meese on #vim. Causes matchit to match @implementation/@interface with
  " @end in Obj-C files. meese also said he/she was going to release a script to
  " ease writing Obj-C in vim -- must check it out when it's released.
  autocmd FileType objc let b:match_words = '@\(implementation\|interface\):@end'

  " And similarly for Obj-J.
  autocmd FileType objj let b:match_words = '@implementation:@end'

  " Treat BeanShell files as Java
  autocmd BufRead,BufNewFile *.bsh setfiletype java

  " External filter to be used for the = command in Lisp/Scheme modes.
  " scmindent.rkt must be in path.
  autocmd FileType lisp,scheme,art setlocal equalprg='lispindent'

  " Show **, ||, etc. around words in help files
  " NOTE: I don't think I want this anymore. ir_black/gray_EAC seem to provide
  " coloring for these characters which make them invisible anyway.
  "if has('conceal')
  "  autocmd FileType help set conceallevel=0
  "endif

  " CloseTag settings for XML and HTML
  " Force HTML style when type not known; this causes closetag.vim to ignore
  " Area, Base, Br, DD, DT, HR, Img, Input, LI, Link, Meta, P, and Param.
  " Otherwise XML style is used, which means all non-self-closing tags are
  " matched.
  "let g:closetag_html_style=1
  autocmd FileType html,xml,xsl runtime scripts/closetag.vim
  " Also, set noignorecase for html files or edit b:unaryTagsStack to match
  " your capitalization style.  You may set this variable before or after
  " loading the script, or simply change the file itself.

  " Set 'formatoptions' to break comment lines but not other lines, Set
  " 'formatoptions' to insert the comment leader when hitting <CR>. Formerly I
  " had it set to continue comments when using the normal-mode o and O
  " commands too, but I've disabled it since it's annoying.
  " This has to go in an autcmd since ftplugins often override at least the o
  " setting.
  autocmd FileType * setl formatoptions+=r formatoptions-=o

  " Match these words and use Todo group in any file (not just files whose
  " types assign such matches).
  autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO\|FIXME\|NOTE\|XXX', -1, 24)

  " Treat .make files as make
    autocmd BufRead,BufNewFile *.make set filetype=make
endif " has("autocmd")

" Override .m filetype (Obj-C instead of Matlab)
let filetype_m='objc'

" Set default encoding
set encoding=utf-8
" Set default encodings - vim tries them in order
set fileencodings=ucs-bom,utf-8,latin1

" Some miscellaneous customizations, which I got from someone else's vimrc and tweaked

"set cursorcolumn " highlight the current column
"set cursorline " highlight current line
set nocursorline
"set nohlsearch " do not highlight searched for phrases. I've started to like using hlsearch; it's easy to clear it when I'm done with :noh.
set incsearch " highlight as you type your search phrase
set laststatus=2 " always show the status line
set ruler " Always show current positions along the bottom
set showcmd " show the command being typed
set showmatch " show matching brackets

" Indenting and tabbing - see
" <http://vim.wikia.com/wiki/Indenting_source_code>.
set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set expandtab " TAB and insertion commands insert appropriate number of spaces instead of ^I
set tabstop=8 " Consensus on #vim seems to be that we should keep tabstop as 8 so things will display correctly with cat, et al. Since we're using softtabstop, when we hit <Tab> it will still only insert 4 (or fewer) spaces.
set list " show tabs graphically
if has("multi_byte") && &encoding == "utf-8"
  set listchars=tab:→\ ,trail:· " show tabs as arrow plus appropriate number of spaces; trailing spaces as middle dot
else
  set listchars=tab:>\ ,trail:- " show tabs as > plus appropriate number of spaces; trailing spaces as hyphen
endif

" Text wrap margin
set textwidth=78

" Adapted from http://phuzz.org/vimrc.html
"set scrolloff=5     " keep 5 lines when scrolling - this doesn't seem as cool now that I know how to scroll manually
"set title          " show title in console title bar - disabled because this leaves an annoying message after exiting vim
"set smartindent    " smart indent
"set cindent        " cindent

"set virtualedit=all " allow the cursor to always be positioned past the logical EOL
set virtualedit=block " just allow it in block select mode

" Modeline support
set modeline
set modelines=5 " looks for modelines in the first and last 5 lines of a file

" Maximum tabs to open when starting with -p. We can always open more from
" within vim, though.
set tabpagemax=20

" Allow h/l/Left/Right to move across newlines
" NOTE: :h options.txt says putting h and l here is "not recommended". Any
" idea why?
set whichwrap=h,l,<,>,[,]

" Completion options: show menu for even one completion. This can be useful,
" since the menu tells what file the word was found in.
set completeopt-=menu
set completeopt+=menuone

" Searches and completions are case-insensitive unless capital letters are
" typed (use \C in search to force case-sensitive).
set smartcase
set ignorecase

" Allow us to change buffers when the current buffer has unsaved changes
set hidden

" Tab at beginning of line inserts 'shiftwidth' spaces, instead of 'tabstop'. Only matters when softtabstop=0 (which in my config it isn't)
set smarttab

" Do not truncate message lines by putting "..." in the middle
set shortmess-=T

" Enable mouse in xterm, iTerm, etc.
if ! has('nvim')
    set ttymouse=xterm2
endif
set mouse=a

" Indentation and autoindentation settings
set cinoptions+=
set cinoptions+=L0
set cinoptions+=:0
set cinoptions+=l1
set cinoptions+=g0
set cinoptions+=(0
set cinoptions+=W4
set cinoptions+=j1
set cinoptions+=J1
set cinkeys-=0#

" iTerm2 cursor shape
if $TERM_PROGRAM == 'iTerm.app'
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif


" Line numbering settings
" We might want to turn this off in terminals if it slows things down too much
"set number         " shows absolute line numbers
"set cpoption+=n    " wraps long lines into gutter
" Relativenumber is really slow in iTerm 2, so let's enable it only for gvim
"set relativenumber " always shows line offsets from cursor line



call SourceIfReadable(b:this_dir . '/' . 'vimrc-gist')

" TODO: Document this (used to be in section about Command-T)
set wildignore+=.git,*~,*.o,*.class

" When long lines wrap, continuation lines should be indented at least as much
" as the first screen line; additionally also insert eight break characters
" for extra clarity.
if exists('+breakindent')
  set breakindent
  set showbreak=........
  if exists('+breakindentshift')
    " Just show break characters.
    " This is the option to use with the old, non-official, breakindent patch.
    set breakindentshift=0
  elseif exists('+breakindentopt')
    " Indent by amount given by line's indentation, then add 'showbreak'
    " characters.
    " TODO: This unfortunately shows blank spaces on the left when the line is
    " indented. I'd prefer it to show '.' throughout.
    set breakindentopt=shift:0
  endif
endif

set autoindent " always set autoindenting on. Among other things, this makes gq continue the current indent level.
" Copied from $VIMRUNTIME/ftplugin/c.vim
" Set 'formatoptions' to:
" c -t auto-wrap comment lines but not other text
" q    allow formatting of comments with "gq".
" l    format comments with gq, stripping medial comment leaders
set formatoptions-=t formatoptions+=cql

" Try adding j flag to formatoptions; if it doesn't work, just move on without
" displaying an error.
" (The flag in question is from the patch at
" <http://permalink.gmane.org/gmane.editors.vim.devel/34652>. It makes the J
" normal-mode command discard comment leader characters within the joined
" line.
try
  set formatoptions+=j
catch /Vim(set):E539/
endtry

call SourceIfReadable(b:this_dir . '/' . 'vimrc-cscope')

call SourceIfReadable(b:this_dir . '/' . 'vimrc-ctrlp')

" Restore cursor position in window upon returning to buffer
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(!&scrollbind && exists('b:winview')) | call winrestview(b:winview) | endif
endif

" Add more HTML tags to built-in indentation rules; see
" <http://www.vim.org/scripts/script.php?script_id=2075>.
let g:html_indent_inctags = "html,body,head,tbody,p"

call SourceIfReadable(b:this_dir . '/' . 'vimrc-ag')

" Tweak to allow the use of OpenSSH sftp and scp in netrw
" Use slashes, even on Windows.
" TODO: This messes up CtrlSF, because its call to shellescape causes single
" quotes to be used instead of double. It's likely other plugins would be
" affected.
set shellslash

call SourceIfReadable(b:this_dir . '/' . 'vimrc-fugitive')

" TODO: Find option to not fold changesets in fugitive. I may actually like
" that feature, though.

call SourceIfReadable(b:this_dir . '/' . 'vimrc-signature')

call SourceIfReadable(b:this_dir . '/' . 'vimrc-delimitmate')

call SourceIfReadable(b:this_dir . '/' . 'vimrc-session')

" TODO: Currently endwise's <CR> mapping stomps on that of delimitMate, which
" makes g:delimitMate_expand_cr=1 not work as intended. I haven't found a good
" way to disable that yet.



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" Source key bindings
call SourceIfReadable(b:this_dir . '/' . 'vimrc-keys')
