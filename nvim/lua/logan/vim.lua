vim.g.mapleader = " "
vim.opt.number = true
vim.opt.clipboard = "unnamedplus" -- Yank to clipboard
vim.opt.relativenumber = true
vim.o.wrap = false
vim.o.ignorecase = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 0 -- (0 means "Use the tabstop value")
vim.opt.shiftwidth = 2
vim.o.expandtab = true

vim.o.signcolumn = "yes:1"

-- Spell Check
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }
