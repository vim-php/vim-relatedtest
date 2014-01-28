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

function! g:relatedTestOpenTestFile()
    let relatedtest_testfilename = b:relatedTestGetTestFileName(bufname('%'))

    if filereadable(relatedtest_testfilename)
        exec ":e " . relatedtest_testfilename
    else
        if input("Test file '" . relatedtest_testfilename . "' doesn't exists. Create a new test file [Y/N]? ", 'Y') == 'Y'
            exec ":e " . relatedtest_testfilename
        endif
    endif
endfunction

exec "nmap <silent> " . g:relatedtest_open_command . " :call g:relatedTestOpenTestFile()<CR>"

