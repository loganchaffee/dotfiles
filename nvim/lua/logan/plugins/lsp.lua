return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",

		-- Better Typescript Support
		"pmizio/typescript-tools.nvim",
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",

		-- Snippets (see ./snippets.lua for configuration)
		"saghen/blink.cmp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func)
					vim.keymap.set("n", keys, func)
				end

				map("K", vim.lsp.buf.hover)
				map("gD", vim.lsp.buf.declaration)
				map("<leader>rn", vim.lsp.buf.rename)
				map("<leader>>", vim.lsp.buf.code_action)

				local client = vim.lsp.get_client_by_id(event.data.client_id)

				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		local lspconfig = require("lspconfig")

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Lua
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		-- JavaScript / TypeScript
		lspconfig.ts_ls.setup({ capabilities = capabilities })

		-- Manage language server installations
		require("mason").setup({
			ui = {
				width = WindowDimentions.width,
				height = WindowDimentions.height,
			},
		})

		-- Automatically enables any language servers installed through Mason
		require("mason-lspconfig").setup()
	end,
}
