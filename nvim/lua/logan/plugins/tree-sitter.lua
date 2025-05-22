-- Extra extensions
vim.filetype.add({
	extension = {
		templ = "templ",
		jsx = "javascriptreact",
	},
})

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
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		})
	end,
}
