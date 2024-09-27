{ pkgs, ... }:
{
  home = {
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
  };
}
