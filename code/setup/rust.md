You don't need to install rustup or mold separately, as all our repos manage their own env with [nix-flakes](./nix.md).

The same devShell sets [kache](https://github.com/kunobi-ninja/kache) as `rustc-wrapper`, so builds are shared across all projects and worktrees on your device (store in `~/.cache/kache`).

Install kache globally: `nix profile install github:valeratrades/v_flakes#kache`, and upgrade it with `nix profile upgrade kache` when v_flakes bumps it. One daemon serves every build on the machine, and the devShells use the kache on your PATH, so there is one version for all of them. Without a global install, each repo's devShell brings the kache its v_flakes lock pins. Repos on different locks then run different versions against the same daemon, which fails requests and holds its index locked.

To also cache cargo runs outside our devShells, add to `~/.cargo/config.toml`:
```toml
[build]
rustc-wrapper = "kache"
```

Check that the daemon runs: `kache daemon` must show `Daemon running`. Without it, kache still caches, but every rustc runs the whole engine on its own: a cache hit then costs ~0.4–2 s instead of ~0.1 s. Reasons are in `~/.cache/kache/daemon.log`.

The store gains from a filesystem with reflinks (XFS, btrfs): hits restore without copying. To move it there, set `local_store` in `~/.config/kache/config.toml`. If you move it with a symlink at `~/.cache/kache` instead, also set `runtime_dir` to the real directory: the daemon refuses to bind its socket in a symlinked directory and never starts.
```toml
[cache]
runtime_dir = "/home/<you>/s/.kache" # where ~/.cache/kache points
```
