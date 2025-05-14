return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			files = {
				path_shorten = true,
			},
			winopts = {
				height = WindowDimentions.height,
				width = WindowDimentions.width,
				preview = {
					horizontal = "right:50%",
				},
			},
		})

		vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>st", fzf.live_grep, { desc = "[S]earch by [G]rep" })
	end,
}
