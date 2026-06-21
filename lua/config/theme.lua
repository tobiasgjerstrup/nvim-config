local M = {}

local themes = {
  ["vscode-dark"] = {
    fg         = "#d4d4d4",
    bg         = "#1e1e1e",
    black      = "#1e1e1e",
    white      = "#ffffff",
    red        = "#f44747",
    green      = "#6a9955",
    yellow     = "#dcdcaa",
    blue       = "#569cd6",
    purple     = "#c586c0",
    cyan       = "#4ec9b0",
    orange     = "#ce9178",
    gray       = "#808080",
    darkgray   = "#333333",
    comment    = "#6a9955",
    selection  = "#264f78",
    linenr     = "#858585",
    cursorline = "#2a2a2a",
    statusline = "#007acc",
    menubg     = "#252526",
    pmenu      = "#1e1e1e",
    diff_add   = "#273e25",
    diff_del   = "#502b2b",
    diff_chg   = "#1e3a5f",
    git_add    = "#81b88b",
    git_del    = "#e06c75",
    git_chg    = "#e2c08d",
  },

  ["gruvbox-dark"] = {
    fg         = "#ebdbb2",
    bg         = "#282828",
    black      = "#282828",
    white      = "#fbf1c7",
    red        = "#fb4934",
    green      = "#b8bb26",
    yellow     = "#fabd2f",
    blue       = "#83a598",
    purple     = "#d3869b",
    cyan       = "#8ec07c",
    orange     = "#fe8019",
    gray       = "#a89984",
    darkgray   = "#3c3836",
    comment    = "#928374",
    selection  = "#504945",
    linenr     = "#7c6f64",
    cursorline = "#32302f",
    statusline = "#458588",
    menubg     = "#1d2021",
    pmenu      = "#3c3836",
    diff_add   = "#2a3b1e",
    diff_del   = "#4a2525",
    diff_chg   = "#1e3a5f",
    git_add    = "#b8bb26",
    git_del    = "#fb4934",
    git_chg    = "#fabd2f",
  },

  ["monokai"] = {
    fg         = "#f8f8f2",
    bg         = "#272822",
    black      = "#272822",
    white      = "#f8f8f0",
    red        = "#f92672",
    green      = "#a6e22e",
    yellow     = "#e6db74",
    blue       = "#66d9ef",
    purple     = "#ae81ff",
    cyan       = "#a1efe4",
    orange     = "#fd971f",
    gray       = "#75715e",
    darkgray   = "#3e3d32",
    comment    = "#75715e",
    selection  = "#49483e",
    linenr     = "#90908a",
    cursorline = "#3e3d32",
    statusline = "#a6e22e",
    menubg     = "#1b1d1e",
    pmenu      = "#3e3d32",
    diff_add   = "#1e3a1e",
    diff_del   = "#4a2525",
    diff_chg   = "#1e3a5f",
    git_add    = "#a6e22e",
    git_del    = "#f92672",
    git_chg    = "#e6db74",
  },

  ["nord"] = {
    fg         = "#d8dee9",
    bg         = "#2e3440",
    black      = "#3b4252",
    white      = "#eceff4",
    red        = "#bf616a",
    green      = "#a3be8c",
    yellow     = "#ebcb8b",
    blue       = "#81a1c1",
    purple     = "#b48ead",
    cyan       = "#88c0d0",
    orange     = "#d08770",
    gray       = "#4c566a",
    darkgray   = "#434c5e",
    comment    = "#616e88",
    selection  = "#434c5e",
    linenr     = "#4c566a",
    cursorline = "#343b49",
    statusline = "#5e81ac",
    menubg     = "#292e39",
    pmenu      = "#3b4252",
    diff_add   = "#2a3b2a",
    diff_del   = "#4a2a2a",
    diff_chg   = "#2a3550",
    git_add    = "#a3be8c",
    git_del    = "#bf616a",
    git_chg    = "#ebcb8b",
  },

  ["one-dark"] = {
    fg         = "#abb2bf",
    bg         = "#282c34",
    black      = "#282c34",
    white      = "#abb2bf",
    red        = "#e06c75",
    green      = "#98c379",
    yellow     = "#e5c07b",
    blue       = "#61afef",
    purple     = "#c678dd",
    cyan       = "#56b6c2",
    orange     = "#d19a66",
    gray       = "#5c6370",
    darkgray   = "#3e4452",
    comment    = "#5c6370",
    selection  = "#3e4452",
    linenr     = "#636d83",
    cursorline = "#2c323c",
    statusline = "#98c379",
    menubg     = "#21252b",
    pmenu      = "#3e4452",
    diff_add   = "#1e3a1e",
    diff_del   = "#4a2525",
    diff_chg   = "#1e3a5f",
    git_add    = "#98c379",
    git_del    = "#e06c75",
    git_chg    = "#e5c07b",
  },

  ["catppuccin-mocha"] = {
    fg         = "#cdd6f4",
    bg         = "#1e1e2e",
    black      = "#1e1e2e",
    white      = "#cdd6f4",
    red        = "#f38ba8",
    green      = "#a6e3a1",
    yellow     = "#f9e2af",
    blue       = "#89b4fa",
    purple     = "#cba6f7",
    cyan       = "#94e2d5",
    orange     = "#fab387",
    gray       = "#6c7086",
    darkgray   = "#313244",
    comment    = "#6c7086",
    selection  = "#45475a",
    linenr     = "#585b70",
    cursorline = "#262636",
    statusline = "#a6e3a1",
    menubg     = "#181825",
    pmenu      = "#313244",
    diff_add   = "#253320",
    diff_del   = "#4a1e2e",
    diff_chg   = "#2a3550",
    git_add    = "#a6e3a1",
    git_del    = "#f38ba8",
    git_chg    = "#f9e2af",
  },

  ["tokyonight"] = {
    fg         = "#c0caf5",
    bg         = "#1a1b26",
    black      = "#1a1b26",
    white      = "#c0caf5",
    red        = "#f7768e",
    green      = "#9ece6a",
    yellow     = "#e0af68",
    blue       = "#7aa2f7",
    purple     = "#bb9af7",
    cyan       = "#7dcfff",
    orange     = "#ff9e64",
    gray       = "#565f89",
    darkgray   = "#292e42",
    comment    = "#565f89",
    selection  = "#33467c",
    linenr     = "#3b4261",
    cursorline = "#1e202e",
    statusline = "#7aa2f7",
    menubg     = "#16161e",
    pmenu      = "#292e42",
    diff_add   = "#20303b",
    diff_del   = "#452525",
    diff_chg   = "#1e3a5f",
    git_add    = "#9ece6a",
    git_del    = "#f7768e",
    git_chg    = "#e0af68",
  },

  ["light"] = {
    fg         = "#383a42",
    bg         = "#fafafa",
    black      = "#fafafa",
    white      = "#383a42",
    red        = "#e45649",
    green      = "#50a14f",
    yellow     = "#c18401",
    blue       = "#4078f2",
    purple     = "#a626a4",
    cyan       = "#0184bc",
    orange     = "#986801",
    gray       = "#a0a1a7",
    darkgray   = "#e5e5e6",
    comment    = "#a0a1a7",
    selection  = "#e5e5e6",
    linenr     = "#9d9d9f",
    cursorline = "#f0f0f0",
    statusline = "#4078f2",
    menubg     = "#f2f2f2",
    pmenu      = "#fafafa",
    diff_add   = "#e6ffe6",
    diff_del   = "#ffe6e6",
    diff_chg   = "#e6f0ff",
    git_add    = "#50a14f",
    git_del    = "#e45649",
    git_chg    = "#c18401",
  },
}

