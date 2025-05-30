return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    -- { "jose-elias-alvarez/null-ls.nvim" },
    {
      "nvimtools/none-ls.nvim",
    },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- import null-ls
    local null_ls = require("null-ls")
    -- local null_ls = require("none-ls")

    local keymap = vim.keymap -- for conciseness

    -- Disable inline diagnostics (virtual text)
    vim.diagnostic.config({
      virtual_text = false, -- Disable inline diagnostic text
      signs = true, -- Keep diagnostic symbols in the gutter
      underline = true, -- Keep underlines for errors and warnings
      update_in_insert = false, -- Disable updates in insert mode
      severity_sort = true, -- Sort diagnostics by severity
    })

    -- Set up Prettier with null-ls
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier.with({
          extra_args = { "--plugin", "/usr/lib/node_modules/prettier-plugin-ejs/index.js" }, -- Path to the plugin
        }),
      },
    })

    -- Format on save for .ejs files
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.ejs" },
      callback = function()
        vim.lsp.buf.format({ async = true })
      end,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in jose's video)
    -- local signs = { Error = "  ", Warn = "  ", Hint = " 󰠠 ", Info = "  " }
    -- for type, icon in pairs(signs) do
    --   local hl = "DiagnosticSign" .. type
    --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    -- end

    -- temporary changes
    -- vim.diagnostic.config({
    --   signs = {
    --     text = {
    --       error = " ",
    --       warn = " ",
    --       hint = "󰠠 ",
    --       info = " ",
    --     },
    --   },
    -- })

    mason_lspconfig.setup({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      -- ["svelte"] = function()
      --   -- configure svelte server
      --   lspconfig["svelte"].setup({
      --     capabilities = capabilities,
      --     on_attach = function(client, bufnr)
      --       vim.api.nvim_create_autocmd("BufWritePost", {
      --         pattern = { "*.js", "*.ts" },
      --         callback = function(ctx)
      --           -- Here use ctx.match instead of ctx.file
      --           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
      --         end,
      --       })
      --     end,
      --   })
      -- end,
      -- ["graphql"] = function()
      --   -- configure graphql language server
      --   lspconfig["graphql"].setup({
      --     capabilities = capabilities,
      --     filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
      --   })
      -- end,
      ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "ejs" },
        })
      end,
      ["clangd"] = function()
        lspconfig["clangd"].setup({
          capabilities = capabilities,
          filetypes = { "c", "cpp", "objc", "objcpp" },
        })
      end,
      ["jdtls"] = function()
        lspconfig["jdtls"].setup({
          capabilities = capabilities,
          filetypes = { "java" },
        })
      end,
      ["pyright"] = function()
        lspconfig["pyright"].setup({
          capabilities = capabilities,
          filetypes = { "py" },
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
        -- vim.filetype.add({ extension = { ejs = "ejs" } })
      end,
    })
  end,
}
