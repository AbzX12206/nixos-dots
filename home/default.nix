{ ... }:

{
  imports = [
    ./modules/xsession.nix
    ./modules/shell.nix
    ./modules/cli.nix
    ./modules/dunst.nix
    ./modules/git.nix
    ./modules/gtk.nix
    ./modules/gammastep.nix
    ./modules/neovim.nix
  ];

  home.username      = "abzal";
  home.homeDirectory = "/home/abzal";

  home.stateVersion = "25.11"; # tracks first install, not the channel

  programs.home-manager.enable = true;
}
