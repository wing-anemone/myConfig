if empty(glob("~/.local/share/nvim/site/pack/packer/opt/packer.nvim"))
  silent execute '!git clone --depth=1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim'
endif
":PackerInstall

" 这个变量需要定义在mapping之前，否则mapping无效
let mapleader=','

" 加载各种插件的配置, 参考 https://github.com/jdhao/nvim-config
let s:core_conf_files = [
      \ 'vimrc',
      \ 'misc.vim',
      \ 'coc.vim',
      \ 'debug.vim',
      \ 'ccls.vim',
      \ 'wilder.vim',
      \ 'startify.vim',
      \ 'airline.vim',
      \ ]

for s:fname in s:core_conf_files
  execute printf('source %s/vim/%s', stdpath('config'), s:fname)
endfor

" 加载 lua 配置
lua require 'plugins'
lua require 'buffer-config'
lua require 'telescope-config'
lua require 'tree-config'
lua require 'whichkey-config'
lua require 'treesitter'
lua require 'code-runner-config'
lua require 'colorizer'.setup{'css'; 'javascript'; 'vim'; 'lua'; 'yaml'; html = { mode = 'foreground';}}
lua require('nvim-autopairs').setup{}
