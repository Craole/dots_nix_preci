{
  imports = [
    ./alias.nix
    ./attribute.nix
    ./diff.nix
    # ./credentials.nix
    ./hook.nix
    ./ignore.nix
    ./include.nix
    ./settings.nix
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
  };
}
