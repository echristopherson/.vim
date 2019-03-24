" Settings that are generally a good idea

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" AKA nocp
set nocompatible

" Allow us to change buffers when the current buffer has unsaved changes
" AKA nohid
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

" allow backspacing over everything in insert mode
" AKA bs
set backspace=indent,eol,start

" Persistent undo
if has('persistent_undo')
  " AKA udf
  set undofile
  " AKA udir
  let &undodir = b:this_dir . "/undo"
  " No backup files
  " AKA nobk
  set nobackup
else
  " AKA bk
  set backup            " keep a backup file
endif

" Keep swap files in one place
" Default is something like (on Windows):
"" AKA dir
"let &directory = '.,C:\Users\ECHRIS~1\AppData\Local\Temp,c:\tmp,c:\temp,C:/Users/ECHRIS~1/AppData/Local/Temp'
" The trailing // makes it encode the original pathname in the swap file name
" (the way undo files are named by default).
" AKA dir
let &directory = b:this_dir . '/swp//'
" AKA swf
set swapfile

" Allow u to undo reloading of a file, including when the file is changed by
" an external process.
" AKA ur
set undoreload=-1

" AKA hi
set history=5000        " keep 5000 lines of command line history
" AKA ru
set ruler               " show the cursor position all the time
" AKA sc
set showcmd             " display incomplete commands
" AKA is
set incsearch           " do incremental searching

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  " AKA hls
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
    " AKA tw
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
    autocmd!
    " See also :setfile
    " AKA ft
    autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn setlocal filetype=ghmarkdown
  augroup END

  " External filter to be used for the = command in Lisp/Scheme modes.
  " scmindent.rkt must be in path.
  " AKA ep
  autocmd FileType lisp,scheme,art setlocal equalprg='lispindent'

  " Show **, ||, etc. around words in help files
  " NOTE: I don't think I want this anymore. ir_black/gray_EAC seem to provide
  " coloring for these characters which make them invisible anyway.
  "if has('conceal')
  "  " AKA cole
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
  " AKA fo
  autocmd FileType * setl formatoptions+=r formatoptions-=o

  " Match these words and use Todo group in any file (not just files whose
  " types assign such matches).
  autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO\|FIXME\|NOTE\|XXX', -1, 24)

  " Treat .make files as make
  " See also :setfile
  " AKA ft
    autocmd BufRead,BufNewFile *.make setlocal filetype=make
endif " has("autocmd")

" Set default encoding
" AKA enc
set encoding=utf-8
" Set default encodings - vim tries them in order
" AKA fencs
set fileencodings=ucs-bom,utf-8,latin1

" Some miscellaneous customizations, which I got from someone else's vimrc and tweaked

" AKA nohls
"set nohlsearch " do not highlight searched for phrases. I've started to like using hlsearch; it's easy to clear it when I'm done with :noh.
" AKA ls
set laststatus=2 " always show the status line
" AKA sm
set showmatch " show matching brackets

" Indenting and tabbing - see
" <http://vim.wikia.com/wiki/Indenting_source_code>.
" AKA sw
set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
" AKA sts
set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
" AKA et
set expandtab " TAB and insertion commands insert appropriate number of spaces instead of ^I
" AKA ts
set tabstop=8 " Consensus on #vim seems to be that we should keep tabstop as 8 so things will display correctly with cat, et al. Since we're using softtabstop, when we hit <Tab> it will still only insert 4 (or fewer) spaces.
" AKA list (no abbreviation)
set list " show tabs graphically
if has("multi_byte") && &encoding == "utf-8"
  " AKA lcs
  set listchars=tab:→\ ,trail:· " show tabs as arrow plus appropriate number of spaces; trailing spaces as middle dot
else
  " AKA lcs
  set listchars=tab:>\ ,trail:- " show tabs as > plus appropriate number of spaces; trailing spaces as hyphen
endif

"" Adapted from http://phuzz.org/vimrc.html
"" AKA so
"set scrolloff=5     " keep 5 lines when scrolling - this doesn't seem as cool now that I know how to scroll manually
"" AKA title (no abbreviation)
"set title          " show title in console title bar - disabled because this leaves an annoying message after exiting vim
"" AKA si
"set smartindent    " smart indent
"" AKA cin
"set cindent        " cindent

" AKA ve
set virtualedit=block " just allow it in block select mode
"set virtualedit=all " allow the cursor to always be positioned past the logical EOL

