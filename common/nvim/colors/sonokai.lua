-- =============================================================================
-- Sonokai for Neovim (single-file Lua port)
-- Ported from https://github.com/sainnhe/sonokai (colors/sonokai.vim +
-- autoload/sonokai.vim) so it can live standalone at
-- ~/.config/nvim/colors/sonokai.lua with no plugin manager / runtime deps.
--
-- Original: Sainnhepark <i@sainnhe.dev> — MIT License
-- Port covers: all 6 palettes, all documented g:sonokai_* options, full UI
-- highlight groups, syntax groups, Treesitter (legacy TS* + modern @groups),
-- native LSP semantic tokens & diagnostics, terminal colors, and a curated
-- set of popular plugin integrations (see bottom section for the full list).
-- =============================================================================

vim.cmd('highlight clear')
if vim.fn.exists('syntax_on') == 1 then
  vim.cmd('syntax reset')
end
vim.g.colors_name = 'sonokai'
vim.o.termguicolors = true

-------------------------------------------------------------------------------
-- Configuration (mirrors every g:sonokai_* option from the original plugin)
-------------------------------------------------------------------------------
local function gopt(name, default)
  local v = vim.g['sonokai_' .. name]
  if v == nil then
    return default
  end
  return v
end

local config = {
  style                      = gopt('style', 'default'),
  colors_override            = gopt('colors_override', {}),
  transparent_background     = gopt('transparent_background', 0),
  dim_inactive_windows       = gopt('dim_inactive_windows', 0),
  disable_italic_comment     = gopt('disable_italic_comment', 0),
  enable_italic              = gopt('enable_italic', 0),
  cursor                     = gopt('cursor', ''),
  menu_selection_background  = gopt('menu_selection_background', 'blue'),
  spell_foreground           = gopt('spell_foreground', 'none'),
  show_eob                   = gopt('show_eob', 1),
  float_style                = gopt('float_style', 'bright'),
  inlay_hints_background     = gopt('inlay_hints_background', 'none'),
  diagnostic_text_highlight  = gopt('diagnostic_text_highlight', 0),
  diagnostic_line_highlight  = gopt('diagnostic_line_highlight', 0),
  diagnostic_virtual_text    = gopt('diagnostic_virtual_text', 'grey'),
  disable_terminal_colors    = gopt('disable_terminal_colors', 0),
}
config.current_word = gopt(
  'current_word',
  (config.transparent_background == 0) and 'grey background' or 'bold'
)

-------------------------------------------------------------------------------
-- Palettes ({ gui_hex, cterm_code } pairs, exactly as upstream)
-------------------------------------------------------------------------------
local palettes = {
  default = {
    black        = { '#181819', '232' },
    bg_dim       = { '#222327', '232' },
    bg0          = { '#2c2e34', '235' },
    bg1          = { '#33353f', '236' },
    bg2          = { '#363944', '236' },
    bg3          = { '#3b3e48', '237' },
    bg4          = { '#414550', '237' },
    bg_red       = { '#55393d', '52' },
    bg_yellow    = { '#4e432f', '94' },
    bg_green     = { '#394634', '22' },
    bg_blue      = { '#354157', '17' },
    bg_purple    = { '#434055', '54' },
    filled_red   = { '#ff6077', '203' },
    filled_green = { '#a7df78', '107' },
    filled_blue  = { '#85d3f2', '110' },
    fg           = { '#e2e2e3', '250' },
    red          = { '#fc5d7c', '203' },
    orange       = { '#f39660', '215' },
    yellow       = { '#e7c664', '179' },
    green        = { '#9ed072', '107' },
    blue         = { '#76cce0', '110' },
    purple       = { '#b39df3', '176' },
    grey         = { '#7f8490', '246' },
    grey_dim     = { '#595f6f', '240' },
  },
  shusia = {
    black        = { '#1a181a', '232' },
    bg_dim       = { '#211f21', '232' },
    bg0          = { '#2d2a2e', '235' },
    bg1          = { '#37343a', '236' },
    bg2          = { '#3b383e', '236' },
    bg3          = { '#423f46', '237' },
    bg4          = { '#49464e', '237' },
    bg_red       = { '#55393d', '52' },
    bg_yellow    = { '#4e432f', '94' },
    bg_green     = { '#394634', '22' },
    bg_blue      = { '#354157', '17' },
    bg_purple    = { '#433d51', '54' },
    filled_red   = { '#ff6188', '203' },
    filled_green = { '#a9dc76', '107' },
    filled_blue  = { '#78dce8', '110' },
    fg           = { '#e3e1e4', '250' },
    red          = { '#f85e84', '203' },
    orange       = { '#ef9062', '215' },
    yellow       = { '#e5c463', '179' },
    green        = { '#9ecd6f', '107' },
    blue         = { '#7accd7', '110' },
    purple       = { '#ab9df2', '176' },
    grey         = { '#848089', '246' },
    grey_dim     = { '#605d68', '240' },
  },
  andromeda = {
    black        = { '#181a1c', '232' },
    bg_dim       = { '#252630', '232' },
    bg0          = { '#2b2d3a', '235' },
    bg1          = { '#333648', '236' },
    bg2          = { '#363a4e', '236' },
    bg3          = { '#393e53', '237' },
    bg4          = { '#3f445b', '237' },
    bg_red       = { '#55393d', '52' },
    bg_yellow    = { '#4e432f', '94' },
    bg_green     = { '#394634', '22' },
    bg_blue      = { '#354157', '17' },
    bg_purple    = { '#423f59', '54' },
    filled_red   = { '#ff6188', '203' },
    filled_green = { '#a9dc76', '107' },
    filled_blue  = { '#77d5f0', '110' },
    fg           = { '#e1e3e4', '250' },
    red          = { '#fb617e', '203' },
    orange       = { '#f89860', '215' },
    yellow       = { '#edc763', '179' },
    green        = { '#9ed06c', '107' },
    blue         = { '#6dcae8', '110' },
    purple       = { '#bb97ee', '176' },
    grey         = { '#7e8294', '246' },
    grey_dim     = { '#5a5e7a', '240' },
  },
  atlantis = {
    black        = { '#181a1c', '232' },
    bg_dim       = { '#24272e', '232' },
    bg0          = { '#2a2f38', '235' },
    bg1          = { '#333846', '236' },
    bg2          = { '#373c4b', '236' },
    bg3          = { '#3d4455', '237' },
    bg4          = { '#424b5b', '237' },
    bg_red       = { '#55393d', '52' },
    bg_yellow    = { '#4e432f', '94' },
    bg_green     = { '#394634', '22' },
    bg_blue      = { '#354157', '17' },
    bg_purple    = { '#434058', '54' },
    filled_red   = { '#ff6d7e', '203' },
    filled_green = { '#a5e179', '107' },
    filled_blue  = { '#7ad5f1', '110' },
    fg           = { '#e1e3e4', '250' },
    red          = { '#ff6578', '203' },
    orange       = { '#f69c5e', '215' },
    yellow       = { '#eacb64', '179' },
    green        = { '#9dd274', '107' },
    blue         = { '#72cce8', '110' },
    purple       = { '#ba9cf3', '176' },
    grey         = { '#828a9a', '246' },
    grey_dim     = { '#5a6477', '240' },
  },
  maia = {
    black        = { '#1c1e1f', '232' },
    bg_dim       = { '#21282c', '232' },
    bg0          = { '#273136', '235' },
    bg1          = { '#313b42', '236' },
    bg2          = { '#353f46', '236' },
    bg3          = { '#3a444b', '237' },
    bg4          = { '#414b53', '237' },
    bg_red       = { '#55393d', '52' },
    bg_yellow    = { '#4e432f', '94' },
    bg_green     = { '#394634', '22' },
    bg_blue      = { '#354157', '17' },
    bg_purple    = { '#404256', '54' },
    filled_red   = { '#ff6d7e', '203' },
    filled_green = { '#a2e57b', '107' },
    filled_blue  = { '#7cd5f1', '110' },
    fg           = { '#e1e2e3', '250' },
    red          = { '#f76c7c', '203' },
    orange       = { '#f3a96a', '215' },
    yellow       = { '#e3d367', '179' },
    green        = { '#9cd57b', '107' },
    blue         = { '#78cee9', '110' },
    purple       = { '#baa0f8', '176' },
    grey         = { '#82878b', '246' },
    grey_dim     = { '#55626d', '240' },
  },
  espresso = {
    black        = { '#1f1e1c', '232' },
    bg_dim       = { '#242120', '232' },
    bg0          = { '#312c2b', '235' },
    bg1          = { '#393230', '236' },
    bg2          = { '#413937', '236' },
    bg3          = { '#49403c', '237' },
    bg4          = { '#4e433f', '237' },
    bg_red       = { '#55393d', '52' },
    bg_yellow    = { '#4e432f', '94' },
    bg_green     = { '#394634', '22' },
    bg_blue      = { '#354157', '17' },
    bg_purple    = { '#463e4f', '54' },
    filled_red   = { '#fd6883', '203' },
    filled_green = { '#adda78', '107' },
    filled_blue  = { '#85dad2', '110' },
    fg           = { '#e4e3e1', '250' },
    red          = { '#f86882', '203' },
    orange       = { '#f08d71', '215' },
    yellow       = { '#f0c66f', '179' },
    green        = { '#a6cd77', '107' },
    blue         = { '#81d0c9', '110' },
    purple       = { '#9fa0e1', '176' },
    grey         = { '#90817b', '246' },
    grey_dim     = { '#6a5e59', '240' },
  },
}

