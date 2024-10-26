{ config, ... }:
let
  current = preci;
in
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./preci
    ./victus
  ];

  config = config.DOTS.Systems.${current};
}
