return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      automatic_enable = true,
      -- list of servers for mason to install
      ensure_installed = {
        "pyright",
        "clangd",
        "lua_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "vimls",
        "graphql",
        "emmet_ls",
        "prismals",
      },
    })
  end,
}
