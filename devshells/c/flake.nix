{
  description = "C/C++ devShell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs   = nixpkgs.legacyPackages.${system};
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        name = "c";
        packages = with pkgs; [
          gcc
          clang
          clang-tools
          cmake
          ninja
          pkg-config
          gdb
          valgrind
          bear
          include-what-you-use
        ];
        shellHook = "echo C/C++ devShell ready;";
      };
    };
}
