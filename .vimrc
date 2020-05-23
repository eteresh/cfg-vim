" Initialize vim defaults
source $VIMRUNTIME/defaults.vim

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Initialize minpac to load vim plugins
" ==========================================================================
packadd minpac
call minpac#init()
command! PackUpdate call minpac#update()
command! PackStatus call minpac#status()
command! PackClean call minpac#clean()
" ==========================================================================

" Plugins
" ==========================================================================
call minpac#add('k-takata/minpac', {'type': 'opt'})
" ==========================================================================
