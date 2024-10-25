{ nixosConfig, ... }:
let
  #| Variables
  config = nixosConfig.home-manager.users.craole;

  prefs = {
    modifier = "SUPER";
    browser = {
      primary = "brave";
      secondary = "firefox";
    };
    terminal = {
      primary = "footclient";
      secondary = "kitty";
    };
    editor = {
      primary = "hx";
      secondary = "zeditor";
    };
    visual = {
      primary = "code";
      secondary = "zeditor";
    };
  };

  #| Modules
  services = import ./services { inherit nixosConfig config prefs; };
  programs = import ./programs { inherit config prefs; };
in
# packages = import ../../packages;
{
  imports = [
    services
    programs

    ../../packages/freetube
    ../../packages/helix
  ];
}
