{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bc
    fend
    qalculate-gtk
  ];
}
