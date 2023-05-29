return {
  {
    "echasnovski/mini.comment",
    opts = {
      comment_line = "<c-_>",
    },
    event = "VeryLazy",
    init = function()
      vim.keymap.set(
        "n",
        "<c-_>",
        "<cmd>lua require('mini.comment').toggle_lines(vim.fn.line('.'), vim.fn.line('.'))<cr>j",
        { desc = "Comment Line" }
      )
    end,
  },
}
