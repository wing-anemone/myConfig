local M = {
  'sainnhe/everforest',--我最喜欢的配色
  lazy = false,
  priority = 1000,
}
M.config = function()
  vim.cmd([[colorscheme everforest]])
  vim.cmd([[hi Normal ctermbg=none ctermfg=none guifg=none guibg=none ]])
  vim.cmd([[hi NormalNC ctermbg=none ctermfg=none guifg=none guibg=none ]])
  vim.cmd([[hi EndOfBuffer ctermbg=none ctermfg=none guifg=none guibg=none ]])
  vim.cmd([[hi CursorLine guibg=#2f4f4f]])
  vim.cmd([[hi CursorColumn guibg=#2f4f4f]])
  vim.cmd([[hi CocSymbolLineSeparator guifg=#ffffff]])
  vim.cmd([[hi CocSymbolLine guifg=#ff9200]])
end
return M
