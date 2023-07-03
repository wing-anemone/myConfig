local M = {
  'nvim-treesitter/nvim-treesitter', -- 基于语义的高亮
  run = ':TSUpdate'
}
M.init = function()
  vim.wo.foldmethod = "expr"
  vim.wo.foldlevel = 50
  vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
end

M.config = function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = { 'cpp', 'python', 'lua' },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  })
end

return M
