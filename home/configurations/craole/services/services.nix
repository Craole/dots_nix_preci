{ nixosConfig, ... }:
let
  inherit (nixosConfig.location) latitude longitude;
in
{
  services = {
    blueman-applet.enable = true;
    darkman = {
      enable = true;
      settings = {
        lat = latitude;
        lon = longitude;
      };
    };
  };
}
