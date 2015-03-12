" Vim syntax file
" Language:      Maude <http://maude.cs.uiuc.edu/>
" Maintainer:    Steven N. Severinghaus <sns@severinghaus.org>
" Last Modified: 2005-02-03
" Version: 0.1

" Quit if syntax file is already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

command! -nargs=+ MaudeHiLink hi def link <args>

syn match maudeIdentifier   "\<[a-z][a-zA-Z_]\+\>"
syn match maudeType	    contained "\<[A-Z][a-zA-Z_]\+\>"

syn region maudeModule start="\(mod\|fmod\|omod\)" end="is" contains=maudeModules
syn keyword maudeModule  endm endfm endom
syn keyword maudeImports    protecting including extending
syn region  maudeSorts      start="\(sort\|sorts\|subsort\|subsorts\)" matchgroup=maudeOps end="\." contains=maudeType,maudeSubsortOp
syn match   maudeSubsortOp  contained "<"
syn keyword maudeStatements op ops var vars
syn match   maudeFlags      "\["
syn match   maudeFlags      "\]"
syn region  maudeRewrite    start="\(rl\|crl\)" matchgroup=maudeOps end=":" contains=maudeLabel
syn match   maudeLabel	    contained "\[.*\]"
syn keyword maudeCommands   reduce rewrite frewrite red rew frew eq ceq
syn match   maudeComment    "\*\*\*.*"
syn match   maudeComment    "---.*"
syn match   maudeOps        "->"
syn match   maudeOps        ":"
syn match   maudeOps        "="
syn match   maudeOps        "=>"
syn match   maudeOps        "\.\s*$"
syn match   maudeQuoted     "'\([a-zA-Z0-9_]\|`.\)\+"

syn keyword maudeModules    INT FLOAT NAT RAT BOOL QID TRUTH IDENTICAL STRING
syn keyword maudeModules    CONVERSION
syn match   maudeModules    contained "[A-Z-_]\+"
syn match   maudeModules    "TRUTH-VALUE"
syn match   maudeModules    "EXT-BOOL"
syn match   maudeModules    "QID-LIST"
syn match   maudeModules    "META-MODULE"
syn match   maudeModules    "META-TERM"
syn match   maudeModules    "META-LEVEL"
syn match   maudeModules    "LOOP-MODE"
syn match   maudeModules    "CONFIGURATION"

syn keyword maudeType      Bool Int Float Nat Qid
syn keyword maudeType      Zero NzNat NzInt NzRat Rat FiniteFloat
syn keyword maudeType      String Char FindResult DecFloat

syn keyword maudeAttrs      assoc comm idem iter id strat memo
syn keyword maudeAttrs      prec gather format ctor config object msg frozen
syn keyword maudeAttrs      poly special label metadata owise nonexec
syn match   maudeAttrs      "left\s\+id:"
syn match   maudeAttrs      "right\s\+id:"

" Meta stuff; this may not actually be useful
syn keyword maudeSorts      Sort Kind Type
syn keyword maudeSorts      Constant Variable GroundTerm Term GroundTermList TermList
syn keyword maudeSorts      Assignment Substitution
syn keyword maudeSorts      Context CTermList GTermList
syn keyword maudeSorts      Attr AttrSet
syn keyword maudeSorts      Renaming RenamingSet
syn keyword maudeSorts      ModuleExpression
syn keyword maudeSorts      Import ImportList
syn keyword maudeSorts      SortSet SubsortDecl SubsortDeclSet
syn keyword maudeSorts      TypeList NatList QidList
syn keyword maudeSorts      Hook HookList
syn keyword maudeSorts      OpDecl OpDeclSet EqCondition Condition
syn keyword maudeSorts      MembAx MembAxSet Equation EquationSet
syn keyword maudeSorts      Rule RuleSet
syn keyword maudeSorts      FModule SModule FTheory STheory Module
syn keyword maudeSorts      Bound KindSet
syn keyword maudeSorts      ResultPair ResultTriple Result4Tuple MatchPair
syn keyword maudeSorts      State System
syn keyword maudeSorts      Attribute AttributeSet
syn keyword maudeSorts      Oid Cid Object Msg Configuration
syn match   maudeSorts      "Type\?"
syn match   maudeSorts      "ResultPair\?"
syn match   maudeSorts      "ResultTriple\?"
syn match   maudeSorts      "Result4Tuple\?"
syn match   maudeSorts      "MatchPair\?"
syn match   maudeSorts      "Substitution\?"

" From the BOOL module
syn keyword maudeStatements if and or xor not implies

syn keyword maudeLiteral    true false
syn match   maudeLiteral    "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   maudeLiteral    "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="

MaudeHiLink maudeIdentifier Identifier
MaudeHiLink maudeType       Type
MaudeHiLink maudeModule     PreProc
MaudeHiLink maudeImports    PreProc
MaudeHiLink maudeSorts      Underlined
MaudeHiLink maudeSubsortOp  Special
MaudeHiLink maudeStatements Special
MaudeHiLink maudeRewrite    Keyword
MaudeHiLink maudeLabel      Label
MaudeHiLink maudeQuoted     String
MaudeHiLink maudeModules    String
MaudeHiLink maudeComment    Comment
MaudeHiLink maudeOps        Special
MaudeHiLink maudeCommands   Keyword
MaudeHiLink maudeFlags      PreProc
MaudeHiLink maudeAttrs      PreProc
MaudeHiLink maudeSorts      Type
MaudeHiLink maudeLiteral    String
"hi def     maudeMisc       term=bold cterm=bold gui=bold

delcommand MaudeHiLink

let b:current_syntax = "maude"

"EOF vim: tw=78:ft=vim:ts=8

