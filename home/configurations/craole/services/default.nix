{ nixosConfig, prefs, ... }:
let
  home = import ./home.nix { inherit nixosConfig prefs; };
  hyprland = import ./hyprland.nix { inherit prefs; };
  services = import ./services.nix;
in
{
  imports = [
    home
    hyprland
    services
  ];
}
