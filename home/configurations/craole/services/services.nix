{ nixosConfig, ... }:
let
  inherit (nixosConfig.location) provider latitude longitude;
  inherit (nixosConfig.services.displayManager) sddm;
in
{
  services = {
    blueman-applet.enable = true;
  };
}
