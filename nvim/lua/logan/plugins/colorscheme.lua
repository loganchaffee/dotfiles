-- return {
-- 	"lunarvim/darkplus.nvim",
-- 	priority = 1000,
-- 	lazy = false,
-- 	name = "darkplus",
-- 	config = function()
-- 		vim.cmd("colorscheme darkplus")
-- 	end,
-- }

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "auto", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true,
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
