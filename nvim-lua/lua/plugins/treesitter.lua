local M = {
  'nvim-treesitter/nvim-treesitter', -- 基于语义的高亮
  -- lazy=true,
  -- run = ':TSUpdate'
}
M.init = function()
  --vim.wo.foldmethod = "expr"
  --vim.wo.foldlevel = 30
  --vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
end

M.config = function()
  require("nvim-treesitter.configs").setup({
    -- ensure_installed = { 'cpp', 'python', 'lua' },
    highlight = {
      enable = true,
      use_languagetree = false,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = { enable = false, },
    indent = { enable = false },
    textobjects = { enable = false},
  })
end
return M
