conventions when writing text in {text, markdown, typst}

## Grammar
### Headers
section titles shall be written in `Title Case`

### Lists 
When listing objects, closing `and` should also have a comma before it.
So:
- *wrong*: "one, two and three"
- *right*: "one, two, and three"

### Either Of
Standard for mentioning multiple exclusive options.

- *single word*: "A/B"
- *multi-word*: "{do work / rest / shave yak}", - if any item contains a space, wrap in `{}` curlies

## Semantic Primitives

### Footnote
in absence of markdown, an inline footnote can be marked in 2 ways:

1. assumed markdown:
  ```txt
  there is a yak, I must[^1] shave it

  [^1] under the foo-bar yak law, it is obligatory
  ```

2. m-dash section:
  ```txt
  there is a yak, I must — under the foo-bar yak law it is obligatory — shave it
  ```

## Words
### or / xor
"or" is always logical `OR` (commonly written "and/or"). Exclusive "or" would be written "xor".
"OR" / "XOR" are the same words, capitalized only for ease of visual parsing.
> for readability to others, prefer [either-of semantics](#either-of) to writing out XORs

### ex / eg / ie
written exactly so: no dots inside, no punctuation after (not "e.g.,", "ex:").
- "ex": an example, no information on the total number of possible ones
- "eg": one of several
- "ie": the only one
