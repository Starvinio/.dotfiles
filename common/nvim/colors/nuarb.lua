-- nuarb.lua
-- Minimal light colorscheme
-- Only strings and comments get a separate color; everything else is plain fg.

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "nuarb"
vim.opt.background = "light"
vim.opt.termguicolors = true

local set = vim.api.nvim_set_hl

-- ─── Palette ────────────────────────────────────────────────────────────────
local bg        = "#f5f5f5"
local bg_subtle = "#e9e9e9"
local bg_float  = "#d1d5da"
local fg        = "#24292f"
local fg_muted  = "#84898f"
local green     = "#116329"
local blue  	= "#3f5d9a"
local red       = "#b03030"
local orange    = "#a05010"
local visual    = "#c6d8ec"
local search    = "#f6a6df"
local cursearch = "#b64094"

-- ─── Reused specs ───────────────────────────────────────────────────────────
local plain      = { fg = fg }
local muted      = { fg = fg_muted }
local str        = { fg = green }
local comment    = { fg = blue }
local md_heading = { fg = green, bold = true }

-- ─── Editor chrome ──────────────────────────────────────────────────────────
set(0, "Normal",       { fg = fg, bg = bg })
set(0, "NormalFloat",  { fg = fg, bg = bg_float })
set(0, "NormalNC",     { fg = fg, bg = bg })

set(0, "ColorColumn",  { bg = bg_subtle })
set(0, "Conceal",      muted)
set(0, "CursorColumn", { bg = bg_subtle })

set(0, "CursorLine",   { bg = bg_subtle })
set(0, "CursorLineNr", { fg = fg_muted, bg = bg_subtle, bold = true })
set(0, "LineNr",       { fg = fg_muted, bg = bg })
set(0, "SignColumn",   { fg = fg_muted, bg = bg })

set(0, "Visual",       { bg = visual })
set(0, "VisualNOS",    { bg = visual })

set(0, "Search",       { fg = fg, bg = search })
set(0, "IncSearch",    { fg = bg, bg = cursearch, bold = true })
set(0, "CurSearch",    { fg = bg, bg = cursearch, bold = true })
set(0, "Substitute",   { link = "IncSearch" })

set(0, "StatusLine",     { fg = fg, bg = bg_float })
set(0, "StatusLineNC",   { fg = fg_muted, bg = bg })
set(0, "StatusLineTerm", { fg = bg, bg = fg })
set(0, "StatusLineTermNC", { fg = fg_muted, bg = bg_subtle })
set(0, "WinSeparator",   { fg = fg_muted, bg = bg })
set(0, "VertSplit",      { fg = fg_muted, bg = bg })
set(0, "WinBar",         { fg = fg, bg = bg_float })
set(0, "WinBarNC",       muted)

set(0, "Folded",       { fg = fg_muted, bg = bg_subtle })
set(0, "FoldColumn",   { fg = fg_muted, bg = bg })

set(0, "NonText",      muted)
set(0, "SpecialKey",   muted)
set(0, "Whitespace",   muted)
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

set(0, "Title",        { fg = fg, bold = true })
set(0, "Directory",    plain)
set(0, "FloatBorder",  { fg = fg_muted, bg = bg_float })
set(0, "FloatTitle",   { fg = fg, bg = bg_float, bold = true })

set(0, "ModeMsg",      muted)
set(0, "MoreMsg",      { fg = green })
set(0, "Question",     plain)
set(0, "QuickFixLine", { bg = bg_subtle })
set(0, "WildMenu",     { link = "IncSearch" })

set(0, "SpellBad",     { sp = red,      undercurl = true })
set(0, "SpellCap",     { sp = fg_muted, undercurl = true })
set(0, "SpellLocal",   { sp = fg_muted, undercurl = true })
set(0, "SpellRare",    { sp = fg_muted, undercurl = true })

-- ─── Diffs ──────────────────────────────────────────────────────────────────
set(0, "DiffAdd",       { fg = green,  bg = "#dff0e5" })
set(0, "DiffChange",    { fg = orange, bg = "#f5ead8" })
set(0, "DiffDelete",    { fg = red,    bg = "#f5d8d8" })
set(0, "DiffText",      { fg = fg,     bg = "#ede8aa", bold = true })
set(0, "diffAdded",     { link = "DiffAdd" })
set(0, "diffChanged",   { link = "DiffChange" })
set(0, "diffRemoved",   { link = "DiffDelete" })
set(0, "Added",         { fg = green })
set(0, "Changed",       { fg = orange })
set(0, "Removed",       { fg = red })

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
set(0, "Todo",         { fg = bg, bg = blue })

