return {
  -- " ranger inside vim
  'francoiscabrol/ranger.vim',
  dependencies = { "rbgrouleff/bclose.vim" }, -- needed to close Ranger auto-created buffers
  keys = {
    { "<leader>r", "<cmd>Ranger<cr>", desc = "Open ranger" },
  },
}