local raw = palettes[config.style] or palettes.default
for k, v in pairs(config.colors_override) do
  raw[k] = v
end

-- P[name] = { gui = '#rrggbb', cterm = NNN }
local P = {}
for name, v in pairs(raw) do
  P[name] = { gui = v[1], cterm = v[2] }
end
P.none = { gui = 'NONE', cterm = 'NONE' }

-------------------------------------------------------------------------------
-- Highlight helpers
-------------------------------------------------------------------------------

--- hi(group, fg, bg, attrs, sp)
--- fg/bg/sp are entries from P (or nil / P.none for "no color")
--- attrs is a comma-separated string, e.g. "bold,italic"
local function hi(group, fg, bg, attrs, sp)
  local o = {}
  if fg and fg ~= P.none then
    o.fg = fg.gui
    o.ctermfg = tonumber(fg.cterm)
  end
  if bg and bg ~= P.none then
    o.bg = bg.gui
    o.ctermbg = tonumber(bg.cterm)
  end
  if sp and sp ~= P.none then
    o.sp = sp.gui
  end
  if attrs and attrs ~= '' then
    for word in attrs:gmatch('[^,]+') do
      o[word] = true
    end
  end
  vim.api.nvim_set_hl(0, group, o)
end

local function link(group, target)
  vim.api.nvim_set_hl(0, group, { link = target })
end

local function clear(group)
  vim.api.nvim_set_hl(0, group, {})
end

-------------------------------------------------------------------------------
-- UI
-------------------------------------------------------------------------------
if config.transparent_background ~= 0 then
  hi('Normal', P.fg, P.none)
  hi('NormalNC', P.fg, P.none)
  hi('Terminal', P.fg, P.none)
  if config.show_eob ~= 0 then
    hi('EndOfBuffer', P.bg4, P.none)
  else
    hi('EndOfBuffer', P.bg0, P.none)
  end
  hi('Folded', P.grey, P.none)
  hi('ToolbarLine', P.fg, P.none)
  hi('FoldColumn', P.grey_dim, P.none)
else
  hi('Normal', P.fg, P.bg0)
  if config.dim_inactive_windows ~= 0 then
    hi('NormalNC', P.fg, P.bg_dim)
  else
    hi('NormalNC', P.fg, P.bg0)
  end
  hi('Terminal', P.fg, P.bg0)
  if config.show_eob ~= 0 then
    hi('EndOfBuffer', P.bg4, P.none)
  else
    hi('EndOfBuffer', P.bg0, P.none)
  end
  hi('Folded', P.grey, P.bg1)
  hi('ToolbarLine', P.fg, P.bg2)
  hi('FoldColumn', P.grey_dim, P.none)
end

hi('SignColumn', P.fg, P.none)
hi('IncSearch', P.bg0, P.filled_red)
hi('Search', P.bg0, P.filled_green)
link('CurSearch', 'IncSearch')

hi('ColorColumn', P.none, P.bg1)
hi('Conceal', P.grey_dim, P.none)

if config.cursor == 'auto' then
  hi('Cursor', P.none, P.none, 'reverse')
elseif config.cursor ~= '' then
  hi('Cursor', P.bg0, P[config.cursor])
end
link('vCursor', 'Cursor')
link('iCursor', 'Cursor')
link('lCursor', 'Cursor')
link('CursorIM', 'Cursor')

hi('CursorLine', P.none, P.bg1)
hi('CursorColumn', P.none, P.bg1)

hi('LineNr', P.grey_dim, P.none)
hi('CursorLineNr', P.fg, P.none)

hi('DiffAdd', P.none, P.bg_green)
hi('DiffChange', P.none, P.bg_blue)
hi('DiffDelete', P.none, P.bg_red)
hi('DiffText', P.bg0, P.blue)

hi('Directory', P.green, P.none)
hi('ErrorMsg', P.red, P.none, 'bold,underline')
hi('WarningMsg', P.yellow, P.none, 'bold')
hi('ModeMsg', P.fg, P.none, 'bold')
hi('MoreMsg', P.blue, P.none, 'bold')
hi('MatchParen', P.none, P.bg4)
hi('NonText', P.bg4, P.none)
hi('Whitespace', P.bg4, P.none)
hi('SpecialKey', P.purple, P.none)

hi('Pmenu', P.fg, P.bg2)
hi('PmenuSbar', P.none, P.bg2)
if config.menu_selection_background == 'blue' then
  hi('PmenuSel', P.bg0, P.filled_blue)
elseif config.menu_selection_background == 'green' then
  hi('PmenuSel', P.bg0, P.filled_green)
elseif config.menu_selection_background == 'red' then
  hi('PmenuSel', P.bg0, P.filled_red)
end
hi('PmenuKind', P.green, P.bg2)
hi('PmenuExtra', P.grey, P.bg2)
link('WildMenu', 'PmenuSel')
hi('PmenuThumb', P.none, P.grey)

if config.float_style == 'dim' then
  hi('NormalFloat', P.fg, P.bg_dim)
  hi('FloatBorder', P.grey, P.bg_dim)
  hi('FloatTitle', P.red, P.bg0, 'bold')
elseif config.float_style == 'blend' then
  if config.transparent_background ~= 0 then
    link('NormalFloat', 'Normal')
    link('FloatBorder', 'Grey')
    hi('FloatTitle', P.red, P.none, 'bold')
  else
    hi('NormalFloat', P.fg, P.bg0)
    hi('FloatBorder', P.grey, P.bg0)
    hi('FloatTitle', P.red, P.bg1, 'bold')
  end
else
  hi('NormalFloat', P.fg, P.bg2)
  hi('FloatBorder', P.grey, P.bg2)
  hi('FloatTitle', P.red, P.bg4, 'bold')
end

hi('Question', P.yellow, P.none)

if config.spell_foreground == 'none' then
  hi('SpellBad', P.none, P.none, 'undercurl', P.red)
  hi('SpellCap', P.none, P.none, 'undercurl', P.yellow)
  hi('SpellLocal', P.none, P.none, 'undercurl', P.blue)
  hi('SpellRare', P.none, P.none, 'undercurl', P.purple)
else
  hi('SpellBad', P.red, P.none, 'undercurl', P.red)
  hi('SpellCap', P.yellow, P.none, 'undercurl', P.yellow)
  hi('SpellLocal', P.blue, P.none, 'undercurl', P.blue)
  hi('SpellRare', P.purple, P.none, 'undercurl', P.purple)
end

if config.transparent_background == 2 then
  hi('StatusLine', P.fg, P.none)
  hi('StatusLineTerm', P.fg, P.none)
  hi('StatusLineNC', P.grey, P.none)
  hi('StatusLineTermNC', P.grey, P.none)
  hi('TabLine', P.fg, P.bg4)
  hi('TabLineFill', P.grey, P.none)
  hi('TabLineSel', P.bg0, P.filled_red)
  hi('WinBar', P.fg, P.none, 'bold')
  hi('WinBarNC', P.grey, P.none)
else
  hi('StatusLine', P.fg, P.bg3)
  hi('StatusLineTerm', P.fg, P.bg3)
  hi('StatusLineNC', P.grey, P.bg1)
  hi('StatusLineTermNC', P.grey, P.bg1)
  hi('TabLine', P.fg, P.bg4)
  hi('TabLineFill', P.grey, P.bg1)
  hi('TabLineSel', P.bg0, P.filled_red)
  hi('WinBar', P.fg, P.bg3, 'bold')
  hi('WinBarNC', P.grey, P.bg1)
end

if config.dim_inactive_windows ~= 0 then
  hi('VertSplit', P.bg4, P.bg_dim)
else
  hi('VertSplit', P.black, P.none)
end
link('WinSeparator', 'VertSplit')

hi('Visual', P.none, P.bg4)
hi('VisualNOS', P.none, P.bg4, 'underline')
hi('QuickFixLine', P.blue, P.none, 'bold')
hi('Debug', P.yellow, P.none)
hi('debugPC', P.bg0, P.green)
hi('debugBreakpoint', P.bg0, P.red)
hi('ToolbarButton', P.bg0, P.filled_blue)
hi('Substitute', P.bg0, P.yellow)

if config.diagnostic_text_highlight ~= 0 then
  hi('DiagnosticError', P.red, P.bg_red)
  hi('DiagnosticUnderlineError', P.none, P.bg_red, 'undercurl', P.red)
  hi('DiagnosticWarn', P.yellow, P.bg_yellow)
  hi('DiagnosticUnderlineWarn', P.none, P.bg_yellow, 'undercurl', P.yellow)
  hi('DiagnosticInfo', P.blue, P.bg_blue)
  hi('DiagnosticUnderlineInfo', P.none, P.bg_blue, 'undercurl', P.blue)
  hi('DiagnosticHint', P.purple, P.bg_purple)
  hi('DiagnosticUnderlineHint', P.none, P.bg_purple, 'undercurl', P.purple)
  hi('DiagnosticOk', P.green, P.bg_green)
  hi('DiagnosticUnderlineOk', P.none, P.bg_green, 'undercurl', P.green)
