return {
	"numToStr/Comment.nvim",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	lazy = false,
	config = function()
		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			toggler = {
				---Line-comment toggle keymap
				line = "<leader>/",
			},
			opleader = {
				-- Line-comment keymap
				line = "<leader>/",
			},
		})
	end,
}
