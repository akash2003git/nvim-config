return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- You can change this to 'latte', 'frappe', or 'mocha' if you prefer
      transparent_background = true, -- This is the key line for transparency
      -- Other Catppuccin options can go here if you have any, for example:
      -- term_colors = true,
      -- no_italic = true,
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