else
  hi('DiagnosticError', P.red, P.none)
  hi('DiagnosticUnderlineError', P.none, P.none, 'undercurl', P.red)
  hi('DiagnosticWarn', P.yellow, P.none)
  hi('DiagnosticUnderlineWarn', P.none, P.none, 'undercurl', P.yellow)
  hi('DiagnosticInfo', P.blue, P.none)
  hi('DiagnosticUnderlineInfo', P.none, P.none, 'undercurl', P.blue)
  hi('DiagnosticHint', P.purple, P.none)
  hi('DiagnosticUnderlineHint', P.none, P.none, 'undercurl', P.purple)
  hi('DiagnosticOk', P.green, P.none)
  hi('DiagnosticUnderlineOk', P.none, P.none, 'undercurl', P.green)
end
link('DiagnosticFloatingError', 'ErrorFloat')
link('DiagnosticFloatingWarn', 'WarningFloat')
link('DiagnosticFloatingInfo', 'InfoFloat')
link('DiagnosticFloatingHint', 'HintFloat')
link('DiagnosticFloatingOk', 'OkFloat')
link('DiagnosticVirtualTextError', 'VirtualTextError')
link('DiagnosticVirtualTextWarn', 'VirtualTextWarning')
link('DiagnosticVirtualTextInfo', 'VirtualTextInfo')
link('DiagnosticVirtualTextHint', 'VirtualTextHint')
link('DiagnosticVirtualTextOk', 'VirtualTextOk')
link('DiagnosticSignError', 'RedSign')
link('DiagnosticSignWarn', 'YellowSign')
link('DiagnosticSignInfo', 'BlueSign')
link('DiagnosticSignHint', 'PurpleSign')
link('DiagnosticSignOk', 'GreenSign')
link('LspReferenceText', 'CurrentWord')
link('LspReferenceRead', 'CurrentWord')
link('LspReferenceWrite', 'CurrentWord')
link('LspInlayHint', 'InlayHints')
link('LspCodeLens', 'VirtualTextInfo')
link('LspCodeLensSeparator', 'VirtualTextHint')
link('LspSignatureActiveParameter', 'Search')
link('TermCursor', 'Cursor')
link('healthError', 'Red')
link('healthSuccess', 'Green')
link('healthWarning', 'Yellow')

-------------------------------------------------------------------------------
-- Syntax
-------------------------------------------------------------------------------
if config.enable_italic ~= 0 then
  hi('Type', P.blue, P.none, 'italic')
  hi('Structure', P.blue, P.none, 'italic')
  hi('StorageClass', P.blue, P.none, 'italic')
  hi('Identifier', P.fg, P.none, 'italic')
  hi('Constant', P.fg, P.none, 'italic')
else
  hi('Type', P.blue, P.none)
  hi('Structure', P.blue, P.none)
  hi('StorageClass', P.blue, P.none)
  hi('Identifier', P.fg, P.none)
  hi('Constant', P.fg, P.none)
end
hi('PreProc', P.red, P.none)
hi('PreCondit', P.red, P.none)
hi('Include', P.red, P.none)
hi('Keyword', P.red, P.none)
hi('Define', P.red, P.none)
hi('Typedef', P.red, P.none)
hi('Exception', P.red, P.none)
hi('Conditional', P.red, P.none)
hi('Repeat', P.red, P.none)
hi('Statement', P.red, P.none)
hi('Macro', P.purple, P.none)
hi('Error', P.red, P.none)
hi('Label', P.purple, P.none)
hi('Special', P.purple, P.none)
hi('SpecialChar', P.purple, P.none)
hi('Boolean', P.purple, P.none)
hi('String', P.yellow, P.none)
hi('Character', P.yellow, P.none)
hi('Number', P.purple, P.none)
hi('Float', P.purple, P.none)
hi('Function', P.green, P.none)
hi('Operator', P.red, P.none)
hi('Title', P.red, P.none, 'bold')
hi('Tag', P.fg, P.none)
hi('Delimiter', P.fg, P.none)
hi('Todo', P.bg0, P.blue, 'bold')
hi('Comment', P.grey, P.none)
hi('SpecialComment', P.grey, P.none)
hi('Ignore', P.grey, P.none)
hi('Underlined', P.none, P.none, 'underline')

-------------------------------------------------------------------------------
-- Predefined Highlight Groups
-------------------------------------------------------------------------------
hi('Fg', P.fg, P.none)
hi('Grey', P.grey, P.none)
hi('Red', P.red, P.none)
hi('Orange', P.fg, P.none)
hi('Yellow', P.yellow, P.none)
hi('Green', P.green, P.none)
hi('Blue', P.blue, P.none)
hi('Purple', P.purple, P.none)

local italic_attr = (config.enable_italic ~= 0) and 'italic' or ''
hi('RedItalic', P.red, P.none, italic_attr)
hi('OrangeItalic', P.orange, P.none, italic_attr)
hi('YellowItalic', P.yellow, P.none, italic_attr)
hi('GreenItalic', P.green, P.none, italic_attr)
hi('BlueItalic', P.blue, P.none, italic_attr)
hi('PurpleItalic', P.purple, P.none, italic_attr)

hi('RedSign', P.red, P.none)
hi('OrangeSign', P.orange, P.none)
hi('YellowSign', P.yellow, P.none)
hi('GreenSign', P.green, P.none)
hi('BlueSign', P.blue, P.none)
hi('PurpleSign', P.purple, P.none)

link('Added', 'Green')
link('Removed', 'Red')
link('Changed', 'Blue')

if config.diagnostic_text_highlight ~= 0 then
  hi('ErrorText', P.none, P.bg_red, 'undercurl', P.red)
  hi('WarningText', P.none, P.bg_yellow, 'undercurl', P.yellow)
  hi('InfoText', P.none, P.bg_blue, 'undercurl', P.blue)
  hi('HintText', P.none, P.bg_purple, 'undercurl', P.purple)
else
  hi('ErrorText', P.none, P.none, 'undercurl', P.red)
  hi('WarningText', P.none, P.none, 'undercurl', P.yellow)
  hi('InfoText', P.none, P.none, 'undercurl', P.blue)
  hi('HintText', P.none, P.none, 'undercurl', P.purple)
end

if config.diagnostic_line_highlight ~= 0 then
  hi('ErrorLine', P.none, P.bg_red)
  hi('WarningLine', P.none, P.bg_yellow)
  hi('InfoLine', P.none, P.bg_blue)
  hi('HintLine', P.none, P.bg_purple)
else
  clear('ErrorLine')
  clear('WarningLine')
  clear('InfoLine')
  clear('HintLine')
end

if config.diagnostic_virtual_text == 'grey' then
  link('VirtualTextWarning', 'Grey')
  link('VirtualTextError', 'Grey')
  link('VirtualTextInfo', 'Grey')
  link('VirtualTextHint', 'Grey')
  link('VirtualTextOk', 'Grey')
elseif config.diagnostic_virtual_text == 'colored' then
  link('VirtualTextWarning', 'Yellow')
  link('VirtualTextError', 'Red')
  link('VirtualTextInfo', 'Blue')
  link('VirtualTextHint', 'Purple')
  link('VirtualTextOk', 'Green')
else
  hi('VirtualTextWarning', P.yellow, P.bg_yellow)
  hi('VirtualTextError', P.red, P.bg_red)
  hi('VirtualTextInfo', P.blue, P.bg_blue)
  hi('VirtualTextHint', P.purple, P.bg_purple)
  hi('VirtualTextOk', P.green, P.bg_green)
end

hi('ErrorFloat', P.red, P.none)
hi('WarningFloat', P.yellow, P.none)
hi('InfoFloat', P.blue, P.none)
hi('HintFloat', P.purple, P.none)
hi('OkFloat', P.green, P.none)

-- CurrentWord (the &diff-mode override from upstream is skipped here since
-- diff mode is a per-window runtime state, not a load-time constant)
if config.current_word == 'grey background' then
  hi('CurrentWord', P.none, P.bg2)
elseif config.current_word == 'high contrast background' then
  hi('CurrentWord', P.none, P.bg4)
else
  hi('CurrentWord', P.none, P.none, config.current_word)
end

if config.inlay_hints_background == 'none' then
  link('InlayHints', 'LineNr')
else
  hi('InlayHints', P.grey, P.bg_dim)
end

-- Used to color nvim-cmp / blink.cmp / nvim-navic kind icons
local lsp_kind_color = {
  { 'Array', 'Yellow' }, { 'Boolean', 'Yellow' }, { 'Class', 'Blue' },
  { 'Color', 'Yellow' }, { 'Constant', 'Orange' }, { 'Constructor', 'Green' },
  { 'Default', 'Yellow' }, { 'Enum', 'Blue' }, { 'EnumMember', 'Purple' },
  { 'Event', 'Yellow' }, { 'Field', 'Green' }, { 'File', 'Green' },
  { 'Folder', 'Yellow' }, { 'Function', 'Green' }, { 'Interface', 'Blue' },
  { 'Key', 'Red' }, { 'Keyword', 'Red' }, { 'Method', 'Green' },
  { 'Module', 'Blue' }, { 'Namespace', 'Red' }, { 'Null', 'Yellow' },
  { 'Number', 'Yellow' }, { 'Object', 'Yellow' }, { 'Operator', 'Red' },
  { 'Package', 'Red' }, { 'Property', 'Orange' }, { 'Reference', 'Yellow' },
  { 'Snippet', 'Yellow' }, { 'String', 'Yellow' }, { 'Struct', 'Blue' },
  { 'Text', 'Fg' }, { 'TypeParameter', 'Blue' }, { 'Unit', 'Purple' },
  { 'Value', 'Purple' }, { 'Variable', 'Orange' },
}

