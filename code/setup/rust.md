You don't need to install rustup or mold separately, as all our repos manage their own env with [nix-flakes](./nix.md).

The same devShell sets [kache](https://github.com/kunobi-ninja/kache) as `rustc-wrapper`, so dep builds are shared across all projects and worktrees on your device (store in `~/.cache/kache`). Nothing to set up.

To also cache cargo runs outside our devShells, install the same build globally (`nix profile install github:valeratrades/v_flakes#kache`) and add to `~/.cargo/config.toml`:
```toml
[build]
rustc-wrapper = "kache"
```
