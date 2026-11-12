vim.pack.add({
	-- completion
	{ src = "https://github.com/saghen/blink.cmp", version = "v1.9.1" },

	-- snippets engine
	{
		src = "https://github.com/L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
	},

	-- snippet collection
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
})

local luasnip = require("luasnip")

-- Load friendly-snippets (VSCode format)
require("luasnip.loaders.from_vscode").lazy_load()

vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "*",
	callback = function()
		local isFromSelectToNormal = vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n"
		local isFromInsertToNormal = vim.v.event.old_mode == "i" and vim.v.event.new_mode == "n"

		if
			(isFromSelectToNormal or isFromInsertToNormal)
			and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
			and not luasnip.session.jump_active
		then
			luasnip.unlink_current()
		end
	end,
})

require("blink.cmp").setup({
	appearance = { nerd_font_variant = "mono" },
	snippets = { preset = "luasnip" },
	completion = {
		documentation = { auto_show = true },
	},
	sources = {
		min_keyword_length = 3,
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = {
		implementation = "prefer_rust_with_warning",
		prebuilt_binaries = {
			force_version = "v1.9.1",
		},
	},
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
})
