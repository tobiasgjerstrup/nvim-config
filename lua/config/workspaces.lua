local M = {}

local workspace_dir = vim.fn.stdpath("data") .. "/workspaces"
vim.fn.mkdir(workspace_dir, "p")
local current_workspace = nil

local function get_workspace_names()
  local workspaces = vim.fn.glob(workspace_dir .. "/*.vim", false, true)
  table.sort(workspaces)

  local names = {}
  for _, ws in ipairs(workspaces) do
    table.insert(names, vim.fn.fnamemodify(ws, ":t:r"))
  end
  return names
end

local function set_current_workspace(name)
  current_workspace = name
  vim.cmd("redrawtabline")
end

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
  set_current_workspace(name)
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
    set_current_workspace(name)
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
    if current_workspace == name then
      set_current_workspace(nil)
    else
      vim.cmd("redrawtabline")
    end
    vim.notify("Workspace '" .. name .. "' deleted!", vim.log.levels.INFO)
  else
    vim.notify("Workspace '" .. name .. "' not found", vim.log.levels.WARN)
  end
end

function M.list()
  local names = get_workspace_names()
  if #names == 0 then
    vim.notify("No workspaces found", vim.log.levels.WARN)
    return
  end
  
  for _, name in ipairs(names) do
    print(name)
  end
end

function M.current()
  return current_workspace
end

function M.all_display()
  local names = get_workspace_names()
  if #names == 0 then
    return "WS -"
  end

  local items = {}
  for i, name in ipairs(names) do
    local suffix = name == current_workspace and "*" or ""
    table.insert(items, i .. ":" .. name .. suffix)
  end

  return "WS " .. table.concat(items, " | ")
end

return M
