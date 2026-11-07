# Rust Style
## Derives
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

## Time
### Durations in Lib Interfaces
A duration in a lib's public interface.

**wrong**: `jiff::SignedDuration` in a lib that does not otherwise use `jiff`.

**right**: `std::time::Duration`.

**reason**: consumers that use `jiff` convert at their side; the lib does not pull `jiff` onto everyone else. A lib that itself uses `jiff` exposes `jiff`'s type.

## Tracing
### Spans
Tracing spans around functions.

**wrong**:
```rust
async fn sync_orders(exchange: &Exchange) -> Result<()> {
    let span = tracing::info_span!("sync_orders", exchange = %exchange.name, n_orders = tracing::field::Empty);
    let _guard = span.enter();
    // ...
    span.record("n_orders", orders.len());
}
```

**right**:
```rust
#[instrument(skip(exchange), fields(exchange = %exchange.name))]
async fn sync_orders(exchange: &Exchange) -> Result<()> {
    // ...
}
```

**reason**: span bookkeeping mixed into logic costs readability and iteration speed for little extra precision. `#[instrument]` also gives the `SpanTrace` captured by [`#[wrap_err]`](./errors.md) its frames. [codestyle](https://github.com/valeratrades/codestyle)'s opt-in `instrument` check flags async fns missing it.

## Errors
see [errors.md](./errors.md)
