vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.termguicolors = true

require("config.theme").init()
require("config.lazy")
require("config.keymaps")

