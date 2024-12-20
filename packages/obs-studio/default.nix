{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-vaapi
      obs-nvfbc
      obs-teleport
      obs-hyperion
      droidcam-obs
      obs-vkcapture
      obs-gstreamer
      obs-3d-effect
      input-overlay
      obs-multi-rtmp
      obs-source-clone
      obs-shaderfilter
      obs-source-record
      obs-livesplit-one
      looking-glass-obs
      obs-vintage-filter
      obs-command-source
      obs-move-transition
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };
}
