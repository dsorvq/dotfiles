return {
  {
    -- "kdheepak/monochrome.nvim",
    "dsorvq/oscuron.vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme oscuron]])
    end,
  }
}
