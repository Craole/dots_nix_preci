{
  prefs,
  config,
  ...
}:
let
  gui = import ./gui.nix;
  tty = import ./tty.nix { inherit config prefs; };
in
{
  imports = [
    gui
    tty
  ];
}
