return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Error Lens-style diagnostics: always show messages inline and in the sign column.
    vim.diagnostic.config({
      virtual_text = {
        spacing = 2,
        source = "if_many",
        prefix = "->",
        severity = { min = vim.diagnostic.severity.HINT },
      },
      signs = {
        severity = { min = vim.diagnostic.severity.HINT },
      },
      underline = {
        severity = { min = vim.diagnostic.severity.HINT },
      },
      update_in_insert = true,
      severity_sort = true,
      float = {
        source = "always",
        border = "rounded",
      },
    })

    vim.fn.sign_define("DiagnosticSignError", { text = "E", texthl = "DiagnosticSignError", numhl = "" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "W", texthl = "DiagnosticSignWarn", numhl = "" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "I", texthl = "DiagnosticSignInfo", numhl = "" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "H", texthl = "DiagnosticSignHint", numhl = "" })

    require("mason").setup()
    require("mason-lspconfig").setup({
     ensure_installed = { "lua_ls", "gopls", "ts_ls", "angularls", "cssls" },
    })

    -- NEW Neovim 0.11 API
    local lsp = vim.lsp

    -- Define server config
    lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    })

    -- Go
    lsp.config("gopls", {})

    -- TypeScript / JavaScript
    lsp.config("ts_ls", {})

    -- Angular
    lsp.config("angularls", {
      on_new_config = function(new_config, root_dir)
        new_config.cmd = { "ngserver", "--stdio", "--tsProbeLocations", root_dir, "--ngProbeLocations", root_dir }
      end,
    })

    -- CSS
    lsp.config("cssls", {})

    -- Enable servers automatically for matching buffers.
    lsp.enable({ "lua_ls", "gopls", "ts_ls", "angularls", "cssls" })
  end,
}
