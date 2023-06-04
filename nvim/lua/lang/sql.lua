local sql_dialect = "sqlite"
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "sql",
      })
      opts.auto_install = true
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "sqlfluff",
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources, {
        nls.builtins.formatting.sqlfluff.with({
          extra_args = { "--dialect", sql_dialect },
        }),
        nls.builtins.diagnostics.sqlfluff.with({
          extra_args = { "--dialect", sql_dialect },
        }),
      })
    end,
  },
}
