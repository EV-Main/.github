# Rust Errors
Stack: [`thiserror`](https://docs.rs/thiserror) + [`miette`](https://docs.rs/miette) + `std::backtrace::Backtrace` + `#[wrap_err]` from [`v_utils_macros`](https://docs.rs/v_utils_macros) (re-exported as `v_utils::macros`).

## Crate Setup
**what**: a crate that declares error types with `#[wrap_err]`.

**wrong**: `v_utils` alone; the expansion fails on the missing `tracing_error` and on `provide()`.

**right**:
```toml
# Cargo.toml
thiserror = "2"
miette = "7"
tracing-error = "0.2" # `#[wrap_err]` expands to `::tracing_error::SpanTrace`
v_utils = { version = "2", features = ["macros"] }
```
```rust
// lib.rs
#![feature(error_generic_member_access)]
```

**reason**: `#[wrap_err]` injects `backtrace: Backtrace` and `spantrace: SpanTrace` fields; `thiserror` provides the backtrace only under that feature.

## Leaf Errors
**what**: an error that starts here, with no source.

**wrong**:
```rust
#[derive(Debug, thiserror::Error, miette::Diagnostic)]
pub enum MyError {
    #[error("thing {name} is invalid")]
    Invalid { name: String, backtrace: std::backtrace::Backtrace },
}

return Err(MyError::Invalid { name, backtrace: Backtrace::capture() });
```

**right**:
```rust
#[wrap_err]
#[derive(Debug, thiserror::Error, miette::Diagnostic)]
pub enum MyError {
    #[leaf]
    #[error("thing {name} is invalid")]
    #[diagnostic(code(mycrate::invalid))]
    Invalid { name: String },
}

return Err(MyError::new_invalid(name));
```

**reason**: `#[leaf]` injects `backtrace` and `spantrace` and generates a `new_<variant>(…)` constructor that captures both, so call sites carry nothing but the fields. On a struct the constructor is `new(…)`.

## Wrapping Foreign Errors
**what**: wrapping an error from `std`, `reqwest`, `serde_json`, etc., which carries no backtrace of its own.

**wrong**:
```rust
#[error(transparent)]
Io(#[from] std::io::Error),
```

**right**:
```rust
#[foreign]
Io(std::io::Error),

some_io_result?;
```

**reason**: `#[foreign]` becomes `{ source, backtrace, spantrace }` with a `From` impl that captures both at the `?`. A bare `#[from]` records nothing about where it happened.

## Wrapping Our Own Errors
**what**: wrapping one of our error types, which already carries a backtrace.

**wrong**:
```rust
#[foreign]
Inner(InnerError),
```

**right**:
```rust
#[own]
Inner(InnerError),

produces_inner_result()?;
```

**reason**: `#[own]` expands to `#[error(transparent)] Inner(#[from] #[backtrace] InnerError)`, so `provide()` hands out the inner error's backtrace, which points at where it actually started. `#[foreign]` would capture a second one at the `?`.

## Catch-All Variant
**what**: an `Other(eyre::Report)` escape hatch.

**wrong**:
```rust
#[error(transparent)]
#[diagnostic(code(mycrate::other))]
Other(eyre::Report),
```

**right**:
```rust
#[error(transparent)]
Other(eyre::Report),
```

**reason**: a diagnostic code is for a typed variant where it tells the reader what to do. Nobody matches on `err.code()` strings, and "other" tells them nothing.

## Backtrace Field
**what**: where a backtrace lives in an error type.

**wrong**: `MyError(Backtrace)`

**right**: `MyError { backtrace: Backtrace }`

**reason**: `derive_new`'s `#[new(value = "…")]` works only on named fields. `#[wrap_err]` always injects named ones.

> `Backtrace::capture()` is empty unless `RUST_BACKTRACE=1` (or `RUST_LIB_BACKTRACE=1`) is set at runtime.
