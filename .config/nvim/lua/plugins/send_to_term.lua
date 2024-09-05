vim.keymap.set("n", "<leader>R", function()
  vim.g.marked_terminal_chan = nil
  local bufnr = vim.api.nvim_get_current_buf()
  for _, v in ipairs(vim.api.nvim_list_chans()) do
    if v.buffer == bufnr then
      vim.g.marked_terminal_chan = v.id
      return
    end
  end
  vim.notify("Must select a terminal", vim.log.levels.ERROR)
end, { silent = true, desc = "" })

vim.keymap.set({ "n", "v" }, "<leader>r", function()
  local mode = vim.api.nvim_get_mode().mode
  local input
  if mode == "v" or mode == "V" then
    -- BUG: 
    local lpos = vim.fn.getpos("<")
    local rpos = vim.fn.getpos(">")
    input = vim.api.nvim_buf_get_text(0, lpos[1], lpos[2], rpos[1], rpos[2], {})
    input = table.concat(input, '\n')
  else
    input = vim.api.nvim_get_current_line()
  end
  vim.api.nvim_chan_send(vim.g.marked_terminal_chan, input .. "\r")
end, { silent = true, desc = "" })

return {}
