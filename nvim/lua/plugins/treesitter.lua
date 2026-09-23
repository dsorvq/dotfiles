local languages = { "c", "cpp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" }

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")

    -- Keep parsers installed by the previous nvim-treesitter setup available.
    treesitter.setup({ install_dir = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter" })
    treesitter.install(languages)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp", "lua", "vim", "help", "query", "markdown" },
      callback = function(args)
        local path = vim.api.nvim_buf_get_name(args.buf)
        local stats = path ~= "" and vim.uv.fs_stat(path)
        if stats and stats.size > 100 * 1024 then
          return
        end
        vim.treesitter.start(args.buf)
      end,
    })
  end,
}
