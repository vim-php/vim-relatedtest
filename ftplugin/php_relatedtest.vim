" relatedtest.vim - Vim related test plugin
" Language:     Viml
" Maintainer:   Walter Dal Mut (walter.dalmut AT gmail DOT com)
"
"       OPTIONS:
"
"           let g.realted_test_open_trigger = tt [default tt]
"               Combo for open a related test
"
let b:relatedtest_src_regexp = [
    \ '^src',
    \ '^library',
    \ '^lib'
    \ ]
let b:relatedtest_src_folders = [
    \ 'src',
    \ 'library',
    \ 'lib'
    \ ]

let b:relatedtest_test_folder = 'tests'

let b:relatedtest_file_exp = '\.php$'
let b:relatedtest_file_sub = 'Test\.php'

let b:relatedtest_source_sub = '\.php'
let b:relatedtest_test_regexp = 'Test\.php$'

function! b:relatedTestIsTest(actual_file_path)
    return strlen(matchstr(a:actual_file_path, b:relatedtest_test_regexp))
endfunction

function! b:relatedTestGetFileName(actual_file_path)
    for possible_dir in b:relatedtest_src_folders
        if isdirectory(possible_dir)
            return substitute(
                \ substitute(a:actual_file_path, b:relatedtest_test_folder, possible_dir, ""),
                \ b:relatedtest_test_regexp, b:relatedtest_source_sub, "")

        endif
    endfor
endfunction

" Get the fullpath of the test file
function! b:relatedTestGetTestFileName(actual_file_path)
    let l:relatedtest_src = a:actual_file_path
    for source_folder in b:relatedtest_src_regexp
        let l:relatedtest_src =
            \ substitute(l:relatedtest_src, source_folder, b:relatedtest_test_folder, '')
    endfor

    let relatedtest_testfilename =
        \ substitute(l:relatedtest_src, b:relatedtest_file_exp, b:relatedtest_file_sub, '')

    return relatedtest_testfilename
endfunction
