return {
	"f-person/git-blame.nvim",
	config = function()
		require("gitblame").setup({
			-- Note how the `gitblame_` prefix is omitted in `setup`
			enabled = false,
			date_format = "%r",
			message_when_not_committed = "  You • <date> • Uncommited",
		})

		-- Toggle git blame
		vim.keymap.set("n", "<leader>gb", vim.cmd.GitBlameToggle, { desc = "Git line blame" })
	end,
}
