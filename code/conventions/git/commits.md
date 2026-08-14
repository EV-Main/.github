# Git Commit Convention

> Standard v2.1.0

---

## Format

```
type(scope)!: description

[optional body]

[optional footer]
```

- `type` — required, lowercase, from the table below
- `scope` — optional, area of change: `feat(auth):`, `fix(ws):`
- `!` — marks a breaking change (see _Breaking changes_)

> if a commit contains multiple unrelated changes, you can join them over `&&` in the message.
> It's advised to make a commit per semantic change, but we admit that in reality it's oftentimes too cumbersome to split them, hence this hack.

---

## Types

| Type       | Description                        | Version |
| ---------- | ---------------------------------- | ------- |
| `feat`     | New functionality                  | MINOR   |
| `fix`      | Bug fix                            | PATCH   |
| `perf`     | Performance improvement            | PATCH   |
| `refactor` | Code change, no behavior change    | —       |
| `revert`   | Revert a previous commit           | PATCH   |
| `docs`     | Documentation only                 | —       |
| `style`    | Formatting, linting, whitespace    | —       |
| `test`     | Add or update tests                | —       |
| `build`    | Build system, dependencies         | —       |
| `ci`       | CI/CD config                       | —       |
| `chore`    | Routine maintenance, init, configs | —       |

---

## Breaking changes → MAJOR

A breaking change is still a `feat` or `fix`, not a separate type. Mark it one of two ways:

```bash
# 1. bang after type/scope — for short cases
feat!: switch API response to camelCase

# 2. footer — preferred when it needs explanation
feat: switch API response to camelCase

BREAKING CHANGE: all client fields renamed snake_case -> camelCase
```

Either form bumps **MAJOR** and is detected by changelog tooling.

---

## Semantic Versioning

Version format: **`MAJOR.MINOR.PATCH`**

| Bump  | Trigger                                                     |
| ----- | ----------------------------------------------------------- |
| MAJOR | any `!` or `BREAKING CHANGE:` footer                        |
| MINOR | `feat`                                                      |
| PATCH | `fix`, `perf`, `revert`                                     |
| none  | `refactor`, `docs`, `style`, `test`, `build`, `ci`, `chore` |

> None of this applies under v1.0.0 version, - development until that point is considered to be in alpha stage, and worrying about breaking anything is unnecessary; at most warranting a minor version bump.

---

## Release tag

Tag format: `v{major}.{minor}.{patch}`. No dedicated release commit required.

---

## Description rules

- Imperative mood: _add_, _fix_, _remove_, _update_
- ≤ 72 characters, no trailing period
- Extra context → blank line, then body:

---

### Edge-cases

- If the fix is trivial (e.g. typo), it is allowed to use `_` for description.
- When parsing commit history, it should be possible to have intuition about significance of changes from commit length alone.
- Similarly, tag also can be omitted, if changes are not important, or are outside of the framework.

> therefore, when fixing a typo, as little as the following commit message is valid: `_`
