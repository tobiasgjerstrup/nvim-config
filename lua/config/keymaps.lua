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

-- Workspace keybindings
local workspaces = require("config.workspaces")
vim.keymap.set("n", "<leader>ws", function() workspaces.save() end, { silent = true, desc = "Save workspace" })
vim.keymap.set("n", "<leader>wl", function() workspaces.load() end, { silent = true, desc = "Load workspace" })
vim.keymap.set("n", "<leader>wd", function() workspaces.delete() end, { silent = true, desc = "Delete workspace" })
vim.keymap.set("n", "<leader>wn", function() workspaces.list() end, { silent = true, desc = "List workspaces" })

-- Quick access to numbered workspaces
for i = 1, 9 do
  vim.keymap.set("n", "<leader>w" .. i, function()
    local workspace_dir = vim.fn.stdpath("data") .. "/workspaces"
    local workspace_list = vim.fn.glob(workspace_dir .. "/*.vim", false, true)
    table.sort(workspace_list)
    
    if i <= #workspace_list then
      local ws_name = vim.fn.fnamemodify(workspace_list[i], ":t:r")
      workspaces.load(ws_name)
    else
      vim.notify("Workspace " .. i .. " not found", vim.log.levels.WARN)
    end
  end, { silent = true, desc = "Load workspace " .. i })
end

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

-- LSP keybindings
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Go to references" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
  end,
})