local function apply(colors)
  local hl = vim.api.nvim_set_hl

  hl(0, "Normal",         { fg = colors.fg, bg = colors.bg })
  hl(0, "NormalFloat",    { fg = colors.fg, bg = colors.menubg })
  hl(0, "Comment",        { fg = colors.comment, italic = true })
  hl(0, "Constant",       { fg = colors.cyan })
  hl(0, "String",         { fg = colors.orange })
  hl(0, "Character",      { fg = colors.orange })
  hl(0, "Number",         { fg = colors.green })
  hl(0, "Boolean",        { fg = colors.blue })
  hl(0, "Float",          { fg = colors.green })
  hl(0, "Identifier",     { fg = colors.fg })
  hl(0, "Function",       { fg = colors.yellow })
  hl(0, "Statement",      { fg = colors.purple })
  hl(0, "Conditional",    { fg = colors.purple })
  hl(0, "Repeat",         { fg = colors.purple })
  hl(0, "Label",          { fg = colors.purple })
  hl(0, "Operator",       { fg = colors.fg })
  hl(0, "Keyword",        { fg = colors.blue })
  hl(0, "Exception",      { fg = colors.purple })
  hl(0, "PreProc",        { fg = colors.purple })
  hl(0, "Include",        { fg = colors.blue })
  hl(0, "Define",         { fg = colors.blue })
  hl(0, "Macro",          { fg = colors.purple })
  hl(0, "PreCondit",      { fg = colors.purple })
  hl(0, "Type",           { fg = colors.cyan })
  hl(0, "StorageClass",   { fg = colors.blue })
  hl(0, "Structure",      { fg = colors.cyan })
  hl(0, "Typedef",        { fg = colors.cyan })
  hl(0, "Special",        { fg = colors.yellow })
  hl(0, "SpecialChar",    { fg = colors.yellow })
  hl(0, "Tag",            { fg = colors.blue })
  hl(0, "Delimiter",      { fg = colors.fg })
  hl(0, "SpecialComment", { fg = colors.comment })
  hl(0, "Debug",          { fg = colors.red })
  hl(0, "Underlined",     { underline = true })
  hl(0, "Ignore",         { fg = colors.gray })
  hl(0, "Error",          { fg = colors.red })
  hl(0, "Todo",           { fg = colors.yellow, bg = colors.darkgray })

  hl(0, "Cursor",         { fg = colors.bg, bg = colors.fg })
  hl(0, "CursorLine",     { bg = colors.cursorline })
  hl(0, "CursorColumn",   { bg = colors.cursorline })
  hl(0, "ColorColumn",    { bg = colors.darkgray })
  hl(0, "LineNr",         { fg = colors.linenr })
  hl(0, "CursorLineNr",   { fg = colors.fg })
  hl(0, "SignColumn",     { bg = colors.bg })
  hl(0, "FoldColumn",     { fg = colors.linenr, bg = colors.bg })
  hl(0, "Folded",         { fg = colors.comment, bg = colors.darkgray })
  hl(0, "VertSplit",      { fg = colors.darkgray })
  hl(0, "TabLine",        { fg = colors.fg, bg = colors.darkgray })
  hl(0, "TabLineSel",     { fg = colors.fg, bg = colors.bg })
  hl(0, "TabLineFill",    { bg = colors.darkgray })
  hl(0, "StatusLine",     { fg = colors.fg, bg = colors.statusline })
  hl(0, "StatusLineNC",   { fg = colors.gray, bg = colors.darkgray })
  hl(0, "WildMenu",       { fg = colors.fg, bg = colors.statusline })
  hl(0, "Title",          { fg = colors.blue, bold = true })
  hl(0, "Visual",         { bg = colors.selection })
  hl(0, "Search",         { fg = colors.black, bg = colors.yellow })
  hl(0, "IncSearch",      { fg = colors.black, bg = colors.orange })
  hl(0, "MatchParen",     { fg = colors.fg, bg = colors.darkgray, bold = true })
  hl(0, "NonText",        { fg = colors.darkgray })
  hl(0, "Whitespace",     { fg = colors.darkgray })
  hl(0, "SpecialKey",     { fg = colors.darkgray })
  hl(0, "EndOfBuffer",    { fg = colors.bg })
  hl(0, "Directory",      { fg = colors.blue })
  hl(0, "ModeMsg",        { fg = colors.fg })
  hl(0, "MoreMsg",        { fg = colors.blue })
  hl(0, "Question",       { fg = colors.green })
  hl(0, "WarningMsg",     { fg = colors.yellow })
  hl(0, "ErrorMsg",       { fg = colors.red })
  hl(0, "QuickFixLine",   { bg = colors.selection })
  hl(0, "SpellBad",       { sp = colors.red, undercurl = true })
  hl(0, "SpellCap",       { sp = colors.blue, undercurl = true })
  hl(0, "SpellRare",      { sp = colors.purple, undercurl = true })
  hl(0, "SpellLocal",     { sp = colors.cyan, undercurl = true })
  hl(0, "Pmenu",          { fg = colors.fg, bg = colors.pmenu })
  hl(0, "PmenuSel",       { fg = colors.fg, bg = colors.selection })
  hl(0, "PmenuSbar",      { bg = colors.darkgray })
  hl(0, "PmenuThumb",     { bg = colors.gray })
  hl(0, "FloatBorder",    { fg = colors.darkgray, bg = colors.menubg })
  hl(0, "FloatTitle",     { fg = colors.blue, bg = colors.menubg })
  hl(0, "MsgSeparator",   {})
  hl(0, "Substitute",     { fg = colors.black, bg = colors.red })

  hl(0, "DiffAdd",        { bg = colors.diff_add })
  hl(0, "DiffChange",     { bg = colors.diff_chg })
  hl(0, "DiffDelete",     { bg = colors.diff_del })
  hl(0, "DiffText",       { bg = colors.selection })
  hl(0, "diffAdded",      { fg = colors.git_add })
  hl(0, "diffRemoved",    { fg = colors.git_del })
  hl(0, "diffChanged",    { fg = colors.git_chg })
  hl(0, "diffFile",       { fg = colors.blue })
  hl(0, "diffNewFile",    { fg = colors.green })
  hl(0, "diffOldFile",    { fg = colors.red })
  hl(0, "diffLine",       { fg = colors.comment })
  hl(0, "diffIndexLine",  { fg = colors.purple })

  hl(0, "@function",           { fg = colors.yellow })
  hl(0, "@function.builtin",   { fg = colors.yellow })
  hl(0, "@keyword",            { fg = colors.blue })
  hl(0, "@keyword.function",   { fg = colors.purple })
  hl(0, "@type",               { fg = colors.cyan })
  hl(0, "@type.builtin",       { fg = colors.cyan })
  hl(0, "@variable",           { fg = colors.fg })
  hl(0, "@variable.builtin",   { fg = colors.blue })
  hl(0, "@string",             { fg = colors.orange })
  hl(0, "@constant",           { fg = colors.cyan })
  hl(0, "@constant.builtin",   { fg = colors.cyan })
  hl(0, "@number",             { fg = colors.green })
  hl(0, "@boolean",            { fg = colors.blue })
  hl(0, "@property",           { fg = colors.fg })
  hl(0, "@field",              { fg = colors.fg })
  hl(0, "@tag",                { fg = colors.blue })
  hl(0, "@tag.delimiter",      { fg = colors.gray })
  hl(0, "@attribute",          { fg = colors.purple })
  hl(0, "@constructor",        { fg = colors.yellow })
  hl(0, "@operator",           { fg = colors.fg })

  hl(0, "DiagnosticError",            { fg = colors.red })
  hl(0, "DiagnosticWarn",             { fg = colors.yellow })
  hl(0, "DiagnosticInfo",             { fg = colors.blue })
  hl(0, "DiagnosticHint",             { fg = colors.cyan })
  hl(0, "DiagnosticUnderlineError",   { sp = colors.red, undercurl = true })
  hl(0, "DiagnosticUnderlineWarn",    { sp = colors.yellow, undercurl = true })
  hl(0, "DiagnosticUnderlineInfo",    { sp = colors.blue, undercurl = true })
  hl(0, "DiagnosticUnderlineHint",    { sp = colors.cyan, undercurl = true })
  hl(0, "DiagnosticVirtualTextError", { fg = colors.red })
  hl(0, "DiagnosticVirtualTextWarn",  { fg = colors.yellow })
  hl(0, "DiagnosticVirtualTextInfo",  { fg = colors.blue })
  hl(0, "DiagnosticVirtualTextHint",  { fg = colors.cyan })