-- ─── Diagnostics & errors ───────────────────────────────────────────────────
set(0, "Error",      { fg = red })
set(0, "ErrorMsg",   { fg = red })
set(0, "WarningMsg", { fg = orange })

set(0, "healthError",   { fg = red })
set(0, "healthSuccess", { fg = green })
set(0, "healthWarning", { fg = orange })

set(0, "DiagnosticError", { fg = red })
set(0, "DiagnosticWarn",  { fg = orange })
set(0, "DiagnosticInfo",  { fg = fg_muted })
set(0, "DiagnosticHint",  { fg = fg_muted })
set(0, "DiagnosticOk",    { fg = green })

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

set(0, "DiagnosticVirtualTextError", { fg = red })
set(0, "DiagnosticVirtualTextWarn",  { fg = orange })
set(0, "DiagnosticVirtualTextInfo",  { fg = fg_muted })
set(0, "DiagnosticVirtualTextHint",  { fg = fg_muted })
set(0, "DiagnosticVirtualTextOk",    { fg = green })

set(0, "DiagnosticSignError", { fg = red,      })
set(0, "DiagnosticSignWarn",  { fg = orange,   })
set(0, "DiagnosticSignInfo",  { fg = fg_muted, })
set(0, "DiagnosticSignHint",  { fg = fg_muted, })
set(0, "DiagnosticSignOk",    { fg = green,    })

set(0, "DiagnosticUnderlineError", { sp = red,      undercurl = true })
set(0, "DiagnosticUnderlineWarn",  { sp = orange,   undercurl = true })
set(0, "DiagnosticUnderlineInfo",  { sp = fg_muted, underline = true })
set(0, "DiagnosticUnderlineHint",  { sp = fg_muted, underline = true })
set(0, "DiagnosticUnderlineOk",    { sp = green,    underline = true })

-- ─── LSP ────────────────────────────────────────────────────────────────────
set(0, "LspCodeLens",                 muted)
set(0, "LspCodeLensSeparator",        muted)
set(0, "LspInlayHint",                muted)
set(0, "LspReferenceRead",            { bg = bg_subtle })
set(0, "LspReferenceText",            { bg = bg_subtle })
set(0, "LspReferenceWrite",           { bg = bg_subtle, underline = true })
set(0, "LspSignatureActiveParameter", { bg = bg_subtle })

-- ─── Treesitter ─────────────────────────────────────────────────────────────
-- Variables
set(0, "@variable",                    plain)
set(0, "@variable.builtin",            plain)
set(0, "@variable.parameter",          plain)
set(0, "@variable.parameter.builtin",  plain)
set(0, "@variable.member",             plain)

-- Constants
set(0, "@constant",                    plain)
set(0, "@constant.builtin",            plain)
set(0, "@constant.macro",              plain)

-- Modules / labels
set(0, "@module",                      plain)
set(0, "@module.builtin",              plain)
set(0, "@label",                       plain)

-- Strings
set(0, "@string",                      str)
set(0, "@string.regexp",               str)
set(0, "@string.escape",               str)
set(0, "@string.special",              str)
set(0, "@string.special.symbol",       plain)
set(0, "@string.special.url",          { fg = fg, underline = true })

-- Characters & numbers
set(0, "@character",                   plain)
set(0, "@character.special",           plain)
set(0, "@boolean",                     plain)
set(0, "@number",                      plain)
set(0, "@number.float",                plain)
set(0, "@float",                       plain) -- legacy alias

-- Types
set(0, "@type",                        plain)
set(0, "@type.builtin",                plain)
set(0, "@type.definition",             plain)

-- Attributes & properties
set(0, "@attribute",                   plain)
set(0, "@attribute.builtin",           plain)
set(0, "@property",                    plain)

-- Functions
set(0, "@function",                    plain)
set(0, "@function.builtin",            plain)
set(0, "@function.call",               plain)
set(0, "@function.macro",              plain)
set(0, "@function.method",             plain)
set(0, "@function.method.call",        plain)

