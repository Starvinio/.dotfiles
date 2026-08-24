-- nuarb.lua
-- Minimal ANSI-reliant light colorscheme
-- Relying on terminal emulator's 16-color palette

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "nuarb-ansi"
vim.opt.termguicolors = false

local set = vim.api.nvim_set_hl

-- ─── Palette (ANSI Equivalents) ─────────────────────────────────────────────
local bg        = "NONE"           -- Default background (translucent / terminal default)
local bg_subtle = 8              -- Light Gray (White)
local bg_float  = "NONE"              -- Light Gray (White)
local fg        = "NONE"           -- Default foreground (terminal default)
local fg_muted  = 8              -- Bright Black (Dark Gray)
local green     = 2              -- Green
local blue      = 4              -- Blue
local red       = 1              -- Red
local orange    = 3              -- Yellow / Brown
local visual    = 8              -- Light Grey
local search    = 3              -- Yellow
local cursearch = 5              -- Magenta

-- ─── Reused specs ───────────────────────────────────────────────────────────
local plain      = { ctermfg = fg }
local muted      = { ctermfg = fg_muted }
local str        = { ctermfg = green }
local comment    = { ctermfg = blue }
local md_heading = { ctermfg = green, bold = true }

-- ─── Editor chrome ──────────────────────────────────────────────────────────
set(0, "Normal",       { ctermfg = fg, ctermbg = bg })
set(0, "NormalFloat",  { ctermfg = fg, ctermbg = bg_float })
set(0, "NormalNC",     { ctermfg = fg, ctermbg = bg })

set(0, "ColorColumn",  { ctermbg = bg_subtle })
set(0, "Conceal",      muted)
set(0, "CursorColumn", { ctermbg = bg_subtle })

set(0, "CursorLine",   { ctermbg = bg_subtle })
set(0, "CursorLineNr", { ctermfg = fg_muted, ctermbg = bg_subtle, bold = true })
set(0, "LineNr",       { ctermfg = fg_muted, ctermbg = bg })
set(0, "SignColumn",   { ctermfg = fg_muted, ctermbg = bg })

set(0, "Visual",       { ctermbg = visual })
set(0, "VisualNOS",    { ctermbg = visual })

set(0, "Search",       { ctermfg = 0, ctermbg = search })
set(0, "IncSearch",    { ctermfg = 15, ctermbg = cursearch, bold = true })
set(0, "CurSearch",    { ctermfg = 15, ctermbg = cursearch, bold = true })
set(0, "Substitute",   { link = "IncSearch" })

set(0, "StatusLine",     { ctermfg = fg, ctermbg = bg_subtle })
set(0, "StatusLineNC",   { ctermfg = fg_muted, ctermbg = bg })
set(0, "StatusLineTerm", { ctermfg = bg_subtle, ctermbg = fg_muted })
set(0, "StatusLineTermNC", { ctermfg = fg_muted, ctermbg = bg_subtle })
set(0, "WinSeparator",   { ctermfg = fg_muted, ctermbg = bg })
set(0, "VertSplit",      { ctermfg = fg_muted, ctermbg = bg })
set(0, "WinBar",         { ctermfg = fg, ctermbg = bg_float })
set(0, "WinBarNC",       muted)

set(0, "Folded",       { ctermfg = fg_muted, ctermbg = bg_subtle })
set(0, "FoldColumn",   { ctermfg = fg_muted, ctermbg = bg })

set(0, "NonText",      muted)
set(0, "SpecialKey",   muted)
set(0, "Whitespace",   muted)
set(0, "EndOfBuffer",  { ctermfg = bg })

set(0, "Pmenu",        { ctermfg = fg, ctermbg = bg_float })
set(0, "PmenuSel",     { ctermfg = fg, ctermbg = bg_subtle, bold = true })
set(0, "PmenuSbar",    { ctermbg = bg_subtle })
set(0, "PmenuThumb",   { ctermbg = fg_muted })

