vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.termguicolors = true
vim.cmd.colorscheme("custom")

require("config.lazy")
require("config.keymaps")

