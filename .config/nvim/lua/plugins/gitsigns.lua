return {
  "lewis6991/gitsigns.nvim",
  event = "LazyFile",
  opts = {
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- stylua: ignore start
      map("n", "]]", function() gs.nav_hunk("next") end, "Next Change")
      map("n", "[[", function() gs.nav_hunk("prev") end, "Prev Change")
      map("n", "]h", function() gs.nav_hunk("next", { target = "all" }) end, "Next Hunk")
      map("n", "[h", function() gs.nav_hunk("prev", { target = "all" }) end, "Prev Hunk")
      map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>gp", gs.preview_hunk_inline, "Preview Hunk Inline")
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>gd", gs.diffthis, "Diff This")
      map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff This ~")
    end,
  },
}
