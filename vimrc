" Settings that are generally a good idea
set nocompatible
set nohidden

" Bootstrap Pathogen

" Ignored plugins
let g:pathogen_disabled = []
"call add(g:pathogen_disabled, 'YouCompleteMe')
call add(g:pathogen_disabled, 'cocoa.vim')
call add(g:pathogen_disabled, 'Align')
call add(g:pathogen_disabled, 'vim-abolish')
call add(g:pathogen_disabled, 'applescript.vim')
call add(g:pathogen_disabled, 'HiCursorWords')
call add(g:pathogen_disabled, 'vim-colors-solarized')
call add(g:pathogen_disabled, 'YouCompleteMe')
call add(g:pathogen_disabled, 'ultisnips')
" dahu's; these do a lot of the same things as easymotion
call add(g:pathogen_disabled, 'Nexus')
call add(g:pathogen_disabled, 'vim-fanfingtastic')
call add(g:pathogen_disabled, 'vim-KWEasy')
call add(g:pathogen_disabled, 'tslime.vim')


runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Settings that are generally a good idea, but are also required by Pathogen
syntax on
filetype plugin indent on



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

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  " Persistent undo
  if has('persistent_undo')
    set undofile
    set undodir=~/.vimundo
    " No backup files
    set nobackup
  else
    set backup            " keep a backup file
  endif
endif

set history=50          " keep 50 lines of command line history
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
    colorscheme ir_gray-EAC
  endif
endif

" Show syntax groups under cursor
" TODO: Find a key binding for this, or make a function or something.
" map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
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
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
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
  autocmd FileType html,xml,xsl source ~/.vim/scripts/closetag.vim
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

" Put dbext menu directly in menubar
let g:dbext_default_menu_mode = 2

" Do not truncate message lines by putting "..." in the middle
set shortmess-=T

" Enable mouse in xterm, iTerm, etc.
set ttymouse=xterm2
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


" CSApprox settings
" Don't display error message if terminal has <88 colors
let g:CSApprox_verbose_level = 0

" Line numbering settings
" We might want to turn this off in terminals if it slows things down too much
"set number         " shows absolute line numbers
"set cpoption+=n    " wraps long lines into gutter
" Relativenumber is really slow in iTerm 2, so let's enable it only for gvim
"set relativenumber " always shows line offsets from cursor line



"
" NERD Tree settings
"
if has("autocmd")
  " In NERDTree tree buffers and quickfix buffers, don't number lines; don't
  " force cursor away from top or bottom of view; highlight cursor line.
  if exists('+relativenumber')
    autocmd FileType nerdtree,qf setl nornu
  endif
  autocmd FileType nerdtree,qf setl nonu scrolloff=0 cursorline
endif
" Allow single-clicking to open dirs/files in NERD Tree
"let NERDTreeMouseMode=3
" Allow single-clicking to open dirs open in NERD Tree
" TODO: NERD Tree seems to have a bug where dragging to resize the split ends
" up collapsing the tree, at least if you haven't already done any
" collapsing/expanding. Fix that.
let NERDTreeMouseMode = 2
" Make NERD Tree change working directory to whatever the tree's root is
let NERDTreeChDirMode = 2
" Use arrows instead of old +~| characters for tree
let g:NERDTreeDirArrows = 1
" Leave at least 80 columns in main window.
" TODO: Find some way to have it automatically adjust when window is resized.
" TODO: Also take into account number of columns taken by line numbers, if
" used.
" TODO: Fix this so it doesn't set the NERD Tree window to 1 column wide in
" MacVim/gvim.
if &columns < 80 + 31 + 1 " tree width is normally 31 by default; 1 more for divider
  let g:NERDTreeWinSize = &columns - 80 - 1
endif

" TODO: I'm experimenting with this. Figure out if it's worth keeping. If
" NOTE: Nope; this is flaky so far. Too bad.
" so:
" TODO: make it scroll to show highlighted file;
" TODO: make it not always expand directories
" TODO: make it behave nicely with files in multiple directory trees
" From
" <http://superuser.com/questions/195022/vim-how-to-synchronize-nerdtree-with-current-opened-tab-file-path>.
"if has("autocmd")
"  " returns true iff is NERDTree open/active
"  function! rc:isNTOpen()
"    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"  endfunction
"
"  " returns true iff focused window is NERDTree window
"  function! rc:isNTFocused()
"    return -1 != match(expand('%'), 'NERD_Tree')
"  endfunction
"
"  " calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
"  function! rc:syncTree()
"    if &modifiable && rc:isNTOpen() && !rc:isNTFocused() && strlen(expand('%')) > 0 && !&diff
"      NERDTreeFind
"      wincmd p
"    endif
"  endfunction
"
"  autocmd BufEnter * call rc:syncTree()
"endif


"
" Vimwiki settings
"

" TODO
" Vimwiki stomps on Markdown format, so I'm disabling it for now.
let loaded_vimwiki = 1

let wiki = {}
let wiki.path = "$HOME/.vim/vimwiki"
let wiki.path_html = '$HOME/Sites/vimwiki'
let wiki.auto_export = 1
let g:vimwiki_list = [wiki]
"let g:vimwiki_browsers=['~/bin/browser']

