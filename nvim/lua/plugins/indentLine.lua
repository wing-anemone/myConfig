local M = {
  'Yggdroot/indentLine', --显示indent线
}
M.config = function()
  vim.g.indentLine_conceallevel = 2 --开启隐藏符号
  vim.g.vim_json_conceal=0 --禁止隐藏json的双引号
  -- vim.g.markdown_syntax_conceal=0 --same with json
  vim.g.indentLine_char = '|'
end
return M
