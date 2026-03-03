{ ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width         = 300;
        height        = 100;
        origin        = "top-right";
        offset        = "10x30";
        font          = "JetBrainsMono Nerd Font 10";
        corner_radius = 0;
        frame_width   = 1;
        frame_color   = "#444444";
        timeout       = 5;
      };

      # background/foreground moved to urgency sections in dunst 1.9+
      urgency_low = {
        background = "#1a1a1a";
        foreground = "#d4d4d4";
      };

      urgency_normal = {
        background = "#1a1a1a";
        foreground = "#d4d4d4";
      };

      urgency_critical = {
        background  = "#cc6666";
        foreground  = "#ffffff";
        frame_color = "#cc6666";
        timeout     = 0; # critical notifications don't auto-dismiss
      };
    };
  };
}
