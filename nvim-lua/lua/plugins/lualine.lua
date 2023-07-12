local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  }
}
M.opts = {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '-', right = ''},
    section_separators = { left = '-', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true, -- very good in multi win
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {},
    -- lualine_a = {'mode'},
    --lualine_b = {"vim.b.coc_current_function"},
    lualine_b = {'vim.b.coc_symbol_line'},
    --lualine_a = {'branch', 'diff'},
    -- lualine_b = { { 'filename', path = 1 } },
    --lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'branch','diff'},
    --lualine_z = {'filename'},
    lualine_z = {'encoding'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
return M
