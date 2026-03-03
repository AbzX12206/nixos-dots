{ pkgs, ... }:

{
  users.users.abzal = {
    isNormalUser = true;
    description = "abzal";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "vboxusers"
    ];
    shell = pkgs.fish;
  };
}
