local header = [[
██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗
██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝
██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  
██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  
╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗
 ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝
                                                              
          ██╗      ██████╗  ██████╗  █████╗ ███╗   ██╗          
          ██║     ██╔═══██╗██╔════╝ ██╔══██╗████╗  ██║          
          ██║     ██║   ██║██║  ███╗███████║██╔██╗ ██║          
          ██║     ██║   ██║██║   ██║██╔══██║██║╚██╗██║          
          ███████╗╚██████╔╝╚██████╔╝██║  ██║██║ ╚████║          
          ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝          

                                                              ]]

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = false },
		input = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },

		indent = {
			char = "▏",
			animate = {
				enabled = false,
			},
		},

		dashboard = {
			preset = {
				header = header,
			},
		},

		picker = {
			enabled = true,
			sources = {
				explorer = {
					auto_close = true,
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
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
	},
}
