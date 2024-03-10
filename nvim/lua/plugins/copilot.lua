local M = {
  "github/copilot.vim",
  --event = { "BufReadPost", "BufNewFile" },
}
M.config = function()
  --vim.keymap.set('i', '<C-f>', '<Plug>(copilot-next))')
  vim.keymap.set('i', '<C-;>', '<Plug>(copilot-previous)')
end
return M
