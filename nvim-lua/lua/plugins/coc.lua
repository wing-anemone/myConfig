local M = {
  'neoclide/coc.nvim', -- lsp
  branch = 'release'
}
M.config = function()
  -- 需要安装的coc插件
  vim.g.coc_global_extensions = {
    -- 'coc-ccls', -- has trouble, installed from ccls github
    'coc-sh',
    'coc-sumneko-lua',
    'coc-translator',
    'coc-symbol-line', -- need for coc_symbol_line()
  }
  local keyset = vim.keymap.set
  -- coc plugins configs:
  -- should'nt attach <cr>
  keyset('n', '<space>d', '<Plug>(coc-translator-p)', { silent = true })

  function _G.symbol_open_close()
    local is_open = vim.g.wing_symbol
    if is_open == nil then
      vim.fn.CocActionAsync('showOutline')
      vim.g.wing_symbol = 1
    else
      vim.fn.CocActionAsync('hideOutline')
      vim.g.wing_symbol = nil
    end
  end
  keyset('n', '<space>ls', '<cmd>lua _G.symbol_open_close()<cr>', { silent = true })

  -- 自动关闭 vim 如果 window 中只有一个 outline
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "CocTree*" },
    callback = function()
      if vim.fn.winnr('$') == 1 then
        vim.cmd('quit')
      end
    end,
  })

  function _G.symbol_line()
    local curwin = vim.g.statusline_winid or 0
    local curbuf = vim.api.nvim_win_get_buf(curwin)
    local ok, line = pcall(vim.api.nvim_buf_get_var, curbuf, 'coc_symbol_line')
    return ok and line or ''
  end
  keyset('n', '<space>ll', '<cmd>lua vim.b.coc_symbol_line<cr>', { silent = true })

  -- Some servers have issues with backup files, see #649
  vim.opt.backup = false
  vim.opt.writebackup = false

  -- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
  -- delays and poor user experience
  vim.opt.updatetime = 500

  -- Always show the signcolumn, otherwise it would shift the text each time
  -- diagnostics appeared/became resolved
  vim.opt.signcolumn = "number"

  -- Autocomplete
  function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
  end

  -- Use Tab for trigger completion with characters ahead and navigate
  -- NOTE: There's always a completion item selected by default, you may want to enable
  -- no select by setting `"suggest.noselect": true` in your configuration file
  -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
  -- other plugins before putting this into your config
  local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
  keyset("i", "<c-j>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
  keyset("i", "<c-k>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

  -- Make <CR> to accept selected completion item or notify coc.nvim to format
  -- <C-g>u breaks current undo, please make your own choice
  keyset("i", "<TAB>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

  -- GoTo code navigation
  --keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
  --keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
  --keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
  --keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

  -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
  vim.api.nvim_create_augroup("CocGroup", {})
  vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
  })

  -- Symbol renaming
  -- keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

  -- Formatting selected code
  keyset("v", "<space>lf", "<Plug>(coc-format-selected)<Cr>")
  keyset("n", "<space>lf", '<cmd>call CocAction("format")<Cr>', { silent = 1, desc = 'coc format' })

  -- Setup formatexpr specified filetype(s)
  vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
  })

  -- Update signature help on jump placeholder
  vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
  })

  -- Use `[g` and `]g` to navigate diagnostics
  -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
  keyset("n", "]g", "<Plug>(coc-diagnostic-prev)", { silent = true })
  keyset("n", "[g", "<Plug>(coc-diagnostic-next)", { silent = true })

  -- Remap <C-f> and <C-b> to scroll float windows/popups
  ---@diagnostic disable-next-line: redefined-local
  local opts = { silent = true, nowait = true, expr = true }
  keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
  keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
  keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
  keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

  -- Add `:Format` command to format current buffer
  -- vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

  -- " Add `:Fold` command to fold current buffer
  -- vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })
end
return M
