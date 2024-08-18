return {
  {
    "artemave/workspace-diagnostics.nvim",
    init = function()
      vim.api.nvim_set_keymap("n", "<space>xa", "", {
        noremap = true,
        callback = function()
          for _, client in ipairs(vim.lsp.get_clients()) do
            require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
          end
        end,
        desc = "populate workspace diagnostics",
      })
    end,
  },
}
