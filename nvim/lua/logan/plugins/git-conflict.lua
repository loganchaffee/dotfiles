return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
---@diagnostic disable-next-line: missing-fields
		require("git-conflict").setup({
      default_mappings = {
        ours = 'ao',
        theirs = 'at',
        none = 'a0',
        both = 'ab',
        next = 'n',
        prev = 'p',
      },
    })
	end,
}
