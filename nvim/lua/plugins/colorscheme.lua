vim.pack.add({ "https://github.com/catppuccin/nvim.git" })

require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
})

vim.cmd.colorscheme("catppuccin")

vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight VertSplit guibg=NONE ctermbg=NONE
  highlight StatusLine guibg=NONE ctermbg=NONE
  highlight StatusLineNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE

  highlight NormalFloat guibg=NONE ctermbg=NONE
  highlight FloatBorder guibg=NONE ctermbg=NONE
  highlight FloatTitle guibg=NONE ctermbg=NONE
]])
