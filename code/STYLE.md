Set of convensions upkeep across all repos and languages in this organization.

> **NB:** some will be enforced programmatically (through [v_flakes](https://github.com/valeratrades/v_flakes) and [codestyle](https://github.com/valeratrades/codestyle)), and thus not even mentioned here.

Every statement must be the source of truth for how it is done across the entire organization. If it's not ubiquitous, - it's doesn't warrant adding.
In cases where you wish to enforce situational conventions, - pin them in `docs/ARCHITECTURE.md` or `docs/spec/`[^1] of the project directly.
[^1]: https://github.com/bearcove/tracey

> In absence of a stated convention, assume language defaults.

# Style
## Architectural
### [Run at Your Own Pace](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/TIGER_STYLE.md#safety)
Work triggered by external events: exchange feeds, requests, file watchers.

**wrong**:
```rust
while let Some(msg) = feed.next().await {
    book.apply(msg);
    strategy.recompute(&book);
}
```

**right**:
```rust
//LOOP: runs for the process lifetime
loop {
    tick.tick().await;
    for msg in feed.drain() {
        book.apply(msg);
    }
    strategy.recompute(&book);
}
```

**reason**: control flow stays ours instead of the event source's. Work is batched instead of context-switching on every event, and a bound on work per time period is easy to keep.

### Never Fail on User Input
Invalid input from a user: cli args, config, requests, forms.

**wrong**: panic, assert or unwrap on it.

**right**: return an error that names the offending value and what was expected. A long-running process rejects that input and keeps serving.

**reason**: a panic signals a bug in our code. Malformed user input is an expected state, not a bug.

### [Signature Dimensionality](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/TIGER_STYLE.md#cache-invalidation)
Function signatures and return types.

Every outcome a signature can return is a branch each caller has to handle, and that dimensionality is viral, propagating up the call chain. As a return type, `()` beats `bool`, `bool` beats `u64`, `u64` beats `Option<u64>`, and `Option<u64>` beats `Result<u64>`.

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

### [Centralize State](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/TIGER_STYLE.md#safety)
State changes made by a function and its helpers.

The parent keeps all relevant state in local variables and is the only place that changes it. Helpers compute what needs to change rather than applying the change; leaves are pure.

There is no length limit on the parent. Its helpers are best nested right inside it, and not necessarily as functions: every function adds a boundary (its signature), which a small op seldom earns. A plain block scope keeps access to the parent's types and variables; it doesn't mutate, it returns a value.

**wrong**:
```rust
fn rebalance(&mut self, prices: &Prices) {
    self.apply_drift(prices);
    self.close_dust();
}

fn apply_drift(&mut self, prices: &Prices) {
    // writes self.positions
}

fn close_dust(&mut self) {
    // writes self.positions
}
```

**right**:
```rust
fn rebalance(&mut self, prices: &Prices) {
    let drift: Vec<(Symbol, Qty)> = {
        // reads self.positions, prices
    };
    let dust: Vec<Symbol> = {
        // reads self.positions, drift
    };
    for (symbol, qty) in drift {
        self.positions.adjust(symbol, qty);
    }
    for symbol in dust {
        self.positions.close(symbol);
    }
}
```

**reason**: every change to the state is visible in one place, in the order it happens, and no helper steps on another's writes.

## [Performance](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/TIGER_STYLE.md#performance)
- Think about performance from the outset. The best time to solve performance, to get the huge 1000x wins, is in the design phase, which is precisely when we can't measure or profile.
- Perform back-of-the-envelope sketches with respect to the four resources (network, disk, memory, CPU) and their two main characteristics (bandwidth, latency). Sketches are cheap; use them to be roughly right.
- Optimize for the slowest resources first (network, disk, memory, CPU, in that order), after compensating for frequency of use. A memory cache miss may cost as much as a disk fsync, if it happens many times more.
- Separate the control plane from the data plane. Batching across that line allows heavy assertions on the control plane without losing performance.
- Amortize network, disk, memory and CPU costs by batching accesses.
- Let the CPU be a sprinter doing the 100m: predictable, with large enough chunks of work. This comes back to batching.
- Be explicit; minimize dependence on the compiler to do the right thing. In particular, extract hot loops into standalone functions with primitive arguments and no `self`: the compiler doesn't have to prove it can cache struct fields in registers, and a reader spots redundant computation more easily.

## [Naming](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/TIGER_STYLE.md#naming-things)
- Get the nouns and verbs just right. A great name captures what a thing is or does and gives a crisp mental model. Find nouns and verbs that work together, so the whole is greater than the sum of its parts.
- Don't abbreviate, unless the abbreviation is a fixed term of the domain (`tf` for timeframe) or listed in a glossary ([general](./conventions/GLOSSARY.md), [EV](../docs/GLOSSARY.md)). Use long-form flags in scripts: `--force`, not `-f`. Single-letter flags are for interactive use.
- Add units and qualifiers to names: `latency_ms`, not `latency`. Index, count and size are [distinct kinds of number](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/TIGER_STYLE.md#off-by-one-errors), even when they share a type: index to count adds one, count to size multiplies by the unit.
- Infuse names with meaning. `allocator: Allocator` is fine, but `gpa: Allocator` and `arena: Allocator` tell the reader whether memory has to be freed explicitly.
- Give related names the same length: `source` and `target` over `src` and `dest`, so that `source_offset` and `target_offset` line up in calculations.
- A helper or callback called from a single function is prefixed with its caller's name: `read_sector()` and `read_sector_callback()`. Callbacks go last in the parameter list, mirroring control flow.
- Name an argument that can be `None` so that a bare `None` at the call site reads clearly.
- A file is read top-down: important things go first, `main` first of all.
- Don't overload a name with context-dependent meanings. TigerBeetle first called its pending transfers "two-phase commit transfers", which collided with two-phase commit in its consensus protocol.
- Prefer nouns over adjectives and participles: `pipeline` can head a doc section or a conversation as is, `preparing` has to be rephrased first.

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

## [Testing](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/TIGER_STYLE.md#safety)
- [Pair assertions](https://tigerbeetle.com/blog/2023-12-27-it-takes-two-to-contract). For every property you enforce, find at least two code paths to assert it on. Eg assert validity of data right before writing it to disk, and again right after reading it back.
- Assert the positive space you expect, and the negative space you don't: where data crosses between valid and invalid is where the interesting bugs are. Tests likewise feed not only valid data, but invalid data, and data as it becomes invalid.
- Assert relationships of compile-time constants (Rust: `const _: () = assert!(A % B == 0);`), as a sanity check and to document [subtle invariants](https://github.com/tigerbeetle/tigerbeetle/blob/db789acfb93584e5cb9f331f9d6092ef90b53ea6/src/vsr/journal.zig#L45-L47). These check the design before the program even runs.
- On occasion, a blatantly true assertion beats a comment, as stronger documentation where the condition is critical and surprising.

## Other
### [No Implicit Defaults](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/TIGER_STYLE.md#safety)
Defaults, on both sides of a call.

- providing: a default exists only where one semantically does. Never add one because it's easier; failing beats inventing a value.
- consuming: pass options to library calls explicitly instead of relying on their defaults. In Rust, write out the fields that matter rather than leaving them to `..Default::default()`.

**reason**: an invented default hides missing or corrupted state behind a plausible value. A library's default can change in an update, silently changing every call site that relied on it.

### [Variable Scope](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/TIGER_STYLE.md#cache-invalidation)
Where variables live, and for how long.

- declare at the smallest possible scope, and keep the number of variables in scope minimal
- compute or check a variable right where it's used, not earlier: the gap between place-of-check and place-of-use is where bugs live
- don't duplicate or alias variables: copies drift out of sync
- what was checked before an `.await` is not assumed after it

**reason**: most bugs come down to a semantic gap in time or space. Fewer variables in play leave fewer to misuse.

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
