local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "logan.plugins" },
	},
	ui = {
		border = "rounded",
		title = "Lazy",
		size = {
			width = WindowDimentions.width,
			height = WindowDimentions.height,
		},
	},
})

vim.keymap.set("n", "<leader>L", vim.cmd.Lazy, { desc = "Lazy" })
