" relatedtest.vim - Vim related test plugin
" Language:     Viml
" Maintainer:   Walter Dal Mut (walter.dalmut AT gmail DOT com)
"
"       OPTIONS:
"
"           let g.realted_test_open_trigger = tt [default tt]
"               Combo for open a related test
"
if exists('g:loaded_relatedtest') || &cp
    finish
endif
let g:loaded_relatedtest = 1

if !exists('g:relatedtest_open_command')
    let g:relatedtest_open_command = 'tt'
endif

if !exists('g:relatedtest_open_strategy')
    let g:relatedtest_open_strategy = 'e'
endif

exec "nmap <silent> " . g:relatedtest_open_command . " :call relatedtest#handleTT()<CR>"
