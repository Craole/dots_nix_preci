{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cmus
    freetube
    shortwave
    # netflix
    mousai
    mellowplayer
    songrec
    termusic
    curseradio
    subdl
  ];

  services = {
    playerctld.enable = true;
  };
}
