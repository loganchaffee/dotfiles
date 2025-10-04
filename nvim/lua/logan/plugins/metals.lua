return {
	"scalameta/nvim-metals",
	dependencies = { "nvim-lua/plenary.nvim" },
	ft = { "scala", "sbt", "java" },
	opts = function()
    return require("metals").bare_config()
	end,
	config = function(self, metals_config)
    metals_config.handlers = {
      ["window/showMessage"] = function(_, result, ctx)
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        local lvl = ({
          "ERROR",
          "WARN",
          "INFO",
        })[result.type] or "INFO"

        vim.notify(result.message, vim.log.levels[lvl], {
          title = client and client.name or "LSP",
        })
      end,

      ["window/logMessage"] = function(_, result, ctx)
        -- Optional: filter unwanted messages
        if result.message:find("Indexing complete!") then
          return
        end

        local client = vim.lsp.get_client_by_id(ctx.client_id)
        local lvl = ({
          "ERROR",
          "WARN",
          "INFO",
          "DEBUG",
        })[result.type] or "INFO"

        vim.notify(result.message, vim.log.levels[lvl], {
          title = client and client.name or "LSP",
        })
      end,
    }

		local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = self.ft,
			callback = function()
				require("metals").initialize_or_attach(metals_config)
			end,
			group = nvim_metals_group,
		})
	end,
}
