{ pkgs, ... }:

{
  programs.eza = {
    enable                = true;
    icons                 = "auto";
    git                   = true;
    enableFishIntegration = false;
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
    shellWrapperName      = "y";
  };
}
