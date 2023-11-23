return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "clangd",
        "clang-format",
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft["c"] = { "clang-format" }
      opts.formatters_by_ft["cpp"] = { "clang-format" }
    end,
  },
}
