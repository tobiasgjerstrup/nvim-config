return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "lua", "go", "javascript", "typescript", "html", "tsx" },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
