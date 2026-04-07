-- mentat.lua
-- A minimal light colorscheme with intentional, sparse highlighting.
-- Philosophy: only strings, function defs, comments, and line numbers get color.

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "mentat"

local set = vim.api.nvim_set_hl
local bg
local bg_subtle
local bg_float
local fg
local fg_type
local fg_muted
local green
local blue
local purple
local visual
local search
local cursearch
local red
local orange


-- ─── Palette ────────────────────────────────────────────────────────────────
if vim.o.background == 'dark' then
    bg        = "#1e1e1e"     
    bg_subtle = "#272727"     
    bg_float  = "#242424"     
    fg        = "#d4d4d4"   
    fg_muted  = "#6a6a6a"   
    fg_type   = "#a8a8a8"
    green     = "#82a876"   
    blue      = "#6b90c0"   
    purple    = "#b48ead"   
    visual    = "#4e4e4e"
    search    = "#4a4020"
    cursearch = "#6a5818"
    red       = "#cc5555"   
    orange    = "#c07030"   
else 
    bg        = "#f0edec"
    bg_subtle = "#e9e4e2"
    bg_float  = "#d0cdcc"
    fg        = "#1a1a1a"   
    fg_muted  = "#908d8c"   
    fg_type   = "#4a4a4a"
    green     = "#2e6b3e"   
    blue      = "#2c4f7a"   
    purple    = "#744e6d"   
    visual    = "#d0cdcc"
    search    = "#e8d060"
    cursearch = "#c8a820"
    red       = "#b03030"   
    orange    = "#a05010"   
end

-- ─── Editor chrome ──────────────────────────────────────────────────────────

set(0, "Normal",          { fg = fg,       bg = bg })
set(0, "NormalFloat",     { fg = fg,       bg = bg_float })
set(0, "NormalNC",        { fg = fg,       bg = bg })

set(0, "CursorLine",      { bg = bg_subtle })
set(0, "CursorLineNr",    { fg = fg_muted, bg = bg_subtle })
set(0, "LineNr",          { fg = fg_muted, bg = bg })
set(0, "SignColumn",      { fg = fg_muted, bg = bg })

set(0, "Visual",          { bg = visual })
set(0, "VisualNOS",       { bg = visual })

set(0, "Search",    { fg = fg,      bg = search })
set(0, "IncSearch", { fg = fg,      bg = cursearch, bold = true })
set(0, "CurSearch", { fg = fg,      bg = cursearch, bold = true })

set(0, "StatusLine",      { fg = fg_muted, bg = bg_subtle })
set(0, "StatusLineNC",    { fg = fg_muted, bg = bg_subtle })
set(0, "WinSeparator",    { fg = fg_muted, bg = bg })
set(0, "VertSplit",       { fg = fg_muted, bg = bg })

set(0, "Folded",          { fg = fg_muted, bg = bg_subtle })
set(0, "FoldColumn",      { fg = fg_muted, bg = bg })

set(0, "NonText",         { fg = fg_muted })
set(0, "SpecialKey",      { fg = fg_muted })
set(0, "Whitespace",      { fg = fg_muted })
set(0, "EndOfBuffer",     { fg = bg })       -- hide the ~ marks

set(0, "Pmenu",           { fg = fg,       bg = bg_float })
set(0, "PmenuSel",        { fg = fg,       bg = bg_subtle, bold = true })
set(0, "PmenuSbar",       { bg = bg_subtle })
set(0, "PmenuThumb",      { bg = fg_muted })

set(0, "TabLine",         { fg = fg_muted, bg = bg_subtle })
set(0, "TabLineSel",      { fg = fg,       bg = bg, bold = true })
set(0, "TabLineFill",     { bg = bg_subtle })

set(0, "MatchParen",      { fg = fg,  bold = true })
set(0, "Cursor",          { fg = bg,       bg = fg })
set(0, "CursorIM",        { fg = bg,       bg = fg })

-- ─── Diagnostics ────────────────────────────────────────────────────────────

set(0, "DiagnosticError",          { fg = red })
set(0, "DiagnosticWarn",           { fg = orange })
set(0, "DiagnosticInfo",           { fg = fg_muted })
set(0, "DiagnosticHint",           { fg = fg_muted })
set(0, "DiagnosticUnderlineError", { sp = red })
set(0, "DiagnosticUnderlineWarn",  { sp = orange })

set(0, "Error",                    { fg = red })
set(0, "ErrorMsg",                 { fg = red })
set(0, "WarningMsg",               { fg = orange })

-- ─── Syntax — ──────────────────────────────────────────

-- Comments
set(0, "Comment",         { fg = fg_muted, italic = true })

-- Strings
set(0, "String",          { fg = green })
-- Characters are primitives like numbers, so they share the purple color
set(0, "Character",       { fg = purple })

-- Function definitions only (traditional syntax has no call/def distinction,
-- so this is a best-effort; LSP semantic tokens below are more reliable)
set(0, "Function",        { fg = blue })

