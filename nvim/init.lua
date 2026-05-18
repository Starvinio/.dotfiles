vim.g.mapleader = " "

vim.cmd.colorscheme("mentat")
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.mouse = "a"
vim.opt.scrolloff = 10

vim.opt.cmdheight = 0 

vim.opt.undofile = true -- Save undo history

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear search highlights
vim.keymap.set({"n", "i", "v"}, "<C-s>", "<cmd>w<CR>") -- Clear search highlights
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous Diagnostic Message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next Diagnostic Message" })
vim.keymap.set("n", "<C-b>", "<cmd>Ex<CR>", { desc = "Open file explorer" })


