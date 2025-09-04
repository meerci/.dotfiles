-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "vv", "<c-v>", { desc = "visiual block" })

map({ "n", "v" }, "<s-h>", "^", { desc = "Soft line front" })
map({ "n", "v" }, "<s-l>", "g_", { desc = "Soft line end" })

map("n", "<a-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<m-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<a-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<m-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

map("i", "<c-h>", "<left>")
map("i", "<c-l>", "<right>")

-- map("n", "<leader>r", "<cmd>w<cr><leader>ft<up><cr>", { desc = "quick run", remap = true })

map("n", "!", "@:", { desc = "repeat last cmd", remap = true })

map("n", "dm", ":execute 'delmarks '.nr2char(getchar())<cr>", { desc = "delete mark", remap = false })

-- vim.keymap.set("n", "<esc>", function()
--   require("noice").cmd("dismiss")
--   vim.cmd("nohl")
--   vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n")
-- end, { noremap = true })

map("n", "<leader>ur", function()
  vim.g.format_hunks = not vim.g.format_hunks
  vim.notify("Format Git Hunks Only: " .. tostring(vim.g.format_hunks))
end, { desc = "toggle format hunks only", remap = false })

map("n", "<leader>cF", function()
  require("conform").format()
end, { desc = "format file", remap = false })

map("n", "<leader>cf", function()
  if not vim.g.format_hunks then
    require("conform").format()
  else
    local hunks = require("gitsigns").get_hunks(0)
    if hunks == nil then
      vim.notify_once("no git hunks in this buffer", vim.log.levels.WARN)
      return
    end
    local format = require("conform").format
    for i = #hunks, 1, -1 do
      local hunk = hunks[i]
      if hunk ~= nil and hunk.type ~= "delete" then
        local start = hunk.added.start
        local last = start + hunk.added.count
        -- nvim_buf_get_lines uses zero-based indexing -> subtract from last
        local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
        local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
        format({ range = range })
      end
    end
  end
end, { desc = "format", remap = false })

map("n", "du", "<cmd>diffupdate<cr>", { desc = "diffupdate", remap = false })
map("n", "do", "<cmd>diffget<cr>", { desc = "diffget", remap = false })
map("n", "dp", "<cmd>diffput<cr>", { desc = "diffput", remap = false })
map("n", "gs", "<leader>sw", { desc = "search cursor word", remap = true, silent = true })
map("v", "gs", "<leader>sw", { desc = "search cursor word", remap = true, silent = true })