"
" Gist settings
"

if IsHostOSWindows()
  let g:gist_clip_command = 'clip'
  "let g:gist_browser_command = '!start rundll32 url.dll,FileProtocolHandler %URL%' " already the default in autoload/gist.vim
  "let g:gist_browser_command = 'start %URL%'
  " TODO: Can't get this to work. I think we have to shellexpand() the
  " command, which might need to be done in autoload/gist.vim. No combination
  " of ' or " and \ or \\ or / has worked.
  "let g:gist_browser_command = 'C:/Program Files (x86)/Google/Chrome/Application/chrome.exe %URL%'
elseif IsHostOSOSX()
  let g:gist_clip_command = 'pbcopy'
  "let g:gist_browser_command = 'open %URL%' " already the default in autoload/gist.vim
elseif IsHostOSLinux()
  let g:gist_clip_command = 'xclip -selection clipboard'
  "let g:gist_browser_command = 'xdg-open %URL%' " already the default in autoload/gist.vim
endif

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

"
" Ruby settings
"

" Set empty path for Ruby plugin, to speed up startup.
" If this isn't set, $VIMRUNTIME/ftplugin/ruby.vim invokes Ruby to get the
" path, which takes a noticeably long time. This path helps with
" completion, but the completion itself is pretty slow too.
let g:ruby_path = ".,,"

" Function taken from the aforementioned ruby.vim (and modified), to set a
" full path in case we want it later.
function! GetRubyPath(ruby_interpreter)
  if a:ruby_interpreter != ''
    let l:ruby_interpreter = a:ruby_interpreter
  else
    let l:ruby_interpreter = 'ruby'
  endif

  if has("ruby") && has("win32")
    ruby VIM::command( 'let l:ruby_path = "%s"' % ($: + begin; require %q{rubygems}; Gem.all_load_paths.sort.uniq; rescue LoadError; []; end).join(%q{,}) )
    let g:ruby_path = '.,' . substitute(l:ruby_path, '\%(^\|,\)\.\%(,\|$\)', ',,', '')
  elseif executable(l:ruby_interpreter)
    let l:code = "print ($: + begin; require %q{rubygems}; Gem.all_load_paths.sort.uniq; rescue LoadError; []; end).join(%q{,})"
    if &shellxquote == "'"
      let l:ruby_path = system(l:ruby_interpreter . ' -e "' . l:code . '"')
    else
      let l:ruby_path = system(l:ruby_interpreter . " -e '" . l:code . "'")
    endif
    let g:ruby_path = '.,' . substitute(l:ruby_path, '\%(^\|,\)\.\%(,\|$\)', ',,', '')
  else
    " If we can't call ruby to get its path, just default to using the
    " current directory and the directory of the current file.
    let g:ruby_path = ".,,"
  endif
  runtime ftplugin/ruby.vim
endfunction

command! -bar GetRubyPath call GetRubyPath('ruby')
command! -bar GetRuby18Path call GetRubyPath('ruby')
command! -bar GetRuby19Path call GetRubyPath('ruby1.9')
command! -bar GetJRubyPath call GetRubyPath('jruby')

" From <http://www.cuberick.com/2008/10/ruby-autocomplete-in-vim.html>
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Make Ruby syntax highlighting not slow CPU so much
" TODO: Check on docs about this. It's for syntax/ruby.vim.
let ruby_no_expensive = 1

"
" Command-T settings
"

" Number of files to show at a time
" Note that this is the total number of files it will show at any time;
" scrolling the list window does no good.
let g:CommandTMaxHeight = 20
" Actually a general Vim setting, but it affects what files Command-T shows
set wildignore+=.git,*~,*.o,*.class
" Scan hidden directories
"let g:CommandTScanDotDirectories = 1

" From <http://stackoverflow.com/a/10495799/1364726>
fun! Runcmd(cmd)
  silent! exe "noautocmd botright pedit ".a:cmd
  noautocmd wincmd P
  set buftype=nofile
  exe "noautocmd r! ".a:cmd
  noautocmd wincmd p
endfun
com! -nargs=1 Runcmd :call Runcmd("<args>")

" breakindent (supplied by patch to vim at <https://retracile.net/wiki/VimBreakIndent>)
if exists('+breakindent')
  set breakindent
  " TODO: Choose between these. Currently it looks like breakindentshift is
  " stuck showing spaces. Maybe figure out a way to do something like
  " listchars, and submit a patch implementing that?
  "set breakindentshift=8
  set breakindentshift=0
  set showbreak=........
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

"
" TagList settings
"
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 0 " already set by default; means show tags for all loaded buffers
let Tlist_Auto_Highlight_Tag = 1 " already set by default
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Enable_Fold_Column = 0
"let Tlist_Compact_Format = 1
"let Tlist_Close_On_Select = 1

"
" Cscope settings
"

