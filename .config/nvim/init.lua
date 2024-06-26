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
