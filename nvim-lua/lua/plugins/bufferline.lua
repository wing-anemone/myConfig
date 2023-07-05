local M = {
  'akinsho/bufferline.nvim', --显示tab标签(buffer)
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
}
M.config = function()
  require("bufferline").setup {
    options = {
      sort_by = "id",
    }
  }
  vim.keymap.set("n", "<space>1", "<cmd>BufferLineGoToBuffer 1<cr>")
  vim.keymap.set("n", "<space>2", "<cmd>BufferLineGoToBuffer 2<cr>")
  vim.keymap.set("n", "<space>3", "<cmd>BufferLineGoToBuffer 3<cr>")
  vim.keymap.set("n", "<space>4", "<cmd>BufferLineGoToBuffer 4<cr>")
end
return M
