{
  imports = [
    ./alias.nix
    ./attribute.nix
    # ./credentials.nix
    ./settings.nix
    ./hook.nix
    ./ignore.nix
    ./include.nix

    ./diff.nix
    ./gh.nix
    ./gitui.nix
  ];

  programs.git = {
    enable = true;
    # lfs.enable = true;
  };
}
