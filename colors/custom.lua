local colors = {
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
}

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

-- Diff
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

-- Treesitter (linked from standard groups by default, define explicit overrides here)
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

-- Diagnostic
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
