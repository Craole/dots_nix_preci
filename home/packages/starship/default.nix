{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    # enableFishIntegration = config.programs.fish.enable;
    # enableZshIntegration = config.programs.zsh.enable;
  };
}
