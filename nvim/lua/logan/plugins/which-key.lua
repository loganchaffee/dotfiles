return {
  "folke/which-key.nvim",
  config = function ()
    local wk = require("which-key")

    wk.setup({
      delay = function(ctx)
        return ctx.plugin and 0 or 500
      end,
    })

    wk.add({
      { "<leader>s", group = "Search" },
      { "<leader>g", group = "Git" },
      { "<leader>b", group = "Buffers" },
      { "<leader>L", icon = "" },
      { "<leader>M", icon = "" },
      { "<leader>h", icon = "󰜺" },

    })
  end
}
