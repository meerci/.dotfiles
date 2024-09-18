local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, "\n")
end

function Send_To_Terminal()
  if false == pcall(vim.api.nvim_get_chan_info, vim.g.marked_terminal_chan) then
    vim.notify("Must select a terminal", vim.log.levels.ERROR)
    return
  end

  local input
  local mode = vim.api.nvim_get_mode().mode
  if mode == "n" then
    input = vim.api.nvim_get_current_line()
  elseif mode == "v" then
    input = get_visual_selection()
    -- exit visiual mode
    vim.fn.feedkeys(":", "nx")
  end
  vim.api.nvim_chan_send(vim.g.marked_terminal_chan, input .. "\r")
end

function MarkTerminal()
  vim.g.marked_terminal_chan = nil
  local bufnr = vim.api.nvim_get_current_buf()
  for _, v in ipairs(vim.api.nvim_list_chans()) do
    if v.buffer == bufnr then
      vim.g.marked_terminal_chan = v.id
      return
    end
  end
  vim.notify("Must select a terminal", vim.log.levels.ERROR)
end

vim.keymap.set("n", "<leader>R", MarkTerminal, { silent = true, desc = "Mark Terminal" })
vim.keymap.set({ "n", "v" }, "<leader>r", Send_To_Terminal, { silent = true, desc = "Send text to terminal" })
return {}
