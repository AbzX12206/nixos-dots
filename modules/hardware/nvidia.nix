{ config, ... }:

{
  hardware.graphics = {
    enable      = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable          = true;
    powerManagement.enable      = false;
    powerManagement.finegrained = false;
    open                        = false;
    nvidiaSettings              = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    prime = {
      offload = {
        enable           = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:116:0:0";
      nvidiaBusId  = "PCI:1:0:0";
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
