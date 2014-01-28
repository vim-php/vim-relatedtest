" relatedtest.vim - Vim related test plugin
" Language:     Viml
" Maintainer:   Walter Dal Mut (walter.dalmut AT gmail DOT com)
"
"       OPTIONS:
"
"           let g.realted_test_open_trigger = tt [default tt]
"               Combo for open a related test
"

let b:relatedtest_test_folder = ''
let b:relatedtest_src_folder = ''

let b:relatedtest_file_exp = '\.go$'
let b:relatedtest_file_sub = '_test\.go'

" Get the fullpath of the test file
function! b:relatedTestGetTestFileName(actual_file_path)
     let relatedtest_testfilename = substitute(
        \ substitute(a:actual_file_path, b:relatedtest_src_folder, b:relatedtest_test_folder, ''),
        \ b:relatedtest_file_exp, b:relatedtest_file_sub, '')

     return relatedtest_testfilename
endfunction