-- Everything else: plain black
local plain = { fg = fg }
local bold = { fg = fg, bold = true }
local typegrey = { fg = fg }
set(0, "Constant",        plain)
set(0, "Number",          { fg = purple })
set(0, "Float",           { fg = purple })
set(0, "Boolean",         { fg = purple })
set(0, "Identifier",      plain)
set(0, "Statement",       bold)
set(0, "Keyword",         bold)
set(0, "Conditional",     bold)
set(0, "Repeat",          bold)
set(0, "Label",           bold)
set(0, "Operator",        plain)
set(0, "Exception",       bold)
set(0, "PreProc",         plain)
set(0, "Include",         plain)
set(0, "Define",          bold)
set(0, "Macro",           plain)
set(0, "PreCondit",       plain)
set(0, "Type",            typegrey)
set(0, "StorageClass",    plain)
set(0, "Structure",       plain)
set(0, "Typedef",         typegrey)
set(0, "Special",         plain)
set(0, "SpecialChar",     plain)
set(0, "Tag",             plain)
set(0, "Delimiter",       plain)
set(0, "SpecialComment",  plain)
set(0, "Debug",           plain)
set(0, "Underlined",      plain)
set(0, "Ignore",          plain)
set(0, "Todo",            { fg = fg_muted, italic = true })

-- ─── Treesitter — semantic groups ───────────────────────────────────────────
-- Treesitter overrides traditional syntax groups, so we set these explicitly.

-- Strings
set(0, "@string",                    { fg = green })
set(0, "@string.escape",             { fg = green, bold=true })
set(0, "@string.special",            { fg = green })
-- Characters share the purple/number color (they are primitives)
set(0, "@character",                 { fg = purple })

-- Function definitions blue, calls plain
-- (Treesitter distinguishes these reasonably well for most languages)
set(0, "@function",                  { fg = blue })
set(0, "@function.call",             { fg = blue } )
set(0, "@function.builtin",          { fg = blue })
set(0, "@function.method",           { fg = blue })
set(0, "@function.method.call",      { fg = blue })
set(0, "@constructor",               plain)

-- Comments
set(0, "@comment",                   { fg = fg_muted, italic = true })
set(0, "@comment.documentation",     { fg = fg_muted, italic = true })

-- Everything else: plain
set(0, "@variable",                  plain)
set(0, "@variable.builtin",          plain)
set(0, "@variable.parameter",        plain)
set(0, "@variable.member",           plain)
set(0, "@constant",                  plain)
set(0, "@constant.builtin",          plain)
set(0, "@constant.macro",            plain)
set(0, "@module",                    plain)
set(0, "@label",                     plain)
set(0, "@keyword",                   bold)
set(0, "@keyword.function",          bold)
set(0, "@keyword.operator",          bold)
set(0, "@keyword.return",            bold)
set(0, "@keyword.import",            bold)
set(0, "@keyword.conditional",       bold)
set(0, "@keyword.repeat",            bold)
set(0, "@keyword.exception",         bold)
set(0, "@operator",                  plain)
set(0, "@punctuation.bracket",       plain)
set(0, "@punctuation.delimiter",     plain)
set(0, "@punctuation.special",       plain)
set(0, "@type",                      typegrey)
set(0, "@type.builtin",              typegrey)
set(0, "@type.definition",           typegrey)
set(0, "@attribute",                 plain)
set(0, "@number",                    { fg = purple })
set(0, "@number.float",              { fg = purple })
set(0, "@boolean",                   { fg = purple })

-- ─── LSP semantic tokens ─────────────────────────────────────────────────────
-- LSP is the reliable way to distinguish definitions from calls.
-- The `declaration` modifier is set by LSP servers on definition sites only.

set(0, "@lsp.type.function",                  {fg = blue })   -- reset; declaration modifier below wins
set(0, "@lsp.type.method",                    { fg = blue})
set(0, "@lsp.typemod.function.declaration",   { fg = blue })
set(0, "@lsp.typemod.method.declaration",     { fg = blue,  })
set(0, "@lsp.type.string",                    { fg = green })
set(0, "@lsp.type.number",                    { fg = purple })
set(0, "@lsp.type.comment",                   { fg = fg_muted, italic = true })
set(0, "@lsp.type.variable",                  plain)
set(0, "@lsp.type.parameter",                 plain)
set(0, "@lsp.type.keyword",                   bold)
set(0, "@lsp.type.type",                      typegrey)
set(0, "@lsp.type.class",                     typegrey)
set(0, "@lsp.type.interface",                 typegrey)
set(0, "@lsp.type.enum",                      typegrey)
set(0, "@lsp.type.enumMember",                typegrey)
set(0, "@lsp.type.struct",                    typegrey)
set(0, "@lsp.type.namespace",                 plain)
set(0, "@lsp.type.property",                  plain)
set(0, "@lsp.type.macro",                     plain)
set(0, "@lsp.type.decorator",                 plain)

-- ─── Statusline mode colors (lualine) ────────────────────────────────────────
-- Only visual mode is overridden; normal and insert keep lualine's defaults.
-- lualine's default visual green has poor contrast on a light background,
-- so we replace it with the same green used for strings.

set(0, "lualine_a_visual",     { fg = bg,  bg = green, bold = true })
set(0, "lualine_b_visual",     { fg = green, bg = bg_subtle })
set(0, "lualine_c_visual",     { fg = fg_muted, bg = bg })