-- Constructors & operators
set(0, "@constructor",                 plain)
set(0, "@operator",                    plain)

-- Punctuation
set(0, "@punctuation.delimiter",       plain)
set(0, "@punctuation.bracket",         plain)
set(0, "@punctuation.special",         plain)

-- Keywords
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

-- Comments
set(0, "@comment",                comment)
set(0, "@comment.documentation",  comment)
set(0, "@comment.error",          { fg = red })
set(0, "@comment.warning",        { fg = orange })
set(0, "@comment.todo",           { fg = fg, bg = bg_subtle })
set(0, "@comment.hint",           muted)
set(0, "@comment.info",           muted)
set(0, "@comment.note",           comment)

-- Markup — generic (RST, AsciiDoc, etc.)
set(0, "@markup.strong",          { bold = true })
set(0, "@markup.italic",          { italic = true })
set(0, "@markup.strikethrough",   { strikethrough = true })
set(0, "@markup.underline",       { underline = true })
set(0, "@markup.quote",           plain)
set(0, "@markup.math",            plain)
set(0, "@markup.environment",     plain)
set(0, "@markup.environment.name", plain)

-- Markup links
set(0, "@markup.link",                       plain)
set(0, "@markup.link.markdown_inline",       plain)
set(0, "@markup.link.label.markdown_inline", plain)
set(0, "@markup.link.url",                   { fg = blue, underline = true })

-- Markup lists
set(0, "@markup.list",           plain)
set(0, "@markup.list.checked",   { fg = green })
set(0, "@markup.list.unchecked", plain)

-- Markup raw / code — blue, matching Comment
set(0, "@markup.raw",                    comment)
set(0, "@markup.raw.markdown_inline",    comment)
set(0, "@markup.raw.block",              comment)
set(0, "@markup.raw.delimiter.markdown", comment)

-- Markup headings — bold green, matching String
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

-- Diffs (treesitter)
set(0, "@diff.plus",  { fg = green })
set(0, "@diff.minus", { fg = red })
set(0, "@diff.delta", { fg = orange })

-- Tags (HTML, JSX, etc.)
set(0, "@tag",           plain)
set(0, "@tag.attribute", plain)
set(0, "@tag.delimiter", plain)

-- Conceal
set(0, "@conceal",          muted)
set(0, "@conceal.markdown", muted)

-- ─── Legacy Treesitter (Neovim < 0.9 / @text.* captures) ───────────────────
set(0, "@text",                   plain)
set(0, "@text.danger",            { fg = red })
set(0, "@text.diff.add",          { fg = green })
set(0, "@text.diff.delete",       { fg = red })
set(0, "@text.emphasis",          { italic = true })
set(0, "@text.environment",       plain)
set(0, "@text.environment.name",  plain)
set(0, "@text.math",              plain)
set(0, "@text.note",              comment)
set(0, "@text.strike",            { strikethrough = true })
set(0, "@text.strong",            { bold = true })
set(0, "@text.title",             md_heading)
set(0, "@text.underline",         { underline = true })
set(0, "@text.uri",               { fg = fg, underline = true })
set(0, "@text.warning",           { fg = orange })
set(0, "@todo",                   { link = "Todo" })

-- Legacy markdown heading links
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

-- Legacy node captures
set(0, "@attribute.diff", { fg = green })
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
-- Empty ({}) means "no override from LSP; defer to treesitter."
set(0, "@lsp.type.comment",              {})      -- defer to @comment
set(0, "@lsp.type.comment.c",            comment) -- clangd emits these explicitly
set(0, "@lsp.type.comment.cpp",          comment)
set(0, "@lsp.type.enum",                 plain)
set(0, "@lsp.type.interface",            plain)
set(0, "@lsp.type.keyword",              plain)
set(0, "@lsp.type.namespace",            plain)
set(0, "@lsp.type.namespace.python",     plain)
set(0, "@lsp.type.parameter",            plain)
set(0, "@lsp.type.property",             plain)
set(0, "@lsp.type.string",               str)
set(0, "@lsp.type.variable",             {})      -- defer to @variable
set(0, "@lsp.type.variable.svelte",      plain)

