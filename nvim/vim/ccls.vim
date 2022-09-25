" ccls 提供的 LSP Extension
" https://github.com/MaskRay/ccls/wiki/coc.nvim

"nn <silent> xl :call CocLocations('ccls','$ccls/navigate',{'direction':'D'})<cr>
"nn <silent> xk :call CocLocations('ccls','$ccls/navigate',{'direction':'L'})<cr>
"nn <silent> xj :call CocLocations('ccls','$ccls/navigate',{'direction':'R'})<cr>
"nn <silent> xh :call CocLocations('ccls','$ccls/navigate',{'direction':'U'})<cr>

"noremap x <Nop>
"nn xx x
nn <silent> <leader>kb :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nn <silent> <leader>kb :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived
nn <silent> <leader>kd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nn <silent> <leader>kD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" caller
nn <silent> <leader>kc :call CocLocations('ccls','$ccls/call')<cr>
" callee
nn <silent> <leader>kC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

" $ccls/member
" member variables / variables in a namespace
nn <silent> <leader>km :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
nn <silent> <leader>kf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
nn <silent> <leader>ks :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

nmap <silent> <leader>kt <Plug>(coc-type-definition)<cr>
nn <silent> <leader>kv :call CocLocations('ccls','$ccls/vars')<cr>
nn <silent> <leader>kV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

