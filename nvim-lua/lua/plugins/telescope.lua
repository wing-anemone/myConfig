local M = {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2', -- or branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep','fannheyward/telescope-coc.nvim' }
}
M.config = function()

  local keyset = vim.keymap.set
  local opts = { silent = true, nowait = true }
  keyset("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
  keyset("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
  keyset("n", "<leader>G", "<cmd>Telescope grep_string<cr>", opts)
  keyset("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
  -- keyset("n", "<leader>h", "<cmd>Telescope help_tags<cr>", opts)
  -- keyset("n", "<leader>m", "<cmd>Telescope keymaps<cr>", opts)
  keyset("n", "<leader><leader>","<cmd>Telescope<cr>", opts)

  keyset('n','gd',"<cmd>Telescope coc definitions<cr>",opts)
  keyset('n','gy',"<cmd>Telescope coc type_definitions<cr>",opts)
  keyset('n','gi',"<cmd>Telescope coc declarations<cr>",opts)
  keyset('n','gr',"<cmd>Telescope coc references_used<cr>",opts)
  --nmap <silent> <nowait> gd : <C-u>Telescope coc definitions<cr>
  --nmap <silent> <nowait> gh : <C-u>Telescope coc declarations<cr>
  --nmap <silent> <nowait> gy : <C-u>Telescope coc type_definitions<cr>
  --nmap <silent> <nowait> gk : <C-u>Telescope coc implementations<cr>
  --nmap <silent> <nowait> gr : <C-u>Telescope coc references_used<cr>



  local actions = require('telescope.actions')
  require('telescope').setup {
    defaults = {
      file_ignore_patterns = {
        ".git", "_WORKSPACE",
      },
      layout_strategy = "vertical",
      layout_config = {
        vertical = {
          height = 0.95,
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
    },
    pickers = {
      find_files = {
        hidden = true,
        -- ubuntu上调用的其实得是fdfind命令
        -- find_command = { "fd", "--type", "f", "--color", "never", "-E", ".git" },
      },
    }
  }
end
return M
