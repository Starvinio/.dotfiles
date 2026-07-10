local vim = vim

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
opt.confirm = true
opt.swapfile = false

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.title = true
opt.wrap = false
opt.breakindent = true
opt.cmdheight = 0 -- TODO: Find solution for showing important info without > 0
opt.signcolumn = "yes"
opt.inccommand = "split"


-- CUSTOM FUNCTIONS


-- KEYBINDS
map("n", "<leader>r", "<cmd>source ~/.dotfiles/nvim/init.lua<CR>")
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Write current buffer" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear search highlights
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous Diagnostic Message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next Diagnostic Message" })

vim.keymap.set("n", "<leader>uw", function()
    vim.wo.wrap = not vim.wo.wrap
    vim.wo.linebreak = vim.wo.wrap

    if vim.wo.wrap then
        vim.notify("Wrap enabled")
    else
        vim.notify("Wrap disabled")
    end
end, { desc = "[U]I Toggle [W]rap" })


-- PLUGIN IMPORTS
-- Compare to ~/.local/share/nvim/site/pack/core/opt for cleanup
vim.pack.add({
	-- file manager
	"https://github.com/stevearc/oil.nvim",

	-- file picker
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-telescope/telescope.nvim",

	-- lsp
	"https://github.com/neovim/nvim-lspconfig",

	-- Better navigation
	"https://github.com/mluders/comfy-line-numbers.nvim",

	-- Theme
	"https://github.com/ellisonleao/gruvbox.nvim",
})

require "comfy-line-numbers".setup()

-- LSP
vim.lsp.enable(all_lsps)

map("n", "<leader>lf", function()
	vim.lsp.buf.format()
	print("Document formatted!")
end,  { desc = "[L]SP [F]ormat" })



-- OIL
require "oil".setup({
	default_file_explorer = true,
	columns = {
		"icon",
		--"permissions",
		--"size",
		--"mtime",
	},
	constrain_cursor = "name",
	view_options = {
		show_hidden = false,
	},
	-- Toggle hidden files
	keymaps = {
		["<C-h>"] = "actions.toggle_hidden",
	}
})
map("n", "-", "<cmd>Oil<CR>", { desc = "Open file explorer" })



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

-- CUSTOM CWD
map("n", "<leader>sd", function() pickers.find_files({ cwd = "~/.dotfiles" }) end,
	{ desc = "[S]earch [D]otfiles", })
map("n", "<leader>mfa", function() pickers.find_files({ cwd = "~/MD/active" }) end,
	{ desc = "[M]arkdown [F]iles [A]ctive", })
map("n", "<leader>mga", function() pickers.live_grep({ cwd = "~/MD/active" }) end,
	{ desc = "[M]arkdown [G]rep [A]ctive", })
map("n", "<leader>mfr", function() pickers.find_files({ cwd = "~/MD/archive" }) end,
	{ desc = "[M]arkdown [F]iles a[R]chived", })
map("n", "<leader>mgr", function() pickers.live_grep({ cwd = "~/MD/archive" }) end,
	{ desc = "[M]arkdown [G]rep a[R]chived", })



-- POST PLUGIN LOAD CONFIG
cmd.colorscheme("nuarb")

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text" },
    callback = function()
        vim.wo.wrap = true
        vim.wo.linebreak = true
        vim.wo.breakindent = true
    end,
})
