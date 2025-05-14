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

require("logan")

vim.o.winborder = "rounded"
