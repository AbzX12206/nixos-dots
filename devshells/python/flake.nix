{
  description = "Python devShell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs   = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        name = "python";

        packages = with pkgs; [
          python313
          python313Packages.pip
          python313Packages.virtualenv
          python313Packages.ipython
          uv      # fast venv + package manager
          ruff    # linter + formatter
          pyright # LSP
        ];

        shellHook = ''
          echo "Python $(python --version) devShell"
          if [ ! -d .venv ]; then
            uv venv .venv
          fi
          # fish uses activate.fish; bash/zsh use activate
          if [ -n "$FISH_VERSION" ]; then
            source .venv/bin/activate.fish
          else
            source .venv/bin/activate
          fi
        '';
      };
    };
}
