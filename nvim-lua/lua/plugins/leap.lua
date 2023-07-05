local M = {
  "ggandor/leap.nvim",
  event = { "BufReadPost", "BufNewFile" },
}
M.config = function()
  require("leap").add_default_mappings()
  vim.keymap.del('x', 'x', { silent = true })
  -- vim.keymap.set({'x','o','n'},'f','<Plug>(leap-forward-to)')
  -- vim.keymap.set({'x','o','n'},'F','<Plug>(leap-backward-to)')
end
return M