set(0, "TabLine",      { ctermfg = fg_muted, ctermbg = bg_subtle })
set(0, "TabLineSel",   { ctermfg = fg, ctermbg = bg, bold = true })
set(0, "TabLineFill",  { ctermbg = bg_subtle })

set(0, "MatchParen",   { ctermfg = bg, ctermbg = red, bold = true })
set(0, "Cursor",       { ctermfg = bg, ctermbg = fg_muted })
set(0, "CursorIM",     { ctermfg = bg, ctermbg = fg_muted })

set(0, "Title",        { ctermfg = fg, bold = true })
set(0, "Directory",    plain)
set(0, "FloatBorder",  { ctermfg = 13, ctermbg = bg_float })
set(0, "FloatTitle",   { ctermfg = fg, ctermbg = bg_float, bold = true })

set(0, "ModeMsg",      muted)
set(0, "MoreMsg",      { ctermfg = green })
set(0, "Question",     plain)
set(0, "QuickFixLine", { ctermbg = bg_subtle })
set(0, "WildMenu",     { link = "IncSearch" })

set(0, "SpellBad",     { ctermfg = red, underline = true })
set(0, "SpellCap",     { ctermfg = fg_muted, underline = true })
set(0, "SpellLocal",   { ctermfg = fg_muted, underline = true })
set(0, "SpellRare",    { ctermfg = fg_muted, underline = true })

-- ─── Diffs ──────────────────────────────────────────────────────────────────
set(0, "DiffAdd",       { ctermfg = green,  ctermbg = bg_subtle })
set(0, "DiffChange",    { ctermfg = orange, ctermbg = bg_subtle })
set(0, "DiffDelete",    { ctermfg = red,    ctermbg = bg_subtle })
set(0, "DiffText",      { ctermfg = fg,     ctermbg = search, bold = true })
set(0, "diffAdded",     { link = "DiffAdd" })
set(0, "diffChanged",   { link = "DiffChange" })
set(0, "diffRemoved",   { link = "DiffDelete" })
set(0, "Added",         { ctermfg = green })
set(0, "Changed",       { ctermfg = orange })
set(0, "Removed",       { ctermfg = red })

-- ─── Syntax ─────────────────────────────────────────────────────────────────
set(0, "Comment",        comment)
set(0, "SpecialComment", comment)

set(0, "String",         str)

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
set(0, "Todo",         { ctermfg = bg_subtle, ctermbg = blue })

-- ─── Diagnostics & errors ───────────────────────────────────────────────────
set(0, "Error",      { ctermfg = red })
set(0, "ErrorMsg",   { ctermfg = red })
set(0, "WarningMsg", { ctermfg = orange })

set(0, "healthError",   { ctermfg = red })
set(0, "healthSuccess", { ctermfg = green })
set(0, "healthWarning", { ctermfg = orange })

set(0, "DiagnosticError", { ctermfg = red })
set(0, "DiagnosticWarn",  { ctermfg = orange })
set(0, "DiagnosticInfo",  { ctermfg = fg_muted })
set(0, "DiagnosticHint",  { ctermfg = fg_muted })
set(0, "DiagnosticOk",    { ctermfg = green })

set(0, "DiagnosticDefaultError", { link = "DiagnosticError" })
set(0, "DiagnosticDefaultWarn",  { link = "DiagnosticWarn" })
set(0, "DiagnosticDefaultInfo",  { link = "DiagnosticInfo" })
set(0, "DiagnosticDefaultHint",  { link = "DiagnosticHint" })
set(0, "DiagnosticDefaultOk",    { link = "DiagnosticOk" })

set(0, "DiagnosticFloatingError", { link = "DiagnosticError" })
set(0, "DiagnosticFloatingWarn",  { link = "DiagnosticWarn" })
set(0, "DiagnosticFloatingInfo",  { link = "DiagnosticInfo" })
set(0, "DiagnosticFloatingHint",  { link = "DiagnosticHint" })
set(0, "DiagnosticFloatingOk",    { link = "DiagnosticOk" })

