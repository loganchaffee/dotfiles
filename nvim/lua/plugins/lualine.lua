vim.opt.laststatus = 3

vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim.git" })

require("lualine").setup({
  options = { theme = "auto" }
})
