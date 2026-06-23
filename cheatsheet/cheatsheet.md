# Neovim Cheatsheet

Leader key: `<Space>`

---

## Custom Keybindings

### File Management (Telescope)

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help tags |
| `<leader>fd` | Find diagnostics |
| `<leader>fq` | Diagnostics to quickfix list |

### Buffer Navigation

| Key | Action |
|---|---|
| `S-e` | Next buffer |
| `S-q` | Previous buffer |
| `S-w` | Delete buffer |
| `C-w` | Force delete buffer |

### File Tree (nvim-tree)

| Key | Action |
|---|---|
| `C-b` | Toggle file tree |
| `CR` | Open file (focus stays on tree) |

### Workspaces

| Key | Action |
|---|---|
| `<leader>ws` | Save workspace (prompts for name) |
| `<leader>wl` | Load workspace (picker if no name given) |
| `<leader>wd` | Delete workspace (prompts for name) |
| `<leader>wn` | List all workspaces |
| `<leader>w1`..`<leader>w9` | Quick-load workspace 1–9 |

Workspace commands (run via `:lua`):
```
:lua require('config.workspaces').save("name")
:lua require('config.workspaces').load("name")
:lua require('config.workspaces').delete("name")
:lua require('config.workspaces').list()
```

### Copilot (Insert mode)

| Key | Action |
|---|---|
| `C-l` | Accept suggestion |
| `C-j` | Next suggestion |
| `C-k` | Previous suggestion |
| `C-x` | Dismiss suggestion |

### Completion — CMP (Insert mode)

| Key | Action |
|---|---|
| `Tab` | Next completion item |
| `S-Tab` | Previous completion item |
| `CR` | Confirm selection |

### LSP

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Go to references |
| `K` | Hover (documentation) |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `[e` | Previous error |
| `]e` | Next error |
| `[w` | Previous warning |
| `]w` | Next warning |

### Editing (Insert mode)

| Key | Action |
|---|---|
| `C-h` | Delete previous word |
| `C-BS` | Delete previous word |
| `C-Backspace` | Delete previous word |

---

## Built-in Neovim Essentials

### Cursor Movement

| Key | Action |
|---|---|
| `h` / `j` / `k` / `l` | Left / down / up / right |
| `w` / `b` | Next / previous word start |
| `e` / `ge` | Next / previous word end |
| `0` / `^` | Start of line (first column / first non-blank) |
| `$` | End of line |
| `gg` / `G` | Start / end of file |
| `Nj` / `Nk` | Jump N lines down / up (e.g. `5j`) |
| `{` / `}` | Previous / next paragraph |
| `%` | Jump to matching bracket |

### Editing

| Key | Action |
|---|---|
| `i` / `I` | Insert at cursor / start of line |
| `a` / `A` | Append after cursor / end of line |
| `o` / `O` | New line below / above |
| `x` | Delete character under cursor |
| `dd` / `Ndd` | Delete line / N lines (e.g. `3dd`) |
| `dw` / `daw` | Delete word / delete a word (with surrounding whitespace) |
| `D` | Delete to end of line |
| `J` | Join line below to current |
| `~` | Toggle case |
| `r` + char | Replace character under cursor |
| `.` | Repeat last change |

### Copy & Paste

| Key | Action |
|---|---|
| `yy` / `Y` | Yank (copy) line |
| `Nyy` | Yank N lines |
| `yw` | Yank word |
| `y$` | Yank to end of line |
| `p` / `P` | Paste after / before cursor |
| `dd` then `p` | Cut and paste line |
| `" + register + command` | Use a named register (e.g. `"ayy`) |
| `:reg` | View all registers |

### Visual Mode

| Key | Action |
|---|---|
| `v` | Visual mode (character) |
| `V` | Visual mode (line) |
| `C-v` | Visual block mode |
| `>` / `<` | Indent / dedent selection |
| `=` | Auto-indent selection |

### Undo & Redo

| Key | Action |
|---|---|
| `u` | Undo |
| `C-r` | Redo |

### Searching

| Key | Action |
|---|---|
| `/` + pattern | Search forward |
| `?` + pattern | Search backward |
| `n` / `N` | Next / previous match |
| `*` / `#` | Search word under cursor forward / backward |
| `f` + char | Find char forward on line |
| `F` + char | Find char backward on line |
| `t` + char | Find before char forward on line |
| `T` + char | Find before char backward on line |
| `;` / `,` | Repeat last `f`/`t` forward / backward |

### Find & Replace

| Command | Action |
|---|---|
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace all in file (confirm each) |
| `:s/old/new/g` | Replace all on current line |
| `:'<,'>s/old/new/g` | Replace in visual selection |

### Splits & Windows

| Key | Action |
|---|---|
| `:sp` / `:vsp` | Horizontal / vertical split |
| `C-w h/j/k/l` | Move to left/down/up/right window |
| `C-w v` / `C-w s` | Vertical / horizontal split |
| `C-w q` / `:q` | Close window |
| `C-w o` | Close all other windows |

### Macros

| Key | Action |
|---|---|
| `q` + register | Start recording (e.g. `qa`) |
| `q` | Stop recording |
| `@` + register | Replay macro (e.g. `@a`) |
| `@@` | Replay last macro |

### Marks

| Key | Action |
|---|---|
| `m` + {a-z} | Set local mark |
| `m` + {A-Z} | Set global mark |
| `'` + mark | Jump to mark (line) |
| `` ` `` + mark | Jump to mark (exact position) |

### Misc

| Key | Action |
|---|---|
| `:w` | Save file |
| `:q` | Quit |
| `:wq` / `:x` | Save and quit |
| `:q!` | Quit without saving |
| `:e` + file | Open file |
| `:bd` | Delete buffer |
| `Ctrl-6` / `:b#` | Toggle to previous buffer |