-------------------------------------------------------------------------------
-- Terminal colors
-------------------------------------------------------------------------------
if config.disable_terminal_colors == 0 then
  local term = {
    black = P.black, red = P.red, yellow = P.yellow, green = P.green,
    cyan = P.orange, blue = P.blue, purple = P.purple, white = P.fg,
    bright_black = P.grey,
  }
  vim.g.terminal_color_0 = term.black.gui
  vim.g.terminal_color_1 = term.red.gui
  vim.g.terminal_color_2 = term.green.gui
  vim.g.terminal_color_3 = term.yellow.gui
  vim.g.terminal_color_4 = term.blue.gui
  vim.g.terminal_color_5 = term.purple.gui
  vim.g.terminal_color_6 = term.cyan.gui
  vim.g.terminal_color_7 = term.white.gui
  vim.g.terminal_color_8 = term.bright_black.gui
  vim.g.terminal_color_9 = term.red.gui
  vim.g.terminal_color_10 = term.green.gui
  vim.g.terminal_color_11 = term.yellow.gui
  vim.g.terminal_color_12 = term.blue.gui
  vim.g.terminal_color_13 = term.purple.gui
  vim.g.terminal_color_14 = term.cyan.gui
  vim.g.terminal_color_15 = term.white.gui
end

-------------------------------------------------------------------------------
-- nvim-treesitter (legacy TS* groups + modern @groups)
-------------------------------------------------------------------------------
hi('TSStrong', P.none, P.none, 'bold')
hi('TSEmphasis', P.none, P.none, 'italic')
hi('TSUnderline', P.none, P.none, 'underline')
hi('TSNote', P.bg0, P.green, 'bold')
hi('TSWarning', P.bg0, P.yellow, 'bold')
hi('TSDanger', P.bg0, P.red, 'bold')
link('TSAnnotation', 'BlueItalic')
link('TSAttribute', 'BlueItalic')
link('TSBoolean', 'Purple')
link('TSCharacter', 'Yellow')
link('TSCharacterSpecial', 'SpecialChar')
link('TSComment', 'Comment')
link('TSConditional', 'Red')
link('TSConstBuiltin', 'PurpleItalic')
link('TSConstMacro', 'PurpleItalic')
link('TSConstant', 'Fg')
link('TSConstructor', 'Green')
link('TSDebug', 'Debug')
link('TSDefine', 'Define')
link('TSEnvironment', 'Macro')
link('TSEnvironmentName', 'Type')
link('TSError', 'Error')
link('TSException', 'Red')
link('TSField', 'Orange')
link('TSFloat', 'Purple')
link('TSFuncBuiltin', 'Green')
link('TSFuncMacro', 'Green')
link('TSFunction', 'Green')
link('TSFunctionCall', 'Green')
link('TSInclude', 'Red')
link('TSKeyword', 'Red')
link('TSKeywordFunction', 'Red')
link('TSKeywordOperator', 'Red')
link('TSKeywordReturn', 'Red')
link('TSLabel', 'Red')
link('TSLiteral', 'String')
link('TSMath', 'Yellow')
link('TSMethod', 'Green')
link('TSMethodCall', 'Green')
link('TSNamespace', 'BlueItalic')
link('TSNone', 'Fg')
link('TSNumber', 'Purple')
link('TSOperator', 'Red')
link('TSParameter', 'Fg')
link('TSParameterReference', 'Fg')
link('TSPreProc', 'PreProc')
link('TSProperty', 'Orange')
link('TSPunctBracket', 'Grey')
link('TSPunctDelimiter', 'Grey')
link('TSPunctSpecial', 'Yellow')
link('TSRepeat', 'Red')
link('TSStorageClass', 'Red')
link('TSStorageClassLifetime', 'Red')
link('TSStrike', 'Grey')
link('TSString', 'Yellow')
link('TSStringEscape', 'Green')
link('TSStringRegex', 'Green')
link('TSStringSpecial', 'SpecialChar')
link('TSSymbol', 'Fg')
link('TSTag', 'BlueItalic')
link('TSTagAttribute', 'Green')
link('TSTagDelimiter', 'Red')
link('TSText', 'Green')
link('TSTextReference', 'Constant')
link('TSTitle', 'Title')
link('TSTodo', 'Todo')
link('TSType', 'BlueItalic')
link('TSTypeBuiltin', 'BlueItalic')
link('TSTypeDefinition', 'BlueItalic')
link('TSTypeQualifier', 'Red')
hi('TSURI', P.blue, P.none, 'underline')
link('TSVariable', 'Fg')
link('TSVariableBuiltin', 'PurpleItalic')

local ts_at_links = {
  ['@annotation'] = 'TSAnnotation', ['@attribute'] = 'TSAttribute',
  ['@boolean'] = 'TSBoolean', ['@character'] = 'TSCharacter',
  ['@character.special'] = 'TSCharacterSpecial', ['@comment'] = 'TSComment',
  ['@comment.error'] = 'TSDanger', ['@comment.note'] = 'TSNote',
  ['@comment.todo'] = 'TSTodo', ['@comment.warning'] = 'TSWarning',
  ['@conceal'] = 'Grey', ['@conditional'] = 'TSConditional',
  ['@constant'] = 'TSConstant', ['@constant.builtin'] = 'TSConstBuiltin',
  ['@constant.macro'] = 'TSConstMacro', ['@constructor'] = 'TSConstructor',
  ['@debug'] = 'TSDebug', ['@define'] = 'TSDefine',
  ['@diff.delta'] = 'diffChanged', ['@diff.minus'] = 'diffRemoved',
  ['@diff.plus'] = 'diffAdded', ['@error'] = 'TSError',
  ['@exception'] = 'TSException', ['@field'] = 'TSField', ['@float'] = 'TSFloat',
  ['@function'] = 'TSFunction', ['@function.builtin'] = 'TSFuncBuiltin',
  ['@function.call'] = 'TSFunctionCall', ['@function.macro'] = 'TSFuncMacro',
  ['@function.method'] = 'TSMethod', ['@function.method.call'] = 'TSMethodCall',
  ['@include'] = 'TSInclude', ['@keyword'] = 'TSKeyword',
  ['@keyword.conditional'] = 'TSConditional', ['@keyword.debug'] = 'TSDebug',
  ['@keyword.directive'] = 'TSPreProc', ['@keyword.directive.define'] = 'TSDefine',
  ['@keyword.exception'] = 'TSException', ['@keyword.function'] = 'TSKeywordFunction',
  ['@keyword.import'] = 'TSInclude', ['@keyword.operator'] = 'TSKeywordOperator',
  ['@keyword.repeat'] = 'TSRepeat', ['@keyword.return'] = 'TSKeywordReturn',
  ['@keyword.storage'] = 'TSStorageClass', ['@label'] = 'TSLabel',
  ['@markup.emphasis'] = 'TSEmphasis', ['@markup.environment'] = 'TSEnvironment',
  ['@markup.environment.name'] = 'TSEnvironmentName', ['@markup.heading'] = 'TSTitle',
  ['@markup.link'] = 'TSTextReference', ['@markup.link.label'] = 'TSStringSpecial',
  ['@markup.link.url'] = 'TSURI', ['@markup.list'] = 'TSPunctSpecial',
  ['@markup.list.checked'] = 'Green', ['@markup.list.unchecked'] = 'Ignore',
  ['@markup.math'] = 'TSMath', ['@markup.note'] = 'TSNote', ['@markup.quote'] = 'Grey',
  ['@markup.raw'] = 'TSLiteral', ['@markup.strike'] = 'TSStrike',
  ['@markup.strong'] = 'TSStrong', ['@markup.underline'] = 'TSUnderline',
  ['@math'] = 'TSMath', ['@method'] = 'TSMethod', ['@method.call'] = 'TSMethodCall',
  ['@module'] = 'TSNamespace', ['@namespace'] = 'TSNamespace', ['@none'] = 'TSNone',
  ['@number'] = 'TSNumber', ['@number.float'] = 'TSFloat', ['@operator'] = 'TSOperator',
  ['@parameter'] = 'TSParameter', ['@parameter.reference'] = 'TSParameterReference',
  ['@preproc'] = 'TSPreProc', ['@property'] = 'TSProperty',
  ['@punctuation.bracket'] = 'TSPunctBracket', ['@punctuation.delimiter'] = 'TSPunctDelimiter',
  ['@punctuation.special'] = 'TSPunctSpecial', ['@repeat'] = 'TSRepeat',
  ['@storageclass'] = 'TSStorageClass', ['@storageclass.lifetime'] = 'TSStorageClassLifetime',
  ['@strike'] = 'TSStrike', ['@string'] = 'TSString', ['@string.escape'] = 'TSStringEscape',
  ['@string.regex'] = 'TSStringRegex', ['@string.regexp'] = 'TSStringRegex',
  ['@string.special'] = 'TSStringSpecial', ['@string.special.symbol'] = 'TSSymbol',
  ['@string.special.uri'] = 'TSURI', ['@symbol'] = 'TSSymbol', ['@tag'] = 'TSTag',
  ['@tag.attribute'] = 'TSTagAttribute', ['@tag.delimiter'] = 'TSTagDelimiter',
  ['@text'] = 'TSText', ['@text.danger'] = 'TSDanger', ['@text.diff.add'] = 'diffAdded',
  ['@text.diff.delete'] = 'diffRemoved', ['@text.emphasis'] = 'TSEmphasis',
  ['@text.environment'] = 'TSEnvironment', ['@text.environment.name'] = 'TSEnvironmentName',
  ['@text.literal'] = 'TSLiteral', ['@text.math'] = 'TSMath', ['@text.note'] = 'TSNote',
  ['@text.reference'] = 'TSTextReference', ['@text.strike'] = 'TSStrike',
  ['@text.strong'] = 'TSStrong', ['@text.title'] = 'TSTitle', ['@text.todo'] = 'TSTodo',
  ['@text.todo.checked'] = 'Green', ['@text.todo.unchecked'] = 'Ignore',
  ['@text.underline'] = 'TSUnderline', ['@text.uri'] = 'TSURI',
  ['@text.warning'] = 'TSWarning', ['@todo'] = 'TSTodo', ['@type'] = 'TSType',
  ['@type.builtin'] = 'TSTypeBuiltin', ['@type.definition'] = 'TSTypeDefinition',
  ['@type.qualifier'] = 'TSTypeQualifier', ['@uri'] = 'TSURI', ['@variable'] = 'TSVariable',
  ['@variable.builtin'] = 'TSVariableBuiltin', ['@variable.member'] = 'TSField',
  ['@variable.parameter'] = 'TSParameter',
}
for grp, tgt in pairs(ts_at_links) do
  link(grp, tgt)
