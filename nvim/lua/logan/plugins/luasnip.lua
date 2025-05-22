return {
	"L3MON4D3/LuaSnip",
	build = (function()
		-- Build Step is needed for regex support in snippets
		-- This step is not supported in many windows environments
		-- Remove the below condition to re-enable on windows
		if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
			return
		end
		return "make install_jsregexp"
	end)(),
	dependencies = {
		-- `friendly-snippets` contains a variety of premade snippets.
		--    See the README about individual language/framework/plugin snippets:
		--    https://github.com/rafamadriz/friendly-snippets
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
						(vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n")
						or (vim.v.event.old_mode == "i" and vim.v.event.old_mode == "n")
					)
					and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
					and not luasnip.session.jump_active
				then
					luasnip.unlink_current()
				end
			end,
		})
	end,
}
