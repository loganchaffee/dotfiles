return {
	"saghen/blink.cmp",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			config = function()
				local luasnip = require("luasnip")

				-- When in a snippet "session", exiting to normal modal cancels the session
				-- so that hitting tab doesn't take you back to the placeholders
				vim.api.nvim_create_autocmd("ModeChanged", {
					pattern = "*",
					callback = function()
						if
							(
                ---@diagnostic disable-next-line: undefined-field
								(vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n")
								or
                ---@diagnostic disable-next-line: undefined-field
                (vim.v.event.old_mode == "i" and vim.v.event.new_mode == "n")
							)
							and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
							and not luasnip.session.jump_active
						then
							luasnip.unlink_current()
						end
					end,
				})
			end,
		},
	},
	version = "1.*",
	opts = {
		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = true },
		},

		snippets = {
			preset = "luasnip",
		},

		sources = {
			min_keyword_length = 3,
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },

		keymap = {
			preset = "default",
			["<c-k>"] = { "select_prev", "fallback" },
			["<c-j>"] = { "select_next", "fallback" },
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_and_accept()
					end
				end,
				"snippet_forward",
				"fallback",
			},
		},
	},
	opts_extend = { "sources.default" },
}
