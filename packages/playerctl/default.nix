{ pkgs, ... }:
{
  home.packages = [ pkgs.playerctl ]; # TODO: This shouldn't be needed
  services.playerctld.enable = true;
}
