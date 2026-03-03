{ pkgs, ... }:

{
  boot.loader.systemd-boot = {
    enable             = true;
    configurationLimit = 10; # prevent /boot from filling up over time
  };
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Silent boot
  boot.consoleLogLevel = 0;
  boot.initrd.verbose  = false;
  boot.kernelParams    = [ "quiet" "udev.log_level=3" ];
}