end

local function project_root()
  local root = vim.fn.finddir(".git", vim.fn.getcwd() .. ";")
  if root ~= "" then
    return vim.fn.fnamemodify(root, ":h")
  end
  return vim.fn.getcwd()
end

local function saved_theme()
  local path = project_root() .. "/.nvim/local/theme.json"
  if vim.fn.filereadable(path) == 1 then
    local content = table.concat(vim.fn.readfile(path), "\n")
    local ok, data = pcall(vim.json.decode, content)
    if ok and type(data) == "table" and data.theme and themes[data.theme] then
      return data.theme
    end
  end
  return nil
end

local function save_theme(name)
  local root = project_root()
  local dir = root .. "/.nvim/local"
  vim.fn.mkdir(dir, "p")
  vim.fn.writefile({ vim.json.encode({ theme = name }) }, dir .. "/theme.json")
end

function M.pick()
  local current = saved_theme() or "vscode-dark"
  local names = vim.tbl_keys(themes)
  table.sort(names)

  local items = {}
  for _, name in ipairs(names) do
    local label = name
    if name == current then
      label = name .. " *"
    end
    table.insert(items, label)
  end

  vim.ui.select(items, { prompt = "Theme: " }, function(choice)
    if choice then
      local name = choice:gsub(" %*$", "")
      M.switch(name)
    end
  end)
end

function M.switch(name)
  local palette = themes[name]
  if not palette then
    vim.notify("Theme '" .. name .. "' not found", vim.log.levels.WARN)
    return
  end
  apply(palette)
  save_theme(name)
  vim.notify("Theme: " .. name, vim.log.levels.INFO)
end

function M.init()
  local name = saved_theme() or "vscode-dark"
  apply(themes[name])
end

vim.api.nvim_create_user_command("Theme", function(opts)
  if opts.args and opts.args ~= "" then
    M.switch(opts.args)
  else
    M.pick()
  end
end, { nargs = "?", desc = "Switch color theme", complete = function()
  return vim.tbl_keys(themes)
end })

return M
