{ config, ... }:
let
  apps = config.programs;
  inherit (apps) fish zsh;
in
{
  programs = {
  bash = {
    enable = true;
    enableCompletion = true;
    historyControl = [ "erasedups" "ignorespace" ];
    historyFileSize = 10000;
  };
    starship = {
      enable = true;
      enableFishIntegration = fish.enable;
      enableZshIntegration = zsh.enable;
    };
    lsd = {
      enable = true;
      enableAliases = true;
      settings = { };
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
