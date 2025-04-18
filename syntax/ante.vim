syn keyword notes contained TODO FIXME XXX NOTE

syn keyword anBool true false

syn match anType '\w\@<![A-Z]\w*'

syn match anOp '[+^\-*/%@=<>|?]'
syn match anOp ':='

syn match comment '//.*$' contains=notes,mlcmt
syn region mlcmt start='/\*' end='\*/' contains=notes
syn region quote start='`' end='`' contains=comment,mlcmt,anFnCall,stringLiteral,charLiteral,integerLiteral,doubleLiteral,anType,anOp,anKeywords

syn match anType '\'[a-z_]\w*'

syn match anModule '\<[A-Z]\w*\.'

syn keyword anKeywords if elif else import with
syn keyword anKeywords in do recur given resume pure
syn keyword anKeywords return fn opaque where derive forward
syn keyword anKeywords impl match trait module for while
syn keyword anKeywords type and loop can effect handle
syn keyword anKeywords or not then do via methods comptime

syn keyword anModifiers mut extern
syn keyword anModifiers own owned ref shared

syn match anFnCall '\([)\]"\'A-Za-z_0-9] *\)\@<![a-z]\w*\(\(\( *[(\'"\[]\)\|\( \+\w\)\)\@=\)\( \+\(do\|mut\|ante\|then\|can\|pure\|and\|or\|\\\|with\)\@!\)' contains=stringLiteral,charLiteral,anType,integerLiteral,doubleLiteral,anOp
syn match anFnCall '\(\(and\|or\|not\|then\|match\|if\|elif\|else\|import\|in\|do\|then\|export\|return\|new\|match\|xor\|mut\|ante\) \+\)\@<=[a-z]\w*\(\( *[(\'!&"\[]\| \+\w\)\@=\)\( \+\(do\|can\|pure\|mut\|then\|with\|and\|or\|\\\|in\)\@!\)' contains=stringLiteral,charLiteral,anType,integerLiteral,doubleLiteral,anOp
syn match anFnCall '\(\(|>\) *\)\@<=[a-z]\w*' contains=stringLiteral,charLiteral,anType,integerLiteral,doubleLiteral,anOp
syn match anFnCall '[a-z]\w*\(\( *<|\)\@=\)' contains=stringLiteral,charLiteral,anType,integerLiteral,doubleLiteral,anOp
syn match anFnCall '[a-z]\w*\(\( *{\)\@=\)' contains=stringLiteral,charLiteral,anType,integerLiteral,doubleLiteral,anOp
syn match anFnCall '\\\@<=\w\+' contains=anOp
syn match anFnCall '\w\+(\@=' contains=anOp,anType

syn region stringLiteral start='"' end='"' contains=interpolation

syn region interpolation start='\${' end='}' contains=comment,mlcmt,anFnCall,stringLiteral,charLiteral,integerLiteral,doubleLiteral,anType,anKeywords,funcDef,anBool,anOp

syn match interpolation '\$\w\+' contains=anOp

syn match charLiteral '\'.\''
syn match charLiteral '\'\\.\''

syn match integerLiteral '\([A-Za-z0-9]\@<!\)[0-9_]\+\([ui]\(8\|16\|32\|64\|sz\)\)\?'
syn match integerLiteral '\([A-Za-z0-9]\@<!\)0b[01_]\+\([ui]\(8\|16\|32\|64\|sz\)\)\?'
syn match integerLiteral '\([A-Za-z0-9]\@<!\)0o[0-7_]\+\([ui]\(8\|16\|32\|64\|sz\)\)\?'
syn match integerLiteral '\([A-Za-z0-9]\@<!\)0x[0-9A-Fa-f_]\+\([ui]\(8\|16\|32\|64\|sz\)\)\?'

syn match doubleLiteral '\([A-Za-z0-9]\@<!\)\d\+\.\d*\(f\(16\|32\|64\|\)\)\?'


let b:current_syntax = "an"

hi def link notes          Todo
hi def link comment        Comment
hi def link mlcmt          Comment
hi def link preproc        PreProc
hi def link quote          PreProc
hi def link anOp           Keyword
hi def link anKeywords     Keyword
hi def link anModifiers    Keyword "StorageClass
hi def link anBool         Boolean
hi def link funcDef        Function
hi def link anFnCall       Function
hi def link anModPath      ModPath
hi def link anType         Type
hi def link stringLiteral  String
hi def link charLiteral    String
hi def link integerLiteral Number
hi def link doubleLiteral  Number

hi def link anControl      ModPath
