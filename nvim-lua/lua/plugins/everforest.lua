local M = {
  'sainnhe/everforest',--我最喜欢的配色
  lazy = false,
}
M.config = function()
  vim.cmd([[colorscheme everforest]])
  vim.cmd([[hi Normal ctermbg=none ctermfg=none guifg=none guibg=none ]])
  vim.cmd([[hi NormalNC ctermbg=none ctermfg=none guifg=none guibg=none ]])
  vim.cmd([[hi EndOfBuffer ctermbg=none ctermfg=none guifg=none guibg=none ]])
end
return M
