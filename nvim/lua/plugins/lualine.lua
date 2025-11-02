vim.opt.laststatus = 3

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
			},
			extensions = { "nvim-tree" },
		})
	end,
}
