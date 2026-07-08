vim.pack.add({ "https://github.com/stevearc/conform.nvim.git" })

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
		-- GraphQL = { "prettier" },
		GraphQL = {},
		lua = { "stylua" },
		python = { "isort", "black" },
		c = { "clang-format" },
		go = { "goimports", "gofmt" },
		scala = { "scalafmt" },
	},
	format_on_save = {
		lsp_fallback = false,
		async = false,
		timeout_ms = 500,
	},
})
