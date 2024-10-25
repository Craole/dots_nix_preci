{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #| Sound
    pa_applet
    pamixer
    pavucontrol

    #| Wallpaper
    variety

    cbatticon
    brightnessctl
    betterlockscreen
    # ddcutil
    # udiskie
    volumeicon
    # copyq
  ];
  programs.home-manager.enable = true;
}
# TODO: Put these in stacks that need it
