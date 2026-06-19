local M = {}

local _project_root = nil

local function project_root()
  if _project_root then
    return _project_root
  end
  local root = vim.fn.finddir(".git", vim.fn.getcwd() .. ";")
  if root ~= "" then
    _project_root = vim.fn.fnamemodify(root, ":h")
  else
    _project_root = vim.fn.getcwd()
  end
  return _project_root
end

local function workspace_dir()
  local dir = project_root() .. "/.nvim/workspaces"
  vim.fn.mkdir(dir, "p")
  return dir
end

local function config_path()
  return project_root() .. "/.nvim/workspaces.json"
end

local function load_config()
  local path = config_path()
  if vim.fn.filereadable(path) == 1 then
    local content = table.concat(vim.fn.readfile(path), "\n")
    local ok, data = pcall(vim.json.decode, content)
    if ok and type(data) == "table" then
      return data
    end
  end
  return {}
end

local function save_config(data)
  local root = project_root()
  vim.fn.mkdir(root .. "/.nvim", "p")
  local path = config_path()
  vim.fn.writefile({ vim.json.encode(data) }, path)
end

local config = load_config()
local current_workspace = config.current

local _cached_names = nil
local _click_handlers_set = false

local function get_workspace_names()
  if _cached_names then
    return _cached_names
  end
  local dir = workspace_dir()
  local workspaces = vim.fn.glob(dir .. "/*.vim", false, true)
  table.sort(workspaces)

  local names = {}
  for _, ws in ipairs(workspaces) do
    table.insert(names, vim.fn.fnamemodify(ws, ":t:r"))
  end
  _cached_names = names
  return names
end

local function invalidate_cache()
  _cached_names = nil
  _click_handlers_set = false
end

local function setup_click_handlers()
  for i = 1, 99 do
    pcall(vim.cmd, "delfunction! __ws_click_" .. i)
  end

  local names = get_workspace_names()
  for i, _ in ipairs(names) do
    vim.cmd(string.format(
      "function! __ws_click_%d(minwid, clicks, button, _) abort\n" ..
      "  if a:clicks == 1 && a:button ==# 'l'\n" ..
      "    lua require('config.workspaces').load_by_index(%d)\n" ..
      "  endif\n" ..
      "endfunction",
      i, i
    ))
  end
  _click_handlers_set = true
end

setup_click_handlers()

local function set_current_workspace(name)
  current_workspace = name
  local cfg = load_config()
  cfg.current = name
  save_config(cfg)
  vim.cmd("redrawtabline")
end

function M.save(name)
  if not name or name == "" then
    name = vim.fn.input("Workspace name: ")
  end
  if name == "" then
    return
  end

  local dir = workspace_dir()
  local workspace_file = dir .. "/" .. name .. ".vim"
  vim.cmd("mksession! " .. workspace_file)
  invalidate_cache()
  set_current_workspace(name)
  vim.notify("Workspace '" .. name .. "' saved!", vim.log.levels.INFO)
end

function M.load(name)
  if not name or name == "" then
    local dir = workspace_dir()
    local workspaces = vim.fn.glob(dir .. "/*.vim", false, true)
    table.sort(workspaces)
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

  local dir = workspace_dir()
  local workspace_file = dir .. "/" .. name .. ".vim"
  if vim.fn.filereadable(workspace_file) == 1 then
    vim.cmd("%bdelete!")
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

  local dir = workspace_dir()
  local workspace_file = dir .. "/" .. name .. ".vim"
  if vim.fn.filereadable(workspace_file) == 1 then
    vim.fn.delete(workspace_file)
    invalidate_cache()
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
  if not _click_handlers_set then
    setup_click_handlers()
  end

  local names = get_workspace_names()
  if #names == 0 then
    return "WS -"
  end

  local items = {}
  for i, name in ipairs(names) do
    local suffix = name == current_workspace and "*" or ""
    local label = i .. ":" .. name .. suffix
    table.insert(items, "%@__ws_click_" .. i .. "@" .. label .. "%X")
  end

  return "WS " .. table.concat(items, " | ")
end

function M.load_by_index(i)
  local names = get_workspace_names()
  if i > #names then
    vim.notify("Workspace " .. i .. " not found", vim.log.levels.WARN)
    return
  end
  M.load(names[i])
end

return M
