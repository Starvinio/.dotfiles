-- mentat.lua
-- Minimal light colorscheme inspired by solarized light
-- Adjusted for higher contrast and usability with astigmatism
-- Philosophy: only strings and comments get seperate color. Keywords are bold.

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
local fg_muted
local green
local comments
local visual
local search
local cursearch
local red
local orange


-- ─── Palette ────────────────────────────────────────────────────────────────
if vim.o.background == "dark" then
    bg = "#1f2326"
    bg_subtle = "#262b2e"
    bg_float = "#2c3134"
    fg = "#93a1a1"
    fg_muted = "#7f8c91"
    green = "#7fa36b"
    comments = "#657b83"
    visual = "#3a4044"
    search = "#6b5a1a"
    cursearch = "#8a741f"
    red = "#c05a5a"
    orange = "#b07a3a"
else
    bg        = "#f0edec"
    bg_subtle = "#e9e4e2"
    bg_float  = "#d0cdcc"
	fg = "#2c363c"
	fg_muted = "#8c969c"
	green = "#2e6b3e"
    comments = "#785078" 
	visual = "#d0cdcc"
	search = "#e8d060"
	cursearch = "#c8a820"
	red = "#b03030"
	orange = "#a05010"
end

-- This shall be a comment
-- I am adding this comment to see what a comment looks like


-- ─── Editor chrome ──────────────────────────────────────────────────────────

set(0, "Normal", { fg = fg, bg = bg })
set(0, "NormalFloat", { fg = fg, bg = bg_float })
set(0, "NormalNC", { fg = fg, bg = bg })

set(0, "CursorLine", { bg = bg_subtle })
set(0, "CursorLineNr", { fg = fg_muted, bg = bg_subtle, bold = true })
set(0, "LineNr", { fg = fg_muted, bg = bg })
set(0, "SignColumn", { fg = fg_muted, bg = bg })

set(0, "Visual", { bg = visual })
set(0, "VisualNOS", { bg = visual })

set(0, "Search", { fg = fg, bg = search })
set(0, "IncSearch", { fg = fg, bg = cursearch, bold = true })
set(0, "CurSearch", { fg = fg, bg = cursearch, bold = true })

set(0, "StatusLine", { fg = fg_muted, bg = bg_subtle })
set(0, "StatusLineNC", { fg = fg_muted, bg = bg_subtle })
set(0, "WinSeparator", { fg = fg_muted, bg = bg })
set(0, "VertSplit", { fg = fg_muted, bg = bg })

set(0, "Folded", { fg = fg_muted, bg = bg_subtle })
set(0, "FoldColumn", { fg = fg_muted, bg = bg })

set(0, "NonText", { fg = comments, italic = true })
set(0, "SpecialKey", { fg = fg_muted })
set(0, "Whitespace", { fg = fg_muted })
set(0, "EndOfBuffer", { fg = bg }) -- hide the ~ marks

set(0, "Pmenu", { fg = fg, bg = bg_float })
set(0, "PmenuSel", { fg = fg, bg = bg_subtle, bold = true })
set(0, "PmenuSbar", { bg = bg_subtle })
set(0, "PmenuThumb", { bg = fg_muted })

set(0, "TabLine", { fg = fg_muted, bg = bg_subtle })
set(0, "TabLineSel", { fg = fg, bg = bg, bold = true })
set(0, "TabLineFill", { bg = bg_subtle })

set(0, "MatchParen", { fg = fg, bg = bg_float, bold = true })
set(0, "Cursor", { fg = bg, bg = fg })
set(0, "CursorIM", { fg = bg, bg = fg })

-- ─── Syntax — ──────────────────────────────────────────

local plain = { fg = fg }
--local bold = { fg = fg, bold = true }
local bold = { fg = fg, bold = false }
local string = {fg = green}
local comment = { fg = comments, italic = true }

-- Comments
set(0, "Comment", comment)
set(0, "SpecialComment", comment)
set(0, "FlashBackdrop", comment)

-- Strings
set(0, "String", string)

