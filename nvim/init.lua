WindowDimentions = {
	width = 130,
	height = 40,
}

-- Check and create .rgignore if it doesn't exist
local home = os.getenv("HOME")
local rgignore_path = home .. "/.rgignore"
local rgignore_file = io.open(rgignore_path, "r")

if not rgignore_file then
	rgignore_file = io.open(rgignore_path, "w")
	if rgignore_file then
		rgignore_file:write("!.env*\n")
		rgignore_file:close()
	end
else
	rgignore_file:close()
end

vim.o.winborder = "rounded"

-- Hacky fix for telescop winborder issue
vim.api.nvim_create_autocmd("User", {
	pattern = "TelescopeFindPre",
	callback = function()
		vim.opt_local.winborder = "none"
		vim.api.nvim_create_autocmd("WinLeave", {
			once = true,
			callback = function()
				vim.opt_local.winborder = "rounded"
			end,
		})
	end,
})

require("logan")
