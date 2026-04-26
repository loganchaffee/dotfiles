vim.pack.add({
	"https://github.com/leoluz/nvim-dap-go",
	"https://github.com/mfussenegger/nvim-dap.git",
})

local dap = require("dap")
local dapgo = require("dap-go")

dapgo.setup()
