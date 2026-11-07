Set of convensions upkeep across all repos and languages in this organization.

> **NB:** some will be enforced programmatically (through [v_flakes](https://github.com/valeratrades/v_flakes) and [codestyle](https://github.com/valeratrades/codestyle)), and thus not even mentioned here.

Every statement must be the source of truth for how it is done across the entire organization. If it's not ubiquitous, - it's doesn't warrant adding.
In cases where you wish to enforce situational conventions, - pin them in `docs/ARCHITECTURE.md` or `docs/spec/`[^1] of the project directly.
[^1]: https://github.com/bearcove/tracey

> In absence of a stated convention, assume language defaults.

# Style
## General
### [Push Ifs Up and Fors Down](https://matklad.github.io/2023/11/15/push-ifs-up-and-fors-down.html)
Branch in the caller, where the information is; loop in the callee, which then sees the whole batch.

**wrong**:
```rust
for walrus in walruses {
    if condition { walrus.frobnicate() } else { walrus.transmogrify() }
}
```

**right**:
```rust
if condition {
    for walrus in walruses { walrus.frobnicate() }
} else {
    for walrus in walruses { walrus.transmogrify() }
}
```

**reason**: the branch is decided once instead of per item, and branches gathered in one place show which are redundant or dead. A loop that owns the whole batch can amortize setup and vectorize.

### [Comparators](https://matklad.github.io/2023/09/13/comparative-analysis.html)
- prefer `<` and `<=` over `>` and `>=`
- state invariants positively:
    ```rust
    if index >= xs.len() {
    }
    ```
    is a double negation semantically: the invariant is `index < xs.len()`

**reason**: with `<` and `<=` only, operands sit in number line order (`lo <= x && x <= hi`), so every comparison reads as one picture. A negated invariant has to be negated back in the reader's head, even without a literal `!`.

> this is not forced, and is only a suggestion.
> In more complex expressions we may want to show comparison cases around a specific var for example. This suggestion is about what the _default_.

### Acronym Capitalization
An acronym inside a camel-cased identifier is capitalized as a regular word.

**wrong**: `VSRState`, `parseHTTPURL`

**right**: `VsrState`, `parseHttpUrl`

**reason**: word boundaries stay visible (`VSRState` reads as `VSR State` or `VS RState`), and conversion to snake case is mechanical: `VsrState` → `vsr_state`.

### Wrapper Field
The main wrapped field of a newtype-ish struct.

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
Invalid input from a user: cli args, config, requests, forms.

**wrong**: panic, assert or unwrap on it.

**right**: return an error that names the offending value and what was expected. A long-running process rejects that input and keeps serving.

**reason**: a panic signals a bug in our code. Malformed user input is an expected state, not a bug.
