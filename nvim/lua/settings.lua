-- options
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.signcolumn = "yes:1"
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }
vim.opt.winborder = "rounded"

-- key maps
vim.keymap.set("n", "<leader>w", vim.cmd.w, { desc = "Write file" })
vim.keymap.set("", "<leader>bn", vim.cmd.bnext, { desc = "Next buffer" })
vim.keymap.set("", "<leader>bb", vim.cmd.bprev, { desc = "Previous buffer" })
vim.keymap.set("", "<leader>c", vim.cmd.bw, { desc = "Close window" })
vim.keymap.set("", "<leader>h", vim.cmd.nohlsearch, { desc = "Clear highlight" })

-- global variables
WindowSettings = {
	width = 120,
	height = 40,
	border = "rounded",
}
