local M = {
  'sainnhe/everforest',--我最喜欢的配色
  lazy = false,
}
M.config = function()
  vim.cmd([[colorscheme everforest]])
  vim.cmd([[hi Normal ctermbg=none ctermfg=none guifg=none guibg=none ]])
  vim.cmd([[hi NormalNC ctermbg=none ctermfg=none guifg=none guibg=none ]])
  vim.cmd([[hi EndOfBuffer ctermbg=none ctermfg=none guifg=none guibg=none ]])
  --必须显示才能生效,guess it's a bug
  vim.cmd([[set signcolumn=number]]) --git改动状态与number共用一列
end
return M
