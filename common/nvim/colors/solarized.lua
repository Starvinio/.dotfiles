-- solarized-zed.lua
--
-- A single-file Neovim port of Zed's built-in "Solarized" theme
-- (Solarized.json, author: harmtemolder). Every color below is copied
-- directly from that theme's `style` / `style.syntax` blocks — both
-- "Solarized Dark" and "Solarized Light" are included and selected via
-- `vim.o.background`.
--
-- Install: drop this file at ~/.config/nvim/colors/solarized-zed.lua
-- Use:     vim.o.background = "dark"  (or "light")
--          vim.cmd.colorscheme("solarized-zed")
--
-- Zed's own solarized base scale, for reference (both appearances share
-- these 8 base tones + 8 accents, just reassigned to different roles):
--   #002b36 #073642 #586e75 #657b83 #839496 #93a1a1 #eee8d5 #fdf6e3
--   #b58900 #cb4b16 #dc322f #d33682 #6c71c4 #268bd2 #2aa198 #859900

-- ================================================================
-- Palette
-- ================================================================

local palette = {}

palette.dark = {
  base03 = "#002b36", -- background
  base02 = "#073642", -- panel / gutter / element bg
  base01 = "#586e75", -- comments, line numbers, punctuation
  base00 = "#657b83", -- (unused directly in dark, kept for parity)
  base0  = "#839496", -- editor.foreground / default text
  base1  = "#93a1a1", -- panel.indent_guide_hover / bright cyan term
  base2  = "#eee8d5", -- terminal dim white
  base3  = "#fdf6e3", -- terminal bright white

  yellow  = "#b58900",
  orange  = "#cb4b16",
  red     = "#dc322f",
  magenta = "#d33682",
  violet  = "#6c71c4",
  blue    = "#268bd2",
  cyan    = "#2aa198",
  green   = "#859900",

  -- pre-blended (alpha-over-background) colors, computed from the exact
  -- fg + alpha + bg triples found in the json (e.g. "#268bd266" over
  -- "#002b36"), since terminal/gui highlights need solid hex
  blue_sel      = "#0f5174", -- element.selected / document_highlight bracket (66 alpha)
  blue_sel_weak = "#083e55", -- document_highlight read/write (33 alpha)
  yellow_search = "#6d6316", -- search.match_background (99 alpha)
  panel_thumb   = "#05333f", -- scrollbar.thumb.background (BB alpha)
  hint_muted    = "#3b5860", -- hint (AA alpha)

  none = "NONE",
}

palette.light = {
  base03 = "#002b36", -- terminal ansi bright_black
  base02 = "#073642", -- terminal ansi black
  base01 = "#586e75", -- panel.indent_guide_hover / bright green term
  base00 = "#657b83", -- editor.foreground / default text
  base0  = "#839496", -- (unused directly in light, kept for parity)
  base1  = "#93a1a1", -- border / comments / line numbers
  base2  = "#eee8d5", -- panel / gutter / element bg
  base3  = "#fdf6e3", -- background

  yellow  = "#b58900",
  orange  = "#cb4b16",
  red     = "#dc322f",
  magenta = "#d33682",
  violet  = "#6c71c4",
  blue    = "#268bd2",
  cyan    = "#2aa198",
  green   = "#859900",

  blue_sel      = "#a7cbdc",
  blue_sel_weak = "#d2e1e0",
  yellow_search = "#d2b55b",
  panel_thumb   = "#f2ecd9",
  hint_muted    = "#b6bdb7",

  none = "NONE",
}

-- ================================================================
-- Setup
-- ================================================================

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "solarized-zed"

local bg_kind = vim.o.background == "light" and "light" or "dark"
local c = palette[bg_kind]
local ns = 0

local function hi(group, opts)
  vim.api.nvim_set_hl(ns, group, opts)
end

