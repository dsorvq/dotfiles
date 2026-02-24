return {
  {
    -- "ellisonleao/gruvbox.nvim",
    -- "shaunsingh/nord.nvim",
    "jpwol/thorn.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("thorn").setup({
        theme = dark, -- 'light' or 'dark' - defaults to vim.o.background if unset
        background = "warm", -- options are 'warm' and 'cold'

        styles = {
          keywords = { italic = false },
          comments = { italic = false },
          strings  = { italic = false },
          variables  = { italic = false },
          functions = { italic = false },
          parameters = { italic = false },
        },
      })
      -- TODO: have no idea how to properly disalbe italic, but this works
      vim.api.nvim_set_hl(0, "@function.builtin.lua", { italic = false })
      vim.api.nvim_set_hl(0, "@function.builtin", { italic = false })

      -- vim.g.nord_italic = false -- for nord
      vim.opt.background = "dark"
      vim.cmd.colorscheme("thorn")
    end,
  }
}