set(0, "DiagnosticVirtualTextError", { ctermfg = red })
set(0, "DiagnosticVirtualTextWarn",  { ctermfg = orange })
set(0, "DiagnosticVirtualTextInfo",  { ctermfg = fg_muted })
set(0, "DiagnosticVirtualTextHint",  { ctermfg = fg_muted })
set(0, "DiagnosticVirtualTextOk",    { ctermfg = green })

set(0, "DiagnosticSignError", { ctermfg = red })
set(0, "DiagnosticSignWarn",  { ctermfg = orange })
set(0, "DiagnosticSignInfo",  { ctermfg = fg_muted })
set(0, "DiagnosticSignHint",  { ctermfg = fg_muted })
set(0, "DiagnosticSignOk",    { ctermfg = green })

set(0, "DiagnosticUnderlineError", { ctermfg = red, underline = true })
set(0, "DiagnosticUnderlineWarn",  { ctermfg = orange, underline = true })
set(0, "DiagnosticUnderlineInfo",  { ctermfg = fg_muted, underline = true })
set(0, "DiagnosticUnderlineHint",  { ctermfg = fg_muted, underline = true })
set(0, "DiagnosticUnderlineOk",    { ctermfg = green, underline = true })

-- ─── LSP ────────────────────────────────────────────────────────────────────
set(0, "LspCodeLens",                 muted)
set(0, "LspCodeLensSeparator",        muted)
set(0, "LspInlayHint",                muted)
set(0, "LspReferenceRead",            { ctermbg = bg_subtle })
set(0, "LspReferenceText",            { ctermbg = bg_subtle })
set(0, "LspReferenceWrite",           { ctermbg = bg_subtle, underline = true })
set(0, "LspSignatureActiveParameter", { ctermbg = bg_subtle })

-- ─── Treesitter ─────────────────────────────────────────────────────────────
set(0, "@variable",                    plain)
set(0, "@variable.builtin",            plain)
set(0, "@variable.parameter",          plain)
set(0, "@variable.parameter.builtin",  plain)
set(0, "@variable.member",             plain)

set(0, "@constant",                    plain)
set(0, "@constant.builtin",            plain)
set(0, "@constant.macro",              plain)

set(0, "@module",                      plain)
set(0, "@module.builtin",              plain)
set(0, "@label",                       plain)

set(0, "@string",                      str)
set(0, "@string.regexp",               str)
set(0, "@string.escape",               str)
set(0, "@string.special",              str)
set(0, "@string.special.symbol",       plain)
set(0, "@string.special.url",          { ctermfg = fg, underline = true })

set(0, "@character",                   plain)
set(0, "@character.special",           plain)
set(0, "@boolean",                     plain)
set(0, "@number",                      plain)
set(0, "@number.float",                plain)
set(0, "@float",                       plain)

set(0, "@type",                        plain)
set(0, "@type.builtin",                plain)
set(0, "@type.definition",             plain)

set(0, "@attribute",                   plain)
set(0, "@attribute.builtin",           plain)
set(0, "@property",                    plain)

set(0, "@function",                    plain)
set(0, "@function.builtin",            plain)
set(0, "@function.call",               plain)
set(0, "@function.macro",              plain)
set(0, "@function.method",             plain)
set(0, "@function.method.call",        plain)

set(0, "@constructor",                 plain)
set(0, "@operator",                    plain)

set(0, "@punctuation.delimiter",       plain)
set(0, "@punctuation.bracket",         plain)
set(0, "@punctuation.special",         plain)

