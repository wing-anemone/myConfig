local wk = require("which-key")

wk.setup({
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mo
  }
})

-- normal mode
wk.register({
  -- entry for floater terminal
  ["<c-n>"] = {"<cmd>FloatermToggle<cr>","toggle float-terminal"},
  ["<c-t>"] = { "<cmd>FloatermNew zsh<cr>", "new float-terminal: zsh" },
  ["<c-j>"]  = {"<cmd>:cn<cr>","next item of quickfix"},
  ["<c-k>"] = {"<cmd>:cp<cr>","pre item of quickfix"},
  ["<c-l>"] = { "<cmd>:wincmd w<cr>", "switch window" },
  -- search
  ["<leader>"] = {
    a = { "<cmd>Telescope coc code_actions<cr>", "search coc code action" },
    b = { "<cmd>Telescope buffers<cr>", "search buffers" },
    c = {
      name = "+coc",
      x = { "<Plug>(coc-codeaction-selected)", "Applying codeAction to the selected region" },
      c = { "<Plug>(coc-codeaction)", "applying codeAction to the current buffer" },
      f = { "<Plug>(coc-fix-current)", "apply AutoFix to problem on the current line" },
      a = { "<Plug>(coc-codelens-action)", "run the Code Lens action on the current line" },
      b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>]", "current_buffer_fuzzy_find" }
    },
    -- d = { "<cmd>Telescope coc workspace_diagnostics<cr>", "show coc diagnostics" },
    -- i = { "<cmd>Octo issue list<cr>", "list github issue" },
    -- F = { "<cmd>Telescope git_files<cr>", "search files (exclude submodules)" },
    f = { "<cmd>Telescope find_files<cr>", "search files (include submodules)" },
    g = { "<cmd>Telescope live_grep<cr>", "live grep" },
    G = { "<cmd>Telescope grep_string<cr>", "live grep cursor word" },
    h = { "<cmd>Telescope help_tags<cr>", "search vim manual" },
    k = { "<cmd>Telescope colorscheme<cr>", "colorscheme" },
    o = { "<cmd>call Outline()<cr>", "search symbols in file" },
    -- leader p used for paste from system clipboard
    s = { "<cmd>Telescope coc workspace_symbols<cr>", "search symbols in project" },

    -- " 使用 <leader> [number] 切换到第 [number] 个 window
    ["1"] = { "<cmd>1wincmd  w <cr>", "jump to window 1" },
    ["2"] = { "<cmd>2wincmd  w <cr>", "jump to window 2" },
    ["3"] = { "<cmd>3wincmd  w <cr>", "jump to window 3" },
    ["4"] = { "<cmd>4wincmd  w <cr>", "jump to window 4" },
    ["5"] = { "<cmd>5wincmd  w <cr>", "jump to window 5" },
    ["6"] = { "<cmd>6wincmd  w <cr>", "jump to window 6" },
    ["7"] = { "<cmd>7wincmd  w <cr>", "jump to window 7" },
    ["8"] = { "<cmd>8wincmd  w <cr>", "jump to window 8" },
    ["9"] = { "<cmd>9wincmd  w <cr>", "jump to window 9" },
    ["0"] = { "<cmd>10wincmd w <cr>", "jump to window 0" },

  },

  -- " 使用 space [number] 切换到第 [number] 个 buffer
  ['<space>'] = {
    ["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "jump to buffer 1" },
    ["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "jump to buffer 2" },
    ["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "jump to buffer 3" },
    ["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "jump to buffer 4" },
    ["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "jump to buffer 5" },
    ["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "jump to buffer 6" },
    ["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "jump to buffer 7" },
    ["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "jump to buffer 8" },
    ["9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "jump to buffer 9" },
    ["0"] = { "<cmd>BufferLineGoToBuffer 10<cr>", "jump to buffer 10" },
    -- 因为常用space+d关闭当前buffer，所以提出来
    d = { "<cmd>bdelete %<cr>", "close current buffers" },
    s = { "<Plug>(coc-translator-p)", "translate current word" },
    ['a'] = {
      name = "+misc",
      a = { "<cmd>SourcetrailActivateToken<cr>", "activate sourcetrail server" },
      d = { "<cmd>call TrimWhitespace()<cr>", "remove trailing space" },
      r = { "<cmd>SourcetrailRefresh<cr>", "sourcetrail refresh" },
      s = { "<cmd>SourcetrailStartServer<cr>", "start sourcetrail server" },
      P = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",
        "search cursor word in project" },
      p = { "<cmd>lua require('spectre').open()<cr>", "search in project" }
    },
    ['l'] = {
      name = "+language",
      c = { "<cmd>Commentary<cr>", "comment code" },
      f = { "<cmd>call CocAction('format')<cr>", "format current buffer" },
      r = { "<cmd>call QuickRun()<cr>", "run code" },
      p = { "<cmd>call Preivew()<cr>", "preview" },
    },
    ["g"] = {
      name = "+git",
      a = { "<cmd>Git add -A<cr>", "git stage all changes" },
      b = { "<cmd>Git blame<cr>", "git blame" },
      c = { "<cmd>Git commit<cr>", "git commit" },
      l = { "<cmd>FloatermNew tig %<cr>", "log of file" },
      L = { "<cmd>FloatermNew tig<cr>", "log of project" },
      m = { "<cmd>GitMessenger<cr>", "show git blame of current line" },
      p = { "<cmd>Git push<cr>", "git push" },
      s = { "<cmd>FloatermNew tig status<cr>", "git status" },
    },
    ["t"] = {
      name = "+toggle",
      ["8"] = { "<cmd>:let &cc = &cc == '' ? '81' : ''<cr>", "highlight 80 line" },
      ["b"] = { "<cmd>:let &tw = &tw == '0' ? '80' : '0'<cr>", "break line at 80" },
      ["s"] = { "<cmd>:set spell!<cr>", "spell check" },
      ["w"] = { "<cmd>:set wrap!<cr>", "wrap line" },
      ["m"] = { "<cmd>TableModeToggle<cr>", "markdown table edit mode" },
    },
    ["f"] = {
      name = "+file",
      o = { "<cmd>NvimTreeFindFile<cr>", "open file in dir" },
      s = { "<cmd>w<cr>", "save file" },
      t = { "<cmd>NvimTreeToggle<cr>", "toggle file tree" }
    },
  },
  ["c"] = {
    name = "+window",
    -- v = { "<cmd>vsp<cr>", "vertical split window" },  -- has defeined in vimrc
    -- h = { "<cmd>sp<cr>", "horizontal split window" }, -- has defeined in vimrc
    m = { "<cmd>only<cr>", "maximize current window" },
    u = { "<cmd>UndotreeToggle<cr>", "open undo tree" },
    n = { ":Vista!!<cr>", "toggle vista navigator" },
  },
  ["m"] = {
    name = "+bookmarks",
    -- a = { "<cmd>Telescope vim_bookmarks all<cr>", "list marks in project" },
    m = { "<cmd>BookmarkToggle<cr>", "toggle bookmark" },
    x = { "<cmd>BookmarkClearAll<cr>", "remove all bookmarks in project" },
  },
  -- ["<tab>"] = { ":wincmd w<cr>", "switch window" }, 会和ctrl-i冲突
  ["["] = {
    g = {"<Plug>(coc-diagnostic-prev)","prev error"}
  },
  ["]"] = {
    g = {"<Plug>(coc-diagnostic-next)","next error"}
  }
})

wk.register({
  ["<space>"] = {
    ["l"] = {
      ["c"] = { ":Commentary<cr>", "comment code" },
      ["f"] = { "<Plug>(coc-format-selected)<cr>", "format selected code" },
    },
    ["s"] = { ":lua require('spectre').open_visual()<cr>", "search" },
    ["y"] = { ":OSCYank<cr>", "OSCYank" }
  },
  q = { "<cmd>q<cr>", "close window" },
}, { mode = "v" })

wk.register({
  ["<c-t>"] = { "<cmd>FloatermNew zsh<cr>", "new terminal" },
  ["<c-n>"] = { "<cmd>FloatermToggle<cr>", "back to vim" },
  ["<c-j>"] = { "<cmd>FloatermNext<cr>", "next float-terminal" },
  ["<c-k>"] = { "<cmd>FloatermPrev<cr>", "prev float-terminal" },
  -- 这个失败了，mode = p 也失败了，先放着了。
  -- ["jk"] = {
  --    = { "<C-\\><C-n>", "esc" },
  -- }
}, { mode = "t" })

