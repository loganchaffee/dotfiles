vim.opt.laststatus = 3

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"lunarvim/darkplus.nvim",
	},
	config = function()
		local custom_darkplus = require("lualine.themes.darkplus")

		custom_darkplus.normal.c.bg = nil

		require("lualine").setup({
			options = {
				theme = custom_darkplus,
			},
			extensions = { "nvim-tree" },
		})
	end,
}
