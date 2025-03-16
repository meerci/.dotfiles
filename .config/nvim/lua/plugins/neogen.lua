return {
  {
    "danymat/neogen",
    config = true,
    init = function()
      vim.keymap.set("n", "<leader>nc", function()
        require("neogen").generate()
      end, { desc = "Generate Document" })
    end,
  },
}
