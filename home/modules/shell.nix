{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    plugins = [
      { name = "done"; src = pkgs.fishPlugins.done.src; }
      { name = "fzf";  src = pkgs.fishPlugins.fzf-fish.src; }
    ];

    interactiveShellInit = ''
      set -x EDITOR nvim
      set -x VISUAL nvim
      set -x TERMINAL st
    '';

    shellAliases = {
      ls  = "eza --icons";
      ll  = "eza -lah --icons --git";
      la  = "eza -lAh --icons --git";
      lt  = "eza --tree --icons --level=2";
      cat = "bat";
      vim = "nvim";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
      hm      = "home-manager switch --flake ~/nixos-config#abzal";
      cleanup = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
    };
  };

  programs.starship = {
    enable                = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable                = true;
    enableFishIntegration = true;
  };

  # direnv — writes ~/.config/direnv/direnvrc, fish hook added automatically
  programs.direnv = {
    enable            = true;
    nix-direnv.enable = true;
  };
}
