{ pkgs, ... }:

{
  programs.eza = {
    enable               = true;
    icons                = true;  # bool — "auto" is not a valid type here
    git                  = true;
    enableFishIntegration = false; # aliases are defined manually in shell.nix
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "base16";
      pager = "less -FR";
    };
  };

  programs.zoxide = {
    enable                = true;
    enableFishIntegration = true;
  };

  programs.yazi = {
    enable                = true;
    enableFishIntegration = true;
  };
}
