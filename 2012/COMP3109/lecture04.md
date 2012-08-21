# COMP3109 Programming Languages and Paradigms
## Syntax and Semantics
Syntax
  ~ The form or structure of language
  ~ Specified by the grammar
  ~ Not concerned with meanings

Semantics
  ~ The meaning, there is some definition to the content

## Grammars
Grammars consist of productions of the form  
`<nonterminal> ::= sequence of (non) terminals`

Terminals
  ~ Words in a sentence
  ~ Characters, Numbers etc things that do not have further grammars
  ~ Sometimes referred to as tokens

Non-Terminals
  ~ Can be a series of terminals/nonterminals

Syntantial Form
  ~ A syntactically valid permutation of terminals and non-terminals

$\epsilon$
  ~ Used to denote an empty string

This recursive definition of a grammar gives a syntax.
A syntax only has a certain valid set of permutation of terminals as defined by the grammar.

A language has a finite sized syntax if its grammar is not cyclic.
If its grammar is cyclic we can construct infinitely many valid syntactic combinations.

### Derivation
A derivation shows how to generate a syntactically valid string.
Derivations take a definition of a non-terminal and recursively replace the non-terminal elements of the definition with their definitions.
Eventually we are left with only terminal values which in combination form a valid form of the syntax.

## Implementing Grammars
### Scanners (Lexical Analysis)
Converts a series of characters into tokens which represent the terminals and non-terminals of the language.

The token identifier itself has its own language to define and identify certain tokens.
For example to identify a variable token we may define it as a series of alpha numeric values and underscores.

### Parsers (Syntax Analysis)
Produces the derivation of the tokens works in a recursive manner. 
The parser produces a syntax tree with terminal tokens at the leaves of the tree.

## Regular Expressions
Regular expressions are used to tokenize the lexical input.

Regular expressions are converted into deterministic finite automata via non-deterministic finite automata.

Non-Deterministic Finite Automata (NFA)
  ~ RegEx can be converted to NFA recursively by a series of definitions

Deterministic Finite Automona (DFA)
  ~ are finite automata in which each character being parsed can be in only one state.
