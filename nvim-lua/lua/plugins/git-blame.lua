local M = {
  'f-person/git-blame.nvim'
}
-- init function while exec before load this plugin
M.init = function()
  vim.g.gitblame_message_template = '<date> • <author> • <summary>'
  -- vim.g.gitblame_highlight_group = "Question"
  vim.g.gitblame_delay = 1000 -- xxx ms delay
  vim.g.gitblame_date_format = '%r'
  vim.g.gitblame_message_when_not_committed = 'not commit yet'
  vim.g.gitblame_virtual_text_column = 80
end
return M
