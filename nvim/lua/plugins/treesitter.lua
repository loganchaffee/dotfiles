vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter.git" })

local installed_parsers = {
	"javascript",
	"typescript",
	"tsx",
	"css",
	"scss",
	"html",
	"go",
	"php",
	"scala",
	"bash",
	"python",
	"java",
}

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		local ft = vim.bo.filetype
		if vim.tbl_contains(installed_parsers, ft) then
			pcall(vim.treesitter.start)
		end
	end,
})
