vim.pack.add({
	"https://github.com/akinsho/lewis6991/gitsigns.nvim.git",
	"https://github.com/akinsho/git-conflict.nvim.git",
	"https://github.com/f-person/git-blame.nvim.git",
	"https://github.com/nvim-tree/nvim-web-devicons.git",
	"https://github.com/folke/snacks.nvim.git",
})

require("gitsigns").setup()

require("git-conflict").setup({
	default_mappings = {
		ours = "ao",
		theirs = "at",
		none = "a0",
		both = "ab",
		next = "n",
		prev = "p",
	},
})

require("gitblame").setup({
	enabled = false,
	date_format = "%r",
	message_when_not_committed = "  You • <date> • Uncommited",
})

vim.keymap.set("n", "<leader>gb", vim.cmd.GitBlameToggle, { desc = "Git line blame" })

-- Lazygit
vim.keymap.set("n", "<leader>gl", function()
	require("snacks").lazygit()
end, { desc = "Lazygit" })
