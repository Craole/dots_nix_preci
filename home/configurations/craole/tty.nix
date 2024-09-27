{ config, ... }:
let
  apps = config.programs;
  inherit (apps) fish zsh;
in
{
  programs = {
    starship = {
      enable = true;
      enableFishIntegration = fish.enable;
      enableZshIntegration = zsh.enable;
    };
    eza = {
      enable = true;
      icons = true;
      git = true;
      extraOptions = [
        "--group-directories-first"
      ];
      enableFishIntegration = fish.enable;
      enableZshIntegration = zsh.enable;
    };
  };
}
