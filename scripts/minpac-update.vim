"
" minpac
"

packadd minpac
call minpac#init()

" Manage minpac itself
call minpac#add('k-takata/minpac', {'type': 'opt'})

" TODO: Find a way to accommodate all the platform build instructions in
" minpac.
"NeoBundle 'Shougo/vimproc.vim', {
"\ 'build' : {
"\     'windows' : 'tools\\update-dll-mingw',
"\     'cygwin' : 'make -f make_cygwin.mak',
"\     'mac' : 'make',
"\     'linux' : 'make',
"\     'unix' : 'gmake',
"\    },
"\ }
call minpac#add('Shougo/vimproc.vim', {'type': 'opt', 'do': 'make'})
call minpac#add('Shougo/unite.vim', {'type': 'opt'})
call minpac#add('Shougo/neomru.vim', {'type': 'opt'})
call minpac#add('Slava/vim-spacebars', {'type': 'opt'})
"call minpac#add('LucHermitte/lh-vim-lib')
"call minpac#add('LucHermitte/lh-tags')
"call minpac#add('LucHermitte/lh-dev')
"call minpac#add('LucHermitte/lh-brackets')
call minpac#add('bling/vim-airline')
call minpac#add('chrisbra/vim-diff-enhanced')
" Functionality provided by delimitMate (and partially by vim-endwise):
"call minpac#add('cohama/lexima.vim')
call minpac#add('ctrlpvim/ctrlp.vim')
"call minpac#add('drslump/vim-syntax-js')
call minpac#add('easymotion/vim-easymotion')
" Disabling for now, since I rarely change color schemes, I found out I can
" precalculate a 256-color scheme, and it's slow to load
"call minpac#add('godlygeek/csapprox')
call minpac#add('gregsexton/gitv', {'type': 'opt'})
call minpac#add('jtratner/vim-flavored-markdown', {'type': 'opt'})
call minpac#add('kana/vim-textobj-user')
call minpac#add('kshenoy/vim-signature')
call minpac#add('mattn/gist-vim', {'type': 'opt'})
call minpac#add('mattn/webapi-vim', {'type': 'opt'})
call minpac#add('michaeljsmith/vim-indent-object', {'type': 'opt'})
call minpac#add('nelstrom/vim-textobj-rubyblock')
call minpac#add('pangloss/vim-javascript', {'type': 'opt'})
call minpac#add('rking/ag.vim')
" Disabling for now, since I don't use it much, and it's slow to load
"call minpac#add('scrooloose/nerdtree')
" Disabling for now, since it doesn't really get along with YouCompleteMe
"call minpac#add('scrooloose/syntastic')
" Don't need this if I'm not using NERDTree
"call minpac#add('taiansu/nerdtree-ag')
call minpac#add('tpope/timl', {'type': 'opt'})
call minpac#add('tpope/vim-abolish', {'type': 'opt'})
call minpac#add('tpope/vim-bundler', {'type': 'opt'})
call minpac#add('tpope/vim-dispatch', {'type': 'opt'})
" Functionality provided by lexima; but I've disabled that in favor of
" delimitMate:
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-fugitive', {'type': 'opt'})
call minpac#add('tpope/vim-ragtag', {'type': 'opt'})
call minpac#add('tpope/vim-rails', {'type': 'opt'})
call minpac#add('tpope/vim-rake', {'type': 'opt'})
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('vim-scripts/ZoomWin')
" Disabled -- its functionality is mostly superseded by vim-projectionist
"call minpac#add('vim-scripts/a.vim')
call minpac#add('vim-scripts/buffergrep', {'type': 'opt'})
call minpac#add('vim-scripts/camelcasemotion')
call minpac#add('vim-scripts/matchit.zip')
call minpac#add('vim-utils/vim-husk')
call minpac#add('xolox/vim-misc')
call minpac#add('xolox/vim-session')
call minpac#add('Raimondi/delimitMate')
call minpac#add('vim-scripts/Align', {'type': 'opt'})
" TODO: Look into these again in the future.
"call minpac#add('SirVer/ultisnips')
"call minpac#add('honza/vim-snippets')

" Currently I don't feel like putting in the effort to get YCM working on any
" of my Windows machines.
if !IsHostOSWindows()
    call minpac#add('Valloric/YouCompleteMe', {'type': 'opt'})
endif

call minpac#add('tweekmonster/startuptime.vim')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-projectionist')
call minpac#add('radenling/vim-dispatch-neovim')

" Prompt to remove things not listed here.
call minpac#clean()

" If there are uninstalled bundles found on startup,
" this will conveniently install them.
call minpac#update()
