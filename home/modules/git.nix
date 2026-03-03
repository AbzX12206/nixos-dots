{ ... }:

{
  programs.git = {
    enable = true;
    userName  = "abzal";
    userEmail = "saparabzal06@gmail.com"; # change this
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
