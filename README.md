# Neovim Config

Small Neovim setup built on top of `lazy.nvim`.

## Included

| Module | Purpose |
|--------|---------|
| `lazy.nvim` | Plugin management (auto-bootstrapped) |
| `nvim-tree` | File tree navigation |
| `telescope.nvim` | Fuzzy finder with extension live-grep |
| `bufferline.nvim` | Buffer tabs with workspace display |
| `nvim-lspconfig` + `mason.nvim` + `mason-lspconfig.nvim` | LSP setup and server management |
| `nvim-cmp` + `LuaSnip` | Completion engine with snippet support |
| `copilot.lua` | GitHub Copilot ghost-text suggestions |
| `nvim-treesitter` | Syntax highlighting and indentation |
| Custom theme engine | 8 built-in themes, switchable at runtime |
| Custom workspace manager | Per-project session save/load/delete |

## Requirements

- Neovim `0.11+`
- `git`
- A Nerd Font for icon rendering
- Language servers/toolchains for the languages you work with
- `tree-sitter-cli` (`npm install -g tree-sitter-cli`)

## Install

Clone this repo into your Neovim config directory:

```powershell
# Windows
git clone <your-repo-url> "$env:LOCALAPPDATA/nvim"
```

```bash
# Linux/macOS
git clone <your-repo-url> ~/.config/nvim
```

If you keep the repo elsewhere, symlink it:

```powershell
# Windows
Remove-Item "$env:LOCALAPPDATA/nvim" -Force
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA/nvim" -Target "C:\path\to\nvim-config"
```

Start Neovim — `lazy.nvim` auto-installs and pulls in all plugins.

### Treesitter note

If you have GCC installed and treesitter has issues:

```powershell
setx CC gcc
setx CXX g++
```

## Themes

8 built-in themes, switchable at runtime. The current theme is saved per-project to `.nvim/local/theme.json`.

| Command | Effect |
|---------|--------|
| `:Theme` | Opens a picker to select a theme |
| `:Theme nord` | Switches directly to a theme by name |

Available themes: `vscode-dark` (default), `gruvbox-dark`, `monokai`, `nord`, `one-dark`, `catppuccin-mocha`, `tokyonight`, `light`.

## Workspaces

Project-local session management. Workspace files and state are stored in `.nvim/local/` (auto-gitignored).

| Keymap | Action |
|--------|--------|
| `<leader>ws` | Save current session as a named workspace |
| `<leader>wl` | Load a workspace (picker if no name given) |
| `<leader>wd` | Delete a workspace |
| `<leader>wn` | List all workspaces |
| `<leader>w1` – `<leader>w9` | Quick-load workspace by index |

The current workspace is displayed in the bufferline's right-hand section with clickable names.

## LSP

Servers are installed automatically via `mason-lspconfig`:

`lua_ls`, `gopls`, `ts_ls`, `angularls`, `cssls`

### Server config

Uses the Neovim `0.11` LSP API (`vim.lsp.config()` / `vim.lsp.enable()`).

- `lua_ls` — recognizes `vim` global, disables third-party workspace checks
- `angularls` — boots the Angular language server with project-root probes

## Diagnostics

Error Lens-style inline diagnostics:

- Warnings and errors always shown as virtual text (prefix `->`)
- Sign column shows `E` / `W`
- Warnings and errors are underlined
- Diagnostics update while typing (`update_in_insert = true`)

## Completion (nvim-cmp)

| Key | Action |
|-----|--------|
| `Tab` | Next completion item |
| `Shift+Tab` | Previous completion item |
| `Enter` | Confirm completion |

Sources: `nvim_lsp`, `buffer`, `path`. CSS baseline data-url blobs are stripped from completion details.

## Copilot

Inline ghost-text suggestions (not through nvim-cmp). Copilot keymaps are left unbound in the plugin and set manually:

| Key | Action |
|-----|--------|
| `Ctrl+l` | Accept suggestion |
| `Ctrl+j` | Next suggestion |
| `Ctrl+k` | Previous suggestion |
| `Ctrl+x` | Dismiss suggestion |

## Keymaps

Leader is `Space`.

### Navigation

| Key | Action |
|-----|--------|
| `Ctrl+b` | Toggle file tree |
| `Shift+e` | Next buffer |
| `Shift+q` | Previous buffer |
| `Shift+w` | Delete buffer |
| `Ctrl+w` | Force-delete buffer |

### Telescope

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | List buffers |
| `<leader>fh` | Help tags |

### LSP (buffer-local, set on LspAttach)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Go to references |
| `K` | Hover |

### Editing

| Key | Action |
|-----|--------|
| `Ctrl+Backspace` | Delete previous word (multiple fallbacks: `<C-BS>`, `<C-Backspace>`, `<C-h>`) |

## Editor Settings

| Setting | Value |
|---------|-------|
| Line numbers | Relative |
| Indentation | 4 spaces (`tabstop`, `shiftwidth`, `softtabstop`) |
| Mouse | Enabled |
| Search | Smart case, highlight |
| Folding | Indent-based, max 3 levels |
| `whichwrap` | `<,>,[,]` enabled for arrow-key line wrapping |
| `exrc` | Enabled (loads `.nvim.lua` from current directory) |
| `secure` | Enabled (requires confirmation for `.nvim.lua` execution) |
| History | 1000 entries |

## Directory Structure

```
nvim-config/
├── init.vim                  # Legacy entry point (settings + exrc/secure)
├── config.lua                # Lua entry point (themes, lazy, keymaps)
├── colors/
│   └── custom.lua            # Legacy colorscheme (kept for backward compat)
├── lua/
│   ├── config/
│   │   ├── lazy.lua          # lazy.nvim bootstrap
│   │   ├── theme.lua         # Theme engine (8 themes, :Theme command)
│   │   ├── workspaces.lua    # Workspace manager (save/load/delete sessions)
│   │   └── keymaps.lua       # All keybindings
│   └── plugins/
│       ├── bufferline.lua
│       ├── cmp.lua
│       ├── copilot.lua
│       ├── copilot-lua-cmp.lua
│       ├── filetree.lua
│       ├── lsp.lua
│       ├── telescope.lua
│       ├── treesitter.lua
│       └── workspaces.lua    # Stub (workspaces handled by config module)
└── lazy-lock.json
```

## Notes

- `Ctrl+Backspace` can arrive as different keycodes depending on terminal/OS. Add keycode variants to `lua/config/keymaps.lua` if needed.
- Copilot nvim-cmp integration (`copilot-lua-cmp.lua`) is present but disabled (`enabled = false`) — Copilot runs as ghost text only.
