{ ... }:

{
  # Enable fish system-wide so it is a valid login shell
  programs.fish.enable = true;

  # fzf binary needed system-wide for the fish plugin
  # starship and fish plugins are managed in home/modules/shell.nix
}
