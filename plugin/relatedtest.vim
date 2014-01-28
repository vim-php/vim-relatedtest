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

function! g:relatedTestHandleTT()
    let a:bufname = bufname('%')
    if b:relatedTestIsTest(a:bufname) > 0
        let relatedtest_filename = b:relatedTestGetFileName(a:bufname)
    else
        let relatedtest_filename = b:relatedTestGetTestFileName(a:bufname)
    endif

    if filereadable(relatedtest_filename)
        exec ":e " . relatedtest_filename
    else
        if input("Test file '" . relatedtest_filename . "' doesn't exists. Create a new test file [Y/N]? ", 'Y') == 'Y'
            exec ":e " . relatedtest_filename
        endif
    endif
endfunction

exec "nmap <silent> " . g:relatedtest_open_command . " :call g:relatedTestHandleTT()<CR>"

