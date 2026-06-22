return {
  "petertriho/nvim-scrollbar",
  config = function()
    require("scrollbar").setup({
      show = true,
      show_in_active_only = false,
      set_highlights = true,
      hide_if_all_visible = true,
      handlers = {
        diagnostic = true,
        search = false,
        gitsigns = false,
      },
    })

    require("scrollbar.handlers.diagnostic").setup({
      signs = { "Error", "Warn", "Info", "Hint" },
    })
  end,
}
