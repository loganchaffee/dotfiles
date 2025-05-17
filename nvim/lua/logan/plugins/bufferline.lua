return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		-- local bg = "#1e1e1e"

		require("bufferline").setup({
			-- highlights = {
			-- fill = { bg = bg },
			--
			-- background = { bg = bg },
			-- buffer_visible = { bg = bg },
			-- buffer_selected = { bg = bg },
			--
			-- tab = { bg = bg },
			-- tab_selected = { bg = bg },
			-- tab_close = { bg = bg },
			--
			-- separator = { bg = bg },
			-- separator_selected = { bg = bg },
			-- separator_visible = { bg = bg },
			--
			-- modified = { bg = bg },
			-- modified_visible = { bg = bg },
			-- modified_selected = { bg = bg },
			--
			-- offset = { bg = bg },
			-- },
			options = {
				diagnostics = "nvim_lsp",
				separator_style = { "", "" },
				modified_icon = "●",
				show_buffer_close_icons = false,
				offsets = {
					{
						filetype = "NvimTree",
						text = "",
						separator = false,
						text_align = "left",
					},
				},
			},
		})
	end,
}
