vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.termguicolors = true

-- Use built-in folding (indent-based) instead of external Treesitter folding.
vim.opt.foldmethod = "indent"
vim.opt.foldminlines = 50
vim.opt.foldlevel = 0

local theme = require("theme")
theme.setup({
	style = "purple",
	transparent = false,
	italic_comments = true,
	italic_inlayhints = false,
	underline_links = false,
	disable_nvimtree_bg = true,
	terminal_colors = true,
})
theme.load()

require("config.lazy")

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	once = true,
	callback = function()
		vim.schedule(function()
			theme.load()
		end)
	end,
})

require("config.keymaps")