set(0, "@keyword",                     plain)
set(0, "@keyword.coroutine",           plain)
set(0, "@keyword.function",            plain)
set(0, "@keyword.operator",            plain)
set(0, "@keyword.import",              plain)
set(0, "@keyword.storage",             plain)
set(0, "@keyword.repeat",              plain)
set(0, "@keyword.return",              plain)
set(0, "@keyword.debug",               plain)
set(0, "@keyword.exception",           plain)
set(0, "@keyword.conditional",         plain)
set(0, "@keyword.conditional.ternary", plain)
set(0, "@keyword.directive",           plain)
set(0, "@keyword.directive.define",    plain)

set(0, "@comment",                comment)
set(0, "@comment.documentation",  comment)
set(0, "@comment.error",          { ctermfg = red })
set(0, "@comment.warning",        { ctermfg = orange })
set(0, "@comment.todo",           { ctermfg = fg, ctermbg = bg_subtle })
set(0, "@comment.hint",           muted)
set(0, "@comment.info",           muted)
set(0, "@comment.note",           comment)

set(0, "@markup.strong",          { bold = true })
set(0, "@markup.italic",          { italic = true })
set(0, "@markup.strikethrough",   { strikethrough = true })
set(0, "@markup.underline",       { underline = true })
set(0, "@markup.quote",           plain)
set(0, "@markup.math",            plain)
set(0, "@markup.environment",     plain)
set(0, "@markup.environment.name", plain)

set(0, "@markup.link",                       plain)
set(0, "@markup.link.markdown_inline",       plain)
set(0, "@markup.link.label.markdown_inline", plain)
set(0, "@markup.link.url",                   { ctermfg = blue, underline = true })

set(0, "@markup.list",           plain)
set(0, "@markup.list.checked",   { ctermfg = green })
set(0, "@markup.list.unchecked", plain)

set(0, "@markup.raw",                    comment)
set(0, "@markup.raw.markdown_inline",    comment)
set(0, "@markup.raw.block",              comment)
set(0, "@markup.raw.delimiter.markdown", comment)

set(0, "@markup.heading",              md_heading)
set(0, "@markup.heading.1.markdown",   md_heading)
set(0, "@markup.heading.2.markdown",   md_heading)
set(0, "@markup.heading.3.markdown",   md_heading)
set(0, "@markup.heading.4.markdown",   md_heading)
set(0, "@markup.heading.5.markdown",   md_heading)
set(0, "@markup.heading.6.markdown",   md_heading)
set(0, "@markup.heading.1.marker.markdown", md_heading)
set(0, "@markup.heading.2.marker.markdown", md_heading)
set(0, "@markup.heading.3.marker.markdown", md_heading)
set(0, "@markup.heading.4.marker.markdown", md_heading)
set(0, "@markup.heading.5.marker.markdown", md_heading)
set(0, "@markup.heading.6.marker.markdown", md_heading)

set(0, "@diff.plus",  { ctermfg = green })
set(0, "@diff.minus", { ctermfg = red })
set(0, "@diff.delta", { ctermfg = orange })

set(0, "@tag",           plain)
set(0, "@tag.attribute", plain)
set(0, "@tag.delimiter", plain)

set(0, "@conceal",          muted)
set(0, "@conceal.markdown", muted)

-- ─── Legacy Treesitter ──────────────────────────────────────────────────────
set(0, "@text",                   plain)
set(0, "@text.danger",            { ctermfg = red })
set(0, "@text.diff.add",          { ctermfg = green })
set(0, "@text.diff.delete",       { ctermfg = red })
set(0, "@text.emphasis",          { italic = true })
set(0, "@text.environment",       plain)
set(0, "@text.environment.name",  plain)
set(0, "@text.math",              plain)
set(0, "@text.note",              comment)
set(0, "@text.strike",            { strikethrough = true })
set(0, "@text.strong",            { bold = true })
set(0, "@text.title",             md_heading)
set(0, "@text.underline",         { underline = true })
set(0, "@text.uri",               { ctermfg = fg, underline = true })
set(0, "@text.warning",           { ctermfg = orange })
set(0, "@todo",                   { link = "Todo" })

