" Vim syntax file
" Language:	Kivy
" Maintainer:	Gabriel Pettier <gabriel.pettier@gmail.com>
" Last Change:	2017 September 1

if exists("b:current_syntax")
    finish
endif

syn include @pyth $VIMRUNTIME/syntax/python.vim

syn match kivyValue         ".*" contains=@pyth transparent
syn match kivyComment       "#.*\n" display contains=pythonTodo,Spell

syn match kivyVersion       "^#:kivy .*\n" display contains=pythonTodo,Spell
syn match kivyPreProc       "^#:.*"
syn match kivyDefine        "^#:set .*"
syn match kivyInclude       "^#:include .*"
syn match kivyImport        "^#:import .*"

syn match kivyRootRule      "^\I\i*:\?$" nextgroup=kivyAttribute
syn match kivyAttribute     "^\s\+_*\l\i*:" nextgroup=kivyValue
syn match kivyId            "\(id:\s*\)\@<=\w\+"
syn match kivyInstruction   "^\s\+\u\i*:\?" contains=kivyAttribute contained
syn match kivyWidget        "^\s\+\u\i*:\?" nextgroup=kivyAttribute
syn match kivyBind          "^\s\+on_\I\i*:" nextgroup=kivyValue
syn match kivyRule          "^<-\?\I\i*\([,+@]-\?s*\I\i*\)*>:\?" nextgroup=kivAttribute contains=kivyRuleSpecial
syn match kivyTemplate      "^\[-\?\I\i*\([,+@]-\?s*\I\i*\)*\]:\?" nextgroup=kivyAttribute contains=kivyRuleSpecial
syn match kivyRuleSpecial   "[-+@,]" contained
syn match kivyCanvas        "^\s*canvas\(\.before\|\.after\)\?:" nextgroup=kivyInstruction contains=kivyInstruction,kivyCanvasRegion

syn region kivyBind         start="^\(\s\+\)on_\i\+:\n\+\z(\1\s\{4}\)\S"ms=s+1 skip="^\%(\z1\S\|^$\)" end="^\z1\@!.*"me=s-1 contains=@pyth

syn region kivyCanvasRegion start="^\%(\(\s*\)canvas\%(\.before\|.after\)\?:\n\z(\1\s\{4}\)\)"ms=s+1 skip="\%(^\z1\S\|^$\)" end="^\z1\@!."me=s-1  contains=kivyValue,kivyInstruction transparent keepend

hi def link kivyVersion      PreProc
hi def link kivyPreproc      PreProc
hi def link kivyComment      Comment
hi def link kivyRule         Structure
hi def link kivyTemplate     Structure
hi def link kivyRootRule     Identifier
hi def link kivyAttribute    Identifier
hi def link kivyBind         Keyword
hi def link kivyWidget       Special
hi def link kivyCanvas       Function
hi def link kivyInstruction  Statement
hi def link KivyId           Define
hi def link kivyDefine       Define
hi def link kivyImport       Macro
hi def link kivyInclude      Include
hi def link kivyRuleSpecial  Special


let b:current_syntax = "kivy"
