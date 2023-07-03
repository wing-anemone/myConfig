local M = {
  'gelguy/wilder.nvim', --更加智能的命令窗口
  dependencies = { 'romgrk/fzy-lua-native', },
}
M.config = function()
  local wilder = require('wilder')
  wilder.setup({
    modes = { ':' },
    -- next_key = '<c-j>', previous_key = '<C-k>'
  })
  -- Disable Python remote plugin
  wilder.set_option('use_python_remote_plugin', 0)

  wilder.set_option('pipeline', {
    wilder.branch(
      wilder.cmdline_pipeline({
        fuzzy = 2, -- 1:trun on, 2:partical match
        fuzzy_filter = wilder.lua_fzy_filter(),
      }),
      wilder.vim_search_pipeline()
    )
  })

  wilder.set_option('renderer', wilder.renderer_mux({
    [':'] = wilder.popupmenu_renderer(
      wilder.popupmenu_border_theme({
        border = 'rounded',
        empty_message = wilder.popupmenu_empty_message_with_spinner(),
        highlighter = wilder.lua_fzy_highlighter(),
        left = {
          ' ',
          wilder.popupmenu_devicons(),
          --[[
          wilder.popupmenu_buffer_flags({
            flags = ' a + ',
            icons = { ['+'] = '', a = '', h = '' },
          }),
          ]]
        },
        right = {
          ' ',
          wilder.popupmenu_scrollbar()
        },
      })
    ),
    ['/'] = wilder.wildmenu_renderer({
      highlighter = wilder.lua_fzy_highlighter(),
    }),
  }))
end
return M
