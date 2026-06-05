return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function on_attach(bufnr)
      local api = require("nvim-tree.api")

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set("n", "<CR>", function()
        api.node.open.edit(nil, { focus = true })
      end, { buffer = bufnr, noremap = true, silent = true, nowait = true, desc = "nvim-tree: Open without focus" })
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
    })
  end,
}

