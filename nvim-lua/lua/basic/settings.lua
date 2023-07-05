--  =============================
--
--      authored by anemone
--      update in 2023-06-27
--
--  =============================
--  any question: please :h <key>
--  about mapping:verbose map <key>

local global = vim.g
local o = vim.o
global.indentLine_conceallevel = 0

-- encoding
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.fileencodings = "utf-8,ucs-bom,cp936,gb18030,gbk,gb2312,big5,latin1"
o.fileformat = "unix"
o.fileformats = "unix,dos"
-- 当出现 &#24573;&#28982; 的编码时，通过如下命令转换
-- :%s/&#\([0-9]\+\);/\=nr2char(submatch(1))/g
o.helplang = "cn"          -- 使用中文帮助文档? 需要vim支持多语言
o.langmenu = "zh_CN.UTF-8" -- en_US

--backup
o.autoread = 1 --搭配:checktime来进行文件的同步更新
o.autowrite=1
o.swapfile = 0
o.backup = 0


o.undofile = 1
o.undolevels = 1000  -- Maximum number of changes that can be undone
o.undoreload = 10000 -- Maximum number lines to save for undo on a buffer reload"


-- ui
o.termguicolors = true --真彩模式
-- o.hidden = 1
o.splitright = 1       -- New vsplit windows focus on the right of the current
o.splitbelow = 1       -- New split windows focus on the bottom of the current"


-- basic
o.number = 1    -- aka nu
o.scrolljump = 1
o.nospell = 1   -- 不开启拼写检查
o.expandtab = 1 -- 输入tab制表符时，自动替换成空格
o.tabstop = 2
o.shiftwidth = 2
o.backspace = 'indent,eol,start'
o.softtabstop = -1 -- 负数时,使用shiftwidth的值,两者保持一致,统一缩进.
o.showmatch = 1    -- Show matching brackets/parenthesis"
o.noautoindent = 1
o.nosmartindent = 1
o.nocindent = 1
o.wildmenu = 1 -- Show list instead of just completing
-- Command <Tab> completion, list matches, then longest common part, then all.
o.wildmode = 'list:longest,full'
o.completeopt = 'preview,menu'

o.cul = 1          -- 突出显示当前行,等同于 set cul
o.cursorcolumn = 1 -- 突出显示当前列,等同于 set cuc
o.colorcolumn = 80 --    Show vertical line where to wrap code
o.hlsearch = 1     -- /高亮搜索
o.incsearch = 1    -- /输入每个字母都显示高亮
o.ignorecase = 1
o.smartcase = 1    --忽视大小写，除非出现一个大写字母
o.nowrapscan = 1   --搜索到最后匹配的位置后,再次搜索不回到第一个匹配处
o.cmdheight = 1
