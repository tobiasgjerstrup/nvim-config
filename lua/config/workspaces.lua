local M = {}

local workspace_dir = vim.fn.stdpath("data") .. "/workspaces"
vim.fn.mkdir(workspace_dir, "p")

local function get_buffers()
  local bufs = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= "" then
      table.insert(bufs, vim.api.nvim_buf_get_name(buf))
    end
  end
  return bufs
end

function M.save(name)
  if not name or name == "" then
    name = vim.fn.input("Workspace name: ")
  end
  if name == "" then
    return
  end

  local workspace_file = workspace_dir .. "/" .. name .. ".vim"
  vim.cmd("mksession! " .. workspace_file)
  vim.notify("Workspace '" .. name .. "' saved!", vim.log.levels.INFO)
end

function M.load(name)
  if not name or name == "" then
    local workspaces = vim.fn.glob(workspace_dir .. "/*.vim", false, true)
    if #workspaces == 0 then
      vim.notify("No workspaces found", vim.log.levels.WARN)
      return
    end
    
    local choices = {}
    for _, ws in ipairs(workspaces) do
      table.insert(choices, vim.fn.fnamemodify(ws, ":t:r"))
    end
    
    vim.ui.select(choices, { prompt = "Load workspace: " }, function(choice)
      if choice then
        M.load(choice)
      end
    end)
    return
  end

  local workspace_file = workspace_dir .. "/" .. name .. ".vim"
  if vim.fn.filereadable(workspace_file) == 1 then
    -- Close all buffers first
    vim.cmd("%bdelete!")
    -- Load the workspace
    vim.cmd("source " .. workspace_file)
    vim.notify("Workspace '" .. name .. "' loaded!", vim.log.levels.INFO)
  else
    vim.notify("Workspace '" .. name .. "' not found", vim.log.levels.WARN)
  end
end

function M.delete(name)
  if not name or name == "" then
    name = vim.fn.input("Workspace name: ")
  end
  if name == "" then
    return
  end

  local workspace_file = workspace_dir .. "/" .. name .. ".vim"
  if vim.fn.filereadable(workspace_file) == 1 then
    vim.fn.delete(workspace_file)
    vim.notify("Workspace '" .. name .. "' deleted!", vim.log.levels.INFO)
  else
    vim.notify("Workspace '" .. name .. "' not found", vim.log.levels.WARN)
  end
end

function M.list()
  local workspaces = vim.fn.glob(workspace_dir .. "/*.vim", false, true)
  if #workspaces == 0 then
    vim.notify("No workspaces found", vim.log.levels.WARN)
    return
  end
  
  for _, ws in ipairs(workspaces) do
    print(vim.fn.fnamemodify(ws, ":t:r"))
  end
end

return M
