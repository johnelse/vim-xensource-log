" Vim syntax file
" Language:      xapi
" Filenames:     *.log
" Maintainers:   Vincent Hanquez <vincent@snarc.org>
" URL:           --

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax") && b:current_syntax == "xapi"
  finish
endif

syn case match

syn match   xapiKeyword  "xapi server starting"
syn keyword xapiKeyword  Raised
syn keyword xapiKeyword  INTERNAL_ERROR
syn keyword xapiKeyword  HANDLE_INVALID
syn keyword xapiKeyword  exception

syn keyword xapiBoolean  true
syn keyword xapiBoolean  false

syn keyword xapiError    error warn
syn keyword xapiInfo     info
syn match   xapiLHSSep   "|"
syn region  xapiLHS start=/^\[/ end=/\]/ contains=xapiSmallRef,xapiLHSSep,xapiError,xapiInfo

syn case ignore

syn match   xapiFloat          display contained "\d\+f"
syn match   xapiNumber	       display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match   xapiNumbers        display transparent "\<\d\|\.\d" contains=xapiNumber,xapiFloat
syn match   xapiRef            "OpaqueRef:\x\+-\x\+-\x\+-\x\+-\x\+"
syn match   xapiRef            "OpaqueRef:NULL"
syn match   xapiSmallRef       "[RD]:\x\{12}"
syn match   xapiUuid           "\x\{8}-\x\{4}-\x\{4}-\x\{4}-\x\{12}" 




" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_xapi_syntax_inits")
  if version < 508
    let did_xapi_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink xapiLHS           Comment
  HiLink xapiError         String
  HiLink xapiInfo          Keyword
  HiLink xapiSmallRef      PreProc

  HiLink xapiKeyword	   Keyword
  HiLink xapiBoolean	   Boolean
  HiLink xapiNumbers	   Number
  HiLink xapiFloat	   Float
  HiLink xapiRef           Function
  HiLink xapiUuid          String

  delcommand HiLink
endif

let b:current_syntax = "xapi"