end

-- LSP semantic tokens
local lsp_semantic_links = {
  ['@lsp.type.class'] = 'TSType', ['@lsp.type.comment'] = 'TSComment',
  ['@lsp.type.decorator'] = 'TSFunction', ['@lsp.type.enum'] = 'TSType',
  ['@lsp.type.enumMember'] = 'TSProperty', ['@lsp.type.events'] = 'TSLabel',
  ['@lsp.type.function'] = 'TSFunction', ['@lsp.type.interface'] = 'TSType',
  ['@lsp.type.keyword'] = 'TSKeyword', ['@lsp.type.macro'] = 'TSConstMacro',
  ['@lsp.type.method'] = 'TSMethod', ['@lsp.type.modifier'] = 'TSTypeQualifier',
  ['@lsp.type.namespace'] = 'TSNamespace', ['@lsp.type.number'] = 'TSNumber',
  ['@lsp.type.operator'] = 'TSOperator', ['@lsp.type.parameter'] = 'TSParameter',
  ['@lsp.type.property'] = 'TSProperty', ['@lsp.type.regexp'] = 'TSStringRegex',
  ['@lsp.type.string'] = 'TSString', ['@lsp.type.struct'] = 'TSType',
  ['@lsp.type.type'] = 'TSType', ['@lsp.type.typeParameter'] = 'TSTypeDefinition',
  ['@lsp.type.variable'] = 'TSVariable',
}
for grp, tgt in pairs(lsp_semantic_links) do
  link(grp, tgt)
end
hi('DiagnosticUnnecessary', P.grey, P.none)
hi('DiagnosticDeprecated', P.none, P.none, 'strikethrough', P.fg)

link('TSModuleInfoGood', 'Green')
link('TSModuleInfoBad', 'Red')

-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------

-- nvim-treesitter-context
hi('TreesitterContext', P.fg, P.bg2)
if config.dim_inactive_windows ~= 0 and config.transparent_background == 0 then
  hi('TreesitterContextLineNumber', P.grey_dim, P.bg0)
end

-- github/copilot.vim
link('CopilotSuggestion', 'Grey')

-- neoclide/coc.nvim
hi('CocHoverRange', P.none, P.none, 'bold,underline')
hi('CocSearch', P.green, P.none, 'bold')
hi('CocPumSearch', P.green, P.none, 'bold')
hi('CocMarkdownHeader', P.blue, P.none, 'bold')
hi('CocMarkdownLink', P.green, P.none, 'underline')
link('CocMarkdownCode', 'Green')
link('CocPumShortcut', 'Grey')
link('CocPumVirtualText', 'Grey')
link('CocPumMenu', 'Pmenu')
link('CocMenuSel', 'PmenuSel')
link('CocDisabled', 'Grey')
link('CocSnippetVisual', 'DiffAdd')
link('CocInlayHint', 'InlayHints')
link('CocNotificationProgress', 'Green')
link('CocNotificationButton', 'PmenuSel')
link('CocSemClass', 'TSType')
link('CocSemEnum', 'TSType')
link('CocSemInterface', 'TSType')
link('CocSemStruct', 'TSType')
link('CocSemTypeParameter', 'TSType')
link('CocSemVariable', 'TSVariable')
link('CocSemEnumMember', 'TSProperty')
link('CocSemEvent', 'TSLabel')
link('CocSemModifier', 'TSOperator')
link('CocErrorFloat', 'ErrorFloat')
link('CocWarningFloat', 'WarningFloat')
link('CocInfoFloat', 'InfoFloat')
link('CocHintFloat', 'HintFloat')
link('CocFloating', 'NormalFloat')
link('CocFloatDividingLine', 'Grey')
link('CocErrorHighlight', 'ErrorText')
link('CocWarningHighlight', 'WarningText')
link('CocInfoHighlight', 'InfoText')
link('CocHintHighlight', 'HintText')
link('CocHighlightText', 'CurrentWord')
link('CocHoverRange', 'CurrentWord')
link('CocErrorSign', 'RedSign')
link('CocWarningSign', 'YellowSign')
link('CocInfoSign', 'BlueSign')
link('CocHintSign', 'PurpleSign')
link('CocWarningVirtualText', 'VirtualTextWarning')
link('CocErrorVirtualText', 'VirtualTextError')
link('CocInfoVirtualText', 'VirtualTextInfo')
link('CocHintVirtualText', 'VirtualTextHint')
link('CocErrorLine', 'ErrorLine')
link('CocWarningLine', 'WarningLine')
link('CocInfoLine', 'InfoLine')
link('CocHintLine', 'HintLine')
link('CocCodeLens', 'Grey')
link('CocFadeOut', 'Grey')
link('CocStrikeThrough', 'Grey')
link('CocListMode', 'StatusLine')
link('CocListPath', 'StatusLine')
link('CocSelectedText', 'Red')
link('CocListsLine', 'Fg')
link('CocListsDesc', 'Grey')
link('HighlightedyankRegion', 'Visual')
link('CocGitAddedSign', 'GreenSign')
link('CocGitChangeRemovedSign', 'PurpleSign')
link('CocGitChangedSign', 'BlueSign')
link('CocGitRemovedSign', 'RedSign')
link('CocGitTopRemovedSign', 'RedSign')
link('CocInlineVirtualText', 'Grey')

-- dense-analysis/ale
link('ALEError', 'ErrorText')
link('ALEWarning', 'WarningText')
link('ALEInfo', 'InfoText')
link('ALEErrorSign', 'RedSign')
link('ALEWarningSign', 'YellowSign')
link('ALEInfoSign', 'BlueSign')
link('ALEErrorLine', 'ErrorLine')
link('ALEWarningLine', 'WarningLine')
link('ALEInfoLine', 'InfoLine')
link('ALEVirtualTextError', 'VirtualTextError')
link('ALEVirtualTextWarning', 'VirtualTextWarning')
link('ALEVirtualTextInfo', 'VirtualTextInfo')

-- airblade/vim-gitgutter
link('GitGutterAdd', 'GreenSign')
link('GitGutterChange', 'BlueSign')
link('GitGutterDelete', 'RedSign')
link('GitGutterChangeDelete', 'PurpleSign')
link('GitGutterAddLine', 'DiffAdd')
link('GitGutterChangeLine', 'DiffChange')
link('GitGutterDeleteLine', 'DiffDelete')
link('GitGutterChangeDeleteLine', 'DiffChange')
link('GitGutterAddLineNr', 'Green')
link('GitGutterChangeLineNr', 'Blue')
link('GitGutterDeleteLineNr', 'Red')
link('GitGutterChangeDeleteLineNr', 'Purple')

-- andymass/vim-matchup
hi('MatchParenCur', P.none, P.none, 'bold')
hi('MatchWord', P.none, P.none, 'underline')
hi('MatchWordCur', P.none, P.none, 'underline')

-- easymotion/vim-easymotion
link('EasyMotionTarget', 'Search')
link('EasyMotionShade', 'Grey')

-- justinmk/vim-sneak
hi('SneakLabelMask', P.filled_green, P.filled_green)
link('Sneak', 'Search')
link('SneakLabel', 'Search')
link('SneakScope', 'DiffText')

-- RRethy/vim-illuminate
link('illuminatedWord', 'CurrentWord')
link('IlluminatedWordText', 'CurrentWord')
link('IlluminatedWordRead', 'CurrentWord')
link('IlluminatedWordWrite', 'CurrentWord')

-- itchyny/vim-cursorword
link('CursorWord0', 'CurrentWord')
link('CursorWord1', 'CurrentWord')

-- liuchengxu/vim-which-key & folke/which-key.nvim (same group names)
link('WhichKey', 'Red')
link('WhichKeySeperator', 'Green')
link('WhichKeySeparator', 'Green')
link('WhichKeyGroup', 'Orange')
link('WhichKeyDesc', 'Blue')

-- unblevable/quick-scope
hi('QuickScopePrimary', P.green, P.none, 'underline')
hi('QuickScopeSecondary', P.blue, P.none, 'underline')

-- hrsh7th/nvim-cmp
hi('CmpItemAbbrMatch', P.green, P.none, 'bold')
hi('CmpItemAbbrMatchFuzzy', P.green, P.none, 'bold')
link('CmpItemAbbr', 'Fg')
link('CmpItemAbbrDeprecated', 'Grey')
link('CmpItemMenu', 'Fg')
link('CmpItemKind', 'Blue')
for _, kind in ipairs(lsp_kind_color) do
  link('CmpItemKind' .. kind[1], kind[2])
