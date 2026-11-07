Set of convensions upkeep across all repos and languages in this organization.

> **NB:** some will be enforced programmatically (through [v_flakes](https://github.com/valeratrades/v_flakes) and [codestyle](https://github.com/valeratrades/codestyle)), and thus not even mentioned here.

Every statement must be the source of truth for how it is done across the entire organization. If it's not ubiquitous, - it's doesn't warrant adding.
In cases where you wish to enforce situational conventions, - pin them in `docs/ARCHITECTURE.md` or `docs/spec/`[^1] of the project directly.
[^1]: https://github.com/bearcove/tracey

> In absence of a stated convention, assume language defaults.

# Style
## General
### Ifs Up
**what**: a branch on a function's argument. [REF](https://matklad.github.io/2023/11/15/push-ifs-up-and-fors-down.html)

**wrong**:
```rust
fn frobnicate(walrus: Option<Walrus>) {
    let Some(walrus) = walrus else { return };
    // ...
}
```

**right**:
```rust
fn frobnicate(walrus: Walrus) {
    // ...
}
```

**reason**: the caller already knows whether it has a walrus; the check moves to where the information is, and the callee's signature states its precondition. Control flow concentrated in one function is easier to see redundant or dead branches in.

### Fors Down
**what**: an operation applied to many items. [REF](https://matklad.github.io/2023/11/15/push-ifs-up-and-fors-down.html)

**wrong**:
```rust
for walrus in walruses {
    frobnicate(walrus);
}
```

**right**:
```rust
fn frobnicate_batch(walruses: &[Walrus]) {
    // ...
}
```

**reason**: a function that sees the whole batch can amortize setup, reorder work, and vectorize; one that sees a single item cannot.

### Number Line Comparisons
**what**: ordered comparisons. [REF](https://matklad.github.io/2023/09/13/comparative-analysis.html)

**wrong**: `x >= lo && hi >= x`

**right**: `lo <= x && x <= hi`

**reason**: written with `<` and `<=` only, operands read left to right in number line order, so one picture covers every comparison. Outside an interval is `x < lo || hi < x`.

### Positive Invariants
**what**: a condition guarding an invariant. [REF](https://matklad.github.io/2023/09/13/comparative-analysis.html)

**wrong**:
```rust
if index >= xs.len() {
    // ...
}
```

**right**:
```rust
if index < xs.len() {
    // ...
} else {
    // ...
}
```

**reason**: the invariant is `index < xs.len()`. Spelling its converse makes the reader negate it in their head, even without a literal `!`.

### Wrapper Field
**what**: the main wrapped field of a newtype-ish struct.

**wrong**:
```python
class Klines:
    klines: list[Kline]
    tf: Timeframe
```

**right**:
```python
class Klines:
    v: list[Kline]
    tf: Timeframe
```

**reason**: mirroring the wrapper's name gives `klines.klines`. `v` marks the field the wrapper stands for, and with deref (eg Rust's `#[deref]`) it is the one forwarded to.

<!-- TODO: could heavily pull from https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/TIGER_STYLE.md -->

## Errors
### Never Fail on User Input
**what**: invalid input from a user: cli args, config, requests, forms.

**wrong**: panic, assert or unwrap on it.

**right**: return an error that names the offending value and what was expected. A long-running process rejects that input and keeps serving.

**reason**: a panic signals a bug in our code. Malformed user input is an expected state, not a bug.
