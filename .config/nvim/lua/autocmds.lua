vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  pattern = { "*" },
  callback = function()
  vim.highlight.on_yank( {higroup='Visual', timeout=300} )
  end,
}
)

vim.api.nvim_create_autocmd(
    { "BufNewFile", "Bufread" }, {
    pattern = { "*.ddl" },
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_option(buf, "filetype", "sql")
    end,
  }
)

vim.api.nvim_create_autocmd(
    { "BufReadPost" }, {
    pattern = {
      "*.h", "*.cpp", "*.c", "*.cc",
      "*.js", "*.jsx", "*.ts", "*.tsx",
      "*.html", "*.css",
      "*.json",
      "*.lua",
      "*.sql", "*.ddl",
    },
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_option(buf, "shiftwidth", 2)
    end,
  }
)
