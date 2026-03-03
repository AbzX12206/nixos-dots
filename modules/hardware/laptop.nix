{ ... }:

{
  # TLP — battery/power management, biggest real-world battery life improvement
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC   = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT  = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC  = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      # OLED battery longevity — keep charge between 20–80%
      START_CHARGE_THRESH_BAT0 = 20;
      STOP_CHARGE_THRESH_BAT0  = 80;

      USB_AUTOSUSPEND = 1;
    };
  };

  # power-profiles-daemon conflicts with TLP — must be disabled
  services.power-profiles-daemon.enable = false;

  # Battery info provider — needed for slstatus battery component
  services.upower.enable = true;

  # Backlight control without sudo (adds user to video group automatically)
  programs.light.enable = true;

  # Thermal management — prevents throttling on AMD+NVIDIA hybrid
  services.thermald.enable = true;

  # Wipe /tmp on every boot
  boot.tmp.cleanOnBoot = true;
}
