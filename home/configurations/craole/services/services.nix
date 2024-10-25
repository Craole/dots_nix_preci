{ nixosConfig, ... }:
let
  inherit (nixosConfig.location) provider latitude longitude;
  inherit (nixosConfig.services.displayManager) sddm;
in
{
  services = {
    blueman-applet.enable = true;
    # gammastep = {
    #   enable = sddm.wayland.enable;
    #   settings = {
    #     inherit latitude longitude;
    #   };
    #   tray = true;
    #   temperature = {
    #     night = 3800;
    #     day = 5500;
    #   };
    # };
  };
}
