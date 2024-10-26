{ nixosConfig, ... }:
{
  services = {
    blueman-applet.enable = true;
  };
}
