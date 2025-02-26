require("akash.core")
require("akash.lazy")

-- makeshift dsa practice setup
vim.api.nvim_set_keymap(
  "n",
  "<leader>rr",
  ":!> ~/Coding/a2z_dsa/output.txt && g++ % -o temp && ./temp < ~/Coding/a2z_dsa/input.txt > ~/Coding/a2z_dsa/output.txt<CR>",
  { noremap = true, silent = true }
)
