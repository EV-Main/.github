{
  inputs = {
    v_flakes.url = "github:valeratrades/v_flakes?ref=v1.6";
  };

  outputs =
    { self, v_flakes }:
    let
      inherit (v_flakes) flake-utils;
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import v_flakes.default_nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          shellHook = ''
            cp -f ${(v_flakes.files.gitattributes { inherit pkgs; lfs = true; })} ./.gitattributes
            cp -f ${(v_flakes.files.gitignore { inherit pkgs; langs = []; })} ./.gitignore
          '';
        };
      }
    );
}
