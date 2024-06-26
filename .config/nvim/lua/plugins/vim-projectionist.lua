return {
  -- " Jump between two corresponding files
  'tpope/vim-projectionist',
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>:A<CR>", { noremap = true, silent = true })
  end,
}
