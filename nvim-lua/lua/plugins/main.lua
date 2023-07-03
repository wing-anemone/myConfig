return {
  {
    'sainnhe/everforest',
    lazy = false,
    config = function()
      vim.cmd([[colorscheme everforest]])
      vim.cmd([[hi Normal ctermbg=none ctermfg=none guifg=none guibg=none ]])
      vim.cmd([[hi NormalNC ctermbg=none ctermfg=none guifg=none guibg=none ]])
      vim.cmd([[hi EndOfBuffer ctermbg=none ctermfg=none guifg=none guibg=none ]])
    end
  }
}
