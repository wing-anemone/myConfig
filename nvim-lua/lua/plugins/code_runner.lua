local M = {
  'CRAG666/code_runner.nvim', --一键运行当前文件
}
local quick = function ()
  vim.api.nvim_command('write')
  local ext = vim.fn.expand("%:e")
  if ext == 'lua' or ext == 'vim' then
    vim.api.nvim_command('source %')
  else
    vim.api.nvim_command("RunCode")
  end
end
M.config = function()
  vim.keymap.set('n','<space>r',quick,{silent=true})
  require('code_runner').setup {
    term = {
      position = "belowright",
      size = 15,
    },
    filetype = {
      python = "python3 $fileName",
      cpp = {
        "cd $dir &&",
        "clang++ -lpthread -std=c++17 -g $fileName -o $fileNameWithoutExt.out &&",
        "$dir/$fileNameWithoutExt.out",
      },
      sh = "bash $file",
      -- rust = "cargo run",
      -- r = "Rscript $fileName"
    },
  }
end
return M
