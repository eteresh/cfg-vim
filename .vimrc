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

let mapleader="-"

" Search settings
" ==========================================================================
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <silent> <Leader>l :<C-u>nohlsearch<CR><C-l>
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

" Set color scheme
" ==========================================================================
let g:solarized_termtrans=1
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized8_flat
" ==========================================================================


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

" Add colorscheme solarized8
call minpac#add('lifepillar/vim-solarized8', {'type': 'opt'})

call minpac#add('vim-airline/vim-airline', {'type': 'opt'})

" Add git plugins
call minpac#add('tpope/vim-fugitive', {'type': 'opt'})
call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})

" Add plugins for fuzzy file search
call minpac#add('junegunn/fzf', {'type': 'opt', 'do': {-> system('./install --bin')}})
call minpac#add('junegunn/fzf.vim', {'type': 'opt'})

call minpac#add('vim-jp/syntax-vim-ex', {'type': 'opt'})

call minpac#add('jmcantrell/vim-virtualenv', {'type': 'opt'})

call minpac#add('dense-analysis/ale', {'type': 'opt'})

call minpac#add('tpope/vim-unimpaired', {'type': 'opt'})
call minpac#add('tpope/vim-projectionist', {'type': 'opt'})
call minpac#add('tpope/vim-commentary', {'type': 'opt'})
call minpac#add('tpope/vim-speeddating', {'type': 'opt'})


call minpac#add('jez/vim-superman', {'type': 'opt'})
call minpac#add('vim-scripts/ReplaceWithRegister', {'type': 'opt'})
call minpac#add('christoomey/vim-system-copy', {'type': 'opt'})
call minpac#add('christoomey/vim-titlecase', {'type': 'opt'})
call minpac#add('christoomey/vim-sort-motion', {'type': 'opt'})
" call minpac#add('jeffkreeftmeijer/vim-numbertoggle', {'type': 'opt'})

call minpac#add('lyokha/vim-xkbswitch', {'type': 'opt'})

" call minpac#add('michaeljsmith/vim-indent-object', {'type': 'opt'})
call minpac#add('ycm-core/YouCompleteMe', {'type': 'opt', 'do': {-> system('python install.py --all')}})
call minpac#add('machakann/vim-sandwich', {'type': 'opt'})
call minpac#add('machakann/vim-highlightedyank', {'type': 'opt'})

" ==========================================================================

" Add plugins
" ==========================================================================
" Add builtin plugin matchit to match HTML tags
packadd! matchit

" Add plugin to search visually selected text in visual mode
packadd! vim-visual-star-search
packadd! vim-airline

" Add git plugins
packadd! vim-fugitive
packadd! vim-gitgutter

" Add builtin plugin matchit to match HTML tags
packadd! matchit

" Add plugins for fuzzy file search
packadd! fzf
packadd! fzf.vim

packadd! syntax-vim-ex


packadd! vim-virtualenv

packadd! ale

packadd! vim-unimpaired
packadd! vim-projectionist
packadd! vim-commentary
packadd! vim-speeddating

packadd! vim-superman
packadd! ReplaceWithRegister
packadd! vim-system-copy
packadd! vim-titlecase
packadd! vim-sort-motion

packadd! vim-xkbswitch

packadd! YouCompleteMe
packadd! vim-sandwich
packadd! vim-highlightedyank
" ==========================================================================

let g:XkbSwitchLib="/usr/local/lib/libxkbswitch.so"
let g:XkbSwitchEnabled=1

" Mappings
" ==========================================================================
" open fuzzy file search prompt on CTRL-P
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <Leader>b :<C-u>Buffers<CR>
nnoremap <Leader>e :Explore<CR>

" map go to alternate file
nnoremap <Leader>a :A<CR>

let g:highlightedyank_highlight_duration = 400
