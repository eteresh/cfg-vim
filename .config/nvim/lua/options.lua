local opt = vim.opt -- for conciseness

opt.encoding = 'utf8' -- Set utf8 as standard encoding and en_US as the standard language
opt.fileformats = 'unix,dos,mac' -- Use Unix as the standard file type

opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.relativenumber = true -- show relative line numbers
opt.ruler = true -- Show cursor position
opt.cursorline = true -- highlight current line
opt.colorcolumn = '120'
opt.wildmenu = true
opt.wildmode = 'full'

-- Save 200 last Ex commands in history
opt.history = 200

-- " Search settings
-- " ==========================================================================
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

opt.syntax = 'on'

-- Tab and indent settings
-- ==========================================================================
opt.listchars = { tab = '>~', trail = '-', eol = '¬' }
opt.list = true

opt.expandtab = true -- Use spaces instead of tabs
opt.smarttab = true

-- set default indentation
opt.shiftwidth = 4 -- 1 tab == 4 spaces
opt.tabstop = 4 -- visible width of a tab
opt.wrap = true -- wrap lines
