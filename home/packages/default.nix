{
  pkgs ? import <nixpkgs> { },
}:

let
  packages = builtins.attrValues (
    builtins.mapAttrs (name: path: import (path + "/default.nix")) (
      builtins.attrNames (builtins.readDir ./packages)
    )
  );
in
{
  inherit (pkgs) stdenv;
  inherit (packages) git eza;
}
