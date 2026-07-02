We standardize on [Determinate Nix](https://determinate.systems/nix/) — it's the only supported distribution. It is preferred for speed (`lazy-trees = true`) and stability, and some repos rely on lazy trees to the point they will outright refuse to compile on upstream Nix.

For flake integration, all repos in this organization rely on [v_flakes](https://github.com/valeratrades/v_flakes)[^1] Eg:
[^1]
for more information, read docs there.

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/da5ad661ba4e5ef59ba743f0d112cbc30e474f32";
    flake-utils.url = "github:numtide/flake-utils/11707dc2f618dd54ca8739b309ec4fc024de578b";
    v_flakes.url = "github:valeratrades/v_flakes/6062f652effc94be053865d58ff03c697c31ecb6";
  };

  outputs = { self, nixpkgs, flake-utils, v_flakes }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          shellHook = ''
            cp -f ${(v_flakes.files.gitattributes { inherit pkgs; lfs = false; })} ./.gitattributes
            cp -f ${(v_flakes.files.gitignore { inherit pkgs; langs = []; })} ./.gitignore
          '';
        };
      });
}
```

---

`.envrc` is considered part of the shared repo setup, and thus committed. Eg:

```envrc
# Only activate the flake devShell at the repo root, not in subdirectories.
if [ "$PWD" = "$(expand_path .)" ]; then
  flake . --no-pure-eval
fi
```

---

to load dependencies and environment brought in by flakes, you run `nix develop`.
To have this be done automatically, configure [direnv](https://github.com/direnv/direnv) globally.
Here and henceforth we assume you manage environment through direnv.

Note also that:
- nix will not recognize files that are not synchronized with git.
- changes to generated files require removing `.direnv/` before reloading.

it is thus recommended to make following global aliases in your shell config:
```sh
alias dira="git add -A && direnv allow"
alias dirr="rm -r .direnv; dira"
```
