each language folder in [./per_language], can have its own:

- STYLE.md \
  We're able to define this simple standard, cause all the structural considerations go into the [top-level style-guide](./STYLE.md)
  **standard**: for each, mention sections:
  - what
  - wrong way
  - right way
  - reasoning
  > must not contradict top-level.

  sections are topics, in the order a piece of work meets them (design → write → verify), with `Other` always last. Inside one, rules go from the widest scope to the narrowest; a lax list goes before full rules. A rule joins an existing topic when it fits one; once `Other` holds several rules of one topic, that topic gets its own section.

  default rendering is having last 3 clearly named, with keywords as boldened prefixes.
  However, there is no standard forcing this. There are cases where such is the most efficient way to convey the information, and there are cases where it absolutely isn't. // Oh, and `what` is never mentioned as a prefix ever, - that's what description is, - first line after the header is already assumed to be that.

- `<topic>.md` \
  a topic too wide for one STYLE.md standard (eg [rust/errors.md](./per_language/rust/errors.md)). Every rule in it follows the STYLE.md standard, and STYLE.md links it under a section of the topic's name.
  > must not contradict STYLE.md or top-level.

- shared_libs.md \
  list of shared libs, which could be treated as `std`, - meaning many of our projects rely on them already, and there is no benefit from rewriting any primitives they are exposing by hand
  > careful to only add light deps there
