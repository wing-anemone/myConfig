" 调节 window 大小
let g:winresizer_start_key = 'ca'
" If you cancel and quit window resize mode by `q` (keycode 113)
let g:winresizer_keycode_cancel = 113

" 默认 markdown preview 在切换到其他的 buffer 或者 vim
" 失去焦点的时候会自动关闭 preview
let g:mkdp_auto_close = 0
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'c', 'cpp', 'diff']
let g:markdown_minlines = 200
" 在 markdown 中间编辑 table
let g:table_mode_corner='|'
" 默认不要折叠 markdown
let g:vim_markdown_folding_disabled = 1

" 书签选中之后自动关闭 quickfix window
let g:bookmark_auto_close = 1

" 让光标自动进入到 popup window 中间
let g:git_messenger_always_into_popup = v:true
let g:git_messenger_no_default_mappings = v:true

" 设置默认的 pdf 阅览工具
let g:vimtex_view_method = 'zathura'

let g:vista_sidebar_position = "vertical topleft"
let g:vista_default_executive = 'coc'
let g:vista_finder_alternative_executives = 'ctags'

tnoremap  <Esc>  <C-\><C-n>

" 透明化显示
hi Normal ctermbg=none ctermfg=none guifg=none guibg=none 
hi EndOfBuffer ctermbg=none ctermfg=none guifg=none guibg=none

" 使用 gx 在 vim 中间直接打开链接
nnoremap gx <Plug>(openbrowser-smart-search)
vnoremap gx <Plug>(openbrowser-smart-search)
" /mapping

" autocmd, vim autocmd  http://www.jiatcool.com/?p=597
if has("autocmd")
  augroup Smartf
    au User SmartfEnter :hi Conceal ctermfg=220 guibg=pink
    au User SmartfLeave :hi Conceal ctermfg=239 guibg=#504945
  augroup end
endif


" 因为 telescope-coc 没有实现 outline，所以只能靠 telescope-heading.nvim 实现
func! Outline()
  if expand("%:e") ==# "md"
    exec "Telescope heading"
  else
    exec "Telescope coc document_symbols"
  endif
endf

" 实现一键运行各种文件，适合非交互式的，少量的代码，比如 leetcode
func! QuickRun()
  exec "w"
  let ext = expand("%:e")
  if ext ==# "lua"
    exec "source %"
  elseif ext ==# "tex"
    exec "VimtexCompile"
  else
    exec "RunCode"
  endif
endf

func! Preivew()
  exec "w"
  let ext = expand("%:e")
  if ext ==# "md"
    exec "MarkdownPreview"
  elseif ext ==# "tex"
    exec "VimtexView"
  else
    echo "no preview"
  endif
endf
