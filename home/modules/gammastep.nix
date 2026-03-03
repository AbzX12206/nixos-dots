{ ... }:

{
  # Blue light reduction — Aktau, KZ (43.65 N, 51.17 E)
  # Shifts from 6500 K (day) to 3500 K (night) with a smooth fade
  services.gammastep = {
    enable    = true;
    tray      = false; # no system tray in dwm — set true if you add trayer/stalonetray
    latitude  = "43.65";
    longitude = "51.17";

    temperature = {
      day   = 6500;
      night = 3500;
    };

    settings.general = {
      fade              = 1;
      adjustment-method = "randr";
    };
  };
}
