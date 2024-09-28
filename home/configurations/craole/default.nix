{ nixosConfig, ... }:
let
  #| Variables
  config = nixosConfig.home-manager.users.craole;
  editor = "hx";

  #| Moduules
  home = import ./home.nix { inherit nixosConfig editor; };
  gui = import ./gui.nix { inherit editor; };
  tty = import ./tty.nix { inherit config; };
in
{
  imports = [
    home
    gui
    tty
  ];
}
