local M = {
  'nvim-treesitter/nvim-treesitter', -- 基于语义的高亮
  build = ':TSUpdate',
  dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
}
M.init = function()
  --vim.wo.foldmethod = "expr"
  --vim.wo.foldlevel = 30
  --vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
end

M.config = function()
  require("nvim-treesitter.configs").setup({
    -- ensure_installed = { 'cpp', 'python', 'lua' },--自动安装
    highlight = {
      enable = true,
      use_languagetree = false,
      disable = function(lang, buf)
        local max_filesize = 450 * 1024 -- 400 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = { enable = false, },
    indent = { enable = false },
    textobjects = { enable = false },
  })
  require 'nvim-treesitter.configs'.setup {
    textobjects = {
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = { query = "@class.outer", desc = "Next class start" },
          ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
          ["[z"] = { query = "@fold", query_group = "folds", desc = "Prev fold" },
        },
        goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer", },
      },
    },
  }
end
return M
