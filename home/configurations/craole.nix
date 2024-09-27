{ nixosConfig, pkgs, ... }:
let
  editor = "hx";
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
          editor = "$EDITOR";
        };
        credentials.helper = "cache --timeout=3600";
      };
    };
    eza = {
      enable = true;
      icons = true;
      git = true;
      enableFishIntegration = home.fish.enable;
      enableZshIntegration = home.zsh.enable;
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
    };
    starship = {
      enable = true;
    };
    direnv = {
      enable = true;
      silent = true;
    };
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      # ohMyZsh = {
      #   enable = true;
      #   theme = "powerlevel10k/powerlevel10k";
      #   plugins = [
      #     "git"
      #     "git-prompt"
      #     "zsh-autosuggestions"
      #     "zsh-syntax-highlighting"
      #   ];
      # };
      history = {
        size = 10000;
        ignoreDups = true;
        ignoreSpace = true;
      };
      shellAliases = {
        ll = "ls -l";
        la = "ls -a";
        l = "ls -CF";
      };
      initExtra = ''
        export EDITOR=${editor}
        export PAGER="less"
        export LESS="-R"
      '';
    };
  };
}
