{
  programs.eza = {
    enable = true;
    extraOptions = [
      "--almost-all"
      "--group-directories-first"
      # "--time-style relative"
      "--hyperlink"
    ];
    icons = true;
    git = true;
    # enableFishIntegration = fish.enable;
    # enableZshIntegration = zsh.enable;
  };
}
