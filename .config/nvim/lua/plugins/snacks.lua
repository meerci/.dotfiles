return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        win = {
          position = "float",
          border = "rounded",
        },
      },
      picker = {
        previewers = {
          file = {
            max_size = 10 * 1024 * 1024, -- 10MB
            max_line_length = 100000,
          },
        },
      },
    },
  },
}
