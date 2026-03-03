{
  description = "Node.js devShell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs   = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        name = "node";

        packages = with pkgs; [
          nodejs_22
          pnpm                                    # top-level since nixpkgs 24.05
          nodePackages.typescript
          nodePackages.typescript-language-server
          prettier                                # top-level since nixpkgs 24.05
          eslint_d
        ];

        shellHook = ''
          echo "Node $(node --version) devShell"
        '';
      };
    };
}
