-- global
vim.g.mapleader = ","

local keyset = vim.keymap.set
-- basic setting
keyset("i", "jk", "<Esc>")
keyset("n", "q", ":q!<Cr>",{silent=true}) --fast quite

-- window
keyset("n", "<space>d", "<cmd>bdelete %<cr>")
keyset("n", "<space>j", "<cmd>bnext<cr>")
keyset("n", "<space>k", "<cmd>bNext<cr>")


keyset("n", "<c-n>", ":vsp<cr>",{silent=true})
keyset('n','<c-k>',':wincmd k<cr>',{silent=true})
keyset('n','<c-j>',':wincmd j<cr>',{silent=true})
keyset('n','<c-h>',':wincmd h<cr>',{silent=true})
keyset('n','<c-l>',':wincmd l<cr>',{silent=true})

-- move
keyset("v", "<", "<gv")
keyset("v", ">", ">gv")
keyset("n", "j", "gj")
keyset("n", "k", "gk")

-- copy & paste
keyset("v", "<space>y", '"+y') -- quick copy to +

