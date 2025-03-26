
if exists("b:current_syntax")
    finish
endif

syn region mgComment start="//" end="$"

syn keyword mgKeyword let final const as fn return break continue if else while defer struct enum sizeof global
syn match mgOperator display "&&\|||"
syn match mgOperator display "\%(+\|-\|/\|*\|=\|\^\|&\||\|!\|>\|<\|%\|\~\|\.\|@\)=\?"
syn match mgType "\<[A-Z]\w*\>"
syn match mgNumber "\<\d\+\>"
syn match mgNumber "\<\d\+\.\d\+\>"
syn keyword mgBoolean true false
syn match mgDelimiter  "(\|)\|\[\|\]\|,\|{\|}"
syn region mgComment start="\/\/" end="$"
syn match mgFunction "\<\h\w*\ze\_s*("

syn match mgEscape display contained /\v\\[bfnrtv'"]|\\x\x{2}|\\\o{1,3}/
syn region mgString    start=/"/ skip=/\\"/ end=/"/ contains=mgEscape
syn region mgCharacter start=/'/ skip=/\\'/ end=/'/ contains=mgEscape

hi def link mgComment Comment
hi def link mgOperator Operator
hi def link mgKeyword Keyword
hi def link mgNumber Number
hi def link mgBoolean Boolean
hi def link mgDelimiter Operator
hi def link mgType Type
hi def link mgString String
hi def link mgCharacter Character
hi def link mgComment Comment
hi def link mgEscape Special
hi def link mgFunction Function

let b:current_syntax="maglang"
