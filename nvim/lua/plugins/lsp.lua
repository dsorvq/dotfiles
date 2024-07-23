return {
  { 
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      {'neovim/nvim-lspconfig'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/nvim-cmp'},
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)
      require('lspconfig').clangd.setup({
        cmd = { "clangd", "--background-index", "--clang-tidy" },  -- Command to start the language server with additional options
        filetypes = { "c", "cpp", "objc", "objcpp" },  -- File types to associate with clangd
        flags = {
          debounce_text_changes = 150,
        }
      })
      local cmp = require('cmp')

      cmp.setup({
        sources = {
          {name = 'nvim_lsp'},
        },
        mapping = {
          ['<C-y>'] = cmp.mapping.confirm({select = false}),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
          ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
          ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item({behavior = 'insert'})
            else
              cmp.complete()
            end
          end),
          ['<tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({behavior = 'insert'})
            else
              fallback()
            end
          end),
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end
  },
  {
    "tpope/vim-sleuth"
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
}

