-- allow live_grep to search .env files
-- check and create .rgignore if it doesn't exist
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

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		input = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },

		indent = {
			enabled = true,
			indent = {
				char = "▏",
			},
			scope = {
				char = "▏",
			},
			animate = {
				enabled = false,
			},
		},

		dashboard = {
			sections = {
				{
					title = "NVIM",
					align = "center",
					hl = "header",
					padding = 2,
				},
				{
					{
						icon = " ",
						key = "n",
						desc = "New File",
						action = ":ene | startinsert",
					},
					{ desc = "" },
					{
						icon = " ",
						key = "f",
						desc = "Find File",
						action = ":lua Snacks.dashboard.pick('files')",
					},
					{ desc = "" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{ desc = "" },
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{ desc = "" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},

		picker = {
			enabled = true,
			sources = {
				explorer = {
					auto_close = true,
					hidden = true,
					ignored = true,
				},
			},
		},

		explorer = { enabled = true },
	},
	keys = {
		-- Explorer
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},

		-- Search
		{
			"<leader>st",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>sf",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>sr",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},

		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},

		-- Lazygit
		{
			"<leader>gl",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
	},
}
