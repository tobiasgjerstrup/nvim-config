return {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.termguicolors = true
    require("vscode").setup({
      style = "dark",
      transparent = false,
      italic_comments = true,
      disable_nvimtree_bg = true,
    })
    vim.cmd.colorscheme("vscode")
  end,
}
