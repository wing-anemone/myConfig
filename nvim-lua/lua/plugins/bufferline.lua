local M = {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
}
M.config = function()
  require("bufferline").setup {
    options = {
      sort_by = "id",
      --[[
      groups = {
        options = {
          -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
          toggle_hidden_on_enter = true
        },
        items = {
          {
            name = "Tests",         -- Mandatory
            --highlight = { underline = true, sp = "blue" }, -- Optional
            priority = 2,           -- determines where it will appear relative to other groups (Optional)
            matcher = function(buf) -- Mandatory
              return buf.name:match('%.l.*')
            end,
          },
          {
            name = "c",
            highlight = { undercurl = true, sp = "green" },
            auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
            matcher = function(buf)
              return buf.name:match('%.c') or buf.name:match('%.cpp')
            end,
            separator = { -- Optional
              style = require('bufferline.groups').separator.tab
            },
          }
        },
      }
      -- options = { indicator = { style = 'underline' } }
      ]]
    }
  }
  vim.keymap.set("n", "<space>1", "<cmd>BufferLineGoToBuffer 1<cr>")
  vim.keymap.set("n", "<space>2", "<cmd>BufferLineGoToBuffer 2<cr>")
  vim.keymap.set("n", "<space>3", "<cmd>BufferLineGoToBuffer 3<cr>")
  vim.keymap.set("n", "<space>4", "<cmd>BufferLineGoToBuffer 4<cr>")
end
return M
