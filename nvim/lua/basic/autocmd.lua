
local filetypes = {"*.json","*.cpp",'*.c','*.h','*.lua'}
-- focus 用于同一buffer的vsp分割window
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = filetypes,
  -- command = "<cmd>checktime<cr>",
  command = "checktime",
  desc = ""
})
vim.api.nvim_create_autocmd({ "focusLost", "BufHidden" }, {
  pattern = filetypes,
  command = 'update',
  desc = ""
})
