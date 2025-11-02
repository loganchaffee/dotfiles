return {
	"rcarriga/nvim-notify",
	priority = 999,
	config = function()
		require("notify").setup({
			background_colour = "FloatShadow",
			render = "wrapped-compact",
			stages = "fade",
		})
		vim.notify = require("notify")
	end,
}
