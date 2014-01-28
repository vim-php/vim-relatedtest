" relatedtest.vim - Vim related test plugin
" Language:     Viml
" Maintainer:   Walter Dal Mut (walter.dalmut AT gmail DOT com)
"
"       OPTIONS:
"
"           let g.realted_test_open_trigger = tt [default tt]
"               Combo for open a related test
"

let b:relatedtest_file_exp = '\.go$'
let b:relatedtest_file_sub = '_test\.go'

let b:relatedtest_source_sub = '\.go'
let b:relatedtest_test_regexp = '_test\.go$'

function! b:relatedTestIsTest(actual_file_path)
    return strlen(matchstr(a:actual_file_path, b:relatedtest_test_regexp))
endfunction

function! b:relatedTestGetFileName(actual_file_path)
    let relatedtest_filename = substitute(a:actual_file_path, b:relatedtest_test_regexp, b:relatedtest_source_sub, '')

     return relatedtest_filename

endfunction

" Get the fullpath of the test file
function! b:relatedTestGetTestFileName(actual_file_path)
     let relatedtest_testfilename = substitute(a:actual_file_path, b:relatedtest_file_exp, b:relatedtest_file_sub, '')

     return relatedtest_testfilename
endfunction
