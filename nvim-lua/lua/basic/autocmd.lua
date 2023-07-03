

-- focus 用于同一buffer的vsp分割window
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = {"*.cpp",'*.c','*.h','*.lua'},
  -- command = "<cmd>checktime<cr>",
  command = "checktime",
  desc = ""
})
vim.api.nvim_create_autocmd({ "focusLost", "BufHidden" }, {
  pattern = {"*.cpp",'*.c','*.h','*.lua'},
  command = 'update',
  desc = ""
})
