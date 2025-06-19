-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlights" })

keymap.set("n", "Y", 'y$')

keymap.set("n", "<C-e>", "<C-e>j")
keymap.set("n", "<C-y>", "<C-y>k")

keymap.set("n", "<leader>w", ":write<CR>", { desc = "save file" })
keymap.set("n", "<leader>q", ":qall<CR>", { desc = "quit nvim" })

-- run prettify json
keymap.set("n", "<leader>jp", ":%!jq .<CR>", { desc = "quit nvim" })

-- editing vim/fish configs
keymap.set("n", "<leader>ei", ":edit $HOME/.config/nvim/init.lua<CR>", { desc = "edit vim-config" })
keymap.set("n", "<leader>ef", ":edit $HOME/.config/fish/config.fish<CR>", { desc = "edit fish-config" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- LSP
keymap.set("n", "<leader>ls", "<cmd>LspInfo<CR>", { desc = "List LSP servers" })
