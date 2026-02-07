return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "light"
      vim.cmd.colorscheme("kanagawa-dragon")
    end,
  }
}
