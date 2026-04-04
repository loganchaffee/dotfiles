vim.pack.add({ "https://github.com/f-person/git-blame.nvim.git" })

require("gitblame").setup({
  enabled = false,
  date_format = "%r",
  message_when_not_committed = "  You • <date> • Uncommited",
})

vim.keymap.set("n", "<leader>gb", vim.cmd.GitBlameToggle, { desc = "Git line blame" })

