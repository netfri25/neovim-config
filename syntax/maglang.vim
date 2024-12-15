
if exists("b:current_syntax")
    finish
endif

syn region mgComment start="//" end="$"

syn keyword mgKeyword let final const as
syn match mgOperator display "&&\|||"
syn match mgOperator display "\%(+\|-\|/\|*\|=\|\^\|&\||\|!\|>\|<\|%\)=\?"
syn match mgType "[A-Z]\w\+"
syn match mgNumber "\<\d\+\>"
syn match mgNumber "\<\d\+\.\d\+\>"
syn keyword mgBoolean true false
syn match mgDelimiter  "(\|)\|\[\|\]\|,\|{\|}"

hi def link mgComment Comment
" hi def link qbeFloat Number
" hi def link qbeInstruction Function
hi def link mgOperator Operator
hi def link mgKeyword Keyword
hi def link mgNumber Number
hi def link mgBoolean Boolean
hi def link mgDelimiter Operator
" hi def link qbeNumber Number
hi def link mgType Type

let b:current_syntax="maglang"
