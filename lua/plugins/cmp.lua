return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    local cmp = require("cmp")

    local function strip_css_baseline_blob(text)
      if type(text) ~= "string" then
        return text
      end

      return text
        :gsub("!?%[[^%]]+%]%(%s*data:image[^)]+%)[ \t]*", "")
    end

    local function sanitize_completion_item(entry)
      local item = entry and entry.completion_item
      if not item then
        return
      end

      item.detail = strip_css_baseline_blob(item.detail)

      if type(item.documentation) == "table" then
        item.documentation.value = strip_css_baseline_blob(item.documentation.value)
      elseif type(item.documentation) == "string" then
        item.documentation = strip_css_baseline_blob(item.documentation)
      end

      if item.labelDetails and type(item.labelDetails.description) == "string" then
        item.labelDetails.description = strip_css_baseline_blob(item.labelDetails.description)
      end
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = function(entry, vim_item)
          sanitize_completion_item(entry)
          vim_item.abbr = strip_css_baseline_blob(vim_item.abbr)
          vim_item.menu = strip_css_baseline_blob(vim_item.menu)
          return vim_item
        end,
      },
    })
  end,
}