-- Everything else: plain black
set(0, "Character", plain)
set(0, "Function", plain)
set(0, "Constant", plain)
set(0, "Number", plain)
set(0, "Float", plain)
set(0, "Boolean", plain)
set(0, "Identifier", plain)
set(0, "Statement", bold)
set(0, "Keyword", bold)
set(0, "Conditional", bold)
set(0, "Repeat", bold)
set(0, "Label", bold)
set(0, "Operator", plain)
set(0, "Exception", bold)
set(0, "PreProc", plain)
set(0, "Include", plain)
set(0, "Define", bold)
set(0, "Macro", plain)
set(0, "PreCondit", plain)
set(0, "Type", plain)
set(0, "StorageClass", plain)
set(0, "Structure", plain)
set(0, "Typedef", plain)
set(0, "Special", plain)
set(0, "SpecialChar", plain)
set(0, "Tag", plain)
set(0, "Delimiter", plain)
set(0, "Debug", plain)
set(0, "Underlined", plain)
set(0, "Ignore", plain)
set(0, "Todo", { fg = fg, bg=bg_subtle, italic = true })

-- ─── Treesitter — semantic groups ───────────────────────────────────────────
-- Treesitter overrides traditional syntax groups, so we set these explicitly.

-- Strings
set(0, "@string", { fg = green })
set(0, "@string.escape", { fg = green, bold = true })
set(0, "@string.special", { fg = green })
-- Characters share the fg/number color (they are primitives)
set(0, "@character", { fg = fg })

-- Function definitions fg, calls plain
-- (Treesitter distinguishes these reasonably well for most languages)
set(0, "@function", { fg = fg })
set(0, "@function.call", { fg = fg })
set(0, "@function.builtin", { fg = fg })
set(0, "@function.method", { fg = fg })
set(0, "@function.method.call", { fg = fg })
set(0, "@constructor", plain)

-- Comments
set(0, "@comment", comment)
set(0, "@comment.documentation", comment)
set(0, "@markup.raw", comment)

set(0, "@variable", plain)
set(0, "@variable.builtin", plain)
set(0, "@variable.parameter", plain)
set(0, "@variable.member", plain)
set(0, "@constant", plain)
set(0, "@constant.builtin", plain)
set(0, "@constant.macro", plain)
set(0, "@module", plain)
set(0, "@label", plain)
set(0, "@keyword", bold)
set(0, "@keyword.function", bold)
set(0, "@keyword.operator", bold)
set(0, "@keyword.return", bold)
set(0, "@keyword.import", bold)
set(0, "@keyword.conditional", bold)
set(0, "@keyword.repeat", bold)
set(0, "@keyword.exception", bold)
set(0, "@operator", plain)
set(0, "@punctuation.bracket", plain)
set(0, "@punctuation.delimiter", plain)
set(0, "@punctuation.special", plain)
set(0, "@type", plain)
set(0, "@type.builtin", plain)
set(0, "@type.definition", plain)
set(0, "@attribute", plain)
set(0, "@number", { fg = fg })
set(0, "@number.float", { fg = fg })
set(0, "@boolean", { fg = fg })

-- ─── LSP semantic tokens ─────────────────────────────────────────────────────

set(0, "@lsp.type.function", plain) -- reset; declaration modifier below wins
set(0, "@lsp.type.method", plain)
set(0, "@lsp.typemod.function.declaration", plain)
set(0, "@lsp.typemod.method.declaration", plain)
set(0, "@lsp.type.string", string)
set(0, "@lsp.type.number", plain)
set(0, "@lsp.type.comment", comment)
set(0, "@lsp.type.variable", plain)
set(0, "@lsp.type.parameter", plain)
set(0, "@lsp.type.keyword", bold)
set(0, "@lsp.type.type", plain)
set(0, "@lsp.type.class", plain)
set(0, "@lsp.type.interface", plain)
set(0, "@lsp.type.enum", plain)
set(0, "@lsp.type.enumMember", plain)
set(0, "@lsp.type.struct", plain)
set(0, "@lsp.type.namespace", plain)
set(0, "@lsp.type.property", plain)
set(0, "@lsp.type.macro", plain)
set(0, "@lsp.type.decorator", plain)

-- ─── Statusline mode colors (lualine) ────────────────────────────────────────
-- Only visual mode is overridden; normal and insert keep lualine's defaults.
-- lualine's default visual green has poor contrast on a light background,
-- so we replace it with the same green used for strings.

set(0, "lualine_a_visual", { fg = bg, bg = green, bold = true })
set(0, "lualine_b_visual", { fg = green, bg = bg_subtle })
set(0, "lualine_c_visual", { fg = fg_muted, bg = bg })