set(0, "@lsp.typemod.function.defaultLibrary", plain)
set(0, "@lsp.typemod.operator.injected",       plain)
set(0, "@lsp.typemod.string.injected",         str)
set(0, "@lsp.typemod.variable.constant",       plain)
set(0, "@lsp.typemod.variable.defaultLibrary", plain)
set(0, "@lsp.typemod.variable.injected",       plain)

-- ─── Markdown (vim syntax) ──────────────────────────────────────────────────

-- Headings
set(0, "markdownH1", md_heading)
set(0, "markdownH2", md_heading)
set(0, "markdownH3", md_heading)
set(0, "markdownH4", md_heading)
set(0, "markdownH5", md_heading)
set(0, "markdownH6", md_heading)

-- Heading markers (#)
set(0, "markdownH1Delimiter", md_heading)
set(0, "markdownH2Delimiter", md_heading)
set(0, "markdownH3Delimiter", md_heading)
set(0, "markdownH4Delimiter", md_heading)
set(0, "markdownH5Delimiter", md_heading)
set(0, "markdownH6Delimiter", md_heading)

-- Setext underlines (===, ---)
set(0, "markdownHeadingRule", md_heading)

-- Code
set(0, "markdownCode",          str)
set(0, "markdownCodeBlock",     str)
set(0, "markdownCodeDelimiter", str)

-- Emphasis
set(0, "markdownItalic",     { fg = fg, italic = true })
set(0, "markdownBold",       { fg = fg, bold = true })
set(0, "markdownBoldItalic", { fg = fg, bold = true, italic = true })

-- Delimiters (*, _, **, etc.)
set(0, "markdownItalicDelimiter", plain)
set(0, "markdownBoldDelimiter",   plain)

-- Everything else
set(0, "markdownBlockquote",          plain)
set(0, "markdownListMarker",          plain)
set(0, "markdownOrderedListMarker",   plain)
set(0, "markdownRule",                plain)

set(0, "markdownLinkText",            plain)
set(0, "markdownUrl",                 { fg = blue, underline = true })
set(0, "markdownId",                  plain)
set(0, "markdownIdDeclaration",       plain)
set(0, "markdownIdDelimiter",         plain)

set(0, "markdownLinkDelimiter",       plain)
set(0, "markdownLinkTextDelimiter",   plain)
set(0, "markdownAutomaticLink",       { fg = fg, underline = true })

set(0, "markdownEscape",              plain)
set(0, "markdownError",               plain)

-- mkd.vim (alternative markdown plugin)
set(0, "mkdCode",          str)
set(0, "mkdCodeDelimiter", str)
set(0, "mkdCodeStart",     str)
set(0, "mkdCodeEnd",       str)
set(0, "mkdInlineURL",     { fg = blue, underline = true })
set(0, "mkdLink",          { fg = blue, underline = true })
set(0, "mkdURL",           { fg = blue, underline = true })
set(0, "mkdListItemLine",  plain)
set(0, "mkdRule",          plain)

-- ─── Oil.nvim ───────────────────────────────────────────────────────────────
set(0, "OilDir",     { fg = blue, bold = true } )
--set(0, "OilDirIcon", str)

-- ─── gitsigns.nvim ──────────────────────────────────────────────────────────
set(0, "GitSignsAdd",    { fg = green,  bg = bg })
set(0, "GitSignsChange", { fg = orange, bg = bg })
set(0, "GitSignsDelete", { fg = red,    bg = bg })
set(0, "SignAdd",        { fg = green,  bg = bg })
set(0, "SignChange",     { fg = orange, bg = bg })
set(0, "SignDelete",     { fg = red,    bg = bg })

-- ─── indent-blankline.nvim ──────────────────────────────────────────────────
-- Modern (v3+)
set(0, "IblIndent",    { fg = bg_subtle })
set(0, "IblScope",     muted)
set(0, "IblWhitespace", { fg = bg_subtle })
-- Legacy (v2)
set(0, "IndentBlanklineChar",               { fg = bg_subtle, nocombine = true })
set(0, "IndentBlanklineSpaceChar",          { fg = bg_subtle, nocombine = true })
set(0, "IndentBlanklineSpaceCharBlankline", { fg = bg_subtle, nocombine = true })

-- ─── telescope.nvim ─────────────────────────────────────────────────────────
set(0, "TelescopeNormal",         { fg = fg, bg = bg })
set(0, "TelescopePromptNormal",   { fg = fg, bg = bg })
set(0, "TelescopeBorder",         { fg = fg_muted, bg = bg})
set(0, "TelescopePromptBorder",   { link = "TelescopeBorder" })
set(0, "TelescopeResultsBorder",  { link = "TelescopeBorder" })
set(0, "TelescopePreviewBorder",  { link = "TelescopeBorder" })
set(0, "TelescopeTitle",          { fg = fg, bg = bg, bold = true })
set(0, "TelescopeSelection",      { fg = fg, bg = bg_subtle, bold = true })
set(0, "TelescopeSelectionCaret", { fg = red, bg = bg_subtle })
set(0, "TelescopeMatching",       { fg = fg, bold = true })
set(0, "TelescopePromptPrefix",   muted)

-- ─── TreesitterContext ──────────────────────────────────────────────────────
set(0, "TreesitterContext",            { bg = bg_subtle })
set(0, "TreesitterContextLineNumber",  { fg = fg_muted, bg = bg_subtle })
set(0, "TreesitterContextSeparator",   { fg = fg_muted })

-- ─── nvim-tree.lua ──────────────────────────────────────────────────────────
set(0, "NvimTreeNormal",             { link = "Normal" })
set(0, "NvimTreeFolderName",         str)
set(0, "NvimTreeFolderIcon",         str)
set(0, "NvimTreeOpenedFolderName",   str)
set(0, "NvimTreeRootFolder",         { fg = green, bold = true })
set(0, "NvimTreeEmptyFolderName",    muted)
set(0, "NvimTreeSymlink",            plain)
set(0, "NvimTreeExecFile",           plain)
set(0, "NvimTreeImageFile",          plain)
set(0, "NvimTreeSpecialFile",        plain)
set(0, "NvimTreeFileNew",            { fg = green })
set(0, "NvimTreeFileDeleted",        { fg = red })
set(0, "NvimTreeFileDirty",          { fg = orange })
set(0, "NvimTreeFileMerge",          { fg = orange })
set(0, "NvimTreeGitDirty",           { fg = orange })
set(0, "NvimTreeGitNew",             { fg = green })
set(0, "NvimTreeGitDeleted",         { fg = red })
set(0, "NvimTreeGitIgnored",         muted)
set(0, "NvimTreeGitMerge",           { fg = orange })
set(0, "NvimTreeGitRenamed",         { fg = orange })
set(0, "NvimTreeGitStaged",          { fg = green })

-- ─── nvim-cmp ───────────────────────────────────────────────────────────────
set(0, "CmpItemAbbr",            plain)
set(0, "CmpItemAbbrDeprecated",  { fg = fg_muted, strikethrough = true })
set(0, "CmpItemAbbrMatch",       { fg = fg, bold = true })
set(0, "CmpItemAbbrMatchFuzzy",  { fg = fg, bold = true })
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
set(0, "WhichKeyFloat",      { bg = bg_float })
set(0, "WhichKeyNormal",     { link = "NormalFloat" })
set(0, "WhichKeySeparator",  muted)
set(0, "WhichKeyValue",      muted)
set(0, "WhichKeyBorder",     { link = "FloatBorder" })
set(0, "WhichKeyTitle",      { link = "FloatTitle" })

-- ─── Terminal colors ────────────────────────────────────────────────────────
vim.g.terminal_color_0  = fg        -- black  (use fg so terminal "black" is readable)
vim.g.terminal_color_8  = fg_muted  -- bright black / dark gray
vim.g.terminal_color_1  = red
vim.g.terminal_color_9  = red
vim.g.terminal_color_2  = green
vim.g.terminal_color_10 = green
vim.g.terminal_color_3  = orange    -- yellow → closest warm hue in palette
vim.g.terminal_color_11 = orange
vim.g.terminal_color_4  = blue  -- blue
vim.g.terminal_color_12 = blue
vim.g.terminal_color_5  = blue  -- magenta → no purple in palette; blue is closest
vim.g.terminal_color_13 = blue
vim.g.terminal_color_6  = green     -- cyan → no teal in palette; green is closest
vim.g.terminal_color_14 = green
vim.g.terminal_color_7  = bg        -- white (light background color)
vim.g.terminal_color_15 = bg_subtle -- bright white