set(0, "@text.title.1.markdown",          { link = "markdownH1" })
set(0, "@text.title.1.marker.markdown",   { link = "markdownH1Delimiter" })
set(0, "@text.title.2.markdown",          { link = "markdownH2" })
set(0, "@text.title.2.marker.markdown",   { link = "markdownH2Delimiter" })
set(0, "@text.title.3.markdown",          { link = "markdownH3" })
set(0, "@text.title.3.marker.markdown",   { link = "markdownH3Delimiter" })
set(0, "@text.title.4.markdown",          { link = "markdownH4" })
set(0, "@text.title.4.marker.markdown",   { link = "markdownH4Delimiter" })
set(0, "@text.title.5.markdown",          { link = "markdownH5" })
set(0, "@text.title.5.marker.markdown",   { link = "markdownH5Delimiter" })
set(0, "@text.title.6.markdown",          { link = "markdownH6" })
set(0, "@text.title.6.marker.markdown",   { link = "markdownH6Delimiter" })

set(0, "@attribute.diff", { ctermfg = green })
set(0, "@class",          plain)
set(0, "@conditional",    plain)
set(0, "@field",          plain)
set(0, "@include",        plain)
set(0, "@interface",      plain)
set(0, "@macro",          plain)
set(0, "@method",         plain)
set(0, "@namespace",      plain)
set(0, "@parameter",      plain)
set(0, "@preproc",        plain)
set(0, "@punctuation",    plain)
set(0, "@regexp",         str)
set(0, "@repeat",         plain)
set(0, "@storageclass",   plain)
set(0, "@symbol",         plain)

-- ─── LSP semantic tokens ────────────────────────────────────────────────────
set(0, "@lsp.type.comment",              {})
set(0, "@lsp.type.comment.c",            comment)
set(0, "@lsp.type.comment.cpp",          comment)
set(0, "@lsp.type.enum",                 plain)
set(0, "@lsp.type.interface",            plain)
set(0, "@lsp.type.keyword",              plain)
set(0, "@lsp.type.namespace",            plain)
set(0, "@lsp.type.namespace.python",     plain)
set(0, "@lsp.type.parameter",            plain)
set(0, "@lsp.type.property",             plain)
set(0, "@lsp.type.string",               str)
set(0, "@lsp.type.variable",             {})
set(0, "@lsp.type.variable.svelte",      plain)

set(0, "@lsp.typemod.function.defaultLibrary", plain)
set(0, "@lsp.typemod.operator.injected",       plain)
set(0, "@lsp.typemod.string.injected",         str)
set(0, "@lsp.typemod.variable.constant",       plain)
set(0, "@lsp.typemod.variable.defaultLibrary", plain)
set(0, "@lsp.typemod.variable.injected",       plain)

-- ─── Markdown (vim syntax) ──────────────────────────────────────────────────
set(0, "markdownH1", md_heading)
set(0, "markdownH2", md_heading)
set(0, "markdownH3", md_heading)
set(0, "markdownH4", md_heading)
set(0, "markdownH5", md_heading)
set(0, "markdownH6", md_heading)

set(0, "markdownH1Delimiter", md_heading)
set(0, "markdownH2Delimiter", md_heading)
set(0, "markdownH3Delimiter", md_heading)
set(0, "markdownH4Delimiter", md_heading)
set(0, "markdownH5Delimiter", md_heading)
set(0, "markdownH6Delimiter", md_heading)

set(0, "markdownHeadingRule", md_heading)

set(0, "markdownCode",          str)
set(0, "markdownCodeBlock",     str)
set(0, "markdownCodeDelimiter", str)

set(0, "markdownItalic",     { ctermfg = fg, italic = true })
set(0, "markdownBold",       { ctermfg = fg, bold = true })
set(0, "markdownBoldItalic", { ctermfg = fg, bold = true, italic = true })

