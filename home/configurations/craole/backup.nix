{ nixosConfig, pkgs, ... }:
let
  editor = "hx";
  config = nixosConfig.home-manager.users.craole;
in
{
  home = {
    inherit (nixosConfig.system) stateVersion;
    packages = with pkgs; [ ];
    sessionVariables = {
      EDITOR = editor;
    };
  };
  programs = {
    git = {
      enable = true;
      userName = "Craole";
      userEmail = "32288735+Craole@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
        core = {
          inherit editor;
        };
        credentials.helper = "cache --timeout=3600";
      };
    };
    eza = {
      enable = true;
      icons = true;
      git = true;
      # enableFishIntegration = config.programs.fish.enable;
      # enableZshIntegration = config.programs.zsh.enable;
      extraOptions = [
        "--group-directories-first"
      ];
    };
    starship = {
      enable = true;
    };
    direnv = {
      enable = true;
      silent = true;
    };
    firefox = {
      enable = true;
    };
  };
}
