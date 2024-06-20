set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
set fileformats=unix,dos,mac " Use Unix as the standard file type
set number " Show line numbers
set ruler " Show cursor position
set cursorline " highlight current line
set colorcolumn=120
set wildmenu
set wildmode=full
set relativenumber

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

" set default indentation
set shiftwidth=4 " 1 tab == 4 spaces
set tabstop=4 " visible width of a tab
set wrap " wrap lines

" set indentation for files based on extention:
autocmd BufReadPost *.h,*.cpp,*.c,*.cc set shiftwidth=2
autocmd BufReadPost *.js,*jsx,*.ts,*.tsx set shiftwidth=2
autocmd BufReadPost *.html,*.css set shiftwidth=2
autocmd BufReadPost *.json set shiftwidth=2

" set filetypes:
autocmd BufNewFile,Bufread *.ddl set filetype=sql

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
nnoremap <Leader>jp :%!jq .<CR>

tnoremap <C-\><C-\> <C-\><C-n>

nnoremap <C-e> <C-e>j
nnoremap <C-y> <C-y>k

" editing vim/fish configs
nnoremap <Leader>ei :edit $HOME/.config/nvim/init.vim<CR>
nnoremap <Leader>ef :edit $HOME/.config/fish/config.fish<CR>

" change window size in split mode
nnoremap <Leader>l :vertical res +5<CR>
nnoremap <Leader>h :vertical res -5<CR>
nnoremap <Leader>j :res +5<CR>
nnoremap <Leader>k :res -5<CR>

augroup cpp_style_guide
      " Automatically delete trailing DOS-returns and whitespace on file open and
      " write.
    autocmd BufWritePre,FileWritePre *.cpp,*.c,*.h silent! %s/[\r \t]\+$//
augroup END

" Set color scheme
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


" BASE VIM PLUGINS:
" colorscheme solarized8
call minpac#add('lifepillar/vim-solarized8', {'type': 'opt'})

" fancy start screen
call minpac#add('mhinz/vim-startify', {'type': 'opt'})

" enabling/disabling tracking session (state)
call minpac#add('tpope/vim-obsession', {'type': 'opt'})

" bottom line with useful info
call minpac#add('vim-airline/vim-airline', {'type': 'opt'})
call minpac#add('vim-airline/vim-airline-themes', {'type': 'opt'})

"lua library
call minpac#add('nvim-lua/plenary.nvim', {'type': 'opt'})
" ==========================================================================


" WORKING WITH TEXT:
" ==========================================================================
" copy/insert text to system clipboard
call minpac#add('christoomey/vim-system-copy', {'type': 'opt'})

" commenting lines with gcc
call minpac#add('tpope/vim-commentary', {'type': 'opt'})

" incrementing/decrementing dates
call minpac#add('tpope/vim-speeddating', {'type': 'opt'})

" automatic closing quotes, parenthesis, brackets
call minpac#add('Raimondi/delimitMate', {'type': 'opt'})

" working with brackets, quotes: replacing, deleting: `sr"'`, `sd[`
call minpac#add('machakann/vim-sandwich', {'type': 'opt'})

" highlight selected (yanked) text
call minpac#add('machakann/vim-highlightedyank', {'type': 'opt'})
" ==========================================================================


" TEXT NAVIGATION:
" ==========================================================================
" exact search visually selected text in visual mode
call minpac#add('nelstrom/vim-visual-star-search', {'type': 'opt'})

" scrolling through code with animation
call minpac#add('yonchu/accelerated-smooth-scroll', {'type': 'opt'})

" Navigation in line: always-on highlight for a unique character in every word on a line to help you use f{symbol}
call minpac#add('unblevable/quick-scope', {'type': 'opt'})
" ==========================================================================


" NAVIGATING FILES:
" ==========================================================================
" ranger inside vim
call minpac#add('francoiscabrol/ranger.vim', {'type': 'opt'})

" fuzzy search
call minpac#add('junegunn/fzf', {'type': 'opt', 'do': {-> system('./install --bin')}})
call minpac#add('junegunn/fzf.vim', {'type': 'opt'})

" navigating with `[`, `]` files in args `[a`, `]a`, buffers `[b`, html-tags `[x`, urls `[u`
call minpac#add('tpope/vim-unimpaired', {'type': 'opt'})

" closing buffer without exiting vim with <Leader>bd
call minpac#add('rbgrouleff/bclose.vim', {'type': 'opt'})

" Jump between two corresponding files
call minpac#add('tpope/vim-projectionist', {'type': 'opt'})
" ==========================================================================


