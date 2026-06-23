return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    vim.opt.termguicolors = true
    local workspaces = require("config.workspaces")
    local devicons = require("nvim-web-devicons")
    local icon_hl_cache = {}

    local function no_bg_icon_hl(hl_group)
      if not hl_group or hl_group == "" then
        return hl_group
      end

      local cached = icon_hl_cache[hl_group]
      if cached then
        return cached
      end

      local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = hl_group, link = false })
      if not ok then
        return hl_group
      end

      local new_group = "BufferLine" .. hl_group .. "NoBg"
      vim.api.nvim_set_hl(0, new_group, {
        fg = hl.fg,
        ctermfg = hl.ctermfg,
        bold = hl.bold,
        italic = hl.italic,
        underline = hl.underline,
        undercurl = hl.undercurl,
        strikethrough = hl.strikethrough,
        nocombine = hl.nocombine,
        bg = "NONE",
        ctermbg = "NONE",
      })

      icon_hl_cache[hl_group] = new_group
      return new_group
    end

    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "slant",
        color_icons = true,
        get_element_icon = function(element)
          local icon, hl = devicons.get_icon_by_filetype(element.filetype, { default = false })
          if icon and hl then
            return icon, no_bg_icon_hl(hl)
          end

          local filename = element.path and vim.fn.fnamemodify(element.path, ":t") or element.name or ""
          local ext = vim.fn.fnamemodify(filename, ":e")
          local fallback_icon, fallback_hl = devicons.get_icon(filename, ext, { default = true })
          if fallback_icon and fallback_hl then
            return fallback_icon, no_bg_icon_hl(fallback_hl)
          end

          return fallback_icon, fallback_hl
        end,
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