end

-- Saghen/blink.cmp
hi('BlinkCmpLabelMatch', P.green, P.none, 'bold')
link('BlinkCmpGhostText', 'Conceal')
for _, kind in ipairs(lsp_kind_color) do
  link('BlinkCmpKind' .. kind[1], kind[2])
end

-- SmiteshP/nvim-navic
link('NavicText', 'Fg')
link('NavicSeparator', 'Grey')
for _, kind in ipairs(lsp_kind_color) do
  link('NavicIcons' .. kind[1], kind[2])
end

-- folke/trouble.nvim
link('TroubleText', 'Fg')
link('TroubleSource', 'Grey')
link('TroubleCode', 'Grey')

-- nvim-telescope/telescope.nvim
hi('TelescopeMatching', P.green, P.none, 'bold')
link('TelescopeBorder', 'Grey')
link('TelescopePromptPrefix', 'Blue')
link('TelescopeSelection', 'DiffAdd')

-- ibhagwan/fzf-lua
link('FzfLuaBorder', 'Grey')
link('FzfLuaTitle', 'Title')
link('FzfLuaTitleFlags', 'Yellow')

-- folke/snacks.nvim
link('SnacksDashboardDesc', 'Yellow')
link('SnacksDashboardDir', 'Grey')
link('SnacksDashboardFile', 'Blue')
link('SnacksDashboardHeader', 'Blue')
link('SnacksDashboardIcon', 'Blue')
link('SnacksDashboardKey', 'Green')
link('SnacksDashboardTitle', 'RedItalic')
link('SnacksPicker', 'Normal')
link('SnacksPickerBorder', 'Grey')
link('SnacksPickerTitle', 'Title')
link('SnacksPickerFooter', 'SnacksPickerTitle')
link('SnacksPickerTotals', 'Grey')
link('SnacksPickerSelected', 'Blue')
link('SnacksPickerInputCursorLine', 'Normal')
link('SnacksPickerListCursorLine', 'CursorLine')
hi('SnacksPickerMatch', P.green, P.none, 'bold')
link('SnacksPickerToggle', 'Yellow')
link('SnacksPickerDir', 'Comment')
link('SnacksPickerBufFlags', 'Blue')
link('SnacksPickerGitStatus', 'Special')
link('SnacksPickerKeymapRhs', 'Normal')

-- lewis6991/gitsigns.nvim
link('GitSignsAdd', 'GreenSign')
link('GitSignsChange', 'BlueSign')
link('GitSignsDelete', 'RedSign')
link('GitSignsAddNr', 'Green')
link('GitSignsChangeNr', 'Blue')
link('GitSignsDeleteNr', 'Red')
link('GitSignsAddLn', 'DiffAdd')
link('GitSignsChangeLn', 'DiffChange')
link('GitSignsDeleteLn', 'DiffDelete')
link('GitSignsCurrentLineBlame', 'Grey')

-- phaazon/hop.nvim
hi('HopNextKey', P.red, P.none, 'bold')
hi('HopNextKey1', P.blue, P.none, 'bold')
link('HopNextKey2', 'Blue')
link('HopUnmatched', 'Grey')

-- lukas-reineke/indent-blankline.nvim
hi('IblScope', P.grey, P.none, 'nocombine')
hi('IblIndent', P.bg4, P.none, 'nocombine')
link('IndentBlanklineContextChar', 'IblScope')
link('IndentBlanklineChar', 'IblIndent')
link('IndentBlanklineSpaceChar', 'IndentBlanklineChar')
link('IndentBlanklineSpaceCharBlankline', 'IndentBlanklineChar')

-- HiPhish/rainbow-delimiters.nvim
link('RainbowDelimiterRed', 'Red')
link('RainbowDelimiterOrange', 'Orange')
link('RainbowDelimiterYellow', 'Yellow')
link('RainbowDelimiterGreen', 'Green')
link('RainbowDelimiterCyan', 'Blue')
link('RainbowDelimiterBlue', 'Blue')
link('RainbowDelimiterViolet', 'Purple')

-- romgrk/barbar.nvim
hi('BufferCurrent', P.fg, P.bg0)
hi('BufferCurrentIndex', P.fg, P.bg0)
hi('BufferCurrentMod', P.blue, P.bg0)
hi('BufferCurrentTarget', P.red, P.bg0, 'bold')
hi('BufferCurrentSign', P.red, P.bg0)
hi('BufferCurrentADDED', P.green, P.bg0)
hi('BufferCurrentDELETED', P.red, P.bg0)
hi('BufferCurrentCHANGED', P.blue, P.bg0)
hi('BufferVisible', P.fg, P.bg_dim)
hi('BufferVisibleIndex', P.fg, P.bg_dim)
hi('BufferVisibleMod', P.blue, P.bg_dim)
hi('BufferVisibleSign', P.red, P.bg_dim)
hi('BufferVisibleTarget', P.yellow, P.bg_dim, 'bold')
hi('BufferInactive', P.grey, P.bg_dim)
hi('BufferInactiveIndex', P.grey, P.bg_dim)
hi('BufferInactiveMod', P.grey, P.bg_dim)
hi('BufferInactiveTarget', P.yellow, P.bg_dim, 'bold')
hi('BufferInactiveSign', P.grey_dim, P.bg_dim)
link('BufferInactiveADDED', 'BufferInactiveSign')
link('BufferInactiveDELETED', 'BufferInactiveSign')
link('BufferInactiveCHANGED', 'BufferInactiveSign')
hi('BufferTabpages', P.grey, P.bg_dim, 'bold')
hi('BufferTabpagesSep', P.grey_dim, P.bg_dim, 'bold')
hi('BufferTabpageFill', P.bg_dim, P.bg_dim)

-- rcarriga/nvim-notify
hi('NotifyBackground', P.none, P.bg0)
link('NotifyERRORBorder', 'Red')
link('NotifyWARNBorder', 'Yellow')
link('NotifyINFOBorder', 'Green')
link('NotifyDEBUGBorder', 'Grey')
link('NotifyTRACEBorder', 'Purple')
link('NotifyERRORIcon', 'Red')
link('NotifyWARNIcon', 'Yellow')
link('NotifyINFOIcon', 'Green')
link('NotifyDEBUGIcon', 'Grey')
link('NotifyTRACEIcon', 'Purple')
link('NotifyERRORTitle', 'Red')
link('NotifyWARNTitle', 'Yellow')
link('NotifyINFOTitle', 'Green')
link('NotifyDEBUGTitle', 'Grey')
link('NotifyTRACETitle', 'Purple')

-- rcarriga/nvim-dap-ui
hi('DapUIModifiedValue', P.blue, P.none, 'bold')
hi('DapUIBreakpointsCurrentLine', P.blue, P.none, 'bold')
link('DapUIScope', 'Blue')
link('DapUIType', 'Purple')
link('DapUIDecoration', 'Blue')
link('DapUIThread', 'Green')
link('DapUIStoppedThread', 'Blue')
link('DapUISource', 'Purple')
link('DapUILineNumber', 'Blue')
link('DapUIFloatBorder', 'Blue')
link('DapUIWatchesEmpty', 'Red')
link('DapUIWatchesValue', 'Green')
link('DapUIWatchesError', 'Red')
link('DapUIBreakpointsPath', 'Blue')
link('DapUIBreakpointsInfo', 'Green')

-- glepnir/lspsaga.nvim
hi('LspFloatWinBorder', P.bg0, P.bg0)
hi('LspSagaDiagnosticHeader', P.orange, P.none, 'bold')
hi('LspSagaCodeActionTitle', P.blue, P.none, 'bold')
hi('DefinitionPreviewTitle', P.purple, P.none, 'bold')
link('LspSagaDiagnosticError', 'Red')
link('LspSagaDiagnosticWarn', 'Yellow')
link('LspSagaDiagnosticInfo', 'Blue')
link('LspSagaDiagnosticHint', 'Purple')
link('LspSagaErrorTrunCateLine', 'LspSagaDiagnosticError')
link('LspSagaWarnTrunCateLine', 'LspSagaDiagnosticWarn')
link('LspSagaInfoTrunCateLine', 'LspSagaDiagnosticInfo')
link('LspSagaHintTrunCateLine', 'LspSagaDiagnosticHint')
link('LspSagaDiagnosticSource', 'Orange')
link('LspSagaDiagnosticBorder', 'Orange')
link('LspSagaRenameBorder', 'Blue')
link('LspSagaRenamePromptPrefix', 'Red')
link('LspSagaCodeActionBorder', 'Blue')
link('LspSagaCodeActionTruncateLine', 'Blue')
link('LspSagaCodeActionContent', 'Green')
link('LspSagaHoverBorder', 'Green')
link('LspSagaDocTruncateLine', 'Green')
link('LspSagaSignatureHelpBorder', 'Green')
link('LspSagaShTruncateLine', 'Green')
link('LspSagaDefPreviewBorder', 'Purple')
link('DefinitionIcon', 'Purple')
link('LspLinesDiagBorder', 'Yellow')
link('LineDiagTuncateLine', 'Yellow')
link('LspSagaAutoPreview', 'Blue')
link('LspSagaFinderSelection', 'Fg')
link('DiagnosticWarning', 'DiagnosticWarn')
link('DiagnosticInformation', 'DiagnosticInfo')
link('ReferencesCount', 'Grey')
link('DefinitionCount', 'Grey')
link('TargetFileName', 'Grey')