" GIT:
" ==========================================================================
call minpac#add('tpope/vim-fugitive', {'type': 'opt'})
call minpac#add('tommcdo/vim-fugitive-blame-ext', {'type': 'opt'})
" staging/unstaging chanks of code in a file
call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})
" show added/deleted rows in left (sign) column with +/- signs:
call minpac#add('mhinz/vim-signify', {'type': 'opt'})
" ==========================================================================


" CODE LANGUAGES:
" ==========================================================================
" Adding coc-plugin for cpp and python
" https://blog.claude.nl/tech/howto/Setup-Neovim-as-Python-IDE-with-virtualenvs/
" https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/
call minpac#add('neoclide/coc.nvim', {'type': 'opt', 'branch': 'release'})
call minpac#add('neoclide/coc-yaml', {'type': 'opt'})
call minpac#add('neoclide/coc-json', {'type': 'opt'})
call minpac#add('fannheyward/coc-pyright', {'type': 'opt'})
" call minpac#add('pappasam/coc-jedi', {'type': 'opt'})

" C/C++/Cuda/ObjC semantic highlighting using the language server protocol:
call minpac#add('jackguo380/vim-lsp-cxx-highlight', {'type': 'opt'})
" Enhanced C and C++ syntax highlighting:
call minpac#add('bfrg/vim-cpp-modern', {'type': 'opt'})

" right bar with function definitions
call minpac#add('preservim/tagbar', {'type': 'opt'})

" html
call minpac#add('mattn/emmet-vim', {'type': 'opt'})

" linter
call minpac#add('dense-analysis/ale', {'type': 'opt'})
" ==========================================================================

" DATABASES:
" ==========================================================================
call minpac#add('tpope/vim-dadbod', {'type': 'opt'})
call minpac#add('kristijanhusak/vim-dadbod-ui', {'type': 'opt'})
call minpac#add('kristijanhusak/vim-dadbod-completion', {'type': 'opt'})
" ==========================================================================

" Add plugins
" ==========================================================================

" BASE VIM PLUGINS:
packadd! vim-startify
packadd! vim-airline
let g:airline#extensions#tabline#enabled = 1

packadd! vim-obsession
set statusline+=%{ObsessionStatus()}

packadd! plenary.nvim
" ==========================================================================

" WORKING WITH TEXT:
packadd! vim-system-copy
packadd! vim-commentary
packadd! vim-speeddating
packadd! delimitMate
packadd! vim-sandwich
packadd! vim-highlightedyank
let g:highlightedyank_highlight_duration = 300
" ==========================================================================

" TEXT NAVIGATION:
packadd! vim-visual-star-search
packadd! accelerated-smooth-scroll
packadd! quick-scope
" ==========================================================================

" NAVIGATING FILES:
packadd! ranger.vim
nnoremap <Leader>r :Ranger<CR>

packadd! fzf
packadd! fzf.vim
nnoremap <Leader>f :<C-u>FZF<CR>
nnoremap <Leader>b :<C-u>Buffers<CR>

packadd! vim-unimpaired
packadd! bclose.vim
packadd! vim-projectionist
" map go to alternate file
nnoremap <Leader>a :A<CR>
" ==========================================================================

" GIT:
packadd! vim-fugitive
nnoremap <Leader>gw :Gwrite<CR>

packadd! vim-fugitive-blame-ext
packadd! vim-gitgutter
nnoremap <Leader>ggs :GitGutterStageHunk<CR>
nnoremap <Leader>ggn :GitGutterNextHunk<CR>
nnoremap <Leader>ggp :GitGutterPrevHunk<CR>
nnoremap <Leader>ggu :GitGutterUndoHunk<CR>

packadd! vim-signify
" ==========================================================================

" CODE LANGUAGES:
" ==========================================================================
packadd! coc.nvim
packadd! coc-yaml
packadd! coc-json
packadd! coc-pyright
" packadd! coc-jedi
nmap <silent> <Leader>d <Plug>(coc-definition)
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

packadd! vim-lsp-cxx-highlight
packadd! vim-cpp-modern
let g:cpp_function_highlight = 1
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1

packadd! tagbar
nnoremap <Leader>t :TagbarToggle<CR>

packadd! emmet-vim
packadd! ale
let g:ale_linters = {'javascript': ['eslint'], 'python': ['flake8'], 'cpp': ['ccls']}
" ==========================================================================

" DATABASES:
packadd! vim-dadbod
packadd! vim-dadbod-ui
let g:db_ui_auto_execute_table_helpers = 1
packadd! vim-dadbod-completion
" ==========================================================================
