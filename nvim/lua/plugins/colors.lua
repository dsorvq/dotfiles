return {
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.opt.background = "dark"
      vim.cmd.colorscheme("github_light_default")
    end,
  }
}
