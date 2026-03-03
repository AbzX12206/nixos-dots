{ pkgs, ... }:

{
  # direnv — runs .envrc automatically on cd
  programs.direnv = {
    enable            = true;
    nix-direnv.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnumake
    pkg-config

    # Nix dev helpers
    nix-init  # scaffold new nix packages
    nix-tree  # visualise dependency tree
    nixd      # Nix language server
    nil       # alternative Nix LSP
  ];
}