-- b0o/incline.nvim
hi('InclineNormalNC', P.grey, P.bg2)

-- echasnovski/mini.nvim
hi('MiniAnimateCursor', P.none, P.none, 'reverse,nocombine')
if config.float_style == 'dim' then
  hi('MiniFilesTitle', P.grey, P.bg0)
elseif config.float_style == 'blend' then
  if config.transparent_background ~= 0 then
    link('MiniFilesTitle', 'Grey')
  else
    hi('MiniFilesTitle', P.grey, P.bg1)
  end
else
  hi('MiniFilesTitle', P.grey, P.bg4)
end
hi('MiniHipatternsFixme', P.bg0, P.red, 'bold')
hi('MiniHipatternsHack', P.bg0, P.yellow, 'bold')
hi('MiniHipatternsNote', P.bg0, P.blue, 'bold')
hi('MiniHipatternsTodo', P.bg0, P.green, 'bold')
hi('MiniIconsAzure', P.filled_blue, P.none)
hi('MiniIconsBlue', P.blue, P.none)
hi('MiniIconsCyan', P.blue, P.none)
hi('MiniIconsGreen', P.green, P.none)
hi('MiniIconsGrey', P.fg, P.none)
hi('MiniIconsOrange', P.orange, P.none)
hi('MiniIconsPurple', P.purple, P.none)
hi('MiniIconsRed', P.red, P.none)
hi('MiniIconsYellow', P.yellow, P.none)
hi('MiniIndentscopePrefix', P.none, P.none, 'nocombine')
hi('MiniJump2dSpot', P.red, P.none, 'bold,nocombine')
hi('MiniJump2dSpotAhead', P.blue, P.none, 'nocombine')
hi('MiniJump2dSpotUnique', P.yellow, P.none, 'bold,nocombine')
link('MiniPickPrompt', 'NormalFloat')
if config.float_style == 'dim' then
  hi('MiniPickPromptPrefix', P.red, P.bg_dim)
  hi('MiniPickPromptCaret', P.blue, P.bg_dim)
elseif config.float_style == 'blend' then
  if config.transparent_background ~= 0 then
    link('MiniPickPromptPrefix', 'Red')
    link('MiniPickPromptCaret', 'Blue')
  else
    hi('MiniPickPromptPrefix', P.red, P.bg0)
    hi('MiniPickPromptCaret', P.blue, P.bg0)
  end
else
  hi('MiniPickPromptPrefix', P.red, P.bg2)
  hi('MiniPickPromptCaret', P.blue, P.bg2)
end
hi('MiniStarterCurrent', P.none, P.none, 'nocombine')
hi('MiniStatuslineDevinfo', P.fg, P.bg3)
hi('MiniStatuslineFileinfo', P.fg, P.bg3)
hi('MiniStatuslineFilename', P.grey, P.bg1)
hi('MiniStatuslineInactive', P.grey, P.bg1)
hi('MiniStatuslineModeCommand', P.bg0, P.yellow, 'bold')
hi('MiniStatuslineModeInsert', P.bg0, P.filled_green, 'bold')
hi('MiniStatuslineModeNormal', P.bg0, P.filled_blue, 'bold')
hi('MiniStatuslineModeOther', P.bg0, P.purple, 'bold')
hi('MiniStatuslineModeReplace', P.bg0, P.orange, 'bold')
hi('MiniStatuslineModeVisual', P.bg0, P.filled_red, 'bold')
hi('MiniTablineCurrent', P.fg, P.bg4)
hi('MiniTablineHidden', P.grey, P.bg2)
hi('MiniTablineModifiedCurrent', P.blue, P.bg4)
hi('MiniTablineModifiedHidden', P.grey, P.bg2)
hi('MiniTablineModifiedVisible', P.blue, P.bg2)
hi('MiniTablineTabpagesection', P.bg0, P.blue, 'bold')
hi('MiniTablineVisible', P.fg, P.bg2)
hi('MiniTestEmphasis', P.none, P.none, 'bold')
hi('MiniTestFail', P.red, P.none, 'bold')
hi('MiniTestPass', P.green, P.none, 'bold')
hi('MiniTrailspace', P.none, P.red)
link('MiniAnimateNormalFloat', 'NormalFloat')
link('MiniClueBorder', 'FloatBorder')
link('MiniClueDescGroup', 'DiagnosticFloatingWarn')
link('MiniClueDescSingle', 'NormalFloat')
link('MiniClueNextKey', 'DiagnosticFloatingHint')
link('MiniClueNextKeyWithPostkeys', 'DiagnosticFloatingError')
link('MiniClueSeparator', 'DiagnosticFloatingInfo')
link('MiniClueTitle', 'FloatTitle')
link('MiniCompletionActiveParameter', 'LspSignatureActiveParameter')
link('MiniCursorword', 'CurrentWord')
link('MiniCursorwordCurrent', 'CurrentWord')
link('MiniDepsChangeAdded', 'Added')
link('MiniDepsChangeRemoved', 'Removed')
link('MiniDepsHint', 'DiagnosticHint')
link('MiniDepsInfo', 'DiagnosticInfo')
link('MiniDepsMsgBreaking', 'DiagnosticWarn')
link('MiniDepsPlaceholder', 'Comment')
link('MiniDepsTitle', 'Title')
link('MiniDepsTitleError', 'DiffDelete')
link('MiniDepsTitleSame', 'DiffChange')
link('MiniDepsTitleUpdate', 'DiffAdd')
link('MiniDiffOverAdd', 'DiffAdd')
link('MiniDiffOverChange', 'DiffText')
link('MiniDiffOverContext', 'DiffChange')
link('MiniDiffOverDelete', 'DiffDelete')
link('MiniDiffSignAdd', 'GreenSign')
link('MiniDiffSignChange', 'BlueSign')
link('MiniDiffSignDelete', 'RedSign')
link('MiniIndentscopeSymbol', 'Grey')
link('MiniJump', 'Search')
link('MiniJump2dDim', 'Comment')
link('MiniMapNormal', 'NormalFloat')
link('MiniMapSymbolCount', 'Special')
link('MiniMapSymbolLine', 'Title')
link('MiniMapSymbolView', 'Delimiter')
link('MiniNotifyBorder', 'FloatBorder')
link('MiniNotifyNormal', 'NormalFloat')
link('MiniNotifyTitle', 'FloatTitle')
link('MiniOperatorsExchangeFrom', 'IncSearch')
link('MiniPickMatchMarked', 'DiffChange')
link('MiniStarterFooter', 'Yellow')
link('MiniStarterHeader', 'Purple')
link('MiniStarterInactive', 'Comment')
link('MiniStarterItem', 'Normal')
link('MiniStarterItemBullet', 'Grey')
link('MiniStarterItemPrefix', 'Yellow')
link('MiniStarterQuery', 'Blue')
link('MiniStarterSection', 'Title')
link('MiniSurround', 'IncSearch')
link('MiniTablineFill', 'TabLineFill')

-- ggandor/lightspeed.nvim
hi('LightspeedLabel', P.red, P.none, 'bold,underline')
hi('LightspeedLabelDistant', P.blue, P.none, 'bold,underline')
hi('LightspeedShortcut', P.bg0, P.red, 'bold')
hi('LightspeedUnlabeledMatch', P.fg, P.none, 'bold')
hi('LightspeedPendingOpArea', P.bg0, P.green)
link('LightspeedMaskedChar', 'Purple')
link('LightspeedGreyWash', 'Grey')

-------------------------------------------------------------------------------
-- File explorers
-------------------------------------------------------------------------------

-- preservim/nerdtree
link('NERDTreeDir', 'Green')
link('NERDTreeDirSlash', 'Green')
link('NERDTreeOpenable', 'Blue')
link('NERDTreeClosable', 'Blue')
link('NERDTreeFile', 'Fg')
link('NERDTreeExecFile', 'Red')
link('NERDTreeUp', 'Grey')
link('NERDTreeCWD', 'Purple')
link('NERDTreeHelp', 'Grey')
link('NERDTreeToggleOn', 'Green')
link('NERDTreeToggleOff', 'Red')
link('NERDTreeFlags', 'Blue')
link('NERDTreeLinkFile', 'Grey')
link('NERDTreeLinkTarget', 'Green')

-- justinmk/vim-dirvish
link('DirvishPathTail', 'Blue')
link('DirvishArg', 'Yellow')

-- kyazdani42/nvim-tree.lua
if config.transparent_background == 0 then
  hi('NvimTreeNormal', P.fg, P.bg_dim)
  hi('NvimTreeEndOfBuffer', P.bg_dim, P.bg_dim)
  hi('NvimTreeVertSplit', P.bg0, P.bg0)
  hi('NvimTreeCursorLine', P.none, P.bg0)
