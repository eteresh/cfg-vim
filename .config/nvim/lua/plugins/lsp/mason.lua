return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()

    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        },
      },
    })

    mason_lspconfig.setup({
      automatic_enable = true,
      -- list of servers for mason to install
      ensure_installed = {
        "lua_ls",
        "pyright",
        "clangd",
        "vimls",
        "html",
        "emmet_ls",
        "cssls",
        "fish_lsp",
      },
    })
  end
}
