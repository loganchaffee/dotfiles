vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/scalameta/nvim-metals",
})

local metals = require("metals")

-- IMPORTANT! Set JAVA_HOME and PATH.
-- Metals needs Java version 17+ but many Scala 2 projects are using Java 11 or earlier.
-- Multiple Java versions can be managed with SDK Man, so that will be used to provide
-- Metals with the correct version
vim.env.JAVA_HOME = os.getenv("HOME") .. "/.sdkman/candidates/java/17.0.14-amzn"
vim.env.PATH = vim.env.JAVA_HOME .. "/bin:" .. vim.env.PATH

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt", "java" },
	callback = function()
		metals.initialize_or_attach(metals.bare_config())
	end,
	group = nvim_metals_group,
})
