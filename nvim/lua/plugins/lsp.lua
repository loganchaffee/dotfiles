return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",

		-- Snippets (see ./snippets.lua for configuration)
		"saghen/blink.cmp",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),

			callback = function(event)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to definition" })
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
				vim.keymap.set("n", "<leader>>", vim.lsp.buf.code_action, { desc = "Code action" })

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

		-- Manage language server installations
		require("mason").setup({
			ui = {
				width = WindowSettings.width,
				height = WindowSettings.height,
			},
		})

		-- Automatically enables any language servers installed through Mason
		require("mason-lspconfig").setup()

		-- Open Mason window
		vim.keymap.set("n", "<leader>M", vim.cmd.Mason, { desc = "Mason" })

		-- Toggle diagnostic message in float window
		vim.keymap.set("n", "<leader>l", function()
			vim.diagnostic.open_float(nil, { scope = "line" })
		end, { desc = "Open diagnostics message" })
	end,
}
