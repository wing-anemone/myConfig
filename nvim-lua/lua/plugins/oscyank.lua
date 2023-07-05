local M = {
  'ojroques/vim-oscyank',--与terminal配合复制内容，绕过vim
  lazy=false,
  branch = 'main'
}
M.config = function()
  --<cmd>和<Plug>不一样, cmd莫名报错
  vim.keymap.set('v', '<space>y', '<Plug>OSCYankVisual', { silent = true })
end
return M