" See ~/.vim/plugin/cscope_maps.vim, which I downloaded at some point and have
" modified a little.
" Key mappings defined in that file use <C-\>, <C-@>, or <C-@><C-@> as
" leaders; these mean use current window, split horizontally, and split
" vertically, respectively. This is followed by one of these keys (note that
" these are the same as the first argument to the `:cscope find` command):
"
" s: Find this C symbol
" g: Find this definition
" d: Find functions called by this function
" c: Find functions calling this function
" t: Find this text string
" e: Find this egrep pattern
" f: Find this file
" i: Find files #including this file

" Search for regex in open buffers. Open quicklist window with results.
" NOTE: For consistency with my modification to ack.vim, don't jump to first
" hit (that's the j parameter after the regex in vimgrep).
" Mostly my own code, but enhanced with some insight from ack.vim.
" TODO: Now I use ag.vim, which does jump to first result.
" TODO: I actually had a plugin called buffergrep.vim, which I had forgotten
" about. Some day see if that's worth using instead of this.
" TODO: Make a version that uses ag.
function! BufGrep(search_regex)
  let buffer_list = []
  " TODO: Ignore unlisted buffers?
  for i in range(bufnr('$'))
    if bufexists(i)
      " Escape whitespace in name.
      " TODO: Find out if anything else needs escaping.
      let escaped_name = substitute(bufname(i), '\s', '\\&', 'g')
      call add(buffer_list, escaped_name)
    endif
  endfor

  echomsg 'BufGrep executing silent! vimgrep /' . a:search_regex . '/j ' . join(buffer_list, ' ')
  execute 'silent! vimgrep /' . a:search_regex . '/j ' . join(buffer_list, ' ')
  botright copen
  redraw!
endfunction

" For some reason, specifying multiple args/one args with spaces works the
" same whether we use -nargs=1 or -nargs=+. In both cases, it treats the rest
" of the line as an argument with spaces in it.
command! -nargs=1 BufGrep execute 'call BufGrep(<q-args>)'

" TODO: Move this to plugin file
" TODO: Make complementary functions/commands for lvimgrep, grepadd,
" lvimgrepadd; plus ack.

"
" UltiSnips settings
"
let g:UltiSnipsNoPythonWarning = 1 " don't warn if wrong Python or no Python is found



"
" CtrlP settings
"
" TODO: Look into using Vim's builtin wildignore option too.
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.git|\.hg|\.svn|tmp\/cache\/.*)$',
    \ }

" Use backspace to delete backwards, even when it sends 8 instead of 127.
let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()': ['<C-h>', '<C-?>'],
    \ 'PrtCurLeft()': ['<Left>'],
    \ }
" When creating new file with <C-y>, don't open a new tab or window
let g:ctrlp_open_new_file = 'r'

" Not only for CtrlP, although it helps there:
set wildignore+=.*.swp,.#*#,#*#

" Restore cursor position in window upon returning to buffer
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" Add more HTML tags to built-in indentation rules; see
" <http://www.vim.org/scripts/script.php?script_id=2075>.
let g:html_indent_inctags = "html,body,head,tbody,p"

" Use Ag (the Silver Searcher) instead of Ack for searching
let g:path_to_search_app = "ag"
" Don't show help text each time ag is triggered
let g:ag_mapping_message = 0

" Signify (Sy)
" Override sign column signs
" See ir_gray colorscheme for these groups.
highlight default link SignifySignAdd    OverrideSignifySignAdd
highlight default link SignifySignChange OverrideSignifySignChange
highlight default link SignifySignDelete OverrideSignifySignDelete

" Airline
" Enable "smarter tab line" - show virtual tab bar for opened buffers
"let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

" Airline theme settings
" NOTE: Besides dark, badwolf and powerlineish are pretty nice.
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  if g:airline_theme == 'dark'
    let airline_c = a:palette.normal.airline_c
    let airline_x = a:palette.normal.airline_x

    " Change background color a bit. Since Airline doesn't seem to use GUI
    " colors in terminals, we're using the number CSApprox calculates for
    " #303030.
    " Buffer name
    let airline_c[1] = '#303030'
    let airline_c[3] = 236
    " File type
    let airline_x[1] = '#303030'
    let airline_x[3] = 236

    let a:palette.normal.airline_c = airline_c
    let a:palette.normal.airline_x = airline_x
  endif
endfunction





" TODO
" Solarized
"
if 0
  " Ethan Schoonover recommends setting the terminal's 16 colors to Solarized
  " values rather than using 256-color mode, which degrades the color values.
  "let g:solarized_termcolors=256
  let g:solarized_termcolors=16
  let g:solarized_diffmode='low'
  "let g:solarized_diffmode='normal'
  "let g:solarized_diffmode='high'
  let g:solarized_termtrans=1
  "set background=light
  "set background=dark
  colorscheme solarized
  " TODO: Why is it that:
  " 1. this only works in 16-color mode when $TERM is not a 256-color term?
  " 2. this doesn't take effect in mvim?
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" Source file if it exists and is readable
function! SourceIfReadable(filename)
  if filereadable(a:filename)
    exec 'source ' . a:filename
  else
    echo a:filename . ' not found.'
  endif
endfunction

" Source key bindings
let b:this_dir = expand('<sfile>:p:h')
call SourceIfReadable(b:this_dir . '/vimrc-keys')
