vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true })

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { silent = true, desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { silent = true, desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { silent = true, desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { silent = true, desc = "Help tags" })
--vim.keymap.set("n", "<leader>fg", function()
--  require("telescope").extensions.extension_live_grep()
--end, { desc = "Live grep by extension" })

vim.keymap.set("n", "<S-e>", "<cmd>BufferLineCycleNext<cr>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<S-q>", "<cmd>BufferLineCyclePrev<cr>", { silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<S-w>", "<cmd>bdelete<cr>", { silent = true, desc = "Delete buffer" })

vim.keymap.set("i", "<C-l>", function()
	require("copilot.suggestion").accept()
end, { silent = true, desc = "Copilot accept suggestion" })

vim.keymap.set("i", "<C-j>", function()
	require("copilot.suggestion").next()
end, { silent = true, desc = "Copilot next suggestion" })

vim.keymap.set("i", "<C-k>", function()
	require("copilot.suggestion").prev()
end, { silent = true, desc = "Copilot previous suggestion" })

vim.keymap.set("i", "<C-x>", function()
	require("copilot.suggestion").dismiss()
end, { silent = true, desc = "Copilot dismiss suggestion" })

-- Ctrl+Backspace can arrive as different keycodes depending on terminal/OS.
vim.keymap.set("i", "<C-BS>", "<C-w>", { silent = true, desc = "Delete previous word" })
vim.keymap.set("i", "<C-Backspace>", "<C-w>", { silent = true, desc = "Delete previous word" })
vim.keymap.set("i", "<C-h>", "<C-w>", { silent = true, desc = "Delete previous word" })