set(0, "markdownItalicDelimiter", plain)
set(0, "markdownBoldDelimiter",   plain)

set(0, "markdownBlockquote",          plain)
set(0, "markdownListMarker",          plain)
set(0, "markdownOrderedListMarker",   plain)
set(0, "markdownRule",                plain)

set(0, "markdownLinkText",            plain)
set(0, "markdownUrl",                 { ctermfg = blue, underline = true })
set(0, "markdownId",                  plain)
set(0, "markdownIdDeclaration",       plain)
set(0, "markdownIdDelimiter",         plain)

set(0, "markdownLinkDelimiter",       plain)
set(0, "markdownLinkTextDelimiter",   plain)
set(0, "markdownAutomaticLink",       { ctermfg = fg, underline = true })

set(0, "markdownEscape",              plain)
set(0, "markdownError",               plain)

set(0, "mkdCode",          str)
set(0, "mkdCodeDelimiter", str)
set(0, "mkdCodeStart",     str)
set(0, "mkdCodeEnd",       str)
set(0, "mkdInlineURL",     { ctermfg = blue, underline = true })
set(0, "mkdLink",          { ctermfg = blue, underline = true })
set(0, "mkdURL",           { ctermfg = blue, underline = true })
set(0, "mkdListItemLine",  plain)
set(0, "mkdRule",          plain)

-- ─── Oil.nvim ───────────────────────────────────────────────────────────────
set(0, "OilDir",     { ctermfg = blue, bold = true })

-- ─── gitsigns.nvim ──────────────────────────────────────────────────────────
set(0, "GitSignsAdd",    { ctermfg = green,  ctermbg = bg })
set(0, "GitSignsChange", { ctermfg = orange, ctermbg = bg })
set(0, "GitSignsDelete", { ctermfg = red,    ctermbg = bg })
set(0, "SignAdd",        { ctermfg = green,  ctermbg = bg })
set(0, "SignChange",     { ctermfg = orange, ctermbg = bg })
set(0, "SignDelete",     { ctermfg = red,    ctermbg = bg })

-- ─── indent-blankline.nvim ──────────────────────────────────────────────────
set(0, "IblIndent",    { ctermfg = bg_subtle })
set(0, "IblScope",     muted)
set(0, "IblWhitespace", { ctermfg = bg_subtle })

set(0, "IndentBlanklineChar",               { ctermfg = bg_subtle, nocombine = true })
set(0, "IndentBlanklineSpaceChar",          { ctermfg = bg_subtle, nocombine = true })
set(0, "IndentBlanklineSpaceCharBlankline", { ctermfg = bg_subtle, nocombine = true })

-- ─── telescope.nvim ─────────────────────────────────────────────────────────
set(0, "TelescopeNormal",         { ctermfg = fg, ctermbg = bg })
set(0, "TelescopePromptNormal",   { ctermfg = fg, ctermbg = bg })
set(0, "TelescopeBorder",         { ctermfg = fg_muted, ctermbg = bg })
set(0, "TelescopePromptBorder",   { link = "TelescopeBorder" })
set(0, "TelescopeResultsBorder",  { link = "TelescopeBorder" })
set(0, "TelescopePreviewBorder",  { link = "TelescopeBorder" })
set(0, "TelescopeTitle",          { ctermfg = fg, ctermbg = bg, bold = true })
set(0, "TelescopeSelection",      { ctermfg = fg, ctermbg = bg_subtle, bold = true })
set(0, "TelescopeSelectionCaret", { ctermfg = red, ctermbg = bg_subtle })
set(0, "TelescopeMatching",       { ctermfg = fg, bold = true })
set(0, "TelescopePromptPrefix",   muted)

