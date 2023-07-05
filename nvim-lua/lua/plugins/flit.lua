local M = {
  "ggandor/flit.nvim", --ff高亮多匹配
  dependencies = 'ggandor/leap.nvim',
}
-- automatically call `require("flit").setup(opts)`
M.opts = {
  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
  -- A string like "nv", "nvo", "o", etc.
  labeled_modes = "v",
  multiline = true,
  -- Like `leap`s similar argument (call-specific overrides).
  -- E.g.: opts = { equivalence_classes = {} }
  opts = {}
}
return M
