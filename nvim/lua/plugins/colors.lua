return {
  {
    "projekt0n/github-nvim-theme",
    -- dependencies = { "rktjmp/lush.nvim" },
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd([[set background=dark]])
      vim.cmd([[colorscheme github_dark_high_contrast]])
    end,
  }
}
