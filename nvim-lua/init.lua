-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Installing lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("basic.settings")
require("basic.mapping")
require("basic.autocmd")

local lazy_config = {
  git = {
    timeout = 60, -- kill processes that take more than 2 minutes
    url_format = "https://github.com/%s.git",
    filter = true,
  },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    colorscheme = { "everforest" },
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 1, height = 1 },
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
}
require("lazy").setup("plugins", lazy_config)
