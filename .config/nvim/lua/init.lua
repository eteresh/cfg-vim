vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    pattern = { "*" },
    callback = function()
      vim.highlight.on_yank( {higroup='Visual', timeout=3000} ),
    end,
  }
)


-- autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='Visual', timeout=300}
