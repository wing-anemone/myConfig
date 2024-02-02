local M = {
  'nvim-telescope/telescope.nvim',--万能无敌各种搜索
  tag = '0.1.3', -- or branch = '0.1.x',
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
  keyset("n", "<leader>r", "<cmd>Telescope quickfix<cr>", opts)
  keyset("n", "<leader><leader>","<cmd>Telescope<cr>", opts)

  keyset('n','gd',"<cmd>Telescope coc definitions<cr>",opts)
  keyset('n','gy',"<cmd>Telescope coc type_definitions<cr>",opts)
  keyset('n','gi',"<cmd>Telescope coc declarations<cr>",opts)
  keyset('n','gr',"<cmd>Telescope coc references_used<cr>",opts)

  local actions = require('telescope.actions')
  local change_dir = function(prompt_bufnr)
    local selection = require("telescope.actions.state").get_selected_entry()
    local dir = vim.fn.fnamemodify(selection.path, ":p:h")
    require("telescope.actions").close(prompt_bufnr)
    -- Depending on what you want put `cd`, `lcd`, `tcd`
    vim.cmd(string.format("silent lcd %s", dir))
  end

  require('telescope').setup {
    defaults = {
      path_display = {
        -- shorten = { len = 1, exclude = { 1, -1 } },
        truncate = 5
      },
      file_ignore_patterns = {
        ".git"
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
        find_command = { "rg", "--files",
        --"-uu",
        --"--hidden",
        --"-g", "!**/.git/*",
          "-g", "!*.{o,d}"
        },
        mappings = {
          n = {
            ["cd"] = change_dir
          }
        }
      },
      oldfiles = {
        mappings = {
          n = {
            ["cd"] = change_dir
          }
        }
      }
    }
  }
end
return M
