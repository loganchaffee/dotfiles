vim.pack.add({ 
  "https://github.com/nvim-treesitter/nvim-treesitter.git",
  "https://github.com/numToStr/Comment.nvim.git" 
})

require("Comment").setup({
  toggler = { line = "<leader>/" },
  opleader = { line = "<leader>/" },
})
