return {
  {
    "ojroques/vim-oscyank",
    init = function()
      vim.keymap.set("n", "<leader>y", "<Plug>OSCYankOperator", { desc = "OSCYank" })
      vim.keymap.set("n", "<leader>yy", "<leader>y_", { remap = true, desc = "OSCYank Line" })
      vim.keymap.set("v", "<leader>y", "<Plug>OSCYankVisual", { desc = "OSCYankVisual" })
    end,
  },
}