end
link('NvimTreeSymlink', 'Fg')
link('NvimTreeFolderName', 'Green')
link('NvimTreeRootFolder', 'Grey')
link('NvimTreeFolderIcon', 'Blue')
link('NvimTreeEmptyFolderName', 'Green')
link('NvimTreeOpenedFolderName', 'Green')
link('NvimTreeExecFile', 'Fg')
link('NvimTreeOpenedHL', 'Fg')
link('NvimTreeSpecialFile', 'Fg')
link('NvimTreeImageFile', 'Fg')
link('NvimTreeIndentMarker', 'Grey')
link('NvimTreeGitDirtyIcon', 'Yellow')
link('NvimTreeGitStagedIcon', 'Blue')
link('NvimTreeGitMergeIcon', 'Orange')
link('NvimTreeGitRenamedIcon', 'Purple')
link('NvimTreeGitNewIcon', 'Green')
link('NvimTreeGitDeletedIcon', 'Red')
link('NvimTreeLspDiagnosticsError', 'RedSign')
link('NvimTreeLspDiagnosticsWarning', 'YellowSign')
link('NvimTreeLspDiagnosticsInformation', 'BlueSign')
link('NvimTreeLspDiagnosticsHint', 'PurpleSign')

-- lambdalisue/fern.vim
link('FernMarkedLine', 'Purple')
link('FernMarkedText', 'Purple')
link('FernRootSymbol', 'FernRootText')
link('FernRootText', 'Blue')
link('FernLeafSymbol', 'FernLeafText')
link('FernLeafText', 'Fg')
link('FernBranchSymbol', 'FernBranchText')
link('FernBranchText', 'Green')
link('FernWindowSelectIndicator', 'TabLineSel')
link('FernWindowSelectStatusLine', 'TabLine')

-- nvim-neo-tree/neo-tree.nvim
if config.transparent_background == 0 then
  hi('NeoTreeNormal', P.fg, P.bg_dim)
  hi('NeoTreeEndOfBuffer', P.bg_dim, P.bg_dim)
  hi('NeoTreeVertSplit', P.bg0, P.bg0)
end
link('NeoTreeDirectoryIcon', 'Blue')
link('NeoTreeGitAdded', 'Green')
link('NeoTreeGitConflict', 'Yellow')
link('NeoTreeGitDeleted', 'Red')
link('NeoTreeGitIgnored', 'Grey')
link('NeoTreeGitModified', 'Blue')
link('NeoTreeGitUnstaged', 'Purple')
link('NeoTreeGitUntracked', 'Fg')
link('NeoTreeGitStaged', 'Purple')
link('NeoTreeDimText', 'Grey')
link('NeoTreeIndentMarker', 'NonText')
link('NeoTreeNormalNC', 'NeoTreeNormal')
link('NeoTreeSignColumn', 'NeoTreeNormal')
link('NeoTreeRootName', 'Title')

-- netrw (builtin)
link('netrwDir', 'Green')
link('netrwClassify', 'Green')
link('netrwLink', 'Grey')
link('netrwSymLink', 'Fg')
link('netrwExe', 'Red')
link('netrwComment', 'Grey')
link('netrwList', 'Yellow')
link('netrwHelpCmd', 'Blue')
link('netrwCmdSep', 'Grey')
link('netrwVersion', 'Purple')

-------------------------------------------------------------------------------
-- Misc plugins / filetypes
-------------------------------------------------------------------------------

-- mbbill/undotree
hi('UndotreeSavedBig', P.red, P.none, 'bold')
link('UndotreeNode', 'Blue')
link('UndotreeNodeCurrent', 'Purple')
link('UndotreeSeq', 'Green')
link('UndotreeCurrent', 'Blue')
link('UndotreeNext', 'Yellow')
link('UndotreeTimeStamp', 'Grey')
link('UndotreeHead', 'Purple')
link('UndotreeBranch', 'Blue')
link('UndotreeSavedSmall', 'Red')

-- NeogitOrg/neogit
link('NeogitNotificationInfo', 'Blue')
link('NeogitNotificationWarning', 'Yellow')
link('NeogitNotificationError', 'Red')
link('NeogitDiffAdd', 'Green')
link('NeogitDiffDelete', 'Red')
link('NeogitDiffContextHighlight', 'CursorLine')
link('NeogitHunkHeaderHighlight', 'TabLine')
link('NeogitHunkHeader', 'TabLineFill')
link('NeogitCommandCodeNormal', 'Green')
link('NeogitCommandCodeError', 'Red')
link('NeogitCommitViewHeader', 'diffIndexLine')
link('NeogitFilePath', 'diffFile')

-- glepnir/dashboard-nvim
link('DashboardHeader', 'Blue')
link('DashboardCenter', 'Green')
link('DashboardShortcut', 'Red')
link('DashboardFooter', 'Yellow')

-- markdown (builtin + vim-markdown + Treesitter)
hi('markdownH1', P.red, P.none, 'bold')
hi('markdownH2', P.orange, P.none, 'bold')
hi('markdownH3', P.yellow, P.none, 'bold')
hi('markdownH4', P.green, P.none, 'bold')
hi('markdownH5', P.blue, P.none, 'bold')
hi('markdownH6', P.purple, P.none, 'bold')
hi('markdownItalic', P.none, P.none, 'italic')
hi('markdownBold', P.none, P.none, 'bold')
hi('markdownItalicDelimiter', P.grey, P.none, 'italic')
link('markdownUrl', 'TSURI')
link('markdownCode', 'Green')
link('markdownCodeBlock', 'Green')
link('markdownCodeDelimiter', 'Green')
link('markdownBlockquote', 'Grey')
link('markdownListMarker', 'Red')
link('markdownOrderedListMarker', 'Red')
link('markdownRule', 'Purple')
link('markdownHeadingRule', 'Grey')
link('markdownUrlDelimiter', 'Grey')
link('markdownLinkDelimiter', 'Grey')
link('markdownLinkTextDelimiter', 'Grey')
link('markdownHeadingDelimiter', 'Grey')
link('markdownLinkText', 'Red')
link('markdownUrlTitleDelimiter', 'Green')
link('markdownIdDeclaration', 'markdownLinkText')
link('markdownBoldDelimiter', 'Grey')
link('markdownId', 'Yellow')
hi('mkdURL', P.blue, P.none, 'underline')
hi('mkdInlineURL', P.blue, P.none, 'underline')
hi('mkdItalic', P.grey, P.none, 'italic')
link('mkdCodeDelimiter', 'Green')
link('mkdBold', 'Grey')
link('mkdLink', 'Red')
link('mkdHeading', 'Grey')
link('mkdListItem', 'Red')
link('mkdRule', 'Purple')
link('mkdDelimiter', 'Grey')
link('mkdId', 'Yellow')
link('@markup.heading.1.markdown', 'markdownH1')
link('@markup.heading.2.markdown', 'markdownH2')
link('@markup.heading.3.markdown', 'markdownH3')
link('@markup.heading.4.markdown', 'markdownH4')
link('@markup.heading.5.markdown', 'markdownH5')
link('@markup.heading.6.markdown', 'markdownH6')
link('@markup.heading.1.marker.markdown', '@conceal')
link('@markup.heading.2.marker.markdown', '@conceal')
link('@markup.heading.3.marker.markdown', '@conceal')
link('@markup.heading.4.marker.markdown', '@conceal')
link('@markup.heading.5.marker.markdown', '@conceal')
link('@markup.heading.6.marker.markdown', '@conceal')

-- vimwiki/vimwiki
hi('VimwikiHeader1', P.red, P.none, 'bold')
hi('VimwikiHeader2', P.orange, P.none, 'bold')
hi('VimwikiHeader3', P.yellow, P.none, 'bold')
hi('VimwikiHeader4', P.green, P.none, 'bold')

-- diff (generic; also used by fugitive, git commands, etc.)
link('diffAdded', 'Added')
link('diffRemoved', 'Removed')
link('diffChanged', 'Changed')
link('diffOldFile', 'Yellow')
link('diffNewFile', 'Orange')
link('diffFile', 'Purple')
link('diffLine', 'Grey')
link('diffIndexLine', 'Purple')

-- gitcommit (builtin)
link('gitcommitSummary', 'Red')
link('gitcommitUntracked', 'Grey')
link('gitcommitDiscarded', 'Grey')
link('gitcommitSelected', 'Grey')
link('gitcommitUnmerged', 'Grey')
link('gitcommitOnBranch', 'Grey')
link('gitcommitArrow', 'Grey')
link('gitcommitFile', 'Green')
link('@text.gitcommit', 'TSNone')

-- json/yaml/toml (regex-syntax fallback; Treesitter overrides most of this)
link('jsonKeyword', 'Red')
link('jsonString', 'Green')
link('jsonBoolean', 'Blue')
link('jsonNoise', 'Grey')
link('jsonQuote', 'Grey')
link('jsonBraces', 'Fg')
link('yamlKey', 'Red')
link('yamlConstant', 'BlueItalic')
link('yamlString', 'Green')
hi('tomlTable', P.purple, P.none, 'bold')
link('tomlKey', 'Red')
link('tomlBoolean', 'Blue')
link('tomlString', 'Green')
link('tomlTableArray', 'tomlTable')

-- dosini (.ini files)
hi('dosiniHeader', P.red, P.none, 'bold')
link('dosiniLabel', 'Blue')
link('dosiniValue', 'Green')
link('dosiniNumber', 'Green')

-- :help buffers
hi('helpNote', P.purple, P.none, 'bold')
hi('helpHeadline', P.red, P.none, 'bold')
hi('helpHeader', P.orange, P.none, 'bold')
hi('helpURL', P.green, P.none, 'underline')
hi('helpHyperTextEntry', P.blue, P.none, 'bold')
link('helpHyperTextJump', 'Blue')
link('helpCommand', 'Yellow')
link('helpExample', 'Green')
link('helpSpecial', 'Purple')
link('helpSectionDelim', 'Grey')

-- vim: set sw=2 ts=2 sts=2 et:
