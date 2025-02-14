return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "verible",
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft["verilog"] = { "verible" }
      require("lspconfig").verible.setup({
        root_dir = require("lazyvim.util").root.get,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    setup = function()
      require("lspconfig").verible.setup({
        root_dir = require("lazyvim.util").root.get,
      })
    end,
  },
}