" Modeline support
" AKA ml
set modeline
" AKA mls
set modelines=5 " looks for modelines in the first and last 5 lines of a file

" Maximum tabs to open when starting with -p. We can always open more from
" within vim, though.
" AKA tpm
set tabpagemax=20

" Allow h/l/Left/Right to move across newlines
" NOTE: :h options.txt says putting h and l here is "not recommended". Any
" idea why?
" AKA ww
set whichwrap=h,l,<,>,[,]

" Completion options: show menu for even one completion. This can be useful,
" since the menu tells what file the word was found in.
" AKA cot
set completeopt-=menu
set completeopt+=menuone

" Searches and completions are case-insensitive unless capital letters are
" typed (use \C in search to force case-sensitive).
" AKA scs
set smartcase
" AKA ic
set ignorecase

" Tab at beginning of line inserts 'shiftwidth' spaces, instead of 'tabstop'. Only matters when softtabstop=0 (which in my config it isn't)
" AKA sta
set smarttab

" Do not truncate message lines by putting "..." in the middle
"
" AKA shm
set shortmess-=T

" Enable mouse in xterm, iTerm, etc.
if ! has('nvim')
  " AKA ttym
  set ttymouse=xterm2
endif
" AKA mouse (no abbreviation)
set mouse=a

" Indentation and autoindentation settings
" AKA cino
set cinoptions=
set cinoptions+=L0
set cinoptions+=:0
set cinoptions+=l1
set cinoptions+=g0
set cinoptions+=(0
set cinoptions+=W4
set cinoptions+=j1
set cinoptions+=J1
set cinkeys-=0#

"" Line numbering settings
"" We might want to turn this off in terminals if it slows things down too much
"" AKA nu
"set number         " shows absolute line numbers
"" AKA cpo
"set cpoption+=n    " wraps long lines into gutter
"" Relativenumber is really slow in iTerm 2, so let's enable it only for gvim
"" AKA rnu
"set relativenumber " always shows line offsets from cursor line



call SourceIfReadable(b:this_dir . '/' . 'vimrc-gist')

" TODO: Document this (used to be in section about Command-T)
" AKA wig
set wildignore+=.git,*~,*.o,*.class

" When long lines wrap, continuation lines should be indented at least as much
" as the first screen line; additionally also insert eight break characters
" for extra clarity.
if exists('+breakindent')
  " AKA bri
  set breakindent
  " AKA sbr
  set showbreak=........
  if exists('+breakindentopt')
    " Indent by amount given by line's indentation, then add 'showbreak'
    " characters.
    " TODO: This unfortunately shows blank spaces on the left when the line is
    " indented. I'd prefer it to show '.' throughout.
    " AKA briopt
    set breakindentopt=shift:0
  endif
endif

" AKA ai
set autoindent " always set autoindenting on. Among other things, this makes gq continue the current indent level.
" Copied from $VIMRUNTIME/ftplugin/c.vim
" Set 'formatoptions' to:
" c -t auto-wrap comment lines but not other text
" q    allow formatting of comments with "gq".
" l    format comments with gq, stripping medial comment leaders
" AKA fo
set formatoptions-=t formatoptions+=cql

" Try adding j flag to formatoptions; if it doesn't work, just move on without
" displaying an error.
" (The flag in question is from the patch at
" <http://permalink.gmane.org/gmane.editors.vim.devel/34652>. It makes the J
" normal-mode command discard comment leader characters within the joined
" line.
try
  " AKA fo
  set formatoptions+=j
catch /Vim(set):E539/
endtry

call SourceIfReadable(b:this_dir . '/' . 'vimrc-cscope')

call SourceIfReadable(b:this_dir . '/' . 'vimrc-ctrlp')

" Restore cursor position in window upon returning to buffer
if v:version >= 700
  autocmd BufLeave * let b:winview = winsaveview()
  autocmd BufEnter * if(!&scrollbind && exists('b:winview')) | call winrestview(b:winview) | endif
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
" AKA ssl
set shellslash

call SourceIfReadable(b:this_dir . '/' . 'vimrc-fugitive')

" TODO: Find option to not fold changesets in fugitive. I may actually like
" that feature, though.

call SourceIfReadable(b:this_dir . '/' . 'vimrc-signature')

call SourceIfReadable(b:this_dir . '/' . 'vimrc-delimitmate')

call SourceIfReadable(b:this_dir . '/' . 'vimrc-session')



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" Source key bindings
call SourceIfReadable(b:this_dir . '/' . 'vimrc-keys')
