return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
  -- ys, ds, cs followed with vim motion
  -- dst to delete surrounding tag
  -- ys -> vim motion -> t to surround with tag
}
