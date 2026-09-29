# Rust Style
## derives
when using derives from libraries, write them out:

**wrong**:
```rust
use serde::Deserialize;
#[derive(Deserialize, Ord)]
struct Yak;
```

**right**:
```rust
#[derive(Ord, serde::Deserialize)]
struct Yak;
```

**reason**: this way, auto-formatter for derives won't mix them together.

## errors
see [errors.md](./errors.md)
