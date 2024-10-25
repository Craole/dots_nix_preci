{ pkgs, ... }:
{
  imports = [
    ./common

    ./helper/codeium.nix
    # ./helper/docker
    # ./helper/trunk

    ./languages/nix
    ./languages/shellscript

    # TODO: Allow this to be triggered from an option
    # ./languages/rust
    # ./languages/ruby
    # ./languages/python
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium-fhs;
  };
}
