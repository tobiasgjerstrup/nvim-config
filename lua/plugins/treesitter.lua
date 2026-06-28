return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  init = function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt.foldminlines = 50
    vim.opt.foldlevel = 0
  end,
  opts = {
    ensure_installed = { "lua", "go", "javascript", "typescript", "html", "tsx" },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    fold = { enable = true },
  },
}
