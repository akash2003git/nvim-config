return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

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
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
        "prismals",
        "pyright",
        "clangd",
        "jdtls",
        "omnisharp", -- .NET 6+ variant (dotnet required)
        -- "svelte",
        -- "graphql",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "black", -- python formatter
        "clang-format", -- cpp formatter
        "csharpier", -- code formatter for C#
        "netcoredbg", -- debugger for .NET (used with nvim-dap)
        -- "isort", -- python formatter
        --"pylint",
        --"eslint_d",
      },
    })
  end,
}
