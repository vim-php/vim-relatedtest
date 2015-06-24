" relatedtest.vim - Vim related test plugin
" Language:     Viml
" Maintainer:   Walter Dal Mut (walter.dalmut AT gmail DOT com)
"
"       OPTIONS:
"
"           let g.realted_test_open_trigger = tt [default tt]
"               Combo for open a related test
"

function! s:GetInputResponse(prompt, inputChoices)
    echo a:prompt
    while 1
        let choice = tolower(nr2char(getchar()))
        for inputChoice in a:inputChoices
            if inputChoice == choice
                return choice
            endif
        endfor
        echo "Invalid choice. Valid choices: ". join(a:inputChoices, ',').": "
    endwhile
endfunction

function! relatedtest#handleTT()
    let bufname = bufname('%')
    if RelatedTestIsTest(bufname) > 0
        let relatedtest_filename = RelatedTestGetFileName(bufname)
    else
        let relatedtest_filename = RelatedTestGetTestFileName(bufname)
    endif
    let open_strategy = ":" . g:relatedtest_open_strategy . " "
    if filereadable(relatedtest_filename)
        exec open_strategy . relatedtest_filename
    else
        if s:GetInputResponse("Test file '" . relatedtest_filename . "' doesn't exists. Create a new test file (y/n)?", ['y', 'n']) == 'y'
            exec open_strategy . relatedtest_filename
        endif
    endif
endfunction
