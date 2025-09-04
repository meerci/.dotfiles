-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.foldmethod = "indent"
vim.o.foldenable = false
vim.o.foldlevel = 99
vim.o.fileencodings = "utf8,gbk"
-- vim.o.relativenumber = false
vim.g.autoformat = false
vim.g.format_hunks = false
vim.g.root_spec = { { ".git", "lua","src"}, "cwd" }

-- open use neovim in nested shell
-- install neovim-remote first
vim.env.GIT_EDITOR = 'nvr --nostart --remote-tab-wait +"set bufhidden=delete"'

vim.o.expandtab = true
