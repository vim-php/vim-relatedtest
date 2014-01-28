" relatedtest.vim - Vim related test plugin
" Language:     Viml
" Maintainer:   Walter Dal Mut (walter.dalmut AT gmail DOT com)
"
"       OPTIONS:
"
"           let g.realted_test_open_trigger = tt [default tt]
"               Combo for open a related test
"
let b:relatedtest_src_folders = [
    \ '^src',
    \ '^library',
    \ '^lib'
    \ ]
let b:relatedtest_test_folder = 'tests'

let b:relatedtest_file_exp = '\.php$'
let b:relatedtest_file_sub = 'Test\.php'

" Get the fullpath of the test file
function! b:relatedTestGetTestFileName(actual_file_path)
    let l:relatedtest_src = a:actual_file_path
    for source_folder in b:relatedtest_src_folders
        let l:relatedtest_src =
            \ substitute(l:relatedtest_src, source_folder, b:relatedtest_test_folder, '')
    endfor

    let relatedtest_testfilename =
        \ substitute(l:relatedtest_src, b:relatedtest_file_exp, b:relatedtest_file_sub, '')

    return relatedtest_testfilename
endfunction
