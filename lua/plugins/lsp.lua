return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
     ensure_installed = { "lua_ls", "gopls", "ts_ls", "angularls" },
    })

    -- NEW Neovim 0.11 API
    local lsp = vim.lsp

    -- Define server config
    lsp.config.lua_ls = {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    }

        -- Go
    lsp.config.gopls = {}

    -- TypeScript / JavaScript
    lsp.config.tsserver = {}

    -- Angular
    lsp.config.angularls = {
      on_new_config = function(new_config, root_dir)
        new_config.cmd = { "ngserver", "--stdio", "--tsProbeLocations", root_dir, "--ngProbeLocations", root_dir }
      end,
    }

    -- Start servers automatically
    for _, server in ipairs({ "lua_ls", "gopls", "tsserver", "angularls" }) do
      lsp.start(lsp.config[server])
    end
  end,
}

