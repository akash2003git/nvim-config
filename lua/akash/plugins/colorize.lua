return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "html", -- Enable for HTML
      "css", -- Enable for CSS
      "javascript", -- Enable for JavaScript
    }, {
      mode = "background", -- Display colors in the foreground text
      css = { rgb_fn = true }, -- Enable rgb(), rgba(), and hsl() in CSS
      html = { names = false }, -- Disable color names in HTML to focus on code-based colors
      vim.keymap.set("n", "<leader>co", ":ColorizerToggle<CR>", { noremap = true, silent = true }),
    })
  end,
}
