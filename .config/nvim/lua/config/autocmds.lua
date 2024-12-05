-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = "quickfix",
  callback = function(args)
    vim.api.nvim_buf_set_keymap(args.buf, "n", "o", "<cr><c-w>w", { silent = true, desc = "preview item" })
  end,
})

vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = { "*.p4", "*.npl" },
  callback = function(_)
    vim.cmd("set ft=cpp")
  end,
})

vim.api.nvim_create_autocmd({ "LspAttach" }, {
  pattern = { "*.p4", "*.npl" },
  callback = function(args)
    local clients = vim.lsp.get_clients({ bufnr = args.buf })
    vim.lsp.stop_client(clients, false)
  end,
})

vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = "*.cli",
  callback = function(_)
    vim.cmd("set ft=sh")
  end,
})
