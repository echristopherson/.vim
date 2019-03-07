setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2

" TODO: I'm not sure this is applicable to eruby.

" This allows us to override the Ruby path set in the Ruby ftplugin.
" Unfortunately, the default Ruby plugin only respects g:ruby_path if
" s:ruby_path is undefined in the ftplugin script.
if exists('g:ruby_path')
    let &l:path = g:ruby_path
endif

