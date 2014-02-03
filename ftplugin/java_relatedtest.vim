" relatedtest.vim - Vim related test plugin
" Language:     Viml
" Maintainer:   Walter Dal Mut (walter.dalmut AT gmail DOT com)
"
"       OPTIONS:
"
"           let g.realted_test_open_trigger = tt [default tt]
"               Combo for open a related test
"

let b:relatedtest_file_sub = 'Test\.java'
let b:relatedtest_source_sub = '\.java'

let b:relatedtest_test_regexp = 'Test\.java$'

function! b:relatedTestIsTest(actual_file_path)
    return strlen(matchstr(a:actual_file_path, b:relatedtest_test_regexp))
endfunction

function! b:relatedTestGetFileName(actual_file_path)
    let currentfile_name = substitute(expand('%:t'), b:relatedtest_file_sub, '', '')
    let package_line = search('package')
    let package = getline(package_line)
    execute 'vimgrep /' . package . '\|\' . currentfile_name . '/gj **/' . currentfile_name . b:relatedtest_source_sub
    let quickfixlist = getqflist()
    return bufname(quickfixlist[0].bufnr)
endfunction

" Get the fullpath of the test file
function! b:relatedTestGetTestFileName(actual_file_path)
    let currentfile_name = substitute(expand('%:t'), b:relatedtest_source_sub, '', '')
    let package_line = search('package')
    let package = getline(package_line)
    execute 'vimgrep /' . package . '\|\' . currentfile_name . 'Test/gj **/' . currentfile_name . b:relatedtest_file_sub
    let quickfixlist = getqflist()
    return bufname(quickfixlist[0].bufnr)
endfunction
