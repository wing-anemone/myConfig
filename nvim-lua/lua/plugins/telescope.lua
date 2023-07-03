local M = {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2', -- or branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' }
}
M.config = function()
  -- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
  vim.keymap.set("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<cr>")
  vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
  vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
  vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
  local actions = require('telescope.actions')
  require('telescope').setup {
    defaults = {
      layout_strategy = "vertical",
      layout_config = {
        vertical = {
          height = 0.9,
          preview_cutoff = 0,
          width = 0.9
        }
        -- other layout configuration here
      },
      mappings = {
        n = {
          ["q"] = actions.send_selected_to_qflist,
          ["Q"] = actions.send_to_qflist,
        },
      },
      -- other defaults configuration here
    }
  }
end
return M
