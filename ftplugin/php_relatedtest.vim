" relatedtest.vim - Vim related test plugin
" Language:     Viml
" Maintainer:   Walter Dal Mut (walter.dalmut AT gmail DOT com)
"
"       OPTIONS:
"
"           let g.realted_test_open_trigger = tt [default tt]
"               Combo for open a related test
"

let b:relatedtest_file_sub = 'Test.php'
let b:relatedtest_source_sub = '.php'

let b:relatedtest_test_regexp = 'Test\.php$'

" allow source path overwrite
if !exists('g:relatedtest_php_src')
    let g:relatedtest_php_src=""
endif

" allow test path overwrite
if !exists('g:relatedtest_php_tests')
    let g:relatedtest_php_tests=""
endif

function! RelatedTestIsTest(actual_file_path)
    return strlen(matchstr(a:actual_file_path, b:relatedtest_test_regexp))
endfunction

" Get the fullpath of the implementation file
function! RelatedTestGetFileName(actual_file_path)
    let current_filename = substitute(expand('%:t'), b:relatedtest_file_sub, '', '')

    let deducedImplementationFilePath = RelatedTestDeduceImplementationPath(current_filename)
    let deducedImplementationPath = fnamemodify(deducedImplementationFilePath, ':p:h')
    return deducedImplementationPath . '/' . current_filename . b:relatedtest_source_sub
endfunction

" Get the fullpath of the test file
function! RelatedTestGetTestFileName(actual_file_path)
    let current_filename = substitute(expand('%:t'), b:relatedtest_source_sub, '', '')

    let deducedTestFilePath = RelatedTestDeduceTestsPath(current_filename)
    let deducedTestPath = fnamemodify(deducedTestFilePath, ':p:h')
    return deducedTestPath . '/' . current_filename . b:relatedtest_file_sub
endfunction

" Try to deduce the tests path of a package
function! RelatedTestDeduceTestsPath(package)
    execute 'vimgrep /' . a:package . '/gj '.g:relatedtest_php_tests.'**/*' . b:relatedtest_file_sub
    let quickfixlist = getqflist()
    return bufname(quickfixlist[0].bufnr)
endfunction

" Try to deduce the implementation path of a package
function! RelatedTestDeduceImplementationPath(package)
    execute 'vimgrep /' . a:package . '/gj '.g:relatedtest_php_src.'**/*' . b:relatedtest_source_sub
    let quickfixlist = getqflist()
    return bufname(quickfixlist[0].bufnr)
endfunction

