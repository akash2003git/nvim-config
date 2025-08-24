-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set(
  "n",
  "<leader>cpp",
  ":!> ~/Coding/a2z_dsa/output.txt && g++ % -o temp && ./temp < ~/Coding/a2z_dsa/input.txt > ~/Coding/a2z_dsa/output.txt<CR>",
  { noremap = true, silent = true }
) -- run cpp programs (DSA)

-- keymap.set(
--   "n",
--   "<leader>java",
--   ":!> ~/Coding/a2z_dsa/output.txt && javac % && java %:r < ~/Coding/a2z_dsa/input.txt > ~/Coding/a2z_dsa/output.txt<CR>",
--   { noremap = true, silent = true }
-- ) -- run java programs (DSA)

-- Run Java program in Neovim with <leader>java
vim.keymap.set(
  "n",
  "<leader>java",
  ":!javac % && java %:t:r < /home/akash/Coding/java_dsa/input.txt > /home/akash/Coding/java_dsa/output.txt<CR>",
  { noremap = true, silent = true }
)
