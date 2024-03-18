"=============================
"                            
"    authored by 177 
"    update in 2022-09-01
"                            
"=============================
" 查询快捷键 :verbose map <key>
" [toc]
" encoding
" basic[basic/backup/UI/mapping/autocmd]
" function
" alacritty && nvim 分类调用函数

" encoding
set nocompatible   " 不要兼容vi，会出问题
scriptencoding utf-8
set encoding=utf-8        "查看utf-8格式的帮助文档
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gbk,gb2312,big5,latin1
set fileformat=unix
set fileformats=unix,dos
" chinese
" set ambiwidth=double "显示中文引号，开了给自己找事
" 当出现 &#24573;&#28982; 的编码时，通过如下命令转换
" :%s/&#\([0-9]\+\);/\=nr2char(submatch(1))/g
set helplang=cn          " 使用中文帮助文档
set langmenu=zh_CN.UTF-8 " en_US
language message zh_CN.UTF-8
" /chinese /encoding



" basic
filetype on
filetype plugin off
filetype indent off
"set mouse=a "alacritty上开启,点击鼠标会进入visual模式
set noautoindent
set nosmartindent
set nocindent
set visualbell t_vb=
"set paste
set number " aka nu
syntax enable      " 推荐使用enable not on, Automatically enable by coc.nvim 
"set noeb "去掉输入错误时的提示声音
set scrolljump=1
set nospell      " 不开启拼写检查
set expandtab    " 输入tab制表符时，自动替换成空格
set tabstop=2
set shiftwidth=2
set backspace=2
set softtabstop=-1 " 负数时,使用shiftwidth的值,两者保持一致,统一缩进.
set showmatch " Show matching brackets/parenthesis"
"set listchars=tab:>-,trail:•,space:-      "\:set list`启用,显示空格和tab键
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set completeopt=preview,menu

"backup 
set autoread " vimrc修改之后自动更新?
set autowrite		" 在执行以下命令之前自动保存
set undofile "turn on the feature 
set nobackup " 有持久化的undo文件，不需要保存备份
set noswapfile "不生成.swp
set viminfo='128,\"2048,<2048
set history=1000   " \:history [type] 查看历史。type可以是cmd search等
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload"

" UI
set hidden
set splitright " New vsplit windows focus on the right of the current
set splitbelow " New split windows focus on the bottom of the current"
set noshowmode " 关闭vim的模式提示，除了新没必要开
set showcmd " 输入的命令显示出来，看的清楚些 
set cursorline   " 突出显示当前行,等同于 set cul
set cursorcolumn " 突出显示当前列,等同于 set cuc
set colorcolumn=80     " Show vertical line where to wrap code
set hlsearch  " /高亮搜索
set incsearch " /输入每个字母都显示高亮
"set nowrapscan "关闭循环
set ignorecase smartcase "忽视大小写，除非出现一个大写字母
"set nowrapscan  "搜索到最后匹配的位置后,再次搜索不回到第一个匹配处
"set laststatus=1 "显示x行状态
let g:indentLine_conceallevel=0 "默认显示json文件的双引号

if has("termguicolors")
  "echom "support termguicolors"
  set termguicolors
else
  "echom "not support termguicolors"
  set  t_Co=256
endif

" mapping     "i:insert n:normal v,x:visual c:cmd  nore:no recursion 非递归
" 这个变量需要定义在mapping之前，否则mapping无效
let mapleader=','
inoremap jk <Esc>
nnoremap q :q!<cr>
nnoremap j gj
nnoremap k gk
" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
vnoremap <space>y "+y
nnoremap cv :vsp<cr>

" autocmd, grammar: http://www.jiatcool.com/?p=597
if has("autocmd")
  " au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " 当失去焦点或者离开当前的 buffer 的时候保存
  au FocusGained,BufEnter * :checktime
  au FocusLost,BufLeave * silent! update
  " ctrl + ] 查询 cppman
  " 如果想让该快捷键自动查询 man，将Cppman 替换为 Cppman!
  " au FileType c,cpp noremap <C-]> <Esc>:execute "Cppman " . expand("<cword>")<CR>
endif
" /basic

" function
"存在路径则说明在alacritty中;这个判断只适用于第一级，ssh跳到remote之后失效
"func! Isalacritty()
"  return !empty($ALACRITTY_LOG) ? 1 : 0
"endf

func! ColorZellij()
  hi SpecialKey term=bold ctermfg=81 guifg=Cyan
  hi NonText         term=bold ctermfg=12 gui=bold guifg=Blue
  hi Directory       term=bold ctermfg=159 guifg=Cyan
  hi Search          term=reverse ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
  hi MoreMsg         term=bold ctermfg=121 gui=bold guifg=SeaGreen
  hi LineNr          term=underline ctermfg=11 guifg=Yellow
  hi CursorLineNr    term=bold cterm=underline ctermfg=11 gui=bold guifg=Yellow
  hi Question        term=standout ctermfg=121 gui=bold guifg=Green
  hi Title           term=bold ctermfg=225 gui=bold guifg=Magenta
  hi Visual          term=reverse ctermbg=242 guibg=DarkGrey
  hi WarningMsg      term=standout ctermfg=224 guifg=Red
  hi Folded          term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=DarkGrey
  hi FoldColumn      term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
  hi DiffAdd         term=bold ctermbg=4 guibg=DarkBlue
  hi DiffChange      term=bold ctermbg=5 guibg=DarkMagenta
  hi DiffDelete      term=bold ctermfg=12 ctermbg=6 gui=bold guifg=Blue guibg=DarkCyan
  hi SignColumn      term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
  hi SpellBad        term=reverse ctermbg=9 gui=undercurl guisp=Red
  hi SpellCap        term=reverse ctermbg=12 gui=undercurl guisp=Blue
  hi SpellRare       term=reverse ctermbg=13 gui=undercurl guisp=Magenta
  hi Pmenu           ctermfg=0 ctermbg=13 guibg=Magenta
  hi PmenuSel        ctermfg=242 ctermbg=0 guibg=DarkGrey
  hi PmenuThumb      ctermbg=15 guibg=White
  hi TabLine         term=underline cterm=underline ctermfg=15 ctermbg=242 gui=underline guibg=DarkGrey
  hi CursorColumn    term=reverse ctermbg=242 guibg=Grey40
  hi CursorLine      term=underline cterm=underline guibg=Grey40
  hi ColorColumn     term=reverse ctermbg=1 guibg=DarkRed
  hi StatusLineTerm  term=bold,reverse cterm=bold ctermfg=0 ctermbg=121 gui=bold guifg=bg guibg=LightGreen
  hi StatusLineTermNC term=reverse ctermfg=0 ctermbg=121 guifg=bg guibg=LightGreen
  hi MatchParen      term=reverse ctermbg=6 guibg=DarkCyan
  hi ToolbarLine     term=underline ctermbg=242 guibg=Grey50
  hi ToolbarButton   cterm=bold ctermfg=0 ctermbg=7 gui=bold guifg=Black guibg=LightGrey
  hi Comment         term=bold ctermfg=14 guifg=#80a0ff
  hi Constant        term=underline ctermfg=13 guifg=#ffa0a0
  hi Special         term=bold ctermfg=224 guifg=Orange
  hi Identifier      term=underline cterm=bold ctermfg=14 guifg=#40ffff
  hi Statement       term=bold ctermfg=11 gui=bold guifg=#ffff60
  hi PreProc         term=underline ctermfg=81 guifg=#ff80ff
  hi Type            term=underline ctermfg=121 gui=bold guifg=#60ff60
  hi Underlined      term=underline cterm=underline ctermfg=81 gui=underline guifg=#80a0ff
  hi Ignore          ctermfg=0 guifg=bg
endf

func! OpenEverforest()
  let g:everforest_background = 'hard'
  let g:everforest_better_background = 1
  set background=dark  " 开启可防止进入闪屏
  colorscheme everforest
endf

func! DownloadEverforest()
  echo "download everforest ...注意: 网络不好会直接执行失败"
  if empty(glob("~/.vim/colors/everforest.vim"))
    silent execute '!curl https://raw.githubusercontent.com/sainnhe/everforest/master/autoload/everforest.vim -o ~/.vim/autoload/everforest.vim --create-dirs'
  endif
  if empty(glob("~/.vim/autoload/everforest.vim"))
    silent execute '!curl https://raw.githubusercontent.com/sainnhe/everforest/master/colors/everforest.vim -o ~/.vim/colors/everforest.vim --create-dirs'
  endif
  echo "please restart vim to enjoy everforest"
endf

" 设置undodir实现undo持久化
func! UndodirVim()
  if has('persistent_undo') "check if your vim version supports it
    set undodir=$HOME/.vim/undodir "directory where the undo files will be stored
    if empty(glob(&undodir))
      call mkdir(&undodir, "p", 0700)
    endif
  endif
endf

if has('nvim')
  call OpenEverforest()
  "set mouse=""
else
  call ColorZellij() " zellij颜色丑，复制alacritty的 好像只有macos本地需要
  call UndodirVim()
  if has("termguicolors")
    set notermguicolors
  endif
  "call DownloadEverforest() "alacritty not need
endif
if has('macunix')
  vmap <C-k> :py3f /opt/homebrew/Cellar/clang-format/1*/share/clang/clang-format.py<CR>
else
  vmap <C-k> :py3f /usr/share/vim/addons/syntax/clang-format-19.py<CR>
endif
