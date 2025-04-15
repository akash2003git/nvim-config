return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "html",
      "css",
      -- "javascript",
      -- "javascriptreact",
    }, {
      mode = "background",
      css = { rgb_fn = true },
      html = { names = false },
      -- javascriptreact = {
      --   tailwind = true,
      --   enable_html = true,
      -- },
      vim.keymap.set("n", "<leader>co", ":ColorizerToggle<CR>", { noremap = true, silent = true }),
    })
  end,
}
