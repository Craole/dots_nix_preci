{ pkgs, ... }:
{
  home.packages = with pkgs; [
    feh
    flameshot
    imagemagick
    # geeqie
    # viu
  ];
}
