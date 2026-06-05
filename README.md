# Neovim Config

Small Neovim config built on top of `lazy.nvim`.

## Included

- `lazy.nvim` for plugin management
- `nvim-tree` for a file tree
- `telescope.nvim` for fuzzy finding
- `bufferline.nvim` for VS Code-style buffer tabs
- `nvim-lspconfig` + `mason.nvim` for LSP setup
- `nvim-cmp` + `LuaSnip` for completion
- `copilot.lua` + `copilot-cmp` for GitHub Copilot
- `nvim-treesitter` for syntax highlighting and indentation

## Requirements

- Neovim `0.11+`
- `git`
- A Nerd Font if you want file icons to render correctly
- Language servers or toolchains used by your projects

This config uses `mason.nvim` to install these LSP servers:

- `lua_ls`
- `gopls`
- `ts_ls`
- `angularls`

## Install

Clone this repo into your Neovim config directory.

Windows:

```powershell
git clone <your-repo-url> "$env:LOCALAPPDATA/nvim"
```

Then start Neovim once. `lazy.nvim` will install plugins automatically.

## Leader Key

The leader key is set to `Space`.

## Keymaps

### Navigation

- `Ctrl+b` Toggle file tree

### Telescope

- `Space ff` Find files
- `Space fg` Live grep
- `Space fb` List buffers
- `Space fh` Search help tags

### Buffer Tabs

- `Shift+e` Next buffer
- `Shift+q` Previous buffer
- `Shift+w` Delete current buffer

### Completion

- `Tab` Next completion item
- `Shift+Tab` Previous completion item
- `Enter` Confirm completion

## Notes

- Icons in `nvim-tree` and `bufferline` require a Nerd Font such as `FiraCode Nerd Font`.
- Copilot completion is wired into `nvim-cmp`.
- This config uses the Neovim `0.11+` LSP API with `vim.lsp.config()` and `vim.lsp.enable()`.