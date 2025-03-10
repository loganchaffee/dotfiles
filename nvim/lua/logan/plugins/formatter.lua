return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				c = { "clang-format" },
				go = { "goimports", "gofmt" },
				-- php = { "php-cs-fixer" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
			-- formatters = {
			-- 	["php-cs-fixer"] = {
			-- 		command = "php-cs-fixer",
			-- 		args = {
			-- 			"fix",
			-- 			-- "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
			-- 			"$FILENAME",
			-- 		},
			-- 		stdin = false,
			-- 	},
			-- },
		})
	end,
}
