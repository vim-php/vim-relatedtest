" relatedtest.vim - Vim related test plugin
" Language:     Viml
" Maintainer:   Walter Dal Mut (walter.dalmut AT gmail DOT com)
"
"       OPTIONS:
"
"           let g.realted_test_open_trigger = tt [default tt]
"               Combo for open a related test
"

let b:relatedtest_file_sub = 'Test.java'
let b:relatedtest_source_sub = '.java'

let b:relatedtest_test_regexp = 'Test\.java$'


function! RelatedTestIsTest(actual_file_path)
    return strlen(matchstr(a:actual_file_path, b:relatedtest_test_regexp))
endfunction

" Get the fullpath of the implementation file
function! RelatedTestGetFileName(actual_file_path)
    let currentfile_name = substitute(expand('%:t'), b:relatedtest_file_sub, '', '')
    let package_line = search('package')
    let package = getline(package_line)
    let deducedImplementationFilePath = RelatedTestDeduceImplementationPath(package)
    let deducedImplementationPath = fnamemodify(deducedImplementationFilePath, ':p:h')
    return deducedImplementationPath . '/' . currentfile_name . b:relatedtest_source_sub
endfunction

" Get the fullpath of the test file
function! RelatedTestGetTestFileName(actual_file_path)
    let currentfile_name = substitute(expand('%:t'), b:relatedtest_source_sub, '', '')
    let package_line = search('package')
    let package = getline(package_line)
    let deducedTestFilePath = RelatedTestDeduceTestsPath(package)
    let deducedTestPath = fnamemodify(deducedTestFilePath, ':p:h')
    return deducedTestPath . '/' . currentfile_name . b:relatedtest_file_sub
endfunction

" Try to deduce the tests path of a package
function! RelatedTestDeduceTestsPath(package)
    execute 'vimgrep /' . a:package . '/gj **/*' . b:relatedtest_file_sub
    let quickfixlist = getqflist()
    return bufname(quickfixlist[0].bufnr)
endfunction

" Try to deduce the implementation path of a package
function! RelatedTestDeduceImplementationPath(package)
    execute 'vimgrep /' . a:package . '/gj **/*' . b:relatedtest_source_sub
    let quickfixlist = getqflist()
    return bufname(quickfixlist[0].bufnr)
endfunction
