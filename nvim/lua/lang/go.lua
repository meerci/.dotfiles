return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "gopls",
      })
    end,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("lspconfig").gopls.setup({
  --       settings = {
  --         gopls = {
  --         },
  --       },
  --     })
  --   end,
  -- },
}
