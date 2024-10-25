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

  #| Moduules
  home = import ./home.nix { inherit nixosConfig prefs; };
  gui = import ./gui.nix;
  tty = import ./tty.nix { inherit config prefs; };
  hyprland = import ./hyprland.nix { inherit config prefs; };
in
{
  imports = [
    home
    gui
    tty
  ];
}
