-- LEADER KEY AS SPACE
vim.g.mapleader = " "

-- LSP Table
local all_lsps = {
	"lua_ls",
	"clangd",
	"rust_analyzer",
}

-- LOCAL BINDINGS FOR CONCISENESS
local opt = vim.opt
local map = vim.keymap.set
local cmd = vim.cmd
local tab_len = 4


-- OPTIONS
opt.tabstop = tab_len
opt.shiftwidth = tab_len
opt.mouse = "a"
opt.scrolloff = 10

opt.undofile = true -- Save undo history
opt.swapfile = false

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.title = true
opt.wrap = false
opt.cmdheight = 0
opt.signcolumn = "yes"



-- KEYBINDS
map("n", "<leader>r", "<cmd>source ~/.dotfiles/nvim/init.lua<CR>")
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Write current buffer" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear search highlights
map("n", "-", "<cmd>Oil<CR>", { desc = "Open file explorer" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous Diagnostic Message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next Diagnostic Message" })


-- PLUGIN IMPORTS
-- Compare to ~/.local/share/nvim/site/pack/core/opt for cleanup
vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-telescope/telescope.nvim",

	-- lsp
	"https://github.com/neovim/nvim-lspconfig",

	-- colorschemes
	"https://github.com/projekt0n/github-nvim-theme",
	"https://github.com/dracula/vim",
	"https://github.com/tanvirtin/monokai.nvim",
	"https://github.com/miikanissi/modus-themes.nvim",
})

-- LSP
vim.lsp.enable(all_lsps)
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "[L]sp [F]ormat" })



-- OIL
require "oil".setup({
	default_file_explorer = true,
	view_options = {
		show_hidden = false,
	},
	-- Toggle hidden files
	keymaps = {
		["<C-h>"] = "actions.toggle_hidden",
	}
})



-- TELESCOPE
local pickers = require "telescope.builtin"

-- map("n", "<leader>sp", pickers.builtin, { desc = "[S]earch Builtin [P]ickers", })
map("n", "<leader><leader>", pickers.buffers, { desc = "[S]earch Buffers", })
map("n", "<leader>sf", pickers.find_files, { desc = "[S]earch [F]iles", })
map("n", "<leader>sw", pickers.grep_string, { desc = "[S]earch Current [W]ord", })
map("n", "<leader>sg", pickers.live_grep, { desc = "[S]earch by [G]rep", })
map("n", "<leader>sr", pickers.resume, { desc = "[S]earch [R]esume", })

map("n", "<leader>sh", pickers.help_tags, { desc = "[S]earch [H]elp", })
map("n", "<leader>sm", pickers.man_pages, { desc = "[S]earch [M]anuals", })

-- MARKDOWN
map("n", "<leader>mfa", function() pickers.find_files({ cwd = "~/md/active" }) end, { desc = "[M]ark[D]own [A]ctive", })
map("n", "<leader>mga", function() pickers.live_grep({ cwd = "~/md/active" }) end, { desc = "[M]ark[D]own [A]ctive", })
map("n", "<leader>mfr", function() pickers.find_files({ cwd = "~/md/archive" }) end,
	{ desc = "[M]ark[D]own [I]nactive", })
map("n", "<leader>mgr", function() pickers.live_grep({ cwd = "~/md/archive" }) end, { desc = "[M]ark[D]own [I]nactive", })



-- POST PLUGIN LOAD CONFIG
cmd.colorscheme("modus_operandi")
