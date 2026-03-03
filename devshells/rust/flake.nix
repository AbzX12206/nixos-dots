{
  description = "Rust devShell";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, rust-overlay }:
    let
      system = "x86_64-linux";
      pkgs   = import nixpkgs {
        inherit system;
        overlays = [ rust-overlay.overlays.default ];
      };
      # stable toolchain with rust-analyzer + clippy + rustfmt included
      rust = pkgs.rust-bin.stable.latest.default.override {
        extensions = [ "rust-src" "rust-analyzer" "clippy" "rustfmt" ];
      };
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        name = "rust";
        packages = with pkgs; [
          rust
          cargo-watch
          cargo-expand
          cargo-edit
          cargo-nextest
          pkg-config
          openssl
        ];
        env.PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
        shellHook = "echo Rust devShell ready;";
      };
    };
}
