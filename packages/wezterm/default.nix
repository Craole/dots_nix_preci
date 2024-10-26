{
  imports = [
    ./settings.nix
    # ./bar.nix

    # ./theme.nix
    # TODO: The config breaks when I try to modularize
  ];

  programs.wezterm.enable = true;
}
