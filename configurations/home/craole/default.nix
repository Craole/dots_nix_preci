{ nixosConfig, ... }:
let
  #| Variables
  config = nixosConfig.home-manager.users.craole;
  stateVersion = nixosConfig.system.stateVersion;

  #| Modules
  packages = import ../../packages;
in
{
  home = {
    inherit stateVersion;
    inherit (config.DOTS) sessionVariables;
  };
  imports =
    [
      # ./git.nix
      # ./helix.nix
    ]
    ++ (with packages; [
      bat
      eza
      fd
      foot
      gh
      gitui
      git
      helix
      lf
      lsd
      mpv
      nix
      ripgrep
      starship
    ]);
}
