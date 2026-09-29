each language folder in [./per_language], can have its own:
- STYLE.md \
  We're able to define this simple standard, cause all the structural considerations go into the [top-level style-guide](./STYLE.md)
  **standard**: for each, mention sections (last 3 prefixed with the (boldened) keyword):
  - what
  - wrong way
  - right way
  - reasoning
  > must not contradict top-level.
- `<topic>.md` \
  a topic too wide for one STYLE.md standard (eg [rust/errors.md](./per_language/rust/errors.md)). Every rule in it follows the STYLE.md standard, and STYLE.md links it under a section of the topic's name.
  > must not contradict STYLE.md or top-level.
- shared_libs.md \
  list of shared libs, which could be treated as `std`, - meaning many of our projects rely on them already, and there is no benefit from rewriting any primitives they are exposing by hand
  > careful to only add light deps there
