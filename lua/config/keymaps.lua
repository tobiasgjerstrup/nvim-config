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

