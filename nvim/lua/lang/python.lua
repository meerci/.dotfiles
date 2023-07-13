return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "pyright",
        "ruff-lsp",
        -- "pylint",
        "ruff",
        "isort",
      })
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources, {
        nls.builtins.formatting.isort,
        nls.builtins.formatting.ruff,
        nls.builtins.formatting.black,
        -- nls.builtins.diagnostics.pylint,
      })
    end,
  },
}
