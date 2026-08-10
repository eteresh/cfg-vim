return {
    "SUSTech-data/neopyter",
    dependencies = {
      'AbaoFromCUG/websocket.nvim',  -- for mode='direct'
    },
    ---@type neopyter.Option
    opts = {
        mode="direct",
        remote_address = "127.0.0.1:9001",
        file_pattern = { "*.ju.*" },
        on_attach = function(buf)
          local function map(mode, lhs, rhs, desc)
              vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = buf })
          end
          map("n", "<Leader><Enter>", "<cmd>Neopyter execute notebook:run-cell<cr>", "run cell")
          map("n", "<Leader>j<Enter>", "<cmd>Neopyter execute notebook:run-cell-and-select-next<cr>", "run cell select next")

          map("n", "<Leader>ja", "<cmd>Neopyter execute notebook:run-all-above<cr>", "run all above cell")
          map("n", "<Leader>jb", "<cmd>Neopyter execute notebook:run-all-below<cr>", "run cell and all below")
          map("n", "<Leader>ji", "<cmd>Neopyter execute notebook:run-cell-and-insert-below<cr>", "run selected and insert below")
          map("n", "<Leader>jr", "<cmd>Neopyter execute notebook:run-all<cr>", "run all above cell")

          map("n", "<Leader>jh", "<cmd>Neopyter execute notebook:hide-cell-code<cr>", "collapse cell code")
          map("n", "<Leader>jH", "<cmd>Neopyter execute notebook:hide-all-cell-code<cr>", "collapse all code")

          map("n", "<Leader>jc", "<cmd>Neopyter execute notebook:clear-cell-output<cr>", "clear-cell-output")
          map("n", "<Leader>jC", "<cmd>Neopyter execute notebook:clear-all-cell-outputs<cr>", "clear-cell-output")

          map("n", "<Leader>jj", "<cmd>Neopyter command 127.0.0.1:9001<cr>", "Neopyter connect")

          map("n", "<Leader>j0", "<cmd>Neopyter execute kernelmenu:restart<cr>", "restart kernel")
          map("n", "<Leader>j9", "<cmd>Neopyter execute kernelmenu:restart-and-clear<cr>", "restart kernel and clear all cells")
          map("n", "<Leader>j8", "<cmd>Neopyter execute kernelmenu:restart-run-all<cr>", "restart kernel and run all cells")
      end,
    },
}
