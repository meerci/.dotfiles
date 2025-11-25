return {
  {
    "sindrets/diffview.nvim",
    init = function()
      vim.o.diffopt = "context:99999"

      vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<cr>", { desc = "diffview open" })
      vim.keymap.set("n", "<leader>dO", ":DiffviewOpen ", { desc = "diffview with ?" })
      vim.keymap.set("n", "<leader>d1", "<cmd>DiffviewOpen HEAD^<cr>", { desc = "diffview with HEAD^" })
      vim.keymap.set("n", "<leader>d2", "<cmd>DiffviewOpen HEAD~2<cr>", { desc = "diffview with HEAD~2" })
      vim.keymap.set("n", "<leader>d3", "<cmd>DiffviewOpen HEAD~2<cr>", { desc = "diffview with HEAD~3" })
      vim.keymap.set("n", "<leader>d4", "<cmd>DiffviewOpen HEAD~3<cr>", { desc = "diffview with HEAD~4" })

      vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<cr>", { desc = "diffview clsoe" })

      vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory<cr>", { desc = "diffview history" })
      vim.keymap.set("n", "<leader>df", "<cmd>DiffviewFileHistory %<cr>", { desc = "diffview current file history" })
      vim.keymap.set("n", "<leader>dF", ":DiffviewFileHistory ", { desc = "diffview history of ?" })

      vim.keymap.set("n", "<leader>dr", "<cmd>DiffviewRefresh<cr>", { desc = "diffview refresh" })
    end,
    config = function()
      local actions = require("diffview.actions")
      require("diffview").setup({
        enhanced_diff_hl = true,
        view = {
          default = { layout = "diff2_vertical" },
          file_history = { layout = "diff2_vertical" },
          merge_tool = { layout = "diff3_mixed", disable_diagnostics = true },
        },
        keymaps = {
          view = {
            { "n", "]]", "<cmd>norm! ]c<cr>", { desc = "Next Hunk" } },
            { "n", "[[", "<cmd>norm! [c<cr>", { desc = "Prev Hunk" } },
            { "n", "]c", "<cmd>norm! ]c<cr>", { desc = "Next Hunk" } },
            { "n", "[c", "<cmd>norm! [c<cr>", { desc = "Prev Hunk" } },
          },
        },
      })
    end,
  },
}
