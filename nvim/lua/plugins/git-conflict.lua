vim.pack.add({ "https://github.com/akinsho/git-conflict.nvim.git" })

require("git-conflict").setup({
  default_mappings = {
    ours = 'ao',
    theirs = 'at',
    none = 'a0',
    both = 'ab',
    next = 'n',
    prev = 'p',
  },
})
