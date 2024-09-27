{ nixosConfig,pkgs,... }:
{
  home = {
    inherit (nixosConfig.system)stateVersion;
    packages = with pkgs; [ ];
    sessionVariables = {
      EDITOR = "hx";
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
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      ohMyZsh = {
        enable = true;
        theme = "powerlevel10k/powerlevel10k";
        plugins = [
          "git"
          "git-prompt"
          "zsh-autosuggestions"
          "zsh-syntax-highlighting"
        ];
      };
      history = {
        path = "$HOME/.zsh_history";
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
        export EDITOR="hx"
        export PAGER="less"
        export LESS="-R"
      '';
    };
  };
}
