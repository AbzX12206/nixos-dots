{
  description = "Go devShell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs   = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        name = "go";

        packages = with pkgs; [
          go
          gopls         # LSP
          gotools       # goimports, godoc, etc.
          go-tools      # staticcheck
          golangci-lint # meta linter
          delve         # debugger
          air           # live reload
        ];

        shellHook = ''
          echo "$(go version) devShell"
          # Local GOPATH — avoids polluting ~/go
          export GOPATH="$PWD/.gopath"
          export PATH="$GOPATH/bin:$PATH"
        '';
      };
    };
}
