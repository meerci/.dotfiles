local M = {}
M.set_opfunc = vim.fn[vim.api.nvim_exec(
  [[
  func s:set_opfunc(val)
    let &opfunc = a:val
  endfunc
  echon get(function('s:set_opfunc'), 'name')
]],
  true
)]

M.get_selection = function(p_start, p_end)
  local s_start = vim.fn.getpos(p_start)
  local s_end = vim.fn.getpos(p_end)
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, "\n")
end

M.MarkTerminal = function(bufnr)
  if bufnr == nil then
    bufnr = vim.api.nvim_get_current_buf()
  end

  vim.g.marked_terminal_chan = nil
  for _, v in ipairs(vim.api.nvim_list_chans()) do
    if v.buffer == bufnr then
      vim.g.marked_terminal_chan = v.id
      break
    end
  end
  if vim.g.marked_terminal_chan == nil then
    vim.notify("This buffer is not a terminal", vim.log.levels.ERROR)
  else
    vim.notify("Select Terminal " .. bufnr, vim.log.levels.INFO)
  end
end

M.SendToTerm = function(text)
  if false == pcall(vim.api.nvim_get_chan_info, vim.g.marked_terminal_chan) then
    vim.notify("Terminal buffer doest not exist", vim.log.levels.ERROR)
    return
  end
  vim.api.nvim_chan_send(vim.g.marked_terminal_chan, text)
end

M.SendVisiualToTerm = function()
  local mode = vim.api.nvim_get_mode().mode
  if mode == "v" or mode == "V" then
    -- exit visiual mode
    vim.api.nvim_feedkeys('\027', 'xt', false)
    local text = M.get_selection("'<", "'>")
    M.SendToTerm(text .. "\r")
  else
    vim.notify("Unsupported mode: " .. mode)
  end
end

M.SendMotionToTerm = function(motion)
  if motion == nil then
    M.set_opfunc(M.SendMotionToTerm)
    vim.api.nvim_feedkeys("g@", "n", false)
  else
    M.SendToTerm(M.get_selection("'[", "']") .. "\r")
  end
end

vim.keymap.set("n", "<leader>rm", M.MarkTerminal, { silent = true, desc = "Mark Terminal" })
vim.keymap.set("v", "<leader>r", M.SendVisiualToTerm, { silent = true, desc = "Send visiual to terminal" })
vim.keymap.set("n", "<leader>rs", M.SendMotionToTerm, { silent = true, desc = "Send motion text to terminal" })
vim.keymap.set("n", "<leader>rr", function()
  M.SendToTerm(vim.api.nvim_get_current_line() .. "\r")
end, { noremap = true, silent = true, desc = "Send line to terminal" })

return {}
