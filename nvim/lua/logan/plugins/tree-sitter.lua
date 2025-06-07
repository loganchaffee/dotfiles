-- Highlight, edit, and navigate code
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"javascript",
        "tsx",
				"typescript",
				"css",
				"scss",
				"html",
				"go",
				"php",
				"scala",
				"bash",
				"python",
				"java",
			},
      ignore_install = {},
      modules = {},
			auto_install = true,
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
		})
	end,
}
