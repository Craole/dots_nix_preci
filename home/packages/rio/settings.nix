_: {
  programs.rio.settings = {
    window = {
      mode = "Maximized";
      background-opacity = 0.75;
      decorations = "Disabled";
      # blur = true;
      # width = 1920;
      # height = 1080;
      # foreground-opacity = 1.0;
    };
    cursor = "▇";
    # blinking-cursor = false;
    # editor = "hx";
    # hide-cursor-when-typing = false;
    # working-dir = starting_dir; # This is not working
    working-dir = "~/Documents/Dotfiles"; # This is not working
    # working-dir = "$FLAKE"; # This is not working
    fonts = {
      size = 24;
    };
    # navigation = {
    #   mode = "CollapsedTab";
    #   clickable = false;
    #   use-current-path = false;
    #   color-automation = [
    #     {
    #       program = "hx";
    #       color = "#FFFF00";
    #     }
    #     {
    #       path = flakeDir;
    #       color = "#0E91B7";
    #     }
    #   ];
    # };
    # renderer = {
    #   performance = "High";
    #   backend = "Automatic";
    #   disable-renderer-when-unfocused = true;
    # };
    # scroll = {
    #   multiplier = 3.0;
    #   divider = 1.0;
    # };
  };
}
