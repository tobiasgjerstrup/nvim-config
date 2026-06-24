# Neovim Config

Small Neovim setup built on top of `lazy.nvim`.

## Included

- `lazy.nvim` for plugin management
- `nvim-tree` for file tree navigation
- `telescope.nvim` for fuzzy finding
- `bufferline.nvim` for buffer tabs
- `nvim-lspconfig` + `mason.nvim` + `mason-lspconfig.nvim` for LSP setup
- `nvim-cmp` + `LuaSnip` for completion
- `copilot.lua` for GitHub Copilot ghost-text suggestions
- `nvim-treesitter` for syntax highlighting and indentation

## Requirements

- Neovim `0.11+`
- `git`
- A Nerd Font for icon rendering in some plugins
- Language servers/toolchains for the languages you work with

## LSP Servers

Installed automatically via `mason-lspconfig`:

- `lua_ls`
- `gopls`
- `ts_ls`
- `angularls`

## Diagnostics

Diagnostics are configured in an Error Lens-like style:

- Warnings and errors are always shown inline (`virtual_text`)
- Warnings and errors are always shown in the sign column (`W` and `E`)
- Warnings and errors are underlined
- Diagnostics update while typing (`update_in_insert = true`)

## Copilot

Copilot is configured for inline ghost text, not `nvim-cmp` dropdown completion.

Insert-mode Copilot keymaps:

- `Ctrl+l` accept suggestion
- `Ctrl+j` next suggestion
- `Ctrl+k` previous suggestion
- `Ctrl+x` dismiss suggestion

## Leader Key

Leader is set to `Space`.

## Keymaps

Normal mode:

- `Ctrl+b` toggle file tree
- `Space ff` find files
- `Space fg` live grep
- `Space fb` list buffers
- `Space fh` help tags
- `Shift+e` next buffer
- `Shift+q` previous buffer
- `Shift+w` delete buffer

Insert mode:

- `Tab` next completion item
- `Shift+Tab` previous completion item
- `Enter` confirm completion
- `Ctrl+Backspace` delete previous word
	- Fallbacks included for terminal differences: `<C-BS>`, `<C-Backspace>`, and `<C-h>`

## Editor Behavior

- Relative line numbers enabled
- 4-space indentation (`tabstop`, `shiftwidth`, `softtabstop`)
- Arrow keys wrap across lines using `whichwrap+=<,>,[,]`

## Install

Clone this repo into your Neovim config directory.

Windows:

```powershell
git clone <your-repo-url> "$env:LOCALAPPDATA/nvim"
```

If lazy is not installed, run
```powershell
git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$env:LOCALAPPDATA\nvim-data\lazy\lazy.nvim"
```

if treesitter is giving you issues and you have GCC installed, run
```powershell
setx CC gcc
setx CXX g++
```

if you want nvim to be in a different path, create a symlink with
```powershell
Remove-Item "$env:LOCALAPPDATA/nvim" -Force; New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA/nvim" -Target "C:\Users\example\git\nvim-config"
```

Start Neovim once and `lazy.nvim` will install plugins automatically.

## Notes

- This config uses the Neovim `0.12.2` LSP API via `vim.lsp.config()` and `vim.lsp.enable()`.
- If `Ctrl+Backspace` still behaves differently in your terminal, map an additional keycode variant in `lua/config/keymaps.lua`.
