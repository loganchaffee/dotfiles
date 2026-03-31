vim.lsp.enable('lua_ls')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
      vim.keymap.set("n", "<leader>>", vim.lsp.buf.code_action, { desc = "Code action" })

      vim.keymap.set("n", "<leader>l", function()
        vim.diagnostic.open_float(nil, { scope = "line" })
      end, { desc = "Open diagnostics message" })

      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end)
    end
  end
})

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  signs = true
})
