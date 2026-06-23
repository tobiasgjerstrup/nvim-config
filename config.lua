vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.termguicolors = true

local theme = require("theme")
theme.setup({
	style = "dark",
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

