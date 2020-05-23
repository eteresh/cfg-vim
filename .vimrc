" Initialize vim defaults
source $VIMRUNTIME/defaults.vim

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
set fileformats=unix,dos,mac " Use Unix as the standard file type
set number " Show line numbers
set ruler " Show cursor position
set cursorline " highlight current line
set colorcolumn=120
set mouse=a
set wildmenu
set wildmode=full

" Save 200 last Ex commands in history
set history=200

" Search settings
" ==========================================================================
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <C-l> :<C-u>nohlsearch<CR><C-l>
" ==========================================================================

" Enable syntax highlighting
filetype plugin indent on
syntax on

" Tab and indent settings
" ==========================================================================
" View tabs and trailing spaces
set listchars=tab:▸\ ,trail:-,eol:¬
set list

set expandtab " Use spaces instead of tabs
set smarttab

set shiftwidth=4 " 1 tab == 4 spaces
set tabstop=4 " visible width of a tab
set wrap " wrap lines
" ==========================================================================

" Expand %% to directory of a current buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Enable spellchecking
set spelllang=en_us
set spell


" Initialize minpac to load vim plugins
" ==========================================================================
packadd minpac
call minpac#init()
command! PackUpdate call minpac#update()
command! PackStatus call minpac#status()
command! PackClean call minpac#clean()
" ==========================================================================

" Load plugins with minpac
" ==========================================================================
" Add minpac to track updates
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add plugin to search visually selected text in visual mode
call minpac#add('nelstrom/vim-visual-star-search', {'type': 'opt'})
" ==========================================================================

" Add plugins
" ==========================================================================
" Add builtin plugin matchit to match HTML tags
packadd! matchit

" Add plugin to search visually selected text in visual mode
packadd! vim-visual-star-search
" ==========================================================================
