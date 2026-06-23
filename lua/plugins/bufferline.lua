return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    vim.opt.termguicolors = true
    local workspaces = require("config.workspaces")

    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = true,
        show_close_icon = false,
        custom_areas = {
          right = function()
            return {
              { text = " " .. workspaces.all_display() .. " " },
            }
          end,
        },
      },
    })
  end,
}
