vim.pack.add({
	"https://github.com/akinsho/bufferline.nvim.git",
	"https://github.com/nvim-tree/nvim-web-devicons.git"
})

vim.cmd([[colorscheme catppuccin]])

require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    separator_style = { "", "" },
    modified_icon = "●",
    show_buffer_close_icons = false,
  },
})

