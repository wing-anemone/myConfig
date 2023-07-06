-- global
vim.g.mapleader = ","

local keyset = vim.keymap.set
local opt = { silent = true }
-- basic setting
keyset("i", "jk", "<Esc>", opt)
keyset("n", "q", ":q!<Cr>", opt) --fast quite

-- buffer
-- keyset("n", "<space>d", "<cmd>bdelete %<cr>")
keyset("n", "<c-l>", "<cmd>bnext<cr>")
keyset("n", "<c-h>", "<cmd>bNext<cr>")
--keyset('n', '<c-h>', ':wincmd h<cr>', opt) --default: <c-w>h
--keyset('n', '<c-l>', ':wincmd l<cr>', opt) --default: <c-w>l

-- window
keyset("n", "cv", ":vsp<cr>", opt) --vertical split win
--keyset('n', '<c-h>', ':wincmd h<cr>', opt) --default: <c-w>h
--keyset('n', '<c-l>', ':wincmd l<cr>', opt) --default: <c-w>l

-- 上下的win switch逻辑很少使用，用来切换quickfix
keyset('n', '<c-j>', ':cn<cr>', opt)
keyset('n', '<c-k>', ':cp<cr>', opt)


-- move
keyset("v", "<", "<gv")
keyset("v", ">", ">gv")
keyset("n", "j", "gj")
keyset("n", "k", "gk")

-- copy & paste
-- keyset("v", "<space>y", '"+y') -- quick copy to +

--format
if vim.fn.has('macunix') == 1 then
  keyset('x', '<c-k>', ':py3f /opt/homebrew/Cellar/clang-format/1*/share/clang/clang-format.py<CR>', opt)
else
  keyset('x', '<c-k>', ':py3f /usr/share/vim/addons/syntax/clang-format.py<CR>', opt)
end

