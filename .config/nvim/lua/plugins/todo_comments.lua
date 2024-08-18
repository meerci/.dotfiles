local pattern = "(KEYWORDS)"
return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function(_, opts)
      opts.highlight = opts.highlight or {}
      opts.search = opts.search or {}
      opts.highlight.pattern = "\\W" .. pattern .. "\\W"
      opts.search.pattern = "\\W" .. pattern .. "\\W"
    end,
  },
}
