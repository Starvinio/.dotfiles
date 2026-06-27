-- nuarb.lua
-- Minimal light colorscheme
-- Only strings and comments get a separate color; everything else is plain fg.

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "nuarb"
vim.opt.background = "light"

local set = vim.api.nvim_set_hl

-- ─── Palette ────────────────────────────────────────────────────────────────
local bg        = "#f5f5f5"
local bg_subtle = "#e9e9e9"
local bg_float  = "#d1d5da"
local fg        = "#14161B"
local fg_muted  = "#8a8a8a"
local green     = "#2e6b3e"
local comments  = "#2c4f7a"
local red       = "#b03030"
local orange    = "#a05010"
local visual    = "#d0cdcc"
local search    = "#e8d060"
local cursearch = "#c8a820"

-- ─── Reused specs ───────────────────────────────────────────────────────────
local plain   = { fg = fg }
local string  = { fg = green }
local comment = { fg = comments }

-- ─── Editor chrome ──────────────────────────────────────────────────────────
set(0, "Normal",       { fg = fg, bg = bg })
set(0, "NormalFloat",  { fg = fg, bg = bg_float })
set(0, "NormalNC",     { fg = fg, bg = bg })

set(0, "CursorLine",   { bg = bg_subtle })
set(0, "CursorLineNr", { fg = fg_muted, bg = bg_subtle, bold = true })
set(0, "LineNr",       { fg = fg_muted, bg = bg })
set(0, "SignColumn",   { fg = fg_muted, bg = bg })

set(0, "Visual",       { bg = visual })
set(0, "VisualNOS",    { bg = visual })

set(0, "Search",       { fg = fg, bg = search })
set(0, "IncSearch",    { fg = fg, bg = cursearch, bold = true })
set(0, "CurSearch",    { fg = fg, bg = cursearch, bold = true })

set(0, "StatusLine",   { fg = fg, bg = bg_float })
set(0, "StatusLineNC", { fg = fg_muted, bg = bg })
set(0, "WinSeparator", { fg = fg_muted, bg = bg })
set(0, "VertSplit",    { fg = fg_muted, bg = bg })

set(0, "Folded",       { fg = fg_muted, bg = bg_subtle })
set(0, "FoldColumn",   { fg = fg_muted, bg = bg })

set(0, "NonText",      { fg = fg_muted })
set(0, "SpecialKey",   { fg = fg_muted })
set(0, "Whitespace",   { fg = fg_muted })
set(0, "EndOfBuffer",  { fg = bg })

set(0, "Pmenu",        { fg = fg, bg = bg_float })
set(0, "PmenuSel",     { fg = fg, bg = bg_subtle, bold = true })
set(0, "PmenuSbar",    { bg = bg_subtle })
set(0, "PmenuThumb",   { bg = fg_muted })

set(0, "TabLine",      { fg = fg_muted, bg = bg_subtle })
set(0, "TabLineSel",   { fg = fg, bg = bg, bold = true })
set(0, "TabLineFill",  { bg = bg_subtle })

set(0, "MatchParen",   { fg = fg, bg = search, bold = true })
set(0, "Cursor",       { fg = bg, bg = fg })
set(0, "CursorIM",     { fg = bg, bg = fg })

-- ─── Syntax ─────────────────────────────────────────────────────────────────
set(0, "Comment",        comment)
set(0, "SpecialComment", comment)

set(0, "String",         string)

set(0, "Character",    plain)
set(0, "Number",       plain)
set(0, "Float",        plain)
set(0, "Boolean",      plain)
set(0, "Constant",     plain)
set(0, "Identifier",   plain)
set(0, "Function",     plain)
set(0, "Statement",    plain)
set(0, "Keyword",      plain)
set(0, "Conditional",  plain)
set(0, "Repeat",       plain)
set(0, "Label",        plain)
set(0, "Operator",     plain)
set(0, "Exception",    plain)
set(0, "PreProc",      plain)
set(0, "Include",      plain)
set(0, "Define",       plain)
set(0, "Macro",        plain)
set(0, "PreCondit",    plain)
set(0, "Type",         plain)
set(0, "StorageClass", plain)
set(0, "Structure",    plain)
set(0, "Typedef",      plain)
set(0, "Special",      plain)
set(0, "SpecialChar",  plain)
set(0, "Tag",          plain)
set(0, "Delimiter",    plain)
set(0, "Debug",        plain)
set(0, "Underlined",   plain)
set(0, "Ignore",       plain)
set(0, "Todo",         { fg = fg, bg = bg_subtle })

-- ─── Diagnostics & errors ───────────────────────────────────────────────────
set(0, "Error",      { fg = red })
set(0, "ErrorMsg",   { fg = red })
set(0, "WarningMsg", { fg = orange })

set(0, "DiagnosticError", { fg = red })
set(0, "DiagnosticWarn",  { fg = orange })
set(0, "DiagnosticInfo",  { fg = fg_muted })
set(0, "DiagnosticHint",  { fg = fg_muted })

set(0, "DiagnosticVirtualTextError", { fg = red })
set(0, "DiagnosticVirtualTextWarn",  { fg = orange })
set(0, "DiagnosticVirtualTextInfo",  { fg = fg_muted })
set(0, "DiagnosticVirtualTextHint",  { fg = fg_muted })

set(0, "DiagnosticSignError", { fg = red,      bg = bg })
set(0, "DiagnosticSignWarn",  { fg = orange })
set(0, "DiagnosticSignInfo",  { fg = fg_muted, bg = bg })
set(0, "DiagnosticSignHint",  { fg = fg_muted, bg = bg })

set(0, "DiagnosticUnderlineError", { sp = red,      undercurl = true })
set(0, "DiagnosticUnderlineWarn",  { sp = orange,   undercurl = true })
set(0, "DiagnosticUnderlineInfo",  { sp = fg_muted, underline = true })
set(0, "DiagnosticUnderlineHint",  { sp = fg_muted, underline = true })

-- ─── Oil.nvim ───────────────────────────────────────────────────────────────
set(0, "OilDir",     string)
set(0, "OilDirIcon", string)

