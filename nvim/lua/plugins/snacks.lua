-- allow live_grep to search .env files
-- check and create .rgignore if it doesn't exist
local home = os.getenv("HOME")
local rgignore_path = home .. "/.rgignore"
local rgignore_file = io.open(rgignore_path, "r")

if not rgignore_file then
	rgignore_file = io.open(rgignore_path, "w")
	if rgignore_file then
		rgignore_file:write("!.env*\n")
		rgignore_file:close()
	end
else
	rgignore_file:close()
end

vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons.git",
  "https://github.com/folke/snacks.nvim.git"
})

require("snacks").setup({
  input = { enabled = false },
  notifier = { enabled = false },
  quickfile = { enabled = false },
  scope = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  dashboard = { enabled = false },

  bigfile = { enabled = true },
  explorer = { enabled = false },

  indent = {
    enabled = true,
    indent = { char = "▏" },
    scope = { char = "▏" },
    animate = { enabled = false },
  },

  picker = {
    enabled = true,
    sources = {
      explorer = {
        auto_close = true,
        hidden = true,
        ignored = true,
      },
    },
  },
})


-- Explorer
vim.keymap.set("n", "<leader>e", function()
  require("snacks").explorer()
end, { desc = "File Explorer" })

-- Search
vim.keymap.set("n", "<leader>st", function()
  require("snacks").picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>sb", function()
  require("snacks").picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>sf", function()
  require("snacks").picker.files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>sr", function()
  require("snacks").picker.files()
end, { desc = "Find Files" })

-- LSP
vim.keymap.set("n", "gd", function()
  require("snacks").picker.lsp_definitions()
end, { desc = "Goto Definition" })

vim.keymap.set("n", "gr", function()
  require("snacks").picker.lsp_references()
end, { desc = "References", nowait = true })

vim.keymap.set("n", "gr", function()
  vim.lsp.buf.references()
end, { desc = "LSP References" })

-- Lazygit
vim.keymap.set("n", "<leader>gl", function()
  require("snacks").lazygit()
end, { desc = "Lazygit" })
