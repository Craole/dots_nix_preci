{ ... }:
{
  imports = [
    ./settings.nix
    ./extensions.nix
    ./keybindings.nix
    ./tasks.nix
    ./snippets.nix
    ../../helper/dev.nix
  ];
}
