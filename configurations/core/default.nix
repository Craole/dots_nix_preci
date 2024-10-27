{ config, modulesPath, ... }:
let
  current = "preci";
in
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./preci
    ./victus
  ];

  config.DOTS.Systems.${current}.enable = true;
}
