return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local function setup_clangd()
        vim.lsp.config['clangd'] = {
          cmd = { "clangd", "--background-index", "-j", "8"},
        }

        vim.lsp.enable('clangd')
      end

      local function setup_rust()
        vim.lsp.enable('rust_analyzer')
      end

      local function setup_bash()
        vim.lsp.enable('bashls')
      end

      local function setup_go()
        vim.lsp.config('gopls', {
          cmd = { 'ya', 'tool', 'gopls' },
        })
        vim.lsp.enable('gopls')
      end

      local function setup_python()
        -- ignore python
        -- vim.lsp.enable('pyright')
        -- vim.lsp.enable('ruff')
      end

      setup_clangd()
      setup_rust()
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

  -- TODO: i don't think this work well
  {
    "tpope/vim-sleuth"
  },
}

