set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
set fileformats=unix,dos,mac " Use Unix as the standard file type
set number " Show line numbers
set ruler " Show cursor position
set cursorline " highlight current line
set colorcolumn=120
set wildmenu
set wildmode=full

" Save 200 last Ex commands in history
set history=200

let mapleader = " "

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
set spelllang=ru_ru,en_us
set spell

" Give more space for displaying messages.
set cmdheight=2

set updatetime=50

" remapping keys
noremap Y y$
nnoremap <Leader>m :make<CR>
nnoremap <Leader>w :write<CR>
nnoremap <Leader>q :quit<CR>

nnoremap <Leader>t :TagbarToggle<CR>
let g:airline#extensions#tabline#enabled = 1

tnoremap <C-\><C-\> <C-\><C-n>

nnoremap <Leader>f :<C-u>FZF<CR>
nnoremap <Leader>b :<C-u>Buffers<CR>

nnoremap <C-e> <C-e>j
nnoremap <C-y> <C-y>k

" map go to alternate file
nnoremap <Leader>a :A<CR>

nmap <silent> <Leader>d <Plug>(coc-definition)

let g:highlightedyank_highlight_duration = 300

set statusline+=%{ObsessionStatus()}

set norelativenumber

nnoremap <Leader>r :Ranger<CR>
augroup cpp_style_guide
      " Automatically delete trailing DOS-returns and whitespace on file open and
      " write.
    autocmd BufWritePre,FileWritePre *.cpp,*.c,*.h silent! %s/[\r \t]\+$//
    autocmd BufReadPost *.cpp,*.c,*.h set shiftwidth=4
augroup END

" Set color scheme
" ==========================================================================
let g:solarized_termtrans=1
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized8_flat

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
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

call minpac#add('junegunn/fzf', {'type': 'opt', 'do': {-> system('./install --bin')}})
call minpac#add('junegunn/fzf.vim', {'type': 'opt'})

call minpac#add('christoomey/vim-system-copy', {'type': 'opt'})

call minpac#add('tpope/vim-commentary', {'type': 'opt'})

call minpac#add('machakann/vim-sandwich', {'type': 'opt'})

call minpac#add('machakann/vim-highlightedyank', {'type': 'opt'})


call minpac#add('rbgrouleff/bclose.vim', {'type': 'opt'})
call minpac#add('francoiscabrol/ranger.vim', {'type': 'opt'})

call minpac#add('yonchu/accelerated-smooth-scroll', {'type': 'opt'})

call minpac#add('mhinz/vim-startify', {'type': 'opt'})
call minpac#add('mhinz/vim-signify', {'type': 'opt'})

call minpac#add('nvim-lua/plenary.nvim', {'type': 'opt'})

" Add git plugins
call minpac#add('tpope/vim-fugitive', {'type': 'opt'})
call minpac#add('tommcdo/vim-fugitive-blame-ext', {'type': 'opt'})
call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})

" Adding coc-plugin for cpp and python
" https://blog.claude.nl/tech/howto/Setup-Neovim-as-Python-IDE-with-virtualenvs/
" https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/
call minpac#add('neoclide/coc.nvim', {'type': 'opt', 'branch': 'release'})
call minpac#add('neoclide/coc-yaml', {'type': 'opt'})
call minpac#add('neoclide/coc-json', {'type': 'opt'})
" call minpac#add('neoclide/coc-python', {'type': 'opt'})
" call minpac#add('pappasam/coc-jedi', {'type': 'opt'})

call minpac#add('tpope/vim-obsession', {'type': 'opt'})
call minpac#add('tpope/vim-unimpaired', {'type': 'opt'})

call minpac#add('jackguo380/vim-lsp-cxx-highlight', {'type': 'opt'})

call minpac#add('unblevable/quick-scope', {'type': 'opt'})

" Add closing brackets
call minpac#add('Raimondi/delimitMate', {'type': 'opt'})

" Jump between two corresponding files
call minpac#add('tpope/vim-projectionist', {'type': 'opt'})

call minpac#add('preservim/tagbar', {'type': 'opt'})

call minpac#add('bfrg/vim-cpp-modern', {'type': 'opt'})

call minpac#add('tpope/vim-dadbod', {'type': 'opt'})
call minpac#add('kristijanhusak/vim-dadbod-ui', {'type': 'opt'})

" ==========================================================================

" Add plugins
" ==========================================================================
packadd! vim-visual-star-search
packadd! vim-airline

" Add plugins for fuzzy file search
packadd! fzf
packadd! fzf.vim

packadd! vim-system-copy
packadd! vim-sandwich
packadd! vim-commentary
packadd! vim-highlightedyank
packadd! ranger.vim
packadd! bclose.vim
packadd! accelerated-smooth-scroll
packadd! vim-startify
packadd! vim-signify
packadd! plenary.nvim

packadd! coc.nvim
packadd! coc-yaml
packadd! coc-json
" packadd! coc-python
" packadd! coc-jedi
packadd! vim-obsession
packadd! vim-unimpaired
packadd! vim-lsp-cxx-highlight

packadd! vim-fugitive
packadd! vim-fugitive-blame-ext
packadd! vim-gitgutter

packadd! quick-scope
packadd! delimitMate

packadd! vim-projectionist

packadd! tagbar

packadd! vim-cpp-modern

" UI for databases
packadd! vim-dadbod
packadd! vim-dadbod-ui

autocmd BufReadPost *.h,*.cpp,*.c,*.cc set shiftwidth=2
autocmd BufReadPost *.js set shiftwidth=2

set relativenumber
let g:db_ui_auto_execute_table_helpers = 1

nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>ei :edit $HOME/.config/nvim/init.vim<CR>

nnoremap <Leader>ggs :GitGutterStageHunk<CR>
nnoremap <Leader>ggn :GitGutterNextHunk<CR>
nnoremap <Leader>ggp :GitGutterPrevHunk<CR>
nnoremap <Leader>ggu :GitGutterUndoHunk<CR>

let g:ale_linters = {'javascript': ['eslint'], 'python': ['flake8'], 'cpp': ['ccls']}

nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
