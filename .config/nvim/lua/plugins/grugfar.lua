return {
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require("grug-far")
          grug.grug_far({
            transient = true,
            prefills = {
              search = vim.fn.expand("<cword>"),
            },
          })
          vim.api.nvim_buf_set_option(vim.api.nvim_get_current_buf(), "wrap", false)
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },
}
