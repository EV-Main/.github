You don't need to install rustup or mold separately, as all our repos manage their own env with [nix-flakes](./nix.md).

The same devShell sets [kache](https://github.com/kunobi-ninja/kache) as `rustc-wrapper`, so builds are shared across all projects and worktrees on your device (store in `~/.cache/kache`).

Install kache globally: `nix profile install github:valeratrades/v_flakes#kache`, and upgrade it with `nix profile upgrade kache` when v_flakes bumps it. One daemon serves every build on the machine, and the devShells use the kache on your PATH, so there is one version for all of them. Without a global install, each repo's devShell brings the kache its v_flakes lock pins. Repos on different locks then run different versions against the same daemon, which fails requests and holds its index locked.

To also cache cargo runs outside our devShells, add to `~/.cargo/config.toml`:
```toml
[build]
rustc-wrapper = "kache"
```
