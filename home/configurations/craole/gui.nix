{ editor, ... }:
{
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
    firefox = {
      enable = true;
    };
  };
}
