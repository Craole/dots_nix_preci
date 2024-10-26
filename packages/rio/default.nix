{
  imports = [
    ./settings.nix
    # ./theme.nix
  ];
  programs.rio.enable = true;
  home.shellAliases.rerio = "rm -rf $HOME/.config/rio; dots --home; rio";
  # };
}
