{
  programs = {
    firefox = {
      enable = true;
    };
    mpv = {
      enable = true;
    };
    foot = {
      enable = true;
      server.enable = true;
    };
    kitty = {
      enable = true;
    };
    freetube = {
      enable = true;
      settings = {
        allowDashAv1Formats = true;
        checkForUpdates = false;
        defaultQuality = "1080";
        baseTheme = "catppuccinMocha";
        theme = "dark";
        player = "mpv";
      };
    };
  };
}
