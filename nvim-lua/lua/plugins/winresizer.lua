local M = {
  'simeji/winresizer', -- 调节 window 大小
}
M.init = function()
  -- need load before winresizer init()
  vim.g.winresizer_start_key = 'ca'
  -- If you cancel and quit window resize mode by `q` (keycode 113)
  vim.g.winresizer_keycode_cancel = 113
end
return M
