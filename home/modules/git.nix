{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "abzal";
        email = "saparabzal06@gmail.com"; # change this
      };
      init.defaultBranch = "main";
      pull.rebase        = true;
    };
  };
}