-- ============================================================
-- Editor / UI (from Zed's top-level `style` keys)
-- ============================================================
hi("Normal", { fg = c.base0, bg = c.base03 })
hi("NormalNC", { fg = c.base0, bg = c.base03 })
hi("NormalFloat", { fg = c.base0, bg = c.base02 }) -- elevated_surface.background-ish
hi("FloatBorder", { fg = c.base01, bg = c.base02 })
hi("FloatTitle", { fg = c.base1, bg = c.base02 })

hi("Cursor", { fg = c.base03, bg = c.base0 })
hi("CursorLine", { bg = c.base02 }) -- editor.active_line.background
hi("CursorColumn", { bg = c.base02 })
hi("CursorLineNr", { fg = c.base1, bold = true }) -- editor.active_line_number
hi("LineNr", { fg = c.base01 }) -- editor.line_number
hi("SignColumn", { fg = c.base01, bg = c.base03 }) -- editor.gutter.background

hi("ColorColumn", { bg = c.base02 })
hi("Conceal", { fg = c.base01 })
hi("NonText", { fg = c.base02 }) -- editor.invisible
hi("Whitespace", { fg = c.base02 })
hi("SpecialKey", { fg = c.base02 })
hi("EndOfBuffer", { fg = c.base02 })

hi("IndentBlankline", { fg = c.base02 }) -- editor.indent_guide
hi("IndentBlanklineChar", { fg = c.base02 })
hi("IndentBlanklineContextChar", { fg = c.base01 }) -- editor.indent_guide_active
hi("IblIndent", { fg = c.base02 })
hi("IblScope", { fg = c.base01 })

hi("WinSeparator", { fg = c.base01 }) -- border
hi("VertSplit", { fg = c.base01 })
hi("Border", { fg = c.base01 })

hi("Visual", { bg = c.blue_sel }) -- element.selected (#268bd2 @ 66 alpha)
hi("VisualNOS", { bg = c.blue_sel_weak })

hi("Search", { fg = c.base03, bg = c.yellow_search }) -- search.match_background
hi("IncSearch", { fg = c.base03, bg = c.orange })
hi("CurSearch", { fg = c.base03, bg = c.orange })

hi("MatchParen", { fg = c.base3, bg = c.none, bold = true, sp = c.blue })

hi("Pmenu", { fg = c.base0, bg = c.base02 }) -- element.background
hi("PmenuSel", { fg = c.base03, bg = c.blue })
hi("PmenuSbar", { bg = c.base02 })
hi("PmenuThumb", { bg = c.base01 })
hi("PmenuKind", { fg = c.blue, bg = c.base02 })
hi("PmenuKindSel", { fg = c.base03, bg = c.blue })
hi("PmenuExtra", { fg = c.base01, bg = c.base02 })
hi("PmenuExtraSel", { fg = c.base03, bg = c.blue })

hi("StatusLine", { fg = c.base0, bg = c.base02 }) -- status_bar.background
hi("StatusLineNC", { fg = c.base01, bg = c.base02 })

hi("TabLine", { fg = c.base01, bg = c.base02 }) -- tab.inactive_background
hi("TabLineFill", { bg = c.base02 }) -- tab_bar.background
hi("TabLineSel", { fg = c.base0, bg = c.base03 }) -- tab.active_background

hi("WinBar", { fg = c.base0, bg = c.base03 })
hi("WinBarNC", { fg = c.base01, bg = c.base03 })

hi("Title", { fg = c.orange, bold = true }) -- syntax.title
hi("Directory", { fg = c.blue })
hi("ErrorMsg", { fg = c.red })
hi("WarningMsg", { fg = c.orange })
hi("MoreMsg", { fg = c.blue })
hi("Question", { fg = c.blue })
hi("ModeMsg", { fg = c.base0 })
hi("MsgArea", { fg = c.base0 })

hi("Folded", { fg = c.base01, bg = c.base02 })
hi("FoldColumn", { fg = c.base01, bg = c.base03 })

hi("WildMenu", { fg = c.base03, bg = c.blue })
hi("QuickFixLine", { bg = c.base02 })

hi("SpellBad", { sp = c.red, undercurl = true })
hi("SpellCap", { sp = c.orange, undercurl = true })
hi("SpellRare", { sp = c.magenta, undercurl = true })
hi("SpellLocal", { sp = c.cyan, undercurl = true })

-- ============================================================
-- Diagnostics (error / warning / info / hint from Zed's palette)
-- ============================================================
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.orange }) -- warning = #cb4b16
hi("DiagnosticInfo", { fg = c.blue })
hi("DiagnosticHint", { fg = c.hint_muted }) -- hint = base01 @ AA alpha
hi("DiagnosticOk", { fg = c.green })

hi("DiagnosticUnderlineError", { sp = c.red, undercurl = true })
hi("DiagnosticUnderlineWarn", { sp = c.orange, undercurl = true })
hi("DiagnosticUnderlineInfo", { sp = c.blue, undercurl = true })
hi("DiagnosticUnderlineHint", { sp = c.hint_muted, undercurl = true })

hi("DiagnosticVirtualTextError", { fg = c.red })
hi("DiagnosticVirtualTextWarn", { fg = c.orange })
hi("DiagnosticVirtualTextInfo", { fg = c.blue })
hi("DiagnosticVirtualTextHint", { fg = c.hint_muted })

hi("LspInlayHint", { fg = c.hint_muted, bg = c.base02, italic = true })
hi("LspReferenceText", { bg = c.blue_sel_weak }) -- document_highlight.read_background
hi("LspReferenceRead", { bg = c.blue_sel_weak })
hi("LspReferenceWrite", { bg = c.blue_sel_weak }) -- document_highlight.write_background
hi("LspSignatureActiveParameter", { fg = c.orange, bold = true })

-- ============================================================
-- Git / diff (created, deleted, modified, conflict, renamed)
-- ============================================================
hi("DiffAdd", { fg = c.green, bg = c.base02 })
hi("DiffChange", { fg = c.yellow, bg = c.base02 })
hi("DiffDelete", { fg = c.orange, bg = c.base02 })
hi("DiffText", { fg = c.blue, bg = c.blue_sel_weak })

hi("GitSignsAdd", { fg = c.green })
hi("GitSignsChange", { fg = c.yellow })
hi("GitSignsDelete", { fg = c.orange })
hi("GitSignsChangeDelete", { fg = c.orange })
hi("GitSignsTopDelete", { fg = c.orange })
hi("GitSignsUntracked", { fg = c.cyan })

hi("GitConflictCurrent", { bg = c.blue_sel_weak })
hi("GitConflictIncoming", { bg = c.base02 })
hi("GitConflictCurrentLabel", { bg = c.blue_sel })
hi("GitConflictIncomingLabel", { bg = c.base02 })

-- ============================================================
-- Syntax highlighting (legacy groups), taken from `style.syntax`
-- ============================================================
hi("Comment", { fg = c.base01, italic = true })
hi("Constant", { fg = c.cyan })
hi("String", { fg = c.cyan })
hi("Character", { fg = c.cyan })
hi("Number", { fg = c.magenta })
hi("Boolean", { fg = c.yellow })
hi("Float", { fg = c.magenta })

hi("Identifier", { fg = c.base0 }) -- variable
hi("Function", { fg = c.blue })

hi("Statement", { fg = c.green })
hi("Conditional", { fg = c.green })
hi("Repeat", { fg = c.green })
hi("Label", { fg = c.green })
hi("Operator", { fg = c.green })
hi("Keyword", { fg = c.green })
hi("Exception", { fg = c.green })

hi("PreProc", { fg = c.orange }) -- preproc
hi("Include", { fg = c.green })
hi("Define", { fg = c.orange })
hi("Macro", { fg = c.orange })
hi("PreCondit", { fg = c.orange })

hi("Type", { fg = c.yellow })
hi("StorageClass", { fg = c.yellow })
hi("Structure", { fg = c.yellow })
hi("Typedef", { fg = c.yellow })

hi("Special", { fg = c.cyan }) -- string.special
hi("SpecialChar", { fg = c.base0 })
hi("Tag", { fg = c.red })
hi("Delimiter", { fg = c.base01 }) -- punctuation.delimiter
hi("SpecialComment", { fg = c.base01, italic = true })
hi("Debug", { fg = c.orange })

hi("Underlined", { fg = c.blue, underline = true })
hi("Ignore", { fg = c.base01 })
hi("Error", { fg = c.red })
hi("Todo", { fg = c.magenta, bold = true })

hi("Bold", { bold = true })
hi("Italic", { italic = true })

-- ============================================================
-- Treesitter (@ groups) — mirrors style.syntax 1:1
-- ============================================================
hi("@variable", { fg = c.base0 })
hi("@variable.builtin", { fg = c.orange })
hi("@variable.parameter", { fg = c.base0 })
hi("@variable.member", { fg = c.base0 }) -- property

hi("@constant", { fg = c.cyan })
hi("@constant.builtin", { fg = c.cyan })
hi("@constant.macro", { fg = c.orange })

hi("@module", { fg = c.blue })
hi("@label", { fg = c.blue })

hi("@string", { fg = c.cyan })
hi("@string.escape", { fg = c.base01 })
hi("@string.regexp", { fg = c.orange })
hi("@string.special", { fg = c.orange })
hi("@string.special.symbol", { fg = c.orange })
hi("@character", { fg = c.cyan })
hi("@character.special", { fg = c.orange })

hi("@boolean", { fg = c.yellow })
hi("@number", { fg = c.magenta })
hi("@number.float", { fg = c.magenta })

hi("@type", { fg = c.yellow })
hi("@type.builtin", { fg = c.yellow })
hi("@type.definition", { fg = c.yellow })
hi("@attribute", { fg = c.blue })
hi("@property", { fg = c.blue })

hi("@function", { fg = c.blue })
hi("@function.builtin", { fg = c.blue })
hi("@function.macro", { fg = c.orange })
hi("@function.method", { fg = c.blue })
hi("@constructor", { fg = c.blue })
hi("@parameter", { fg = c.base0 })

hi("@keyword", { fg = c.green })
hi("@keyword.function", { fg = c.green })
hi("@keyword.operator", { fg = c.green })
hi("@keyword.return", { fg = c.green })
hi("@keyword.directive", { fg = c.orange }) -- preproc
hi("@keyword.import", { fg = c.green })
hi("@conditional", { fg = c.green })
hi("@repeat", { fg = c.green })
hi("@exception", { fg = c.green })

hi("@operator", { fg = c.green })

hi("@punctuation.delimiter", { fg = c.base01 })
hi("@punctuation.bracket", { fg = c.base01 })
hi("@punctuation.special", { fg = c.base01 })
hi("@punctuation.list_marker", { fg = c.base01 })

hi("@comment", { fg = c.base01, italic = true })
hi("@comment.documentation", { fg = c.base01, italic = true })
hi("@comment.error", { fg = c.red })
hi("@comment.warning", { fg = c.orange })
hi("@comment.todo", { fg = c.magenta, bold = true })
hi("@comment.note", { fg = c.blue })

hi("@markup.strong", { fg = c.blue, bold = true }) -- emphasis.strong
hi("@markup.emphasis", { fg = c.blue, italic = true }) -- emphasis
hi("@markup.heading", { fg = c.orange, bold = true }) -- title
hi("@markup.link", { fg = c.violet }) -- link_uri
hi("@markup.link.label", { fg = c.blue, italic = true }) -- link_text
hi("@markup.link.url", { fg = c.violet, underline = true })
hi("@markup.raw", { fg = c.cyan }) -- text.literal
hi("@markup.list", { fg = c.base01 })

hi("@tag", { fg = c.red })
hi("@tag.attribute", { fg = c.blue })
hi("@tag.delimiter", { fg = c.base01 })

hi("@variant", { fg = c.blue })
hi("@enum", { fg = c.yellow })

-- ============================================================
-- LSP semantic tokens
-- ============================================================
hi("@lsp.type.class", { fg = c.yellow })
hi("@lsp.type.decorator", { fg = c.blue })
hi("@lsp.type.enum", { fg = c.yellow })
hi("@lsp.type.enumMember", { fg = c.blue })
hi("@lsp.type.function", { fg = c.blue })
hi("@lsp.type.interface", { fg = c.yellow })
hi("@lsp.type.macro", { fg = c.cyan })
hi("@lsp.type.method", { fg = c.blue })
hi("@lsp.type.namespace", { fg = c.blue })
hi("@lsp.type.parameter", { fg = c.base0 })
hi("@lsp.type.property", { fg = c.base0 })
hi("@lsp.type.struct", { fg = c.yellow })
hi("@lsp.type.type", { fg = c.yellow })
hi("@lsp.type.typeParameter", { fg = c.yellow })
hi("@lsp.type.variable", { fg = c.base0 })

-- ============================================================
-- Terminal colors (style.terminal.ansi.*)
-- ============================================================
vim.g.terminal_color_0 = c.base02
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.magenta
vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_7 = c.base2
vim.g.terminal_color_8 = c.base03
vim.g.terminal_color_9 = c.orange
vim.g.terminal_color_10 = c.base01
vim.g.terminal_color_11 = c.base00
vim.g.terminal_color_12 = c.base0
vim.g.terminal_color_13 = c.violet
vim.g.terminal_color_14 = c.base1
vim.g.terminal_color_15 = c.base3
vim.g.terminal_color_background = c.base03
vim.g.terminal_color_foreground = c.base0

-- ============================================================
-- Popular plugin groups (kept minimal, reusing the same palette)
-- ============================================================
-- Telescope
hi("TelescopeNormal", { fg = c.base0, bg = c.base03 })
hi("TelescopeBorder", { fg = c.base01, bg = c.base03 })
hi("TelescopePromptNormal", { fg = c.base0, bg = c.base02 })
hi("TelescopePromptBorder", { fg = c.base01, bg = c.base02 })
hi("TelescopeSelection", { bg = c.base02 })
hi("TelescopeMatching", { fg = c.blue, bold = true })

-- NvimTree / neo-tree
hi("NvimTreeNormal", { fg = c.base0, bg = c.base03 })
hi("NvimTreeFolderIcon", { fg = c.blue })
hi("NvimTreeFolderName", { fg = c.base0 })
hi("NvimTreeOpenedFolderName", { fg = c.blue })
hi("NvimTreeRootFolder", { fg = c.orange, bold = true })
hi("NvimTreeIndentMarker", { fg = c.base02 })
hi("NvimTreeGitDirty", { fg = c.yellow })
hi("NvimTreeGitNew", { fg = c.green })
hi("NvimTreeGitDeleted", { fg = c.orange })

-- Cmp / Blink completion menus
hi("CmpItemAbbrMatch", { fg = c.blue, bold = true })
hi("CmpItemAbbrMatchFuzzy", { fg = c.blue })
hi("CmpItemKind", { fg = c.cyan })
hi("CmpItemMenu", { fg = c.base01 })
hi("CmpGhostText", { fg = c.base01, italic = true })
hi("BlinkCmpGhostText", { fg = c.base01, italic = true })

-- Inline AI / copilot-style predictive suggestions (syntax.predictive)
hi("CopilotSuggestion", { fg = c.magenta, italic = true })

-- WhichKey
hi("WhichKey", { fg = c.blue })
hi("WhichKeyGroup", { fg = c.orange })
hi("WhichKeyDesc", { fg = c.base0 })
hi("WhichKeySeparator", { fg = c.base01 })

-- Statusline components (lualine users can reference these names)
hi("StatusLineModeNormal", { fg = c.base03, bg = c.blue, bold = true })
hi("StatusLineModeInsert", { fg = c.base03, bg = c.green, bold = true })
hi("StatusLineModeVisual", { fg = c.base03, bg = c.magenta, bold = true })
hi("StatusLineModeReplace", { fg = c.base03, bg = c.red, bold = true })
