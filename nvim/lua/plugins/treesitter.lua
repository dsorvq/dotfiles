return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { 
          "c", "cpp", 
          "lua", "vim", "vimdoc", 
          "query", "markdown" 
        },
        sync_install = false,

        highlight = { 
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        -- i'm just not able to make this work :| 
        --indent = { 
          --enable = true
          --},  
      })
    end
  }
}
