return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local function setup_clangd()
        vim.lsp.enable('clangd')
      end

      local function setup_bash()
        vim.lsp.enable('bashls')
      end

      local function setup_go()
        vim.lsp.enable('gopls')
      end

      local function setup_python()
        -- ignore python
        -- vim.lsp.enable('pyright')
        -- vim.lsp.enable('ruff')
      end

      setup_clangd()
      setup_bash()
      setup_go()
      setup_python()

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
  },

  -- TODO: move to separate module?
  {
    "tpope/vim-sleuth"
  },
}