-- ─── TreesitterContext ──────────────────────────────────────────────────────
set(0, "TreesitterContext",            { ctermbg = bg_subtle })
set(0, "TreesitterContextLineNumber",  { ctermfg = fg_muted, ctermbg = bg_subtle })
set(0, "TreesitterContextSeparator",   { ctermfg = fg_muted })

-- ─── nvim-tree.lua ──────────────────────────────────────────────────────────
set(0, "NvimTreeNormal",             { link = "Normal" })
set(0, "NvimTreeFolderName",         str)
set(0, "NvimTreeFolderIcon",         str)
set(0, "NvimTreeOpenedFolderName",   str)
set(0, "NvimTreeRootFolder",         { ctermfg = green, bold = true })
set(0, "NvimTreeEmptyFolderName",    muted)
set(0, "NvimTreeSymlink",            plain)
set(0, "NvimTreeExecFile",           plain)
set(0, "NvimTreeImageFile",          plain)
set(0, "NvimTreeSpecialFile",        plain)
set(0, "NvimTreeFileNew",            { ctermfg = green })
set(0, "NvimTreeFileDeleted",        { ctermfg = red })
set(0, "NvimTreeFileDirty",          { ctermfg = orange })
set(0, "NvimTreeFileMerge",          { ctermfg = orange })
set(0, "NvimTreeGitDirty",           { ctermfg = orange })
set(0, "NvimTreeGitNew",             { ctermfg = green })
set(0, "NvimTreeGitDeleted",         { ctermfg = red })
set(0, "NvimTreeGitIgnored",         muted)
set(0, "NvimTreeGitMerge",           { ctermfg = orange })
set(0, "NvimTreeGitRenamed",         { ctermfg = orange })
set(0, "NvimTreeGitStaged",          { ctermfg = green })

-- ─── nvim-cmp ───────────────────────────────────────────────────────────────
set(0, "CmpItemAbbr",            plain)
set(0, "CmpItemAbbrDeprecated",  { ctermfg = fg_muted, strikethrough = true })
set(0, "CmpItemAbbrMatch",       { ctermfg = fg, bold = true })
set(0, "CmpItemAbbrMatchFuzzy",  { ctermfg = fg, bold = true })
set(0, "CmpItemKind",            muted)
set(0, "CmpItemKindClass",       plain)
set(0, "CmpItemKindFunction",    plain)
set(0, "CmpItemKindInterface",   plain)
set(0, "CmpItemKindMethod",      plain)
set(0, "CmpItemKindSnippet",     str)
set(0, "CmpItemKindVariable",    plain)
set(0, "CmpItemMenu",            muted)

-- ─── which-key.nvim ─────────────────────────────────────────────────────────
set(0, "WhichKey",           plain)
set(0, "WhichKeyDesc",       plain)
set(0, "WhichKeyGroup",      comment)
set(0, "WhichKeyFloat",      { ctermbg = bg_float })
set(0, "WhichKeyNormal",     { link = "NormalFloat" })
set(0, "WhichKeySeparator",  muted)
set(0, "WhichKeyValue",      muted)
set(0, "WhichKeyBorder",     { link = "FloatBorder" })
set(0, "WhichKeyTitle",      { link = "FloatTitle" })

-- ─── Terminal colors ────────────────────────────────────────────────────────
vim.g.terminal_color_0  = 0
vim.g.terminal_color_8  = 8
vim.g.terminal_color_1  = 1
vim.g.terminal_color_9  = 9
vim.g.terminal_color_2  = 2
vim.g.terminal_color_10 = 10
vim.g.terminal_color_3  = 3
vim.g.terminal_color_11 = 11
vim.g.terminal_color_4  = 4
vim.g.terminal_color_12 = 12
vim.g.terminal_color_5  = 5
vim.g.terminal_color_13 = 13
vim.g.terminal_color_6  = 6
vim.g.terminal_color_14 = 14
vim.g.terminal_color_7  = 7
vim.g.terminal_color_15 = 15
