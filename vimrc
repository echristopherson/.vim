" Settings that are generally a good idea
set nocompatible
set nohidden

" Bootstrap Pathogen

" Ignored plugins
let g:pathogen_disabled = []
"call add(g:pathogen_disabled, 'YouCompleteMe')

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Settings that are generally a good idea, but are also required by Pathogen
syntax on
filetype plugin indent on
