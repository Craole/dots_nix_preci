{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ferdium
    # whatsapp-for-linux
    skypeforlinux
    zoom-us
  ];
}
