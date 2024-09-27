{ config, ... }:
let
  inherit (config.programs) fish zsh;
in
{
  programs.eza = {
    enable = true;
    icons = true;
    git = true;
    extraOptions = [
      "--group-directories-first"
    ];
    enableFishIntegration = fish.enable;
    enableZshIntegration = zsh.enable;
  };
}
