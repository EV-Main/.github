## Marks
all are written without a space and over a colon. So `//TODO!!!: shave a yak`, not `// TODO!!! shave a yak`

- NB | NOTE: important
- HACK
- BUG
- PERF
- SAFETY
- XXX: like NB but strictly negative
- REF: link to reference or its summarized version in text
- DUP | DUPLICATION: similar to SAFETY and LOOP: explains why duplication can't/shouldn't be abstracted
- DEP | DEPENDS | RELIES: list things that must be true for the logical block to function as expected
- BOTTLENECK: Can be placed on the section with the most expensive operation. In many cases can explain entire structure of a function on its own.

### temporary
When developing it's nice to be able to annotate approximate desired map of the next steps
As such, have
- TODO[!]*: todo, number of [!] signs for urgency
- DO | \-: pseudo-code, mapping out steps needing to be done, similar to how `sorry` is used in `lean`, but obviously more urgent. Useful for grepping to find what I left at when coming back to a codebase.
  > difference from TODO is we know exactly what needs to happen here. We write these as if we expect them to compile.
- dbg | DBG: something temporary that is introduced for testing purposes and is meant to be removed before committing
- TEST: similar to DBG, marks places where I'm trying out a new thing. Should be removed after the result of the experiment is apparent.
- Q: question to be resolved later
- MOVE: a special case of TODO, convenient for mapping out architecture changes. Simply says where a thing should be moved to eventually.
- DEPRECATE: a note to self to get around to deprecating something. Not to be used when native methods for marking something for deprecation are available (like `#[deprecated]` in rust)
- WAIT: some upstream is broken, - all we are left to do with is wait until they fix it. Could specify `($date)` to re-check it at if you feel like

## Placement
match on size of the thing you want to comment on:
- scope ->                   right above that scope.
- newline-delimited block -> right above that block.
- line ->                    append the comment to the same line.

NB: do not over-comment. It is a great crime. Only explain "why", almost never "what" (unless you're doing something inherently unreadable with no way to fix the readability).
