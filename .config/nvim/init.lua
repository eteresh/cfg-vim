-- config based on:
-- https://www.youtube.com/watch?v=6pAG3BHurdM
-- https://www.josean.com/posts/how-to-setup-neovim-2024
require('options')
require('keymaps')
require("config.lazy")

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  pattern = { "*" },
  callback = function()
  vim.highlight.on_yank( {higroup='Visual', timeout=500} )
  end,
}
)
