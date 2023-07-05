local M = {
  'ojroques/vim-oscyank',
  lazy=false,
  branch = 'main'
}
M.config = function()
  vim.keymap.set('v', '<space>y', '<Plug>OSCYankVisual', { silent = true })
end
return M
